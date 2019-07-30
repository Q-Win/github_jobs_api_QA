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

  def test_it_can_positions_for_a_city
    service = GithubService.new
    job_data = service.get_positions_for_city("Chicago")

    assert_equal "Chicago, IL", job_data[0]["location"]
  end

end
