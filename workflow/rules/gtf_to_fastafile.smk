rule gtf_to_fastafile:
    input:
        "resources/SIRV_Set4_Norm_Sequences_20210507/SIRV_ERCC_longSIRV_multi-fasta_20210507.gtf"
    output:
        "resources/referencegenome/convertedSIRVgtf_fasta.fasta"
    conda:
        "../envs/minimap2.yaml"
    shell:
        "gffread SIRV_ERCC_longSIRV_multi-fasta_20210507.gtf -T -o convertedSIRVgtf_fasta.fasta"


#Read alignment prior to quantification with NanoCount
#Reads should be aligned to a transcriptome reference using minimap2. We recommend using the -N 10 option to retain at least 10 secondary mappings.

rule get_transcriptome:
    input:
        bam = "resources/basecalls/basecalls.bam"
    output:

    conda:
        "../envs/minimap2.yaml"
    shell:
        "minimap2 -t 4 -ax map-ont -N 10 transcriptome.fasta reads.fastq | samtools view -bh > aligned_reads.bam"