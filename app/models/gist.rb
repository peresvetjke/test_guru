class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user

  GITHUB = "https://gist.github.com"
  AUTHOR = "peresvetjke"

  def github_url
    "#{GITHUB}/#{AUTHOR}/#{self.github_gist_id}"
  end
end