from datetime import datetime

# Input: Birthday date in the format 'YYYY-MM-DD'
birthday_str = input("Enter your birthday (YYYY-MM-DD): ")

# Convert the input string to a datetime object
try:
    birthday_date = datetime.strptime(birthday_str, "%Y-%m-%d")
except ValueError:
    print("Invalid date format. Please use the format 'YYYY-MM-DD'")
else:
    # Calculate the age in seconds
    current_date = datetime.now()
    age_in_seconds = (current_date - birthday_date).total_seconds()

    print(f"You are about {int(age_in_seconds)} seconds old.")
