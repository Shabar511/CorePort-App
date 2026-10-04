import SwiftUI

struct ExcelImportView: View {
    @EnvironmentObject var appState: AppState
    @State private var fileName = ""
    @State private var importProgress = 0.0
    @State private var isImporting = false
    @State private var importResult = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Import Excel Data")
                    .font(.title2)
                    .bold()

                VStack(alignment: .leading, spacing: 12) {
                    Text("Expected Sheets:")
                        .font(.headline)
                    
                    ForEach(["Operators", "Machines", "StandardTimes", "TestSessions"], id: \.self) { sheet in
                        HStack {
                            Image(systemName: "checkmark.circle")
                                .foregroundStyle(.green)
                            Text(sheet)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 12))

                VStack(spacing: 12) {
                    Button(action: {}) {
                        Label("Select Excel File", systemImage: "folder")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)

                    if isImporting {
                        ProgressView(value: importProgress)
                            .tint(.blue)
                    }

                    if !importResult.isEmpty {
                        Text(importResult)
                            .font(.caption)
                            .foregroundStyle(importResult.contains("Success") ? .green : .red)
                    }
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Import Excel")
        }
    }
}

#Preview {
    ExcelImportView()
        .environmentObject(AppState())
}
