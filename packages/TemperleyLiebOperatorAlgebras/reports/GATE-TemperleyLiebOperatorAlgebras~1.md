# GATE-TemperleyLiebOperatorAlgebras~1: answers to human review

Reviewed head `cb75c58`; repairs committed as `665aef70` (not pushed). The roed-math review was
written against `ed1b1e8`. Its A7 repairs (H01–H03) are already in `cb75c58`, where kim-em's
reply (H05–H08) says they were made. Each one was re-verified below by exact computation and
against the sources. Sources read this round: Morin-Duchesne–Saint-Aubin arXiv:1203.4996v3
(`MDSA`) and Chen–Przytycki arXiv:0802.1083v2 (`ChenPrzytycki`).

## H01 (roed-math) — applied

The A7 final exponent is now `E_(n,r)=binom(n,(n−r)/2)` (`TauCetiRoadmap/TemperleyLiebOperatorAlgebras/README.md` lines 517–540, at `cb75c58`), not the ordinary cell dimension. The ballot differences `a_(n,s)` appear only in the restriction blocks and telescope to `E_(n,r)`. Checked: the telescoping identity holds for every n ≤ 11, and the formula `σ_(n,t) Π F_r^E_(n,r)` agrees with MDSA line 1275 (Proposition 4.3, eq. (29)) and with ChenPrzytycki line 46–53. The convention is `F_r = Z²+Z⁻²−(−1)^r T_r(X)` with `T_r(−v−v⁻¹)=(−1)^r(v^r+v⁻r)`, checked for r ≤ 8. That gives `α = Z+Z⁻¹` at t=0 and `Z = u^N`-type winding at t>0.

## H02 (roed-math) — applied

These tests are in the README at `cb75c58`, lines 557–576: the six-state n=4, t=0 Gram matrix, its determinant `(d²−a²)^4((d²−2)²−a²)`, the value 321489 at d=3, a=0, rank 2 (nullity 4) at d=a=3, and the leading term `51840 h^4`. All of them recompute exactly: the determinant identity holds on a 14×14 integer grid, which is enough because the degree is ≤ 12 in each variable. The pattern was also repaired: the t=0 test cannot see the winding normalisation for t>0. A new n=3, t=1 Check (README lines 578–587) pins it with determinant `X³−3X+Z²+Z⁻²`. In the per-step twist u of MDSA (lines 264–273) the same determinant is `X³−3X+u⁶+u⁻⁶`, so Z=u³; a model whose cycle product is Z would give `Z+Z⁻¹` instead.

## H03 (roed-math) — applied

The deformation bound (README lines 590–604) is now `Σ E_(n,r) ord_(x−δ) F_r(x,z)` over the DVR `ℂ[x]_(x−δ)`. It counts coincident factors and higher-order zeros explicitly. Smith normal form gives nullity ≤ the valuation of the determinant, and the determinant is nonzero because each `F_r(x,z)` has x-degree r ≥ 1. At d=a=3 the valuation is 4 and the nullity is 4, so the bound is sharp and the earlier `4 ≤ 3` contradiction is gone. The successor relation `z²=v^(εs)` matches exactly the vanishing set `z²=v^(±r)` of `F_r(δ,z)`, since `z²+z⁻²−v^r−v⁻r = z⁻²(z²−v^r)(z²−v⁻r)`.

## H04 (roed-math) — answered

From this roadmap's side the direction is legal. This roadmap consumes CategoricalOperatorAlgebras CA1a/CA2a, which comes earlier in the merge order, and depcheck reports no UPWARD or CYCLE line. However, at roadmap level the edge does run both ways. CategoricalOperatorAlgebras lists "TemperleyLiebOperatorAlgebras A3–A6" among its suppliers (its README lines 71–73) and uses it in CA8 (line 690). That back-edge is a defect in CategoricalOperatorAlgebras, outside this job's edit scope, and should be repaired there (its TL examples belong to a later roadmap, or to this one). The remaining review remarks (separate adjoint carriers, trace normalisation, positivity route) record no defect, so no change was made for them.

## H05 (kim-em) — answered

Confirmed. Exponents, telescoping, the leading-term sign `σ_(n,t)=(−1)^((t+1)ΣE)` and the explicit twist conversion are at README lines 517–553. For the sign, each factor has leading term `(−1)^(t+1)X^r`, the diagonal entries are `X^m`, and `Σ r E_(n,r) = m·binom(n,m)` holds for all n ≤ 11. So σ is forced. It gives −1 at (4,0), −1 at (2,0) and +1 at (3,1), all matching direct determinants.

## H06 (kim-em) — answered

Confirmed: the n=4, t=0 matrix and the d=a=3 tests are present and correct (values in H02). The standard-module realisations are valid. z=i with `v²+3v+1=0` gives a=0, δ=3. z=(3+√5)/2 with v=−z gives a=δ=3. Neither label has v²=−1, so neither is the excluded zero-head label. One test was added (n=3, t=1; see H02).

## H07 (kim-em) — answered

Confirmed. The bound sums the actual valuations with their multiplicities (README line 595). The forest maps, successor images, exceptional heads and composition-factor induction stay stated targets (lines 601–613) and are not presented as consequences of the determinant.

## H08 (kim-em) — applied differently

The supplier links were pinned to commit-specific GitHub blob URLs and pull-request numbers (README lines 15, 19, 79, 83, 87, 92, 383, 604; "PR58" at lines 119 and 363). Cross-roadmap citations must name the roadmap and section, so they are now relative roadmap links: `../TemperleyLieb/README.md`, `../CStarAlgebras/README.md`, and so on. That check also showed that "PR58's `PresentedTL ℂ δ n`" names nothing in TemperleyLieb as it stands. TemperleyLieb Layer 4 now supplies `presentedTLEquiv : TauCeti.TemperleyLieb R δ n ≃ₐ[R] TLAlg R δ n`, so A1 now consumes that comparison (README line 119) instead of constructing a second one.

## Other repairs in this round (gate)

- `Suggested.lean` imports: seven `Mathlib.*` sub-imports were replaced by `import Mathlib` plus `import TauCeti.Algebra.TemperleyLieb.MarkovTrace`.
- `sorry`'d data:
  - `adjoint` is now a real construction. `freeConj` conjugates coefficients through `FreeAlgebra.equivMonoidAlgebraFreeMonoid` and `MonoidAlgebra.mapRingHom`. `adjointLift` composes it with `starRingEquiv` into `(AnalyticTL δ n)ᵐᵒᵖ`. `adjointLift_rel` proves the three native relations are preserved; δ real is used in the `mul_self` case through `Complex.conj_ofReal`, and the `distant` case uses the swapped relation. `adjoint` is then `RingQuot.lift`.
  - `adjoint_add` and `adjoint_mul` are now proved.
  - `quotientAdjoint` is `Quotient.map'` of `star`, using `TwoSidedIdeal.rel_iff` and `traceRadical_adjoint`.
  - `exists_loop_parameter`, which `closureTrace` chooses from, is now proved: q = (−δ+s)/2 with s² = δ²−4.
- README A1 (lines 124–131) names `freeConj`, `adjointLift` and `adjoint`.

### Elaborated signatures

I appended `#check @name` for all 27 declarations to the file, built it once, then removed the lines. Each new declaration has the intended source and target. The flagged "dropped binders" on `ConjugateDagger` are a false positive: `[Category C] [Preadditive C] [Linear ℂ C]` all appear in its elaborated type.

### Ownership

`freeConj` and `adjointLift` live in the roadmap namespace, and no roadmap on main or in an open head declares a conjugate-linear adjoint on the native TL presentation. The `roadmaps grep` hits for `adjointLift_*` are unrelated GL₂ lemmas in GL2AutomorphicRepresentationsAndTransfer.

### Not changed (pre-existing, outside these comments)

Several parts of the roadmap do not yet follow house form:
- the README headings and shape;
- most `Suggested.lean` names are absent from the README;
- the namespace is not `TauCetiRoadmap.TemperleyLiebOperatorAlgebras`;
- the module docstring form;
- declarations that restate structure fields (`adjoint_involutive` and similar).

Graham–Lehrer (1998) has no legal full text: the e-periodica landing page has no PDF link. None of this round's verdicts depends on it.

## Adversarial pass

| statement | instances | computed values | result | change |
|---|---|---|---|---|
| A7 det formula, t=0 | n=4 | formula `−(a²−X²)^4(a²−(X²−2)²)` vs 6×6 det: equal on 9×4 grid (Z=2,3,−5/2,7/3) | true | none |
| A7 det formula, t=0 | n=2 | σ=−1, F_2=a²−d² → d²−a² | true | none |
| A7 det formula, t>0 | n=3, t=1 | hand Gram: diag X, cycle product w², det `X³−3X+w²+w⁻²`; formula σ=+1, F_3=Z²+Z⁻²+T_3 → equal on 9×3 grid | true | Check added |
| A7 det formula, t=n | n=0,1 | empty product 1, σ=1 | true | none |
| A7 vs MDSA (17) | d>0 | α²−4C²_(k+d/2) = v^(2N)+v^(−2N)−q^r−q^(−r) with r=d+2k, exponent binom(N,(N−r)/2) | agrees, Z=v^N | none |
| Chebyshev sign | v=5/3, r=0..8 | `T_r(−v−v⁻¹)=(−1)^r(v^r+v⁻r)` all equal | true | none |
| telescoping `Σ a_(n,s)=E_(n,r)` | n ≤ 11, all r | 0 failures | true | none |
| degree sum `Σ rE=m·binom(n,m)` | n ≤ 11, all t | 0 failures; (4,0): 12=12, (5,1): 20=20 | true | none |
| n=4 values | d=3,a=0; d=a=3; a=3,d=3+h | 321489; rank 2; det/h⁴ → 51841.4 at h=10⁻⁵, exact 1296·40=51840 | true | none |
| DVR bound | d=a=3 | valuation 4, nullity 4 | sharp | none |
| `adjoint` | n=0,1 (no generators) | reduces to complex conjugation on ℂ | correct | real def |
| `adjoint` wrong model | ℂ-linear reflection | excluded by `adjoint_algebraMap`: star(i·1)=−i·1 | excluded | none |
| `adjointLift_rel` | complex non-real δ | `mul_self` case needs conj δ = δ; fails for δ∉ℝ | hypothesis δ:ℝ is the carrier | none |
| `exists_loop_parameter` | δ=2 (s=0, q=−1), δ=0 (s=2i, q=i) | −(−1−1)=2; −(i−i)=0 | true | proved |
| `quotientAdjoint` | radical 0 (δ ≥ 2) | reduces to `star` on the algebra | correct | real def |

## Build

`lake build TauCetiRoadmap.TemperleyLiebOperatorAlgebras.Suggested`: Build completed successfully (8981 jobs). The only warnings are `declaration uses sorry` on the stated target theorems.

## Gate

```
gate TemperleyLiebOperatorAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL
  depcheck: NOT IN ORDER: TemperleyLiebOperatorAlgebras (insert it after its last supplier)
```

Before this round the gate also failed on blob=5, prnum=2, sorry-data=2, imports=1, mathlib-subimports=6 and no-import-mathlib=1. The only remaining item is "not in the merge order", which is not a defect at the design stage.

Depcheck (`--movable`):

```
NOT IN ORDER: TemperleyLiebOperatorAlgebras (insert it after its last supplier)
depcheck: 148 roadmaps, 999 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line.
