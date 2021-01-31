# Inspiration
It’s perhaps a little cliched to say that 2020 inspired our brainstorming process. But the truth is that most of our project ideas were centered around self-improvement, having a positive headspace, and mental health. Tranquility is an app that focuses on the self. It is not a social media app. There are no external influences that are found on social media that influence users to be anything other than true to their authentic selves. There’s no peer pressure to always be perfect. This is for the user to do what they feel is right independent of external pressures. 

We truly believe that it is important to focus on positivity, and self healing. That is why we bring you, **Tranquility**, an app that brings motivation, inspiration, and self care.  From daily, inspirational quotes to heartwarming images, this app allows one to truly take a break from the stresses of the day. It is important to take a step back and let yourself meditate all the stresses away. Journaling your daily accomplishments is a great exercise for bringing positivity in your day and truly understanding your emotions. 

![](https://media.giphy.com/media/DBbPjLMsQPruMkDcrd/giphy.gif)

# What it does
Tranquility has 3 main features. 
First, the Quote feature displays daily inspiration and motivational quotes every time they open the app by querying the Web. If the user particularly likes the quote, they can send a text message to someone they know that contains the quote to help brighten their day. It is important to keep up your social relationships especially during these times of isolation. Sending these quotes brings positivity to others lives and can truly spark a whole new friendship.  

The Gallery feature gives the user a daily dose of heartwarming images based on the users preference. This helps the user escape the stresses of the day. Self healing and taking a step back is important to mental health. Seeing these images help you look at the good aspects in life and helps with appreciation of the small things. 

The Journal feature keeps track of all the accomplishments a user writes down. The intent is for the user to input any achievement, big or small, that they feel proud of. The Journal has a calendar display that lets users visually see what things they’ve done in the past. Ideally, this calendar will motívate the user and help them feel productive by showing them what they’ve done recently. This feature helps maintain positivity each day. Getting the user to think about their achievements however small is important to having a positive lifestyle. 



# How we built it
Very early on, we decided to create an iOS app, since all of us have Macs and iPhones. Naturally, the foundation of our project is Swift. We separated our project into three main functionalities that each of us could build more or less independently. The Quotes, the Gallery, and the Journal. These were built with:
- Flask
- Swift
- XCode
- Python
- bs4
- FSCalendar 

# Challenges we ran into
As far as we could tell, iOS development requires using Xcode, and Xcode is far from perfect. It crashes from tapping control-z and more significantly, it doesn’t really cooperate with version control. Every time we had a merge conflict using Git, Xcode refused to open the project at all. It was very annoying to have to open up VS Code and deal with the merging in a different editor.  Furthermore, the merging issue was particularly bad with the main.storyboard file, to the point where it was just easier to only ever have one person work on it at a time. This greatly hindered our productivity. The second big problem was that seemingly randomly, pods that we had been using were no longer working after the latest push. So we had to figure out how to get all our dependencies working. Overall, we learned quite a lot about Swift and IOS development. Being our first times really working on an IOS project it was a challenging experience.

![](https://media.giphy.com/media/l1J9NRpOeS7i54xnW/giphy.gif)

# Accomplishments that we are proud of
1. an app that builds and runs…. Without xcode crashing!
2. There was a time when all the Git/Xcode problems were highly concerning…
3. Fixing the endless stream of merge conflicts with Xcode
 
# What we learned
- Coding in Swift and an iOS app 
- Understanding Swift language features
- XCode… And all of its bugs
- How to stay calm when XCode crashes
- Not to work on the storyboard at the same time
- Merge conflicts galore

# What's next for Tranquility
- Group meditation feature
- Personalized emailing and texting 
- Adjustable settings for background and music
- Account system

