require 'faraday'

class GithubService


  def get_postions
    get_json("/positions.json?")
  end

  def get_json(url)
    response = conn.get(url)

    JSON.parse(response.body, symbolize_name: true)
  end


  def conn
    Faraday.new(url: 'https://jobs.github.com')
  end

end
