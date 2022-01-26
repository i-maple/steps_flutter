// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MySteps()));
}

// Stateful Widget is defined to set states of steps
class MySteps extends StatefulWidget {
  const MySteps({Key? key}) : super(key: key);

  @override
  _MyStepsState createState() => _MyStepsState();
}

class _MyStepsState extends State<MySteps> {
  // _currentSteps is initialized to track steps
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // scrollable listview to avoid rendering error
      body: ListView(
        children: [
          // Our main stepper widget comes into play. Its only required property is
          // steps which takes List of Step
          Stepper(
            steps: [
              Step(
                // Title as its name suggest is title of step
                title: Text('Step1'),
                // Content is description or body of step
                content: Text('Content of Step 1'),
              ),
              Step(
                title: Text('Step2'),
                content: Text('Content of Step 2'),
              ),
              Step(
                title: Text('Step3'),
                content: Text('Content of Step 3'),
              )
            ],
            // OnStepContinue takes a void callback function which gets triggered when users presses continue button
            onStepContinue: () {
              // state is used to update state of widgets
              setState(() {
                // here 2 is size of steps or number of steps. This is done to avoid app from crashing. You can specify it the way you like
                if (_currentStep < 2) {
                  _currentStep++;
                }
              });
            },
            // onStepTapped is also a void callback but takes integer as an argument. It gets fired when we want to go to any step directly. index(value) is index of current step
            onStepTapped: (int value) {
              setState(
                () {
                  _currentStep = value;
                },
              );
            },
            // onStepCancel is triggered when user taps on Cancel button
            onStepCancel: () {
              // the condition below is applied to make cancel button functionless when index is 0
              if (_currentStep > 0) {
                _currentStep++;
              }
            },
            // currentStep is used to track the index of current step which is active
            currentStep: _currentStep,
          ),
        ],
      ),
    );
  }
}
