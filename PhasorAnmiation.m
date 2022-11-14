% File name: PhasorAnimation.m
% Author: CHAN Yun Sang, Ethan; CHAN Ho Kwan, Tony; SIU Pui Yin, Benji
% Department of Electrical Engineering, The Hong Kong Polytechnic
% University
% Email: ethan.ys.chan@connect.polyu.hk
% Demonstration program: Phasor and space vector

clear all
close all
clc

% SETUP ===================================================================
% all physical quantities in S.I. units unless stated otherwise
                             
% Voltage
A = 10;                     % Amplitude of the AC signal
T = 20;                      % Period of the AC signal
w = 2*pi/T;                  % Angular speed of the AC phasor
N = 400;                   % Number of frames for animation; smaller the value, the more triagular the sinewave will be
t = linspace(0,3*T,N);              % time increment
v  = A .* sin(2*pi*t/T);    % Mathmatic function of the AC Waveform
%vP = A .* cos(2*pi*t/T);   % Use this if you want a Cosine Waveform

% GRAPHICS ================================================================
figure(1)
%   Setup for plot window
set(gcf,'units','normalized'); 
set(gcf,'position',[0.1 0.1 0.6 0.30]);
set(gcf,'Color',[1 1 1]);
set(gca,'FontSize',12);

xP = t; yP = v;
plot(xP,yP,'k','LineWidth',1);  % what is this????

% circle
p = linspace(0,2*pi,500);
xc = A .* cos(p);  % Horizontal Parameter of Circle, plotting action is at line 59
yc = A .* sin(p);  % Vertical Parameter of Circle, plotting action is at line 59

for a = 1 : N 
for c = 1 : N
    hold off
   
   axis equal
   axis off
   
   
   plot([0 A*cos(w*t(c))],[0 A*sin(w*t(c))],'lineWidth',1,'Color',[0 0 1]); % Tracking line of circle (Blue)
   plot([-A 72],[A*sin(w*t(c)) A*sin(w*t(c))],'lineWidth',1,'Color',[0 1 1]); % Reference line
   hold on
   xP = [A*cos(w*t(c)) A*cos(w*t(c))]; yP = [A*sin(w*t(c)) 0]; % Horizontal Component of Circle (red tracking line)
   plot(xP,yP,'r','LineWidth',3) 
   
   xP = [12+t(c) 12+t(c)]; yP = [0 v(c)];% Vertical component of sin wave (red trcking line)
   plot(xP,yP,'r','LineWidth',3);
   
   xP = [12 12+t(end)]; yP = [0 0]; %Background horizontal axis of sin wave, [start point, end point]
   plot(xP,yP,'k','LineWidth',1);
      
   plot(xc,yc,'k','lineWidth',1);  % Perimeter of circle
   
   xP = 12+t; yP = v; % Background sin wave (pink)
   plot(xP,yP,'m','LineWidth',1); 
   
   xP = 12+t(1:c); yP = v(1:c); % Horizontal component of sin wave (blue trcking line)
   plot(xP,yP,'b','LineWidth',3); 
   
   xP = [0 0]; yP = [-A A]; % Background vertical coordinate axis of circle
   plot(xP,yP,'k','LineWidth',1);
   
   xP = [-A A]; yP = [0 0];  % Background horizontal coordinate axis of circle
   plot(xP,yP,'k','LineWidth',1);
   
   hold off
   set(gca,'FontSize',12);
   
   axis equal
   axis off
   pause(0.01) % Delay 
end
end
