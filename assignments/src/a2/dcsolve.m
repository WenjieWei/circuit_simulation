function [Xdc dX] = dcsolve(Xguess,maxerr)
% Compute dc solution using newtwon iteration
% input: Xguess is the initial guess for the unknown vector. 
%        It should be the correct size of the unknown vector.
%        maxerr is the maximum allowed error. Set your code to exit the
%        newton iteration once the norm of DeltaX is less than maxerr
% Output: Xdc is the correction solution
%         dX is a vector containing the 2 norm of DeltaX used in the 
%         newton Iteration. the size of dX should be the same as the number
%         of Newton-Raphson iterations. See the help on the function 'norm'
%         in matlab.
    global G C b DIODE_LIST
    
    % Vector contains the result for each iteration. Overwritten for each iteration. 
    Xdc = zeros(size(G, 2), 1); 
    
    % Delta X vector for each iteration. Size will be increased for each iteration. 
    dX = zeros(size(G, 2), 1); 
    
    % temporary vector containing the results of Is(exp(Vs/Vt) - 1)
    f = zeros(size(G, 2), 1);
    
    diodeStartNode = DIODE_LIST.node1;
    diodeEndNode = DIODE_LIST.node2;
    Is = DIODE_LIST.Is;
    Vt = DIODE_LIST.Vt;
    
    converged = false;
    iteration = 0;
    
    while ~converged
        iteration = iteration + 1;
        
        % Calculate the Phi vector for each iteration. 
        if diodeStartNode ~= 0 && diodeEndNode ~= 0
            % If the diode is not connected to the ground. 
            f(diodeStartNode) = Is * (exp((Xguess(diodeStartNode) - Xguess(diodeEndNode)) / Vt) - 1);
            f(diodeEndNode) = -Is * (exp((Xguess(diodeStartNode) - Xguess(diodeEndNode)) / Vt) - 1);
        else
            % If the cathod of the diode is connected to the ground
            f(diodeStartNode) = Is * (exp(Xguess(diodeStartNode) / Vt) - 1);
        end
        
        % Phi vector containing the temporary result to obtain dX.
        Phi = G * Xguess + f - b;
        
        % Calculate the Jacobian. 
        J = nlJacobian(Xguess);
        
        dX = [dX (-inv(J) * Phi)];
        
        % Determine the converge condition. 
        % Check if every entry of current iteration meets the threashold.
        % If there is at least one dX > maxerr, 
        % Continue the iteration. 
        if all(dX < maxerr)
            converged = true;
        end
    end
end










