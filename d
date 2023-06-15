import requests
from bs4 import BeautifulSoup
import pandas as pd

url = "https://stats.stackexchange.com/questions?tab=Votes"
response = requests.get(url)

soup = BeautifulSoup(response.content, "html.parser")

question_items = soup.find_all("div", class_="question-summary")

titles = []
views = []
answers = []
votes = []

for item in question_items:
    title = item.find("a", class_="question-hyperlink").text.strip()
    titles.append(title)

    view_count = item.find("div", class_="views").text.strip().split()[0]
    views.append(int(view_count))
    answer_count = item.find("div", class_="status").find("strong").text.strip()
    answers.append(int(answer_count))
    
    vote_note = item.find("div", class_="votes").text.strip()
    votes.append(vote_note)
data = {
    "Title": titles,
    "Views": views,
    "Answers": answers,
    "Votes": votes
}
df = pd.DataFrame(data)

print(df)
