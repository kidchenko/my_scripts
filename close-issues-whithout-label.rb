require 'octokit'

puts 'github username:'
username = gets.chomp
puts 'github password:'
password = gets.chomp
puts 'repository complete name: (eg. user/repo-name)'
repository = gets.chomp

@client = Octokit::Client.new(:login => username, :password => password)

all_issues = @client.list_issues(repository)

issues_without_labels = all_issues.find_all { |i| i.labels.empty? }

issues_without_labels.each { |issue| 
  puts "closing issue: #{issue.number} | title: #{issue.title} |"
  @client.close_issue(repository, issue.number)
}