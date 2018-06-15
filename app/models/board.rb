class Board < ApplicationRecord
    # Sempre que uma nova board for instanciada, rode os defaults.
    after_initialize :defaults
    
    has_many :lists, dependent: :destroy
    
    validates_presence_of :name
    
    # Defaults: Uma board SEMPRE terá que ter pelo menos as seguintes tres listas.
    def defaults
        self.lists << List.new(name: "TO DO")
        self.lists << List.new(name: "DOING")
        self.lists << List.new(name: "DONE")
    end
end
