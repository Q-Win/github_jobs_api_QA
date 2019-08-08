require 'minitest/autorun'
require 'minitest/pride'
require './lib/github_service'
require 'pry'

class GithubServiceTest < Minitest::Test

  def test_it_exists
    service = GithubService.new

    assert_instance_of GithubService, service
  end

  def test_it_can_get_positions
    service = GithubService.new
    job_data = service.get_postions

    assert_equal 50, job_data.length
  end

  def test_it_can_get_positions_for_a_city
    service = GithubService.new
    job_data = service.get_positions_for_city("Chicago")

    assert_equal "Chicago, IL", job_data[0]["location"]
  end

  def test_it_can_use_multiple_params
    service = GithubService.new
    job_data = service.get_positions_for_multiple_params("location=Chicago")
    job_data_2 = service.get_positions_for_multiple_params("location=Chicago&description=Ruby")

    assert_equal "Chicago, IL", job_data[0]["location"]
    assert_equal "Chicago, IL", job_data_2[0]["location"]
    assert_includes job_data_2[0]["description"], "Ruby"
  end

  def test_it_can_return_full_time_positions
    service = GithubService.new
    job_data = service.get_positions_for_multiple_params("location=Chicago&full_time=true")

    assert_equal "Full Time", job_data[0]["type"]
    assert_equal "Full Time", job_data[-1]["type"]
  end


end
