function [tpoints,r] = nl_transient_beuler(t1,t2,h,out)
    % [tpoints,r] = beuler(t1,t2,h,out)
    % Perform transient analysis for NONLINEAR Circuits using Backward Euler
    % Assume zero initial condition.
    % Inputs:  t1 = starting time point (typically 0)
    %          t2 = ending time point
    %          h  = step size
    %          out = output node
    % Outputs  tpoints = are the time points at which the output
    %                    was evaluated
    %          r       = value of the response at above time points
    % plot(tpoints,r) should produce a plot of the transient response

    global G C b
    tpoints = t1:h:t2;
    maxerr = 1e-6;
    
    % Perform similar calculations to the linear backward euler function. 
    r = zeros(size(G, 1), size(tpoints, 2));
    for i = 2:size(r, 2)
        % Differential equation is below. 
        % tempX = (G + C/h) r(:, i) + f_vector(r(:, i + 1)).
        tempB = C / h * r(:, i - 1) + BTime((i - 1) * h);
        Xguess = zeros(size(b, 1), 1);
        
        % We should perform Newton iteration from this point. 
        converged = false;
        while ~converged
            Phi = (G + C / h) * Xguess + f_vector(r(:, i)) - tempB;
            J = nlJacobian(r(:, i));
            
            dX = -inv(J) * Phi;
            r(:, i) = r(:, i) + dX;
            Xguess = Xguess + dX;
            
            if norm(dX, 2) < maxerr
                converged = true;
            end
        end
    end
end











   