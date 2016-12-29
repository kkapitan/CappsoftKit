# Sometimes it's a README fix, or something like that - which isn't relevant for
# including in a project's CHANGELOG for example
declared_trivial = github.pr_title.include? "#trivial"

has_lib_changes = git.modified_files.grep(/CappsoftKit/Classes/).count + git.modified_files.grep(/CappsoftKit/Assets/).count > 0
has_test_changes = git.modified_files.grep(/Example/Tests/).count > 0
has_example_changes = git.modified_files.grep(/Example/CappsoftKit/) > 0

message("Thank you for your contribution!!! :bowtie:")

message("PR has changes in library files") if has_lib_changes
message("PR has changes in spec files") if has_test_changes
message("PR has changes in example files") if has_example_changes

# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
warn("PR is classed as Work in Progress") if github.pr_title.include? "[WIP]"

# Warn when there is a big PR
warn("Big PR") if git.lines_of_code > 500

# Don't let testing shortcuts get into master by accident
fail("fdescribe left in tests") if `grep -r fdescribe Example/Test/ `.length > 1
fail("fit left in tests") if `grep -r fit Example/Test/ `.length > 1

if has_lib_changes && !has_test_changes
  warn("Tests were not updated", sticky: false)
end

# If these are all empty something has gone wrong, better to raise it in a comment
if git.modified_files.empty? && git.added_files.empty? && git.deleted_files.empty?
  fail "This PR has no changes at all, this is likely an issue during development."
end

# This comes from `./danger_plugins/protect_files.rb` which is automatically parsed by Danger
files.protect_files(path: "danger.gemspec", message: ".gemspec modified", fail_build: false)

junit.parse "fastlane/test_output/report.junit"
junit.headers = [:file, :name]
junit.report