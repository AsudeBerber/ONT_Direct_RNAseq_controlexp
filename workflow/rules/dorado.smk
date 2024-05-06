rule dorado:
    input:
        "resources/pod5_pass/"
    output:
        bam = "resources/basecalls/basecalls.bam"
    params:
        model = "sup@v3.0.1"
    threads:
        16
    shell:
        "dorado_0.6.1 basecaller {params.model} {input} --emit-moves > {output.bam}"
