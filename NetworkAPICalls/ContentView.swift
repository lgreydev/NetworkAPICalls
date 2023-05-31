//
//  ContentView.swift
//  NetworkAPICalls
//
//  Created by Sergey Lukaschuk on 2023-05-31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (spacing: 20){
            Circle()
                .foregroundColor(.secondary)
                .frame(width: 120, height: 120)
            
            Text("User Name")
                .bold()
                .font(.title3)
            
            Text("Bio")
                .font(.footnote)
            
            Spacer()
            
        }
        .padding()
    }
    
    func getUser() async throws -> GitHubUser {
        let endpoint = "https://api.github.com/users/lgreydev"
        
        guard let url = URL(string: endpoint) else {
            throw GitHubError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GitHubError.invalidResponse
        }
        
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(GitHubUser.self, from: data)
        } catch {
            throw GitHubError.invalidData
        }
        
        
    }
}

struct GitHubUser: Codable {
    let login: String
    let avatarUrl: String
    let bio: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum GitHubError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
