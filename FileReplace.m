function FileReplace(filename,oldstr,newstr,headlines)
% Input:eg.
% oldstr={'Float','Fixed','Kinematic','Static','E212!'};
% newstr={'    0','    1','0','1','22122'};
% function:"replace oldstr with newstr in a file"
if (nargin<4)
    headlines=0;
end
fid=fopen(filename,'r+');
count=1;
n=length(oldstr);
str=[];
while ~feof(fid)
    str{count} = fgetl(fid);
    count=count+1;
end
fclose(fid);
copyfile(filename,['backup_' filename]);
%重新以写的形式打开，写入覆盖原来的内容
fid=fopen(filename,'w+');
for i=(headlines+1):(count-1)
    for j=1:n
        str{i}=strrep(str{i},oldstr{j},newstr{j});
    end   
    fprintf(fid,'%s\n',str{i});
end
fclose(fid);
end

