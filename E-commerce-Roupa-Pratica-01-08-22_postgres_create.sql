CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL UNIQUE,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categories" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.size" (
	"id" serial NOT NULL,
	"name" varchar(5) NOT NULL,
	CONSTRAINT "size_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.photos" (
	"id" serial NOT NULL,
	"description" TEXT,
	"url" TEXT NOT NULL,
	CONSTRAINT "photos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	"categoryId" integer NOT NULL,
	"sizeId" integer NOT NULL,
	"price" money NOT NULL,
	"photoPrincipalId" integer NOT NULL,
	"photosId" TEXT NOT NULL DEFAULT '0',
	"avaiable" BOOLEAN NOT NULL DEFAULT 'false',
	"storage" bigint NOT NULL DEFAULT '0',
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.purchases" (
	"id" serial NOT NULL,
	"userId" integer NOT NULL,
	"productId" integer NOT NULL,
	"amount" bigint NOT NULL DEFAULT '1',
	"date" TIMESTAMP NOT NULL DEFAULT 'Now()',
	"adress" TEXT,
	"status" TEXT NOT NULL,
	CONSTRAINT "purchases_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);







ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("categoryId") REFERENCES "categories"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("sizeId") REFERENCES "size"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk2" FOREIGN KEY ("photoPrincipalId") REFERENCES "photos"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk3" FOREIGN KEY ("photosId") REFERENCES "photos"("id");

ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");







