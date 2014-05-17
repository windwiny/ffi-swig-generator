require File.join(File.dirname(__FILE__), %w[.. spec_helper])

include FFI
require 'ffi'

describe Generator::Parser do

  context 'full module' do
    it_should_behave_like 'All specs'
    before do
      @node = generate_xml_wrap_from('typedefs2')
    end

    it 'should show origin struct|union type ptr|by_value' do
      Generator::Parser.new.generate(@node).should == (_tmp1 = <<EOC)

require 'ffi'
module Mod1
  extend FFI::Library
  #ffi_lib 'mod1'
  class TestStt1 < FFI::Struct; end
  class TestUnn1 < FFI::Union; end
  class TestStt1 < FFI::Struct
    layout(
           :i, :int,
           :f, :float,
           :df, :double
    )
  end
  TestStt2 = TestStt1
  TestStt3 = TestStt1
  TestStt4 = TestStt1
  class TestUnn1 < FFI::Union
    layout(
           :msg, [:char, 8],
           :c, :char,
           :s, :short,
           :i, :int,
           :l, :long_long
    )
  end
  TestUnn2 = TestUnn1
  TestUnn3 = TestUnn1
  TestUnn4 = TestUnn1
  AA = 0
  BB = 11
  CC = BB + 1
  DD = 33
  EE = DD + 1
  test_enm_1 = enum :test_enm_2, [
    :aa,
    :bb, 11,
    :cc,
    :dd, 33,
    :ee,
  ]

  typedef test_enm_1, :test_enm_2
  typedef test_enm_1, :test_enm_3
  typedef :test_enm_2, :test_enm_4
  attach_function :func_st_11, :func_st_11, [ TestStt1.by_value, TestStt1.ptr ], TestStt1.ptr
  attach_function :func_st_12, :func_st_12, [ TestStt1.by_value, TestStt1.ptr ], TestStt1.ptr
  attach_function :func_st_13, :func_st_13, [ TestStt1.by_value, TestStt1.ptr ], TestStt1.by_value
  attach_function :func_st_14, :func_st_14, [ TestStt1.by_value, TestStt1.ptr ], TestStt1.by_value
  attach_function :func_un_11, :func_un_11, [ TestUnn1.by_value, TestUnn1.ptr ], TestUnn1.ptr
  attach_function :func_un_12, :func_un_12, [ TestUnn1.by_value, TestUnn1.ptr ], TestUnn1.ptr
  attach_function :func_un_13, :func_un_13, [ TestUnn1.by_value, TestUnn1.ptr ], TestUnn1.by_value
  attach_function :func_un_14, :func_un_14, [ TestUnn1.by_value, TestUnn1.ptr ], TestUnn1.by_value
  attach_function :func_em_11, :func_em_11, [ test_enm_1, :pointer ], :pointer
  attach_function :func_em_12, :func_em_12, [ :test_enm_2, :pointer ], :pointer
  attach_function :func_em_13, :func_em_13, [ :test_enm_3, :pointer ], :test_enm_3
  attach_function :func_em_14, :func_em_14, [ :test_enm_4, :pointer ], :test_enm_4

end
EOC
    end
  end
end
