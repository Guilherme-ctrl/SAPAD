import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class SnakeGameVermelho extends StatefulWidget {
  @override
  _SnakeGameVermelhoState createState() => _SnakeGameVermelhoState();
}

class _SnakeGameVermelhoState extends State<SnakeGameVermelho> {
  final int squaresPerRow = 10;
  final int squaresPerCol = 10;
  final fontStyle = TextStyle(color: Colors.white, fontSize: 20);
  final randomGen = Random();

  var snake = [
    [0, 1],
    [0, 0]
  ];
  var food = [0, 2];
  var direction = 'up';
  var isPlaying = false;

  void startGame() {
    const duration = Duration(milliseconds: 300);

    snake = [
      // Snake head
      [(squaresPerRow / 2).floor(), (squaresPerCol / 2).floor()]
    ];

    snake.add([snake.first[0], snake.first[1] + 1]); // Snake body

    createFood();

    isPlaying = true;
    Timer.periodic(duration, (Timer timer) {
      moveSnake();
      if (checkGameOver()) {
        timer.cancel();
        endGame();
      }
    });
  }

  void moveSnake() {
    setState(() {
      switch (direction) {
        case 'up':
          snake.insert(0, [snake.first[0], snake.first[1] - 1]);
          break;

        case 'down':
          snake.insert(0, [snake.first[0], snake.first[1] + 1]);
          break;

        case 'left':
          snake.insert(0, [snake.first[0] - 1, snake.first[1]]);
          break;

        case 'right':
          snake.insert(0, [snake.first[0] + 1, snake.first[1]]);
          break;
      }

      if (snake.first[0] != food[0] || snake.first[1] != food[1]) {
        snake.removeLast();
      } else {
        createFood();
      }
    });
  }

  void createFood() {
    food = [randomGen.nextInt(squaresPerRow), randomGen.nextInt(squaresPerCol)];
  }

  bool checkGameOver() {
    if (!isPlaying ||
        snake.first[1] < 0 ||
        snake.first[1] >= squaresPerCol ||
        snake.first[0] < 0 ||
        snake.first[0] > squaresPerRow) {
      return true;
    }

    for (var i = 1; i < snake.length; ++i) {
      if (snake[i][0] == snake.first[0] && snake[i][1] == snake.first[1]) {
        return true;
      }
    }

    return false;
  }

  void endGame() {
    isPlaying = false;

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Game Over'),
            content: Text(
              'Score: ${snake.length - 2}',
              style: TextStyle(fontSize: 20),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent[400],
      body: Column(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (direction != 'up' && details.delta.dy > 0) {
                  direction = 'down';
                } else if (direction != 'down' && details.delta.dy < 0) {
                  direction = 'up';
                }
              },
              onHorizontalDragUpdate: (details) {
                if (direction != 'left' && details.delta.dx > 0) {
                  direction = 'right';
                } else if (direction != 'right' && details.delta.dx < 0) {
                  direction = 'left';
                }
              },
              child: AspectRatio(
                aspectRatio: squaresPerRow / (squaresPerCol + 5),
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: squaresPerRow,
                    ),
                    itemCount: squaresPerRow * squaresPerCol,
                    itemBuilder: (BuildContext context, int index) {
                      var color;
                      var x = index % squaresPerRow;
                      var y = (index / squaresPerRow).floor();

                      bool isSnakeBody = false;
                      for (var pos in snake) {
                        if (pos[0] == x && pos[1] == y) {
                          isSnakeBody = true;
                          break;
                        }
                      }

                      if (snake.first[0] == x && snake.first[1] == y) {
                        color = Colors.red[700];
                      } else if (isSnakeBody) {
                        color = Colors.red[400];
                      } else if (food[0] == x && food[1] == y) {
                        color = Colors.blueAccent[400];
                      } else {
                        color = Colors.redAccent[100];
                      }

                      return Container(
                        margin: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                      color: isPlaying ? Colors.blueAccent : Colors.blue,
                      child: Text(
                        isPlaying ? 'End' : 'Start',
                        style: fontStyle,
                      ),
                      onPressed: () {
                        if (isPlaying) {
                          isPlaying = false;
                        } else {
                          startGame();
                        }
                      }),
                  Text(
                    'Score: ${snake.length - 2}',
                    style: fontStyle,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
