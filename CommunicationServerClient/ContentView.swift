//
//  ContentView.swift
//  CommunicationServerClient
//
//  Created by Arun Patwardhan on 21/10/26.
//

import SwiftUI

struct ContentView: View {
    var viewModel : ContentViewVM   = ContentViewVM()
    
    var body: some View {
        VStack {
            Button("Get") {
                self.viewModel.initiateCommunication(task: {})
            }
            .padding()
            
            Button("Post") {
                self.viewModel.sendSomeData(input: "Sending this message from the test app on \(Date.now)")
            }
        }
    }
}

#Preview {
    ContentView()
}
