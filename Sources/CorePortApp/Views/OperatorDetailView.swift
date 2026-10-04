import SwiftUI

struct OperatorDetailView: View {
    let operator: Operator
    @State private var isEditing = false

    var body: some View {
        NavigationStack {
            Form {
                Section("Basic Information") {
                    LabeledContent("Employee ID", value: operator.employeeID)
                    LabeledContent("Full Name", value: operator.fullName)
                    LabeledContent("Shift Group", value: operator.shiftGroup)
                    Toggle("Active", isOn: .constant(operator.isActive))
                }

                Section("Performance") {
                    LabeledContent("Total Tests", value: "12")
                    LabeledContent("Average Score", value: "92%")
                    LabeledContent("Best Score", value: "96%")
                }

                Section("Shift Schedule") {
                    ForEach(ShiftRotationCalculator.cycleFor(group: operator.shiftGroup), id: \.id) { entry in
                        HStack {
                            Text("Day \(entry.dayNumber)")
                            Spacer()
                            Text(entry.shift.rawValue)
                                .fontWeight(.semibold)
                                .foregroundStyle(entry.shift == .off ? .secondary : .blue)
                        }
                    }
                }
            }
            .navigationTitle(operator.fullName)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    OperatorDetailView(operator: Operator(employeeID: "OP001", fullName: "Ahmed Ali", shiftGroup: "A", isActive: true))
}
