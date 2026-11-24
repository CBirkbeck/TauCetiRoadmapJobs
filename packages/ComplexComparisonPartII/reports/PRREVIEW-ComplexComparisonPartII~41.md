# Review of ComplexComparisonPartII (pull request #3027 at e47c8ec)

**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of the 50 lines changed since `4b01d78`. C7.9 now states the separability of `H(B, φ)` and the kernel identity for every bounded open `B`, every upper semicontinuous `φ` and every `z ∈ B`, which is true (recomputed on the punctured disc with the weight `−2log|z|` and on the zero space) and repairs the previous small correction; the other changed lines are `*Needs:*` lines that arrived with the merge of `main` and now name sections instead of whole layers, and every section and declaration they name exists and states what it is cited for, with one imprecision. There is no finding; one small correction and one format note, neither blocking. The question left open by the previous review is answered, and nothing is left for a human to decide.

## C01 — The DVR criterion that C3.2d.3 now cites assumes a locally Noetherian target, and C3.2d.3 has no Noetherian hypothesis

An implementer who follows the *Needs:* line of C3.2d.3 (line 1785) to "SchemeAndStackFoundations §1.20 (properness from DVR lifts)" finds `IsProperStack.ofDVRLifting`, stated there for `f : X → Y` with "`Y` is locally Noetherian, `f` is separated and of finite type" (SchemeAndStackFoundations README, lines 3712–3714). In C3.2d.3 it would be applied to the diagonal `P → P ×_B P` of the Picard space, and `P ×_B P` is locally Noetherian only when `B` is; C3.2d.3 assumes `X → B` proper, flat and finitely presented over an arbitrary `B`, and its route speaks of "a valuation-ring test". SchemeAndStackFoundations states no valuative criterion for morphisms of algebraic spaces over general valuation rings (the only others are the perfect one of §0.25 and Mathlib's for schemes), so for a non-Noetherian `B` the line names nothing that closes the step.

The statement of C3.2d.3 is not affected (Stacks, Lemma 99.11.9, is its source). The gap closes with a reduction the supplier already has: locally on `B` the family descends to a base of finite type over `ℤ` (SchemeAndStackFoundations §0.9, `noetherian_approximation` and `finite_presentation_limits`), geometric integrality of the fibres holds on an open of that base and gives the universal-functions hypothesis there, and separatedness is stable under base change. It would be enough to add §0.9 to the line with the words "reduction to a Noetherian base", or to say that the valuation-ring criterion for a quasi-compact immersion of spaces is proved in this target. The line is the text of `main`, which the merge brought in; it can be corrected here or there.

## N01 — "Given the continuity of evaluation, both are Hilbert-space theory" (C7.9, line 5384)

Unchanged from the previous review. Separability does not come from the continuity of evaluation: it is inherited from the ambient `L²(B, e^{−φ}dλ)`, as the *Needs:* line indicates by naming `MeasureTheory.Lp`. The sentence could read "separability is inherited from `L²`; the kernel identity is Parseval for the evaluation functional".

## Previous findings

- C01 — repaired: "In the same generality (`B ⊆ ℂⁿ` bounded open, `φ` upper semicontinuous), prove moreover that `H(B, φ)` is separable and that, for every orthonormal basis `(σ_k)` of `H(B, φ)` and every `z ∈ B`, …" (C7.9, lines 5380–5382).
- N01 — not repaired: "Given the continuity of evaluation, both are Hilbert-space theory." (line 5384); written again as N01.
- Question on C5.4j (a), (b) — answered: the paper is now readable from one of its authors' pages; Theorems 1 and 2 are the two statements, in that order (blocki-kolodziej-regularization lines 35–37 and 40–53).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| C7.9, kernel identity, new generality (weight not plurisubharmonic) | `B` the punctured unit disc, `φ = −2log|z|`, `e^{−φ} = |z|²` | `∫|z|^{2k+2} = π/(k+2)`, finite iff `k ≥ −1`; sum `= 1/(π|z|²(1−|z|²)²)`; sup via the isometry `f ↦ zf` onto the Bergman space: the same | holds |
| C7.9, kernel identity, `B` not pseudoconvex | `B` the unit ball of `ℂ²` minus the origin, `φ = 0` | Hartogs: `H(B) = H(ball)` isometrically; both sides `2/(π²(1−|z|²)³)` | holds |
| C7.9, zero space and every `z` | `φ ≡ −∞` on a disc (upper semicontinuous, values in `[−∞, ∞)`) | `e^{−φ} = ∞`, `H = {0}`: empty sum `0`, sup over `{0}` is `0`; no `0/0` | holds at every `z` |
| C7.9, separability, new generality | `μ = e^{−φ}dλ`, `φ` Borel with values in `[−∞, ∞)`, `B` bounded | `λ|_B` finite, so `μ` is a countable sum of finite measures also where the density is `∞`; `L²(μ)` second countable, subspaces separable | holds |
| C7.13 and HeightsRationalPointsAndObstructions §5.17c.2, citing C7.9 | bounded pseudoconvex `Ω`, plurisubharmonic weight | plurisubharmonic implies upper semicontinuous with values in `[−∞, ∞)`: the cited case is an instance of the stated one | citations stand |
| C3.2d.3, *Needs:* §1.20 | diagonal `P → P ×_B P`, `B` non-Noetherian | criterion needs the target locally Noetherian; `P ×_B P` is not; §0.9 gives the reduction | C01 |
| `riemannExistence` (sampled; *Needs:* now "C0–C2 and C4") | sga1 line 9872, PDF page 267, retyped p. 251 | source: `X` locally of finite type over `ℂ`, equivalence of finite étale covers; the README the same; C3 (algebraic spaces) is not used for covers of schemes | holds |
| C5.4j (a), (b) against the source | blocki-kolodziej-regularization lines 35–37, 40–53 | Th. 1: compact `M`, positive continuous `ω`, smooth decreasing in `PSH(M, ω)`; Th. 2: zero Lelong numbers, `ε_j ↓ 0`, `γ + ε_jω`; `M′ = M` when compact (line 58) | as stated |
| C3.2d.2, *Needs:* `spaceFppfDescent`, `setoid_criterion` | SchemeAndStackFoundations lines 2824 and 3642 | fppf-local algebraic spaces are algebraic spaces; trivial inertia gives an algebraic space: the two steps of the route | cited for what they state |
| `algebraicDeRham` and `artinDeRhamBetti`, *Needs:* DerivedDeRhamCohomology §§2.10–2.12, 2.19 | its lines 3088, 3098, 3102, 3215 | `DeRham.d_squared` in 2.10, `DeRham.d_leibniz` in 2.11, `DeRham.complex` in 2.12, `DeRham.complexMap` in 2.19 | resolved |

The rows for the untouched statements stand as in the previous review, of `4b01d78`.

- The diff: 50 lines of the README (27 added, 23 removed); `Suggested.lean` unchanged; no layer added, removed or reordered. Of the changed passages only C7.9 differs from `main`; the seventeen `*Needs:*` lines are `main`'s text, brought in by the merge.
- Cross-roadmap citations resolved: 17 changed lines, against SchemeAndStackFoundations (§§0.9, 0.11, 1.1–1.3, 1.5–1.11, 1.13, 1.20, 2.1, 2.6, 5.1–5.3, 5.6; `QCoh.presentationEquiv`, `spaceFppfDescent`, `setoid_criterion`, `Sheaf.higherDirectImage`), DerivedDeRhamCohomology (§§2.10–2.12, 2.19), ResolutionOfSingularitiesCharacteristicZero (§§5.2, 5.5, 6.2) and AlgebraicModuliForArithmeticGeometry (§§1.1, 1.2; `relativeSerre`, `projectiveSpaceCechComparison`); all exist where cited; one imprecise (C01).
- Source locators checked against the text this round: 4 (sga1 XII 5.1, 2.4, 2.6; blocki-kolodziej-regularization Theorems 1–2; demailly-analytic-methods lines 6826–6828).
- Seeded sample: of the 15 targets, `riemannExistence` and `artinDeRhamBetti` have a changed *Needs:* line (rows above); the others lie outside the changed passages and stand as in the previous review.
- Dependency check: `depcheck: 132 roadmaps, 1472 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. `lake env lean` on `Suggested.lean`: ten `sorry` warnings and nothing else.
- Pull request text: the description names ComplexComparisonPartII among the largest additions (plurisubharmonic functions, `L²` estimates, regularisation) and its new suppliers PDE §§3.2a, 3.4a and ComplexKahlerGeometry §§3.5a, 4.2a, all present at this head; its paragraph on corrections to `*Needs:*` lines covers the merged change. Nothing in it is contradicted by this head.
- No file outside the roadmap folders is changed.

Overlap check: read SchemeAndStackFoundations (`main`, identical at this head), HeightsRationalPointsAndObstructions and SingularHermitianMetricsAndL2Methods (this head), ComplexKahlerGeometry and RealAnalyticGeometry as in the previous review. `H(B, φ)` is owned here (C7.9); HeightsRationalPointsAndObstructions §5.17c.2 and SingularHermitianMetricsAndL2Methods §6 cite it; nothing else is shared with the changed passages. No other open pull request changes this roadmap.

Source independence: changed passages only; 2 passages (the C7.9 sentence, the C5.4j statements read for the answered question) compared with 2 sources (demailly-analytic-methods, blocki-kolodziej-regularization), none shared beyond what the statements force; largest share demailly-analytic-methods, as in the previous review; the arrangement was not compared again, no layer being added, removed or reordered.

Research link: Layer C7 states the `L²` theory that work on multiplier ideals and positivity builds on: Hörmander 1965, Skoda 1972, Ohsawa–Takegoshi 1987 with Błocki's constant (2013), Nadel 1990, Demailly 1992, Siu 1974, Guan–Zhou 2015. It rests on the README's references and on *Analytic Methods*.

## Not verifiable

- Błocki 2013 (C7.7), Fornæss–Narasimhan 1980 (C5.4d, C5.4j (c)), Hörmander's *Introduction* (C5.4e (j), C7.1 (a)) and Lazarsfeld I–II: paywalled.
- Demailly 1992, Proposition 3.7 (C7.15): not opened; its counterpart, *Analytic Methods* Th. 14.12, was checked in an earlier review.
- Deligne 1968 (the source of `artinDeRhamBetti`): not among the texts held; its locator stands as in the earlier reviews.

## Source issues

- **Misprint** in demailly-analytic-methods at Theorem 14.12 (a), p. 142: the source says the approximants are strictly larger than the function at every point; it should be larger or equal, strict only where the function is finite, since both are `−∞` where the Lelong number exceeds `n/m`; affects a stated result.

## For the human reviewers

- none
