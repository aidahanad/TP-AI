% Constraint Logic Programming
:- use_module(library(dif)).	% Sound inequality
:- use_module(library(clpfd)).	% Finite domain constraints
:- use_module(library(clpb)).	% Boolean constraints
:- use_module(library(chr)).	% Constraint Handling Rules
:- use_module(library(when)).	% Coroutining
%:- use_module(library(clpq)).  % Constraints over rational numbers

% 1. declaring taks which contains 4 arguments: id,description,assignee,status
:- dynamic task/4.

% 2. creating a task
create_task(ID,Description,User) :-
 assert(task(ID,Description,User,false)),
 format('task created ~w.~n',[ID]).

% 3. assigning task to a new user
assign_task(ID,New_user) :-
 retract(task(ID,Description,_,Status)),
 assert(task(ID,Description,New_user,Status)),
 format('task ~w assigned to user: ~w.~n', [ID, New_user]).

% 4. marking task as completed
mark_completed(ID) :- 
 retract(task(ID,Description,User,_)),
 assert(task(ID,Description,User,true)),
 format('task ~w marked as completed. ~n',[ID]).

% 5. display all tasks with their information
display_tasks :-
    task(ID, Description, User, Status),
    format('Task ~w:~n - Description: ~w~n - Assignee: ~w~n - Completion status: ~w~n~n', 
           [ID, Description, User, Status]),
    fail.
display_tasks.

% 6. display all tasks assigned to a specific user with their information
display_tasks_assigned_to(User) :-
    task(ID, Description, User, Status),
    format('Task ~w:~n - Description: ~w~n - Completion status: ~w~n~n', 
           [ID, Description, Status]),
    fail.
display_tasks_assigned_to(_).

% 7. display all completed tasks
display_completed_tasks :-
    task(ID, Description, User, true),
    format('Task ~w:~n - Description: ~w~n - Assignee: ~w~n - Completion: true~n~n', 
           [ID, Description, User]),
    fail.
display_completed_tasks.