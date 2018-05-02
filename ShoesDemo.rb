require_relative 'ConnectFour'

board = Board.new

Shoes.app(title: "Connect Four", width: 200, height: 240) do
  flow do
    background rgb(140, 140, 140)

    # the red circle
    # image "redcircle.png"
    # the white box
    # image "whitebox.png", width: 40, height: 40

    # %w(7 8 9 + 4 5 6 - 1 2 3 / 0 . = *).each do |btn|
    #   button btn, width: 50, height: 50 do
    #     end
    #   end
    #


    %w( R O O R  ).each do |space|
      if space == "R"
        @image = image "redcircle.png" do
          @image.path = "redcircle.png"
          para "clicked"
        end
      elsif space == "O"
        image "blackcircle.png"
      end
    end

  end
end