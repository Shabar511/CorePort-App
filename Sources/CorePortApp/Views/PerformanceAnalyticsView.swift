import SwiftUI

struct PerformanceAnalyticsView: View {
    @EnvironmentObject var appState: AppState
    @State private var selectedMetric = 0
    @State private var selectedPeriod = 0

    let metrics = ["Productivity", "Delays", "Efficiency", "Quality"]
    let periods = ["Today", "This Week", "This Month", "All Time"]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Performance Analytics")
                        .font(.title2)
                        .bold()

                    Picker("Metric", selection: $selectedMetric) {
                        ForEach(metrics.indices, id: \.self) { index in
                            Text(metrics[index]).tag(index)
                        }
                    }
                    .pickerStyle(.segmented)

                    Picker("Period", selection: $selectedPeriod) {
                        ForEach(periods.indices, id: \.self) { index in
                            Text(periods[index]).tag(index)
                        }
                    }
                    .pickerStyle(.segmented)

                    VStack(alignment: .leading, spacing: 12) {
                        Text("Average Score")
                            .font(.headline)
                        HStack {
                            Text("92%")
                                .font(.system(size: 48))
                                .fontWeight(.bold)
                                .foregroundStyle(.blue)
                            Spacer()
                        }
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                    VStack(alignment: .leading, spacing: 12) {
                        Text("Top Operators")
                            .font(.headline)

                        ForEach([
                            ("Ahmed Ali", "96%"),
                            ("Sami Ahmed", "93%"),
                            ("Mohamed Hassan", "89%")
                        ], id: \.0) { name, score in
                            HStack {
                                Text(name)
                                Spacer()
                                Text(score)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.blue)
                            }
                            .padding(.vertical, 8)
                        }
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                    VStack(alignment: .leading, spacing: 12) {
                        Text("Shift Performance")
                            .font(.headline)

                        ForEach([
                            ("Morning", "94%"),
                            ("Afternoon", "90%"),
                            ("Night", "87%")
                        ], id: \.0) { shift, score in
                            HStack {
                                Text(shift)
                                Spacer()
                                Text(score)
                                    .fontWeight(.semibold)
                            }
                            .padding(.vertical, 8)
                        }
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding()
            }
            .navigationTitle("Analytics")
        }
    }
}

#Preview {
    PerformanceAnalyticsView()
        .environmentObject(AppState())
}
