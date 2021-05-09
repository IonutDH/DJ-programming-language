

%{

%}
 
%% 

start: statements                           { 
                                                
                                                return {
                                                   id: 'script',
                                                   statements: $1
                                                   
                                                }
                                            };
 
statements: statements statement	{
                                                
                                                $1.push($2); // add the statement to the array produced by statements ($1)
                                                $$ = $1;
                                            }
            
            |statement	            		{
                                                
                                                $$ = [];
										        $$.push($1);
                                            }
           
           
            
            ;
 
statement: loop
        | sleep 
        | after 
        | play
        | declaration           
            ;

loop : LOOP DO ':' LB statements RB{
                                            $$ ={
                                                'type' : 'loop',
                                                'name' : $1,
                                                'statements': $5
                                            };
                                        }
     
     |THREAD LOOP DO ':' LB statements RB {
                                            $$ ={
                                                'type' : 'thread',
                                                'name' : $2,
                                                'statements': $6
                                            };

                                                            }
;
sleep : SLEEP value                           {
                                                    $$ = {
                                                        'type' : "sleep",
                                                        'value' : $2
                                                    };
                                              }
;
after : AFTER INT sleep                       {
                                                $$={
                                                    'type': "after",
                                                    'value' : $2,
                                                    'instruction' : $3
                                                };
                                              }
      | AFTER INT EXIT                        {
                                                $$={
                                                    'type': "after",
                                                    'value' : $2,
                                                    'instruction' : "exit"
                                                };

                                              }
      | AFTER INT GTO LOOP                    {
                                                $$={
                                                    'type': "after",
                                                    'value' : $2,
                                                    'instruction' : "go-to",
                                                    'destination' : $4
                                                };
                                              }
;
play : IDENTIFIER PLAY IDENTIFIER             {
                                                $$={
                                                    'type': "play",
                                                    'identifier' : $1,
                                                    'sample' : $3
                                                };

                                              }
                                              ;
declaration : IDENTIFIER '=' NEW IDENTIFIER   {
                                                $$={
                                                    'type': "declaration",
                                                    'identifier' : $1,
                                                    'instrument' : $4
                                                };
                                              }
;
value : INT                                   
      | FLOAT  
      ;                              
                                                
  
