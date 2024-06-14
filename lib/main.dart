import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Income Tax Calculator',
      theme: ThemeData(
        primaryColor: Colors.green,
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _incomeController = TextEditingController();
  TextEditingController _taxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Income Tax Calculator'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.grey.shade800, // Darker gray
              Colors.grey.shade200, // Lighter gray
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _incomeController,
                  decoration: InputDecoration(
                    labelText: 'Enter Income',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.attach_money),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    calculateTax();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Calculate Tax',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: _taxController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Income Tax',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateTax() {
    if (_incomeController.text.isNotEmpty) {
      double income = double.parse(_incomeController.text);
      double tax = calculateIncomeTax(income);
      _taxController.text = tax.toStringAsFixed(2);
    } else {
      _taxController.text = '';
    }
  }

  double calculateIncomeTax(double income) {
    // Example simple tax calculation: 20% of income
    return income * 0.2;
  }

  @override
  void dispose() {
    _incomeController.dispose();
    _taxController.dispose();
    super.dispose();
  }
}
