\connect "DBSYSTEM";
INSERT INTO public.usu (usunome, usuemail, ususenha, usuadm)
VALUES ('Administrador', 'admin@admin.com', md5('admin@'), 'S');
