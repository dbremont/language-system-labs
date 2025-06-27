class Token:
    def __init__(self, type_, value=None):
        self.type = type_
        self.value = value

    def __repr__(self):
        return f"{self.type}({self.value})" if self.value is not None else self.type

# Token types
NUMBER = "NUMBER"
PLUS   = "PLUS"
MINUS  = "MINUS"
MUL    = "MUL"
DIV    = "DIV"
LPAREN = "LPAREN"
RPAREN = "RPAREN"
EOF    = "EOF"

def tokenize(text):
    tokens = []
    i = 0
    while i < len(text):
        if text[i].isspace():
            i += 1
        elif text[i].isdigit():
            num = ""
            while i < len(text) and text[i].isdigit():
                num += text[i]
                i += 1
            tokens.append(Token(NUMBER, int(num)))
        elif text[i] == '+':
            tokens.append(Token(PLUS))
            i += 1
        elif text[i] == '-':
            tokens.append(Token(MINUS))
            i += 1
        elif text[i] == '*':
            tokens.append(Token(MUL))
            i += 1
        elif text[i] == '/':
            tokens.append(Token(DIV))
            i += 1
        elif text[i] == '(':
            tokens.append(Token(LPAREN))
            i += 1
        elif text[i] == ')':
            tokens.append(Token(RPAREN))
            i += 1
        else:
            raise SyntaxError(f"Unexpected character: {text[i]}")
    tokens.append(Token(EOF))
    return tokens

# Parser / Evaluator

class Parser:
    def __init__(self, tokens):
        self.tokens = tokens
        self.pos = 0

    def peek(self):
        return self.tokens[self.pos]

    def eat(self, type_):
        if self.peek().type == type_:
            self.pos += 1
        else:
            raise SyntaxError(f"Expected {type_}, got {self.peek().type}")

    def parse(self):
        return self.expression()

    def expression(self):
        result = self.term()
        while self.peek().type in (PLUS, MINUS):
            if self.peek().type == PLUS:
                self.eat(PLUS)
                result += self.term()
            elif self.peek().type == MINUS:
                self.eat(MINUS)
                result -= self.term()
        return result

    def term(self):
        result = self.factor()
        while self.peek().type in (MUL, DIV):
            if self.peek().type == MUL:
                self.eat(MUL)
                result *= self.factor()
            elif self.peek().type == DIV:
                self.eat(DIV)
                divisor = self.factor()
                if divisor == 0:
                    raise ZeroDivisionError("Division by zero")
                result /= divisor
        return result

    def factor(self):
        tok = self.peek()
        if tok.type == MINUS:
            self.eat(MINUS)
            return -self.factor()
        elif tok.type == NUMBER:
            self.eat(NUMBER)
            return tok.value
        elif tok.type == LPAREN:
            self.eat(LPAREN)
            value = self.expression()
            self.eat(RPAREN)
            return value
        else:
            raise SyntaxError(f"Unexpected token: {tok}")

# Calculator function
def evaluate(expr):
    tokens = tokenize(expr)
    parser = Parser(tokens)
    return parser.parse()

# Example usage:
if __name__ == "__main__":
    while True:
        try:
            expr = input("calc> ")
            if expr.strip() == "": continue
            result = evaluate(expr)
            print("= ", result)
        except Exception as e:
            print("Error:", e)
