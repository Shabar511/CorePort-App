import SwiftUI

struct EmployeeListView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        NavigationStack {
            List {
                ForEach(appState.operators) { employee in
                    HStack {
                        Circle()
                            .fill(employee.isActive ? .green : .gray)
                            .frame(width: 12, height: 12)

                        VStack(alignment: .leading) {
                            Text(employee.fullName)
                                .fontWeight(.semibold)
                            Text("ID: \(employee.employeeID)")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }

                        Spacer()

                        VStack(alignment: .trailing) {
                            Text("Shift \(employee.shiftGroup)")
                                .font(.caption)
                                .padding(4)
                                .background(Color.blue.opacity(0.12))
                                .clipShape(Capsule())

                            Text(employee.isActive ? "Active" : "Off")
                                .font(.caption2)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .padding(.vertical, 6)
                }
            }
            .navigationTitle("Employees")
        }
    }
}

#Preview {
    EmployeeListView()
        .environmentObject(AppState())
}
