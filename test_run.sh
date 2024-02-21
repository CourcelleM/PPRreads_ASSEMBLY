#!/bin/bash
# Simple wrapper to run a snakemake dry-run with current parameters;

if module list -t 2>&1 | grep -q snakemake ; then loaded="yes" ; else loaded="no" ; fi
module load snakemake/7.32.4-conda

snakemake -s scripts/Map_to_reference.snake --configfile=scripts/config.yaml --dry-run --reason

if [ $loaded == "no" ] ; then module unload snakemake ; fi
