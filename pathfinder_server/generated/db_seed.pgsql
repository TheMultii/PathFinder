-- Clear existing data
TRUNCATE TABLE visit_point_image, visit_point, pathfinder_route RESTART IDENTITY;

-- Seed data for VisitPointImage table
INSERT INTO visit_point_image (url, description) VALUES
  ('https://api.mganczarczyk.pl/cyberpunk-background?seed=1', 'Cityscape with neon lights at night'),
  ('https://api.mganczarczyk.pl/cyberpunk-background?seed=2', 'Iconic skyscraper in the cyberpunk city'),
  ('https://api.mganczarczyk.pl/cyberpunk-background?seed=3', 'Gritty atmosphere of a cyberpunk bar'),
  ('https://api.mganczarczyk.pl/cyberpunk-background?seed=4', 'Futuristic skyline with holographic billboards'),
  ('https://api.mganczarczyk.pl/cyberpunk-background?seed=5', 'Neon lights and cyberpunk art on the streets'),
  ('https://api.mganczarczyk.pl/cyberpunk-background?seed=6', 'High-tech district with advanced technology'),
  ('https://api.mganczarczyk.pl/cyberpunk-background?seed=7', 'Corporate park with modern architecture');


-- Seed data for VisitPoint table
INSERT INTO visit_point_image (url, description) VALUES
  ('https://api.mganczarczyk.pl/cyberpunk-background?seed=1', 'Cityscape with neon lights at night'),
  ('https://api.mganczarczyk.pl/cyberpunk-background?seed=2', 'Iconic skyscraper in the cyberpunk city'),
  ('https://api.mganczarczyk.pl/cyberpunk-background?seed=3', 'Gritty atmosphere of a cyberpunk bar'),
  ('https://api.mganczarczyk.pl/cyberpunk-background?seed=4', 'Futuristic skyline with holographic billboards'),
  ('https://api.mganczarczyk.pl/cyberpunk-background?seed=5', 'Neon lights and cyberpunk art on the streets'),
  ('https://api.mganczarczyk.pl/cyberpunk-background?seed=6', 'High-tech district with advanced technology'),
  ('https://api.mganczarczyk.pl/cyberpunk-background?seed=7', 'Corporate park with modern architecture');

-- Seed data for PathfinderRoute table
-- INSERT INTO pathfinder_route (name, description, points) VALUES
--  ('Castle and Nature', 'Explore the castle and natural wonders', '[1, 2, 3]'),
--  ('Riverside Stroll', 'Enjoy the scenic Wisła River', '[4, 5, 6]'),
--  ('Historic and Hiking', 'Combination of history and nature', '[1, 3, 7]'),
--  ('City and Mountain', 'Urban and natural attractions', '[2, 5, 7]');

INSERT INTO pathfinder_route (name, description, points) VALUES
  (
    'Night City Tour',
    'A cyberpunk-themed tour of a dystopian city',
    '[{"id":1,"name":"Fake Night City","description":"Cityscape with neon lights at night","images":[{"id":1,"url":"https://api.mganczarczyk.pl/cyberpunk-background?seed=1","description":"Cityscape with neon lights at night"}],"long":19.0419,"lat":49.8225},{"id":2,"name":"Bielsko Castle","description":"Medieval castle with stunning views","images":[{"id":2,"url":"https://api.mganczarczyk.pl/cyberpunk-background?seed=2","description":"Iconic castle view"}],"long":19.0450,"lat":49.8117},{"id":3,"name":"Twardowski Rocks","description":"Nature reserve with unique rock formations","images":[{"id":3,"url":"https://api.mganczarczyk.pl/cyberpunk-background?seed=3","description":"Rock formations in a natural reserve"}],"long":19.0473,"lat":49.8100}]'
  ),
  (
    'Historic and Hiking',
    'Combination of history and nature',
    '[{"id":4,"name":"Wapienica Valley","description":"Scenic hiking trail along the river","images":[{"id":4,"url":"https://api.mganczarczyk.pl/cyberpunk-background?seed=4","description":"Foggy river trail"}],"long":18.9482,"lat":49.8321},{"id":5,"name":"Old Town Square","description":"Historic market square with cafes and shops","images":[{"id":5,"url":"https://api.mganczarczyk.pl/cyberpunk-background?seed=5","description":"Cobbled streets in the old town"}],"long":19.0346,"lat":49.8227},{"id":6,"name":"Wisła River Promenade","description":"Relaxing riverside walk with cafes","images":[{"id":6,"url":"https://api.mganczarczyk.pl/cyberpunk-background?seed=6","description":"Sunset by the riverside"}],"long":19.0352,"lat":49.8195}]'
  ),
  (
    'City and Mountain',
    'Urban and natural attractions',
    '[{"id":7,"name":"Szyndzielnia Mountain","description":"Panoramic views from the mountain top","images":[{"id":7,"url":"https://api.mganczarczyk.pl/cyberpunk-background?seed=7","description":"Mountain summit panorama"}],"long":19.0508,"lat":49.8187},{"id":2,"name":"Bielsko Castle","description":"Medieval castle with stunning views","images":[{"id":2,"url":"https://api.mganczarczyk.pl/cyberpunk-background?seed=2","description":"Iconic castle view"}],"long":19.0431,"lat":49.8234},{"id":3,"name":"Twardowski Rocks","description":"Nature reserve with unique rock formations","images":[{"id":3,"url":"https://api.mganczarczyk.pl/cyberpunk-background?seed=3","description":"Rock formations in a natural reserve"}],"long":18.9972,"lat":49.8376}]'
  ),
  (
    'Urban Exploration',
    'Discover the city and its hidden gems',
    '[{"id":1,"name":"Fake Night City","description":"Cityscape with neon lights at night","images":[{"id":1,"url":"https://api.mganczarczyk.pl/cyberpunk-background?seed=1","description":"Cityscape with neon lights at night"}],"long":52.11,"lat":48.25},{"id":5,"name":"Neon Alley","description":"Street filled with neon signs and cyberpunk art","images":[{"id":5,"url":"https://api.mganczarczyk.pl/cyberpunk-background?seed=5","description":"Custom description for image 5"}],"long":51.75,"lat":48.20},{"id":7,"name":"Corporate Park","description":"Landscaped park in the heart of corporate offices","images":[{"id":7,"url":"https://api.mganczarczyk.pl/cyberpunk-background?seed=7","description":"Custom description for image 7"}],"long":51.90,"lat":48.28},{"id":4,"name":"Wapienica Valley","description":"Scenic hiking trail along the river","images":[{"id":4,"url":"https://api.mganczarczyk.pl/cyberpunk-background?seed=4","description":"Foggy river trail"}],"long":18.9482,"lat":49.8321},{"id":3,"name":"Twardowski Rocks","description":"Nature reserve with unique rock formations","images":[{"id":3,"url":"https://api.mganczarczyk.pl/cyberpunk-background?seed=3","description":"Rock formations in a natural reserve"}],"long":18.9972,"lat":49.8376}]'
  );