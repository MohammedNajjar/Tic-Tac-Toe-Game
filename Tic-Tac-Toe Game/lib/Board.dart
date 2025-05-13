class Board {
  List<String> cells = List.generate(9, (index) => (index + 1).toString());

  void reset() {
    cells = List.generate(9, (index) => (index + 1).toString());
  }

  void display() {
    print("\n");
    print(" ${cells[0]} | ${cells[1]} | ${cells[2]} ");
    print("---+---+---");
    print(" ${cells[3]} | ${cells[4]} | ${cells[5]} ");
    print("---+---+---");
    print(" ${cells[6]} | ${cells[7]} | ${cells[8]} ");
    print("\n");
  }

  bool isCellValid(int position) {
    return position >= 0 && position < 9 &&
        cells[position] != 'X' && cells[position] != 'O';
  }

  void markCell(int position, String mark) {
    cells[position] = mark;
  }

  bool isFull() {
    return cells.every((cell) => cell == 'X' || cell == 'O');
  }

  bool checkWinFor(String playerMark) {
    List<List<int>> winConditions = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // columns
      [0, 4, 8], [2, 4, 6],           // diagonals
    ];

    for (var condition in winConditions) {
      int a = condition[0];
      int b = condition[1];
      int c = condition[2];

      if (cells[a] == playerMark &&
          cells[b] == playerMark &&
          cells[c] == playerMark) {
        return true;
      }
    }

    return false;
  }
}