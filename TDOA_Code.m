%Simple TDOA Code in Matrix format with 4 Anchor nodes
%Referred paper: 
%Performance Comparison of Localization Techniques For Sequential WSN Discovery 
%DOI: 10.1049/ic.2012.0120

clear
clc

%% Source/Target Node location
x0=0;
y0=0;
r0=[x0, y0]; %Source/Target location

%%
%Declare anchor nodes

%Anchor Node 1
x1=50;
y1=10;
r1=[x1, y1]; % moving anchor node 1

%Anchor Node 2
x2=10;
y2=100;
r2=[x2, y2]; %anchor node 2

%Anchor Node 3
x3=-70;
y3=0;
r3=[x3, y3]; %anchor node 3

%Anchor Node 4
x4=4;
y4=-15;
r4=[x4, y4]; %anchor node 4

y=[r1;r2;r3;r4];
%% time difference measurements

%Signal Propagation speed
c=340.29; %in meter/second

t10=norm(r1-r0)/c; %propagation time from source to the first node

t20=norm(r2-r0)/c; %propagation time from source to the second node

t30=norm(r3-r0)/c; %propagation time from source to the third node

t40=norm(r4-r0)/c; %propagation time from source to the fourth node

t21=t20-t10; % difference in propagation time from node 2 to node 1

t31=t30-t10; % difference in propagation time from node 3 to node 1

t41=t40-t10; % difference in propagation time from node 4 to node 1

%Hermitian Matrix
H=[r2-r1;r3-r1;r4-r1];

% b Matrix 
b = 1/2.*[norm(r2).^2 - norm(r1).^2 - c^2*(t21^2+2*t10*t21);
          norm(r3).^2 - norm(r1).^2 - c^2*(t31^2+2*t10*t31);
          norm(r4).^2 - norm(r1).^2 - c^2*(t41^2+2*t10*t41)];
      
H_pseudo=pinv(H);% psudo inverser of hermitian

r0_estimate=H_pseudo*b; % compute localization estimate


