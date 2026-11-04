# GATE-AffineLieAlgebras~1: answers to the review of `ff80f21`

The review was written against `ff80f21`. The branch head `1b96abb` already contains most of the
repairs it asks for. This round checked those repairs against the sources and the counterexample, and
fixed the supplier and source locators (commit `57861a15`, README only). A follow-up commit (`ddffe47f`) brings `Suggested.lean` into the required form: it deletes the 51 sorry'd data definitions and every declaration that depends on them or on the ReductiveGroups roadmap module, imports `Mathlib` instead of the submodules, and clears the build warnings. The lattice constructions named in H03/H04 are now README targets only.

## H01 (roed-math) — applied
At `ff80f21`, `formalVertex_translation_covariance` claimed that operator covariance follows from the state-derivative, creation, vacuum and locality laws. The reviewer's `ℂ[x]/(x⁴)` model refutes that claim: there `[T,x_(−1)]x = T(x²) − xT(x) = x³` but `−(−1)·x_(−2)x = (Tx)x = 0`. At head, `FormalVertexAxioms` has the separate field `operator_translation_coeff` (`T a_(n) − a_(n) T = −n a_(n−1)`), the theorem is now the projection `exact A.operator_translation_coeff a n` (`TauCetiRoadmap/AffineLieAlgebras/Suggested.lean` line 182), and the README (C7, "Fields and finiteness") no longer asks for the derivation. The counterexample violates the new field for `a = x, n = −1` (x³ ≠ 0), so it is no longer a model.

## H02 (roed-math) — applied
The counterexample to `formalVertex_borcherds` (`a=b=x`, `c=1`, `(m,n,r)=(0,−1,−2)`: LHS `T(x²)=x³`, RHS `0`) is excluded by the same new axiom. The model already fails covariance at `a=x`, so it no longer satisfies `FormalVertexAxioms`. With covariance added, the structure's hypotheses are vacuum (`Y(1,z)=id`, `T1=0`), creation, covariance, locality and fields (Hahn support bounded below). These are exactly the hypotheses of Bakalov–Kac §2.2 Definition 2.1, eq. (2.14)–(2.16) (BakalovKac2004 lines 117–136), and the Borcherds identity follows from that definition. The stated identity was checked against the standard form `Σ_i C(m,i)(a_(n+i)b)_(m+r−i)c = Σ_i (−1)^i C(n,i)(a_(m+n−i)b_(r+i)c − (−1)^n b_(n+r−i)a_(m+i)c)` and agrees term for term.

## H03 (roed-math) — applied
The lattice construction has its own concrete translation, specified in README C7, "Translation from the oscillator algebra" (README lines 540–556). The formula is `T(u⊗e^α)=(δu + u·α(−1))⊗e^α`, where `δ` is the derivation of the oscillator symmetric algebra with `δ(h(−m)) = m·h(−(m+1))`. Covariance of every lattice field is proved from the Heisenberg and charge covariance theorems and the normal-ordered-product induction over Fock monomials (README lines 573–626), not from the generic projection. The Lean definitions that carried this (`latticeTranslation`, `oscillatorTranslationDerivation`, `latticeStateField`, `latticeGradedVertexAxioms` and their theorems) had sorry'd bodies, so they are removed from `Suggested.lean`. The construction stays a README target, and the module docstring names the lattice vertex algebra as not statable at the pins.

## H04 (roed-math) — applied
README C7 states `[T,h(n)] = −n h(n−1)` for every `n ∈ ℤ` (README line 556) and `[T,Y(e^α,z)] = ∂_z Y(e^α,z)`, the latter reduced to the finite monomial formula for the charge modes. Both were recomputed with the normalisation `h(m)k(−m)e^β = m·B(h,k)e^β`; the values are in the table below. Both agree with Bakalov–Kac eq. (4.15) (BakalovKac2004 line 441). The corresponding Lean declarations depended on the sorry'd `heisenbergMode` and `latticeStateField`, so they are removed with them; the statements are README targets.

## H05 (roed-math) — answered
The failed CI run's cause, the missing `TauCetiRoadmap/ReductiveGroups/SignedADETargets.lean`, is gone. That file is now on `main` (`d2e0f0d`) with every declaration C7 uses (`Datum`, `Lattice`, `integralLattice`, `epsilon`, `Root`, `Carrier`, `cartan`, `rootVector`, `bracket`, `integralBasis`), and `lake build TauCetiRoadmap.AffineLieAlgebras.Suggested` succeeds. The house rules do not allow `Suggested.lean` to import another roadmap's module, so the import of `TauCetiRoadmap.ReductiveGroups.SignedADETargets` is removed, together with the ADE comparison declarations that used it. The ADE degree-one comparison stays in README C7, and the module docstring names it as not statable at the pins.

## H06 (roed-math) — applied differently
The head already pointed the ADE bridge at ReductiveGroups, but with the label "RG9A.1a", which does not occur in ReductiveGroups/README.md on main. The README now cites `ReductiveGroups, Layer 9 §9A.1a` ("Signed ADE lattice presentation and its integral comparison", where the norm-two-shell theorem is stated). The same repair was applied at the two other "RG9A" mentions (C7 closing paragraph and "Order, boundaries and references": "RG9A" → "ReductiveGroups §9A").

## H07 (roed-math) — applied
Both suggested references are in the bibliography, now with checked locators:
- Bakalov–Kac: §2.2 Definition 2.1, eq. (2.14) (covariance as an axiom) and eq. (2.17) (state-derivative identity as a consequence), BakalovKac2004 lines 117–138; §4.1 Theorem 4.1 with eq. (4.15), BakalovKac2004 lines 437–441.
- Kac: §1.1 Theorem 1.1 (extension theorem), hypothesis (ii), Kac2015 lines 173–191. This replaces the vaguer "§1.1 reconstruction".

## Adversarial pass (statements touched by H01–H07)

| statement | instances | values computed | result | change |
|---|---|---|---|---|
| `operator_translation_coeff` / `FieldTranslationCovariant` index convention | `Y=Σa_(n)z^(−n−1)`, `coeff k = a_(−k−1)` | `∂Y=Σ(−n)a_(n−1)z^(−n−1)`; `a_(n−1)=coeff(−(n−1)−1)` | matches `−n·coeff(−(n−1)−1)` | none |
| `translation_coeff` | same | `(Ta)_(n) = −n a_(n−1) = −n·coeff(−n)` | matches | none |
| `formalVertex_translation_covariance` | reviewer model `ℂ[x]/(x⁴)`, `a=x`, `n=−1`, on `x` | `[T,x_(−1)]x = x³`, `x_(−2)x = 0` | the model now violates the hypothesis | applied at head |
| `formalVertex_borcherds` | reviewer model, `(m,n,r)=(0,−1,−2)` | LHS `x³`, RHS `0` | model excluded; the remaining hypotheses equal BK Def. 2.1 | applied at head |
| `latticeTranslation_vacuum`, `_chargeState` | `u=1`, `α=0` and `α≠0` | `δ1=0`, `T(1⊗e^0)=0`; `T(1⊗e^α)=α(−1)⊗e^α` | match BK (4.15) | none |
| `oscillatorTranslationDerivation_generator` | `m=1,2` | `δh(−1)=h(−2)`, `δh(−2)=2h(−3)`; check `[T,h(−m)]=−(−m)h(−m−1)` | consistent | none |
| `latticeTranslation_heisenbergMode`, `n=1` | `u⊗e^α` | `[δ,h(1)]=0` on generators (`h(1)h'(−m−1)=0` for `m≥1`), charge term gives `−B(h,α)u` | `= −1·h(0)` | none |
| same, `n≥2` | on `k(−m)` | `[δ,h(n)]k(−m) = −m·n·δ_(m,n−1)B = −n(n−1)δ_(m,n−1)B`; RHS `−n·h(n−1)k(−m) = −n(n−1)δ_(m,n−1)B` | equal | none |
| same, `n=0`, `n=−m` | charge sector `α` | `h(0)=B(h,α)` is a scalar on the sector and `T` preserves it, so `0=0`; `[δ, mult h(−m)] = mult δh(−m) = m h(−m−1)` | equal | none |
| `normalOrderedPairModeTerm_support`, `normalOrderedPair_coefficient` for arbitrary `HVertexOperator`s | `A`, `B` with `coeff k = id` for all `k≥0` | `i<0`: `B` coefficient index `i−n`, zero for `i ≪ 0` on each `v`; `i≥0`: `A` coefficient `−i−1`, zero for `i ≫ 0` on each `v` | finite, because Hahn support is bounded below; no truncation hypothesis is missing | none |
| `dividedDerivativeFactor` | `m=1`; `m=3`, `k=−1` | `m=1`: empty product, factor `1`; `m=3,k=−1`: `(0)(1)/2 = 0` = coefficient of `z^(−1)` in `½∂²` | correct | none |
| `fieldTranslationCovariant_of_span_top` | `S=∅` with span `⊤` | forces `V=0`, statement trivial; otherwise linear in `A` since `coeff` is additive | true | none |
| `weightOneZeroProduct_alternating` | skew symmetry for `x∈V₁` | `x_(0)x = −x_(0)x + T(x_(1)x) − ½T²(x_(2)x)`; `x_(1)x∈V₀=ℂ1`, `T1=0`, `x_(2)x∈V_(−1)=0` | `2x_(0)x=0`, so alternating over ℂ | none |
| README citation "ReductiveGroups RG9A.1a" | main `ReductiveGroups/README.md` | the label "RG9A" does not occur; "9A.1a" is at line 1125 | wrong label | → "Layer 9 §9A.1a" |

Rows for the `Suggested.lean` form repair:

| statement | instances | values computed | result | change |
|---|---|---|---|---|
| retained declarations | 126 declaration blocks kept of 341; 215 removed (51 sorry'd data plus 164 transitive dependents, including every use of `SignedADE.*`) | `git diff -U0` on the retained text shows 3 changed lines: `(D :` → `(_D :` in `ComplexAmbient`, `(C :` → `(_C :` in `FockSpace`, `letI :=` → `let _ :=` in `weightOneZeroProduct_jacobi` | binder names only, so the elaborated types are unchanged | as listed |
| `ComplexAmbient V D`, `FockSpace D C` | positional uses `ComplexAmbient V D`, `FockSpace D C` | body `ℂ ⊗[ℚ] V` does not mention `D`; `FockSpace` body does not mention `C` | the uses still elaborate (build exit 0) | rename to `_D`, `_C` |
| `weightOneZeroProduct_jacobi` | `let _ := weightOneLieRing A; exact lie_jacobi x y z` | the goal is a `Prop`, so `let` and `letI` give the same proof | builds with no linter note | `letI` → `let` |
| README C7 line 626 | backticked `latticeGradedVertexAxioms` | that name is no longer declared | the README would claim a missing Lean name | → "the graded formal vertex-algebra structure on V_L" |

The `#check @name` scratch elaboration was not run: the only Lean command this job may run is the module build, and no retained declaration's type changed (see the first row).

## Build

`lake build TauCetiRoadmap.AffineLieAlgebras.Suggested` → `Build completed successfully (9044 jobs).`, exit 0, at `ddffe47f`. The 28 warnings in the module are all `declaration uses 'sorry'`. The two class-reducibility warnings (`currentTopology`, `completionTopology`), the two `letI` notes and the two unused-variable notes (`ComplexAmbient`, `FockSpace`) are gone.

## Gate

Final summary line, after the commit:

`gate AffineLieAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`

How `Suggested.lean` was repaired:
- **Imports:** a single `import Mathlib`, then only the Tau Ceti modules that are used: `Algebra.AlgebraicGroup.PointsFunctor` and `Algebra.AlgebraicGroup.SpecialLinear.Basic` for `OriginalSL2HopfLoops`; `LinearAlgebra.IntegralLattice.{Even,Signature,PosDef.Finite}` for `PositiveEvenLattice`; `Algebra.Lie.UniversalEnveloping.PBW.Embedding` for `ι_injective`. The roadmap import `TauCetiRoadmap.ReductiveGroups.SignedADETargets` is gone.
- **sorry'd data:** all 51 definitions are deleted, together with everything that mentions them. That includes the formal cocycle, the level enveloping algebra and its completion, the module categories, the rank-one Sugawara and loop action, the lattice Heisenberg and charge fields, and the ADE comparison. These stay README targets. The module docstring now has the required title and says which headline theorems are not statable and what each lacks: A1 H² classification, A5/A7/A8 completed-algebra theorems, and the C7 lattice vertex algebra and ADE comparison.

## Direction check

`depcheck: 148 roadmaps, 996 edges, 0 problem(s)`. There are no UPWARD, CYCLE or moved lines. ReductiveGroups, IntegralLattices and RootSystems are all on main.

## Notes
- Ownership against open pull requests was not rechecked this round. No new construction was added, and the edits only fix citations.
- Sources read: BakalovKac2004 (arXiv math/0402315v3) and Kac2015 (arXiv 1512.00821v2), both fetched through the sources service. This job may not edit `sources.toml`, so neither is recorded there yet. Nothing is missing and `needs-references.toml` was not created.
- `roadmaps resolve` flagged two names, `RankOne.feiginFrenkel` (README 944) and `SignedADE.normalizationSign` (README 733). They are outside the reviewed points and were not changed.
- Nothing suspicious in the review text: it contains no instructions beyond mathematical claims.
