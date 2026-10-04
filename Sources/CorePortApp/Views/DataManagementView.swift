import SwiftUI

struct DataManagementView: View {
    @EnvironmentObject var appState: AppState
    @State private var showingImportOptions = false
    @State private var importMessage = ""

    var body: some View {
        NavigationStack {
            List {
                Section("Current Data") {
                    HStack {
                        Text("Operators")
                        Spacer()
                        Text("\(appState.operators.count)")
                            .fontWeight(.semibold)
                    }
                    HStack {
                        Text("Machines")
                        Spacer()
                        Text("\(appState.machines.count)")
                            .fontWeight(.semibold)
                    }
                    HStack {
                        Text("Standard Times")
                        Spacer()
                        Text("\(appState.standardTimes.count)")
                            .fontWeight(.semibold)
                    }
                    HStack {
                        Text("Test Sessions")
                        Spacer()
                        Text("\(appState.testSessions.count)")
                            .fontWeight(.semibold)
                    }
                }

                Section("Import Options") {
                    Button(action: { showingImportOptions = true }) {
                        Label("Import from Excel", systemImage: "square.and.arrow.down")
                            .foregroundStyle(.blue)
                    }

                    Button(action: { appState.loadSampleData() }) {
                        Label("Load Sample Data", systemImage: "sparkles")
                            .foregroundStyle(.blue)
                    }
                }

                Section("Export Options") {
                    Button(action: {}) {
                        Label("Export as CSV", systemImage: "arrow.up.doc")
                            .foregroundStyle(.blue)
                    }

                    Button(action: {}) {
                        Label("Export as Excel", systemImage: "arrow.up.doc.fill")
                            .foregroundStyle(.blue)
                    }
                }

                Section("Database") {
                    Button(action: {}, label: {
                        Label("Clear All Data", systemImage: "trash")
                            .foregroundStyle(.red)
                    })
                }
            }
            .navigationTitle("Data Management")
            .alert("Import Excel", isPresented: $showingImportOptions) {
                Button("Cancel", role: .cancel) { }
                Button("Select File") {
                    importMessage = "File picker would open here"
                }
            } message: {
                Text("Select your Excel file to import data. Expected sheets: Operators, Machines, StandardTimes, TestSessions")
            }
        }
    }
}

#Preview {
    DataManagementView()
        .environmentObject(AppState())
}
