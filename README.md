[![Abcdspec-compliant](https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg)](https://github.com/brain-life/abcd-spec)
[![Run on Brainlife.io](https://img.shields.io/badge/Brainlife-bl.app.55-blue.svg)](https://doi.org/10.25663/bl.app.55)

# app-plotEigenfunctions

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Plots a chosen Laplace-Beltrami eigenfunction on each white matter tract surface mesh (VTK) with MATLAB and outputs a folder of images.**

Visualisation utility for shape analysis of tract surfaces. It loads eigenvectors.mat from a previous Laplace-Beltrami spectrum App and, for each .vtk surface whose name matches an entry, renders the selected eigenfunction on the mesh. Needs the eigenvectors computed from the same set of surfaces.

| | |
|---|---|
| 📥 **Inputs** | `raw` · `neuro/3Dsurfaces` |
| 📤 **Outputs** | `generic/images` |
| ⚙️ **Resources** | 8 CPUs · 1 h walltime |
| 🔗 **Run it** | [doi.org/10.25663/bl.app.55](https://doi.org/10.25663/bl.app.55) |

#### 📥 Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `0` | `raw` (eigenvectors) | yes | Folder holding eigenvectors.mat from a Laplace-Beltrami eigenvector App. |
| `1` | `neuro/3Dsurfaces` | yes | Tract surface meshes (.vtk), one per tract. Surface file names must match the field names in eigenvectors.mat. |

#### 📤 Outputs

| Output | Datatype | Description |
|---|---|---|
| `0` | `generic/images` | Images of the eigenfunction plotted on each surface, with images.json. |

<details>
<summary><b>⚙️ Parameters</b> (1)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `eigenvector_number` | number |  | Index of the eigenvector (eigenfunction) to plot. |

</details>

📚 **References used by this App:**
- Kitchell L. Shape Analysis of Human White Matter Tracts: An Examination of Normal Morphological Variability and the Association Between Morphology, Brain Size, and Behavior. PhD thesis, Indiana University (2020).

<!-- brainlife-app:end -->

This app plots the eigenfunctions of the Laplace Beltrami Spectrum on the original surface meshes. 

### Author
- Lindsey Kitchell (kitchell@indiana.edu)

### Funding 
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-1636893](https://img.shields.io/badge/NSF_BCS-1636893-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1636893)

## Running the App 

### On Brainlife.io

You can submit this App online at [https://doi.org/10.25663/bl.app.55](https://doi.org/10.25663/bl.app.55) via the "Execute" tab.

### Running Locally (on your machine)

1. git clone this repo.
2. Inside the cloned directory, create `config.json` with something like the following content with paths to your input files.

```json
{
  "surfaces": "../input/surfaces",
  "evecs_folder": "../5b96d2cb161e01002a320742/5967bffa9b45c212bbec8958/output"      
}
```

3. Execute the main.m file in Matlab



### Sample Datasets

If you don't have your own input file, you can download sample datasets from Brainlife.io, or you can use [Brainlife CLI](https://github.com/brain-life/cli).


## Output

The main output of this App is a folder of images. 

### Dependencies

This App requires Matlab to run and the following dependencies.  

  - JSONlab: https://www.mathworks.com/matlabcentral/fileexchange/33381-jsonlab-a-toolbox-to-encode-decode-json-files
  - geom3D: https://www.mathworks.com/matlabcentral/fileexchange/24484-geom3d
  - export_fig: https://www.mathworks.com/matlabcentral/fileexchange/23629-export_fig
