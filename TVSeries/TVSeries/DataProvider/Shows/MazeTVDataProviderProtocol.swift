//
//  MazeTVDataProviderProtocol.swift
//  TVSeries
//
//  Created by Luis Felipe Polo on 15/05/22.
//

protocol MazeTVDataProviderProtocol {
    func loadShows(pageId: Int, completion: @escaping ([TVShow]?, Error?) -> Void)
    func searchShows(text: String, completion: @escaping ([TVShowSearchResult]?, Error?) -> Void)
    func loadShowDetail(showId: Int, completion: @escaping (TVShowDetail?, Error?) -> Void)
    func loadShowEpisodeList(showId: Int, completion: @escaping ([TVShowEpisode]?, Error?) -> Void)
    func loadPeople(pageId: Int, completion: @escaping ([Person]?, Error?) -> Void)
    func searchPeople(text: String, completion: @escaping ([PeopleSearchResult]?, Error?) -> Void)
    func loadPersonCastCredits(personId: Int, completion: @escaping ([CastCredit]?, Error?) -> Void)
}
