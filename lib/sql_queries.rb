# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts
"SELECT title, SUM(amount) FROM projects
LEFT OUTER JOIN pledges ON projects.id = pledges.project_id
GROUP BY title"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges
"SELECT name, age, SUM(amount) FROM pledges
JOIN users ON pledges.user_id = users.id
GROUP BY name"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
"SELECT title, SUM(amount) - funding_goal AS amount_over_goal FROM projects
JOIN pledges ON projects.id = pledges.project_id
GROUP BY title
HAVING amount_over_goal >= 0
"

end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount
"SELECT name, SUM(amount) FROM pledges
JOIN users ON pledges.user_id = users.id
GROUP BY name
ORDER BY SUM(AMOUNT)"
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
  "SELECT category, SUM(amount) FROM projects
  LEFT OUTER JOIN pledges ON projects.id = pledges.project_id
  GROUP BY pledges.id
  HAVING category = 'music'"
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_book_category
  "SELECT category, SUM(amount) FROM projects
  LEFT OUTER JOIN pledges ON projects.id = pledges.project_id
  WHERE category = 'books'"
end
