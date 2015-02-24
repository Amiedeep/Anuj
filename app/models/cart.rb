class Cart < ActiveRecord::Base

  def self.search(query)
    if query
      #TODO: Return error for empty queries
      #where('(title LIKE ?) OR (title LIKE ?) OR (content LIKE ?) OR (content LIKE ?)',
      #"%#{query}%", "%#{query.downcase}%", "%#{query}%", "%#{query.downcase}%", )

      where(['name LIKE ?',
             "%#{query.downcase}%"])
    end
  end

end
