clear; clc; close all
file_path='homeA-all/homeA-circuit';
files = dir(file_path);
file_name={files.name};
Data_all_1=[];


for n_read=4:4
    n_read
    % n_read=30;  %choose file >3  <end-1=93
    Ta=readtable([files(n_read).folder,'/',files(n_read).name]);
    unique(Ta{:, 2});

    for iT=1
        T_1=Ta(Ta{:, 2} == iT, :);

        figure
        plot(table2array(T_1(:,3)-T_1(1,3))/3600,table2array(T_1(:,4)))
        % xlim([table2array(T_1(1,3)),table2array(T_1(1000,3))])
        xlabel('Time')
        ylabel('Power/W')
        Data_all_1=[Data_all_1,table2array(T_1(:,4))'];

    end

    % plot(table2array(T_1(:,3)-T_1(1,3))/3600)

end

% histogram(Data_all_1)
% % 
% timestampUTC = table2array(T_1(1,3))+3600;  % 例如，表示 2021年1月1日 00:00:00 UTC
% datetimeVal = datetime(timestampUTC, 'ConvertFrom', 'posixtime', 'TimeZone', 'UTC');
% datetimeVal.Format = 'yyyy-MM-dd HH:mm:ss';
% datetimeVal
