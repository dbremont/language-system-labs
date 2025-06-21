# minischeme

> A learning-oriented Scheme system, directly copied from catseye/minischeme.

QA

- Q: What mechanisms does Minischeme use to parse new statements?
- A: (Answer pending or to be researched.)

## Data Model

```c
/* cell structure */
struct cell {
	unsigned short _flag;
	union {
		struct {
			char   *_svalue;
			short   _keynum;
		} _string;
		struct {
			long    _ivalue;
		} _number;
		struct {
			struct cell *_car;
			struct cell *_cdr;
		} _cons;
	} _object;
};
```

```c
typedef struct cell *pointer;
```

### Basic Values

- `_NIL`
- `global_env`
- ...

## Computations

- `alloc_cellseg`
- `alloc_strseg`
- `init_scheme`
- `token()`
- `opexe_0`
- `Eval_Cycle`

## TODO

- Note: This is just the begining my undestand of the code is very low.

## References

- [minischeme](https://github.com/catseye/minischeme)
