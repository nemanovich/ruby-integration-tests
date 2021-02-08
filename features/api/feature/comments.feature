Feature: Get comments

  Scenario: Get comments from post
    When I get "/posts/1/comments"
    Then the JSON response at "0" should be:
    """
    {
      "postId": 1,
      "id": 1,
      "name": "id labore ex et quam laborum",
      "email": "Eliseo@gardner.biz",
      "body": "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"
    }
    """
    And the JSON should have 5 entry
    And the JSON array should have value 1 for key postId for all entries