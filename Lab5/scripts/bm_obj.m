function [f_vx, f_vy, obj] = bm_obj(Z, J, b, d)
    I = Z;
    dx = d(1); 
    dy = d(2);
    [ny, nx, c] = size(I);
    Z = zeros(ny+2*dy, nx+2*dx, c);
    Z((1:ny)+dy, (1:nx)+dx, :) = I; 
    [vx, vy] = mybm(Z, J, b, d); 
    f_vx = medfilt2(vx);
    f_vy = medfilt2(vy);
    obj = f_vx.^2 + f_vy.^2;
    maximum = max(obj(:)); maximum = maximum / 2;
    [row, col] = size(obj);
    for i = 1:row
        for j = 1:col
            if obj(i,j) > maximum
                obj(i,j) = 1;
            else obj(i,j) = 0;
            end
        end
    end
    obj = expand(obj, b);
end
