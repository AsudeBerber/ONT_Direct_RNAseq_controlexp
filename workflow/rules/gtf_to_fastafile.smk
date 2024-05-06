rule gtf_to_fastafile:
    input:
        "resources/SIRV_Set4_Norm_Sequences_20210507/SIRV_ERCC_longSIRV_multi-fasta_20210507.gtf"
        "resources/combined_reference_genome.fa"
    output:
        "resources/referencegenome/convertedSIRVgtf_fasta.fasta"
    conda:
        "../envs/gffread.yaml"
    shell:
        "gffread SIRV_ERCC_longSIRV_multi-fasta_20210507.gtf -T -o convertedSIRV.fasta"


#Read alignment prior to quantification with NanoCount
#Reads should be aligned to a transcriptome reference using minimap2. We recommend using the -N 10 option to retain at least 10 secondary mappings.
#by running the output in snakemake command line please just copy the output. snakemake -np output

# rule combine_genome:
#     input:
#         "resources/referencegenome/........",
#         "resources/referencegenome/Saccharomyces_cerevisiae_YHR174W_mRNA_sequence.fa"
#     output:
#         "resources/referencegenome/combined_transcriptome.fa"
#     shell:
#         "cat {input} > {output}"



# rule get_transcriptome:
#     input:
#         bam = "resources/basecalls/basecalls.bam"
#     output:
#         "resources/referencegenome/transcriptome.bam"
#     conda:
#         "../envs/minimap2.yaml"
#     shell:
#         "minimap2 -t 4 -ax map-ont -N 10 transcriptome.fasta reads.fastq | samtools view -bh > aligned_reads.bam"