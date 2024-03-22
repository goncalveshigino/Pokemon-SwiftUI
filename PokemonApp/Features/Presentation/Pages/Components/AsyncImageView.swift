//
//  AsyncImageView.swift
//  PokemonApp
//
//  Created by Goncalves Higino on 21/03/24.
//

import SwiftUI

struct AsyncImageView: View {
    let url: URL
    
    @State private var image: UIImage?
    
    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                   
            } else {
                ProgressView()
                    .accentColor(.red)
            }
        }
        .onAppear {
            Task {
                image = try await downloadImage(url: url)
            }
        }
    }
    
    private func downloadImage(url: URL) async throws -> UIImage {
        let cache = DefaultNSCacheStorageDatasource<String, UIImage>()
        
        if let cacheImage = cache[url.absoluteString] {
            return cacheImage
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let image = UIImage(data: data) {
                cache[url.absoluteString] = image
                return image
            }
        } catch {
            throw ImageError.downloadFailed
        }
        
        throw ImageError.downloadFailed
    }
    
    enum ImageError: Error {
        case downloadFailed
    }
}


