% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{violpundata}
\alias{violpundata}
\title{violations and punishments data}
\format{
A data frame with 131 rows and 14 variables:
\describe{
\item{\code{SCCS_NAME}}{character SCCS culture name associated with ethnographic document.}
\item{\code{EHRAF_NAME}}{character HRAF culture name associated with ethnographic document.}
\item{\code{SCCS_ID}}{double SCCS identificaiton number of society associated with ethnographic document.}
\item{\code{Rape_viol}}{double Evidence for a violation of norms against rape.}
\item{\code{Rape_SN_present}}{double Evidence for punishment of a violation of norms against rape.}
\item{\code{War_viol}}{double Evidence for violation of norms against war cowardice.}
\item{\code{War_SN_present}}{double Evidence for punishment of a violation of norms against war cowardice.}
\item{\code{Religion_viol}}{double Evidence for violation of religous norms.}
\item{\code{Religion_SN_present}}{double Evidence for punishment of a violation of religous norms.}
\item{\code{Food_viol}}{double Evidence for a violation of food related or food sharing norms.}
\item{\code{Food_SN_present}}{double Evidence for punishment of a violation of food related or food sharing norms.}
\item{\code{Adultery_viol}}{double Evidence for a violation of norms against adultry.}
\item{\code{Adultery_SN_present}}{double Evidence for punishment of a violation of norms against adultry.}
\item{\code{Reputation_SN_present}}{double Evidence of reputational sanctions, where reputations sanctions are generally expected or specific instance of community endorsed reputational damage (more than gossip, results in net cost or general devaluation of violator). Coded as 1 for evidence for, 0 for no evidence.}
\item{\code{Material_SN_present}}{double Generally expected or specific instance of community endorsed outcome that imposes direct economic or material costs on violator as a result of their violation. Coded as 1 for evidence for, 0 for no evidence.}
\item{\code{Physical_SN_present}}{double Generally expected or specific instance of community endorsed outcome that results in a specific instance of physical harm or restraint as a result of their violation (not revenge). Coded as 1 for evidence for, 0 for no evidence.}
\item{\code{Execution_SN_present}}{double Generally expected or specific instance of community endorsed outcome that results in the death of the violator as a result of their violation (not murder). Coded as 1 for evidence for, 0 for no evidence.}
\item{\code{soc_strat}}{double Recoded SCCS V158 Social stratification. Coded as 1 for "Stratified", 0 for "Egalitarian".}
\item{\code{storage}}{double Recoded SCCS V20 Food storage. Coded as 1 for present, 0 for absent.}
\item{\code{husb}}{double Recoded SCCS V5 Animal husbandry - contribution to food supply. Coded as 1 for "None", 2 for "Present, not food source", 3 for "< 10\% Food Supply", 4 for "< 50\% Food supply", and 5 for "> 50\% Food supply".}
\item{\code{hunt}}{double Recoded SCCS V9 Hunting - contribution to food supply. Coded as 1 for "None", 2 for "< 10\% of Food supply", 3 for "<50\%,andlessthan any other single source", 4 for "<50\%,andmorethan any other single source", 5 for ">50\%".}
\item{\code{comm_size}}{double Recoded SCCS V63 Community size. Coded as 1 for "< 50", 2 for "50-99", 3 for "100-199", 4 for "200-399", 5 for "400-999", 6 for "1,000-4,999", 7 for "5,000-49,999", and 8 for "> 50,000".}
\item{\code{trade}}{double Recoded SCCS V1 Intercommunity trade as food source. Coded as 0 for "Minimal/Absent", 1 for "Present".}
\item{\code{tree_name}}{character Phylogenetic tree name.}
}
}
\usage{
violpundata
}
\description{
Primary data set of researcher-coded punishment types, SCCS socioecological predictor variables, and phylogenetic tree.
}
\keyword{datasets}
