GROUP_ID=com.sample.app
ARTIFACT_ID=sample

.PHONY: all clean build run

all: clean build run

clean:
	mvn clean

build:
	mvn compile

run:
	mvn exec:java -Dexec.mainClass="$(GROUP_ID).App"
