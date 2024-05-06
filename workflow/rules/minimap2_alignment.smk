rule minimap2_align_genome:
    input:
        index = "resources/referencegenome/genome_minimap2.mmi",
        bam = "resources/basecalls/basecalls.bam"
    output:
        "resources/alignments/aligned.bam"
    conda:
        "../envs/minimap2.yaml"
    threads:
        4
    shell:
        """
        samtools fastq -@ {threads} -T mv,ts,ns {input.bam} |
            minimap2 -ax splice -uf -k14 -t {threads} {input.index} - |
            samtools view -bh -@ {threads} -o {output}
        """  
            

rule minimap2_align_txome:
    input:
        bam = "resources/basecalls/basecalls.bam",
        fa = "resources/referencegenome/combined_transcriptome.fa"
    output:
        "resources/alignments/aligned_txome.bam"
    conda:
        "../envs/minimap2.yaml"
    threads:
        4
    shell:
        """
        samtools fastq -@ {threads} -T mv,ts,ns {input.bam} |
            minimap2 -ax map-ont -N 10 -k14 -t {threads} {input.fa} - |
            samtools view -bh -@ {threads} -o {output}
        """ 

#snakemake --cores 8 --use-conda resources/alignments/aligned.bam
#in order to run it (actual)

#-np is just a trial run 
