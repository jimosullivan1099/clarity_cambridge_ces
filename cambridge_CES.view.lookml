# Cambridge, MA CES Model
- view: Cambridge_CES
  derived_table:
     sql: |
       SELECT
        clients.id
        , clients.first_name
        , clients.last_name
        , concat(clients.first_name,' ',clients.last_name) as full_name
        , clients.unique_identifier
        , clients.ssn
        , client_demographics.gender
        , fn_getPicklistValueName('gender',client_demographics.gender) as gender_text
        , client_demographics.veteran
        , fn_getPicklistValueName('veteran',client_demographics.veteran) as veteran_text
        , hpt_id
        , vi_id
        , client_programs.start_date
        , client_programs.last_updated
        , HPTAssessment.assessment_date as last_hpt_date
        , VIAssessment.assessment_date as last_vi_date
        , households.count_adults
        , households.count_children
        , fn_getPicklistValueName('c_language_cambridge',COLUMN_GET(HPTAssessment_data.custom_data,'c_language_cambridge' AS CHAR(255))) as c_language_cambridge
        , COLUMN_GET(HPTAssessment_data.custom_data,'c_language_other' AS CHAR(65535)) as c_language_other
        , fn_getPicklistValueName('c_Homeless_5_yrs',COLUMN_GET(HPTAssessment_data.custom_data,'c_Homeless_5_yrs' AS CHAR (255))) as c_Homeless_5_yrs
        , fn_getPicklistValueName('c_homeless_90',COLUMN_GET(HPTAssessment_data.custom_data,'c_homeless_90' AS CHAR(255))) as c_homeless_90
        , fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255))) as c_recd_past_RRH
        , fn_getPicklistValueName('c_Dependents',COLUMN_GET(HPTAssessment_data.custom_data,'c_Dependents' AS CHAR(255))) as c_Dependents
        , fn_getPicklistValueName('c_Under25_with_child',COLUMN_GET(HPTAssessment_data.custom_data,'c_Under25_with_child' AS CHAR(255))) as c_Under25_with_child
        , fn_getPicklistValueName('c_jail_history',COLUMN_GET(HPTAssessment_data.custom_data,'c_jail_history' AS CHAR(255))) as c_jail_history
        , fn_getPicklistValueName('c_criminal_hx_types',COLUMN_GET(HPTAssessment_data.custom_data,'c_criminal_hx_types' AS CHAR(255))) as c_criminal_hx_types
        , fn_getPicklistValueName('c_eviction_hx',COLUMN_GET(HPTAssessment_data.custom_data,'c_eviction_hx' AS CHAR(255))) as c_eviction_hx
        , fn_getPicklistValueName('c_Eviction_Count',COLUMN_GET(HPTAssessment_data.custom_data,'c_Eviction_Count' AS CHAR(255))) as c_Eviction_Count
        , fn_getPicklistValueName('c_friends_family_option',COLUMN_GET(HPTAssessment_data.custom_data,'c_friends_family_option' AS CHAR(255))) as c_friends_family_option
        , fn_getPicklistValueName('c_income_any_source',COLUMN_GET(HPTAssessment_data.custom_data,'c_income_any_source' AS CHAR(255))) as c_income_any_source
        , fn_getPicklistValueName('c_monthly_income_is',COLUMN_GET(HPTAssessment_data.custom_data,'c_monthly_income_is' AS CHAR(255))) as c_monthly_income_is
        , HPTAssessment.income_earned_is
        , HPTAssessment.income_unemployment_is
        , HPTAssessment.income_ssi_is
        , HPTAssessment.income_ssdi_is
        , HPTAssessment.income_vet_disability_is
        , HPTAssessment.income_vet_pension_is
        , HPTAssessment.income_private_disability_is
        , HPTAssessment.income_workers_comp_is
        , HPTAssessment.income_tanf_is
        , HPTAssessment.income_ga_is
        , HPTAssessment.income_ss_retirement_is
        , HPTAssessment.income_private_pension_is
        , HPTAssessment.income_childsupport_is
        , HPTAssessment.income_spousal_support_is
        , HPTAssessment.income_other_is
        , fn_getPicklistValueName('c_hx_of_judgement',COLUMN_GET(HPTAssessment_data.custom_data,'c_hx_of_judgement' AS CHAR(255))) as c_hx_of_judgement
        , COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER) as c_calculation_total
        , YEAR(NOW()) - YEAR(clients.birth_date) - (DATE_FORMAT(NOW(), '%m%d') < DATE_FORMAT(clients.birth_date, '%m%d')) as age
        , fn_getPicklistValueName('vi_spdat_q1',VIAssessment.vi_spdat_q1) as vi_spdat_q1
        , fn_getPicklistValueName('vi_spdat_q2',VIAssessment.vi_spdat_q2) as vi_spdat_q2
        , fn_getPicklistValueName('c_emergency_room_3month_count',COLUMN_GET(VIAssessment_data.custom_data,'c_emergency_room_3month_count' AS CHAR(255))) as c_emergency_room_3month_count
        , fn_getPicklistValueName('vi_spdat_q7',VIAssessment.vi_spdat_q7) as vi_spdat_q7
        , fn_getPicklistValueName('vi_spdat_q22',VIAssessment.vi_spdat_q22) as vi_spdat_q22
        , fn_getPicklistValueName('vi_spdat_q23',VIAssessment.vi_spdat_q23) as vi_spdat_q23
        , fn_getPicklistValueName('vi_spdat_q24',VIAssessment.vi_spdat_q24) as vi_spdat_q24
        , fn_getPicklistValueName('vi_spdat_q25',VIAssessment.vi_spdat_q25) as vi_spdat_q25
        , fn_getPicklistValueName('vi_spdat_q26',VIAssessment.vi_spdat_q26) as vi_spdat_q26
        , fn_getPicklistValueName('vi_spdat_q27',VIAssessment.vi_spdat_q27) as vi_spdat_q27
        , fn_getPicklistValueName('vi_spdat_q28',VIAssessment.vi_spdat_q28) as vi_spdat_q28
        , fn_getPicklistValueName('vi_spdat_q29',VIAssessment.vi_spdat_q29) as vi_spdat_q29
        , fn_getPicklistValueName('vi_spdat_q30',VIAssessment.vi_spdat_q30) as vi_spdat_q30
        , fn_getPicklistValueName('vi_spdat_q31',VIAssessment.vi_spdat_q31) as vi_spdat_q31
        , fn_getPicklistValueName('vi_spdat_q32',VIAssessment.vi_spdat_q32) as vi_spdat_q32
        , fn_getPicklistValueName('vi_spdat_q33',VIAssessment.vi_spdat_q33) as vi_spdat_q33
        , fn_getPicklistValueName('vi_spdat_q34',VIAssessment.vi_spdat_q34) as vi_spdat_q34
        , fn_getPicklistValueName('vi_spdat_q35',VIAssessment.vi_spdat_q35) as vi_spdat_q35
        , fn_getPicklistValueName('c_alcohol_everyday',COLUMN_GET(VIAssessment_data.custom_data,'c_alcohol_everyday' AS CHAR(255))) as c_alcohol_everyday
        , fn_getPicklistValueName('vi_spdat_q37',VIAssessment.vi_spdat_q37) as vi_spdat_q37
        , fn_getPicklistValueName('vi_spdat_q38',VIAssessment.vi_spdat_q38) as vi_spdat_q38
        , fn_getPicklistValueName('vi_spdat_q41',VIAssessment.vi_spdat_q41) as vi_spdat_q41
        , fn_getPicklistValueName('vi_spdat_q42',VIAssessment.vi_spdat_q42) as vi_spdat_q42
        , fn_getPicklistValueName('vi_spdat_q45',VIAssessment.vi_spdat_q45) as vi_spdat_q45
        , fn_getPicklistValueName('vi_spdat_q48',VIAssessment.vi_spdat_q48) as vi_spdat_q48
        , fn_getPicklistValueName('health_mental_services',VIAssessment.health_mental_services) as health_mental_services
        , fn_getPicklistValueName('health_phys_disability',VIAssessment.health_phys_disability) as health_phys_disability
        , (0+
        if((YEAR(NOW()) - YEAR(vi_birth_date) - (DATE_FORMAT(NOW(), '%m%d') < DATE_FORMAT(vi_birth_date, '%m%d')))>60, 1,0) +
        if(fn_getPicklistValueName('c_emergency_room_3month_count',COLUMN_GET(VIAssessment_data.custom_data,'c_emergency_room_3month_count' AS CHAR(255)))="3 or more times", 1,0) +
        if(fn_getPicklistValueName('vi_spdat_q7',VIAssessment.vi_spdat_q7)="3 times"
          OR fn_getPicklistValueName('vi_spdat_q7',VIAssessment.vi_spdat_q7)="4 times"
          OR fn_getPicklistValueName('vi_spdat_q7',VIAssessment.vi_spdat_q7)="5 or more times",1,0) +
        if(fn_getPicklistValueName('vi_spdat_q22',VIAssessment.vi_spdat_q22)="Yes", 1,0) +
        if(fn_getPicklistValueName('vi_spdat_q23',VIAssessment.vi_spdat_q23)="Yes", 1,0) +
        if(fn_getPicklistValueName('vi_spdat_q24',VIAssessment.vi_spdat_q24)="Yes", 1,0) +
        if(fn_getPicklistValueName('vi_spdat_q25',VIAssessment.vi_spdat_q25)="Yes", 1,0) +
        if((fn_getPicklistValueName('health_mental_services',VIAssessment.health_mental_services)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q42',VIAssessment.vi_spdat_q42)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q48',VIAssessment.vi_spdat_q48)="Yes")
          AND (fn_getPicklistValueName('vi_spdat_q35',VIAssessment.vi_spdat_q35)="Yes"
            OR fn_getPicklistValueName('c_alcohol_everyday',COLUMN_GET(VIAssessment_data.custom_data,'c_alcohol_everyday' AS CHAR(255)))="Yes"
            OR fn_getPicklistValueName('vi_spdat_q37',VIAssessment.vi_spdat_q37)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q38',VIAssessment.vi_spdat_q38)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q41',VIAssessment.vi_spdat_q41)="Yes")
          AND (fn_getPicklistValueName('health_phys_disability',VIAssessment.health_phys_disability)="Yes"
            OR  fn_getPicklistValueName('vi_spdat_q45',VIAssessment.vi_spdat_q45)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q22',VIAssessment.vi_spdat_q22)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q23',VIAssessment.vi_spdat_q23)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q24',VIAssessment.vi_spdat_q24)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q25',VIAssessment.vi_spdat_q25)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q26',VIAssessment.vi_spdat_q26)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q27',VIAssessment.vi_spdat_q27)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q28',VIAssessment.vi_spdat_q28)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q29',VIAssessment.vi_spdat_q29)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q30',VIAssessment.vi_spdat_q30)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q31',VIAssessment.vi_spdat_q31)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q32',VIAssessment.vi_spdat_q32)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q33',VIAssessment.vi_spdat_q33)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q34',VIAssessment.vi_spdat_q34)="Yes"), 1,0)
        ) as vi_local_score
        , concat(if (fn_getPicklistValueName('c_homeless_90',COLUMN_GET(HPTAssessment_data.custom_data,'c_homeless_90' AS CHAR(255)))="No", "Green", ""), 
          if( fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Yes, more than once", "Red",""),
          if(fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Yes, once","Orange",""),
          if(fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="No","Yellow",""),
          if(fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client doesn't know","Yellow",""),
          if(fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client refused","Yellow","")) 
          as hpt_color_code
        , concat(if(fn_getPicklistValueName('c_homeless_90',COLUMN_GET(HPTAssessment_data.custom_data,'c_homeless_90' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)<3,"G",""),
          if(fn_getPicklistValueName('c_homeless_90',COLUMN_GET(HPTAssessment_data.custom_data,'c_homeless_90' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)<5 AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)>2, "F",""),
          if(fn_getPicklistValueName('c_homeless_90',COLUMN_GET(HPTAssessment_data.custom_data,'c_homeless_90' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)>4, "D",""),
          if(fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)<3,"E",""),
          if(fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)>2 AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)<5, "C",""),
          if(fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)>4, "B",""),
          if(fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client doesn't know" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)<3,"E",""),
          if(fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client doesn't know" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)>2 AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)<5, "C",""),
          if(fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client doesn't know" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)>4, "B",""),
          if(fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client refused" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)<3,"E",""),
          if(fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client refused" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)>2 AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)<5, "C",""),
          if(fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client refused" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)>4, "B",""),
          if(fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Yes, once", "A","")) 
          as RRH_priority_level
        , concat(if(fn_getPicklistValueName('c_homeless_90',COLUMN_GET(HPTAssessment_data.custom_data,'c_homeless_90' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)<3,"H",""),
          if(fn_getPicklistValueName('c_homeless_90',COLUMN_GET(HPTAssessment_data.custom_data,'c_homeless_90' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)<5 AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)>2, "G",""),
          if(fn_getPicklistValueName('c_homeless_90',COLUMN_GET(HPTAssessment_data.custom_data,'c_homeless_90' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)>4, "E",""),
          if(fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)<3,"F",""),
          if(fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)>2 AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)<5, "D",""),
          if(fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)>4, "C",""),
          if(fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client doesn't know" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)<3,"F",""),
          if(fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client doesn't know" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)>2 AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)<5, "D",""),
          if(fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client doesn't know" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)>4, "C",""),
          if(fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client refused" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)<3,"F",""),
          if(fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client refused" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)>2 AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)<5, "D",""),
          if(fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client refused" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)>4, "C",""),
          if(fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Yes, once", "B",""),
          if(fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Yes, more than once", "A",""))
          as trans_priority_level
        , if(fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Yes, more than once" OR COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)>4, "A","")
          as psh_priority_level
        , if (fn_getPicklistValueName('health_mental_services',VIAssessment.health_mental_services)="Yes" OR
          fn_getPicklistValueName('health_mental_services',VIAssessment.health_mental_services)="Client doesn't know" OR
          fn_getPicklistValueName('health_mental_services',VIAssessment.health_mental_services)="Client refused" OR
          fn_getPicklistValueName('vi_spdat_q42',VIAssessment.vi_spdat_q42)="Yes" OR
          fn_getPicklistValueName('vi_spdat_q42',VIAssessment.vi_spdat_q42)="Client doesn't know" OR
          fn_getPicklistValueName('vi_spdat_q42',VIAssessment.vi_spdat_q42)="Client refused" OR
          fn_getPicklistValueName('vi_spdat_q48',VIAssessment.vi_spdat_q48)="Yes", "Yes", "No")
          as mental_health_calculation
        , if (fn_getPicklistValueName('c_homeless_90',COLUMN_GET(HPTAssessment_data.custom_data,'c_homeless_90' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)<2, "0","") +
          if (fn_getPicklistValueName('c_homeless_90',COLUMN_GET(HPTAssessment_data.custom_data,'c_homeless_90' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=2, ".5","") +
          if (fn_getPicklistValueName('c_homeless_90',COLUMN_GET(HPTAssessment_data.custom_data,'c_homeless_90' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=3, ".5","") +
          if (fn_getPicklistValueName('c_homeless_90',COLUMN_GET(HPTAssessment_data.custom_data,'c_homeless_90' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=4, "1","") +
          if (fn_getPicklistValueName('c_homeless_90',COLUMN_GET(HPTAssessment_data.custom_data,'c_homeless_90' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)>4, "1","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=0, ".5","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=1, "1.5","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=2, "1.5","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=3, "2","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=4, "2.5","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)>4, "3","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client doesn't know" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=0, ".5","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client doesn't know" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=1, "1.5","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client doesn't know" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=2, "1.5","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client doesn't know" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=3, "2","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client doesn't know" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=4, "2.5","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client doesn't know" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)>4, "3","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client refused" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=0, ".5","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client refused" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=1, "1.5","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client refused" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=2, "1.5","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client refused" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=3, "2","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client refused" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=4, "2.5","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client refused" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)>4, "3","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Yes, once" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=0, "1","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Yes, once" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=1, "1.5","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Yes, once" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=2, "2","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Yes, once" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=3, "2.5","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Yes, once" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=4, "2.5","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Yes, once" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)>4, "3","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Yes, more than once","3", "")
          as hpt_new_score
          , ((if (fn_getPicklistValueName('c_homeless_90',COLUMN_GET(HPTAssessment_data.custom_data,'c_homeless_90' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)<2, "0","") +
          if (fn_getPicklistValueName('c_homeless_90',COLUMN_GET(HPTAssessment_data.custom_data,'c_homeless_90' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=2, ".5","") +
          if (fn_getPicklistValueName('c_homeless_90',COLUMN_GET(HPTAssessment_data.custom_data,'c_homeless_90' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=3, ".5","") +
          if (fn_getPicklistValueName('c_homeless_90',COLUMN_GET(HPTAssessment_data.custom_data,'c_homeless_90' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=4, "1","") +
          if (fn_getPicklistValueName('c_homeless_90',COLUMN_GET(HPTAssessment_data.custom_data,'c_homeless_90' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)>4, "1","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=0, ".5","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=1, "1.5","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=2, "1.5","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=3, "2","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=4, "2.5","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="No" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)>4, "3","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client doesn't know" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=0, ".5","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client doesn't know" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=1, "1.5","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client doesn't know" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=2, "1.5","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client doesn't know" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=3, "2","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client doesn't know" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=4, "2.5","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client doesn't know" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)>4, "3","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client refused" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=0, ".5","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client refused" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=1, "1.5","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client refused" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=2, "1.5","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client refused" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=3, "2","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client refused" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=4, "2.5","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Client refused" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)>4, "3","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Yes, once" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=0, "1","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Yes, once" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=1, "1.5","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Yes, once" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=2, "2","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Yes, once" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=3, "2.5","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Yes, once" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)=4, "2.5","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Yes, once" AND COLUMN_GET(HPTAssessment_data.custom_data,'c_calculation_total' AS INTEGER)>4, "3","") +
          if (fn_getPicklistValueName('c_recd_past_RRH',COLUMN_GET(HPTAssessment_data.custom_data,'c_recd_past_RRH' AS CHAR(255)))="Yes, more than once","3", ""))
          + ( (0+
          if((YEAR(NOW()) - YEAR(vi_birth_date) - (DATE_FORMAT(NOW(), '%m%d') < DATE_FORMAT(vi_birth_date, '%m%d')))>60, 1,0) +
          if(fn_getPicklistValueName('c_emergency_room_3month_count',COLUMN_GET(VIAssessment_data.custom_data,'c_emergency_room_3month_count' AS CHAR(255)))="3 or more times", 1,0) +
          if(fn_getPicklistValueName('vi_spdat_q7',VIAssessment.vi_spdat_q7)="3 times"
            OR fn_getPicklistValueName('vi_spdat_q7',VIAssessment.vi_spdat_q7)="4 times"
            OR fn_getPicklistValueName('vi_spdat_q7',VIAssessment.vi_spdat_q7)="5 or more times",1,0) +
          if(fn_getPicklistValueName('vi_spdat_q22',VIAssessment.vi_spdat_q22)="Yes", 1,0) +
          if(fn_getPicklistValueName('vi_spdat_q23',VIAssessment.vi_spdat_q23)="Yes", 1,0) +
          if(fn_getPicklistValueName('vi_spdat_q24',VIAssessment.vi_spdat_q24)="Yes", 1,0) +
          if(fn_getPicklistValueName('vi_spdat_q25',VIAssessment.vi_spdat_q25)="Yes", 1,0) +
          if((fn_getPicklistValueName('health_mental_services',VIAssessment.health_mental_services)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q42',VIAssessment.vi_spdat_q42)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q48',VIAssessment.vi_spdat_q48)="Yes")
          AND (fn_getPicklistValueName('vi_spdat_q35',VIAssessment.vi_spdat_q35)="Yes"
            OR fn_getPicklistValueName('c_alcohol_everyday',COLUMN_GET(VIAssessment_data.custom_data,'c_alcohol_everyday' AS CHAR(255)))="Yes"
            OR fn_getPicklistValueName('vi_spdat_q37',VIAssessment.vi_spdat_q37)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q38',VIAssessment.vi_spdat_q38)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q41',VIAssessment.vi_spdat_q41)="Yes")
          AND (fn_getPicklistValueName('health_phys_disability',VIAssessment.health_phys_disability)="Yes"
            OR  fn_getPicklistValueName('vi_spdat_q45',VIAssessment.vi_spdat_q45)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q22',VIAssessment.vi_spdat_q22)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q23',VIAssessment.vi_spdat_q23)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q24',VIAssessment.vi_spdat_q24)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q25',VIAssessment.vi_spdat_q25)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q26',VIAssessment.vi_spdat_q26)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q27',VIAssessment.vi_spdat_q27)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q28',VIAssessment.vi_spdat_q28)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q29',VIAssessment.vi_spdat_q29)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q30',VIAssessment.vi_spdat_q30)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q31',VIAssessment.vi_spdat_q31)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q32',VIAssessment.vi_spdat_q32)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q33',VIAssessment.vi_spdat_q33)="Yes"
            OR fn_getPicklistValueName('vi_spdat_q34',VIAssessment.vi_spdat_q34)="Yes"), 1,0)))) 
          as combined_score
        FROM clients
        INNER JOIN client_demographics ON clients.id = client_demographics.ref_client
        LEFT OUTER JOIN
        (
          SELECT
            id as hpt_id
            , ref_client
            , max(assessment_date) as last_assessment_date
          FROM client_assessment_demographics
          WHERE ref_assessment = 131 AND (deleted IS NULL OR deleted <> '1')
          GROUP BY ref_client
          ORDER BY hpt_id desc
        ) LastHPTAssessment ON clients.id = LastHPTAssessment.ref_client
        LEFT OUTER JOIN
          client_assessment_demographics HPTAssessment
          ON LastHPTAssessment.hpt_id = HPTAssessment.id
        LEFT OUTER JOIN
          client_assessment_data HPTAssessment_data
          ON LastHPTAssessment.hpt_id = HPTAssessment_data.id
        LEFT OUTER JOIN
        (
          SELECT
            client_assessment_demographics.id as vi_id
            , client_assessment_demographics.ref_client
            , max(assessment_date) as last_assessment_date
            , clients.birth_date as vi_birth_date
          FROM client_assessment_demographics
          INNER JOIN clients ON clients.id = client_assessment_demographics.ref_client
          WHERE ref_assessment = 128 AND (client_assessment_demographics.deleted IS NULL OR client_assessment_demographics.deleted <> '1')
          GROUP BY ref_client
          ORDER BY vi_id desc
        ) LastVIAssessment ON clients.id = LastVIAssessment.ref_client
        LEFT OUTER JOIN
          client_assessment_demographics VIAssessment
          ON LastVIAssessment.vi_id = VIAssessment.id
        LEFT OUTER JOIN
          client_assessment_data VIAssessment_data
          ON LastVIAssessment.vi_id = VIAssessment_data.id
        LEFT JOIN
          client_programs ON client_programs.ref_client = clients.id
        LEFT OUTER JOIN
        (
          SELECT
            enrollments.ref_household AS ref_household
            , COUNT(DISTINCT CASE WHEN (YEAR(DATE(enrollments.start_date)) - YEAR(DATE(clients.birth_date)) - (DATE_FORMAT(DATE(enrollments.start_date), '%m%d') < DATE_FORMAT(DATE(clients.birth_date), '%m%d')) >= 18) THEN enrollments.ref_client ELSE NULL END) AS count_adults
            , COUNT(DISTINCT CASE WHEN (YEAR(DATE(enrollments.start_date)) - YEAR(DATE(clients.birth_date)) - (DATE_FORMAT(DATE(enrollments.start_date), '%m%d') < DATE_FORMAT(DATE(clients.birth_date), '%m%d')) < 18) THEN enrollments.ref_client ELSE NULL END) AS count_children
          FROM  client_programs as enrollments
          LEFT JOIN clients
          AS clients ON enrollments.ref_client = clients.id
          INNER JOIN household  AS household ON enrollments.ref_household = household.id
          WHERE enrollments.ref_program = 80
          group by enrollments.ref_household
        ) households ON client_programs.ref_household = households.ref_household
        WHERE (clients.deleted IS NULL OR clients.deleted <> '1')
          AND client_programs.ref_program = 80
          AND client_programs.status = 1
          AND (client_programs.deleted IS NULL OR client_programs.deleted <> '1')
        Group By clients.id
   # Define your dimensions and measures here, like this:
  fields:
     - dimension: count_adults
       type: int
       sql: ${TABLE}.count_adults
       group_label: "Household"
#
     - dimension: count_children
       type: int
       sql: ${TABLE}.count_children
       group_label: "Household"
#
     - dimension: gender
       type: int
       hidden: true
       sql: ${TABLE}.gender
#
     - dimension: gender_text
       label: 'Gender'
       sql: fn_getPicklistValueName('gender',${gender})
       bypass_suggest_restrictions: true
       suggestions: ['Male','Female','Transgender Female to Male','Transgender Male to Female','Other','Client doesn`t know','Client refused','Data not collected']
       group_label: "Client Profile"
#
     - dimension: veteran
       hidden: true
       type: int
       sql: ${TABLE}.veteran
#    
     - dimension: veteran_text
       label: 'Veteran Status'
       sql: fn_getPicklistValueName('veteran',${veteran})
       bypass_suggest_restrictions: true
       group_label: 'Client Profile'
#
     - dimension: hpt_new_score
       label: "HPT New Score"
       type: number
       decimals: 1
       sql: ${TABLE}.hpt_new_score
       group_label: "Housing Prioritization Tool"
#
     - dimension: combined_score
       label: "Combined Score"
       type: number
       decimals: 1
       sql: ${TABLE}.combined_score
       group_label: "Client Profile"
#
     - dimension: hpt_color_code
       label: "HPT Color Code"
       type: string
       sql: ${TABLE}.hpt_color_code
       group_label: "Housing Prioritization Tool"
#
     - dimension: RRH_priority_level
       label: "Rapid Re-Housing Priority Level"
       type: string
       sql: ${TABLE}.RRH_priority_level
       group_label: "Housing Prioritization Tool"
#
     - dimension: trans_priority_level
       label: "Transitional Housing Priority Level"
       type: string
       sql: ${TABLE}.trans_priority_level
       group_label: "Housing Prioritization Tool"
#
     - dimension: psh_priority_level
       label: "Permanent Supportive Housing Priority Level"
       type: string
       sql: ${TABLE}.psh_priority_level
       group_label: "Housing Prioritization Tool"
#
     - dimension: mental_health_calculation
       label: "Mental Health Calculation"
       type: string
       sql: ${TABLE}.mental_health_calculation
       group_label: "VI Assessment"
#
     - dimension: VI_score
       label: "VI Assessment Score"
       type: number
       sql: ${TABLE}.vi_local_score
       group_label: "VI Assessment"
#
     - dimension: unique_identifier
       label: "Unique Identifier"
       type: string
       sql: ${TABLE}.unique_identifier
       group_label: "Client Profile"
#
     - dimension: client_id
       description: "Client ID"
       links:
       - label: View client in Clarity
         url: https://cambridge.clarityhs.com/clients/{{value}}/profile
         icon_url: https://clarityhumanservices.com/wp-content/themes/evoke/favicon.ico
       type: number
       sql: ${TABLE}.id
       group_label: "Client Profile"
#
     - dimension: full_name
       label: "Client Full Name"
       type: string
       sql: ${TABLE}.full_name
       group_label: "Client Profile"
#
     - dimension: ssn
       label: "SSN"
       type: string
       sql: ${TABLE}.ssn
       group_label: "Client Profile"
#
     - dimension_group: Start_Date
       label: "Start Date"
       type: time
       timeframes: [time, date, week, month]
       sql: ${TABLE}.start_date
       group_label: "Client Profile"
#
     - dimension_group: Last_Update
       label: "Last Update"
       type: time
       timeframes: [time, date, week, month]
       sql: ${TABLE}.last_updated
       group_label: "Client Profile"
#
     - dimension_group: HPT_assessment
       label: "HPT Assessment Date"
       type: time
       timeframes: [time, date, week, month]
       sql: ${TABLE}.last_hpt_date
       group_label: "Housing Prioritization Tool"
#
     - dimension_group: vi_assessment
       label: "VI Assessment Date"
       type: time
       timeframes: [time, date, week, month]
       sql: ${TABLE}.last_vi_date
       group_label: "VI Assessment"
#
     - dimension: c_language_cambridge
       label: "Language"
       type: string
       sql: ${TABLE}.c_language_cambridge
       group_label: "Housing Prioritization Tool"
#
     - dimension: c_language_other
       label: "Other Language"
       type: string
       sql: ${TABLE}.c_language_other
       group_label: "Housing Prioritization Tool"
#
     - dimension: c_Homeless_5_yrs
       label: "First time homeless in the past five years"
       type: string
       sql: ${TABLE}.c_Homeless_5_yrs
       group_label: "Housing Prioritization Tool"
#
     - dimension: c_homeless_90
       label: "Homeless for more than 90 days"
       type: string
       sql: ${TABLE}.c_homeless_90
       group_label: "Housing Prioritization Tool"
#
     - dimension: c_recd_past_RRH
       label: "Ever received temporary assistance to help move back into housing"
       type: string
       sql: ${TABLE}.c_recd_past_RRH
       group_label: "Housing Prioritization Tool"
#
     - dimension: c_Dependents
       label: "Number of dependents"
       type: string
       sql: ${TABLE}.c_Dependents
       group_label: "Housing Prioritization Tool"
#
     - dimension: c_Under25_with_child
       label: "Under 25 years of age with a child under the age of 5"
       type: string
       sql: ${TABLE}.c_Under25_with_child
       group_label: "Housing Prioritization Tool"
#
     - dimension: c_jail_history
       label: "Ever been in jail, arrested, or accused of a crime or criminal activity"
       type: string
       sql: ${TABLE}.c_jail_history
       group_label: "Housing Prioritization Tool"
#
     - dimension: c_criminal_hx_types
       label: "Category of criminal history"
       type: string
       sql: ${TABLE}.c_criminal_hx_types
       group_label: "Housing Prioritization Tool"
#
     - dimension: c_eviction_hx
       label: "Any evictions or asked to leave your rental apartment"
       type: string
       sql: ${TABLE}.c_eviction_hx
       group_label: "Housing Prioritization Tool"
#
     - dimension: c_Eviction_Count
       label: "Number of evictions"
       type: string
       sql: ${TABLE}.c_Eviction_Count
       group_label: "Housing Prioritization Tool"
#
     - dimension: c_friends_family_option
       label: "Friends or family members you can stay with or can lend you money"
       type: string
       sql: ${TABLE}.c_friends_family_option
       group_label: "Housing Prioritization Tool"
#
     - dimension: c_income_any_source
       label: "Income from any source"
       type: string
       sql: ${TABLE}.c_income_any_source
       group_label: "Housing Prioritization Tool"
#
     - dimension: c_monthly_income_is
       label: "Monthly income"
       group_label: "Housing Prioritization Tool"
       type: string
       sql: ${TABLE}.c_monthly_income_is
#
     - dimension: income_earned_is
       label: "Earned Income"
       type: yesno
       sql: ${TABLE}.income_earned_is
       group_label: "Housing Prioritization Tool"
#
     - dimension: income_unemployment_is
       label: "Unemployment Insurance"
       type: yesno
       sql: ${TABLE}.income_unemployment_is
       group_label: "Housing Prioritization Tool"
#
     - dimension: income_ssi_is
       label: "Supplemental Security Income (SSI)"
       type: yesno
       sql: ${TABLE}.income_ssi_is
       group_label: "Housing Prioritization Tool"
#
     - dimension: income_ssdi_is
       label: "Social Security Disability Income (SSDI)"
       type: yesno
       sql: ${TABLE}.income_ssdi_is
       group_label: "Housing Prioritization Tool"
#
     - dimension: income_vet_disability_is
       label: "VA Service Connected Disability Payment"
       type: yesno
       sql: ${TABLE}.income_vet_disability_is
       group_label: "Housing Prioritization Tool"
#
     - dimension: income_vet_pension_is
       label: "VA Non-Service Connected Disability Pension"
       type: yesno
       sql: ${TABLE}.income_vet_pension_is
       group_label: "Housing Prioritization Tool"
#
     - dimension: income_private_disability_is
       label: "Private Disability Insurance"
       type: yesno
       sql: ${TABLE}.income_private_disability_is
       group_label: "Housing Prioritization Tool"
#
     - dimension: income_workers_comp_is
       label: "Workers Compensation"
       type: yesno
       sql: ${TABLE}.income_workers_comp_is
       group_label: "Housing Prioritization Tool"
#
     - dimension: income_tanf_is
       label: "Temporary Assistance for Needy Families (TANF)"
       type: yesno
       sql: ${TABLE}.income_tanf_is
       group_label: "Housing Prioritization Tool"
#
     - dimension: income_ga_is
       label: "General Assistance (GA)"
       type: yesno
       sql: ${TABLE}.income_ga_is
       group_label: "Housing Prioritization Tool"
#
     - dimension: income_ss_retirement_is
       label: "Retirement Income from Social Security"
       type: yesno
       sql: ${TABLE}.income_ss_retirement_is
       group_label: "Housing Prioritization Tool"
#
     - dimension: income_private_pension_is
       label: "Pension or Retirement Income from a Former Job"
       type: yesno
       sql: ${TABLE}.income_private_pension_is
       group_label: "Housing Prioritization Tool"
#
     - dimension: income_childsupport_is
       label: "Child Support"
       type: yesno
       sql: ${TABLE}.income_childsupport_is
       group_label: "Housing Prioritization Tool"
#
     - dimension: income_spousal_support_is
       label: "Alimony or other Spousal Support"
       type: yesno
       sql: ${TABLE}.income_spousal_support_is
       group_label: "Housing Prioritization Tool"
#
     - dimension: income_other_is
       label: "Other Source"
       type: yesno
       sql: ${TABLE}.income_other_is
       group_label: "Housing Prioritization Tool"
#
     - dimension: c_hx_of_judgement
       label: "Credit history includes a judgement for debt to a landlord"
       type: string
       sql: ${TABLE}.c_hx_of_judgement
       group_label: "Housing Prioritization Tool"
#
     - dimension: c_calculation_total
       label: "Housing Prioritization Tool Score"
       type: number
       sql: ${TABLE}.c_calculation_total
       group_label: "Housing Prioritization Tool"
#
     - dimension: age
       label: "Age"
       type: number
       sql: ${TABLE}.age
       group_label: "Client Profile"
#  
     - dimension: age_tier
       type: tier
       style: integer
       tiers: [0,18,25,35,45,55,65]
       sql: ${age}
       group_label: "Client Profile"
#
     - dimension: vi_spdat_q1
       label: "Total length of time on the streets or in shelters"
       type: string
       sql: ${TABLE}.vi_spdat_q1
       group_label: "VI Assessment"
#
     - dimension: vi_spdat_q2
       label: "Times homeless in the past 3 years"
       type: string
       sql: ${TABLE}.vi_spdat_q2
       group_label: "VI Assessment"
#
     - dimension: c_emergency_room_3month_count
       label: "Times in an emergency room in the past 3 months"
       type: string
       sql: ${TABLE}.c_emergency_room_3month_count
       group_label: "VI Assessment"
#
     - dimension: vi_spdat_q7
       label: "Times hospitalized as an inpatient in the past year"
       type: string
       sql: ${TABLE}.vi_spdat_q7
       group_label: "VI Assessment"
#
     - dimension: vi_spdat_q22
       label: "Kidney Disease/End Stage Renal Disease or Dialysis"
       type: string
       sql: ${TABLE}.vi_spdat_q22
       group_label: "VI Assessment"
#
     - dimension: vi_spdat_q23
       label: "Frostbite, Hypothermia, or Immersion Foot"
       type: string
       sql: ${TABLE}.vi_spdat_q23
       group_label: "VI Assessment"
#
     - dimension: vi_spdat_q24
       label: "Liver Disease, Cirrhosis, or End-Stage Liver Disease"
       type: string
       sql: ${TABLE}.vi_spdat_q24
       group_label: "VI Assessment"
#
     - dimension: vi_spdat_q25
       label: "HIV+/AIDS"
       type: string
       sql: ${TABLE}.vi_spdat_q25
       group_label: "VI Assessment"
#
     - dimension: vi_spdat_q26
       label: "Heat Stroke, Heat Exhaustion"
       type: string
       sql: ${TABLE}.vi_spdat_q26
       group_label: "VI Assessment"
#
     - dimension: vi_spdat_q27
       label: "Heart Disease, Arrhythmia, or Irregular Heartbeat"
       type: string
       sql: ${TABLE}.vi_spdat_q27
       group_label: "VI Assessment"
#
     - dimension: vi_spdat_q28
       label: "Emphysema"
       type: string
       sql: ${TABLE}.vi_spdat_q28
       group_label: "VI Assessment"
#
     - dimension: vi_spdat_q29
       label: "Diabetes"
       type: string
       sql: ${TABLE}.vi_spdat_q29
       group_label: "VI Assessment"
#
     - dimension: vi_spdat_q30
       label: "Asthma"
       type: string
       sql: ${TABLE}.vi_spdat_q30
       group_label: "VI Assessment"
#
     - dimension: vi_spdat_q31
       label: "Cancer"
       type: string
       sql: ${TABLE}.vi_spdat_q31
       group_label: "VI Assessment"
#
     - dimension: vi_spdat_q32
       label: "Hepatitis C"
       type: string
       sql: ${TABLE}.vi_spdat_q32
       group_label: "VI Assessment"
#
     - dimension: vi_spdat_q33
       label: "Tuberculosis"
       type: string
       sql: ${TABLE}.vi_spdat_q33
       group_label: "VI Assessment"
#
     - dimension: vi_spdat_q34
       label: "Observe signs of a serious health condition"
       type: string
       sql: ${TABLE}.vi_spdat_q34
       group_label: "VI Assessment"
#
     - dimension: vi_spdat_q35
       label: "Abused drugs or alcohol or told you do"
       type: string
       sql: ${TABLE}.vi_spdat_q35
       group_label: "VI Assessment"
#
     - dimension: c_alcohol_everyday
       label: "Consumed alcohol every day during the past month"
       type: string
       sql: ${TABLE}.c_alcohol_everyday
       group_label: "VI Assessment"
#
     - dimension: vi_spdat_q37
       label: "Used injection drugs"
       type: string
       sql: ${TABLE}.vi_spdat_q37
       group_label: "VI Assessment"
#
     - dimension: vi_spdat_q38
       label: "Treated for drug or alcohol problem"
       type: string
       sql: ${TABLE}.vi_spdat_q38
       group_label: "VI Assessment"
#
     - dimension: vi_spdat_q41
       label: "Observe signs of alcohol or drug abuse"
       type: string
       sql: ${TABLE}.vi_spdat_q41
       group_label: "VI Assessment"
#
     - dimension: vi_spdat_q42
       label: "Taken to a hospital against your will for a mental health reason"
       type: string
       sql: ${TABLE}.vi_spdat_q42
       group_label: "VI Assessment"
#
     - dimension: vi_spdat_q45
       label: "Serious brain injury or head trauma requiring hospitalization or surgery"
       type: string
       sql: ${TABLE}.vi_spdat_q45
       group_label: "VI Assessment"
#
     - dimension: vi_spdat_q48
       label: "Observe signs of severe, persistent mental illness"
       type: string
       sql: ${TABLE}.vi_spdat_q48
       group_label: "VI Assessment"
#
     - dimension: health_mental_services
       label: "Treatment for mental health issues"
       type: string
       sql: ${TABLE}.health_mental_services
       group_label: "VI Assessment"
#
     - dimension: health_phys_disability
       label: "Physical disability that limits mobility"
       type: string
       sql: ${TABLE}.health_phys_disability
       group_label: "VI Assessment"
#
     - measure: number_of_clients
       type: count_distinct
       sql: ${TABLE}.id
       drill_fields: [client_id, full_name]
     - measure: average_VI_score
       type: average
       sql: ${TABLE}.vi_local_score
       drill_fields: [client_id, full_name]
     - measure: average_HPT_score
       type: average
       sql: ${TABLE}.c_calculation_total
       drill_fields: [client_id, full_name]
#

