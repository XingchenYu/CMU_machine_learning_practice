function [list2] = yougan()
    list2 = size(1:10000);
    cnt = 0;
    t = 1;
    c = 1;
    e = 1;
    h = 1;
    list2(1) = 1;
    for i = 2:10000
        %t
        tmp = rand;
        if e == 1 && c == 1
            p1 = 0.9;
            p0 = 0.7;
        elseif e == 1 && c == 0
            p1 = 0.5;
            p0 = 0.2;
        elseif e == 0 && c == 1
            p1 = 0.1;
            p0 = 0.3;
        else
            p1 = 0.5;
            p0 = 0.8;
        end
        pro = 0.55 * p1 / (0.55 * p1 + 0.45 * p0);
        if tmp < pro
            t = 1;
        else 
            t = 0;
        end
        %c
        tmp = rand;
        if t == 1 && e == 1
            p11 = 0.9;
            p01 = 0.5;
        elseif t == 1 && e == 0
            p11 = 0.1;
            p01 = 0.5;
        elseif t == 0 && e == 1
            p11 = 0.7;
            p01 = 0.2;
        else
            p11 = 0.3;
            p01 = 0.8;
        end
        if h == 1
            p12 = 0.8;
            p02 = 0.25;
        else
            p12 = 0.2;
            p02 = 0.75;
        end
        pro = p11 * p12 * 0.8 / (p11 * p12 * 0.8 + p01 * p02 * 0.2);
        if tmp < pro
            c = 1;
        else 
            c = 0;
        end
        %e
        tmp = rand;
        if c == 1 && t == 1
            p11 = 0.9;
            p01 = 0.1;
        elseif c == 1 && t == 0
            p11 = 0.7;
            p01 = 0.3;
        elseif c == 0 && t == 1
            p11 = 0.5;
            p01 = 0.5;
        else 
            p11 = 0.2;
            p01 = 0.8;
        end
        if h == 1
            p12 = 0.2;
            p02 = 0.3;
        else 
            p12 = 0.3;
            p02 = 0.05;
        end;
        pro = p11 * p12 / (p11 * p12 + p01 * p02);
        if tmp < pro
            e = 1;
        else 
            e = 0;
        end
        %h
        tmp = rand;
        if e == 1
            p11 = 0.2;
            p01 = 0.3;
        else 
            p11 = 0.3;
            p01 = 0.05;
        end;
        if c == 1
            p12 = 0.8;
            p02 = 0.2;
        else
            p12 = 0.25;
            p02 = 0.75;
        end
        pro = p11 * p12 / (p11 * p12 + p01 * p02);
        if tmp < pro
            h = 1;
        else 
            h = 0;
        end
        if c == 1
            cnt = cnt + 1;
        end
        list2(i) = cnt/i;
    end
end
           