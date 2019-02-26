function boolReturn = isInnerPoint(p)

global V VN

%upper points
minXPoint(1,1) = p(1,1) - 3;
minXPoint(1,2) = p(1,2);

pm = [minXPoint - 0.2; minXPoint + 0.2];

vidx = pm(1,1) <= V(:,1) & V(:,1) <= pm(2,1) & ...
       pm(1,2) <= V(:,2) & V(:,2) <= pm(2,2);
   
if ~max(vidx)
    boolReturn = 0;
    return;
end

%lower points
minXPoint(1,1) = p(1,1) + 3;
minXPoint(1,2) = p(1,2);

pm = [minXPoint - 0.2; minXPoint + 0.2];

vidx = pm(1,1) <= V(:,1) & V(:,1) <= pm(2,1) & ...
       pm(1,2) <= V(:,2) & V(:,2) <= pm(2,2);
   
if ~max(vidx)
    boolReturn = 0;
    return;
end

%right points
minXPoint(1,1) = p(1,1);
minXPoint(1,2) = p(1,2) + 3;

pm = [minXPoint - 0.2; minXPoint + 0.2];

vidx = pm(1,1) <= V(:,1) & V(:,1) <= pm(2,1) & ...
       pm(1,2) <= V(:,2) & V(:,2) <= pm(2,2);
   
if ~max(vidx)
    boolReturn = 0;
    return;
end

%right points
minXPoint(1,1) = p(1,1);
minXPoint(1,2) = p(1,2) - 3;

pm = [minXPoint - 0.2; minXPoint + 0.2];

vidx = pm(1,1) <= V(:,1) & V(:,1) <= pm(2,1) & ...
       pm(1,2) <= V(:,2) & V(:,2) <= pm(2,2);
   
if ~max(vidx)
    boolReturn = 0;
    return;
end

boolReturn = 1;