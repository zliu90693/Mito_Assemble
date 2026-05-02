- For species lacking mitochondrial sequences in NCBI, use tools such as MitoFinder to generate mitochondrial sequences based on raw sequencing data.
  - Lasioglossum zephyrus *
  - Ceratina calcarata
  - Lasioglossum albipes

# Lasioglossum zephyrus
- By checking Genbank, the SRR corresponding to LZEP_v2.2.0 was determined to be SRR11352862.
- Download the FASTQ files for the project corresponding to the *Lasioglossum zephyrus* reference genome using [1_get-fastq.sh](./1_get-fastq.sh)
  ```bash
  cd /home/liuzhiyu/Projects/neo_caste/Mito_Assemble/1_generate-mito
  ./1_get-fastq.sh -s SRR11352862 -n Lasioglossum_zephyrus
  ```