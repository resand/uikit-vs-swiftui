//
//  HomeView.swift
//  SwiftUIExample
//
//  Created by René Sandoval on 29/05/25.
//

import SwiftUI

struct HomeView: View {
    @State private var items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    @State private var isRefreshing = false

    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                Text(item)
                    .padding(.vertical, 8)
            }
        }
        .navigationTitle("Home")
        .refreshable {
            await refreshData()
        }
    }

    private func refreshData() async {
        self.isRefreshing = true

        // Simulate network request
        try? await Task.sleep(nanoseconds: 2_000_000_000)

        withAnimation {
            items.append("New Item \(Int.random(in: 6...100))")
        }

        self.isRefreshing = false
    }
}
