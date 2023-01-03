## v1.5.1 (2023-01-03)

### Refactor

- Add remove_trailing_newline function
- Make constant values to readonly
- Add main function for entrypoint
- Create function to declare working steps

## v1.5.0 (2023-01-01)

### Feat

- **entrypoint**: Remove newline if exists in last line of substitutions

## v1.4.0 (2023-01-01)

### Feat

- Create entrypoint.sh

### Refactor

- **entrypoint**: Add header to declare script file
- Pass environment variable to entrypoint.sh

## v1.3.1 (2023-01-01)

### Fix

- Resolve error that occur when quote simbol is missing

### Refactor

- Split substitutions by new line
- Use array variable to call varst command

## v1.3.0 (2022-12-25)

### Feat

- Set default version of varst to latest

## v1.2.1 (2022-12-23)

### Refactor

- Remove pip cache option in setup-python action

## v1.2.0 (2022-12-06)

### Feat

- Set default version of verst to inputs.version
- Add version paramter to inputs

## v1.1.0 (2022-12-05)

### Feat

- Install dependencies from requirements.txt
- Add caching pip dependencies

### Fix

- **ci**: Resolve permission denied when pushing changes

## v1.0.0 (2022-12-01)

### Feat

- Running action without passing file paths
- Create action.yml

### Refactor

- Use n operator to check empty options
- Save command to variable to reduce if statement
