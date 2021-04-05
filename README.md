
# Assignment 1 - Playing with Aha!

Parker Mitchell


## Curiosity
At the beginning, I was at a loss for what to do with Aha, as program synthesis is very new to me. However, pretty quickly I started to think about one area with Aha in which I was curious how it would perform. That is, the difference in Aha generated instructions for code that achieves the same goal but is written differently. This is what I investigated for this assignment.


## Testing

I investigated this by writing five fragment files, found in the *mul2_X.frag.c* files. Here, I wrote C code that doubles the input number in different ways.

- The first file simply computes `x * 2` 
- The second file computes `x + x`
- The third file computes `2 * x`
- The fourth file computes `x << 1`
- The fifth file computes `x * 3 - x`

I wanted to see if these different ways of doubling `x` produced differences in the Aha generated code. I then generated four output files for each fragment file, named with the convention *mul2_X_Y.frag.c*, where X indicates which fragment file, and Y indicates the number of target instructions passed into Aha for that particular output file.

I wrote a small script named *diff_outputs.sh* to diff the corresponding files and show the differences between the generated outputs. So for example, *mul2_1_1.out* would diff against *mul2_2_1.out* and *mul2_3_1.out* and so on, then *mul2_2_1.out* would diff against *mul2_3_1.out* and so on, and then we would move onto the *mul2_X_2.out* files and repeat the process.

## Findings
I didn't find differences between the Aha generated instructions for some of these fragment files, which I found interesting and quite surprising. Before I diff'd, I thought that fragment files 1-4 would all result in the same, or at least mostly the same instructions. I *didn't* expect there to be absolutely 0 differences (besides processing time), especially when discussing fragment file 5. I initially half-thought that `x * 3 - x` would not always reduce to something like `x + x`, because I thought that maybe Aha might think the `- x` might be something intended, and not just some convoluted way to approach the same problem. Thinking about it now though, and thinking of Massalin’s paper, it makes sense that when you are restricting yourself to *n* instructions, a superoptimizer will find the smallest program that achieves the same result as the original program. It was an error in my thinking that this superoptimizer might consider and expression with 2 operations any different than an expression with only 1 operation that achieves the same result. This was a very interesting and enlightening dive for me into the process behind and limitations of a superoptimizer.

## Try It Yourself
If you want to run the script yourself, just clone my repo and run my diff script:

    ./diff_outputs.sh
