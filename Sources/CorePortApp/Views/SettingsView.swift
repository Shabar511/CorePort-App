import SwiftUI

struct SettingsView: View {
    @State private var importStatus = "Waiting for Excel upload"

    var body: some View {
        NavigationStack {
            List {
                Section("Data Import") {
                    NavigationLink(destination: ImportExcelView()) {
                        Label("Import Excel", systemImage: "square.and.arrow.down")
                    }

                    Text(importStatus)
                        .foregroundStyle(.secondary)
                }

                Section("System") {
                    LabeledContent("Language", value: "English")
                    LabeledContent("Mode", value: "Offline first")
                    LabeledContent("Storage", value: "Local")
                }

                Section("Sync") {
                    Toggle("Auto Sync", isOn: .constant(true))
                    Toggle("Offline Mode", isOn: .constant(true))
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct ImportExcelView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Import Excel Data")
                .font(.title2)
                .bold()

            VStack(alignment: .leading, spacing: 12) {
                Text("Expected Sheets:")
                    .font(.headline)
                
                ForEach(["Operators", "Machines", "StandardTimes", "TestSessions"], id: \.self) { sheet in
                    Label(sheet, systemImage: "checkmark.circle")
                        .foregroundStyle(.green)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color(.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 12))

            Button(action: {}) {
                Label("Select Excel File", systemImage: "folder")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .padding()
        .navigationTitle("Import Excel")
    }
}

#Preview {
    SettingsView()
}
