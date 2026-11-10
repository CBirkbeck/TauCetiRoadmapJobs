# Review of Foams (pull request #1629 at 39f6798)

**Verdict:** accepted

This is an incremental re-review of the 55 lines changed in the folder since `6216594`: 49 in README.md and 6 in the module docstring of Suggested.lean. The change applies the previous report's single repair, and I found nothing new in the changed passages or in the text that depends on them. There are no findings.

## Previous findings

- R01 — repaired: all fourteen passages and the docstring now name the native object, e.g. line 930 "*Needs:* Statement: 0.8, 1.3 and the native Khovanov Frobenius algebra listed under From Tau Ceti."; the only K2 citations left are the formal-surface ones.

## Verified sound

**Scope of this pass.** The changed passages are:

- the K1–K2/K3 row of the supplier table (line 291);
- 0.8, the rank-two paragraph and *Needs* (604–606, 626–627);
- 1.4 (KH1), the specialization paragraph, the API bullet, the Bar-Natan sentence and *Needs* (904–907, 918, 927–931), and Layer 1 Dependencies (942);
- 2.13 (KH2), the comparison paragraph and *Needs* (1583–1588, 1610);
- 6.1, the KH3 sentence and *Needs* (2202, 2227–2228);
- the module docstring of Suggested.lean (25–28).

The pass also covered what these cite: the From Tau Ceti bullet at lines 242–249, Scope lines 41–47, and the sections the new table cell names (0.9, 2.4, 7.2, KH4).

**The repair, passage by passage.**

- Remaining citations of KhovanovHomology K1/K2 (lines 42, 291, 658, 1112, 2591, 2653, 2708, 2717, 2725, 2737, 2769, 2784): each is for the finite planar calculus or the formal surface category, which KhovanovHomology on main still plans. None is for the Frobenius algebra or circle tensors.
- The new table cell, "Planar web calculus in 0.9 and 2.4, disk diagrams in 7.2, and the formal-surface comparison KH4", agrees with the *Needs* lines of those sections: 0.9 (line 658) and 2.4 (line 1112) cite K1, 7.2 (lines 2591, 2653) cites K1 and G, and 7.4 (line 2769) cites K2's formal surface category and K3's closed evaluation.
- "listed under From Tau Ceti" (lines 606, 627, 930, 1610) resolves: the bullet at lines 242–249 lists the four Frobenius names for 0.8 and KH1 and the three circle-tensor names for KH2, with both link targets (lines 2871–2872).
- "Use the maps and coefficient comparisons of the native circle-tensor theory" (line 1588) is supported at the pin: merge and birth by `PiTensorProduct.fiberwiseMul` (CircleTensor.lean, docstring and line 185), split by `fiberwiseSplit` (Split.lean:112), the trace pairing by `circleDuality` (Split.lean:56), disjoint union by `disjointUnionCircleTensorEquiv` (DisjointUnion.lean:165), relabelling by `reindex_circleBasis` (CircleTensor.lean:173), and coefficient change by `circleBaseChange` (BaseChange.lean:41).
- KH3's "native unit, counit, multiplication and comultiplication" (line 2202): the algebra structure is Mathlib's on `DualNumber R`, and the counit and comultiplication are those of `TauCeti.Khovanov.coalgebra`.
- The docstring's new sentence matches the README: KH1 is stated through 0.8's even-supported graded interface and 0.10's shift and reversal comparisons (line 930), KH2 through the nilvalent state functor, KH3 through the compiler, KH4 through K2's formal surface category.

**Build, gate, scope.**

- Head `39f679882fa865aedc649e3d11d5f7349c7cf09e`; the worktree is clean.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/Foams'` is empty.
- `lake env lean` on Suggested.lean gives exactly three warnings, `declaration uses sorry`, at lines 36, 65 and 115 (each two lines lower than before, from the longer docstring).
- The worker's gate passed every check, including the build.
- My rerun of the gate: every counter is zero except `depcheck=1`, "NOT IN ORDER: Foams (insert it after its last supplier)". As in the previous three rounds, this comes from the board's order file and is not a finding.
- Dependency check against the candidate order:

```text
depcheck: 234 roadmaps, 2264 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

- `roadmaps resolve` on the README reports no unresolved citation and no unresolved Lean name. `overlaps.md` lists no other open pull request changing Foams and no dropped id.

**Signatures.** Only the module docstring of Suggested.lean changed. The 11 elaborated types in `signatures.md` agree with those checked by `#check @name` at `4b76614`, and none has lost a binder.

**Library declarations opened at the pin (Tau Ceti `2fd255d9`).** Eight names elaborate in one scratch `#check` file, with these types:

- `TauCeti.Khovanov.coalgebra` (Frobenius.lean:69): `Coalgebra R (DualNumber R)` for a commutative semiring R.
- `isFrobenius` (112): `Coalgebra.IsFrobenius R (DualNumber R)`.
- `mul_compr₂_counit` (120): the multiplication followed by the counit equals `TauCeti.dualNumberTracePairing R`.
- `baseChangeCoalgEquiv` (146): `S ⊗[R] R[ε] ≃ₗc[S] S[ε]`.
- `CircleTensor` (CircleTensor.lean:128), `circleBasis` (133, needs `[Finite ι]`, indexed by `ι → Bool`), `circleQuantumGrading` (229, needs `[CommRing R] [Fintype ι]`).
- `circleBasis_mem_circleQuantumGrading_piece` (243): the basis vector of a labelling lies in degree `labelingQuantumDegree`, which is +1 per circle labelled 1 and −1 per circle labelled X (EnhancedState.lean:99).

The README's hypotheses fit these: 1.4 takes R a commutative ring, and 2.13 takes a finite circle set. Split.lean, BaseChange.lean and DisjointUnion.lean were read at the pin but not elaborated.

**Cross-roadmap citations resolved.** KhovanovHomology on main, K1, K2 and K3: the sections the twelve remaining citations name exist, and the `[khovanov]` anchor is unchanged. TemperleyLieb Layer 2, KhovanovHomology G and GeometricTopology 2.2/3.3 are untouched by this diff and were resolved in the previous round.

**Seeded sample.** Two seeded targets lie in the changed passages:

- 1.4 (KH1): the changed sentences name the native carrier in place of K2; the mathematics is unchanged. The values agree with the pin (table below). The Bar-Natan locator (Definition 7.1 and Proposition 7.2, p. 1470) is unchanged and was checked against the text in an earlier round.
- 2.13 (KH2): the target of the comparison is now `CircleTensor` with `circleBasis`; the empty circle set, the grading and the listed compatibilities all have native counterparts (above).

6.1 is touched only in its KH3 sentence and *Needs*. The other seeded targets are untouched by the diff and were not re-read.

**Adversarial pass.** Rows marked "r6" are carried from the previous report (statements untouched by this diff), with that report's values.

| Statement (section) | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| KH1 circle grading against the native grading (1.4, changed) | one circle; labels 1, X | README: A{1} has 1 in degree +1, X in degree −1. Pin: `labelingQuantumDegree` = +1 for `false` (1), −1 for `true` (ε) | pass |
| KH1 Frobenius structure against `coalgebra` (1.4, changed) | 1, X | README: ε(1)=0, ε(X)=1, Δ(1)=1⊗X+X⊗1. Pin: `comul_one` = 1⊗ε+ε⊗1, `comul_eps` = ε⊗ε, counit = second component, so 0 and 1 | pass |
| KH1 map degrees (1.4 Checks) | m(1⊗1)=1; Δ(1) | degrees 2→1 and 1→0 under the native grading: both −1 | pass |
| Rank-two instance of 0.8 (changed) | R[ε], trace pairing in basis 1, X | Gram matrix [[0,1],[1,0]], determinant −1, a unit; `mul_compr₂_counit` identifies it with the native trace pairing | pass |
| KH2 on the empty circle set (2.13, changed) | I = ∅ | `ι → Bool` has one element, so `CircleTensor R ∅` has rank 1 in degree 0; the empty nilvalent state space is R in degree 0 | pass |
| KH2 rank and grading (2.13, changed) | two circles | 4 labellings, degrees 2, 0, 0, −2; decorated disk basis 1⊗1, 1⊗X, X⊗1, X⊗X with the same degrees | pass |
| KH2 coefficient change (2.13) | R → S | `circleBaseChange : S ⊗[R] CircleTensor R ι ≃ₗ[S] CircleTensor S ι` on the native side | pass |
| KH3 generators (6.1, changed) | merge on 1⊗X; split on X | native: X, and X⊗X; README 1.4 conventions: X, and X⊗X | pass |
| Supplier-table cell (line 291, changed) | 0.9, 2.4, 7.2, 7.4 *Needs* | K1; K1; K1 and G; K2 and K3 | pass |
| Dual Jacobi–Trudi via the pinned theorem (2.11), r6 | N=4, a=2; λ = (2), (1,1), (2,1) | c₁²−c₂; c₂; c₁c₂ | pass |
| `esymmInt` versus `elementaryCoefficient` (2.11), r6 | index −1, 0, 3 with a=2 | 0, 1, 0 on both sides | pass |
| Elementary Pieri rule, r6 | e₁·s_(1) in two variables | c₁² = (c₁²−c₂) + c₂ | pass |
| Schur basis contract, r6 | σ of size 2, degree 2 | rank 2 | pass |
| Spanning-tree criterion (2.4), r6 | theta two ways | 3+2+3 = 8 = 6+2; 1+2+3 = 6 ≠ 8 | pass |
| Interleaving bound, r6 | second theta, n=6 | 1+4+2 = 7 ≤ 7 | pass |
| Monoidal quotient contract, r6 | zero ideal; whole ideal | C; all morphisms zero | pass |
| Wu Proposition 3.13 locator (2.11), r6 | page markers | statement p. 13; proof p. 14 | pass |
| Unshaded operations (7.2), r6 | cup diagram | regions carry no data | pass |
| PD-code Euler criterion (2.4), r6 | X[1,1,2,2]; X[1,2,1,2] | 2 and 0 | pass |
| Ordinary planar equivalence (7.2), r6 | Dehn twist; rotation; pure braid; reflection | identified; distinct; identified; excluded | pass |
| BN 5.1 / 8.1, Jones 2.3.1 locators (7.2), r6 | folios | 1464; 1473–1474; p. 6 | pass |
| BN 7.1 / 7.2 (7.4), r6 | sphere, torus | 0, 2 | pass |
| `tc-graded-tensor` contract, r6 | p=1, q=−2 | degree −1; degree 0 | pass |
| Frobenius headline (0.8), r6 | `R[ε]`; ε = 2·id on ℤ; A = 0 | Δ(1)=1⊗X+X⊗1; Gram (2) not a unit; one coalgebra on 0 | pass |
| Euler parity and bound (2.4), r6 | theta two ways; bivalent circle | 2, 0, 2 | pass |
| No Koszul sign (0.10), r6 | degrees 1, 1 | +1 versus −1 in `DGShiftClosure` | pass |
| GT 2.2 / 3.3 contract (7.2), r6 | round circle; holed disk | two discs; relative statement stays a target | pass |
| GW locator (1.3), r6 | Props 10, 11 | p. 4 | pass |
| Evaluations (1.3), r6 | sphere, torus, genus 2, X-sphere, Klein | 0, 2, 0, 1, 2 | pass |
| Surface records (0.4), r6 | torus, Klein, Möbius | χ 0, 0, 0; crosscaps 0, 2, 1 | pass |
| Ordered labels (0.5), r6 | (12)(23), (23)(12) | (123), (132) | pass |
| Quantum integers (0.9), r6 | [2]² | [3]+[1] | pass |
| Graded coefficients (3.2), r6 | degrees 2, −3 | −1 | pass |
| Decorations (6.3), r6 | x, x² | x³; x⊗y | pass |
| Kernel (6.5), r6 | mΔ on 1, X | 2X, 0 | pass |
| Freeness headline (2.8), r6 | p = 0, diag(1,0), (x,e₁x); N = 0 | ∅; (1,0); (1,e₁); Λ₀ = ℤ | pass |
| Circle basis headline (2.11), r6 | (N,a) = (0,0)…(4,2) | rank 1, …, 6 = C(4,2) | pass |
| `elementaryCoefficient` (2.11), r6 | n=2, r=−1,0,2,3 | 0, 1, x₁, 0 | pass |
| `circleIdeal` (2.11), r6 | (2,1) | x² − e₁x + e₂ | pass |
| Top-Schur traces (1.2), r6 | a = 0..3 | 1, σ, −σ², −σ³ | pass |
| Square relation (2.7), r6 | N=4 | Q₀₁ = 2, P_R = 0, R₀ = 1 | pass |
| Reconstruction (2.10), r6 | id = Σuᵢvᵢ | x = Σuᵢ(vᵢx) | pass |
| Boundary weight (4.1), r6 | a=b=1, N=3 | 3 = 3 | pass |
| Adjunction degrees (6.2), r6 | (1,1), (1,2) | ±1, ±2 | pass |

**Headlines and padding.** The three theorems of Suggested.lean are unchanged, so the earlier one-tactic probes stand. The docstring still names every headline that is not statable and what it lacks. With the Frobenius algebra and circle tensors native, KH1–KH4 remain unstatable for the reasons the docstring now gives: each compares a native object with a carrier this roadmap constructs (the graded Frobenius interface, the nilvalent state functor, the compiler, the disk action).

## Not verifiable

- Blanchet–Habegger–Masbaum–Vogel, Proposition 1.1, p. 886 (2.1): paywalled and recorded as uncertified in an earlier round. It is untouched by this diff and was not fetched again.
- The seeded targets 0.1, 0.3, 0.7, 1.3, 2.1, 2.2, 2.5, 2.8, 3.1, 4.2, 7.1 and 7.3: untouched by this diff, and not re-read in this incremental pass.

## Source issues

- none
