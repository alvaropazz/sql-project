/* SELECT names */
        
    /*1*/  
    
    SELECT
            name 
        FROM
            world   
        WHERE
            name LIKE 'Y%';

    /*2*/  
    
    SELECT
        name 
    FROM
        world   
    WHERE
        name LIKE '%y';

    /*3*/  
    
    SELECT
        name 
    FROM
        world   
    WHERE
        name LIKE '%x%';

    /*4*/  
    
    SELECT
        name 
    FROM
        world   
    WHERE
        name LIKE '%x%';

    /*5*/  
    
    SELECT
        name 
    FROM
        world   
    WHERE
        name LIKE 'C%' 
        AND name LIKE '%ia';

    /*6*/  
    
    SELECT
        name 
    FROM
        world   
    WHERE
        name LIKE '%oo%';

    /*7*/  
    
    SELECT
        name 
    FROM
        world   
    WHERE
        name LIKE '%a%a%a%'  

    /*8*/  
    
    SELECT
            name 
        FROM
            world  
        WHERE
            name LIKE '_t%' 
        ORDER BY
            name;

    /*9*/  
    
    SELECT
        name 
    FROM
        world  
    WHERE
        name LIKE '%o__o%';

    /*10*/  
    
    SELECT
        name 
    FROM
        world  
    WHERE
        name LIKE '____';

    /*11*/  
    
    SELECT
        name   
    FROM
        world  
    WHERE
        name = capital;
    
    /*12*/  
    
    SELECT
        name   
    FROM
        world  
    WHERE
        capital LIKE concat(name, '%City%');
    
    /*13*/  
    
    SELECT
        capital,
        name   
    FROM
        world  
    WHERE
        capital LIKE concat( '%', name, '%');
    
    /*14*/  
    
    SELECT
        capital,
        name   
    FROM
        world  
    WHERE
        capital LIKE concat(name, '%') 
        AND capital != name;
    
    /*15*/  
    
    SELECT
        name,
        REPLACE (capital,
        name,
        '') AS ext   
    FROM
        world    
    WHERE
        capital LIKE concat(name, '%%') 
        AND capital != name;