## Table captions
caption_tab_ssu("ssu_sample_seq_info", "Sample data & associated sequencing information.")
caption_tab_ssu("ssu_cutadapt_year_0", "Total reads per sample after primer removal (using cutadapt) for Year 0 samples.")
caption_tab_ssu("ssu_cutadapt_year_1", "Total reads per sample after primer removal (using cutadapt) for Year 1 samples.")
caption_tab_ssu("ssu_cutadapt_year_4", "Total reads per sample after primer removal (using cutadapt) for Year 4 samples.")

caption_tab_ssu("ssu_filter_year_0", "Total reads per sample after filtering for Year 0 samples.")
caption_tab_ssu("ssu_filter_year_1", "Total reads per sample after filtering for Year 1 samples.")
caption_tab_ssu("ssu_filter_year_4", "Total reads per sample after filtering for Year 4 samples.")

caption_tab_ssu("ssu_denoise_year_0", "Results of denoising Year 0 forward and reverse reads using `dada` function.")
caption_tab_ssu("ssu_denoise_year_1", "Results of denoising Year 1 forward and reverse reads using `dada` function.")
caption_tab_ssu("ssu_denoise_year_4", "Results of denoising Year 4 forward and reverse reads using `dada` function.")

caption_tab_ssu("ssu_merge_year_0", "Results of merging Year 0 forward and reverse reads after denoising.")
caption_tab_ssu("ssu_merge_year_1", "Results of merging Year 1 forward and reverse reads after denoising.")
caption_tab_ssu("ssu_merge_year_4", "Results of merging Year 4 forward and reverse reads after denoising.")

caption_tab_ssu("ssu_read_changes", "Tracking reads changes at each step of the DADA2 workflow.")

caption_tab_its("its_sample_seq_info", "Sample data & associated sequencing information.")
caption_tab_its("its_cutadapt_year_0", "Total reads per sample after primer removal (using cutadapt) for Year 0 samples.")
caption_tab_its("its_cutadapt_year_1", "Total reads per sample after primer removal (using cutadapt) for Year 1 samples.")
caption_tab_its("its_cutadapt_year_4", "Total reads per sample after primer removal (using cutadapt) for Year 4 samples.")

caption_tab_its("its_filter_year_0", "Total reads per sample after filtering for Year 0 samples.")
caption_tab_its("its_filter_year_1", "Total reads per sample after filtering for Year 1 samples.")
caption_tab_its("its_filter_year_4", "Total reads per sample after filtering for Year 4 samples.")

caption_tab_its("its_denoise_year_0", "Results of denoising Year 0 forward and reverse reads using `dada` function.")
caption_tab_its("its_denoise_year_1", "Results of denoising Year 1 forward and reverse reads using `dada` function.")
caption_tab_its("its_denoise_year_4", "Results of denoising Year 4 forward and reverse reads using `dada` function.")

caption_tab_its("its_merge_year_0", "Results of merging Year 0 forward and reverse reads after denoising.")
caption_tab_its("its_merge_year_1", "Results of merging Year 1 forward and reverse reads after denoising.")
caption_tab_its("its_merge_year_4", "Results of merging Year 4 forward and reverse reads after denoising.")

caption_tab_its("its_read_changes", "Tracking reads changes at each step of the DADA2 workflow.")

#<small>`r caption_tab_its("qual_scores_after_ssu")`</small>

## Figure captions
caption_fig_ssu("ssu_raw_qual_scores_year_0", "Aggregated quality score plots for raw forward (left) & reverse (right) reads (Year 0).")
caption_fig_ssu("ssu_raw_qual_scores_year_1", "Aggregated quality score plots for raw forward (left) & reverse (right) reads (Year 1).")
caption_fig_ssu("ssu_raw_qual_scores_year_4", "Aggregated quality score plots for raw forward (left) & reverse (right) reads (Year 4).")

caption_fig_ssu("ssu_cut_qual_scores_year_1", "Aggregated quality score plots for forward (left) & reverse (right) reads after primer removal (Year 1).")
caption_fig_ssu("ssu_cut_qual_scores_year_4", "Aggregated quality score plots for raw forward (left) & reverse (right) reads after primer removal (Year 4).")

caption_fig_ssu("ssu_filt_qual_scores_year_0", "Aggregated quality score plots for forward (left) & reverse (right) reads after filtering (Year 0).")
caption_fig_ssu("ssu_filt_qual_scores_year_1", "Aggregated quality score plots for forward (left) & reverse (right) reads after filtering (Year 1).")
caption_fig_ssu("ssu_filt_qual_scores_year_4", "Aggregated quality score plots for forward (left) & reverse (right) reads after filtering (Year 4).")

caption_fig_ssu("ssu_error_F_year_0", "Forward reads: Observed frequency of each transition (e.g., T -> G) as a function of the associated quality score (Year 0).")
caption_fig_ssu("ssu_error_R_year_0", "Reverse reads: Observed frequency of each transition (e.g., T -> G) as a function of the associated quality score (Year 0).")

caption_fig_ssu("ssu_error_F_year_1", "Forward reads: Observed frequency of each transition (e.g., T -> G) as a function of the associated quality score (Year 1).")
caption_fig_ssu("ssu_error_R_year_1", "Reverse reads: Observed frequency of each transition (e.g., T -> G) as a function of the associated quality score (Year 1).")

caption_fig_ssu("ssu_error_F_year_4", "Forward reads: Observed frequency of each transition (e.g., T -> G) as a function of the associated quality score (Year 4).")
caption_fig_ssu("ssu_error_R_year_4", "Reverse reads: Observed frequency of each transition (e.g., T -> G) as a function of the associated quality score (Year 4).")

caption_fig_ssu("ssu_read_length_before", "Distribution of read length by total ASVs before removing length variants.")

caption_fig_its("its_raw_qual_scores_year_0", "Aggregated quality score plots for raw forward (left) & reverse (right) reads (Year 0).")
caption_fig_its("its_raw_qual_scores_year_1", "Aggregated quality score plots for raw forward (left) & reverse (right) reads (Year 1).")
caption_fig_its("its_raw_qual_scores_year_4", "Aggregated quality score plots for raw forward (left) & reverse (right) reads (Year 4).")

caption_fig_its("its_cut_qual_scores_year_0", "Aggregated quality score plots for forward (left) & reverse (right) reads after primer removal (Year 1).")
caption_fig_its("its_cut_qual_scores_year_1", "Aggregated quality score plots for forward (left) & reverse (right) reads after primer removal (Year 1).")
caption_fig_its("its_cut_qual_scores_year_4", "Aggregated quality score plots for forward (left) & reverse (right) reads after primer removal (Year 1).")

caption_fig_its("its_filt_qual_scores_year_0", "Aggregated quality score plots for forward (left) & reverse (right) reads after filtering (Year 0).")
caption_fig_its("its_filt_qual_scores_year_1", "Aggregated quality score plots for forward (left) & reverse (right) reads after filtering (Year 1).")
caption_fig_its("its_filt_qual_scores_year_4", "Aggregated quality score plots for forward (left) & reverse (right) reads after filtering (Year 4).")

caption_fig_its("its_error_F_year_0", "Forward reads: Observed frequency of each transition (e.g., T -> G) as a function of the associated quality score (Year 0).")
caption_fig_its("its_error_R_year_0", "Reverse reads: Observed frequency of each transition (e.g., T -> G) as a function of the associated quality score (Year 0).")

caption_fig_its("its_error_F_year_1", "Forward reads: Observed frequency of each transition (e.g., T -> G) as a function of the associated quality score (Year 1).")
caption_fig_its("its_error_R_year_1", "Reverse reads: Observed frequency of each transition (e.g., T -> G) as a function of the associated quality score (Year 1).")

caption_fig_its("its_error_F_year_4", "Forward reads: Observed frequency of each transition (e.g., T -> G) as a function of the associated quality score (Year 4).")
caption_fig_its("its_error_R_year_4", "Reverse reads: Observed frequency of each transition (e.g., T -> G) as a function of the associated quality score (Year 4).")

caption_fig_its("its_read_length_before", "Distribution of read length by total ASVs before removing length variants.")


#<small>`r caption_fig_its("ssu_error_F_year_0")`</small>