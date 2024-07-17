//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Mac on 6/29/24.
//  Copyright © 2024 Apple. All rights reserved.
//

//import SwiftUI
//
//struct ProfileSummary: View {
//    @Environment(ModelData.self) var modelData
//    @Binding var profile: Profile
//    
//    var body: some View {
//        ScrollView {
//            Text(profile.username)
//                .bold()
//                .font(.title)
//            Text("Notifications: \(profile.prefersNotifications ? "On" : "Off")")
//            Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
//            Text("Goal Date: ") + Text(profile.goalDate, style: .date)
//            Divider()
//            Text("Complted Badges")
//                .font(.headline)
//            ScrollView {
//                HStack {
//                    HikeBadge(name: "First Hike")
//                    HikeBadge(name: "Earth Day")
//                        .hueRotation(Angle(degrees: 90))
//                    HikeBadge(name: "Tenth Hike")
//                        .grayscale(0.5)
//                        .hueRotation(Angle(degrees: 45))
//                }
//                .padding(.bottom)
//            }
//        }
//        .toolbar {
//            ToolbarItem(placement: .topBarTrailing) {
//                NavigationLink(destination: {
//                    ProfileEdit(profile: $profile)
//                }, label: {
//                    Image(systemName: "pencil")
//                })
//            }
//        }
//    }
//}
import SwiftUI

struct ProfileSummary: View {
    @Environment(ModelData.self) var modelData
    @State private var profile: Profile = Profile.default
    
    var body: some View {
        ScrollView {
            Text(profile.username)
                .bold()
                .font(.title)
            Text("Notifications: \(profile.prefersNotifications ? "On" : "Off")")
            Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
            Text("Goal Date: ") + Text(profile.goalDate, style: .date)
            Divider()
            Text("Completed Badges")
                .font(.headline)
            ScrollView {
                HStack {
                    HikeBadge(name: "First Hike")
                    HikeBadge(name: "Earth Day")
                        .hueRotation(Angle(degrees: 90))
                    HikeBadge(name: "Tenth Hike")
                        .grayscale(0.5)
                        .hueRotation(Angle(degrees: 45))
                }
                .padding(.bottom)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(destination: {
                    ProfileEdit(profile: $profile)
                }, label: {
                    Image(systemName: "pencil")
                })
            }
        }
        .onAppear {
            if let savedProfileData = UserDefaults.standard.data(forKey: "profileData"),
               let savedProfile = try? JSONDecoder().decode(Profile.self, from: savedProfileData) {
                profile = savedProfile
            }
        }
    }
}


//#Preview {
//    ProfileSummary(profile: .default)
//        .environment(ModelData())
//}
