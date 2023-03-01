%Obtaining lower bound on R^p(n)for n>=3 by randomly sampling {\Pi_i} and computing
%R^p({\Pi_i})with myfminanl2d

function Rm=Nrandom2d_N(N,iter)
    Rm=0.2;
    theta=zeros(1,N);
    r=zeros(1,N);
    p=zeros(N,2);
    for j=1:iter
        theta(1)=0;
        r(1)=0.25;
        p(1,:) = [r(1)*cos(theta(1)),r(1)*sin(theta(1))];
        p(N,:)=-p(1,:);
        for i=2:N-1
           r(i)=0.5*rand(1);
           theta(i)=2*pi*rand(1);
           p(i,:) = [r(i)*cos(theta(i)),r(i)*sin(theta(i))];
           p(N,:)=p(N,:)-p(i,:);
        end
        r(N)=norm(p(N,:));   
        l=sum(r); 
        Pi=p/l;
        r=r/l;
        d=myfminanl2d(r,Pi);
        if d>Rm
           Rm=d
           r_o=r;
           Pi_o=Pi;
        end
    end
