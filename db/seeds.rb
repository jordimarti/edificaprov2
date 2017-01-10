# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Course.create(name: "Introducción al estándar Passivhaus para climas cálidos", image: "https://s3-eu-west-1.amazonaws.com/edificapro/c01/c01.jpg", price: 7500)
Subcourse.create(course_id: 1, visible: true)
Section.create(subcourse_id: 1, position: 1, title: "Filosofía")
Lesson.create(subcourse_id: 1, section_id: 1, position: 1, title: "Primer capítulo", content: "Contenido del primer capítulo")