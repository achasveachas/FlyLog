# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project - Duh
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) - LogBook has_many flights
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User) - LogBook belongs_to pilot
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients) - Flight has_many airplanes through flight_airplanes
- [ ] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) - Pilt and Flight include validations of required features
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [ ] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
- [x] Include signup (how e.g. Devise) - Pilots can sign up
- [x] Include login (how e.g. Devise) - Pilots can log in
- [x] Include logout (how e.g. Devise) - Pilots can log out
- [ ] Include third party signup/login (how e.g. Devise/OmniAuth)
- [ ] Include nested resource show or index (URL e.g. users/2/recipes)
- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
- [x] Include form display of validation errors (form URL e.g. /recipes/new) - Sign up form displays validation errors when required fields are missing or wrong format

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
