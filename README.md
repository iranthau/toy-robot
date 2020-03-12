[![Codacy Badge](https://api.codacy.com/project/badge/Grade/e09e10a6a966415699cff5a8007b2c05)](https://www.codacy.com/app/iranthau/toy-robot?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=iranthau/toy-robot&amp;utm_campaign=Badge_Grade)

# Toy Robot

The application is an extended version of Toy Robot which has more functionalities like custom board sizes. It is written in Ruby and uses rspec as the test framework. Runs on docker.

## Run the Robot

First build the docker image.

```bash
docker image build -t toy-robot .
```

To run the app using docker, just use the command use,

```bash
docker container run --rm -it toy-robot
```

Follow the instructions on the app.

### COMMAND -> What it does

PLACE -> Place the robot at a given position facing a given direction
MOVE -> Move the robot by 1 unit towards faced direction
LEFT -> Turn left by 90 degrees
RIGHT -> Turn right by 90 degrees
REPORT -> Print out the location and the direction of the robot
EXIT -> Exit the application

## Test

Run test using docker,

```bash
docker container run --rm -it toy-robot bash -c "rspec spec/"
```
