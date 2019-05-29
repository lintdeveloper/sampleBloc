import 'package:bloc/bloc.dart';
import 'package:sample_bloc/bloc/player_listing_events.dart';
import 'package:sample_bloc/bloc/player_listing_states.dart';
import 'package:sample_bloc/models/api_models.dart';
import 'package:sample_bloc/services/repository.dart';

class PlayerListingBloc extends Bloc<PlayerListingEvent, PlayerListingState> {
  final PlayerRepository playerRepository;

  PlayerListingBloc({this.playerRepository}) : assert(playerRepository != null);

  @override
  PlayerListingState get initialState => PlayerUninitializedState();

  @override
  Stream<PlayerListingState> mapEventToState(PlayerListingEvent event) async* {
    if (event is CountrySelectedEvent) {
      yield PlayerFetchingState();
      try {
        final List<Players> players = await playerRepository
            .fetchPlayersByCountry(event.nationModel.countryId);
        if (players.length == 0) {
          yield PlayerEmptyState();
        } else {
          yield PlayerFetchedState(players: players);
        }
      }catch(_) {
        yield PlayerErrorState();
      }
    }
  }
}
