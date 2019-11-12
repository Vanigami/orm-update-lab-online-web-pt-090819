require_relative "../config/environment.rb"

class Student
attr_accessor :name, :grade
attr_reader :id

  def initialize(id=nil, name, grade)
    @id = id
    @name = name
    @album = album
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE ID NOT EXISTS students
      (
        id INTEGER PRIMARY KEY,
        name TEXT
        album TEXT
      )
      SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = "DROP TABLE IF EXISTS students"
    DB[:conn].execute(sql)
  end

  def save
    if seld.id
      self.update
    else
      sql = <<-SQL
        INSERT INTO students (name, grade)
        VALUES (?, ?)
        SQL
        DB[:conn].execute(sql, self.name, self.grade)
        @id  = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
        end
      end

      def self.create(name:, grade:)
        student = Students.new(name, grade)
        student.save
        student
      end

      def self.find_by_name(name)
        sql = <<-SQL
          SELECT * FROM students
          WHERE name = ?
          SQL
          result = DB[:conn].execute(sql, name)[0]
          Student.new(result[0], result[1], result[2])
        end
      end

      def update
        sql = <<-SQL
        UPDATE students SET name = ?,
        album = ? WHERE id = ?
        SQL
        

end
