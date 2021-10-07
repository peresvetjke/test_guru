class GistCreator
  attr_reader :question
  
  def initialize(question, client = nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(:access_token => ENV['GITHUB_TOKEN'])
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.status.between?(200, 299) 
  end

  private

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
      files: {
        'test-gutu-question.txt' => {
          content: gist_content}
        }, 
      public: true
    } 
  end

  def gist_content
    body = @question.body + " \n\n" + question.answers.to_a.map {|a| a.body}.join("\n")
  end
end