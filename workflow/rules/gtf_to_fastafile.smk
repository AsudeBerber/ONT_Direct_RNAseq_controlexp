rule gtf_to_fastafile:
    input:
        gtf = "resources/SIRV_Set4_Norm_Sequences_20210507/SIRV_ERCC_longSIRV_multi-fasta_20210507.gtf",
        fa = "resources/referencegenome/combined_reference_genome.fa"
    output:
        "resources/referencegenome/convertedSIRVgtf_fasta.fasta"
    conda:
        "../envs/gffread.yaml"
    shell:
        "gffread {input.gtf} {input.fa} -T -o {output}"


#Read alignment prior to quantification with NanoCount
#Reads should be aligned to a transcriptome reference using minimap2. We recommend using the -N 10 option to retain at least 10 secondary mappings.
#by running the output in snakemake command line please just copy the output. snakemake -np output

rule combine_transcriptome:
    input:
        "resources/referencegenome/convertedSIRVgtf_fasta.fasta",
        "resources/referencegenome/Saccharomyces_cerevisiae_YHR174W_mRNA_sequence.fa"
    output:
        "resources/referencegenome/combined_transcriptome.fa"
    shell:
        "cat {input} > {output}"
