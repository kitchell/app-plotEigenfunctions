function [filename] = plot_eigenfunction(V, F, evecs, evnum, surfname)
az = [0 0 0 0 90 270];
el = [90 180 270 360 0 0];
v = {'top', 'back' ,'bottom', 'front' ,'right' ,'left'};
for angle = 1:size(az, 2)
    clf
    figure
    p=patch('Vertices', V', 'Faces', F', 'FaceVertexCData', evecs(:,evnum), 'FaceColor', 'interp', 'LineStyle', 'none');
    %p.FaceColor='interp';
    axis equal
    view(az(angle), el(angle));
    set(gcf, 'Color', 'w');
    colorbar
    filename = strcat('images/', surfname, '_eigenfunction_', num2str(evnum), '_', v(angle), '.png');
    export_fig(filename)
end
end
