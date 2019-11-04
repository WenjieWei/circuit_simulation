

clear all

% Define the Vi points at which we need to 
Vi_vec = linspace(-10,10,100);
target = [-10 -2 8];
marked = [false false false];
indices = zeros(1, 3);
counter = 1;

for I = 1:length(Vi_vec)
    Vi=Vi_vec(I);
    
    Sedra4_93 % Call the netlist.
              % We are calling the netlist repeatedly because Vi has
              % changed. There are more efficient ways to do this. It is ok
              % for very small circuits like this one.
              
    Xdc = dcsolvecont(10,1e-6);
    Vo(I)=Xdc(3); %Store the voltage at the output node
end

figure(1)
hold off
clf
plot(Vi_vec,Vo)
grid
xlabel('Vi (Volts)')
ylabel('Vo (Volts)')
title('Question 2: Vo vs Vi')

hold on

index = [1 41 90];
plot(Vi_vec(index), Vo(index), 'or', 'LineWidth', 2);
offset = 0.05;
for k = 1:3
    caption = sprintf('Vi = %.2f\nVo = %.2f', Vi_vec(index(k)), Vo(index(k)));
    text(Vi_vec(index(k)) - 0.2, Vo(index(k)) + 0.7, caption);
end