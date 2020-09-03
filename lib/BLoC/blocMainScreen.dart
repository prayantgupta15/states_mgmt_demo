import 'package:flutter/material.dart';
import 'package:states_mgmt_demo/BLoC/blocClass.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states_mgmt_demo/BLoC/blocEventClasses.dart';
import 'package:states_mgmt_demo/BLoC/blocStateClasses.dart';
import 'package:states_mgmt_demo/common.dart';

//----------------------------STEPS INVOLVED---------------------------------
//Step 1: Create BlocClass which extends the BlocEventBaseClass and BlocStateBaseClass.
//Step 2: BlocEventBaseClass:
//          Make Class for each events extending the BlocEvenBaseClass
//Step 3: BlocStateBaseClass
//          Make classes for each state extending the BlocStateBaseClass
//Step 4: Using BlocProvider Access the changes
//Step 5: Create sink(used to input events) using BlocProvider.of<>
//Step 6: Use Widget BlocBuilder<CounterBloc, CounterBlocState> which listens to state produced
//-------------------------------------------------------------------------------
class BlocMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider<CounterBloc>(
            create: (BuildContext context) => CounterBloc(),
            child: BlocScreen()));
  }
}

class BlocScreen extends StatelessWidget {
  CounterBloc _counterBlocSink;
  int a=0;
  @override
  Widget build(BuildContext context) {
    print("build"+(a++).toString());
    _counterBlocSink = BlocProvider.of<CounterBloc>(context);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FloatingActionButton(
              heroTag: null,
              child: Icon(Icons.add),
              onPressed: ()=>_counterBlocSink.add(IncrementEvent()),
            ),
            FloatingActionButton(
              heroTag: null,
              child: Icon(Icons.remove),
              onPressed:()=> _counterBlocSink.add(DecrementEvent()),
            )
          ],
        ),
        body: BlocBuilder<CounterBloc, BlocStateBaseClass>(
          builder: (BuildContext context, BlocStateBaseClass state) => Center(
            child: Text((state as CurrentValueState).ctr.toString(),style: textStyle,),
          ),
        ),
      ),
    );
  }
}
