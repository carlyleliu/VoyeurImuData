function run_time_plot(p, time_stamp, cap)
    global x;
    %hold on
    set(p, 'XData',time_stamp(:,1),'YData',cap(:,1));
    x = x + 1;
    axis([x-300 x+100 0 inf]);
    drawnow
end