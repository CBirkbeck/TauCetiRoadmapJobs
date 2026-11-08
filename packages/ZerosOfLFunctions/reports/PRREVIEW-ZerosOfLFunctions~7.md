# Review of ZerosOfLFunctions (pull request #1913 at 4762be5)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/ZerosOfLFunctions/` at `4762be5b` against Mathlib `1b1ccf4b` and Tau Ceti
`2fd255d9` (the worktree's `lake-manifest.json`). The worker's gate at this head passed every check
(`depcheck=0`, `build=0`, `dropped=0`, `readme-ids-missing=0`, `stray-files=0`, `outside-folder=0`),
and my own dependency check agrees (below). Relative to main the pull request now changes only this
folder: it repairs the four Mathlib names, adds the 3.3 locator and a "Downstream consumers" bullet,
and adds four README targets (1.3a, 1.4a, 5.6a and the "Off the real axis" paragraph of 6.4d) with
three new `Suggested.lean` theorems. No finding below is blocking; the three are P3.

## The previous review's findings, checked one by one

- **R01 (P1, forms over `ℚ` consuming AnalyticNumberTheoryPartI): repaired.** The section "The
  exclusion of Landau–Siegel zeros, consumed downstream" and its table, the `ℚ` bullets of 6.3, the
  `ℚ` paragraphs of 8.6–8.8, the "Effectivity" convention and the three References are gone; 6.3 ends
  at "*Needs:* 6.2, 6.4; L-functions Layer 5." (README line 1215) and the Summary ends at "main term
  the offset logarithmic integral" (line 15). `dirichletLFunction_zeroFreeRegion` (Suggested.lean
  lines 153–162) carries the exceptional-zero clause again, and `primeCounting_progression_effective`
  (lines 255–259) is `=O[atTop]` after fixing `q`. The only remaining mention of
  AnalyticNumberTheoryPartI is the "Downstream consumers" bullet (lines 1811–1815), which cites it as a
  consumer; the dependency check prints no UPWARD line.
- **R02 (P2, two owners): repaired** by the same revert; the bullet at lines 1811–1815 records that
  the exception-free forms "are stated there, not here". AnalyticNumberTheoryPartI at its head still
  owns them (its lines 164, 240, 281, 566, 831, 865: §§0.1, 0.6, 0.9, 0.18, 0.32, 0.34).
- **R03 (P3, four Mathlib names): repaired.** Lines 170, 177–179, 772, 777, 888, 1050–1054, 1058:
  `PhragmenLindelof.vertical_strip`, `Summable.multipliableLocallyUniformlyOn_one_add`,
  `multipliable_sineTerm`, `cot_series_rep`. All four `#check` at the pin (probe below).
- **R04 (P3, reference entries): repaired.** The OpenAI, Green and Tao entries are deleted (References,
  lines 1817–1843).
- **R05 (P3, 3.3 without locator): repaired.** Lines 788–790: "(Iwaniec–Kowalski §5.2; for `ζ`,
  Titchmarsh §5.1, where the edge exponents `0` and `1/2 − σ` are read off …)". The exponents are
  right: at `σ = −δ` the functional equation and Stirling give `|t|^{1/2 + δ}`, which is
  `analyticConductorAt^{(n/2)(1 + 2δ)}` at `n = 1`.

## R01 (P3) — `logDeriv_riemannZeta_add_logDeriv_one_sub` is provable from the pin and is not a headline

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` lines 74–85 (the Layer 1 section and
the theorem), lines 7 and 14 of the module docstring ("the `ζ` instances of three lemmas behind
them"; "Layer 1, the functional equation of `ζ'/ζ` in symmetric form"); `README.md` line 539 ("This
is `logDeriv_riemannZeta_add_logDeriv_one_sub`").

**Claim.** The file states the symmetric functional equation of `ζ'/ζ` as one of the statements the
finished roadmap is tested against.

**Witness.** It is a corollary of pinned declarations, provable today without any target of this
roadmap. The following file elaborates at the pin with no error and no warning (`lake env lean`,
exit `0`):

```lean
import Mathlib
open Complex Topology Filter

theorem test {s : ℂ} (hs₀ : s ≠ 0) (hs₁ : s ≠ 1)
    (hs : riemannZeta s ≠ 0) (hs' : riemannZeta (1 - s) ≠ 0) :
    logDeriv riemannZeta s + logDeriv riemannZeta (1 - s) =
      -logDeriv Gammaℝ s - logDeriv Gammaℝ (1 - s) := by
  have hΓ : ∀ z : ℂ, z ≠ 0 → riemannZeta z ≠ 0 → Gammaℝ z ≠ 0 := by
    intro z hz0 hzζ h
    obtain ⟨n, rfl⟩ := Gammaℝ_eq_zero_iff.mp h
    rcases n with _ | n
    · exact hz0 (by simp)
    · exact hzζ (by convert riemannZeta_neg_two_mul_nat_add_one n using 2; push_cast; ring)
  have hdΓ : ∀ z : ℂ, Gammaℝ z ≠ 0 → DifferentiableAt ℂ Gammaℝ z := by
    intro z hz
    have := (differentiable_Gammaℝ_inv z).inv (inv_ne_zero hz)
    have e : (fun s : ℂ => (Gammaℝ s)⁻¹)⁻¹ = Gammaℝ := by funext w; simp
    rwa [e] at this
  have key : ∀ z : ℂ, z ≠ 0 → z ≠ 1 → riemannZeta z ≠ 0 →
      logDeriv riemannZeta z = logDeriv completedRiemannZeta z - logDeriv Gammaℝ z := by
    intro z hz0 hz1 hzζ
    have hzΓ := hΓ z hz0 hzζ
    have h : riemannZeta =ᶠ[𝓝 z] completedRiemannZeta / Gammaℝ := by
      filter_upwards [isOpen_ne.mem_nhds hz0] with w hw
      exact riemannZeta_def_of_ne_zero hw
    rw [(logDeriv_congr_nhds h).eq_of_nhds]
    have hΛ : completedRiemannZeta z ≠ 0 := by
      intro h0
      apply hzζ
      rw [riemannZeta_def_of_ne_zero hz0, h0, zero_div]
    exact logDeriv_div z hΛ hzΓ (differentiableAt_completedZeta hz0 hz1) (hdΓ z hzΓ)
  have h1s0 : 1 - s ≠ 0 := sub_ne_zero.mpr (Ne.symm hs₁)
  have h1s1 : 1 - s ≠ 1 := fun h => hs₀ (sub_eq_self.mp h)
  have hsym : logDeriv completedRiemannZeta s = -logDeriv completedRiemannZeta (1 - s) := by
    have hfun : completedRiemannZeta = completedRiemannZeta ∘ (fun z => 1 - z) := by
      funext z; simp [completedRiemannZeta_one_sub]
    conv_lhs => rw [hfun]
    rw [logDeriv_comp (differentiableAt_completedZeta h1s0 h1s1) (by fun_prop)]
    simp
  rw [key s hs₀ hs₁ hs, key (1 - s) h1s0 h1s1 hs', hsym]
  ring
```

The inputs are exactly the ones the README's route names (`Gammaℝ_eq_zero_iff`,
`riemannZeta_def_of_ne_zero`, `logDeriv_congr_nhds`, `logDeriv_div`, `logDeriv_comp`,
`completedRiemannZeta_one_sub`, `differentiableAt_completedZeta`, `differentiable_Gammaℝ_inv`,
`riemannZeta_neg_two_mul_nat_add_one`). A statement the pinned library already proves is an API
lemma, not an acceptance test of the finished roadmap; the file's own docstring calls it a "lemma
behind" the headlines. The other two new theorems are different in kind: `riemannZeta_zeros_summable_ordinate`
needs Hadamard's theorem and the confinement of the zeros (Layers 3–5), and `neg_re_logDeriv_riemannZeta_le`
needs the partial-fraction bound of 6.4d; both rest on the roadmap and stay.

**Repair.** Delete lines 74–85 of `Suggested.lean` (the Layer 1 section comment and the theorem) and
the docstring bullet at line 14; change line 7 to "two lemmas". In the README, keep 1.4a as a target
and replace "This is `logDeriv_riemannZeta_add_logDeriv_one_sub`." (line 539) by prose, since a
backticked name of this roadmap's own is a claim that `Suggested.lean` declares it. The file without
the theorem is the file at main plus the two remaining additions, and builds.

## R02 (P3) — The pull request's merge-order paragraph is stale, and no order is stated against #1907

**Location.** The pull request's title and description (data, quoted in the worker's
`pull-request.md`): "effective statements under the exclusion of Landau–Siegel zeros"; "the uniform
exclusion of Landau–Siegel zeros is a headline of AnalyticNumberTheoryPartI (§0.34) … Merge order:
after AnalyticNumberTheoryPartI (#1126) lands, since the strengthened statements refer to its §0.34."

**Claim.** The description says this pull request depends on AnalyticNumberTheoryPartI and should
merge after it, and says nothing about #1907.

**Witness.** The folder at this head contains none of the strengthened statements: every citation of
AnalyticNumberTheoryPartI §0.34 as an input is gone (R01 above), and the roadmap supplies that one:
`merge-order/ORDER.txt` lists `ZerosOfLFunctions` at line 48 and `AnalyticNumberTheoryPartI` at line
49, and AnalyticNumberTheoryPartI's head cites this roadmap's Layers 0–8 as its supplier (its lines
10, 74–87). Following the paragraph would place this roadmap after its own consumer. Separately,
`scratch/overlaps.md` reports that #1907 (kim-em, "direct Dirichlet selected-zero interfaces") and this
head conflict in both files; I diffed #1907's head against main: it inserts a digamma bullet after the
`Complex.differentiable_Gammaℂ_inv` line of "From Mathlib", where this head inserts the 1.3a/1.4a
bullet (README line 181); it appends a paragraph and a changed `*Needs:*` line to 1.4, where this
head inserts 1.4a (line 518); it adds 6.4a after 6.4's `*Needs:*` line, which this head changes
(line 1282); and both rewrite the module docstring of `Suggested.lean`. The four-name repair (R03 of
the previous review) appears identically in both and merges cleanly. Neither pull request names the
other.

**Repair.** Rewrite the description to describe this head (the name repairs, the 3.3 locator, the
"Downstream consumers" bullet, the targets 1.3a, 1.4a, 5.6a and 6.4d's off-axis bounds, the two
remaining `ζ` lemmas), drop the AnalyticNumberTheoryPartI merge-before, and state the order against
#1907: whichever of the two merges second is rebased on the other, the conflicts being the four
hunks above. Nothing in the README changes for this finding; a README is timeless and must not name
a pull request.

## R03 (P3) — Layer 5 and Layer 6 `### Dependencies` omit the Layer 1 inputs of the new targets

**Location.** `README.md` line 1150 (Layer 5 Dependencies: "Mathlib infinite products, …. Layer 0
`OrderLE`, Layer 4.3; 5.6 additionally Layers 3.1 and 4.4 and L-functions Layers 3, 5.") and line
1318 (Layer 6 Dependencies: "L-functions Layers 3, 5, 7, 8. Layers 2, 4, 5.6. Global Number Fields
Layer 2 ray-class finiteness.").

**Claim.** Every layer lists its dependencies.

**Witness.** 5.6a's `*Needs:*` (line 1128) is "5.3, 3.1, 1.5, 4.2; Layer 0 *entireCompletion*;
L-functions Layers 0, 3 and 5 (`hasFunctionalEquation_eventuallyEq`, the Euler products)": 1.5, 4.2
and L-functions Layer 0 are absent from line 1150. 6.4's `*Needs:*` (line 1282) now begins "6.1;
5.6; 1.4, 2.2; Layer 4", and 6.5's (line 1298) ends "1.5–1.6": Layer 1 is absent from line 1318.

**Repair.** Line 1150: add "Layers 1.5 and 4.2 and L-functions Layer 0 (5.6a)". Line 1318: add
"Layer 1.4–1.6". Checked against the `*Needs:*` lines quoted; nothing else in either layer cites a
layer the line omits.

## Verified sound

**Gate, build and dependency check.** The worker's gate at `4762be5`: every check passed, the targeted
build with `sorry` the only warning. My run of the dependency check on this head:

```text
depcheck: 238 roadmaps, 2343 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The merge order lists this roadmap at line 48, after `LFunctions`
(27); its other suppliers (GlobalNumberFields, NumberFieldArithmetic, Chebotarev,
ArithmeticDirichletSeries, ContourIntegration under `Completed/`; ClassFieldTheory and ModularForms
under `TauCetiRoadmap/`) are on main. `git diff --stat origin/main...HEAD` outside the folder: empty.

**Elaboration and signatures.** A scratch copy of `Suggested.lean` with `#check @name` appended for all
17 declarations elaborates in 8 s with the expected 14 `sorry` warnings and no error; the 17
elaborated types coincide with the worker's `signatures.md` and with the README statements (no
section binder lost; `[NeZero q]` inside each quantifier; `primeIdealCount_effective` carries
`[Field K] [NumberField K]`; `neg_re_logDeriv_riemannZeta_le` has `C` before `δ`, `t` and `β`;
`primeCounting_progression_effective` has `c` before `q` and the `=O` after `q`, matching "for fixed
`K` and `𝔪`" in 8.7). One `import Mathlib`, no `set_option`, no sorried data, `theorem` throughout.

**One-tactic probe.** Each of the 14 sorried theorems replaced by `first | rfl | (simp; done) |
infer_instance | (norm_num; done)`: 14 errors "unsolved goals", none closes. No declaration restates
a definition, mirrors a Check or computes a value. R01 is not a one-tactic closure but a short proof
from the pin; it is reported for that reason.

**Headline theorems.** From the README: the convexity bound (3.4), Hadamard at order one and its `ζ`
instance (5.5), the de la Vallée Poussin regions (6.2, 6.4), Riemann–von Mangoldt for `ζ` and
conductor-uniform for Dirichlet characters (7.4–7.5), the truncated and Weil explicit formulas
(8.3–8.4), the prime ideal theorem (8.5) and the progression count (8.7 at `K = ℚ`): all stated. The
general-field zero statements, 8.7 over `K` and 8.8 are named in the docstring as not statable with
the missing carriers (continued `ζ_K`, Hecke L-functions, ray class groups, Artin symbol).

**Mathlib declarations opened at the pin** (`#check` in the probe, hypotheses read in the source):
`Complex.Gamma_eq_integral` (`Gamma/Basic.lean:319`, `0 < s.re`), `Real.Gamma_eq_integral` (`:405`),
`Real.convexOn_Gamma` (`BohrMollerup.lean:122`, `ConvexOn ℝ (Ioi 0) Gamma`), `Real.Gamma_one`,
`Real.Gamma_two` (`BohrMollerup.lean:325`), `Complex.Gamma_conj` (`Basic.lean:356`),
`Complex.Gammaℝ_conj`, `Complex.Gammaℂ_conj` (`Deligne.lean:80, 90`), `deriv_conj_conj`
(`Deriv/Star.lean:139`), `Complex.digamma_one_sub` (`Digamma.lean:94`, `∀ n : ℤ, s ≠ n`),
`Complex.digamma_two_mul` (`:124`, `∀ m : ℕ, 2 * s ≠ -m`), `completedRiemannZeta_one_sub`
(`RiemannZeta.lean:106`, no hypothesis), `logDeriv_riemannZeta_one_sub` (`RiemannZetaLogDeriv.lean:35`,
`∀ n : ℤ, s ≠ n`, `riemannZeta s ≠ 0`, conclusion `−ζ'/ζ(1 − s) + log 2π − ψ(s) + (π/2) tan(πs/2)`, as
1.4a states), `Complex.norm_cpow_eq_rpow_re_of_pos` (`Pow/Real.lean:337`),
`MeasureTheory.norm_integral_le_integral_norm` (`Bochner/Basic.lean:970`),
`Complex.Gamma_mul_Gamma_one_sub`, `logDeriv_congr_nhds`, `logDeriv_congr_nhdsNE`, `logDeriv_mul`,
`logDeriv_div`, `logDeriv_comp` (`LogDeriv.lean:42, 48, 83, 89, 142`), `differentiableAt_riemannZeta`
(`s ≠ 1`), `differentiableAt_completedZeta` (`s ≠ 0`, `s ≠ 1`), `Complex.Gammaℝ_eq_zero_iff`
(`∃ n : ℕ, s = −(2n)`), `Summable.of_nonneg_of_le`, `riemannZeta_def_of_ne_zero`,
`intervalIntegral.integral_mul_deriv_eq_deriv_mul`, `PhragmenLindelof.vertical_strip`,
`Summable.multipliableLocallyUniformlyOn_one_add`, `multipliable_sineTerm`, `cot_series_rep`,
`Complex.Gamma_ne_zero`, `Complex.exists_continuousOn_eqOn_exp_comp`, `AnalyticOnNhd.sum_divisor_le`,
`ValueDistribution.logCounting`, `ValueDistribution.log_counting_zero_sub_logCounting_top`,
`Function.locallyFinsuppWithin.logCounting_divisor_eq_circleAverage_sub_const`,
`Complex.differentiable_Gammaℝ_inv`, `Complex.differentiable_Gammaℂ_inv`,
`riemannZeta_neg_two_mul_nat_add_one`: all resolve.

**Supplier citations resolved.** The 13 "Lean names found nowhere" of `scratch/citations.md`
(`dualCompleted`, `dual_gammaFactor`, `dual_hasDirichletAgreement`, `dual_hasMeromorphicContinuation`,
`hasFunctionalEquation_eventuallyEq`, `reflectedPoint`, `regular_away`, the six `Grossencharacter.*`
kernel names) are declared in `TauCetiRoadmap/LFunctions/Suggested.lean` on main, as the "From
TauCetiRoadmap.LFunctions" section says (roadmap contracts, not pinned library names); so are the
names 1.4a and 5.6a newly consume: `hasFunctionalEquation_eventuallyEq` (its line 202: the germ is
`=ᶠ[𝓝[≠] s]` with `d.rootNumber * d.dual.completed (1 − z)`, as 1.4a's "General records" states),
`HasFunctionalEquation.norm_rootNumber` (line 191, `‖d.rootNumber‖ = 1`), `completedDedekindZeta_one_sub`
(line 1046, `s ≠ 0`, `s ≠ 1`), `dedekindZetaData`, `three_four_one_nonneg`,
`heckeLFunctionC_eq_primitive`, `completedHeckeLFunction_one_sub_eventuallyEq`. The Tau Ceti names
were re-resolved last round at the same pin and are unchanged in the folder.

**Overlaps and ownership.** `scratch/overlaps.md`: #1907 conflicts (R02); no id this README cites is
dropped by an open pull request; this pull request drops no id (the diff against main only adds).
Closest roadmaps by vocabulary: ExplicitZetaBounds (#1954), ExplicitNumberFields (#1944),
ExplicitPrimeCounting (#1945), AnalyticNumberTheoryPartI (#1126): their citations of this roadmap
(their lines 5, 125, 223, 244, 336, 470; 105, 161–164, 231, 524, 547, 635–640; 144, 153, 161, 290,
409, 737–753, 1052) name Layers 0–9, 1.1, 3.1, 4.1, 4.5, 6.2, 6.5, 7.2, 7.5, 8.5, 8.7, all present and
unchanged. Ownership of the new objects, searched by object across main and the 463 open heads
(`roadmaps grep --fixed`, one term each): "1 + (Im ρ)²", "m_ρ/(1 + (Im ρ)²)", "1/(1 + γ²)", "1 + γ²",
"logDeriv riemannZeta (1 - s)", "‖Γ(s)‖ ≤ Real.Gamma", "Γ(σ + it)| ≤ Γ(σ)", "digamma (conj", "conj
(digamma", "Gammaℝ_conj", "Re (ζ'/ζ)(1 + δ + 2it)": no match outside this roadmap (a control term,
"logDeriv Gammaℝ", matches #1907 and this roadmap). AnalyticNumberTheoryPartI at its head owns
neither the ordinate sum nor the off-axis `ζ'/ζ` bounds (grep of its README for "ordinate", "1+γ²",
"3-4-1" at height, "symmetric form": none; its §0.30a is a compact-height adapter that cites this
roadmap's Layers 3–4). The three Explicit roadmaps own numerical constants and cite this roadmap for
the existential shapes. Ownership against open pull requests without files in the brief was not
checked beyond the index tool.

**Sources (the seeded sample).**

- 1.1: no textual source; `Complex.exists_continuousOn_eqOn_exp_comp` and `Complex.Gamma_ne_zero`
  (`Beta.lean:427`, `∀ m : ℕ, s ≠ −m`) at the pin. Values in the table.
- 1.5: `dlmf5` lines 490–492 and 524 (5.11.9, `|Γ(x+iy)| ∼ √(2π)|y|^{x−1/2}e^{−π|y|/2}` "uniformly for
  bounded real values of x"); the shifted-pole divisor is LFunctions Layer 0's. Values in the table.
- 1.6: `dlmf5` line 108 (5.11.1, Stirling for `Ln Γ` in `|ph z| ≤ π − δ`); 5.5.3 (reflection) is on
  the DLMF §5.5 page, not in the cached §5.11 page; it is `Γ(z)Γ(1−z) = π/sin πz`, Mathlib's
  `Complex.Gamma_mul_Gamma_one_sub`. Values in the table.
- 3.2: `PhragmenLindelof.vertical_strip` at the pin: `DiffContOnCl` on the strip, growth
  `exp (B * exp (c * |im z|))` with `c < π/(b − a)`, polynomial edge bounds; as the README states.
- 3.3: Iwaniec–Kowalski §5.2 and Titchmarsh §5.1 not verifiable (below); the exponents recomputed
  (table).
- 4.5: Titchmarsh Theorem 9.2 not verifiable; the route (unit rectangles inside discs of radius
  `√2/2`, 4.4) is self-contained; values in the table.
- 4.6: `ValueDistribution.logCounting` and `log_counting_zero_sub_logCounting_top` at the pin.
- 5.1: from 4.3 (`AnalyticOnNhd.sum_divisor_le`); no external source needed.
- 7.3: Titchmarsh §9.3 not verifiable; the `S(T) → −1` Check recomputed (table).
- 7.5: `trudgian2015` lines 19–22 (Theorem 1: `T ≥ 1`, primitive nonprincipal modulo `k`,
  `|N(T,χ) − (T/π) log(kT/2πe)| ≤ 0.317 log kT + 6.401`) and 25–27 (Theorem 2: Dedekind,
  `(T/π) log(d_K (T/2πe)^{n_K})`, error `0.317(log d_K + n_K log T) + 6.333 n_K + 3.482`). Both
  match 7.5 and `riemannVonMangoldt_dirichlet`; the `q = 1` instance is Theorem 2 at `K = ℚ`.
- 8.2, 8.3, 8.5, 8.7: Davenport §§17, 18, 20 not verifiable; the `K = ℚ` constants and the
  main-term coefficients recomputed (table).
- 8.9: `intervalIntegral.integral_mul_deriv_eq_deriv_mul` at the pin; values in the table.
- 6.2 and 6.4d (findings touch 6.4d): `kadiri2012` lines 79–85 (Theorem 1.1, `d_K` sufficiently
  large: no zero with `|Im s| ≥ 1` in `Re s ≥ 1 − 1/(12.55 log d_K + 9.69 n_K log|Im s| + 3.03 n_K +
  58.63)`; at most one with `|Im s| ≤ 1` in `Re s ≥ 1 − 1/(12.74 log d_K)`, real and simple) and
  lines 230–237 (§2.1.2, printed p. 6: `−Re ζ_K'/ζ_K(s) = −Σ_ϱ Re 1/(s−ϱ) + ½ log d_K + Re 1/s +
  Re 1/(s−1) + Re γ_K'/γ_K(s)`), the four terms 6.4d names.

**Adversarial table.** One row per statement, values on each side.

| Statement | Instances tried | Values | Result | Change |
| --- | --- | --- | --- | --- |
| 1.3a `‖Γ(s)‖ ≤ Real.Gamma (Re s)`, `0 < Re s` | `Re s = 1/2`; `s = 3/2`; `s = 3`; `s = −1/2` | `‖Γ(1/2+it)‖² = π/cosh πt ≤ π = Γ(1/2)²`, equality at `t = 0`; `Γ(3/2) = 0.886 < 1`; `Γ(3) = 2 > 1`; `Γ(−1/2) = −3.545 < 0` | first clause sound; second clause exactly on `[1, 2]` (`Γ(1) = Γ(2) = 1`, convex) | none |
| 1.4a conjugation | `s = i` | `Im ψ(i) = 1/2 + (π/2) coth π = 0.5 + 1.5767 = 2.0767`, so `ψ(−i) = conj ψ(i) ≠ ψ(i)` | sound; `deriv_conj_conj` is `deriv (conj ∘ f ∘ conj) = conj ∘ deriv f ∘ conj` | none |
| 1.4a symmetric FE | `s = 2`; `s = 1/2`; `s = −2`; `s = 3` | `ζ'/ζ(2) = −0.56996`, `ζ'/ζ(−1) = 12 log A − 1 = 1.98505`, sum `1.41509`; right side `0.86097 + 0.55412 = 1.41509 = γ_E + log 2π − 1`. `s = 1/2`: left `2·2.68609 = 5.37218`, right `−ψ(1/4) + log π = 4.22745 + 1.14473 = 5.37218`. `s = −2`: left junk `0 + ζ'/ζ(3) = −0.1648`, right `0 + 0.5541`: hypothesis `ζ(s) ≠ 0` needed. `s = 3`: `1 − s = −2`, excluded by `ζ(1−s) ≠ 0` | true; hypotheses exactly keep `s`, `1−s` off the poles of `Gammaℝ`; provable at the pin | R01 |
| 1.4a vs `logDeriv_riemannZeta_one_sub` on `ℂ∖ℤ` | duplication at `s/2`, reflection at `(1−s)/2` | `−ψ(s) + log 2π = log π − ½ψ(s/2) − ½ψ((s+1)/2)`; `ψ((1+s)/2) = ψ((1−s)/2) + π tan(πs/2)`; both forms agree | consistent | none |
| 1.4a general records | `ε` with `‖ε‖ = 1`; `ε = 0` | `logDeriv (ε·g) = logDeriv g` for `ε ≠ 0`; `norm_rootNumber` excludes `ε = 0`, where the germ equation would read `Λ = 0` | sound; germ at `𝓝[≠] s` as the supplier states | none |
| 5.6a confinement and summability | `1/Γ(s+1/2)`; zeros of `riemannZeta`; first zero of `ζ`; `ρ = 1/2 + 14.13i`; `ρ = 0` | zeros `−1/2 − n`, summand `1` each, `Σ 1/(n+1/2)² < ∞` but ordinate family divergent; trivial zeros `−2, −4, …` summand `1` each, divergent; `2/(1 + 14.1347²) = 0.00996`; `‖ρ−2‖² = 202.0 ≤ 4(1+γ²) = 803`; `‖0−2‖² = 4 ≤ 4` | sound; `Σ 1/γ² < ∞` from `N(T) ≪ T log T` | none |
| `riemannZeta_zeros_summable_ordinate` | index `ℂ`, support | support = nontrivial zeros, countable, discrete; summands `≥ 0`; divisor of `completedRiemannZeta` on `univ` is not junk (`MeromorphicOn` everywhere) | sound | none |
| 6.4d trivial-character bound at height `t` | `K = ℚ`, `t = 0`, `σ = 1 + u`; `analyticConductorAt d 0` | left `1/u + O(1)` vs right `1/u + ½ log 3 + O(1)`: the pole term is needed; `3^{r₁}12^{r₂}|d_K|`: `K = ℚ` gives `3`, imaginary quadratic `12|D|` (`(0+3)(1+3) = 12`) | sound; matches Kadiri §2.1.2 | none |
| 6.4d off the real axis | `u = 2`, `δ = 1`; `t → 0`, `δ = 2|t|`; `δ ≥ 1`; `|t| ≥ t₀ > 1` | `Re 1/(δ+iu) = 1/5 ≤ 1/(2u) = 1/4` (AM–GM); `−Re ζ'/ζ(1+δ+2it) ≈ δ/(δ²+4t²) = 1/(4|t|)` while `log|t| → −∞`: threshold needed; for `δ ≥ 1` left `≤ Σ Λ(n)n^{−2} = −ζ'/ζ(2) = 0.5700`, right `≥ −1 + C log t₀`, so `C ≥ 1.57/log t₀` suffices; `Re(1/s) ≤ 1/σ < 1` absorbed | sound | none |
| `neg_re_logDeriv_riemannZeta_le` | zero `β + it`, `|t| ≥ t₀ > 1`; multiplicity `m ≥ 2` | trivial zeros have `t = 0`, so `0 < β < 1` and `1 + δ − β > δ > 0`: no vanishing denominator; `−1/(1+δ−β) ≥ −m/(1+δ−β)`: the Lean form is the weaker one, implied by the README's | sound; quantifier order `C` before `δ, t, β` | none |
| 1.1 *logGamma* | `δ = π/2`, `s = 2, 3`; ray `arg s = π/2`, `t = 10` | `2 ∈ S_δ`; `logGamma δ 3 = log 2` (`Γ(3) = 2`, `Γ > 0` on `[2,3]`); `arg Γ(10i) ≈ 10 log 10 − 10 − π/4 = 12.24 > π`: `Complex.log ∘ Γ` jumps | sound | none |
| 1.5 at the `ζ` record | `d = 1`, `gammaR = {0}` | `log‖Gammaℝ(σ+it)‖ = log‖Γ(σ/2+it/2)‖ − (σ/2) log π = (σ/2 − 1/2) log(|t|/2) − π|t|/4 + O(1)`: `A(σ) = (σ−1)/2`, rate `π/4` | matches 5.11.9 | none |
| 1.6 *invGammaFactor* | `n = 0`; `−2n` | `‖1/Gammaℝ(−2n−1)‖ = π^{−n−3/2}Γ(n+3/2)`: at `n = 0`, `0.1796·0.8862 = 0.159`, and directly `1/(√π·Γ(−1/2)) = 1/(1.7725·(−3.5449))`, modulus `0.159`; `1/Gammaℝ(−2n) = 0` | sound | none |
| 1.6 *continuedL* at `0` | `ζ` record | `ζ(0) = −1/2` vs raw quotient `Λ(0)/Gammaℝ(0) = Λ(0)/0 = 0` | sound | none |
| 3.3 edges | `ζ`, `Re s = −δ` | `|ζ(−δ+it)| ≍ |t|^{1/2+δ}|ζ(1+δ−it)|`; `(n/2)(1+2δ) = 1/2+δ` at `n = 1`; `analyticConductorAt ≍ |t|` | matches the new locator's exponents `0`, `1/2 − σ` | none |
| 4.5 counts | `T = 14, 15, 100` | `N(14) = 0`, `N(15) = 1`, `N±(100) = 58 = 2·29` | sound | none |
| 4.6 Nevanlinna comparison | `f = z`, `1/z`, `z²` | `n(r) = 1`, `logCounting = log r`; `0` vs signed `−log r`; `2`, `2 log r` | sound | none |
| 5.1 | `f = cos`; `f = exp(z²)` | zeros `±(k+1/2)π`, count in `closedBall 0 r` is `2r/π + O(1) = O(r^{1+ε})`; no zeros | sound | none |
| 7.3 *S* near `0` | `T → 0⁺` | argument drops by `≈ π` past the pole at `1`: `S(T) → −1`; `N = θ/π + 1 + S = 0 + 1 − 1 = 0` | sound | none |
| `riemannVonMangoldt` | `T = 14`, `100` | `0` vs `−0.443`; `29` vs `28.12`; within `C log T` | sound | none |
| `riemannVonMangoldt_dirichlet` | `q = 1`, `T = 100`; Trudgian's constants; imaginary quadratic | `58` vs `56.25`, Theorem 2 at `K = ℚ` allows `0.317·4.605 + 9.815 = 11.3`; `0.317 log kT + 6.401 ≤ 9.55 log kT` for `kT ≥ 2`; halved conductor short by `(T/2π) log|D|` | sound | none |
| `chebyshevPsi_explicitFormula` | `K = ℚ` constants; `x = T = 2` | `c_ℚ = −ζ'/ζ(0) = −log 2π`; `r₁ + r₂ − 1 = 0`; trivial zeros `−½ log(1 − x^{−2})`; `log x = 0.693 ≤ C·log² 2 = 0.480 C` needs `C ≥ 1.44`, absorbed by the existential `C` | sound | none |
| `dirichletLFunction_convexity` | `q = 1`, `t = 0` | `|ζ(1/2)| = 1.4604 ≤ C·3^{1/4+ε}`, `C ≥ 1.11` | sound | none |
| `hadamard_of_orderLE_one` | `f = 1 − s`; `f = exp(z²)` | `a = 0`, `b = −1`, `e^{−s}E₁(s) = 1 − s`; order `2` fails `OrderLE _ 1` (`exp(r²)/exp(r^{3/2}) → ∞`) | sound | none |
| `riemannZeta_zeroFreeRegion`, `dirichletLFunction_zeroFreeRegion` | `s = 1/2`; mod-2 principal at `0`; `q = 1`, `ρ = 1` | `ζ(1/2) ≠ 0`; `Re 0 = 0 < 1 − c/log 6` as `c ≤ (log 3)/2`; order `−1`, not `> 0` | sound (unchanged from main) | none |
| `primeIdealCount_effective` | `K = ℚ`; fixed `β < 1` | `π(x) − Li x = O(x e^{−c√log x})`; `x^β/(x e^{−c√log x}) → 0` | sound | none |
| `primeCounting_progression_effective` | `q = 4`, `a = 3`; `q = 1` | main term `Li x/2`; `Li x`; constant after `q` | sound; matches 8.7 "for fixed `K` and `𝔪`" | none |
| 8.7 main coefficient | `K = ℚ`, `𝔪 = (3)∞` | prime coefficient `1/2`; `rayClassIdealMainTerm = (1/2)(1 − 1/3) = 1/3` | the two counts differ as stated | none |
| 8.9 | `x = 2`; `x = 10⁶` | `Li 2 = 0`; `Li(10⁶) − x/log x = 78626.5 − 72382.4 = 6244`, `x/log² x = 5239`, next term `2x/log³ x = 758`, sum `5997` | consistent with `x/log² x + O(x/log³ x)` | none |
| `riemannZeta_weilExplicitFormula` | `φ = 0`; signs | both sides `0`; residues `m_ρ φ̃(ρ)`, `−φ̃(0) − φ̃(1)`, reflection through 1.4a's general-record identity | sound (unchanged) | none |

**Cross-roadmap citations resolved.** AnalyticNumberTheoryPartI §§0.1, 0.6, 0.9, 0.18, 0.32, 0.34
exist at its head (lines 164, 240, 281, 566, 831, 865) and are cited only as a downstream consumer.
LFunctions names: above. The GlobalNumberFields, NumberFieldArithmetic, Chebotarev,
ArithmeticDirichletSeries, ClassFieldTheory and ModularForms citations are unchanged from main.

## Not verifiable

- Davenport, *Multiplicative Number Theory*, §§11–14, 16–20 (5.3, 5.5, 6.2, 6.4d, 7.5, 8.2–8.3,
  8.5–8.7): paywalled (Springer); not in the sources cache (header search of the 15,466 cached texts:
  none). Cited by locator; the `K = ℚ` constants were recomputed.
- Titchmarsh, *The Theory of the Riemann Zeta-Function*, 2nd ed. (3.3, 3.4, 4.5, 7.3–7.6): paywalled
  (OUP). The cache holds a scan of the 1986 edition (`ee495ba7…`) fetched from a third party's
  course page, "All rights reserved" on its copyright page; it is not an author page or a publisher
  archive, so I did not read it. The Checks that cite it were recomputed.
- Lang, *Algebraic Number Theory*, XVII §3 (8.4): paywalled; not in the cache.
- Iwaniec–Kowalski §§5.1–5.2 (Layer 2, 3.3, 3.4): the cached copy (`ebcb8686…`) is a table of contents
  only.
- Lagarias–Odlyzko (8.8): not in the cache, not fetched.

## Source issues

- none
