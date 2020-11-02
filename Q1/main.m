load('INIT.mat')
load('alpha.mat')
t=7200;
a=INIT(:,4);
b=INIT(:,5);
c=INIT(:,6);
v=zeros(t,6);
Mmm=zeros(6,3);
Mmm_plane=zeros(t,3);
for i=1:6
    alpha0(i)=atand(c(i)/a(i));
end
for t1=1:t 
    [v1]=V_left(t1);
    v(t1,:)=v1;
    v1
    t1
    for i=1:6
        Vm(i)=a(i)*b(i)*c(i);
        if alpha(t1) < alpha0(i)  
            VT1(t1,i)=0.5*(a(i)^2)*b(i)*tand(alpha(t1));
            VT2(t1,i)=Vm(i)-VT1(t1,i);
            if v(t1,i) >= 0 && v(t1,i) <= VT1(t1,i)*850
                %״̬4
                [x,y,z]=state4(a(i),b(i),c(i),alpha(t1),v(t1,i),INIT(i,1),INIT(i,2),INIT(i,3));
                Mm(t1,i,:)=[x y z];
            elseif v(t1,i) > VT1(t1,i)*850 && v(t1,i) <= VT2(t1,i)*850
                %״̬1
                [x,y,z]=state1(a(i),b(i),c(i),alpha(t1),v(t1,i),INIT(i,1),INIT(i,2),INIT(i,3));
                Mm(t1,i,:)=[x y z];
            elseif v(t1,i) > VT2(t1,i)*850 && v(t1,i) <= Vm(i)*850
                %״̬2
                [x,y,z]=state2(a(i),b(i),c(i),alpha(t1),v(t1,i),INIT(i,1),INIT(i,2),INIT(i,3));
                Mm(t1,i,:)=[x y z];
            end
        elseif alpha(t1) >= alpha0(i)                 
            VT3(t1,i)=0.5*c(i)^2*b(i)/tand(alpha(t1));
            VT4(t1,i)=Vm(i)-VT3(t1,i);
            if v(t1,i) >= 0 && v(t1,i) <= VT3(t1,i)*850
                %״̬4
                [x,y,z]=state4(a(i),b(i),c(i),alpha(t1),v(t1,i),INIT(i,1),INIT(i,2),INIT(i,3));
                Mm(t1,i,:)=[x y z];
            elseif v(t1,i) > VT3(t1,i)*850 && v(t1,i) <= VT4(t1,i)*850
                %״̬3
                [x,y,z]=state3(a(i),b(i),c(i),alpha(t1),v(t1,i),INIT(i,1),INIT(i,2),INIT(i,3));
                Mm(t1,i,:)=[x y z];
            elseif v(t1,i) > VT4(t1,i)*850 && v(t1,i) <= Vm(i)*850
                %״̬2
                [x,y,z]=state2(a(i),b(i),c(i),alpha(t1),v(t1,i),INIT(i,1),INIT(i,2),INIT(i,3));
                Mm(t1,i,:)=[x y z];  
            end
        end
    end
    Mmm(:,:)=Mm(t1,:,:);
    [Mm_plane]=centroid_plane(Mmm,v(t1,:));
    Mmm_plane(t1,:)=[Mm_plane(1),Mm_plane(2),Mm_plane(3)];
end
