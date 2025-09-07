\connect "DBSYSTEM";
INSERT INTO public.usu (usunome, usuemail, ususenha, usuadm)
VALUES ('Administrador', 'admin@admin.com', md5('admin@'), 'S');

INSERT INTO public.emp (emprazao, empwhatsapp1, empwhatsapp2)
VALUES('Empresa', '', '');