# Review of SchurWeyl (pull request #3027 at e47c8ec)
Folder: `TauCetiRoadmap/RepresentationTheory/SchurWeyl/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 51 changed lines since `b8f3652`. What was checked: the new §8.4 (the `(GL_n, GL_m)`-duality on polynomial functions on `n × m` matrices, with its joint highest weight lines), recomputed under both actions it states; its three Checks; its inputs from §8.1, Layer 6 and ClassicalGroups; the three roadmaps that cite it; and the edited guide, consumer, scope and contract sentences. Nothing blocks: the decomposition, both action conventions, the vectors `det_λ` and the Checks are correct. There are three small corrections (one about text this change does not touch) and two format notes (one about untouched text). One point is left for the human reviewers: the Howe–Umeda article could not be read this round, so its locators and the wording were not compared with it.

## C01 — §8.4 needs ClassicalGroups §2.3, but §2.3 is this roadmap's own §8.1 cited back, so the edge goes round through ClassicalGroups for nothing

A reader checking the build order finds §8.4 waiting on a section that itself waits on Layer 8 here. ClassicalGroups §2.3 ("The decomposition of `V^{⊗d}`") restates Schur–Weyl duality as "cited", and its own *Needs:* line (ClassicalGroups README, line 284) is "SchurWeyl Layer 8 double-centralizer theorem". The route of §8.4 never uses §2.3: it takes Schur–Weyl duality from §8.1 directly. Smallest change: in the *Needs:* line of §8.4 (line 926), read "ClassicalGroups §§2.2, 3.1 and 3.3". The Layer 8 Dependencies (line 942) and the ClassicalGroups contract can stay as they are, since §2.2 is in Layer 2.

## C02 — Two roadmaps on `main` now state the complex `n = m` case, and the sentence that says so leaves the ownership open

§8.4 notes that its `P(g⁻¹ X h)` form "for `n = m` … is also stated in AutomorphicLFunctionsAndLocalFactorsPartII §4.4" (lines 917–918). That section, on `main` and unchanged here, states the same decomposition `⊕ F_λ∨ ⊗ F_λ` with the same lower/upper Borel pair and the same minor product `Δ_λ`, over every characteristic-zero field, and cites only ClassicalGroups Layers 2–3 (its line 618). §8.4 is correct and neither statement contains the other (rectangular over `ℂ` here; square over characteristic-zero fields, with rationality of the projectors, there), so both stay. The overlap is settled by a citation the other way: AutomorphicLFunctionsAndLocalFactorsPartII §4.4 would cite SchurWeyl §8.4 for the decomposition over `ℂ` and keep its rational form as its own. That edit lies outside this folder, in this pull request or a later one.

## C03 — Untouched text: README, *From Tau Ceti*, Layer 0 (line 1485), names a declaration that exists in neither pinned library

`TauCeti.partitionEquivYoungDiagram` is declared neither in the pinned Tau Ceti nor in the pinned Mathlib. The equivalence between Young diagrams with `n` cells and partitions of `n` is Mathlib's `YoungDiagram.equivPartition` (`Mathlib/Combinatorics/Enumerative/Partition/YoungDiagram.lean`, line 65). Replace the name.

## N01 — The Checks of §8.4 count dimensions, which are the same under both actions it states; one Check pinning the convention would catch a swapped transpose or inverse

A possible Check: for `g = diag(2, 3)` in the first factor, `x₁₁ ↦ 2·x₁₁` under `P(ᵗg X)` and `x₁₁ ↦ ½·x₁₁` under `P(g⁻¹ X)`; for the upper unipotent `u` with entry `1`, `P(ᵗu X)` fixes `x₁₁`, while `P(u⁻¹ X)` sends it to `x₁₁ − x₂₁`. So `det_1 = x₁₁` is a highest weight vector for the upper triangular Borel subgroup only under the first action.

## N02 — Untouched text: `Suggested.lean`, lines 61, 91, 98 and 104

`spechtModule_tensor_sign_iso`, `inducedSpechtTranspose`, `kroneckerDoubleTranspose` and `kroneckerSingleTranspose` conclude `Nonempty (…)` of an isomorphism or an intertwining equivalence, but their names read as names of the isomorphisms themselves. The library convention would be a `nonempty_…` name, or the isomorphism given as data.

## Previous findings

- none: the previous review of this folder raised no finding. Its three small corrections and two format notes concern text that is unchanged at this head and are restated above (C01–C03, N01–N02).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| §8.4 decomposition | `(n,m,k) = (1,2,2), (2,2,2), (2,3,2), (2,2,3), (1,1,k)`, `k = 0` | `3 = 1·3`; `10 = 9 + 1`; `21 = 18 + 3`; `20 = 4·4 + 2·2 + 0`; `1 = 1·1`; `1 = 𝕊^∅ ⊗ 𝕊^∅` | holds |
| §8.4 action `P(ᵗg X h)` is a left action | `(g₁,h₁)` applied after `(g₂,h₂)` | `P(ᵗg₂ ᵗg₁ X h₁h₂) = P(ᵗ(g₁g₂) X h₁h₂)` | holds |
| §8.4 coordinates as `e_i ⊗ f_j` | `(g,h)·x_ij` | `Σ_(a,b) g_ai h_bj x_ab`, the coordinates of `g e_i ⊗ h f_j` | holds |
| §8.4 highest weight lines `det_λ` | upper triangular `b, c`; `λ = (2,1)`, `n = m = 2` | `det_i(ᵗb X c) = ∏_(a≤i) b_aa c_aa · det_i(X)`; `x₁₁(x₁₁x₂₂ − x₁₂x₂₁)` has degree `3`, weight `(2,1)` on each side; degree `Σ i(λ_i − λ_(i+1)) = k` | holds |
| §8.4 variant `P(g⁻¹ X h)` | `g = diag(2,3)`; unipotents with entry `1` | `x₁₁ ↦ ½x₁₁` (weight `−e₁`); lower unipotent fixes `x₁₁`, upper gives `x₁₁ − x₂₁` | holds; agrees with AutomorphicLFunctionsAndLocalFactorsPartII §4.4 at `n = m` |
| §8.4 route (invariants of `S^λ ⊗ S^μ`) | `k = 2` | `(S^(2) ⊗ S^(1,1))^(S₂) = sgn^(S₂) = 0`; `(S^(1,1) ⊗ S^(1,1))^(S₂)` has dimension `1` | holds |
| §8.4 boundary `n = 0` (excluded by `n, m ≥ 1`) | `Mat_(0×m)` | degree `0`: `ℂ` and `λ = ∅`; degree `k > 0`: `0` on both sides | true; the restriction loses nothing false |
| §8.4 Checks | as written | `3 = 1·3`; `10 = 3·3 + 1·1`; `21 = 3·6 + 1·3` | all true |
| Layer 6 input of §8.4 (row orthogonality, 6.1 Check) | `n = 3`, class sizes `1, 3, 2` | rows `(1,1,1)`, `(2,0,−1)`: `2 + 0 − 2 = 0`; `(2,0,−1)` with itself: `4 + 0 + 2 = 6 = 3!` | true |
| C01: §8.4 needs ClassicalGroups §2.3 | ClassicalGroups line 284 | §2.3 needs SchurWeyl Layer 8; the route of §8.4 uses §8.1, never §2.3 | redundant round trip |
| C03: `TauCeti.partitionEquivYoungDiagram` | search of both pins | absent; `YoungDiagram.equivPartition` at Mathlib `Partition/YoungDiagram.lean:65` | stale name |
| Headline: Schur–Weyl (§8.1), consumed by §8.4 | `d = n = 2`; `d = 1, n = 2` | `4 = 1·3 + 1·1`; `1 = 1·1 + 1·0` | holds |

- Source locators checked against the text: 0 (the one source of the changed text could not be read; see below).
- Library declarations opened at the pins: `TauCeti.simple_schurFunctor_iff` (`RepresentationTheory/ClassicalGroups/WeylModule/Irreducible.lean:178`); the Cauchy identity `TauCeti.sum_aeval_schurPoly_mul_aeval_schurPoly` (`RingTheory/MvPolynomial/Symmetric/Schur/Cauchy.lean:71`), an identity of polynomials and no duplicate of §8.4; `YoungDiagram.equivPartition` (Mathlib, line 65). Neither pin states the `(GL_n, GL_m)` decomposition of representations.
- Cross-roadmap citations resolved: ClassicalGroups §§2.2, 2.3, 3.1, 3.3 (at this head); AutomorphicLFunctionsAndLocalFactorsPartII §4.4 (on `main`); the consumers MetaplecticAutomorphicForms §3.7a, TensorInductionAndFiniteGroupInputs 7.1 and ThetaChainsOnDefiniteUnitaryGroups 3.4, which cite §8.4 for what it states.
- Merge-base comparison: no layer or heading removed or retitled; one section (§8.4) added; `Suggested.lean` unchanged, so no signature was re-compared. The folder and ClassicalGroups are unchanged since the head the previous review read.
- Dependency check: `depcheck: 129 roadmaps, 1453 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: 26 `declaration uses sorry` warnings, no error, no other warning.
- Automatic checks: the four `Nonempty` naming hits are real and in untouched text (N02); the unresolved Lean name is real and in untouched text (C03).
- Overlap check: read ClassicalGroups, TypeAHeckeAlgebras, TensorProductCombinatorics, NonintersectingPathsAndLGV, RandomWalksOnFiniteGroups; none owns the `(GL_n, GL_m)`-duality. The one shared object is the complex `n = m` case with AutomorphicLFunctionsAndLocalFactorsPartII §4.4: SchurWeyl §8.4 owns the rectangular complex statement, that roadmap its rational characteristic-zero form (C02).

Source independence: changed passages only; 0 passages compared with a source, because the text of HoweUmeda1991, the only source of the changed text (2 of 2 locators), could not be read this round. The route of §8.4 (Schur–Weyl duality for each factor plus character orthogonality) is built from this roadmap's own sections. Arrangement not compared: no layer was added, removed or reordered.

Research link: §8.4 is the `(GL_n, GL_m)`-duality of Howe–Umeda (1991), the type-A case of Howe duality, which MetaplecticAutomorphicForms §3.7a uses for compact dual pairs; Layer 9 rests on Brauer (1937), Rui (2005) and Doty–Hu (2009). This rests on the README's references and consumer list, not on a source read this round.

## Not verifiable

- Howe–Umeda, Math. Ann. 290 (1991): §1, (1.3′), (1.13)–(1.16), pp. 568–569, and §11.1, (11.1.1)–(11.1.3), p. 584. The EuDML record the README cites served only a maintenance page, the publisher's copy is behind a paywall, and the GDZ volume page gave no text. The mathematics of §8.4 was recomputed independently of the source.
- The pull-request description was read as far as the quoted copy runs (it is cut short). The parts read do not contradict the head for this folder; they do not name §8.4, which the description covers only in its count of sections added to existing roadmaps.
- The fifteen seeded sample targets (4.1 to 9.8) lie in text the change neither touches nor affects, so their locators were not re-read.

## Source issues

- none

## For the human reviewers

- Not tested: the wording of §8.4 and its two groups of locators were not compared with Howe–Umeda (1991), the only source of the changed text; no legal copy was readable this round (README line 1665 gives the EuDML record).
