////////////////////////////////////////////////////////////////////////
// Arquivo:      wsp_schema.sch
// Data de publicação: 18/06/2013 18:17:37
// Usuário publicador: Administrator
// Descrição:
//   Modificações no esquema do CA SD mantidas pelo Pintor de tela da web.
////////////////////////////////////////////////////////////////////////

#include "../schema.mac"
#include "../bop.mac"

TABLE usp_contact {
  z_srl_lider	UUID REF ca_contact;
  z_srl_tipo_trat_espec	STRING 12 REF z_tipo_trat_espec;
}

TABLE Call_Req {
  z_int_sla_viol_atend	INTEGER;
}

TABLE usp_organization {
  z_srl_org_sup	UUID REF ca_organization;
}

TABLE Prob_Category {
  z_srl_servico	UUID REF ca_owned_resource;
}

TABLE serx {
  z_srl_hor_crit	STRING 30 REF Bop_Workshift;
  z_srl_hor_func	STRING 30 REF Bop_Workshift;
  z_srl_hor_indisp_prog	STRING 30 REF Bop_Workshift;
  z_srl_srv_categoria	STRING 30 REF z_srv_categoria;
  z_srl_srv_ciclo_vida	STRING 12 REF z_srv_ciclo_vida;
  z_srl_srv_foco	STRING 30 REF z_srv_foco;
  z_srl_srv_subcat2	STRING 30 REF z_srv_subcat2;
  z_srl_srv_torre	STRING 30 REF z_srv_torre;
  z_str_arquitetura	STRING 4000;
  z_str_desc_det	STRING 32767;
  z_str_exclusoes	STRING 8000;
  z_str_kpis	STRING 4000;
  z_str_metodo_cust	STRING 4000;
  z_str_requisito_nservico	STRING 8000;
}

TABLE z_cr_slo {
  id	INTEGER UNIQUE KEY;
  last_mod_dt	 LOCAL_TIME;
  last_mod_by	 UUID REF ca_contact;
  z_dt_violacao_sla	LOCAL_TIME;
  z_dt_violacao_slo	LOCAL_TIME;
  z_int_tempo_total	INTEGER;
  z_int_tempo_wsgrp	INTEGER;
  z_int_tempo_wssvc	INTEGER;
  z_int_transf_1	INTEGER;
  z_int_transf_2	INTEGER;
  z_srl_analista	UUID REF ca_contact;
  z_srl_categoria	STRING 30 REF Prob_Category;
  z_srl_cr	STRING 30 REF Call_Req;
  z_srl_grupo	UUID REF ca_contact;
  z_srl_responsavel	UUID REF ca_contact;
  z_srl_status	STRING 12 REF Cr_Status;
}

p1 z_cr_slo -> CURR_PROV z_cr_slo;

TABLE z_srv_categoria {
  id	INTEGER UNIQUE KEY;
  last_mod_dt	 LOCAL_TIME;
  last_mod_by	 UUID REF ca_contact;
  code	STRING 30 UNIQUE S_KEY;
  delete_flag	INTEGER REF Active_Boolean_Table;
  description	STRING 255;
  sym	STRING 128;
}

p1 z_srv_categoria -> CURR_PROV z_srv_categoria;

TABLE z_srv_ciclo_vida {
  id	INTEGER UNIQUE KEY;
  last_mod_dt	 LOCAL_TIME;
  last_mod_by	 UUID REF ca_contact;
  code	STRING 12 UNIQUE;
  delete_flag	INTEGER REF Active_Boolean_Table;
  description	STRING 255;
  sym	STRING 60;
}

p1 z_srv_ciclo_vida -> CURR_PROV z_srv_ciclo_vida;

TABLE z_srv_foco {
  id	INTEGER UNIQUE KEY;
  last_mod_dt	 LOCAL_TIME;
  last_mod_by	 UUID REF ca_contact;
  code	STRING 30 UNIQUE;
  delete_flag	INTEGER REF Active_Boolean_Table;
  description	STRING 255;
  sym	STRING 128;
}

p1 z_srv_foco -> CURR_PROV z_srv_foco;

TABLE z_srv_subcat {
  id	INTEGER UNIQUE KEY;
  last_mod_dt	 LOCAL_TIME;
  last_mod_by	 UUID REF ca_contact;
  code	STRING 30 UNIQUE;
  delete_flag	INTEGER REF Active_Boolean_Table;// SRel_Attr_Entry z_srv_subcat.delete_flag
  description	STRING 255;
  sym	STRING 128;
}

p1 z_srv_subcat -> CURR_PROV z_srv_subcat;

TABLE z_srv_subcat2 {
  id	INTEGER UNIQUE KEY;
  last_mod_dt	 LOCAL_TIME;
  last_mod_by	 UUID REF ca_contact;
  code	STRING 30 UNIQUE;
  delete_flag	INTEGER REF Active_Boolean_Table;
  description	STRING 255;
  sym	STRING 128;
}

p1 z_srv_subcat2 -> CURR_PROV z_srv_subcat2;

TABLE z_srv_torre {
  id	INTEGER UNIQUE KEY;
  last_mod_dt	 LOCAL_TIME;
  last_mod_by	 UUID REF ca_contact;
  code	STRING 30 UNIQUE;
  delete_flag	INTEGER REF Active_Boolean_Table;// SRel_Attr_Entry z_srv_torre.delete_flag
  description	STRING 255;
  sym	STRING 128;
}

p1 z_srv_torre -> CURR_PROV z_srv_torre;

TABLE z_tipo_trat_espec {
  id	INTEGER UNIQUE KEY;
  last_mod_dt	 LOCAL_TIME;
  last_mod_by	 UUID REF ca_contact;
  code	STRING 12 UNIQUE S_KEY;
  delete_flag	INTEGER REF Active_Boolean_Table;// SRel_Attr_Entry z_tipo_trat_espec.delete_flag
  description	STRING 512;
  sym	STRING 60 UNIQUE;
  z_int_cr_urg_up	INTEGER;
  z_int_in_urg_up	INTEGER;
  z_int_pr_urg_up	INTEGER;
}

p1 z_tipo_trat_espec -> CURR_PROV z_tipo_trat_espec;
