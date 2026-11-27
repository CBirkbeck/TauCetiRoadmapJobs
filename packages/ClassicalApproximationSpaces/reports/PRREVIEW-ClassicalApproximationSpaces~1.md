# Review of ClassicalApproximationSpaces (pull request #3203 at c9ff56f)

**Verdict:** needs changes

**Summary.** Needs changes, for three reasons: the Lean statement of the `ρ`-subadditivity of the modulus of smoothness is false for non-measurable functions (it has no measurability hypothesis); the definition `torusTrigScheme`, on which two headline statements rest, has five fields closed by `sorry`; and CA-C08 omits `s > 0`, without which two of its three claims fail at `s = 0`. The other statements I computed or read against their sources hold. There are four small corrections and two format notes, none blocking, and three points for the human reviewers (merge order behind #3202, the author's own formalisation as a source, and one unreadable source).

## R01 (P1) — `modulusOfSmoothness_add_rpow_min_le` is false as stated: it quantifies over all `f g : G → ℂ` and every measure, with no measurability

An implementer cannot prove this statement, and CA-C06 passes it to AS-B10 as the hypothesis `hω`. Mathlib's `eLpNorm` is built on the lower integral, which is superadditive and not subadditive on non-measurable functions.

Instance with `r = 0` (the signature allows it): on `ℝ` with Lebesgue measure and `p = 1`, the modulus of order `0` at `t = 1` is `eLpNorm f 1 volume` (I checked this reduction in Lean). Take a Bernstein set `A`, `f = 1_A`, `g = 1_{Aᶜ}`: every measurable set inside `A` or `Aᶜ` is null, so both lower integrals are `0`, while `f + g = 1` has `eLpNorm = ∞`. The statement reads `∞ ≤ 0`. For `r ≥ 1` it fails as well: with `V ⊂ ℝ` a `ℚ`-hyperplane, `π : ℝ → ℝ/V ≅ ℚ`, `A = π⁻¹(ℚ_{≥0})`, `f = 1_{[0,1]} 1_A` and `g = 1_{[0,1]} 1_{Aᶜ}`, each `|Δ_h^r f|` and `|Δ_h^r g|` is supported in finitely many sets of the form (measurable) ∩ (proper `V`-invariant), all of inner measure zero, so both moduli vanish for `p < ∞`, while `ω_r(1_{[0,1]}, t)_p > 0`.

Smallest change (in `Suggested.lean`, line 64): add `[MeasurableAdd G] [μ.IsAddRightInvariant]` and `(hf : AEStronglyMeasurable f μ) (hg : AEStronglyMeasurable g μ)` (or `StronglyMeasurable f`, `StronglyMeasurable g` with `[MeasurableAdd G]` alone). The supplier lemma it would be proved from, `eLpNorm_add_rpow_min_le` in `TauCetiRoadmap/ApproximationSpaces/Suggested.lean` (line 65), has the same gap; that is for the review of that folder.

## R02 (P2) — `torusTrigScheme` is a definition with five fields closed by `sorry`

`Suggested.lean`, lines 185–191: `A_zero`, `mono`, `smul_mem`, `add_mem` and `finite` are `sorry`, and Jackson's theorem (CA-C04) and the description by moduli (CA-C06) are stated about this definition. A definition in the acceptance test may not contain `sorry`. All five fields are true and short; the following elaborates against this head with `torusTrigScheme'` renamed to replace the definition:

```lean
theorem torusTrigPoly_mono (d : ℕ) {m n : ℕ} (h : m ≤ n) :
    torusTrigPoly d m ≤ torusTrigPoly d n := by
  unfold torusTrigPoly
  apply Submodule.span_mono
  rintro _ ⟨⟨k, hk⟩, rfl⟩
  exact ⟨⟨k, fun i => lt_of_lt_of_le (hk i) (by exact_mod_cast h)⟩, rfl⟩

def torusTrigScheme (d : ℕ) : FunctionScheme (volume : Measure (UnitAddTorus (Fin d))) where
  A n := if n = 0 then {0} else {a | ∃ T ∈ torusTrigPoly d n, ⇑a =ᵐ[volume] T}
  A_zero := by simp
  mono := by
    intro n a ha
    by_cases hn : n = 0
    · subst hn
      simp only [ite_true, Set.mem_singleton_iff] at ha
      subst ha
      simpa using ⟨0, Submodule.zero_mem _, Lp.coeFn_zero ℂ ∞ volume⟩
    · simp only [if_neg hn, Set.mem_ofPred_eq] at ha
      obtain ⟨T, hT, h⟩ := ha
      simpa using ⟨T, torusTrigPoly_mono d (Nat.le_succ n) hT, h⟩
  smul_mem := by
    intro c n a ha
    by_cases hn : n = 0
    · subst hn
      simp only [ite_true, Set.mem_singleton_iff] at ha ⊢
      simp [ha]
    · simp only [if_neg hn, Set.mem_ofPred_eq] at ha ⊢
      obtain ⟨T, hT, h⟩ := ha
      refine ⟨c • T, Submodule.smul_mem _ c hT, ?_⟩
      filter_upwards [Lp.coeFn_smul c a, h] with x h1 h2
      simp [h1, h2]
  add_mem := by
    intro m n a b ha hb
    by_cases hm : m = 0
    · subst hm
      simp only [ite_true, Set.mem_singleton_iff] at ha
      subst ha
      simpa using hb
    by_cases hn : n = 0
    · subst hn
      simp only [ite_true, Set.mem_singleton_iff] at hb
      subst hb
      simpa using ha
    have hmn : m + n ≠ 0 := by omega
    simp only [if_neg hm, if_neg hn, if_neg hmn, Set.mem_ofPred_eq] at ha hb ⊢
    obtain ⟨T, hT, h⟩ := ha
    obtain ⟨U, hU, h'⟩ := hb
    refine ⟨T + U, Submodule.add_mem _ (torusTrigPoly_mono d (Nat.le_add_right m n) hT)
      (torusTrigPoly_mono d (Nat.le_add_left n m) hU), ?_⟩
    filter_upwards [Lp.coeFn_add a b, h, h'] with x h1 h2 h3
    rw [h1, Pi.add_apply, Pi.add_apply, h2, h3]
  finite := by
    intro n a _
    exact Lp.eLpNorm_lt_top a
```

(`if_neg` is deprecated at the pin in favour of `ite_eq_right`; it still elaborates, with a warning.)

## R03 (P2) — CA-C08 states no range for `s`, and two of its claims are false at `s = 0`

The README promises that every target states its exponent range, AS-A05 defines `A^s_q` for every real `s`, and CA-C08 (lines 379–383) gives none. Write `b_j² = ∑_{2^{j−1} ≤ ‖k‖_∞ < 2^j} |f̂(k)|²`, so that `E_{2^k}(f)_2² = ∑_{j > k} b_j²`. At `s = 0`, `q = 4`, `b_j = j^{−0.6}`: `(b_j) ∈ ℓ_4` and `f ∈ L_2`, but `E_{2^k}⁴ ≍ k^{−0.4}` is not summable, so `f ∉ A^0_4`. At `s = 0`, `q = 2`: `A^0_2` is `{∑_j j b_j² < ∞}`, not `L_2` (take `b_j² = 1/(j log² j)`). For `s > 0` both claims follow from AS-A02. Smallest change: "for `s > 0` and `0 < q ≤ ∞`" in the second and third claims.

## C01 — Eighteen of the declarations listed under "From Tau Ceti" are not in the pinned Tau Ceti

A reader who opens the pinned library to consume the contracts of lines 756–784 finds none of `ContDiffBump.inhomogeneousLittlewoodPaley`, `TemperedDistribution.littlewoodPaleyBlock`, `TemperedDistribution.MemBesov`, `TauCeti.BesovSpace`, the periodic Besov declarations, the three Bernstein and Nikolskii theorems, the three vector-valued maximal theorems, the three `TauCeti.CompatibleCouple.*` theorems, or `TauCeti.unitInterval.haarFun` and `haarBasis`; the files named for them are absent too. Present at the pin: `TauCeti.maximalFunction`, `TauCeti.eLpNorm_maximalFunction_le`, `TauCeti.CircleSobolev`, `TauCeti.Wkp`. The module docstring of `Suggested.lean` already says the pin has no Littlewood–Paley blocks and no Besov spaces; the README says the opposite in Conventions 5 and 6 and in the contracts. The mathematics is owned on main (PDE §2.1, §7.1–7.2, BanachSpaceTheory §3.5, NoncommutativeIntegration §2.4), so nothing is unowned: say in the contracts that these names belong to a Tau Ceti later than the pin, or cite the roadmap sections in their place.

In the same passage, "PDE §2.1 owns … the Fefferman–Stein inequality; this roadmap adds the case `r = ∞`" (line 704) overstates the supplier: PDE §2.1 states the `ℓ²` case only, and CA-B01 states the inequality for `1 < r ≤ ∞`. "this roadmap states it for every `1 < r ≤ ∞`" would be right.

## C02 — The module docstring does not say which headline theorems are absent from `Suggested.lean`

The Summary's headlines include the description on `ℝ^d` (CA-D05), the identification with the Littlewood–Paley spaces for `s > σ_p` (CA-C06, CA-D05), the interpolation of Besov spaces (CA-B08), the splines on `[0, 1]` (CA-E06) and the steps and Haar coefficients on the cube (CA-E11, CA-E13). None is stated, and the docstring ("states some of the roadmap's targets") names none and gives no reason. Add a sentence for each: stated, or not statable at the pins and which carrier is missing (for CA-B08, for instance, a `QuasiCouple` on `𝓢'(E, F)` needs the quasi-triangle inequality of `besovENorm` as a proof).

## C03 — The locators into Oswald, *Multivariate Haar systems*, are not those of the arXiv text cited beside them

The README gives "Lemma 2.1, (2.3), Theorem 1.1, Theorem 3.1 with (3.13), §5.4" with arXiv:2002.12917. In arXiv v1 the same results are Lemma 1 (§2.3), display (7), Theorem 1, Theorem 3 with (23), and §5.4; their content agrees with CA-E07, CA-E11 and CA-E13 (ranges `max(d(1/p − 1), 0) < s < 1/p`, `(d − 1)/d < p < ∞`, weight `2^{k(sp − d)}`). If the numbering is that of the journal, say so, as the reference to Kolomoitsev–Tikhonov does ("numbering of v3").

## C04 — The description's list of suppliers omits NoncommutativeIntegration

"It also consumes the Littlewood–Paley blocks … (PDE §7 and Tau Ceti), the interpolation pattern of PseudodifferentialOperators §5.3 and the Haar basis of BanachSpaceTheory B3" leaves out NoncommutativeIntegration §2.2 and §2.4, which the README consumes in CA-B08, and PDE §1 and §2.1. Add them.

## N01 — `Suggested.lean` imports `TauCetiRoadmap.ApproximationSpaces.Suggested`, the file of a roadmap that is still a pull request

The folder therefore builds only on a branch that carries that roadmap. Roadmaps on main do import one another's files, so this is form; the order of merging is noted for the human reviewers.

## N02 — The Provenance section sets names of another repository in code font

`Torus.memBesov_exists_inclusion_eq`, `Haar.memBesov_haarScheme_iff_modulus` and four more (lines 669–675) are declarations of Lean-FunctionSpaces, not of Mathlib, Tau Ceti or this file. "in that repository" after the first would tell a reader where to search.

## Questions for the author

- CA-B08 for `p < 1`: the route is "the retraction of `B^s_{p,q}` onto `ℓ^s_q(L_p)` (analysis by the blocks, synthesis by enlarged blocks)". For `p < 1` the synthesis `(g_j) ↦ ∑_j Δ̃_j g_j` is not defined on `ℓ^s_q(L_p)`: `L_p` does not embed in `𝓢'`, and Fourier multipliers are bounded only on spectrally localised functions (CA-B04). Is the retraction meant onto the subspace of sequences with `supp 𝓕g_j` in the ball of radius `2^{j+1}`, and how is that subspace interpolated? I could not read Triebel 1983, 2.4.2, so this is a question; the statement itself is the classical one.
- CA-A09 on boxes: is the constant meant to be uniform over all boxes, or over cubes only? With polynomials of coordinate degree below `r` and the isotropic modulus the statement does not say. I could not read Storozhenko–Oswald 1978.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Milestone A1: CA-A03 dilation `ω_r(f, λt)_p ≤ r^{(1/p−1)_+}(1+λ)^{r+(1/p−1)_+} ω_r(f, t)_p` | `Δ_{mh}^r = ∑_j c_j τ_{jh} Δ_h^r`, `j ≤ r(m−1)`, `∑ c_j = m^r` | `∑ c_j^p ≤ (rm)^{1−p} m^{rp}`; so `≤ r^{1/p−1} m^{r+1/p−1}`, `m = ⌈λ⌉ ≤ 1+λ` | holds | none |
| CA-A03 Check, `f = 1_{[0,1]}`, `p = 1/2` | `‖Δ_h f‖_p = (2h)^{1/p}` | `ω_1(f,2t) = (4t)² = 4(2t)²`; `ρ`-powers `4t = 2·2t`; `p ≥ 1`: ratio `2^{1/p}` | holds, equality | none |
| CA-A03 in Lean (`modulusOfSmoothness_add_rpow_min_le`) | `r = 0`, `p = 1`, Bernstein set; `r ≥ 1`, `ℚ`-hyperplane | left `∞`, right `0`; left `(2t)^{1/p}`-type positive, right `0` | false | R01 |
| CA-A05 Marchaud on `E` (Lean `modulusOfSmoothness_le_marchaud`) | `ω_r ≡ 0`; iteration `ω_k(t)^ρ ≤ 2^{−kρ} ω_k(2t)^ρ + C ω_{k+1}(t)^ρ`; KT2020 (1.18) | `f` polynomial in `L_p` gives `0 ≤ 0`; tail `2^{−nkρ}‖f‖^ρ → 0`; source has `∫_δ^∞`, exponent `min(p,2) ≥ ρ` | holds | none |
| CA-A05 on `𝕋^d` | KT2020 Remark 2 | source drops `‖f‖_p` on the torus; README keeps it (weaker) | holds | none |
| CA-A07 | `p < 1` remark vs KT2020 after Property 16 | source: directional K-functional vanishes identically for `p < 1` | agrees | none |
| Milestone A2: CA-A08 `ω^iso_1(f,t)^ρ ≤ ∑_i ω^{(i)}_1(f,t)^ρ` | telescoping along coordinates in the box | intermediate points have each coordinate between those of `x`, `x+h`, so lie in `Q` | holds | none |
| CA-A09 Whitney (Lean `exists_eLpNorm_sub_polynomial_le`) | `f = 1_{[0,1/2)}`, `r = 1`, `[0,1]`, `p < 1` | left `inf_c = (1/2)^{1/p}`; right `ω_1(f,1) = (1/2)^{1/p}` | consistent, `C ≥ 1` | none |
| CA-A10 averaged Whitney | jump at `1/2`; jump at `ε` | `1/2 ≤ W(1/18 + 1/3)`; `ε ≤ W(ε/3 + ε)` | consistent | none |
| Milestone B1: CA-B03 Peetre (Lean) | `a > d/r` vs classical `a = d/r`; `d = 0`; spectrum radius `rOut·2^j` | larger `a` gives smaller `g*`; `E` a point: `a > 0`, `g* = \|g\|`; `C` chosen after `φ` | holds | none |
| CA-B02 route | cycle check B02 ↔ B03 | B03 needs B01 and the `p = ∞` bound only | no cycle | none |
| Milestone B2: CA-B05 independence of bump (Lean) | arbitrary `rIn < rOut`; `d = 0`; `∑_j ψ_j` | `ψ_j` supported in `2^{j−1} rIn ≤ \|ξ\| ≤ 2^j rOut`, finite overlap; telescopes to `1` | holds | none |
| CA-B09 Check, `δ₀` | `ψ_j = ψ(2^{1−j}·)` | `‖Δ_j δ₀‖_p = 2^{(j−1)d(1−1/p)}‖𝓕⁻¹ψ‖_p = 2^{−(j−1)σ_p}‖·‖` | holds | none |
| CA-B09 statement | Nguyen–Sickel Prop. 2.4 | source: `s > d max(0, 1/p − 1)`, `s < m`, all `0 < p, q ≤ ∞` | agrees | none |
| CA-B08 route for `p < 1` | synthesis on `ℓ^s_q(L_p)` | `L_p ⊄ 𝓢'` for `p < 1` | not verified | question |
| Milestone C1: `torusTrigScheme` axioms | `A_0 + A_n`, `A_m + A_n`, `n = 1`, `d = 0` | `T_m + T_n ⊆ T_{max} ⊆ T_{m+n}`; `T_1` constants; all five fields proved in Lean | true, but `sorry` | R02 |
| CA-C03 Bernstein | `T ∈ T_{n+1}`, `n = 0`; `e_k` | constants: `0 ≤ 0`; `‖∂ e_k‖ = 2π\|k\|`, `\|k\| ≤ n` | holds | none |
| CA-C04 Jackson (Lean) | `n = 1`, `r ≥ 2`; `d = 0` | `ω_r(f,1) = 0` forces a periodic polynomial, a constant, in `T_1`; point: `0 ≤ 0` | consistent | none |
| CA-C05 Stechkin | KT 1711.08163 Prop. 4.2 | source: `∑_{k=0}^n (k+1)^{ατ−1} E_k^τ`, `τ = min(p,2)`; README `ρ ≤ τ` (weaker) | agrees | none |
| Milestone C2: CA-C06 (Lean iff) | `e_1`; `d = 0`; inverse order `θ = r` | `ω_r(e_1,t) = (2 sin πt)^r ≥ (4t)^r`; both sides `\|c\|`; `ω_r(T,2^{−k}) ≤ C 2^{(j−k)r}‖T‖` | holds; `s < r` sharp | none |
| CA-C08 | `s = 0`, `q = 4`, `b_j = j^{−0.6}`; `q = 2`, `b_j² = 1/(j log² j)` | `∑ b_j⁴ < ∞` but `E_{2^k}⁴ ≍ k^{−0.4}`; `∑ b_j² < ∞` but `∑ j b_j² = ∞` | false at `s = 0` | R03 |
| CA-C10 Nikolskii (Lean) | `p = r`; `p = ∞`; `d = 0` | exponent `0`, `C = 1`; `1/∞.toReal = 0`; both sides `\|c\|` | holds | none |
| Milestone D1: CA-D01 | `B_{0,∞}`, `B_{0,p}`; Fejér kernel | constants; `{0}` for `p < ∞`; decay `\|x\|^{−2}` in `L_p` iff `p > 1/2` | holds | none |
| CA-D02, CA-D03, CA-D04 | KT2020 Cor. 2–3, Properties 12, 13, 17; dilation | sources for all `0 < p ≤ ∞`; (1.39) for `δ ∈ (0,1)`, all `t` by scaling | agrees | none |
| CA-D03 kernel identity | `f − ∑_{l=1}^r (−1)^{l+1} C(r,l) ∫Φ_σ(y) f(·+ly) dy` | equals `(−1)^r ∫ Φ_σ(y) Δ_y^r f dy` since `∫Φ = 1`; spectrum in ball `σ/l` | holds | none |
| Milestone D2: CA-D07 | `p < 1`, tail `\|h\| > 1`; `1_{[0,∞)}ψ` | tail `≤ 2‖f‖_p^p ∫_{\|h\|>1} \|h\|^{−sp−d}`; seminorm finite iff `s < 1/p` | holds | none |
| Milestone E1: CA-E01 Check, CA-E05, CA-E06 | `r = 1`, `f ∈ C¹`; jump `χ`; line `x` | `ω_1 ≍ t`, so `2^{ks}ω_1 ∉ ℓ_q` for `s ≥ 1`, `q < ∞`; `ω_1(χ,t) = t^{1/p}`; Oswald 2018 end of §2 | holds | none |
| Milestone E2: CA-E07, CA-E08 | Oswald 2018 Thm 1; Oswald 2021 Thm 3 (v1); `1/τ = α + 1/2` | basis iff `d(1/p−1) < s < 1/p`; weight `2^{k(sp−d)}`; `α − 1/2 < α < α + 1/2` | agrees | C03 |
| Milestone E3: CA-E11 Jackson | averaging over a cell of side `δ` | `∑_cells ≤ δ^{−d}(2δ)^d ω^p`, so `E ≤ 2^{d/p} ω^iso_1` | holds, constant exact | none |
| CA-E11 inverse, CA-E12 | `g = 1_cell`; `N = 2^{(m−k)d}` subcells | `‖Δ_h g‖_p^p ≤ C 2^{−(k−j)}‖g‖_p^p`; `N\|mean\|^p ≤ N^{1−p} ∑\|a_i\|^p` | holds | none |
| CA-E13 range | `d = 2`, `p = 1/2`; `p = 2/3` | `2 = 2`, empty; `1 < s < 3/2` | holds | none |
| "This roadmap owns" | search of main and the open heads for moduli of smoothness, Marchaud, Whitney, Peetre, B-splines, Nikolskii, Slobodeckij | no other roadmap states them; Mathlib and Tau Ceti at the pins have none | sole owner | none |
| "Owned elsewhere and consumed here" | PDE §1, §2.1, §7.1–7.2; NCI §2.2, §2.4; PsiDO §5.3; BST §3.5; PIBA §4.1, §4.3, §5.1, §5.2; Sampling §6.1 | each section exists on main with the stated subject; PDE §2.1 has Fefferman–Stein for `ℓ²` only | resolves | C01 |
| Headline: Summary, torus description | as CA-C06 | as above | holds | none |
| Headline: Whitney | as CA-A09 | as above | holds | none |
| Headline: steps and Haar on the cube | as CA-E11, CA-E13 | as above | holds | none |

- Source locators checked against the text: 19 (Kolomoitsev–Tikhonov 2020: Properties 7, 12, 13, 16 with the remark after it, 17, Remark 2, Lemma 1, Remark 3, Corollaries 2 and 3, (1.18); Kolomoitsev–Tikhonov 1711.08163 Prop. 4.2; Nguyen–Sickel Prop. 2.4; Oswald 2018 Theorem 1 and the end of §2; Oswald 2021 Lemma 1, Theorem 1, Theorem 3, §5.4).
- Library declarations opened at the pins: `TauCeti.maximalFunction` (`MeasureTheory/Integral/MaximalFunction.lean:125`), `TauCeti.eLpNorm_maximalFunction_le` (same file, 475), `TauCeti.CircleSobolev` (`Analysis/Sobolev/Circle/Basic.lean`), `TauCeti.Wkp`; Mathlib `TemperedDistribution.fourierMultiplierCLM` (`Analysis/Distribution/FourierMultiplier.lean:143`), `Function.HasTemperateGrowth.toTemperedDistribution` (`Analysis/Distribution/TemperedDistribution.lean:98`), `ENNReal.LpAddConst`, `eLpNorm_add_le'`, `UnitAddTorus.mFourierCoeff`, `mFourierBasis`, `Integrable.tendsto_ae_condExp`.
- Cross-roadmap citations resolved: 13 `AS-…` labels in the ApproximationSpaces folder of this pull request, and 12 sections of 7 roadmaps on main.
- Dependency check: `depcheck: 94 roadmaps, 1056 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives nine `declaration uses sorry` warnings and nothing else. `#check @name` on all 16 declarations: each elaborated type equals its README statement except the one of R01; no section variable is lost.
- One-tactic probe: none of the eight sorried theorems closes with `simp`, `rfl` or `infer_instance`; nothing is padding.
- Duplication: nothing in the pinned Mathlib or Tau Ceti states a modulus of smoothness in `L_p`, Whitney's, Marchaud's, Nikolskii's or Peetre's inequality, or B-splines.
- Changes outside the two folders of the pull request: none.

Overlap check: read ApproximationSpaces, PolynomialInterpolationAndBestApproximation, PseudodifferentialOperators; Bernstein's inequality for trigonometric polynomials is shared with PolynomialInterpolationAndBestApproximation §4.1, which owns the real, one-variable, uniform-norm case, and this roadmap the `L_p(𝕋^d)` statement for every `p`; the modulus of continuity stays with §5.1 there; the K-method for `q ≥ 1` stays with NoncommutativeIntegration §2.4; nothing else shared.

Source independence: 8 passages compared with 5 sources, none shared beyond formulas; largest share Kolomoitsev–Tikhonov 2020, about 14 of about 75 locators; contents compared with it (Properties 1–17 in order against CA-A05, CA-A07, CA-C09, CA-D02–CA-D05): independent. DeVore–Popov 1988, with about 12 locators, could not be read.

Research link: CA-A05, CA-C09 and CA-D02–CA-D05 state results of Kolomoitsev–Tikhonov (2020); CA-E07, CA-E11 and CA-E13 those of Oswald (2018, 2021) on Haar systems in Besov spaces for `p < 1`; CA-E06 and CA-E10 DeVore–Popov (1988). Rests on the sources read, except DeVore–Popov, which rests on the README.

## Not verifiable

- DeVore–Popov 1988 (Lemma 4.1, (4.18), (4.20), Theorems 4.5, 4.8, 5.1, 7.1, Corollary 5.3): the publisher's page is on a host the sources service does not class as open.
- DeVore–Lorentz 1993, Triebel 1983 and 1992, Schmeisser–Triebel 1987, Bergh–Löfström 1976, Nikolskii 1975, de Boor 2001: books with no open copy.
- Storozhenko 1977, Storozhenko–Oswald 1978, Storozhenko–Krotov–Oswald 1975, Runovskii 1993 and 1994, Arestov 1981, Johnen–Scherer 1977, Ditzian–Hristov–Ivanov 1995, Oswald 1980 and 1981, Ciesielski 1975, Gagliardo 1957, Fefferman–Stein 1971, Peetre 1975, DeVore 1998, DeVore–Jawerth–Popov 1992, Day 1940: not fetched; cited by locator only.
- The 18 Tau Ceti declarations of C01: absent at the pin, and no later Tau Ceti was available to open.
- The declarations of Lean-FunctionSpaces named in the Provenance section: the repository was not opened.

Automatic checks set aside as false positives: the report of TeX-only syntax in CA-D08 (the formula is inside a code span that runs over two lines, so it is already code).

## Source issues

- none

## For the human reviewers

- **Merge order.** `TauCetiRoadmap/ClassicalApproximationSpaces/Suggested.lean` line 9 imports the ApproximationSpaces file of #3202, and the branch carries that commit; this folder cannot merge before #3202.
- **Licence.** The README's Provenance section and the description say the text was drafted from the blueprint of Lean-FunctionSpaces (the author's own repository, stated Apache 2.0). I did not open it, so the Lean statements were not compared with it.
- **Not tested.** DeVore–Popov 1988 (about 12 of 75 locators, second-largest share) could not be read: wording and arrangement were not compared with it.
