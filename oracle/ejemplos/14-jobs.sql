-- DBMS_SCHEDULER
Begin
    sys.dbms_scheduler.create_job(
        job_name => 'job_test', 
        job_type => 'PLSQL_BLOCK', 
        job_action => '
        declare
            v_conteo number := 0;
            begin
                select count(*) into v_conteo
                from log_actividades;
                insert into log_actividades values(v_conteo+1, sysdate);
                commit;
            end;
        ',
        start_date => systimestamp,
        repeat_interval => 'freq=secondly; interval=5',
        end_date => null,
        enabled => true,
        comments => 'log de actividades'
    );
End;

-- desactivar un jobs
BEGIN
      DBMS_SCHEDULER.disable(name=>'"SYS"."JOB_TEST"', force => TRUE);
END;

-- activar un jobs
BEGIN
      dbms_scheduler.enable(name=>'"SYS"."JOB_TEST"', force => TRUE);
END;
