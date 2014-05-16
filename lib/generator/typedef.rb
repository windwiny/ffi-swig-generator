module FFI
  module Generator
    class Typedef < Type
      attr_reader :type
      attr_reader :name
      def initialize(params = { })
        super
        @name = get_attr('sym_name')
        @type = Type.new(:node => @node, :typedefs => @typedefs)
      end
      def to_s
        symm = @type.to_s
        if /\.by_value$/ =~ symm
          @indent_str + "#{Struct.camelcase(@name)} = #{symm[0...-9]}"
        else
          @indent_str + "typedef #{symm}, :#{@name}"
        end
      end
      private
    end
  end
end
