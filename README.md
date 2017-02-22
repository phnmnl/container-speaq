# container-speaq
Version: 1.2.2

## Short Description

R-based quantitative analysis of NMR metabolomic profile data

## Description

Speaq is a novel suite of informatics tools for the quantitative analysis of NMR metabolomic profile data. The core of the processing cascade is a novel peak alignment algorithm, called hierarchical Cluster-based Peak Alignment (CluPA). The algorithm aligns a target spectrum to the reference spectrum in a top-down fashion by building a hierarchical cluster tree from peak lists of reference and target spectra and then dividing the spectra into smaller segments based on the most distant clusters of the tree. To reduce the computational time to estimate the spectral misalignment, the method makes use of Fast Fourier Transformation (FFT) cross-correlation. Since the method returns a high-quality alignment, we can propose a simple methodology to study the variability of the NMR spectra. For each aligned NMR data point the ratio of the between-group and within-group sum of squares (BW-ratio) is calculated to quantify the difference in variability between and within predefined groups of NMR spectra. This differential analysis is related to the calculation of the F-statistic or a one-way ANOVA, but without distributional assumptions. Statistical inference based on the BW-ratio is achieved by bootstrapping the null distribution from the experimental data.

## Key features

- NMR Processing

## Functionality

- Annotation / NMR
- Post-processing

## Approaches

- Metabolomics / Targeted
  
## Instrument Data Types

- NMR / 1D NMR
- NMR / 1H NMR

## Tool Authors

- Trung Nghia Vu
- Kris Laukens
- Dirk Valkenborg

## Container Contributors

- [Kristian Peters](https://github.com/korseby) (IPB Halle)

## Website

- https://github.com/nghiavtr/speaq


## Git Repository

- https://github.com/phnmnl/container-speaq.git

## Installation 

For local individual installation:

```bash
docker pull docker-registry.phenomenal-h2020.eu/phnmnl/speaq
```

## Usage Instructions

For direct docker usage:

```bash
docker run docker-registry.phenomenal-h2020.eu/phnmnl/speaq ...
```

## Publications

<!-- Guidance:
Use AMA style publications as a list (you can export AMA from PubMed, on the Formats: Citation link when looking at the entry).
IMPORTANT: Publications sectio must be placed at the end and cannot be emptied!
-->

- Trung N VuEmail author, Dirk Valkenborg, Koen Smets, Kim A Verwaest, Roger Dommisse, Filip Lemière, Alain Verschoren, Bart Goethals and Kris Laukens. An integrated workflow for robust alignment and simplified quantitative analysis of NMR spectrometry data. BMC Bioinformatics . 2011;12:405. doi:10.1186/1471-2105-12-405.
