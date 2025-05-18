import 'dart:io';

import 'Board.dart';

class Player {
  final String mark;

  Player(this.mark);

  int getMove(Board board) {
    bool validInput = false;
    int position = -1;

    while (!validInput) {
      stdout.write("Player $mark, enter a number (1-9): ");
      String? choice = stdin.readLineSync();

      if (choice != null && int.tryParse(choice) != null) {
        position = int.parse(choice) - 1;

        if (board.isCellValid(position)) {
          validInput = true;
        } else {
          print(" Invalid move! Cell is taken or out of range.");
        }
      } else {
        print("️ Please enter a valid number.");
      }
    }

    return position;
  }
}