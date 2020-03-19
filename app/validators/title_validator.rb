class TitleValidator < ActiveModel::Validator
    def validate(record)
        unless record.title && record.title.match?(/Won't Believe|Secret|Top \d/)
            record.errors[:title] << "Not clickbaity enough!"
        end
    end
end