Newline               \r?\n
tab                    \t
Ws                     \s

Float                [0-9]+[.][0-9]+
Int                  [0-9]+

loop                   (loop)[0-9]+
sleep                   (sleep)

Identifier            [A-Za-z][A-Za-z0-9\_]*

Comments              (comments\s?\:)\s[a-zA-Z0-9\s\r\n]+(\:)




%%

{Comments}            { /* skip comments*/}

{sleep}               { return 'SLEEP';}

"thread"              { return 'THREAD';}
"{"                   { return 'LB'; }
"}"                   {  return 'RB'; }

"new"                 { return 'NEW';}

"go to"                 { return 'GTO'; }
"after"               { return 'AFTER'; }
"exit"                { return 'EXIT'; }

"="                    { return '=';}
":"                     { return ':';}
"end"                 { return 'END'; }

{loop}                { return 'LOOP'; }
"do"                   { return 'DO';}
"play"                 { return 'PLAY';}

{tab}                  {/* skip*/}

{Ws}                  { /*skip whitespace*/ }
{Newline}             { /* skip newline*/}


{Float}               { return 'FLOAT';}
{Int}                  {return 'INT';}

{Identifier}          { return 'IDENTIFIER'; }


