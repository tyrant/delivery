class InstructionQueue < ActiveRecord::Base
  
  belongs_to :driver
  has_many :instructions
  
  def push(instruction, priority=nil)
    items = JSON.parse(self.queue_items)
    items.push(instruction.id)
    self.queue_items = JSON.serialize(items)
    self.save
  end
  
  def pop
    items = JSON.parse(self.queue_items)
    popped = items.pop
    self.queue_items = JSON.serialize(items)
    self.save
    popped
  end
  
end