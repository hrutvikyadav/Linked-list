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

  def contains?(value, node = head)
    return true if node.value == value
    return false if node.next_node.nil?
    contains?(value, node.next_node)
  end

  def find(value, node = head, index = 0)
    return 'Doesn\'t exist' if node.value.nil?
    return index if node.value == value
    find(value, node.next_node, index + 1)
  end

  def to_s(node = head, str = '')
    return str += "( #{node.value} ) -> nil" if node.next_node.nil?

    str += "( #{node.value} ) -> "
    to_s(node.next_node, str)
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
=begin
p list.tail
list.print_list
p list.pop
p list.tail
list.print_list
=end

p list.contains?(17)
p list.contains?(19)
p list.find(17)
p list.find(21)
puts list.to_s