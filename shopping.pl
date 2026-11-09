% Shopping Activity
:- dynamic basket/1.

basket([coffee, milk, chocolate, apple, juice]).

start :-
    menu.

menu :-
    nl,
    writeln('** SHOPPING LIST **'),
    writeln('d. display all items.'),
    writeln('a. Add an item to the list.'),
    writeln('e. exit.'),
    write('ENTER YOUR CHOICE: '),
    read(Choice),
    action(Choice).

action(d) :-
    basket(Items),
    display_items(Items),
    menu.
action(a) :-
    write('enter the item you want to add: '),
    read(Item),
    retract(basket(Items)),
    append(Items, [Item], NewItems),
    assertz(basket(NewItems)),
    writeln('The item has been added'),
    menu.
action(e) :-
    writeln('Goodbye!').
action(_) :-
    writeln('Invalid choice.'),
    menu.

display_items([]).
display_items([Head|Tail]) :-
    writeln(Head),
    display_items(Tail).
