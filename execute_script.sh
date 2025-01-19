#!/bin/sh

set -e

quiz="$1"
if ! [ -d "$quiz" ]; then
    echo "must provide a quiz"
    exit 1
fi

outputs="$quiz/.outputs"
mkdir -p "$outputs"
prompt=$(cat "$quiz/prompt")

# temp files will be used for making a nondeterministic call deterministic below
tempfile1=$(mktemp)
tempfile2=$(mktemp)
trap 'rm -f "$tempfile1"' EXIT
trap 'rm -f "$tempfile2"' EXIT

# the llm command with lots of models causes openblas warnings;
# this command disables them
export OPENBLAS_NUM_THREADS=4
export OPENBLAS_VERBOSE=0
export OPENBLAS_WARNING_LEVEL=0
export BLAS_VERBOSE=0

models="
groq-llama3.1-8b
groq-llama3.1-70b
groq-llama-3.3-70b
gpt-4
gpt-4o
gpt-4o-mini
gpt-4-turbo
o1-mini
o1-preview
claude-3-opus-20240229
claude-3-sonnet-20240229
claude-3-haiku-20240307
claude-3-5-sonnet-20241022
claude-3-5-haiku-latest
gemini-2.0-flash-exp
gemini-2.0-flash-thinking-exp-1219
gemini-1.5-flash-8b-001
gemini-1.5-flash-001
gemini-exp-1206
"

for problem in "$quiz"/*.sh; do
    printf "${problem} ... "
    output="$outputs"/"$(basename "$problem")"
    if [ -f "$output" ]; then
        echo "skipping."
    else
        # run each of the models on the problem
        for model in $models; do
            #printf "$model "
            llm "$prompt $(cat "${problem}")" -m "$model" > "${output}.${model}" &
        done
        wait

        # evaluate the ground truth
        # NOTE:
        # we run the script in a docker container for security
        # NOTE:
        # sh -x command is nondeterministic in some weird situations;
        # we work around this problem by rerunning the command multiple times,
        # and only proceeding if the output is the same
        while true; do
            # run the ground truth in a docker container for security
            docker run --rm -v "$(pwd)":/project ubuntu:22.04 sh -c "stdbuf -o0 -e0 sh -x /project/$problem 2>&1" | tac | sed -e '/^+/,$d' | tac > "$tempfile1" &
            docker run --rm -v "$(pwd)":/project ubuntu:22.04 sh -c "stdbuf -o0 -e0 sh -x /project/$problem 2>&1" | tac | sed -e '/^+/,$d' | tac > "$tempfile2" &
            wait

            if cmp -s "$tempfile1" "$tempfile2"; then
                cp "$tempfile1" "$output"
                break
            fi
            printf '<diff_failed> '
        done
        echo "done."
    fi
done
