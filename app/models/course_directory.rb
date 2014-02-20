class CourseDirectory < ::DM
  def add(course)
    db[:courses].insert(course.attributes)
  end

  def lookup_by_guid(guid)
    res = db[:courses].where(:guid => guid).first
    ::Course.new(res)
  end
end
