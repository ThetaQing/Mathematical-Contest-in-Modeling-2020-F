function [placeCentroidPosition,mInitNext]= getCentroid(num,v,mInit)
load('Q4alpha.mat');
len = length(v(1,:))+1;
cost = zeros(6,len);  
mLeft = zeros(6,len);
mSum = zeros(1,len);
xyzOil = zeros(6,3,len);
placeCentroidPosition = zeros(len,3);
for i = 1 : length(num)
    cost(num(i),:) = oilConsume(v(i,:)); 
end
mLeft = mInit - cost;
mSum = sum(mLeft); 
load('INIT.mat')
a=INIT(:,4);
b=INIT(:,5);
c=INIT(:,6);
vv=zeros(len,6);
Mm=zeros(len,6,3);
Mmm=zeros(6,3);
Mmm_plane=zeros(len,3);
for i=1:6
    alpha0(i)=atand(c(i)/a(i));
end
for t1=1:len 
    vv(t1,:)=mLeft(:,t1)/850;
    for i=1:6
        Vm(i)=a(i)*b(i)*c(i);
        if Q4alpha(t1) < alpha0(i)  
            VT1(t1,i)=0.5*(a(i)^2)*b(i)*tand(Q4alpha(t1));
            VT2(t1,i)=Vm(i)-VT1(t1,i);
            if vv(t1,i) >= 0 && vv(t1,i) <= VT1(t1,i)
                [x,y,z]=state4(a(i),b(i),c(i),Q4alpha(t1),vv(t1,i),INIT(i,1),INIT(i,2),INIT(i,3));
                Mm(t1,i,:)=[x y z];
            elseif vv(t1,i) > VT1(t1,i) && vv(t1,i) <= VT2(t1,i)
                [x,y,z]=state1(a(i),b(i),c(i),Q4alpha(t1),vv(t1,i),INIT(i,1),INIT(i,2),INIT(i,3));
                Mm(t1,i,:)=[x y z];
            elseif vv(t1,i) > VT2(t1,i) && vv(t1,i) <= Vm(i)
                [x,y,z]=state2(a(i),b(i),c(i),Q4alpha(t1),vv(t1,i),INIT(i,1),INIT(i,2),INIT(i,3));
                Mm(t1,i,:)=[x y z];
            else
                disp("not in process Q4alpha(t1) < alpha0(i)");
            end
        elseif Q4alpha(t1) >= alpha0(i)                 
            VT3(t1,i)=0.5*c(i)^2*b(i)/tand(Q4alpha(t1));
            VT4(t1,i)=Vm(i)-VT3(t1,i);
            if vv(t1,i) >= 0 && vv(t1,i) <= VT3(t1,i)
                [x,y,z]=state4(a(i),b(i),c(i),Q4alpha(t1),vv(t1,i),INIT(i,1),INIT(i,2),INIT(i,3));
                Mm(t1,i,:)=[x y z];
            elseif vv(t1,i) > VT3(t1,i) && vv(t1,i) <= VT4(t1,i)
                [x,y,z]=state3(a(i),b(i),c(i),Q4alpha(t1),vv(t1,i),INIT(i,1),INIT(i,2),INIT(i,3));
                Mm(t1,i,:)=[x y z];
            elseif vv(t1,i) > VT4(t1,i) && vv(t1,i) <= Vm(i)
                [x,y,z]=state2(a(i),b(i),c(i),Q4alpha(t1),vv(t1,i),INIT(i,1),INIT(i,2),INIT(i,3));
                Mm(t1,i,:)=[x y z];  
            else
                disp("not in process Q4alpha(t1) >= alpha0(i)");
            end
        else
            disp("error");
         
        end
    end
    Mmm(:,:)=Mm(t1,:,:);
    [Mm_plane]=centroid_plane(Mmm,mLeft(:,len)');
    placeCentroidPosition(t1,:)=[Mm_plane(1),Mm_plane(2),Mm_plane(3)];
end
mInitNext = mLeft(:,len);
