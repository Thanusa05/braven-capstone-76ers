//
//  perksView.swift
//  Braven Capstone
//
//  Perks — points bar on top (live-game quarter + clock), three sections:
//  Location-Based Perks, Earn Points & Free Games, Insider Access. Red
//  floating + to add perks from partners.
//

import SwiftUI

struct perksView: View {
    @State private var points: Int = 36

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    Image("76perks")
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 16))

                    pointsBar

                    locationBasedCard
                    earnPointsCard
                    insiderAccessCard
                }
                .padding(16)
                .padding(.bottom, 96)
            }
            .background(Color.white)

            Button {
                withAnimation(.spring()) { points += 10 }
            } label: {
                Image(systemName: "plus")
                    .font(.title2).bold()
                    .foregroundStyle(.white)
                    .frame(width: 56, height: 56)
                    .background(Color.sixersRed)
                    .clipShape(Circle())
                    .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 3)
            }
            .padding(.trailing, 20)
            .padding(.bottom, 20)
        }
        .navigationTitle("Perks")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var pointsBar: some View {
        VStack(spacing: 2) {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("YOU")
                        .font(.headline)
                        .foregroundStyle(.white)
                    Text("\(points)")
                        .font(.system(size: 44, weight: .bold, design: .rounded))
                        .foregroundStyle(Color(hex: "34C759"))
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 2) {
                    Text("NEXT REWARD")
                        .font(.headline)
                        .foregroundStyle(.white)
                    Text("150")
                        .font(.system(size: 44, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                }
            }
            Text("Q2    |    06:32")
                .font(.system(.subheadline, design: .monospaced))
                .foregroundStyle(.white.opacity(0.8))
                .padding(.top, 2)
        }
        .padding(18)
        .background(Color.sixersBlue)
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }

    private var locationBasedCard: some View {
        PerksCard(header: {
            HStack(spacing: 10) {
                ZStack {
                    Circle().fill(Color.sixersRed).frame(width: 34, height: 34)
                    Image(systemName: "key.fill")
                        .foregroundStyle(.white)
                        .rotationEffect(.degrees(-45))
                }
                Text("Location-Based Perks")
                    .font(.title3).bold()
                    .foregroundStyle(Color.sixersBlue)
            }
        }, content: {
            Text("Get exclusive concession discounts and enter raffles when you're near the stadium or tailgating. Raffles are drawn at halftime!")
                .foregroundStyle(.primary)
        })
    }

    private var earnPointsCard: some View {
        PerksCard(header: {
            Text("Earn Points & Free Games")
                .font(.title3).bold()
                .foregroundStyle(Color.sixersBlue)
        }, content: {
            VStack(alignment: .leading, spacing: 10) {
                Text("Want free points? Play games here")
                    .font(.headline)
                Text("Answer trivia and solve puzzles to earn points!")
                    .foregroundStyle(.primary)
                Button {} label: {
                    Text("Play Now!")
                        .font(.headline).bold()
                        .foregroundStyle(.white)
                        .padding(.horizontal, 18).padding(.vertical, 10)
                        .background(Color.sixersRed)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .buttonStyle(.plain)
            }
        })
    }

    private var insiderAccessCard: some View {
        PerksCard(header: {
            Text("Insider Access")
                .font(.title3).bold()
                .foregroundStyle(Color.sixersBlue)
        }, content: {
            VStack(alignment: .leading, spacing: 10) {
                BulletRow(text: "Exclusive player interviews and cameos")
                BulletRow(text: "Live game chatrooms")
                BulletRow(text: "Unlock videos with points!")
                Button {} label: {
                    Text("Vibes from the Court")
                        .font(.headline).bold()
                        .foregroundStyle(.white)
                        .padding(.horizontal, 18).padding(.vertical, 10)
                        .background(Color.sixersBlue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .buttonStyle(.plain)
            }
        })
    }
}

private struct PerksCard<Header: View, Content: View>: View {
    @ViewBuilder let header: () -> Header
    @ViewBuilder let content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            header()
            Divider()
            content()
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.black.opacity(0.08)))
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 2)
    }
}

private struct BulletRow: View {
    let text: String
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Text("•").bold()
                .foregroundStyle(Color.sixersBlue)
            Text(text)
        }
    }
}

#Preview {
    NavigationStack { perksView() }
}
