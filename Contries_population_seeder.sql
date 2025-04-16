USE refugeedb;

USE refugeedb;

-- Populate the region table
INSERT INTO region (region_name)
VALUES
    ('Africa'),
    ('Asia'),
    ('Europe'),
    ('North America'),
    ('Oceania'),
    ('South America');

-- Insert countries
INSERT INTO country (count_name, region_id) VALUES
-- Africa (region_id = 1)
('Algeria', 1), ('Angola', 1), ('Benin', 1), ('Botswana', 1), ('Burkina Faso', 1), ('Burundi', 1),
('Cameroon', 1), ('Cape Verde', 1), ('Central African Republic', 1), ('Chad', 1), ('Comoros', 1), ('Congo (Brazzaville)', 1),
('Congo (Kinshasa)', 1), ('Djibouti', 1), ('Egypt', 1), ('Equatorial Guinea', 1), ('Eritrea', 1), ('Eswatini', 1),
('Ethiopia', 1), ('Gabon', 1), ('Gambia', 1), ('Ghana', 1), ('Guinea', 1), ('Guinea-Bissau', 1),
('Ivory Coast', 1), ('Kenya', 1), ('Lesotho', 1), ('Liberia', 1), ('Libya', 1), ('Madagascar', 1),
('Malawi', 1), ('Mali', 1), ('Mauritania', 1), ('Mauritius', 1), ('Morocco', 1), ('Mozambique', 1),
('Namibia', 1), ('Niger', 1), ('Nigeria', 1), ('Rwanda', 1), ('Sao Tome and Principe', 1), ('Senegal', 1),
('Seychelles', 1), ('Sierra Leone', 1), ('Somalia', 1), ('South Africa', 1), ('South Sudan', 1), ('Sudan', 1),
('Tanzania', 1), ('Togo', 1), ('Tunisia', 1), ('Uganda', 1), ('Zambia', 1), ('Zimbabwe', 1),

-- Asia (region_id = 2)
('Afghanistan', 2), ('Armenia', 2), ('Azerbaijan', 2), ('Bahrain', 2), ('Bangladesh', 2), ('Bhutan', 2),
('Brunei', 2), ('Cambodia', 2), ('China', 2), ('Cyprus', 2), ('Georgia', 2), ('India', 2),
('Indonesia', 2), ('Iran', 2), ('Iraq', 2), ('Israel', 2), ('Japan', 2), ('Jordan', 2),
('Kazakhstan', 2), ('Kuwait', 2), ('Kyrgyzstan', 2), ('Laos', 2), ('Lebanon', 2), ('Malaysia', 2),
('Maldives', 2), ('Mongolia', 2), ('Myanmar', 2), ('Nepal', 2), ('North Korea', 2), ('Oman', 2),
('Pakistan', 2), ('Palestine', 2), ('Philippines', 2), ('Qatar', 2), ('Saudi Arabia', 2), ('Singapore', 2),
('South Korea', 2), ('Sri Lanka', 2), ('Syria', 2), ('Taiwan', 2), ('Tajikistan', 2), ('Thailand', 2),
('Timor-Leste', 2), ('Turkey', 2), ('Turkmenistan', 2), ('United Arab Emirates', 2), ('Uzbekistan', 2), ('Vietnam', 2),
('Yemen', 2),

-- Europe (region_id = 3)
('Albania', 3), ('Andorra', 3), ('Austria', 3), ('Belarus', 3), ('Belgium', 3), ('Bosnia and Herzegovina', 3),
('Bulgaria', 3), ('Croatia', 3), ('Czech Republic', 3), ('Denmark', 3), ('Estonia', 3), ('Finland', 3),
('France', 3), ('Germany', 3), ('Greece', 3), ('Hungary', 3), ('Iceland', 3), ('Ireland', 3),
('Italy', 3), ('Kosovo', 3), ('Latvia', 3), ('Liechtenstein', 3), ('Lithuania', 3), ('Luxembourg', 3),
('Malta', 3), ('Moldova', 3), ('Monaco', 3), ('Montenegro', 3), ('Netherlands', 3), ('North Macedonia', 3),
('Norway', 3), ('Poland', 3), ('Portugal', 3), ('Romania', 3), ('Russia', 3), ('San Marino', 3),
('Serbia', 3), ('Slovakia', 3), ('Slovenia', 3), ('Spain', 3), ('Sweden', 3), ('Switzerland', 3),
('Ukraine', 3), ('United Kingdom', 3), ('Vatican City', 3),

-- North America (region_id = 4)
('Antigua and Barbuda', 4), ('Bahamas', 4), ('Barbados', 4), ('Belize', 4), ('Canada', 4), ('Costa Rica', 4),
('Cuba', 4), ('Dominica', 4), ('Dominican Republic', 4), ('El Salvador', 4), ('Grenada', 4), ('Guatemala', 4),
('Haiti', 4), ('Honduras', 4), ('Jamaica', 4), ('Mexico', 4), ('Nicaragua', 4), ('Panama', 4),
('Saint Kitts and Nevis', 4), ('Saint Lucia', 4), ('Saint Vincent and the Grenadines', 4), ('Trinidad and Tobago', 4), ('United States', 4),

-- Oceania (region_id = 5)
('Australia', 5), ('Fiji', 5), ('Kiribati', 5), ('Marshall Islands', 5), ('Micronesia', 5), ('Nauru', 5),
('New Zealand', 5), ('Palau', 5), ('Papua New Guinea', 5), ('Samoa', 5), ('Solomon Islands', 5), ('Tonga', 5),
('Tuvalu', 5), ('Vanuatu', 5),

-- South America (region_id = 6)
('Argentina', 6), ('Bolivia', 6), ('Brazil', 6), ('Chile', 6), ('Colombia', 6), ('Ecuador', 6),
('Guyana', 6), ('Paraguay', 6), ('Peru', 6), ('Suriname', 6), ('Uruguay', 6), ('Venezuela', 6);