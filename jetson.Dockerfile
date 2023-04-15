FROM nvcr.io/nvidia/l4t-ml:r35.2.1-py3

LABEL authors="Lisa Twirl"

COPY ./segment-anything /segment-anything

RUN pip3 install -e /segment-anything

CMD /bin/bash -c "jupyter lab --ip 0.0.0.0 --port 8888 --notebook-dir=/segment-anything/notebooks --allow-root &> /var/log/jupyter.log" & \
	echo "allow 10 sec for JupyterLab to start @ http://$(hostname -I | cut -d' ' -f1):8888 (password nvidia)" && \
	echo "JupterLab logging location:  /var/log/jupyter.log  (inside the container)" && \
	/bin/bash