function h = tri(t)
    h = (t+1).*(t >= -1 & t < 0) + (1-t).*(t >= 0 & t < 1);
end