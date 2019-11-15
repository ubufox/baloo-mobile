import 'package:graphql_flutter/graphql_flutter.dart';


String getPokemon = """
  query GetPokemon {
    pokemon(name: "Pikachu") {
      id
      number
      name
      attacks {
        special {
          name
          type
          damage
        }
      }
    }
  }
""";

final QueryOptions GetPokemonQuery = QueryOptions(
  document: getPokemon,
);


