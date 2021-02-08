Feature: Actions with posts

  Scenario: Get post by id
    When I get "/posts/1"
    Then the JSON response should be:
    """
    {
      "id": 1,
      "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
      "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
      "userId": 1
    }
    """

  Scenario: Find user posts
    When I get "/posts/?userId=1"
    Then the JSON response should have 10 entry
    And the JSON array should have value 1 for key userId for all entries

  Scenario: Create posts
    When I post to "/posts" with:
    """
    [{
      "id": 1,
      "title": "testTitle",
      "body": "testBody",
      "userId": 1,
      "test": 0
    },
    {
      "id": 2,
      "title": "testTitle2",
      "body": "testBody2",
      "userId": 1
    }]
    """
    And I keep the JSON as "create_posts_body"
    Then the JSON response should be %{create_posts_body}