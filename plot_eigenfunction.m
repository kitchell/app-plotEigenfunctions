function [filename] = plot_eigenfunction(V, F, evecs, evnum, surfname)
clf
figure
p=patch('Vertices', V', 'Faces', F', 'FaceVertexCData', evecs(:,evnum), 'LineStyle', 'none');
p.FaceColor='interp';
axis equal
set(gcf, 'Color', 'w');
colorbar
filename = strcat('images/', surfname, '_eigenfunction_', num2str(evnum), '.png')
export_fig(filename)
end
