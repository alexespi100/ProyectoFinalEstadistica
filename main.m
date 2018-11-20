a=10000; %Dinero manejado en el sistema
b=1000; %Número de agentes a interactuar
c=5; %Tamaño de la transacción
d=3500; %Número de transacciones

%%Distribución Delta
N=(a/b)*ones(b, 1); %Vector de agentes interactuantes
f=15; %Clases de dinero
S=1:100; %Vector S inicial

%%Distribución Uniforme
C=10; %Número de clases
H=1:b;%Vector de agentes interactuantes 2
g=1;%Variable de prueba
Z=1:100;%Vactor S inicial 2



%%Ejercicio de transacciones
    
    for i=1:1:C;
        for j=1:b/C;
            H((i-1)*(b/C)+g)=(a*i)/(b*C);
            g=g+1;
        end
        g=1;
    end
    
    for i=1:1:d;
        x=randi([1 b],1,1);
        y=randi([1 b],1,1);
        z=rand;
        if z<0.5;
            s=1;
        else
            s=-1;
        end
        if s==1 && N(y)>0;
            N(y)=N(y)-(c*s);
            N(x)=N(x)+(c*s);
        elseif s==-1 && N(x)>0;
            N(y)=N(y)-(c*s);
            N(x)=N(x)+(c*s);
        end

        if s==1 && H(y)>5;
            H(y)=H(y)-(c*s);
            H(x)=H(x)+(c*s);
        elseif s==-1 && H(x)>5;
            H(y)=H(y)-(c*s);
            H(x)=H(x)+(c*s);
        end

        figure(1)
        histogram(N,f)
        figure(2)
        histogram(H,f)
        pause(0.0001)

        e=0;
        m=0;
        e=histcounts(N);
        m=histcounts(H);
        e(e==0)=[];
        m(m==0)=[];
        S(i)=b(h).*log(b(h))-sum(e.*log(e));
        Z(i)=b(h).*log(b(h))-sum(m.*log(m));

    end
    figure(3)
    plot(S)
    figure(4)
    plot(Z)
    hold on