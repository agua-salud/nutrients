## Table captions
caption_tab_ssu("seq_dets_ssu", "Sample data & associated sequencing information.")
caption_tab_ssu("seq_cutadapt_ssu_y0", "Total reads per sample after primer removal (using cutadapt) for Year 0 samples.")
caption_tab_ssu("seq_cutadapt_ssu_y1", "Total reads per sample after primer removal (using cutadapt) for Year 1 samples.")
caption_tab_ssu("seq_cutadapt_ssu_y4", "Total reads per sample after primer removal (using cutadapt) for Year 4 samples.")

caption_tab_ssu("filter_ssu_y0", "Total reads per sample after filtering for Year 0 samples.")
caption_tab_ssu("filter_ssu_y1", "Total reads per sample after filtering for Year 1 samples.")
caption_tab_ssu("filter_ssu_y4", "Total reads per sample after filtering for Year 4 samples.")

caption_tab_ssu("denoise_ssu_y0", "Results of denoising Year 0 forward and reverse reads using `dada` function.")
caption_tab_ssu("denoise_ssu_y1", "Results of denoising Year 1 forward and reverse reads using `dada` function.")
caption_tab_ssu("denoise_ssu_y4", "Results of denoising Year 4 forward and reverse reads using `dada` function.")

caption_tab_ssu("merge_ssu_y0", "Results of merging Year 0 forward and reverse reads after denoising.")
caption_tab_ssu("merge_ssu_y1", "Results of merging Year 1 forward and reverse reads after denoising.")
caption_tab_ssu("merge_ssu_y4", "Results of merging Year 4 forward and reverse reads after denoising.")

caption_tab_ssu("track_ssu", "Tracking reads changes at each step of the DADA2 workflow.")

caption_tab_its("seq_dets_its", "Sample data & associated sequencing information.")
caption_tab_its("seq_cutadapt_its_y0", "Total reads per sample after primer removal (using cutadapt) for Year 0 samples.")
caption_tab_its("seq_cutadapt_its_y1", "Total reads per sample after primer removal (using cutadapt) for Year 1 samples.")
caption_tab_its("seq_cutadapt_its_y4", "Total reads per sample after primer removal (using cutadapt) for Year 4 samples.")

caption_tab_its("filter_its_y0", "Total reads per sample after filtering for Year 0 samples.")
caption_tab_its("filter_its_y1", "Total reads per sample after filtering for Year 1 samples.")
caption_tab_its("filter_its_y4", "Total reads per sample after filtering for Year 4 samples.")

caption_tab_its("denoise_its_y0", "Results of denoising Year 0 forward and reverse reads using `dada` function.")
caption_tab_its("denoise_its_y1", "Results of denoising Year 1 forward and reverse reads using `dada` function.")
caption_tab_its("denoise_its_y4", "Results of denoising Year 4 forward and reverse reads using `dada` function.")

caption_tab_its("merge_its_y0", "Results of merging Year 0 forward and reverse reads after denoising.")
caption_tab_its("merge_its_y1", "Results of merging Year 1 forward and reverse reads after denoising.")
caption_tab_its("merge_its_y4", "Results of merging Year 4 forward and reverse reads after denoising.")

caption_tab_its("track_its", "Tracking reads changes at each step of the DADA2 workflow.")

#<small>`r caption_tab_its("qual_scores_after_ssu")`</small>

## Figure captions
caption_fig_ssu("raw_qual_scores_ssu_y0", "Aggregated quality score plots for raw forward (left) & reverse (right) reads (Year 0).")
caption_fig_ssu("raw_qual_scores_ssu_y1", "Aggregated quality score plots for raw forward (left) & reverse (right) reads (Year 1).")
caption_fig_ssu("raw_qual_scores_ssu_y4", "Aggregated quality score plots for raw forward (left) & reverse (right) reads (Year 4).")

caption_fig_ssu("cut_qual_scores_ssu_y1", "Aggregated quality score plots for forward (left) & reverse (right) reads after primer removal (Year 1).")
caption_fig_ssu("cut_qual_scores_ssu_y4", "Aggregated quality score plots for raw forward (left) & reverse (right) reads after primer removal (Year 4).")

caption_fig_ssu("filt_qual_scores_ssu_y0", "Aggregated quality score plots for forward (left) & reverse (right) reads after filtering (Year 0).")
caption_fig_ssu("filt_qual_scores_ssu_y1", "Aggregated quality score plots for forward (left) & reverse (right) reads after filtering (Year 1).")
caption_fig_ssu("filt_qual_scores_ssu_y4", "Aggregated quality score plots for forward (left) & reverse (right) reads after filtering (Year 4).")

caption_fig_ssu("error_F_ssu_y0", "Forward reads: Observed frequency of each transition (e.g., T -> G) as a function of the associated quality score (Year 0).")
caption_fig_ssu("error_R_ssu_y0", "Reverse reads: Observed frequency of each transition (e.g., T -> G) as a function of the associated quality score (Year 0).")

caption_fig_ssu("error_F_ssu_y1", "Forward reads: Observed frequency of each transition (e.g., T -> G) as a function of the associated quality score (Year 1).")
caption_fig_ssu("error_R_ssu_y1", "Reverse reads: Observed frequency of each transition (e.g., T -> G) as a function of the associated quality score (Year 1).")

caption_fig_ssu("error_F_ssu_y4", "Forward reads: Observed frequency of each transition (e.g., T -> G) as a function of the associated quality score (Year 4).")
caption_fig_ssu("error_R_ssu_y4", "Reverse reads: Observed frequency of each transition (e.g., T -> G) as a function of the associated quality score (Year 4).")

caption_fig_ssu("read_length_before_ssu", "Distribution of read length by total ASVs before removing length variants.")

caption_fig_its("raw_qual_scores_its_y0", "Aggregated quality score plots for raw forward (left) & reverse (right) reads (Year 0).")
caption_fig_its("raw_qual_scores_its_y1", "Aggregated quality score plots for raw forward (left) & reverse (right) reads (Year 1).")
caption_fig_its("raw_qual_scores_its_y4", "Aggregated quality score plots for raw forward (left) & reverse (right) reads (Year 4).")

caption_fig_its("cut_qual_scores_its_y1", "Aggregated quality score plots for forward (left) & reverse (right) reads after primer removal (Year 1).")
caption_fig_its("cut_qual_scores_its_y4", "Aggregated quality score plots for raw forward (left) & reverse (right) reads after primer removal (Year 4).")

caption_fig_its("filt_qual_scores_its_y0", "Aggregated quality score plots for forward (left) & reverse (right) reads after filtering (Year 0).")
caption_fig_its("filt_qual_scores_its_y1", "Aggregated quality score plots for forward (left) & reverse (right) reads after filtering (Year 1).")
caption_fig_its("filt_qual_scores_its_y4", "Aggregated quality score plots for forward (left) & reverse (right) reads after filtering (Year 4).")

caption_fig_its("error_F_its_y0", "Forward reads: Observed frequency of each transition (e.g., T -> G) as a function of the associated quality score (Year 0).")
caption_fig_its("error_R_its_y0", "Reverse reads: Observed frequency of each transition (e.g., T -> G) as a function of the associated quality score (Year 0).")

caption_fig_its("error_F_its_y1", "Forward reads: Observed frequency of each transition (e.g., T -> G) as a function of the associated quality score (Year 1).")
caption_fig_its("error_R_its_y1", "Reverse reads: Observed frequency of each transition (e.g., T -> G) as a function of the associated quality score (Year 1).")

caption_fig_its("error_F_its_y4", "Forward reads: Observed frequency of each transition (e.g., T -> G) as a function of the associated quality score (Year 4).")
caption_fig_its("error_R_its_y4", "Reverse reads: Observed frequency of each transition (e.g., T -> G) as a function of the associated quality score (Year 4).")

caption_fig_its("read_length_before_its", "Distribution of read length by total ASVs before removing length variants.")


#<small>`r caption_fig_its("error_F_ssu_y0")`</small>