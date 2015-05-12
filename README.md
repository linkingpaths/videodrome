# Videodrome

Access metadata of **public videos** on Youtube using YouTube Data API v3. Please see the documentation for this API at https://developers.google.com/youtube/v3/.

Videodrome is designed to be minimal on its features and dependencies and to work with all Ruby versions (>= 1.8.6). Videodrome can only access public information since it **does not provides** any authentication method to access to [private user data](https://developers.google.com/youtube/v3/guides/authentication). 

If you want a fully featured YouTube API client please check the excelent [yt](https://github.com/Fullscreen/yt) gem.

## Installation

Add this line to your application's Gemfile:

    gem 'videodrome'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install videodrome

## Setup

Although Videodrome does not require any user authentication, the new Youtube API requires to sign all calls with an API key, even if you are accessing only public data. Please follow the steps at [Obtaining authorization credentials](https://developers.google.com/youtube/registering_an_application) to generate a server key. 

Once you have the API key, the easiest to provide it to Videodrome is to set it up in your environment:

```
VIDEODROME_YOUTUBE_API_KEY="AIzaS…wGhuD"
```

For 

## Usage

Once the API Key is available to Videodrome, retrieve the metadata of a video using its URL:

```
video = Videodrome::Video.new("https://youtube.com/watch?v=NZ8RiLLt6yg")
video.title # "The Mercedes-Benz CLA (a car commercial)"
video.published_at # Thu Sep 05 21:01:57 UTC 2013
```

## To-do

Provide mocks to prevent real requests to the Youtube API when running the specs.

## Contributing

1. Fork it ( http://github.com/<my-github-username>/videodrome/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
