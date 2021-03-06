//
//  QuoteViewController.swift
//  The Happiness Trinity
//
//  Created by Sky H on 1/30/21.
//  Copyright © 2021 Sky H. All rights reserved.
//

import UIKit
import Foundation
import Alamofire



class QuoteViewController: UIViewController, ContactDelegate {
    
    
    let quotesArray = ["Be yourself; everyone else is already taken.―Oscar Wilde", "You've gotta dance like there's nobody watching,Love like you'll never be hurt,Sing like there's nobody listening,And live like it's heaven on earth.―William W. Purkey", "“Be the change that you wish to see in the world.”―Mahatma Gandhi", "“Live as if you were to die tomorrow. Learn as if you were to live forever.”―Mahatma Gandhi", "“Darkness cannot drive out darkness: only light can do that. Hate cannot drive out hate: only love can do that.”―Martin Luther King Jr.,A Testament of Hope: The Essential Writings and Speeches", "“Without music, life would be a mistake.”―Friedrich Nietzsche,Twilight of the Idols", "“We accept the love we think we deserve.”―Stephen Chbosky,The Perks of Being a Wallflower", "“Imperfection is beauty, madness is genius and it's better to be absolutely ridiculous than absolutely boring.”―Marilyn Monroe", "“There are only two ways to live your life. One is as though nothing is a miracle. The other is as though everything is a miracle.”―Albert Einstein", "“We are all in the gutter, but some of us are looking at the stars.”―Oscar Wilde,Lady Windermere's Fan", "“Fairy tales are more than true: not because they tell us that dragons exist, but because they tell us that dragons can be beaten.”―Neil Gaiman,Coraline", "“Yesterday is history, tomorrow is a mystery, today is a gift of God, which is why we call it the present.”―Bill Keane", "“I have not failed. I've just found 10,000 ways that won't work.”―Thomas A. Edison", "“The opposite of love is not hate, it's indifference. The opposite of art is not ugliness, it's indifference. The opposite of faith is not heresy, it's indifference. And the opposite of life is not death, it's indifference.”―Elie Wiesel", "“I am enough of an artist to draw freely upon my imagination. Imagination is more important than knowledge. Knowledge is limited. Imagination encircles the world.”―Albert Einstein", "“You have brains in your head. You have feet in your shoes. You can steer yourself any direction you choose. You're on your own. And you know what you know. And YOU are the one who'll decide where to go...”―Dr. Seuss,Oh, the Places You'll Go!", "“It is never too late to be what you might have been.”―George Eliot", "“There is no greater agony than bearing an untold story inside you.”―Maya Angelou,I Know Why the Caged Bird Sings", "“Everything you can imagine is real.”―Pablo Picasso", "“You can never get a cup of tea large enough or a book long enough to suit me.”―C.S. Lewis", "“Life isn't about finding yourself. Life is about creating yourself.”―George Bernard Shaw", "“To the well-organized mind, death is but the next great adventure.”―J.K. Rowling,Harry Potter and the Sorcerer's Stone", "“Do what you can, with what you have, where you are.”―Theodore Roosevelt", "“Listen to the mustn'ts, child. Listen to the don'ts. Listen to the shouldn'ts, the impossibles, the won'ts. Listen to the never haves, then listen close to me... Anything can happen, child. Anything can be.”―Shel Silverstein", "“Success is not final, failure is not fatal: it is the courage to continue that counts.”―Winston S. Churchill", "“When one door of happiness closes, another opens; but often we look so long at the closed door that we do not see the one which has been opened for us.”―Helen Keller", "“So, this is my life. And I want you to know that I am both happy and sad and I'm still trying to figure out how that could be.”―Stephen Chbosky,The Perks of Being a Wallflower", "“And, when you want something, all the universe conspires in helping you to achieve it.”―Paulo Coelho,The Alchemist", "“You may say I'm a dreamer, but I'm not the only one. I hope someday you'll join us. And the world will live as one.”―John Lennon", "“I must not fear. Fear is the mind-killer. Fear is the little-death that brings total obliteration. I will face my fear. I will permit it to pass over me and through me. And when it has gone past I will turn the inner eye to see its path. Where the fear has gone there will be nothing. Only I will remain.”―Frank Herbert,Dune", "“Attitude is a choice. Happiness is a choice. Optimism is a choice. Kindness is a choice. Giving is a choice. Respect is a choice. Whatever choice you make makes you. Choose wisely.”―Roy T. Bennett,The Light in the Heart", "“Don't be pushed around by the fears in your mind. Be led by the dreams in your heart.”―Roy T. Bennett,The Light in the Heart", "“It’s only after you’ve stepped outside your comfort zone that you begin to change, grow, and transform.”―Roy T. Bennett", "“Do what is right, not what is easy nor what is popular.”―Roy T. Bennett,The Light in the Heart", "“Live the Life of Your Dreams: Be brave enough to live the life of your dreams according to your vision and purpose instead of the expectations and opinions of others.”―Roy T. Bennett,The Light in the Heart", "“Pursue what catches your heart, not what catches your eyes.”―Roy T. Bennett,The Light in the Heart", "“Believe in yourself. You are braver than you think, more talented than you know, and capable of more than you imagine.”―Roy T. Bennett,The Light in the Heart", "“Be grateful for what you already have while you pursue your goals. If you aren’t grateful for what you already have, what makes you think you would be happy with more.”―Roy T. Bennett,The Light in the Heart", "“Life is about accepting the challenges along the way, choosing to keep moving forward, and savoring the journey.”―Roy T. Bennett,The Light in the Heart", "“Letting go means to come to the realization that some people are a part of your history, but not a part of your destiny.”―Steve Maraboli", "“Start each day with a positive thought and a grateful heart.”―Roy T. Bennett,The Light in the Heart", "“Be brave to stand for what you believe in even if you stand alone.”―Roy T. Bennett,The Light in the Heart", "“Everything can be taken from a man but one thing: the last of the human freedoms—to choose one’s attitude in any given set of circumstances, to choose one’s own way.”―Viktor E. Frankl,Man's Search for Meaning", "“Do not fear failure but rather fear not trying.”―Roy T. Bennett,The Light in the Heart", "“Success is not how high you have climbed, but how you make a positive difference to the world.”―Roy T. Bennett,The Light in the Heart", "“Never lose hope. Storms make people stronger and never last forever.”―Roy T. Bennett,The Light in the Heart", "“Lack of direction, not lack of time, is the problem. We all have twenty-four hour days.”―Zig Ziglar", "“Cry. Forgive. Learn. Move on. Let your tears water the seeds of your future happiness.”―Steve Maraboli", "“You never change your life until you step out of your comfort zone; change begins at the end of your comfort zone.”―Roy T. Bennett", "“Do not let the memories of your past limit the potential of your future. There are no limits to what you can achieve on your journey through life, except in your mind.”―Roy T. Bennett,The Light in the Heart", "“Let the improvement of yourself keep you so busy that you have no time to criticize others.”―Roy T. Bennett,The Light in the Heart", "“Incredible change happens in your life when you decide to take control of what you do have power over instead of craving control over what you don't.”―Steve Maraboli,Life, the Truth, and Being Free", "“Happiness is not the absence of problems, it's the ability to deal with them.”―Steve Maraboli,Life, the Truth, and Being Free", "“Believe in your infinite potential. Your only limitations are those you set upon yourself.”―Roy T. Bennett,The Light in the Heart", "“The man who moves a mountain begins by carrying away small stones.”―Confucius,Confucius: The Analects", "“The only way of discovering the limits of the possible is to venture a little way past them into the impossible.”―Arthur C. Clarke", "“Surround Yourself with People Who Believe in Your Dreams:Surround yourself with people who believe in your dreams, encourage your ideas, support your ambitions, and bring out the best in you.”―Roy T. Bennett,The Light in the Heart"]
    
    
    @IBOutlet weak var QuoteLabel: UILabel!
    var randomQuote: String = "";
    var phoneNumber: String = "";
    func numberConfirmed(_ number: String) {
        phoneNumber = number
        print("phone number added:", number)
    }
    @IBAction func AddContactButton(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "AddContactViewController") as? AddContactViewController {
          //informs the Juice ViewController that the restaurant is the delegate
            vc.delegate = self
            present(vc, animated: true, completion: nil)
        }
    }
    @IBAction func SendButton(_ sender: Any) {
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        let parameters: Parameters = [
            "To": phoneNumber,
            "Body": randomQuote
        ]
        print(parameters)
        Alamofire.request("http://127.0.0.1:5000/sms", method: .post, parameters: parameters, headers: headers).response { response in
                print(response)
            
        }
        
        performSegue(withIdentifier: "Success", sender: sender)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomQuote = quotesArray.randomElement()!
        print(randomQuote)
        
        //COMMENT BELOW OUT IF YOU DONT HAVE SERVER RUNNING
        Alamofire.request("http://127.0.0.1:5000/quote").responseJSON{ response
            in
            if let json = response.result.value as! [String:Any]?{
                if let responseValue = json["value"] as! String?{
                    self.QuoteLabel.text =  responseValue
                    self.randomQuote = responseValue
                    print(responseValue)
                }
            }
        }
        //COMMENT ABOVE OUT IF YOU DONT HAVE SERVER RUNNING
        QuoteLabel.text = randomQuote
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
