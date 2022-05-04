require "spec_helper"


describe Videodrome::Video do
  subject(:video) { Videodrome::Video.new(url) }

  context "given a valid URL" do
    let(:url) { "https://youtube.com/watch?v=NZ8RiLLt6yg" }
    let(:attrs) do
      {
        :published_at => Time.iso8601("2013-09-05T21:01:57.000Z"),
        :title => "The Mercedes-Benz CLA (a car commercial)",
        :thumbnails => {
          "default" => { "url" => "https://i.ytimg.com/vi/NZ8RiLLt6yg/default.jpg", "width" => 120, "height" => 90 },
          "medium" => { "url" => "https://i.ytimg.com/vi/NZ8RiLLt6yg/mqdefault.jpg", "width" => 320, "height" => 180 },
          "high" => { "url" => "https://i.ytimg.com/vi/NZ8RiLLt6yg/hqdefault.jpg", "width" => 480, "height" => 360 },
          "standard" => { "url" => "https://i.ytimg.com/vi/NZ8RiLLt6yg/sddefault.jpg", "width" => 640, "height" => 480 }
        },
        :embeddable => true,
        :embed_html => '<iframe width="480" height="270" src="//www.youtube.com/embed/NZ8RiLLt6yg" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>'
      }
    end
    describe "#published_at" do
      it { expect(video.published_at).to eq attrs[:published_at] }
    end
    describe "#title" do
      it { expect(video.title).to eq attrs[:title] }
    end
    describe "#thumbnails" do
      it("returns multiple thumbnails") { expect(video.thumbnails.size).to eq attrs[:thumbnails].size }
    end
    describe "#thumbnail" do
      it { expect(video.thumbnail["width"]).to eq attrs[:thumbnails]["standard"]["width"] }
      it { expect(video.thumbnail["height"]).to eq attrs[:thumbnails]["standard"]["height"] }
      it { expect(video.thumbnail["url"]).to eq attrs[:thumbnails]["standard"]["url"] }
    end
    describe "#embeddable" do
      it { expect(video.embeddable).to be attrs[:embeddable] }
    end
    describe "#embed_html" do
      it("returns the embeddable player iframe") { expect(video.embed_html).to eq attrs[:embed_html] }
    end
  end
  context "given a video with no standard thumbnail" do
    let(:url) { "https://www.youtube.com/watch?v=xQUCxHj17tA" }
    describe "#thumbnails" do
      it("returns no standard thumbnail") { expect(video.thumbnail).to be nil }
      it("returns others thumbnails") { expect(video.thumbnails.size).to be > 0 }
    end
  end

end
