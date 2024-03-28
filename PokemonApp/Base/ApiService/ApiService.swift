//
//  ApiService.swift
//  PokemonApp
//
//  Created by Goncalves Higino on 21/03/24.
//

import Foundation

protocol ApiService {
    func getDataFromGetRequest<Response: Codable>(from url: String) async throws -> Response
    func fetchData<T: Codable>(url: String, model: T.Type, completion:@escaping(T) -> (), failure:@escaping(Error) -> ())
}


class DefaultApiService: ApiService {
    
    func fetchData<T : Codable>(url: String, model: T.Type, completion: @escaping (T) -> (), failure: @escaping (Error) -> ())  {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                if let error = error { failure(error) }
                return
            }
            
            do {
                let serverData = try JSONDecoder().decode(T.self, from: data)
                completion((serverData))
            } catch {
                failure(error)
            }
        }.resume()
    }
    
    func getDataFromGetRequest<Response: Codable>(from url: String) async throws -> Response  {
        guard let url = URL(string: url) else {
            throw AppError.invalidUrl
        }
        
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode(Response.self, from: data)
        } catch {
            if (error as? DecodingError) != nil {
                throw AppError.parseError
            }
            throw AppError.serviceError(error: error)
        }
    }
    
}
