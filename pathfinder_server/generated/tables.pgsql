--
-- Class PathfinderRoute as table pathfinder_route
--

CREATE TABLE "pathfinder_route" (
  "id" serial,
  "name" text NOT NULL,
  "description" text NOT NULL,
  "points" json NOT NULL
);

ALTER TABLE ONLY "pathfinder_route"
  ADD CONSTRAINT pathfinder_route_pkey PRIMARY KEY (id);


--
-- Class VisitPoint as table visit_point
--

CREATE TABLE "visit_point" (
  "id" serial,
  "name" text NOT NULL,
  "description" text,
  "images" json NOT NULL,
  "long" double precision NOT NULL,
  "lat" double precision NOT NULL
);

ALTER TABLE ONLY "visit_point"
  ADD CONSTRAINT visit_point_pkey PRIMARY KEY (id);


--
-- Class VisitPointImage as table visit_point_image
--

CREATE TABLE "visit_point_image" (
  "id" serial,
  "url" text NOT NULL,
  "description" text
);

ALTER TABLE ONLY "visit_point_image"
  ADD CONSTRAINT visit_point_image_pkey PRIMARY KEY (id);


