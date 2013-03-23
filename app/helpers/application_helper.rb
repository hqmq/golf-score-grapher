module ApplicationHelper
  def record_image(course_record)
    return "<img src='/trophy.gold.png' />".html_safe if course_record.rank == 1
    return "<img src='/trophy.silver.png' />".html_safe if course_record.rank == 2
    "<img src='/trophy.bronze.png' />".html_safe
  end
end
