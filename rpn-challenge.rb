class Stack
    class EmptyStackError < StandardError;end

    def initialize
        @stack = []
    end

    def empty?
        @stack.empty?
    end

    def push(val)
        @stack.push(val)
    end

    def pop
        raise EmptyStackError, 'Empty stack' if empty?
        @stack.pop
    end

    def peek
        @stack.last
    end
end

class RPNEvaluation
    def initialize(expr)
        @expr = expr
    end

    def evaluate
        stack = Stack.new

        tokens.each do |token|
            if number?(token)
                stack.push(token.to_i)
            elsif token == '+'
                right = stack.op
                left = stack.pop
                stack.push(left + right)
            elsif token == '*'
                right = stack.pop
                left = stack.pop
                stack.push(left * right)
            elsif token == '-'
                right = stack.pop
                left = stack.pop
                stack.push(left - right)
            elsif token == '/'
                right = stack.pop
                left = stack.pop
                stack.push(left / right)
            else
                raise 'Invalid entry! Please input one of the following: +, *, -, or /'
            end
        end

        stack.pop
    end

    private

    def tokens
        @expr.split(' ')
    end

    def number?(token)
        token =~ /^-?\d\+$/
    end
end
