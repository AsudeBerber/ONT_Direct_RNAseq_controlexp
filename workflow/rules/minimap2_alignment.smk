rule minimap2_alignment:
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
            


#snakemake --cores 8 --use-conda resources/alignments/aligned.bam
#in order to run it (actual)

#-np is just a trial run 
