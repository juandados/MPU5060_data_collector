FROM jupyter/tensorflow-notebook:7a0c7325e470
USER root
ADD requirements.txt ./
# conda update -n base conda
RUN conda create -n prod python=3.5 -y
RUN /bin/bash -c "source /opt/conda/etc/profile.d/conda.sh && \
 conda activate prod && \
 conda install python-graphviz && \
 conda install -c conda-forge ffmpeg && \
 conda install -c conda-forge opencv && \
 pip install tensorflow==1.15"
RUN /bin/bash -c "pip install -r requirements.txt"
RUN /bin/bash -c "hash -r"
RUN /bin/bash -c "jupyter-nbextension install rise --py --sys-prefix"
RUN conda init bash
