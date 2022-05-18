//
//  MazeTVAPIProvider.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 15/05/22.
//

class MazeTVAPIProvider: MazeTVDataProviderProtocol, DecodableDataLoader {
    let networkManager: NetworkRequestManagerProtocol
    let showListURL = "https://api.tvmaze.com/shows?page="
    let showListSearchURL = "https://api.tvmaze.com/search/shows?q="
    let showDetailURL = "https://api.tvmaze.com/shows/"
    let peopleURL = "https://api.tvmaze.com/people?page="
    let peopleSearchURL = "https://api.tvmaze.com/search/people?q="
    let personDetailURL = "https://api.tvmaze.com/people/"
    
    let castCreditsSuffix = "/castcredits?embed=show"
    let showSeasonListURLSuffix = "/seasons"
    let showEpisodeListURLSuffix = "/episodes"

    init(networkManager: NetworkRequestManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func loadShows(pageId: Int, completion: @escaping ([TVShow]?, Error?) -> Void) {
        loadDecodableData(url: showListURL + String(pageId), networkManager: networkManager, completion: completion)
    }
    
    func searchShows(text: String, completion: @escaping ([TVShowSearchResult]?, Error?) -> Void) {
        loadDecodableData(url: showListSearchURL + text, networkManager: networkManager, completion: completion)
    }
    
    func loadShowDetail(showId: Int, completion: @escaping (TVShowDetail?, Error?) -> Void) {
        loadDecodableData(url: showDetailURL + String(showId), networkManager: networkManager, completion: completion)
    }
    
    func loadShowEpisodeList(showId: Int, completion: @escaping ([TVShowEpisode]?, Error?) -> Void) {
        loadDecodableData(url: showDetailURL + String(showId) + showEpisodeListURLSuffix, networkManager: networkManager, completion: completion)
    }
    
    func loadPeople(pageId: Int, completion: @escaping ([Person]?, Error?) -> Void) {
        loadDecodableData(url: peopleURL + String(pageId), networkManager: networkManager, completion: completion)
    }
    
    func searchPeople(text: String, completion: @escaping ([PeopleSearchResult]?, Error?) -> Void) {
        loadDecodableData(url: peopleSearchURL + text, networkManager: networkManager, completion: completion)
    }
    
    func loadPersonCastCredits(personId: Int, completion: @escaping ([CastCredit]?, Error?) -> Void) {
        loadDecodableData(url: personDetailURL + String(personId) + castCreditsSuffix, networkManager: networkManager, completion: completion)
    }
}
