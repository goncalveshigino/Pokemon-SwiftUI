//
//  PokemonSearch_Tests.swift
//  PokemonAppTests
//
//  Created by Goncalves Higino on 27/03/24.
//

import Foundation

import XCTest
@testable import PokemonApp

class PokemonRepositorySearch_Tests: XCTestCase {
    
    var sut: PokemonRepository?
    var sutFailure: PokemonRepository?
    
    override func setUp() {
        super.setUp()
        sut = DefaultPokemonRepository(apiService: DetailsPokemonFakeApiServiceSuccess())
        sutFailure = DefaultPokemonRepository(apiService: PokemonFakeApiServiceFailure())
    }
    
    override func tearDown() {
        sut = nil
        sutFailure = nil
        super.tearDown()
    }
    
}



//MARK: - Success Test
extension PokemonRepositorySearch_Tests {
        
    func testSuccess_searchPokemon() async {
        sut?.getDetailedPokemon(name: "bulbasaur") { returnPokemon in
            
        }
    }
    
}


//MARK: - Failure Tests
extension PokemonRepositorySearch_Tests {
    
    func testFailureCase_getPokemonList() async {
        do {
           let _ = try await sutFailure?.getPokemon(pageNumber: nil)
            XCTFail("This test should throw an error")
        } catch {
            //test passed
        }
    }
}

