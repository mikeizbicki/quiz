# Quiz generation principles

This directory generates HTML/PDF quizzes in which the student must
predict the exact output of a short script. These rules apply to every
`topic*/` notes packet and every `quiz*/` derived from it.

## Point structure

Every problem produces exactly two lines of output (either two `print`
statements in the `try` block, or one `print` in `try` plus one in an
`except` clause) and is worth two points, one point per line. Say so
once, in the first content file of each topic's notes packet (the
`0000.raw` file for that topic).

## Correctness pattern within each subsection

Within each subsection of the notes, the **first problem** is a
**correct** reference implementation of the code under study.

The **remaining problems** in that subsection contain a subtle bug or
variation so that a student who does not trace the code gets the wrong
answer. In particular, each printed line should diverge from the answer
produced by at least one of:

- the corresponding built-in mental model (`range`, `list`, `sorted`),
  and
- pattern-matching on the shape of adjacent problems (e.g. every
  prior problem printed `n = 5`; do not use `5` as the answer again).

Choose inputs that make the divergence visible: boundary cases
(empty ranges, off-lattice `__contains__`, negative indexing,
out-of-bounds, duplicate values inserted into a BST), lengths that do
not divide evenly (e.g. `Range(0, 100, 7)`), and data shapes that
change between problems so pattern-matching fails.

## BST `__getitem__`

Never ask a `t[i]` question through `inorder`: the answer is
`sorted(values)[i]` and is guessable without reading the code. Use
`preorder`, `postorder`, or insert orders that produce skewed trees.
Note that `postorder[0]` always equals `sorted()[0]` for a BST (both
are the minimum), so avoid indexing position 0 in that traversal too.

## Outputs

`*.raw` files are LaTeX notes. `*.sh` files are quiz problems whose
runtime output is captured into `.outputs/` by `scripts/generate_pdf.py`.
Do not commit `.outputs/`; regenerate them after editing a `*.sh`.
When adding a new problem, pick a filename in the same `0XYZ` /
`0XYZ-z00NN` family used by the surrounding topic.
