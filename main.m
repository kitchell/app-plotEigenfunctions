function [out] = main()

switch getenv('ENV')
    case 'IUHPC'
        disp('loading paths (HPC)')
        addpath(genpath('/N/u/brlife/git/jsonlab'))
        addpath(genpath('/N/u/brlife/git/geom3d'))
        addpath(genpath('/N/u/brlife/git/export_fig'))
    case 'VM'
        disp('loading paths (VM)')
        addpath(genpath('/usr/local/jsonlab'))
end



config = loadjson('config.json');
%evecs = loadjson(config.evecs);
load(config.evecs)
evnum = config.eigenvector_number;
mkdir('images');

filelist = dir([config.surfaces '/*.vtk']);
for file = 1:size(filelist)
    sprintf(filelist(file).name)
    [V,F] = read_vtk([config.surfaces '/' filelist(file).name]);
    %size(V)
    %size(F)
    iminfo = plot_eigenfunction(V, F, evecs_struct.(filelist(file).name(1:end-4)), evnum, filelist(file).name(1:end-4));
    for im = 1:size(iminfo, 2)
        json.images(((file-1) * 6) + im) = iminfo(im);
    end

%     json.images(file).filename = filename;
%     json.images(file).name = filelist(file).name(1:end-4);
%     json.images(file).desc = filename(7:end);
end
savejson('', json, 'images.json');
end
