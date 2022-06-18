import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controler = TextEditingController();
  List<bool> _selection = [true, false, false];

  String tip='';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(tip.isNotEmpty)
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    tip,
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ,
              Text('Total Amount'),
              SizedBox(
                width: 70,
                child: TextField(
                  controller: controler,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(hintText: '\$100.00'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ToggleButtons(
                  children: [Text('10%'), Text('15%'), Text('20%')],
                  isSelected: _selection,
                  onPressed: updateSelection,
                ),
              ),
              TextButton(
                  onPressed:calculateTip,
                  child: Text('Calculate Tip'),
                  style: TextButton.styleFrom(
                      primary: Colors.white, // foreground
                      backgroundColor: Colors.green
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  void updateSelection(int selectedIndex) {
    setState(() {
      for (int i = 0; i < _selection.length; i++) {
        _selection[i] = selectedIndex == i;
      }
    });
  }
  void calculateTip(){
    final totalAmount = double.parse(controler.text);
    final selectedIndex = _selection.indexWhere((element) => element);
    final tipPercentages = [0.1,0.15,0.20][selectedIndex];
    final tipTotal = (totalAmount*tipPercentages).toStringAsFixed(2);
    setState(() {
      tip='\$$tipTotal';
    });
  }
}
