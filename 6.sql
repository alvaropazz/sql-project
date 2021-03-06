/* The JOIN operation */  
    
    /*1*/  
    
    SELECT
        matchid,
        player 
    FROM
        goal    
    WHERE
        teamid = 'GER';
    
    /*2*/  
    
    SELECT
        id,
        stadium,
        team1,
        team2    
    FROM
        game   
    WHERE
        id = 1012;
    
    /*3*/  
    
    SELECT
        player,
        teamid,
        stadium,
        mdate   
    FROM
        game    
    JOIN
        goal 
            ON (
                id = matchid
            )   
    WHERE
        teamid='GER';
    
    /*4*/  
    
    SELECT
        team1,
        team2,
        player    
    FROM
        game    
    JOIN
        goal 
            ON (
                id=matchid
            )   
    WHERE
        player LIKE 'Mario%';
    
    /*5*/  
    
    SELECT
        player,
        teamid,
        coach,
        gtime   
    FROM
        goal    
    JOIN
        eteam 
            on teamid = id   
    WHERE
        gtime <= 10;
    
    /*6*/  
    
    SELECT
        game.mdate,
        eteam. teamname   
    FROM
        game 
    JOIN
        eteam 
            ON (
                team1 = eteam.id
            )   
    WHERE
        coach = 'Fernando Santos';
    
    /*7*/  
    
    SELECT
        goal.player   
    FROM
        goal 
    JOIN
        game 
            ON (
                goal.matchid = game.id
            )   
    WHERE
        stadium = 'National Stadium, Warsaw';
    
    /*8*/  
    
    SELECT
        DISTINCT player   
    FROM
        game 
    JOIN
        goal 
            ON matchid = id    
    WHERE
        teamid <> 'GER'   
        AND (
            team1 = 'GER'   
            OR team2 = 'GER'
        );
    
    /*9*/  
    
    SELECT
        teamname,
        COUNT(gtime)   
    FROM
        eteam 
    JOIN
        goal 
            ON id = teamid   
    GROUP BY
        teamname;
    
    /*10*/  
    
    SELECT
        stadium,
        COUNT(gtime) 
    FROM
        game 
    JOIN
        goal 
            ON id=matchid 
    GROUP BY
        stadium;
    
    /*11*/  
    
    SELECT
        matchid ,
        mdate,
        COUNT(gtime)   
    FROM
        game 
    JOIN
        goal 
            ON matchid = id   
    WHERE
        (
            team1 = 'POL' 
            OR team2 = 'POL'
        ) 
    GROUP BY
        mdate,
        matchid;
    
    /*12*/  
    
    SELECT
        goal.matchid,
        game.mdate,
        COUNT(goal.gtime) 
    FROM
        game 
    JOIN
        goal 
            ON matchid  = id  
    WHERE
        teamid = 'GER' 
    GROUP BY
        matchid,
        mdate;
    
    /*13*/  
    
    SELECT
        mdate,
        team1,
        SUM(CASE 
            WHEN teamid=team1 THEN 1 
            ELSE 0 
        END) score1,
        team2,
        SUM(CASE 
            WHEN teamid=team2 THEN 1 
            ELSE 0 
        END) score2   
    FROM
        game 
    LEFT JOIN
        goal 
            ON matchid = id   
    GROUP BY
        matchid,
        team1,
        team2,
        mdate   
    ORDER BY
        mdate,
        matchid,
        team1,
        team2;