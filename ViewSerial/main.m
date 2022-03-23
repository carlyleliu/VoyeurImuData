clear all;
close all;
instrreset

global x;

serial_buff_size = 512;
windows_size = 128;
save_data_size = 100000;
cap = [];
time_stamp = [];
data = zeros(1, serial_buff_size);
idx = 1;
x = 1;

com = serialport("/dev/tty.usbserial-14310", 115200);

grid on;

while true
    data = serial_receive_frame(com);
    cap_tmp = unpack_cap_value(data);
    cap = [cap cap_tmp];
    time_stamp = [time_stamp idx];
    plot(time_stamp,cap);
    pause(0.0001);
    idx = idx + 1;
    if idx >= 500
       cap(1:1) = [];
       time_stamp(1:1) = [];
    end
    %run_time_plot(p, time_stamp, cap);
end
