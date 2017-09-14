defmodule JobDetailsFactory do
  @moduledoc false

  def weworkremotely_roaster_tools do
    %RagnarCore.JobDetails{
      client: "we_work_remotely",
      description: "\n\n\n  Headquarters: Portland, Oregon\n    URL: https://roastertools.typeform.com/to/vxm1T5\n\n\n\nLove coffee?  Love the idea of solving everyday problems for the coffee roasters who roast, package and deliver your coffee?We do too.  We are coffee veterans with a strong vision for how to serve the rapidly-growing coffee community with software.You’ll join our team of four, and contribute immediately.  You’ll have a clear roadmap with strong dev and QC processes already in place, enabling you to build and deploy features your first week.You’ll join a team that thrives on moving fast and simply gets shit done.Our Stack and Dev ProcessOur stack is Rails 4, Ruby 2.X, Heroku, Postgres, S3, Sidekiq + Redis, plus a dash of React.  It’s an intentionally vanilla stack, since we’re solving complex, real problems and technology is just a means to an end.We use continuous integration via CircleCI, check code quality via CodeClimate and rely heavily on Heroku’s pipeline feature to QA features before deploying to staging and finally production.We aim to be a high velocity team that’s laser focused on serving the roasting community, and we’ll continue to iterate on our processes to make that happen.\nFull time position\n\nRemote or local to Portland, Oregon\nTo apply: https://roastertools.typeform.com/to/vxm1T5\n",
      origin_url: "https://weworkremotely.com/jobs/5334-full-stack-rails-engineer",
      publication_date: Timex.parse!("Thu, 07 Sep 2017 21:39:00 +0000", "{RFC1123}"),
      title: "RoasterTools: Full Stack Rails Engineer"
    }
  end
end
