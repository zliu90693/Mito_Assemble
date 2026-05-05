# %%

import pyranges as pr
import pandas as pd

# %%

def gff2gtf(sp_name):
    gff = pr.read_gff3(f"./annotate_out_gff/{sp_name}.gff")
    df = gff.as_df()
    df.drop(["Is_circular", "genome", "mol_type", "Frame", "ID", "Score", "gene_id", "Parent"], axis = 1, inplace=True)
    df.drop(df.index[0], inplace=True) # The first line contains the complete mitochondrial information and needs to be deleted.
    df = df[~(df["Name"].str.startswith('trn', na=False) | df["Name"].str.startswith('rrn', na=False))] # remove tRNA & rRNA

    df = df.rename(columns={'Name': 'gene_id'}) # add gene_id gene_name etc.
    df["transcript_id"] = df["gene_id"] + "_t1"
    df["gene_name"] = "MT-" + df["gene_id"]
    df["gene_biotype"] = "protein_coding"

    gene_rows = df[df['Feature'] == 'gene'].copy()
    gene_rows['Feature'] = 'transcript'
    df = pd.concat([df, gene_rows], ignore_index=True).sort_values(by=["Start"]).reset_index(drop=True)  
    # Order: gene, transcript, exon
    feature_order = {'gene': 0, 'transcript': 1, 'exon': 2}
    # sort gene_id by sort_key
    df['sort_key'] = df['Feature'].map(feature_order)
    df = df.sort_values(['gene_id', 'sort_key']).drop(columns='sort_key').reset_index(drop=True)

    new_pr = pr.PyRanges(df)
    new_pr.to_gtf(f"./annotate_out_gtf/{sp_name}.gtf")

# %%

gff2gtf("Bombus_terrestris")

# %%

gff2gtf("Harpegnathos_saltator")

# %%

gff2gtf("Monomorium_pharaonis")

# %%

gff2gtf("Lasioglossum_zephyrus")


# %%

# Bter_gff = pr.read_gff3("./annotate_out_gff/Bombus_terrestris.gff")
# Bter_gff

# # %%

# Bter_df = Bter_gff.as_df()
# Bter_df.drop(["Is_circular", "genome", "mol_type", "Frame", "ID", "Score", "gene_id", "Parent"], axis = 1, inplace=True)
# Bter_df.drop(Bter_df.index[0], inplace=True) # The first line contains the complete mitochondrial information and needs to be deleted.
# Bter_df = Bter_df[~(Bter_df["Name"].str.startswith('trn', na=False) | Bter_df["Name"].str.startswith('rrn', na=False))] # remove tRNA & rRNA

# Bter_df = Bter_df.rename(columns={'Name': 'gene_id'})
# Bter_df["transcript_id"] = Bter_df["gene_id"] + "_t1"
# Bter_df["gene_name"] = "MT-" + Bter_df["gene_id"]
# Bter_df["gene_biotype"] = "protein_coding"

# # add transcript in Features column
# Bter_gene_rows = Bter_df[Bter_df['Feature'] == 'gene'].copy()
# Bter_gene_rows['Feature'] = 'transcript'
# Bter_df = pd.concat([Bter_df, Bter_gene_rows], ignore_index=True).sort_values(by=["Start"]).reset_index(drop=True)
# # Order: gene, transcript, exon
# feature_order = {'gene': 0, 'transcript': 1, 'exon': 2}
# # sort gene_id by sort_key
# Bter_df['sort_key'] = Bter_df['Feature'].map(feature_order)
# Bter_df = Bter_df.sort_values(['gene_id', 'sort_key']).drop(columns='sort_key').reset_index(drop=True)
# Bter_df

# # %%

# Bter_pr = pr.PyRanges(Bter_df)
# Bter_pr.to_gtf("./annotate_out_gtf/Bombus_terrestris_pr.gtf")

# # %%
