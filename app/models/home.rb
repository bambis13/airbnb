class Home < ApplicationRecord
   enum status: { visitor: 0, host: 1 }
end
