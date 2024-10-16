filename ='tensaoplotvalues2.txt';
fileID = fopen(filename, 'w');
if fileID ==-1
    error('failed');
end

timedata=Input1.time;
valuedata = potinput.signals.values;

for i = 1:length(timedata)
    fprintf(fileID, '%f %f \n\r', timedata(i), valuedata(i));
end

fclose(fileID);