import 'package:meta/meta.dart';
import 'package:sample_bloc/models/nation.dart';

abstract class PlayerListingEvent {}

class CountrySelectedEvent extends PlayerListingEvent {
  final NationModel nationModel;

  CountrySelectedEvent({@required this.nationModel}) : assert(nationModel != null);
}