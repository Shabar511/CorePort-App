import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("CorePort")
                        .font(.largeTitle)
                        .bold()

                    Text(appState.importStatus)
                        .foregroundStyle(.secondary)

                    HStack(spacing: 12) {
                        SummaryCard(title: "Operators", value: "\(appState.operators.count)")
                        SummaryCard(title: "Machines", value: "\(appState.machines.count)")
                    }

                    HStack(spacing: 12) {
                        SummaryCard(title: "Standard Times", value: "\(appState.standardTimes.count)")
                        SummaryCard(title: "Sessions", value: "\(appState.testSessions.count)")
                    }

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Quick Overview")
                            .font(.headline)

                        ForEach(appState.operators.prefix(4), id: \.employeeID) { employee in
                            HStack {
                                Circle()
                                    .fill(employee.isActive ? .green : .gray)
                                    .frame(width: 10, height: 10)

                                Text(employee.fullName)
                                Spacer()
                                Text(employee.shiftGroup)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color.blue.opacity(0.12))
                                    .clipShape(Capsule())
                            }
                        }
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .padding()
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Load Sample") {
                        appState.loadSampleData()
                    }
                }
            }
        }
    }
}

struct SummaryCard: View {
    let title: String
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity, minHeight: 90)
        .padding()
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    HomeView()
        .environmentObject(AppState())
}
