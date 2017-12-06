function solved = rhs1(t, initial)
global acceleration mass_earth radius;
solved = zeros(length(initial), 1);
solved(1) = initial(3);
solved(2) = initial(4);
solved(3) = -(4 * pi * pi) * initial(1);
solved(4) = -(4 * pi * pi) * initial(2);