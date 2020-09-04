import 'package:bloc/bloc.dart';
import 'package:states_mgmt_demo/BLoC/blocEventClasses.dart';
import 'package:states_mgmt_demo/BLoC/blocStateClasses.dart';


//DETAILED IMPLEMENTATION OF BLOC
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



//BRIEF IMPLEMENTATION OF BLOC
enum newCounterEventBloc{increment,decrement}
// ignore: camel_case_types
class newCounterBloc extends Bloc<newCounterEventBloc,int>
{
  newCounterBloc():super(0);

  @override
  Stream<int>mapEventToState(newCounterEventBloc event)async*{
    if(event == newCounterEventBloc.increment)
      yield state + 1;
    else
      yield state - 1;
  }
}