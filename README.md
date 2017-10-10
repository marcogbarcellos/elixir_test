# Basics of Elixir

Project to simply show the basic features of the Elixir Language. This Readme will also be used to anotate what I think it might be peculiar and interesting to note.

## Notes

## Why using recursion in elixir/erlang is not as bad as it is in most OO languages(in some cases)

A tail call function is a function which call another functions as its last thing:

```

def first_func(...) do
  ...
  another_func(...)
end

```

In most Object Oriented languages, whenever you start calling functions recursively, they are all pushed to the stack. In Elixir and Erlang, we have what's called `tail-call optimization`. This optimization works in a way that's similar to a `goto` or a `jump` and you don't need allocate more memory when pushing more functions to the stack.

But how ?!?!

In the snippet above, the final result of the `first_func` is the result of `another_func`. This is why the compiler can safely perform the operation by jumping to the beginning of another_fun without doing additional memory allocation. When another_func finishes, you return to whatever place original_func was called from.

Take the following function :

```

def endless_loop(...) do
  ...
  endless_loop(...)
end

```

This `endless loop` takes advantage of the `tail-optimization` as it can run without consume any additional memory .

This solution fits well for arbitrarily large iterations. There is a downside, though. Whereas classical (non-tail) recursion has a more declarative feel to it, tail recursion usually looks more procedural.