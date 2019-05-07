module Api2cart
  module Errors
    class Api2cartException < RuntimeError; end

    class ServiceNotAvailable < Api2cartException; end
    class IncorrectApiRequest < Api2cartException; end
    class StoreNotFound < Api2cartException; end
    class IncorrectFtpAccess < Api2cartException; end
    class IncorrectFtpWritePermissions < Api2cartException; end
    class BridgeNotFound < Api2cartException; end
    class ConnectionBridgeResponseError < Api2cartException; end
    class StoreUrlUnreachable < Api2cartException; end
    class IncorrectShoppingCartId < Api2cartException; end
    class SearchParametersMissing < Api2cartException; end
    class IncorrectParameters < Api2cartException; end
    class UpdateParametersMissing < Api2cartException; end
    class UpdateItemIdMissing < Api2cartException; end
    class ItemNotFound < Api2cartException; end
    class ItemAlreadyExists < Api2cartException; end
    class RequiredParameterMissing < Api2cartException; end
    class TooManyPrefixes < Api2cartException; end
    class DuplicatedRecordInDatabase < Api2cartException; end
    class IncorrectApiKey < Api2cartException; end
    class MethodNameMissing < Api2cartException; end
    class StoreAccessDenied < Api2cartException; end
    class ApiAccessDenied < Api2cartException; end
    class ApiKeyDisabled < Api2cartException; end
    class StoreAlreadyExists < Api2cartException; end
    class InternalServiceError < Api2cartException; end
    class UnknownError < Api2cartException; end

    class TooManyRequests < Api2cartException; end
    class StoreRequestLimitExceeded < TooManyRequests; end
    class OverallRequestLimitExceeded < TooManyRequests; end
  end
end
