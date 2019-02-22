# VirMiner
Source code for the key steps (including quality control of metagenomic raw reads and phage contig indentification) of VirMiner, available at [http://147.8.185.62/VirMiner/](http://147.8.185.62/VirMiner/).  
The souce code was integrated into two parts: VirMiner PipelineForQC and VirMiner PipelineForVirContigIndentification

## VirMiner pipelineForQC
Here we provide the command-line perl scripts to quality control for metagenomic data, which was used in VirMiner. It can be used to process raw reads of metagenomic samples in FASTQ format by removing the adapters, low quality reads, bases or PCR duplicates.

### Software Requirements:
#### install perl  
Linux/macOS: A version of Perl is already installed  
Windows: You may need to install one of the versions available at [perl.org](http://www.perl.org/get.html).  
After installation, run in linux system or terminal apps, such as Terminal on macOS, and Command Prompt on Windows.  

### How to Run
command-line perl scripts: `./scripts/fqc.pl`  
Run `perl ./scripts/fqc.pl -h `to see the parameters of this command line. 

```
$ perl ./scripts/fqc.pl -h

Usage for single: $0 $command -i s_1_IDX1_1.fastq -o s_1_IDX1
      for Paired: $0 $command -f s_1_IDX1_1.fastq -r s_1_IDX1_2.fastq -p -o s_1_IDX1

      $command	<str>	: adpter,quality,adp_qual and duplication

Options:
	-i	<str>	: Fastq file (Single)
	-f	<str>	: Forward fastq file (Paired-End)
	-r	<str>	: Reverse fastq file (Paired-End)
	-a	<str>	: Adapter sequence (Default: GATCGGAAGA)
	-c	<Ns>	: Discard sequences lower than N quality. (Default: 20)
	-q	<Ns>	: Quality format 33/64 (Default: 33)
	-l	<Ns>	: Discard sequences shorter than N nucleotides. (Default: 30)
	-o	<str>	: Output prefix
	-p       	: Paired-End Model (Default: Single)
	-v       	: Prints version of the program
	-h       	: Prints this usage summary
```

A sample "run" command:  
input metagenomic raw reads in pair-end FASTQ format (test_1.fastq, test_2.fastq):  
`perl fqc.pl all -p -f test_1.fastq -r test_2.fastq -o test_qc`  
Output clean reads after quality control : `test_qc_1.fastq` and `test_qc_2.fastq`.  

input metagenomic raw reads in single FASTQ format (test_fastq):  
`perl fqc.pl all -i test.fastq -o test_qc`  
Output clean reads after quality control : `test_qc.fastq`.  

## VirMiner PipelineForVirContigIdentification
Before running this pipeline to identify phage contigs, you need to prepare three input files: fasta file of assembled contigs, fasta file of predicted genes and the clean reads in pair-end FASTQ format (refers to the output file of VirMiner pipelineForQC).  

Input: the assembled contigs and predicted genes and clean reads in pair-end FASTQ format  
Output: identified phage contigs  

### Software Requirements:  



 
