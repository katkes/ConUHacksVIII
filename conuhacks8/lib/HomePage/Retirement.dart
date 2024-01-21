import 'package:flutter/material.dart';
import 'BottomNav.dart';

class Retirement extends StatelessWidget {
  const Retirement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Retirement Plan',
          style: TextStyle(
            fontFamily: 'YesevaOne', // Font family as declared in pubspec.yaml
            fontSize: 30, // Adjust the font size as needed
            color: Color.fromARGB(255, 0, 26, 156),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  "Inflation Impact on Retirement Savings",
                  style: TextStyle(
                    fontFamily:
                        'YesevaOne', // Font family as declared in pubspec.yaml
                    fontSize: 15, // Adjust the font size as needed
                    color: Color.fromARGB(255, 0, 26, 156),
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: const Text(
                  "Inflation significantly impacts retirement savings by eroding the purchasing power of accumulated funds. This poses a challenge for retirees who depend on fixed-income sources, as the real value of their savings diminishes over time. To counteract this effect, retirees often turn to investments that historically outpace inflation, such as stocks or inflation-protected securities. Moreover, periodic adjustments to retirement income streams become crucial in maintaining financial stability amidst the changing economic landscape.",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  "Yearly Retirement Expense Estimation",
                  style: TextStyle(
                    fontFamily:
                        'YesevaOne', // Font family as declared in pubspec.yaml
                    fontSize: 15, // Adjust the font size as needed
                    color: Color.fromARGB(255, 0, 26, 156),
                  ),
                ),
              ),

              const CalculatorForm(),

              Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  "Saving Strategies",
                  style: TextStyle(
                    fontFamily:
                        'YesevaOne', // Font family as declared in pubspec.yaml
                    fontSize: 15, // Adjust the font size as needed
                    color: Color.fromARGB(255, 0, 26, 156),
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: const Text(
                  "In casually gauging the adequacy of your current savings, it's worthwhile to consider potential impacts of inflation on your financial security. To enhance your financial resilience, explore additional savings strategies such as diversifying investments, maximizing contributions to employer-sponsored retirement plans, and exploring long-term investment options. Taking a measured approach to evaluating and fortifying your savings can contribute to a more secure and comfortable financial future.",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  "Retirement Plans",
                  style: TextStyle(
                    fontFamily:
                        'YesevaOne', // Font family as declared in pubspec.yaml
                    fontSize: 15, // Adjust the font size as needed
                    color: Color.fromARGB(255, 0, 26, 156),
                  ),
                ),
              ),

              //Organizing the different retirement plans as sub sub headings + information about each
              Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "401(k)",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "A popular employer-sponsored plan that allows employees to contribute a portion of their salary, often with employer matching.",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "IRA",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "A personal retirement account that provides individuals with tax advantages for saving for retirement.",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "Pensions",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      " A retirement plan where employees receive a fixed sum upon retirement, often based on their salary and years of service.",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class CalculatorForm extends StatefulWidget {
  const CalculatorForm({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorFormState createState() => _CalculatorFormState();
}

class _CalculatorFormState extends State<CalculatorForm> {
  //text editor controllers for user inputs
  final TextEditingController livingExpensesController =
      TextEditingController();
  final TextEditingController healthcareController = TextEditingController();
  final TextEditingController leisureActivitiesController =
      TextEditingController();
  final TextEditingController otherExpensesController = TextEditingController();

  double totalEstimate = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildExpenseField("Living", livingExpensesController),
        _buildExpenseField("Healthcare", healthcareController),
        _buildExpenseField("Leisure Activities", leisureActivitiesController),
        _buildExpenseField("Other Expenses", otherExpensesController),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            setState(() {
              totalEstimate = calculateTotalEstimate();
            });
          },
          child: const Text('Estimate Total'),
        ),
        const SizedBox(height: 16.0),
        Container(
          margin: const EdgeInsets.only(bottom: 16.0),
          child: Text(
            'Total Estimate: \$${totalEstimate.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildExpenseField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }

  double calculateTotalEstimate() {
    final double living = double.tryParse(livingExpensesController.text) ?? 0.0;
    final double healthcare = double.tryParse(healthcareController.text) ?? 0.0;
    final double leisure =
        double.tryParse(leisureActivitiesController.text) ?? 0.0;
    final double otherExpenses =
        double.tryParse(otherExpensesController.text) ?? 0.0;

    return living + healthcare + leisure + otherExpenses;
  }
}

void main() {
  runApp(const MaterialApp(
    home: Retirement(),
  ));
}
