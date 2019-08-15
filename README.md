[![Codacy Badge](https://api.codacy.com/project/badge/Grade/e09e10a6a966415699cff5a8007b2c05)](https://www.codacy.com/app/iranthau/toy-robot?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=iranthau/toy-robot&amp;utm_campaign=Badge_Grade)

# Toy Robot

The application is an extended version of Toy Robot which has more functionalities like custom board size. It is written in Ruby and uses rspec as the test framework.

## Run

To run the app just use the command `./run`

First command need to be `place` followed by the initial position and a valid direction. Valid directions are NORTH, SOUTH, EAST and WEST.
Then you execute commands like MOVE, LEFT, RIGHT, REPORT and EXIT.

### COMMAND -> What it does
-----------------------

PLACE -> Place the robot at a given position facing a given direction  
MOVE -> Move the robot by 1 unit towards faced direction  
LEFT -> Turn left by 90 degrees  
RIGHT -> Turn right by 90 degrees  
REPORT -> Print out the location and the direction of the robot  
EXIT -> Exit the application

## Test

To run all specs run `rspec`
