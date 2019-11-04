function [tpoints,r] = transient_beuler(t1,t2,h,out)
% [tpoints,r] = beuler(t1,t2,h,out)
% Perform transient analysis for LINEAR Circuits using Backward Euler
% assume zero initial condition.
% Inputs:  t1 = starting time point (typically 0)
%          t2 = ending time point
%          h  = step size
%          out = output node
% Outputs  tpoints = are the time points at which the output
%                    was evaluated
%          r       = value of the response at above time points
% plot(tpoints,r) should produce a plot of the transient response

    global G C b

    % tpoints is a vector containing all the timepoints from t1 to t2 with step
    % size h
    tpoints = t1:h:t2;
    
    r = zeros(size(G, 1), size(tpoints, 2));
    for i = 2:size(r, 2)
        r(:, i) = (G + C / h) \ (BTime((i - 1) * h) + C / h * r(:, i - 1));
    end
    
    r = r(out, :);
end
