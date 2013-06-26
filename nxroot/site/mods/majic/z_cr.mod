////////////////////////////////////////////////////////////////////////////
// Module:      z_cr.mod
// Author:      Alex Paz
// Created:     Wednesday, June 19, 2013 4:59:45 PM
////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////
//
// Description: 
//              
////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// DB INIT - 3xxx


////////////////////////////////////////////////////////////////////////////////
// NEW_INIT - 4xxx


////////////////////////////////////////////////////////////////////////////////
// Pre Validate - 5xxx
// Author:      Alex Paz - Wednesday, June 19, 2013 5:00:08 PM 
// Description: Define o tipo do ticket de acordo com o atributo z_srl_tipo da categoria 
MODIFY cr PRE_VALIDATE
    z_cr_def_tipo_ticket( category )
    5000 FILTER( (EVENT("INSERT UPDATE")) && category{} && category != NULL && type != "P") ;
////////////////////////////////////////////////////////////////////////////////
// Post Validate - 6xxx


////////////////////////////////////////////////////////////////////////////////
// Post CI - 7xxx
// Author:      Alex Paz - Friday, June 21, 2013 12:37:24 PM 
// Description: Controla ciclo de vida do ticket depende de 
MODIFY cr POST_CI
    z_cr_status_depende( persistent_id, z_srl_cr )
    7000 FILTER( (EVENT("INSERT UPDATE")) && z_srl_cr!=NULL && status{} ) ;
    
// Author:      Alex Paz - Friday, June 21, 2013 6:07:17 PM 
// Description: Incrementa o controle ao no ticket reclassificar 
MODIFY cr POST_CI
    z_cr_grava_reclass( persistent_id, z_int_reclass, category )
    7010 FILTER( (EVENT("UPDATE")) && ( category{} && category != NULL ) && type != "P" ) ;
    
// Author:      Alex Paz - Monday, June 24, 2013 12:17:36 PM 
// Description: Replica informações do pai no relacionamento dos filhos 
MODIFY cr POST_CI
    z_cr_definicoes_filho( persistent_id, parent )
    7020 FILTER( (EVENT("INSERT UPDATE")) && ( parent{NULL->} ) && type != "P" ) ;     

// Author:      Alex Paz - Friday, June 26, 2013 1:47:01 AM
// Description: Incrementa o controle no ticket ao redirecionar para outro grupo
MODIFY cr POST_CI
    z_cr_grava_redir( persistent_id, z_int_num_redir, group )
    7030 FILTER( (EVENT("UPDATE")) && ( group{} && group != NULL ) && type != "P" ) ;
