function feature = feature_cal(bin)
% This function will return feature vector for a given binary image

% Intialize variables
feature = zeros(1, 40);
projections = zeros(1, 24);
centroids = zeros(1, 16);

% Image dimensions
row = 32;
column = 32;

% Octant 1
count = 0;
centroid = [0, 0];
projection = [0, 0, 0];
min = [row/2, column/2];
max = [1, 1];

for i = 1:row/2
   for j = 1:i
      if bin(i,j) == 0
          centroid = centroid + [i, j];
          count = count + 1;
          if sum(min > [i, j]) > 1
              min = [i, j];
          end
          if sum(max < [i, j]) > 1
              max = [i, j];
          end
      end
   end
end

if count > 0
    centroid = centroid./count;
    projection(1) = (max(1) - min(1));
    projection(2) = (max(2) - min(2));
    projection(3) = (projection(1) - projection(2))/sqrt(2);
end
projections(1:3) = abs(projection);
centroids(1:2) = centroid;


% Octant 2
count = 0;
centroid = [0, 0];
projection = [0, 0, 0];
min = [row/2, column/2];
max = [1, 1];

for i = 1:row/2
   for j = i:column/2
      if bin(i,j) == 0
          centroid = centroid + [i, j];
          count = count + 1;
          if sum(min > [i, j]) > 1
              min = [i, j];
          end
          if sum(max < [i, j]) > 1
              max = [i, j];
          end
      end
   end
end

if count > 0
    centroid = centroid./count;
    projection(1) = max(1) - min(1);
    projection(2) = max(2) - min(2);
    projection(3) = (projection(1) - projection(2))/sqrt(2);
end
projections(4:6) = abs(projection);
centroids(3:4) = centroid;

% Octant 3
count = 0;
centroid = [0, 0];
projection = [0, 0, 0];
Min = [1, column/2];
Max = [row/2, 1];

for i = 1:row/2
   for j = column/2:column/2 + i
      if bin(i,j) == 0
          centroid = centroid + [i, j];
          count = count + 1;
          if (Min(1) < i) || (Min(2) > j)
              Min = [i, j];
          end
          
          if (Max(1) > i) || (Max(2) < j)
              Max = [i, j];
          end
      end
   end
end

if count > 0
    centroid = centroid./count;
    projection(1) = (Max(1) - Min(1));
    projection(2) = (Max(2) - Min(2));
    projection(3) = ((projection(1) + projection(2))/sqrt(2));
end
projections(7:9) = abs(projection);
centroids(5:6) = centroid;

% Octant 4
count = 0;
centroid = [0, 0];
projection = [0, 0, 0];
Min = [1, column/2];
Max = [row/2, 1];

for i = 1:row/2
   for j = column - i:column
      if bin(i,j) == 0
          centroid = centroid + [i, j];
          count = count + 1;
          if (Min(1) < i) || (Min(2) > j)
              Min = [i, j];
          end
          
          if (Max(1) > i) || (Max(2) < j)
              Max = [i, j];
          end
      end
   end
end

if count > 0
    centroid = centroid./count;
    projection(1) = (Max(1) - Min(1));
    projection(2) = (Max(2) - Min(2));
    projection(3) = ((projection(1) + projection(2))/sqrt(2));
end
projections(10:12) = abs(projection);
centroids(7:8) = centroid;

% Octant 5
count = 0;
centroid = [0, 0];
projection = [0, 0, 0];
min = [row, column];
max = [row/2, column/2];

for i = row/2:row
   for j = column/2:column/2 + (i - row/2)
      if bin(i,j) == 0
          centroid = centroid + [i, j];
          count = count + 1;
          if sum(min > [i, j]) > 1
              min = [i, j];
          end
          if sum(max < [i, j]) > 1
              max = [i, j];
          end
      end
   end
end

if count > 0
    centroid = centroid./count;
    projection(1) = (max(1) - min(1));
    projection(2) = (max(2) - min(2));
    projection(3) = ((projection(1) - projection(2))/sqrt(2));
end
projections(13:15) = abs(projection);
centroids(9:10) = centroid;


% Octant 6
count = 0;
centroid = [0, 0];
projection = [0, 0, 0];
min = [row, column];
max = [row/2, column/2];

for i = row/2:row
   for j = column/2:column/2 + (i - row/2)
      if bin(i,j) == 0
          centroid = centroid + [i, j];
          count = count + 1;
          if sum(min > [i, j]) > 1
              min = [i, j];
          end
          if sum(max < [i, j]) > 1
              max = [i, j];
          end
      end
   end
end

if count > 0
    centroid = centroid./count;
    projection(1) = (max(1) - min(1));
    projection(2) = (max(2) - min(2));
    projection(3) = ((projection(1) - projection(2))/sqrt(2));
end
projections(16:18) = abs(projection);
centroids(11:12) = centroid;


% Octant 7
count = 0;
centroid = [0, 0];
projection = [0, 0, 0];
Min = [row, column/2];
Max = [row/2, 1];

for i = row/2:row
   for j = column/2 - (i - row/2)  +1:column/2
      if bin(i,j) == 0
          centroid = centroid + [i, j];
          count = count + 1;
          if (Min(1) > i) || (Min(2) < j)
              Min = [i, j];
          end
          
          if (Max(1) < i) || (Max(2) > j)
              Max = [i, j];
          end
      end
   end
end

if count > 0
    centroid = centroid./count;
    projection(1) = (Max(1) - Min(1));
    projection(2) = (Max(2) - Min(2));
    projection(3) = ((projection(1) + projection(2))/sqrt(2));
end
projections(19:21) = abs(projection);
centroids(13:14) = centroid;


% Octant 8
count = 0;
centroid = [0, 0];
projection = [0, 0, 0];
Min = [row, column/2];
Max = [row/2, 1];

for i = row/2:row
   for j = 1:column/2 - (i - row/2)
      if bin(i,j) == 0
          centroid = centroid + [i, j];
          count = count + 1;
          if (Min(1) > i) || (Min(2) < j)
              Min = [i, j];
          end
          
          if (Max(1) < i) || (Max(2) > j)
              Max = [i, j];
          end
      end
   end
end

if count > 0
    centroid = centroid./count;
    projection(1) = (Max(1) - Min(1));
    projection(2) = (Max(2) - Min(2));
    projection(3) = ((projection(1) + projection(2))/sqrt(2));
end
projections(22:24) = abs(projection);
centroids(15:16) = centroid;

% Update all features
feature = [projections, centroids];


end

