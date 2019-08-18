import 'package:equatable/equatable.dart';
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
//enum MyEvent{ eventLogin, eventSelfie, eventVerify, eventTransaction, eventDashboard}

class MyEvent extends Equatable{
  MyEvent([List props = const []]) : super(props);
}

class EventLogin extends MyEvent {
  @override
  String toString() => 'Login';
}

class EventSelfie extends MyEvent {
  @override
  String toString() => 'Selfie';
}

class EventVerify extends MyEvent {
  @override
  String toString() => 'Verify';
}

class EventTransaction extends MyEvent {
  @override
  String toString() => 'Transaction';
}

class EventDashboard extends MyEvent {
  @override
  String toString() => 'Dashboard';
}


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

    if(event is EventLogin){
      yield StateLogin();
    }
    if(event is EventSelfie){
      yield StateSelfie();
    }
    if(event is EventVerify){
      yield StateVerify();
    }
    if(event is EventTransaction){
      yield StateTransaction();
    }
    if(event is EventDashboard){
      yield StateDashboard();
    }
  }
}

/// App
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      home: BlocBuilder<MyBloc, MyState>(
//          builder: (context, state){
//            Widget currentWidget;
//            if(state is StateLogin){
//              currentWidget = LoginPage();
//              return currentWidget;
//            }
//            if(state is StateSelfie){
//              return SelfiePage();
//            }
//            if(state is StateVerify){
//              return VerifyPage();
//            }
//            if(state is StateTransaction){
//              return TransactionPage();
//            }
//            if(state is StateDashboard){
//              return DashboardPage();
//            }
//
//            return currentWidget;
//          }
//      ),
    routes: {
      '/': (context) => LoginPage(),
      '/selfiePage' : (context) => SelfiePage(),
      '/verifyPage' : (context) => VerifyPage(),
      '/transactionPage' : (contex) => TransactionPage(),
      '/dashboardPage' : (context) => DashboardPage()
    },
      initialRoute: '/',
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myBloc = BlocProvider.of<MyBloc>(context);
    return BlocListener<MyBloc, MyState>(
      listener: (BuildContext context, MyState state){
        if(state is StateSelfie) {
          Navigator.of(context).pushNamed('/selfiePage');
        }
      },
      child: Scaffold(
        appBar: AppBar(
            title: Text('Login')
        ),
        body: Center(
          child: RaisedButton(
              child: Text("Selfie Screen"),
              onPressed: (){
                myBloc.dispatch(EventSelfie());
              }

          ),
        ),
      ),
    );
  }
}

class SelfiePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myBloc = BlocProvider.of<MyBloc>(context);
    return BlocListener<MyBloc, MyState>(
      listener: (BuildContext context, MyState state){
        if(state is StateSelfie) {
          Navigator.of(context).pushNamed('/selfiePage');
        }
      },
      child: Scaffold(
        appBar: AppBar(
            title: Text('Selfie')
        ),
        body: Center(
          child: RaisedButton(
              child: Text("Verify Screen"),
              onPressed: (){
                myBloc.dispatch(EventVerify());
              }

          ),
        ),
      ),
    );
  }
}

class VerifyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myBloc = BlocProvider.of<MyBloc>(context);
    return BlocListener<MyBloc, MyState>(
      listener: (BuildContext context, MyState state){
        if(state is StateSelfie) {
          Navigator.of(context).pushNamed('/selfiePage');
        }
      },
      child: Scaffold(
        appBar: AppBar(
            title: Text('Verify')
        ),
        body: Center(
          child: RaisedButton(
              child: Text("Transaction Screen"),
              onPressed: (){
                myBloc.dispatch(EventTransaction());
              }

          ),
        ),
      ),
    );
  }
}

class TransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myBloc = BlocProvider.of<MyBloc>(context);
    return BlocListener<MyBloc, MyState>(
      listener: (BuildContext context, MyState state){
        if(state is StateSelfie) {
          Navigator.of(context).pushNamed('/selfiePage');
        }
      },
      child: Scaffold(
        appBar: AppBar(
            title: Text('Transaction')
        ),
        body: Center(
          child: RaisedButton(
              child: Text("Dashboard Screen"),
              onPressed: (){
                myBloc.dispatch(EventDashboard());
              }
          ),
        ),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myBloc = BlocProvider.of<MyBloc>(context);
    return BlocListener<MyBloc, MyState>(
      listener: (BuildContext context, MyState state){
        if(state is StateSelfie) {
          Navigator.of(context).pushNamed('/selfiePage');
        }
      },
      child: Scaffold(
        appBar: AppBar(
            title: Text('Dashboard')
        ),
        body: Center(
          child: RaisedButton(
              child: Text("Login Screen"),
              onPressed: (){
                myBloc.dispatch(EventLogin());
              }
          ),
        ),
      ),
    );
  }
}