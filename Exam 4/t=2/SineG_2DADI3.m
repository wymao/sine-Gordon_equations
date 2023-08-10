function u = SineG_2DADI3(xa,xb,ya,yb,ta,tb,m1,m2,n,alpha,beta,theta)
tic
format short e;
%% mesh
h1 = (xb-xa)/m1;
h2 = (yb-ya)/m2;
dt = (tb-ta)/n;
x = xa:h1:xb; x = x';
y = ya:h2:yb; y = y';
t = ta:dt:tb; t = t';
a = 1/12-alpha*theta*dt^2/h1^2; b = 10/12+2*alpha*theta*dt^2/h1^2;
c = alpha/(12*h1^2)+beta/(12*h2^2); d = -2*alpha/(12*h1^2)+10*beta/(12*h2^2);
e = 10*alpha/(12*h1^2)-2*beta/(12*h2^2);
f = 1/12-beta*theta*dt^2/h2^2; g = 10/12+2*beta*theta*dt^2/h2^2;
u = zeros(m1+1,m2+1,n+1);
a1 = 1/12-alpha*dt^2/(2*h1^2); b1 = 10/12+2*alpha*dt^2/(2*h1^2);
f1 = 1/12-beta*dt^2/(2*h2^2); g1 = 10/12+2*beta*dt^2/(2*h2^2);

%%functions
Rfun = @(x,y,t) 0;
xi =  @(x,y) 1;
varphi = @(x,y) 4*(atan(exp((4-sqrt((x+3).^2+(y+7).^2))/0.436)))+...
    +4*(atan(exp((4-sqrt((x+17).^2+(y+7).^2))./0.436)));
psi = @(x,y) 4.13*(sech((4-sqrt((x+3).^2+(y+7).^2))/0.436))+4.13*(sech((4-sqrt((x+17).^2+(y+7).^2))/0.436));
psixx = @(x,y) 4.13/(0.436^2)*(sech((4-sqrt((x+3).^2+(y+7).^2))/0.436).*((x+3).^2./((x+3).^2+(y+7).^2))+...
    sech((4-sqrt((x+3).^2+(y+7).^2))/0.436).*tanh((4-sqrt((x+3).^2+(y+7).^2))/0.436).*((y+7).^2./((x+3).^2+(y+7).^2).^(3/2)))+...
    4.13/(0.436^2)*(sech((4-sqrt((x+17).^2+(y+7).^2))/0.436).*((x+17).^2./((x+17).^2+(y+7).^2))+...
    sech((4-sqrt((x+17).^2+(y+7).^2))/0.436).*tanh((4-sqrt((x+17).^2+(y+7).^2))/0.436).*((y+7).^2./((x+17).^2+(y+7).^2).^(3/2)));
psiyy = @(x,y) 4.13/(0.436^2)*(sech((4-sqrt((x+3).^2+(y+7).^2))/0.436).*((y+7).^2./((x+3).^2+(y+7).^2))+...
    sech((4-sqrt((x+3).^2+(y+7).^2))/0.436).*tanh((4-sqrt((x+3).^2+(y+7).^2))/0.436).*((x+3).^2./((x+3).^2+(y+7).^2).^(3/2)))+...
    4.13/(0.436^2)*(sech((4-sqrt((x+17).^2+(y+7).^2))/0.436).*((y+7).^2./((x+3).^2+(y+7).^2))+...
    sech((4-sqrt((17+3).^2+(y+7).^2))/0.436).*tanh((4-sqrt((x+17).^2+(y+7).^2))/0.436).*((x+17).^2./((x+17).^2+(y+7).^2).^(3/2)));
Rfunt = @(x,y)  0;

%% conditions
u(:,1,:) = 0; u(:,m2+1,:) = 0;
u(1,:,:) = 0; u(m1+1,:,:) = 0;

%% Operator matrix
e1 = ones(m1-1,1);e2 = ones(m2-1,1);
A1 = spdiags(1/12*e1,-1,m1-1,m1-1)+spdiags(5/6*e1,0,m1-1,m1-1)+spdiags(1/12*e1,1,m1-1,m1-1); % mathcal(A)x_{m1*m1}
A2 = spdiags(1/12*e2,-1,m2-1,m2-1)+spdiags(5/6*e2,0,m2-1,m2-1)+spdiags(1/12*e2,1,m2-1,m2-1); % mathcal(A)y_{m2*m2}
B1 = (spdiags(e1,-1,m1-1,m1-1)+spdiags(-2*e1,0,m1-1,m1-1)+spdiags(e1,1,m1-1,m1-1))/h1^2; % delta_x^2_{m1*m1}
B2 = (spdiags(e2,-1,m2-1,m2-1)+spdiags(-2*e2,0,m2-1,m2-1)+spdiags(e2,1,m2-1,m2-1))/h2^2; % delta_y^2_{m2*m2}

%% k=1 _st level
uu = zeros(m1+1,m2+1); 
uuu = zeros(m1+1,m2+1);
pp = zeros(m1+1,m2+1); 

%% matrix
e1 = ones(m1-1,1); e2 = ones(m2-1,1);
C1 = spdiags(a*e1,-1,m1-1,m1-1)+spdiags(b*e1,0,m1-1,m1-1)+spdiags(a*e1,1,m1-1,m1-1); %
C2 = spdiags(c*e1,-1,m1-1,m1-1)+spdiags(d*e1,0,m1-1,m1-1)+spdiags(c*e1,1,m1-1,m1-1); %
C3 = spdiags(e*e1,-1,m1-1,m1-1)+spdiags(-20*c*e1,0,m1-1,m1-1)+spdiags(e*e1,1,m1-1,m1-1); %
C4 = spdiags(f*e2,-1,m2-1,m2-1)+spdiags(g*e2,0,m2-1,m2-1)+spdiags(f*e2,1,m2-1,m2-1); %
C11 = spdiags(a1*e1,-1,m1-1,m1-1)+spdiags(b1*e1,0,m1-1,m1-1)+spdiags(a1*e1,1,m1-1,m1-1); %
C41 = spdiags(f1*e2,-1,m2-1,m2-1)+spdiags(g1*e2,0,m2-1,m2-1)+spdiags(f1*e2,1,m2-1,m2-1); %

for i= 1:m1+1
    for j=1:m2+1
        w(i,j)=xi(x(i),y(j));
        u(i,j,1) = varphi(x(i),y(j));
    end
end

%% 1_st
for i= 1:m1+1
    for j=1:m2+1
        ww(i,j)=varphi(x(i),y(j))+dt*psi(x(i),y(j))-(dt^3/3)*(alpha*psixx(x(i),y(j))+beta*psiyy(x(i),y(j))-...
            xi(x(i),y(j))*cos(varphi(x(i),y(j)))*psi(x(i),y(j))+Rfunt(x(i),y(j)))-...
            (dt^2/2)*xi(x(i),y(j))*sin(varphi(x(i),y(j))+dt*psi(x(i),y(j)))+(dt^2/2)*Rfun(x(i),y(j),t(1));
    end
end
pp(1,2:m2) = f1*u(1,3:m2+1,2)+g1*u(1,2:m2,2)+f1*u(1,1:m2-1,2);
pp(m1+1,2:m2) = f1*u(m1+1,3:m2+1,2)+g1*u(m1+1,2:m2,2)+f1*u(m1+1,1:m2-1,2);

for j = 2:m2
    HH = zeros(m1-1,1);
    HH(1) = -a1*pp(1,j)+(ww(1,j+1)+10*ww(1,j)+ww(1,j-1))/144;
    
    HH(m1-1) = -a1*pp(m1+1,j)+(ww(m1+1,j+1)+10*ww(m1+1,j)+ww(m1+1,j-1))/144;
    
    pp(2:m1,j) = C11\(1/12*A1*ww(2:m1,j+1)+10/12*A1*ww(2:m1,j)+...
        1/12*A1*ww(2:m1,j-1)+HH); 
end

for i = 2:m1
    GG = zeros(1,m2-1);
    GG(1) = -f1*u(i,1,2);
    GG(m2-1) =  -f1*u(i,m2+1,2);
    
    u(i,2:m2,2) =  (pp(i,2:m2)+GG)/C41';
end

%% k>1
for k = 2:n
    uu(1,2:m2) = (f*(u(1,3:m2+1,k+1)-2*u(1,3:m2+1,k)+u(1,3:m2+1,k-1))+...
        g*(u(1,2:m2,k+1)-2*u(1,2:m2,k)+u(1,2:m2,k-1))+f*(u(1,1:m2-1,k+1)-2*u(1,1:m2-1,k)+u(1,1:m2-1,k-1)))/(dt^2);
    uu(m1+1,2:m2) = (f*(u(m1+1,3:m2+1,k+1)-2*u(m1+1,3:m2+1,k)+u(m1+1,3:m2+1,k-1))+...
        g*(u(m1+1,2:m2,k+1)-2*u(m1+1,2:m2,k)+u(m1+1,2:m2,k-1))+f*(u(m1+1,1:m2-1,k+1)-2*u(m1+1,1:m2-1,k)+u(m1+1,1:m2-1,k-1)))/(dt^2);
    
    for j = 2:m2
        H = zeros(m1-1,1);
        H(1) = -a*uu(1,j)+c*u(1,j+1,k)+e*u(1,j,k)+c*u(1,j-1,k)-(xi(x(1),y(j+1))*sin(u(1,j+1,k))+10*...
            xi(x(1),y(j))*sin(u(1,j,k))+xi(x(1),y(j-1))*sin(u(1,j-1,k)))/144 +(Rfun(x(1),y(j+1),t(k))+10*...
            Rfun(x(1),y(j),t(k))+Rfun(x(1),y(j-1),t(k)))/144;
        
        H(m1-1) = -a*uu(m1+1,j)+c*u(m1+1,j+1,k)+e*u(m1+1,j,k)+c*u(m1+1,j-1,k)-(xi(x(m1+1),y(j+1))*sin(u(m1+1,j+1,k))+10*...
            xi(x(m1+1),y(j))*sin(u(m1+1,j,k))+xi(x(m1+1),y(j-1))*sin(u(m1+1,j-1,k)))/144 +(Rfun(x(m1+1),y(j+1),t(k))+10*...
            Rfun(x(m1+1),y(j),t(k))+Rfun(x(m1+1),y(j-1),t(k)))/144;
        
                uu(2:m1,j) = C1\(C2*u(2:m1,j+1,k)+C3*u(2:m1,j,k)+C2*u(2:m1,j-1,k)-1/12*A1*(w(2:m1,j+1).*sin(u(2:m1,j+1,k)))-...
            10/12*A1*(w(2:m1,j).*sin(u(2:m1,j,k)))-1/12*A1*(w(2:m1,j-1).*sin(u(2:m1,j-1,k)))+H);
    end
    
    for i = 2:m1
        G = zeros(1,m2-1);
        G(1) = -f*(u(i,1,k+1)-2*u(i,1,k)+u(i,1,k-1))/(dt^2);
        G(m2-1) =  -f*(u(i,m2+1,k+1)-2*u(i,m2+1,k)+u(i,m2+1,k-1))/(dt^2);
        
        uuu(i,2:m2) =  (uu(i,2:m2)+G)/C4';
        u(i,2:m2,k+1) = dt^2*uuu(i,2:m2)+2*u(i,2:m2,k)-u(i,2:m2,k-1);
    end
end
u = u(1:m1+1,1:m2+1,n+1);