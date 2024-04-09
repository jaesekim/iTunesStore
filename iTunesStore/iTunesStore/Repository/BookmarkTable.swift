//
//  BookmarkTable.swift
//  iTunesStore
//
//  Created by 김재석 on 4/8/24.
//

import Foundation
import RealmSwift

class BookmarkTable: Object {
    @Persisted(primaryKey: true) var pk: ObjectId
    @Persisted var trackId: Int
    
    convenience init(trackId: Int) {
        self.init()
        self.trackId = trackId
    }
}
