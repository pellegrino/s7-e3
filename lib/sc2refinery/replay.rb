module SC2Refinery
  class Replay
    attr_reader :first_player
    attr_reader :second_player
    attr_reader :map

    def initialize(params)
      @first_player  = params[:first_player]
      @second_player = params[:second_player]
      @map           = params[:map]
    end
  end
end

