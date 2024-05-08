function [] = plot_two_cylinders(q)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

ntime = size(q,1);

x1I = q(:,1);
x2I = q(:,2);
x3I = q(:,3);
psiI = q(:,4);
thetaI = q(:,5);
phiI = q(:,6);

x1II = q(:,7);
x2II = q(:,8);
x3II = q(:,9);
psiII = q(:,10);
thetaII = q(:,11);
phiII = q(:,12);

figure()

axis equal
view(45,45)
xlim([-5 5])
ylim([-5 5])
zlim([-1 6])
box on

set(gca,'XTick',[], 'YTick', [], 'ZTick', [])

animation = VideoWriter('rolling_two_cylinders.avi');
animation.FrameRate = 100;
open(animation);

for i = 1:ntime
    hold on
    
    [disktI,diskbI,cylinder_axisI,sidesI,pointAI,pointPI,basisI,~] = ...
        plot_cylinder(x1I(i),x2I(i),x3I(i),psiI(i),thetaI(i),phiI(i),'green');
    [disktII,diskbII,cylinder_axisII,sidesII,pointAII,pointPII,basisII,~] = ...
        plot_cylinder(x1II(i),x2II(i),x3II(i),psiII(i),thetaII(i),phiII(i),'blue');
    drawnow
    writeVideo(animation, getframe(gcf));
    pause(0.00001)
    delete(disktI)
    delete(diskbI)
    delete(cylinder_axisI)
    delete(sidesI)
    delete(pointAI)
    delete(basisI)
    delete(disktII)
    delete(diskbII)
    delete(cylinder_axisII)
    delete(sidesII)
    delete(pointAII)
    delete(basisII)
    
end

close(animation)

end

