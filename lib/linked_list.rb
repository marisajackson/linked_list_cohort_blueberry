class LinkedList

  attr_accessor :size
  attr_accessor :status

  def initialize(item=nil, *other_items)
    @size = 0
    if item
      push(item)
    end

    if other_items
      other_items.each do |other_item|
        push(other_item)
      end
    end
  end

  def push(value)
    @size += 1
    lli = LinkedListItem.new(value)
    if @first_item
      last_item.next_item = lli
    else
      @first_item = lli
    end
  end

  def [](index)
    get(index)
  end

  def []=(index, arg)
    current_item = get(index, true)
    current_item.payload = arg
  end

  def delete(index)
    @size -= 1
    raise IndexError if index > size
    if index == 0
      @first_item = @first_item.next_item
    else
      previous_item = get(index - 1, true)
      next_item = previous_item.next_item.next_item
      previous_item.next_item = next_item
    end
  end

  def index(arg)
    current = 0
    while current < @size
      if get(current) == arg
        return current
      else
        current += 1
      end
    end
  end

  def get(index, return_item=false)
    raise IndexError if index < 0

    current_item = @first_item
    index.times do
      if current_item
        current_item = current_item.next_item
      else
        raise IndexError
      end
    end
    return_item ? current_item : current_item.payload
  end

  # def sorted?
  #   current = 1
  #   return true if @size < 2
  #
  #   while current < @size + 1
  #     if current == @size
  #       return @status
  #     end
  #     current_item = get(current, true)
  #     previous_item = get(current - 1, true)
  #
  #     if current_item > previous_item || current_item == previous_item
  #     # if previous_item <=> current_item
  #       @status = true
  #       current +=1
  #     else
  #       @status = false
  #       return @status
  #     end
  #   end
  # end

  # Nathan's Method
  def sorted?
    return true if self.size <= 1
    @size.times do |i|
      current_item = get(i, true)

      unless current_item.last?
        results = current_item <=> current_item.next_item
        if results == 1
          return false
        end
      end
    end
  end

  def last
    if @first_item
      last_item.payload
    end
  end

  def to_s
    if @size == 0
      "| |"
    else
      list = []
      current = 0
      while current < @size
        list << get(current)
        current += 1
      end
      "| #{list.join(", ")} |"
    end
  end

  private

  def last_item
      current_item = @first_item
      until current_item.last?
        current_item = current_item.next_item
      end
      current_item
  end


end
