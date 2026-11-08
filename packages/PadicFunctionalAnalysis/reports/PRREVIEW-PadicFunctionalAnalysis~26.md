# Review of PadicFunctionalAnalysis (pull request #1807 at bdcbdaa)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 7e8275c: `git diff 7e8275c4..bdcbdaa9 -- TauCetiRoadmap/PadicFunctionalAnalysis` is empty (README 1146 lines, `Suggested.lean` 134 lines, byte-identical), the three commits since then touch only BordismFormalGroups, RigidAnalyticGeometry and TopologicalKTheory, and the pins are unchanged (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`). The worker's gate at this head passes every check (`… depcheck=0 … outside-folder=0 … build=0 OK`); my rerun of the dependency check prints `depcheck: 245 roadmaps, 2467 edges, 0 problem(s)` with no UPWARD, CYCLE or `moved:` line; `lake env lean TauCetiRoadmap/PadicFunctionalAnalysis/Suggested.lean` exits 0 in 4 s with exactly six `declaration uses sorry` warnings (lines 63, 72, 90, 99, 113, 125). Nothing in the folder was repaired, so the five findings of the previous review stand; they are restated below with their witnesses re-checked at this head.

## R01 (P2) — The analytic-level criterion for weights (§5.4, with its §4.6 input) is statable at the pins and absent from `Suggested.lean`

Location: README lines 17–22 ("The central remaining targets are … analytic levels of weights"), §4.6 lines 757–759 ("`χ_t` lies in the image of `LA_h(K)` exactly when `‖t‖ < p^(−1/((p−1)p^h))`"), §5.4 lines 944–951; `Suggested.lean` module docstring lines 19–32, which names only the §4.7 bijection as not statable.

Claim: the Lean file states the roadmap's headline theorems that the pinned libraries do not prove.

Witness: the pinned `Amice/Character.lean` header (lines 36–39 at Tau Ceti `2fd255d9`) says the converse "`χ_t` lies in the image of `LA_h(K)` only when `‖t‖ < r_h`" needs Amice's basis theorem and is not proved there. Every carrier is pinned: `TauCeti.AnalyticStage.eval`, `PadicInt.addChar_of_value_at_one`, `TauCeti.amiceRadius` (`Amice/Norm.lean` 54), `TauCeti.WeightSpace.principalChar` and `.coord` (`WeightSpace.lean` 122, 156) with `principalChar_eq_addChar_of_value_at_one` (185). The two statements below elaborate at this head under `lake env lean` (exit 0, two `sorry` warnings, 19 s, with the module `TauCeti.NumberTheory.Padics.Distribution.Amice.Character` already built):

```lean
theorem exists_eval_eq_addChar_iff (h : ℕ) {K : Type*} [NormedRing K] [NormMulClass K]
    [NormOneClass K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] [Module ℚ_[p] K]
    [NormSMulClass ℚ_[p] K] [IsUltrametricDist K] [CompleteSpace K] {t : K}
    (ht : Tendsto (t ^ ·) atTop (𝓝 0)) :
    (∃ f : TauCeti.AnalyticStage p h K,
        ⇑(TauCeti.AnalyticStage.eval ℤ_[p] f) = PadicInt.addChar_of_value_at_one t ht) ↔
      ‖t‖ < TauCeti.amiceRadius p h := by
  sorry

theorem exists_eval_eq_principalChar_iff (h : ℕ) {K : Type*} [NormedRing K] [NormMulClass K]
    [NormOneClass K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] [Module ℚ_[p] K]
    [NormSMulClass ℚ_[p] K] [IsUltrametricDist K] [CompleteSpace K]
    (κ : TauCeti.WeightSpace p K) :
    (∃ f : TauCeti.AnalyticStage p h K, ⇑(TauCeti.AnalyticStage.eval ℤ_[p] f) = κ.principalChar) ↔
      ‖κ.coord‖ < TauCeti.amiceRadius p h := by
  sorry
```

The hypotheses are those of the pinned section at `Amice/Character.lean` 254–256 (multiplicative norm, as §4.6 and §5.4 require). The second is §5.4 at principal-character level `h`, which is level `h + v_p(q)` on `ℤ_pˣ`: `amiceRadius p h = p^(−1/((p−1)p^h))` equals the README's `p^(−q/(p^(h+v_p(q))(p−1)))` since `q = p^(v_p(q))`, so the natural-number subtraction `h − v_p(q)` is avoided. Both are true: "⇐" is the pinned `eval_addCharExpansion` (216); "⇒" is Amice's theorem (`amiceMap_bijective_and_norm_eq`) with `eval_injective`, `eval_amiceMap` and `tendsto_amiceCharCoeff_iff` (161); the second follows from the first by `principalChar_eq_addChar_of_value_at_one`.

Repair: add both theorems to `Suggested.lean` (the §4.6 one under a Layer 4 section comment, the §5.4 one under Layer 5), import `TauCeti.NumberTheory.Padics.Distribution.Amice.Character`, name them in §4.6, §5.4 and the "How to read the build" list of README lines 1047–1051, and reword §5.4 to state the level at which the principal character is analytic.

## R02 (P2) — §3.2: "contractive exactly when `‖g‖ ≤ 1`" fails for the zero module

Location: README lines 566–567 ("Target: multiplication by `g` on `C(ℤ_p,E)` is bounded by `‖g‖`, and is contractive exactly when `‖g‖≤1`"); Convention 3 (lines 78–79, "Empty indices and zero modules have norm zero") admits the instance.

Claim: multiplication by a continuous scalar function `g` is a contraction of `C(ℤ_p,E)` if and only if `‖g‖ ≤ 1`.

Witness: `E = 0`, `g = p⁻¹` (constant, `‖g‖ = p`): `C(ℤ_p, 0) = 0`, so multiplication by `g` is the zero map, contractive, while `‖g‖ = p > 1`. The same happens for any `E` on which the scalar action is not norm-faithful. The bound `‖g·f‖ ≤ ‖g‖‖f‖` is the correct general statement; the converse needs a vector that sees `‖g‖`.

Repair: state the "only if" for `E = R` with `NormOneClass R` (then `f = 1` gives `‖g‖ = ‖g·1‖ ≤ 1`), or for `E ≠ 0` with `NormSMulClass R E` (a constant `f = e ≠ 0` gives `‖g·f‖ = ‖g‖‖e‖`), and add `E = 0` as the negative-control Check.

## R03 (P3) — `matrixCoeffInputFirst` is a definition that no headline uses

Location: `Suggested.lean` lines 46–55; README lines 28–29 ("the input-first adapter of §2.6"), 502–503, 1047; module docstring lines 21–22.

Claim: the file keeps only the definitions its headline theorems need.

Witness: the body is `ContinuousLinearMap.matrixCoeff u i j` with the two indices swapped; none of the six sorried theorems mentions it (elaborated signatures in the worker's `signatures.md`), and the pinned `ContinuousLinearMap.matrixCoeff` (`Topology/ContinuousMap/ZeroAtInfty/Matrix.lean`) is the carrier consumers cite (CompactOperators on main line 43 cites "`matrixCoeff u j i` … PFA's transpose adapter" by section). A reindexing of a pinned definition is an API entry, not an acceptance test.

Repair: delete it from `Suggested.lean`; in README §2.6 keep the adapter as a target described in words (`B(u) j i = matrixCoeff u i j`, with the two product laws), without a backticked own name, and drop it from lines 28–29, 1047 and the module docstring.

## R04 (P3) — The module docstring does not name the §5.5 and §5.6 headlines as not statable

Location: `Suggested.lean` lines 30–32 ("The unbounded Amice bijection of §4.7 is not stated … The remaining targets of §§4.4–5.6 are specified in the README"); README lines 17–22 list "scalar analytic factors; and an annular Banach–Tate coefficient ring" among the central remaining targets.

Claim: the docstring says which headline theorems are not statable and what each lacks.

Witness: §5.5 (lines 962–979) expands `κ(cz+d)` on the closed unit disc and bounds its Gauss norm; its statement needs the analytic extension of a weight to `1+p^h𝒪_K`, which no pinned declaration provides (`TauCeti.WeightSpace` is `ℤ_[p]ˣ →ₜ* Rˣ`, `WeightSpace.lean` 81). §5.6 (lines 981–1012) is a construction (`H` with its normal forms and gauge); it has no carrier before the roadmap builds it. "Specified in the README" says neither.

Repair: in the docstring, after the §4.7 sentence, name §5.5 (lacks a carrier for the extended character on `1+p^h𝒪_K`) and §5.6 (the ring `H` is itself a target) as not statable; after R03, drop "together with the input-first matrix adapter of §2.6".

## R05 (P3) — README shape and locator precision

Location: every layer ends with a bold "**Checks.**" list and a bold "**Dependencies.**" paragraph (lines 299–314, 376–384, 529–543, 612–628, 801–823, 1016–1040) and the README has no `### Examples` or `### Dependencies` heading (`grep -c '^### Examples'` and `'^### Dependencies'` both 0); targets without a `*Needs:*` line: §0.4 (lines 289–296), §1.1 (331–332), §1.3 (355–357), §1.4 (370–374), §2.2 (425–427), §2.6 second and third bullets (509–516), §3.2 (566–567), §4.1 (637–646), §4.2 (652–656), §4.5 (735–744), §5.2 (855–872), §5.4 (944), §5.5 (964), §5.6 (983); "RestrictedPowerSeries Layers 0–2 and its open-disc algebra" (lines 172–173, 625–626, 819–820) where the open-disc algebra is RestrictedPowerSeries §7.1 (main, line 704); "[LWX] §3.15" (line 1011) is Lemma 3.15 (LWX line 1215); Amice's theorem cites "[Am], [Col] I.4" (`Suggested.lean` lines 59, 69; README 820) where the theorem is Colmez Théorème I.4.7 (Col line 712) and the Mahler criterion Corollaire I.4.8 (714).

Repair: `### Examples` and `### Dependencies` subsections per layer; a `*Needs:*` line on each target listed; cite RestrictedPowerSeries §7.1, LWX Lemma 3.15, Colmez Théorème I.4.7 and Corollaire I.4.8.

## Previous findings

- R01 — not repaired: README lines 757–759 and 944–951 and the docstring (lines 19–32) are unchanged; `Suggested.lean` still has six theorems, none the §4.6 or §5.4 criterion. Restated as R01.
- R02 — not repaired: README lines 566–567 still read "bounded by `‖g‖`, and is contractive exactly when `‖g‖≤1`". Restated as R02.
- R03 — not repaired: `matrixCoeffInputFirst` is still at `Suggested.lean` lines 46–55, unused by the six theorems. Restated as R03.
- R04 — not repaired: docstring lines 30–32 still name only §4.7 as not stated. Restated as R04.
- R05 — not repaired: no `### Examples` or `### Dependencies` heading; the bold paragraphs at lines 299, 311, 376, 382, 529, 539, 612, 625, 801, 819, 1016, 1037 are unchanged; "[LWX] §3.15" at line 1011 and "[Am], [Col] I.4" at Lean lines 59, 69. Restated as R05.

## Verified sound

**The change.** `git diff --stat 7e8275c4 bdcbdaa9 -- TauCetiRoadmap/PadicFunctionalAnalysis` is empty; the three commits since 7e8275c (c2fe7d26, 3e107fa1, bdcbdaa9) touch only RigidAnalyticGeometry, TopologicalKTheory and BordismFormalGroups, folders the brief names as the pull request's own; `git diff --stat origin/main...HEAD` outside the fourteen declared folders is empty. `lake-manifest.json` and `lean-toolchain` are unchanged since 7e8275c (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`), so every pinned declaration the previous review opened is as it was; the olean of `Amice/Character` is present and the R01 probe elaborated against it.

**Gate, dependency check, elaboration.** The worker's gate at bdcbdaa: every counter zero, `OK`. My rerun of the dependency check: `depcheck: 245 roadmaps, 2467 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line (main is now 3b3f7ef, five roadmaps more than at the previous review). `lake env lean TauCetiRoadmap/PadicFunctionalAnalysis/Suggested.lean`: exit 0, six `sorry` warnings, nothing else. The worker's `signatures.md` lists the same seven elaborated types as at 7e8275c; none drops a section binder (`amiceMap_bijective_and_norm_eq` carries `[Module ℤ_[p] E] [IsBoundedSMul ℤ_[p] E] [IsUltrametricDist E] [CompleteSpace E]`, the two §5.3 theorems carry `[IsLinearTopology S S] [CompleteSpace S] [T2Space S] [Algebra ℤ_[p] S] [ContinuousSMul ℤ_[p] S]`, `measurePairing_injective` is on `AbstractMeasure ℤ_[p]ˣ ℂ_[p] ℂ_[p]`), matching README §§4.4 and 5.3.

**Suppliers on main (3b3f7ef).** Re-resolved this round: RestrictedPowerSeries Layers 0–2 (lines 191, 245, 304) and §7.1 (704); NewtonPolygons Layer 1 (442); AdicSpaces (`Completed/`) Layer 0 (135); ProfiniteProPGroups (`Completed/`) "Layer 9 prerequisites" (1656); LocalFieldsRamification (`Completed/`) logarithm (395–407). Consumers: CompactOperators (line 24, 982), AdicSpacesPartII (lines 68, 330, 340 "PadicFunctionalAnalysis §0.4; `tateGauge`, `exists_tateSeminorm`, …"). The worker's citation check lists no cross-roadmap citation or Lean name found nowhere.

**Overlaps.** The overlaps index at this head: #1808 and #1854 conflict with #1807 in other folders only (AlgebraicCurves, AlgebraicTopology, CharacteristicClasses, ClassifyingSpaces, RigidAnalyticGeometry), not in this one; no id this README cites is dropped by an open pull request, none is defined only by an open revision, and this pull request drops no id other roadmaps cite. The previous review's ownership check (LocallyAnalyticDistributions #854, QuaternionicModularForms #934, DirichletPadicLFunctions #1039 as the closest in vocabulary; no second owner of Amice's theorem, the adic universal character, the Amice-coordinate comparison, separation by weights or `H`) stands, the folder and those heads being as they were.

**Seeded sample.** The folder's text at every sampled target (0.1, 0.4, 1.1, 1.2, 1.4, 2.6, 3.1, 3.2, 4.1, 4.2, 4.3, 4.5, 4.6, 4.7, 5.6) is byte-identical to what the previous review checked against JN lines 460–500, KL 1538–1547, Buz 200–208 and 328–342, Serre 60–177, Conrad 274–276, Mah 156–160, Col 712–747 and 1496–1504, RJW 816, 959 and 1492–1516, ST 316 and LWX 1215; those checks carry forward, with the §4.6 criterion and §5.4 level formula covered by R01 and the §3.2 "exactly when" by R02.

**Adversarial table.** The diff touches no statement, so every row carries forward from the previous report (its values re-read against the identical text); the rows a finding touches are repeated here with their values.

| Statement | Instance | Left | Right | Result | Change |
| --- | --- | --- | --- | --- | --- |
| §4.6 function-level criterion (R01) | `p = 2`, `‖t‖ = 2^(−1/2)`, `h = 1, 2` | `r_1 = 2^(−1/2)`, `r_2 = 2^(−1/4)` | fails level 1, holds level 2 | pinned `not_tendsto_amiceCharCoeff_one_and_tendsto_amiceCharCoeff_two`; function form absent from the file | R01 |
| §5.4 level formula (R01) | `h ≥ v_p(q)`, `γ^(p^(h−v_p(q))) = exp(p^h)` | `‖κ(exp p^h) − 1‖ < r_p` | `‖T_κ‖ < p^(−1/((p−1)p^(h−v_p(q)))) = p^(−q/(p^h(p−1)))` | agrees (`q = p^(v_p(q))`); statable at principal-character level, probe elaborates | R01 |
| §3.2 "contractive exactly when" (R02) | `E = 0`, `g = p⁻¹` | multiplication is `0`, contractive | `‖g‖ = p > 1` | false | R02 |
| §3.2 bound | `E = R`, `f = 1` | `‖g·1‖ = ‖g‖` | `≤ ‖g‖‖1‖` | converse holds with `NormOneClass` | R02 |
| `matrixCoeffInputFirst` (R03) | `2×3`, `3×2` over `ℚ_p` | `B(u∘v) = B(v)B(u)` | `A(u∘v) = A(u)A(v)` transposed | consistent; no headline uses it | R03 |
| `amiceMap_bijective_and_norm_eq`, `E = 0`; `h = 0, p = 2`; `E = 𝔽_p` | as in the previous report | `C₀(ℕ,0) = 0`; unit-diagonal triangular columns; `x^p − x ↦ (0,−1,0,…,1)` | `LA_h(0) = 0`; `Triangular.lean` 233; nonzero | holds (previous report) | none |
| `isOrthonormalBasis_amiceTerm` | `a = Σ a_n single n`, `E = ℤ_p` | `Σ a_n amiceTerm n 1` | `‖a‖ = max‖a_n‖` | holds (previous report) | none |
| `exists_character_of_hasEval`, `S = 0`; `ℚ_p`; `ℤ_p[ε]/ε²` | `z = 0`; —; `z = ε` | `coord = 0`; `IsLinearTopology ℚ_p ℚ_p` false; `HasEval ε` | `HasEval 0`; excluded; `s ↦ 1 + sε` | holds (previous report) | none |
| `eq_aeval_binomialSeries` | `x = 1, γ, section δ` | `κ(1), κ(γ), κ(section δ)` | `1`, `1 + T_κ`, `finiteChar δ` | agrees (previous report) | none |
| `amiceTransform_completedGroupAlgebra_compat` | `μ = δ_a` | `(1+(γ−1))^a = [ofAdd a]` | `[ofAdd a]` | agrees (previous report) | none |
| `measurePairing_injective` | `μ ≠ 0`, finite-order weights | characters of `(ℤ/p^n)ˣ` span | locally constant functions dense | holds (previous report) | none |
| §0.2–§0.4, §1.4, §2.3, §3.4, §4.3–§4.5, §4.7, §5.2, §5.3, §5.5, §5.6 rows and Convention 10 | as in the previous report (29 rows) | values unchanged | values unchanged | hold (previous report, text identical) | none |

## Not verifiable

- [Sch] Schneider, *Nonarchimedean Functional Analysis*; [Bel] Bellaïche, *The Eigenbook*; [BGR] Bosch–Güntzer–Remmert: settled as uncertified, cited by locator only.
- [Am] Amice 1964 and [Mah] Mahler 1958 are OCR'd scans; the basis theorem was checked in Colmez I.4.7 and Mahler's Theorem 1 at Mah lines 156–160 (previous review).
- Ownership against open pull requests was checked at the previous review (main, the listed heads, and #854 via `roadmaps show`); nothing in this folder or in the overlaps index changed since.

## Source issues

- none new this round (the KL Remark 2.4.4 gap and the JN Lemma 2.1.6 published-version error are recorded in the previous report).
