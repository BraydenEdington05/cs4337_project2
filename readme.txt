About:
This project takes an input maze and solves the maze while following directions.It is coded entirely in prolog and requires an input file to be functional 

My Experience Creating It:
The first thing I had to do was install VS code so I could code the project. Then I had to make a git destination for this project. When 
creating the project the first thing I did was make the find exit and find start tiles for the code. I thought it would be easiest to get it out of the way.
After that I created the movement system so that if I wanted to go left,right,up, and down so I could make that happen. After that I made the recursive function to find the 
correct pathing to the exit and finally I added extra functions like validating the map and validating the tile allong with creating the recursive function.

How to run:
1) Start prolog with command:
swipl
2) Load files:
['project2.pl', 'example.pl', 'test.pl'].
3) Run simple_map from example.pl:
simple_map(M), display_map(M), find_exit(M, Solution).
4) Verify Solution:
Solution = [right, right] .

5) Run bad_map
bad_map(M), display_map(M), find_exit(M, Solution).
6) Verify no solution, so false. is returned

7) Run bad_map2
bad_map2(M), display_map(M), find_exit(M, Solution).
8) Verify no solution, so false. is returned


9) Run bad_map3
bad_map3(M), display_map(M), find_exit(M, Solution).
10) Verify no solution, so false. is returned

11) Run bad_map4
bad_map4(M), display_map(M), find_exit(M, Solution).
12) Verify no solution, so false. is returned

13) Run basic_map
basic_map(M), display_map(M), find_exit(M, Solution).
14) Verify Solution:
Solution = [down, left, down]

15) Run basic_map2
basic_map2(M), display_map(M), find_exit(M, Solution).
16) Verify Solution:
Solution = [down, left, down, down, right, right]

17) Run test
gen_map(4, 10,10,M), find_exit(M,A).
18) Verify Output:
M = [[f, f, f, w, f, w, f, w|…], [f, f, f, w, f, w, f|…], [f, f, f, w, f, f|…], [f, f, f, f, f|…], [f, f, f, w|…], [f, w, w|…], [f, w|…], [f|…], […|…]|…],
A = [left, down, down, down, down, down, down, right, down|…]