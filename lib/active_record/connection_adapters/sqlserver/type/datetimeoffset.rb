module ActiveRecord
  module ConnectionAdapters
    module SQLServer
      module Type
        class DateTimeOffset < DateTime2

          def type
            :datetimeoffset
          end

          def serialize(value)
            return super unless value.acts_like?(:time)
            value.to_s :_sqlserver_datetimeoffset
          end

          def type_cast_for_schema(value)
            serialize(value).inspect
          end

          def sqlserver_type
            "datetimeoffset(#{precision.to_i})"
          end

          private

          def zone_conversion(value)
            value
          end

        end
      end
    end
  end
end
