import SwiftUI

struct HistoryPage: View {
    var body: some View {
        ZStack {
            Color("AlfredDarkGray").edgesIgnoringSafeArea(.all)

            VStack {
                CircleIcon(iconName: "HistoryIcon", iconSize: 80)
                    .padding(.top, 20)

                List(MockData.sampleQueries) { query in
                    QueryRowView(query: query)
                        .listRowBackground(Color("AlfredDarkGray"))
                }
                .listStyle(PlainListStyle())
                .padding(.top, 50)
            }
        }
    }
}

// MARK: - Preview
struct HistoryPage_Previews: PreviewProvider {
    static var previews: some View {
        HistoryPage()
    }
}
