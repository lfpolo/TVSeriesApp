# TVSeriesApp

Tv series app with data provided by the MazeTV API

The entire project was developed with native tools: network calls with URLSession, local storage with CoreData, data decoding with the Decodable protocol and UI built programmatically with UIKit and Auto Layout.

I didn’t have time to develop tests, but the app supports testing, it was developed with protocols and dependency injection to get loosely coupled and testable code.  

Network requests were built using URLSession, so cache is handled by NSURLCache (with its default cache policy value: NSURLRequestUseProtocolCachePolicy), which provides both memory and persistent storage caches.

As no external libraries were used, no special step is needed to run the project. Just clone and it is ready to use.

All mandatory features were completed.

Completed bonus tasks: 
- Allow the user to save a series as a favorite.
- Allow the user to delete a series from the favorites list.
- Allow the user to browse their favorite series in alphabetical order, and click on one to see its details.
- Create a people search by listing the name and image of the person.
- After clicking on a person, the application should show the details of that person, such as: name, image, series they have participated in, with a link to the series details

Improvements I would do with more time:
- Show erros: request or decoding errors are sent to the view controller, but still not shown to the user.
- To decrease network usage, it would be better not to send a search request for every character typed by the user. This can be implemented with a timer that waits something like 2 or 3 seconds after the user stops typing, and only then sends the request.
- Unit tests
