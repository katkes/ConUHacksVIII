// ignore_for_file: prefer_const_constructors

import 'BottomNav.dart';
import 'package:flutter/material.dart';

class Investment extends StatelessWidget {
  const Investment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Investment Opportunities',
          style: TextStyle(
            fontFamily: 'YesevaOne', // Font family as declared in pubspec.yaml
            fontSize: 20, // Adjust the font size as needed
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
                  "Tax-Free Savings Account (TFSA):",
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
                child: RichText(
                  // ignore: prefer_const_constructors
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 16.0, // Default font size
                      color: Colors.black, // Default text color
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Description: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'A TFSA is a tax-advantaged savings account in Canada where contributions grow tax-free, and withdrawals are tax-free.\n'),
                      TextSpan(
                          text: 'Benefits: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: '- Tax-free growth and withdrawals.\n'
                              '- Flexible contribution and withdrawal options.\n'
                              '- Can hold various types of investments.\n'),
                      TextSpan(
                          text: 'Aim: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'Provides a tax-efficient way to save for short-term and long-term financial goals, such as buying a home, education, or retirement.'),
                    ],
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
                  "Registered Retirement Savings Plan (RRSP):",
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
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 16.0, // Default font size
                      color: Colors.black, // Default text color
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Description: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'An RRSP is a tax-advantaged account in Canada designed to help Canadians save for retirement by providing tax benefits on contributions.\n'),
                      TextSpan(
                          text: 'Benefits: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: '- Tax-deductible contributions.\n'
                              '- Tax-deferred growth.\n'
                              '- Potential for lower taxes upon retirement.\n'),
                      TextSpan(
                          text: 'Aim: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'Primarily used for long-term retirement savings, but can also be used for the Home Buyers\' Plan or Lifelong Learning Plan in certain circumstances.'),
                    ],
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
                  "Stocks:",
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
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 16.0, // Default font size
                      color: Colors.black, // Default text color
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Description: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'Stocks represent ownership in a company, and investors buy shares of stock to participate in the company\'s success.\n'),
                      TextSpan(
                          text: 'Benefits: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: '- Potential for capital appreciation.\n'
                              '- Dividend income for certain stocks.\n'
                              '- Individual stock selection for targeted investments.\n'),
                      TextSpan(
                          text: 'Aim: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'To achieve long-term capital growth, generate income through dividends, and participate in the success of individual companies.'),
                    ],
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
                  "Exchange-Traded Funds (ETFs):",
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
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 16.0, // Default font size
                      color: Colors.black, // Default text color
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Description: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'ETFs are investment funds that are traded on stock exchanges and typically track a specific index or asset class.\n'),
                      TextSpan(
                          text: 'Benefits: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              '- Diversification across a broad range of assets.\n'
                              '- Lower fees compared to some mutual funds.\n'
                              '- Can be bought and sold like stocks throughout the trading day.\n'),
                      TextSpan(
                          text: 'Aim: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'To provide broad market exposure, diversification, and a cost-effective way to invest in various asset classes.'),
                    ],
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

void main() {
  runApp(const MaterialApp(
    home: Investment(),
  ));
}
