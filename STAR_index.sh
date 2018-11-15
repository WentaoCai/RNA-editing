#!/bin/bash -l

cd /work-zfs/songj88/wentao/Goat_STAR/

STAR --runMode genomeGenerate --genomeDir /work-zfs/songj88/wentao/Goat_STAR \
--genomeFastaFiles /work-zfs/songj88/wentao/Goat_STAR/Goatgenome.fa \
--sjdbGTFfile /work-zfs/songj88/wentao/Goat_STAR/Capra_hircus.ARS1.93.gtf \
--runThreadN 20 --sjdbOverhang 74

for i in a2g a2c a2t c2a c2g c2t g2a g2c g2t c2t c2g c2a
do
STAR --runMode genomeGenerate --genomeDir /work-zfs/songj88/wentao/Goat_STAR/Goatgenome."$i" \
--genomeFastaFiles Goatgenome."$i".fa \
--runThreadN 20
done
