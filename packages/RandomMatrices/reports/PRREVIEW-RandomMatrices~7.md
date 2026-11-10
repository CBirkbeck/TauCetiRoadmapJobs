# Review of RandomMatrices (pull request #1971 at 0df60c1)

**Verdict:** needs changes

Incremental re-review of the 122 lines changed since 5d55d20. The new Layer 8 section of `Suggested.lean` is sound: the six declarations elaborate, the two limits are correctly normalised, and the docstring's two rewritten bullets give reasons that hold. The gate still fails on the two items carried from main (R01, R02). Outside §8.4 the folder is unchanged, so R03–R08 carry in whole or in part. R09 and R10 are small defects in the text this head adds; both come from wording the previous report proposed, which I should have checked more closely then.

## R01 (P1) — Layer 8 takes its configuration spaces from PointProcesses, which may not be cited as a supplier

Location: `TauCetiRoadmap/RandomMatrices/README.md` lines 64–70, 175, 213, 963, 969, 1008, 1010, 1022–1023 and 1110. Line 963: "Laplace-functional uniqueness and weak convergence of laws from PointProcesses Layers 0–6 at `S = ℝ` and `S = ℂ`".

Claim: unchanged since 5d55d20. The gate's `dropped` check fails on these 10 lines, and the configuration spaces, Laplace-functional determination, correlation functions and weak convergence that §§8.1, 8.3 and 8.4 use have no admissible owner.

Witness: gate at this head, `dropped=10`; the pinned Mathlib and Tau Ceti have no `PointMeasure` or `LocallyFiniteMeasure` (grep).

Repair, as before, one of two:
- Add a §8.0 "Configuration spaces on ℝ and ℂ" that owns what §§8.1–8.4 use, each as a target with a locator (AGZ §4.2, Definitions 4.2.1 and 4.2.3, Lemma 4.2.5): locally finite integer-valued measures with the vague topology and measurability of `N ↦ N(B)`; correlation functions relative to Lebesgue measure; determination of a law by its Laplace functionals on nonnegative `C_c` functions; convergence in law from convergence of those functionals. Then write "§8.0" for "PointProcesses Layers 0–6" at lines 963, 969, 1008, 1010, 1022–1023 and 1110 and in the diagram at line 213, and delete lines 64–70 and 175.
- Or restate the process conclusions of §§8.1, 8.3 and 8.4 as convergence of joint count laws on bounded Borel sets and of gap probabilities (the form of AGZ Theorems 3.1.1 and 3.1.4, which `gue_bulk_gap` and `gue_largest_eigenvalue_tracyWidom` now already have), and drop the `PointMeasure` statements.

Either takes `dropped` to 0.

## R02 (P2) — the dependency check reports Layer 10's StochasticCalculus edge as UPWARD

Location: README line 1218 ("*Needs:* StochasticCalculus S1.2–S1.3, S3.2–S3.4, S4.1–S4.3, S5.1, S5.5, S9.1–S9.2") and line 1269.

Claim: unchanged since 5d55d20. RandomMatrices is on main and StochasticCalculus is not, so the gate fails on this edge for every change to the folder.

Witness: `UPWARD: RandomMatrices (on main) -> StochasticCalculus (#212) at README lines [1218, 1269]`, then `depcheck: 234 roadmaps, 2271 edges, 1 problem(s)`.

Repair, one of two:
- In a separate pull request, move Layer 10 to a "RandomMatrices, Part II" (Dyson Brownian motion) placed after StochasticCalculus; in this folder replace Layer 10 by one Scope sentence deferring §§10.1–10.4 to it, and delete the Layer 10 diagram line, the Layer 10 clause of "How to read the build" and the StochasticCalculus rows of Scope and of the supplier contracts (lines 187–188).
- Or obtain a human waiver of this exact line. The edge predates this pull request, and the rule fires only because the consumer is already on main.

## R03 (P2) — the largest-eigenvalue large deviation principle is statable at the pins and is still absent

Location: `TauCetiRoadmap/RandomMatrices/Suggested.lean` lines 29–31: "the large deviation principles at speed `n²` for the beta-gas empirical measure and at speed `n` for the Gaussian largest eigenvalue: Mathlib has no large deviation principle and no logarithmic energy of a probability measure".

Claim: the edge limit and the bulk gap of the previous R03 are now stated. The third headline it named is not. The speed-`n` principle of §9.5 needs neither a library LDP nor a logarithmic energy: a large deviation principle is a predicate (AGZ Definition D.1), and the rate `J_β` is an explicit integral. The bullet names a missing carrier where none is missing.

Witness: appended to a scratch copy of this head's file, the following elaborates under the defaults with `sorry` as the only warning.

```lean
/-- A large deviation principle at speed `a` with rate `I` (AGZ Definition D.1). -/
def LargeDeviationPrinciple {X : Type*} [TopologicalSpace X] [MeasurableSpace X]
    (μ : ℕ → Measure X) (a : ℕ → ℝ) (I : X → ℝ≥0∞) : Prop :=
  LowerSemicontinuous I ∧
    (∀ F : Set X, IsClosed F →
      limsup (fun n ↦ ((a n)⁻¹ : ℝ) * ENNReal.log (μ n F)) atTop ≤ -(⨅ x ∈ F, (I x : EReal))) ∧
    ∀ U : Set X, IsOpen U →
      -(⨅ x ∈ U, (I x : EReal)) ≤ liminf (fun n ↦ ((a n)⁻¹ : ℝ) * ENNReal.log (μ n U)) atTop

theorem gaussianEnsemble_largest_eigenvalue_ldp (β : ℕ) (hβ : β = 1 ∨ β = 2)
    (P : Measure Ω) [IsProbabilityMeasure P] (G : ∀ n : ℕ, Ω → Fin (n + 1) × Fin (n + 1) → ℝ)
    (hG : ∀ n, HasLaw (G n) (Measure.pi fun _ ↦ gaussianReal 0 1) P) :
    LargeDeviationPrinciple
      (fun n ↦ P.map fun ω ↦ ⨆ i, (gaussianEnsemble_isHermitian β (n + 1) (G n ω)).eigenvalues i)
      (fun n ↦ ((n + 1 : ℕ) : ℝ))
      (fun x ↦ if 2 ≤ x then
        ENNReal.ofReal ((β : ℝ) / 2 * ∫ t in (2 : ℝ)..x, Real.sqrt (t ^ 2 - 4)) else ⊤) := by
  sorry
```

Repair: add these two declarations under a `/-! ## Layer 9: large deviations -/` comment, name them in README §§9.1 and 9.5, and cut the bullet at lines 29–31 down to the speed-`n²` empirical-measure principle with the reason that holds for it (the logarithmic energy `E_V` of §9.2 as a lower-semicontinuous functional on probability measures), or state that one too once `E_V` is written as in AGZ (2.6.4)–(2.6.5).

## R04 (P3) — five definitions still have two Checks

Location: the eigenvalue point process, §8.1 (lines 971–974); the ensemble kernels, §8.2 (lines 985–989); the Pfaffian, §8.5 (lines 1079–1083); logarithmic capacity, §9.4 (lines 1167–1171); the `β ≥ 1` Dyson process, §10.3 (lines 1247–1251).

Claim: the §8.4 part of the previous R04 is repaired (`F₂` has its own Checks, and Airy's equation is written in `x`). The other five lists are unchanged.

Witness: the lines cited, two bullets each.

Repair: add one discriminating Check to each (values computed in the previous report):
- §8.1: `diag(1,1)` gives the process `2δ₁`, of mass 2; a definition through distinct eigenvalues gives `δ₁`.
- §8.2: the CUE kernel `(2π)⁻¹ ∑_{k<n} e^{ik(θ−φ)}` has `K(θ,θ) = n/(2π)` and `∫₀^{2π} K(θ,θ) dθ = n`; at `n = 2` these are `1/π` and `2`.
- §8.5: `Pf(BABᵀ) = det B · Pf A`; for `A = [[0,1],[−1,0]]`, `B = diag(2,1)`: `Pf [[0,2],[−2,0]] = 2 = 2 · 1`.
- §9.4: `cap(cE) = c · cap(E)` for `c > 0`, so `cap[0,1] = 1/4`; a finite set has capacity `0`.
- §10.3: at `n = 2` the gap `r = λ₁ − λ₂` solves `dr = √(4/(βn)) dW + (2/(nr)) dt`, a scaled Bessel process of dimension `β + 1`, which avoids `0` exactly when `β ≥ 1`.

## R05 (P3) — two headlines are narrower than the theorems they cite

Location: `wigner_semicircle_ae`, `Suggested.lean` lines 149–159 (binders `hmean`, `hdiag`) and README lines 625–628, citing "T Theorem 2.4.2; Bai 1999, Theorem 2.1"; `least_singular_value`, `Suggested.lean` lines 375–383 and README lines 1282–1285, citing Rudelson–Vershynin 2008, Theorem 1.2.

Claim: unchanged since 5d55d20. Bai's Theorem 2.1 needs neither centring nor a moment condition on the diagonal; RV2008 Theorem 1.2 takes independent centred entries of variance at least 1 with i.i.d. rows, not identically distributed entries.

Witness: Bai1999 lines 125–129; RV2008 lines 117–124. Instance: column `j` with law `N(0, 1 + (j mod 2))` is covered by RV2008 Theorem 1.2 and excluded by `HasLaw (ξ ij) ν P` for a single `ν`.

Repair: for the semicircle law either state Bai's form (drop `hmean` and `hdiag`, replace `hvar` by `∫ z, ‖z − ∫ w, w ∂ν‖ ^ 2 ∂ν = 1`) or keep the binders and cite Tao Theorem 2.4.2 alone. For the least singular value, quantify over independent entries whose rows are i.i.d. copies with `1 ≤ ∫ x, x ^ 2 ∂νⱼ`, and keep the i.i.d. unit-variance case as a README Check.

## R06 (P3) — §6.4 is narrower than AGZ Lemma 5.3.32, and FreeProbability F6 on main states the general form

Location: README lines 838–843: "the free central limit theorem for freely independent identically distributed bounded centred self-adjoint variables of variance 1"; no claim-level locator.

Claim: unchanged since 5d55d20. AGZ Lemma 5.3.32 needs uniformly bounded moments, `φ(aᵢ) = 0` and `φ(aᵢ²) = 1`, not identical distribution.

Witness: AGZ lines 17752–17760. Instance: free centred variance-1 variables alternating between a standard semicircular and `(δ₋₁ + δ₁)/2` are covered by the lemma and not by §6.4.

Repair: state §6.4 at Lemma 5.3.32's generality with that locator, keep the i.i.d. case as a Check, give the free Poisson limit its locator (AGZ §5.3.3, the exercise at AGZ line 17611), and add one Scope sentence on what FreeProbability F1–F6 extends.

## R07 (P3) — claim-level locators missing or pointing at the wrong theorem

Location and claim: the §8.4 locators asked for are now in place (AGZ Theorems 3.1.1, 3.1.4–3.1.5, lines 1056–1058; see R09 for the bulk one). The rest is unchanged:
- §2.1 (lines 378–385): Bernstein's bound with the constant `3`, McDiarmid's sharp constant, Efron–Stein and the moment-generating-function definition of sub-exponential are in neither T nor AGZ (T line 3050 is McDiarmid with unspecified constants; T line 743 is a tail-bound definition).
- §4.3 (line 625): the triangular-array law cites AGZ Theorem 2.1.21, the i.i.d. case (AGZ lines 1169–1170); the Lindeberg condition is Bai Theorem 2.4 (Bai1999 lines 334–342).
- §9.1 (lines 1120–1124): the LDP, goodness, exponential tightness and the contraction principle are AGZ Appendix D (Definitions D.1–D.3, Theorem D.7, AGZ lines 20252–20344).
- §9.5 (lines 1175–1179): no locator; it is AGZ Theorem 2.6.6 (AGZ line 4131).
- Only the layer's Sources line: §3.1 (AGZ Theorem 2.4.3), §7.1 (AGZ Theorem 5.4.5), §8.3 (AGZ Lemma 4.2.13, Corollary 4.2.24, Theorem 4.2.25), §10.3 (AGZ Lemma 4.3.3, Proposition 4.3.5), §11.2 (T (2.179), Theorem 2.8.3).

Witness: the source lines given with each item.

Repair: put these locators in parentheses at each claim; write "(Bai 1999, Theorem 2.4)" at line 625; for §2.1 cite a text that states the sharp constants and add it to References.

## R08 (P3) — the Exchangeability link is broken and the citation names nothing

Location: README line 62, "[Exchangeability](../Exchangeability/README.md) owns exchangeability and conditional-i.i.d. representation theory", and line 174, "Exchangeability: the joint-law transport interface".

Claim: unchanged since 5d55d20. The roadmap is at `Completed/Exchangeability/README.md`, and "the joint-law transport interface" names no section or declaration; §0.2's *Needs:* line lists only Mathlib.

Witness: `TauCetiRoadmap/Exchangeability/README.md` does not exist at this head; `Completed/Exchangeability/` does.

Repair: link `../../Completed/Exchangeability/README.md`; then either name what §0.2 consumes in its *Needs:* line, or delete the supplier from lines 62–63 and 174.

## R09 (P3) — the bulk gap is stated for every `|E| < 2`, and its locator covers `E = 0` only

Location: README lines 1056–1058, "for `|E| < 2` and compact `A`, the probability that no eigenvalue scaled by `nρ_SC(E)(λ-E)` lies in `A` tends to `fredholmDet sineKernel A` (AGZ Theorem 3.1.1)", and the docstring of `gue_bulk_gap`, `Suggested.lean` lines 357–359.

Claim: AGZ Theorem 3.1.1 is the statement at the centre of the spectrum. For `c ≠ 0` AGZ gives a one-line remark after the theorem and the kernel convergence of Exercise 3.7.5. The statement is true as written (the scaling is checked in the table); the locator supports one value of `E`. The previous report proposed this locator; it was incomplete.

Witness: AGZ line 4549 (compact `A`, the points `√N λᵢ`, no `c`); AGZ line 4574 (the remark on `|c| < 2`); AGZ lines 7141–7148 (Exercise 3.7.5: limit kernel `sin(g(c)(x−y))/(π(x−y))`, `g(c) = √(4−c²)/2`).

Repair: in both places write "(AGZ Theorem 3.1.1 at `E = 0`; for `0 < |E| < 2`, the remark following it and Exercise 3.7.5, with the argument of §3.5)".

## R10 (P3) — the wrong model named in the new `F₂` Check does not fail both tests

Location: README lines 1065–1066: "A determinant on `L²(−∞,s)` fails both."

Claim: the two tests are true of `F₂`, but the sentence about the wrong model is not. On `(−∞,s)` the series does not converge, since `K_Ai(x,x) = Ai′(x)² − x Ai(x)² ~ √(−x)/π` as `x → −∞` and the `k = 1` term is already infinite. Read as the probability that the Airy process has no point below `s`, the value is `0` for every `s`: that satisfies "→ 0 as `s → −∞`" and fails only the bound. The previous report proposed this sentence; it was wrong.

Witness: `Ai(x) ≈ π^{−1/2}|x|^{−1/4} sin(ζ+π/4)`, `Ai′(x) ≈ −π^{−1/2}|x|^{1/4} cos(ζ+π/4)` give `Ai′² − x Ai² ≈ |x|^{1/2}/π`, so `∫_{−∞}^s K_Ai(x,x) dx = ∞`; with value `0`, `1 − 0 = 1 > ∫_s^∞ K_Ai(x,x) dx` for large `s`.

Repair: replace the sentence by "On `L²(−∞,s)` the series diverges, since `K_Ai(x,x) ~ √(−x)/π` as `x → −∞`; as a gap probability it is `0` for every `s`, which fails the bound and the limit `1` at `+∞`."

## Previous findings

- R01 — not repaired: line 963 still reads "Laplace-functional uniqueness and weak convergence of laws from PointProcesses Layers 0–6"; gate `dropped=10`. Carried as R01.
- R02 — not repaired: line 1218 still reads "*Needs:* StochasticCalculus S1.2–S1.3, S3.2–S3.4, …"; depcheck prints the UPWARD line. Carried as R02.
- R03 — partly repaired: `gue_largest_eigenvalue_tracyWidom` and `gue_bulk_gap` are stated and the `F₁` and point-process bullets give reasons that hold; lines 29–31 still call the speed-`n` principle unstatable. Carried as R03.
- R04 — partly repaired: §8.4 has "`F₂(s) → 0` as `s → −∞` … and `1 − F₂(s) ≤ ∫_s^∞ K_Ai(x,x) dx`" and "`Ai''(x) = x Ai(x)`"; §§8.1, 8.2, 8.5, 9.4, 10.3 keep two Checks. Carried as R04; the repair's last sentence is R10.
- R05 — not repaired: `wigner_semicircle_ae` keeps `hmean` and `hdiag` under "Bai 1999, Theorem 2.1"; `least_singular_value` keeps a single `ν`. Carried as R05.
- R06 — not repaired: line 838 still reads "freely independent identically distributed bounded centred self-adjoint variables of variance 1". Carried as R06.
- R07 — partly repaired: §8.4 now cites "(AGZ Theorems 3.1.4–3.1.5)" and "(AGZ Theorem 3.1.1)"; §§2.1, 3.1, 4.3, 7.1, 8.3, 9.1, 9.5, 10.3, 11.2 are unchanged. Carried as R07; the bulk locator is R09.
- R08 — not repaired: line 62 still links `../Exchangeability/README.md`. Carried as R08.

## Verified sound

**Scope of this round.** README lines 1042–1066 (§8.4) and `Suggested.lean` lines 16–17, 25–28 and 324–367, with what they cite. Everything else in the folder is byte-identical to 5d55d20 apart from `PROGRESS.md` and `STATUS.md`, which are main's generated files (the three-dot diff against main lists only `README.md` and `Suggested.lean`, and nothing outside the folder).

**Gate.** Run at this head: it fails only on `dropped=10` (R01) and `depcheck=1` (R02); every other counter is 0, including `readme-ids-missing`, `statement-hygiene`, `stray-files` and `outside-folder`. Depcheck output:

```text
UPWARD: RandomMatrices (on main) -> StochasticCalculus (#212) at README lines [1218, 1269]
depcheck: 234 roadmaps, 2271 edges, 1 problem(s)
```

**Build.** `lake env lean` on `Suggested.lean` exits 0 with 13 `sorry` warnings, one per headline, and nothing else.

**Signatures.** `#check @name` on the six new declarations in a scratch copy: `airyAi : ℝ → ℝ`, `airyKernel : ℝ → ℝ → ℝ`, `sineKernel : ℝ → ℝ → ℝ`, `fredholmDet : (ℝ → ℝ → ℝ) → Set ℝ → ℝ`; both theorems print `{Ω} [MeasurableSpace Ω] (P) [IsProbabilityMeasure P]`, `G`, `hG`, and `gue_bulk_gap` prints `|E| < 2` and `IsCompact A`. Each matches its README sentence. The 24 older signatures are unchanged from the previous report.

**One-tactic probe.** Every `sorry` replaced by `first | (simp; done) | rfl | infer_instance | (norm_num; done) | positivity` in a scratch copy: all 13 headlines fail, the two new ones included. The four new definitions have real bodies and each is used by a headline.

**Elaborated controls on the new definitions.** `sineKernel x x = 1` and `sineKernel 1 0 = 0` close by `simp`; `fredholmDet sineKernel ∅ = 1` is proved (the `k = 0` term is the determinant of the empty matrix against the unit mass on `Fin 0 → ℝ`; the terms `k ≥ 1` integrate over the empty set).

**Library declarations opened at the pins.** `Complex.regularizedHGFun` (`Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean` line 192, value `C a b 0` at `0` by `regularizedHGFun_zero`, line 195). Tau Ceti's `ContinuousLinearMap.fredholmDet` (`TauCeti/Analysis/Normed/Operator/Nonarchimedean/FredholmDet.lean`) is the determinant of a row-compact operator on a nonarchimedean `C₀(I, R)`, a different object from the series on `L²(A)`. Neither pinned library has an Airy function, a sine kernel, a Tracy–Widom law or a large deviation principle (grep; the pins are those of main, Tau Ceti 2fd255d9, unchanged since 5d55d20).

**Cross-roadmap citations resolved.** SpecialFunctionsAiry is on main: 1.1 (README line 347), 1.2 (370), Layer 2 (481), 3.2 (585), 3.4 (620), 3.6 (708), 8.5 (1382); its Scope (lines 108–110) and downstream list (line 1630) name RandomMatrices §8.4 as the consumer. The local `airyAi` has the body of its `Suggested.lean` lines 63–65 composed with line 94, and the local `airyKernel` the body of its line 179; the names live in different namespaces, so no fully qualified name is declared twice. `roadmaps grep` finds `fredholmDet`, `sineKernel` and a Tracy–Widom statement in no other roadmap's Lean file. `scratch/overlaps.md` lists no open pull request changing this roadmap and no dropped id.

**Description.** "#1928 is merged, so SpecialFunctionsAiry is on main": true at main. "README §8.4 names all six": true (lines 1052–1058). "13 declarations, 11 on main" counts the sorried theorems; the file has 30 declarations in all.

**Sources read this round.** AGZ Theorem 3.1.1 (line 4549), the remark at line 4574, Theorem 3.1.4 with (3.1.5)–(3.1.6) (lines 4624–4676), Theorem 3.1.5 (line 4684, with the note at lines 4679–4683 that 3.1.4 alone does not give `F₂(−∞) = 0`), Exercise 3.7.5 (lines 7141–7148) and (3.7.18) (line 7186). The seeded sample falls in the changed passages only at §8.4's neighbours; 3.2, 3.4, 3.5, 4.4, 5.3, 5.4, 6.1, 6.5, 7.1, 8.2, 8.6, 9.1, 9.5, 10.1 and 11.2 are untouched and stand as the previous report left them (its R06 and R07 cover 6.4, 7.1, 9.1, 9.5 and 11.2).

**Remarks on untouched text** (no change asked this round). The pinned Tau Ceti already declares `semicircleReal` (`TauCeti/Probability/Distributions/Semicircle/LocationScale.lean` line 39), `marchenkoPastur` (`.../MarchenkoPastur/Basic.lean` line 62), `wignerMatrix` (`TauCeti/Probability/RandomMatrices/Wigner.lean` line 42), `Matrix.spectralMeasure` and `eigenvalueMeasure` (`TauCeti/Analysis/Matrix/SpectralMeasure.lean` lines 115, 244) and a free central limit theorem (`TauCeti/Probability/FreeProbability/CentralLimit.lean`), while `Suggested.lean` keeps local copies and its docstring says the free limits lack a carrier. The previous report passed these at the same pin.

**Adversarial table.** Rows for the statements this head adds or changes, with values computed this round; then the rows of the report at 5d55d20 for untouched statements, carried with their values.

| Statement | Instances | Values | Result | Change |
| --- | --- | --- | --- | --- |
| `airyAi` | `x = 0`; slope at `0`; AGZ (3.7.18) | `3^{−2/3}/Γ(2/3) = 0.480750/1.354118 = 0.355028 = Ai(0)`; `−3^{−4/3}/Γ(4/3) = −0.231120/0.892980 = −0.258819`; AGZ: `−1/(3^{1/3}Γ(1/3)) = −1/(1.442250 · 2.678939) = −0.258819` | true | none |
| `airyKernel` | `x = y = 0`; `x → −∞` | `Ai′(0)² = 0.066987`; diagonal `≈ √(−x)/π`, not integrable at `−∞` | true | R10 |
| `sineKernel` | `(x,x)`; `(1,0)`; `(½,0)`; no diagonal clause | `1`; `sin π/π = 0`; `2/π = 0.6366`; Lean's `0/0 = 0` would give density `0` | true | none |
| `fredholmDet` | `A = ∅`; `K = φ⊗φ`; `K ≡ 1`, `A = [0,1]` | `1` (elaborated); `1 − ∫_A φ²`, all `k ≥ 2` determinants `0`, as in the §8.3 Check; `1 − 1 = 0` | true | none |
| `gue_largest_eigenvalue_tracyWidom` | normalisation; index; `s → +∞` | `E‖H₀₁‖² = (½ + ½)/(n+1)`, spectrum on `[−2,2]`; AGZ's `N^{2/3}(λ_N/√N − 2)` with `N = n + 1`; `k`-th term `≤ (∫_s^∞ K_Ai(x,x) dx)^k/k! → 0`, limit `1` | matches AGZ (3.1.6) | none |
| `gue_bulk_gap` | `E = 0`; `E = c`; `A = ∅`; `A = {0}`; `|E| = 2`, `0 ∈ A` | AGZ's `√N λ = N λ_norm`, `x′ = x/π`, kernel `π · (1/π) sin(π d)/(π d)`; Exercise 3.7.5: `g(c) = √(4−c²)/2`, `ρ = g/π`, `sin(g d/ρ)/(π d) = sin(π d)/(π d)`; both sides `1`; both sides `1`; scale factor `0`, left side `0`, right side `fredholmDet sineKernel {0} = 1` | true, `|E| < 2` needed and present | R09 |
| §8.4 Check, `F₂(s) → 0`, `1 − F₂(s) ≤ ∫_s^∞ K_Ai(x,x) dx` | AGZ Theorem 3.1.5; first-moment bound; model on `(−∞,s)` | distribution function, so limit `0`; `P(N(s,∞) ≥ 1) ≤ E N(s,∞)`; series diverges, gap value `0` passes the first test | Checks true, last sentence false | R10 |
| §8.4 equation | `Ai''(x) = x Ai(x)` | AGZ (3.1.4): `y″ − xy = 0` | matches | none |
| docstring, `F₁` bullet | README §8.5 | `F₁` is pinned at lines 1072–1075 to AGZ Theorems 3.1.6–3.1.7, which write it through the Hastings–McLeod `q`; its existence is a target at lines 1075–1077 | reason holds | none |
| docstring, LDP bullet | scratch elaboration | `LargeDeviationPrinciple` and `gaussianEnsemble_largest_eigenvalue_ldp` elaborate; `J_β(2) = 0` | statable | R03 |
| Conv. 4, resolvent sign | `A = diag(1,−1)`, `z = i` | `½(1/(1−i) + 1/(−1−i)) = ½((1+i)/2 + (−1+i)/2) = i/2`, `Im > 0`; AGZ's `ℑS(i) = ∫(1+x²)⁻¹ > 0` has the same sign; `(z−A)⁻¹` gives `−i/2` | agrees | carried |
| 3.1 remainder bound | `r = 1`, `μ = δ₁`, `z = i`; general `r` | `R₁ = (1+i)/2 − i = (1−i)/2`, `|R₁| = 0.707 ≤ 1`; `1/(x−z) = −∑_{k<r} xᵏ z^{−k−1} + (x/z)ʳ/(x−z)`, `|x−z| ≥ Im z` | true | carried |
| 3.1 atom and two-point Checks | `δ₀`; `(δ₋₁+δ₁)/2` | `η Im m(iη) = η · η⁻¹ = 1`; `½(1/(−1−z) + 1/(1−z)) = z/(1−z²)` | true | carried |
| 3.3 `semicircleReal` | `v = 1`; `z = i`; `v = 0` | mass `(2π)⁻¹ · 2π = 1`; `m₄ = 2 = C₂`; `m = i(√5−1)/2 ≈ 0.618i` or `−i(√5+1)/2`; Lean reduces to `betaMeasure univ • δ_a` | true | carried |
| 3.3 body vs StandardDistributions 10.20 | `y = 2x−1` | `x(1−x) = (1−y²)/4`, density `∝ √(1−y²)`; `Var(a + 2√v y) = 4v · ¼ = v` | matches | carried |
| 3.4 `marchenkoPastur` | `y = 1`; `y = 2`; `y = 1, z = 2`; Bai (2.12) | `(2π)⁻¹∫₀⁴√((4−x)/x)dx = (2π)⁻¹ · 2π = 1`; atom `½`; `2m² + 2m + 1 = 0 ⇒ m = −½ + i/2`; Bai: `√((b−x)(x−a))/(2πxyσ²)`, atom `1 − 1/y` | true | carried |
| 4.1 constructors | `n = 2`; `E trₙH²`; `Wₙ/n`; `X = (1, i)` | `2^{−1/2}[[η₀, ξ₀₁], [ξ̄₀₁, η₁]]`; `(nσ² + n(n−1))/n² → 1`; `→ 0`; `S = 2/2 = 1` | true | carried |
| 5.1 GOE/GUE vs AGZ (2.5.1) | `exp(−trH²/4)`, `exp(−trH²/2)`; `n = 2` | GOE: off-diagonal variance `1`, diagonal `2`; GUE: diagonal `1`, real and imaginary parts `½` each; `E trₙH² = 1 + 1/n` and `1`; `Im H₀₁ = g(1,0)/2` | matches | carried |
| `gaussianEnsemble_eigenvalue_density` | `n=1, β=2`; `n=1, β=1`; `n=2, β=2`; `n = 0` | `Z = √(2π)`; `Z = √2 · √(2π) = 2√π`, i.e. `N(0,2)`; `Z = ¼ · 2π · 2 = π` and `∫∫e^{−x²−y²}(x−y)² = π`, chamber mass `(π/2)(2/π) = 1`; both sides are the Dirac mass at the single point | true | carried |
| density constant vs AGZ (2.5.4) | `x = y/√n` | AGZ's constant becomes `(βn/2)^{−n/2−βn(n−1)/4}(2π)^{n/2}∏Γ(1+jβ/2)/Γ(1+β/2)`, using `∏Γ(1+jβ/2)/Γ(1+β/2) = n!∏Γ(jβ/2)/Γ(β/2)` | matches | carried |
| 6.1 Checks | `φ(p) = p(1) − p(0)`; `φ(x) = 0`, `φ(x²) = −1` | `φ(1) = 0`; `φ(x*x) = −1 < 0` | true | carried |
| 6.4 free CLT | AGZ Lemma 5.3.32 | source: bounded moments, `φ(aᵢ) = 0`, `φ(aᵢ²) = 1`, not i.d.; README: i.d. | narrower | carried, R06 |
| 6.4 free Poisson | rate `λ` | `κₙ(λ · MP_{1/λ}) = λⁿ λ^{1−n} = λ`; edges `(√λ ± 1)²`; continuous mass `min(1, λ)` | true | carried, Source issues |
| 7.1 Pastur equation | `ν = δ₀`; `t = 0` | `m = 1/(−z − tm) ⇒ tm² + zm + 1 = 0`; `m = m_ν` | true | carried |
| 8.3 Checks | `1_{x=y}`; `λφ⊗φ`; sine kernel | Poisson void probability `e^{−1} ≠ det(I − 0) = 1`; `1 − λ∫_Bφ²`, and `1 − λ < 0` for `λ > 1`; `ρ₂ = 1 − (sin πr/(πr))² → 0` | true | carried |
| 8.5 Tracy–Widom relations | AGZ (3.1.7), (3.1.13) | `F₂ = exp(−∫(x−s)q²)`; `F₁/√F₂ = exp(−½∫q) ⇒ F₁² = F₂ e^{−∫q}` | true | carried |
| 8.5 Pfaffian Check | `2 × 2`, `4 × 4` | `Pf = a`; `a₁₂a₃₄ − a₁₃a₂₄ + a₁₄a₂₃`, whose square is `det` | true | carried |
| 9.1 Checks | constant `δ₀`; Gaussian mean; `Real.log 0 = 0` | rate `0` at `0`, `∞` elsewhere; `x²/2`; `μ(F) = 0` would give `0 ≤ −inf_F I`, false when `inf_F I > 0` | true | carried |
| 9.2 growth condition | AGZ (2.6.2) with `V_AGZ = βV/2`; `β = 2`, `c log(1+|x|)` | `liminf V/log|x| > 2β′/β`; `c > β′ ≥ 2 ⇔ c > 2` | true | carried |
| 9.2 energy Check | `V = x²/2`, standard semicircle `σ` | `∫log|x−y| dσ = x²/4 − ½`; `∬ = ¼ − ½ = −¼`; `E_V = ½ + ¼ = ¾` | true | carried |
| 9.3 rate | AGZ (2.6.5) | `∫V_AGZ − (β/2)Σ − c = (β/2)(E_V − min E_V)` | true | carried |
| 9.5 rate | `x = 2`; `x ↓ 2`; AGZ Theorem 2.6.6 | `J(2) = 0`; `(β/2) · (4/3)(x−2)^{3/2} = (2β/3)(x−2)^{3/2}`; corrected AGZ form `V − β∫log|x−y|dσ + α = β − β/2 − β/2 = 0` at `x = 2`, derivative `(β/2)√(x²−4)` | README right | carried, Source issues |
| 10.3 Ornstein–Uhlenbeck invariance | `n = 1`; general `n` | `(2/β)/(2 · ½) = 2/β`, the variance of `e^{−βx²/4}`; drift `= (βn)⁻¹∇log p` for `log p = β∑log|xᵢ−xⱼ| − βn∑xᵢ²/4` | matches §5.2 | carried |
| 10.3 collision threshold | `n = 2` gap | `dr = √(4/(βn)) dW + 2/(nr) dt`, a scaled `BES(β+1)`, which hits `0` iff `β < 1` | matches "β < 1 excluded" | carried, R04 (as a Check) |
| 11.2 Checks | `δ₀`; `circularLaw`; `diag(a,b)` | `log|z|`; `Δ((|z|²−1)/2) = 2 = 2π · π⁻¹`, value `0 = log 1` at `|z| = 1`; `½ log|det(A − z)|` | true | carried |
| 2.1 sub-exponential Checks | `N(0,1)`; `Exp(1)`; Cauchy | `e^{λ²/2} ≤ e^{K²λ²}` iff `K² ≥ ½`; `e^{−λ}/(1−λ)`, `∞` at `λ = 1`, and `−λ − log(1−λ) ≤ λ²` for `|λ| ≤ ½`, so `K = 2` works; Cauchy has no mean | true | carried |
| `hanson_wright` | `A = E₁₂ + E₂₁`, Rademacher, `K = 1`; `K = 0`; RV2013 | `XᵀAX = ±2`, `1 ≤ 2e^{−c/2} ⇒ c ≤ 2 log 2`; Lean's `t²/0 = 0` makes the bound `2`; RV's `K⁴`, `K²` correspond to proxy `K²`, `K` | true | carried |
| `matrix_bernstein` | `Xₖ = εₖEₖₖ`, `t = 1`; `d = 0`; Tropp Theorem 1.4 | `2m e^{−3/8} ≈ 1.37m ≥ 1`; `d = 0`: `0 ≤ 0` for `t > 0`, `1 ≤ 0` at `t = 0` | `0 < t` needed and present | carried |
| `wigner_semicircle_ae` | Bai 2.1; Tao 2.4.2 | Bai: no centring, diagonal without moments; Tao: mean `0`, diagonal of bounded mean and variance, which is the Lean form | narrower than Bai | carried, R05 |
| `wigner_extreme_eigenvalues_ae` | Bai 2.12 (i)–(iv) | `E(w₁₁⁺)² ≤ Eη² < ∞`; `Eξ = 0` real and `≤ 0`; variance `1`; fourth moment; the minimum, via `−W`, needs `E(w₁₁⁻)² ≤ Eη²` | true | carried |
| `marchenkoPastur_ae` | `y = ¼`; `n = 0` term | support `[¼, 9/4]`; `(0)⁻¹ • 0 = 0` | true | carried |
| `sampleCovariance_extreme_eigenvalues_ae` | Bai 2.15–2.16; `y = ¼` | max `→ 9/4`, min `→ ¼`; the `y ≥ 1` case is guarded | true | carried |
| `gaussianEnsemble_spike_ae` | `θ = 1`, `θ = 2`; BGN | `θ = 1`: branch `2 = 1 + 1/1`, continuous; `θ = 2`: `5/2`; any coupling is fine because the deviation probabilities are summable | true | carried |
| `gaussianEnsemble_linear_statistic_clt` | `f = x`, `x²`; `β = 1, 2` | `a₁ = 2`, variance `2/β`, directly `n · (2/n)` and `n · (1/n)`; `a₂ = 2`, variance `4/β`, directly GUE `Var χ²_{n²}/n² = 2` and GOE `(8n + 4n(n−1))/n² → 4` | true | carried |
| `least_singular_value` | `N = 1` Gaussian; Rademacher `2 × 2`; RV2008 1.2 | `P(|ξ| ≤ ε) ≈ 0.798ε`; singular with probability `½`, so `c ≥ 2^{−1/2}`; the source allows non-i.d. entries with variance `≥ 1` | narrower | carried, R05 |
| `circular_law_ae` | `n = 1`; TVK 1.13 | `δ_{ξ₀₀}` of mass `1`; `volume(ball 0 1) = π` | true | carried |
| `eigenvalueMeasure` | `[[0,1],[0,0]]`; `[[0,−1],[1,0]]`; `n = 0` | `δ₀`; `(δ_i + δ_{−i})/2`; `0` | true | carried |
| `spectralMeasure` | `diag(1,−1)`, `[[0,1],[1,0]]` | both `(δ₁ + δ₋₁)/2` | true | carried |
| Layer 8 suppliers | gate | `dropped (10)`, no other owner | unowned | carried, R01 |
| Layer 10 suppliers | depcheck | one UPWARD line | inherited | carried, R02 |
| 4.3 locator | AGZ 2.1.21 vs Bai 2.4 | AGZ: i.i.d., `r₂ < ∞`; Bai: Lindeberg condition (2.9) | wrong locator | carried, R07 |

Counts: 10 rows computed this round and 41 carried from the report at 5d55d20; 6 new declarations checked with `#check`; 13 headlines probed with one tactic; 3 controls and 2 statability witnesses elaborated; 2 library declarations opened; 7 section ids of 1 roadmap resolved; 6 source passages read in 1 text.

## Not verifiable

- Potters–Bouchaud and Johansson 1998 remain unread, as in the previous report; nothing changed this round cites them.
- The two concentration texts suggested in R07 were not read.

## Source issues

- **Misprint** in AGZ at Theorem 2.6.6, printed page 82 (AGZ lines 4136–4141): the source says the rate for `x ≥ x*` is `β∫log|x−y|σ(dy) − V(x) − α`, which decreases to −∞; it should be `V(x) − β∫log|x−y|σ(dy) + α`, zero at `x*` and increasing; affects nothing.
- **Misprint** in AGZ at the free Poisson exercise of §5.3.3, printed page 368 (AGZ lines 17611–17616): the source says the limit for `λ < 1` is `(1−λ)δ₀ + λp̃`, but `p̃` already has mass `λ`, so the total is `1 − λ + λ²`; it should be `(1−λ)δ₀ + p̃`; affects nothing.
