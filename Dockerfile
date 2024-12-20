# Start with the latest TensorFlow GPU Docker image
FROM tensorflow/tensorflow:latest-gpu

# Install necessary packages
RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

# Clone the DSIPTS repository
RUN git clone https://github.com/DSIP-FBK/DSIPTS.git /DSIPTS



# Install Python packages
RUN pip install --no-cache-dir \
    aim \
    pytorch-lightning==1.9.4 \
    einops \
    hydra-joblib-launcher \
    cffi

# Set the working directory to the cloned repository
WORKDIR /DSIPTS

RUN aim init

RUN aim up --host 0.0.0.0 --port 43800

#CMD [ "/bin/bash" ]  
CMD tail -f /dev/null
