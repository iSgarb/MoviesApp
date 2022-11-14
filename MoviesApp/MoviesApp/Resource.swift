//
//  Resource.swift
//  MoviesApp
//
//  Created by Sebastián García Burgos on 14/11/22.
//

import Foundation

struct Resource<P>{
    var _state: State = .READY
    var data: P? = nil
    var _errorMsg: String? = nil
    var _userErrorMsg: String? = nil
    var TAG: String = "Resource<\(String(describing: P.self))>"
    
    var state: State{
        return _state
    }
    
    var errorMsg: String?{
        return _errorMsg
    }
    
    var userErrorMsg: String{
        return _userErrorMsg ?? "Something went wrong"
    }
    
    var isLoading: Bool{
        self.state == .LOADING
    }
    
    /**
     Updates res data
     */
    mutating func update(
        state: State,
        desc: String? = nil,
        userDesc: String? = nil,
        data: P,
        logType: LogType? = nil
    ){
        self.data = data
        self.update(
            state: state,
            desc: desc,
            userDesc: userDesc,
            logType: logType
        )
    }
    
    /**
     Updates res data
     */
    mutating func update(
        state: State,
        desc: String? = nil,
        userDesc: String? = nil,
        logType _logType: LogType? = nil
    ){
        var logType = _logType
        
        if state == .LOADING {
            _errorMsg = nil
        }
        else if state == .ERROR {
            _errorMsg = desc
        }
        
        if logType == nil {
            switch state {
            case .LOADING:
                logType = .warning
            case .ERROR:
                logType = .error
            case .SUCCESS:
                logType = .success
            case .READY:
                logType = .action
            }
        }
        
        if let desc = desc {
            Logger.log(logType ?? .action, desc)
        }
        
        if let userDesc = userDesc {
            _userErrorMsg = userDesc
        }
        
        self._state = state
        Logger.log(.action, "\(TAG) new state: \(state)")
        
    }
}

extension Resource{
    enum State{
        case LOADING
        case ERROR
        case SUCCESS
        case READY
    }
}
