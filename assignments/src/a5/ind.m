function ind(n1,n2,val)
          % ind(n1,n2,val)
          % Add stamp for inductor to the global circuit representation
          % Inductor connected between n1 and n2
          % The indjuctance is val in Henry
          % global G
          % global C
          % global b
          % Date:

     % defind global variables
     global G
     global b
     global C
     
     % Add additional entries to G, C, and b matrices. 
     G(end + 1, :) = 0;
     G(:, end + 1) = 0;
     C(end + 1, :) = 0;
     C(:, end + 1) = 0;
     b(end + 1) = 0;
     
     % Modify the G matrix. 
     if n1 ~= 0
         G(end, n1) = 1;
         G(n1, end) = 1;
     end
     
     if n2 ~= 0
         G(end, n2) = -1;
         G(n2, end) = -1;
     end
     
     % Modify the C matrix. 
     C(end, end) = -val;
end
     