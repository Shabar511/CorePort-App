import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var appState: AppState
    @State private var showingImport = false
    @State private var showingDataManagement = false

    var body: some View {
        NavigationStack {
            List {
                Section("Data Management") {
                    NavigationLink(destination: DataManagementView()) {
                        Label("Manage Data", systemImage: "folder.badge.gear")
                    }

                    NavigationLink(destination: ExcelImportView()) {
                        Label("Import Excel", systemImage: "square.and.arrow.down")
                    }
                }

                Section("Utilities") {
                    NavigationLink(destination: StandardTimesView()) {
                        Label("Standard Times", systemImage: "hourglass")
                    }

                    NavigationLink(destination: ShiftRotationView()) {
                        Label("Shift Rotation", systemImage: "calendar")
                    }
                }

                Section("System") {
                    LabeledContent("Language", value: "English")
                    LabeledContent("Mode", value: "Offline first")
                    LabeledContent("Storage", value: "Local")
                    LabeledContent("App Version", value: "1.0.0")
                }

                Section("Preferences") {
                    Toggle("Auto Sync", isOn: .constant(true))
                    Toggle("Dark Mode", isOn: .constant(false))
                    Toggle("Notifications", isOn: .constant(true))
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(AppState())
}
