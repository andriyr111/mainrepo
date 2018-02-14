function min = bisectionmin2(fx,a,b,epsilon)                                        
k=0;                            % ������� ��������
L=(b-a);
xm=(L/2)+a;

x=a:0.1:b; %���������� �������� x ��� �������� �������

markers = {'+','*','x','d','p','h'} %������ ������� ��� �������� ����� �������
hold on

while (abs(L)>=epsilon)
   
    x1=a+L/4;            % ���������� �������� x1 �� x2
    x2=b-L/4;
    f_x1=fx(x1);
    f_x2=fx(x2);
    f_xm=fx(xm);
    plot(x1,f_x1,markers{mod(k,numel(markers))+1}); %��������� �� ������� ����� ���������
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
    L=(b-a); %���������� ���� ������� ���������
end

% ���������� ����� ������

    min=(a+b)/2;
    sprintf('x_min=%f', min)
    sprintf('f(x_min)=%f ', f_x1)
    sprintf('K=%d', k)
    

    y=fx(x);   %���������� f(x)
    plot(x,y) %������ f(x)
    f_min=fx(min) %������� �� ������� ����� ������ �������� ��������
    plot(min,f_min,'ro')
    
end

