# Braven Capstone — Philadelphia 76ers Fan Engagement App

iOS app prototype built for the Braven capstone, Cohort 12.

**Team:** Thanusa Sivanesan, Anel, Dante Riccio, Sandy Hassan, Jomana, Katherine Tume

## Capstone Challenge

> How can the Philadelphia 76ers drive engagement towards (or increase
> engagement with) their mobile application?

## Problem Statement

> The app user believes the app is obsolete because they feel a lack of a
> tailored fan experience.

From empathy interviews with eight users, the recurring pain points were:

- Nesting menus and constant redirects to the mobile browser
- Superfluous logins / blank pages / overall feels "obsolete"
- Cluttered homepage; overwhelming for casual fans
- Feels "too corporate" — not made for younger fans
- Google and ESPN do most of what the app does, with less friction

The one thing interviewees consistently liked: the **team-centered** angle.
Favoriting players and in-app ticketing were the two features users actually
returned for.

## Solution

Tailor the app for fans by making the navigation **customizable** and
**upgrading the Fan Zone** so the team-centered experience is the first thing
fans see — not buried under menus.

## What's in the app

The app keeps the familiar `Home / Schedule / Gameday / Tickets / More`
tab bar so fans don't have to relearn the structure, then replaces the pages
underneath.

| Tab | What it shows |
|---|---|
| **Home** | FANS page — a customizable stack of sections (UR Word, Games, Spotlight, Multimedia, Kids Club, Community, Sponsors, Shop, Perks). Tap the red `+` to add, remove, or reorder sections. |
| **Schedule** | Season schedule placeholder. |
| **Gameday** | Location-based Promos (Wells Fargo Center, Chase Center) with Apple/Google Maps directions, concession ordering, and the **Game Day Playlist** — fans submit songs and vote tracks up or down. |
| **Tickets** | Ticketing placeholder. |
| **More** | The original 76ers app's menu — shown so viewers can compare the "before" clutter with the redesigned home. |

### Perks (reached from the Home page)

A live points bar (with Q2 / 06:32 game context) plus three sections:

- **🔑 Location-Based Perks** — concession discounts and halftime raffles triggered when you're near the stadium or tailgating.
- **Earn Points & Free Games** — trivia and puzzles that reward points. *"Want free points? Play games here."*
- **Insider Access** — player interviews, live game chatrooms, unlock videos with points. *"Vibes from the Court."*

## Tech

- SwiftUI, iOS 17.0+
- Xcode 26.1.1
- Universal (iPhone + iPad)

## Project structure

```
Braven Capstone/
├── Braven Capstone.xcodeproj
└── Braven Capstone/
    ├── Braven_CapstoneApp.swift      # @main app entry
    ├── ContentView.swift              # Splash + TabView shell
    ├── FanZoneView.swift              # FANS home with customizable sections
    ├── gameDayView.swift              # Promos + Game Day Playlist
    ├── perksView.swift                # Points bar + 3 perk sections
    ├── originalView.swift             # Mirror of the original More menu
    ├── ColorHex.swift                 # Hex-to-Color + team brand colors
    ├── Assets.xcassets/               # App icon + 11 in-app images
    └── Launch Screen-76ers.storyboard
```

## Source materials

- [Capstone Project document](https://docs.google.com/document/d/1IIAshhTXn3SNaFOA0UY61YPIuCyfzZr2N4K3Qf-bFUc/)
- [Empathy Interview Guide & Notes](https://docs.google.com/document/d/172FGf3CuIBxLIbIoKCqAp0RxXKkwNE4CnaEGOkyaHRM/)
- [Perks ideas](https://docs.google.com/document/d/1kmDBPKy8O3ZbLUhCRAjB1paUWrr8K6Cw4mTu5C8ZqUk/)
- [Presentation (Canva)](https://canva.link/3s7sqfbpcz3gqib)

## Running

Open `Braven Capstone.xcodeproj` in Xcode and run on any iOS 17+ simulator.
