# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Event.destroy_all
Cat.destroy_all

e1 = Event.create(name: "我是新活動", description: "嘎哩噗哩啵！", user_id: 1)
e2 = Event.create(name: "活動二號", description: "我是活動二號", user_id: 2)

e1.cats.create(name: "OREO")
e1.cats.create(name: "P醬")
e1.cats.create(name: "秒妙")
e2.cats.create(name: "甜不辣")
e2.cats.create(name: "豬血糕")
