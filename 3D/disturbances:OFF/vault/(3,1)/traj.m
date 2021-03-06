close all
clear all
load('tT_1.mat')
load('tT_2.mat')
load('tT_3.mat')
load('uU_1_proper.mat')
load('uU_2_proper.mat')
load('uU_3_proper.mat')
load('xX_1.mat')
load('xX_2.mat')
load('xX_3.mat')
% 
% figure(1)
% hold on
% grid
% axis([-7 7 0 5])
% axis equal
% filename = 'trajectories.gif';
% for i=1:size(tT_1,1)
%     
%   plot(des_1(1), des_1(2), 'X', 'Color', 'b')
%   plot(des_2(1), des_2(2), 'X', 'Color', 'r')
%   plot(des_3(1), des_3(2), 'X', 'Color', 'g')
% 
%   
%   viscircles([xX_1(i,1) + des_1(1),  xX_1(i,2) + des_1(2)], r(1), 'EdgeColor', 'b')
%   viscircles([xX_2(i,1) + des_2(1),  xX_2(i,2) + des_2(2)], r(2), 'EdgeColor', 'r')
%   viscircles([xX_3(i,1) + des_3(1),  xX_3(i,2) + des_3(2)], r(3), 'EdgeColor', 'g')
% 
%   viscircles([obs(1,1), obs(1,2)], obs(1,3), 'EdgeColor', 'k')
%   
%   pause()
% 
%    drawnow
%    frame = getframe(1);
%    im = frame2im(frame);
%    [imind,cm] = rgb2ind(im,256);
%    if i == 1;
%      imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
%    else
%      imwrite(imind,cm,filename,'gif','WriteMode','append');
%    end
%   cla
% end


% Distances of agents 1,2,3 to the obstacle
figure
hold on
plot(sqrt((xX_1(:,1)+(des_1(1)-obs(1,1))*ones(size(tT_1))).^2 + (xX_1(:,2)+(des_1(2)-obs(1,2))*ones(size(tT_1))).^2));
plot(sqrt((xX_2(:,1)+(des_2(1)-obs(1,1))*ones(size(tT_1))).^2 + (xX_2(:,2)+(des_2(2)-obs(1,2))*ones(size(tT_2))).^2));
plot(sqrt((xX_3(:,1)+(des_3(1)-obs(1,1))*ones(size(tT_1))).^2 + (xX_3(:,2)+(des_3(2)-obs(1,2))*ones(size(tT_2))).^2));
grid
constr_x = [0, 30];
constr_y = [1.6, 1.6];
plot(constr_x, constr_y, 'Color', 'c')
axis([0 30 1.2 7])

% Distance of agent 1 to agent 2
figure
hold on
constr_x = [0, 30];
constr_y = [1.1, 1.1];
plot(constr_x, constr_y, 'Color', 'c')
constr_x = [0, 30];
constr_y = [2.1, 2.1];
plot(constr_x, constr_y, 'Color', 'c')
axis([0 30 0.8 2.2])
grid
plot(...
  sqrt(...
    (xX_1(:,1) - xX_2(:,1)+ (des_1(1) - des_2(1))*ones(size(tT_1))).^2 + ...
    (xX_1(:,2) - xX_2(:,2)+ (des_1(2) - des_2(2))*ones(size(tT_1))).^2 ...
  ), 'Color', [0.00000,0.44700,0.74100] ...
);

% Distance of agent 1 to agent 3
figure
hold on
constr_x = [0, 30];
constr_y = [1.1, 1.1];
plot(constr_x, constr_y, 'Color', 'c')
constr_x = [0, 30];
constr_y = [2.1, 2.1];
plot(constr_x, constr_y, 'Color', 'c')
axis([0 30 0.8 2.2])
grid
plot(...
  sqrt(...
    (xX_1(:,1) - xX_3(:,1)+ (des_1(1) - des_3(1))*ones(size(tT_1))).^2 + ...
    (xX_1(:,2) - xX_3(:,2)+ (des_1(2) - des_3(2))*ones(size(tT_1))).^2 ...
  ), 'Color', [0.00000,0.44700,0.74100] ...
);

% Distance of agent 2 to agent 3
figure
hold on
constr_x = [0, 30];
constr_y = [1.1, 1.1];
plot(constr_x, constr_y, 'Color', 'c')
grid
plot(...
  sqrt(...
    (xX_2(:,1) - xX_3(:,1)+ (des_2(1) - des_3(1))*ones(size(tT_1))).^2 + ...
    (xX_2(:,2) - xX_3(:,2)+ (des_2(2) - des_3(2))*ones(size(tT_1))).^2 ...
  ), 'Color', [0.00000,0.44700,0.74100] ...
);

% errors
figure
plot(xX_1)
grid

figure
plot(xX_2)
grid

figure
plot(xX_3)
grid

% inputs
figure
hold on
constr_x = [0, 30];
constr_y = [-10, -10];
plot(constr_x, constr_y, 'Color', 'c')
constr_x = [0, 30];
constr_y = [10, 10];
plot(constr_x, constr_y, 'Color', 'c')
plot(uU_1_proper(1,:), 'Color', [0    0.4470    0.7410])
plot(uU_1_proper(2,:), 'Color',  [0.8500    0.3250    0.0980])
axis([1 30 -11 11])
grid

figure
hold on
constr_x = [0, 30];
constr_y = [-10, -10];
plot(constr_x, constr_y, 'Color', 'c')
constr_x = [0, 30];
constr_y = [10, 10];
plot(constr_x, constr_y, 'Color', 'c')
plot(uU_2_proper(1,:), 'Color', [0    0.4470    0.7410])
plot(uU_2_proper(2,:), 'Color',  [0.8500    0.3250    0.0980])
axis([1 30 -11 11])
grid

figure
hold on
constr_x = [0, 30];
constr_y = [-10, -10];
plot(constr_x, constr_y, 'Color', 'c')
constr_x = [0, 30];
constr_y = [10, 10];
plot(constr_x, constr_y, 'Color', 'c')
plot(uU_3_proper(1,:), 'Color', [0    0.4470    0.7410])
plot(uU_3_proper(2,:), 'Color',  [0.8500    0.3250    0.0980])
axis([1 30 -11 11])
grid