defmodule RagnarCore.StringHelperTest do
  @moduledoc false

  use ExUnit.Case

  import RagnarCore.StringHelper

  test "string_contains_any_term?" do
    assert string_contains_any_term?(test_string(), ["RailS"])
    assert string_contains_any_term?(test_string(), ["raiLs", "Banana"])
    assert string_contains_any_term?(test_string(), ["Orange", "ReacT", "Banana"])

    refute string_contains_any_term?(test_string(), ["Orange", "Banana"])
    refute string_contains_any_term?(test_string(), ["Orange"])
  end

  test "string_contains_all_terms?" do
    assert string_contains_all_terms?(test_string(), ["RailS"])
    assert string_contains_all_terms?(test_string(), ["rAils"])
    assert string_contains_all_terms?(test_string(), ["rails", "react"])
    assert string_contains_all_terms?(test_string(), ["react", "rails"])
    assert string_contains_all_terms?(test_string(), ["react", "rails", "“GPS for learning"])

    refute string_contains_all_terms?(test_string(), ["Banana"])
    refute string_contains_all_terms?(test_string(), ["rails", "Banana"])
    refute string_contains_all_terms?(test_string(), ["grumpy dog", "react", "Banana"])
  end

  defp test_string do
    # This is a part of job's description which comes from weworkremotely.com rss feed.
    "<img src=\"https://we-work-remotely-production.imgix.net/logos/0001/6656/logo.gif?ixlib=rails-2.1.3&w=190&min-h=150\" alt=\"Logo.gif?ixlib=rails 2.1\" />\n<p>\n  <strong>Headquarters:</strong> Remote\n    <br /><strong>URL:</strong> <a href=\"https://www.chartlytics.com/\">https://www.chartlytics.com/</a>\n</p>\n\n<div><span></span></div><div><span><b>Front end react developer </b></span></div><div><br></div><div><span>Hiring: FrontEnd Javascript Developer with React experience</span></div><div><br></div><div><span>Hi! I'm Dave Stevens, Co-founder &amp; CEO of Chartlytics. We're looking for a very passionate front-end  javascript developer to help us build the most powerful behavior measurement platform for accelerating learning outcomes across all of human learning the world has ever seen! Phew...  </span></div><div><br></div><div><span><b>Accelerating learning outcomes</b></span></div><div><br></div><div><span>We are focused on helping those with special needs realize their potential by providing their care givers with a “GPS for learning”. With my business partner, Dr. Rick Kubina (Professor of Special Education at Penn State) we are transforming how teachers, analysts, coaches, and trainers understand the effects of their instruction on individuals so they can make more timely decisionsto produce accelerated outcomes."
  end
end
