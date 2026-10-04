import SwiftUI

struct LiveMonitoringView: View {
    @State private var refreshTimer: Timer?
    @State private var currentTime = Date()

    let liveData = [
        (machine: "STS-01", operator: "Ahmed Ali", status: "Loading", duration: "1:45", target: "1:30"),
        (machine: "STS-20", operator: "Mohamed Hassan", status: "Unloading", duration: "2:12", target: "2:00"),
        (machine: "RTG-01", operator: "Sami Ahmed", status: "Loading", duration: "0:52", target: "1:00")
    ]

    var body: some View {
        NavigationStack {
            List {
                Section("Current Operations") {
                    ForEach(liveData, id: \.machine) { item in
                        VStack(alignment: .leading, spacing: 6) {
                            HStack {
                                Text(item.machine)
                                    .fontWeight(.semibold)
                                Spacer()
                                Circle()
                                    .fill(.green)
                                    .frame(width: 10, height: 10)
                            }

                            Text(item.operator)
                                .font(.caption)
                                .foregroundStyle(.secondary)

                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.status)
                                        .font(.caption)
                                    Text(item.duration)
                                        .font(.caption2)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                VStack(alignment: .trailing) {
                                    Text("Target: \(item.target)")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                            }
                        }
                        .padding(.vertical, 6)
                    }
                }

                Section("Performance Summary") {
                    HStack {
                        Text("On Time")
                        Spacer()
                        Text("2/3 (67%)")
                            .fontWeight(.semibold)
                    }

                    HStack {
                        Text("Running Behind")
                        Spacer()
                        Text("1/3 (33%)")
                            .fontWeight(.semibold)
                            .foregroundStyle(.orange)
                    }
                }
            }
            .navigationTitle("Live Monitoring")
            .onAppear {
                refreshTimer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
                    currentTime = Date()
                }
            }
            .onDisappear {
                refreshTimer?.invalidate()
            }
        }
    }
}

#Preview {
    LiveMonitoringView()
}
