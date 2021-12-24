class BookClient
  def all_books
    access_token = File.readlines("config/book_api.rb")[0].chomp
    uri = URI("https://debugging-workshops-api.herokuapp.com/api/books?access_token=#{access_token}")
    response = Net::HTTP.start(uri.host) do |http|
      req = Net::HTTP::Get.new(uri)
      http.request(req)
    end

    response = JSON.parse(response.body)

    response.map(&:symbolize_keys)
  end
end
