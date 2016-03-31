module Fog
  module AWS
    class SES
      class Real
        require 'fog/aws/parsers/ses/get_identities_verification_attributes'

        def get_identities_verification_attributes(identity = nil)
          params = {}

          status = {email: identity, status: 'Error'}

          begin
            params["Identities.member.1"] = identity

            resp_request = request({
                'Action'           => 'GetIdentityVerificationAttributes',
                :parser            => Fog::Parsers::AWS::SES::GetIdentitiesVerificationAttributes.new
            }.merge(params))

            components = resp_request[:body]["values"].first.split("\n").reject{ |x| x.strip == '' }
            status = {email: components.first.strip, status: components.last.strip}
          rescue
            # Return the default status
          end

          status
        end
      end
    end
  end
end
