rule pod5_plot:
    input:
        "resources/pod5_pass/"
    output:
        "resources/plots/args.output"
    conda:
        "../envs/squigglepy.yaml"
    shell:
        "python3 /scripts/Direct_RNA_seq_ONT_vis.py {input} arg1 arg2 arg3 {output}"