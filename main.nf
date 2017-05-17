#!/usr/bin/env nextflow

//General configuration variables
params.help = ""
params.prefix = "ratt_"
params.type = "Strain"
params.embl = "$baseDir/data/embl"
params.fasta = "$baseDir/data/F11.fasta"
params.output = "$baseDir/ratt_results"

prefix = params.prefix
type = params.type
embl = params.embl
fasta = file(params.fasta)

// Display help menu
if(params.help) {
	log.info ''
	log.info 'Rapid Annotation Transfer Tool'
	log.info ''
	log.info 'Usage: '
	log.info '    nextflow ratt.nf --prefix --type --embl --fasta --output'
	log.info ''
	log.info 'Script Options: '
	log.info '    --prefix		The prefix you wish to give to each result file.'
	log.info '    --type		The following types can be used'
	log.info '    --embl	    	The directory containing all the reference annotation files to be transferred to the query.'
	log.info '			These files must be in EMBL format.'
	log.info '    --fasta		The nucleotide sequence to which the reference annotations will be mapped.'
	log.info '    --output		Folder path where the results are stored.'
	log.info ''
	return
}


println "  R        A        T       T"
println "Rapid Annotation Transfer Tool"
println "=============================="

// Annotating
process Annotating {
	// Output folder
	publishDir "${params.output}", mode: "copy"
	// Run a docker image
	container 'thanhleviet/ratt'
	// I want to print the fasta name
	tag { fasta }

	input:
	file fasta

	output:
	file '*' into results mode flatten

	// Simple command
	"""
	ratt -p $prefix -t $type $embl $fasta
	"""
}
