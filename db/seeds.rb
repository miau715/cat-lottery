# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Event.delete_all
Cat.delete_all

Event.create(name: "我是新活動", description: "嘎哩噗哩啵！")
Event.create(name: "活動二號", description: "我是活動二號")

Cat.create(name: "OREO", event_id: 1)
Cat.create(name: "P醬", event_id: 1)
Cat.create(name: "秒妙", event_id: 1)
Cat.create(name: "甜不辣", event_id: 2)
Cat.create(name: "豬血糕", event_id: 2)