# Repair of DiracScatteringAndNonlinearFourierTransform (design, round 7)

Findings of `REV-DESIGN-DiracScatteringAndNonlinearFourierTransform~6` (verdict `needs_changes`, one P2 and
four P3). Files edited: `packages/DiracScatteringAndNonlinearFourierTransform/design/README.md`,
`design/plan.json`, `sources.toml`. No `Suggested.lean` exists at the design stage.

## R01 (P2) — applied

Verified at the pins. Mathlib has `InformationTheory.klDiv` (`InformationTheory/KullbackLeibler/Basic.lean`
line 56) and `InformationTheory.mul_log_le_klDiv` (line 355). Tau Ceti has
`TauCeti.klDiv_eq_iSup_boundedContinuousFunction_integral_sub_integral_exp_sub_one` (line 457) and
`TauCeti.lowerSemicontinuous_klDiv_finiteMeasure` (line 499). `Circle` has Borel instances at
`MeasureTheory/Group/Circle.lean` lines 32 and 34. The identity `S = ν(X) − σ(X) − klDiv` agrees with
killipsimon2003 (5.9) line 1812–1828.

Old → new: the §6.7 definition `relativeEntropy` and its three API bullets → the notation
`S = ν(X) − σ(X) − klDiv σ ν`, with the three facts cited to the pinned declarations. The one target is now
the transport theorem `klDiv σ ν_{μ,β} = ν(X) − 1 − (1/π)∫ log w dΠ`, or `∞`. It has a route and six
recomputed Checks.

Also changed:

- §6.8: the route goes through the pinned lower semicontinuity, and its *Needs:* line now lists it.
- Scope: the Layer 6 bullet and the Mathlib and Tau Ceti deferrals.
- Supplier contracts: new entries under "From Mathlib" and "From Tau Ceti".
- plan.json: 6.7 is now `kind: theorem`, with new prerequisites; 6.8 has the new route and prerequisite.
- sources.toml: killipsimon2003 `cited_for` is now 6.7 only.

The repair differs from the suggested one in two places:

- The theorem adds the hypothesis `w > 0` almost everywhere. Without it Mathlib's `Real.log 0 = 0` makes
  the formula false: with `w = 0` on `[0, 1]`, `log w ≡ 0` is integrable, yet `klDiv = ∞`. This is now a
  Check.
- The title is "The entropy of the Poisson measure relative to a spectral measure", which matches the
  direction of `klDiv σ ν`.

## R02 (P3) — applied

Verified: mauth2022 line 4121–4125 (Theorem 6) is about convergence of `a(t, s)` against a Fourier integral.
Theorem 5 is at line 3820 and the proof of the main theorem at line 3851–3862.

Old → new: §9.8 "Theorem 6 line 4121 for the equivalence with the absence of resonances" → "Theorem 5 line
3820 with the proof at line 3851–3862 for the reduction to the absence of resonances". The same change is in
plan.json 9.8 and in the sources.toml locator of mauth2022 (§3.8). Mauth's Theorem 6 is cited nowhere else.

## R03 (P3) — applied

Verified: taothiele2012 line 687–688 is the Plancherel exercise after Lemma 6. Lemma 1 (5), (7) is at line
225–240 and the linearisation at line 210–220.

Old → new: §5.6 "taothiele2012 line 687–688" → "taothiele2012 Lecture 1 Lemma 1 (5), (7) line 225–240 and
line 210–220". The same change is in plan.json 5.6. The References entry now lists Lecture 1 Lemma 1. No
other citation of lines 687–688 exists.

## R04 (P3) — applied

Verified: mauth2022 line 390–392 says only that the Poisson extension is harmonic.

Old → new: §2.2 now cites only garnett2007 Ch. I §3 (uncertified). "mauth2022 Lemma 3 line 390–392" moves
to the harmonicity bullet of §2.1. The same change is in plan.json 2.1 (locator and API statement) and 2.2
(locator source `garnett2007`). "2.2" is removed from mauth2022's `cited_for`. The other Lemma 3 citations
are taothiele2012 line 296 (§4.3) and poltoratski2024 line 729 (§8). I re-read both, and each states what it
is cited for.

## R05 (P3) — applied

Verified: Tau Ceti has `TauCeti.HardySpace` (`Analysis/Fourier/Hardy/Basic.lean` line 43). It also has disc
functions, the reproducing kernel, boundary uniqueness and `TauCeti.toeplitz` (`Hardy/Toeplitz.lean`).

Old → new: "H²(𝔻) and its Toeplitz operators to OperatorTheory (ToeplitzOperators T1)" → "H²(𝔻) to Tau Ceti
(`TauCeti.HardySpace`, …), and the further theory of those Toeplitz operators to
OperatorTheory/ToeplitzOperators, Layers 2–5; … none of these is consumed".

I also fixed the same line's locator. "ToeplitzOperators T1" matches no heading or id in the ToeplitzOperators
README on main, whose layers are numbered 1–6.

## Adversarial pass (changed statements)

Computed with plain Python: closed-form matrix exponentials and midpoint quadrature in `x = tan u`.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §6.7 `σ = C_*(Π/π)` is arc length | averages of `Re ζᵏ`, `k = 0..3` | `1.0000000000`, `−5·10⁻¹⁷`, `−4·10⁻¹⁷`, `−9·10⁻¹⁷` | holds | Check |
| §6.7 transport, free case | `μ = dx`, `β = 0` | `klDiv σ σ = 0`; formula `1 − 1 − 0 = 0` | holds | Check |
| §6.7 mass correction | `μ = 2dx` | `klDiv = 1 − log 2 = 0.306853` both sides; `S = 0.693147 = log ν(X)`; `−klDiv` would give `−0.306853` | holds | Check |
| §6.7 singular part | `μ = dx + δ₀`, `β = 0` | `ν = σ + δ_{−1}/π`, `llr = 0` σ-a.e., `klDiv = 1/π`; formula `(1 + 1/π) − 1 − 0 = 1/π` | holds | none |
| §6.7 atom at `1` | `μ = dx`, `β = 0.5` | `klDiv = 0 + 1.5 − 1 = 0.5`; formula `1.5 − 1 − 0` | holds | none |
| §6.7 point mass | `μ = 0`, `β = 1` | `σ(X∖{1}) = 1`, `ν(X∖{1}) = 0`, so `klDiv = ∞` | holds (second branch) | Check |
| §6.7 junk `log 0` | `w = 1_{ℝ∖[0,1]}` | Lean `log w ≡ 0`, integral `0`; `klDiv = ∞` | false without `w > 0` a.e. | hypothesis added, Check |
| §6.7 rectangular barrier | `f = 0.7` on `[0, 1.3]` | `Im m(i) = 0.5375390`, `(1/π)∫w dΠ = 0.5375388`; `2T − 2log|E(T,i)| = −0.9184663`, quadrature `−0.9184666`; `klDiv = 0.456005 ≥ 0.158293` | holds | Check |
| §6.7 non-continuity | `νₙ = (1 + sin 3θ)dθ/2π` | mean of `log(1 + sin 3θ)` `= −0.693144`; `klDiv σ νₙ = log 2`; formula `1 − 1 + log 2` | holds | Check |
| Gibbs bound ↔ KS Lemma 5.1 | `σ(X) = 1`, `ν(X) = 0.5, 1, 2, 5` | `ν(X) − 1 − log ν(X) = 0.193, 0, 0.307, 2.391 ≥ 0`, equality only at `ν = 2σ` scale | holds | none |
| Variational ↔ KS Theorem 5.2 | `F = e^f` | `∫e^f dν − ∫(1+f)dσ = ∫(e^f−1)dν − ∫f dσ + ν(X) − σ(X)`, so `inf = ν(X) − σ(X) − klDiv` | holds | none |
| §6.8 new route | barrier above | `klDiv σ ν_T = 0.456 ≤ 0.5375 − 1 + 1.3863 + 0.637 = 1.561`; `∫log w dΠ = −2.885 ≥ −6.356` | holds | none |
| §6.8 hypotheses of pinned LSC | `Circle` | pseudometrizable (metric), Borel (lines 32, 34), compact; `σ` fixed; mass of `ν_T` continuous | in scope | none |

## Checks

- Dependency check, final run:

  ```
  candidate: DiracScatteringAndNonlinearFourierTransform is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
  depcheck: 245 roadmaps, 2230 edges, 0 problem(s)
  ```

  There is no UPWARD or CYCLE line.
- `roadmaps resolve` on the README found no cross-roadmap citation and no Lean name missing everywhere. That
  tool did not check Lean names outside TauCetiRoadmap, so I opened each new pinned name at its file and line:
  `InformationTheory.klDiv` 56, `klDiv_self` 74, `klDiv_of_not_ac` 66,
  `integral_llr_add_sub_measure_univ_nonneg` 147, `mul_log_le_klDiv` 355, `MeasureTheory.llr`
  (`LogLikelihoodRatio.lean` 37), `MeasureTheory.FiniteMeasure` (`FiniteMeasure.lean` 118), the Tau Ceti
  lines 457 and 499, and `TauCeti.HardySpace` 43.
- `Suggested.lean` does not exist at the design stage, so the `#check` comparison was not run.
- plan.json parses. Its diff touches only targets 2.1, 2.2, 5.6, 6.7, 6.8 and 9.8.

## For the maintainer

- §6.7 now owns only the transport identity. The relative entropy itself, its bound, its variational formula
  and its semicontinuity are cited from Mathlib and Tau Ceti. Ownership by object, checked with
  `roadmaps grep 'klDiv|relative entropy'` over main and the open heads. The open MathematicalStatistics*
  and ClassicalErgodicTheory roadmaps, and OptimalTransport, Subfactors and TypeAHeckeAlgebras on main,
  either consume `klDiv` or define unrelated entropies. None states this transport.
- No name that other roadmaps cite changed. The plan name of 6.7 changed from `relativeEntropy` to
  `klDiv_cayley_poissonMeasure_spectralMeasure`; no Lean file declares either.
- No source was fetched, and `needs-references.toml` was not written.
- Other roadmaps cite "ToeplitzOperators T3/T5" (BanachAlgebras, IndexTheory). Those ids are not headings of
  the ToeplitzOperators README on main. This is outside this package.
