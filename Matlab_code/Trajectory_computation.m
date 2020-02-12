clear all
close all
clc

% Initialisation
p_init=[0,0,0];
p_final=[150,100,100];
p_obst=[75,50,50];
R=30;
r=20;
epsilon=10^-2;
dpx=[epsilon 0 0];
dpy=[0 epsilon 0];
dpz=[0 0 epsilon];
p_norm=norm(p_init-p_final);
p(1,:)=p_init;
gamma=0.1;
gammar=1;
i=1;
erreur=1;

% Trajectory computation
while abs(erreur)>0.1
    px=p(i,:);
    px=px+dpx;
    
   if norm(p(i,:)-p_obst,2)>R
       Jr=0;
   elseif norm(p(i,:)-p_obst,2)<r
       Jr=10^10;
   else
       Jr=(1/(norm(p(i,:)-p_obst,2)-r))-(1/(R-r));
   end
   
   if norm(px-p_obst,2)>R
       Jrx=0;
   elseif norm(px-p_obst,2)<r
       Jrx=10^10;
   else
       Jrx=1/(norm(px-p_obst,2)-r)-1/(R-r);
   end
   
   nabla_x=(norm(px-p_final,2)-(norm(p(i,:)-p_final,2)))/epsilon;
   nabla_xr=(Jrx-Jr)/epsilon;
 
   
    py=p(i,:);
    py=py+dpy;
   if norm(py-p_obst,2)>R
       Jry=0;
   elseif norm(py-p_obst,2)<r
       Jry=10^10;
   else
       Jry=1/(norm(py-p_obst,2)-r)-1/(R-r);
   end
   nabla_y=(norm(py-p_final,2)-(norm(p(i,:)-p_final,2)))/epsilon;
   nabla_yr=(Jry-Jr)/epsilon;
    pz=p(i,:);
    pz=pz+dpz;
   if norm(pz-p_obst,2)>R
       Jrz=0;
   elseif norm(pz-p_obst,2)<r
       Jrz=10^10;
   else
       Jrz=1/(norm(pz-p_obst,2)-r)-1/(R-r);
   end
   nabla_z=(norm(pz-p_final,2)-(norm(p(i,:)-p_final,2)))/epsilon;
   nabla_zr=(Jrz-Jr)/epsilon;
   
   xplus=p(i,1)-gamma*nabla_x-gammar*nabla_xr;
   yplus=p(i,2)-gamma*nabla_y-gammar*nabla_yr;
   zplus=p(i,3)-gamma*nabla_z-gammar*nabla_zr;
   p_next=[xplus, yplus, zplus];
   p(i+1,:)=[xplus yplus zplus];
   p_normx=norm(p(i+1,1)-p_final(1));
   p_normy=norm(p(i+1,2)-p_final(2));
   p_normz=norm(p(i+1,3)-p_final(3));
   erreur=norm(p_next-p_final,2);
   i=i+1;
end

% 3D Plotting
[x,y,z] = sphere;
figure(1)
plot3(p(:,1),p(:,2),p(:,3))
hold on
grid on
surf(x*r+p_obst(1),y*r+p_obst(2),z*r+p_obst(3))
xlabel('x');
ylabel('y');
zlabel('z');

