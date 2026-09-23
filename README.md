# Quiz

This repo is used to generate quizzes for CMC's computer science and data science courses.

The structure is:
- scripts/* contains scripts for generating quizzes.
- every other folder contains a "category" of quizzes.

Inside each "category" folder is a series of topic* and quiz* folders.

1. The topic* folders are notes packets that provide a large number of sample problems and notes that explain the material that students are expected to learn.
    In general, the problems are a "session" of a programming language like python/shell,
    and students need to be able to read and understand the code in order to correctly predict what the output of the final command is.
    (Whenever reasonable, only the final command has output---but sometimes error messages or other incidental output exists in intermediate commands.)
    Some quizzes also have minor variations on this theme like predicting error messages.

1. The quiz* folders are the actual quizzes that the students take based on the corresponding topic* folder.

A unique property of these notes/quizzes is that all problems are run through LLMs when generating the final pdf.
The LLM output is compared against ground truth output and the LLM is graded on how well it does.
This provides an indication about how well the LLM understands the syntax/concepts being taught in the pdf,
and some basic summary stats help students understand which concepts are relatively harder and what the SOTA for LLM coding performance is.
