# frozen_string_literal: true

# Specs about replacing an image's file need the object the form actually sends
# — an uploaded file, not the io/filename hash the factory attaches with — and a
# way to name a fixture by its contents, so that "this file is the one stored"
# is an assertion about the bytes rather than about the name they arrived under.
module Uploads
  def upload(filename)
    Rack::Test::UploadedFile.new(fixture_file(filename), "image/png")
  end

  def checksum_of(filename)
    ActiveStorage.checksum_implementation.file(fixture_file(filename)).base64digest
  end

  private

  def fixture_file(filename)
    Rails.root.join("spec/fixtures/files", filename)
  end
end

RSpec.configure do |config|
  config.include Uploads
end
