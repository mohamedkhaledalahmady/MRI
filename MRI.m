            % -------------     Solving Diffusion Equation of formalin in brain   ----------- %
            % --------------            using Finit Difference Method           ----------- %

%% fisrt section --> constants and parameters 
clear                                % clear workspace
clc                                  % clear command window
close all                            % close all figures  
L=20;                                % length taken from space axis      
N=20;                                % no. of points
h=L/N;                               % mesh grid for space axis
k=1;                                 % mesh grid for time axis
D=1/8;                               % Diffusion Constant
lamda=D*k/h^2;                       % just constant help in calculations
%% second section --> define scope of space and time 
x=0:h:L;                             % creat verctor x start from '0' to L with step h 
t=0:k:L;                             % creat verctor t start from '0' to L with step k 
%% third section --> allocate memory for Concentration C(x,t)
C_mat = zeros(length(x),length(t));  % creat matrix C with all zeros with rows (no. of elements in vector x)
                                     % and colums (no. of elements in vector t)   
%% fourth section --> set initial and boundary conditions
C_mat(:,1) = 0;                      % set first colume with 0
C_mat(:,end)= 0;                     % set last colums with 0
C_mat(1,2:end-1)=1;                  % set first row from first colume to (end-1) colume with
                                     % 1 (initial concentration)                            
%%  fifth section --> calculate C(x,t) using FDM 
for r= 1:length(x)-1
    for cc =2:length(t)-1
        C_mat(r+1,cc) = C_mat(r,cc) + lamda*(C_mat(r,cc+1)...
                        -2*C_mat(r,cc) + C_mat(r,cc-1));
    end
end
%% sixth section --> plotting Concentration versis space and time
figure(1)                            % open new figure no. 1 
[tt,xx]=meshgrid(t,x);               % converte vector x % t to matrix xx % tt
mesh(xx,tt,C_mat);                   % plot 3d graph for Concentration
xlabel('x');                         % label x axis
ylabel('t');                         % label y axis
zlabel('C(x,t)');                    % label z axis
title('concentration curve');        % title of graph
figure(2)                            % open new figure no. 2
plot(xx,C_mat,'b','LineWidth',2);    % plot 2d graph C(x) V.s space
xlabel('x');                         % label x axis
ylabel('C(x)');                      % label y axis
title('concentration versis space'); % title of graph
grid on                              % enabel grid on
figure(3)                            % open new figure no. 3
plot(tt,C_mat,'b','LineWidth',2);    % plot 2d graph C(x) V.s time
xlabel('t');                         % label x axis
ylabel('C(x)');                      % label y axis
title('concentration versis time');  % title of graph 
grid on                              % enabel grid on
