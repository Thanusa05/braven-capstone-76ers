//
//  gameDayView.swift
//  Braven Capstone
//
//  Game Day — Promos (Wells Fargo Center, Chase Center) tied to the fan's
//  current location, plus the Game Day Playlist where fans submit songs and
//  vote tracks up/down. Inspired by the interview quote "I love that because
//  it makes it feel like you're actually part of the game!"
//

import SwiftUI

struct gameDayView: View {
    @State private var songName = ""
    @State private var artistName = ""
    @State private var queue: [Song] = []
    @State private var recentlyPlayed: [Song] = [
        Song(title: "All the Stars", artist: "SZA",          thumbsUp: 0, thumbsDown: 0),
        Song(title: "Good News",     artist: "Mac Miller",   thumbsUp: 0, thumbsDown: 0),
        Song(title: "Massive",       artist: "Drake",        thumbsUp: 0, thumbsDown: 0),
        Song(title: "A.M. Radio",    artist: "The Lumineers",thumbsUp: 0, thumbsDown: 0),
        Song(title: "Meltdown",      artist: "Travis Scott", thumbsUp: 0, thumbsDown: 0),
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 18) {
                promosCard
                concessionButton
                playlistHeader
                playlistForm
                nextInQueue
                recentlyPlayedSection
            }
            .padding(16)
        }
        .background(Color.sixersBlue.ignoresSafeArea())
        .navigationTitle("Gameday")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.sixersBlue, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }

    private var promosCard: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Promos:")
                .font(.title3).bold()
                .foregroundStyle(.white)
            PromoCard(
                venue: "Wells Fargo Center",
                deal: "$5 off orders of $20+",
                blurb: "Enter before the game for a halftime draw!"
            )
            PromoCard(
                venue: "Chase Center",
                deal: "$3 off any combo meal",
                blurb: "Win exclusive merch at halftime!"
            )
        }
        .padding(18)
        .background(Color.sixersBlue)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(.white.opacity(0.15)))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }

    private var concessionButton: some View {
        Button {} label: {
            Text("🍔 Order ahead at\nconcession stands")
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
                .font(.title3).bold()
                .frame(maxWidth: .infinity)
                .padding(.vertical, 18)
                .background(Color.white.opacity(0.25))
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .buttonStyle(.plain)
    }

    private var playlistHeader: some View {
        HStack(spacing: 12) {
            Image(systemName: "basketball.fill")
                .font(.system(size: 44))
                .foregroundStyle(.white)
            Text("Game Day Playlist")
                .font(.system(size: 32, weight: .bold))
                .foregroundStyle(.white)
            Spacer()
        }
        .padding(.top, 6)
    }

    private var playlistForm: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Want your song next in the line-up? Enter here for a chance to hear your tune!")
                .font(.headline)
                .foregroundStyle(.white)

            TextField("", text: $songName, prompt: Text("Song Name").foregroundStyle(.white.opacity(0.7)))
                .padding()
                .background(Color.white.opacity(0.25))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .foregroundStyle(.white)

            TextField("", text: $artistName, prompt: Text("Artist Name").foregroundStyle(.white.opacity(0.7)))
                .padding()
                .background(Color.white.opacity(0.25))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .foregroundStyle(.white)

            Button(action: addSong) {
                HStack(spacing: 8) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(Color.sixersRed)
                    Text("Add Song")
                        .font(.title3).bold()
                        .foregroundStyle(Color.sixersRed)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .buttonStyle(.plain)
        }
    }

    private func addSong() {
        let s = songName.trimmingCharacters(in: .whitespaces)
        let a = artistName.trimmingCharacters(in: .whitespaces)
        guard !s.isEmpty else { return }
        queue.append(Song(title: s, artist: a.isEmpty ? "Unknown" : a, thumbsUp: 0, thumbsDown: 0))
        songName = ""
        artistName = ""
    }

    private var nextInQueue: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Next in Queue")
                .font(.title3).bold()
                .foregroundStyle(.white)
            if queue.isEmpty {
                VStack(spacing: 6) {
                    Image(systemName: "music.note.list")
                        .font(.system(size: 48))
                        .foregroundStyle(.white.opacity(0.5))
                    Text("No songs yet!")
                        .font(.subheadline).bold()
                        .foregroundStyle(.white.opacity(0.8))
                    Text("Add your game day bangers 🎵")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.8))
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 24)
            } else {
                ForEach($queue) { $song in
                    SongRow(song: $song)
                }
            }
        }
    }

    private var recentlyPlayedSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Recently Played")
                .font(.title3).bold()
                .foregroundStyle(.white)
            ForEach($recentlyPlayed) { $song in
                SongRow(song: $song)
            }
        }
    }
}

private struct PromoCard: View {
    let venue: String
    let deal: String
    let blurb: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(venue)
                .font(.title3).bold()
                .foregroundStyle(.white)
            Text(deal)
                .font(.headline)
                .foregroundStyle(.white)
            Text(blurb)
                .foregroundStyle(.white)
            HStack {
                Text("Apple Maps")
                    .foregroundStyle(Color(hex: "5AC8FA"))
                Spacer()
                Text("Google Maps")
                    .foregroundStyle(Color(hex: "34C759"))
            }
            .font(.headline)
            .padding(.top, 4)
        }
        .padding(18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.sixersRed)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

private struct SongRow: View {
    @Binding var song: Song

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(song.title).font(.title3).bold()
                    .foregroundStyle(.white)
                Text(song.artist)
                    .foregroundStyle(.white.opacity(0.9))
            }
            Spacer()
            Button { song.thumbsUp += 1 } label: {
                HStack(spacing: 4) {
                    Image(systemName: "hand.thumbsup.fill")
                        .foregroundStyle(.white)
                        .padding(8)
                        .background(Color(hex: "34C759"))
                        .clipShape(Circle())
                    Text("\(song.thumbsUp)")
                        .foregroundStyle(.white).bold()
                }
            }.buttonStyle(.plain)
            Button { song.thumbsDown += 1 } label: {
                HStack(spacing: 4) {
                    Image(systemName: "hand.thumbsdown.fill")
                        .foregroundStyle(.white)
                        .padding(8)
                        .background(Color(hex: "FF3B30"))
                        .clipShape(Circle())
                    Text("\(song.thumbsDown)")
                        .foregroundStyle(.white).bold()
                }
            }.buttonStyle(.plain)
        }
        .padding(14)
        .background(Color.sixersRed)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct Song: Identifiable {
    let id = UUID()
    var title: String
    var artist: String
    var thumbsUp: Int
    var thumbsDown: Int
}

#Preview {
    NavigationStack { gameDayView() }
}
