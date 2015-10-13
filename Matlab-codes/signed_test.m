file1 = '10-1.txt';
file2 = '10-2.txt';
A = importdata(file1)
B = importdata(file2)
[p,h,stats] = signtest(A,B,'method','approximate')
exit;

