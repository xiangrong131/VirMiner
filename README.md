# VirMiner pipelineForQC
Here we provide the perl scripts to quality control for metagenomic data, wchich was used in VirMiner. It can be used to process raw reads of metagenomic samples in FASTQ format by removing the adapters, low quality reads, bases or PCR duplicates.

How to Run

A sample "run" command to use the current working directory for input/output:
perl fqc.pl all -p -f indiA_merge_viral_contig_TP_5_1.fastq -r indiA_merge_viral_contig_TP_5_2.fastq -o indiA_merge_viral_contig_TP_5_qc
