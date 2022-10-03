#   Application Programming Interface

import requests

API_KEY = "fdf25db77914c8ae162c5f58f2d87bce"
BASE_URL = "http://api.openweathermap.org/data/2.5/weather"

city = input("Enter a city name: ")
#request_url = f"{BASE_URL}?appid={API_KEY}&q={city}"               # f string
request_url = f"{BASE_URL}?appid={API_KEY}&q={city}&units=metric"
# get retrieves data & stores in response
response = requests.get(request_url)

# check if status code is successful
if response.status_code == 200:
    # gives json data as py dict
    data = response.json()
    weather =  data['weather'][0]['description']
    #temperature_C = round(data["main"]["temp"] - 273.15,2)
    temperature_C = data["main"]["temp"]
    temperature_F = round(9/5 * temperature_C + 32, 2)
    
    print("Weather: ", weather)
    print("Temperature: ", temperature_C, "Celsius or", temperature_F, "Fahrenheit")
else:
    print("An error occurred")
