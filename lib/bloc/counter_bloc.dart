import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterEvents { increment, decrement }

class CounterBloc extends Bloc<CounterEvents, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvents event) async* {
    switch (event) {
      case CounterEvents.increment:
        yield state + 1;
        break;
      case CounterEvents.decrement:
        yield state - 1;
        break;
    }
  }

  @override
  void onTransition(Transition<CounterEvents, int> transition) {
    print('Getted Event: ${transition.event}');
    print('Current State: ${transition.currentState}');
    print('Next State: ${transition.nextState}');
    super.onTransition(transition);
  }
}

class CounterBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    print(stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}
