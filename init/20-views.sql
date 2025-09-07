
\connect "DBSYSTEM";

-- View Tipo de Peças
CREATE OR REPLACE VIEW public.vw_tipo_pecas AS
SELECT
  tipo.tipocod,
  tipo.tipodes,
  pro.promarcascod,
  pro.promodcod
FROM pro
JOIN tipo ON tipo.tipocod = pro.protipocod
GROUP BY tipo.tipocod, tipo.tipodes, pro.promarcascod, pro.promodcod;

-- View Marcas
CREATE OR REPLACE VIEW public.vw_marcas AS
SELECT
  marcas.marcascod,
  marcas.marcasdes,
  marcas.marcassit
FROM marcas;

-- View Modelos
CREATE OR REPLACE VIEW public.vw_modelos AS
SELECT
  modelo.modcod,
  modelo.moddes,
  modelo.modsit,
  modelo.modmarcascod,
  modelo.ordem
FROM modelo
ORDER BY
  substring(modelo.moddes from '^\D*'),
  (substring(modelo.moddes from '\d+')::integer);
