## creating a "for" loop

superheroes = ["batman", "superman", "wonder woman"]
for x in superheroes:
    print(x)


## breaking up work into smaller components with functions
def print_hero(hero):
  print(hero)

for x in superheroes:
  print_hero(x)

## list
def print_all_heros(herolist):
    for x in herolist:
         print(x)