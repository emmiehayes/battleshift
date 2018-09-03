# Battleshift
[Project Spec](http://backend.turing.io/module3/projects/battleshift "Project Spec")

Setup: Most devs are building on top of existing code bases where we have to inherit and deal with the technical debt and decisions of those that came before us. Understanding how someone’s decisions impact a team is an important part of learning how to write maintainable software. You also rarely have time for a complete rewrite so deciding what to care about and when becomes as important a skill as being able to write code.  

Objective: The original state allows a player to play against a computer through an API.  Add multiplayer functionality and basic levels of security to pre-existing API implementation of the game Battleship. 

### Gems Utilized

- Active_model_serializers
- Bcrypt
- Capybara
- Factory-Bot
- Figaro
- Rspec-activemodel-mocks
- Shoulda-matchers
- SendGrid
- Simplecov

#### Testing
This application follows a spec harness that uses RSpec/Capybara for testing.  