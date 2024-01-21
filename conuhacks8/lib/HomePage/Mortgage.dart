import 'BottomNav.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Mortgage extends StatelessWidget {
  const Mortgage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mortgage Plan',
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
                  "How Inflation Influences Mortgage Rates",
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
                  "Inflation and interest rates dance in tandem. High inflation prompts central banks to raise interest rates, making borrowing costlier. Conversely, low inflation may lead to lower interest rates, encouraging borrowing and economic activity.\n\n"
                  "Mortgage rates, closely tied to interest rates, fluctuate with inflation. High inflation results in increased mortgage rates, raising monthly payments for borrowers. On the flip side, low inflation contributes to more affordable borrowing conditions, potentially making homeownership more accessible.",
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
                  "Monthly Mortgage Payment Estimation",
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
                  "Refinancing",
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
                  "Refinancing a mortgage can offer several benefits, including potentially securing a lower interest rate, reducing monthly payments, or accessing equity for other financial needs. However, it comes with risks, such as upfront costs and extending the loan term. To determine if refinancing is the right choice, individuals should carefully evaluate their financial goals, compare current and potential future mortgage terms, and consider the long-term impact on their overall financial situation before making a decision.",
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
                  "Types of Mortgages",
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
                      "Fixed-Mortgage",
                      style: TextStyle(
                        fontFamily:
                            'YesevaOne', // Font family as declared in pubspec.yaml
                        fontSize: 15, // Adjust the font size as needed
                        color: Color.fromARGB(255, 0, 26, 156),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      " A fixed-rate mortgage offers a stable interest rate and monthly payments over the entire loan term, providing predictability and protection against interest rate fluctuations. Consistent monthly payments and long-term stability.",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "Additional-Rate Morgage",
                      style: TextStyle(
                        fontFamily:
                            'YesevaOne', // Font family as declared in pubspec.yaml
                        fontSize: 15, // Adjust the font size as needed
                        color: Color.fromARGB(255, 0, 26, 156),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "An ARM has an interest rate that adjusts periodically based on market conditions. Initial rates are often lower than fixed-rate mortgages, but they can change over time. Initial lower rates, potential for rate adjustments.",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "FHA Loan",
                      style: TextStyle(
                        fontFamily:
                            'YesevaOne', // Font family as declared in pubspec.yaml
                        fontSize: 15, // Adjust the font size as needed
                        color: Color.fromARGB(255, 0, 26, 156),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "An FHA loan is insured by the government, making it more accessible to borrowers with lower credit scores and smaller down payments.",
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
  final TextEditingController interestRateController = TextEditingController();
  final TextEditingController principalController = TextEditingController();
  final TextEditingController loanTermController = TextEditingController();

  double totalEstimate = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildExpenseField("Monthly Interest Rate", interestRateController),
        _buildExpenseField("Principal", principalController),
        _buildExpenseField("Loan Term (years)", loanTermController),
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
    final double interestRate =
        double.tryParse(interestRateController.text) ?? 0.0;
    final double principal = double.tryParse(principalController.text) ?? 0.0;
    final double loanTerm = double.tryParse(loanTermController.text) ?? 0.0;

    // Convert annual interest rate to monthly and loan term to months
    final double monthlyInterestRate = interestRate / 12 / 100;
    final double loanTermMonths = loanTerm * 12;

    // Mortgage payment calculation formula
    final double monthlyPayment = principal *
        (monthlyInterestRate *
            (pow(1 + monthlyInterestRate, loanTermMonths)) /
            (pow(1 + monthlyInterestRate, loanTermMonths) - 1));

    // Return the calculated monthly mortgage payment
    return monthlyPayment;
  }
}

void main() {
  runApp(const MaterialApp(
    home: Mortgage(),
  ));
}
