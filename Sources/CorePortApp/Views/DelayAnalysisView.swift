import SwiftUI

struct DelayAnalysisView: View {
    let delays = [
        ("Waiting for Container", 34, "35.4%"),
        ("Traffic / Movement", 28, "29.2%"),
        ("Mechanical Issue", 16, "16.7%"),
        ("Safety Issue", 12, "12.5%"),
        ("Other", 6, "6.2%")
    ]

    var body: some View {
        NavigationStack {
            List {
                Section("Total Delays") {
                    HStack {
                        Text("Total Delay Time")
                        Spacer()
                        Text("96 minutes")
                            .fontWeight(.semibold)
                    }
                }

                Section("Delay Breakdown") {
                    ForEach(delays, id: \.0) { reason, count, percentage in
                        VStack(alignment: .leading, spacing: 6) {
                            HStack {
                                Text(reason)
                                Spacer()
                                Text(percentage)
                                    .fontWeight(.semibold)
                            }
                            
                            ProgressView(value: Double(count) / 96.0)
                                .tint(.orange)
                        }
                    }
                }

                Section("Most Common Delays") {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("1. Waiting for Container")
                            .fontWeight(.semibold)
                        Text("Occurs most frequently during peak hours. Recommend container availability check.")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("2. Traffic / Movement")
                            .fontWeight(.semibold)
                        Text("Can be reduced with better traffic management protocols.")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("Delay Analysis")
        }
    }
}

#Preview {
    DelayAnalysisView()
}
