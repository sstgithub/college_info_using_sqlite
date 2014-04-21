require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:///sql_hw.db"

#shows home with links to professors, subjects, or courses page (later change to have full info for all?)

#shows index with static collection of information

get "/professors/index" do 
	@professors = Professor.all
	erb :"professors/index"
end

get "/subjects/index" do 
	@subjects = Subject.all
	erb :"subjects/index"
end

get "/courses/index" do 
	@professors = Professor.all
	@courses = Course.all
	erb :"courses/index"
end

#shows page to set up creating a single member from a collection 
# (with dropdown menus and everything)

get "/professors/new" do
	@p = Professor.new
	@new_p = Professor.new
	erb :"professors/new"
end

get "/subjects/new" do
	@s = Subject.new
	@new_s = Subject.new
	erb :"subjects/new"
end

get "/courses/new" do
	@courses = Course.all
	@professors = Professor.all
	@c = Course.new
	@new_c = Course.new
	erb :"courses/new"
end

#shows static single member to confirm delete

get "/professors/:id" do
	@p = Professor.find(params[:id])
	erb :"professors/show"
end

get "/subjects/:id" do
	@s = Subject.find(params[:id])
	erb :"subjects/show"
end

get "/courses/:id" do
	@c = Course.find(params[:id])
	erb :"courses/show"
end

# shows page to edit single member

get "/professors/:id/edit" do
	@p = Professor.find(params[:id])
	erb :"professors/edit"
end

get "/subjects/:id/edit" do
	@s = Subject.find(params[:id])
	erb :"subjects/edit"
end

get "/courses/:id/edit" do
	@c = Course.find(params[:id])
	erb :"courses/edit"
end



# shows error page (same for any member)

get "/error" do
	erb :"/error"
end

#shows home page

get "/home" do
	erb :"/home"
end



#defines what delete action does

delete "/professors/:id" do 
	@p = Professor.find(params[:id])
	if @p.delete
		redirect "/professors/index"
	else
		redirect "/error"
	end
end

delete "/subjects/:id" do 
	@s = Subject.find(params[:id])
	if @s.delete
		redirect "/subjects/index"
	else
		redirect "/error"
	end
end

delete "/courses/:id" do 
	@c = Course.find(params[:id])
	if @c.delete
		redirect "/courses/index"
	else
		redirect "/error"
	end
end

#defines what put action (update action) does

put "/professors/:id" do
	@p = Professor.find(params[:id])
	@p.update_attributes(params[:p])
	redirect "/professors/index"
end

put "/subjects/:id" do
	@s = Subject.find(params[:id])
	@s.update_attributes(params[:s]) 
	redirect "/subjects/index"
end

put "/courses/:id" do
	@c = Course.find(params[:id])
	@c.update_attributes(params[:c]) 
	redirect "/courses/index"
end

#defines what post action (adding new member to collection) does 
# [adds to the html method post that already exists or replaces it?]

post "/professors" do
	@p = Professor.new(params[:p])
	@p.save
	redirect "/professors/index"
end

post "/subjects" do
	@s = Subject.new(params[:s])
	@s.save
	redirect "/subjects/index"
end

post "/courses" do
	@c = Course.new(params[:c])
	@c.save
	redirect "/courses/index"
end


class Professor < ActiveRecord::Base
end

class Subject < ActiveRecord::Base
end

class Course < ActiveRecord::Base
end