# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

#swtich working directory
WORKDIR /wikipedia-api

#Copy the requirements file to container
COPY requirements.txt requirements.txt 

#install libraries
RUN pip3 install -r requirements.txt

# Copy contents from local file inside the container
COPY . .

# parameters for executing the app
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]