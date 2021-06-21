//Given the array of numbers in this exercise. Create another array called computedNumbers. computedNumbers should multiply each element in the numbers array by the next element Thre last element should be multiplied by the first.

import UIKit

func exercise() {

    let numbers = [45, 73, 195, 53]
    
    //Write your code here
    let computedNumbers = [numbers[0]*numbers[1], numbers[1]*numbers[2], numbers[2]*numbers[3], numbers[3]*numbers[0]]
    
    print(computedNumbers)

}
