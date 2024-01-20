class Expense {
  late int frequency;
  late String name;
  late String type;
  late double price;

  Expense(frequency, name, type, price);

  // Getters
  int get getFrequency => frequency;
  String get getName => name;
  String get getType => type;
  double get getPrice => price;

  // Setters
  set setFrequency(int frequency) => this.frequency = frequency;
  set setName(String name) => this.name = name;
  set setType(String type) => this.type = type;
  set setPrice(double price) => this.price = price;
}
