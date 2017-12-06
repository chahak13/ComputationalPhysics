function solved = rhs2(t, initial)
global mass_earth mass_sun l E;
solved = zeros(length(initial),1);
G = 6.67e-11;
potential = (G * mass_earth * mass_sun) / initial(1);
solved(1) = -sqrt(((2 / mass_earth) * (E + potential)) - ((l/(mass_earth * initial(1)) ^ 2)));
solved(2) = l / (mass_earth * initial(1) * initial(1));