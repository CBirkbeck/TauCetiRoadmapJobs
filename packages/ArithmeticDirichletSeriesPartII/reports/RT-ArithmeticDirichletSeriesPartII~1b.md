<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/124#issuecomment-6335207825 -->
Red team round 1 pass b (claude) of cbd12a6

Verdict: needs_changes

1. **F01** (P3) Supplier heading names the completed parent as an active roadmap

   **Location:** `packages/ArithmeticDirichletSeriesPartII/README.md:186`: “### From TauCetiRoadmap.ArithmeticDirichletSeries”.

   **Claim:** The parent exists on `main` only as `Completed/ArithmeticDirichletSeries/README.md`; there is no `TauCetiRoadmap/ArithmeticDirichletSeries` folder. A supplier that exists only under `Completed/` is not headed `TauCetiRoadmap.X`; sibling roadmaps link the archived specification. Pass a's F06 repairs the two parent links (lines 4 and 82) but leaves this heading.

   **Witness:** `Completed/ArithmeticDirichletSeries/README.md:337` (Layer 9), `:353` (9.2), `:227` (4.2) are the cited sections; `TauCetiRoadmap/ImaginaryQuadraticClassNumber/README.md:15` and `TauCetiRoadmap/TauberianBoundaryConvergence/README.md:8` cite it as `../../Completed/ArithmeticDirichletSeries/README.md`.

   **Exact repair text:** `### From [ArithmeticDirichletSeries](../../Completed/ArithmeticDirichletSeries/README.md) (completed)`; in the Layer 9 bullet of *Not owned here* point the anchor at `../../Completed/ArithmeticDirichletSeries/README.md#layer-9-wienerikehara`.

2. **F02** (P3) Deferral and consumer cite a roadmap layer that exists nowhere

   **Location:** `packages/ArithmeticDirichletSeriesPartII/README.md:94`: “belong to ArithmeticStatistics (Layer ST.3), which consumes Layer HP.4”; `:1074`: “ArithmeticStatistics, Layer ST.3: Wood's counts of abelian extensions with restricted inertia”.

   **Claim:** No roadmap on `main`, in `merge-order/ORDER.txt`, on the board or in the open roadmap pull requests has a layer `ST.3`. The board package `ArithmeticStatistics` (its README, 570 lines, at the head of its import pull request) has no `ST.` layer labels and never mentions this roadmap, Wood's inertia-restricted counts or a higher-order pole; the merge order lists only `ArithmeticStatisticsPartI`–`PartVIII` (ORDER.txt lines 84–88, 106–108), none of which contains `ST.3`. The local factors, continuation, positivity and majorant that the Scope paragraph defers are therefore deferred to an owner that does not exist under the cited name.

   **Witness:** Wood's `C₂^k` counts with trivial inertia intersection are `TauCetiRoadmap/ArithmeticStatisticsPartV/README.md:1541` (§3.27, nonabelian quadratic moments), `:1677` (inertia meeting the base `C₂^k` trivially) and `:1689` (totals asymptotic to `C_k X (log X)^(m−1)`, `m = 2^k`), at the head of that roadmap's open pull request. The `ST.3` label occurs only in this package.

   **Exact repair text:** line 92–94: “…the arithmetic majorant for non-surjective homomorphisms belong to ArithmeticStatisticsPartV, §3.27 (nonabelian quadratic moments), which consumes Layer HP.4.”; line 1074: “- ArithmeticStatisticsPartV, §3.27: Wood's counts of abelian extensions with restricted inertia (Wood 2019, §7), and any count whose generating Dirichlet series has a higher-order pole at its abscissa. It supplies the continuation, the positivity of the leading coefficient and the majorants, and uses HP.4.2, HP.4.4 and HP.4.5.” (`ArithmeticStatisticsPartV` precedes this roadmap in the merge order; recording the consumer edge there is the intake's concern, not a supplier of this package.)

3. **F03** (P3) Time-bound wording

   **Location:** `packages/ArithmeticDirichletSeriesPartII/README.md:83`: “The current Tau Ceti library proves them as `TauCeti.LSeries.wienerIkehara`,”.

   **Claim:** “current” is process narrative; the sentence is a statement about the pinned library and reads differently a year from now. (The second occurrence, line 171 “in the current Tau Ceti the same declarations live in”, is removed by pass a's F02 repair.)

   **Witness:** README house rule on timeless wording; the pinned declarations are `TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.lean:301` and `Variants.lean:135`.

   **Exact repair text:** “Tau Ceti proves them as `TauCeti.LSeries.wienerIkehara`, …”.

## Verified sound

**Scope read.** All 1099 README lines; all 369 Suggested.lean lines; `metadata.toml` (`topic = "math.NT"`); `review.json`; the pull request body and both earlier comments (the brief and pass a). Declarations read: 36 (1 instance, 3 definitions, 1 structure, 16 `sorry`'d theorems, 15 `sorry`'d examples). Bold README targets read: 16 (HP.0.1–HP.5.2). API statements read: 28. Check bullets read: 47.

**Elaboration.** As submitted the file fails at line 2: `TauCeti.Order.Northcott` has no object file; at the pinned Tau Ceti (`a91d3aaf`) the module is `TauCeti/Order/Northcott/Basic.lean` (pass a's F02; not re-raised). With the import repaired the review Lake setup has no object file for that module either (only 22 Tau Ceti modules are built there), so the exact file could not be elaborated. A probe copy under a single `import Mathlib`, with `TauCeti.normLE` and `TauCeti.summatory` re-declared verbatim from the pinned source (same signatures, same `Northcott` class from `Mathlib/Order/Northcott.lean`), elaborated the entire body with exactly 31 `declaration uses 'sorry'` warnings and no other diagnostic; `#check` of `delangeLaplace`, `delangeSmoothedLimit`, `monotoneUnsmoothing`, `logSummatory_hasLaplace`, `delangeDirichlet_positiveAbscissa`, `lowerPole_perturbation` and `regularizedBoundaryL1` shows every hypothesis the README states as an explicit binder (nothing is lost from the `Laplace` section, which ends at line 58). Probe files were deleted.

**One-tactic probe.** Every `sorry` replaced by `simp [HasLaplace, squaredSinc, delangeWeight, TauCeti.summatory]`: none of the 16 theorems closes (13 unsolved goals, 3 no progress). Four of the admitted examples do close with a targeted tactic; these are supplementary repair text for pass a's F01/F04, not a new finding:

```lean
example {ell : ℝ} (hell : 0 < ell) : squaredSinc ell 0 = ell / Real.pi := by simp [squaredSinc]
-- `hell` is unused: the origin value holds for every `ell`.
example {ell : ℝ} (hell : 0 < ell) : squaredSinc ell (Real.pi / ell) = 0 := by
  simp [squaredSinc, mul_div_cancel₀ _ hell.ne', Real.sinc_of_ne_zero]
example (k : ℕ) : delangeWeight k 0 = 0 := by simp [delangeWeight]
example (s : ℂ) : HasLaplace (fun _ : ℝ ↦ (0 : ℂ)) s 0 := by simp [HasLaplace]
```

**Locators verified against the cached legal copies (17).** Delange (Numdam copy; page marker `N` is journal page `N + 211`): p. 213 standing hypotheses (real, nondecreasing, nonnegative `α`, ordinary Laplace integral convergent for `Re s > a > 0`; lines 24–28) and footnote 1 (subtract `α(0)`; lines 42–44); §3.1–3.2 pp. 220–221 (`v(t)`, normalisation by `t^(p+1) v(t)`, `v(t+h)/v(t) → 1`; lines 278–328); §3.3–3.3.1 pp. 221–222 (`h(s)` and its Laplace representation; lines 329–340); §3.3.2 begins p. 222 (line 355) and §3.3.3 p. 224 (line 428), as cited; §3.3.5 p. 226 (triangle `1 − |y|/2λ`, limit `πA`; lines 489–514); §3.4.1–3.4.2 pp. 227–228 (`J(t)`, upper bound, boundedness derived, lower bound, `λ → ∞` then `h → 0`; lines 517–568); §4.1 pp. 228–229 (Lemmas 1–2 not needed under Theorem I's hypotheses; lines 570–604); Lemma 3 §5.1.1 p. 231 (lines 673–675, `l < 1`); Lemma 4 §5.1.2 p. 233 (lines 712–722, the full-line Gamma identity in its proof); Theorem III §5.2.1 pp. 235–236 (lines 817–832: `ω` not an integer `≤ 0`, holomorphic off `a`, `(s−a)^(−ω) g + h`, `g(a) ≠ 0`); proof p. 237 (`g(a) > 0` from positivity, `p = 0`, `l < 1`, `γ ∝ u^(ω−1)`; lines 870–884); pp. 237–238 size of the remainder (lines 887–892); §5.3 p. 242 second remark (order of magnitude only; lines 1046–1058). Wood (NSF author copy; markers 39–41 carry running heads 415–417): §7 pp. 415–417 (lines 1586–1707): `F_k` for target `C₂^(k+1)` has a pole of order `2^k`, partial sums `~ c_k X (log X)^(2^k−1)` (lines 1692–1695), the trivial homomorphism set aside (1695–1697), non-surjective homomorphisms bounded by `F_(k−1)` (1698–1700). The rank shift relative to the README's `C₂^r` is pass a's F03 (not re-raised). Both source URLs in the References match the cached copies' provenance lines.

**Checks recomputed (26), all correct.** Laplace of `1` is `1/s`, of `t²` is `2/s³` (Stieltjes variants `1`, `2/s²`); `K_λ(0) = λ/π`, `K_λ(π/λ) = 0`, the `sinc(λv/2)` kernel gives `(λ/π)(2/π)²` there; `∫ K_λ = 1` and the parts formula `∫₀^R sin²w/w² = −sin²R/R + ∫₀^R sin 2w/w`; triangle formula `(1 − cos 2λv)/(λv²) = 2λ sinc(λv)²` and the `v = 0` area `2λ`; `w₀ = 1 − e^(−t)`, `t w₁ = 1 − (1+t)e^(−t)`, `t² w₂ = 1 − (1+t+t²/2)e^(−t)` for every real `t` including `t = 0`, the `1/k!`-less variant `2 − (2+2t+t²)e^(−t)`; `w_k(t) t^k = (1/k!)∫₀^t e^(−x) x^k dx`; HP.2.2 `k = 1` boundary value `c(log(1+iy) − log(iy) + iy/(1+iy) − 1)` and its `−c log|y|` growth; `|ε+u+iy| ≥ (u+|y|)/√2`; the one-bandwidth construction (`ε < aC/(a+3λ)`, frequency `3λ` outside `[−2λ, 2λ]`); counting constants `1` (ones), `1` (`ζ²`), `1/6` (`ζ⁴`, wrong normalisations `1/3`, `1/2`, `1/24`), `1/2` (`c n = n`, `A/a` with `a = 2`), the `a = 0` control (`∑ 1/n ~ log X`, `ζ(s+1)/s` double pole), the rescale cross-check `A/a^(k+1) · a^k = A/a`; dyadic first values `1, 3, 3, 7, 7, 15, 15`, ratios `1, 3/2, 7/4, 15/8 → 2` and `1, 7/6, 5/4 → 4/3`, poles at `1 + 2πim/log 2`, numerator `1/log 2 ≈ 1.4427` strictly between; `PoleBoundary ζ 1 0 1` and `ζ^m` via `PoleBoundary.mul`; strictness of `l < k` (`d = 2c`, `b = c` doubles the limit).

**Adversarial pass (instances tried; no change needed).** `HasLaplace`: `μ = 0`, `s = 0` with `f = 1` (non-integrable, predicate false), real functions cast to `ℂ`; the generic-`SMul` zero-function Check is pass a's F07. `PoleBoundary`: `A = 0` (order `≤ k`), arbitrary values on the line (`Function.update`), `a < 0` and `a = 0` for the predicate (the counting theorems exclude `a ≤ 0`), the dyadic `F` (fails `away` only). `squaredSinc`: `λ = 0` (zero kernel), `λ < 0` (negative, excluded from the mass/probability claims). `delangeWeight`: `t < 0` (negative, excluded from positivity), `k = 0` (bounded weight). `integerGammaLaplace`: `k = 0`, `a < 0`, `s` on `Re s = a` excluded. `regularizedBoundaryL1`: `k = 0` (remainder analytic at `a`, `H(s) = R(s) − R(s+1)`), the model `R = 0`; for `ε > 0` the integrand `y ↦ ‖H(a+ε+iy) − b(y)‖` is continuous minus integrable, so the Bochner integrals are genuine and the limit is not vacuous. `delangeSmoothedLimit`: `α = 0` (`A = 0` forced), the Gamma model (limit `1`), the Fatou/monotone step uses a nonnegative integrand, the damped identity converges absolutely at `ε > 0`. `monotoneUnsmoothing`: `C = 0`, the one-bandwidth counterexample. `delangeLaplace`: `k = 0` is Ikehara with holomorphic boundary. `logSummatory_hasLaplace`: `c = δ₁` (`α = 1`, transform `1/s`), `c₀ ≠ 0` ignored, unconditional summability in `ℂ` is absolute. `delangeDirichlet`, `_positiveAbscissa`: `a = 1`, `a = 2`, `k = 0` against `wienerIkehara_rpow`'s `κ/σ` (`Variants.lean:135–139`). `finiteChange_asymptotic`: signed changes, a change at `n = 1`, `C = 0`. `lowerPole_perturbation`: `l = 0, k = 1`, signed `c, d`. `zetaSquare_counting`: `d(0) = 0`. `dyadicLocalPoleCounterexample`: `j = 0, 1, 2, 3`; `c 1 = 1` (`2⁰`), `c 0 = 0`. Universes and instances: `E` universe-polymorphic; standard instances on `ℝ`, `ℂ`, `ℕ`; no hidden section hypotheses.

**Supplier citations checked.** All 26 Mathlib names in *From Mathlib* exist at the pinned Mathlib (`6b7abb3c`), including `integral_exp_mul_complex_Ioi` and `integrableOn_exp_mul_complex_Ioi` (`ImproperIntegrals.lean:63`, `:87`, hypotheses as described) and `Real.tendsto_integral_exp_smul_cocompact` (`RiemannLebesgueLemma.lean:245`, no integrability hypothesis, as the README says). All Tau Ceti names exist at `a91d3aaf`: `summatory` (`Order/Northcott/Basic.lean:102`), `summatory_nonneg` (`:155`), `summatory_mono` (`:164`), `eventually_summatory_sub_eq` (`:177`), `summatory_eq_summatory_natFloor` (`:138`), `mem_normLE_natCast` (`:73`), `exists_laurent_data_of_meromorphicAt`, `tendsto_integral_sin_mul_div_atTop`, `tendsto_integral_sinc_atTop`, `wienerIkehara` (`SharpCutoff.lean:301`, continuous-`G` hypothesis as the README states), `wienerIkehara_zero`, `_of_eventually_nonneg`, `_nat`, `_rpow`. The parent's Layers 9, 9.2 and 4.2 are `Completed/ArithmeticDirichletSeries/README.md:337`, `:353`, `:227`. Duplication by object: no `Northcott` instance for the identity on `ℕ` exists in either pin (`northcott_natId` is new); no Laplace-transform carrier exists in either pin (Tau Ceti's `laplaceMeasure` is the Laplace distribution; `WienerIkehara/Fourier.lean:197` is one integral identity); no squared-sinc or Fejér kernel on `ℝ`, no Delange weight. The `SieveMethodsAndPrimePatterns` remark is consistent with that package (finite Fejér expressions on the circle, not a kernel carrier). The pinned Mathlib pins in the README (`082e2d3`, `f790474`) differ from the content repository's manifest (`6b7abb3c`, `a91d3aaf`): pass a's F02 repair.

**Dependency check** (run on the unchanged README with the supplied name):

```text
depcheck: 8 roadmaps, 48 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `ArithmeticDirichletSeriesPartII` is absent from `merge-order/ORDER.txt` (imported package; not a defect). No declared supplier gaps.

**Policy.** Title keeps “Dirichlet” and “Tauberian” capitalised; no `lemma`, no `set_option`, no `#check`/`#eval`, no `def := sorry`, no LaTeX delimiters, no issue numbers; every Lean name appears in the README; module docstring and namespace in the prescribed form. The remaining policy defects (pull-request numbers and narrative at README lines 40–41, 245–249, 1098–1099 and Lean lines 18–19, 53; the trailing name catalogue at Lean lines 357–365; three and four examples per definition, all admitted) are pass a's F01 and F06.

**Not re-raised (pass a, round 1):** F01 admitted examples; F02 non-existent import module and stale pins; F03 Wood rank shift (confirmed at `wood2019` lines 1586–1588 and 1692–1695); F04 missing Lean mirrors; F05 missing `sources.toml` (confirmed: the package has no `sources.toml`); F06 process references and parent links; F07 zero-function Check needs a zero-preserving action; F08 Stieltjes comparison for arbitrary functions.

## Not verifiable

- The exact submitted file with its Tau Ceti import was not elaborated: as submitted the import names a module that does not exist at the pin, and with the import repaired the review Lake setup has no object file for `TauCeti.Order.Northcott.Basic` (only the probe with re-declared `normLE`/`summatory` elaborated).
- Gamburd–Magee–Ronan: no cached legal copy in the sources directory of this review; the consumer paragraph (README 1078–1084) was not checked against the text.
- The Mathlib pull request cited for the shape of `HasLaplace` was not read; in particular the instance layering of `HasLaplace.add` (`DistribSMul ℂ E`) and `HasLaplace.const_smul` (`NormedSpace ℂ E`, `IsScalarTower ℝ ℂ E`) against a section carrying `[SMul ℂ E]` was not checked in Lean.
- `ArithmeticStatisticsPartV` §3.27 was read at the head of its open pull request, not on `main`; it does not cite this roadmap, so the consumer edge claimed in F02's repair is asserted by this package only.
