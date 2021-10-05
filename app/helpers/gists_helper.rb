module GistsHelper
  GITHUB = "https://gist.github.com"
  AUTHOR = "peresvetjke"

  def gist_url(id)
    "#{GITHUB}/#{AUTHOR}/#{id}"
  end
end