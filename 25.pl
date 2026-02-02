move(state(P,onfloor,P,hasnot), grasp,
     state(P,onbox,P,has)).

move(state(P,onfloor,P,hasnot), climb,
     state(P,onbox,P,hasnot)).

move(state(P,onfloor,P,hasnot), push(P,X),
     state(X,onfloor,X,hasnot)).

move(state(P,onfloor,B,hasnot), walk(P,X),
     state(X,onfloor,B,hasnot)).

canget(state(_,_,_,has)).

canget(State1) :-
    move(State1, _, State2),
    canget(State2).
