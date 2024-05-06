import pod5 as p5
import os
#import pysam
import matplotlib.pyplot as plt
import numpy as np
from sys import argv
import argparse
import sys


pod5_file = "resources/pod5_pass/"
#bam_file = "data/mapped/PAQ77977_pass_barcode01_362f656f_255b3204_0.bam"
#selected_read_id = '9d6feae0-0e0a-4a5b-a0b1-690e8203c126'
#outfile = 'resources/plots/timeandsignalplotofoneread.png'


def plot_one_read(file, id):

    if not os.path.exists(file):
        raise Exception("Sorry, file does not exist")
        
    with p5.Reader(file) as reader:
        all_ids = reader.read_ids

        if id not in all_ids:
            raise Exception("Sorry, id ndoes not exist")

        read = next(reader.reads(selection=[id]))

        sample_rate = read.run_info.sample_rate
        signal = read.signal

        # Compute the time steps over the sampling period
        time = np.arange(len(signal)) / sample_rate

        superplot = plt.xlabel('Time')
        superplot = plt.ylabel('Signal')

        # Plot using matplotlib
        plt.plot(time, signal)

    return plt

#samfile = pysam.AlignmentFile(bam_file, "rb")

#write plot to file out file 
#I am using matplot so check the correct code for matplot


def parse_args(argv):

    parser = argparse.ArgumentParser()

    parser.add_argument("-p", "--pod5", type=str)
    #parser.add_argument("-b", "--bam", type=str)
    parser.add_argument("-o", "--output", type=str)
    # add id to parser
    parser.add_argument("-r", "--readid", type=str)

    args = parser.parse_args()

    return args


def main(argv=sys.argv[1:]):
    # we start from 1 because 0 is the script name.

    args = parse_args(argv=argv)

    pod5_file = args.pod5
    selected_read_id = args.readid
    outfile = args.output

    superplot = plot_one_read(pod5_file, selected_read_id)
    superplot.savefig(outfile)

    return 0


if __name__ == "__main__":
    exit(main())
