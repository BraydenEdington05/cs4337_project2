%Brayden Edington
%bre220001
%CS4337 Project2

%logic for traversing the grid
move(R, C, up,    NewR, C) :- NewR is R - 1.
move(R, C, down,  NewR, C) :- NewR is R + 1.
move(R, C, left,  R, NewC) :- NewC is C - 1.
move(R, C, right, R, NewC) :- NewC is C + 1.

%finds the exit
find_exit(Maze, Actions) :-
    valid_maze(Maze),
    find_start(Maze, StartRow, StartCol),
    (   var(Actions)
    ->  solve_generate(Maze, StartRow, StartCol, [(StartRow,StartCol)], Actions)
    ;   solve_verify(Maze, StartRow, StartCol, Actions, _)
    ).

%checks to see if maze is valid by checking to see if its the same length as first row 
valid_maze(Maze) :-
    is_list(Maze),
    Maze \= [],
    maplist(is_list, Maze),
    Maze = [FirstRow|_],
    maplist(same_length(FirstRow), Maze),      
    findall((R,C), cell_at(Maze, R, C, s), Starts),
    length(Starts, 1). 

%finds the start
find_start(Maze, Row, Col) :-
    nth0(Row, Maze, RowList),
    nth0(Col, RowList, s).

%checks a specific cell
cell_at(Maze, Row, Col, Content) :-
    nth0(Row, Maze, RowList),
    nth0(Col, RowList, Content).

%find map size
maze_size(Maze, Rows, Cols) :-
    length(Maze, Rows),
    Maze = [FirstRow|_],
    length(FirstRow, Cols).

%checks to see if within bounds
within_bounds(Maze, Row, Col) :-
    maze_size(Maze, Rows, Cols),
    Row >= 0, Col >= 0,
    Row < Rows, Col < Cols.

%base case for solving solution
solve_generate(Maze, Row, Col, _, []) :-
    cell_at(Maze, Row, Col, e).

%main recursive call for generating a solution
solve_generate(Maze, Row, Col, Visited, [Action|Rest]) :-
    move(Row, Col, Action, R2, C2),
    within_bounds(Maze, R2, C2),
    cell_at(Maze, R2, C2, Cell),
    Cell \= w,
    \+ member((R2,C2), Visited),
    solve_generate(Maze, R2, C2, [(R2,C2)|Visited], Rest).

%wrapper function
solve_verify(Maze, Row, Col, Actions, RestOut) :-
    solve_verify(Maze, Row, Col, [(Row,Col)], Actions, RestOut).

%base case to solve the maze
solve_verify(Maze, Row, Col, _, [], []) :-
    cell_at(Maze, Row, Col, e).

%main function to solve and verify the maze 
solve_verify(Maze, Row, Col, Visited, [Action|RestIn], [Action|RestOut]) :-
    move(Row, Col, Action, R2, C2),
    within_bounds(Maze, R2, C2),
    cell_at(Maze, R2, C2, Cell),
    Cell \= w,
    \+ member((R2,C2), Visited),
    solve_verify(Maze, R2, C2, [(R2,C2)|Visited], RestIn, RestOut).
