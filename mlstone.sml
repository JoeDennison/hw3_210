val Health=30;
val AIHealth=30;
val Hand=[ (1, false, "C slug", 0, 1),
    (1, false, "int", 1, 1),
    (1, true, "++", 0, 1),
    (1, true, "^=", 4, 0),
    (2, false, "for (;;)", 2, 2),
    (3, false, "switch", 3, 3),
    (4, false, "array a[100]", 4, 4),
    (4, true, "Bus Error Fireball", 6, 0) ];

val AIHand=[ (1, true, "Atom", 0, 1),
    (1, true, "Car", 1, 0),
    (1, true, "Cdr", 2, 0),
    (1, false, "Parenthesis", 1, 1),
    (2, false, "Cons Cell", 2, 1),
    (2, false, "defun", 3, 2),
    (3, true, "Mapcar", 4, 0),
    (4, false, "ML Monster", 2, 6) ];


use "game.sml";
//how to create a list for Minions and Monsters
//how to add or remove parts of a list
//how to search on a list
//play minion or card, attack with minion

(*set turn to 1*)
val turn=1;

(*repeat forever*)
fun mlstone(turn)=
    if turn > 0 then (
	print "Players Turn\n";
	PlayerPrinter(turn); (*print game state*)
    Player(turn);    (*set player energy to equal turn number*)
	print "AI's Turn\n";
	PlayerPrinter(turn); (*print game state*)
    AI(turn); (*set AI energy to equal turn number*)
    mlstone(turn+1));  (*increment turn*)
    else print "Incorrect turn";

fun getinput()=
	case TextIO.inputLine TextIO.stdIn of 
		NONE => ""
		| SOME v => v;
      
fun Player(energy)=  (*while player is not finished do  ; PLAYER TURN (read-eval-print loop)*)
    if energy > 0 then (
	val command = getinput(); (*read player command*)
	val readycommand = String.substring(command, 0, size command - 1);
	if readycommand = Quit then (print "Quiting Game\n"; exit()); else
	if readycommand = End then (print "Ending Turn\n"; val newenergy = 0); else
   
    (*evaluate player command*)
	(*How to cast a spell or minion*);
	(*How to attack a monster or AI*)
	(*How to remove dead minions and monsters by searching list for zeros*)
	if Health <= 0 then (print "U lose: 0 Health"; exit()); else  (*if Player is dead, print message and exit*)
	if AIHealth <= 0 then (print "U Win: AI at 0 Health"; exit()); else (*if AI is dead, print message and exit*)
	(PlayerPrinter(energy); Player(newenergy)));
    else Print "End of Turn";
	
fun PlayerPrinter(energy)=
	if energy >0 then (
	(*Energy*)
	print "Energy left for current player:  "^energy^"\n";
	(*Health*)
	print "Health for player:  "^Health^"\n";
	(*AI Health*)
	print "Health for AI:  "^AIHealth^"\n";
	(*List for Hand*)
	print "Hand for player"^Hand^"\n";
	(*List for AI Hand*)
	print "Hand for AI"^AIHand^"\n";
	(*List for Minions*)
	(*List for Monsters*)
	)else print "out of energy";

   (*while AI is not finished to     ; AI TURN*)
      (*select AI command*)
      (*evaluate AI command*)
      (*if Player is dead, print message and exit*)
      (*if AI is dead, print message and exit*)
      (*print game state*)