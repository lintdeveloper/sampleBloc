import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc/bloc/player_listing_bloc.dart';
import 'package:sample_bloc/screens/player_listing.dart';
import 'package:sample_bloc/services/repository.dart';
import 'package:sample_bloc/themes/themes.dart';
import 'package:sample_bloc/widgets/horizontal_bar.dart';
class HomeScreen extends StatefulWidget {

  final PlayerRepository playerRepository;

  HomeScreen({this.playerRepository});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  PlayerListingBloc _playerListingBloc;

  @override
  void initState() {
    super.initState();
    _playerListingBloc = PlayerListingBloc(playerRepository: widget.playerRepository);
  }

  @override
  void didUpdateWidget(HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (contex)=> _playerListingBloc,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text("Football Players", style: appBarTextStyle,),
        ),
        body: Column(
         children: <Widget>[
           HorizontalBar(),
           SizedBox(height: 10.0),
           PlayerListing()
         ],
        ),
      ),
    );
  }
}