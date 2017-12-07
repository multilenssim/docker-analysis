# Use an official Python runtime as a parent image
FROM python:2.7-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app
ADD cfSam1_16/r0-1gamma_sim.h5 /app

# Install any needed packages specified in requirements.txt
#RUN apt-get update
#RUN apt-get install gcc --assume-yes  # Only need this for pip install subprocess32
#RUN apt-get install git --assume-yes
RUN pip install -r requirements.txt
#RUN git clone https://github.com/multilenssim/analysis.git --branch wip-KW  # Lets clone this manually so don't have to pull in git

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "analysis/multeplicity.py", "-f", "r0-1gamma_sim.h5"]
