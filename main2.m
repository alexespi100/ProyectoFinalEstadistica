a=10000; %Dinero manejado en el sistema
b=[500 600 700 1000 1200 2000]; %Número de agentes a interactuar
c=[2 3 4 5]; %Tamaño de la transacción
d=3500; %Número de transacciones

%%Distribución Delta
%N=(a/b(h))*ones(b, 1); %Vector de agentes interactuantes
f=15; %Clases de dinero
S=1:100; %Vector S inicial

%%Distribución Uniforme
C=10; %Número de clases
%H=1:b(h);%Vector de agentes interactuantes 2
g=1;%Variable de prueba
Z=1:100;%Vactor S inicial 2



%%Ejercicio de transacciones
for m=1:length(c)
    for h=1:length(b)

        N=(a/b(h))*ones(b(h), 1); %Vector de agentes interactuantes
        H=1:b(h);%Vector de agentes interactuantes 2

        for i=1:1:C;
            for j=1:b(h)/C;
                H((i-1)*(b(h)/C)+g)=(a*i)/(b(h)*C);
                g=g+1;
            end
            g=1;
        end

        for i=1:1:d;
            x=randi([1 b(h)],1,1);
            y=randi([1 b(h)],1,1);
            z=rand;
            if z<0.5;
                s=1;
            else
                s=-1;
            end
            if s==1 && N(y)>0;
                N(y)=N(y)-(c(m)*s);
                N(x)=N(x)+(c(m)*s);
            elseif s==-1 && N(x)>0;
                N(y)=N(y)-(c(m)*s);
                N(x)=N(x)+(c(m)*s);
            end

            if s==1 && H(y)>c(m);
                H(y)=H(y)-(c(m)*s);
                H(x)=H(x)+(c(m)*s);
            elseif s==-1 && H(x)>5;
                H(y)=H(y)-(c(m)*s);
                H(x)=H(x)+(c(m)*s);
            end

            figure(1)
            histogram(N,f)
            figure(2)
            histogram(H,f)
            pause(0.0001)

            e=0;
            n=0;
            e=histcounts(N);
            n=histcounts(H);
            e(e==0)=[];
            n(n==0)=[];
            S(i)=b(h).*log(b(h))-sum(e.*log(e));
            Z(i)=b(h).*log(b(h))-sum(n.*log(n));

        end
        figure(3)
        plot(S)
        figure(4)
        plot(Z)
        hold on
    end
end