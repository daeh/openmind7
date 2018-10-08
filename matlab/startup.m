% if spm_path
%    addpath(spm_path);
% else
%    addpath('/om2/user/daeda/software/spm12_modified');
% end

% try %%% -SPM12-
% spm_path = getenv('SPM_PATH');
% if spm_path
%    addpath(spm_path);
% end
% end

spm_path = getenv('SPM_PATH');
if (exist(spm_path) == 7)
    addpath(genpath(spm_path));
else
    fprintf('SPM_PATH environment var not found, skipping')
end
clear spm_path;

fshome = getenv('FREESURFER_HOME');
fsmatlab = sprintf('%s/matlab',fshome);
if (exist(fsmatlab) == 7)
    addpath(genpath(fsmatlab));
else
    fprintf('FREESURFER_HOME environment var not found, skipping')
end
clear fshome fsmatlab;
fsfasthome = getenv('FSFAST_HOME');
fsfasttoolbox = sprintf('%s/toolbox',fsfasthome);
if (exist(fsfasttoolbox) == 7)
    path(path,fsfasttoolbox);
else
    fprintf('FSFAST_HOME environment var not found, skipping')
end
clear fsfasthome fsfasttoolbox;
