



setwd("C:/Lazarus/LZD/AMREF/JIVIS/ATLO")


xfun::pkg_attach(c('boot','car','caret','coin','correlation','corrplot','dplyr',
'epitools','factoextra','FactoMineR','finalfit', 'flextable','gapminder','ggfortify',	
'ggplot2','ggmap','ggpubr','gplots','ggsurvfit','gridExtra','gtsummary','haven','HH','InformationValue',
'irr','janitor','ISLR','ISwR','labelled','leaflet','learnr',	
'lessR','likert','magrittr','MASS','multcomp','nlme','nnet','officer','OpenImageR','osmdata',
'PerformanceAnalytics','psych','questionr','R2wd','RColorBrewer',	
'rcompanion','readr','rvg','likert','lsmeans','pls','pscl','pwr','readxl','reshape2',
'rmarkdown','rnaturalearth','robustbase','rstatix','table1','terra', 'tigris', 'tmap',
'RVAideMemoire','sf','scales','smd','survminer','tidycmprsk','tidyverse','tinytex','vcd','xfun','yaml',
'forestmodel'
))

list.files()

joy=read_sav("hiv1.sav")

joy$current_hiv_enrollment_stat=factor(joy$current_hiv_enrollment_stat, levels=c(0,1), labels=c("Not Enrolled", "Enrolled"))


joy1=subset(joy, select=-c(needle_exchange_programs, UptakeScore))

View(joy1)


p01=joy1 %>%
  tbl_summary(
    by = current_hiv_enrollment_stat, 
    statistic = list(
      all_continuous() ~ "{median} ({p0}, {p100})", 
      all_categorical() ~ "{n} ({p}%)"
    ), 
    percent = "col", 
    missing = "no"
  ) %>%
  add_overall() %>%
  add_p(pvalue_fun = ~style_pvalue(.x, digits = 2)) %>%
  modify_footnote(all_stat_cols() ~ "Median (Min - Max)") %>%
  modify_spanning_header(c("stat_1", "stat_2") ~ "**Uptake of HIV Services**") %>%
  modify_caption("Table 1: Characteristics of MSM Participants in Embu County, Kenya, Nov-Dec 2023") %>%
  bold_labels() %>%
  add_n() %>%
  as_flex_table()


sect_properties <- prop_section(page_size = page_size(orient = "landscape"))#, width = 8.3, height = 11.7)
save_as_docx(p01,path="Bivariate_ATLO2.docx", pr_section = sect_properties)


explanatory = c(
"age_of_interviewee",
"sub_county",
"abstinence",
"condoms",
"prep",
"regular_testing",
"monogamy",
"awareness",
"treatment_as_prevention",
"pep",
"male_circumcision",
"hiv_program_comfortability",
"improved_access_to_testing",
"increased_availability_of_ART",
"mental_health_support",
"prevention_education_highrisk",
"integration_hiv_other_care",
"comprehensive_support_services",
"increased_research_funding",
"enhanced_community_outreach",
"improved_cultural_competence",
"expanded_peer_networks",
"satisfaction_rate",
"strengthen_hiv_prevention",
"improve_hiv_testing",
"enhance_treatment_services",
"target_vulnerable_populations",
"strengthen_data_collection",
"foster_collaboration_partners",
"address_social_determinants"
)

explanatory1 = c(
"age_of_interviewee",
#"sub_county",
#"abstinence",
"condoms",
"prep",
"regular_testing",
#"monogamy",
"awareness",
"treatment_as_prevention",
#"pep",
"male_circumcision",
"hiv_program_comfortability",
"improved_access_to_testing",
#"increased_availability_of_ART",
"mental_health_support",
"prevention_education_highrisk",
##"integration_hiv_other_care",
##"comprehensive_support_services",
"increased_research_funding",
"enhanced_community_outreach",
"improved_cultural_competence",
"expanded_peer_networks",
"satisfaction_rate",
#"strengthen_hiv_prevention",
"improve_hiv_testing",
"enhance_treatment_services",
"target_vulnerable_populations",
"strengthen_data_collection",
#"foster_collaboration_partners",
"address_social_determinants"
)
dependent = 'current_hiv_enrollment_stat'


flextable(joy1 %>% finalfit(dependent, explanatory1, dependent_label_prefix = ":Uptake of HIV Services"))

p03=flextable(joy1 %>% finalfit(dependent, explanatory1, dependent_label_prefix = "Uptake of HIV Services: "))
p03<- set_caption(p03, "Table 2: Predictors of HIV Services Uptake among MSM Participants in Embu County, Kenya, Nov-Dec 2023.")
p03<- add_footer_lines(p03, "OR = Odds Ratio, HIV = Human Immunodeficiency Virus, PrEP=Pre-exposure Prophylaxis,")
p03<- theme_vanilla(p03)
p03<-set_table_properties(p03, width = 0.8, layout = "autofit")
p03

sect_properties <- prop_section(page_size = page_size(orient = "landscape"))#, width = 8.3, height = 11.7)
save_as_docx(p03,path="UniMaltivariateATLO1.docx", pr_section = sect_properties, layout = "autofit")


# Forest plot of Pediatric TB Participants ----
joy1 %>% or_plot(dependent, explanatory1, remove_ref = TRUE, , table_text_size = 4, title_text_size = 18,
dependent_label = "Predictors of HIV Services Uptake", prefix = "Forest Plot: - ", suffix = "")



