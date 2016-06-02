function [ idx,Mid,index ] = myKmeans( data,K )
%   idx为每个样本所标签的簇号，Mid为各簇中心，index为迭代轮数
[N, d] = size(data);
index=0;
sampleIds = randsample(1:N, K, false);
Mid = data(sampleIds, :);
labelsMid = zeros(N, 1);
while true
    index=index+1;
    for i = 1:N
        x = data(i, :);
        % check label
        label = 0;
        dist = 0;
        for j = 1:K
            temp = sum((x-Mid(j, :)).^2);
            if label == 0 || temp < dist
                dist = temp;
                label = j;
            end
        end
        labelsMid(i) = label;
    end
    %update Mid
    newMid = zeros(K, d);
    labelsCount = zeros(K, 1);
    for i = 1:N
        label = labelsMid(i);
        newMid(label, :) = newMid(label, :) + data(i, :);
        labelsCount(label) = labelsCount(label) + 1;
    end
    for i = 1:K
        newMid(i, :) = newMid(i, :)/labelsCount(i);
    end
    if Mid==newMid
        break;
    end
    Mid = newMid;
end
idx=labelsMid;
end
