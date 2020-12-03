//
//  Day2.swift
//  iOS
//
//  Created by UMPUSTEN on 02.12.20.
//

import Foundation

var input = inputDay3.split { $0 == "\n" }

func runSlope(slide: Int, drop: Int) -> Int {
    
    var stride = 1
    var treeCount = 0
    
    for (row, string) in input.enumerated() {
        
        if row + 1 > drop, row % drop == 0 {
            
            if stride + slide > (string.count) {
                stride = slide - ((string.count) - stride)
            } else {
                stride += slide
            }
            
            if string[string.index(string.startIndex, offsetBy: stride - 1)] == "#" {
                treeCount += 1
            }
        }
    }
    
    return treeCount
}

//MARK: Day 3 Part 1 -
print("Day 3 Part 1 ---")
print(runSlope(slide: 3, drop: 1))

//MARK: Day 3 Part 2 -
print("Day 3 Part 2 ---")

var slopes = [Int]()

slopes.append(runSlope(slide: 1, drop: 1))
slopes.append(runSlope(slide: 3, drop: 1))
slopes.append(runSlope(slide: 5, drop: 1))
slopes.append(runSlope(slide: 7, drop: 1))
slopes.append(runSlope(slide: 1, drop: 2))

print(slopes.reduce(1, *))


public let inputDay3 = """
...#...###......##.#..#.....##.
..#.#.#....#.##.#......#.#....#
......#.....#......#....#...##.
...#.....##.#..#........##.....
...##...##...#...#....###....#.
...##...##.......#....#...#.#..
..............##..#..#........#
#.#....#.........#...##.#.#.#.#
.#..##......#.#......#...#....#
#....#..#.#.....#..#...#...#...
#.#.#.....##.....#.........#...
......###..#....#..#..#.#....#.
##.####...#.............#.##..#
....#....#..#......#.......#...
...#.......#.#..#.........##.#.
......#.#.....###.###..###..#..
##..##.......#.#.....#..#....#.
..##.#..#....#.............##.#
....#.#.#..#..#........##....#.
.....####..#..#.###..#....##..#
#.#.......#...##.##.##..#....#.
.#..#..##...####.#......#..#...
#...##.......#...####......##..
...#.####....#.#...###.#.#...#.
....#...........#.##.##.#......
.....##...#.######.#..#....#..#
.#....#...##....#..######....#.
...#.....#...#####.##...#..#.#.
.....#...##........##.##.##.###
#.#..#....##....#......#....#.#
......##...#.........#....#.#..
###..#..##......##.#####.###.##
#.....#..##.##....#...........#
##..#.#..##..#.#.....#......#..
.#.##.#..#.#....##..#..#....#..
.#......##..##.#...#..#.......#
#....##.##..###..###......##.#.
....###..##.......#.###.#....#.
..##........#........##.....#..
.#..#.....#...####.##...##.....
....#.#.#.....#.##..##.....#..#
..............#.....#...#.....#
.#.....#......###...........#.#
.....#.#......#.##..#..........
.#......###............#.#.##..
.#.#....##.#..###.....#.##..#.#
.......#.#.#..#..#..#...##..#.#
.#.###...##.#.#.####.#.#...#...
...#.#....#......##.##.#.......
#...#.....##....#........##....
.....###...#.##.#......##.#..#.
..#...##.##.###..#..#......####
.#.##.#..#.##..##..........##..
..#.#.#..#.#.....#...###.....#.
..#..#.#....#.##.............##
.......#..###..#.#...#.....##.#
####.#.#......#..#.##.........#
..........#.....#..##......###.
..#..............#...#..##.....
......#.#.#..#.##.....####..##.
.##.#..#.#....#.......#..#.....
..#..#..#.##.#....###.#.#.#.#.#
.....#....#......###..#........
#.#.#..#...###.....#......#.##.
...#.#....#.#......#........#..
..#...###.#...#..#....##...#..#
.###.##..#..#...###.#..#.####..
#....#..##..##..#......#...##..
#.#..#...#..#...###..#.#.##....
##....#....##.####...#.#.###...
##.#...#.......#.##.##....#...#
..#.#..........#..#.#.#....#..#
..#........#...#....#....#....#
..#..#....#.......#........#...
......#....#....##.#....#.#.##.
.##...###.##.##....##.#...###..
.....##..#.#.....###..#.....###
....##.#.##...##..##........#..
#...#..##.#.#....#......#...#..
.###.##.#........#.####....#...
#.##.....#..#...#..##.##..#.#..
.....#.#..#....#..#...##.##.#..
.#......#####...##...#.#.###.#.
#......##....#.....#......##.#.
#.#.##.###.#......#####..#.....
........###.#...#..#.#........#
....#....###..#.##.#...#....#..
..........#..#.#....#...#.#...#
#.##......###.#.#.#....####...#
...#.#....#........##.#.....##.
.....##..#.#.#..###...##...#...
#...#...#....#....##........#..
.....#.........##.#......#..#..
#.....##..#.###.....#....##.##.
...#..#..#.#........##...##.#.#
..#..##.###.....#.#.....###.##.
..###.........#...##.....###...
...###...##.#...##....##.......
.#.#..#...###..#.#....#....#...
##..#.......#....#.#...#..#..#.
..#......#....####..##..#.###.#
..#.......##........#.#.#..#...
.#.......#.##.#.##.#.......#..#
###...#...#...#...#..#...#...##
..#..........#..###........##..
.##..#....##......##........#.#
......#.##......#......##...#.#
.#.#....#.#.#........#......#..
.#.#..#....####..##...##....#..
.#...##..#..#..#####....##.#...
.##.#.#...#...#.#...#.##.#...#.
###.#...##..#.###.#.....#.##.#.
#.....#.###.#.#...#..#....#.#..
..##..#....#......#.........###
.#...#...##......#...#.####....
..#.##...##..............#.#..#
..#......#..##...........#..#.#
..#####...#..#.......##...###..
..##..#....#.#...###.#...#.....
..#....#..#.#.......#..#.#.#...
.##..#.#.....##....#.......#...
...#.#..###...##....#....##..#.
.....##..#...##.####....##...#.
.......#.........#...#.##..####
........###..#..#.##.###..#....
.#.#..#.##.##.........#...#....
.###......#.....#....##....####
.##..##...........#.....#.....#
#.#.#.#.#.#.##..#.#.#..#.##....
.##.##...##..#....##..###..####
#..##.#......#...###.........#.
#..#...#..##..#..##.....##...#.
#...##..#...##.#.###.#...#.....
.###.....#.......#...#.##.###.#
..........#.#......#...###...##
..##....#.#..#....#.###...#..##
#.#..#....##.##..##.........##.
#.....#.##.###.#..#....##...#..
...#........##...#..###..######
#..#.#.#.#...#....#....###.#..#
...##.##.##.....##..#........#.
..#.#....#..#.......#...##.##.#
###.##.......##..#.####...#.#..
....#.#.....##.....#.#.##...#..
.#..##..#.....#.#..#...#..#..#.
.###....##...#......#.....#....
##.##.###......#...#...###.#...
#...#.##...#.#....##.....####..
#.#.#.#...###...##.............
..#....#.....##.#...#......#...
....#...#......#...#..#...#.#..
.###..#.....#..#...#....#...#..
..#...#.#..###.......#..#.#...#
#...###.##.....#....#..#.#..##.
...#.##.#.##......#.#.#.##.....
........####...##...##..#....#.
.#.#....#....#.#...##.###...##.
#.#...###.#.#.#....#....#.#....
.####.#..#.#....#..#.#..#..#...
#####...#...#...#....#.#.#..##.
..###.##.###...#..........#.##.
##.....#...#....###..###.#.#.#.
#..##.#..#..#..#...#.#...###..#
##....#.#...##......#.#...#...#
.##..........#.#....#...#.##..#
....#....####.#.####......#.###
..##.#.....####.#.####.......#.
#.##.##.#.....#.##......##...#.
......###..#.....#.....##......
..#..#....#.#...#.....#......##
##..#..#..###.#.#..#..##.....#.
#....#.#.....#####...#.#.......
.....#..#....#.#.#..#...#...#..
............#.##......##.##.#.#
....#...#.#........###....#....
..#..#...###.#....##..#..###.##
#.##....#...#.....##..#.##.#...
...##..###...#.#.....##.#......
.#..#.##.#####..#.......#..###.
...#.##...###.....####.#.#.....
.#......##.#.#.#.#.##.#.....#..
..#.##.#..##.......#.#.....##..
..................#....#...#...
.##.#..#.#.#..#.......#.#..##.#
....#........#......#..####..#.
#...#...##..##.#..#.......##...
#..#..#..#..#........####..#.#.
..#.#......#..#.##.##.#.#...#.#
...#..#......#.#.###.#.##..##..
..#...##.....#..#...##..#.#....
#.........#....#..#....##.##..#
..#..#.#....#..#...#.##.....#..
...#..#...#.#.....#..##..#.#...
....#........#.#....##..##..#..
#.....#.#..#.......#.##.....#..
.#.###.###...##...##..###...#..
.##.##.......#.#......#.....#.#
...#....##....#..#..........#.#
..#.##.........#.#.....#.....#.
...#.##..##.......##..##...#...
#.##......##.##..#.....##...##.
#.#.#..##...#.#............#.#.
....#.....#......##...#.#.....#
...#.#......#.#...###.......#..
......##..###....#.#...#.#####.
..#..#.#.#...##.#...###..##..#.
##.##.#.#.##.#..#....#...#...#.
#..#....######.##.#...#...#.#..
.#..#.##....#..#.#.......#....#
....#....#......##....##.#.#...
.###......#..#..#.......####..#
.#.#.....#..###...........##...
.##..##.##.....####..#..#..##..
..#..##.#......#...###.##..#.#.
....##..#.....###..#.##....##.#
#..#......#....#.........#.....
.#...#.....#.#..#..##....#.....
.##..#...#..##.#..#...........#
..#..##........##.......#..#...
#.....#....#....#.#.#...##.#...
...#...#.#.#..#.##.#.#...#.....
..#..#.#....#....###....#.#.#..
...###..#...#..#....#.....#....
...#...#.#..#.....#...###......
##......#..........#.#.#..#.#.#
....#.....#.....#..#..#.#.#.#..
...####...#.##...#.#..#....#.#.
#.##........##.............#.##
#.#.#.#.#.....................#
.#.###....#..##.##.##....#.....
#.#...#.####.###...#..#..#.#...
.##...#..###.......##..#.#.....
#.#.#.#...#...#.##.....#.......
.##.#.#.#......####..#.#.......
###..........#......#...##...#.
.........##...#.##...#.#.......
...#.#.....#...#..#...#..##..#.
.#..###...#.#.........###....#.
##..#...#........#.........##..
.....#...#.#...#.#.#...........
..#....##...#.#..#..#.##....##.
.##....#.#.....##.#..#..#...##.
..##......#.#...#.#.......##.#.
##...#..#...##.#........#.##...
#......#.##..#.#..#.###.......#
#.#...#.....#.#......#.#.#.....
#.....#..#.......#....##.#.#..#
###.#....#..##.#.##....#....#..
#.##.##....#.#..#.#...#....#...
####...#####...#.....#....##.#.
....#.#...#.#.##.#.#.##.#.#.###
#.....##.#.....#.#......#.#..#.
.#....##.#..#........#...##.#..
......#...#....##....##....##..
..###.....#....##.#...#..#.....
#....##...##.##..##.#...#...#..
#..#...#...#.#....##..#.#....#.
......................#.....#..
.#..#...#.........#....##...###
.##.#.#...##...#...#...#..#....
.#.###....#.#............##..#.
###..##.#.#.#.#....##...#......
.##................####...##.##
.#.#.........##....#.#.##.##.#.
....#...#...#...##...#.##.#..#.
.#.#........#..##.....#..#....#
##.#..#.#....#.....#...#...#...
.#...##....#.....##....#..#.#.#
####.....#..#....#......###.##.
##..##.#....###.....#...#......
.##.#...#.....#.#..#.#..#.#...#
.....#.#..#..#..###.#...###.#..
.#.#.##.#..#.#..#...#..#.......
..#.....#....#.##.##.##.......#
.#..##....###...#..............
#....#...#.#.......#....##.#...
....#.#..##.#....#..#.#....#.#.
#.........##...#.#.............
#.#.......##.....#...##..##.#.#
.......#....#..##...#..#######.
.#.#...##........#..#.....#.#..
.#.......#..#......#.##.##...##
.........#............#....#..#
.#......#...##...##...#....###.
.........#...#.#.###.......#...
###.#..#.#.#.#......##...#.#...
.#.........##.#....###....#.#..
#.#....#..#.##.#..#....##...#..
###.#...#..#..##........#.###..
.....#....#..#........#..#.##.#
..#.....##......#....#..#.#.#..
.#.........#.....#.....#.......
......#....#.###..#.#....#....#
..#.#..#.#.###.........#..#..#.
..#..#.#.#.........#....##.#.#.
#.......#........##...##....#..
##..#..#...###...#..##..#..#.#.
##..#..#....#.#..##..#..#.#..#.
..##.....##.#..#.#........###..
..#.#..#..##........#...#....##
.##..#....##..#..#..#..#.#....#
#....#.....##........#.....#.##
......#....#.#..#......#.##....
.......#..#..#......##.........
......#...#..##.....#......#..#
#..#..#....##....#........##..#
##....#...#.#.....#####........
...#.#..#.#.##.#.##..##...#....
..#..#..#..#..#....#..#..##...#
.#.....#....##.##....##.....#..
#...#.....#.....#.#...#.#....#.
.###...#..##....#..#...#.###...
....#..##..#.......#.##.##..###
#.......##.....#.......#.#...##
#.....#.#.#....#.#......#.#.#..
..##.....#..###......##........
.....#...#..##....#......#.....
#..#..#....#.#...#..###.......#
.....#.....#....#..#...#.#..##.
#####........#...#..#..##..#.#.
.#..#...#.##....#.#..#......###
#.###.#..#.....##..##....#...#.
.#...#.#####....##..........##.
"""
