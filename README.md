# Prolog

Practice-Prolog

## GNU Prolog

### GNU Prolog - Tut

#### Cp1

```bash
% gprolog --init-goal 'write(before), nl' --entry-goal 'write(inside), nl' --query-goal 'append([a,b],[c,d],X)'
```

```prolog
| ?- append([a,b],[c,d],X).

X = [a,b,c,d]

yes
```

