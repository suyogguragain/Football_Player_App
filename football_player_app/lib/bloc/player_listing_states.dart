import 'package:flutter/material.dart';
import 'package:football_player_app/models/api_models.dart';

abstract class PlayerListingState {}

class PlayerUninitializedState extends PlayerListingState{}

class PlayerFetchingState extends PlayerListingState{}

class PlayerFetchedState extends PlayerListingState{
  final List<Players> players;

  PlayerFetchedState({@required this.players}) : assert (players != null);

}

class PlayerErrorState extends PlayerListingState{}

class PlayerEmptyState extends PlayerListingState{}