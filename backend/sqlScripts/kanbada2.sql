CREATE TABLE public.usuarios (
	"id" varchar(64) NOT NULL,
	"data_criacao" TIMESTAMP NOT NULL,
	"usuario" varchar(120) NOT NULL,
	"email" varchar(120) NOT NULL,
	"senha" varchar(120) NOT NULL,
	CONSTRAINT "usuarios_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.projetos (
	"id" varchar(64) NOT NULL,
	"nome" varchar(120) NOT NULL,
	"data_criacao" TIMESTAMP NOT NULL,
	"ultimo_acesso" TIMESTAMP NOT NULL,
	"adm" varchar(64) NOT NULL,
	"deletado" boolean,
	CONSTRAINT "projetos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.colunas (
	"id" serial NOT NULL,
	"projeto_id" varchar NOT NULL,
	"nome" varchar(30) NOT NULL,
	"data_criacao" TIMESTAMP NOT NULL,
	"ordem" integer NOT NULL,
	CONSTRAINT "colunas_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.tarefas (
	"id" serial NOT NULL,
	"coluna_id" integer NOT NULL,
	"data_criacao" TIMESTAMP NOT NULL,
	"nome" varchar NOT NULL,
	"ordem" integer NOT NULL,
	"tags" varchar(255) NOT NULL,
	"anotacoes" varchar NOT NULL,
	"colaboradores" varchar NOT NULL,
	CONSTRAINT "tarefas_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.projetos_usuarios (
	"id" serial NOT NULL,
	"usuario_id" varchar NOT NULL,
	"projeto_id" varchar NOT NULL,
	CONSTRAINT "projetos_usuarios_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);





ALTER TABLE colunas ADD CONSTRAINT "colunas_fk0" FOREIGN KEY ("projeto_id") REFERENCES "projetos"("id");
ALTER TABLE tarefas ADD CONSTRAINT "tarefas_fk0" FOREIGN KEY ("coluna_id") REFERENCES "colunas"("id");
ALTER TABLE projetos_usuarios ADD CONSTRAINT "projetos_usuarios_fk0" FOREIGN KEY ("usuario_id") REFERENCES "usuarios"("id");
ALTER TABLE projetos_usuarios ADD CONSTRAINT "projetos_usuarios_fk1" FOREIGN KEY ("projeto_id") REFERENCES "projetos"("id");



