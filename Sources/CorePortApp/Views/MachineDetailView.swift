import SwiftUI

struct MachineDetailView: View {
    let machine: Machine
    @EnvironmentObject var appState: AppState

    var machineStandardTimes: [StandardTime] {
        appState.standardTimes.filter { $0.machineNumber == machine.machineNumber }
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Machine Information") {
                    LabeledContent("Machine Number", value: machine.machineNumber)
                    LabeledContent("Type", value: machine.machineType)
                    LabeledContent("Berth", value: machine.berth)
                    LabeledContent("Location", value: machine.location)
                }

                Section("Standard Times") {
                    if machineStandardTimes.isEmpty {
                        Text("No standard times defined")
                            .foregroundStyle(.secondary)
                    } else {
                        ForEach(machineStandardTimes) { time in
                            VStack(alignment: .leading, spacing: 4) {
                                Text("\(time.containerType.rawValue) - \(time.operation.rawValue)")
                                    .fontWeight(.semibold)
                                Text("Average: \(String(format: "%.0f", time.averageSeconds))s")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }

                Section("Recent Tests") {
                    LabeledContent("Today", value: "3 tests")
                    LabeledContent("This Week", value: "18 tests")
                    LabeledContent("This Month", value: "72 tests")
                }
            }
            .navigationTitle(machine.machineNumber)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MachineDetailView(machine: Machine(machineNumber: "STS-01", machineType: "STS", berth: "Berth-01", location: "07"))
        .environmentObject(AppState())
}
