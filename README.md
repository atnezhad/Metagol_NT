# Metagol_NT
Metagol_NT is a noise tolerant version of [Metagol](https://github.com/metagol/metagol) as described in the following paper:

S.H. Muggleton, W-Z. Dai, C. Sammut, A. Tamaddoni-Nezhad, J. Wen, and Z-H. Zhou. [Meta-Interpretive Learning from noisy images](https://link.springer.com/article/10.1007/s10994-018-5710-8). Machine Learning, 2018.

Metagol_NT is implemented as a Shell wrapper around Metagol. Metagol_NT finds hypotheses consistent with randomly selected subsets of the training examples and evaluates each resulting hypothesis on the remaining training set, returning the hypothesis with the highest score.

The size of the training samples and the number of iterations (i.e. number of random samples) are user defined parameters. Metagol_NT returns the highest score hypothesis 'H_max' learned from randomly sampled examples from pos_ex_file and neg_ex_file after max_run iterations. The sample size is controlled by 'k_pos' and 'k_neg' which are the number of sampled positive and negative examples respectively, reflecting the noise level in the dataset.

<!--The shell script should be used in the following way: -->
#  Shell script usage
```
./metagol_nt <path_to_bk_file> <path_to_pos_ex_file> <path_to_neg_ex_file> <k_pos> <k_neg> <max_runs>
```
<!--For example, consider learning the grandparent relation given the mother and father relations as described in Metagol readme file. Suppose that the learning examples contain noise:-->

# Example
Consider learning the grandparent relation given the mother and father relations as described in Metagol readme file. Suppose that the learning examples contain noise

Positive Examples:
```prolog
grandparent(ann,amelia).
grandparent(steve,amelia).
grandparent(steve,spongebob).
grandparent(linda,amelia).
grandparent(andy,spongebob). % Noise
```
Negative Examples:consider learning the grandparent relation given the mother and father relations as described in Metagol readme file. Suppose that the learning examples contain noise
```prolog
grandparent(amy,amelia).
grandparent(ann,andy).
grandparent(steve,andy).
grandparent(linda,spongebob).
grandparent(ann,spongebob). % Noise
```
Metagol cannot find any solution given these noisy examples, however, Metagol_NT finds the correct solution using the method described above.

Running Metagol_NT using the following command:
```
$ ./metagol_nt examples/gp/bk.pl examples/gp/pos_ex.pl examples/gp/neg_ex.pl 4 1 2
```

returns the following solution:

```prolog
Hypothesis with highest score:  100
File:  hyp_1
grandparent_1(A,B):-father(A,B).
grandparent_1(A,B):-mother(A,B).
grandparent(A,B):-grandparent_1(A,C),grandparent_1(C,B).
%Acc  Std_Err: 	100	0
```
For any queries please contact: atn@imperial.ac.uk

A Python version of metagol_nt is available from [here](https://github.com/danyvarghese/Metagol_NT)
