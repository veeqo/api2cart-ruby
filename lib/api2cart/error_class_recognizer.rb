# List of errors: http://docs.api2cart.com/post/error-codes

module Api2cart
  class ErrorClassRecognizer
    ERROR_CODE_MAPPING = {
      '1'   => Api2cart::Errors::ServiceNotAvailable,
      '2'   => Api2cart::Errors::IncorrectApiKey,
      '3'   => Api2cart::Errors::MethodNameMissing,
      '4'   => Api2cart::Errors::StoreAccessDenied,
      '5'   => Api2cart::Errors::ApiAccessDenied,
      '6'   => Api2cart::Errors::ApiKeyDisabled,
      '7'   => Api2cart::Errors::TooManyRequests,
      '8'   => Api2cart::Errors::StoreAlreadyExists,
      '9'   => Api2cart::Errors::InternalServiceError,
      '100' => Api2cart::Errors::IncorrectApiRequest,
      '101' => Api2cart::Errors::StoreNotFound,
      '102' => Api2cart::Errors::IncorrectFtpAccess,
      '103' => Api2cart::Errors::IncorrectFtpWritePermissions,
      '104' => Api2cart::Errors::BridgeNotFound,
      '105' => Api2cart::Errors::ConnectionBridgeResponseError,
      '106' => Api2cart::Errors::StoreUrlUnreachable,
      '107' => Api2cart::Errors::IncorrectShoppingCartId,
      '108' => Api2cart::Errors::SearchParametersMissing,
      '109' => Api2cart::Errors::IncorrectParameters,
      '110' => Api2cart::Errors::UpdateParametersMissing,
      '111' => Api2cart::Errors::UpdateItemIdMissing,
      '112' => Api2cart::Errors::ItemNotFound,
      '113' => Api2cart::Errors::ItemAlreadyExists,
      '114' => Api2cart::Errors::RequiredParameterMissing,
      '115' => Api2cart::Errors::TooManyPrefixes,
      '116' => Api2cart::Errors::DuplicatedRecordInDatabase
    }.freeze

    DEFAULT_ERROR_CLASS = Api2cart::Errors::UnknownError.freeze

    def self.call error_code
      ERROR_CODE_MAPPING[error_code.to_s] || Api2cart::Errors::UnknownError
    end
  end
end
