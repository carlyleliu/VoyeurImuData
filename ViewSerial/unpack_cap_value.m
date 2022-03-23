function [cap] = unpack_cap_value(data)
    global user_id;
    index = 1;
    while index < length(data)
        switch data(index)
            case 0x90
                index = index + 1;
                user_id = data(index);
                index = index + 1;
            case 0xcc % accel
                index = index + 1;
                cap_tmp = data(index:index+4-1);
                cap = typecast(uint8([cap_tmp(1) cap_tmp(2) cap_tmp(3) cap_tmp(4)]),"int32");
                index = index + 4 - 1;
        end
    end  
end