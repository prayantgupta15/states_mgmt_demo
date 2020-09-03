import 'package:bloc/bloc.dart';
import 'package:states_mgmt_demo/BLoC/blocEventClasses.dart';
import 'package:states_mgmt_demo/BLoC/blocStateClasses.dart';

class CounterBloc extends Bloc<BlocEventBaseClass,BlocStateBaseClass>{

  //SETTING INITIAL STATE
  CounterBloc() : super(CurrentValueState(ctr: 0));

  @override
  Stream<BlocStateBaseClass>mapEventToState(BlocEventBaseClass event)async*{

    if(event is IncrementEvent)
      {
        int currentValue = (state as CurrentValueState).ctr;
        int newValue = currentValue+1;
        yield CurrentValueState(ctr: newValue);
      }
    else if(event is DecrementEvent)
    {
        int currentValue = (state as CurrentValueState).ctr;
        int newValue = currentValue-1;
        yield CurrentValueState(ctr: newValue);
    }
  }
}