# 🐘 dbsistema-pedidos

Imagem Docker personalizada com PostgreSQL 17, já configurada com:

- Banco de dados **DBSYSTEM**
- Estrutura de tabelas e views do projeto [sistema_pedidos](https://github.com/CaioRodrigoCEVDEV/sistema_pedidos)
- Usuário inicial inserido em `public.usu`

---

## 🚀 Como usar

### Buildar a imagem
```bash
docker build -t dbsistema-pedidos:latest .
