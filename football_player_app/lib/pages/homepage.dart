import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_player_app/bloc/player_listing_bloc.dart';
import 'package:football_player_app/pages/player_listing.dart';
import 'package:football_player_app/services/repository.dart';
import 'package:football_player_app/themes/themes.dart';
import 'package:football_player_app/widgets/horizontal_bar.dart';
import 'package:football_player_app/widgets/search_bar.dart';
import 'advance_search_page.dart';

class HomePage extends StatefulWidget {
  final PlayerRepository playerRepository;

  HomePage({this.playerRepository});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  PlayerListingBloc _playerListingBloc;

  @override
  void initState() {
    super.initState();
    _playerListingBloc =
        PlayerListingBloc(playerRepository: widget.playerRepository);
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _playerListingBloc,
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AdvancedSearchPage()));
            },
            icon: Icon(Icons.filter_list),
            label: Text("Advanced Search")
        ),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            'Football Players',
            style: appBarTextStyle,
          ),
        ),
        body: Column(
          children: <Widget>[
            HorizontalBar(),
            SizedBox(height: 10.0),
            SearchBar(),
            SizedBox(height: 10.0),
            PlayerListing()
          ],
        ),
      ),
    );
  }
}

