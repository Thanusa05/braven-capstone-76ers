//
//  FanZoneView.swift
//  Braven Capstone
//
//  The "FANS" home — a customizable stack of sections that replaces the
//  cluttered original home. Fans add/remove sections via the floating +.
//

import SwiftUI

struct FanZoneView: View {
    @State private var showCustomize = false

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack(spacing: 0) {
                    FansHeader()
                    VStack(alignment: .leading, spacing: 20) {
                        URWordSection()
                        SectionBlock(title: "GAMES", imageName: "76games", navTitle: "Games", caption: "Play the Spectrum Sprint to earn points.", height: 170)
                        HStack(spacing: 14) {
                            SquareSectionBlock(title: "SPOTLIGHT", imageName: "76spotlight", navTitle: "Spotlight")
                            SquareSectionBlock(title: "MULTIMEDIA", imageName: "76multimedia", navTitle: "Multimedia")
                        }
                        SectionBlock(title: "JR. 76ERS KIDS CLUB", imageName: "76kids", navTitle: "Kids Club", caption: "JOIN THE FUN!", height: 170)
                        HStack(spacing: 14) {
                            SquareSectionBlock(title: "COMMUNITY", imageName: "76community", navTitle: "Community")
                            SquareSectionBlock(title: "SPONSORS", imageName: "76sponser", navTitle: "Sponsors")
                        }
                        SectionBlock(title: "SHOP", imageName: "76shop", navTitle: "Shop", caption: "Official merch + fan-exclusive drops.", height: 170)
                        PerksEntry()
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    .padding(.bottom, 96)
                }
                .frame(maxWidth: .infinity)
            }
            .background(Color.white)

            Button { showCustomize = true } label: {
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
        .navigationBarHidden(true)
        .sheet(isPresented: $showCustomize) { CustomizeSheet() }
    }
}

// MARK: - Reusable framed image (width = container, height = explicit, clipped)

private struct FramedImage: View {
    let name: String
    let height: CGFloat
    var cornerRadius: CGFloat = 0

    var body: some View {
        Color.clear
            .frame(height: height)
            .overlay(
                Image(name)
                    .resizable()
                    .scaledToFill()
            )
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}

// MARK: - Header

private struct FansHeader: View {
    var body: some View {
        ZStack {
            Color.sixersBlue
            Text("FANS")
                .font(.title3).bold()
                .foregroundStyle(.white)
                .tracking(2)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 56)
    }
}

// MARK: - UR Word (hero Game Day banner)

private struct URWordSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("UR WORD")
                .font(.title2).bold()
                .foregroundStyle(Color.sixersBlue)
            NavigationLink(destination: gameDayView()) {
                ZStack(alignment: .bottomLeading) {
                    FramedImage(name: "76games", height: 210, cornerRadius: 12)
                    LinearGradient(colors: [.black.opacity(0.55), .clear],
                                   startPoint: .bottom, endPoint: .top)
                        .frame(height: 80)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    Text("GAME DAY")
                        .font(.largeTitle).bold()
                        .foregroundStyle(.white)
                        .shadow(color: .black.opacity(0.5), radius: 4)
                        .padding(14)
                }
            }
            .buttonStyle(.plain)
        }
    }
}

// MARK: - Wide section

private struct SectionBlock: View {
    let title: String
    let imageName: String
    let navTitle: String
    let caption: String
    let height: CGFloat

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.title3).bold()
                .foregroundStyle(Color.sixersBlue)
            NavigationLink(destination: GenericDetail(title: navTitle, imageName: imageName)) {
                ZStack(alignment: .bottomLeading) {
                    FramedImage(name: imageName, height: height, cornerRadius: 12)
                    LinearGradient(colors: [.black.opacity(0.55), .clear],
                                   startPoint: .bottom, endPoint: .top)
                        .frame(height: 70)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    Text(caption)
                        .font(.subheadline).bold()
                        .foregroundStyle(.white)
                        .shadow(color: .black.opacity(0.5), radius: 3)
                        .padding(14)
                }
            }
            .buttonStyle(.plain)
        }
    }
}

// MARK: - Half-width square section

private struct SquareSectionBlock: View {
    let title: String
    let imageName: String
    let navTitle: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.headline).bold()
                .foregroundStyle(Color.sixersBlue)
            NavigationLink(destination: GenericDetail(title: navTitle, imageName: imageName)) {
                FramedImage(name: imageName, height: 140, cornerRadius: 12)
            }
            .buttonStyle(.plain)
        }
    }
}

// MARK: - Perks entry card

private struct PerksEntry: View {
    var body: some View {
        NavigationLink(destination: perksView()) {
            HStack(spacing: 14) {
                Image("76perks")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                VStack(alignment: .leading, spacing: 2) {
                    Text("PERKS")
                        .font(.title3).bold()
                        .foregroundStyle(Color.sixersBlue)
                    Text("Geofenced deals · trivia · insider access")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .lineLimit(2)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.sixersBlue)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.sixersBlue.opacity(0.2)))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Generic detail

private struct GenericDetail: View {
    let title: String
    let imageName: String
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 14) {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                Text(title)
                    .font(.largeTitle).bold()
                    .foregroundStyle(Color.sixersNavy)
                Text("Part of the customizable fan hub. Tap the + on the home page to add or rearrange sections so you only see what matters to you.")
                    .foregroundStyle(.secondary)
            }
            .padding()
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Customize sheet

private struct CustomizeSheet: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selected: Set<String> = ["UR Word", "Games", "Spotlight", "Multimedia", "Kids Club", "Community", "Sponsors", "Shop", "Perks"]
    private let options = ["UR Word", "Games", "Spotlight", "Multimedia", "Kids Club", "Community", "Sponsors", "Shop", "Perks", "Roster", "Stats", "News"]

    var body: some View {
        NavigationStack {
            List {
                Section {
                    Text("Pick the sections you want to see on your home page. Drag to rearrange.")
                        .font(.subheadline).foregroundStyle(.secondary)
                }
                Section("Available") {
                    ForEach(options, id: \.self) { option in
                        HStack {
                            Text(option)
                            Spacer()
                            if selected.contains(option) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundStyle(Color.sixersBlue)
                            } else {
                                Image(systemName: "plus.circle")
                                    .foregroundStyle(Color.secondary)
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            if selected.contains(option) { selected.remove(option) }
                            else { selected.insert(option) }
                        }
                    }
                }
            }
            .navigationTitle("Customize Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") { dismiss() }.bold()
                }
            }
        }
    }
}

#Preview {
    NavigationStack { FanZoneView() }
}
