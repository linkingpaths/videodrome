# Videodrome

Access metadata of **public videos** on Youtube using YouTube Data API v3. Please see the documentation for this API at https://developers.google.com/youtube/v3/.

Videodrome is designed to be minimal in its features and dependencies and to work with any Ruby versions > 2. Videodrome can only access public information since it **does not provides** any authentication method to access [private user data](https://developers.google.com/youtube/v3/guides/authentication).

If you want a fully-featured YouTube API client, please check the excellent [yt](https://github.com/Fullscreen/yt) gem.

## Installation

Add this line to your application's Gemfile:

    gem 'videodrome'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install videodrome

## Setup

Although Videodrome does not require any user authentication, the new Youtube API requires to sign all calls with an API key, even if you are accessing only public data. To generate a server key, please follow the steps at [Obtaining authorization credentials](https://developers.google.com/youtube/registering_an_application).

Once you have the API key, the easiest way to provide it to Videodrome is to set it up in your environment:

```sh
VIDEODROME_YOUTUBE_API_KEY="AIzaS…wGhuD"
```

## Usage

Once the API Key is available to Videodrome, retrieve the metadata of a video using its URL:

```ruby
video = Videodrome::Video.new("https://youtube.com/watch?v=NZ8RiLLt6yg")
video.title # "The Mercedes-Benz CLA (a car commercial)"
video.published_at # Thu Sep 05 21:01:57 UTC 2013
video.thumbnail["url"] # "https://i.ytimg.com/vi/NZ8RiLLt6yg/sddefault.jpg"
video.embed_html # <iframe type='text/html' src='http://www.youtube.com/embed/NZ8RiLLt6yg' … />
```

URL short versions are also supported:

```ruby
Videodrome::Video.new("https://youtu.be/NZ8RiLLt6yg")
```

Customize the API call by proving an option hash to the initialization. For details on the parameters you can use please check [the Videos:list documentation](https://developers.google.com/youtube/v3/docs/videos/list#part).

```ruby
Videodrome::Video.new("https://youtu.be/NZ8RiLLt6yg", :part => "snippet,player,contentDetails,status,fileDetails")
```

This customization can be used too to explictly provide the API key to sign the calls:

```ruby
Videodrome::Video.new("https://youtu.be/NZ8RiLLt6yg", :key => "AIzaS…wGhuD")
```

## To-do

Provide mocks to prevent real requests to the Youtube API when running the specs.

## Contributing

1. Fork it ( http://github.com/<my-github-username>/videodrome/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
