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
User.destroy_all

u1 = User.create(:email => 'admin@gg.com', :password => 'admin', :password_confirmation => 'admin')
u2 = User.create(:email => 'zz@gg.com', :password => 'zzz', :password_confirmation => 'zzz')

u1.events.create(name: "我是新活動", description: "嘎哩噗哩啵！")
u2.events.create(name: "活動二號", description: "我是活動二號")

u1.events.cats.create(name: "OREO")
u1.events.cats.create(name: "P醬")
u1.events.cats.create(name: "秒妙")
u2.events.cats.create(name: "甜不辣")
u2.events.cats.create(name: "豬血糕")
