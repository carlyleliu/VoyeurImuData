function [imu_data] = serial_receive_frame(com)
    global index;
    global len;
    global crc;
    serial = com;
    data = zeros(1,1024);
    step = 0;
    while step == 0
        index = 1;
        data(index) = read(serial, 1, "uint8");
        if data(index) == 0x5a
            index = index + 1;
            data(index) = read(serial, 1, "uint8");
            if data(index) == 0xa5
                step = 1;
            end
        end
    end
    len = read(serial, 1, "uint16");
    crc = read(serial, 1, "uint16");
    imu_data = read(serial, len, "uint8");
    %disp(imu_data);
end
