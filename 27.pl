% ----- Graph Edges (From, To, Cost) -----
edge(0,1,3).
edge(0,2,6).
edge(0,3,5).
edge(1,4,9).
edge(3,8,7).
edge(8,9,5).

% ----- BFS Algorithm -----
bfs(Start, Goal, Path) :-
    bfs_queue([[Start]], Goal, RevPath),
    reverse(RevPath, Path).

bfs_queue([[Goal|Rest]|_], Goal, [Goal|Rest]).

bfs_queue([[Node|Rest]|Others], Goal, Path) :-
    findall([Next,Node|Rest],
        (edge(Node,Next,_), \+ member(Next,[Node|Rest])),
        NewPaths),
    append(Others, NewPaths, Queue),
    bfs_queue(Queue, Goal, Path).
