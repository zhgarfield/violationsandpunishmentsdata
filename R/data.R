#' @title violations and punishments data
#' @description Primary data set of researcher-coded punishment types, SCCS socioecological predictor variables, and phylogenetic tree.
#' @format A data frame with 131 rows and 14 variables:
#' \describe{
#'   \item{\code{SCCS_NAME}}{character SCCS culture name associated with ethnographic document.}
#'   \item{\code{EHRAF_NAME}}{character HRAF culture name associated with ethnographic document.}
#'   \item{\code{SCCS_ID}}{double SCCS identificaiton number of society associated with ethnographic document.}
#'   \item{\code{Rape_viol}}{double Evidence for a violation of norms against rape.}
#'   \item{\code{Rape_SN_present}}{double Evidence for punishment of a violation of norms against rape.}
#'   \item{\code{War_viol}}{double Evidence for violation of norms against war cowardice.}
#'   \item{\code{War_SN_present}}{double Evidence for punishment of a violation of norms against war cowardice.}
#'   \item{\code{Religion_viol}}{double Evidence for violation of religous norms.}
#'   \item{\code{Religion_SN_present}}{double Evidence for punishment of a violation of religous norms.}
#'   \item{\code{Food_viol}}{double Evidence for a violation of food related or food sharing norms.}
#'   \item{\code{Food_SN_present}}{double Evidence for punishment of a violation of food related or food sharing norms.}
#'   \item{\code{Adultery_viol}}{double Evidence for a violation of norms against adultry.}
#'   \item{\code{Adultery_SN_present}}{double Evidence for punishment of a violation of norms against adultry.}
#'   \item{\code{Reputation_SN_present}}{double Evidence of reputational sanctions, where reputations sanctions are generally expected or specific instance of community endorsed reputational damage (more than gossip, results in net cost or general devaluation of violator). Coded as 1 for evidence for, 0 for no evidence.}
#'   \item{\code{Material_SN_present}}{double Generally expected or specific instance of community endorsed outcome that imposes direct economic or material costs on violator as a result of their violation. Coded as 1 for evidence for, 0 for no evidence.}
#'   \item{\code{Physical_SN_present}}{double Generally expected or specific instance of community endorsed outcome that results in a specific instance of physical harm or restraint as a result of their violation (not revenge). Coded as 1 for evidence for, 0 for no evidence.}
#'   \item{\code{Execution_SN_present}}{double Generally expected or specific instance of community endorsed outcome that results in the death of the violator as a result of their violation (not murder). Coded as 1 for evidence for, 0 for no evidence.}
#'   \item{\code{soc_strat}}{double Recoded SCCS V158 Social stratification. Coded as 1 for "Stratified", 0 for "Egalitarian".}
#'   \item{\code{storage}}{double Recoded SCCS V20 Food storage. Coded as 1 for present, 0 for absent.}
#'   \item{\code{husb}}{double Recoded SCCS V5 Animal husbandry - contribution to food supply. Coded as 1 for "None", 2 for "Present, not food source", 3 for "< 10% Food Supply", 4 for "< 50% Food supply", and 5 for "> 50% Food supply".}
#'   \item{\code{hunt}}{double Recoded SCCS V9 Hunting - contribution to food supply. Coded as 1 for "None", 2 for "< 10% of Food supply", 3 for "<50%,andlessthan any other single source", 4 for "<50%,andmorethan any other single source", 5 for ">50%".}
#'   \item{\code{comm_size}}{double Recoded SCCS V63 Community size. Coded as 1 for "< 50", 2 for "50-99", 3 for "100-199", 4 for "200-399", 5 for "400-999", 6 for "1,000-4,999", 7 for "5,000-49,999", and 8 for "> 50,000".}
#'   \item{\code{trade}}{double Recoded SCCS V1 Intercommunity trade as food source. Coded as 0 for "Minimal/Absent", 1 for "Present".}
#'   \item{\code{tree_name}}{character Phylogenetic tree name.}
#'}
"violpundata"

#' @title punishments data (long form)
#' @description A long-form version of the data of norm violation, punishments, and codings for all cultures.
#' @format A data frame with 2620 rows and 5 variables:
#' \describe{
#'   \item{\code{HRAF_ID}}{character HRAF OWC Culture ID.}
#'   \item{\code{Coding}}{double Coding for culture by variable. Coded as 1 for evidence for, 0 for no evidence.}
#'   \item{\code{Domain}}{character Domain of norm violation type being coded.}
#'   \item{\code{Sanction}}{character Punishment type being coded.}
#'   \item{\code{Coding_label}}{character Coding for culture by varable, with text as label.}
#'}
#'
"punishments_data_long"

#' @title culture map data
#' @description A data frame for producing a map of societies in the sample.
#' @format A data frame with 131 rows and 4 variables:
#' \describe{
#'   \item{\code{HRAF_ID}}{character HRAF OWC Culture ID.}
#'   \item{\code{Subsistence Type}}{character HRAF subsistence type for society.}
#'   \item{\code{latitude}}{double Latitude for society location.}
#'   \item{\code{longitude}}{double Longitude for society location.}
#'}
#'
"culturemapdata"

#' @title document data
#' @description A data frame of document-level metadata.
#' @format A data frame with 131 rows and 6 variables:
#' \describe{
#'   \item{\code{EHRAF_NAME}}{character eHRAF culture name.}
#'   \item{\code{document_ID}}{character eHRAF document ID for document.}
#'   \item{\code{culture_ID}}{double eHRAF OWC ID for culture.}
#'   \item{\code{document_publication_date}}{integer Document publication year.}
#'   \item{\code{document_page_count}}{integer Documentn page count.}
#'   \item{\code{female_coauthor_present}}{integer Presence of a female author or co-author. Coded as 1 for present, 0 for absent.}
#'   \item{\code{tree_order}}{integer Order of societies in phylogentic tree.}
#'}
#'
"documentdata"

#' @title phylogenetic tree
#' @description A phylogentic tree in list form consisting of 254 edges.
#' @format A list of four vectors.
#
#'
"tree"

