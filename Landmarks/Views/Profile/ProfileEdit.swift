//
//  ProfileEdit.swift
//  Landmarks
//
//  Created by Ульяна Евстигнеева on 16.07.2024.
//  Copyright © 2024 Apple. All rights reserved.
//

//import SwiftUI
//
//struct ProfileEdit: View {
//    @Binding var profile: Profile
////    @State private var selectedDate = Date()
////    @State private var username = ""
//    @Environment(\.presentationMode) var presentationMode
//    
//    var body: some View {
//        VStack {
//            HStack {
//                Text("Name")
//                TextField("Username", text: $profile.username)
//            }
////            TextField("Username", text: $profile.username)
//            Toggle(isOn: $profile.prefersNotifications) {
//                Text("Notifications")
//            }
//            Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
//                ForEach(Profile.Season.allCases) { season in
//                    Text(season.rawValue).tag(season)
//                }
//            }
//            .pickerStyle(.segmented)
//            DatePicker("Select Date", selection: $profile.goalDate, displayedComponents: .date)
//                .datePickerStyle(GraphicalDatePickerStyle())
//   
//            Spacer()
//            
//            Button {
////                UserDefaults.standard.saveProfile(profile)
//                UserDefaults.standard.setValue(profile, forKey: "profileData")
//                self.presentationMode.wrappedValue.dismiss()
////                UserDefaults.standard.setValue(profile, forKey: "profileData")
//            } label: {
//                Text("Save")
//                    .frame(maxWidth: .infinity)
//                    .frame(height: 50)
//                    .background(.blue)
//                    .clipShape(Capsule())
//                    .foregroundStyle(.white)
//                
//            }
//
//        }
//        .bold()
//        .padding()
//        .padding(.horizontal, 20)
//    }
//}
import SwiftUI

struct ProfileEdit: View {
    @Binding var profile: Profile
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Text("Name")
                TextField("Username", text: $profile.username)
            }
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Notifications")
            }
            Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                ForEach(Profile.Season.allCases) { season in
                    Text(season.rawValue).tag(season)
                }
            }
            .pickerStyle(.segmented)
            DatePicker("Select Date", selection: $profile.goalDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
   
            Spacer()
            
            Button {
                if let encodedProfile = try? JSONEncoder().encode(profile) {
                    UserDefaults.standard.set(encodedProfile, forKey: "profileData")
                }
//                self.presentationMode.wrappedValue.dismiss()
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Save")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .foregroundStyle(.white)
            }
        }
        .bold()
        .padding()
        .padding(.horizontal, 20)
    }
}

    #Preview {
            ProfileEdit(profile: .constant(Profile.default))
    }


