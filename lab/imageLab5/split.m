function img=split(img, k)   
    [m, n]=size(img);
    if m==1 && n==1    %�ֽ⵽ֻʣһ�������򷵻�
       return 
    end   
    flag=0;      %�������Ƿ������غͱ�����ƽ�����ز�����û��Ϊ0����Ϊ1
    me=mean(img(:));
%     me = std2(img);
    for i=1:m
        for j=1:n
            %����׼�򣬰�����Լ����塣
            %����׼��ܼ򵥣�����ǰ���غͱ�����ƽ�����ز��ϴ����������
            if abs(img(i,j)-me)>k
%             if abs(me) > k
                flag=1;
%                 break;
            end
        end
    end
    
    if flag==0       %�������������������ƽ�����ز�಻������������������ƽ��ֵ��Ҳ�ǰ�����Լ����塣
        img(:,:)=me;
        return 
    else           
        if n==1             %���ֻʣһ��
            img(1:m/2,1)=split(img(1:m/2,1),k);       %���ϰ벿�ֵݹ����
            img(m/2+1:m,1)=split(img(m/2+1:m,1),k);     %���°벿�ֵݹ����
        elseif m==1         %���ֻʣһ��
            img(1,1:n/2)=split(img(1,1:n/2),k);       %����벿�ֵݹ����
            img(1,n/2+1:n)=split(img(1,n/2+1:n),k);   %���Ұ벿�ֵݹ����
        else
            img(1:m/2,1:n/2)=split(img(1:m/2,1:n/2),k);           %ͼ�����ϵݹ����
            img(m/2+1:m,1:n/2)=split(img(m/2+1:m,1:n/2),k);       %ͼ�����µݹ����
            img(1:m/2,n/2+1:n)=split(img(1:m/2,n/2+1:n),k);       %ͼ�����ϵݹ����
            img(m/2+1:m,n/2+1:n)=split(img(m/2+1:m,n/2+1:n),k);   %ͼ�����µݹ����           
        end                
    end
end