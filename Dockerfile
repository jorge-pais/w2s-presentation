# Single-user notebook image for JupyterHub (see ~/SERVER/jupyterhub).
# Each committee member gets their own container from this image.
FROM ghcr.io/astral-sh/uv:0.13-trixie

ARG JUPYTERHUB_VERSION=6.1.0
ARG NB_UID=1000

RUN useradd --create-home --uid ${NB_UID} jovyan
USER jovyan
WORKDIR /home/jovyan/work

ENV UV_PROJECT_ENVIRONMENT=/home/jovyan/.venv \
    UV_LINK_MODE=copy \
    PATH=/home/jovyan/.venv/bin:$PATH

# Dependencies first so notebook edits don't invalidate this layer
COPY --chown=jovyan pyproject.toml uv.lock .python-version ./
RUN uv sync --frozen --no-cache \
 && uv pip install --no-cache jupyterhub==${JUPYTERHUB_VERSION}

COPY --chown=jovyan . .

EXPOSE 8888
CMD ["jupyterhub-singleuser"]
