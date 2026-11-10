# Review of Foams (pull request #1629 at 6216594)

**Verdict:** needs changes

This is an incremental re-review of the 111 lines changed in the folder since `60a0051`. All of them are in README.md; Suggested.lean and metadata.toml are byte-identical to `60a0051`. Both previous findings are repaired, and every library declaration the change newly cites exists at the pin with the stated hypotheses. One P3 remains: the change moves the rank-two Frobenius algebra and the circle tensors from KhovanovHomology K2 to Tau Ceti in two places and leaves the other places behind.

## R01 (P3) — The Frobenius algebra and circle tensors are native in Scope and the supplier table, but still KhovanovHomology K2's in fourteen passages and in the Lean docstring

**Location:** `TauCetiRoadmap/Foams/README.md:929`: "*Needs:* Statement: 0.8, 1.3 and KhovanovHomology K2. Proof: its explicit four maps and the shift formulas of 0.10." The same attribution is at lines 604–606, 626–627, 904, 905, 917, 926, 941, 1582, 1584, 1587, 1610, 2202 and 2227, and at `TauCetiRoadmap/Foams/Suggested.lean:25–26`.

**Claim:** KH1, KH2, KH3 and the rank-two instance of 0.8 take the chosen Frobenius object, the quantum object V, the circle tensors, their enhanced-state basis and their maps from KhovanovHomology K2. The docstring gives "KhovanovHomology K2's chosen graded Frobenius object" and "its circle tensors" as carriers that are missing at the pins.

**Witness:** This head's line 41 reads "Use the native chosen rank-two Frobenius algebra and circle tensors", and the K1–K2 table row (line 291) no longer lists them as consumed. Tau Ceti `2fd255d9` has them:

- `KnotTheory/Khovanov/Frobenius.lean`: `TauCeti.Khovanov.coalgebra` (69), `isFrobenius` (112), `mul_compr₂_counit` (120), `baseChangeCoalgEquiv` (146);
- `KnotTheory/Khovanov/CircleTensor.lean`: `CircleTensor` (128), `circleBasis` (133), `circleQuantumGrading` (229).

So the `*Needs:*` and Dependencies lines at 626, 929, 941, 1610 and 2227 make 0.8 and KH1–KH3 wait for a roadmap section whose only remaining contract is the formal surface category, which none of the three uses.

**Repair:** Replace the K2 attribution by the native one in each passage. Lines 42, 291, 2707, 2724, 2736, 2768 and 2783 cite K2 for the formal surface category and stay as they are.

| Line | Now | Write |
| --- | --- | --- |
| 604–606 | "consume KhovanovHomology K2's native DualNumber R carrier, chosen coalgebra, perfect trace pairing and base-change comparison." | "use the native DualNumber R carrier with `TauCeti.Khovanov.coalgebra`, its perfect trace pairing and base-change comparison, listed under From Tau Ceti." |
| 626–627 | "KhovanovHomology K2 for the chosen rank-two instance." | "the native Khovanov Frobenius algebra listed under From Tau Ceti for the chosen rank-two instance." |
| 904 | "using KhovanovHomology K2's chosen Frobenius structure." | "using the native chosen Frobenius structure `TauCeti.Khovanov.coalgebra`." |
| 905 | "with K2's quantum object V:" | "with the one-circle native circle tensor V under `TauCeti.Khovanov.circleQuantumGrading`:" |
| 917 | "for KhovanovHomology K2's chosen object." | "for the native chosen object." |
| 926 | "the conventions of the K2 contract." | "the conventions of the native Frobenius algebra." |
| 929 | "0.8, 1.3 and KhovanovHomology K2." | "0.8, 1.3 and the native Khovanov Frobenius algebra listed under From Tau Ceti." |
| 941 | "KH1 also consumes KhovanovHomology K2." | "KH1 also consumes the native Khovanov Frobenius algebra." |
| 1582 | "to KhovanovHomology K2's indexed tensor of copies of V." | "to the native circle tensor `TauCeti.Khovanov.CircleTensor`." |
| 1584 | "with K2's enhanced-state basis," | "with the native basis `TauCeti.Khovanov.circleBasis`," |
| 1587 | "owned by K2," | "of the native circle-tensor theory," |
| 1610 | "KhovanovHomology K2's indexed circle tensors." | "the native circle tensors listed under From Tau Ceti." |
| 2202 | "by K2's unit, counit," | "by the native unit, counit," |
| 2227 | "KH3 additionally consumes KhovanovHomology K2." | "KH3 additionally consumes the native Khovanov Frobenius algebra." |

In `Suggested.lean`, replace lines 25–26 of the module docstring by:

> KH1 needs the even-supported graded Frobenius interface of 0.8 and the shift and reversal comparisons of 0.10, KH2 the nilvalent state functor, KH3 the compiler, and KH4 KhovanovHomology K2's formal surface category and the disk action. The dual-number Frobenius algebra and the circle tensors themselves are native.

**Test of the repair.** I applied the README replacements to a scratch copy and checked the following:

- The only remaining "K2" lines are the seven formal-surface citations listed above.
- `roadmaps resolve` on the copy reports nothing unresolved.
- The dependency check on the copy returns `depcheck: 234 roadmaps, 2264 edges, 0 problem(s)`.
- The four names the replacements add elaborate with `#check` at the pin.
- The native grading matches KH1's Check: `TauCeti.Khovanov.quantumDegree` is `![1, -1]`, so 1 has degree +1 and X degree −1.

## Previous findings

- R01 — repaired: lines 273–285 cite `TauCeti.SpanningTreeContraction`, `TauCeti.nonempty_spanningTreeContraction` and the noninterleaving criterion under From Tau Ceti; 2.4 reads "Apply the native spanning-tree contraction and noninterleaving criterion to the pair (ρ, τ) on each nonempty component".
- R02 — repaired: the `[tc-pd-planar]` label now closes the From Tau Ceti bullet (line 285); 2.4 reads "…on finite dart sets. Construct the trivalent-web adapter here:".

## Verified sound

**Scope of this pass.** The changed passages are:

- Scope, lines 41–44;
- From Tau Ceti: the morphism-ideal bullet and the new bullets for monoidal envelopes, duals and pivotal structure, Schur polynomials, and spanning-tree contraction (199–221, 250–259, 273–285);
- the supplier table, which drops the PivotalSpherical and RepresentationTheory/SchurWeyl rows and narrows TemperleyLieb to Layer 2 (291–292);
- 2.4, reuse paragraph and *Needs* (1072–1076, 1108–1112);
- 2.11, the dual Jacobi–Trudi sentence, the Wu locator and *Needs* (1468–1471, 1529–1538);
- 5.1 *Needs* and Layer 5 Dependencies (2146–2147, 2158);
- 7.2, the unshaded-regions sentence (2578–2579);
- the link targets: 12 added, `[tl]` repointed to Layer 2, `[pivotal]` and `[schur]` removed.

The pass also covered what depends on them: 0.8, 0.9, 1.4, 2.13 and 6.1, which name KhovanovHomology K2 or TemperleyLieb, and the `Suggested.lean` docstring.

**Build, gate, scope.**

- Head `6216594334b7b854868338da72269bae367b4441`; the worktree is clean.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/Foams'` is empty.
- `lake env lean` on Suggested.lean gives exactly three warnings, `declaration uses sorry`, at lines 34, 63 and 113.
- The worker's gate passed every check, including the build.
- My rerun of the gate: every counter is zero except `depcheck=1`, "NOT IN ORDER: Foams (insert it after its last supplier)". The gate reads the board's order file, while the candidate order lists Foams at line 402. As in the two previous rounds, this is not a finding.
- Dependency check against the candidate order:

```text
depcheck: 234 roadmaps, 2264 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

**Signatures.** Suggested.lean is unchanged since `4b76614`, where all 11 declarations were checked with `#check @name`. `signatures.md` reports no lost binder, and its 11 types agree with the previous report's.

**Library declarations opened at the pin (Tau Ceti `2fd255d9`).** All 35 names below elaborate in one scratch `#check` file after `lake build` of their 15 modules. Each was also read against the README's sentence about it.

- `CategoryTheory/Monoidal/Envelope/Quotient.lean`: `TauCeti.MonoidalIdeal` (83), `MonoidalQuotient` (137), `toMonoidalQuotient` (142). The ideal needs a monoidal preadditive category; the quotient functor is strong monoidal (290); `MonoidalLinear S` descends (406). This is what the bullet says. The structure does not prove any particular ideal is a tensor ideal, so "Prove tensor stability of the foam ideals here" is correctly kept.
- `Envelope/Mat/Basic.lean`: `CategoryTheory.Mat_.instMonoidalCategory` (195), under `MonoidalPreadditive C`; `embeddingMonoidal` (312).
- `Envelope/Karoubi/Basic.lean`: `CategoryTheory.Idempotents.Karoubi.instMonoidalCategory` (121), for any monoidal category; `toKaroubiMonoidal` (176).
- `Monoidal/Rigid/Mate.lean`: `ExactPairing.rightMate` (127) and `leftMate` (325), both taking explicit pairings.
- `Monoidal/Rigid/DualFunctor.lean`: `rightDualFunctorMonoidal` (217) and `doubleRightDualFunctor` (325), both for `RightRigidCategory`.
- `Monoidal/Pivotal/Basic.lean`: `PivotalCategory` (76), on a `RigidCategory`; `pivotalExactPairing` (187). `Pivotal/Trace.lean`: `leftTrace` (88), `rightTrace` (93).
- `Schur/Pieri.lean`: `esymm_mul_diagramSchurPoly` (410) and `esymm_mul_schurPoly` (425), the vertical-strip rule with no row bound; the two `hsymm` rules.
- `Schur/Basis.lean`: `schurPolyBasis` (298) and `coe_schurPolyBasis` (309), over a commutative ring, indexed by partitions with at most `Fintype.card σ` parts.
- `Schur/DualJacobiTrudi.lean`: `diagramSchurPoly_eq_det_esymmInt` (162), with hypothesis `μ.rowLen 0 ≤ r`.
- `Combinatorics/RibbonGraph/Contraction.lean` (79, 215, 236), `Combinatorics/ChordDiagram.lean` (101, 274), `KnotTheory/PDCode/ChordDiagram.lean`: `isPlanar_iff_isNoncrossingMatching` (55), which needs a connected code, as the bullet says. `nonempty_spanningTreeContraction` needs `[Finite X] [Nonempty X]`, an involution and pretransitivity, matching "nonempty connected finite set of darts".
- `KnotTheory/Khovanov/Frobenius.lean` and `CircleTensor.lean`: the seven names in R01.

All 12 new link targets point to files that exist at the pin.

**Cross-roadmap citations resolved.**

- TemperleyLieb on main, Layer 2 (line 333, "the diagram category and its presentation"): its "Monoidal presentations (reusable infrastructure)" item states the presented monoidal category and its universal property, functors out being interpretations of the generators. This is the contract the narrowed row and 0.9's *Needs* cite. The anchor in the `[tl]` link matches the heading.
- KhovanovHomology on main, K2 (line 168): it plans the formal local cobordism category with S, T and 4Tu, which lines 42 and 291 keep citing. It also plans the chosen coalgebra and circle tensors that Tau Ceti now has (R01).
- No citation of PivotalSpherical or RepresentationTheory/SchurWeyl remains in the README. The natives above cover each contract the dropped rows listed: chosen-pair mates, the monoidal dual functor, pivotal structure and traces; Schur bases, dual Jacobi–Trudi and both Pieri rules.
- `citations.md` and `overlaps.md` list nothing unresolved, no dropped id and no other open pull request changing Foams.

**Seeded sample.** No seeded target lies in the changed lines. Three are touched indirectly:

- 2.5, 2.7, 2.9, 2.10 and 6.4, 6.6 are untouched by the diff and were not re-read.
- 5.1: only its *Needs* changed, to the native mate interfaces checked above.
- 7.2: the added sentence is consistent with Bar-Natan Definition 5.1 (`bn line 1022`), whose arc diagrams carry oriented arcs and no shading. 7.4's locators were checked in the previous round and are untouched.

**The changed locator.** Wu v2, Proposition 3.13 is stated on p. 13 (`wu-equivariant line 781`), and its proof runs from `wu-equivariant line 795` to line 817, all on p. 14 (page marker at line 793). The new "proof p. 14" is correct. The previous "p. 22" was the page of Lemma 4.15, which cites the proposition (line 1350).

**Adversarial pass.** Rows marked "r5" are carried from the previous report (statements untouched by this diff), with that report's values.

| Statement (section) | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| Dual Jacobi–Trudi via the pinned theorem (2.11, new sentence) | N=4, a=2; λ = (2), (1,1), (2,1); a=N | Column bound: `rowLen 0` = 2, 1, 2 ≤ N−a = 2. Determinants with `e₃ = 0` in two variables: [[e₁,e₂],[1,e₁]] = c₁²−c₂; [[e₂,0],[0,1]] = c₂; [[e₂,0],[1,e₁]] = c₁c₂. README Check: c₁²−c₂, c₂, c₁c₂. At a=N: r=0 forces the empty diagram, empty determinant 1 | pass |
| `esymmInt` versus `elementaryCoefficient` (2.11) | index −1, 0, 3 with a=2 | pin: 0, 1, 0 (`esymm` beyond the alphabet vanishes); README convention: 0, 1, 0 | pass |
| Elementary Pieri rule (From Tau Ceti) | e₁·s_(1) in two variables | c₁² = s_(2) + s_(1,1) = (c₁²−c₂) + c₂ | pass |
| Schur basis contract (From Tau Ceti) | σ of size 2, degree 2 | partitions with ≤ 2 parts: (2), (1,1); symmetric degree-2 polynomials have rank 2 | pass |
| Spanning-tree criterion on 2.4's Checks | theta with ρ=(abc)(ACB) and ρ=(abc)(ABC), τ=(aA)(bB)(cC) | pin's equality `orbitCount(αρ)+orbitCount ρ+orbitCount α = n+2`: 3+2+3 = 8 = 6+2, and 1+2+3 = 6 ≠ 8. README V−E+F: 2 and 0 | pass |
| Interleaving bound (From Tau Ceti) | second theta, one-vertex diagram, n=6, bands (1,4),(2,5) | `orbitCount(finRotate·σ)+orbitCount σ+2 ≤ n+1`: 1+4+2 = 7 ≤ 7 | pass |
| Monoidal quotient contract (From Tau Ceti) | zero ideal; whole ideal | quotient ≅ C; quotient has all morphisms zero, still monoidal | pass |
| Native Khovanov object versus KH1 (R01) | 1, X | pin: counit(1)=0, counit(ε)=1, degrees +1, −1; README 1.4: ε(1)=0, ε(X)=1, degrees 1, −1 | pass |
| Wu Proposition 3.13 locator (2.11) | page markers | statement line 781 (p. 13); proof lines 795–817 (p. 14) | pass |
| Unshaded operations (7.2, new sentence) | cup diagram | regions carry no data; strand keeps label and orientation, as in Bar-Natan 5.1 | pass |
| PD-code Euler criterion (2.4), r5 | X[1,1,2,2]; X[1,2,1,2] | Euler characteristic 2 and 0 | pass |
| Ordinary planar equivalence (7.2), r5 | Dehn twist; one-click rotation; pure braid; reflection | identified; distinct; identified; excluded | pass |
| BN 5.1 / 8.1, Jones 2.3.1 locators (7.2), r5 | folios | 1464; 1473–1474; p. 6 | pass |
| BN 7.1 / 7.2 (7.4), r5 | sphere, torus | 0, 2 | pass |
| `tc-graded-tensor` contract, r5 | p=1, q=−2 | degree −1; degree 0 | pass |
| Frobenius headline (0.8), r5 | `R[ε]`; ε = 2·id on ℤ; A = 0 | Δ(1)=1⊗X+X⊗1, Δ(X)=X⊗X; Gram (2) not a unit; zero module has one coalgebra | pass |
| KH1 counit/coproduct (1.4), r5 | 1, X | ε(1)=0, ε(X)=1 | pass |
| KH2 grading (1.4, 2.13), r5 | one circle; merge | +1, −1; degree −1 | pass |
| Euler parity and bound (2.4), r5 | theta two ways; bivalent circle | 2, 0, 2 | pass |
| No Koszul sign (0.10), r5 | degrees 1, 1 | +1 versus −1 in `DGShiftClosure` | pass |
| GT 2.2 / 3.3 contract (7.2), r5 | round circle; holed disk | two discs; relative statement stays a target | pass |
| GW locator (1.3), r5 | Props 10, 11 | p. 4 | pass |
| Evaluations (1.3), r5 | sphere, torus, genus 2, X-sphere, Klein | 0, 2, 0, 1, 2 | pass |
| Surface records (0.4), r5 | torus, Klein, Möbius | χ 0, 0, 0; crosscaps 0, 2, 1 | pass |
| Ordered labels (0.5), r5 | (12)(23), (23)(12) | (123), (132) | pass |
| Quantum integers (0.9), r5 | [2]² | [3]+[1] | pass |
| Graded coefficients (3.2), r5 | degrees 2, −3 | −1 | pass |
| Decorations (6.3), r5 | x, x² | x³; x⊗y | pass |
| Kernel (6.5), r5 | mΔ on 1, X | 2X, 0 | pass |
| Freeness headline (2.8), r5 | p = 0, diag(1,0), (x,e₁x); N = 0 | ∅; (1,0); (1,e₁); Λ₀ = ℤ | pass |
| Circle basis headline (2.11), r5 | (N,a) = (0,0)…(4,2) | rank 1, …, 6 = C(4,2) | pass |
| `elementaryCoefficient` (2.11), r5 | n=2, r=−1,0,2,3 | 0, 1, x₁, 0 | pass |
| `circleIdeal` (2.11), r5 | (2,1) | x² − e₁x + e₂ | pass |
| Top-Schur traces (1.2), r5 | a = 0..3 | 1, σ, −σ², −σ³ | pass |
| Square relation (2.7), r5 | N=4 | Q₀₁ = 2, P_R = 0, R₀ = 1 | pass |
| Reconstruction (2.10), r5 | id = Σuᵢvᵢ | x = Σuᵢ(vᵢx) | pass |
| Boundary weight (4.1), r5 | a=b=1, N=3 | 3 = 3 | pass |
| Adjunction degrees (6.2), r5 | (1,1), (1,2) | ±1, ±2 | pass |

**Headlines and padding.** Suggested.lean is unchanged, so the previous rounds' one-tactic probes stand. None of the natives newly cited proves a headline. `diagramSchurPoly_eq_det_esymmInt` identifies the representatives of `exists_circle_schur_basis` with Schur polynomials; the basis statement in the quotient `CircleAlgebra N a` is not in Tau Ceti. With the native Frobenius object, the rank-two case of 0.8 follows from the headline `existsUnique_frobeniusCoalgebra` together with `isFrobenius` and `mul_compr₂_counit`, so it is rightly not a separate statement.

**The previous remark is resolved.** The previous report remarked that 7.2 did not say how its operad differs from Subfactors 6.1's shaded one. Line 2578 now says the complementary regions are unshaded and that orientations and labels belong to the strands.

## Not verifiable

- Blanchet–Habegger–Masbaum–Vogel, Proposition 1.1, p. 886 (2.1): paywalled and recorded as uncertified in an earlier round. It is untouched by this diff and was not fetched again.
- The seeded targets 0.3, 0.4, 0.6, 2.2, 2.3, 2.5, 2.7, 2.9, 2.10, 3.2, 6.4 and 6.6: untouched by this diff, and not re-read in this incremental pass.

## Source issues

- none
