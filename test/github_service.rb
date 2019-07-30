require 'minitest/autorun'
require 'minitest/pride'
require './lib/github_service'
require 'pry'

class GithubServiceTest < Minitest::Test

  def test_it_exists
    service = GithubService.new

    assert_instance_of GithubService, service
  end

end
