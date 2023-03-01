
%Obtaining lower bound on R(n)for n>=4 by randomly sampling {\Pi_i} and computing
%R({\Pi_i})with myfminanl3d
function Rm=Nrandom3d_N(N,iter)   
    Rm=0.0;
    theta=zeros(1,N);
    phi=zeros(1,N);
    r=zeros(1,N);
    p=zeros(N,3);
    for j=1:iter
        theta(1)=0;
        r(1)=0.25;
        phi(1)=0;
        p(1,:) = [r(1)*cos(theta(1))*cos(phi(1)),r(1)*cos(theta(1))*sin(phi(1)),r(1)*sin(theta(1))];
        p(N,:)=[0,0,0]-p(1,:);
        for i=2:N-1
           r(i)=0.5*rand(1);
           theta(i)=2*pi*rand(1);
           phi(i)=2*pi*rand(1); 
           p(i,:) = [r(i)*cos(theta(i))*cos(phi(i)),r(i)*cos(theta(i))*sin(phi(i)),r(i)*sin(theta(i))];
           p(N,:)=p(N,:)-p(i,:);
        end
        r(N)=norm(p(N,:));   
        l=sum(r); 
        Pi=p/l;
        r=r/l;
        d=myfminanl3d(r,Pi);
        %d=myfmincon(r,Pi)
        if d>Rm
           Rm=d
           r_o=r;
           Pi_o=Pi;
        end    
    end
    Pi_max=Pi_o