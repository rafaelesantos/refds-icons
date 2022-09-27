import SwiftUI
import RefdsUI

struct ContentView: View {
    @State var filter: String = ""
    
    var body: some View {
        detailView
            .searchable(text: $filter, prompt: "Search")
    }
    
    @ViewBuilder var detailView: some View {
        VStack(alignment: .leading, spacing: 0) {
            AnyView(
                ScrollView {
                    detailContent
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .screenLayout(.all)
                }
            )
        }
        .ignoresSafeArea()
        .overlay(EmptyView(), alignment: .top)
        .navigationBarTitle("Refds Icons", displayMode: .large)
    }
    
    @ViewBuilder var detailContent: some View {
        IconsView.storybook(filter: filter)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
