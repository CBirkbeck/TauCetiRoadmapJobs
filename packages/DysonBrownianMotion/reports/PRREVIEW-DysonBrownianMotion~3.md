# Review of DysonBrownianMotion (pull request #2118 at 54a3228)

**Verdict:** needs changes

This is an incremental re-review of the 115 lines changed since efc7944. There are two findings,
one P2 and one P3. All four findings of the previous review are repaired. The P2 comes from the
previous review's own R01 repair text. That text listed closed-chamber starts as not statable at
the pins, and the head copied it. The claim is wrong, and with it Dyson's original case
`H(0) = 0` drops out of `Suggested.lean`.

## R01 (P2) — the eigenvalue equation and the particle system from coincident starts are statable but not stated

**Location.** `TauCetiRoadmap/DysonBrownianMotion/Suggested.lean` lines 21–24 say that
"starts in the closed chamber (AGZ Proposition 4.3.5): they need a filtration-relative Brownian
predicate and a weak-solution notion, which StochasticCalculus supplies and the pins do not
have". Line 45 has `(∀ t, StrictAnti (X t ω))`, line 55 `(hx : StrictAnti x)` and line 121
`(hd : StrictAnti d)`.

**Claim.** Without a filtration, the Dyson system and Dyson's theorem from a start with
coincident coordinates cannot be stated.

**Witness.** AGZ Theorem 4.3.2 allows coincident starts (agz line 12573), and drift
integrability is Definition H.3(iii) (line 21553). For `n = 2`, `β = 2`, `d = 0` the gap is
BES(3) from 0, with `E∫₀ᵗ r⁻¹ ds = 2√(2t/π) < ∞`.

**Details.** Dyson's own case is `X(0) = 0` (agz line 12553). In the instance above the gap is
`√((g₁₁−g₂₂)²/2 + g₁₂² + g₂₁²)`, and the Dyson system gives `dr = dW + r⁻¹ dt` for it. The
statement holds, but `hd` excludes it. Integrability of the drift can be stated with
`IntervalIntegrable`.

Pathwise uniqueness from the closed chamber also needs no adaptedness. Let `F` be the drift, and
for `x, y` in the open chamber write `aᵢⱼ = xᵢ − xⱼ` and `bᵢⱼ = yᵢ − yⱼ`. Then
`⟨F(x) − F(y), x − y⟩ = −n⁻¹ ∑_{i<j} (aᵢⱼ − bᵢⱼ)²/(aᵢⱼ bᵢⱼ) ≤ 0`; for `x = (2,0)`, `y = (1,0)`,
`n = 2` both sides are `−1/4`. Take two solutions driven by the same path. `D = X − Y` is the
integral of an `L¹` function, so `|D(t)|² = 2∫₀ᵗ ⟨D, F(X) − F(Y)⟩ ds ≤ 0`. Existence is AGZ
Proposition 4.3.5 (strong, hence with (iii)). The matrix case follows from Theorem 4.3.2 by the
argument that already gives `W` on the same space for distinct starts: `W` is a functional of
the eigenvalue path.

**Repair.** Replace `IsDysonSolution` by the following and keep its name and docstring. Its
first line becomes "A continuous process, in the open chamber at positive times, solving the
Dyson system … with integrable drift."

```lean
def IsDysonSolution [MeasurableSpace Ω] (β : ℝ) (n : ℕ) (x : Fin n → ℝ) (P : Measure Ω)
    (B : Fin n → ℝ≥0 → Ω → ℝ) (X : ℝ≥0 → Ω → Fin n → ℝ) : Prop :=
  ∀ᵐ ω ∂P, Continuous (fun t ↦ X t ω) ∧ (∀ t, 0 < t → StrictAnti (X t ω)) ∧
    ∀ (t : ℝ≥0) (i : Fin n),
      IntervalIntegrable (fun s : ℝ ↦ ∑ j ∈ Finset.univ.erase i,
        (X s.toNNReal ω i - X s.toNNReal ω j)⁻¹) volume 0 t ∧
      X t ω i = x i + Real.sqrt (2 / (β * n)) * B i t ω +
        ∫ s in (0 : ℝ)..t, (n : ℝ)⁻¹ * ∑ j ∈ Finset.univ.erase i,
          (X s.toNNReal ω i - X s.toNNReal ω j)⁻¹
```

Then make these edits:

- In `dysonSystem_exists_unique`, change `hx` to `(hx : Antitone x)`, cite "AGZ Lemma 4.3.3
  and Proposition 4.3.5", and drop "and closed-chamber starts" from its docstring.
- In `matrixBrownian_eigenvalues_dyson`, change `hd` to `(hd : Antitone d)`. Do not drop it: for
  `d = (0, 1)` the eigenvalues at time 0 are `(1, 0) ≠ d`. Its docstring becomes "the case of a
  real diagonal start with decreasing entries".
- Delete "and starts in the closed chamber (AGZ Proposition 4.3.5)" from the module docstring,
  and change both "strictly ordered" on line 13 to "ordered".
- In README §1.1, change "states the open-chamber case" to "states both cases". Replace the
  Gronwall sentence with the monotonicity identity above, which covers both cases.
- In README §2.2, change "from a strictly ordered start" to "from a start with decreasing
  entries, coincident ones included".
- Drop "and closed-chamber starts" from the pull-request description.

I tested this text. The definition and both theorems elaborate at the pins, appended to the file,
with `sorry` as the only warning, and `#check @` shows every binder kept. On the refuting
instance `d = (0, 0)` the new clauses hold: `X 0 = (0, 0)` is no longer required to be strictly
ordered, and the drift integral is finite. For a strictly ordered start the new definition is
equivalent to the current one, because the integrand is continuous on `[0, t]`. So nothing that
is stated now is lost. `matrixBrownian_eigenvalues_strictAnti` stays as it is, since it covers
unsorted `d` as well.

## R02 (P3) — the description's Layer 0 entry still lists S9.1–S9.2

**Location.** The Content list of the pull-request description says "**Layer 0.** Consumes
StochasticCalculus (S1.2–S1.3, S3.2–S3.4, S4.1–S4.3, S5.1, S5.5, S9.1–S9.2)".

**Claim.** The description matches what Layer 0 consumes at the head.

**Witness.** At the head, README lines 99, 145 and 164 all list `S9.1–S9.3`, and lines 136–137
add "weak solutions and uniqueness in law from pathwise uniqueness (S9.3)".

**Repair.** Change "S9.1–S9.2" to "S9.1–S9.3" in that sentence.

## Previous findings

- R01 — repaired: `Suggested.lean` lines 43–61 and 120–128 state `IsDysonSolution`,
  `dysonSystem_exists_unique` and `matrixBrownian_eigenvalues_dyson` as proposed. README lines
  184–189 and 279–282 name them, and the Itô-integral bullet is gone. Its closed-chamber exclusion
  is this report's R01.
- R02 — repaired: lines 44–45 read "and weak solutions with uniqueness in law from pathwise
  uniqueness (S9.3)", and S9.3 also appears at lines 99, 137, 145 and 164.
- R03 — repaired: lines 207–208 read "(AGZ, proof of Lemma 4.3.17: the system (4.3.40) at
  `t = 1` is this one, and the generator computation there gives stationarity)", and line 168
  lists it.
- R04 — repaired: lines 313–314 read "with the systems of all sizes defined on one probability
  space with no assumption on their joint law (AGZ Proposition 4.3.10 assumes none)", and line
  319 adds the in-probability sentence.

## Verified sound

**Gate and build.** I ran the gate command of the brief on 54a3228. Every counter is 0 except
`depcheck=1`: "NOT IN ORDER: DysonBrownianMotion (insert it after its last supplier)". The
configured board order file does not list this roadmap yet. Under the brief's rule a roadmap
not yet in the order is placed after its last supplier, so this is not a finding; the worker's
gate on the candidate order passes. Nothing outside the folder changes (`git diff --stat` is
empty). `lake env lean` on `Suggested.lean` gives four `sorry` warnings (lines 54, 109, 120, 139)
and nothing else. The branch pins equal main's: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`.
Dependency check against the candidate order, which lists this roadmap at line 213 directly
after StochasticCalculus at 212:

```text
depcheck: 234 roadmaps, 2264 edges, 0 problem(s)
```

**Signatures.** I ran `#check @name` on all nine declarations in one scratch file and compared
each with the README. The two new theorems keep `[MeasurableSpace Ω]`, `hβ`, `hx`/`hd`,
`[IsProbabilityMeasure P]`, `hB` and `hindep`. `IsDysonSolution` takes
`[MeasurableSpace Ω] β n x P B X`. The other six are unchanged from the previous report. No
binder was lost.

**Padding probe.** On a scratch copy, `simp [IsDysonSolution]` leaves both new theorems open,
and `exact?` finds only the file's own sorried declarations. These are AGZ Lemma 4.3.3 and
Theorem 4.3.2, so neither is padding.

**Headlines.** There are four:
1. Dyson's theorem. Noncollision is stated from every real diagonal start; the equation only
   from strictly ordered starts (R01).
2. Existence and uniqueness for `β ≥ 1`. Stated from the open chamber only (R01).
3. The hydrodynamic limit. Stated.
4. `ν ⊞ SC_t`. Named in the docstring as not statable, since the pins have no free convolution
   of measures.

The docstring gives a reason for adaptedness and uniqueness in law: they need a
filtration-relative Brownian predicate. That reason holds in AGZ's sense, because Definitions
H.3 and H.4 carry a filtration, and the pins attach none to `IsBrownianReal`
(`Mathlib/Probability/BrownianMotion/Basic.lean:302`). So that part of the bullet stands.

**Adversarial table.** Rows for the changed statements, with computed values:

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| `IsDysonSolution` | `n = 0`; `n = 1`; `t = 0`; junk integral | `Fin 0`: every clause is trivial. `n = 1`: the sum over `univ.erase 0` is empty, so `X = x + √(2/β)B`. `t = 0`: `X 0 = x + σ·B 0 = x` a.s. by `IsPreBrownianReal.eval_zero_ae_eq_zero` (`Basic.lean:99`). The integrand is continuous on `[0,t]` (continuous path in the open chamber), so the integral has no junk value. `√(2/(β·0)) = 0` only when `n = 0`. | sound |
| `IsDysonSolution`, start `(0,0)` | `StrictAnti` at `t = 0` | `0 > 0` is false, so no solution exists from a coincident start | R01 |
| `dysonSystem_exists_unique`, existence | `n = 1`; `n = 2`, `β = 1`; `β = 1/2` | `X = x + √(2/β)B`. Gap: `dr = √2 dW + r⁻¹dt`, `r = √2ρ`, ρ is BES(2) and never hits 0. At `β = 1/2` the dimension is `3/2 < 2`, the gap hits 0 a.s., and no solution stays in the chamber, so `hβ` is sharp. | true |
| `dysonSystem_exists_unique`, uniqueness | two solutions on `[0,T]`, no measurability | The union of the images is compact in the open chamber, where the drift is `C¹` and hence Lipschitz. Gronwall on `D = ∫(F(X)−F(Y))` gives `D = 0`. | true for all `X, Y` as quantified |
| `matrixBrownian_eigenvalues_dyson` | `n = 1`, `β = 1, 2` | `λ = d + √2B₁₁` with `σ = √2`, and `λ = d + B₁₁` with `σ = 1`. In both cases `W = B₁₁`. | true |
| same | `n = 2`, `β = 1`, `d = (1,0)` | `H = [[1+g₁₁, g₁₂/√2],[g₁₂/√2, g₂₂]]`. The gap is `√((1+g₁₁−g₂₂)² + 2g₁₂²)`, i.e. √2 times BES(2) from `1/√2`, which matches `dr = √2 dW + r⁻¹dt`. The bracket of the trace is `2t` on both sides. `Fin.cast` uses `card (Fin n) = n`, and `eigenvalues₀ (diag d) = d` for decreasing `d`. | true |
| same | `n = 2`, `β = 2`, `d = (0,0)` | The gap is BES(3) from 0 and `E∫₀ᵗ r⁻¹ = 2√(2t/π)`. True, but excluded by `hd`. | R01 |
| R01 repair | `x = (2,0)`, `y = (1,0)`, `n = 2`; strictly ordered start | `⟨F(x)−F(y), x−y⟩ = −1/4 = −n⁻¹(a−b)²/(ab)`. For strictly ordered starts the new clauses follow from the old ones. | extends the current statements |
| §1.2 locator (changed) | (4.3.40) at `t = 1` | Noise `√(2/(βN))`, interaction `1/N`, drift `−u/2`, density `∏|λᵢ−λⱼ|^β ∏e^(−Nβλᵢ²/4)` (agz lines 13547–13557). These are the coefficients of §1.2 and the §5.3 weight. | agrees |
| §3.1 coupling (changed) | a.s. versus in probability | AGZ Prop. 4.3.10 fixes one space and no joint law (agz lines 13208–13210). `P{∃t≤T, d(L_n(t),μ_t) > ε}` depends only on the law of size `n`. | agrees |

Rows carried forward from the previous report for untouched statements, with the values it
computed:

| Statement | Values (previous report) | Result |
|---|---|---|
| Convention 3 / §2.1 bracket | `(2/(βn))² (βn/2) tr(AB) t = (2/(βn)) tr(AB) t` | agrees |
| `matrixBrownianNoise` vs AGZ Def. 4.3.1 | Off-diagonal variance `t/n` for both β; diagonal `2t/n` (`β = 1`) and `t/n` (`β = 2`) | agrees |
| Convention 6 | `G = −m` turns `∂_t G = −G∂_zG` into `∂_t m = m∂_z m`, the Pastur derivative | correct |
| §0.1 Checks, Example | `t`; `2t`; `[B/√2] = t/2`; `[B₁, B₁+B₂] = t` | correct |
| §1.1 `n = 1`, `n = 2` Checks | Empty sum; dimension `1 + 2(2/n)/(4/(βn)) = β + 1` | correct |
| §1.2 Checks | `(2/β)/(2·½) = 2/β`; drift `= (βn)⁻¹∇log p`; at `β = 2, n = 1`, `N(0,1)` | correct |
| §2.1 Checks | `2t`, `t`; `(2/4)·2t = t`; `Var Re H₁₂ = t/4` | correct |
| §2.2 Checks, Example | Drift `1/(2(λ₁−λ₂))`; `n − 1 + 2/β`; gap √2·BES(2) | correct |
| §3.1, §3.2 Checks, time change | `tG² − zG + 1 = 0`; merge at `t = 1`; `1 − e^(−t)`; interaction `e^(−t/2)·e^t·e^(−t/2) = 1` | correct |
| `matrixBrownian_eigenvalues_strictAnti` | `n = 0, 1`; coincident `d` allowed by Theorem 4.3.2 | true |
| `matrixBrownian_hydrodynamic_limit` | `t = 0`; integrand bounded by `1/|Im z|`; no coupling needed | true |

**Sources, seeded sample.** I read these in the authors' online copy (`agz`); printed page =
file page − 14.

- §0.1: Definition H.3, agz lines 21546–21556, p. 464.
- §0.1: Definition H.4, lines 21557–21561.
- §1.1: Lemma 4.3.3, lines 12588–12591, p. 252. Hypotheses `β ≥ 1` and open chamber; strong
  solution in `C(ℝ₊, Δ_N)`; weak uniqueness.
- §1.1: Proposition 4.3.5, lines 12952–12957, pp. 259–260. Closed chamber, open at `t > 0`,
  continuous in the start.
- §1.2: proof of Lemma 4.3.17, lines 13540–13574, pp. 270–272.
- §2.1: Definition 4.3.1, lines 12521–12534, p. 250.
- §2.2: Theorem 4.3.2 and the remark after it, lines 12556–12575, p. 251; coincident starts
  in the proof, lines 12936–12949.
- §3.1: Proposition 4.3.10, lines 13196–13220, p. 264.
- §3.1: Corollary 4.3.11, lines 13224–13229, p. 265.
- §3.2 is unchanged and rests on RandomMatrices §§6.3 and 7.1, which resolve as listed below.

After Convention 2's order reversal, hypotheses and conclusions agree with the README.
StochasticCalculus S9.3 is at its open head (README line 2990): weak solutions, uniqueness in law
and "both Yamada–Watanabe conclusions".

**Library declarations opened at the pins.**
- `ProbabilityTheory.IsPreBrownianReal` (`Mathlib/Probability/BrownianMotion/Basic.lean:75`; finite-dimensional laws only).
- `IsPreBrownianReal.eval_zero_ae_eq_zero` (`:99`).
- `IsBrownianReal` (`:302`; adds a.s. continuity, no filtration).
- `MeasureTheory.Filtration.natural` (`Mathlib/Probability/Process/Filtration.lean:435`; needs `StronglyMeasurable`, which `IsBrownianReal` does not give).
- `MeasureTheory.Adapted` (`Mathlib/Probability/Process/Adapted.lean:59`).

**Cross-roadmap citations resolved.**
- StochasticCalculus at its open head: S1.2 (893), S1.3 (953), S3.2–S3.4 (1456, 1540, 1559),
  S4.1–S4.3 (1668, 1727, 1774), S5.1 (1834), S5.5 (1923), S9.1–S9.3 (2901, 2972, 2990).
- StochasticCalculus `Suggested.lean`: `IsFilteredBrownian` (53), `timeMeasure` (87),
  `IsStrongSolution` (596).
- RandomMatrices on main: §§1.1, 1.2, 3.1–3.3, 4.3, 5.1–5.3, 6.3, 7.1 at lines 274, 308,
  485–512, 613, 662–703, 809 and 864.
- RandomMatrices at its open revision: the same numbers. That revision replaces the old Layer 10
  and names this roadmap as owner of Dyson Brownian motion (its lines 39–42).
- The overlap report lists no dropped or revision-only id.

**Ownership.** `roadmaps grep` for `IsDysonSolution`, the Dyson system or process,
`dysonSystem` and `eigenvalues_dyson` over main and all open heads finds only this folder and the
RandomMatrices revision's pointer to it.

**Remark on untouched text** (no change requested): `Suggested.lean` line 105, from efc7944, is
125 characters long.

## Not verifiable

- Potters–Bouchaud chs. 8–9: paywalled, and no legal copy found. Cited for orientation only.
- Tao §3.1: not reopened in this incremental round; no changed passage rests on it.

## Source issues

- **Error** in agz at Exercise 4.3.9(a)–(b), printed page 263: the source gives the matrix process drift `−X dt` and says it is stationary from `H(1)`; it should be drift `−X/2 dt`, as in (4.3.40) at `t = 1`; affects nothing.
- **Misprint** in agz at Exercise 4.3.9(b)–(c), printed page 263: the source calls the unscaled law `P_N^(β)`, with weight `e^(−βx²/4)`, stationary for the `1/√N`-scaled system (4.3.21); it should be the rescaled law with weight `e^(−Nβx²/4)`, as in the proof of Lemma 4.3.17; affects nothing.
- **Misprint** in agz at Corollary 4.3.11, printed page 265: the source evaluates the first eigenvalue at `T` and leaves a bracket unclosed; it should be evaluated at `t`, with the bracket closed; affects nothing.
