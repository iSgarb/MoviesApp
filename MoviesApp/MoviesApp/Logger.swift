//
//  Logger.swift
//  MoviesApp
//
//  Created by Sebastián García Burgos on 14/11/22.
//

import Foundation

enum LogType: String{
case error
case warning
case success
case action
case canceled
case initizialized
}


class Logger{

 static func log(_ logType:LogType,_ message:String){
        switch logType {
        case LogType.error:
            print("\n📕 Error: \(message)\n")
        case LogType.warning:
            print("\n📙 Warning: \(message)\n")
        case LogType.success:
            print("\n📗 Success: \(message)\n")
        case LogType.action:
            print("\n📘 Action: \(message)\n")
        case LogType.canceled:
            print("\n📓 Cancelled: \(message)\n")
        case .initizialized:
            print("\n🚦 Init: \(message)\n")
        }
    }

}
