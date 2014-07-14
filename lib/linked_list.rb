class LinkedList

  attr_accessor :size
  attr_accessor :payload

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
    current_item = @first_item
    index.times do
      current_item = current_item.next_item
    end

      @payload = arg
  end

  def get(index)
    raise IndexError if index < 0

    current_item = @first_item
    index.times do
      if current_item
        current_item = current_item.next_item
      else
        raise IndexError
      end
    end
    current_item.payload
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
    # if @first_item
      current_item = @first_item
      until current_item.last?
        current_item = current_item.next_item
      end
      current_item
    # end
  end


end
