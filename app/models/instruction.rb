class Instruction < ActiveRecord::Base
  
  belongs_to :instruction_queue
  belongs_to :instruction_type
  
  
end