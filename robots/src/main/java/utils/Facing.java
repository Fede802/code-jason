package utils;

import env.Direction;
import env.Vector2D;
import jason.asSyntax.Atom;
import jason.asSyntax.Literal;
import jason.asSyntax.Term;

enum Facing {
    TOP(1, 0),
    RIGHT(0, 1),
    BOTTOM(-1, 0),
    LEFT(0, -1);

    Facing(int x, int y) {
        this.x = x;
        this.y = y;
    }

    static Facing fromLiteral(Literal literal) {
        return fromTerm(literal.getTerm(0));
    }

    static Facing fromTerm(Term term) {
        if (!term.isAtom()) {
            throw new IllegalArgumentException("Cannot parse as Facing: " + term);
        }
        return valueOf(((Atom) term).getFunctor().toUpperCase());
    }

    private final int x, y;

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }

    public Facing rotate(Direction direction) {
        return switch (direction) {
            case FORWARD -> this;
            case RIGHT -> values()[(this.ordinal() + 1) % 4];
            case BACKWARD -> values()[(this.ordinal() + 2) % 4];
            case LEFT -> values()[((this.ordinal() - 1) + values().length) % 4];
            default -> throw new IllegalArgumentException("Cannot rotate: " + direction);
        };
    }

    public Vector2D asVector() {
        return Vector2D.of(x, y);
    }
}
