# Load libraries
library(SingleCellExperiment)
library(Seurat)
library(tidyverse)
library(Matrix)
library(scales)
library(cowplot)
library(RCurl)

# Load Seurat_objects
#change paths to your directory path
load("E://CCCC/PI3K/data/SeuratObjects/unfiltered/Human/unfilteredSeurat_1820_human.Rdata")
load("E://CCCC/PI3K/data/SeuratObjects/unfiltered/Human/unfilteredSeurat_1822_human.Rdata")
load("E://CCCC/PI3K/data/SeuratObjects/unfiltered/Human/unfilteredSeurat_7270_human.Rdata")
load("E://CCCC/PI3K/data/SeuratObjects/unfiltered/Human/unfilteredSeurat_7271_human.Rdata")
load("E://CCCC/PI3K/data/SeuratObjects/unfiltered/Human/unfilteredSeurat_7272_human.Rdata")
load("E://CCCC/PI3K/data/SeuratObjects/unfiltered/Human/unfilteredSeurat_7273_human.Rdata")


# prepare Seurat_objects 
# sample 1820
metadata_1820 <- list_seurat_1820h$`1820`@meta.data
metadata_1820$Cell_Index <- rownames(metadata_1820)
metadata_1820$Cell_Index <- str_remove_all(metadata_1820$Cell_Index, "[Cell_Index]")
metadata_1820$Cell_Index <- paste0("1820_Cell_Index", metadata_1820$Cell_Index)
rownames(metadata_1820) <- metadata_1820$Cell_Index
metadata_1820$orig.ident <- ("1820")

st.1820 <- read_csv("E://CCCC/PI3K/data/SuplementaryFiles/SampleTags/1820_Sample_Tag_Calls.csv", comment = "##") %>% dplyr::select(-Sample_Name)
st.1820$Cell_Index <- paste0("1820_Cell_Index", st.1820$Cell_Index)
rownames(st.1820) <- st.1820$Cell_Index
st.1820$orig.ident <- ("1820")
st.1820$Sample_Tag[which(str_detect(st.1820$Sample_Tag, "SampleTag01_hs"))] <- "Control" #Control_tagged
st.1820$Sample_Tag[which(str_detect(st.1820$Sample_Tag, "Undetermined"))] <- "Control"

metadata1820_merged <- merge(metadata_1820, st.1820, by = c("Cell_Index", "orig.ident"), all.x=TRUE)
rownames(metadata1820_merged) <- metadata1820_merged$Cell_Index
list_seurat_1820h$`1820`@meta.data <- metadata1820_merged


# sample 1822
metadata_1822 <- list_seurat_1822h$`1822`@meta.data
metadata_1822$Cell_Index <- rownames(metadata_1822)
metadata_1822$Cell_Index <- str_remove_all(metadata_1822$Cell_Index, "[Cell_Index]")
metadata_1822$Cell_Index <- paste0("1822_Cell_Index", metadata_1822$Cell_Index)
rownames(metadata_1822) <- metadata_1822$Cell_Index
metadata_1822$Sample_Tag <- c("Alpelisib")
metadata_1822$orig.ident <- ("1822")

list_seurat_1822h$`1822`@meta.data <- metadata_1822


# sample 7270
metadata_7270 <- list_seurat_7270h$`7270`@meta.data
metadata_7270$Cell_Index <- rownames(metadata_7270)
metadata_7270$Cell_Index <- str_remove_all(metadata_7270$Cell_Index, "[Cell_Index]")
metadata_7270$Cell_Index <- paste0("7270_Cell_Index", metadata_7270$Cell_Index)
rownames(metadata_7270) <- metadata_7270$Cell_Index
metadata_7270$orig.ident <- ("7270")

st.7270 <- read_csv("E://CCCC/PI3K/data/SuplementaryFiles/SampleTags/7270_Sample_Tag_Calls.csv", comment = "##") %>% dplyr::select(-Sample_Name)
st.7270$Cell_Index <- paste0("7270_Cell_Index", st.7270$Cell_Index)
rownames(st.7270) <- st.7270$Cell_Index
st.7270$orig.ident <- ("7270")
st.7270$Sample_Tag[which(str_detect(st.7270$Sample_Tag, "SampleTag02_hs"))] <- "Copanlisib"
st.7270$Sample_Tag[which(str_detect(st.7270$Sample_Tag, "SampleTag03_hs"))] <- "Alpelisib"

metadata7270_merged <- merge(metadata_7270, st.7270, by = c("Cell_Index", "orig.ident"), all.x=TRUE)
rownames(metadata7270_merged) <- metadata7270_merged$Cell_Index
list_seurat_7270h$`7270`@meta.data <- metadata7270_merged


#sample 7271
metadata_7271 <- list_seurat_7271h$`7271`@meta.data
metadata_7271$Cell_Index <- rownames(metadata_7271)
metadata_7271$Cell_Index <- str_remove_all(metadata_7271$Cell_Index, "[Cell_Index]")
metadata_7271$Cell_Index <- paste0("7271_Cell_Index", metadata_7271$Cell_Index)
rownames(metadata_7271) <- metadata_7271$Cell_Index
metadata_7271$orig.ident <- ("7271")

st.7271 <- read_csv("E://CCCC/PI3K/data/SuplementaryFiles/SampleTags/7271_Sample_Tag_Calls.csv", comment = "##") %>% dplyr::select(-Sample_Name)
st.7271$Cell_Index <- paste0("7271_Cell_Index", st.7271$Cell_Index)
rownames(st.7271) <- st.7271$Cell_Index
st.7271$orig.ident <- ("7271")
st.7271$Sample_Tag[which(str_detect(st.7271$Sample_Tag, "Undetermined"))] <- "Control" #Control_tagged

metadata7271_merged <- merge(metadata_7271, st.7271, by = c("Cell_Index", "orig.ident"), all.x=TRUE)
rownames(metadata7271_merged) <- metadata7271_merged$Cell_Index
list_seurat_7271h$`7271`@meta.data <- metadata7271_merged


# sample 7272
metadata_7272 <- list_seurat_7272h$`7272`@meta.data
metadata_7272$Cell_Index <- rownames(metadata_7272)
metadata_7272$Cell_Index <- str_remove_all(metadata_7272$Cell_Index, "[Cell_Index]")
metadata_7272$Cell_Index <- paste0("7272_Cell_Index", metadata_7272$Cell_Index)
rownames(metadata_7272) <- metadata_7272$Cell_Index
metadata_7272$Sample_Tag <- c("Control")
metadata_7272$orig.ident <- ("7272")

list_seurat_7272h$`7272`@meta.data <- metadata_7272



#sample 7273
metadata_7273 <- list_seurat_7273h$`7273`@meta.data
metadata_7273$Cell_Index <- rownames(metadata_7273)
metadata_7273$Cell_Index <- str_remove_all(metadata_7273$Cell_Index, "[Cell_Index]")
metadata_7273$Cell_Index <- paste0("7273_Cell_Index", metadata_7273$Cell_Index)
rownames(metadata_7273) <- metadata_7273$Cell_Index
metadata_7273$orig.ident <- ("7273")

st.7273 <- read_csv("E://CCCC/PI3K/data/SuplementaryFiles/SampleTags/7273_Sample_Tag_Calls.csv", comment = "##") %>% dplyr::select(-Sample_Name)
st.7273$Cell_Index <- paste0("7273_Cell_Index", st.7273$Cell_Index)
rownames(st.7273) <- st.7273$Cell_Index
st.7273$orig.ident <- ("7273")
st.7273$Sample_Tag[which(str_detect(st.7273$Sample_Tag, "SampleTag03_hs"))] <- "Copanlisib"
st.7273$Sample_Tag[which(str_detect(st.7273$Sample_Tag, "Undetermined"))] <- "Control"
st.7273$Sample_Tag[which(str_detect(st.7273$Sample_Tag, "SampleTag02_hs"))] <- "Alpelisib"

metadata7273_merged <- merge(metadata_7273, st.7273, by = c("Cell_Index", "orig.ident"), all.x=TRUE)
rownames(metadata7273_merged) <- metadata7273_merged$Cell_Index
list_seurat_7273h$`7273`@meta.data <- metadata7273_merged


##merged objects
merged_seurat <- merge(x = list_seurat_1820h[[1]], 
                       y = c(list_seurat_1822h[[1]],list_seurat_7270h[[1]],list_seurat_7271h[[1]],list_seurat_7272h[[1]],list_seurat_7273h[[1]]),
                       add.cell.ids = c("1820", "1822", "7270", "7271", "7272", "7273"), project = "HNSCC")

# Add number of genes per UMI for each cell to metadata
merged_seurat$log10GenesPerUMI <- log10(merged_seurat$nFeature_RNA) / log10(merged_seurat$nCount_RNA)

metadata_merged <- merged_seurat@meta.data

metadata_merged <- metadata_merged %>% 
  dplyr::rename(Xenograft = orig.ident,
                nUMI = nCount_RNA,
                nGene = nFeature_RNA)

metadata_merged["Xenograft"][metadata_merged["Xenograft"] == "1820"] <- "HN15239A_Control"
metadata_merged["Xenograft"][metadata_merged["Xenograft"] == "1822"] <- "HN15239A_Alpelisib"
metadata_merged["Xenograft"][metadata_merged["Xenograft"] == "7270"] <- "HN11097_treated"
metadata_merged["Xenograft"][metadata_merged["Xenograft"] == "7271"] <- "HN11097_Control"
metadata_merged["Xenograft"][metadata_merged["Xenograft"] == "7272"] <- "HN10960"
metadata_merged["Xenograft"][metadata_merged["Xenograft"] == "7273"] <- "HN10621"


merged_seurat@meta.data <- metadata_merged

save(merged_seurat, file="E://CCCC/PI3K/data/SeuratObjects/merged/Human/merged_seurat.RData")
