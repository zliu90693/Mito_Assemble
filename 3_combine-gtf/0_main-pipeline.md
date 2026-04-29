- Create symbolic links to the gff files output by the [2_annotate-mito](../2_annotate-mito) project and generate gtf using [1_gff2gtf.sh](./1_gff2gtf.sh).
  ```bash
  cd /home/liuzhiyu/Projects/neo_caste/Mito_Assemble/3_combine-gtf
  ./1_gff2gtf.sh
  ```
- Manually download the GTF annotation files and put into genome_gtf directory.
  ```bash
  cd /home/liuzhiyu/Projects/neo_caste/Mito_Assemble/3_combine-gtf
  wget https://ftp.ensemblgenomes.ebi.ac.uk/pub/metazoa/current/gtf/bombus_terrestris_gca910591885v2/Bombus_terrestris_gca910591885v2.iyBomTerr1.2.62.gtf.gz -O "./genome_gtf/Bombus_terrestris.gtf.gz"
  wget https://ftp.ensemblgenomes.ebi.ac.uk/pub/metazoa/current/gtf/harpegnathos_saltator_gca003227715v2rs/Harpegnathos_saltator_gca003227715v2rs.Hsal_v8.5.62.gtf.gz -O "./genome_gtf/Harpegnathos_saltator.gtf.gz"
  wget https://ftp.ensemblgenomes.ebi.ac.uk/pub/metazoa/current/gtf/monomorium_pharaonis_gca013373865v2/Monomorium_pharaonis_gca013373865v2.ASM1337386v2.62.gtf.gz -O "./genome_gtf/Monomorium_pharaonis.gtf.gz"
  find ./genome_gtf -name "*.gz" -exec gunzip {} \;
  ```
- 