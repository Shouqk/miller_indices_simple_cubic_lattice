%Simple cube 
clear
clc
close all
%Plot atoms at the corrners of the cube
r1 = [0 1 0 0 1 1 0 1];
r2 = [0 0 1 0 1 0 1 1];
r3 = [0 0 0 1 0 1 1 1];

figure 
scatter3(r1(:),r2(:),r3(:),150,'filled')
axis([0 2 0 2 0 2])
hold on 
%Plot edge of the cube
for i = 1:7
   for j = i+1:8
       dist = sqrt((r1(i)-r1(j))^2+(r2(i)-r2(j))^2+(r3(i)-r3(j))^2);
       if (abs(dist-1)<=0.0001)
           plot3([r1(i),r1(j)],[r2(i),r2(j)],[r3(i),r3(j)],'black')
       end
   end
end

%Specify miller indices
%Prompt the user for the miller indices values hkl
h=input('input the value of h: ');
k=input('input the value of k: ');
l=input('input the value of l: ');

if h>=1 && k>=1 && l>=1
    x1=1/h;
    y1=1/k;
    z1=1/l;
 
  X = [x1 0 0];
  Y = [0 y1 0];
  Z = [0 0 z1];
  
  patch(X,Y,Z,'w','FaceColor','b')

elseif h==1&&k==0&&l==0
    [z1,y1]=meshgrid(-1:1:1);
    x1=ones(size(z1,1));
    surf(x1,y1,z1)
elseif h==0&&k==1&&l==0
    [z1,x1]=meshgrid(-1:1:1);
    y1=ones(size(z1,1));
    surf(x1,y1,z1)
elseif h==0&&k==0&&l==1
    [x1,y1]=meshgrid(-1:1:1);
    z1=ones(size(x1,1));
    surf(x1,y1,z1)


elseif h==1 && k==1 && l==0
    patch([1 1 0 0],[0 0 1 1],[0 1 1 0],'blue')
elseif h==1 && k==0 && l==1
    patch([0 1 1 0],[0 0 1 1],[0 0 1 1],'blue')
elseif h==0 && k==1 && l==1
    patch([1 1 0 0],[0 1 1 0],[1 0 0 1],'blue')

else
    disp('no match');
end


