class GamesController < ApplicationController  
  def new
    @games = []

    @title = params[:title]
    if @title.present?
      results = RakutenWebService::Books::Game.search({ title: @title,imageFlag: 1,hits: 20,})
      results.each do |result|
        game = Game.find_or_initialize_by(read(result))
        @games << game
      end
    end
  end

#   private

#   def read(result)
#     jancode = result['jan']
#     title = result['title']
#     url = result['itemUrl']
#     image_url = result['largeImageUrl']
# # .gsub('?_ex=128x128', '')
#     {
#       jancode: jancode,
#       title: title,
#       url: url,
#       image_url: image_url,
#     }
#   end
end