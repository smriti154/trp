module User::Operation
  class Index < Trailblazer::Operation
    step :fetch_users

    def fetch_users(ctx, **)
        ctx[:users] = User.all
    end
  end
end

# module User::Operation
#     class Index < Trailblazer::Operation
#         step :get_records
#         step :request_from_web_app?, Output(:failure) => Id(:status_filter)

#         step :status_filter
#         step :set_response_json

#         def fetch_users(ctx, **)
#             ctx[:users] = User.all
#         end
#     end
# end