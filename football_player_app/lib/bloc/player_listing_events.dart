import 'package:flutter/material.dart';
import 'package:football_player_app/models/nation.dart';

abstract class PlayerListingEvent {}

class CountrySelectedEvent extends PlayerListingEvent {
  final NationModel nationModel;

  CountrySelectedEvent({@required this.nationModel})
      : assert(nationModel != null);
}

class SearchTextChangedEvent extends PlayerListingEvent {
  final String searchTerm;

  SearchTextChangedEvent({this.searchTerm}) : assert(searchTerm != null);
}
