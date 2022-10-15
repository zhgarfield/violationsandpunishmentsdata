# Introduction ----------------------------------------------------------
### Data package processing script for:
# title: "Norm violations and punishments across human societies"
# authors: "Zachary H. Garfield^1ª^, Erik J. Ringen^2^, William Buckner^3^, Dithapelo Medupe^4^, Richard W. Wrangham^5^, & Luke Glowacki^3ª^"
#^1^ Institute for Advanced Study in Toulouse, Université de Toulouse 1 Capitole, Toulouse, France; 
#^2^ Department of Anthropology, Emory University, Atlanta, GA, USA;
# ^3^ Department of Anthropology,  Boston University, Boston, MA, USA; 
# ^4^ Department of Anthropology, Pennsylvania State University, PA, USA; 
# ^5^ Human Evolutionary Biology, Harvard University, Cambridge, MA, USA
# ^ª^ Corresponding authors

# Load libraries ----------------------------------------------------------
library(tidyverse)
library(readxl)
library(phytools)

# Read data files --------------------------------------------------------

d_org <- read_xlsx("data-raw/Punishement coding by Buckner Rosen_eHRAF_SCCS_Coding ZG CLEANED.xlsx", na = "")
# Remove rows for Palauans and Aztecs as there are no ethnographic documents for them. 
d_org <- d_org %>%
  filter(!d_org$SCCS_NAME == c("Aztec","Palauans"))

d <- d_org

## Read document data
d_doc <- read.csv("data-raw/document_meta_data - document_meta_data_COMPLETED.csv")


# Data management ---------------------------------------------------------

# Create vars names list
vars <- names(d)[c(4:8,10:14,16:20,22:26,28:32)]

# Create violations named list
vars_viol <- d %>% 
  dplyr::select(contains("viol")) %>% 
  names()

# Create sanctions named list
vars_SN <- d %>% 
  dplyr::select(contains(c("Exec", "Material", "Phys", "Rep"))) %>% 
  names()

vars_SN_nice <- c("Execution", "Material", "Physical", "Reputational")

# Create nice names
nice_names <- c(
  "Religion_viol" = "Religious",
  "Adultery_viol" = "Adultery",
  "Rape_viol"       = "Rape",
  "War_viol" = "Warfare",
  "Food_viol" = "Food",
  "Reputation_SN_present" = "Reputational",
  "Material_SN_present" = "Material",
  "Physical_SN_present" = "Physical",
  "Execution_SN_present" = "Execution"
)


# Document data -----------------------------------------------------------

## Read data for meta-ethnographic bias assessment
library(readxl)
d_documents <- read.csv("data-raw/document_meta_data - document_meta_data_COMPLETED.csv")


# Create generalized sanction data ----------------------------------------

d$Religion_SN_present <- 0
d$Religion_SN_present[d$Religion_Rep_SN!="0"]=1
d$Religion_SN_present[d$Religion_Exec_SN!="0"]=1
d$Religion_SN_present[d$Religion_Phys_SN!="0"]=1
d$Religion_SN_present[d$Religion_Material_SN!="0"]=1
d$Religion_SN_present[d$Religion_Other_SN!="0"]=1

d$Adultery_SN_present <- 0
d$Adultery_SN_present[d$Adultery_Rep_SN!="0"]=1
d$Adultery_SN_present[d$Adultery_Exec_SN!="0"]=1
d$Adultery_SN_present[d$Adultery_Phys_SN!="0"]=1
d$Adultery_SN_present[d$Adultery_Material_SN!="0"]=1
d$Adultery_SN_present[d$Adultery_Other_SN!="0"]=1


d$Food_SN_present <- 0
d$Food_SN_present[d$Food_Rep_SN!="0"]=1
d$Food_SN_present[d$Food_Exec_SN!="0"]=1
d$Food_SN_present[d$Food_Phys_SN!="0"]=1
d$Food_SN_present[d$Food_Material_SN!="0"]=1
d$Food_SN_present[d$Food_Other_SN!="0"]=1


d$Rape_SN_present <- 0
d$Rape_SN_present[d$Rape_Rep_SN!="0"]=1
d$Rape_SN_present[d$Rape_Exec_SN!="0"]=1
d$Rape_SN_present[d$Rape_Phys_SN!="0"]=1
d$Rape_SN_present[d$Rape_Material_SN!="0"]=1
d$Rape_SN_present[d$Rape_Other_SN!="0"]=1


d$War_SN_present <- 0
d$War_SN_present[d$War_Rep_SN!="0"]=1
d$War_SN_present[d$War_Exec_SN!="0"]=1
d$War_SN_present[d$War_Phys_SN!="0"]=1
d$War_SN_present[d$War_Material_SN!="0"]=1
d$War_SN_present[d$War_Other_SN!="0"]=1

d$Execution_SN_present <- 0
d$Execution_SN_present[d$Food_Exec_SN!="0"]=1
d$Execution_SN_present[d$War_Exec_SN!="0"]=1
d$Execution_SN_present[d$Rape_Exec_SN!="0"]=1
d$Execution_SN_present[d$Religion_Exec_SN!="0"]=1
d$Execution_SN_present[d$Adultery_Exec_SN!="0"]=1

d$Reputation_SN_present <- 0
d$Reputation_SN_present[d$Rape_Rep_SN!="0"]=1
d$Reputation_SN_present[d$Religion_Rep_SN!="0"]=1
d$Reputation_SN_present[d$War_Rep_SN!="0"]=1
d$Reputation_SN_present[d$Food_Rep_SN!="0"]=1
d$Reputation_SN_present[d$Adultery_Rep_SN!="0"]=1

d$Material_SN_present <- 0
d$Material_SN_present[d$War_Material_SN!="0"]=1
d$Material_SN_present[d$Food_Material_SN!="0"]=1
d$Material_SN_present[d$Rape_Material_SN!="0"]=1
d$Material_SN_present[d$Adultery_Material_SN!="0"]=1
d$Material_SN_present[d$Religion_Material_SN!="0"]=1

d$Physical_SN_present <- 0
d$Physical_SN_present[d$War_Phys_SN!="0"]=1
d$Physical_SN_present[d$Food_Phys_SN!="0"]=1
d$Physical_SN_present[d$Rape_Phys_SN!="0"]=1
d$Physical_SN_present[d$Adultery_Phys_SN!="0"]=1
d$Physical_SN_present[d$Religion_Phys_SN!="0"]=1

#list of just sanction present vars
vars_SN_present <- c("Reputation_SN_present", 
                     "Physical_SN_present",
                     "Execution_SN_present",
                     "Material_SN_present")


# Sanctions data ----------------------------------------------------------

## Create version with out sub-coding and remove evidence against
### Recode
d <- d %>% 
  dplyr::select(-c(HRAF_ID,SCCS_NAME,EHRAF_NAME)) %>% 
  mutate_all(as.character) %>% 
  mutate_all(funs(str_replace(., "1t", "1"))) %>% 
  mutate_all(funs(str_replace(., "1c", "1"))) %>%
  mutate_all(funs(str_replace(., "1ca", "1"))) %>%
  mutate_all(funs(str_replace(., "1a", "1"))) %>% 
  mutate_all(funs(str_replace(., "1v", "1"))) %>% 
  mutate_all(funs(str_replace(., "1n", "1"))) %>% 
  mutate_all(funs(str_replace(., "1n, 1c", "1"))) %>% 
  mutate_all(funs(str_replace(., "1n, 1t", "1"))) %>% 
  mutate_all(funs(str_replace(., "1n, 2", "1"))) %>% 
  mutate_all(funs(str_replace(., "1n, 1", "1"))) %>% 
  mutate_all(funs(str_replace(., "1 1,", "1"))) %>% 
  mutate_all(funs(str_replace(., "1, 1", "1"))) %>% 
  mutate_all(funs(str_replace(., "2", "0"))) %>% 
  mutate_all(funs(str_replace(., "1, 0", "1"))) %>% 
  mutate_all(as.numeric)

#ADD ID back
d$HRAF_ID <- d_org$HRAF_ID
d$SCCS_NAME <-d_org$SCCS_NAME
d$EHRAF_NAME <- d_org$EHRAF_NAME

# Create a sum of coding measure
d$viol_count <- rowSums(d[vars_viol])
d$SN_count <- rowSums(d[vars_SN])

# Remove all codings of "Other"
d <- d %>% 
  select(-contains("Other"))

# Create data frame of sanction variables
d_SN_basic <- d[,c("HRAF_ID", vars_SN)]

# Create long  
d_SN_long <- gather(d_SN_basic, key = Variable, value = Coding, -"HRAF_ID") 

# Separate string to make variables
d_SN_long$Domain <- str_extract(d_SN_long$Variable, "[^_]+")
d_SN_long$Sanction <- word(d_SN_long$Variable, 2, sep = "_")

# Select columns
d_SN_long <- d_SN_long %>% 
  select(c("HRAF_ID",
           "Coding",
           "Domain",
           "Sanction"))


# Recode sanctions coding
d_SN_long$Coding_label <- NA
d_SN_long$Coding_label[d_SN_long$Coding=="0"] = "No evidence"
d_SN_long$Coding_label[d_SN_long$Coding=="1"] = "Evidence for"

# Recode sanction value labels
d_SN_long$Sanction[d_SN_long$Sanction=="Exec"] = "Execution"
d_SN_long$Sanction[d_SN_long$Sanction=="Phys"] = "Physical"
d_SN_long$Sanction[d_SN_long$Sanction=="Rep"] = "Reputational"

# Create sanction category totals
d_SN_long_totals <- d_SN_long %>% 
  filter(Coding==1) %>% 
  group_by(Domain, Sanction) %>% 
  count()

d_SN_long_totals <- d_SN_long_totals %>% 
  arrange(desc(n))


#Create wide version for fitting model
## Remove coding label column
d_SN_long_tmp <- d_SN_long %>% 
  select(-Coding_label)

# Spread to wide 
d_SN_wide_fit <- spread(data = d_SN_long_tmp, key = Sanction, value = Coding)


# Violations data ---------------------------------------------------------

# Create data frame of sanctions variables
d_viol <- d[,c("HRAF_ID", vars_viol)]

# Wide format
d_viol_wide <- gather(d_viol, key = Violation, value = Coding, -"HRAF_ID") 
#d_viol_wide <- d_viol_wide[!d_viol_wide$Coding=="0",]

# Reformat Violation coding
d_viol_wide$Violation <- str_extract(d_viol_wide$Violation, "[^_]+")


# Culture level data ------------------------------------------------------

#Add culture-level data
d_culture <- read_xlsx("data-raw/eHRAF-World-Cultures_All.xlsx", sheet = 1)
d_culture$HRAF_ID <- d_culture$`OWC Code`

# Read SCCS data
load("data-raw/sccs.RData")
sccs <- data.frame(sccs)
sccs$SCCS_ID <- sccs$SCCS.

d_sccs_vars <- sccs %>% 
  select(SCCS_ID, V1, V5, V9, V20, V63, V158, V158.1, V1082, V1716, V1732, V1733)

# Recode SCCS vars
d_sccs_vars <- d_sccs_vars %>% 
  mutate(External_trade = recode_factor(V1, 
                                        `No Trade` = "Minimal/Absent",
                                        `No Food Imports` = "Minimal/Absent",
                                        `Salt & Minerals only` = "Minimal/Absent",
                                        `< 10% of Food` = "Minimal/Absent",
                                        `< 50% of Food/less local source` = "Present",
                                        `> 50% of Food` = "Present"),
         Amnimal_husbandry = factor(V5, levels = c("None",
                                                   "Present, not food source",
                                                   "< 10% Food Supply",
                                                   "< 50% chiefly meat",
                                                   "< 50% chiefly dairy",
                                                   "> 50%"),
                                    ordered = T),
         Hunting = factor(V9, levels = c("None",
                                         "Not food source",
                                         "< 10% Food Supply",
                                         "< 50% < single source",
                                         "< 50% > single source",
                                         "> 50%"),
                          ordered = TRUE),
         Food_storage = recode_factor(V20,
                                      `None` = "Absent",
                                      `Economic agent controlled` = "Present",
                                      `Political agent controlled` = "Present",
                                      `Communal facilities` = "Present",
                                      `Individual households` = "Present"),
         Community_size = factor(V63, levels = c("< 50",
                                                 "50-99",
                                                 "100-199",
                                                 "200-399",
                                                 "400-999",
                                                 "1,000-4,999",
                                                 "5,000-49,999",
                                                 "> 50,000"),
                                 ordered = TRUE
         ),
         Social_stratification = recode_factor(V158, 
                                               `Egalitarian` = "Egalitarian",
                                               `2 social classes, no castes/slavery` = "Stratified",
                                               `Hereditary slavery` = "Stratified",
                                               `2 social classes, castes/slavery` = "Stratified",
                                               `3 social classes or castes, w/ or w/out slavery` = "Stratified"),
         Wage_labor_introduced = factor(V1082),
         Primary_subsistence = recode_factor(V1716, 
                                             `wage labor` = "Commercial economy",
                                             `trade` = "Commercial economy",
                                             `gathering` = "Foraging",
                                             `hunting` = "Foraging",
                                             `fishing` = "Foraging",
                                             `animal husbandary` = "Animal husbandary",
                                             `extensive agriculture` = "Agriculture",
                                             `intensive agriculture` = "Agriculture"),
         Wage_labor_present = recode_factor(V1732,
                                            `no wage labor` = "Absent",
                                            `wage labor, mainly in form of migratory labor` = "Present",
                                            `wage labor present, migratory labor unimportant` = "Present"
         )
  )

# Add SCCS ID to culture data
d_sccs_ehraf_ID <- read_csv("data-raw/ehraf_sccs_ids.csv")
d_sccs_ehraf_ID$HRAF_ID <- d_sccs_ehraf_ID$`OWC Code`
d_sccs_ehraf_ID$SCCS_ID <- d_sccs_ehraf_ID$`SCCS ID`
d_culture <- left_join(d_culture, d_sccs_ehraf_ID)

# Add sccs vars to culture data
d_culture <- left_join(d_culture, d_sccs_vars)


d_all <- left_join(d, d_culture)
d_viol <- left_join(d_viol, d_culture)


# Map data ----------------------------------------------------------------

# Read in coordinate data
d_location <- read_csv("data-raw/location_data_complete.csv")

# Create data frame for map plotting
d_map <- left_join(d_all, d_location, by = "HRAF_ID")


# Exporting data for phylogenetic analysis ------------------------------------------------------
d_sanctions <- d_all %>% 
  select( c(SCCS_NAME, EHRAF_NAME, SCCS_ID, Reputation_SN_present, Material_SN_present, Physical_SN_present, Execution_SN_present, Food_storage, Community_size, External_trade))

## Bring in SCCS codebook
d_SCCS <- read_csv("data-raw/SCCS-var1-2000.csv")[-187,]
d_SCCS <- d_SCCS %>% select(c("sccs#","v158","v9", "v5"))

# Join with sanctions data
d_sanctions <- left_join(d_sanctions, d_SCCS, by = c("SCCS_ID" = "sccs#")) %>% mutate(
  soc_strat = dplyr::recode(v158, `1` = 1, `2` = 2, `3` = 3, `4` = 3, `5` = 3),
  storage = dplyr::recode(Food_storage, `Absent` = 0, `Present` = 1),
  husb = dplyr::recode(v5, `1` = 1, `2` = 2, `3` = 3, `4` = 4,`5` = 4, `6` = 4, `7` = 5),
  hunt = dplyr::recode(v9, `1` = 1, `3` = 2, `4` = 3, `5` = 4, `6` = 5),
  comm_size = dplyr::recode(Community_size, `< 50` = 1, `50-99` = 2, `100-199` = 3, `200-399` = 4, `400-999` = 5, `1,000-4,999` = 6, `5,000-49,999` = 7, `> 50,000` = 8),
  trade = dplyr::recode(External_trade, `Minimal/Absent` = 0, `Present` = 1)
)



# Read in phylo tree
tree <- read.nexus("data-raw/sccs_supertree.nex")

# SCCS ID, sorted by order they appear in the phylo tree
tree_order <- read_csv("data-raw/phylo_order.csv")

# Add missing SCCS IDs
d_sanctions$SCCS_ID[d_sanctions$SCCS_NAME == "Khalka Mongols"] <- 66
d_sanctions$SCCS_ID[d_sanctions$SCCS_NAME == "New Ireland"] <- 97
d_sanctions$SCCS_ID[d_sanctions$SCCS_NAME == "Yurak Samoyed"] <- 53
d_sanctions$SCCS_ID[d_sanctions$SCCS_NAME == "Aztec"] <- 153

# Give tree-matching names based on SCCS ID
d_sanctions$tree_name <- tree_order$socname[match(d_sanctions$SCCS_ID, tree_order$sccs.)]

# Drop tips of tree that are not in this dataset
tree <- drop.tip(tree, subset(tree$tip.label, !(tree$tip.label %in% d_sanctions$tree_name)))

# Put dataframe in order of phylogeny
d_sanctions <- d_sanctions[match(tree$tip.label, d_sanctions$tree_name),]

# Export for analysis
analysis_data <- select(d_sanctions, -c(Food_storage, Community_size, External_trade, v158,v9,v5))
write.tree(tree, "data-raw/pruned_tree.tre")
tree <- read.tree("data-raw/pruned_tree.tre")



# Data package objects ----------------------------------------------------

usethis::use_data(d_doc, d_sanctions, d_SN_long, analyses_data, tree, overwrite = T)


