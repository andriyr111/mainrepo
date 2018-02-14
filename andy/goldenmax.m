function [min,max] = goldenmax(fx,a,b)                           % end of interval
epsilon=0.0001;               % accuracy value
iter= 50;                       % maximum number of iterations
tau=double((sqrt(5)-1)/2);      % golden proportion coefficient, around 0.618
k=0;                            % number of iterations
x=a:0.1:b;

x1=a+(1-tau)*(b-a);             % computing x values
x2=a+tau*(b-a);

f_x1=fx(x1);                     % computing values in x points
f_x2=fx(x2);

plot(x1,f_x1,'rx')              % plotting x
plot(x2,f_x2,'rx')

while ((abs(b-a)>epsilon))
    k=k+1;
    if(f_x1>f_x2)
        b=x2;
        x2=x1;
        x1=a+(1-tau)*(b-a);
        
        f_x1=fx(x1);
        f_x2=fx(x2);
        
        plot(x1,f_x1,'rx');
    else
        a=x1;
        x1=x2;
        x2=a+tau*(b-a);
        
        f_x1=fx(x1);
        f_x2=fx(x2);
        
        plot(x2,f_x2,'rx')
    end
    
    k=k+1;
end

max=1000000;
% chooses minimum point
if(f_x1<f_x2)
    sprintf('x_min=%f', x1)
    min=x1;
    sprintf('f(x_min)=%f ', f_x1)
    sprintf('K', k)
    y=fx(x)
    hold on
    plot(x1,f_x1,'ro')
    plot(x,y)
else
    sprintf('x_min=%f', x2)
    min=x2;
    sprintf('f(x_min)=%f ', f_x2)
    y=fx(x)
    hold on
    plot(x2,f_x2,'ro')
    plot(x,y)
end
end

