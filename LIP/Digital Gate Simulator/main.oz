declare Mux in
functor
import
   Browser
   Mux at 'digitalGateSimulator.oza'
define
   proc {Multiplexador S A B ?X}
      K L
   in
      K = {Mux.AndG {Mux.NotG S} A}
      L = {Mux.AndG S B}
      X = {Mux.OrG K L}
   end

   S = 1|0|_
   A = 1|0|_
   B = 1|0|_ X in
   {Multiplexador S A B X}
   {Browser.browse X}
end