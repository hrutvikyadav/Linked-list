#!/usr/.rbenv/bin/rbenv ruby
require_relative './Node'

class LinkedList
  attr_accessor :head, :tail

  def initialize()
    @head, @tail = nil, nil
  end
  
  def append(value)
    head.nil? ? create_list(value) : self.head.next_node = self.tail = Node.new(value)
  end

  def prepend(value)
    head.nil? ? create_list(value) : self.head = Node.new(value, self.head)
    self.tail = self.head if tail.nil?
  end

  def size(head = self.head, count = 1)
    return 'Empty List' if head.nil?
    return count if head.next_node.nil?

    size(head.next_node, count += 1)
  end

  def create_list(value=nil, next_node=nil)
    self.head = Node.new(value, next_node)
  end

end
  
list = LinkedList.new
list.append(19)
p list
p list.append(21)
p list
puts '--------------------------------'
p list.prepend(17)
p list
p list.size
l2 = LinkedList.new
p l2.size