function img=merge(img, k)   
    [m, n]=size(img);
    if m==1 && n==1    %�ֽ⵽ֻʣһ�������򷵻�
       return 
    end 
    if n==1             %���ֻʣһ��
        img(1:m/2,1)=merge(img(1:m/2,1),k);       %���ϰ벿�ֵݹ����
        img(m/2+1:m,1)=merge(img(m/2+1:m,1),k);     %���°벿�ֵݹ����
    elseif m==1         %���ֻʣһ��
        img(1,1:n/2)=merge(img(1,1:n/2),k);       %����벿�ֵݹ����
        img(1,n/2+1:n)=merge(img(1,n/2+1:n),k);   %���Ұ벿�ֵݹ����
    else
        img(1:m/2,1:n/2)=merge(img(1:m/2,1:n/2),k);           %ͼ�����ϵݹ����
        img(m/2+1:m,1:n/2)=merge(img(m/2+1:m,1:n/2),k);       %ͼ�����µݹ����
        img(1:m/2,n/2+1:n)=merge(img(1:m/2,n/2+1:n),k);       %ͼ�����ϵݹ����
        img(m/2+1:m,n/2+1:n)=merge(img(m/2+1:m,n/2+1:n),k);   %ͼ�����µݹ����           
    end                
    flag=0;      %�������Ƿ������غͱ�����ƽ�����ز�����û��Ϊ0����Ϊ1
%     me=mean(img(:));
    me = std2(img);
    if abs(me) > k
        flag=1;
    end
    
    if flag==0       %�������������������ƽ�����ز�಻������������������ƽ��ֵ��Ҳ�ǰ�����Լ����塣
        img(:,:)=abs(me);
        return 
    end
end