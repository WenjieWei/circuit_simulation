function Xdc = dcsolvealpha(Xguess,alpha,maxerr)
    % Compute dc solution using newtwon iteration for the augmented system
    % G*X + f(X) = alpha*b
    % Inputs: 
    % Xguess is the initial guess for Newton Iteration
    % alpha is a paramter (see definition in augmented system above)
    % maxerr defined the stopping criterion from newton iteration: Stop the
    % iteration when norm(deltaX)<maxerr
    % Oupputs:
    % Xdc is a vector containing the solution of the augmented system
    global G DIODE_LIST
    
    
end

%% Function to compute the Jacobian during Newton-Ralphson Iterations. 
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
%     
%     v1 = X(startNode);
%     v2 = X(endNode);
%     
%     F = zeros(size(G, 1), size(G, 2));
%     
%     
    % Create the Jacobian matrix F of f(x).
    F = zeros(size(G, 1), size(G, 2));

    if startNode ~= 0
        v1 = X(startNode);
        
        if endNode ~= 0
            v2 = X(endNode);
            
            F(startNode, startNode) = (Is / Vt) * exp((v1 - v2) / Vt);
            F(startNode, endNode) = -(Is / Vt) * exp((v1 - v2) / Vt);
            F(endNode, startNode) = -(Is / Vt) * exp((v1 - v2) / Vt);
            F(endNode, endNode) = (Is / Vt) * exp((v1 - v2) / Vt);
        else
            v2 = 0;
            F(startNode, startNode) = (Is / Vt) * exp((v1 - v2) / Vt);
        end
    else
            
    end
    
    J = G + F;
end











