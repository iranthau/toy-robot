[![Codacy Badge](https://api.codacy.com/project/badge/Grade/e09e10a6a966415699cff5a8007b2c05)](https://www.codacy.com/app/iranthau/toy-robot?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=iranthau/toy-robot&amp;utm_campaign=Badge_Grade)

# Toy Robot

The application is a simulation of a Toy Robot moving on a square tabletop, of dimensions 5 units x 5 units. There are no other obstructions on the table surface. The Robot is free to roam around the surface of the table.

Inputs for the robot to move around are as follows:

```
      N
      |
      |
W <--------> E
      |
      |
      S

4 _________________
  |   |   |   |   |
  |   |   |   |   |
3 -----------------
  |   |   |   |   |
  |   |   |   |   |
2 -----------------
  |   |   |   |   |
  |   |   |   |   |
1 -----------------
  |   |   |   |   |
  |   |   |   |   |
0 -----------------
      1   2   3   4

PLACE X,Y,DIRECTION: Place the Robot at a given x,y facing given direction.
X - [0 - 4]
Y - [0 - 4]
DIRECTION - [NORTH EAST SOUTH WEST]

MOVE - Moves the Robot to the facing direction by one square

LEFT - Turn the Robot towards left

RIGHT - Turn the Robot towards right

REPORT - Prints the current position of the Robot
```

## Run the simulator

Clone the repo.
If you like to run the simulator using Docker, build the docker image.

```bash
docker image build -t toy-robot .
```

To run the app using docker, use following command,

```bash
docker container run --rm -it toy-robot
```

Then follow the instructions on the app.

To run the simulator without using docker,

```bash
# move into the folder
cd toy-robot

# run the robot
bin/toy_robot
```

## Test

Run test using docker,

```bash
docker container run --rm -it toy-robot bash -c 'rspec spec/'
```
