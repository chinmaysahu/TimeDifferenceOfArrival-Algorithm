%% TDOA with anchor nodes repesented in matrix form to estimate target
% Unknown:
%        x : unknown target location
%        t0: unknown start time of signal
% Known: Anchor locations
%        y

clc
clear

t0=50;  % unknown start time used to generate time measurements
x=[0,0]; % target location
c=10; %signal propagation speed
n=0.1; %noise variance
y=[50,10;10,100;-70,0;4,-15;100,-15;38,54;21,-32;15,97;12,32;-12,-21]; % anchors
mCLen=100000;
noise=0:0.1:1;
squared_error=zeros(mCLen,length(noise));
for nLength=1:length(noise)
   n=noise(nLength);
for mcN=1:mCLen
    
    t = TDOAGenerator(t0,x,y,n,c); % time measurements by calling TDOA generator
    
    xhat=TDOALocalization(y,t,c); % target estimation
    
    squared_error(mcN,nLength)=pdist2(xhat(1:2)',x,'euclidean');
    
end
end

err10=mean(squared_error);

plot(noise,err10,'lineWidth',2);
xlabel('Noise Variance','FontName','Times New Roman','FontSize',24,'FontWeight','bold','interpreter','latex');
ylabel('Mean Sqaure error','FontName','Times New Roman','FontSize',24,'FontWeight','bold','interpreter','latex');
set(gca,'FontName','Times New Roman','FontSize',20,'FontWeight','bold','linewidth',2,'ticklength',[0.025 0.05],'TickLabelInterpreter', 'latex');
title('Mean Square Estimation error vs Noise Variance (10 Anchors)')
