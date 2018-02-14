function min = goldenmin2(fx,a,b,epsilon)                           % end of interval
tau=1+double((sqrt(5)-1)/2);      % golden proportion coefficient, around 0.618
k=0;                            % number of iterations
x=a:0.1:b;
markers = {'+','*','x','d','p','h'}
x1=b-(b-a)/tau;             % computing x values
x2=a+(b-a)/tau;

f_x1=fx(x1);                     % computing values in x points
f_x2=fx(x2);
hold on
plot(x1,f_x1,markers{mod(k,numel(markers))+1});
plot(x2,f_x2,markers{mod(k,numel(markers))+1});

while ((abs(b-a)/2>=epsilon))
    k=k+1;
    if(f_x1<f_x2)
        b=x2;
        x2=x1;
        x1=a+(b-x2);
        
        f_x1=fx(x1);
        f_x2=fx(x2);
        
        plot(x1,f_x1,markers{mod(k,numel(markers))+1});
        plot(x2,f_x2,markers{mod(k,numel(markers))+1});
        
    else
        a=x1;
        x1=x2;
        x2=b-(x1-a);
        
        f_x1=fx(x1);
        f_x2=fx(x2);
        
        plot(x1,f_x1,markers{mod(k,numel(markers))+1});
        plot(x2,f_x2,markers{mod(k,numel(markers))+1});
    end
    
end

max=1000000;
% chooses minimum point
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
    plot(x1,f_x1,'ro')
    plot(x,y)
end

