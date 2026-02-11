

SELECT      [FIRST_NAME]            = U.[usr_fname]
            ,[LAST_NAME]            = U.[usr_lname]
            ,[TMW_ID]               = U.[usr_userid]
            ,[EMAIL]                = U.[usr_mail_address]
            ,[MODULE_ID]            = D.[moduleid]
            ,[MODULE_NAME]          = D.[modulename]
            ,[LAST_ACCESS]          = A.[LAST_DT]
            ,[GROUP_ID]             = GA.[grp_id]
FROM  ttsusers U WITH (NOLOCK)
            LEFT JOIN ttsmappings M WITH (NOLOCK)
                  ON U.[usr_userid] = M.[userid]
            LEFT JOIN ttsmodules D WITH (NOLOCK)
                  ON M.[moduleid] = D.[moduleid]
            LEFT JOIN ttsgroupasgn GA WITH (NOLOCK)
                  ON U.[usr_userid] = GA.[usr_userid]
            LEFT JOIN ( SELECT      [USER_ID]   = A.[updated_by]
                                          ,[LAST_DT]  = MAX(A.[updated_dt])
                              FROM  expedite_audit A WITH (NOLOCK)
                              WHERE A.[updated_dt] >= '20150601'
                              GROUP BY A.[updated_by]
                           ) A
                  ON U.[usr_userid] = A.[USER_ID]
ORDER BY [TMW_ID]
            ,[MODULE_ID]


