import SwiftUI

struct AnalyticsView: View {
    let metrics = [
        ("Productivity", "92%"),
        ("Delays", "7.4%"),
        ("Target", "95%"),
        ("Operations", "48")
    ]

    let shiftData = [
        ("Morning", "94%"),
        ("Afternoon", "89%"),
        ("Night", "91%")
    ]

    var body: some View {
        NavigationStack {
            List {
                Section("Overall") {
                    ForEach(metrics, id: \.0) { item in
                        HStack {
                            Text(item.0)
                            Spacer()
                            Text(item.1)
                                .fontWeight(.semibold)
                        }
                    }
                }

                Section("By Shift") {
                    ForEach(shiftData, id: \.0) { item in
                        HStack {
                            Text(item.0)
                            Spacer()
                            Text(item.1)
                                .fontWeight(.bold)
                                .foregroundStyle(.blue)
                        }
                    }
                }
            }
            .navigationTitle("Analytics")
        }
    }
}

#Preview {
    AnalyticsView()
}
