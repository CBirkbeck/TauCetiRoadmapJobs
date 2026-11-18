# Review of FractalGeometry (pull request #2511 at 35491a7)

**Verdict:** needs changes

**Summary.** Changes are needed for one sentence only: the proof sketch of the converse energy bullet in 3.3 states a bound on the potential that is false for the normalised measure (the factor `1/μ(K)` is missing and the range of the sum is not given). Every stated theorem, definition and Check survived the adversarial pass, both sources support all 51 locators as cited, every cited Mathlib declaration exists at the pin, and no other roadmap owns any of the objects. There is one small correction (an input of the Frostman route that no `*Needs:*` line names) and no format note; one fact about the main source is left for the human reviewers.

## R01 (P2) — The bound on the potential in the converse bullet of 3.3 is false for the normalised measure

In the bullet "Converse for compact sets" of 3.3 (README line 434) the text says "the measure of 3.2, normalised, has `φ(x) ≤ Σ 2^(t(k+1)) · 2^(−sk)` summed over the dyadic shells of radius `2^(−k)`". An implementer who formalises this inequality as written proves something false: the ball bound `μ (closedBall x r) ≤ r^s` of 3.2 holds before normalising, and dividing by `μ(K)` multiplies the potential by `1/μ(K)`, which exceeds `1` whenever `K` is small.

Take `K = [0, 1/10]`, `s = 1`, with the measure of 3.2 equal to half of Lebesgue measure on `K` (the first Check of 3.2, rescaled), of mass `1/20`; normalised it is `10·λ` on `K`. The shells that meet `K` from a point of `K` are those with `2^(−k−1) < 1/10`, that is `k ≥ 3`. For `t = 0` the left side is `φ(x) = 1` and the right side is `Σ_{k≥3} 2^(−k) = 1/4`. For `t = 1/2` and `x = 0` the left side is `10 · 2 · √(1/10) ≈ 6.32` and the right side is `√2 · Σ_{k≥3} 2^(−k/2) ≈ 1.71`. If instead the sum is read over all integers `k`, it diverges (the terms are `2^t · 2^((t−s)k)` and `t < s`), and the sentence no longer shows that the energy is finite. For the measure before normalising the bound holds in the same example (`1/20 ≤ 1/4`).

The smallest change is to state the bound for the measure of 3.2 itself and give the range: for `x ∈ K`, `φ(x) ≤ Σ_{k ≥ k₀} 2^(t(k+1)) · 2^(−sk)` over the shells `2^(−k−1) < dist(x, y) ≤ 2^(−k)`, where `k₀` is the least integer with `2^(−k₀−1) < diam K` (the point `y = x` carries no mass because `s > 0`); the series converges because `t < s`, and the `t`-energy of the normalised measure is at most this sum divided by `μ(K)`.

## C01 — The Frostman route of 3.2 uses positivity of the Hausdorff content, which no input line names

In the route of 3.2 (README lines 394 to 396) the total mass `μ_m K` is "a sum `Σ (side Q)^s` over a cover of `K`, which is bounded below independently of `m` because `μH[s] K ≠ 0`". The cover consists of cubes of side up to `2^(−k₀) ≥ diam K`, so it is not a cover by sets of small diameter and `μH[s] K ≠ 0` does not bound the sum directly: the step needs that `μH[s] K ≠ 0` implies a positive infimum of `Σ (diam U)^s` over all countable covers, with no restriction on the diameters (Bishop and Peres, Proposition 1.2.6). The `*Needs:*` line of 3.2 lists no declaration or target for it. Would the author add it as a bullet of 3.2 with that locator, or name the declaration if the library has one.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 attractor, `IFS.IsAttractor` | empty `ι`; one map; constant map with ratio `1/2` | union `∅ ≠ K`; `K = {fixed point}`; `K = {c}` | sound; (2.1.1) and Hutchinson 3.1(2) match | none |
| 1.2 `lipschitzWith_hutchinson` | Cantor maps on `{0}`, `{1}`; ratios `(1/2, 1/4)` | `d_H({0,2/3},{1/3,1}) = 1/3`; `d_H({0,3/4},{1/2,1}) = 1/2`, so `1/4` fails | sound; Hutchinson 3.2(1) | none |
| 1.2 collage and rate Checks | `A = {0}`, `A = [0,1]` | `2/3 ÷ 2/3 = 1 = d_H({0},C)`; `1/6 ÷ 2/3 = 1/4 ≥ 1/6`; `3^(−n)` | all true | none |
| 1.3 `existsUnique_isAttractor` | `x/2 + n`, `n ∈ ℕ`; `(0,1]` with `x/2`; empty `X`, empty `ι` | fixed points `2n` unbounded; `min K = min K / 2` forces `0`; no nonempty set | each hypothesis needed; Hutchinson 3.1(3)(i), B–P 2.1.1(i) | none |
| 1.4 coding map, both theorems | empty `ι`; binary maps, `ω = 0101…`; reversed order | unique empty map; `π ω = 1/3`; `0, 1/2, 1/4, 5/8, 5/16, 21/32` oscillates | sound; continuity needed for uniqueness | none |
| 1.5 self-similar measure, both theorems | empty `ι`; weights `(1, 0)`; non-separable `X`; no completeness with attractor | `Σ p = 0 ≠ 1`; `δ₀`, `μ(1/2, 2) = 0`; uniqueness route uses only bounded continuous `g` | sound | none |
| 2.1 box dimensions | `∅`; two points; `ℕ ⊂ ℝ`; `[0,1]` at `ε = 1/10` | `0`; `N = 2`, `d = 0` fails, inf `0`; `N = ∞`, dim `∞`; `⌈1/(2ε)⌉ = 5` | definition matches README; covers use `edist ≤ ε` | none |
| 2.2 `dimH_le_lowerBoxDim` | `{0} ∪ {1/n}`; `ℚ ∩ [0,1]`; not totally bounded | `0 ≤ 1/2`; `0 ≤ 1`; right side `∞` | sound; B–P (1.2.3) | none |
| 2.3 `boxDim_harmonic` | `ε = 10⁻⁴`; `{n^(−2)}` | 71 separated points (`70·71 = 4970 < 5000`); optimal cover 148; squares 33, `ε^(−1/3) ≈ 21.5` | Checks true; B–P Example 1.1.4 | none |
| 2.4 union and Hölder image | `√x`, `x²` on `{0} ∪ {1/n}`; `C = 0`; `A = ∅`; `A` unbounded | `2/3 ≤ 1`; `1/3 ≤ 1/2`; image dim `0`; `0 ≤ 0`; `∞` | sound | none |
| 3.1 `measure_le_mul_hausdorffMeasure` | Lebesgue, `C = 2`; `δ_x`, `s = 0`, `C = 1`; `diam U = 0` | `λ E ≤ 2 λ E`; `1 ≤ μH[0]{x} = 1`; `0^0 = 1` covers the atom | sound; B–P 1.2.8 assumes all balls | none |
| 3.2 `exists_frostman_measure` | `[0,1]`, `s = 1`; `{x}`, `s = 0`; `r < 0`, `r = 0`; `dim E = 0` | `λ/2`: ball mass `≤ r`; `δ_x ≤ 1`; empty ball `0 ≤ 0^s`; only `s = 0` survives | sound; B–P 3.1.1 as described | C01 |
| 3.3 `hausdorffMeasure_eq_top_of_energy_ne_top` | Lebesgue on `[0,1]`, `s = 1/2`; `δ_x`; `s = 0`; infinite `μ` | energy `2/((1−s)(2−s)) = 8/3`; `∞` on diagonal; energy `1`, `μH[0] = 1`; proof still applies | sound; B–P 3.4.2(ii) | none |
| 3.3 converse bullet, sketch | `K = [0,1/10]`, `s = 1`, `t = 0` and `t = 1/2` | normalised: `1` vs `1/4`; `6.32` vs `1.71`; unnormalised: `1/20 ≤ 1/4` | statement true, sketch bound false | R01 |
| 4.1 similarity dimension | one index; ratios `(1/2, 1/4)`; `t < 0` | `s = 0`; `x + x² = 1`, `s ≈ 0.6942`; every term `> 1` | unique `s ≥ 0`; Hutchinson 5.1(2),(3) | none |
| 4.2 `upperBoxDim_le`, `hausdorffMeasure_le` | `2x/3, (2x+1)/3`; `x/2` twice; one map; `ρ = 1/100` | `s ≈ 1.7095 ≥ 1`; `0 ≤ 0^1`; `1 ≤ 0^0 = 1`; `#Π_ρ = 34 ≤ 64.04` | sound; Hutchinson 5.1(4)(i) | none |
| 4.3 `hausdorffMeasure_pos_of_disjoint` | Cantor system; one map | `δ^s = (1/3)^s = 1/2 ≤ μH[s] C ≤ 1`; `μH[0] K = 1` | sound; ball bound `δ^(−s) r^s` recomputed | none |
| 4.4 Moran–Hutchinson, both theorems | one map (`Pairwise` vacuous); map twice; `3x/4, (3x+1)/4`; unbounded `U`; `dim E = 0` | `s = 0`, `μH[0] = 1`; condition fails; `s ≈ 2.409 > 1`; `U ∩ N_ε(K)` works | sound in every finite-dimensional norm; Hutchinson 5.3(1)(ii), B–P 2.2.2 | none |
| 4.5 natural measure | binary maps; weights `(1/3, 2/3)`; `s < 0` | Lebesgue both sides; `μ[0,1/2] = 1/3 ≠ 1/2`; mass equation forces `Σ rᵢ^s = 1`, so `s ≥ 0` | sound; Hutchinson 5.3(1)(iii) | none |
| 5.1 Cantor sets | `c = 1/3, 1/4, 1/2, 2/3` | `0.6309`; `1/2`; `1`; images overlap, formula `1.7095 > 1` | sound; `cantorSet_eq_union_halves` read at the pin | none |
| 5.2 Sierpiński simplex | `n = 0, 1, 2, 3`; collinear `0, 1/2, 1`; incomplete `E` | `0`; `1`; `log 3 / log 2`; `2`; attractor `[0,1]`, dim `1` | sound; uniqueness without completeness covers `E` | none |
| 5.3 restricted digits | carpet; sponge; `n = 0`; `D = ∅`; `D` full | `#D = 8`, `1.8928`; `27 − 7 = 20`, `2.7268`; `0`; vacuous; `n` | sound; B–P Example 1.3.4 | none |
| 5.4 von Koch curve | images of `0`, `1`; apex of second image | `0, 1/3, 1/2 + i√3/6, 2/3` and `1/3, 1/2 + i√3/6, 2/3, 1`; apex `1/3 + i√3/9` on slope `√3/3` | sound | none |
| 5.5 product inequalities | `C × C`; `A = ∅`, `B = [0,1]`; `dimH A = 0` | both give `2 log 2 / log 3 = log 4 / log 3`; `1 ≤ 0` false; copy `{a} × B` | sound; B–P 3.2.1 and (3.2.2) | none |

- Source locators checked against the text: 51 of 51 (34 into Bishop and Peres, 17 into Hutchinson), including all 15 sampled sections; none flagged as unverified by the README.
- Library declarations opened at the pin: 63 names elaborated with `#check` under their cited namespaces, 0 unknown; statements of `coveringNumber`, `IsCover`, `coveringNumber_subset_le`, `cantorSet_eq_union_halves`, `le_hausdorffMeasure`, `hausdorffMeasure_apply`, `addHaar_closedBall`, `dimH` and the Prokhorov compactness lemma read in the files.
- Cross-roadmap citations resolved: 4 (GeometricMeasureTheory, ProbabilisticAndMetricNumberTheory sections 3.8 to 3.10, ProbabilisticAndMetricNumberTheoryPartII, OptimalTransport), all on main, none a supplier.
- Duplication: no box-counting dimension, iterated function system, Frostman lemma, mass distribution principle for balls or energy criterion in the pinned Mathlib or Tau Ceti, on main or in any open roadmap pull request searched.
- Dependency check: `depcheck: 210 roadmaps, 2259 edges, 0 problem(s)`; the roadmap consumes Mathlib only.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: 26 `sorry` warnings and nothing else; the 34 elaborated signatures were compared with the README and none lost a binder.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `aesop`) on a copy of the file: 0 of 26 theorems closed. Headline theorems of the summary: all stated in `Suggested.lean`; none declared not statable.
- Pull request text read against the head: 26 theorems, 8 definitions, Mathlib-only import and the scope sentences all agree; no change outside the folder.

Overlap check: read HyperbolicDynamicsAndThermodynamicFormalism, ProbabilisticAndMetricNumberTheoryPartII, ProbabilisticAndMetricNumberTheory, CompactQuantumMetricSpaces; nothing shared (the coding attractor of ProbabilisticAndMetricNumberTheoryPartII §1.4 is the closure for one countable-branch system, not the attractor of a finite system).

Source independence: 12 passages compared with 2 sources, none shared; largest share Bishop and Peres, 34 of 51 locators; contents compared with Bishop and Peres: independent (Layer 1 ↔ §2.1, Layer 2 ↔ §§1.1–1.2, Layer 3 ↔ §§1.2, 3.1, 3.4, Layer 4 ↔ §§2.1–2.2, Layer 5 ↔ §§1.3, 3.2: neither one to one nor in order).

Research link: Layer 1 and Layer 4 state the theorems of Hutchinson (1981) and Moran (1946) on self-similar sets; Layer 3 is Frostman's (1935) lemma and capacity criterion; 5.5 is Marstrand's product theorem; the scope names Schief's converse (1994). Rests on the README's references and on Bishop and Peres, Theorems 2.2.2, 3.2.1, 3.4.2 and Section 2.9.

## Not verifiable

- none

## Source issues

- **Misprint** in Bishop and Peres (draft of 1 December 2015) at Section 2.9, printed page 77: the source says Schief's theorem will be proven in Chapter 8; it should be Section 9.6, where Theorem 9.6.1 stands; affects nothing.
- **Misprint** in Bishop and Peres (draft of 1 December 2015) at the paragraph before Example 1.3.5, printed page 15: the source says self-affine sets are studied in a chapter whose number is an unresolved reference; it should be Chapter 4; affects nothing.
- **Misprint** in Hutchinson 1981 (author's retyped version) at 5.1(1), printed page 18: the source refers to the overlap condition as item (ii) of a definition whose items are numbered (1) and (2); it should be (2); affects nothing.

## For the human reviewers

- **Licence.** Two thirds of the locators (34 of 51) go to the 1 December 2015 draft of Bishop and Peres on the first author's course page; the book was since published, and the README (References) claims only the draft's numbering.
