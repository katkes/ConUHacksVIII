import 'package:flutter/material.dart';
import 'BottomNav.dart';

class Student extends StatelessWidget {
  const Student({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Plan',
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
              // Subheading: How Inflation Affects Students
              Container(
                margin: const EdgeInsets.only(
                    bottom: 16.0), // Add margin to the bottom
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  "How Inflation Affects Students",
                  style: TextStyle(
                    fontFamily:
                        'YesevaOne', // Font family as declared in pubspec.yaml
                    fontSize: 15, // Adjust the font size as needed
                    color: Color.fromARGB(255, 0, 26, 156),
                  ),
                ),
              ),

              // Regular Text Section
              Container(
                margin: const EdgeInsets.only(
                    bottom: 16.0), // Add margin to the bottom
                child: const Text(
                  "Inflation has a profound impact on various aspects of our lives, and one area where its effects are keenly felt is in the realm of education. This section explores how inflation influences students, focusing on the rising costs of education, including tuition fees, textbook prices, and living expenses.",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),

              // Calculate Your Yearly Student Expenses Container
              Container(
                margin: const EdgeInsets.only(
                    bottom: 16.0), // Add margin to the bottom
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  "Calculate Your Yearly Student Expenses",
                  style: TextStyle(
                    fontFamily:
                        'YesevaOne', // Font family as declared in pubspec.yaml
                    fontSize: 20, // Adjust the font size as needed
                    color: Color.fromARGB(255, 0, 26, 156),
                  ),
                ),
              ),

              // CalculatorForm remains here
              const CalculatorForm(),

              // Consequences for Students Container
              Container(
                margin: const EdgeInsets.only(
                    bottom: 16.0), // Add margin to the bottom
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  "Consequences for Students",
                  style: TextStyle(
                    fontFamily:
                        'YesevaOne', // Font family as declared in pubspec.yaml
                    fontSize: 20, // Adjust the font size as needed
                    color: Color.fromARGB(255, 0, 26, 156),
                  ),
                ),
              ),

              // Consequences Text Section
              Container(
                margin: const EdgeInsets.only(
                    bottom: 16.0), // Add margin to the bottom
                child: const Text(
                  "Inflation exerts a dual consequence on students, contributing to a surge in student loan debt and introducing challenges in maintaining a budget amidst escalating educational costs. As expenses rise, students grapple with the enduring impact on their financial stability, necessitating strategic financial planning to navigate these fiscal challenges.",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    bottom: 16.0), // Add margin to the bottom
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  "Strategies to Mitigate Impact",
                  style: TextStyle(
                    fontFamily:
                        'YesevaOne', // Font family as declared in pubspec.yaml
                    fontSize: 20, // Adjust the font size as needed
                    color: Color.fromARGB(255, 0, 26, 156),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    bottom: 16.0), // Add margin to the bottom
                child: const Text(
                  "Exploring scholarship opportunities: Actively seeking and applying for scholarships can provide significant financial relief. Scholarships, grants, and other forms of financial aid can alleviate the burden of rising education costs, reducing reliance on loans.\n\n"
                  "Budgeting effectively to manage expenses: Developing and adhering to a comprehensive budget is essential. By carefully tracking income and expenses, students can identify areas where cost-cutting is possible and allocate resources judiciously. Effective budgeting empowers students to make informed financial decisions and navigate the financial impact of inflation with greater resilience.",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
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

// Rest of the code remains unchanged

class CalculatorForm extends StatefulWidget {
  const CalculatorForm({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorFormState createState() => _CalculatorFormState();
}

class _CalculatorFormState extends State<CalculatorForm> {
  final TextEditingController tuitionController = TextEditingController();
  final TextEditingController accommodationController = TextEditingController();
  final TextEditingController booksController = TextEditingController();
  final TextEditingController otherExpensesController = TextEditingController();

  double totalEstimate = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildExpenseField("Tuition", tuitionController),
        _buildExpenseField("Accommodation", accommodationController),
        _buildExpenseField("Books", booksController),
        _buildExpenseField("Other Expenses", otherExpensesController),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            // Calculate the total estimate when the button is pressed
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
    final double tuition = double.tryParse(tuitionController.text) ?? 0.0;
    final double accommodation =
        double.tryParse(accommodationController.text) ?? 0.0;
    final double books = double.tryParse(booksController.text) ?? 0.0;
    final double otherExpenses =
        double.tryParse(otherExpensesController.text) ?? 0.0;

    return tuition + accommodation + books + otherExpenses;
  }
}

void main() {
  runApp(const MaterialApp(
    home: Student(),
  ));
}
