function d=myfminanl2d(r,Pi)
   N=length(r);
   n=zeros(N,3);
   for i=1:N
       n(i,:)=[Pi(i,:),0]/r(i);
   end
   dl=[];
   dls=[];
   for i=1:N
       for j=i+1:N
           dt=0;
           ds=0;
           for k=1:N
               if k~=i && k~=j
                  dt=dt+r(k)*norm(cross(n(k,:)-n(j,:),n(i,:)-n(j,:)))/norm(n(i,:)-n(j,:));
                  ds=dot(n(i,:),n(j,:))*r(j)*r(i);
               end 
           end
           dl=[dl,dt];
           dls=[dls,ds];
       end
   end
   dsort=sort(dl);
   dN=dsort(1:N);
   d=min(dl);