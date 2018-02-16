class CircularQueue
  def initialize(buffer_size)
    @queue = Array.new(buffer_size)
  end

  def enqueue(object) # add an object to the queue
    dequeue unless @queue.include?(nil) # dequeue if the buffer is full
    index = @queue.index(nil)
    @queue[index] = object
  end

  def dequeue # remove and return the oldest object from the queue. nil if empty
    return nil if @queue.all?(&:nil?)
    oldest_object = self.oldest_object
    @queue[@queue.index(oldest_object)] = nil
    oldest_object
  end

  def oldest_object
    @queue.map(&:to_i).sort.each { |el| return el if el > 0 }
  end

  def to_a
    @queue.clone
  end

  def to_s
    to_a.to_s
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
