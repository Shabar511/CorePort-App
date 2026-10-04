import SwiftUI

struct TestingView: View {
    @State private var selectedOperator = "Ahmed Ali"
    @State private var selectedMachine = "STS-01"
    @State private var operation: OperationType = .load
    @State private var containerType: ContainerType = .twenty
    @State private var shiftType: ShiftType = .morning
    @State private var standardTime = 30
    @State private var actualTime = 32
    @State private var delayTime = 2

    var body: some View {
        NavigationStack {
            Form {
                Section("Operator & Machine") {
                    Picker("Operator", selection: $selectedOperator) {
                        Text("Ahmed Ali").tag("Ahmed Ali")
                        Text("Mohamed Hassan").tag("Mohamed Hassan")
                        Text("Sami Ahmed").tag("Sami Ahmed")
                    }

                    Picker("Machine", selection: $selectedMachine) {
                        Text("STS-01").tag("STS-01")
                        Text("STS-20").tag("STS-20")
                        Text("RTG-01").tag("RTG-01")
                    }
                }

                Section("Test Settings") {
                    Picker("Operation", selection: $operation) {
                        Text("Load").tag(OperationType.load)
                        Text("Unload").tag(OperationType.unload)
                    }

                    Picker("Container", selection: $containerType) {
                        Text("20ft").tag(ContainerType.twenty)
                        Text("40ft").tag(ContainerType.forty)
                    }

                    Picker("Shift", selection: $shiftType) {
                        Text("Morning").tag(ShiftType.morning)
                        Text("Afternoon").tag(ShiftType.afternoon)
                        Text("Night").tag(ShiftType.night)
                    }
                }

                Section("Timing") {
                    Stepper("Standard Time: \(standardTime)s", value: $standardTime, in: 0...300)
                    Stepper("Actual Time: \(actualTime)s", value: $actualTime, in: 0...300)
                    Stepper("Delay: \(delayTime)s", value: $delayTime, in: 0...180)
                }

                Section {
                    Button(action: {}) {
                        Label("Start Test", systemImage: "play.fill")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .navigationTitle("Testing")
        }
    }
}

#Preview {
    TestingView()
}
