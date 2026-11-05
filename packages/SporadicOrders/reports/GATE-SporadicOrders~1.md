# GATE-SporadicOrders~1: answers to the review of 6486269

One review (CBirkbeck, 2026-10-13), split into seven points. CFSGBasicProperties has since merged to
main (`TauCetiRoadmap/CFSGBasicProperties/README.md`); its *Starting points and ownership* and P1
already adopt the split the review proposes, citing SporadicOrders O0–O2 by those labels. The
repairs below make SporadicOrders state the same contract from its side, keeping the O0/O1/O2
labels that CFSGBasicProperties cites.

## H01 (CBirkbeck) — applied

The README had no ownership contract with CFSGBasicProperties. New section `## Scope and ownership`
(README lines 27–47): SporadicOrders owns the Hex dependency (O0), the ten ATLAS carriers with their
orders (O1), and the `τᵢ`, relator equations, generation equality and surjections (O2);
CFSGBasicProperties (*Starting points and ownership*, P0 items 2–3, P1) consumes O1/O2 for the ten
names and owns the presented-group upper bounds, the `MulEquiv` recognition, finiteness and
simplicity, the four further P1 models `Co2 Suz Fi22 He`, and the twelve P2 names, without
redefining the ten carriers. This matches CFSGBasicProperties README lines 69–73 and 332–336 on main.

## H02 (CBirkbeck) — applied

How external simplicity results reach these carriers: new bullet "Carriers are identified by data,
not by name" (README lines 42–47) says that a theorem about another realization (the
FiniteSimpleGroups models) reaches `SporadicOrders.<Name>` only through an explicit carrier
equivalence (forward and recovery words, action intertwiner), that equal degree, order or ATLAS
label identifies nothing, and that CFSGBasicProperties P1 (its third P1 bullet) owns these
comparisons; *Existing work* (lines 74–75) now points to that bullet.

## H03 (CBirkbeck) — applied

The Hex checker as shared supplier: the ownership bullet (README lines 38–41) states that
CFSGBasicProperties consumes the O0 checker for permutation order and membership certificates and
keeps its own presented-group checkers (coset tables, normal forms, Tietze, normal closure), which
the permutation checker does not replace; this agrees with CFSGBasicProperties lines 69–73 and P0.

## H04 (CBirkbeck) — applied

"Beyond this roadmap" ("motivation for later roadmaps, not work to attempt here", plus a list of
groups said to be "within reach") → `## Downstream consumers` (README lines 153–160), naming
CFSGBasicProperties P1 as the consumer that adds the upper bounds and P1/P2 as the owner of the
other sixteen sporadic groups' models and recognition. The earlier claim that `Fi23` and `O'N`
need matrix certificates is dropped: CFSGBasicProperties P2-N gives them permutation models on
31671 and 122760 points.

## H05 (CBirkbeck) — answered

The hypothesis `0 < Nat.card TauCeti.SporadicName.<Name>.Group` in the O2 lower bound (README line
150) is kept: without it the statement is false for an infinite presented group, where `Nat.card`
is 0 and `N ≤ 0` fails, and finiteness of the presented group is CFSGBasicProperties P1's, not
derivable from a surjection.

## H06 (CBirkbeck) — answered

O0's concrete dependency pin and its axiom test stay targets of O0 (README lines 79–83: the
`lakefile.toml` entry, the `lake-manifest.json` pin and the `#guard_msgs` check on the 7920
test). They live in the Tau Ceti test module, not in `Suggested.lean`, which cannot import the
Hex package at the pins.

## H07 (CBirkbeck) — answered

The branch touches only `TauCetiRoadmap/SporadicOrders/`; `git merge-tree` of the branch with
current `origin/main` (d2e0f0d) reports no conflict, so no repair is needed in the roadmap files.

## Further repair found by the gate: sorry'd model in Suggested.lean

The gate refused `def M24 : Subgroup (Equiv.Perm (Fin 24)) := sorry` (sorry'd data, and every
headline mentioned it). `M24` now has its real body: `Subgroup.closure` of the two ATLAS generators
of `M24G1-p24B0.m1`/`.m2`, shifted to 0-based points and written with Mathlib's `c[...]` notation
(`Mathlib/GroupTheory/Perm/Cycle/Concrete.lean:500`, a global `notation3`). The docstring no longer
says the model is `sorry`; README O1 (lines 98–100) says the statement file writes the model in
cycle notation on the same points. The three theorems are unchanged in statement.

Transcription check: the two ATLAS files (read from the ATLAS v3 `M24G1-p24B0` page,
`/Atlas/spor/M24/mtx/`) were compared point by point with the cycle products written in Lean; both
agree. Independent computation from those files: `a` is a fixed-point-free involution, `b` has
order 3 with six fixed points, `ab` (Mathlib product convention) has order 23, and a deterministic
Schreier–Sims gives order 244823040 with basic orbit lengths 24, 23, 22, 21, 20, 16, 3. These are
cross-checks, not certificates.

The other nine O1 names are not stated in `Suggested.lean`; the docstring says each has the same
three theorems with its own data and that nothing is missing at the pins to state them. Stating
them needs the ATLAS images on up to 276 points for each name; that widening was left out of this
review round and is open for the author to decide.

## Adversarial pass

| statement | instances tried | values computed | result | change |
|---|---|---|---|---|
| `M24` (definition) | ATLAS `.m1`/`.m2` vs Lean cycles; wrong models: preimage reading, one swapped image | Lean cycles = file images on all 24 points (both); `a·b⁻¹` order 23 = `ab` order 23; swapped image makes `b` odd, order-3 elements are even | definition fixed by data; reading direction is pinned by the `σ (i − 1) = image i − 1` rule, not by orders | real body replaces `sorry`; README Check says the preimage reading is not detected by the order values |
| `card_M24` | Schreier–Sims on the generators; factorization | 244823040 = 24·23·22·21·20·48 = 2¹⁰·3³·5·7·11·23 | true | docstring gives the factorization |
| `exists_surjective_M24` | degenerate target: trivial group | a surjection onto a group of order 244823040 forces the source nontrivial; no finiteness of the source follows | statement as intended (lower bound only) | none |
| `nontrivial_M24` | follows from the two above: `M24` has two elements (card > 1) and a surjection lifts them | 244823040 > 1 | true | none |
| O2 lower bound `0 < Nat.card G → N ≤ Nat.card G` | `G` infinite (`Nat.card = 0`) | without hypothesis: `N ≤ 0` false | hypothesis needed | kept (H05) |
| O0 test group | `c[0,…,10]` and `c[2,6,10,7]*c[3,9,4,5]` | 7920 per the review's independent computation; a checker returning the cyclic order of the first generator gives 11 | Check added | README Check |

`#check` of the elaborated signatures: the file has no `variable` block, so every declaration
carries only its own binders; the three theorems have no binders and `M24` has none. The build
below elaborates them; no scratch `#check` file was run, since this job may run only the build and
gate commands given.

## Ownership

CFSGBasicProperties (main) is the only roadmap that plans the same objects; checked with
`roadmaps grep 'SporadicOrders'` and by reading its *Starting points and ownership*, P0 and P1–P2.
No declaration of `Suggested.lean` reuses a qualified name of a readable roadmap.

## Dependency check

```
depcheck: 148 roadmaps, 999 edges, 0 problem(s)
```

## Build and gate

`lake build TauCetiRoadmap.SporadicOrders.Suggested` at commit e16fe9d: `Build completed successfully (8992 jobs).` Three warnings, `declaration uses 'sorry'`, at Suggested.lean lines 34, 38 and 42 (`card_M24`, `exists_surjective_M24`, `nontrivial_M24`). `M24` has a real body and no `sorry`. A first build attempt was stopped at its 20-minute time limit while it was still compiling dependencies; the rerun above completed.

Gate before the repairs: `sorry-data=1 … FAIL` (`def M24 … := sorry`). Gate after commit e16fe9d:

```
gate SporadicOrders: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

`roadmaps resolve` on the repaired README: no unresolved cross-roadmap citations and no unresolved Lean names. The two earlier leads (`Hex.PermGroup.Kernel.card_closure`, `lakefile.toml`) are names in the Hex package and a file name. Neither is in the pinned libraries, which is expected: O0 is the target that adds Hex.

No sources were fetched through the sources service and none are missing. The ATLAS generator files were read only to check the transcription; they are not copied into the repository.
