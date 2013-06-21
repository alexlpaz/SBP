////////////////////////////////////////////////////////////////////////////
// Module:      z_factories.mod
// Author:      Alex Paz
// Created:     Thursday, June 20, 2013 1:38:51 PM
////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////
//
// Description: Factories para auxiliar no automacao dos processos
//              
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//  Factory
OBJECT cr {
    FACTORY z_cr {
        RESTRICT "type != 'P'" { type = 'I', type = 'R' } ;

    	DOMSET template_list "template_name" "" DYNAMIC ;

        DOMSET z_cr_list_web "open_date DESC, id DESC, mintime=min(attached_slas.time_to_violation), mintgt=min(target_times.target_time), status=status.sym, priority=priority.sym DESC, ref_num" "" STATIC ;

        DOMSET z_cr_list_web_active_only "open_date DESC, id DESC, mintime=min(attached_slas.time_to_violation), mintgt=min(target_times.target_time), status=status.sym, priority=priority.sym DESC, ref_num" "" STATIC { WHERE "active=1"; };

        STANDARD_LISTS {
                SORT_BY "open_date DESC, id DESC, status=status.sym, priority=priority.sym DESC, ref_num" ;
                MLIST OFF ;
                RLIST OFF ;
        };

        REL_ATTR persistent_id ;
        COMMON_NAME ref_num ;
        FUNCTION_GROUP "call_mgr" ;
    } ;
} ;  

OBJECT pcat {    
    FACTORY z_pcat_ss {
        RESTRICT "ss_include = 1 AND ss_sym IS NOT NULL AND (z_srl_tipo='R' OR z_srl_tipo='I')" {ss_include = 1} ;

        STANDARD_LISTS {
            SORT_BY "ss_sym" ;
			WHERE "delete_flag = 0" ; 
            MLIST OFF ;
            RLIST OFF ;
        };

		REL_ATTR persistent_id ; 	
  		COMMON_NAME ss_sym ;
		FUNCTION_GROUP "reference" ;
	};
};