//
//  Episode.swift
//  Audyo
//
//  Created by Jonathan Gikabu on 21/08/2021.
//

import Foundation

struct Episode: Hashable {
    var id: String = ""
    var title: String = ""
    var publisher: String = ""
    var series: String = ""
    var url: String = ""
    var duration: Int = 0
    var timestamp: String = ""
    
    
    static func sampleList() -> [Episode] {
        var list = [Episode]()
        list.append(Episode(id: UUID().uuidString, title: "Uganda, too much surveillance?", publisher: "BBC World Service", series: "Digital Planet", url: "http://open.live.bbc.co.uk/mediaselector/6/redir/version/2.0/mediaset/audio-nondrm-download-low/proto/http/vpid/p09sh7yz.mp3", duration: 43, timestamp: "Aug 2021"))
        list.append(Episode(id: UUID().uuidString, title: "Fears over Afghan biometric data", publisher: "BBC World Service", series: "Tech Tent", url: "http://open.live.bbc.co.uk/mediaselector/6/redir/version/2.0/mediaset/audio-nondrm-download-low/proto/http/vpid/p09sp2zr.mp3", duration: 24, timestamp: "Aug 2021"))
        list.append(Episode(id: UUID().uuidString, title: "AI inventors; “Affectivism” and the problem with Virtual Reality", publisher: "ABC Radio National", series: "Future Tense", url: "https://abcmedia.akamaized.net/rn/podcast/2021/08/fte_20210822.mp3", duration: 30, timestamp: "Aug 2021"))
        list.append(Episode(id: UUID().uuidString, title: "Internet shutdowns in Latin America", publisher: "BBC World Service", series: "Digital Planet", url: "http://open.live.bbc.co.uk/mediaselector/6/redir/version/2.0/mediaset/audio-nondrm-download-low/proto/http/vpid/p09pyz2d.mp3", duration: 48, timestamp: "Jul 2021"))
        list.append(Episode(id: UUID().uuidString, title: "Brazil’s Data Protection Law comes into force", publisher: "BBC World Service", series: "Digital Planet", url: "http://open.live.bbc.co.uk/mediaselector/6/redir/version/2.0/mediaset/audio-nondrm-download-low/proto/http/vpid/p09rw72t.mp3", duration: 42, timestamp: "Aug 2021"))
        return list
    }
    
}
