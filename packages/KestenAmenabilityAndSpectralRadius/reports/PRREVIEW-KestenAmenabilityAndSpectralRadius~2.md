# Review of KestenAmenabilityAndSpectralRadius (pull request #2960 at a547786)

**Verdict:** accepted

**Summary.** Accepted: this head repairs the one finding of the previous review (Layers 1 and 2 are now stated for summable step distributions of arbitrary support, so Kesten's criterion covers countable groups that are not finitely generated), and I found no false or unsupported statement in the theorems, routes, Checks or `Suggested.lean`; every Check value I recomputed agrees. There are three small corrections and one format note, none blocking. Two points are left to the human reviewers: the boundary with FreeProbability F3, and the fact that all locators are to one textbook.

## C01 — The scope section does not name RandomWalksOnFiniteGroups, which defines convolution powers on a group on another carrier

A reader who has both roadmaps finds two definitions called `convPow` for the law of an `n`-step walk on a group and no sentence relating them. RandomWalksOnFiniteGroups (an open roadmap), 1.1, defines `μ^{*(t+1)} = μ^{*t} ∗ₘ μ` for measures on a finite group with Mathlib's `Measure.mconv`, and its walk moves `x` to `xs`; here `convPow` is the recursion `μ * μ^{*n}` on real functions on any group, moving `x` to `sx`. The scope section says only "Not treated here: convergence to uniformity and mixing times of walks on finite groups" (Scope and ownership, line 582).

One sentence there would settle it: name RandomWalksOnFiniteGroups 1.1 as the owner of the measure-valued powers on finite groups, and say that for a probability measure on a finite group with mass function `μ` the two powers have the same mass function (so the return probabilities agree), this roadmap keeping real functions because 1.2 and 1.3 need arbitrary total mass and signed `f`.

## C02 — "It is at most `2k − 1`" in 3.3 fails for `k = 0`

In 3.3 (line 480) the cogrowth is defined for every `k` and bounded by `2k − 1`; for `k = 0` the free group is trivial, the counts are `0` for `n ≥ 1`, the cogrowth is `0`, and `2k − 1 = −1`. Add "for `k ≥ 1`" to the sentence (the count `2k(2k − 1)^(n−1)` is right for every `k`).

## C03 — Step 2 of the route of 2.2 exhausts `G` by a sequence of finite sets, which an uncountable group does not have

The step takes "the restrictions `u_j` of `u` to an increasing exhaustion of `G` by finite sets" (2.2, line 282), while 2.2 is stated for every group. The function `u = μ * f` has countable support, so exhaust that, as the route of 1.3 already does ("exhausting its countable support", line 193).

## N01 — The Grigorchuk entry under References narrates a search

"No DOI was found for it" (line 678) describes how the entry was made, not the work; the bibliographic line that follows is enough.

## Verified sound

Previous findings at this head: R01 (finite support in Layers 1 and 2) repaired: "A step distribution on a group `G` … is a real function `μ : G → ℝ` with arbitrary support" (Conventions, line 46), 1.2–2.4 restated with `Summable μ` or `HasSum μ 1`, and "measures with infinite support" is gone from the scope section. C01 (no carrier for `Σ A_m z^m`) repaired: "Work in the formal power series ring `PowerSeries R`" (3.1, step 2). N01 (three papers without entries) repaired: four entries under References.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions, Checks | `ℤ/3`; lazy `ℤ`; `μ(k) = 2^(−|k|−1)`; `(δ₂+δ₋₃)/2`; `δ₁+δ₋₁` | `0, 1/2, 1/4`; `C(2n,n)/4ⁿ`; `p₂,p₃,p₄ = 1/6, 1/12, 19/216`, boundary `2 − 2^(1−n)`; returns iff `5 ∣ n`; `ρ = 2` | agree | none |
| 1.1 definitions and bullets | `F₂` simple walk; `μ = 0`; `a = 1` term; mass `m` | `p₂ = 1/4`, `p₄ = 28/256`; `p₀ = 1`, `p_n = 0`; `p_(j+n) ≥ p_j p_n`; `p_n ≤ mⁿ` | agree | none |
| 1.2 even returns | `μ = 0`; mass `≠ 1`; `n = 0` term; non-summable `μ(e_i) = 1/i` on `⊕ℤ/2` | `0 → 0 = ρ`; ratios `a_(n+1)/a_n ≤ m`; exponent `0`, value `1`; `p_(2n)^(1/2n) ≥ 2^(−N/2n) H_N → ∞`, real `limsup = 0` | true; control fails as stated | none |
| 1.3 operator norm | `μ = 0`; `δ₁` on `ℤ`; `ℤ`, `1_{0..n−1}`; `F₂`, `δ₁`; non-summable control | set `{0}`, `ρ = 0`; ratio `1` vs `ρ = 0`; `√((n−1)/n)`, `√(1/2)` at `n = 1`; `1/2 < √3/2`; ratio `≥ H_N` | true | none |
| 2.1 expansion constant | `F₂`: `K = {1}`, ball `r`; rank `k`; `△` variant; `E(1_K)` | `1`; `3^r/(2·3^r − 1) → 1/2`; `≥ (k−1)/k + 1/(k|K|)`; `△` gives `1 ≤ 1 − √3/2` false; `|sK∖K| = |s⁻¹K∖K|` | agree | none |
| 2.2 two inequalities | trivial; finite; `F_k`; lazy `F₂`; `δ₁/2` on `1`; `δ₁` on `ℤ`; step 4 algebra | `0 ≤ 0 ≤ 0`; same; `√(1−Φ²) = √(2k−1)/k`; `0.032 ≤ 0.067 ≤ 0.25`; `1/2 > 0`; `1 > 0`; `Φ² ≤ t(2−t)` | true | C03 (route wording) |
| 2.3 `Φ = 0 ⇔` Følner | `μ = 0`; `δ₁` on `F₂`; `μ ≡ 1` on `F₂`; `−(δ₁+δ₋₁)/2` on `ℤ`; `δ₁` on `ℤ` | `G` trivial, both hold; `Φ = 0`, no Følner; non-summable, `tsum = 0`, `Φ = 0`; `Φ = −1`; `1/n → 0` | true; three controls fail as stated | none |
| 2.4 Kesten | trivial; `F₂`; `Σ 2^(−n) ν^{*n}`; `ℚ`, `μ(±1/n!) = 2^(−n−1)`; `δ₁+δ₋₁` | `ρ = 1`; `√3/2`; `≤ (3 + 4√3)/13 ≈ 0.764`; mass `1`, ratio `≤ m·m!/N + 2^(−m) ≤ 2^(1−m)`; `ρ = 2` | true | none |
| 3.1 free value | `k = 1, 2, 3`; recursion; `uS`; closed form from `W(z) = w` | `1`, `√3/2`; `A·A₁ = A₂ + d`; coefficients `1, 0, −1, 0, …`; `z/w = 2/(1+s)`, `C = 2b/(b−1+(b+1)s)`; series `1, 0, 4, 0, 28, 0, 232` | true | none |
| 3.2 images | `Γ = 1`; `k = 0` junk | `1 ≥ √(2k−1)/k`; `0 ≤ 0` | true | none |
| 3.3 cogrowth formula | trivial `φ`; injective; `k = 1`, `ℤ → ℤ/m`; `F₂ → ℤ/5` (two maps), `F₂ → S₃`; `k = 0` bound | `2kρ = 1 + b`; `c = 0`; `c = 1 = √b`, `ρ = 1`; `0,0,12,24,48,204`, `b₁ = 2`, (6.23) exact to `z¹⁸`; `0 > −1` | theorem true; one sentence off at `k = 0` | C02 |
| 3.4 Grigorchuk | `id` on `F₁`; trivial `F₂ → F₂`; quadratic | `c = 0 ≠ 1`, `ℤ` amenable; `c = 3`, not amenable; `c² − 2kc + b = (c−1)(c−b)` | true | none |
| Lean coercions and context | `√(2 * k - 1) / k`; `2 * k - 1`; `l2Norm`; discrete topology binders | elaborate as `√(2 * ↑k − 1) / ↑k` and `2 * ↑k − 1` in `ℝ`; `l2Norm` needs no group; binders present in 2.4, 3.4 | agree with README | none |
| Scope against RandomWalksOnFiniteGroups 1.1 | recursion and carrier on each side | `μ^{*t} ∗ₘ μ` on measures, finite `G`; `μ * μ^{*n}` on `G → ℝ`, any `G` | same mass function for probabilities | C01 |

- Source locators checked against the text: 18 (condition (6.1) and `Φ_E`, p. 177; pp. 180–181; §6.2, p. 183; Exercise 6.7 and Proposition 6.6, p. 184, proof p. 185; Theorem 6.7 and Lemma 6.8, p. 186; proof and Exercise 6.9, p. 187; (6.21), p. 188; (6.22)–(6.25) and the attribution, p. 189; Theorem 6.10 and its last paragraph, p. 190; Theorem 6.11 and Exercise 6.10, p. 191; Notes, p. 224; Exercise 6.58), all at the stated printed pages.
- Library declarations opened at the pins: 48 (47 elaborated with `#check`, among them every Mathlib and Tau Ceti name of the supplier contracts, `MeasureTheory.mlconvolution`, `MeasureTheory.Measure.mconv`, and `PowerSeries.invOfUnit` over `MonoidAlgebra ℝ (FreeGroup (Fin 2))`; `TauCeti.not_amenable_freeGroup` read at `TauCeti/GroupTheory/Amenable/FreeGroup.lean` line 40).
- Duplication by object: no return probability, walk spectral radius, expansion constant of a walk or cogrowth in the pinned Mathlib or Tau Ceti, nor in any other roadmap on main or open.
- Cross-roadmap citations resolved: AmenableGroups Layers 2, 3, 5, 6 on main and at its open head (ids and titles kept); OperatorAlgebraDynamics D2 (main, line 967); FreeProbability F3 (main, lines 306–312); OperatorKTheory K7.FreeGroups (main).
- Dependency check: `depcheck: 168 roadmaps, 1958 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: nine `declaration uses sorry` warnings, nothing else. One-tactic probe (`rfl`, `simp`): closes none of the nine theorems.
- Signatures: the 19 elaborated types compared with the README statements; the only dropped binder is `[Group G]` on `l2Norm`, whose body does not use it.
- Headline theorems (1.2, 1.3, 2.2, 2.3, 2.4, 3.1, 3.2, 3.3, 3.4): all stated in `Suggested.lean`; no padding. No change outside the roadmap folder. The pull request's title and description agree with this head.

Overlap check: read AmenableGroups (main and open head), ElectricalNetworksAndRandomWalks, KestenStigumAndCriticalBranching, RandomWalksOnFiniteGroups, IharaZetaFunction, FactorRigidity, and also FreeProbability, OperatorAlgebraDynamics, MarkovChainMixing, KernelsAndSpectralMethods; amenability and Følner sets: AmenableGroups (cited, not restated); measure-valued convolution powers on finite groups: RandomWalksOnFiniteGroups 1.1, real-function powers on arbitrary groups: this roadmap (C01); the norm `2√3` on `ℓ²(F₂)`: FreeProbability F3 (here a Check); nothing else shared.

Source independence: 12 passages compared with 1 source (routes of 1.2, 1.3, 2.2 step 3, 3.1 steps 1–5, 3.3 with Pringsheim, statements of 2.1, 2.2, 2.4, 3.3, 3.4, two docstrings), none shared beyond formulas and standard names; largest share LyonsPeres, 18 of 18 locators; contents compared with LyonsPeres Chapter 6: independent (Layers 1 and 2 divide §6.2 and draw on §6.1 and the Notes; §6.1's flow theorems and §6.4 onward are absent; the order 1 → 2 → 3 is forced by 2.2 needing 1.3 and 3.4 needing 2.4).

Research link: Kesten (1959), Grigorchuk (1980) and Northshield (1992), as presented in Lyons–Peres (2016), Chapter 6; the rank-two free-group value is the norm FreeProbability F3 uses to separate full and reduced group C*-algebras, and OperatorAlgebraDynamics D2 recalls Kesten's theorem. Rests on the README and LyonsPeres §6.3 and §6.10.

## Not verifiable

- Kesten (1959, both papers), Grigorchuk (1980), Northshield (1992): not opened; the README names them for attribution only, through LyonsPeres, which was read.
- Paterson (1988), Theorem 4.13: not opened; the README does not rely on it.
- `TauCeti.not_amenable_freeGroup` was read in the source file but not elaborated (its module has no built object file here); it is used only in Checks.

## Source issues

- **Error** in LyonsPeres at Exercise 6.10, printed page 191: the source says every `d`-regular multigraph has spectral radius `1` exactly when its cogrowth is `d − 1`; it should be restricted to `d ≥ 3`, since the line `ℤ` (`d = 2`) has spectral radius `1` and cogrowth `0`; affects nothing.
- **Misprint** in LyonsPeres at the table of contents, Chapter 6: the source says the chapter and §§6.1–6.3 begin on pages 177, 177, 184, 189; it should be 176, 176, 183, 188, as the running heads of this version show; affects nothing.

## For the human reviewers

- Ownership: FreeProbability F3 (main, lines 306–312) proves the norm `2√3` on `ℓ²(F₂)` by a shift operator; here 3.1 with 1.3 gives it for every rank, kept as a Check of 1.3. Whether F3 should cite 3.1 is yours.
- Ownership: RandomWalksOnFiniteGroups (open) and this roadmap each define convolution powers on a group, on measures and on real functions (C01). Whether one carrier should serve both is yours.
- Single source: all 18 locators are to one textbook (LyonsPeres, Chapter 6), read on its first author's page; the primary papers are named without locators and were not opened.
