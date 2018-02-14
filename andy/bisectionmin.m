function min = bisectionmin(fx,a,b,epsilon)                                        
k=0;                            % кількість ітерацій
L1=b-a;
x1=(a+b+epsilon)/2;             % обчислюємо значення x1 та x2
x2=(a+b-epsilon)/2;
x=a:0.1:b; %обчислюємо значення x для побудови графіка

markers = {'+','*','x','d','p','h'}; %список маркерів для побудови точок графіка
hold on
f_x1=fx(x1);
f_x2=fx(x2);

plot(x1,f_x1,markers{mod(k,numel(markers))+1}); %позначаєио на графіку центр інтервалу
plot(x2,f_x2,markers{mod(k,numel(markers))+1});

while ((abs(b-a)/2>=epsilon))
    k=k+1;
    x1=(a+b-epsilon)/2;            
    x2=(a+b+epsilon)/2;
    f_x1=fx(x1);
    f_x2=fx(x2);
    if(f_x1<f_x2)
        b=x2;
        plot(x1,f_x1,markers{mod(k,numel(markers))+1});
    else
        a=x1;
        plot(x2,f_x2,markers{mod(k,numel(markers))+1});
    end
    L=(b-a);
    sprintf('L(%d)=%f ', k,L/L1)
end

% Обчислюємо точку мінімуму

    min=(a+b)/2;
    sprintf('x_min=%f', min)
    sprintf('f(x_min)=%f ', f_x1)
    sprintf('K=%d', k)
    

    y=fx(x);   %обчислюємо f(x)
    plot(x,y)  %графік f(x)
    f_min=fx(min) %ставимо на графіку точку мінімуму червоним кольором
    plot(min,f_min,'ro')
    
end

