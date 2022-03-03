# levantar base de datos
docker run -d -it --name Oracle12 store/oracle/database-enterprise:12.2.0.1-slim
docker run -d -it --name Oracle12 store/oracle/database-enterprise:12.2.0.1

# configuracion
usuario: sys
contraseña: Oradoc_db1
rol: SYSDBA
sid: ORCLCDB


