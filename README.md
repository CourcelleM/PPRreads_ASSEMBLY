# PPRreads_ASSEMBLY
# README: Mapping Reads to Reference Genome

## Overview
This Snakemake pipeline is a simple wrapper of 2 rounds of BWAmem2 alignment of Illumina short reads, followed by a samtools consensus. A configuration file allows to specify input data and assembly parameters. It is designed to run on a computer cluster using the SLURM job manager.

## Requirements
- **Snakemake** (>=5.0)
All other software and dependancies are contained in a conda environment and should be automatically downloaded and installed.

## Installation
1. Clone this repository:
   ```bash
   git clone https://github.com/CourcelleM/PPRreads_ASSEMBLY
   ```

## Configuration
In the scripts/ folder, edit the `config.yaml` file to specify:
- `DATADIR`: Directory containing FASTQ files and reference genome.
- `ext1` / `ext2`: File extensions for paired-end reads.
- `refgen`: Path to the reference genome file.

Example `config.yaml`:
```yaml
DATADIR: "./data"
ext1: "_R1.fastq.gz"
ext2: "_R2.fastq.gz"
refgen: "./reference/genome.fasta"
```

Additionally, you should edit the cluster.yaml file to adapt it to your cluster rules and account. You will most likely have to change at least the partition and queue occurences according to your cluster's nomenclature. 

## Running the Pipeline
### Test run
Executing the **test_run.sh** script will attempt a snakemake _dry-run_. No analysis are conducted but this may allow you to check that your data are detected correctly and the requirements are fulfilled.
```bash
./test_run.sh
```

### Running the analysis
```bash
./run_snake.sh
```

## Output
- Aligned BAM files
- Quality control reports
- Summary statistics

## Citation
If you use this pipeline, please cite the appropriate tools (BWA, Samtools, Snakemake, etc.).

