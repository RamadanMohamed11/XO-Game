import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:xo_game/constants/colors.dart';
import 'package:xo_game/widgets/custom_button.dart';
import 'package:xo_game/widgets/o_char_widget.dart';
import 'package:xo_game/widgets/x_char_widget.dart';

class SingleGamePage extends StatefulWidget {
  const SingleGamePage({super.key, required this.xName});
  final String xName;
  @override
  State<SingleGamePage> createState() => _SingleGamePageState();
}

class _SingleGamePageState extends State<SingleGamePage> {
  late String _currentPlayer;
  String winner = '';
  late int xTimesWin;
  late int oTimesWin;
  late bool _gameOver;
  late List<List<Widget>> _currentBoard;
  late List<List<String>> _boardState;

  Color _xFontColor = Colors.white60;
  Color _oFontColor = Colors.white60;

  double _xFontSize = 50;
  double _oFontSize = 50;

  double _xBlurRadius = 0;
  double _oBlurRadius = 0;
  Text emptyText = const Text("");
  @override
  void initState() {
    super.initState();
    _boardState = List.generate(3, (_) => List.generate(3, (_) => ''));
    _currentBoard = List.generate(3, (_) => List.generate(3, (_) => emptyText));
    _currentPlayer = 'X';
    _gameOver = false;
    xTimesWin = 0;
    oTimesWin = 0;

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _xFontColor = Colors.white;
        _xFontSize = 75;
        _xBlurRadius = 50;
      });
    });
  }

  void resetGame({bool resetAllGame = false}) {
    _xFontColor = Colors.white;
    _oFontColor = Colors.white60;

    _xFontSize = 75;
    _oFontSize = 50;

    _xBlurRadius = 50;
    _oBlurRadius = 0;

    _currentBoard = List.generate(3, (_) => List.generate(3, (_) => emptyText));
    _currentPlayer = 'X';
    _boardState = List.generate(3, (_) => List.generate(3, (_) => ''));
    _gameOver = false;

    _gameOver = false;
    if (resetAllGame) {
      xTimesWin = 0;
      oTimesWin = 0;
    }
    setState(() {});
  }

  List<int> _findRandomEmptyCell() {
    Random random = Random();
    int row, col;
    do {
      row = random.nextInt(3);
      col = random.nextInt(3);
    } while (_boardState[row][col] != '');
    return [row, col];
  }

  void _checkWin() {
    // Rows
    for (int i = 0; i < 3; i++) {
      if (_boardState[i][0] == _currentPlayer &&
          _boardState[i][1] == _currentPlayer &&
          _boardState[i][2] == _currentPlayer) {
        winner = _currentPlayer;
        _gameOver = true;
      }
    }
    // Columns
    for (int i = 0; i < 3; i++) {
      if (_boardState[0][i] == _currentPlayer &&
          _boardState[1][i] == _currentPlayer &&
          _boardState[2][i] == _currentPlayer) {
        winner = _currentPlayer;
        _gameOver = true;
      }
    }
    // Diagonals
    if (_boardState[0][0] == _currentPlayer &&
        _boardState[1][1] == _currentPlayer &&
        _boardState[2][2] == _currentPlayer) {
      winner = _currentPlayer;
      _gameOver = true;
    }
    if (_boardState[0][2] == _currentPlayer &&
        _boardState[1][1] == _currentPlayer &&
        _boardState[2][0] == _currentPlayer) {
      winner = _currentPlayer;
      _gameOver = true;
    }
    if (_gameOver) {
      winner = _currentPlayer;
      _currentPlayer == 'X' ? xTimesWin++ : oTimesWin++;
      _showWinDialog();
      return;
    }
    _gameOver = true;
    for (int r = 0; r < 3; r++) {
      for (int c = 0; c < 3; c++) {
        if (_boardState[r][c] == '') {
          _gameOver = false;
          break;
        }
      }
    }
    if (_gameOver) {
      winner = '';
      _showWinDialog();
      return;
    }
  }

  void _showWinDialog() {
    AwesomeDialog(
      dialogBackgroundColor: kMainColor,
      context: context,
      animType: AnimType.bottomSlide,
      dialogType: (winner.isEmpty) ? DialogType.noHeader : DialogType.success,
      title: "Game Over",
      titleTextStyle: const TextStyle(
          color: Colors.red, fontSize: 26, fontWeight: FontWeight.bold),
      desc:
          (winner.isEmpty) ? ("It's a tie") : ('Player $_currentPlayer Wins!'),
      descTextStyle: TextStyle(fontSize: 24, color: Colors.white, shadows: [
        (winner == 'X')
            ? Shadow(
                color: xShadowColor, offset: const Offset(0, 0), blurRadius: 50)
            : ((winner == 'O')
                ? Shadow(
                    color: oShadowColor,
                    offset: const Offset(0, 0),
                    blurRadius: 50)
                : const Shadow(
                    color: Colors.black, offset: Offset(0, 0), blurRadius: 0))
      ]),
      btnOkText: "Play Again",
      btnOkOnPress: () {
        resetGame();
      },
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 140,
                    child: Column(
                      children: [
                        AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 500),
                          style: TextStyle(
                              fontSize: _xFontSize,
                              color: _xFontColor,
                              shadows: [
                                Shadow(
                                    blurRadius: _xBlurRadius,
                                    color: xShadowColor,
                                    offset: const Offset(0, 0))
                              ]),
                          child: const Text(
                            "X",
                          ),
                        ),
                        Text(
                          widget.xName,
                          style: TextStyle(color: Colors.white, shadows: [
                            Shadow(
                                color: xShadowColor,
                                blurRadius: 50,
                                offset: const Offset(0, 0))
                          ]),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: Text(
                      " VS ",
                      style: TextStyle(color: Colors.white, fontSize: 50),
                    ),
                  ),
                  SizedBox(
                    height: 125,
                    child: Column(
                      children: [
                        AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 500),
                          style: TextStyle(
                              fontSize: _oFontSize,
                              color: _oFontColor,
                              shadows: [
                                Shadow(
                                    blurRadius: _oBlurRadius,
                                    color: oShadowColor,
                                    offset: const Offset(0, 0))
                              ]),
                          child: const Text(
                            "O",
                          ),
                        ),
                        Text(
                          "Computer",
                          style: TextStyle(color: Colors.white, shadows: [
                            Shadow(
                                color: oShadowColor,
                                blurRadius: 50,
                                offset: const Offset(0, 0))
                          ]),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  padding: const EdgeInsets.all(8),
                  height: 450,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(12)),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      itemCount: 9,
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (_currentPlayer == 'X') {
                              if ((_currentBoard[index ~/ 3][index % 3]) ==
                                  emptyText) {
                                _currentBoard[index ~/ 3][index % 3] =
                                    const XCharWidget();
                                _boardState[index ~/ 3][index % 3] = 'X';

                                _checkWin();
                                if (!_gameOver) {
                                  _currentPlayer = 'O';
                                  _xFontSize = 50;
                                  _xFontColor = Colors.white60;
                                  _xBlurRadius = 0;

                                  _oFontSize = 75;
                                  _oBlurRadius = 50;
                                  _oFontColor = Colors.white;
                                  setState(() {});
                                } else {
                                  setState(() {});

                                  return;
                                }
                              }
                            }

                            if (!_gameOver) {
                              List<int> emptyCell = _findRandomEmptyCell();
                              Future.delayed(const Duration(milliseconds: 500),
                                  () {
                                setState(() {
                                  _currentBoard[emptyCell[0]][emptyCell[1]] =
                                      const OCharWidget();
                                  _boardState[emptyCell[0]][emptyCell[1]] = 'O';
                                  _checkWin();
                                  if (!_gameOver) {
                                    _currentPlayer = 'X';
                                    _xFontSize = 75;
                                    _xBlurRadius = 50;
                                    _xFontColor = Colors.white;

                                    _oFontSize = 50;
                                    _oBlurRadius = 0;
                                    _oFontColor = Colors.white60;
                                  }
                                });
                              });
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: kMainColor,
                                borderRadius: BorderRadius.circular(14)),
                            child: Center(
                                child: _currentBoard[index ~/ 3][index % 3]),
                          ),
                        );
                      })),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                text: "Reset",
                onTap: () {
                  resetGame(resetAllGame: true);
                },
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: kMainColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          const XCharWidget(),
                          Text(" = $xTimesWin",
                              style: TextStyle(
                                  fontSize: 60,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                        blurRadius: 50,
                                        color: xShadowColor,
                                        offset: const Offset(0, 0))
                                  ])),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: kMainColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          const OCharWidget(),
                          Text(" = $oTimesWin",
                              style: TextStyle(
                                  fontSize: 60,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                        blurRadius: 50,
                                        color: oShadowColor,
                                        offset: const Offset(0, 0))
                                  ])),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
