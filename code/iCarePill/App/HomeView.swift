//
//  HomeView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 22/03/2021.
//

import SwiftUI
import SDWebImageSwiftUI


var userDetail : User?

struct HomeView: View {
    

    @State var medicineData = [Medicine]()
    @State  var isNewEntry = false
    @State  var isDayReminder = false
    @State  var isActiveAlert = false
    @State  var userName = ""
    @State  var selectedIndex = -1
    
    
    
    @State  var takenStatus = [Int]()
    @State  var skipStatus = [Int]()

    
    
    
    
    var body: some View {
        
        
        VStack{

                HStack{
                    
                    let imageurl  = URL(string: userDetail?.dp ?? "")
                    
                    WebImage(url: imageurl)
                        .placeholder(Image(uiImage: UIImage(named: "dp")!
                        ))
                        .resizable()
                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .scaledToFill()
                        .clipShape(Circle())
                        .shadow(radius: 3)
                        .padding()
                    
                    VStack(alignment:.leading){
                        Text("Hello, \(userName)!")
                            .font(.custom("Poppins-Medium", size: 18))
                            
                           
                            
                        Text("Good Morning")
                            .font(.custom("Poppins-Medium", size: 18))
                            .foregroundColor(.accentColor)
                            
                           
                           
                    }
                    Spacer()
                    
                    NavigationLink(
                        destination: AddMedicineView(),
                        isActive: $isNewEntry,
                        label: {
                            Button(action: {
                                isNewEntry.toggle()
                            }, label: {
                                Image("add_button")
                                    .padding(.trailing)
                            })
                        })
                   
                }.background(
                    Rectangle()
                        .foregroundColor(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
                        .shadow(radius: 6 )
                        .frame(height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .edgesIgnoringSafeArea(.all)
                        
                )
                .padding(.bottom, 30)
               
                
       
            NavigationLink(
                destination: DayReminderView(dateValue: .constant(Date())),
                isActive: $isDayReminder,
                label: {
                    Button(action: {
                        isDayReminder.toggle()
                    }, label: {
                        VStack{
                            
                            
                            HStack{
                                HomeCenterButtonView(imageName: "morning", title: " Morning")
                                  
                                
                                HomeCenterButtonView(imageName: "sun", title: " Afternoon")
                                                    }

                            HStack{
                                HomeCenterButtonView(imageName: "evening", title: " Evening")
                                   
                                
                                HomeCenterButtonView(imageName: "moon", title: " Night")
                                    
                            }
                            
                    
                                
                        }
                    })
                })
      
    
          
                VStack(alignment:.leading){
                    
                    Text("My Medicines")
                        .font(.custom("Poppins-Medium", size: 18))
                        .foregroundColor(.black)
                        .padding()
                    
                    
                    
                    
                    ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
                    LazyVStack{
                        
                        
                    
                    
                        
                        ForEach(0..<medicineData.count, id:\.self){ i in
            
                            
                            Button(action: {
                                isActiveAlert.toggle()
                                
                                self.selectedIndex = i
                                
                            }, label: {
                                
                                
                                
                                if self.takenStatus.contains(i){
                                    HomeCellView(ImageTitle: medicineData[i].Apperance, MedicineTitle: medicineData[i].Title, Dose: "\(medicineData[i].Strength)\(medicineData[i].unit)", Time: "\((medicineData[i].notification.first)!)", status: "taken")
                                        .padding(.bottom, 10).tag(medicineData[i].id)
                                }
                             
                                
                                else if self.skipStatus.contains(i){
                                    HomeCellView(ImageTitle: medicineData[i].Apperance, MedicineTitle: medicineData[i].Title, Dose: "\(medicineData[i].Strength)\(medicineData[i].unit)", Time: "\((medicineData[i].notification.first)!)", status: "skip")
                                        .padding(.bottom, 10).tag(medicineData[i].id)
                                }
                                
                                else{
                                HomeCellView(ImageTitle: medicineData[i].Apperance, MedicineTitle: medicineData[i].Title, Dose: "\(medicineData[i].Strength)\(medicineData[i].unit)", Time: "\((medicineData[i].notification.first)!)", status: "")
                                    .padding(.bottom, 10).tag(medicineData[i].id)
                            }
                            })

                            
                           
                        }
    
                    }
                    .padding()
                    }
                    
                }
                .background(
                    Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1))
                )
                
        
         
            Spacer()
    }.navigationBarHidden(true)
        .onAppear(){
            let VM = FirebaseViewModel()
            
            
            //USER
            VM.GetUser(collectionTitle: "Users") { (status, details, err) in
                
                if status{
                    userDetail = details
                    
                    
                    userName = (details!.first)!
                }else{
                    print("\(err!)")
                }
                
            }
            
            //MEDICINE
            VM.GetCollection(collectionTitle: "Medicine", subCollectionTitle: "Stock") { (status, details : [Medicine], err) in
                
                if status{
                    
                    
                    medicineData = details
                }else{
                    print("\(err!)")
                }
                
            }
        }
        .actionSheet(isPresented: $isActiveAlert) { () -> ActionSheet in
            
            let takenButton = ActionSheet.Button.default(Text("Taken")) {
                print("TAKEN")
                
                print(medicineData[self.selectedIndex].Title)
                
                
                //*SKIP*
                let skipIndex = self.takenStatus.firstIndex(of: self.selectedIndex)
                
                print(skipIndex)
                
                if let value = skipIndex{
                    print("remove \(value)")
                    
                    self.skipStatus.remove(at: value)
                }
                
                
                //*TAKEN*
                let takenIndex = self.takenStatus.firstIndex(of: self.selectedIndex)
                
                print(takenIndex)
                
                if let value = takenIndex{
                    print("remove \(value)")
                    
                    self.takenStatus.remove(at: value)
                }else{
                    print("added")
                    self.takenStatus.append(self.selectedIndex)
                }
                
                
                
            }
            let skipButton = ActionSheet.Button.destructive(Text("Skip")) {
                print("SKIP")
                
                let TakenIndex = self.takenStatus.firstIndex(of: self.selectedIndex)
                
                print(TakenIndex)
                
                if let value = TakenIndex{
                    print("remove \(value)")
                    
                    self.takenStatus.remove(at: value)
                }
                
                
                //*TAKEN*
                let skipIndex = self.takenStatus.firstIndex(of: self.selectedIndex)
                
                print(skipIndex)
                
                if let value = skipIndex{
                    print("remove \(value)")
                    
                    self.skipStatus.remove(at: value)
                }else{
                    print("added")
                    self.skipStatus.append(self.selectedIndex)
                }
                
            }
            
            return ActionSheet(title: Text("Action"), message: nil, buttons: [takenButton, skipButton])
            
            
        }
        
        
       
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct HomeCenterButtonView: View {
    
    var imageName : String
    var title : String
    
    var body: some View {
        
        VStack{
            
            ZStack{
                
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
                    .frame(width: 150, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 1 )
                
                VStack{
                    Image(imageName)
                    Text(title)
                        .font(.custom("Poppins-Medium", size: 18))
                        .foregroundColor(.black)
                }
                
            }

        
        }
        .padding()
    }
}

struct HomeCellView: View {
    
    var ImageTitle: String
    var MedicineTitle : String
    var Dose : String
    var Time : String
    var status : String
    
    var body: some View {
        VStack{
            
            ZStack{
                
                
                
                
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                    .frame(height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 3)
                
                HStack{
                    Image(ImageTitle)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    VStack(alignment:.leading){
                        Text(MedicineTitle)
                            .font(.custom("Poppins-Medium", size: 12))
                            .foregroundColor(Color(#colorLiteral(red: 0.4979991317, green: 0.4980617762, blue: 0.4979779124, alpha: 1)))
                        
                        Text(Dose)
                            .font(.custom("Poppins-Medium", size: 10))
                            .foregroundColor(Color(#colorLiteral(red: 0.6626930237, green: 0.662774384, blue: 0.6626655459, alpha: 1)))
                        
                        Text(Time)
                            .font(.custom("Poppins-Medium", size: 10))
                            .foregroundColor(Color(#colorLiteral(red: 0.6626930237, green: 0.662774384, blue: 0.6626655459, alpha: 1)))
                        
                        
                        
                    }
                    
                    Spacer()
                    
                    Image(status)
                }.padding()
                
                
            }
        }
    }
}
