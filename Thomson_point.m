%Thomson point
M=importdata('Thomson_point.mat','-mat') % input coordinates for Thomson point
X=length(M);
R=[]
for j=1:X
    Pi=M{j}
    r=[];
    N=length(Pi)
    for i=1:N
        r=[r,norm(Pi(i,:))];  % coefficient alpha for different rank-1 effect of POVM Pi 
    end   
    sumP=[0,0,0];
    for i=1:N
        sumP=sumP+Pi(i,:);
    end
    sum0=sumP
    Pi=Pi/sum(r);    % Normalization
    r=r/sum(r);
    R=[R,myfminanl3d(r,Pi)]
    
end
