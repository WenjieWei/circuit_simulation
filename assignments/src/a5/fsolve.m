function r = fsolve(fpoints ,out)
%  fsolve(fpoints ,out)
%  Obtain frequency domain response
% global variables G C b
% Inputs: fpoints is a vector containing the fequency points at which
%         to compute the response in Hz
%         out is the output node
% Outputs: r is a vector containing the value of
%            of the response at the points fpoint
%  
    global G C b
    
    r = zeros(1, size(fpoints, 2));
    
    for i = 1:size(fpoints, 2)
        X = (G + 2 * pi * fpoints(i) * 1j * C) \ b;
        r(1, i) = X(out);
    end  
end

