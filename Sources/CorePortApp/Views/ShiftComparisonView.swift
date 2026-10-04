import SwiftUI

struct ShiftComparisonView: View {
    let data = [
        ("Morning", "94%", "18"),
        ("Afternoon", "90%", "16"),
        ("Night", "87%", "15")
    ]

    var body: some View {
        NavigationStack {
            List {
                ForEach(data, id: \.0) { shift, productivity, tests in
                    HStack {
                        Text(shift)
                            .fontWeight(.semibold)

                        Spacer()

                        VStack(alignment: .trailing) {
                            Text(productivity)
                                .fontWeight(.bold)
                            Text("\(tests) tests")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Shift Comparison")
        }
    }
}

#Preview {
    ShiftComparisonView()
}
