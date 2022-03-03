Select nombre, id_puesto, level
From empleados
start with id_empleado = 100 Connect By Prior id_empleado = id_supervisor;


-- creando una jerarquía de forma más gráfica
select 
    level, nombre, id_puesto, 
    sys_connect_by_path(nombre, ' \ ') JERARQUIA
from empleados
start with id_supervisor is null
connect by prior id_empleado = id_supervisor;
