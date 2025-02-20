#base image (tensorflow environment)
FROM tensorflow/tensorflow:2.17.0-gpu

#fix library path
ENV LD_LIBRARY_PATH /usr/local/cuda/lib64:$LD_LIBRARY_PATH
ENV PATH /usr/local/cuda/bin:$PATH

#set work directory to '/deepdanbooru-custom'
WORKDIR /deepdanbooru-custom

#copy project files to workdir
COPY . .

#install requirements
RUN pip install --no-cache-dir -r requirements.txt

#install package
RUN pip install .