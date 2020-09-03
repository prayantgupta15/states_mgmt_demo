import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:states_mgmt_demo/Provider/modelClass.dart';
import 'package:states_mgmt_demo/common.dart';
//---------------------------STEPS INVOLVED:------------------------------------
//1 NOTIFYING THE CHANGES  by ModelCLass
//2 ACCESSING THE CHANGES in Widget Tree by Provider (ChangNotifierProvider). Can use MultiProvider multiple providers listeners
//3 MAKING AND LISTENING TO THE CHANGES by Provider.of<> OR Consumer
//--------------------------------------------------------------------------------

// ignore: non_constant_identifier_names
ProviderMainScreen() {
  return MaterialApp(
    //STEP 2: ACCESSING THE CHANGES
    home: ChangeNotifierProvider<ModelClass>(
        create: (context) => ModelClass(), child: ProviderScreen()),
  );
}

class ProviderScreen extends StatelessWidget {
  int ctr = 0;
  @override
  Widget build(BuildContext context) {
     print('build');print((ctr++).toString());
    //STEP 3: MAKING AND LISTENING TO CHANGES
//   METHOD 1: Using Provider.of<>
//   final ModelClass _modelClass = Provider.of<ModelClass>(context,listen: true);
    return SafeArea(
      child: Scaffold(
        //METHOD 2: Using Consumer
        body:
        Consumer<ModelClass>(
          builder: (BuildContext context, ModelClass _modelClass, Widget child)=>
            Center(
             child: Text(_modelClass.getScore.toString(),style: textStyle,),
          ),
        ),
        floatingActionButton:
        Consumer<ModelClass>(
          builder: (BuildContext context, ModelClass _modelClass, Widget child)=>
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FloatingActionButton(
                heroTag: null,
                child: Icon(Icons.add),
                onPressed: () => _modelClass.increment(),
              ),
              FloatingActionButton(
                heroTag: null,
                child: Icon(Icons.remove),
                onPressed: () => _modelClass.decrement(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
