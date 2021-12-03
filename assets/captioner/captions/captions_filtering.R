## Table captions
## Summary
caption_tab_ssu("ssu_filtering_results", "Summary of Arbitrary, PERfect, and PIME filtering.")
caption_tab_ssu("ssu_filter_sample_data", "Sample summary showing the number of reads and ASVs after Arbitrary, PERfect, and PIME filtering.")

caption_tab_its("its_filtering_results", "Summary of Arbitrary, PERfect, and PIME filtering.")
caption_tab_its("its_filter_sample_data", "Sample summary showing the number of reads and ASVs after Arbitrary, PERfect, and PIME filtering.")

## Arbitrary
caption_tab_ssu("ssu_arbitrary_filt_summary", "Summary of arbitrary filtering where ASVs represented by fewer than 5 reads, present in less than 20% of samples, and/or a variance less than 0.2, were removed.")
caption_tab_ssu("ssu_arbitrary_filt_samples", "Sample summary showing the number of reads and ASVs after Arbitrary filtering.")

caption_tab_its("its_arbitrary_filt_summary", "Summary of arbitrary filtering where ASVs represented by fewer than 5 reads, present in less than 20% of samples, and/or a variance less than 0.2, were removed.")
caption_tab_its("its_arbitrary_filt_samples", "Sample summary showing the number of reads and ASVs after Arbitrary filtering.")

## PERfect
caption_tab_ssu("perfect_asv_checking", "Number of ASVs from PERfect filtering using the default order and decreasing order, each before and after filtering p-values < 0.05.")
caption_tab_ssu("ssu_perfect_filt_summary", "Summary of PERfect filtering using the decreased order and filtering p-values < 0.05.")
caption_tab_its("its_perfect_filt_summary", "Summary of PERfect filtering using the defualt order and filtering p-values < 0.05.")
caption_tab_ssu("ssu_perfect_samp_summary", "Sample summary showing the number of reads and ASVs after PERfect filtering.")
caption_tab_its("its_perfect_samp_summary", "Sample summary showing the number of reads and ASVs after PERfect filtering.")

## PIME
caption_tab_ssu("ssu_pime_filt_top_asvs", "Summary of top 30 ASVs from the chosen prevalence interval.")
caption_tab_ssu("ssu_pime_est_error", "Results of 100 random permutations for each prevalence interval based on a function that randomizes the samples labels into arbitrary groupings. using n random permutations. For each randomized and prevalence filtered data set, the OOB error rate is calculated to estimate whether the original differences in groups of samples occur by chance. ")
caption_tab_ssu("ssu_pime_filt_samples", "Sample summary showing the number of reads and ASVs after PIME filtering.")
caption_tab_ssu("ssu_pime_oob_best_prev", "Out of Bag error (OOB) from random forests for each prevalence interval. The number of taxa and the number of remaining reads for each prevalence interval are shown.")
caption_tab_ssu("ssu_pime_filt_summary", "Comparison of the unfiltered data and PIME filtered data for the chosen prevalence interval.")
caption_tab_ssu("ssu_pime_change_by_year_treat", "Changes in read count and total ASVs during PIME filtering.")


caption_tab_its("its_pime_filt_top_asvs", "Summary of top 30 ASVs from the chosen prevalence interval.")
caption_tab_its("its_pime_est_error", "Results of 100 random permutations for each prevalence interval based on a function that randomizes the samples labels into arbitrary groupings. using n random permutations. For each randomized and prevalence filtered data set, the OOB error rate is calculated to estimate whether the original differences in groups of samples occur by chance. ")
caption_tab_its("its_pime_filt_samples", "Sample summary showing the number of reads and ASVs after PIME filtering.")
caption_tab_its("its_pime_oob_best_prev", "Out of Bag error (OOB) from random forests for each prevalence interval. The number of taxa and the number of remaining reads for each prevalence interval are shown.")
caption_tab_its("its_pime_filt_summary", "Comparison of the unfiltered data and PIME filtered data for the chosen prevalence interval.")
caption_tab_its("its_pime_change_by_year_treat", "Changes in read count and total ASVs during PIME filtering.")

#<small>`r caption_tab_ssu("qual_scores_after_ssu")`</small>

## Figure captions
caption_fig_ssu("ssu_pime_obb_plot", "OOB error rate for the original data set.")
caption_fig_its("its_pime_obb_plot", "OOB error rate for the original data set.")
#caption_fig_ssu("ssu_pime_obb_plot", "OOB error rate for the original data set (top) & the randomized data (bottom).")
#caption_fig_its("its_pime_obb_plot", "OOB error rate for the original data set (top) & the randomized data (bottom).")
#<small>`r caption_fig_ssu("read_length_ssu")`</small>

