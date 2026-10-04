import SwiftUI

struct AnalyticsView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Productivity") {
                    MetricRow(label: "Performance", value: "92%")
                    MetricRow(label: "Delays", value: "7.4%")
                    MetricRow(label: "Target", value: "95%")
                }

                Section("By Shift") {
                    ShiftMetricRow(shift: "A", value: "94%")
                    ShiftMetricRow(shift: "B", value: "89%")
                    ShiftMetricRow(shift: "C", value: "91%")
                }

                Section("By Machine") {
                    MetricRow(label: "STS-01", value: "96%")
                    MetricRow(label: "STS-20", value: "88%")
                    MetricRow(label: "RTG-01", value: "90%")
                }
            }
            .navigationTitle("Analytics")
        }
    }
}

struct MetricRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack {
            Text(label)
            Spacer()
            Text(value)
                .fontWeight(.semibold)
                .foregroundStyle(.blue)
        }
    }
}

struct ShiftMetricRow: View {
    let shift: String
    let value: String

    var body: some View {
        HStack {
            Text("Shift \(shift)")
            Spacer()
            Text(value)
                .fontWeight(.semibold)
                .foregroundStyle(.green)
        }
    }
}

#Preview {
    AnalyticsView()
}
