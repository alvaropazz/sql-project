/* More JOIN operations */

    /*1*/  
    
    SELECT
        id,
        title  
    FROM
        movie  
    WHERE
        yr=1962  
        
    /*2*/  
    
   SELECT
        yr           
    FROM
        movie           
    WHERE
        title='Citizen Kane'  
            
    /*3*/  
    
    SELECT
        id,
        title,
        yr               
    FROM
        movie               
    WHERE
        title LIKE '%Trek%'              
    ORDER BY
        yr  
                
    /*4*/  

    SELECT
        id                   
    FROM
        actor                   
    WHERE
        name =  'Glenn Close' 
                    
    /*5*/  
    
    SELECT
        id                       
    FROM
        movie                       
    WHERE
        title =   'Casablanca' 
                        
    /*6*/  

    SELECT
          name                           
      FROM
          actor                          
      JOIN
          casting                                  
              ON actorid = id                           
      WHERE
          movieid=27  
      
    /*7*/  

    SELECT
        name                                    
    FROM
        actor                                   
    JOIN
        casting                                                   
            ON actorid = id                                    
    WHERE
        movieid=35
   
                                
    /*8*/  

    SELECT
        movie.title                                  
    FROM
        movie                                  
    JOIN
        casting                                          
            ON movie.id = casting.movieid                                  
    JOIN
        actor                                          
            ON casting.actorid = actor.id                                  
    WHERE
        name = 'Harrison Ford' 
                                              
    /*9*/  

    SELECT
        movie.title                                      
    FROM
        movie                                      
    JOIN
        casting                                              
            ON movie.id = casting.movieid                                      
    JOIN
        actor                                              
            ON casting.actorid = actor.id                                      
    WHERE
        name = 'Harrison Ford'                                          
        AND ORD <> 1 
                                                                            
    /*10*/

        SELECT
        movie.title,
        actor.name                                          
    FROM
        movie                                          
    JOIN
        casting                                                  
            ON movie.id = casting.movieid                                          
    JOIN
        actor                                                  
            ON casting.actorid = actor.id                                          
    WHERE
        movie.yr = 1962                                              
        AND ORD = 1 

    /*11*/  

    SELECT
        yr,
        COUNT(title)                                              
    FROM
        movie                                              
    JOIN
        casting                                                      
            ON movie.id=movieid                                                      
    JOIN
        actor                                                        
            ON actorid=actor.id                                              
    WHERE
        name='Doris Day'                                              
    GROUP BY
        yr                                              
    HAVING
        COUNT(title) > 1

    /*12*/  
    
        SELECT
        movie.title,
        actor.name                                                   
    FROM
        movie                                                  
    JOIN
        casting                                                          
            ON (
                movie.id = casting.movieid                                                              
                AND ord =1                                                         
            )                                                  
    JOIN
        actor                                                          
            ON casting.actorid = actor.id                                                  
    WHERE
        casting.movieid  IN (
            SELECT
                casting.movieid                                                          
            FROM
                casting                                                           
            WHERE
                casting.actorid  IN (
                    SELECT
                        id                                                                  
                    FROM
                        actor                                                                  
                    WHERE
                        name = 'Julie Andrews'                                                             
                )                                                         
            );
  
    /*13*/  
    
    SELECT
        actor.name 
    FROM
        movie 
    JOIN
        casting 
            ON casting.movieid = movie.id 
    JOIN
        actor 
            ON casting.actorid = actor.id 
    WHERE
        casting.ord=1 
    GROUP BY
        actor.name 
    HAVING
        COUNT(movie.title)>=15 
    ORDER BY
        actor.name ASC;
    
    /*14*/  
    
    SELECT
        movie.title,
        COUNT(casting.actorid) 
    FROM
        movie 
    JOIN
        casting  
            ON movie.id = casting.movieid 
    WHERE
        movie.yr=1978 
    GROUP BY
        movie.title 
    ORDER BY
        COUNT(DISTINCT casting.actorid) DESC,
        title;
    
    /*15*/  
    
    SELECT
        actor.name 
    FROM
        actor 
    JOIN
        casting 
            ON  actor.id = casting.actorid  
    JOIN
        movie 
            ON  casting.movieid = movie.id  
    WHERE
        movie.id IN (
            SELECT
                movieid 
            FROM
                casting 
            WHERE
                actorid IN (
                    SELECT
                        id 
                    FROM
                        actor   
                    WHERE
                        name='Art Garfunkel'
                )
            ) 
            AND actor.name <>'Art Garfunkel'
