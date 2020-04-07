# The performance of a code

Let's compare 2 algorithms performance on a very simple example.
The goal of our algorithms is to figure out if the two arrays below are anagrams or not.

```
 __________________________________
|    |    |    |    |    |    |    |
|  l |  e |  w |  a |  g |  o |  n |        => an array of 7 letters
|____|____|____|____|____|____|____|
```

```
 __________________________________
|    |    |    |    |    |    |    |
|  n |  o |  w |  a |  g |  e |  l |        => an array of 7 letters
|____|____|____|____|____|____|____|
```


## Very unefficient anagram check

### Pseudo-code 
```
for each letters of [lewagon],                          => runs 7 times
    check if the letter is also in [nowagel]            => runs 7*7 times !!
        if yes, replace the letter by "" and continue
        if not, return false
if no letters remain in [lewagon], return true          => runs 7 times
```
### Performance result:
`7 * 7 + 7 = 49 + 7 = 56 operations`

For an array of 1000 letters,

`1000 * 1000 + 1000 = 1,001,000 operations`

#### Note:
>1000 is negligeable vs 1000 * 1000, we will ignore it when we count the performance.
>1000 is negligeable vs 1000 * 1000, which itself is negligeable vs 1000^3.
>Also 2 * 1000 is negligeable vs 1000 * 1000, thus we also consider that 2 * 1000 ~= 1000 in performance calculation.

>`1000 * 1000 + 1000 ~= 1000 * 1000 = 1,000,000 operations`

For an array of n elements,

`n * n = n^2`

The performance of this algorithm is a `O(n^2)`.

## Quick sort

[Quick sort](https://en.wikipedia.org/wiki/Quicksort), the algorithm used for Ruby's `.sort` method as a performance of O(n*log(n)).

### Pseudo-code
```
use `.sort` to sort [lewagon]                          => runs 7*log(7) times
use `.sort` to sort [nowagel]                          => runs 7*log(7) times
for each letter of [lewagon]                           => runs 7 times
    check if same as the letter of same index in [nowagel]
    if no return false
return true
```

### Performance result:
`7 * log(7) + 7 * log(7) + 7 = 5.9 + 5.9 + 7 = 18 or 19 operations`

For an array of 1000 letters,

`1000 * log(1000) + 1000 * log(1000) + 1000 = 3000*2 + 1000 = 7000 operations`

## Who wins?
In comparison,

```
n * log(n) = 1000 * log(1000) = 3000 operations
n^2 = 1000 * 1000 = 1,000,000 operations
```

For `n=1000`, O(n^2) more than a 300 times less efficient!


## References
- [The Definitive Guide To Time Complexity For Ruby Developers](https://www.rubyguides.com/2018/03/time-complexity-for-ruby-developers/)
- [Big O explanation in plain English](https://stackoverflow.com/questions/487258/what-is-a-plain-english-explanation-of-big-o-notation)
- [BigO cheatsheet](https://www.bigocheatsheet.com/)
- [Time complexity on Wikipedia](https://en.wikipedia.org/wiki/Time_complexity)
- [Quick sort](https://en.wikipedia.org/wiki/Quicksort)
