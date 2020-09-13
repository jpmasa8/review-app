# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8

if Rails.env == 'development'
    (1..100).each do |i|
        Post.create(name: "名前#{i}", title: "タイトル#{i}", content: "本文#{i}")
    end
    
    Tag.create([
        { name: '生活と暮らし' },
        { name: 'アニメ・ゲーム' },
        { name: '将棋' },
        { name: '雑談' },
        { name: '人狼' }
    ])
end

