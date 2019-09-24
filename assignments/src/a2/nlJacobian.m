function J = nlJacobian(X)
    % Compute the jacobian of the nonlinear vector of the MNA equations as a 
    % function of X
    % input: X is the current value of the unknown vector.
    % output: J is the jacobian of the nonlinear vector f(X) in the MNA
    % equations. The size of J should be the same as the size of G.
    
    % Diode curve: I = Is(exp(V/VT) - 1)
    global G DIODE_LIST
    
    startNode = DIODE_LIST.node1;
    endNode = DIODE_LIST.node2;
    Is = DIODE_LIST.Is;
    Vt = DIODE_LIST.Vt;
    
    v1 = X(startNode);
    v2 = X(endNode);
    
    F = zeros(size(G, 1), size(G, 2));
    
    F(startNode, startNode) = (Is / Vt) * exp((v1 - v2) / Vt);
    F(startNode, endNode) = -(Is / Vt) * exp((v1 - v2) / Vt);
    F(endNode, startNode) = -(Is / Vt) * exp((v1 - v2) / Vt);
    F(endNode, endNode) = (Is / Vt) * exp((v1 - v2) / Vt);
    
    J = G - F;
end












