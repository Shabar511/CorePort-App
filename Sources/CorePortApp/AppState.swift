import SwiftUI

@MainActor
final class AppState: ObservableObject {
    @Published var operators: [Operator] = []
    @Published var machines: [Machine] = []
    @Published var standardTimes: [StandardTime] = []
    @Published var testSessions: [TestSession] = []
    @Published var importStatus: String = "No data imported"

    func loadSampleData() {
        operators = [
            Operator(employeeID: "OP001", fullName: "Ahmed Ali", shiftGroup: "A", isActive: true),
            Operator(employeeID: "OP002", fullName: "Mohamed Hassan", shiftGroup: "B", isActive: true),
            Operator(employeeID: "OP003", fullName: "Sami Ahmed", shiftGroup: "C", isActive: true),
            Operator(employeeID: "OP004", fullName: "Omar Saleh", shiftGroup: "A", isActive: false)
        ]

        machines = [
            Machine(machineNumber: "STS-01", machineType: "STS", berth: "Berth-01", location: "07"),
            Machine(machineNumber: "STS-20", machineType: "STS", berth: "Berth-07", location: "24"),
            Machine(machineNumber: "RTG-01", machineType: "RTG", berth: "Berth-02", location: "08"),
            Machine(machineNumber: "FL-01", machineType: "FL", berth: "Berth-03", location: "09")
        ]

        standardTimes = [
            StandardTime(machineNumber: "STS-01", containerType: .twenty, operation: .load, roundTimes: [30, 30, 28, 29]),
            StandardTime(machineNumber: "STS-01", containerType: .twenty, operation: .unload, roundTimes: [32, 30, 31, 30]),
            StandardTime(machineNumber: "STS-20", containerType: .forty, operation: .load, roundTimes: [45, 44, 46, 45])
        ]

        importStatus = "Sample data loaded"
    }
}
