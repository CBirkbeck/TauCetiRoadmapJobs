# Review of DysonBrownianMotion (pull request #2118 at efc7944)

**Verdict:** needs changes

Four findings: one P2, three P3. The gate passes. All seven findings of the previous review
are repaired (list under "Verified sound"). The P2 is new: two headlines that the module
docstring calls not statable are statable at the pins, because the Dyson noise is additive.

## R01 (P2) — the `β ≥ 1` existence theorem and the eigenvalue equation are statable at the pins

**Location.** `TauCetiRoadmap/DysonBrownianMotion/Suggested.lean` lines 17–20: "the `β ≥ 1`
particle system of Layer 1 and the eigenvalue stochastic differential equation of Layer 2:
Mathlib has no Itô integral and no strong solution of a stochastic differential equation".

**Claim.** These two headlines (the Summary's second end theorem, and the equation half of
Dyson's theorem) cannot be stated without an Itô integral.

**Witness.** The diffusion coefficient of (4.3.3) is the constant `√(2/(βn))`, so the
stochastic integral is `√(2/(βn)) Bᵢ(t)` and the equation is a pathwise Lebesgue-integral
identity. `n = 1`: `λ(t) = x + √(2/β) B(t)`, no integral at all.

**Repair.** Add one definition and two statements (this exact text elaborates at the pins
appended to the file, `sorry` the only warning), and delete the first "not statable" bullet:

```lean
/-- A continuous process in the open chamber solving the Dyson system of size `n` and
parameter `β` from `x`, driven by `B`, as a pathwise integral identity. -/
def IsDysonSolution [MeasurableSpace Ω] (β : ℝ) (n : ℕ) (x : Fin n → ℝ) (P : Measure Ω)
    (B : Fin n → ℝ≥0 → Ω → ℝ) (X : ℝ≥0 → Ω → Fin n → ℝ) : Prop :=
  ∀ᵐ ω ∂P, Continuous (fun t ↦ X t ω) ∧ (∀ t, StrictAnti (X t ω)) ∧
    ∀ (t : ℝ≥0) (i : Fin n), X t ω i = x i + Real.sqrt (2 / (β * n)) * B i t ω +
      ∫ s in (0 : ℝ)..t, (n : ℝ)⁻¹ * ∑ j ∈ Finset.univ.erase i,
        (X s.toNNReal ω i - X s.toNNReal ω j)⁻¹

theorem dysonSystem_exists_unique [MeasurableSpace Ω] (β : ℝ) (hβ : 1 ≤ β) (n : ℕ)
    (x : Fin n → ℝ) (hx : StrictAnti x) (P : Measure Ω) [IsProbabilityMeasure P]
    (B : Fin n → ℝ≥0 → Ω → ℝ) (hB : ∀ i, IsBrownianReal (B i) P)
    (hindep : iIndepFun (fun i ω t ↦ B i t ω) P) :
    (∃ X : ℝ≥0 → Ω → Fin n → ℝ, IsDysonSolution β n x P B X) ∧
    ∀ X Y : ℝ≥0 → Ω → Fin n → ℝ, IsDysonSolution β n x P B X → IsDysonSolution β n x P B Y →
      ∀ᵐ ω ∂P, ∀ t, X t ω = Y t ω := by
  sorry

theorem matrixBrownian_eigenvalues_dyson [MeasurableSpace Ω] (β : ℕ) (hβ : β = 1 ∨ β = 2)
    (n : ℕ) (d : Fin n → ℝ) (hd : StrictAnti d) (P : Measure Ω) [IsProbabilityMeasure P]
    (B : Fin n × Fin n → ℝ≥0 → Ω → ℝ) (hB : ∀ ij, IsBrownianReal (B ij) P)
    (hindep : iIndepFun (fun ij ω t ↦ B ij t ω) P) :
    ∃ W : Fin n → ℝ≥0 → Ω → ℝ, (∀ i, IsBrownianReal (W i) P) ∧
      iIndepFun (fun i ω t ↦ W i t ω) P ∧
      IsDysonSolution (β : ℝ) n d P W (fun t ω i ↦
        (matrixBrownian_isHermitian β n d B t ω).eigenvalues₀ (Fin.cast (by simp) i)) := by
  sorry
```

Both are stated for a strictly ordered start (AGZ Lemma 4.3.3, and Theorem 4.3.2 for distinct
starting eigenvalues), where the path stays in the open chamber on `[0, t]` and the drift is
continuous there, so the interval integral has no junk value. What I checked:

- Existence is AGZ Lemma 4.3.3 on the space carrying `B`.
- Uniqueness holds path by path and needs no adaptedness: two solutions on `[0, T]` lie in a
  compact convex subset of the open chamber, where the drift is Lipschitz, and Gronwall gives
  equality. So quantifying over all `X, Y` is true.
- `W` exists on the same `Ω`: `Wᵢ(t) = (λᵢ(t) − dᵢ − ∫₀ᵗ drift)/√(2/(βn))` is a functional of
  the eigenvalue path, and its law is fixed by Theorem 4.3.2.
- `n = 1`, `β = 1`: the eigenvalue is `d + √2 B₁₁`, so `W = B₁₁`; `β = 2`: `d + B₁₁`, `W = B₁₁`.

Not included, and to be said in the docstrings: adaptedness to the Brownian filtration
("strong"), uniqueness in law, and closed-chamber starts (Proposition 4.3.5), which need a
filtration-relative Brownian predicate. Name those in the module docstring in place of the
deleted bullet. Add the three names to §§1.1 and 2.2 of the README, and change the pull-request
description's "need an Itô integral, which the pins do not have".

## R02 (P3) — uniqueness in law and weak solutions are used, and StochasticCalculus S9.3 is not cited

**Location.** `TauCetiRoadmap/DysonBrownianMotion/README.md` line 175: "the solution is unique
in law"; line 256: "is a weak solution of the Dyson system"; lines 143, 98 and 44 list
"S9.1–S9.2".

**Claim.** S9.1–S9.2 supply every solution notion the layers use.

**Witness.** StochasticCalculus README at its open head: weak solutions "as actual probability
spaces/laws" and "both Yamada–Watanabe conclusions" are in "9.3 weak theory" (lines 2990–3054),
not in 9.1 (line 2901) or 9.2 (line 2972).

**Repair.** Add S9.3 (weak solutions, uniqueness in law from pathwise uniqueness) to the
consumed list and `*Needs:*` line of §0.1, to the Layer 0 Dependencies, to the supplier
contract (line 98) and to the Scope bullet (line 44). §3.2's transfer to the Ornstein–Uhlenbeck
system by time change also uses uniqueness in law; it reaches S9.3 through §1.2.

## R03 (P3) — §1.2 has no locator for the Ornstein–Uhlenbeck system or its invariant law

**Location.** README lines 197–198: "Prove the Gaussian beta density of RandomMatrices §5.3
invariant, with the boundary terms needed to pass from formal generator symmetry to an
invariant probability law."

**Claim.** Every claim has its locator.

**Witness.** The only locator in §1.2 is Lemma 4.3.3, for existence. AGZ treats this system in
Exercise 4.3.9 (agz line 13153) and proves stationarity inside the proof of Lemma 4.3.17 (agz
lines 13540–13570, system (4.3.40), density `∏|λᵢ−λⱼ|^β ∏ exp(−Nβλᵢ²/4)`).

**Repair.** Add to that sentence "(AGZ, proof of Lemma 4.3.17: (4.3.40) at `t = 1` is this
system, and the generator computation there gives stationarity; compare Exercise 4.3.9)". The
exercise as printed has drift `−λᵢ` where the roadmap's `−λᵢ/2` is the correct one (see Source
issues), so cite it with that caveat or not at all. I checked (4.3.40) at `t = 1` against
line 195: noise `√(2/(βN))`, interaction `1/N`, drift `−u/2`; identical.

## R04 (P3) — §3.1 says "almost surely" without the coupling across sizes

**Location.** README lines 300–301: "`(L_n(t))_{t ≤ T}` converges uniformly on `[0,T]` in the
Lévy–Prokhorov metric, almost surely and in probability"; lines 118–120: "Every limit theorem
records … the coupling across sizes".

**Claim.** The statement records its coupling.

**Witness.** §3.1 names no probability space for the sequence. Almost sure convergence of
systems of different sizes means nothing until they share one; convergence in probability
needs no coupling, which is why `matrixBrownian_hydrodynamic_limit` is correct as it stands.

**Repair.** Add to §3.1: "The systems of all sizes are defined on one probability space, with
no assumption on their joint law (AGZ Proposition 4.3.10 assumes none); convergence in
probability depends only on the law of each size."

## Verified sound

**Previous review, finding by finding.**

- R01 repaired: lines 14–15 and 322 restrict `ν ⊞ SC_t` to "compactly supported `ν` and initial
  spectra bounded uniformly in `n`"; lines 327–331 state the time change.
- R02 repaired: lines 135–137, "consumed from S1.2, not restated", two adapters kept.
- R03 repaired: lines 170–178 write the system and the open- and closed-chamber theorems;
  line 195 the Ornstein–Uhlenbeck system with "the two statements of §1.1".
- R04 repaired: `Suggested.lean` imports `Mathlib` and `TauCeti.Analysis.Matrix.SpectralMeasure`
  only; `matrixBrownianNoise` has its own body; gate `imports=0`.
- R05 repaired: four `### Examples`, `## Downstream consumers`, five API bullets in §2.1.
- R06 repaired: Convention 6.
- R07 repaired: lines 254–258 and 266 state every symmetric or Hermitian start and the reduction.

**Gate and build.** Gate at efc7944: every counter 0, `OK`. Nothing outside the folder
changes. `lake env lean` on `Suggested.lean`: two `sorry` warnings, nothing else. The branch
pins equal main's (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9). Dependency check output:
`depcheck: 234 roadmaps, 2264 edges, 0 problem(s)`; the merge order lists this roadmap directly
after StochasticCalculus.

**Signatures.** `#check @name` for the six declarations, elaborated once and compared with the
README: `matrixBrownianNoise` (`β n g`), `matrixBrownianNoise_isHermitian`, `matrixBrownian`
(`β n d B t ω`), `matrixBrownian_isHermitian`, `matrixBrownian_eigenvalues_strictAnti`
(`[MeasurableSpace Ω]`, `hβ`, `[IsProbabilityMeasure P]`, `hB`, `hindep`),
`matrixBrownian_hydrodynamic_limit` (`hd`, `hlog`, both probability instances, `hB`, `hindep`).
No binder lost; nothing changed.

**Padding probe.** The two sorried theorems are AGZ Theorem 4.3.2 and Proposition 4.3.10 with
Corollary 4.3.11; no single tactic or library lemma applies (library near-matches: no
declaration with either conclusion). The two proved Hermitian theorems are needed as terms in
both headlines.

**Headlines.** (1) Dyson's theorem: noncollision stated; the equation half is R01. (2) `β ≥ 1`
existence and uniqueness: R01. (3) Hydrodynamic limit: stated. (4) `ν ⊞ SC_t`: no free
convolution of measures at the pins; named in the docstring.

**Adversarial table.**

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| Convention 3 / §2.1 bracket | `tr(AH) = ⟨(2/(βn))A, H⟩` | `(2/(βn))² (βn/2) tr(AB) t = (2/(βn)) tr(AB) t` | agrees |
| `matrixBrownianNoise` vs AGZ Def. 4.3.1 | `β=1`: `g/√n`, diagonal `√2 g/√n`; `β=2`: `(g + i g̃)/√(2n)`, diagonal `g/√n` | variances `t/n`, `2t/n`; `t/n`, `t/n`, i.e. `2t/(βn)` on the diagonal | agrees with Convention 3 |
| Convention 6 | `G = −m` in `∂_t G = −G ∂_z G` | `−∂_t m = −m ∂_z m`; Pastur: `∂_t m (1 − t m_ν') = m m_ν'`, `∂_z m (1 − t m_ν') = m_ν'` | `∂_t m = m ∂_z m`, correct |
| §0.1 Checks 1, 2, Example | `u = (1,1)/√2`; `(1,1)`; inner product `2xy`; `u=(1,0), v=(1,1)` | `t`; `2t`; `[2W] = 2t` so `[W] = t/2`; `[B₁, B₁+B₂] = t = ⟨u,v⟩t` | correct |
| §1.1 `n = 1` | | `dλ = √(2/β) dB`, sum over `j ≠ i` empty | correct |
| §1.1 `n = 2` gap | `r = λ₁ − λ₂` | noise² `4/(βn)`, drift `2/(nr)`; dimension `1 + 2(2/n)/(4/(βn)) = β + 1`; hits 0 iff `β + 1 < 2` | correct; Example `β=2`: `dr = dW + r⁻¹ dt`, dimension 3 |
| §1.2 Checks | `n = 1`; general `n` | `(2/β)/(2·½) = 2/β` = variance of `exp(−βx²/4)`; `(βn)⁻¹ ∂ᵢ log p = n⁻¹ ∑ (xᵢ−xⱼ)⁻¹ − xᵢ/2` with `σ²/2 = 1/(βn)` | invariant; `β=2, n=1` gives `N(0,1)` |
| §2.1 Checks | `n=1, A=E₁₁`; `β=2, n=2, A=E₁₂+E₂₁`; `t=4` | `2t`, `t`; `(2/4)·2t = t`, `Var Re H₁₂ = t/4`; entry variance `4/n` | correct |
| §2.2 Checks | `n=2`; `∑λᵢ²` | drift `1/(2(λ₁−λ₂))`, `[λ₁+λ₂] = 4t/(βn) = 2t/β`; Itô drift `(2/n)·n(n−1)/2 + 2/β = n − 1 + 2/β` = entry count | correct |
| §2.2 Example | `β=1, n=2` | `[x−z] = 2t`, `[2y] = 4·t/2 = 2t`; gap `√2 ×` Bessel(2) | agrees with `β + 1` |
| §3.1 Checks | `δ₀`; sign `+G∂_zG` | `G = 1/(z − tG)` gives `tG² − zG + 1 = 0`; other sign `tG² + zG − 1 = 0`, expansion `1/z − t/z³` | correct |
| §3.2 Checks | `(δ₋₁+δ₁)/2`; `δ₀`; OU from `δ₀` | gap at 0 closes when `∫u⁻²dν = 1 = 1/t`; `tm² + zm + 1 = 0`; variance `e^(−t)(e^t − 1) = 1 − e^(−t)` | correct |
| §3.2 time change | `Y(t) = e^(−t/2) λ(e^t − 1)` | interaction `e^(−t/2)·e^t·e^(−t/2) = 1`; bracket of the new noise `∫₀^(e^t−1) (1+s)⁻¹ ds = t`; extra drift `−Y/2` | correct |
| `matrixBrownian_eigenvalues_strictAnti` | `n = 0, 1`; constant `d`; `β = 2` | at most one index: holds; coincident `d` allowed by Theorem 4.3.2; `∀ t > 0` inside `∀ᵐ` is the source's `P(∀t>0 …) = 1` | true as stated |
| `matrixBrownian_hydrodynamic_limit` | `t = 0`; `Im z < 0`; unrelated `B n` across `n`; non-measurable event | both sides `∫(z−x)⁻¹dν`; integrand bounded by `1/|Im z|`; in probability needs no coupling; outer measure is bounded by a measurable superset built from rational times | true as stated |
| R01 `dysonSystem_exists_unique` | `n = 0`, `n = 1`, two solutions | vacuous; `x + √(2/β)B`; Gronwall on a compact convex subset of the chamber | true as proposed |
| R01 `matrixBrownian_eigenvalues_dyson` | `n = 1`, `β = 1, 2` | `W = B₁₁` in both cases | true as proposed |

**Sources (seeded sample, all seven targets).** Read in the authors' online copy (id `agz`):
Definition 4.3.1 (line 12521); Theorem 4.3.2 with (4.3.3) (12556–12570) and the remark on
closed-chamber starts (12573); Lemma 4.3.3, `β ≥ 1`, strong solution in the open chamber and
weak uniqueness (12588–12591); Proposition 4.3.5, closed chamber, open at `t > 0`, continuity
in the start (12952–12957); Proposition 4.3.10 with (4.3.23)–(4.3.25) (13196–13220);
Corollary 4.3.11, `β = 1, 2`, real diagonal starts (13224–13229); Exercise 4.3.18 (13725);
Appendix H, Definitions H.3 and H.4 (21546, 21557). Hypotheses and conclusions agree with
§§0.1, 1.1, 2.1, 2.2, 3.1 after the order reversal of Convention 2. §3.2 rests on
RandomMatrices §§6.3 and 7.1, resolved below; §1.2 is R03.

**Library declarations opened at the pins.** `ProbabilityTheory.IsPreBrownianReal`
(`Mathlib/Probability/BrownianMotion/Basic.lean:75`) and `IsBrownianReal` (`:302`; adds almost
sure continuity only, no filtration); `MeasureTheory.levyProkhorovDist`
(`Mathlib/MeasureTheory/Measure/LevyProkhorovMetric.lean`); `Matrix.spectralMeasure`
(`TauCeti/Analysis/Matrix/SpectralMeasure.lean:115`, a `ProbabilityMeasure ℝ`);
`TauCeti.Probability.semicircleReal`
(`TauCeti/Probability/Distributions/Semicircle/LocationScale.lean:39`, centre and variance, so
`semicircleReal 0 t` has variance `t`).

**Cross-roadmap citations resolved.** RandomMatrices on main: Conventions 4 (line 110) and 5
(115), §§1.1 (274), 1.2 (308), 3.1–3.3 (485–512), 5.1 (662), 5.2 (682, weight
`exp(−βn∑xᵢ²/4)∏|xᵢ−xⱼ|^β`), 5.3 (703, beta densities for every `β > 0`), 6.3 (809, compact
support), 7.1 (864, bounded norm, Pastur equation); the same numbers hold at the head of its
open revision. StochasticCalculus at its open head: S1.2 (893), S1.3 (953), S3.2–S3.4
(1456–1559), S4.1–S4.3 (1668–1774), S5.1 (1834), S5.5 (1923), S9.1 (2901), S9.2 (2972);
`timeMeasure`, `IsFilteredBrownian` in its `Suggested.lean`.

**Ownership.** `roadmaps grep` for Dyson Brownian motion, matrix Brownian motion, the Burgers
equation and the Pastur equation: this folder and RandomMatrices only. RandomMatrices on main
still has Layer 10 with the same targets; its open revision deletes that layer and names this
roadmap as owner (its README lines 39–42), and the description's dependency block names that
revision as merging first. With that order there is one owner. The overlap report lists no
dropped or revision-only id.

## Not verifiable

- Potters–Bouchaud chs. 8–9: behind a paywall, no legal copy found. Cited for orientation; no
  target rests on it alone.
- Tao §3.1: not reopened this round; no target rests on it alone.
- Printed page numbers of AGZ: the copy read is the authors' online version; the README cites
  by theorem number.

## Source issues

- **Error** in agz at Exercise 4.3.9, printed page 263 of the online copy: the source says the matrix process has drift `−X dt` and is stationary from `H(1)`; it should be drift `−X/2 dt`, as in (4.3.40); affects nothing.
- **Misprint** in agz at Exercise 4.3.18, printed page 275 of the online copy: the source says the hint is to use "Lemma 4.3.25", which does not exist; it should be equation (4.3.25); affects nothing.
- **Misprint** in agz at Corollary 4.3.11, printed page 265: the source says the first eigenvalue is evaluated at `T` and omits a closing bracket; it should be evaluated at `t`, with the bracket closed; affects nothing.
