import Foundation


// 1.
//გვაქვს 1,5,10,20 და 50 თეთრიანი მონეტები. დაწერეთ ფუნქცია, რომელსაც გადაეცემა თანხა (თეთრებში)
//და აბრუნებს მონეტების მინიმალურ რაოდენობას, რომლითაც შეგვიძლია ეს თანხა დავახურდაოთ.


func minSplit(amount: Int) -> Int {
    let coins = [50, 20, 10, 5, 1]
    var remaining = amount
    var count = 0
    
    for coin in coins {
        count += remaining / coin
        remaining %= coin
    }
    
    return count
}

minSplit(amount: 9)
minSplit(amount: 26)
minSplit(amount: 172)


// 2.
// დაწერეთ ფუნქცია რომელიც დააჯამებს ციფრებს ორ რიცსხვს შორის.

func sumOfDigits(_ start: Int, _ end: Int) -> Int {
    var sum = 0
    
    for num in start...end {
        var current = num
        while current > 0 {
            sum += current % 10
            current /= 10
        }
    }
    
    return sum
}


sumOfDigits(7, 8)
sumOfDigits(17, 20)
sumOfDigits(10, 12)


// 3
//მოცემულია String რომელიც შედგება „(" და „)" ელემენტებისგან. დაწერეთ ფუნქცია რომელიც აბრუნებს
//ფრჩხილები არის თუ არა მათემატიკურად სწორად დასმული.

func isProperly(sequence: String) -> Bool {
    var stack = [Character]()
    
    for char in sequence {
        if char == "(" {
            stack.append(char)
        } else if char == ")" {
            if stack.isEmpty {
                return false
            }
            stack.removeLast()
        }
    }
    
    return stack.isEmpty
}


isProperly(sequence: "(()())")
isProperly(sequence: ")(()")
isProperly(sequence: "(()())(")


//4.
/*
 გვაქვს N ფიცრისგან შემდგარი ხიდი. სიძველის გამო ზოგიერთი ფიცარი ჩატეხილია. ზურიკოს შეუძლია
 გადავიდეს შემდეგ ფიცარზე ან გადაახტეს ერთ ფიცარს. (რათქმაუნდა ჩატეხილ ფიცარზე ვერ გადავა)
 ჩვენი ამოცანაა დავითვალოთ რამდენი განსხვავებული კომბინაციით შეუძლია ზურიკოს ხიდის გადალახვა.
 გადმოგვეცემა ხიდის სიგრძე და ინფორმაცია ჩატეხილ ფიცრებზე. 0 აღნიშნავს ჩატეხილ ფიცარს 1_ანი კი მთელს.
 დასაწყისისთვის ზურიკო დგას ხიდის ერთ მხარეს (არა პირველ ფიცარზე) და გადალახვად ჩათვლება ხიდის
 მეორე მხარე */


func countWays(n: Int, steps: [Int]) -> Int {
    
    if n == 0 { return 1 }
    
    for i in 0..<n - 1 {
        if steps[i] == 0 && steps[i + 1] == 0 {
            return 0
        }
    }
    
    let fullBridge = [1] + steps + [1]
    
    var ways = Array(repeating: 0, count: n + 2)
    
    ways[0] = 1
    
    for i in 1...n + 1 {
        if fullBridge[i] == 1 {
            if i - 1 >= 0 && fullBridge[i - 1] == 1 {
                ways[i] += ways[i - 1]
            }
            
            if i - 2 >= 0 && fullBridge[i - 2] == 1 {
                ways[i] += ways[i - 2]
            }
        }
    }
    
    return ways[n + 1]
}


print(countWays(n: 1, steps: [0]))
print(countWays(n: 1, steps: [1]))
print(countWays(n: 6, steps: [0, 1, 0, 0, 1, 1]))
print(countWays(n: 3, steps: [0, 1, 0]))
print(countWays(n: 5, steps: [1, 1, 0, 1, 1]))




// 5.
//გადმოგეცემათ მთელი რიცხვი N. დაწერეთ ფუნქცია რომელიც დაითვლის რამდენი 0ით ბოლოვდება N!

func zeros(N: Int) -> Int {
    var count = 0
    var i = 5
    while i <= N {
        count += N / i
        i *= 5
    }
    return count
}


zeros(N: 7)
zeros(N: 12)
zeros(N: 490)

