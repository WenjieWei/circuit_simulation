function vcvs(nd1,nd2,ni1,ni2,val)
    % vcvs(nd1,nd2,ni1,ni2,val)
    % Add stamp for a voltage controlled voltage source
    % to the global circuit representation
    % val is the gain of the vcvs
    % ni1 and ni2 are the controlling voltage nodes
    % nd1 and nd2 are the controlled voltage nodes
    % The relation of the nodal voltages at nd1, nd2, ni1, ni2 is:
    % Vnd1 - Vnd2 = val*(Vni1 - Vni2)


    global G
    global b
    global C

    % Extend the matrices. 
    G(end + 1, :) = 0;
    G(:, end + 1) = 0;    
    b(end + 1) = 0;    
    C(end + 1, :) = 0;
    C(:, end + 1) = 0;
    
    if nd1 ~= 0
        G(nd1, end) = 1;
        G(end, nd1) = 1;
    end
    
    if nd2 ~= 0
        G(nd2, end) =  -1;
        G(end, nd2) = -1;
    end
    
    if ni1 ~= 0
        G(end, ni1) = -val;
    end
    if ni2 ~= 0
        G(end, ni2) = val;
    end
end





    