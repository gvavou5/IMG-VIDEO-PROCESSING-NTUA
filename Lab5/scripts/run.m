%% *********** Exercise 5 *************

%% Clean up everything
clear all; 
close all;

%% Coast
for b = 8:12
    d = fix(b/2);
    root = './data/';
    % tuxaia epilogh begin kai end
    begin = 20;
    the_end = 29;
    im = 'coast';
    figure; hold on; % create a new figure and wait
    for ind = begin:(the_end-1)        
        filepath = [root im '/' im '_%03d.gif'];
        I = indread(sprintf(filepath, ind));
        J = indread(sprintf(filepath, ind+1));
        [fvx, fvy, obj] = bm_obj(I, J, [b b], [d d]);
        subplot(3, 3, ind-begin+1);
        imshow(obj);
    end;
    hold off; % stop wait
    % give a name to the plot
    plotname = sprintf('Plot Parameters: b = %d and d = %d.', b,d); suptitle(plotname);
end; 

%% Bike

for b = 8:12
    d = fix(b/2)
    root = './data/';
    % tuxaia epilogh begin kai end
    begin = 20;
    the_end = 29;
    im = 'bike';
    figure; hold on; % create a new figure and wait
    for ind = begin:(the_end-1)        
        filepath = [root im '/' im '_%03d.gif'];
        I = indread(sprintf(filepath, ind));
        J = indread(sprintf(filepath, ind+1));
        [fvx, fvy, obj] = bm_obj(I, J, [b b], [d d]);
        subplot(3, 3, ind-begin+1);
        imshow(obj);
    end;
    hold off; % stop wait
    % give a name to the plot
    plotname = sprintf('Plot Parameters: b = %d and d = %d.', b,d); suptitle(plotname);
end;





%% Garden
for b = 8:12
    d = fix(b/2);
    root = './data/';
    % tuxaia epilogh begin kai end
    begin = 20;
    the_end = 29;
    im = 'garden';
    figure; hold on; % create a new figure and wait
    for ind = begin:(the_end-1)        
        filepath = [root im '/' im '_%03d.gif'];
        I = indread(sprintf(filepath, ind));
        J = indread(sprintf(filepath, ind+1));
        [fvx, fvy, obj] = bm_obj(I, J, [b b], [d d]);
        subplot(3, 3, ind-begin+1);
        imshow(obj);
    end;
    hold off; % stop wait
    % give a name to the plot
    plotname = sprintf('Plot Parameters: b = %d and d = %d.', b,d); suptitle(plotname);
end;

%% Tennis
for b = 8:12
    d = fix(b/2);
    root = './data/';
    % tuxaia epilogh begin kai end
    begin = 20;
    the_end = 29;
    im = 'tennis';
    figure; hold on; % create a new figure and wait
    for ind = begin:(the_end-1)        
        filepath = [root im '/' im '_%03d.gif'];
        I = indread(sprintf(filepath, ind));
        J = indread(sprintf(filepath, ind+1));
        [fvx, fvy, obj] = bm_obj(I, J, [b b], [d d]);
        subplot(3, 3, ind-begin+1);
        imshow(obj);
    end;
    hold off; % stop wait
    % give a name to the plot
    plotname = sprintf('Plot Parameters: b = %d and d = %d.', b,d); suptitle(plotname);
end;

