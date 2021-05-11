import UIKit

// ************************* ON TIME NOTIFICATION *************************

//************* Fajr Notification


func fajrNotification(latitude:Double, Longitude: Double){


// ************ Namaz Time


var splittedTime = [String]()


let cal = Calendar(identifier: Calendar.Identifier.gregorian)
let date = cal.dateComponents([.year, .month, .day], from: Date())
let coordinates = Coordinates(latitude: latitude, longitude: Longitude)
var params = CalculationMethod.muslimWorldLeague.params
params.madhab = .hanafi
if let prayers = PrayerTimes(coordinates: coordinates, date: date, calculationParameters: params) {
let formatter = DateFormatter()
formatter.timeStyle = .short
formatter.dateFormat = "HH:mm"
//            formatter.timeZone = TimeZone(identifier: "Asia/Karachi")!




let namazTime = formatter.string(from: prayers.fajr)
print(namazTime)


splittedTime = namazTime.split(separator: ":").map({ (substring) in
 return String(substring)
})







}




//************** Notification Block
let Content = UNMutableNotificationContent()
Content.title = "Fajr at \(time[0])"
Content.subtitle = "View all prayers time"
Content.sound = .default

var dateComponent  = DateComponents()
//        dateComponent.hour = 21
//        dateComponent.minute = 44
dateComponent.hour = Int(splittedTime[0])
dateComponent.minute = Int(splittedTime[1])

let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent , repeats: true)

let request = UNNotificationRequest(identifier: "fajr", content: Content, trigger: trigger)


UNUserNotificationCenter.current().getDeliveredNotifications { (request) in

let count  = self.notificationCount + 1
UIApplication.shared.applicationIconBadgeNumber =  count

}

UNUserNotificationCenter.current().add(request)

}
