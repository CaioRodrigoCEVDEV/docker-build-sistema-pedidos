
\connect "DBSYSTEM";

-- ===== TABELA: usu =====
-- conforme README (pk composta usucod + usuemail) 
CREATE TABLE IF NOT EXISTS public.usu (
  usucod   serial4 NOT NULL,
  usunome  varchar NULL,
  usuemail varchar(120) NOT NULL,
  ususenha varchar(32) NULL,
  usuadm   bpchar(1) DEFAULT 'N',
  CONSTRAINT pk_usu PRIMARY KEY (usucod, usuemail)
);

-- ===== TABELA: marcas =====
CREATE TABLE IF NOT EXISTS public.marcas (
  marcascod  serial4 NOT NULL,
  marcasdes  varchar(40) NULL,
  marcassit  bpchar(1) DEFAULT 'A',
  CONSTRAINT pk_marcas PRIMARY KEY (marcascod)
);

-- ===== TABELA: modelo =====
CREATE TABLE IF NOT EXISTS public.modelo (
  modcod        serial4 NOT NULL,
  moddes        varchar(40) NULL,
  modsit        bpchar(1) DEFAULT 'A',
  modmarcascod  int4 NULL,
  ordem         int4 NULL,
  CONSTRAINT pk_modelo PRIMARY KEY (modcod),
  CONSTRAINT fk_modelo_marcas FOREIGN KEY (modmarcascod) REFERENCES public.marcas(marcascod)
);

-- ===== TABELA: tipo =====
CREATE TABLE IF NOT EXISTS public.tipo (
  tipocod  serial4 NOT NULL,
  tipodes  varchar(40) NULL,
  tiposit  bpchar(1) DEFAULT 'A',
  CONSTRAINT pk_tipo PRIMARY KEY (tipocod)
);

-- ===== TABELA: cores =====
CREATE TABLE IF NOT EXISTS public.cores (
  corcod  serial PRIMARY KEY,
  cornome varchar(50) NOT NULL
);

-- ===== TABELA: pro (produto) =====
CREATE TABLE IF NOT EXISTS public.pro (
  procod        serial4 NOT NULL,
  prodes        varchar(40) NULL,
  promarcascod  int4 NULL,
  protipocod    int4 NULL,
  promodcod     int4 NULL,
  prosit        bpchar(1) DEFAULT 'A',
  provl         numeric(14,4) NULL,
  prousucad     int4 NULL,
  prodtcad      timestamp DEFAULT CURRENT_TIMESTAMP NULL,
  prousualt     int4 NULL,
  prodtalt      timestamp NULL,
  procor        int NULL,
  CONSTRAINT pk_pro PRIMARY KEY (procod),
  CONSTRAINT fk_pro_cor     FOREIGN KEY (procor)        REFERENCES public.cores(corcod),
  CONSTRAINT fk_pro_marcas  FOREIGN KEY (promarcascod)  REFERENCES public.marcas(marcascod),
  CONSTRAINT fk_pro_modelo  FOREIGN KEY (promodcod)     REFERENCES public.modelo(modcod),
  CONSTRAINT fk_pro_tipo    FOREIGN KEY (protipocod)    REFERENCES public.tipo(tipocod)
);

-- ===== TABELA: procor (vínculo produto x cor) =====
CREATE TABLE IF NOT EXISTS public.procor (
  procorprocod  int4 NOT NULL,
  procorcorescod int4 NOT NULL,
  procorid      serial4 NOT NULL,
  CONSTRAINT pk_procor PRIMARY KEY (procorprocod, procorcorescod)
);

-- ===== TABELA: emp (empresa) =====
CREATE TABLE IF NOT EXISTS public.emp (
  emprazao     varchar(254) NULL,
  empwhatsapp1 varchar(13) NULL,
  empwhatsapp2 varchar(13) NULL
);
