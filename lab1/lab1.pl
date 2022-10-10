parent(george_5,edward_8).
parent(george_5,george_6).
parent(george_5,henry).
parent(george_5,george_kent).
parent(george_6,elizabeth_2).
parent(henry,richard).
parent(george_kent,edward_kent).
parent(george_kent,alexandra).
parent(george_kent,michael).
parent(philip,charles_3).
parent(philip,anne).
parent(philip,andrew).
parent(philip,edward_wessex).
parent(elizabeth_2,charles_3).
parent(elizabeth_2,anne).
parent(elizabeth_2,andrew).
parent(elizabeth_2,edward_wessex).
parent(charles_3,william).
parent(charles_3,harry).
parent(camilla,william).
parent(camilla,harry).
parent(andrew,beatrice).
parent(andrew,eugenie).
parent(edward_wessex,james).
parent(edward_wessex,louise).
parent(sophie,james).
parent(sophie,louise).
parent(william,george_wales).
parent(william,charlotte).
parent(william,louis).
parent(catherine,george_wales).
parent(catherine,charlotte).
parent(catherine,louis).
parent(harry,archie).
parent(harry,lilibet).
parent(meghan,archie).
parent(meghan,lilibet).

spouse(philip,elizabeth_2).
spouse(richard,birgitte).
spouse(edward_kent,katharine).
spouse(michael,mary).
spouse(charles_3,camilla).
spouse(edward_wessex,sophie).
spouse(william,catherine).
spouse(harry,meghan).

spouse(X,Y) :- spouse(Y,X).

male(george_5).
male(edward_8).
male(george_6).
male(henry).
male(george_kent).
male(philip).
male(richard).
male(edward_kent).
male(michael).
male(charles_3).
male(andrew).
male(edward_wessex).
male(william).
male(harry).
male(james).
male(george_wales).
male(louis).
male(archie).

female(elizabeth_2).
female(birgitte).
female(katharine).
female(alexandra).
female(mary).
female(camilla).
female(anne).
female(sophie).
female(catherine).
female(meghan).
female(beatrice).
female(eugenie).
female(louise).
female(charlotte).
female(lilibet).

father(X,Y) :-
    parent(X,Y),
    male(X).
mother(X,Y) :-
    parent(X,Y),
    female(X).

child(X,Y) :- parent(Y,X).
son(X,Y) :-
    child(X,Y),
    male(X).
daughter(X,Y) :-
    child(X,Y),
    female(X).

siblings(X,Y) :-
    X \= Y,
    child(X,Z),
    child(Y,Z).

ancestor(1,X,Y) :- parent(X,Y), !.
ancestor(Z,X,Y) :-
    Z \= 1,
    Z1 is Z - 1,
    parent(Y1,Y),
    ancestor(Z1,X,Y1),
    !.

husband(X,Y) :- 
    spouse(X,Y),
    male(X).
wife(X,Y) :-
    spouse(X,Y),
    female(X).