CREATE TABLE "public.usuario" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"senha" TEXT NOT NULL,
	CONSTRAINT "usuario_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.produtos" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL,
	"preco" TEXT NOT NULL,
	"categoriaId" TEXT NOT NULL,
	"tamanhoId" TEXT NOT NULL,
	"imagemPrincipal" integer NOT NULL,
	CONSTRAINT "produtos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.vendas" (
	"id" serial NOT NULL,
	"status" TEXT NOT NULL,
	"data" DATE NOT NULL,
	"enderecoId" integer NOT NULL,
	"userId" integer NOT NULL,
	CONSTRAINT "vendas_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.imagem" (
	"id" serial NOT NULL,
	"url" TEXT NOT NULL,
	"produtoId" integer NOT NULL,
	CONSTRAINT "imagem_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.vendasProdutos" (
	"id" serial NOT NULL,
	"vendasId" integer NOT NULL,
	"produtoId" integer NOT NULL,
	"quantidade" integer NOT NULL,
	"valorPago" integer NOT NULL,
	CONSTRAINT "vendasProdutos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.endereco" (
	"id" serial NOT NULL,
	"rua" TEXT NOT NULL,
	"numero" integer NOT NULL,
	"complemento" TEXT NOT NULL,
	"cep" TEXT NOT NULL,
	"cidade" TEXT NOT NULL,
	"estado" TEXT NOT NULL,
	"usuarioId" integer NOT NULL,
	CONSTRAINT "endereco_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categoria" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL,
	CONSTRAINT "categoria_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.tamanho" (
	"id" serial NOT NULL,
	"nome" serial NOT NULL,
	CONSTRAINT "tamanho_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "produtos" ADD CONSTRAINT "produtos_fk0" FOREIGN KEY ("categoriaId") REFERENCES "categoria"("id");
ALTER TABLE "produtos" ADD CONSTRAINT "produtos_fk1" FOREIGN KEY ("tamanhoId") REFERENCES "tamanho"("id");
ALTER TABLE "produtos" ADD CONSTRAINT "produtos_fk2" FOREIGN KEY ("imagemPrincipal") REFERENCES "imagem"("id");

ALTER TABLE "vendas" ADD CONSTRAINT "vendas_fk0" FOREIGN KEY ("enderecoId") REFERENCES "endereco"("id");
ALTER TABLE "vendas" ADD CONSTRAINT "vendas_fk1" FOREIGN KEY ("userId") REFERENCES "usuario"("id");

ALTER TABLE "imagem" ADD CONSTRAINT "imagem_fk0" FOREIGN KEY ("produtoId") REFERENCES "produtos"("id");

ALTER TABLE "vendasProdutos" ADD CONSTRAINT "vendasProdutos_fk0" FOREIGN KEY ("vendasId") REFERENCES "vendas"("id");
ALTER TABLE "vendasProdutos" ADD CONSTRAINT "vendasProdutos_fk1" FOREIGN KEY ("produtoId") REFERENCES "produtos"("id");

ALTER TABLE "endereco" ADD CONSTRAINT "endereco_fk0" FOREIGN KEY ("usuarioId") REFERENCES "usuario"("id");











