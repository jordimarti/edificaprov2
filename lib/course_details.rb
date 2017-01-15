module CourseDetails
  
  def course_title(course_id, locale)
    @course = Course.find(course_id)
    # Determinem l'idioma amb el que mostrem el nom del curs
    case locale
    when 'ca'
      course_name = @course.name_ca
    when 'es'
      course_name = @course.name_es
    when 'en'
      course_name = @course.name_en
    else
      course_name = @course.name_es
    end
    return course_name
  end

end