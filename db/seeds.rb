# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#	usr = User.create([{email:'mayor_maryon@Yahoo.com.ph', first_name:'maryon', last_name:'mayor', password:'123456', username:'maryonpogi'}, {email:'gerald_gorosin@gmail.com', first_name:'gerald', last_name:'gorosin', password:'123456', username:'kalbo'}])

	#albums = Album.create([{title:'profile pictures', location:'pasig', user_id:usr.first}, {title:'art', location:nil, user_id:usr.last}, {title:'new york city', location:'america', user_id:usr.first}, {title:'gma 7', location:nil, user_id:usr.last}])
	
	#pics = Picture.create([{title:'pogi ko', description:'not quite', user_id:usr.first, album_id: albums.first},{title:'pogi ako', description:nil, user_id:usr.first,album_id:albums.last}, {title:'pogi ko part 2', description:'not quite', user_id:usr.last, album_id: albums.first},{title:'pogi ako 3', description:nil, user_id:usr.last,album_id:albums.last}])	

	#events = Event.create([{title:'graduation highschool', image_orientation:'portrait', date:'2012-01-30 13:53:11', location:'manila',description:nil, user_id:usr.first},{title:'graduation highschool', image_orientation:'portrait', date:'2012-01-30 13:53:11', location:'manila',description:nil, user_id:usr.first}])

	category = Category.create([{title:'Animals'}, {title:'Comedy'}, {title:'Entertainment'}, {title:'Film & Animation'}, {title:'Gaming'}, {title:'Horror'}, {title:'Music Video'}, {title:'News & Politics'}, {title:'People & Blog'}, {title:'Sports'}, {title:'Tutorials'}, {title:'Viral'}])

	#videos = Video.create([{title:'dragons', description:'awesome', category_id: category.first, user_id:usr.first}, {title:'homo', description:'bakla', category_id:category.first, user_id:usr.last}])
