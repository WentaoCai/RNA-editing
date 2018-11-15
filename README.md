# RNA-editing in bovine genome

1.Convert A to G for genome fasta file

perl A2G_convert_genome.pl genome.fasta>genome.A2G.fasta

2.STAR index

sh STAR_index.sh

3.Mapping

STAR --runThreadN 20 --genomeDir /work-zfs/songj88/wentao/Goat_STAR --sjdbGTFfile /work-zfs/songj88/wentao/Goat_STAR/Capra_hircus.ARS1.93.gtf --sjdbOverhang 74 \
--outSAMtype SAM \
-readFilesCommand zcat \
--outSAMunmapped Within \
--alignEndsType EndToEnd \
--outReadsUnmapped Fastx \
--outFilterMismatchNmax 3 \
-readFilesIn SRR4895022_1.clean.fq.gz \
--outFileNamePrefix SRR4895022
