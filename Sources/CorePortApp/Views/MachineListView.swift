import SwiftUI

struct MachineListView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        NavigationStack {
            List {
                ForEach(appState.machines) { machine in
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Text(machine.machineNumber)
                                .fontWeight(.semibold)
                            Spacer()
                            Text(machine.machineType)
                                .font(.caption)
                                .padding(8)
                                .background(Color.blue.opacity(0.12))
                                .clipShape(Capsule())
                        }

                        Text("Berth: \(machine.berth)")
                            .font(.caption)
                            .foregroundStyle(.secondary)

                        Text("Location: \(machine.location)")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical, 6)
                }
            }
            .navigationTitle("Machines")
        }
    }
}

#Preview {
    MachineListView()
        .environmentObject(AppState())
}
