rule combine_genome:
    input:
        "resources/referencegenome/Saccharomyces_cerevisiae_YHR174W_mRNA_sequence.fa",
        "resources/referencegenome/SIRV_ERCC_longSIRV_multi-fasta_20210507.fasta"
    output:
        "resources/referencegenome/combined_reference_genome.fa"
    shell:
        "cat {input} > {output}"


rule minimap2_index:
    input:
        "resources/referencegenome/combined_reference_genome.fa"
    output:
        "resources/referencegenome/genome_minimap2.mmi"
    conda:
        "../envs/minimap2.yaml"
    threads:
        3
    shell:
        "minimap2 -ax splice -uf -k14 -t {threads} -d {output} {input}"
    
    

#in order to run it either use output file or rule name in command
#https://www.lexogen.com/sirvs/sirv-sets/ here where we get SIRV fasta
#ENSEMBL ENO2 sequence where we get the yeast genome seq 