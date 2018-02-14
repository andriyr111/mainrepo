function min = bisectionmin(fx,a,b,epsilon)                                        
k=0;                            % ������� ��������
L1=b-a;
x1=(a+b+epsilon)/2;             % ���������� �������� x1 �� x2
x2=(a+b-epsilon)/2;
x=a:0.1:b; %���������� �������� x ��� �������� �������

markers = {'+','*','x','d','p','h'}; %������ ������� ��� �������� ����� �������
hold on
f_x1=fx(x1);
f_x2=fx(x2);

plot(x1,f_x1,markers{mod(k,numel(markers))+1}); %��������� �� ������� ����� ���������
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

% ���������� ����� ������

    min=(a+b)/2;
    sprintf('x_min=%f', min)
    sprintf('f(x_min)=%f ', f_x1)
    sprintf('K=%d', k)
    

    y=fx(x);   %���������� f(x)
    plot(x,y)  %������ f(x)
    f_min=fx(min) %������� �� ������� ����� ������ �������� ��������
    plot(min,f_min,'ro')
    
end

