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
            let response = try await sut?.getPokemon(paginaNumber: nil)
            XCTAssertTrue(response?.results.first?.name == "venusaur")
        } catch {
            XCTFail("Always receive a response and not throw an error")
        }
    }
    
}
