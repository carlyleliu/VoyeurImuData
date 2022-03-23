function save_imu_raw_data(time_stamp,accel,gyro)
    file_name = "imu_raw_data.mat";
    %windows_size = 1000;
    %raw_data = zeros(windows_size,7);
    raw_data(:,1) = time_stamp(:,1);
    raw_data(:,2:4) = accel(:,1:3);
    raw_data(:,5:7) = gyro(:,1:3);
    save(file_name,'raw_data','-mat');
end