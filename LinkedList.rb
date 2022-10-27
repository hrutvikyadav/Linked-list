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

  def update_tail
    self.tail = self.at(self.size - 1)
  end

  def create_list(value=nil, next_node=nil)
    self.head = Node.new(value, next_node)
  end

  def at(index, node = head, count = 0)
    return node if index == count
    return 'Not found' if count == self.size

    at(index, node.next_node, count + 1)
  end

  def pop(current_node = head)
    return current_node.next_node = current_node.value = nil if current_node == update_tail
    return current_node.next_node = nil if current_node.next_node.next_node.nil?

    pop(current_node.next_node)
  end

  def print_list
    puts '---------------------------'
    self.size.times do |time|
      p self.at(time).value
    end
    puts '---------------------------' 
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

p list.tail
list.print_list
p list.pop
p list.tail
list.print_list