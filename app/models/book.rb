class Book < ApplicationRecord
    validates :name, presence: true

    validates :author, presence: true

    validates :name, uniqueness: true

    validates :name, length: { minimum: 2 }

    before_save :merge_names            #it is a callback, merge_names is a method
    after_destroy :update_log


    def merge_names
        self.name = self.name + " by " + self.author
    end

    def update_log
        logger.info "====alas! a book has been deleted: id: #{self.id} name #{self.name}====="
    end

end
