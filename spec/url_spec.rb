require "spec_helper"

describe Videodrome::URL do
  context "given an valid video URL" do
    subject(:parser) { Videodrome::URL.new(url) }
    describe "parsing a long video URL" do
      let(:url) { "https://youtube.com/watch?v=NZ8RiLLt6yg" }
      it { expect(parser.id).to eq "NZ8RiLLt6yg" }
    end

    context "parsing a short video URL" do
      let(:url) { "https://youtu.be/NZ8RiLLt6yg" }
      it { expect(parser.id).to eq "NZ8RiLLt6yg" }
    end

    context "parsing a URL with a trailing slash" do
      let(:url) { "https://youtube.com/watch?v=NZ8RiLLt6yg" }
      it { expect(parser.id).to eq "NZ8RiLLt6yg" }
    end
  end

  #context "given an invalid video URL" do
  #  #subject(:parser) { Videodrome::URL.new(url) }
  #  let(:url) { "https://vimeo.com" }
  #  #it { expect(Videodrome::URL.new("")).to raise_error Videodrome::Errors::InvalidURL }
  #  it { expect(Videodrome::URL.new("")).to raise_error }
  #end
end
