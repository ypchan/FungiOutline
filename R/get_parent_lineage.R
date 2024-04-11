get_parent_lineage <- function(group_label, deepth=0) {
    # load outline table
    outline <- read_excel(system.file("data", "outline.xlsx", package = "FungiOutline"))
    # remove useless white spaces in string
    group_label <- trimws(group_label)
    
    # check lable level
    label_level <- "genus"
    if ( grepl(group_label, "aceae$") ) {
        label_level <- "family" 
    }
    if ( grepl(group_label, "ales$") ) {
        label_level <- "order" 
    }
    if ( grepl(group_label, "mycetidae$") ) {
        label_level <- "subclass" 
    }
    if ( grepl(group_label, "mycetes$") ) {
        label_level <- "class" 
    }
    if ( grepl(group_label, "mycotina$") ) {
        label_level <- "subphylum" 
    }
    if ( grepl(group_label, "mycota$") ) {
        label_level <- "phylum" 
    }
    
    # get lineage tbl
    if ( label_level == "genus" ) {
        lineage_info <- outline %>% filter(Current_genus == group_label) %>% 
            distinct(Current_genus, .keep_all = TRUE) %>%
            select(Kingdom, Phylum, Subphylum, Class, Subclass_current, Order_current, Family_current) %>%
            mutate(lineage=paste(Kingdom, Phylum, Subphylum, Class, Subclass_current, Order_current, Family_current, sep = ", ")) %>%
            select(lineage) %>% pull()
    }
    if ( label_level == "family" ) {
        lineage_info <- outline %>% filter(Current_family == group_label) %>% 
            distinct(Current_family, .keep_all = TRUE) %>%
            mutate(lineage=paste(Kingdom, Phylum, Subphylum, Class, Subclass_current, Order_current, sep = ", ")) %>%
            select(lineage) %>% pull()
    }
    if ( label_level == "order" ) {
        lineage_info <- outline %>% filter(Current_order == group_label) %>% 
            distinct(Current_order, .keep_all = TRUE) %>%
            mutate(lineage=paste(Kingdom, Phylum, Subphylum, Class, Subclass_current, sep = ", ")) %>%
            select(lineage) %>% pull()
    }
    if ( label_level == "subclass" ) {
        lineage_info <- outline %>% filter(Current_subclass == group_label) %>% 
            distinct(Current_subclass, .keep_all = TRUE) %>%
            mutate(lineage=paste(Kingdom, Phylum, Subphylum, Class, sep = ", ")) %>%
            select(lineage) %>% pull()
    }
    if ( label_level == "class" ) {
        lineage_info <- outline %>% filter(Current_class == group_label) %>% 
            distinct(Current_class, .keep_all = TRUE) %>%  
            mutate(lineage=paste(Kingdom, Phylum, Subphylum, sep = ", ")) %>%
            select(lineage) %>% pull()
           
    }
    if ( label_level == "subphylum" ) {
        lineage_info <- outline %>% filter(Current_subphylun == group_label) %>% 
            distinct(Current_subphylun, .keep_all = TRUE) %>%  
            mutate(lineage=paste(Kingdom, Phylum, sep = ", ")) %>%
            select(lineage) %>% pull()
            
    }
    if ( label_level == "phylum" ) {
        lineage_info <- outline %>% filter(Current_phylum == group_label) %>% 
            distinct(Current_phylum, .keep_all = TRUE) %>%
            mutate(lineage=paste(Kingdom, Phylum, sep = ", ")) %>%
            select(lineage) %>% pull()
    }
    
    # output
    if (lineage_info) {
        return(lineage_info)
    }
    else {
        warning(paste0("Warning: unknown group label: ",group_label))
    }
    }
