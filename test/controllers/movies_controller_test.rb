require "test_helper"

class MoviesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/movies.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Movie.count, data.length
  end

  test "create" do
    assert_difference "Movie.count", 1 do
      post "/movies.json", params: { title: "Willow", genre: "Adventure", year: 1988 }
      assert_response 200
    end
  end

  test "show" do
    get "/movies/#{Movie.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "title", "genre", "year", "created_at", "updated_at"], data.keys
  end
end
