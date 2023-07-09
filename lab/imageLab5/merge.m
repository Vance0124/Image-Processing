function img=merge(img, k)   
    [m, n]=size(img);
    if m==1 && n==1    %分解到只剩一个像素则返回
       return 
    end 
    if n==1             %如果只剩一列
        img(1:m/2,1)=merge(img(1:m/2,1),k);       %列上半部分递归分裂
        img(m/2+1:m,1)=merge(img(m/2+1:m,1),k);     %列下半部分递归分裂
    elseif m==1         %如果只剩一行
        img(1,1:n/2)=merge(img(1,1:n/2),k);       %行左半部分递归分裂
        img(1,n/2+1:n)=merge(img(1,n/2+1:n),k);   %行右半部分递归分裂
    else
        img(1:m/2,1:n/2)=merge(img(1:m/2,1:n/2),k);           %图像左上递归分裂
        img(m/2+1:m,1:n/2)=merge(img(m/2+1:m,1:n/2),k);       %图像左下递归分裂
        img(1:m/2,n/2+1:n)=merge(img(1:m/2,n/2+1:n),k);       %图像右上递归分裂
        img(m/2+1:m,n/2+1:n)=merge(img(m/2+1:m,n/2+1:n),k);   %图像右下递归分裂           
    end                
    flag=0;      %本区域是否有像素和本区域平均像素差距过大，没有为0，有为1
%     me=mean(img(:));
    me = std2(img);
    if abs(me) > k
        flag=1;
    end
    
    if flag==0       %如果本区域所有像素与平均像素差距不大，则本区域所有像素置平均值。也是按情况自己定义。
        img(:,:)=abs(me);
        return 
    end
end