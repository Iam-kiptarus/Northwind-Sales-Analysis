/*
=========================================
Northwind Sales Analysis
Data Cleaning
=========================================
*/

UPDATE Customers
SET City = CASE City
    WHEN 'MÃ©xico D.F.' THEN 'México D.F.'
    WHEN 'LuleÃ¥' THEN 'Luleå'
    WHEN 'SÃ£o Paulo' THEN 'São Paulo'
    WHEN 'BrÃ¤cke' THEN 'Bräcke'
    WHEN 'MÃ¼nchen' THEN 'München'
    WHEN 'San CristÃ³bal' THEN 'San Cristóbal'
    WHEN 'MontrÃ©al' THEN 'Montréal'
    WHEN 'KÃ¶ln' THEN 'Köln'
    WHEN 'GenÃ¨ve' THEN 'Genève'
    WHEN 'KÃ¸benhavn' THEN 'København'
    WHEN 'MÃ¼nster' THEN 'Münster'
    WHEN 'Ã…rhus' THEN 'Århus'
    ELSE City
END;

UPDATE Customers
SET Address = REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(Address,
        'ConstituciÃ³n', 'Constitución'),
        'BerguvsvÃ¤gen', 'Berguvsvägen'),
        'KlÃ©ber', 'Kléber'),
        'LusÃ­adas', 'Lusíadas'),
        'OrÃ³s', 'Orós'),
        'chaussÃ©e', 'chaussée'),
        'Ã…kergatan', 'Åkergatan'),
        'CataluÃ±a', 'Cataluña'),
        '5Âª', '5ª'),
        'PaÃ§o', 'Paço'),
        'BolÃ­var', 'Bolívar'),
        'saÃºde', 'saúde'),
        'CanÃ rios', 'Canários'),
        'TaucherstraÃŸe', 'Taucherstraße'),
        'Gran VÃ­a', 'Gran Vía'),
        'VinbÃ¦ltet', 'Vinbæltet'),
        'InÃªs', 'Inês'),
        'SmagslÃ¸get', 'Smagsløget');
        
UPDATE Customers
SET ContactName = REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(ContactName,
        'FrÃ©dÃ©rique', 'Frédérique'),
        'MartÃ­n', 'Martín'),
        'RancÃ©', 'Rancé'),
        'JosÃ©', 'José'),
        'AndrÃ©', 'André'),
        'HernÃ¡ndez', 'Hernández'),
        'GonzÃ¡lez', 'González'),
        'FernÃ¡ndez', 'Fernández'),
        'LÃºcia', 'Lúcia'),
        'GutiÃ©rrez', 'Gutiérrez');
        
UPDATE Customers
SET ContactName = REPLACE(ContactName, 'MÃ¼ller', 'Müller');

UPDATE Customers
SET ContactName = 'Jean Fresnière'
WHERE ContactName = 'Jean FresniÃ¨re';

UPDATE Customers
SET CustomerName = REPLACE(
    REPLACE(
    REPLACE(
    REPLACE(CustomerName,
        'SuprÃªmes', 'Suprêmes'),
        'dÃ©lices', 'délices'),
        'SpezialitÃ¤ten', 'Spezialitäten'),
        'TradiÃ§Ã£o', 'Tradição');
        
UPDATE Products
SET ProductName = CASE ProductName
    WHEN 'Gustafs KnÃ¤ckebrÃ¶d' THEN 'Gustafs Knäckebröd'
    WHEN 'TunnbrÃ¶d' THEN 'Tunnbröd'
    WHEN 'GuaranÃ¡ FantÃ¡stica' THEN 'Guaraná Fantástica'
    WHEN 'NuNuCa NuÃŸ-Nougat-Creme' THEN 'NuNuCa Nuß-Nougat-Creme'
    WHEN 'GumbÃ¤r GummibÃ¤rchen' THEN 'Gumbär Gummibärchen'
    WHEN 'RÃ¶ssle Sauerkraut' THEN 'Rössle Sauerkraut'
    WHEN 'ThÃ¼ringer Rostbratwurst' THEN 'Thüringer Rostbratwurst'
    WHEN 'CÃ´te de Blaye' THEN 'Côte de Blaye'
    WHEN 'RÃ¸gede sild' THEN 'Røgede sild'
    WHEN 'TourtiÃ¨re' THEN 'Tourtière'
    WHEN 'PÃ¢tÃ© chinois' THEN 'Pâté chinois'
    WHEN 'Sirop dÃ©rable' THEN 'Sirop dérable'
    WHEN 'Wimmers gute SemmelknÃ¶del' THEN 'Wimmers gute Semmelknödel'
    WHEN 'FlÃ¸temysost' THEN 'Fløtemysost'
    WHEN 'RÃ¶d Kaviar' THEN 'Röd Kaviar'
    WHEN 'RhÃ¶nbrÃ¤u Klosterbier' THEN 'Rhönbräu Klosterbier'
    WHEN 'LakkalikÃ¶Ã¶ri' THEN 'Lakkalikööri'
    WHEN 'Original Frankfurter grÃ¼ne SoÃŸe' THEN 'Original Frankfurter grüne Soße'
    ELSE ProductName
END;

UPDATE suppliers
SET SupplierName = CASE SupplierName
    WHEN 'PB KnÃ¤ckebrÃ¶d AB' THEN 'PB Knäckebröd AB'
    WHEN 'Heli SÃ¼ÃŸwaren GmbH & Co. KG' THEN 'Heli Süßwaren GmbH & Co. KG'
    WHEN 'Plutzer LebensmittelgroÃŸmÃ¤rkte AG' THEN 'Plutzer Lebensmittelgroßmärkte AG'
    WHEN 'Svensk SjÃ¶fÃ¶da AB' THEN 'Svensk Sjöföda AB'
    WHEN 'Aux joyeux ecclÃ©siastiques' THEN 'Aux joyeux ecclésiastiques'
    WHEN 'Gai pÃ¢turage' THEN 'Gai pâturage'
    WHEN 'ForÃªts dÃ©rables' THEN 'Forêts d érables'
    ELSE SupplierName
END;

UPDATE suppliers
SET ContactName = CASE ContactName
    WHEN 'Michael BjÃ¶rn' THEN 'Michael Björn'
    WHEN 'GuylÃ¨ne Nodier' THEN 'Guylène Nodier'
    ELSE ContactName
END;

UPDATE suppliers
SET Address = CASE Address
    WHEN 'TiergartenstraÃŸe 5' THEN 'Tiergartenstraße 5'
    WHEN 'BrovallavÃ¤gen 231' THEN 'Brovallavägen 231'
    WHEN '2960 Rue St. Laurent' THEN '2960 Rue St. Laurent'
    ELSE Address
END;

UPDATE suppliers
SET City = CASE City
    WHEN 'GÃ¶teborg' THEN 'Göteborg'
    WHEN 'SÃ£o Paulo' THEN 'São Paulo'
    WHEN 'MontrÃ©al' THEN 'Montréal'
    ELSE City
END;

UPDATE Orders
SET OrderDate = DATE_ADD(OrderDate, INTERVAL 28 YEAR);

UPDATE Employees
SET BirthDate = DATE_ADD(BirthDate, INTERVAL 28 YEAR);