function J = nlJacobian(X)
% Compute the jacobian of the nonlinear vector of the MNA equations as a 
% function of X
% input: X is the current value of the unknown vector.
% output: J is the jacobian of the nonlinear vector f(X) in the MNA
% equations. The size of J should be the same as the size of G.

global G DIODE_LIST

