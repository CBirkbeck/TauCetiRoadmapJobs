# FIX-DESIGN-SpectralSequencesAndConvergence~3

Repair of the eight findings of `REV-DESIGN-SpectralSequencesAndConvergence~2` (all P3). Every
finding was checked against the cached sources, the pinned Mathlib and Tau Ceti and the roadmap's
own text before it was applied. Files changed: `packages/SpectralSequencesAndConvergence/design/README.md`,
`packages/SpectralSequencesAndConvergence/design/plan.json`, `packages/SpectralSequencesAndConvergence/sources.toml`.

## REV-DESIGN-SpectralSequencesAndConvergence~2/F01 (P3) — applied

3.6 two rows: "converges in degrees `n` and `n + 1`" → "converges in degree `n + 1`", with a one-line
reason: only `d_2` is nonzero, `E_∞^{n+1,0} = coker d_2`, `E_∞^{n,1} = ker d_2`, and convergence in
degree `n + 1` gives `F^{n+2} H^{n+1} = 0`, `F^n H^{n+1} = H^{n+1}`. Plan 3.6 statement now says
"convergence in degree n+1". The splicing sentence is kept.

Pattern: the other 3.6 clauses were rechecked. Two columns uses degree `n` only. The five-term
sequence does need degree 2, since separation in degree 2 gives `F^3 H^2 = 0`, so `E_2^{2,0} → H^2`
has kernel `im d_2`. The extended sequence uses every degree `≤ m + 1`. So only the two-row clause
changed.

## REV-DESIGN-SpectralSequencesAndConvergence~2/F02 (P3) — applied

3.4 *Needs:* "3.1, 3.2, 2.2." → "3.1, 3.2, 2.2; 2.3 for the weak Serre classes and for the
page-step identity behind the Euler identity". 2.3 is needed twice: 3.4 already uses "a weak Serre
class `P` as in 2.3", and the Euler bullet steps from page `r` to the limit page by 2.3's identity.
plan.json 3.4 already listed `target:2.3`.

Pattern: every README *Needs:* line was compared mechanically with its plan `target:`
prerequisites. One other gap: 7.3 *Needs:* "7.1" → "7.1; 7.2 for the epimorphic-limit bullet".
That bullet (Lemma 3.15 (c)) assumes lim-acyclic epimorphic towers, which 7.2 defines, and plan 7.3
lists `target:7.2`. After the repair the comparison shows no mismatch.

## REV-DESIGN-SpectralSequencesAndConvergence~2/F03 (P3) — applied differently

The 3.1 bullet "complete ⇔ separated + `lim¹_p F^p X = 0` (with lim¹ of Layer 7.1)" is deleted. 3.1
keeps "Complete implies separated", now with its one-line proof and a pointer to 7.1. 7.1 gains the
bullet *completeness through lim¹*, its locator (helle-rognes2024 line 85–93, the step
`F_jG ≅ lim_i F_jG/F_iG` in the proof of Lemma 2.6, for graded modules), a fourth Check, and
*Needs:* 3.1. The Conventions now point at 7.1 instead of 3.1, and 7.5 cites "7.1, completeness
through lim¹" instead of "7.1 and 7.2".

This differs from the review's wording because the stated result is stronger and the extra strength
is proved. The forward direction (complete ⇒ separated and `lim¹ = 0`) needs only countable
products. Take the partial-sum map `σ_n = Σ_{k<n} π_k` from `∏F^n X` to `∏X`. Then
`(1 − s)σ = −ι` under Tau Ceti's convention `towerDifference = π_n − π_{n+1} ≫ F.map`
(`TowerDifference.lean` line 73–78). Completeness lifts `σ`'s image in `lim X/F^n` to
`c : ∏F^n X → X`, and `Δc − σ` factors through `∏F^n X` as a section of `1 − s`. Only the converse
uses `CountableAB4Star` (the six-term sequence). Plan: `isComplete_iff_limOne` is removed from 3.1;
7.1 gains the API entry `isComplete_iff_isSeparated_and_limOne`, `target:3.1`, the updated
hypotheses and locator, and the test `ladic_completeness_limOne`.

## REV-DESIGN-SpectralSequencesAndConvergence~2/F04 (P3) — applied

The 6.2 wrong-model Check now names the whole couple: in each bidegree, `D = ℤ/ℓ²`, `i = ×ℓ`,
`E = ℤ/ℓ ⊕ ℤ/ℓ`, `j(x) = (x mod ℓ, 0)` and `k(a, b) = ℓb`. It shows the three exactness equalities,
`d_1 = jk = 0` and `Z_2 = k^{−1}(ℓℤ/ℓ²) = E`, against the wrong model's
`k^{−1}(im i²) = ℤ/ℓ ⊕ 0 ⊊ E`. plan.json test `shifted_tower_wrong` already stated this couple.
The name "Bockstein couple of `ℤ/ℓ²`" is dropped, because this couple is not a Bockstein couple.

## REV-DESIGN-SpectralSequencesAndConvergence~2/F05 (P3) — applied

The downstream-consumer bullet "A roadmap on the geometric circle method …" is deleted.
`roadmaps grep` for "geometric (version of the )?circle method" and "Browning.{0,10}Sawin|1711.10451"
(main and 476 open heads) finds only AlgebraicTopologyPartII. That roadmap cites Browning–Sawin
(its key **BS**) for configuration spaces and Euler exponents (§7), not for the spectral sequence
of Theorems 1.1 and 2.7. CircleMethodThreePrimes is the classical circle method. The Layer 3
Examples paragraph and browning-sawin2020's `cited_for = ["Layer 3 Examples"]` are unchanged, and
plan.json `consumers` never had this entry.

## REV-DESIGN-SpectralSequencesAndConvergence~2/F06 (P3) — applied

References, weibel1994: "§§3.5, 5.2, 5.4, 5.5, 5.9" → "§§3.5, 5.2, 5.5, 5.9". The README cites
weibel1994 at §3.5, 5.2.5, 5.2.6, 5.2.11, 5.2.12, §5.2 exercises, 5.5.1, 5.5.10, 5.9.1–5.9.4, and
never §5.4. This agrees with the manifest locator.

Pattern: the helle-rognes2024 References entry claimed the ranges "Definitions 2.3–2.7, 3.1–3.11".
Definition 3.1 (helle-rognes2024 line 104, exact couples) is cited nowhere, and the entry omitted
Lemmas 2.2 and 3.4, the Remarks, the sequence (3.1) and Example 8.1, which are cited. It now lists
exactly what the README cites, including the new Lemma 2.6. The manifest locator likewise drops
"Definition 3.1" and adds "the sequence (3.1)" and Lemma 2.6. Left unchanged: the stacks-012K
entry (every listed tag is cited; §22 lies inside the range §§19–24 that §23 builds on), and
mccleary2001 Ch. 3 and cartan-eilenberg1956 Ch. XV, which the manifest records as general
references (`cited_for` includes "References").

## REV-DESIGN-SpectralSequencesAndConvergence~2/F07 (P3) — applied

1.2 locator: "(stacks-012K line 2612–2624, Definition 20.1, tag 011N; …)" → "(stacks-012K line
2612–2624, the construction after Definition 20.1, tag 011N; …)". Checked: line 2598–2605 is
Definition 20.1 and line 2612–2624 is the construction of `0 = B_1 ⊂ … ⊂ Z_1 = E_1`. plan.json
1.2 locator changed the same way. No other occurrence of "Definition 20.1" or "2612".

## REV-DESIGN-SpectralSequencesAndConvergence~2/F08 (P3) — applied

Added `Mathlib/CategoryTheory/Abelian/GrothendieckCategory/Basic.lean` to the file list of the
Mathlib bullet (`IsGrothendieckAbelian` is declared there at line 70 at the pin).

Pattern: the same bullet's other classes were also filed under the wrong file. At the pin they are:

- `HasCountableProducts` and `HasCountableCoproducts` in
  `Mathlib/CategoryTheory/Limits/Shapes/Countable.lean` (lines 61 and 108);
- `HasExactColimitsOfShape` in `Mathlib/CategoryTheory/Limits/HasExactLimitsOfShape.lean` (line 47);
- `EnoughProjectives` in `Mathlib/CategoryTheory/Preadditive/Projective/Basic.lean` (line 77).

All three files are added. `CountableAB4Star` (line 126) and `AB5` (line 152) are in the
GrothendieckAxioms file, as already stated. The module instances `AB5`, `AB4Star` and
`IsGrothendieckAbelian` are in `ModuleCat/AB.lean` (lines 30, 38, 53), and `enoughProjectives` is in
`ModuleCat/Projective.lean` (line 60). The other file attributions in the Mathlib block were also
checked: `EInt` in `Order/WithBotTop.lean` line 81, `IsSerreClass` in `SerreClass/Basic.lean` line
45, `EulerCharSigns` in `EulerCharacteristic.lean` line 56, and the spectral-sequence carriers in
`SpectralSequence/Basic.lean` lines 36–133.

## Checks run

Dependency gate (exact output):

    candidate: SpectralSequencesAndConvergence is not in the merge order yet; checked as if placed after StableHomotopyKTheory (the intake inserts it when its design is accepted)
    depcheck: 244 roadmaps, 2392 edges, 0 problem(s)

There is no UPWARD or CYCLE line. The F03 repair removes the only forward dependency inside the
roadmap (3.1 on 7.1). 7.1 now depends on 3.1, which points down the build order.

`roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name unresolved. Of the
three leads in the worker's citations file, `DoubleComplex.eInftyIsoGr`, `DoubleComplex.page_eq_eInfty`
and `DoubleComplex.fiveTerm_exact` are names planned by DerivedModuleAlgebra §S.1 on main (its
README line 2348–2353 and `Suggested.lean` line 1328–1330), cited as that roadmap's targets and not
as pinned declarations.

`plan.json` parses. It has 7 layers and 31 targets, and 7.1 gains one test, for 99 tests in
all. `sources.toml` parses. No README line is over 100 characters, and the README has no LaTeX
delimiters and no process words.

No `Suggested.lean` exists at the design stage, so there was nothing to elaborate and no `#check`
comparison could be made. No Lean was run.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 3.6 two rows, convergence in degree `n + 1` only | Hopf pages `n = −1, 0, 1, 2` | `n = −1`: `0 → ℤ → H^0 → 0`, `H^0 = ℤ`; `n = 0`: `0 → H^1 → ℤ →≅ ℤ`, `H^1 = 0`; `n = 1`: `ℤ →≅ ℤ → H^2 → 0`, `H^2 = 0`; `n = 2`: `0 → H^3 → ℤ → 0`, `H^3 = ℤ`; none uses `H^n` | holds | degree `n` dropped |
| same, degree `n` irrelevant | Hopf pages with `H^1` replaced by `ℤ` (constant filtration, not convergent) | the `n = 1` sequence `ℤ →≅ ℤ → H^2 → E_2^{1,1} = 0` still forces `H^2 = 0` | holds | — |
| same, convergence not weakened | `E = 0`, `H^{n+1} = ℤ` with constant filtration | weak convergence holds, but `0 → 0 → ℤ → 0 → 0` is not exact: separation is used for `F^{n+2} = 0` | needed | — |
| same, page stabilisation | `q ∈ {0,1}`, `r ≥ 3` | leaving target at `q + 1 − r ≤ −1`, entering source at `q + r − 1 ≥ 2`: every `d_r = 0`, so `E_3 = E_∞` | holds | — |
| 3.4 Euler identity with 2.3 | `ℤ/4`, `ℤ/2 ⊕ ℤ/2`, `v` = length | `(−1)^n · 2` from both sides; 2.3 page step `−2 + 1 = −1 = −1 + 0` | holds | *Needs:* adds 2.3 |
| 7.3 bullet with 7.2 | `Q^s = ℤ/ℓ^s`, reductions | `lim = ℤ_ℓ → ℤ/ℓ^s` onto; uses lim-acyclicity of epimorphic towers (7.2) | holds | *Needs:* adds 7.2 |
| 7.1 complete ⇒ separated + `lim¹ = 0` | `X = 0`; zero filtration; finite filtration | all complete; meet `0`; zero tower, and an eventually-zero (pro-zero) tower, give `lim¹ = 0` | holds | moved from 3.1 |
| same, the partial-sum route | `ℤ_ℓ`, `y_n ∈ ℓ^n ℤ_ℓ` | `c = Σ_k y_k`, `x_n = c − Σ_{k<n} y_k = Σ_{k≥n} y_k ∈ ℓ^n ℤ_ℓ`, `x_n − x_{n+1} = y_n` | holds | — |
| same, sign | Tau Ceti `towerDifference_π` | `((1 − s)σ)_n = σ_n − σ_{n+1} = −π_n ≫ ι_n`; `(1 − s)(Δc − σ) = 0 + ι` | holds | — |
| same, image of `σ` in the limit | `X/F^n` | `q_nσ_n − t(q_{n+1}σ_{n+1}) = −q_nι_nπ_n = 0` | holds | — |
| converse, separated + `lim¹ = 0` ⇒ complete | `ℓ`-adic `ℤ` | meet `0`; six-term `0 → 0 → ℤ → ℤ_ℓ → lim¹ → 0` gives `lim¹ = ℤ_ℓ/ℤ ≠ 0`; not complete, both sides false | holds | new Check |
| same | `ℓ`-adic `ℤ_ℓ` | `ℤ_ℓ → lim ℤ_ℓ/ℓ^n` iso, so `lim¹ = 0` and complete | holds | new Check |
| same, separation needed | constant `F^p = X ≠ 0`; Example 8.1's `F^s = ∏k/⨁k` | identity tower `lim¹ = 0`; meet `X` (resp. `∏k/⨁k`) `≠ 0`; `lim X/F^p = 0` (resp. `0`), not complete | negative control | new Check |
| same, element of `lim¹ ℓ^nℤ` | `y_n = ℓ^{n²}` | a preimage would force `x_0 = Σ ℓ^{k²}` in `ℤ`; this is not eventually periodic, so not rational; the class is nonzero | consistent | — |
| tower `ℓ^nℤ` ≅ tower `×ℓ` | divide by `ℓ^n` | `ℓ^{n+1}a ↦ a` and `ℓ^{n+1}a ∈ ℓ^nℤ ↦ ℓa`: transition `×ℓ`, matching 7.1's second Check | holds | — |
| Conventions: two senses of complete | Example 8.1; `ℓ`-adic `ℤ`, `ℤ_ℓ` | as in the three rows above | consistent | pointer to 7.1 |
| 7.4 "complete in the sense of 3.1 iff `W^n = 0`" | Example 8.1 | `lim¹_s F^s = 0`, meet `≅ W^0 ≠ 0`; under the AB4* of 7.4, 7.1 gives not complete | holds | — |
| 7.5 route citation | `F^s K^m` complete | forward direction of 7.1 gives `lim = lim¹ = 0` without 7.2 | holds | cites 7.1 |
| 6.2 wrong-model couple | `ℓ = 2`, `ℓ = 3` | `ℓ = 2`: `ker i = {0,2} = im k`, `ker j = {0,2} = im i`, `ker k = {(a,0)} = im j`, `jk = 0`, `Z_2 = E`, wrong `Z_2 = {(a,0)}` | holds | explicit couple |
| same, the one-page shift | 6.2 rule `d_{r+1}[x] = [jy]` for `kx = i^r y` | `d_2(a,b) = (b,0)`, `Z_3 = k^{−1}(im i²) = ℤ/ℓ ⊕ 0`, `B_3 = j(ker i²) = ℤ/ℓ ⊕ 0`, `E_3 = 0`: the wrong `Z_2` is the true `Z_3` | holds | — |
| 1.2 locator | stacks-012K | line 2598–2605: Definition 20.1; line 2612–2624: the towers | label fixed | — |
| Mathlib file list | pinned grep | `IsGrothendieckAbelian` line 70; `HasCountableProducts` 61; `HasCountableCoproducts` 108; `HasExactColimitsOfShape` 47; `EnoughProjectives` 77 | fixed | four files added |

## For the maintainer

- No name that another roadmap cites changed. The plan API name `isComplete_iff_limOne` (3.1) is
  replaced by `isComplete_iff_isSeparated_and_limOne` (7.1). It is a plan-level name only: no
  `Suggested.lean` exists yet, and `roadmaps grep` finds no other roadmap citing it.
- No section, layer or target id changed, and no new target was added. The completeness
  characterisation is an API bullet that moved from 3.1 to 7.1. This roadmap already owned it, and
  the review's ownership search (no other roadmap states completeness through lim¹ on
  `FilteredObject`) still applies.
- No new source was fetched. Lemma 2.6 of helle-rognes2024 is in the cached text (line 85–93).
  `needs-references.toml` was not written.
- No passage in the review asked for any action outside this package.
