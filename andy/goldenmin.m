function min = goldenmin(fx,a,b,epsilon)                           
tau=double((sqrt(5)-1)/2);      % коефіцієнт золотого перетину, приблизно 0.618
k=0;                            % кількість ітерацій
x=a:0.1:b;                      %обчислюємо значення x для побудови графіка
markers = {'+','*','x','d','p','h'}%список маркерів для побудови точок графіка
x1=a+(1-tau)*(b-a);              % обчислюємо значення x1 та x2
x2=a+tau*(b-a);
L1=b-a;                         %довжина відрізка ab
f_x1=fx(x1);                    % значення f(x1) та f(x2)
f_x2=fx(x2);
hold on
plot(x1,f_x1,markers{mod(k,numel(markers))+1});
plot(x2,f_x2,markers{mod(k,numel(markers))+1});

while ((abs(b-a)/2>=epsilon))
    if(f_x1<f_x2)
        
        b=x2;
        x2=x1;
        x1=a+(1-tau)*(b-a);
        
        f_x1=fx(x1);
        f_x2=fx(x2);
        
        plot(x1,f_x1,markers{mod(k,numel(markers))+1});
        plot(x2,f_x2,markers{mod(k,numel(markers))+1});
        
    else
        a=x1;
        x1=x2;
        x2=a+tau*(b-a);
        
        f_x1=fx(x1);
        f_x2=fx(x2);
        
        plot(x1,f_x1,markers{mod(k,numel(markers))+1});
        plot(x2,f_x2,markers{mod(k,numel(markers))+1});
    end
    L=(b-a);
    sprintf('L(%d)=%f ', k,L/L1)
    k=k+1;
end

% Обчислюємо точку мінімуму
if(f_x1<f_x2)
    min=x1;
else
    min=x2;
end
    sprintf('x_min=%f', min)
    sprintf('f(x_min)=%f ', fx(min))
    sprintf('K=%d', k)
    y=fx(x); 
    hold on
    plot(x1,f_x1,'ro')%ставимо на графіку точку мінімуму червоним кольором
    plot(x,y) %малюємо графік функції
end

