//
//  MainView.swift
//  Avocado
//
//  Created by Syed ShahRukh Haider on 07/01/2021.
//

import SwiftUI


var totalStock = 0
var takenCount = 0
var skipCount = 0
var missCount = 0

var todayTakenCount = 0
var todaySkipCount = 0

let VM = FirebaseViewModel()

struct MainView: View {
    
    @State var selectedIndex = 1
  @State var isHome = false
    @State var isMedi = false
    @State var date = Date()
    
    var body: some View {
        
        NavigationView{
        TabView(selection: $selectedIndex){
            HomeView()
                .tabItem {
                    Image(selectedIndex == 1 ? "home_tab_selected":"home_tab")

                    Text("Home")
                        .foregroundColor(Color(#colorLiteral(red: 0.213047266, green: 0.3305280805, blue: 0.8173508048, alpha: 1)))

                }.tag(1)
                

            MediView(dateValue: $date)
                .tabItem {
                    Image(selectedIndex == 2 ? "medi_tab_selected":"medi_tab")
                    Text("Medication")
                        .foregroundColor(.accentColor)

                }.tag(2)
            ReportView()
                .tabItem {
                    Image(selectedIndex == 3 ? "report_tab_selected":"report_tab")
                    Text("Report")
                        .foregroundColor(.accentColor)

                }.tag(3)
            TrackerView()
                .tabItem {
                    Image(selectedIndex == 4 ? "tracker_tab_selected":"tracker_tab")
                    Text("Tracker")
                        .foregroundColor(.accentColor)

                }.tag(4)
            MoreView()
                .tabItem {
                    Image(selectedIndex == 5 ? "more_tab_selected":"more_tab")
                    Text("More")
                        .foregroundColor(.accentColor)

                }.tag(5)
        }
        
        }
        
        .preferredColorScheme(.light)
        .edgesIgnoringSafeArea(.top)
        .accentColor(Color(#colorLiteral(red: 0.213047266, green: 0.3305280805, blue: 0.8173508048, alpha: 1)))
       
        .navigationBarHidden(true)
    
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
