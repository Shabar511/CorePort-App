import SwiftUI

struct TestResultDetailView: View {
    @State private var selectedRound = 1
    @State private var delayReason: DelayReason = .other
    @State private var delayDescription = ""

    var body: some View {
        NavigationStack {
            Form {
                Section("Test Session Info") {
                    LabeledContent("Date", value: "2024-01-15")
                    LabeledContent("Operator", value: "Ahmed Ali")
                    LabeledContent("Machine", value: "STS-01")
                    LabeledContent("Shift", value: "Morning")
                }

                Section("Container & Operation") {
                    LabeledContent("Container Type", value: "20ft")
                    LabeledContent("Operation", value: "Load")
                    LabeledContent("Standard Time", value: "30 seconds")
                }

                Section("Round Results") {
                    Picker("Select Round", selection: $selectedRound) {
                        Text("Round 1").tag(1)
                        Text("Round 2").tag(2)
                        Text("Round 3").tag(3)
                        Text("Round 4").tag(4)
                    }

                    switch selectedRound {
                    case 1:
                        LabeledContent("Start", value: "08:30:45")
                        LabeledContent("End", value: "08:31:15")
                        LabeledContent("Elapsed", value: "30 seconds")
                    case 2:
                        LabeledContent("Start", value: "08:32:10")
                        LabeledContent("End", value: "08:32:42")
                        LabeledContent("Elapsed", value: "32 seconds")
                    case 3:
                        LabeledContent("Start", value: "08:33:00")
                        LabeledContent("End", value: "08:33:28")
                        LabeledContent("Elapsed", value: "28 seconds")
                    default:
                        LabeledContent("Start", value: "08:34:00")
                        LabeledContent("End", value: "08:34:29")
                        LabeledContent("Elapsed", value: "29 seconds")
                    }
                }

                Section("Delays") {
                    Picker("Delay Reason", selection: $delayReason) {
                        Text("Waiting for Container").tag(DelayReason.waitingContainer)
                        Text("Mechanical Issue").tag(DelayReason.mechanical)
                        Text("Safety Issue").tag(DelayReason.safety)
                        Text("Traffic / Movement").tag(DelayReason.traffic)
                        Text("Other").tag(DelayReason.other)
                    }

                    TextField("Description", text: $delayDescription)
                }

                Section("Performance Score") {
                    HStack {
                        Text("Productivity")
                        Spacer()
                        Text("94%")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundStyle(.green)
                    }
                }
            }
            .navigationTitle("Test Result")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    TestResultDetailView()
}
