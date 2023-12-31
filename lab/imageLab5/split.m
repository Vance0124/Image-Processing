function img=split(img, k)   
    [m, n]=size(img);
    if m==1 && n==1    %分解到只剩一个像素则返回
       return 
    end   
    flag=0;      %本区域是否有像素和本区域平均像素差距过大，没有为0，有为1
    me=mean(img(:));
%     me = std2(img);
    for i=1:m
        for j=1:n
            %分裂准则，按情况自己定义。
            %这里准则很简单，若当前像素和本区域平均像素差距较大，则继续分裂
            if abs(img(i,j)-me)>k
%             if abs(me) > k
                flag=1;
%                 break;
            end
        end
    end
    
    if flag==0       %如果本区域所有像素与平均像素差距不大，则本区域所有像素置平均值。也是按情况自己定义。
        img(:,:)=me;
        return 
    else           
        if n==1             %如果只剩一列
            img(1:m/2,1)=split(img(1:m/2,1),k);       %列上半部分递归分裂
            img(m/2+1:m,1)=split(img(m/2+1:m,1),k);     %列下半部分递归分裂
        elseif m==1         %如果只剩一行
            img(1,1:n/2)=split(img(1,1:n/2),k);       %行左半部分递归分裂
            img(1,n/2+1:n)=split(img(1,n/2+1:n),k);   %行右半部分递归分裂
        else
            img(1:m/2,1:n/2)=split(img(1:m/2,1:n/2),k);           %图像左上递归分裂
            img(m/2+1:m,1:n/2)=split(img(m/2+1:m,1:n/2),k);       %图像左下递归分裂
            img(1:m/2,n/2+1:n)=split(img(1:m/2,n/2+1:n),k);       %图像右上递归分裂
            img(m/2+1:m,n/2+1:n)=split(img(m/2+1:m,n/2+1:n),k);   %图像右下递归分裂           
        end                
    end
end