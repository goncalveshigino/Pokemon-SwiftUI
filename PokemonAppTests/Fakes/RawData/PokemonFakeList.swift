//
//  PokemonFakeList.swift
//  PokemonAppTests
//
//  Created by Goncalves Higino on 21/03/24.
//

import Foundation

class PokemonFakeList {
    
    static func makePokemonFakeListJson() -> Data {
        return Data("""
          {
              "count": 1302,
              "next": "https://pokeapi.co/api/v2/pokemon?offset=22&limit=20",
              "previous": "https://pokeapi.co/api/v2/pokemon?offset=0&limit=2",
              "results": [
                  {
                      "name": "venusaur",
                      "url": "https://pokeapi.co/api/v2/pokemon/3/"
                  },
                  {
                      "name": "charmander",
                      "url": "https://pokeapi.co/api/v2/pokemon/4/"
                  },
                  {
                      "name": "charmeleon",
                      "url": "https://pokeapi.co/api/v2/pokemon/5/"
                  },
                  {
                      "name": "charizard",
                      "url": "https://pokeapi.co/api/v2/pokemon/6/"
                  },
                  {
                      "name": "squirtle",
                      "url": "https://pokeapi.co/api/v2/pokemon/7/"
                  },
                  {
                      "name": "wartortle",
                      "url": "https://pokeapi.co/api/v2/pokemon/8/"
                  },
                  {
                      "name": "blastoise",
                      "url": "https://pokeapi.co/api/v2/pokemon/9/"
                  },
                  {
                      "name": "caterpie",
                      "url": "https://pokeapi.co/api/v2/pokemon/10/"
                  },
                  {
                      "name": "metapod",
                      "url": "https://pokeapi.co/api/v2/pokemon/11/"
                  },
                  {
                      "name": "butterfree",
                      "url": "https://pokeapi.co/api/v2/pokemon/12/"
                  },
                  {
                      "name": "weedle",
                      "url": "https://pokeapi.co/api/v2/pokemon/13/"
                  },
                  {
                      "name": "kakuna",
                      "url": "https://pokeapi.co/api/v2/pokemon/14/"
                  },
                  {
                      "name": "beedrill",
                      "url": "https://pokeapi.co/api/v2/pokemon/15/"
                  },
                  {
                      "name": "pidgey",
                      "url": "https://pokeapi.co/api/v2/pokemon/16/"
                  },
                  {
                      "name": "pidgeotto",
                      "url": "https://pokeapi.co/api/v2/pokemon/17/"
                  },
                  {
                      "name": "pidgeot",
                      "url": "https://pokeapi.co/api/v2/pokemon/18/"
                  },
                  {
                      "name": "rattata",
                      "url": "https://pokeapi.co/api/v2/pokemon/19/"
                  },
                  {
                      "name": "raticate",
                      "url": "https://pokeapi.co/api/v2/pokemon/20/"
                  },
                  {
                      "name": "spearow",
                      "url": "https://pokeapi.co/api/v2/pokemon/21/"
                  },
                  {
                      "name": "fearow",
                      "url": "https://pokeapi.co/api/v2/pokemon/22/"
                  }
              ]
          }
        """.utf8)
    }
    
    static func makePokemListJsonFakeParserError() -> Data {
        return Data("""
        {
          "count": 1302,
          "next": "https://pokeapi.co/api/v2/pokemon?offset=22&limit=20",
          "previous": "https://pokeapi.co/api/v2/pokemon?offset=0&limit=2"
        }
        """.utf8)
    }
}
