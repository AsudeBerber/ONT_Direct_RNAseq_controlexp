rule samtools_sort:
    input:
        "resources/alignments/aligned.bam"
    output:
        sorted_alignedbam = "resources/alignments/sorted_aligned.bam"
    conda:
        "../envs/minimap2.yaml"
    threads:
        4
    shell:
        "samtools sort -T {output.sorted_alignedbam} -O bam {input} > {output.sorted_alignedbam}"

#sort and index do it using samtools again 
#use same conda environment 

rule samtools_index:
    input:
        "resources/alignments/sorted_aligned.bam"
    output:
        "resources/alignments/sorted_aligned.bam.bai"
    conda:
        "../envs/minimap2.yaml"
    threads:
        4
    shell:
        "samtools index {input}"


#After, download your combined reference genome, sorted bam and bai file. Upload combined reference genome to IGV and upload your sorted bam file then drag GTF file to compare 
#ffff