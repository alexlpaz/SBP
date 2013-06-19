////////////////////////////////////////////////////////////////////////
// Arquivo:      wsp_index.sch
// Data de publicação: 19/06/2013 15:41:58
// Usuário publicador: ServiceDesk
// Descrição:
//   Modificações no esquema do CA SD mantidas pelo Pintor de tela da web.
////////////////////////////////////////////////////////////////////////

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

TABLE_INFO z_tipo_trat_espec {
  INDEX SORT ASCENDING UNIQUE code ;
  INDEX SORT ASCENDING UNIQUE sym ;
}

TABLE_INFO ztransfcode {
  INDEX SORT ASCENDING UNIQUE sym ;
}
