////////////////////////////////////////////////////////////////////////
// Arquivo:      wsp_schema.sch
// Data de publicação: 28/06/2013 12:03:15
// Usuário publicador: Administrator
// Descrição:
//   Modificações no esquema do CA SD mantidas pelo Pintor de tela da web.
////////////////////////////////////////////////////////////////////////

#include "../schema.mac"
#include "../bop.mac"

TABLE Act_Log {
  z_srl_group	UUID REF ca_contact;
  z_srl_resocode	INTEGER REF usp_resolution_code;
  z_srl_transfcode	INTEGER REF ztransfcode;
}

TABLE usp_contact {
  z_int_gruposd	INTEGER;// Flag que identifica é de ServiceDesk Feedback
  z_srl_gerente	UUID REF ca_contact;
  z_srl_lider	UUID REF ca_contact;
  z_srl_tipo_trat_espec	STRING 12 REF z_tipo_trat_espec;
}

TABLE Call_Req {
  z_int_num_redir	INTEGER;
  z_int_reclass	INTEGER;
  z_int_sla_viol_atend	INTEGER;
  z_int_slo	INTEGER;
  z_srl_cr	STRING 30 REF Call_Req;
  z_srl_fluxo	INTEGER REF zfluxo;
}

TABLE usp_organization {
  z_srl_org_sup	UUID REF ca_organization;
  z_srl_tipo_org	INTEGER REF z_tipo_org;
}

TABLE Prob_Category {
  z_srl_fluxo	INTEGER REF zfluxo;
  z_srl_impact	INTEGER REF Impact;// SRel_Attr_Entry pcat.z_srl_impact
  z_srl_servico	UUID REF ca_owned_resource;
  z_srl_tipo	STRING 10 REF Call_Req_Type;
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

TABLE z_cr_cat_org {
  id	INTEGER UNIQUE KEY;
  last_mod_dt	 LOCAL_TIME;
  last_mod_by	 UUID REF ca_contact;
  z_srl_org	UUID REF ca_organization;
  z_srl_pcat	STRING 30 REF Prob_Category;
}

p1 z_cr_cat_org -> CURR_PROV z_cr_cat_org;

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

TABLE z_niv_hier {
  id	INTEGER UNIQUE KEY;
  last_mod_dt	 LOCAL_TIME;
  last_mod_by	 UUID REF ca_contact;
  delete_flag	INTEGER REF Active_Boolean_Table;
  description	STRING 512;
  z_int_nivel	INTEGER UNIQUE S_KEY;
}

p1 z_niv_hier -> CURR_PROV z_niv_hier;

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

TABLE z_tipo_org {
  id	INTEGER UNIQUE KEY;
  last_mod_dt	 LOCAL_TIME;
  last_mod_by	 UUID REF ca_contact;
  code	STRING 30 S_KEY;
  delete_flag	INTEGER REF Active_Boolean_Table;
  description	STRING 512;
  name	STRING 60 UNIQUE;
  z_srl_niv_hier	INTEGER REF z_niv_hier;
}

p1 z_tipo_org -> CURR_PROV z_tipo_org;

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

TABLE zfluxo {
  id	INTEGER UNIQUE KEY;
  last_mod_dt	 LOCAL_TIME;
  last_mod_by	 UUID REF ca_contact;
  delete_flag	INTEGER;
  description	STRING 4000;
  modpasso	INTEGER REF zmodpasso;
  sym	STRING 255;
}

p1 zfluxo -> CURR_PROV zfluxo;

TABLE zmodpasso {
  id	INTEGER UNIQUE KEY;
  last_mod_dt	 LOCAL_TIME;
  last_mod_by	 UUID REF ca_contact;
  apprule	STRING 4000;
  cnt	UUID REF ca_contact;
  delete_flag	INTEGER;
  fluxo	INTEGER REF zfluxo;
  grp	UUID REF ca_contact;
  grpstep	INTEGER;
  ntfl	INTEGER REF Notify_Object_Attr;
  sequence	INTEGER;
  tipoaprovador	INTEGER REF ztipoaprovador;// SRel_Attr_Entry zmodpasso.tipoaprovador
}

p1 zmodpasso -> CURR_PROV zmodpasso;

TABLE zpasso {
  id	INTEGER UNIQUE KEY;
  last_mod_dt	 LOCAL_TIME;
  last_mod_by	 UUID REF ca_contact;
  approver	UUID REF ca_contact;
  comments	STRING 4000;
  cr	STRING 30 REF Call_Req;
  delete_flag	INTEGER;
  grpstep	INTEGER;
  sequence	INTEGER;
  status	STRING 3;
}

p1 zpasso -> CURR_PROV zpasso;

TABLE ztipoaprovador {
  id	INTEGER UNIQUE KEY;
  last_mod_dt	 LOCAL_TIME;
  last_mod_by	 UUID REF ca_contact;
  delete_flag	INTEGER;
  obj	STRING 4000;
  sym	STRING 255;
}

p1 ztipoaprovador -> CURR_PROV ztipoaprovador;

TABLE ztransfcode {
  id	INTEGER UNIQUE KEY;
  last_mod_dt	 LOCAL_TIME;
  last_mod_by	 UUID REF ca_contact;
  delete_flag	INTEGER REF Active_Boolean_Table;
  description	STRING 526;
  sym	STRING 256 UNIQUE;
  z_int_transf_sd	INTEGER;
}

p1 ztransfcode -> CURR_PROV ztransfcode;
