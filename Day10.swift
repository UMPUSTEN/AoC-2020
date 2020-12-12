//
//  Day10.swift
//  iOS
//
//  Created by UMPUSTEN on 10.12.20.
//

import Foundation

let input = inputDay10.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: .newlines)

var adapters = input.map { Int($0)! }.sorted()

adapters.insert(0, at: 0)
adapters.append(adapters.last! + 3)

print(adapters)

var oneJolt = 0
var threeJolt = 0

//MARK: Day 10 Part 1 -
for index in 0..<adapters.count - 1 {
    switch adapters[index+1] - adapters[index] {
    case 1:
        oneJolt += 1
    case 3:
        threeJolt += 1
    default:
        print("nothing to see here")
        break
    }
}
print(threeJolt, "*", oneJolt, "=", oneJolt*threeJolt)

//MARK: Day 10 Part 2 -

    //Combinations can occure, if the next 2 steps are ony 1 apart
    // [4,5,6,7,10]
    // [4,5,7,10]
    // [4,6,7,10]
    // [4,7,10]
    // From 4 to 7 are 3 staps of 1
    // That results in 4 possible combinations
    // So the rules are:
    // 2 steps of 1 = 2 combinations
    // 3 steps of 1 = 4 combinations
    // 4 steps of 1 = 7 combinations
    // in order to not have to create all cases,
    // we call our function recursif with only the first 2 combinations
    // n <= 1 return 1
    // n = 2 return 2
    // n = 3 return 4
    // n > 3 return a(n) = a(n-1) + a(n-2) + a(n-3)
    // witch is called the tribonacci number series... <--wich luckily some other people knew :D


var possibleWays = [Int]()

func tribonacci(_ n: Int) -> Int {
    n <= 1 ? 1
        : n == 2 ? 2
        : n == 3 ? 4
        : tribonacci(n - 1) + tribonacci(n - 2) + tribonacci(n - 3)
}

var steps = 0
for index in 0..<adapters.count - 1 {
    switch adapters[index+1] - adapters[index] {
    case 1:
        steps += 1
    case 3:
        if steps > 0 {
            possibleWays.append(steps)
            steps = 0
        }
    default:
        break
        
    }
}

print(possibleWays, possibleWays.map { tribonacci($0) }.reduce(1, *))
print( possibleWays.map { tribonacci($0) })


public let inputDay10 = """
104
83
142
123
87
48
102
159
122
69
127
151
147
64
152
90
117
132
63
109
27
47
7
52
59
11
161
12
148
155
129
10
135
17
153
96
3
93
82
55
34
65
89
126
19
72
20
38
103
146
14
105
53
77
120
39
46
24
139
95
140
33
21
84
56
1
32
31
28
4
73
128
49
18
62
81
66
121
54
160
158
138
94
43
2
114
111
110
78
13
99
108
141
40
25
154
26
35
88
76
145
"""

