module FFI
  module Generator
    class Typedef < Type
      attr_reader :type
      attr_reader :name
      def initialize(params = { })
        super
        @name = get_attr('sym_name') || get_attr('name')
        @type = Type.new(:node => @node, :typedefs => @typedefs)
      end
      def to_s
        symm = @type.to_s
        if /\.by_value$/ =~ symm
          if Struct.camelcase(@name) != symm[0...-9]
            @indent_str + "#{Struct.camelcase(@name)} = #{symm[0...-9]}"
          else
            ""
          end
        else
          @indent_str + "typedef #{symm}, :#{@name}"
        end
      end
      private
    end
  end
end
