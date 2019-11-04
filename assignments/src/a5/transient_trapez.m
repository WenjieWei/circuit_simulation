function [tpoints,r] = transient_trapez(t1,t2,h,out)
    % [tpoints,r] = Transient_trapez(t1,t2,h,out)
    % Perform Transient Analysis using the Trapezoidal Rule for LINEAR
    % circuits.
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

    tpoints = t1:h:t2;
    x = zeros(size(G, 1), size(tpoints, 2));
    
    for i = 1:size(x, 2) - 1
        x(:, i + 1) = (G + 2 * C / h) \ ((2 * C / h - G) * x(:, i) + BTime(i * h) + BTime((i + 1) * h));
    end
    
    r = x(out, :);
end



















