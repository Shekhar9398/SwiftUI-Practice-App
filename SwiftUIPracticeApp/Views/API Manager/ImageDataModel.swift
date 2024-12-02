
import Foundation
struct ImageData : Codable {
    let success : Bool?
    let total_photos : Int?
    let message : String?
    let offset : Int?
    let limit : Int?
    let photos : [Photos]?
    
    enum CodingKeys: String, CodingKey {
        
        case success = "success"
        case total_photos = "total_photos"
        case message = "message"
        case offset = "offset"
        case limit = "limit"
        case photos = "photos"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        total_photos = try values.decodeIfPresent(Int.self, forKey: .total_photos)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        offset = try values.decodeIfPresent(Int.self, forKey: .offset)
        limit = try values.decodeIfPresent(Int.self, forKey: .limit)
        photos = try values.decodeIfPresent([Photos].self, forKey: .photos)
    }
}

struct Photos : Codable {
    let url : String?
    let title : String?
    let user : Int?
    let description : String?
    let id : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case url = "url"
        case title = "title"
        case user = "user"
        case description = "description"
        case id = "id"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        user = try values.decodeIfPresent(Int.self, forKey: .user)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
    }
    
}

