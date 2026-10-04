import SwiftUI

struct ResultsView: View {
    let results = [
        ("Ahmed Ali", "94%", "Excellent"),
        ("Mohamed Hassan", "89%", "Good"),
        ("Sami Ahmed", "91%", "Strong"),
        ("Omar Saleh", "82%", "Average")
    ]

    var body: some View {
        NavigationStack {
            List {
                ForEach(results, id: \.0) { name, score, status in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(name)
                                .fontWeight(.semibold)
                            Text(status)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }

                        Spacer()

                        Text(score)
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundStyle(.blue)
                    }
                }
            }
            .navigationTitle("Results")
        }
    }
}

#Preview {
    ResultsView()
}
