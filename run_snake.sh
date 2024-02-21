#/bin/bash
## Simple wrapper to running the Map_to_reference snakemake script.

# Load latest version of snakemake installed on the cluster
module load snakemake/7.32.4-conda

# Create the skeleton diretory architecture
if ! [ -d Results/Intermediary_files ] ; then mkdir -p Results/Intermediary_files ; fi
if ! [ -d Logs ] ; then mkdir -p Logs ; fi

# Snakemake command
snakemake -s scripts/Map_to_reference.snake --keep-going --cores 1 --use-conda --configfile=scripts/config.yaml --cluster-config scripts/cluster.yaml --cluster "sbatch -J {cluster.job-name} -A agap -p {cluster.queue} {cluster.mem} {cluster.time} {cluster.nodes} {cluster.cpus} {cluster.out}" --jobs 100 

