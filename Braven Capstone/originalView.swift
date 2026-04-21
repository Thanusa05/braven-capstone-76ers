//
//  originalView.swift
//  Braven Capstone
//
//  Mirrors the original 76ers app's "More" menu. Shown so viewers can see
//  the nesting menus and clutter that the redesigned home replaces.
//

import SwiftUI

struct originalView: View {
    private let items: [String] = [
        "FAN ZONE",
        "PLAY-4-PRIZES",
        "SPIRIT OF 76",
        "MESSAGE CENTER",
        "ROSTER",
        "GAMECENTER",
        "NBA SCORES",
        "X (TWITTER)",
        "SHOP",
        "NBA ID",
        "PROFILE CENTER",
        "SETTINGS",
        "GEOFENCING",
        "ACCOUNT DELETION",
        "PRIVACY POLICY",
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                header
                VStack(spacing: 0) {
                    ForEach(items, id: \.self) { item in
                        MenuRow(title: item)
                        Divider().padding(.leading, 64)
                    }
                }
                .padding(.top, 8)
            }
        }
        .background(Color.white)
        .navigationBarHidden(true)
    }

    private var header: some View {
        ZStack(alignment: .top) {
            Image("76menu")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .overlay(alignment: .top) {
                    Color.white
                        .frame(height: 1)
                        .opacity(0)
                }
        }
    }
}

private struct MenuRow: View {
    let title: String
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: iconName)
                .font(.title3)
                .foregroundStyle(Color.sixersBlue)
                .frame(width: 32)
            Text(title)
                .font(.headline)
                .foregroundStyle(Color.sixersNavy)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 14)
    }

    private var iconName: String {
        switch title {
        case "FAN ZONE":         return "person.3.fill"
        case "PLAY-4-PRIZES":    return "gift.fill"
        case "SPIRIT OF 76":     return "star.fill"
        case "MESSAGE CENTER":   return "envelope.fill"
        case "ROSTER":           return "list.bullet"
        case "GAMECENTER":       return "sportscourt.fill"
        case "NBA SCORES":       return "chart.bar.fill"
        case "X (TWITTER)":      return "xmark.circle.fill"
        case "SHOP":             return "bag.fill"
        case "NBA ID":           return "person.text.rectangle.fill"
        case "PROFILE CENTER":   return "person.crop.circle.fill"
        case "SETTINGS":         return "gearshape.fill"
        case "GEOFENCING":       return "location.fill"
        case "ACCOUNT DELETION": return "trash.fill"
        case "PRIVACY POLICY":   return "lock.shield.fill"
        default:                 return "circle"
        }
    }
}

#Preview {
    NavigationStack { originalView() }
}
