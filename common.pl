
learn(OutFile):-
    findall(PosEx,pos_ex(PosEx),Pos), 
    findall(NegEx,neg_ex(NegEx),Neg),
    learn(Pos, Neg, Prog),
    pprint(Prog),
    tell(OutFile),
    pprint(Prog),
    told.

evaluate(OutFile):-
    findall(PosEx,pos_ex(PosEx),Pos), 
    findall(NegEx,neg_ex(NegEx),Neg),
    tell(OutFile),
    run_tests(Pos,do_test_pos),
    run_tests(Neg,do_test_neg),
    told.
% TP,FP,FN,TN
do_test_pos(Goal):-
  (call(Goal) -> writeln('1,0,0,0'); writeln('0,0,1,0')).

do_test_neg(Goal):-
  (call(Goal) -> writeln('0,1,0,0'); writeln('0,0,0,1')).

run_tests([],_).
run_tests([Goal|T],F):-
  functor(Goal,P,A),
  (current_predicate(P/A) -> call(F,Goal); writeln('0,0,0,0')),
  run_tests(T,F).
