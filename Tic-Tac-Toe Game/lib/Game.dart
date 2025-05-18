import 'dart:io';

import 'Board.dart';
import 'Player.dart';

class Game {
  final Board board = Board();
  final Player playerX = Player('X');
  final Player playerO = Player('O');
  late Player currentPlayer;
  bool gameEnded = false;

  Game() {
    currentPlayer = playerX;
  }

  void start() {
    print("🎮 Welcome to Tic-Tac-Toe in Dart!");

    bool playAgain = true;

    while (playAgain) {
      resetGame();
      playRound();

      print("\nDo you want to play again? (y/n)");
      String? choice = stdin.readLineSync();

      if (choice == null || choice.toLowerCase() != 'y') {
        playAgain = false;
        print(" Thanks for playing! Goodbye.");
      }
    }
  }

  void resetGame() {
    board.reset();
    currentPlayer = playerX;
    gameEnded = false;
  }

  void switchPlayer() {
    currentPlayer = (currentPlayer == playerX) ? playerO : playerX;
  }

  void playRound() {
    while (!gameEnded) {
      board.display();

      int move = currentPlayer.getMove(board);
      board.markCell(move, currentPlayer.mark);

      if (board.checkWinFor(currentPlayer.mark)) {
        board.display();
        print(" Player ${currentPlayer.mark} wins!");
        gameEnded = true;
      } else if (board.isFull()) {
        board.display();
        print(" It's a draw!");
        gameEnded = true;
      } else {
        switchPlayer();
      }
    }
  }
}