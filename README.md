# System Overview

A notebook that walks through every stage of the whisper-to-speech system
described in the thesis, from glottal pulse generation to the complete system.

## Running it

You only need [uv](https://docs.astral.sh/uv/getting-started/installation/).
It installs the right Python version and all dependencies for you.

```sh
cd systemOverview
uv run jupyter lab SystemOverview.ipynb
```

Then run the cells from top to bottom (*Run → Run All Cells*).

The first run takes a minute while uv sets up the environment. Later runs start
right away.

### Using VS Code instead

Run `uv sync` in this folder, open `SystemOverview.ipynb`, and select the
`.venv` interpreter in this folder as the kernel.

## Contents

| Path | What it is |
|---|---|
| `SystemOverview.ipynb` | The notebook |
| `LFmag.mat`, `LFNRD.mat` | Precomputed Liljencrants–Fant pulse data |
| `data/` | Voiced, whispered and vowel recordings used as input |
| `figures/` | Diagrams shown in the notebook (rebuild from `.tikz` with `figures/build.sh`) |
