class GistCreator
  attr_reader :question

  def initialize(question, client = nil)
    @client = client || Octokit::Client.new(:access_token => ENV['github_token'])
    @question = question
  end

  def call
    heading = @question.test.title
    body = @question.body + " \n\n" + question.answers.to_a.map {|a| a.body}.join("\n")
    response = @client.create_gist( 
      {"files": {"#{heading}": 
        {
          "filename": "#{heading}", 
          "content": "#{body}"}
        }, 
        "public": true
      })

    response[:id]
  end
end