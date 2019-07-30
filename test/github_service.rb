require 'minitest/autorun'
require 'minitest/pride'
require './lib/github_service'
require 'pry'

class GithubServiceTest < Minitest::Test

  def test_it_exists
    service = GithubService.new

    assert_instance_of GithubService, service
  end

  def test_it_can_positions
    service = GithubService.new
    job_data = service.get_postions

    assert_equal 50, job_data.length
  end

end
