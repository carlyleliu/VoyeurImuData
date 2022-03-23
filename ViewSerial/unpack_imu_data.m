function [accel,gyro,euler_int,q] = unpack_imu_data(data)
    global user_id;
    global line_accel;
    global magnetic;
    global euler_float;
    global air_pressure;
    index = 1;
    while index < length(data)
        switch data(index)
            case 0x90
                index = index + 1;
                user_id = data(index);
                index = index + 1;
            case 0xa0 % accel
                index = index + 1;
                accel_tmp = data(index:index+6-1);
                accel(1) = typecast(uint8([accel_tmp(1) accel_tmp(2)]),"int16");
                accel(2) = typecast(uint8([accel_tmp(3) accel_tmp(4)]),"int16");
                accel(3) = typecast(uint8([accel_tmp(5) accel_tmp(6)]),"int16");
                index = index + 6;
            case 0xa5 % liner accel
                index = index + 1;
                line_accel_tmp = data(index:index+6-1);
                line_accel(1) = typecast(uint8([line_accel_tmp(1) line_accel_tmp(2)]),"int16");
                line_accel(2) = typecast(uint8([line_accel_tmp(3) line_accel_tmp(4)]),"int16");
                line_accel(3) = typecast(uint8([line_accel_tmp(5) line_accel_tmp(6)]),"int16");
                index = index + 6;
            case 0xb0 % angel speed
                index = index + 1;
                gyro_tmp = data(index:index+6-1);
                gyro(1) = typecast(uint8([gyro_tmp(1) gyro_tmp(2)]),"int16");
                gyro(2) = typecast(uint8([gyro_tmp(3) gyro_tmp(4)]),"int16");
                gyro(3) = typecast(uint8([gyro_tmp(5) gyro_tmp(6)]),"int16");
                index = index + 6;
            case 0xc0 % magnetic field strength
                index = index + 1;
                magnetic_tmp = data(index:index+6-1);
                magnetic(1) = typecast(uint8([magnetic_tmp(1) magnetic_tmp(2)]),"int16");
                magnetic(2) = typecast(uint8([magnetic_tmp(3) magnetic_tmp(4)]),"int16");
                magnetic(3) = typecast(uint8([magnetic_tmp(5) magnetic_tmp(6)]),"int16");
                index = index + 6;
            case 0xd0 % euler with int
                index = index + 1;
                euler_int_tmp = data(index:index+6-1);
                euler_int(1) = typecast(uint8([euler_int_tmp(1) euler_int_tmp(2)]),"int16");
                euler_int(2) = typecast(uint8([euler_int_tmp(3) euler_int_tmp(4)]),"int16");
                euler_int(3) = typecast(uint8([euler_int_tmp(5) euler_int_tmp(6)]),"int16");
                index = index + 6;
            case 0xd9 % euler with float
                index = index + 1;
                euler_float_tmp = data(index:index+12-1);
                euler_float(1) = single(typecast(uint8([euler_float_tmp(1) euler_float_tmp(2) euler_float_tmp(3) euler_float_tmp(4)]),"int32"));
                euler_float(2) = single(typecast(uint8([euler_float_tmp(5) euler_float_tmp(6) euler_float_tmp(7) euler_float_tmp(8)]),"int32"));
                euler_float(3) = single(typecast(uint8([euler_float_tmp(9) euler_float_tmp(10) euler_float_tmp(11) euler_float_tmp(12)]),"int32"));
                index = index + 12;
            case 0xd1 % quaternion
                index = index + 1;
                q_tmp = data(index:index+16-1);
                q(1) = single(typecast(uint8([q_tmp(1) q_tmp(2) q_tmp(3) q_tmp(4)]),"int32"));
                q(2) = single(typecast(uint8([q_tmp(5) q_tmp(6) q_tmp(7) q_tmp(8)]),"int32"));
                q(3) = single(typecast(uint8([q_tmp(9) q_tmp(10) q_tmp(11) q_tmp(12)]),"int32"));
                q(4) = single(typecast(uint8([q_tmp(13) q_tmp(14) q_tmp(15) q_tmp(16)]),"int32"));
                index = index + 16;
            case 0xf0 % air pressure data(last one data)
                index = index + 1;
                air_pressure_tmp = data(index:index+4-1);
                air_pressure(1) = single(typecast(uint8([air_pressure_tmp(1) air_pressure_tmp(2) air_pressure_tmp(3) air_pressure_tmp(4)]),"int32"));
                index = index + 4 -1;
        end
    end  
end