import 'package:bloc/bloc.dart';
import 'package:football_player_app/bloc/player_listing_events.dart';
import 'package:football_player_app/bloc/player_listing_states.dart';
import 'package:football_player_app/models/api_models.dart';
import 'package:football_player_app/services/repository.dart';
import 'package:rxdart/rxdart.dart';

class PlayerListingBloc extends Bloc<PlayerListingEvent, PlayerListingState> {
  final PlayerRepository playerRepository;

  PlayerListingBloc({this.playerRepository}) : assert(playerRepository != null);

  @override
  Stream<PlayerListingEvent> transform(Stream<PlayerListingEvent> events) {
    return (events as PublishSubject<PlayerListingEvent>)
        .transform(DebounceStreamTransformer(Duration(milliseconds: 250)));
  }


  @override
  void onTransition(Transition<PlayerListingEvent, PlayerListingState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  // TODO: implement initialState
  PlayerListingState get initialState => PlayerUninitializedState();

  @override
  Stream<PlayerListingState> mapEventToState(
      PlayerListingState currentState, PlayerListingEvent event) async* {
    print("mapEventToState");
    yield PlayerFetchingState();
    try {
      List<Players> players;
      if (event is CountrySelectedEvent) {
        players = await playerRepository
            .fetchPlayersByCountry(event.nationModel.countryId);
      } else if (event is SearchTextChangedEvent) {
        print("hitting service");
        players = await playerRepository.fetchPlayersByName(event.searchTerm);
      }
      if (players.length == 0) {
        yield PlayerEmptyState();
      } else {
        yield PlayerFetchedState(players: players);
      }
    } catch (_) {
      yield PlayerErrorState();
    }
  }
}
