# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Course.create(name_ca: "Intruducció a l'estàndar Passivhaus per a climes càlids", name_es: "Introducción al estándar Passivhaus para climas cálidos", name_en: "Introduction to Passivhaus standard for warm climates", image: "https://s3-eu-west-1.amazonaws.com/edificapro/c01/c01.jpg", price: 7500)
Subcourse.create(course_id: 1, visible: true, name: "Introducción al estándar Passivhaus para climas cálidos - Español", locale: "es", library_image: "https://s3-eu-west-1.amazonaws.com/edificapro/c01/c01_es.jpg")
Subcourse.create(course_id: 1, visible: true, name: "Introduction to Passivhaus standard for warm climates - English", locale: "en", library_image: "https://s3-eu-west-1.amazonaws.com/edificapro/c01/c01_en.jpg")
Section.create(subcourse_id: 1, position: 1, title: "Filosofía")
Section.create(subcourse_id: 2, position: 1, title: "Philosophy")
Lesson.create(subcourse_id: 1, section_id: 1, position: 1, title: "Primer capítulo", content: "Contenido del primer capítulo")
Lesson.create(subcourse_id: 2, section_id: 2, position: 1, title: "First chapter", content: "First chapter contents")
Purchase.create(user_id: 1, course_id: 1, terms_of_service: true, paid: false, bill_number: 1)