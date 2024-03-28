//
//  PokemonRepository_Tests.swift
//  PokemonAppTests
//
//  Created by Goncalves Higino on 21/03/24.
//

import XCTest
@testable import PokemonApp

class PokemonRepository_Tests: XCTestCase {
    
    var sut: PokemonRepository?
    var sutFailure: PokemonRepository?
    
    override func setUp() {
        super.setUp()
        sut = DefaultPokemonRepository(apiService: PokemonFakeApiServiceSuccess())
        sutFailure = DefaultPokemonRepository(apiService: PokemonFakeApiServiceFailure())
    }
    
    override func tearDown() {
        sut = nil
        sutFailure = nil
        super.tearDown()
    }
    
}



//MARK: - Success Test
extension PokemonRepository_Tests {
    
    func testSuccess_ShouldRetornsAllPokemos() async {
        do {
            let response = try await sut?.getPokemon(pageNumber: nil)
            XCTAssertTrue(response?.results.first?.name == "bulbasaur")
        } catch {
            XCTFail("Always receive a response and not throw an error")
        }
    }
    
//    func testSuccess_DetailPokemon() async {
//        do {
//            let response = try await sut?.getDetailedPokemon(name: "bulbasaur")
//            XCTAssertTrue(response?.name == "bulbasaur")
//        } catch {
//            XCTFail("Always receive a response and not throw an error")
//        }
//    }

}


//MARK: - Failure Tests
extension PokemonRepository_Tests {
    
    func testFailureCase_getPokemonList() async {
        do {
           let _ = try await sutFailure?.getPokemon(pageNumber: nil)
            XCTFail("This test should throw an error")
        } catch {
            //test passed
        }
    }
}
