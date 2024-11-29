
import SwiftUI

enum Tab: CaseIterable{
    case home
    case profile
    case settings
}

struct CustomTabView: View {
    
    @State private var selectedTab: Tab = .home

    var body: some View {
        VStack{
            
            switch selectedTab {
            case .home :
                HomeScreenView()
            case .profile :
                ProfileScreenView()
            case .settings :
                SettingsScreenView()
            }
            
            Spacer()
            
            HStack(spacing : 50){
                //Home Tab
                Button {
                    selectedTab = .home
                } label: {
                    Image(systemName: "house.fill")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.black)
                }
                    
                    //profile Tab
                    Button {
                        selectedTab = .profile
                    } label: {
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(.black)
                    }
                        
                        //Home Tab
                        Button {
                            selectedTab = .settings
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .foregroundColor(.black)
                            
                        }
                    
                }
                .frame(width: 350, height: 60)
                .background(.thinMaterial)
                .cornerRadius(20)
                
            }
        }
    }


struct CustomTabViewModel_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
