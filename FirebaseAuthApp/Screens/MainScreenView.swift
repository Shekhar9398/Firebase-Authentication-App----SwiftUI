

import SwiftUI

struct MainScreenView: View {
    var body: some View {
        ZStack{
           CustomTabView()
        }
        .toolbarRole(.editor)
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
