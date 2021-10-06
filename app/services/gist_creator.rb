class GistCreator
  attr_reader :question

  def initialize(question, client = nil)
    @client = client || Octokit::Client.new(:access_token => ENV['GITHUB_TOKEN'])
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

    success? ? response[:id] : false
  end

  def success?
    !(@client.last_response.nil? || [304, 403, 404, 422].include?(@client.last_response.status))
  end
end