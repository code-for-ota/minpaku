namespace :inverse_values do
    desc "SurveyValuesの値を逆転させる"
    task :inverse_by_ids, ['ids'] => :environment do |task, args|
        ids = args.to_a
        
        value_zeros_ids = SurveyValue.where(id: ids, value: 0).pluck(:id)
        value_ones_ids = SurveyValue.where(id: ids, value: 1).pluck(:id)

        SurveyValue.where(id: value_zeros_ids).update_all(value: 1)
        SurveyValue.where(id: value_ones_ids).update_all(value: 0)
    end
end
