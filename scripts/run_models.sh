#!/bin/sh

# NOTE:
# this script does not need to be run directly;
# it is called internally from within the python script.

set -e

quiz="$1"
if ! [ -d "$quiz" ]; then
    echo "must provide a quiz"
    exit 1
fi

outputs="$quiz/.outputs"
mkdir -p "$outputs"
prompt=$(cat "$(dirname "$quiz")/prompt")
prompt_1shot=$(cat "$(dirname "$quiz")/prompt_1shot")
prompt_cot=$(cat "$(dirname "$quiz")/prompt_cot")

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

    # run each of the models on the problem
    for model in $models; do
        outfile_1shot="${output}.1shot.${model}"
        if ! [ -s "$outfile_1shot" ]; then
            printf "$model "
            fullprompt_1shot="$prompt $prompt_1shot $(cat "${problem}")"
            llm "$fullprompt_1shot" -m "$model" > "$outfile_1shot" &
        fi

        if false; then
            outfile_re2="${output}.re2.${model}"
            if ! [ -s "$outfile_re2" ]; then
                fullprompt_re2="$fullprompt_1shot Let's reread the question. $fullprompt_1shot"
                llm "$fullprompt_re2" -m "$model" > "$outfile_re2" &
            fi

            outfile_cot="${output}.cot.${model}"
            if ! [ -s "$outfile_cot" ]; then
                fullprompt_cot="$prompt $prompt_cot $(cat "${problem}")"
                llm "$fullprompt_cot" -m "$model" > "$outfile_cot" &
            fi
        fi
    done
    wait

    if ! [ -f "$output" ]; then
        printf "<<docker>> "
        # evaluate the ground truth
        # NOTE:
        # we run the script in a docker container for security
        # NOTE:
        # sh -x command is nondeterministic in some weird situations;
        # we work around this problem by rerunning the command multiple times,
        # and only proceeding if the output is the same
        while true; do
            gitinit='git config --global user.email "you@example.com"; git config --global user.name "Your Name";'
            # run the ground truth in a docker container for security
            docker run --rm -v "$(pwd)":/project python:3.12 sh -c "$gitinit stdbuf -o0 -e0 sh -x /project/$problem 2>&1" | tac | sed -e '/^+/,$d' | tac > "$tempfile1" &
            docker run --rm -v "$(pwd)":/project python:3.12 sh -c "$gitinit stdbuf -o0 -e0 sh -x /project/$problem 2>&1" | tac | sed -e '/^+/,$d' | tac > "$tempfile2" &
            wait

            if cmp -s "$tempfile1" "$tempfile2"; then
                cp "$tempfile1" "$output"
                break
            fi
            printf '<diff_failed> '
        done
    fi
    echo "done."
done
