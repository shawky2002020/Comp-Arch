`ifndef COMMON_PACKAGE_V
`define COMMON_PACKAGE_V

module Common_Package;
    function [7:0] rotate_right(input [7:0] source, input [2:0] rotate);
        case (rotate)
            3'b000:  rotate_right = {source[0], source[7:1]};
            3'b001:  rotate_right = {source[1:0], source[7:2]};
            3'b010:  rotate_right = {source[2:0], source[7:3]};
            3'b011:  rotate_right = {source[3:0], source[7:4]};
            3'b100:  rotate_right = {source[4:0], source[7:5]};
            3'b101:  rotate_right = {source[5:0], source[7:6]};
            3'b110:  rotate_right = {source[6:0], source[7]};
            3'b111:  rotate_right = source;
            default: rotate_right = source;
        endcase
    endfunction

    function [7:0] rotate_left(input [7:0] source, input [2:0] rotate);
        case (rotate)
            3'b000:  rotate_left = {source[6:0], source[7]};
            3'b001:  rotate_left = {source[5:0], source[7:6]};
            3'b010:  rotate_left = {source[4:0], source[7:5]};
            3'b011:  rotate_left = {source[3:0], source[7:4]};
            3'b100:  rotate_left = {source[2:0], source[7:3]};
            3'b101:  rotate_left = {source[1:0], source[7:2]};
            3'b110:  rotate_left = {source[0], source[7:1]};
            3'b111:  rotate_left = source;
            default: rotate_left = source;
        endcase
    endfunction

    function [7:0] resolv_priority(input [7:0] request);
        if (request[0]) resolv_priority = 8'b00000001;
        else if (request[1]) resolv_priority = 8'b00000010;
        else if (request[2]) resolv_priority = 8'b00000100;
        else if (request[3]) resolv_priority = 8'b00001000;
        else if (request[4]) resolv_priority = 8'b00010000;
        else if (request[5]) resolv_priority = 8'b00100000;
        else if (request[6]) resolv_priority = 8'b01000000;
        else if (request[7]) resolv_priority = 8'b10000000;
        else resolv_priority = 8'b00000000;
    endfunction

    function [7:0] num2bit(input [2:0] source);
        case (source)
            3'b000: num2bit = 8'b00000001;
            3'b001: num2bit = 8'b00000010;
            3'b010: num2bit = 8'b00000100;
            3'b011: num2bit = 8'b00001000;
            3'b100: num2bit = 8'b00010000;
            3'b101: num2bit = 8'b00100000;
            3'b110: num2bit = 8'b01000000;
            3'b111: num2bit = 8'b10000000;
            default: num2bit = 8'b00000000;
        endcase
    endfunction

    function [2:0] bit2num(input [7:0] source);
        if (source[0]) bit2num = 3'b000;
        else if (source[1]) bit2num = 3'b001;
        else if (source[2]) bit2num = 3'b010;
        else if (source[3]) bit2num = 3'b011;
        else if (source[4]) bit2num = 3'b100;
        else if (source[5]) bit2num = 3'b101;
        else if (source[6]) bit2num = 3'b110;
        else if (source[7]) bit2num = 3'b111;
        else bit2num = 3'b111;
    endfunction

endmodule

`endif
