#!/bin/bash
# Get the user to input their version
echo "What version of the application is this?"
read VERSION

#check if an image with that name:tag already exists
if [ docker images nodeapp:${VERSION} ]
then
	docker rmi nodeapp:${VERSION}
fi

# Change to correct directory and build
cd ${HOME}

# Check API exists and then clone or pull



# Good for the task, not for real life
echo "// hi" >> app.js

docker build -t nodeapp:${VERSION} .
