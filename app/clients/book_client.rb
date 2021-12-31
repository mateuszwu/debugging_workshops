class BookClient
  def all_books
    access_token = File.read("config/book_api.rb").chomp
    uri = URI("http://localhost/api/books?access_token=#{access_token}")
    response = Net::HTTP.start(uri.host, 3001) do |http|
      req = Net::HTTP::Get.new(uri)
      http.request(req)
    end

    response = JSON.parse(response.body)

    response.map(&:symbolize_keys)
  end
end
