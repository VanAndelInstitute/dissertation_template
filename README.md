# Dissertation

## Organization

```
dissertation/
├── vaigs.cls
├── dissertation.tex
├── chapters/
│   ├── abstract.tex
│   ├── acknowledgements.tex
│   ├── intro.tex
│   ├── chapetr1.tex
│   └── conclusion.tex
├── references.bib
├── data/
├── figures/
├── scripts/
├── flake.lock
├── flake.nix
└── Makefile
```

`vaigs.cls` provides the template for the VAIGS dissertation. `dissertation.tex`
is the main document where the frontmatter is set and where the individual
chapters are included. All chapters go in the `chapters` directory and must
contain chapter titles. `references.bib` is kept updated by Better BibTex.

`data` contains the data used to produce most figures in the document, organized
by chapter. Figures can be generated into `figures/` by scripts in `scripts/`,
calling specific scripts for each chapter. Some figures like diagrams are stored
and tracked here as SVGs but converted to PDFs for compilation. Large figures
that take a long time to generate may also be stored here.

`flake.nix` provides version controlled compilation and development
environments. The build process uses GNU make to produce figures and compile the
document.

## Compilation

Using nix you can install all dependencies and compile the document with

```
nix build
```

For non-nix systems, you can use `make`, if all dependencies are installed:

```
make
```

## Dependencies

### Latex

The flake and Makefile use `lualatex` and `biber` to compile the document.

### TexLive

The nix flake currently installs a full TexLive distribution with all available
TexLive packages so I don't have to deal with missing packages while writing.

### librsvg

To convert SVGs in `figures` to PDF for compilation.
