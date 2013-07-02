////////////////////////////////////////////////////////////////////////
// Arquivo:      wsp_index.sch
// Data de publicação: 02/07/2013 11:24:23
// Usuário publicador: Administrator
// Descrição:
//   Modificações no esquema do CA SD mantidas pelo Pintor de tela da web.
////////////////////////////////////////////////////////////////////////

TABLE_INFO z_niv_hier {
  INDEX SORT ASCENDING UNIQUE z_int_nivel ;
}

TABLE_INFO z_srv_categoria {
  INDEX SORT ASCENDING UNIQUE code ;
}

TABLE_INFO z_srv_ciclo_vida {
  INDEX SORT ASCENDING UNIQUE code ;
}

TABLE_INFO z_srv_foco {
  INDEX SORT ASCENDING UNIQUE code ;
}

TABLE_INFO z_srv_subcat {
  INDEX SORT ASCENDING UNIQUE code ;
}

TABLE_INFO z_srv_subcat2 {
  INDEX SORT ASCENDING UNIQUE code ;
}

TABLE_INFO z_srv_torre {
  INDEX SORT ASCENDING UNIQUE code ;
}

TABLE_INFO z_tipo_org {
  INDEX SORT ASCENDING UNIQUE name ;
}

TABLE_INFO z_tipo_solucao {
  INDEX SORT ASCENDING UNIQUE sym ;
}

TABLE_INFO z_tipo_trat_espec {
  INDEX SORT ASCENDING UNIQUE code ;
  INDEX SORT ASCENDING UNIQUE sym ;
}

TABLE_INFO ztransfcode {
  INDEX SORT ASCENDING UNIQUE sym ;
}
