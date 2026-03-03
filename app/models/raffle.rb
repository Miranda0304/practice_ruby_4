class Raffle < ApplicationRecord
  enum :status, {
         inactive: 0,
         active: 1,
         finished: 2,
         deleted: 3,
       }

  def finish!
    finished!
  end

  def soft_delete!
    deleted!
  end
end
