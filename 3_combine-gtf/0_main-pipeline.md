- Create symbolic links to the mito gff files output by the [2_annotate-mito](../2_annotate-mito) project.
  ```bash
  cd /home/liuzhiyu/Projects/neo_caste/Mito_Assemble/3_combine-gtf/annotate_out_gff
  for path in $(find "../../2_annotate-mito" -name "*.gff"); do
      sp_name=$(basename $(dirname "$path"))
      ln -sf $path "${sp_name}.gff"
  done
  ```
- Manually download the GTF annotation files and put into [genome_gtf](./genome_gtf/) directory.
  ```bash
  cd /home/liuzhiyu/Projects/neo_caste/Mito_Assemble/3_combine-gtf
  wget https://ftp.ensemblgenomes.ebi.ac.uk/pub/metazoa/current/gtf/bombus_terrestris_gca910591885v2/Bombus_terrestris_gca910591885v2.iyBomTerr1.2.62.gtf.gz -O "./genome_gtf/Bombus_terrestris.gtf.gz"
  wget https://ftp.ensemblgenomes.ebi.ac.uk/pub/metazoa/current/gtf/harpegnathos_saltator_gca003227715v2rs/Harpegnathos_saltator_gca003227715v2rs.Hsal_v8.5.62.gtf.gz -O "./genome_gtf/Harpegnathos_saltator.gtf.gz"
  wget https://ftp.ensemblgenomes.ebi.ac.uk/pub/metazoa/current/gtf/monomorium_pharaonis_gca013373865v2/Monomorium_pharaonis_gca013373865v2.ASM1337386v2.62.gtf.gz -O "./genome_gtf/Monomorium_pharaonis.gtf.gz"
  find ./genome_gtf -name "*.gz" -exec gunzip {} \;
  ```
- Manually obtain the GTF of mitochondrial genes from the entire *Apis mellifera* genome and save it in standard_mito_gtf as a standard reference.
  ```bash
  cd /home/liuzhiyu/Projects/neo_caste/Mito_Assemble/3_combine-gtf
  wget https://ftp.ensemblgenomes.ebi.ac.uk/pub/metazoa/current/gtf/apis_mellifera/Apis_mellifera.Amel_HAv3.1.62.gtf.gz -O "./standard_mito_gtf/Apis_mellifera_genome.gtf.gz"
  zcat "./standard_mito_gtf/Apis_mellifera_genome.gtf" | grep CM009947.2 > "./standard_mito_gtf/Apis_mellifera.gtf"
  ```

- Convert the gff output from [2_annotate-mito](../2_annotate-mito/) Project into standard-compliant gtf file according to the format of Apis_mellifera.gtf using [1_gff2formatgtf.py](./1_gff2formatgtf.py).

- Merge mitochondrial GTF files with genomic GTF files lacking mitochondria.
  ```bash
  cd /home/liuzhiyu/Projects/neo_caste/Mito_Assemble/3_combine-gtf
  cat "./genome_gtf/Bombus_terrestris.gtf" "./annotate_out_gtf/Bombus_terrestris.gtf" > "./combined_gtf/Bombus_terrestris.gtf"
  cat "./genome_gtf/Harpegnathos_saltator.gtf" "./annotate_out_gtf/Harpegnathos_saltator.gtf" > "./combined_gtf/Harpegnathos_saltator.gtf"
  cat "./genome_gtf/Monomorium_pharaonis.gtf" "./annotate_out_gtf/Monomorium_pharaonis.gtf" > "./combined_gtf/Monomorium_pharaonis.gtf"
  ```