module Fog
  module Parsers
    module AWS
      module SES
        class GetIdentitiesVerificationAttributes < Fog::Parsers::Base
          def reset
            @response = { 'entries' => [], 'values' => []}
          end

          def start_element(name,attrs = [])

          end

          def end_element(name)
            case name
              when 'entry'
                @response['entries'] << value
              when 'VerificationStatus'
                @response['values'] << value

            end
          end
        end
      end
    end
  end
end
