--------------------------------------------------------------------------------
-- 1) CREATE TABLES
--------------------------------------------------------------------------------

CREATE TABLE dbo.Customers (
    CUSTOMER_ID    INT             NOT NULL PRIMARY KEY,
    FULL_NAME      NVARCHAR(100)   NOT NULL,
    EMAIL_ADDRESS  NVARCHAR(100)   NOT NULL
);
GO

CREATE TABLE dbo.Products (
    PRODUCT_ID     INT             NOT NULL PRIMARY KEY,
    PRODUCT_NAME   NVARCHAR(200)   NOT NULL,
    UNIT_PRICE     DECIMAL(10,2)   NOT NULL
);
GO

CREATE TABLE dbo.Stores (
    STORE_ID       INT             NOT NULL PRIMARY KEY,
    STORE_NAME     NVARCHAR(100)   NOT NULL,
    WEB_ADDRESS    NVARCHAR(200)   NULL,
    LATITUDE       DECIMAL( 9,6)   NULL,
    LONGITUDE      DECIMAL( 9,6)   NULL
);
GO

CREATE TABLE dbo.OrderItems (
    ORDER_ID       INT             NOT NULL,
    LINE_ITEM_ID   SMALLINT        NOT NULL,
    PRODUCT_ID     INT             NOT NULL,
    UNIT_PRICE     DECIMAL(10,2)   NOT NULL,
    QUANTITY       SMALLINT        NOT NULL,
    CONSTRAINT PK_OrderItems PRIMARY KEY (ORDER_ID, LINE_ITEM_ID)
);
GO


--------------------------------------------------------------------------------
-- 2) INSERT CUSTOMERS
--------------------------------------------------------------------------------
INSERT INTO dbo.Customers (CUSTOMER_ID, FULL_NAME, EMAIL_ADDRESS) VALUES
 (  1, 'Jeanette Penddreth',             'jpenddreth0@census.gov'),
 (  2, 'Giavani Frediani',               'gfrediani1@senate.gov'),
 (  3, 'Noell Beaudry',                  'nbeaudry2@imageshack.us'),
 (  4, 'Willard Valek',                  'wvalek3@vk.com'),
 (  5, 'Maria Papagallo',                'mpapagallo4@quantcast.com'),
 (  6, 'Carlee Keer',                    'ckeer5@tumblr.com');
GO


--------------------------------------------------------------------------------
-- 3) INSERT PRODUCTS
--------------------------------------------------------------------------------
INSERT INTO dbo.Products (PRODUCT_ID, PRODUCT_NAME, UNIT_PRICE) VALUES
 (  1, 'Chai',                                  18.00),
 (  2, 'Chang',                                 19.00),
 (  3, 'Aniseed Syrup',                        10.00),
 (  4, 'Chef Anton''s Cajun Seasoning',        22.00),
 (  5, 'Chef Anton''s Gumbo Mix',              21.35),
 (  6, 'Grandma''s Boysenberry Spread',        25.00),
 (  7, 'Uncle Bob''s Organic Dried Pears',     30.00),
 (  8, 'Northwoods Cranberry Sauce',           40.00),
 (  9, 'Mishi Kobe Niku',                      97.00),
 ( 10, 'Ikura',                                31.00),
 ( 11, 'Queso Cabrales',                       21.00),
 ( 12, 'Queso Manchego La Pastora',            38.00),
 ( 13, 'Konbu',                                 6.00),
 ( 14, 'Tofu',                                 23.25),
 ( 15, 'Ichimi Togarashi',                   4.50),
 ( 16, 'Gumbo Mix',                            21.35),
 ( 17, 'Carnarvon Tigers',                     62.50),
 ( 18, 'Teatime Chocolate Biscuits',            9.20),
 ( 19, 'Sir Rodney''s Marmalade',             81.00),
 ( 20, 'Sir Rodney''s Scones',                10.00),
 ( 21, 'Gustaf''s Knäckebröd',                21.00),
 ( 22, 'Tunnbröd',                              9.00),
 ( 23, 'Guaraná Fantástica',                   4.50),
 ( 24, 'NuNuCa Nuß-Nougat-Creme',              14.00),
 ( 25, 'Gumbär Gummibärchen',                  31.23),
 ( 26, 'Schoggi Schokolade',                  43.90),
 ( 27, 'Rössle Sauerkraut',                   45.60),
 ( 28, 'Thüringer Rostbratwurst',              123.79),
 ( 29, 'Nord-Ost Matjeshering',                25.89),
 ( 30, 'Gorgonzola Telino',                    12.50),
 ( 31, 'Mascarpone Fabioli',                   32.00),
 ( 32, 'Geitost',                               2.50),
 ( 33, 'Valkoinen suklaa',                    16.25),
 ( 34, 'Manjimup Dried Apples',               53.00),
 ( 35, 'Filo Mix',                              7.00),
 ( 36, 'Perth Pasties',                       32.80),
 ( 37, 'Tourtière',                            7.45),
 ( 38, 'Pâté chinois',                        24.00),
 ( 39, 'Gnocchi di nonna Alice',              38.00),
 ( 40, 'Ravioli Angelo',                      19.50),
 ( 41, 'Escargots de Bourgogne',              13.25),
 ( 42, 'Vegie-spread',                        43.90),
 ( 43, 'Wimmers gute Semmelknödel',            9.50),
 ( 44, 'Louisiana Fiery Hot Pepper Sauce',     21.05),
 ( 45, 'Louisiana Hot Spiced Okra',            17.00),
 ( 46, 'Laughing Lumberjack Lager',            14.00),
 ( 47, 'Scottish Longbreads',                  12.50),
 ( 48, 'Gudbrandsdalsost',                    36.00),
 ( 49, 'Outback Lager',                        15.00),
 ( 50, 'Flotemysost',                         21.50);
GO


--------------------------------------------------------------------------------
-- 4) INSERT STORES
--------------------------------------------------------------------------------
INSERT INTO dbo.Stores (STORE_ID, STORE_NAME, WEB_ADDRESS, LATITUDE, LONGITUDE) VALUES
 (  1, 'Academy Museum of Motion Pictures',   'https://academy.museum',   34.063961, -118.358178),
 (  2, 'Adler Planetarium',                   'https://adlerplanetarium.org',41.866260, -87.606208),
 (  3, 'American Museum of Natural History',  'https://amnh.org',         40.781324, -73.973988),
 (  4, 'Asian Art Museum',                    'https://asianart.org',     37.780210, -122.416623),
 (  5, 'The Broad',                           'https://thebroad.org',     34.054432, -118.250907),
 (  6, 'Field Museum',                        'https://fieldmuseum.org',  41.866260, -87.617537),
 (  7, 'Guggenheim Museum',                   'https://guggenheim.org',   40.782884, -73.958971),
 (  8, 'J. Paul Getty Museum',                'https://getty.edu',        34.078036, -118.475443),
 (  9, 'Louvre Museum',                       'https://louvre.fr',        48.860611,   2.337644),
 ( 10, 'Metropolitan Museum of Art',          'https://metmuseum.org',    40.779437, -73.963244),
 ( 11, 'Museum of Modern Art',                'https://moma.org',         40.761433, -73.977622),
 ( 12, 'National Gallery of Art',             'https://nga.gov',          38.891262, -77.019868),
 ( 13, 'Philadelphia Museum of Art',          'https://philamuseum.org',  39.965608, -75.180041),
 ( 14, 'Rijksmuseum',                         'https://rijksmuseum.nl',   52.359998,   4.885219),
 ( 15, 'Solomon R. Guggenheim Museum',        'https://guggenheim.org',   40.783040, -73.959145),
 ( 16, 'State Hermitage Museum',              'https://hermitagemuseum.org',59.940510,  30.313780),
 ( 17, 'Tate Modern',                         'https://tate.org.uk',      51.507628,  -0.098345),
 ( 18, 'The British Museum',                  'https://britishmuseum.org',51.519413,  -0.126957),
 ( 19, 'Uffizi Gallery',                      'https://uffizi.it',        43.768732,  11.255536),
 ( 20, 'Van Gogh Museum',                     'https://vangoghmuseum.nl', 52.358416,   4.881076),
 ( 21, 'Victoria and Albert Museum',          'https://vam.ac.uk',        51.496639,  -0.172180),
 ( 22, 'Whitney Museum of American Art',      'https://whitney.org',      40.739587, -74.008863),
 ( 23, 'Art Institute of Chicago',            'https://artic.edu',        41.879587, -87.623713),
 ( 24, 'National Gallery, London',            'https://nationalgallery.org.uk',51.508929, -0.128299),
 ( 25, 'Prado Museum',                        'https://museodelprado.es',40.413780, -3.692127),
 ( 26, 'MoMA PS1',                            'https://momaps1.org',      40.745357, -73.947249),
 ( 27, 'Getty Villa',                         'https://getty.edu',        34.046906, -118.572854),
 ( 28, 'Museum of Fine Arts, Boston',         'https://mfa.org',          42.339641, -71.094224),
 ( 29, 'National Gallery of Art (DC)',        'https://nga.gov',          38.891262, -77.019868),
 ( 30, 'Solomon R. Guggenheim Museum (DC)',   'https://guggenheim.org',   40.783040, -73.959145);
GO

--------------------------------------------------------------------------------
-- 5) INSERT ORDERITEMS
--------------------------------------------------------------------------------
INSERT INTO dbo.OrderItems (ORDER_ID, LINE_ITEM_ID, PRODUCT_ID, UNIT_PRICE, QUANTITY) VALUES
(334, 1,  26, 48.75, 1),
(334, 2,  46, 39.16, 4),
(334, 3,  12, 10.48, 4),
(335, 1,  32,  5.65, 2),
(336, 1,   2, 29.55, 5),
(336, 2,  20, 28.21, 5),
(337, 1,  32,  5.65, 4),
(337, 2,  29, 24.71, 4),
(337, 3,  45, 31.68, 3),
(338, 1,  35,  7.18, 2),
(338, 2,  13, 12.64, 5),
(339, 1,  38, 22.98, 3),
(339, 2,  13, 12.64, 3),
(340, 1,  41,  8.66, 3),
(340, 2,  26, 48.75, 5),
(340, 3,  27, 39.91, 2),
(341, 1,  12, 10.48, 4),
(341, 2,  43, 16.64, 1),
(342, 1,  30, 37.34, 1),
(342, 2,  44, 39.32, 4),
(343, 1,   3, 16.67, 1),
(343, 2,  14, 26.14, 3),
(343, 3,   2, 29.55, 4),
(344, 1,  17, 39.89, 3),
(344, 2,  23, 10.33, 4),
(345, 1,  14, 26.14, 1),
(346, 1,   2, 29.55, 5),
(346, 2,  26, 48.75, 3),
(347, 1,  35,  7.18, 5),
(347, 2,  41,  8.66, 1),
(348, 1,   2, 29.55, 4),
(348, 2,  21, 38.34, 5),
(349, 1,  11, 30.69, 5),
(349, 2,  12, 10.48, 4),
(350, 1,  33, 37.00, 2),
(350, 2,  32,  5.65, 1),
(351, 1,  23, 10.33, 4),
(351, 2,  29, 24.71, 4),
(352, 1,  46, 39.16, 2),
(352, 2,  22, 39.78, 5),
(352, 3,  35,  7.18, 2),
(353, 1,  28, 10.24, 4),
(354, 1,  44, 39.32, 4),
(354, 2,  42, 10.11, 3),
(355, 1,  34, 23.32, 2),
(355, 2,  27, 39.91, 4),
(356, 1,   8, 19.58, 3),
(356, 2,  38, 22.98, 5),
(357, 1,  42, 10.11, 4),
(357, 2,  20, 28.21, 4),
(358, 1,  12, 10.48, 3),
(359, 1,  10, 29.49, 5),
(359, 2,   9, 21.16, 3),
(360, 1,  39, 11.00, 2),
(361, 1,  19, 14.34, 3),
(362, 1,   5, 43.71, 5),
(362, 2,   7, 19.16, 3),
(363, 1,  21, 38.34, 3),
(364, 1,  20, 28.21, 4),
(364, 2,  27, 39.91, 3),
(364, 3,  13, 12.64, 3),
(365, 1,   4, 44.17, 3),
(365, 2,  43, 16.64, 4),
(366, 1,  36, 49.12, 4),
(366, 2,  42, 10.11, 4),
(366, 3,  29, 24.71, 4),
(367, 1,   7, 19.16, 2),
(368, 1,  27, 39.91, 4),
(368, 2,  19, 14.34, 5),
(369, 1,  44, 39.32, 5),
(369, 2,  22, 39.78, 2),
(370, 1,  25,  9.80, 4),
(370, 2,  21, 38.34, 5),
(371, 1,   7, 19.16, 4),
(371, 2,  28, 10.24, 4),
(371, 3,  41,  8.66, 2),
(372, 1,  17, 39.89, 2),
(373, 1,  23, 10.33, 5),
(373, 2,  32,  5.65, 2),
(373, 3,  19, 14.34, 4),
(374, 1,  20, 28.21, 1),
(374, 2,  29, 24.71, 4),
(375, 1,  31, 28.59, 4),
(375, 2,  22, 39.78, 2),
(376, 1,  15, 13.97, 1),
(376, 2,  43, 16.64, 5),
(377, 1,  21, 38.34, 4),
(377, 2,  11, 30.69, 2),
(378, 1,  15, 13.97, 4),
(378, 2,  27, 39.91, 4),
(379, 1,  39, 11.00, 4),
(379, 2,  12, 10.48, 5),
(380, 1,   7, 19.16, 3),
(380, 2,  42, 10.11, 3),
(381, 1,  10, 29.49, 3),
(381, 2,  20, 28.21, 4),
(382, 1,   5, 43.71, 4),
(382, 2,  38, 22.98, 3),
(383, 1,  26, 48.75, 5),
(383, 2,   8, 19.58, 4);
