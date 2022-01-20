function Gmsh_Matlab_image
%------------------------------------------------------------------------%
%------ Gmsh to Matlab script: Import mesh to matlab---------------------%
%------------------------------------------------------------------------%
% to work on HO mesh
clc
close all
clear 

%-----------------------------------------------------------------------%
% dlmread(filename,delimiter,[R1 C1 R2 C2]) reads only the range 
% bounded by row offsets R1 and R2 and column offsets C1 and C2.
%-----------------------------------------------------------------------%
file    = 'OM.msh'; %('your GMsh file in .msh format');

% no of nodes is mentioned in 5th row and first column

N_n      = dlmread(file,'',[5-1 1-1 5-1 1-1]);
N_e      = dlmread(file,'',[7+N_n 0 7+N_n 0]);

node_id     = dlmread(file,'',[5 0 4+N_n 0]);
nodes       = dlmread(file,'',[5 1 4+N_n 3]);
elements    = dlmread(file,'',[8+N_n 0 7+N_n+N_e 7]);

%------- 2D Geometry

two_d_nodes = nodes(:,1:2);
elem_type   = elements(:,2);

%--- find the starting indices of 2D elements
two_ind = 1;
for i = 1:N_e
    if(elem_type(i) ~= 2)
        two_ind = two_ind+1;
    end
end
%----------------------------------------------

two_d_elements(1:N_e-two_ind,1:3) = 0;
k = 1;
for i = two_ind:N_e
   two_d_elements(k,1:3) = elements(i,6:8);
   k = k+1;
end

%---- visualize in matlab ---------------------
x=two_d_nodes(:,1);
y=two_d_nodes(:,2);
DT = delaunay(x,y);
trimesh(DT,x,y);
np=size(x(:,1),1);
p=[x,y];
t=[DT(:,2) DT(:,1) DT(:,3)];
%Q=meshquality(p,t);
T1=size(t,1);
be=boundedges(p,t); 
b=unique(be);
N=size(p,1); 
M=sparse(N,N);
d=sparse(N,N,N);
cnt = N+1;
n =1; %order of the triangle element

for i=1:cnt-1
Nno = ['*',num2str(i)];
%Nno = '*';
xc=p(i,1);yc=p(i,2);
text(xc,yc,Nno);
end
N=size(p,1); 
Np = size(p,1); T = size(t,1);
fprintf('Total no. of Nodes=%d \n',Np)
fprintf('Total no. of Elements=%d \n',T);
%for i=1:N
i=4
fprintf('p(%d)=(%2.2f,%2.2f)\n',i,p(i,:));
%end
%disp('Element wise Node Numbering, t=');disp(t);
%disp('Boundary Nodes=');disp(b);
disp(d)
end
