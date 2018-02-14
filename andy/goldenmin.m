function min = goldenmin(fx,a,b,epsilon)                           
tau=double((sqrt(5)-1)/2);      % ���������� �������� ��������, ��������� 0.618
k=0;                            % ������� ��������
x=a:0.1:b;                      %���������� �������� x ��� �������� �������
markers = {'+','*','x','d','p','h'}%������ ������� ��� �������� ����� �������
x1=a+(1-tau)*(b-a);              % ���������� �������� x1 �� x2
x2=a+tau*(b-a);
L1=b-a;                         %������� ������ ab
f_x1=fx(x1);                    % �������� f(x1) �� f(x2)
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

% ���������� ����� ������
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
    plot(x1,f_x1,'ro')%������� �� ������� ����� ������ �������� ��������
    plot(x,y) %������� ������ �������
end

