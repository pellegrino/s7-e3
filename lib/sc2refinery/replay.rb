class Replay
  attr_accessor :first_player
  attr_accessor :second_player
  attr_accessor :map

  def initialize(params)
    self.first_player  = params[:first_player]
    self.second_player = params[:second_player]
    self.map           = params[:map]
  end

end

