//
//  ContentView.swift
//  Braven Capstone
//
//  Root navigation. Splash → tabbed interface that keeps the familiar
//  Home / Schedule / Gameday / Tickets / More structure but replaces the
//  cluttered pages underneath.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true

    var body: some View {
        ZStack {
            if showSplash {
                SplashView()
                    .transition(.opacity)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                            withAnimation { showSplash = false }
                        }
                    }
            } else {
                MainTabs()
                    .transition(.opacity)
            }
        }
    }
}

private struct SplashView: View {
    var body: some View {
        ZStack {
            Color.sixersBlue.ignoresSafeArea()
            Image("76splashPage")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        }
    }
}

private struct MainTabs: View {
    var body: some View {
        TabView {
            NavigationStack { FanZoneView() }
                .tabItem { Label("Home", systemImage: "house.fill") }

            NavigationStack { SchedulePlaceholder() }
                .tabItem { Label("Schedule", systemImage: "calendar") }

            NavigationStack { gameDayView() }
                .tabItem { Label("Gameday", systemImage: "basketball.fill") }

            NavigationStack { TicketsPlaceholder() }
                .tabItem { Label("Tickets", systemImage: "ticket.fill") }

            NavigationStack { originalView() }
                .tabItem { Label("More", systemImage: "ellipsis.circle.fill") }
        }
        .tint(.sixersBlue)
    }
}

private struct SchedulePlaceholder: View {
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "calendar")
                .font(.system(size: 60))
                .foregroundStyle(Color.sixersBlue)
            Text("Schedule")
                .font(.largeTitle).bold()
                .foregroundStyle(Color.sixersNavy)
            Text("Full season schedule lives here.")
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle("Schedule")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct TicketsPlaceholder: View {
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "ticket.fill")
                .font(.system(size: 60))
                .foregroundStyle(Color.sixersRed)
            Text("Tickets")
                .font(.largeTitle).bold()
                .foregroundStyle(Color.sixersNavy)
            Text("Buy, transfer, and manage your seats.")
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle("Tickets")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView()
}
