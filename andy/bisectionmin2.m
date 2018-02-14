function min = bisectionmin2(fx,a,b,epsilon)                                        
k=0;                            % кількість ітерацій
L=(b-a);
xm=(L/2)+a;

x=a:0.1:b; %обчислюємо значення x для побудови графіка

markers = {'+','*','x','d','p','h'} %список маркерів для побудови точок графіка
hold on

while (abs(L)>=epsilon)
   
    x1=a+L/4;            % обчислюємо значення x1 та x2
    x2=b-L/4;
    f_x1=fx(x1);
    f_x2=fx(x2);
    f_xm=fx(xm);
    plot(x1,f_x1,markers{mod(k,numel(markers))+1}); %позначаєио на графіку центр інтервалу
    plot(x2,f_x2,markers{mod(k,numel(markers))+1});
    plot(xm,f_xm,markers{mod(k,numel(markers))+1});
    if(f_x1<f_xm)
        b=xm;
        xm=x1;
        
    else
        if(f_x1<f_xm)
            a=xm;
            xm=x2;
            %plot(x1,f_x1,markers{mod(k,numel(markers))+1});
        else
            a=x1;
            b=x2;
            %plot(x2,f_x2,markers{mod(k,numel(markers))+1});
        end
    end
    
    k=k+1;
    L=(b-a); %обчислюємо нову довжину інтервалу
end

% Обчислюємо точку мінімуму

    min=(a+b)/2;
    sprintf('x_min=%f', min)
    sprintf('f(x_min)=%f ', f_x1)
    sprintf('K=%d', k)
    

    y=fx(x);   %обчислюємо f(x)
    plot(x,y) %графік f(x)
    f_min=fx(min) %ставимо на графіку точку мінімуму червоним кольором
    plot(min,f_min,'ro')
    
end

