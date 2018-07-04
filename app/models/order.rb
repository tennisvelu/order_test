class Order < ApplicationRecord

monetize :amount_cents
enum status: {draft: 1, ready: 2, in_progress: 3, completed: 4}

end
