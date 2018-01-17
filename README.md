
This directory contains files related to Metagol_NT, a noise tolerant version of Metagol as described in the following paper:

S.H. Muggleton, W-Z. Dai, C. Sammut, A. Tamaddoni-Nezhad, J. Wen, and Z-H. Zhou. Meta-interpretive learning from noisy images. Machine Learning, 2018 (under review)

Metagol_NT is implemented as a Shell wrapper around Metagol. Metagol_NT finds hypotheses consistent with randomly selected subsets of the training examples and evaluates each resulting hypothesis on the remaining training set, returning the hypothesis with the highest score.

The size of the training samples and the number of iterations (i.e. number of random samples) are user defined parameters. Metagol_NT returns the highest score hypothesis H_max learned from randomly sampled examples from pos_ex_file and neg_ex_file after max_run iterations. The sample size is controlled by k_pos and k_neg which are the number of sampled positive and negative examples respectively, reflecting the noise level in the dataset.

The shell script should be used in the following way:
metagol_nt bk_file pos_ex_file neg_ex_file k_pos k_neg max_runs

