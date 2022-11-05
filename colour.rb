class Colour 

    attr_reader :hex, :rgb, :hsl

    def initialize(hex, rgb, hsl)
        @hex = hex
        @rgb = rgb
        @hsl = hsl
    end

    def print_shades
        puts "Try hex shade: '#{self.hex}'"
        puts "Try rgb shade: '#{self.rgb}'"
        puts "Try hsl shade: '#{self.hsl}'"
    end
end