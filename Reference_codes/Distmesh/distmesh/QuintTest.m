clc;
syms zhi eta;
S=[ (625*zhi^5)/24 - (625*zhi^4)/12 + (875*zhi^3)/24 - (125*zhi^2)/12 + zhi,(625*eta^5)/24 - (625*eta^4)/12 + (875*eta^3)/24 - (125*eta^2)/12 + eta, - (625*eta^5)/24 - (3125*eta^4*zhi)/24 + (625*eta^4)/8 - (3125*eta^3*zhi^2)/12 + (625*eta^3*zhi)/2 - (2125*eta^3)/24 - (3125*eta^2*zhi^3)/12 + (1875*eta^2*zhi^2)/4 - (2125*eta^2*zhi)/8 + (375*eta^2)/8 - (3125*eta*zhi^4)/24 + (625*eta*zhi^3)/2 - (2125*eta*zhi^2)/8 + (375*eta*zhi)/4 - (137*eta)/12 - (625*zhi^5)/24 + (625*zhi^4)/8 - (2125*zhi^3)/24 + (375*zhi^2)/8 - (137*zhi)/12 + 1, (3125*eta*zhi^4)/24 - (625*eta*zhi^3)/4 + (1375*eta*zhi^2)/24 - (25*eta*zhi)/4,(3125*eta^2*zhi^3)/12 - (625*eta^2*zhi^2)/4 + (125*eta^2*zhi)/6 - (625*eta*zhi^3)/12 + (125*eta*zhi^2)/4 - (25*eta*zhi)/6, (3125*eta^3*zhi^2)/12 - (625*eta^3*zhi)/12 - (625*eta^2*zhi^2)/4 + (125*eta^2*zhi)/4 + (125*eta*zhi^2)/6 - (25*eta*zhi)/6, (3125*zhi*eta^4)/24 - (625*zhi*eta^3)/4 + (1375*zhi*eta^2)/24 - (25*zhi*eta)/4, (25*eta*zhi)/4 - (25*eta)/4 - (1375*eta^2*zhi)/24 + (625*eta^3*zhi)/4 - (3125*eta^4*zhi)/24 + (1525*eta^2)/24 - (5125*eta^3)/24 + (6875*eta^4)/24 - (3125*eta^5)/24, (3125*eta^5)/12 + (3125*eta^4*zhi)/6 - 625*eta^4 + (3125*eta^3*zhi^2)/12 - (3125*eta^3*zhi)/4 + (6125*eta^3)/12 - (625*eta^2*zhi^2)/4 + (3875*eta^2*zhi)/12 - (325*eta^2)/2 + (125*eta*zhi^2)/6 - (75*eta*zhi)/2 + (50*eta)/3, - (3125*eta^5)/12 - (3125*eta^4*zhi)/4 + (8125*eta^4)/12 - (3125*eta^3*zhi^2)/4 + (5625*eta^3*zhi)/4 - (7375*eta^3)/12 - (3125*eta^2*zhi^3)/12 + (3125*eta^2*zhi^2)/4 - (8875*eta^2*zhi)/12 + (2675*eta^2)/12 + (625*eta*zhi^3)/12 - 125*eta*zhi^2 + (1175*eta*zhi)/12 - 25*eta,(3125*eta^5)/24 + (3125*eta^4*zhi)/6 - (4375*eta^4)/12 + (3125*eta^3*zhi^2)/4 - (4375*eta^3*zhi)/4 + (8875*eta^3)/24 + (3125*eta^2*zhi^3)/6 - (4375*eta^2*zhi^2)/4 + (8875*eta^2*zhi)/12 - (1925*eta^2)/12 + (3125*eta*zhi^4)/24 - (4375*eta*zhi^3)/12 + (8875*eta*zhi^2)/24 - (1925*eta*zhi)/12 + 25*eta, (3125*eta^4*zhi)/24 + (3125*eta^3*zhi^2)/6 - (4375*eta^3*zhi)/12 + (3125*eta^2*zhi^3)/4 - (4375*eta^2*zhi^2)/4 + (8875*eta^2*zhi)/24 + (3125*eta*zhi^4)/6 - (4375*eta*zhi^3)/4 + (8875*eta*zhi^2)/12 - (1925*eta*zhi)/12 + (3125*zhi^5)/24 - (4375*zhi^4)/12 + (8875*zhi^3)/24 - (1925*zhi^2)/12 + 25*zhi, - (3125*eta^3*zhi^2)/12 + (625*eta^3*zhi)/12 - (3125*eta^2*zhi^3)/4 + (3125*eta^2*zhi^2)/4 - 125*eta^2*zhi - (3125*eta*zhi^4)/4 + (5625*eta*zhi^3)/4 - (8875*eta*zhi^2)/12 + (1175*eta*zhi)/12 - (3125*zhi^5)/12 + (8125*zhi^4)/12 - (7375*zhi^3)/12 + (2675*zhi^2)/12 - 25*zhi, (3125*eta^2*zhi^3)/12 - (625*eta^2*zhi^2)/4 + (125*eta^2*zhi)/6 + (3125*eta*zhi^4)/6 - (3125*eta*zhi^3)/4 + (3875*eta*zhi^2)/12 - (75*eta*zhi)/2 + (3125*zhi^5)/12 - 625*zhi^4 + (6125*zhi^3)/12 - (325*zhi^2)/2 + (50*zhi)/3, (25*eta*zhi)/4 - (25*zhi)/4 - (1375*eta*zhi^2)/24 + (625*eta*zhi^3)/4 - (3125*eta*zhi^4)/24 + (1525*zhi^2)/24 - (5125*zhi^3)/24 + (6875*zhi^4)/24 - (3125*zhi^5)/24,(3125*eta^3*zhi^2)/4 - (625*eta^3*zhi)/4 + (3125*eta^2*zhi^3)/2 - (6875*eta^2*zhi^2)/4 + (1125*eta^2*zhi)/4 + (3125*eta*zhi^4)/4 - (3125*eta*zhi^3)/2 + (3625*eta*zhi^2)/4 - 125*eta*zhi,- (3125*eta^3*zhi^2)/4 + (625*eta^3*zhi)/4 - (3125*eta^2*zhi^3)/4 + (4375*eta^2*zhi^2)/4 - (375*eta^2*zhi)/2 + (625*eta*zhi^3)/4 - (375*eta*zhi^2)/2 + (125*eta*zhi)/4, - (3125*eta^2*zhi^3)/6 + (625*eta^2*zhi^2)/2 - (125*eta^2*zhi)/3 - (3125*eta*zhi^4)/6 + (2500*eta*zhi^3)/3 - (2125*eta*zhi^2)/6 + (125*eta*zhi)/3,- (3125*eta^4*zhi)/6 - (3125*eta^3*zhi^2)/6 + (2500*eta^3*zhi)/3 + (625*eta^2*zhi^2)/2 - (2125*eta^2*zhi)/6 - (125*eta*zhi^2)/3 + (125*eta*zhi)/3,- (3125*eta^4*zhi)/6 - (3125*eta^3*zhi^2)/2 + 1250*eta^3*zhi - (3125*eta^2*zhi^3)/2 + 2500*eta^2*zhi^2 - (5875*eta^2*zhi)/6 - (3125*eta*zhi^4)/6 + 1250*eta*zhi^3 - (5875*eta*zhi^2)/6 + 250*eta*zhi,(3125*eta^4*zhi)/4 + (3125*eta^3*zhi^2)/2 - (3125*eta^3*zhi)/2 + (3125*eta^2*zhi^3)/4 - (6875*eta^2*zhi^2)/4 + (3625*eta^2*zhi)/4 - (625*eta*zhi^3)/4 + (1125*eta*zhi^2)/4 - 125*eta*zhi];

fd=@(p) drectangle(p,0,2,0,2);
[p,t]=distmesh2d(fd,@huniform,2,[0,0;2,2],[0,0;2,0;2,2;0,2]);
%[p,t,be]=kmg2d(fd,@huniform,h0,[0,0;2,2],1,0,[0,0;2,0;2,2;0,2]);
Nnorm=size(p,1);
be=boundedges(p,t);
b=unique(be);
N=size(p,1); 
T1 = size(t,1);
M=sparse(N,N);
cnt = N+1;
M1=sparse(N,N);
M2=sparse(N,N); 
M3=sparse(N,N);
M4=sparse(N,N);
lnodes1=zeros(6,2);
for e=1:T1
     nodes1 = t(e,:); % row of t = node numbers of the 3 corners of triangle e
    if (M1(nodes1(1,1),nodes1(1,2)) == 0)
     lnodes1(:,1) = linspace(p(nodes1(1,1),1),p(nodes1(1,2),1),6);
     lnodes1(:,2) = linspace(p(nodes1(1,1),2),p(nodes1(1,2),2),6);
     M1(nodes1(1,1),nodes1(1,2)) = cnt;
      M4(nodes1(1,2),nodes1(1,1)) = cnt;
        p(cnt,:) = lnodes1(2,:);
     cnt =cnt+ 1;
     M2(nodes1(1,1),nodes1(1,2)) = cnt;
     M3(nodes1(1,2),nodes1(1,1)) = cnt;
      p(cnt,:) = lnodes1(3,:);
     cnt =cnt+ 1;
     M3(nodes1(1,1),nodes1(1,2)) = cnt;
     M2(nodes1(1,2),nodes1(1,1)) = cnt;
      p(cnt,:) = lnodes1(4,:);
       cnt =cnt+ 1;
     M4(nodes1(1,1),nodes1(1,2)) = cnt;
     M1(nodes1(1,2),nodes1(1,1)) = cnt;
      p(cnt,:) = lnodes1(5,:);
       cnt =cnt+ 1;
    end
  if (M1(nodes1(1,2),nodes1(1,3)) == 0)
     lnodes1(:,1) = linspace(p(nodes1(1,2),1),p(nodes1(1,3),1),6);
     lnodes1(:,2) = linspace(p(nodes1(1,2),2),p(nodes1(1,3),2),6);
     M1(nodes1(1,2),nodes1(1,3)) = cnt;
     M4(nodes1(1,3),nodes1(1,2)) = cnt;
     p(cnt,:) = lnodes1(2,:);
     cnt=cnt+ 1;
     M2(nodes1(1,2),nodes1(1,3)) = cnt;
     M3(nodes1(1,3),nodes1(1,2)) = cnt;
     p(cnt,:) = lnodes1(3,:);
     cnt =cnt+ 1; 
     M3(nodes1(1,2),nodes1(1,3)) = cnt;
     M2(nodes1(1,3),nodes1(1,2)) = cnt;
      p(cnt,:) = lnodes1(4,:);
     cnt =cnt+ 1;
     M4(nodes1(1,2),nodes1(1,3)) = cnt;
     M1(nodes1(1,3),nodes1(1,2)) = cnt;
      p(cnt,:) = lnodes1(5,:);
     cnt =cnt+ 1;
  end
  if (M1(nodes1(1,1),nodes1(1,3)) == 0)
     lnodes1(:,1) = linspace(p(nodes1(1,3),1),p(nodes1(1,1),1),6);
     lnodes1(:,2) = linspace(p(nodes1(1,3),2),p(nodes1(1,1),2),6);
     M1(nodes1(1,1),nodes1(1,3)) = cnt;
     M4(nodes1(1,3),nodes1(1,1)) = cnt;
     p(cnt,:) = lnodes1(5,:);
     cnt=cnt+ 1;
     M2(nodes1(1,1),nodes1(1,3)) = cnt;
     M3(nodes1(1,3),nodes1(1,1)) = cnt;
     p(cnt,:) = lnodes1(4,:);
     cnt =cnt+ 1;
      M3(nodes1(1,1),nodes1(1,3)) = cnt;
     M2(nodes1(1,3),nodes1(1,1)) = cnt;
      p(cnt,:) = lnodes1(3,:);
        cnt=cnt+ 1;
     M4(nodes1(1,1),nodes1(1,3)) = cnt;
     M1(nodes1(1,3),nodes1(1,1)) = cnt;
      p(cnt,:) = lnodes1(2,:);
        cnt=cnt+ 1;
  end
  t(e,4) = M1(nodes1(1,1),nodes1(1,2));
  t(e,5) = M2(nodes1(1,1),nodes1(1,2));   
  t(e,6) = M3(nodes1(1,1),nodes1(1,2));
  t(e,7) = M4(nodes1(1,1),nodes1(1,2));
  t(e,8) = M1(nodes1(1,2),nodes1(1,3));
  t(e,9) = M2(nodes1(1,2),nodes1(1,3));
  t(e,10) = M3(nodes1(1,2),nodes1(1,3));
  t(e,11) = M4(nodes1(1,2),nodes1(1,3));
  t(e,12) = M4(nodes1(1,1),nodes1(1,3));
  t(e,13) = M3(nodes1(1,1),nodes1(1,3));
  t(e,14) = M2(nodes1(1,1),nodes1(1,3));
  t(e,15) = M1(nodes1(1,1),nodes1(1,3));
  t(e,16) = cnt;
  t(e,17) = cnt+1;
  t(e,18) = cnt+2;
  t(e,19) = cnt+3;
  t(e,20) = cnt+4;
  t(e,21) = cnt+5;
  p(cnt,:)=(1/40).*(9.*p(t(e,1),:)-7.*p(t(e,2),:))+(1/5).*p(t(e,3),:)+(3/8).*(p(t(e,4),:)+p(t(e,7),:));
  p(cnt+1,:)=(-1/10).*(p(t(e,1),:)+p(t(e,2),:))+(1/5).*p(t(e,3),:)+(1/2).*(p(t(e,4),:)+p(t(e,7),:));
  p(cnt+2,:)=(1/40).*(-7.*p(t(e,1),:)+9.*p(t(e,2),:))+(1/5).*p(t(e,3),:)+(3/8).*(p(t(e,4),:)+p(t(e,7),:));
  p(cnt+3,:)=(1/20).*(-p(t(e,1),:)+3.*p(t(e,2),:))+(2/5).*p(t(e,3),:)+(1/4).*(p(t(e,4),:)+p(t(e,7),:));
  p(cnt+4,:)=(3/40).*(p(t(e,1),:)+p(t(e,2),:))+(3/5).*p(t(e,3),:)+(1/8).*(p(t(e,4),:)+p(t(e,7),:));
  p(cnt+5,:)=(1/20).*(3.*p(t(e,1),:)-p(t(e,2),:))+(2/5).*p(t(e,3),:)+(1/4).*(p(t(e,4),:)+p(t(e,7),:));
     cnt=cnt+6;
     for i=1:21
         p(t(e,i),:)
         A=subs(S(1,i),[zhi eta],p(t(e,i),:));
     fprintf('S(%d,%d)=',e,i)
     disp(double(A));
     end
end
 for ii=1:size(be)
  nodes1 = be(ii,:);
  if (M1(nodes1(1,1),nodes1(1,2)) ~= 0)
    b = [b; M1(nodes1(1,1),nodes1(1,2))];
    b = [b; M2(nodes1(1,1),nodes1(1,2))];
    b = [b; M3(nodes1(1,1),nodes1(1,2))];
    b = [b; M4(nodes1(1,1),nodes1(1,2))];
 end
 end
for i=1:cnt-1
Nno = ['*',num2str(i)];
xc=p(i,1);yc=p(i,2);
text(xc,yc,Nno);
end
        