use "game.sml";
(*//how to create a list for Minions and Monsters
//how to add or remove parts of a list
//how to search on a list
//play minion or card, attack with minion*)

(*set turn to 1*)
val start=1;

fun getinput()=
    case TextIO.inputLine TextIO.stdIn of
         NONE => ""
         | SOME v => v;

fun exit()=
    OS.Process.exit(OS.Process.success);

fun PlayerPrinter(energy)=
    ( (*Energy*)
    print ("Energy left for current player:  " ^ (Int.toString(energy)) ^ "\n");
    (*Health*)
    print ("Health for player:  " ^ (Int.toString(Health)) ^ "\n");
    (*AI Health*)
    print ("Health for AI:  " ^ (Int.toString(AIHealth)) ^ "\n");
    (*List for Hand*)
    print ("Hand for player" ^ Hand ^ "\n");
    (*List for AI Hand*)
    print ("Hand for AI" ^ AIHand ^ "\n")
    (*List for Minions*)
    (*List for Monsters*)
    );

   (*while AI is not finished to     ; AI TURN*)
      (*select AI command*)
      (*evaluate AI command*)
      (*if Player is dead, print message and exit*)
      (*if AI is dead, print message and exit*)
      (*print game state*)

fun Player(energy)=  (*while player is not finished do  ; PLAYER TURN (read-eval-print loop)*)
    if energy > 0 then (
    let
        val command = getinput()                   (*read player command*)
        val readycommand = String.substring(command, 0, size command - 1)
    in
        if readycommand = "Quit" then (print "Quiting Game\n"; exit()) else
        if readycommand = "End" then (print "Ending Turn\n"; val newenergy = 0) else
        print "Check for casting or attacking"
    end
    (*evaluate player command*)
    (*How to parse a string to
    (*How to cast a spell or minion*);
    (*How to attack a monster or AI*)
    (*How to remove dead minions and monsters by searching list for zeros*)

    if Health <= 0 then (print "U lose: 0 Health"; exit()) else  (*if Player is dead, print message and exit*)
    if AIHealth <= 0 then (print "U Win: AI at 0 Health"; exit()) else (*if AI is dead, print message and exit*)
    (PlayerPrinter(energy); Player(newenergy)))
    else Print "End of Turn";

(*repeat forever*)
fun mlstone(turn)=
    if turn > 0 then (
    print "Players Turn\n";
    PlayerPrinter(turn);        (*print game state*)
    Player(turn);               (*set player energy to equal turn number*)
    print "AI's Turn\n";
    PlayerPrinter(turn);        (*print game state*)
    (*AI(turn); *)                      (*set AI energy to equal turn number*)
    mlstone(turn+1))            (*increment turn*)
    else print "Incorrect turn";

mlstone(start);