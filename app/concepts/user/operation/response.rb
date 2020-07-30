module User::Operation
  class Response < Trailblazer::Operation
      step :get_records
      step :request_from_web_app?, Output(:failure) => Track(:mobile)

      step :filter_by_time
      step :filter_by_status
      step :set_response_for_web

      step :filter_by_created_at, Output(:success) => Track(:mobile), magnetic_to: :mobile
      step :set_response_for_mobile, magnetic_to: :mobile
      fail :set_error_message

      def get_records(ctx, **)
        ctx[:users] = User.all
      end

      def request_from_web_app?(ctx, params:, **)
        ['web'].include? params[:requested_from]
      end

      def filter_by_time(ctx, **)
        puts("filter with time interval")
        true
      end

      def filter_by_status(ctx, **)
        puts("filter with status")
        true
      end

      def set_response_for_web(ctx, **)
        puts("Set response for web")
        true
      end

      def filter_by_created_at(ctx, **)
        puts("Order descending on created at")
        true
      end

      def set_response_for_mobile(ctx, **)
        puts("Set Response for mobile")
        true
      end

      def set_error_message(ctx, **)
        puts('Something went wrong!!')
      end
  end
end