//
//  FAQView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 25/03/2021.
//

import SwiftUI

struct FAQView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var isFaq_1 = false
    @State var isFaq_2 = false
    @State var isFaq_3 = false
    @State var isFaq_4 = false
    @State var isFaq_5 = false
    @State var isFaq_6 = false
    @State var isFaq_7 = false
    @State var isFaq_8 = false
    @State var isFaq_9 = false
    @State var isFaq_10 = false
    
    
    
    var question1 = "What is iCarePill App?"
    var answer1 = """
 iCarePill helps you manage and take your medication on time with our mobile medication management platform. iCarePill allows your family, friends & caregivers to register to administer the medicine.
"""
    var question2 = "iCarePill Privacy Policy"
    var answer2 = """
 The personal information you provide to us through your use of the Application is governed by our Privacy Policy. We respect your privacy, and a complete statement of our current privacy policy can be found on our website. We may update our policies and practices from time to time at our sole discretion.
"""
    var question3 = "Why should I create an account?"
    var answer3 = """
 When you create an account, your data is automatically backed up on our secured servers. This allows you to log back in to your iCarePill account and restore your data should you move to a new device or need to reinstall iCarePill.
"""
    var question4 = "How can I reset my password? "
    var answer4 = """
 In order to reset a password, please follow these steps:

 1. Tap “More” on the bottom menu and tap “Settings”

 2. Tap on “Login”

 3. Tap on “Reset Password”

 4. Enter the email address and phone number you used to create an account with iCarePill.

If the system doesn’t recognize your previous account, try to use another email, or send us an email to support@icarepill.com
"""
    
    var question5 = "How do I edit a medication?"
    var answer5 = """
In order to edit a medication, please follow these steps:

1. Tap “Medications” on the bottom menu

2. Swipe left on a medication and select “Edit”

3. Or tap on the medication and tap “Edit” on the top right

4. When you are done editing, tap “Update”
"""
    
    var question6 = "How do I delete a medication?"
    var answer6 = """
In order to delete a medication, please follow these steps:

1. Tap “Medications” on the bottom menu

2. Tap on the medication you want to delete and tap “Edit” on the top right

3. Scroll down to the bottom and tap “Delete”

4. Choose if you would like to save or delete the medication history
"""
    
    var question7 = "How do I add an appointment? "
    var answer7 = """
 Follow these steps to add an appointment:
 
1. Tap “More” on the bottom menu

2. Tap “Appointments” and tap on the ‘+’ on the top right

3. Enter your appointment details and tap “Save”
"""
    
    var question8 = "How can I see possible med interactions?"
    var answer8 = """
 1. Tap “Medications” on the bottom menu

 2. Tap on your medication

 3. Tap on the “Interactions” tab to see possible interactions
"""
    
    var question9 = "How did the idea come about?"
    var answer9 = """
 iCarePill founder started the company when his husband missed over-the-counter medication frequently and suffered.
"""
    
    var question10 = "How do I stop the refill reminders?"
    var answer10 = """
 If you do not want to receive refill reminders please do the following:
 
1. Tap “Medications” on the bottom menu

2. Tap on your medication

3. Tap “Edit” on the top right and then tap “Refill Reminder”

4. Turn off the “Refill Reminder” toggle
 
5. Tap the arrow back and tap “Update”

"""
    
    
    @State var QuestionList = [String]()
    @State var AnswerList = [String]()
   
    
    
    var body: some View {
        VStack{
            
            ScrollView{
                LazyVStack(content: {
                   
                    FAQCellView(expandState: $isFaq_1, question: question1, answer: answer1)
                    FAQCellView(expandState: $isFaq_2, question: question2, answer: answer2)
                    FAQCellView(expandState: $isFaq_3, question: question3, answer: answer3)
                    FAQCellView(expandState: $isFaq_4, question: question4, answer: answer4)
                    FAQCellView(expandState: $isFaq_5, question: question5, answer: answer5)
                    
                    FAQCellView(expandState: $isFaq_6, question: question6, answer: answer6)
                    FAQCellView(expandState: $isFaq_7, question: question7, answer: answer7)
                    FAQCellView(expandState: $isFaq_8, question: question8, answer: answer8)
                    FAQCellView(expandState: $isFaq_9, question: question9, answer: answer9)
                    FAQCellView(expandState: $isFaq_10, question: question10, answer: answer10)
                    
                })
                
                Text("For more query: help@icarepill.com")
                    .font(.subheadline)
                    .foregroundColor(.accentColor)
            }
            Spacer()
            
           

            
        }.preferredColorScheme(.light)
        .onAppear(){
            
            QuestionList = [question1,question2,question3,question4,question5,question6,question7,question8,question9,question10]
            AnswerList = [answer1,answer2,answer3,answer4,answer5,answer6,answer7,answer8,answer9,answer10]
        }
        .padding()
        .background(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
        
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }) {
                                    Image("back")
                                        .imageScale(.large)
                                }
        
        )
        .navigationBarTitleDisplayMode(.inline)
                .toolbar {
              
                    
                    ToolbarItem(placement: .principal) {
                        VStack {
                            Text("FAQs")
                                .font(.custom("Poppins-Medium", size: 18))
                                .foregroundColor(.accentColor)
                           
                        }
                    }
                }
    }
        
}

struct FAQView_Previews: PreviewProvider {
    static var previews: some View {
        FAQView()
    }
}

struct FAQCellView: View {
    
    
    @Binding var expandState : Bool
    var question :String
    var answer : String
    
    var body: some View {
        GroupBox{
            DisclosureGroup(
                question)
                {
                    Text(answer)
                        .font(.custom("Poppins-Regular", size: 12))
                    
                }
            
        }   .font(.custom("Poppins-Medium", size: 18))
        .foregroundColor(.black)
    }
}
