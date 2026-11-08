# GATE-ZigzagPreprojective~1: answers to the review of `efbc447`

The review points are F01–F11 of the single review comment, numbered H01–H11 here in that order.
Repairs are in commit `237fc0b` on top of `9eee583`. One general note on what the review saw: the
auxiliary file `AffineGraphClassificationTargets.lean` was already folded into `Suggested.lean`
at `9eee583`, after the reviewed head.

## H01 (CBirkbeck) — applied

All thirteen admitted data declarations (`zigzagAlgebra`, the three `…Equiv_*` maps,
`zigzagGrading`, `zigzagGradedAlgebra`, `zigzagBasis`, `zigzagTrace`, `zigzagTracePairing`,
`gradedProjectiveHom`, `bipartiteOrientation` and its quiver instance,
`signlessQuadraticDualEquivPreprojective`) are deleted from `TauCetiRoadmap/ZigzagPreprojective/Suggested.lean`. The file now states its headlines on the native
`TauCeti.zigzagAlgebra`, `TauCeti.zigzagAlgebraIntegerGrade`, `TauCeti.preprojectiveAlgebra`,
`TauCeti.preprojectiveGrade` and `TauCeti.AInfinityAlgebra`. The gate's `sorry-data` count goes from 13 to 0.

## H02 (CBirkbeck) — applied

The local `zigzagGradedAlgebra` that caused the reducibility warning is gone. The formality headline consumes the
native grading `TauCeti.zigzagAlgebraIntegerGrade` (built on `TauCeti.zigzagAlgebraGradedAlgebra`,
`Zigzag/Componentwise/Grading.lean:226`), with no `set_option`. The targeted build now shows only the three
`declaration uses sorry` warnings.

## H03 (CBirkbeck) — applied

Layer 7 now owns a separate target, `preprojective_cyclicQuotient_vanishes_iff`, stated in both the README and the Lean
file. For an orientation of a finite connected simple graph and a field `k`, `(Π/[Π,Π])_d = 0` for all
`d ≥ 3` holds iff the graph is finite simply-laced Dynkin and `ringChar k` is not bad. The route goes through base
change from `ℤ`, Schedler Theorem 13.1.1 (arXiv v3, p. 62; `Schedler` line 2992) and the
surjection onto an affine subgraph (LW Corollary 3.4, `LW` line 198).

The README now proves the transport between the supplier's `HH^{n,2-n}` index and the local `(2,q)` index: arity
`n = q + 2`, internal degree `2 − n`. It adds the D₄ check from the review, with determinant `±2` and
quotient dimensions `0, 0, 1` over `ℚ`, `𝔽₃` and `𝔽₂`, plus A₂ and E₆ controls. The cyclic quotient is not
claimed to be supplied by DGAInfinity. The Lean statement is for oriented simple graphs, which is this roadmap's input, while LW
state it for any finite connected quiver; the README says so in one clause.

## H04 (CBirkbeck) — applied differently

In the Lean file the duplicates are removed: no local doubled quiver, quotient, trace, centre, Cartan,
preprojective or signless carrier remains. The README's "Tau Ceti material to consume" now names
the native declarations, with files, that the headlines consume.

The README's Layer 1–5 target text is kept. These are this roadmap's own targets, already on main, and
Tau Ceti implemented them from this roadmap; STATUS records Layers 0–5 as done. Deleting them would re-plan
an existing roadmap rather than repair it. The reviewer's dimension values agree with the native formula
`2|V| + 2|E|`: A₂ gives `4 + 2 = 6`, D₄ gives `8 + 6 = 14`, and the centres give `|V| + 1` = 3 and 5.

## H05 (CBirkbeck) — applied

`affine_graph_recognition` was already in `Suggested.lean` at `9eee583`. Two headlines are added:
`isIntrinsicallyFormal_zigzagAlgebra_iff` (LW Theorem 1.1, `LW` line 19) and the cyclic-quotient theorem of H03.
They rest on three short definitions with real bodies:
- `IsBadPrime`;
- `IsZigzagAInfinityDeformation`: native grading, `IsMinimal`, `m₂` the product, `StrictUnit 1`;
- `IsIntrinsicallyFormal`: every such deformation `IsFormal`.

The docstring now names each unstatable headline and its missing carrier, one by one:
- the CY-completion identifications: DGAInfinity Layer 9's `Π_n(C)` is absent from Tau Ceti;
- the derived Koszul dualities and the Hochschild comparison: no bigraded `RHom` or Hochschild
  cohomology at the pins;
- the braid relations and the derived Artin action: no tensor product of complexes of
  `Z`-bimodules over `Z`;
- the Seidel–Thomas twists: no `k`-linear DG enhancement.

## H06 (CBirkbeck) — applied

`README.md` §"Downstream skew-group convention" now restricts the ordinary comparison to `−I ∈ Γ` with a simple
McKay graph, and the skew comparison to odd cyclic groups of order `≥ 3`. It leaves `Γ = 1` and `C₂` to
McKaySkewGroup §4.1–4.2, which at its supplied head makes the same split (its README lines 987–991 and
1040–1044).

Three Checks are added:
- `C₄`: both dimensions are 16.
- `C₂`: the multiplicity matrix is `[[0,2],[2,0]]`, and the dimensions differ, `8 ≠ 6`.
- `Γ = 1`: the multiplicity matrix is `[2]`, and the dimensions differ, `4 ≠ 2`.

## H07 (CBirkbeck) — applied

The Layer 8 bullet "In a Hom-finite triangulated category …" is replaced. It now asks for a specified `k`-linear
pretriangulated DG enhancement (DGAInfinity Layers 1 and 5) or ST's injective model (Definition 2.2,
`ST` line 510). It requires a bounded object with finite total `Hom` from and to every object (Definition 2.5
(K1)–(K2), `ST` line 554) and `n > 0` (Definition 2.9, `ST` line 609). It cites the braid relations at
Theorem 2.17 and faithfulness only for `n ≥ 2` at Theorem 2.18 (`ST` lines 768, 781).

The added Checks are:
- the `K₀` matrices `A = [[−1,1],[0,1]]` and `B = [[1,0],[1,−1]]`, with `ABA = BAB = [[0,−1],[−1,0]]`;
- an object with `Hom^i = k` for every even `i ≥ 0`, which has finite single Homs but infinite
  total dimension;
- the excluded `0`-spherical case.

## H08 (CBirkbeck) — applied

The two Cartan entry theorems, three edge counts, three dimension arithmetic theorems and
`finrank_rankOneZigzag` are deleted from the Lean file. The README examples section keeps those values
(14, 30, 34, the `A₁` dimension 2). "exposed through convenient named declarations" is removed from that
section's opening sentence.

## H09 (CBirkbeck) — applied differently

Locators are added in the README for:
- the affine classification: Etingof et al., Problem 5.3(c)–(g), pp. 79–80 (arXiv v5);
- Couture: Theorems 4.8 and 4.12, with Lemma 4.3 and Proposition 4.4 for at least three vertices;
- Etingof–Eu: Theorem 3.4.2;
- Liu–Wang: Definition 4.1, Theorem 4.2, Propositions 3.2 and 4.4, Corollary 3.4, Theorem 1.1;
- Seidel–Thomas: Definitions 2.2, 2.5, 2.9 and Theorems 2.17, 2.18;
- Schedler: Theorem 13.1.1, p. 62 (new reference).

All of these were read in their arXiv versions, and the versions are recorded in the References. A `sources.toml` was not created: this
job may edit only `README.md` and `Suggested.lean`. The six texts read are listed under "Sources"
below for the worker to record. Per-target locators for the merged Layers 1–6 text beyond those listed are
not added.

## H10 (CBirkbeck) — applied differently

Applied to the material this PR adds or changes:
- the affine-recognition target has a `*Needs:*` line and seven computed Checks. They include the review's
  witnesses: A₂ at (1,0), triangle (1,1,1), D₄ at (2,1,1,1), reflected values −1, 1, 1 and Cartan
  values 2, 0, 1.
- the new Layer 7 definitions (`IsBadPrime`, the deformation and intrinsic-formality predicates) have API
  bullets, three Checks each, and `*Needs:*` lines, and Layer 7 ends with a Dependencies paragraph;
- the Layer 8 twist target has `*Needs:*` and Checks;
- the two vague phrases are replaced: Couture's hypothesis is now "at least three vertices", and the
  Hilbert series is now `(1 − Ct + t²)⁻¹` (Etingof–Eu, Theorem 3.4.2).

Converting the whole merged README to the house layer shape (`## Layer k` headings, Checks for every
Layer 1–6 definition) is a reformatting of the roadmap on main. It is not done in this repair, and remains
open.

## H11 (CBirkbeck) — applied

There is no auxiliary file: it was folded in at `9eee583`. Every retained Lean declaration has a docstring and
appears by name in the README, with `## Layer 0` and `## Layer 7` section comments in README order. The module
docstring is headline-oriented. The closing "Review should include …" process paragraph of the README is deleted.

## Build

`lake build TauCetiRoadmap.ZigzagPreprojective.Suggested`: `Build completed successfully (9061 jobs)`.
The only warnings are `declaration uses sorry` at lines 60, 91 and 132 (the three headline theorems).

Gate: `gate ZigzagPreprojective: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Dependency check (`--depcheck … --movable`):

```text
depcheck: 235 roadmaps, 2063 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. No new supplier edge was added. DGAInfinity is on main.

## Elaborated signatures

`#check @name` for all six declarations was appended temporarily to `Suggested.lean`, elaborated with the
permitted build, and then removed; the file was restored byte for byte before the commit. Every elaborated type carries its binders
explicitly:
- `affine_graph_recognition`: `[Fintype V] [DecidableEq V] [DecidableRel G.Adj]`, `G.Connected`;
- `preprojective_cyclicQuotient_vanishes_iff`: `[Field k] [Fintype V]`, `G.Connected`,
  `o : TauCeti.DoubledQuiver.Orientation G`;
- `IsZigzagAInfinityDeformation`, `IsIntrinsicallyFormal`: `[Field k] [Finite V]`;
- `isIntrinsicallyFormal_zigzagAlgebra_iff`: `[Field k] [Fintype V]`, `G.IsTree`.

No section variables are used. Each type matches its README statement, and no binder was dropped.

## Ownership

`roadmaps grep` finds "intrinsically formal" only in this roadmap, on main and in this PR. It finds no match for
Schedler or for the cyclic quotient `[Π,Π]`, and none for affine graph recognition or positive
additive functions, on main or in any open roadmap PR. DGAInfinity Layer 8 owns the general formality
criterion and is cited, not restated. This roadmap is therefore the owner of the zigzag- and preprojective-specific
cyclic-quotient theorem and of the tree theorem. No Lean declaration here shares a fully qualified name with
another roadmap's declaration.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `affine_graph_recognition` | one vertex; one edge; triangle; `D̃₄` star; path `P_n` | one vertex: `0 = 2a` ⇒ `a = 0`, no graphical type; one edge: `a₁ = 2a₀`, `a₀ = 2a₁` ⇒ `0`, and `Ã₁` is not graphical; triangle: `1+1 = 2·1`, type `A 2`; star: centre `4 = 2·2`, leaves `2 = 2·1`; path: `a_j = j a₁`, end `(n−1)a₁ = 2n a₁` ⇒ `0` | holds both ways; `∃!` holds because the `AffineDynkinType` encodings are distinct (`Valid`: `A n`, n ≥ 1; `D n`, n ≥ 4) | Checks added |
| reflection / stuck / precarious | A₂ (1,0); triangle (1,1,1); D₄ (2,1,1,1) | `(s₀a)₀ = −1`, `Ca = (2,−1)`; reflected `1`, `Ca = 0`; centre reflected `1`, `Ca = (1,0,0,0)` | `(s_i a)_i = a_i − (Ca)_i` checked on all three | Checks added |
| proper-extension obstruction | star plus a pendant at a leaf | pairing with marks gives `−a_x ≥ 0`, so `a_x = 0`, then zero propagation | holds | Check added |
| Ẽ₈ arm equation | `(1,2,5)` vs `(1,2,4)` | `1/2+1/3+1/6 = 1`; `1/2+1/3+1/5 = 31/30` | affine vs finite separated | Check added |
| `preprojective_cyclicQuotient_vanishes_iff` | A₁ (one vertex); A₂; D₄ over ℚ, 𝔽₃, 𝔽₂; E₆ over 𝔽₃, 𝔽₅; triangle; D̃₄ | A₁: Π = k, both sides true; A₂: Π vanishes in degree ≥ 2, true and `A 2` good; D₄ degree 4: rank 3, 3, 2 ⇒ quotient dimension 0, 0, 1 vs `IsBadPrime (D 4)` false, false, true; E₆: `(Λ)₆ = ℤ/3` ⇒ nonzero over 𝔽₃, zero over 𝔽₅; triangle and D̃₄: free summand `i₀Πi₀` of infinite rank, RHS false; D̃₄ degree 4: 6 classes, 4 relations ⇒ dimension ≥ 2 | holds in each case | statement and Checks added |
| `IsBadPrime` | `ringChar` 0; `A n` at 2; `D 4` at 2 and 3; `E8` at 5 and 7 | false; false; true, false; true, false | matches Schedler 13.1.1(1)–(5) (D_n: `ℤ/2` at m = 4 ≤ 2(n−2) for every n ≥ 4) | new definition |
| `isIntrinsicallyFormal_zigzagAlgebra_iff` | A₁; D₄ over 𝔽₂ and ℚ; D̃₄; isolated-vertex convention | A₁: `m_n(x,…,x)` has degree `n+2 ∉ {0,2}` and the strict unit kills inputs `1`, so formal, RHS `A 1` true; D₄/𝔽₂: `HH^{2,2} ≅ (Π/[Π,Π])₄ ≠ 0`, LW non-formal, RHS false; D₄/ℚ: both true; D̃₄: both false. Without the strict unit, `m₄(1,1,1,x)` of degree 0 would be allowed | holds; strict unit needed, and equivalent to LW's unital notion over a field | statement added |
| Adams grading in the deformation | path degree `i` ↦ `(i,−i)` | `m_n` internal degree `2−n` ⇒ Adams `n−2` | automatic | stated in README |
| `HH^{2,q}` ↔ `HH^{n,2−n}` | q = 1, 2 | arity `q+2 = 3, 4`, internal degree `−1, −2` | consistent with LW `C^{p,q}` (`LW` line 74) | adapter added |
| McKay convention | C₂, Γ = 1, C₄, C₃ | 8 vs 6; 4 vs 2; 16 = 16; odd cycle with ratio −1 (`1 = (−1)³` fails for ordinary) | the old text was false for C₂ and Γ = 1 | repaired |
| ST braid relation in `K₀` | two 2-spherical objects | `ABA = BAB = [[0,−1],[−1,0]]` | holds | Check added |
| ST finiteness | `Hom^i = k` for even `i ≥ 0` | each Hom is 1-dimensional, total is infinite | (K2) fails | Check added |
| Couture hypothesis | graphs with 2 vs ≥ 3 vertices | Lemma 4.3 and Proposition 4.4 assume ≥ 3 (`Couture` lines 346, 374) | "cardinality" made explicit | repaired |

## Sources

All six were fetched through the sources service from arXiv (open repository). Each is cited by locator in the README. None is in `sources.toml`, which this job cannot edit, so the worker should record them:
- `LW` (2301.06757v3)
- `ST` (math/0001043v2)
- `Schedler` (0704.3278v3; LW cite v2, and the theorem number 13.1.1 is the same in the v3 text read)
- `EGHLSVY` (0901.0827v5)
- `Couture` (1509.08405v2)
- `EE` (math/0512287v1)

No text was unreadable, and no `needs-references.toml` was written.

Ownership against open pull requests was checked against the open-PR index (`roadmaps grep`) and
McKaySkewGroup's supplied head.
