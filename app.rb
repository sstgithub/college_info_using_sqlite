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

#shows page to set up creating a single member from a collection 
# (with dropdown menus and everything)

get "/professors/:id/new" do
	@p = Professor.new
	@new_p = Professor.new
	erb :"professors/new"
end

get "/subjects/new" do
	@s = Subject.new
	@new_s = Subject.new
	erb :"subjects/new"
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

# shows page to edit single member

get "/professors/:id/edit" do
	@p = Professor.find(params[:id])
	erb :"professors/edit"
end

get "/subjects/:id/edit" do
	@s = Subject.find(params[:id])
	erb :"subjects/edit"
end



# shows error page (same for any member)

get "/error" do
	erb :"/error"
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



class Professor < ActiveRecord::Base
end

class Subject < ActiveRecord::Base
end

class Course < ActiveRecord::Base
end