import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

void main(){
  runApp(
    BlocProvider(
      builder: (context) => MyBloc(),
      child: MyApp(),
    )
  );
}

/// Events on the pages
enum MyEvent{ eventLogin, eventSelfie, eventVerify, eventTransaction, eventDashboard}

/// States
abstract class MyState{}

class StateLogin extends MyState {}

class StateSelfie extends MyState {}

class StateVerify extends MyState {}

class StateTransaction extends MyState {}

class StateDashboard extends MyState {}


/// Bloc
class MyBloc extends Bloc<MyEvent, MyState> {
  @override
  MyState get initialState => StateLogin();

  @override
  Stream<MyState> mapEventToState(MyEvent event) async* {
    switch (event){
      case MyEvent.eventLogin:
        yield StateLogin();
        break;
      case MyEvent.eventSelfie:
        yield StateSelfie();
        break;
      case MyEvent.eventVerify:
        yield StateVerify();
        break;
      case MyEvent.eventTransaction:
        yield StateTransaction();
        break;
      case MyEvent.eventDashboard:
        yield StateDashboard();
        break;
    }
  }
}

/// App
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<MyBloc, MyState>(
          builder: (context, state){
            Widget currentWidget;
            if(state is StateLogin){
              currentWidget = LoginPage();
              return currentWidget;
            }
            if(state is StateSelfie){
              return SelfiePage();
            }
            if(state is StateVerify){
              return VerifyPage();
            }
            if(state is StateTransaction){
              return TransactionPage();
            }
            if(state is StateDashboard){
              return DashboardPage();
            }

            return currentWidget;
          }
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login')
      ),
      body: Center(
        child: RaisedButton(
            child: Text("Selfie Screen"),
            onPressed: (){
              BlocProvider.of<MyBloc>(context).dispatch(MyEvent.eventSelfie);
            }

        ),
      ),
    );
  }
}

class SelfiePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Selfie')
      ),
      body: Center(
        child: RaisedButton(
            child: Text("Verify Screen"),
            onPressed: (){
              BlocProvider.of<MyBloc>(context).dispatch(MyEvent.eventVerify);
            }

        ),
      ),
    );
  }
}

class VerifyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Verify')
      ),
      body: Center(
        child: RaisedButton(
            child: Text("Transaction Screen"),
            onPressed: (){
              BlocProvider.of<MyBloc>(context).dispatch(MyEvent.eventTransaction);
            }

        ),
      ),
    );
  }
}

class TransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Transaction')
      ),
      body: Center(
        child: RaisedButton(
            child: Text("Dashboard Screen"),
            onPressed: (){
              BlocProvider.of<MyBloc>(context).dispatch(MyEvent.eventDashboard);
            }

        ),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Dashboard')
      ),
      body: Center(
        child: RaisedButton(
            child: Text("Login Screen"),
            onPressed: (){
              BlocProvider.of<MyBloc>(context).dispatch(MyEvent.eventLogin);
            }
        ),
      ),
    );
  }
}