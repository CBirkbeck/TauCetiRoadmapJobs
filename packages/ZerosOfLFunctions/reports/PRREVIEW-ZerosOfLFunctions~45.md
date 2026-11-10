# Review of ZerosOfLFunctions (pull request #1913 at ad6372b)

**Verdict:** needs changes

:robot: AI-assisted review (Claude Opus 5.5). This is an incremental re-review of the 32 lines changed in `TauCetiRoadmap/ZerosOfLFunctions/README.md` since `9b48d25`. `Suggested.lean` and every file outside the folder are unchanged. The gate passes and the dependency check reports no problem. One P3 finding remains, in the rewritten 8.6 *Needs:* line. It is not blocking.

## R01 (P3) — The Weil clause of the 8.6 *Needs:* line credits 7.2 with residues that 7.2 does not compute

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md` lines 2347–2348:

> the argument of 8.4 run for `Λ(χ, ·)`, with 7.2 for the residues and the edge bounds of 8.2 (5.6, 1.4 and 4.5 for `χ`)

**Claim.** 7.2 (README lines 1967–1977) is the unweighted argument principle: `(2πi)⁻¹ ∫ f'/f` over the rectangle equals `∑ ord_s f`. The shift of 8.4, run for `χ`, integrates a *weighted* logarithmic derivative, `(Λ'/Λ)(χ, s) φ̃(s)`, and picks up `m_ρ φ̃(ρ)` at each zero (README line 2207). 7.2 cannot produce that residue for any weight other than a constant.

The README names no residue theorem anywhere. The contour bullet of "From Tau Ceti" (lines 267–282) lists only `argumentPrinciple_nullHomologous` and `residue_logDeriv_eq_meromorphicOrderAt` for residues.

**Witness.**

- Take `F(z) = z²` on the square `Icc (−1) 1 ×ℂ Icc (−1) 1` with the weight `g(z) = z`. 7.2 returns the count `2`, but `(2πi)⁻¹ ∮ g F'/F = Res₀(z · 2/z) = 0`. With `g(z) = eᶻ` the weighted residue is `2`. The residue depends on the weight, and 7.2 never sees the weight.
- The residue theorem the step needs is pinned: `TauCeti.Contour.classicalResidueTheorem_nullHomologous` (Tau Ceti `Analysis/Contour/Residue/Cycle.lean:226`). It applies to any closed piecewise-`C¹` null-homologous curve, which covers the rectangle of 7.1.

**Repair.**

1. In the 8.6 *Needs:* line, replace "with 7.2 for the residues" by:

   > with the rectangle of 7.1 and Tau Ceti `TauCeti.Contour.classicalResidueTheorem_nullHomologous` for the residues, the residue `m_ρ φ̃(ρ)` at a zero `ρ` read off `TauCeti.Contour.logDeriv_eventuallyEq_principalPart` and `TauCeti.Contour.residue_eq_of_tendsto_sub_mul`

2. In the contour bullet of "From Tau Ceti" (lines 267–282), add these three declarations with their files:
   - `TauCeti.Contour.classicalResidueTheorem_nullHomologous` (`Residue/Cycle.lean`);
   - `TauCeti.Contour.logDeriv_eventuallyEq_principalPart` (`Argument/Principle.lean`);
   - `TauCeti.Contour.residue_eq_of_tendsto_sub_mul` (`Residue/SimplePole.lean`).

**Tested.** I elaborated this example in a scratch module with `lake env lean` at the pins. It gives no error and no warning. On the witness (`F = z²`, `n = 2`, `g = id`) it gives `0 · 2 = 0`; with `g = exp` it gives `1 · 2 = 2`.

```lean
example {F g : ℂ → ℂ} {s : ℂ} {n : ℤ} (hF : MeromorphicAt F s)
    (hn : meromorphicOrderAt F s = (n : WithTop ℤ)) (hg : AnalyticAt ℂ g s) :
    residue (fun z => g z * logDeriv F z) s = g s * n := by
  obtain ⟨h, hh_an, hh_ne, hgerm⟩ := logDeriv_eventuallyEq_principalPart hF hn
  have hmero : MeromorphicAt (fun z => g z * logDeriv F z) s :=
    hg.meromorphicAt.mul (hF.deriv.div hF)
  apply residue_eq_of_tendsto_sub_mul hmero
  have hlog : AnalyticAt ℂ (logDeriv h) s := analyticAt_logDeriv_of_analyticAt hh_an hh_ne
  have hlim : Tendsto (fun z => g z * ((n : ℂ) + (z - s) * logDeriv h z)) (𝓝[≠] s)
      (𝓝 (g s * ((n : ℂ) + (s - s) * logDeriv h s))) :=
    ((hg.continuousAt.tendsto.mono_left nhdsWithin_le_nhds).mul
      (tendsto_const_nhds.add
        (((continuous_sub_right s).tendsto s).mono_left nhdsWithin_le_nhds |>.mul
          (hlog.continuousAt.tendsto.mono_left nhdsWithin_le_nhds))))
  simp only [sub_self, zero_mul, add_zero] at hlim
  refine hlim.congr' ?_
  filter_upwards [hgerm, self_mem_nhdsWithin] with z hz hzs
  rw [hz]
  have : z - s ≠ 0 := sub_ne_zero.mpr hzs
  field_simp
```

The example imports `TauCeti.Analysis.Contour.Residue.SimplePole`, `…Residue.Cycle` and `…Argument.Principle`, and opens `Filter Topology TauCeti.Contour`. `analyticAt_logDeriv_of_analyticAt` is the Tau Ceti lemma at `Analysis/Contour/LogDerivFTC.lean:165`; item 2 may list it as well.

## Previous findings

- R01 — repaired: the line is split. "for the truncated formula and the estimate of `ψ_K(x, χ)`: 8.1, and the arguments of 8.2, 8.3 and 8.5 run for `Λ(χ, ·)` … For the Weil formula … 1.4 … `isFiniteOrder_ofRayClassCharacter` (the finite-order hypothesis of the next two)". The contract (lines 337–343) adds it too. The residue attribution is new R01.
- R02 — repaired: the description now reads "**Suppliers.** LFunctions and ClassFieldTheory, and the completed ArithmeticDirichletSeries, GlobalNumberFields, NumberFieldArithmetic, Chebotarev and ContourIntegration roadmaps …", and it names all eight added theorems.

## Verified sound

**Gate.** I re-ran it at `ad6372b`:

```text
gate ZerosOfLFunctions: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's run, which includes the targeted build, also reports `build=0`. Nothing changes outside the folder.

**Dependency check.** Output: `depcheck: 235 roadmaps, 2265 edges, 0 problem(s)`. There is no UPWARD and no CYCLE line. The change adds no supplier: every new item on the 8.6 line is a section of this roadmap, LFunctions on main, or the Tau Ceti pin.

**Elaboration.**

- `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` gives 19 `sorry` warnings and nothing else.
- I appended `#check @…` for each of the 20 theorems to a scratch copy. All elaborate. The file has no `variable` block, so no declaration can lose a binder.
- `heckeLFunction_weilExplicitFormula` still takes `ψ ≠ 1`, `ContDiff ℝ ↑⊤ φ`, `HasCompactSupport φ` and `tsupport φ ⊆ Ioi 0`, and puts the divisor indicator on `Ioo 0 1 ×ℂ univ`, as 8.6 says.
- `Suggested.lean` is unchanged since `9b48d25`, so the previous padding probe (19 of 19 theorems fail every one-tactic closer) stands.

**The changed passages, against the pin (Tau Ceti `2fd255d`).**

| Claim in the change | Pinned declaration, file:line | Checked |
| --- | --- | --- |
| `isFiniteOrder_ofRayClassCharacter` (contract, lines 340–343) | `HeckeCharacter/Basic.lean:186`: `(χ : RayClassCharacter 𝔪) : (ofRayClassCharacter 𝔪 χ).IsFiniteOrder` | no hypothesis; holds for every ray-class character, as line 2325 says |
| "the first two take the hypothesis" (line 2323) | `mem_conductor_infinitePart_iff` (`HeckeCharacter/RealParity.lean:79`, `hχ : χ.IsFiniteOrder`); `conductor_ofRayClassCharacter` (`RayClass/Character/Conductor.lean:81`, `hη`) | both take it |
| the third takes none | `PrimitiveRayClassCharacter.conductor_character` (`LFunctions/Hecke/Primitive.lean:104`) | no finite-order argument |
| the lemmas "applied to `χ` and to `χ⁻¹`" (line 2356) | `PrimitiveRayClassCharacter.conductor_inv`, `character_inv` (`Primitive.lean:204, 208`) | the chain elaborates for `ψ` and for `ψ⁻¹` (scratch; below) |
| reflection to `χ⁻¹` | LFunctions `Suggested.lean` on main, line 1661: `completedHeckeLFunction K χ s = heckeRootNumber K χ * completedHeckeLFunction K (inv K χ) (1 − s)`, `hχ : χ.character ≠ 1`; line 1648 `differentiable_completedHeckeLFunction` | as the route uses it |

I elaborated two examples in a scratch module.

- The first is the previous round's chain for `ψ`: `isFiniteOrder_ofRayClassCharacter`, `mem_conductor_infinitePart_iff`, `conductor_ofRayClassCharacter`, `conductor_character`.
- The second shows that `ψ⁻¹` has the real parities of `ψ`. It uses the same four lemmas at `ψ⁻¹`, closed with `conductor_inv`.

Neither gives an error.

**The rewritten 8.6 *Needs:* line, item by item.**

- **Truncated formula and `ψ_K(x, χ)`.** 8.1 is consumed directly. 8.2, 8.3 and 8.5 are re-run for `χ`, with 8.2's own inputs (line 2149: 7.2, 5.6, 1.4, 1.5, 4.5). The region 6.3–6.4 replaces 8.5's 6.2–6.3 (line 2280). 6.5 gives `Λ(χ, 0) ≠ 0`, hence the order at `0`. Arithmetic Dirichlet Series §2.3 supplies the weight of `χ`. The prime-count inputs of 8.5 (Arithmetic Dirichlet Series §§4.3, 6.1–6.2) are correctly absent, since the `χ` estimate concerns `ψ_K(x, χ)` only.
- **Weil formula.**
  - 8.2's edge bounds (5.6, 1.4, 4.5) cover the horizontal edges.
  - 1.5 gives the poles of `γ_χ`.
  - 5.6a and 6.5 identify the open-strip zeros.
  - Arithmetic Dirichlet Series §2.3 covers `χ` and `χ⁻¹`; `heckeData`, `differentiable_completedHeckeLFunction` and `completedHeckeLFunction_one_sub` come from LFunctions on main; the four Tau Ceti lemmas and Mathlib `mellin`, `mellinInv_mellin_eq` complete the list.
  - Summability of the zero side follows from 5.6a and the decay of `φ̃`.
  - The one gap is the residue step (R01).
- **No dependence on 8.3, 8.5 or 6.3–6.4.** The Weil clause no longer depends on them, which was the aim of the previous R01.

**Cross-roadmap citations resolved.**

- The 13 names in `citations.md` are on untouched lines.
- The six `Grossencharacter.*` names (README 521–524) are declared in LFunctions `Suggested.lean` on main, in its `namespace Grossencharacter` (lines 1754, 1884, 2092). I counted one declaration each.
- The seven Provenance names (README 2776–2779) are PrimeNumberTheoremAnd names, checked by the previous review at that project's commit.
- `overlaps.md`: #1907 still conflicts in both files, and the generated `merge-order` block orders this pull request first. No id this README cites is dropped, and no id it drops is cited elsewhere. The change adds no owned object, so the ownership result of the previous review stands.

**Seeded sample, where it falls in the change.** The changed line cites 6.2, 6.5 and 8.5.

- **6.2:** `kadiri2012` lines 79–85 (Theorem 1.1) give a zero-free region for `|Im s| ≥ 1` and at most one zero, real and simple, for `|Im s| ≤ 1`, with `d_K` large. This supports the citation as worded.
- **6.5:** values in the table below.
- **8.5:** its Davenport §18 locator is uncertified, and its pinned declarations were checked by the previous review.

The other sampled targets (0.2, 0.4, 1.2, 1.3a, 2.3, 2.5, 3.3, 3.5, 4.2, 4.4, 5.4, 7.3) lie outside the changed passages. Their rows, where the previous report has them, are carried below.

**Remark on untouched text (no change asked).** 8.2's *Needs:* (line 2149, "8.1, 7.2, 5.6, 1.4, 1.5, 4.5") and 8.4's (line 2225, through 8.2) rest on the same weighted residues: `(−ζ'_K/ζ_K) xˢ/s` and `(Λ_K'/Λ_K) φ̃`. Neither names the residue theorem. Adding the names of R01 there as well would make "their inputs" in the first clause of 8.6 accurate.

**Adversarial table.** Rows marked *new* were computed this round. The rows marked *carried* are the previous report's (review of `9b48d25`), for statements this diff leaves untouched.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| *new* — `isFiniteOrder_ofRayClassCharacter` feeds the parity chain (contract, 8.6 prose) | quartic `χ` mod 5 with `χ(2) = i`; `χ⁻¹`; `χ₋₄`; `ℚ(√3)` narrow `ψ` | `χ(−1) = χ(4) = i² = −1`, so odd, `𝔣 = (5)∞`, parity `1`; `χ⁻¹(−1) = (−i)² = −1`, the same shift `1`, as "`χ⁻¹` has the shifts of `χ`" says; `χ₋₄`, `ψ` real so `χ⁻¹ = χ`; chain elaborates for `ψ` and `ψ⁻¹` | true | none |
| *new* — 8.6 *Needs:*, truncated clause: 6.5 for the order at `0` | `χ₋₄` (odd); `χ₅` (even, mod 5) | `χ₋₄`: order `0 + 0 = 0`, `L(0, χ₋₄) = 1/2`; `χ₅`: order `#{a = 0} + r₂ = 1`, `L(0, χ₅) = 0`, `L'(0, χ₅) = log((1+√5)/2) = 0.481212`, so `Λ(χ₅, 0) = 2 · 0.481212 = 0.962424 = √5 · L(1, χ₅) = √5 · 0.430409 = Λ(χ₅, 1)` (series to `4·10⁶`: `0.430409`): order exactly `1` needs 6.5's `Λ(χ, 0) ≠ 0` | true | none |
| *new* — 8.6 *Needs:*, Weil clause: "7.2 for the residues" | `F = z²` on the unit square, weights `g = 1, z, eᶻ` | 7.2 count `2` for every weight; weighted residue `g(0) · 2 = 2, 0, 2` (scratch lemma) | false attribution | R01 |
| *new* — 6.5 (cited by the change) | trivial character at `1`; `ζ` at `1+2i`; `χ₄` at `1` | `ord Λ = −1`; `0`, reflected `0` at `−2i`; `2 · (1/π) · (π/4) = 0.500000`, order `0` | true | none |
| *carried* — 8.6 `heckeLFunction_weilExplicitFormula` (statement untouched) | contour; `χ₋₄`; `ℚ(√3)` narrow character; quartic mod 5 | zero side `(2πi)⁻¹∫_{(2)} (Λ'/Λ(ψ,s) φ̃(s) + Λ'/Λ(ψ̄,s) φ̃(1−s))`, no pole term; `log 4 = 1.3863`, `Λ(0) = Λ(1) = 1/2`; `log 12 = 2.4849`, `L(0) = 1/6`, `ψ((1+√3)) = −1`; `+0.346574i` | true | none |
| *carried* — 0.4 *HasVerticalStripGrowth* | pole at `1+5i`; constant `1`; `exp(−s²)` | unbounded as `σ→1` at `t=5`; `C=1, A=0, T₀=0`; `‖exp(−(it)²)‖ = exp(t²)` | sound | none |
| *carried* — 1.1 *logGamma* | `θ = π/2, π/4, 0.1`; value at `3` | first `Im = π` at `r = 5.53860, 4.15135, 12.62640`; `exp(logGamma 3) = 2.000000` | sound | none |
| *carried* — 1.2 Stirling | §5.11(ii), `n = 1` | `\|R\| ≤ 1/(12‖s‖ sin²(δ/2))` on `S_δ` | sound | none |
| *carried* — 1.3 strips | `z = σ+it` | `ln\|z\| = ln\|t\| + O(t⁻²)`, `−t arg z = −π\|t\|/2 + σ + O(t⁻²)` | sound | none |
| *carried* — 1.4 gamma log-derivatives | `s = 2, 3, 1`; pole `−2` | `−0.860973`, `−0.554120`; `logDeriv Gammaℂ 1 = −2.415093`; junk `−(log π)/2` at `−2` | sound | none |
| *carried* — 1.4a symmetric form | `s = 2`; `s = −2`; `ψ(i)` | `1.415093` both sides; `−0.16482` vs `0.55412`; `Im ψ(i) = 2.076674` | sound | none |
| *carried* — 2.4 newform conductor | `Δ`, `k = 12` | `90` at the analytic centre vs `15.75` | sound | none |
| *carried* — 4.2 divisor of `Λ` | `ζ` record at `1` (`U = ∅`, `univ`); at `−2` | `0`, `−1`; `0`; entire completion `−1 + 1 = 0` | sound | none |
| *carried* — 4.4 local count | `ζ` at `T = 0, √15` | `\|Gammaℝ\| = 15708`; `\|ζ\| = 1.218·10⁻⁵`; `6Λ(3) = 1.147880`; Jensen `2.1942` | sound | none |
| *carried* — 4.6 Nevanlinna | `z²(z−3)`; `1/z` | `1.386 ≤ 1.674`; `3 log(5/3) = 1.5325` both sides | sound | none |
| *carried* — 5.2 *E₁* | `z = −½`, `1` | `0.09020 ≤ 0.125`; `E₁′(1) = −e` | sound | none |
| *carried* — 5.6 `Re b` | `zetaEntireCompletion`; `e^s ·`; `χ₄` | `b = −0.023096`; `b + 1 = 0.976904`; `Λ(0) = Λ(1) = 1/2` | sound | none |
| *carried* — 6.3 *IsExceptionalZero* | cap; `ζ` | `≤ (log 3/2)/log 3 = 1/2`; empty for `ζ` | sound | none |
| *carried* — 6.4 region (incl. 6.2 at `χ = 1`) | LMO containment; moduli 2, 6; (4d) | `log q ≥ log A + n log(\|γ\|+2)`; nesting `1.2619`; `log 18 = 2.890`; `13.8581`; `499242` | sound | none |
| *carried* — 7.4 `riemannVonMangoldt` | `T = 2` | `N(2) = 0`, main term `−0.682` | true | none |
| *carried* — 8.5 checks | `x = 10`, `10⁶` | `log 12 = 2.4849 ≤ 12.094`; `1102.42 ≤ 137682.40`; `99.11` | sound | none |
| *carried* — 8.7 ray-class count | `q = 1, 3, 10⁶`; `(4)∞` at `x = 9` | `0.6957`, `2.4958`, `190.868`; `log 21 = 3.0445` vs `log 63 = 4.1431` | sound | none |
| *carried* — 8.9 `Li` | `x = 10`, `10⁴` | `5.12044`; `159.356` vs `117.882` | sound | none |
| *carried* — `dirichletLFunction_convexity` | `q = 1, 2`; exponent | `ζ`; vacuous at 2; `(½+δ)²/(1+2δ) = ¼ + δ/2` | true | none |
| *carried* — `hadamard_of_orderLE_one` | `ρ = 0`; a zero; `1 − s` | exponent `0`; `E₁(1) = 0`; `a = 0`, `b = −1` | true | none |
| *carried* — `zetaEntireCompletion` | `s = 0, 1` | value `1` at both | sound | none |
| *carried* — `riemannZeta_zeros_summable_ordinate` | first pair | `2/(1 + 14.1347²) = 0.00996` | true | none |
| *carried* — `heckeLFunction_zeroFreeRegion` | `n = 0`; `ℚ`, `ψ = 1` | vacuous; argument `≥ log 3 > 0` | true | none |
| *carried* — `riemannZeta_zeroFreeRegion` | real `s` near `1`; `s = 1` | `ζ < 0` on `(0, 1)`; excluded | true | none |
| *carried* — `dirichletLFunction_zeroFreeRegion` | mod 2; mod 6 | zeros on `Re s = 0`; needs `c ≥ 2.890 > 0.549` | true | none |
| *carried* — `neg_re_logDeriv_riemannZeta_le` | `δ ≥ 1`; `\|u\| ≥ 1`; `t → 0` | `0.5700`; `1/(2\|u\|)`; `1/(4\|t\|)` | true | none |
| *carried* — `riemannVonMangoldt_heckeLFunction` | `ψ = 1` vs HSW | `hasanalizade2022` line 27; `≤ C log(AT^n)` | true | none |
| *carried* — `riemannVonMangoldt_dirichlet` | BMOR; `q = 1` | `bennett2021` lines 83–84; `2N(T)` | true | none |
| *carried* — `chebyshevPsi_explicitFormula` | constant; `T ≤ x` | `−log 2π = −1.8379`; `log x ≤ (1/log 2) x log²x/T` | true | none |
| *carried* — `dedekindZeta_weilExplicitFormula` / `riemannZeta_weilExplicitFormula` | `ℚ(i)`; `ℚ(√5)`; `ℚ` | `log 4`; closed strip adds `φ̃(0) > 0`; `−(log π)φ(1)` | true | none |
| *carried* — `primeIdealCount_effective` | `K = ℚ`, `x = 10` | `π(10) = 4` vs `16/3` | true | none |
| *carried* — `rayClassPrimeCount_effective` | `(3)∞`; `ℚ(√−5)`, `𝔪 = 1` | `#Cl = 2`; `p ≡ 1, 9 (mod 20)` | true | none |
| *carried* — `primeCounting_progression_effective` | `q = 4`, `a = 2`; `q = 1` | count `1` vs `Li x/2`; `π(x)` | true | none |
| *carried* — `frobeniusPrimeCount_effective_abelian` | `K = L = ℚ`; `ℚ(i)/ℚ`; `(8)∞` | `π(x)`; `1/2`; `(2/5) = (−2/5) = −1` | true | none |

## Not verifiable

- **Uncertified texts, cited by locator.** Davenport (`davenport2000`, §§17–20, which 8.5 and 8.6 cite) and Lang XVII §3 (`lang1994`, for 8.4 and 8.6). The change does not touch their locators.
- **Ownership against open pull requests.** I checked it with `overlaps.md` (#1907) and the previous review's `roadmaps grep` result. The change adds no object, so I did not repeat the search across all sibling checkouts.

## Source issues

- **Misprint** in kadiri2012 at §1, (1.6), arXiv v1 p. 2: the source says Lagarias–Montgomery–Odlyzko find no zeros at all in region (1.6); it should say at most one, the possible real zero of (1.5), which lies in (1.6); affects nothing.
