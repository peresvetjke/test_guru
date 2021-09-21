module ApplicationHelper
  APP_NAME = "TestGrinder".freeze
  GITHUB = "https://github.com/".freeze

  def current_year
    Time.now.year
  end

  def github_url(author, repo, name = APP_NAME)  
    link_to "#{name}", "#{GITHUB}/#{author}/#{repo}", target: "_blank"
  end
end
