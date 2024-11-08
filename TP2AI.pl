
% 1. Check if X is an element of the list L
element(X, [X|_]).
element(X, [_|T]) :- element(X, T).

% 2. First element of a list
first(E, [E|_]).

% 3. Last element of a list
last(E, [E]).
last(E, [_|T]) :- last(E, T).

% 4. Penultimate element of a list
penultimate(E, [E,_]).
penultimate(E, [_|T]) :- penultimate(E, T).

% 5. Remove the Kth element from a list
del_k(X, [X|T], 1, T).
del_k(X, [H|T], K, [H|R]) :- K > 1, K1 is K - 1, del_k(X, T, K1, R).

% 6. Calculate the length of a list
length([], 0).
length([_|T], N) :- length(T, N1), N is N1 + 1.

% 7. Check if a list has an even number of elements
even(L) :- length(L, N), 0 is N mod 2.

% 8. Concatenate two lists without using append
concat([], L2, L2).
concat([H|T], L2, [H|R]) :- concat(T, L2, R).

% 9. Check if a list is a palindrome
palindrome(L) :- reverse(L, L).

% Reverse helper for palindrome
reverse([], []).
reverse([H|T], R) :- reverse(T, RevT), concat(RevT, [H], R).
