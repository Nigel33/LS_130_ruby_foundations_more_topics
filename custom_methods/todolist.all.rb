# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

end

class TodoList
  attr_accessor :title
  attr_reader :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(task)
    raise TypeError, "can only add todo objects" unless task.instance_of?(Todo)
    todos << task
  end

  alias_method :<<, :add

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def item_at(idx)
    todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(idx)
    todos.delete(item_at(idx))
  end

  def to_s
    text = "------------#{title}-------------"
    todos.map do |element|
      text << "\n #{element.to_s}"
    end

    text
  end

  def each
    todos.each do |task|
      yield(task)
    end

    self
  end

  def select
    list = TodoList.new(title)
    each do |task|
      list << task if yield(task)
    end

    list
  end

  def find_by_title(string)
    select{|task| task.title.downcase == string.downcase}.first
  end

  def all_done
    select{|task| task.done?}
  end

  def all_not_done
    select{|task| !task.done?}
  end

  def mark_done(string)
    each{|task| task.done! if task.title == string}
  end

  def mark_all_done
    each{|task| task.done!}
  end

  def mark_all_undone
    each{|task| task.undone!}
  end

end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

#todo1.done!
#todo2.done!

# results = list.select { |todo| todo.done? }    # you need to implement this method

# puts results
# puts list.find_by_title('buy Milk')
list.mark_all_done
puts list.all_done
list.mark_all_undone
puts list.all_not_done
list.mark_done("Buy milk")
puts list.all_done

