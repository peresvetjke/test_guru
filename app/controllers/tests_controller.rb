class TestsController < ApplicationController
  before_action :find_test, only: [:show, :destroy]
  
  def index
    @tests = Test.all
    render inline: "<ul> <% @tests.each do |t| %> <li>ID:<%= t.id %> / <%= t.title %> " \
                   "<%= button_to 'Destroy', test_path(t), data: {:confirm => 'Are you sure?'}," \
                   " :method => :delete %> </li> <% end %> </ul>"
  end

  def new
  end

  def create
  end

  def show
    render inline: "ID: <%= @test.id %> / <%= @test.title %>"
  end

  def edit
  end

  def update
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end