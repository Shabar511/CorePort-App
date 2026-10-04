import SwiftUI

struct ReportsView: View {
    @State private var selectedReport = 0

    let reportTypes = [
        "Daily Performance",
        "Weekly Summary",
        "Operator Ranking",
        "Machine Efficiency"
    ]

    var body: some View {
        NavigationStack {
            Form {
                Section("Report Type") {
                    Picker("Select Report", selection: $selectedReport) {
                        ForEach(reportTypes.indices, id: \.self) { index in
                            Text(reportTypes[index]).tag(index)
                        }
                    }
                }

                Section("Report Data") {
                    switch selectedReport {
                    case 0: // Daily Performance
                        VStack(alignment: .leading, spacing: 12) {
                            ReportRow(label: "Date", value: "Today")
                            ReportRow(label: "Total Operations", value: "48")
                            ReportRow(label: "Average Score", value: "92%")
                            ReportRow(label: "On-Time Rate", value: "88%")
                        }
                    case 1: // Weekly Summary
                        VStack(alignment: .leading, spacing: 12) {
                            ReportRow(label: "Week", value: "Oct 1-7, 2024")
                            ReportRow(label: "Total Operations", value: "336")
                            ReportRow(label: "Average Score", value: "91%")
                            ReportRow(label: "Best Day", value: "Friday (94%)")
                        }
                    case 2: // Operator Ranking
                        VStack(alignment: .leading, spacing: 12) {
                            ReportRow(label: "1st Place", value: "Ahmed Ali (96%)")
                            ReportRow(label: "2nd Place", value: "Sami Ahmed (93%)")
                            ReportRow(label: "3rd Place", value: "Mohamed Hassan (89%)")
                            ReportRow(label: "Period", value: "Last 7 Days")
                        }
                    default: // Machine Efficiency
                        VStack(alignment: .leading, spacing: 12) {
                            ReportRow(label: "Most Efficient", value: "STS-01 (95%)")
                            ReportRow(label: "Average", value: "91%")
                            ReportRow(label: "Needs Maintenance", value: "RTG-01 (78%)")
                            ReportRow(label: "Period", value: "Last 30 Days")
                        }
                    }
                }

                Section {
                    Button(action: {}) {
                        Label("Export Report", systemImage: "arrow.up.doc")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.bordered)
                }
            }
            .navigationTitle("Reports")
        }
    }
}

struct ReportRow: View {
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

#Preview {
    ReportsView()
}
