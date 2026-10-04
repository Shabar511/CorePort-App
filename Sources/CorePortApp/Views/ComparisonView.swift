import SwiftUI

struct ComparisonView: View {
    @State private var comparisonType = 0
    @State private var selectedOperator = "All"
    @State private var selectedShift = "All"

    let comparisonTypes = ["Operators", "Shifts", "Machines"]
    let operators = ["All", "Ahmed Ali", "Mohamed Hassan", "Sami Ahmed"]
    let shifts = ["All", "Morning", "Afternoon", "Night"]

    var body: some View {
        NavigationStack {
            Form {
                Section("Comparison Type") {
                    Picker("Type", selection: $comparisonType) {
                        ForEach(comparisonTypes.indices, id: \.self) { index in
                            Text(comparisonTypes[index]).tag(index)
                        }
                    }
                }

                if comparisonType == 0 {
                    Section("Filter by Operator") {
                        Picker("Operator", selection: $selectedOperator) {
                            ForEach(operators, id: \.self) { op in
                                Text(op).tag(op)
                            }
                        }
                    }
                } else if comparisonType == 1 {
                    Section("Filter by Shift") {
                        Picker("Shift", selection: $selectedShift) {
                            ForEach(shifts, id: \.self) { shift in
                                Text(shift).tag(shift)
                            }
                        }
                    }
                }

                Section("Performance Metrics") {
                    VStack(alignment: .leading, spacing: 12) {
                        ComparisonMetricRow(label: "Average Score", value: "92%", trend: "+2%")
                        ComparisonMetricRow(label: "Total Tests", value: "48", trend: "+8")
                        ComparisonMetricRow(label: "Consistency", value: "87%", trend: "-1%")
                        ComparisonMetricRow(label: "Best Score", value: "96%", trend: "=")
                    }
                }

                Section("Detailed Breakdown") {
                    VStack(alignment: .leading, spacing: 12) {
                        ComparisonDetailRow(name: "Morning Shift", score: "94%", tests: "18")
                        ComparisonDetailRow(name: "Afternoon Shift", score: "90%", tests: "16")
                        ComparisonDetailRow(name: "Night Shift", score: "87%", tests: "14")
                    }
                }
            }
            .navigationTitle("Comparison")
        }
    }
}

struct ComparisonMetricRow: View {
    let label: String
    let value: String
    let trend: String

    var trendColor: Color {
        if trend.contains("+") {
            return .green
        } else if trend.contains("-") {
            return .red
        } else {
            return .gray
        }
    }

    var body: some View {
        HStack {
            Text(label)
            Spacer()
            VStack(alignment: .trailing) {
                Text(value)
                    .fontWeight(.semibold)
                Text(trend)
                    .font(.caption)
                    .foregroundStyle(trendColor)
            }
        }
    }
}

struct ComparisonDetailRow: View {
    let name: String
    let score: String
    let tests: String

    var body: some View {
        HStack {
            Text(name)
            Spacer()
            VStack(alignment: .trailing) {
                Text(score)
                    .fontWeight(.bold)
                Text("\(tests) tests")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    ComparisonView()
}
