import SwiftUI

struct StandardTimesView: View {
    @EnvironmentObject var appState: AppState
    @State private var selectedMachine = ""

    var machineNumbers: [String] {
        Array(Set(appState.standardTimes.map { $0.machineNumber }))
    }

    var filteredTimes: [StandardTime] {
        if selectedMachine.isEmpty {
            return appState.standardTimes
        }
        return appState.standardTimes.filter { $0.machineNumber == selectedMachine }
    }

    var body: some View {
        NavigationStack {
            List {
                if !machineNumbers.isEmpty {
                    Section("Filter by Machine") {
                        Picker("Machine", selection: $selectedMachine) {
                            Text("All Machines").tag("")
                            ForEach(machineNumbers.sorted(), id: \.self) { machine in
                                Text(machine).tag(machine)
                            }
                        }
                    }
                }

                Section("Standard Times") {
                    if filteredTimes.isEmpty {
                        Text("No standard times available")
                            .foregroundStyle(.secondary)
                    } else {
                        ForEach(filteredTimes) { time in
                            VStack(alignment: .leading, spacing: 6) {
                                HStack {
                                    Text(time.machineNumber)
                                        .fontWeight(.semibold)
                                    Spacer()
                                    Text("\(time.containerType.rawValue) - \(time.operation.rawValue)")
                                        .font(.caption)
                                        .padding(4)
                                        .background(Color.blue.opacity(0.12))
                                        .clipShape(Capsule())
                                }

                                HStack(spacing: 12) {
                                    ForEach(time.roundTimes.indices, id: \.self) { index in
                                        VStack {
                                            Text("R\(index + 1)")
                                                .font(.caption2)
                                                .foregroundStyle(.secondary)
                                            Text("\(time.roundTimes[index])s")
                                                .font(.caption)
                                                .fontWeight(.semibold)
                                        }
                                        .frame(maxWidth: .infinity)
                                    }
                                }

                                HStack {
                                    Text("Average")
                                        .font(.caption)
                                    Spacer()
                                    Text(String(format: "%.0f", time.averageSeconds) + "s")
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.green)
                                }
                            }
                            .padding(.vertical, 6)
                        }
                    }
                }
            }
            .navigationTitle("Standard Times")
        }
    }
}

#Preview {
    StandardTimesView()
        .environmentObject(AppState())
}
