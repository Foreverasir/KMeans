function [ jc,fmi,ri ] = evaluate( S,T )
[N, D] = size(S);
[N1, D1] = size(T);
if N1~=N || D1~=1
    disp('The input Matrix size is illegal !');
    return;
end
a=0;b=0;c=0;d=0;
for i=1:N
    for j=i+1:N
       if S(i,D)==S(j,D) && T(i,:)==T(j,:)
           a=a+1;
       end
       if S(i,D)==S(j,D) && T(i,:)~=T(j,:)
           b=b+1;
       end
       if S(i,D)~=S(j,D) && T(i,:)==T(j,:)
           c=c+1;
       end
       if S(i,D)~=S(j,D) && T(i,:)~=T(j,:)
           d=d+1;
       end
    end
end
sum=a+b+c+d;
if sum~=N*(N-1)/2
    disp('sum exception');
end
jc=a/(a+b+c);
fmi=sqrt((a/(a+b))*(a/(a+c)));
ri=2*(a+d)/(N*(N-1));
end

