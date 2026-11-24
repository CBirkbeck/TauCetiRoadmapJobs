# Review of SchurWeyl (pull request #3027 at 644c332)
Folder: `TauCetiRoadmap/RepresentationTheory/SchurWeyl/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 51 changed lines since `74a09b7`. What was checked: the new §8.4 (the `(GL_n, GL_m)`-duality on polynomials in `n × m` matrices, with its joint highest weight lines), recomputed under both actions it states; its three Checks; its Howe–Umeda locators, read in the scan of the article; its ClassicalGroups and Layer 6 inputs; the roadmaps that now cite it; and the edited guide, consumer, scope and contract sentences. Nothing blocks: the decomposition, both action conventions, the highest weight vectors `det_λ`, the Checks and the locators are all correct. There are three small corrections (one about text this change does not touch) and two format notes (one about untouched text). Nothing is left for a human to decide.

## C01 — §8.4 needs ClassicalGroups §2.3, but §2.3 is this roadmap's own §8.1 cited back, so the edge goes round through ClassicalGroups for nothing

A reader checking the build order finds §8.4 waiting on a section that itself waits on Layer 8 here. The dependency check does not report a cycle only because §2.3 asks for the double-centralizer theorem specifically. ClassicalGroups §2.3 ("The decomposition of `V^{⊗d}`") restates Schur–Weyl duality as "cited", and its own *Needs:* line (ClassicalGroups README line 284) is "SchurWeyl Layer 8 double-centralizer theorem". The route of §8.4 never uses §2.3: it takes Schur–Weyl duality from §8.1 directly. Smallest change: in the *Needs:* line of §8.4 (line 926), read "ClassicalGroups §§2.2, 3.1 and 3.3". The Layer 8 Dependencies (line 942) and the ClassicalGroups contract (line 1604) can stay as they are, since §2.2 is in Layer 2.

## C02 — Two roadmaps on `main` now state the complex `n = m` case, and the sentence that says so leaves the ownership open

§8.4 notes that its `P(g⁻¹ X h)` form "for `n = m` … is also stated in AutomorphicLFunctionsAndLocalFactorsPartII §4.4" (line 918). That section, on `main` and unchanged here, states the same decomposition `⊕ F_λ∨ ⊗ F_λ`, with the same lower/upper Borel pair and the same minor product `Δ_λ`, over every characteristic-zero field. It cites only ClassicalGroups Layers 2–3 (its line 618). §8.4 is correct, and the general theorem belongs in this roadmap. The overlap is settled by a citation the other way: AutomorphicLFunctionsAndLocalFactorsPartII §4.4 would cite SchurWeyl §8.4 for the decomposition over `ℂ` and keep its rationality over characteristic-zero fields as its own. That edit lies outside this folder, either in this pull request or in a later one.

## C03 — Untouched text: README, *From Tau Ceti*, Layer 0 (line 1485), names a declaration that exists in neither pinned library

`TauCeti.partitionEquivYoungDiagram` is declared neither in the pinned Tau Ceti nor in Mathlib. The equivalence between Young diagrams with `n` cells and partitions of `n` is Mathlib's `YoungDiagram.equivPartition` (`Mathlib/Combinatorics/Enumerative/Partition/YoungDiagram.lean`, line 65). Replace the name.

## N01 — The Checks of §8.4 count dimensions, which are the same under both actions it states; one Check pinning the convention would catch a swapped transpose or inverse

A possible Check: for `g = diag(2, 3)` in the first factor, `x₁₁ ↦ 2·x₁₁` under `P(ᵗg X)` and `x₁₁ ↦ ½·x₁₁` under `P(g⁻¹ X)`. For the upper unipotent `u` with entry `1`, `ᵗu` fixes `x₁₁`, while `u⁻¹` sends it to `x₁₁ − x₂₁`. So `det_1 = x₁₁` is a highest weight vector for the upper triangular Borel subgroup only under the first action.

## N02 — Untouched text: `Suggested.lean`, lines 61, 91, 98 and 104

`spechtModule_tensor_sign_iso`, `inducedSpechtTranspose`, `kroneckerDoubleTranspose` and `kroneckerSingleTranspose` conclude `Nonempty (…)` of an isomorphism or a linear equivalence, but their names read as names of the isomorphisms themselves. The library convention would be a `nonempty_…` name, or the isomorphism given as data.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| §8.4 decomposition | `(n,m,k) = (1,2,2), (2,2,2), (2,3,2), (2,2,3), (2,3,3), (1,1,k)`, `k = 0` | `3 = 1·3`; `10 = 9 + 1`; `21 = 18 + 3`; `20 = 16 + 4 + 0`; `56 = 40 + 16 + 0`; `1 = 1·1`; `1 = 𝕊^∅ ⊗ 𝕊^∅` | holds |
| §8.4 action `P(ᵗg X h)` is a left action | composite of `(g₁,h₁)` and `(g₂,h₂)` | `P(ᵗg₂ ᵗg₁ X h₁h₂) = P(ᵗ(g₁g₂) X h₁h₂)` | holds |
| §8.4 coordinates as `e_i ⊗ f_j` | `(g,h)·x_ij` | `Σ_(a,b) g_ai h_bj x_ab`, which is `g e_i ⊗ h f_j` | holds |
| §8.4 highest weight lines `det_λ` | upper triangular `b, c`; `λ = (2,1)`, `n = m = 2` | `det_i(ᵗb X c) = ∏_(a≤i) b_aa c_aa · det_i(X)`; `x₁₁(x₁₁x₂₂ − x₁₂x₂₁)`: degree 3, weight `(2,1)` on both sides | holds |
| §8.4 `P(g⁻¹ X h)` variant | `g = diag(2,3)`; upper and lower unipotents | `x₁₁ ↦ ½x₁₁` (weight `−e₁`, contragredient); lower fixes `x₁₁`, upper gives `x₁₁ − x₂₁` | holds; equals AutomorphicLFunctionsAndLocalFactorsPartII §4.4 at `n = m` |
| §8.4 route (character orthogonality) | `k = 2` | `(S^(2) ⊗ S^(1,1))^(S₂) = sgn^(S₂) = 0`; `(S^(1,1) ⊗ S^(1,1))^(S₂) = 1` | holds |
| §8.4 degenerate `n = 0` (excluded by `n, m ≥ 1`) | `Mat_(0×m)` | degree 0 gives `ℂ`, `λ = ∅`; degree `k > 0` gives `0` on both sides | true; the restriction is harmless |
| §8.4 Checks | as written | `3 = 1·3`, `10 = 3·3 + 1·1`, `21 = 3·6 + 1·3` | all true |
| Layer 6 input (6.1 Checks) | `n = 3, 4` | `(2,0,−1)`; `X(2,1,1) = (3,−1,−1,0,1)` = `(3,1,−1,0,−1)` × signs `(1,−1,1,1,−1)` | true |
| Howe–Umeda locators | (1.3′), (1.13)–(1.16), §11.1 | `P(ᵗg T)` at HoweUmeda1991 line 191, p. 568; decomposition at line 197, p. 568; minors and `y_D` at lines 212–217, p. 569; §11.1 at lines 858–875, p. 584 | match; pages 565–619 confirmed |
| C01: §8.4 needs ClassicalGroups §2.3 | ClassicalGroups line 284 | §2.3 needs SchurWeyl Layer 8; the §8.4 route uses §8.1, never §2.3 | redundant round trip |
| C03: `TauCeti.partitionEquivYoungDiagram` | grep of both pins | absent; `YoungDiagram.equivPartition` at Mathlib Partition/YoungDiagram.lean:65 | stale name |
| Headline: Schur–Weyl (§8.1) | `d = n = 2` | `4 = 1·3 + 1·1` | holds |
| Headline: Littlewood–Richardson | `c^(321)_(21,21)` | coefficient of `s_321` in `s_21²` is `2` | holds |
| Headline: Murnaghan–Nakayama | `κ = (2,1)`, `r = 3` | single rim hook, `h = 1`: `−1` = character of the standard rep of `S₃` at a 3-cycle | holds |
| Headline: Hall isometry | `⟨p_(1,1), p_(1,1)⟩` | `z_(1,1) = 2` | holds |
| Headline: `O_n` FFT and harmonic decomposition | `(ℂ³)^(⊗2)` | commutant dim `3 = dim B₂(3)`; harmonic `5 + 3 = 9 − 1` | holds |

- Source locators checked against the text: 5 groups of formulas in HoweUmeda1991 (open GDZ scan, OCR), plus the printed page range.
- Library declarations opened at the pins: `TauCeti.simple_schurFunctor_iff` (ClassicalGroups/WeylModule/Irreducible.lean:178, which gives irreducibility of `𝕊^λ(ℂⁿ)` exactly when `ℓ(λ) ≤ n`); `TauCeti.schurFunctor` (WeylModule/Basic.lean:545); the Cauchy identity `TauCeti.sum_aeval_schurPoly_mul_aeval_schurPoly` (Schur/Cauchy.lean:71), a character identity only and no duplicate of §8.4; `YoungDiagram.equivPartition` (Mathlib, line 65). Neither pin has the `(GL_n, GL_m)` decomposition of representations.
- Cross-roadmap citations resolved: ClassicalGroups §§2.2, 2.3, 3.1, 3.3 (unchanged from `main`); AutomorphicLFunctionsAndLocalFactorsPartII §4.4 (on `main`); and the consumers MetaplecticAutomorphicForms §3.7a, TensorInductionAndFiniteGroupInputs §7.1 and ThetaChainsOnDefiniteUnitaryGroups 3.4, which cite §8.4 for what it states.
- Merge-base comparison: no layer or heading removed or retitled; one section (§8.4) added; `Suggested.lean` unchanged.
- Dependency check: `depcheck: 131 roadmaps, 1467 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: only `declaration uses sorry` warnings (26), no errors. The `#check @name` file for all 41 declarations elaborated with no errors; `Suggested.lean` is unchanged, so no signature was re-compared.
- Automatic checks: the four `Nonempty` naming hits are real and in untouched text (N02); the unresolved Lean name is real and in untouched text (C03).
- Overlap check: read ClassicalGroups, TypeAHeckeAlgebras, TensorProductCombinatorics, NonintersectingPathsAndLGV and RandomWalksOnFiniteGroups. None owns the `(GL_n, GL_m)`-duality. The one object shared is the complex `n = m` case with AutomorphicLFunctionsAndLocalFactorsPartII §4.4: SchurWeyl §8.4 owns the general complex statement, and that roadmap keeps its characteristic-zero rational form (C02).

Source independence: changed passages only; 4 passages (the §8.4 statement, its route, its Checks and the reference entry) compared with 1 source, HoweUmeda1991. Shared wording is limited to forced terms ("multiplicity-free", "upper triangular Borel subgroups"; at most 4 consecutive words, at lines 196 and 875), and the route (Schur–Weyl duality plus character orthogonality) is not the source's. The largest share of the locators in the changed text is HoweUmeda1991, 2 of 2. Arrangement not compared: no layer was added, removed or reordered.

Research link: §8.4 is the `(GL_n, GL_m)`-duality of Howe–Umeda (1991), §1 and §11.1, the type-A case of Howe duality that MetaplecticAutomorphicForms §3.7a uses for compact dual pairs. Layer 9 rests on Brauer (1937), Rui (2005) and Doty–Hu (2009). This rests on the README's References and its consumer list, and on HoweUmeda1991 line 858.

## Not verifiable

- The pull-request description was read only as far as the quoted copy runs (it is truncated mid-paragraph). The parts that name SchurWeyl agree with the head.
- The fifteen seeded sample targets (4.1–9.9) all lie in text the change does not touch or affect, so their locators were not re-read. 6.1's Check values were recomputed because §8.4 consumes Layer 6.

## Source issues

- none

## For the human reviewers

- none
