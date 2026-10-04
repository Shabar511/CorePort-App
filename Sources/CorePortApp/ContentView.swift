import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tag(0)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            TestingView()
                .tag(1)
                .tabItem {
                    Label("Testing", systemImage: "timer")
                }

            LiveMonitoringView()
                .tag(2)
                .tabItem {
                    Label("Monitor", systemImage: "eye")
                }

            AnalyticsView()
                .tag(3)
                .tabItem {
                    Label("Analytics", systemImage: "chart.bar")
                }

            SettingsView()
                .tag(4)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        .accentColor(.blue)
    }
}

#Preview {
    ContentView()
        .environmentObject(AppState())
}
