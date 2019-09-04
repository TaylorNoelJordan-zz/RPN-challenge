class Stack
    class EmptyStackError < StandardError;end

    # create a stack to store values while awaiting an operator
    def initialize
        @stack = []
    end

    # declare a condition to evaluate if the stack is empty
    def empty?
        @stack.empty?
    end

    # use push method to take in each value from input
    def push(val)
        @stack.push(val)
    end

    # use pop to receive the last value of the values array
    def pop
        raise EmptyStackError, 'Empty stack' if empty?
        @stack.pop
    end

end

class RPNEvaluation
    ## method to receive expression as an argument
    def initialize(expr)
        @expr = expr
    end

    # method to read and return RPN calculation
    def evaluate
        # create new instance of Stack
        stack = Stack.new

        # evaluate each token from input
        chars.each do |char|
            # if the value is a number, convert it to an integer and push on to the stack
            if number?(token)
                stack.push(token.to_i)
            # evaluate for addition
            elsif token == '+'
                right = stack.pop
                left = stack.pop
                result = stack.push(left + right)
                puts result
            #evaluate for multiplication
            elsif token == '*'
                right = stack.pop
                left = stack.pop
                result = stack.push(left * right)
                puts result
            # evaluate for subtraction
            elsif token == '-'
                right = stack.pop
                left = stack.pop
                result = stack.push(left - right)
                puts result                 
            # evaluate for division
            elsif token == '/'
                right = stack.pop
                left = stack.pop
                results = stack.push(left / right)
                puts result
            # character q to quit, and empty stack
            elsif token == 'q'
                puts 'goodbye'
                stack.pop
            else
                # error message if user inputs invalid type
                raise 'Invalid entry! Please input one of the following: +, *, -, or /'
            end
        end
        # empty stack
        stack.pop
    end

    private

    # define characters and split as they come in
    ## Note: I mentioned in my email that I was having success in Repl with invoking the expression later 
    ## rather than via feedback in the command line. This is mainly indicative of my JavaScript background
    ## and inexperience with Ruby. Would love to go over how this can be accomplished in the way the prompt describes.
    def chars
        @expr.split(' ')
    end

    # define whether the characters evaluate to a numeric value - returns true or false
    def number?(char)
        char =~ /^-?\d\+$/
    end
end


