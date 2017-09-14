defmodule RagnarCore.StringHelperTest do
  @moduledoc false

  use ExUnit.Case

  import RagnarCore.StringHelper

  test "string_contains_any_term?" do
    assert string_contains_any_term?(test_string(), ["Engineer"])
    assert string_contains_any_term?(test_string(), ["engineer"])
    assert string_contains_any_term?(test_string(), ["Orange", "Engineer", "Banana"])

    refute string_contains_any_term?(test_string(), ["Orange", "Banana"])
  end

  test "string_contains_all_terms?" do
    assert string_contains_all_terms?(test_string(), ["Engineer"])
    assert string_contains_all_terms?(test_string(), ["Engineer", "Parse.ly"])
    assert string_contains_all_terms?(test_string(), ["New York", "Engineer", "best-looking dashboards"])

    refute string_contains_all_terms?(test_string(), ["Engineer", "Banana"])
    refute string_contains_all_terms?(test_string(), ["grumpy dog", "Engineer", "Banana"])
  end

  defp test_string do
    # This is a part of job's description which comes
    # from weworkremotely.com rss feed.
    "\n\n\n  Headquarters: New York, NY\n    URL: http://parse.ly\n\n\nWhat's Parse.ly?We've built a real-time content measurement layer for the entire web.Our analytics platform helps digital storytellers at some of the web's best sites, such as Arstechnica, The New Yorker, TechCrunch, The Intercept, Mashable, and many more. In total, our analytics system needs to handle over 100 billion monthly events from over 1 billion monthly unique visitors.Our entire stack is in Python and JavaScript, and our team has innovated in areas related to real-time analytics, building some of the best open source tools for working with modern stream processing technologies. Our UX/design team has also built one of the best-looking dashboards on the planet, using AngularJS and d3.js. You can see some screenshots: http://parse.ly/tour\nOur distributed team is best-in-class and we happily skip commutes by working out of our ergonomic home offices. Here's a photograph of mine running two full-screen Parse.ly dashboards on my monitors: https://flic.kr/p/v1NZ73\nTo see an example of how we work, check out the blog post, Whatever It Takes: http://blog.parsely.com/post/46\n\nWhat's a Customer Success Engineer?\nCode + Communication = Customer Success.\n"
  end
end
