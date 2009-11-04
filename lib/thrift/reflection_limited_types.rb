#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#


module TTypeTag
  T_VOID = 1
  T_BOOL = 2
  T_BYTE = 3
  T_I16 = 6
  T_I32 = 8
  T_I64 = 10
  T_DOUBLE = 4
  T_STRING = 11
  T_STRUCT = 12
  T_MAP = 13
  T_SET = 14
  T_LIST = 15
  T_ENUM = 101
  T_NOT_REFLECTED = 102
  VALUE_MAP = {1 => "T_VOID", 2 => "T_BOOL", 3 => "T_BYTE", 6 => "T_I16", 8 => "T_I32", 10 => "T_I64", 4 => "T_DOUBLE", 11 => "T_STRING", 12 => "T_STRUCT", 13 => "T_MAP", 14 => "T_SET", 15 => "T_LIST", 101 => "T_ENUM", 102 => "T_NOT_REFLECTED"}
  VALID_VALUES = Set.new([T_VOID, T_BOOL, T_BYTE, T_I16, T_I32, T_I64, T_DOUBLE, T_STRING, T_STRUCT, T_MAP, T_SET, T_LIST, T_ENUM, T_NOT_REFLECTED]).freeze
end

class SimpleType
  include ::Thrift::Struct
  TTYPE = 1
  NAME = 2

  ::Thrift::Struct.field_accessor self, :ttype, :name
  FIELDS = {
    TTYPE => {:type => ::Thrift::Types::I32, :name => 'ttype', :enum_class => TTypeTag},
    NAME => {:type => ::Thrift::Types::STRING, :name => 'name'}
  }

  def struct_fields; FIELDS; end

  def validate
    unless @ttype.nil? || TTypeTag::VALID_VALUES.include?(@ttype)
      raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field ttype!')
    end
  end

end

class ContainerType
  include ::Thrift::Struct
  TTYPE = 1
  SUBTYPE1 = 2
  SUBTYPE2 = 3

  ::Thrift::Struct.field_accessor self, :ttype, :subtype1, :subtype2
  FIELDS = {
    TTYPE => {:type => ::Thrift::Types::I32, :name => 'ttype', :enum_class => TTypeTag},
    SUBTYPE1 => {:type => ::Thrift::Types::STRUCT, :name => 'subtype1', :class => SimpleType},
    SUBTYPE2 => {:type => ::Thrift::Types::STRUCT, :name => 'subtype2', :class => SimpleType, :optional => true}
  }

  def struct_fields; FIELDS; end

  def validate
    unless @ttype.nil? || TTypeTag::VALID_VALUES.include?(@ttype)
      raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field ttype!')
    end
  end

end

class ThriftType
  include ::Thrift::Struct
  IS_CONTAINER = 1
  SIMPLE_TYPE = 2
  CONTAINER_TYPE = 3

  ::Thrift::Struct.field_accessor self, :is_container, :simple_type, :container_type
  FIELDS = {
    IS_CONTAINER => {:type => ::Thrift::Types::BOOL, :name => 'is_container'},
    SIMPLE_TYPE => {:type => ::Thrift::Types::STRUCT, :name => 'simple_type', :class => SimpleType, :optional => true},
    CONTAINER_TYPE => {:type => ::Thrift::Types::STRUCT, :name => 'container_type', :class => ContainerType, :optional => true}
  }

  def struct_fields; FIELDS; end

  def validate
  end

end

class Argument
  include ::Thrift::Struct
  KEY = 1
  NAME = 2
  TYPE = 3

  ::Thrift::Struct.field_accessor self, :key, :name, :type
  FIELDS = {
    KEY => {:type => ::Thrift::Types::I16, :name => 'key'},
    NAME => {:type => ::Thrift::Types::STRING, :name => 'name'},
    TYPE => {:type => ::Thrift::Types::STRUCT, :name => 'type', :class => ThriftType}
  }

  def struct_fields; FIELDS; end

  def validate
  end

end

class Method
  include ::Thrift::Struct
  NAME = 1
  RETURN_TYPE = 2
  ARGUMENTS = 3

  ::Thrift::Struct.field_accessor self, :name, :return_type, :arguments
  FIELDS = {
    NAME => {:type => ::Thrift::Types::STRING, :name => 'name'},
    RETURN_TYPE => {:type => ::Thrift::Types::STRUCT, :name => 'return_type', :class => ThriftType},
    ARGUMENTS => {:type => ::Thrift::Types::LIST, :name => 'arguments', :element => {:type => ::Thrift::Types::STRUCT, :class => Argument}}
  }

  def struct_fields; FIELDS; end

  def validate
  end

end

class Service
  include ::Thrift::Struct
  NAME = 1
  METHODS = 2
  FULLY_REFLECTED = 3

  ::Thrift::Struct.field_accessor self, :name, :methods, :fully_reflected
  FIELDS = {
    NAME => {:type => ::Thrift::Types::STRING, :name => 'name'},
    METHODS => {:type => ::Thrift::Types::LIST, :name => 'methods', :element => {:type => ::Thrift::Types::STRUCT, :class => Method}},
    FULLY_REFLECTED => {:type => ::Thrift::Types::BOOL, :name => 'fully_reflected'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

end
