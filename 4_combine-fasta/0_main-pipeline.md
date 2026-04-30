- Make symbilic links:
  ```bash
  cd /home/liuzhiyu/Projects/neo_caste/Mito_Assemble/4_combine-fasta/mito_fasta
  for path in $(find "../../2_annotate-mito/unannotated_mito_fasta" -name "*.fasta"); do
      sp_fasta=$(basename $path)
      ln -sf $path "./${sp_fasta}"
  done
  ```
- Manually download the fasta:
  ```bash
  cd /home/liuzhiyu/Projects/neo_caste/Mito_Assemble/4_combine-fasta
  wget https://ftp.ensemblgenomes.ebi.ac.uk/pub/metazoa/current/fasta/bombus_terrestris_gca910591885v2/dna/Bombus_terrestris_gca910591885v2.iyBomTerr1.2.dna.toplevel.fa.gz -O "./genome_fasta/Bombus_terrestris.fa.gz"
  
  wget https://ftp.ensemblgenomes.ebi.ac.uk/pub/metazoa/current/fasta/harpegnathos_saltator_gca003227715v2rs/dna/Harpegnathos_saltator_gca003227715v2rs.Hsal_v8.5.dna.toplevel.fa.gz -O "./genome_fasta/Harpegnathos_saltator.fa.gz"

  wget https://ftp.ensemblgenomes.ebi.ac.uk/pub/metazoa/current/fasta/monomorium_pharaonis_gca013373865v2/dna/Monomorium_pharaonis_gca013373865v2.ASM1337386v2.dna.toplevel.fa.gz -O "./genome_fasta/Monomorium_pharaonis.fa.gz"

  gunzip ./genome_fasta/*
  ```
- Combine genome and mito fasta:
  ```bash
  cd /home/liuzhiyu/Projects/neo_caste/Mito_Assemble/4_combine-fasta
  cat "./genome_fasta/Bombus_terrestris.fa" "./mito_fasta/Bombus_terrestris.fasta" > "./combined_fasta/Bombus_terrestris.fasta"
  cat "./genome_fasta/Harpegnathos_saltator.fa" "./mito_fasta/Harpegnathos_saltator.fasta" > "./combined_fasta/Harpegnathos_saltator.fasta"
  cat "./genome_fasta/Monomorium_pharaonis.fa" "./mito_fasta/Monomorium_pharaonis.fasta" > "./combined_fasta/Monomorium_pharaonis.fasta"
  ```