function d=myfminanl3d(r,Pi)
   N=length(r);
   n=zeros(N,3);
   for i=1:N
       n(i,:)=Pi(i,:)/r(i);
   end
   dl=[];
   for i=1:N
       for j=i+1:N
           for k=j+1:N
               dt=0;
               for x=1:N
                  dt=dt+r(x)*norm(dot(cross(n(k,:)-n(j,:),n(i,:)-n(j,:)),n(x,:)-n(j,:)))/norm(cross(n(k,:)-n(j,:),n(i,:)-n(j,:)));
               end
               dl=[dl,dt];
           end
       end
   end
   dsort=sort(dl);
   dN=dsort(1:N);
   d=min(dl);