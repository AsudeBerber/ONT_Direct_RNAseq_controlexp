rule nanocount:
    input:
        "resources/alignments/aligned_txome.bam"
    output:
        "resources/referencegenome/txome_counts.tsv"
    conda:
        "../envs/NanoCount.yaml"
    shell:
        "NanoCount -i {input} --extra_tx_info -o {output}"



#NanoCount returns a file containing count data per transcript. 
#transcript_name: Transcript name as in source bam/sam file.
#raw: Raw abundance estimates. The sum of all abundance values is 1.
#est_count: Estimated counts obtained by multiplying the raw abundance by the number of primary alignments.
#tpm: Estimated counts obtained by multiplying the raw abundance by 1M.
#transcript_length: Optional column included with the option extra_tx_info.