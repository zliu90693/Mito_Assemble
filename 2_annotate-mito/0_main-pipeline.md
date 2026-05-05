- For species that already possess mitochondrial sequences, annotate them to generate GTF files.
  - Harpegnathos saltator *
  - Monomorium pharaonis *
  - Bombus terrestris *
  - Lasioglossum zephyrus *
  - ~~Lasioglossum albipes~~
  - ~~Camponotus floridanus~~
  - ~~Ceratina calcarata~~

- Retrieve mitochondrial sequences manually:
  - Harpegnathos saltator, Source: NCBI, ID: MK861047.1, Link: https://www.ncbi.nlm.nih.gov/nuccore/MK861047.1
  - Monomorium pharaonis, Source: NCBI, ID: CM023805.1, Link: https://www.ncbi.nlm.nih.gov/nuccore/CM023805.1
  - Bombus terrestris, Source: NCBI, ID: OU342939.1, Link: https://www.ncbi.nlm.nih.gov/nuccore/OU342939.1
  - Lasioglossum zephyrus, Source: [1_generate-mito Project](../1_generate-mito/mito-out/Lasioglossum_zephyrus/Lasioglossum_zephyrus.result/Lasioglossum_zephyrus.Lasioglossum_zephyrus.megahit.mitogenome.fa.result/Lasioglossum_zephyrus_Lasioglossum_zephyrus.megahit.mitogenome.fa_mitoscaf.fa.gbf.fasta)

- Annotate mitochondrial genes using [runmitos](./1_run-runmitos.sh)
  ```bash
  conda activate Mito_Assemble
  cd /home/liuzhiyu/Projects/neo_caste/Mito_Assemble/2_annotate-mito
  ./1_run-runmitos.sh
  mv ./unannotated_mito_fasta/* ./annotated_mito_fasta
  ```
