# Review of GlobalHolomorphicFunctions (pull request #992 at ec98b6d)

**Verdict:** needs changes

🤖 Independent AI review, full pass over the repaired head. Five findings, one blocking. No false theorem statement, no vacuous statement and no unowned prerequisite was found in `Suggested.lean`; the blocking finding is an ownership conflict with DifferentialGeometry's open revision in Layer 7.2. The gate passes at this head (it does not detect ownership).

**Repairs of the previous review's findings, finding by finding.**

- *R01 (coefficient naturality consumed from DifferentialGeometry).* Repaired as a local construction: `README.md:1783`–1790 ("construct the postcomposition map … These are construction targets here, not consequences of pullback naturality") and the supplier contract (`README.md:124`–126, "local construction targets in Layer 7.2 … not assumed supplier contracts"). The citation of DG for this object is gone. The local construction now collides with DG's open revision; see R01 below.
- *R02 (ownership against ZerosOfLFunctions and Hyperfunctions).* Repaired. `README.md:18`–24 makes ZerosOfLFunctions Layer 5.2–5.5 the supplier of the zero-support API, E₁, the order-one canonical product and the entire logarithm, and keeps only the arbitrary-genus and inverse-square-input extensions here; the claim that ZerosOfLFunctions consumes this roadmap is gone. `README.md:26`–31 credits Hyperfunctions HF2.AnalyticPreparation and states the supply direction (Hyperfunctions consumes GH0). One residual wording problem is in R05.
- *R03 (absent statable headlines).* Repaired: `complete_holomorphicMapSpace` (`Suggested.lean:207`), `entire_weierstrass_factorization` (`:299`), `additive_cousin_I` (`:347`) and additionally `cauchyPompeiu` (`:315`) are stated; the module docstring (`:13`–18) names the form and de Rham headlines as not statable and what they lack.
- *R04 (padding).* Repaired in `Suggested.lean`: the elementary-factor specialisations, the three contour aliases, the function-space API lemmas and the CR rearrangement are deleted (23 admissions remain, all headline-shaped). Not repaired in `ProductCotangentTargets.lean`, which is byte-identical to the previous head: see R02 below.
- *R05 (no verifiable locator).* Repaired: Rainer's institutional text and the Gray–Morris author copy are cited with theorem numbers, printed pages and extraction line numbers; both were fetched legally and every cited line checked (table below). The manifest itself is missing: R04 below.
- *R06 (README structure).* Repaired: Scope, Conventions, Exact supplier contracts, How to read the build, eight layers with `*Needs:*` lines, `**Checks.**` lists, Examples and Dependencies, Downstream consumers, References.
- *R07 (Lean form).* Repaired for `Suggested.lean` (module docstring in the required form, layer sections, docstrings, names agree with the README). Not repaired for `ProductCotangentTargets.lean`: R02 below.

## R01 (P2) — Layer 7.2 builds a generic form operation that DifferentialGeometry's open revision also builds

**Location:** `TauCetiRoadmap/GlobalHolomorphicFunctions/README.md:1783`–1790, "construct the postcomposition map from smooth F-valued k-forms to smooth G-valued k-forms for every fixed continuous real-linear L … prove d(L_*ω)=L_*(dω) … These are construction targets here"; also `README.md:124`–126 and the `*Needs:*` line at `:1859`.

**Claim:** This roadmap owns, for an arbitrary finite-dimensional real manifold M and arbitrary real normed coefficient spaces F, G, the coefficient postcomposition on DifferentialGeometry's generic `SmoothForm` carrier and its commutation with `mextDeriv`.

**Witness:** DifferentialGeometry at its open head (revision of the roadmap on main) plans exactly this object: `TauCetiRoadmap/DifferentialGeometry/README.md:344`–349 ("define the coefficient postcomposition `L_*ω` of a rough form (to be declared as RoughForm.mapCoeff) … identity, composition, zero, addition and real-linearity laws"), `:402`–408 (`SmoothForm.mapCoeff`) and `:429`–449 (Layer 1.2 "primary fixed-coefficient theorem … for every continuous real-linear `L : F →L[ℝ] G` … bundled `SmoothForm` mirror of Layer 1.2's coefficient naturality"). On main (`9c6e95d`) DG has neither, as the previous review established. So two open pull requests each build the same generic object, and this roadmap's own Scope (`README.md:13`–14) assigns generic manifold forms and their exterior derivative to DifferentialGeometry.

The construction is not one-variable mathematics: nothing in it mentions ℂ, and the only planar use is the two maps L₁, Lᵢ : ℝ → ℂ and Re : ℂ → ℝ at `README.md:1819`–1822 and `:1845`–1848. A revision of an existing roadmap is not a citable supplier, so the mechanism the brief provides is a declared supplier gap, as the previous review already prescribed.

**Exact repair:** Delete the generic construction (the paragraph at `:1783`–1790, the three-bullet coefficient-map API and its Checks, which are DG-level acceptance tests) and record the dependency under `### From TauCetiRoadmap.DifferentialGeometry` as `What DifferentialGeometry must provide (gap:coefficient-postcomposition): for a fixed continuous real-linear L : F →L[ℝ] G, postcomposition of smooth F-valued k-forms on a finite-dimensional real manifold, with identity and composition laws, and, for complete F and G, d(L_*ω) = L_*(dω) on smooth forms.` Keep in 7.2 only what is planar: the tangent trivialisation of the open subtype, dx, dy, dz = (L₁)_*dx + (Lᵢ)_*dy, dz̄, the evaluation dz∧dz̄ = (L₋₂ᵢ)_*(dx∧dy) with value −2i on (e_z 1, e_z i), the coefficient extraction h = η(e_z 1, e_z i)/(−2i), and the real-part step using Re ∘ L₁ = id. On the instance that matters here, L₁(t) = t and Re, the composite is the identity and d(Re β) = Re(dβ) = η is then a consumed law, not a target. The dependency check stays acyclic because DifferentialGeometry is already a supplier.

## R02 (P3) — `ProductCotangentTargets.lean` is unchanged: native duplicates, one-lemma padding, no docstrings, names absent from the README

**Location:** `TauCetiRoadmap/GlobalHolomorphicFunctions/ProductCotangentTargets.lean:3`–9 (module docstring), `:28`, `:32`, `:49`, `:118`, and every declaration `:18`–120.

**Claim:** The file states acceptance targets for Layer 1.4 and Layer 6.2 in the required form.

**Witness:** Elaborated on a scratch copy: `majorant_exp` closes by `exact Real.prod_one_add_le_exp_sum s (fun i => norm_nonneg (u i))`; `regular = Complex.integerComplement` closes by `ext; simp`; `paired_summable` closes from `summable_cotTerm` by one `simpa` with cast normalisation; `cotangent_identity` closes from `cot_series_rep'` by `simp` and `ring`. The docstring calls the file "illustrative, nonexhaustive" with targets that "remain unimplemented"; no declaration has a docstring; none of `sharp_finite`, `pairedCot`, `modelCot`, `cotangent_identity` occurs in the README (grep count 0 for each), while the README (`:1375`–1378, `:1437`–1438) says these estimates "belong to this README's examples" and "do not define an additional theorem of the library".

Re-raised: R04 and R07 of the previous review, which the repair commit did not apply to this file.

**Exact repair:** Keep `sharp_finite` (distinct mathematics: with u = (1,1) both sides are 3, whereas the imported exponential bound gives 4 ≤ e²) with a docstring, move it into `Suggested.lean` under Layer 1 and name it in 1.4, and delete the companion file: `majorant_exp`, `regular`, `paired_summable`, `cotangent_identity` are native, and `finite_shift` through `extension_zero` are intermediate steps of a proof route that the README already carries as 6.2. If the file is kept, it needs the "target signatures" module docstring, a docstring per declaration, the README naming every retained Lean name, and no native restatement.

## R03 (P3) — A Layer 0.2 Check has the wrong sign

**Location:** `TauCetiRoadmap/GlobalHolomorphicFunctions/README.md:359`, "For f=z̄, fx=1 and fy=−i, so fy−i fx=−2i; the unit-square integral is −2i, not zero."

**Claim:** The counterclockwise boundary integral of z̄ dz over the unit square is −2i.

**Witness:** Direct computation edge by edge: bottom 1/2, right 1/2 + i, top −1/2 + i, left −1/2; total 2i. The roadmap's own formula at `README.md:1615` (`∮ F dz = 2i ∫ ∂̄F dA`) gives 2i · 1 · 1 = 2i as well, and the Conventions fix counterclockwise orientation. The displayed quantity fy − i fx = −2i is the negative of the Green integrand i fx − fy = 2i.

**Exact repair:** Replace by "so i fx − fy = 2i; the counterclockwise unit-square integral is 2i, not zero", or keep fy − i fx = −2i and say the integral is its negative. Check against `:1615` with F = z̄: 2i ∫ 1 dA = 2i.

## R04 (P3) — The cited extractions have no manifest in the roadmap folder

**Location:** `TauCetiRoadmap/GlobalHolomorphicFunctions/README.md:172`, `:299`, `:430`, … (every "rainer line N" and "gray-morris line N"), and `:1955`–1969; the folder contains `README.md`, `Suggested.lean`, `ProductCotangentTargets.lean`, `metadata.toml` only.

**Claim:** Locators of the form `rainer line 1189` are resolvable.

**Witness:** No `sources.toml` records the keys `rainer` and `gray-morris` (URL, fetched-from, licence class, sha256), so the line numbers point at nothing a reader can open. Fetching both works through the sources service reproduces the numbering exactly (Rainer: lines 1189, 1216, 1255, 1295, 1313, 1329, 1333, 1338, 1437, 1550, 1603, 1630, 1658, 1689, 1843, 1868, 1950, 1997, 2030, 2050, 2086, 2116 all open on the cited statements; Gray–Morris: line 66 is Theorem 3 and 310–396 the Appendix), so the citations are right and only the record is missing.

**Exact repair:** Add `sources.toml` (schema `tauceti-roadmap-sources/v1`) with one entry each for `rainer` (institutional copy, Technische Universität Wien author page, locator scheme theorem) and `gray-morris` (author page copy, locator scheme theorem, printed pages 246–256), with `cited_for` listing the layers that use them.

## R05 (P3) — Build order, a self-contradicting ownership sentence, a commit link, and renamed sections that consumers cite

**Location:** `README.md:719`–721; `README.md:28`–31; `README.md:727`; headings of Layer 1.

**Claim and witness, one item each:**

- `README.md:719` makes 2.1's hull equality depend on "Layer 2.5's scalar Runge", a later subsection; the layer's Dependencies paragraph (`:969`) repeats the order "prove scalar Runge before its hull characterization". Rainer proves Theorem 11.1 before Lemma 11.3 (rainer lines 1338 and 1437). A target that needs a later one is a build-order defect.
- `README.md:28` says Hyperfunctions "owns the real-even-dimensional filled exhaustion, including the plane case", and `:30`–31 then constructs the plane Runge exhaustion here. Hyperfunctions on main (`TauCetiRoadmap/Hyperfunctions/README.md:29`–30, 197–198) consumes GH0 and owns the ℝ^(2n) construction; since Hyperfunctions is downstream, the plane case is this roadmap's, and the sentence should say so.
- `README.md:727` cites Mathlib's analytic-map bundle through a GitHub link to a commit; every other library citation in the file names the file path. House style is the path.
- AnalyticNumberTheoryPartI (`README.md:82`, `:432` at its open head) and AutomorphicSpectralTheoryPartII (`README.md:15`, `:211`, `:279`) cite this roadmap's section "Preparatory primary factors and locally uniform products", which this head renamed to "Layer 1 / 1.1 Arbitrary genera and compact summability". The GH0–GH5 tags were kept in the Layer 2–7 headings; the Layer 1 heading lost its citable name.

**Exact repair:** Move the hull-equality paragraph of 2.1 after 2.5 (or renumber so the scalar equivalence precedes the hull), with `*Needs:*` pointing backwards only. Rewrite `:28`–31 as "Hyperfunctions owns the ℝ^(2n) filled exhaustion for n ≥ 2 and consumes the plane case from Layer 2". Replace the link at `:727` by `Mathlib/Geometry/Manifold/ContMDiffMap.lean`. Give the Layer 1 heading its former name as a tag, "Layer 1: primary factors and locally uniform products (preparatory primary factors)", so the two consumers' citations resolve.

## Verified sound

**Gate and build.** The worker's gate at `ec98b6d` passes every check. The outside-folder diff against `origin/main` is empty. `lake env lean` on `Suggested.lean` (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`) exits 0 with exactly **23 `sorry` warnings and no other output**; the Tau Ceti cycle module's object file was already built. A copy with `#check @name` for all 33 declarations elaborated once; every elaborated type was compared with its README statement: no standing binder disappeared (`Countable ι`, `Countable S`, `IsOpen`, compactness, `ContDiffOn ℝ ∞`, nonvanishing and finite-order hypotheses are all in the printed types; `∞` is the smooth order under `open scoped ContDiff`). The companion's 26 declarations elaborated the same way. The one-tactic probe (`rfl`, `simp`, `infer_instance`, `norm_num`, `aesop`) closed **0 of 23** admissions in `Suggested.lean` and **0 of 18** in the companion; the four extra exact-lemma probes are R02's witnesses.

**Dependency check.** The command of the brief returned exactly:

```text
depcheck: 208 roadmaps, 1460 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Merge order: ZerosOfLFunctions 76, GlobalHolomorphicFunctions 80, AnalyticNumberTheoryPartI 81, AutomorphicSpectralTheoryPartII 279; DifferentialGeometry, ConformalMapping, ComplexKahlerGeometry, Hyperfunctions and RealAnalyticGeometry are on main.

**Citations resolved (every round, at the copy named).** DifferentialGeometry on main `9c6e95d`: 0.1 (`README.md:271`–281, `wedgeWith_apply`), 0.3–0.4 (`:283`–309, `RoughForm`, `SmoothForm I M F k`), 1.1 (`:315`–319, `mextDeriv`, `mextDeriv_ofFunction`), 1.2 (`:320`–321, pullback naturality only), 1.3 (`:322`–324, `isSmoothForm_mextDeriv`), 1.4 (`:325`, `mextDeriv_wedgeWith`), 5.6.3 (`:708`), 6.1–6.2 (`:786`–795, `deRhamCohomology`); `RoughForm.ofFunction` at DG `Suggested.lean:652`. ConformalMapping on main: L5 Jordan separation and `TauCeti.filledHull` (`README.md:127`–141). ComplexKahlerGeometry on main: K2 (`:193`–200) and K5a (`:33`–35) consume GH0, GH2 and GH5.1; downstream only. Hyperfunctions on main: HF2.AnalyticPreparation (`:197`–217) and its GH0 citation (`:29`). ZerosOfLFunctions at its open head `6328e1c`: Layer 5 items 2–5 (`README.md:954`–977): zero support, `E₁ z = (1 − z) * exp z` with `deriv E₁ z = −z * exp z`, canonical product under `OrderLE f 1`, entire logarithm; its `Suggested.lean` declares no `E₁`, so there is no clash of fully qualified names. The citations "Layer 5.2–5.5" address the numbered items of that layer. ConformalMapping and ComplexKahlerGeometry revisions were read as consumers only.

**Ownership by object.** Searched main, the board's package index and the open roadmaps: Looman–Menchoff, the holomorphic hull, compact-open holomorphic function spaces, planar Mittag–Leffler, planar Cousin I and Cauchy–Pompeiu have no other planner; ComplexComparisonPartII (`README.md:29`, `:548`–549, `:1262`) and AnalyticNumberTheoryPartI (`:11`, `:82`, `:418`) consume GH's operators and primary factors; RealAnalyticGeometry on main owns a Stein-manifold Cousin-I splitting (`:812`, `:872`) on a different carrier, downstream of ComplexKahlerGeometry K2. The only duplicate found is R01. Ownership against open pull requests whose files the brief did not give me was not checked.

**Sources.** Both texts were fetched through the sources service from legal places (Rainer: institutional copy; Gray–Morris: author copy). Rainer's printed pages agree with the README throughout (PDF page 29 is printed page 23). Notation page (rainer line 81): a domain is a nonempty open set, a region is a connected domain, as the Conventions state. Theorem 15.5 is stated for a region; the README's arbitrary-open strengthening gives its own shell argument. Rainer's Theorem 10.2 kernel `−(1/π)∬ f(ζ)/(ζ−z)` equals `cauchyGreen`'s `(1/π)∫ φ ζ/(z − ζ)`; Proposition 10.1's `(1/2πi)∬ ∂̄f/(ζ−z) dζ∧dζ̄` with `dζ∧dζ̄ = −2i dξdη` (rainer line 1253) equals the minus-area term of `cauchyPompeiu`; Theorem 14.3's hypothesis is the uniform-tail form (1.5) with the order identity, and Proposition 14.2's proof is the monomial expansion cited in 1.4; Theorem 12.4's cocycle `f_ik = f_ij + f_jk` is equivalent to the cyclic form in `additive_cousin_I` (set k = i to get antisymmetry). Gray–Morris Lemma 1 (gray-morris lines 315–325) is stated without an aspect-ratio hypothesis and its proof is delegated to Saks; the README owns its own proof under `1/2 ≤ w/h ≤ 2`, which its empty-slice bound `N(2w_J + h_J) ≤ 5N h_R` needs, and applies it to balanced cells only. The estimate (*) `|A(R)| ≤ 20N m(R − E)` (line 371) matches the README's 20N.

**Pinned declarations opened** (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`): `Summable.hasProdUniformlyOn_one_add` and `hasProdLocallyUniformlyOn_one_add` (`Mathlib/Analysis/Normed/Module/MultipliableUniformlyOn.lean:86`, `:131`; cofinite eventual majorant on one set), `Filter.codiscreteWithin` (`Mathlib/Topology/DiscreteSubset.lean:237`; `Eᶜ ∈ codiscreteWithin Ω` with `E ⊆ Ω` is exactly closed-discreteness of E in Ω), `MeromorphicOn.divisor` (`Mathlib/Analysis/Meromorphic/Divisor.lean:40`; `untop₀` sends order ⊤ to 0), `Complex.integerComplement` (`Mathlib/Analysis/Complex/IntegerCompl.lean:23`), `summable_cotTerm`, `cot_series_rep'`, `cot_series_rep` (`Cotangent.lean:211`, `:222`, `:229`; root namespace), `HasLineDerivAt` (`Mathlib/Analysis/Calculus/LineDeriv/Basic.lean:80`; directions 1 and I give f_x and f_y), `Complex.volume_closedBall` (`VolumeOfBalls.lean:426`), `Complex.measurableEquivRealProd` (`Lebesgue/Complex.lean:43`), `SmoothPartitionOfUnity.exists_isSubordinate` (`Geometry/Manifold/PartitionOfUnity.lean:555`), `SignedMeasure.mutuallySingular_singularPart` and `ComplexMeasure.rnDeriv`/`integrable_rnDeriv` (`Decomposition/Lebesgue.lean:142`, `:429`, `:434`), `VectorMeasure.exists_extension_of_isSetSemiring_of_le_measure` (`AddContent.lean`), `variation_le_of_forall_enorm_le`, `ComplexMeasure.absolutelyContinuous_ennreal_iff`, `Measure.withDensityᵥ_absolutelyContinuous`, `VitaliFamily.ae_tendsto_average_norm_sub`, `integral_eq_of_hasDerivAt_off_countable_of_le`, `Complex.wedgeIntegral_add_wedgeIntegral_eq`, `Complex.isConservativeOn_and_continuousOn_iff_isDifferentiableOn`, `Finset.norm_prod_one_add_sub_one_le`, `multipliable_one_add_of_summable`, `tprod_one_add_ne_zero_of_summable`, `Real.prod_one_add_le_exp_sum`, `Complex.logDeriv_tendsto`, `logDeriv_tprod_eq_tsum`, `TendstoLocallyUniformlyOn.differentiableOn`, `CompactExhaustion.hasAntitoneBasis_compactConvergenceUniformity`, `ContinuousMap.tendsto_iff_tendstoLocallyUniformly`, `contMDiff_inclusion`, `AnalyticOnNhd.divisor_apply`, `AnalyticAt.analyticOrderAt_eq_natCast`, `meromorphicOrderAt_eq_int_iff`, `Complex.GammaSeq_tendsto_Gamma`, `Complex.Gamma_mul_Gamma_one_sub`, `Real.tendsto_harmonic_sub_log`, `HasProdLocallyUniformlyOn_euler_sin_prod`, `multipliableUniformlyOn_euler_sin_prod_on_compact`, `IsOpen.locallyCompactSpace`, `IsClosed.locallyCompactSpace`. Tau Ceti: `Cycle.trace`, `Cycle.integral`, `Cycle.windingNumber`, `Cycle.IsIn`, `Cycle.IsNullHomologous` (`Analysis/Contour/Cycle/Basic.lean:189`, `:303`, `:336`, `:252`, `:357`), `PiecewiseC1ClosedCurve.of` (`:82`), `homologyCauchyTheorem` (`Cycle/HomologyCauchy.lean:234`), `exists_int_windingNumber_of_not_mem_trace` (`Cycle/Winding.lean:133`), the three `Primitive.lean` theorems (`:180`, `:253`, `:283`), `TauCeti.morera` (`Conformal/Morera.lean:41`), `TauCeti.filledHull` (`Topology/FilledHull.lean:83`). No native `LocallyCompactSpace` instance on an `Opens` subtype and no topology instance on `ContMDiffMap` were found, so the two scoped instances duplicate nothing.

**Notes that are not findings.** `hEscape` in `exists_entire_primary_product_exact` follows from `hsum` (a summable nonnegative family tends to 0 along `cofinite`, so eventually `R/‖a i‖ < 1`); harmless. `[Countable S]` in `exists_entire_genusOne_product` follows from compact finiteness in σ-compact ℂ; harmless.

**Adversarial pass.** One row per statement; "Pass" means the computed sides agree, the bound holds, or the negative control is excluded. S = `Suggested.lean`, P = `ProductCotangentTargets.lean`, R = README.

| Statement | Instances | Values computed on each side | Result | Change |
|---|---|---|---|---|
| S `barDerivative`, `zDerivative` | u = z, z̄, \|z\|² at z = i | (∂z,∂̄) = (1,0), (0,1), (z̄,z) = (−i,i); without the 1/2 the first is (2,0) | Pass | Keep |
| S `differentiableOn_complex_of_continuous_real_lineDerivatives_cr` | f = z; f = z̄; Ω = ∅ | f_x = 1, f_y = i = i·f_x; conjugate: f_y = −i ≠ i, excluded; empty Ω vacuous | Pass | Keep |
| S `cauchyGreen` sign | φ = ∂̄ψ, ψ = h(\|z\|²), h(0)=1 | T(∂̄ψ)(0) = −(1/π)∫h′(r²) dA = −2∫₀^∞h′(r²) r dr = h(0) = 1 | Pass | Keep |
| S `cauchyGreen_barDerivative` | φ = 0 | T0 = 0 smooth, ∂̄0 = 0 = φ | Pass | Keep |
| S `cauchyGreen_barDerivative_reconstruct` | ψ as above at 0 | 1 = ψ(0); reversing the kernel gives −1 | Pass | Keep |
| S `elementaryFactor` | p = 0,1,2 at w = 0, 1, −1 | E_p(0)=1; E_p(1)=0; E₀(−1)=2, E₁(−1)=2/e, E₂(−1)=2e^(−1/2) | Pass | Keep |
| S `exists_entire_primary_product_exact` | ι empty; a = (1,1), p = 0; z = 0 | F = 1, order 0 = card ∅; (1−z)² order 2 = card fibre; fibre over 0 empty, F(0) = 1 | Pass | Keep |
| S `exists_entire_genusOne_product` | S = ∅; S = {1}, m = 2; m = 0 | F = 1; (1−z)²e^(2z), order and divisor 2 at 1; m = 0 gives factor 1 | Pass | Keep |
| S `exists_entire_genusOne_product_of_divisor` | D = 0; D = 2[1] | product 1, divisor 0; weighted sum 2/1 = 2 finite, divisor 2[1] | Pass | Keep |
| S `IsRungeCompactPair` | K = ∅ in a disk; unit circle in ℂ; annulus 2≤\|z\|≤3 in D₄ and in 1<\|z\|<4 | ∅: component Ω not relatively compact, true; circle: inner disk relatively compact, false; D₄: false; annular Ω: inner closure meets \|z\|=1, true | Pass | Keep |
| S `holomorphicHull` | K = ∅; K = unit circle, Ω = ℂ | B = −1 with f = 0 excludes every z: ∅; closed unit disk by the maximum principle | Pass | Keep |
| S `holomorphicHull_eq_fill` | annulus in D₄; in 1<\|z\|<4 | D̄₃ = K ∪ inner disk; K = K ∪ ∅ | Pass | Keep |
| S `isRungeCompactPair_iff_approximation` | annulus in D₄, f = 1/z; K = ∅ | contour period 2πi forbids error < 1/3 on \|z\|=3; both sides true for ∅ | Pass | Keep |
| S `exists_finite_rank_runge_operator` | K = ∅; K = {0}, f = c, B ≥ \|c\| | N = 0, L = ∅; N = 1, ζ = 0, w = 1, g = 1 gives error 0 ≤ εB | Pass | Keep |
| S `HolomorphicMapSpace`, `toContinuousMap` | U = ∅; z and z̄ on the disk | one map; z analytic, z̄ has ∂̄ = 1 and is not in the carrier | Pass | Keep |
| S `openSubtypeLocallyCompact`, `compactConvergenceUniformity` | U = D₁, x = 0; constants 1/n | closed disk of radius 1/2 is a compact neighbourhood; sup on each compact 1/n → 0 | Pass | Keep |
| S `complete_holomorphicMapSpace` | f_j = z + 1/j on the disk; z̄ not a limit | limit z holomorphic, compact error 1/j; a sequence tending to z̄ locally uniformly would force ∂̄ = 0 ≠ 1 | Pass | Keep |
| S `exists_zero_free_holomorphic_approximation` | Ω annulus, K unit circle, u = z | g = z, error 0, winding 1; an exponential has winding 0 and cannot serve | Pass | Keep |
| S `exists_holomorphic_with_zero_orders` | m = 0; m = 2 at 2 | f = 1, orders 0; (z−2)², order 2 at 2 and 0 elsewhere | Pass | Keep |
| S `exists_meromorphic_with_divisor` | ν = −[0]; ν = 0; f = 0 | 1/z has divisor −[0]; 1 has divisor 0; order ⊤ excluded by the last clause | Pass | Keep |
| S `exists_holomorphic_no_meromorphic_boundary_germ` | Ω = ∅, ℂ; punctured plane at ξ = 0 | frontier empty, vacuous; zeros accumulate at 0 inside the punctured ball, no meromorphic F on the ball | Pass | Keep |
| S `exists_meromorphic_prescribed_principal_parts` | E = ∅; E = {0}, P = 1/z² + z | f = 0; f = 1/z², f − P = −z analytic | Pass | Keep |
| S `exists_holomorphic_prescribed_isolated_singularities` | E = {0}, P = exp(1/z) | f = P off 0, difference 0; coefficients 1/k! never finite in number | Pass | Keep |
| S `exists_holomorphic_quotient` | F = 1/z on ℂ; Ω = ∅ | f = 1, g = z, g ≠ 0 codiscretely; codiscrete filter on ∅ is ⊥, vacuous | Pass | Keep |
| S `exists_entire_exp_mul_of_divisor_eq` | f = 2z², F = z²; f = 0, F = 1 | g = log 2; both divisors 0 but f has no nonzero value, excluded | Pass | Keep |
| S `entire_weierstrass_factorization` | f = z; f = (z−1)²; f = e^z | m=1, empty index, P=1, g=0; m=0, p=0, P=(1−z)², g=0; m=0, P=1, g=z | Pass | Keep |
| S `cauchyPompeiu` sign | unit disk, ξ = 0, f = \|z\|²; f = 1 | boundary (2πi)⁻¹∮ z̄ dz = 1, area −π⁻¹∫ z/z = −1, total 0 = f(0); f = 1: 1 − 0 | Pass | Keep |
| S `cauchyPompeiu` index hypothesis | annulus 1<\|z\|<2 with outer minus inner circle | index 0 at 0, 1 at 3/2, 0 at 3; trace = frontier | Pass | Keep |
| S `exists_smooth_barDerivative_eq` | f = z̄; f = z; Ω = ∅ | u = z̄²/2, ∂̄u = z̄; u = \|z\|², ∂̄u = z; no points | Pass | Keep |
| S `exists_smooth_closed_completion` | f = z; f = z̄ | g = z̄: ∂̄g = 1 = ∂z z; g = 0: 0 = ∂z z̄ | Pass | Keep |
| S `additive_cousin_I` | two sets, c₁₂ = 1, c₂₁ = −1; one set | b = (1,0): differences 1, −1; cocycle with i=j=k forces c₁₁ = 0, b₁ = 0 | Pass | Keep |
| P `finiteProduct`, `finiteMajorant` | ∅; u = (1,−1) | 1 and 1; 0 and 4 | Pass | R02 |
| P `sharp_finite` | u = (1,1); (1,−1); (−1,0) | 3 ≤ 3; 1 ≤ 3; 1 ≤ 1 | Pass | Keep (move) |
| P `majorant_exp` | u = (1,1) | 4 ≤ e² by `Real.prod_one_add_le_exp_sum` | One lemma | R02 delete |
| P `regular` | z = 0, 1/2 | false, true; equals `Complex.integerComplement` by `ext; simp` | Native | R02 delete |
| P `pairedTerm`, `pairedCot`, `symmetricPartial` | z = 1/2 | q₀ = 2, q₁ = 2/3, q_N = 1/(N+1/2) → 0 = π cot(π/2) | Pass | R02 |
| P `modelCot` | z = 1/2; z = 0 | 0; totalised 0 at the pole | Pass | R02 |
| P `riemannSum`, `riemann_error` | y = 1 | S₁ = (π coth π − 1)/2 ≈ 1.0767; π/2 − S₁ ≈ 0.4941 ∈ [0,1] | Pass | R02 |
| P `paired_summable` | z = 1/2 | telescoping absolute sum 2; closes from `summable_cotTerm` | Native | R02 delete |
| P `finite_shift` | N = 0, z = 1/2 | (3/2)⁻¹ − (1/2)⁻¹ = −4/3 on both sides | Pass | R02 |
| P `paired_periodic`, `locally_uniform_paired` | z = 1/2 → 3/2 | 0 = 0; error 1/(N+1/2) | Pass | R02 |
| P `entire_difference`, `extension_*` | z = 1/2; y → ∞ | residues 1 − 1 = 0; F(1/2) = 0; constant 0 | Pass | R02 |
| P `paired_strip_bound` | z = i | π coth π ≈ 3.153 ≤ 4 + 3π/2 ≈ 8.712; term bound at n=1: 1 ≤ 12/5 | Pass | R02 |
| P `model_strip_bound` | z = i | π coth π equals the displayed bound exactly | Pass | R02 |
| P `improper_integral`, `imaginary_axis`, `paired_vertical`, `model_vertical` | R = 1; y = 1; y → ∞ | π/4; −i(1 + 2S₁) on both sides; −πi; −πi coth(πy) → −πi | Pass | R02 |
| P `cotangent_identity` | z = 1/2 | 0 = 0; closes from `cot_series_rep'` by simp and ring | Native | R02 delete |
| R 0.2 Looman bad set, E_n | f = z | increments \|h\|, N = 1 bounds both; E = ∅ | Pass | Keep |
| R 0.2 balanced scalar estimate | φ = y, F = R = [0,1]² | boundary difference 1, area integral 1, error 0 ≤ 5N·0 | Pass | Keep |
| R 0.2 empty-slice path bound | x, x_α, x_β ∈ [a,b] | three horizontal distances sum to at most 2w_J; N(2w_J + h_J) ≤ 5N h_R needs w_R ≤ 2h_R | Pass | Keep |
| R 0.2 interpolant derivative at non-isolated non-endpoint y₀ | g = y² sin(1/y), P = {0} ∪ {2^(−k)} | convex-combination error ≤ \|ε_c\| + \|ε_d\| → 0 as c,d → y₀; G′(0) = 0 = g′(0) | Pass | Keep |
| R 0.2 CR cancellation constant | λ(J) real and imaginary parts | each part two scalar estimates: 2·5N + 2·5N = 20N | Pass | Keep |
| R 0.2 Check unit-square integral of z̄ | counterclockwise square | edges 1/2, 1/2+i, −1/2+i, −1/2: total 2i, not −2i | Fail | R03 |
| R 0.2 square-to-ball factor | r = 1 | 4 versus 2π: ratio π/2 | Pass | Keep |
| R 0.3 weak identity | φ = h(\|z\|²) | ∫(1/πζ)∂̄φ = ∫h′(r²) dA/π = −h(0) | Pass | Keep |
| R 0.3 kernel norm | disk radius r | 2πr; at r = 1, 2π | Pass | Keep |
| R 0.3 quadrature | G = c on K₁ | every sum = c·Area(K₁), error 0 | Pass | Keep |
| R 1.1 sharp deviation | p = 0, w = 1; p = 1, w = −1 | 1 ≤ 1; 1 − 2/e ≤ 1 | Pass | Keep |
| R 1.1 compact-summable product order | factors (z−2)², e^z, 1, 1, … at 2 | order 2 + 0 = 2; unit tail | Pass | Keep |
| R 1.2 E_p API | p = 1, w = 1 | E₁′(1) = −e = ZerosOfLFunctions `deriv E₁ z = −z exp z` at 1 | Pass | Keep |
| R 1.2 log bound | w = 1; w = −1 | Real.log 0 = 0 ≤ 1; log(2/e) < 0 ≤ 1 | Pass | Keep |
| R 1.2 weighted majorant | S = {1}, m = 2, R | 2R² = R²·(2/1) | Pass | Keep |
| R 1.3 genus | a_n = n; a_n = 2ⁿ; universal p_n = n−1 | genus 1; genus 0 with Σ2^(−n) = 1; tail majorant 2^(−n), sum 2^(1−N) | Pass | Keep |
| R 1.4 sharp versus exponential | u = (1,1) | 3 ≤ 3 versus 4 ≤ e² | Pass | Keep |
| R 1.5 uniform tail versus sup sum | u_n(x) = 1/(n+1) at x = n | tail 1/(N+1) → 0; Σ sup = harmonic, diverges | Pass | Keep |
| R 2.1 hull distance and convex hull | K unit circle in D₃; z = 2 | distance 2 on both sides; \|e²\| > e separates 2 from the hull | Pass | Keep |
| R 2.1 exhaustion stage | Ω = ℂ, D̄_n | own hull, nested, cofinal | Pass | Keep |
| R 2.1 build order | hull equality needs scalar Runge | 2.1 cites 2.5; Rainer proves 11.1 before 11.3 | Order | R05 |
| R 2.2 metric | constants differing by 1; 1/(n+1) | Σ2^(−k)/2 = 1/2; (1/(n+1))/(1 + 1/(n+1)) = 1/(n+2) | Pass | Keep |
| R 2.2 comparison constants | t = 1 | min(1,t)/2 = 1/2 = t/(1+t) ≤ 1 | Pass | Keep |
| R 2.2 uniformity bound | d < 2^(−N)ε/(1+ε) | each s_n/(1+s_n) < ε/(1+ε) for n ≤ N, so s_n < ε | Pass | Keep |
| R 2.3 O(K) not open, not closed | εz̄; Σzⁿ/(n+1)² | ∂̄ = ε ≠ 0; derivative coefficients Σn/(n+1)² diverge at 1 | Pass | Keep |
| R 2.4 contour estimate | unit circle, f − g = 1; reversed circle | 0 ≤ 2π; ∮dz/z = 2πi becomes −2πi, length 2π | Pass | Keep |
| R 2.5 one-pole push | dist > 2δ, \|a−b\| < δ | ratio < 1/2 | Pass | Keep |
| R 2.5 jet interpolation | f = z², marked 0, order 1 | P = 0, Q = z², quotient 1, approximant z² | Pass | Keep |
| R 3.1 direct construction factor | a, b_a, w_a = (b_a−a)/(z−b_a) | 1 + w_a = (z−a)/(z−b_a): zero a, pole b_a ∉ Ω; B_p(w) = E_p(−w) | Pass | Keep |
| R 3.1 w_a → 0 on compact K | a → ∂Ω; \|a\| → ∞ | ≤ 2dist(a,Ωᶜ)/dist(K,Ωᶜ) → 0; O(1/\|a\|) | Pass | Keep |
| R 3.1 divisor example | 2[0] − [1] | z²/(z−1): orders 2, −1 | Pass | Keep |
| R 3.2 shell zeros | compact in K_N | shells n ≥ N+2 avoid K_N; finitely many earlier points | Pass | Keep |
| R 3.2 accumulation in a branch | x_j ∈ C → ξ | covering disks of radius < 1/n_j → 0 lie in C; infinitely many distinct | Pass | Keep |
| R 3.3 connectedness of V | Ω disk, V = Ω ⊔ disk | extension by 0 is holomorphic: hypothesis necessary | Pass | Keep |
| R 4.1 uniqueness and essential data | P = 1/z; exp(1/z) | difference entire; essential allowed in the general theorem, excluded from finite data | Pass | Keep |
| R 5.1 factorization Checks | z, (z−1)², e^z, f = 0 with F = 1 | m = 1, 2, 0; divisors 0 = 0 but exp(g) ≠ 0 | Pass | Keep |
| R 6.1 cosine, cotangent, tangent | z = 0, 1/2; residues | 1 and 0; π cot residue 1 at ℤ; −π tan residue 1 at ℤ + 1/2 | Pass | Keep |
| R 6.1 reciprocal Gamma | z = 0, 1 | 0 by the origin factor; e^γ∏(1+1/n)e^(−1/n) = 1 = 1/Γ(1) | Pass | Keep |
| R 6.1 shifted sine | α = 1/2, z = 0 | sin(π/2) = 1, π cot(π/2) = 0: cosine product | Pass | Keep |
| R 6.2 strip term and sum | z = i, n = 1; \|y\| = 1 | 1 ≤ 12/5; Σ ≤ 1 + π/2 by integral comparison from s = 1/2 | Pass | Keep |
| R 6.2 vertical limits | y → ∞ | q(iy) → −πi; π cot(πiy) = −πi coth(πy) → −πi | Pass | Keep |
| R 6.3 theta shift | z → z + 2 log r | H_r(z) (1 + r⁻¹e^(−z))/(1 + re^z) = r⁻¹e^(−z)H_r(z); at r = 1/2, z = 0 factor 2 | Pass | Keep |
| R 6.3 Manhattan shells | N = 1 at R = 1 | four cubes sum 4 ≤ 4N(√2R/N)³ = 8√2 | Pass | Keep |
| R 6.3 ratio product | a_n = 2/n², b_n = 1/n² | m² = 2n² impossible: no cancellation; poles accumulate at 0 | Pass | Keep |
| R 6.4 crescent | z = −1/2; z = −t; z = −1 + t | \|2z−1\| = 2; \|1/z\| = 1/t → ∞; \|1/(z+1)\| = 1/t → ∞ against bounded polynomials | Pass | Keep |
| R 6.5 real/imaginary Green | F dz with F = u + iv | curls −2 Im ∂̄F and 2 Re ∂̄F, so ∮F dz = 2i∫∂̄F dA; F = z̄: 2i | Pass | Keep |
| R 6.5 dz̄ cross-check | F = z on the unit disk | ∮ z dz̄ = −2πi = −2i∫∂z z dA | Pass | Keep |
| R 6.5 point-normalised polynomials | n = 1 | (1/2)/(1 − 1/2) = 1 | Pass | Keep |
| R 7.1 solutions | f = z̄, z e^(−\|z\|²), z; g = z̄ with f = 0 | z̄²/2, −e^(−\|z\|²) (value e⁻¹ at 1), \|z\|²; ∂z z̄ = 0 but dz̄ ≠ 0 | Pass | Keep |
| R 7.2 coefficient maps | L₁, Lᵢ, Re on (1, i) | dz = (1,i), dz̄ = (1,−i); Re ∘ L₁ = id | Pass | R01 (owner) |
| R 7.2 wedge normalisation | (e_z 1, e_z i) | dz∧dz̄ = −2i; η = dx∧dy has h = i/2; Re(−(i/2)z̄ dz) = (x dy − y dx)/2 | Pass | Keep |
| R 7.3 coordinate examples | z = 1, i, 2; (m,n) = (0,0),(1,0),(1,1),(2,2) | d(iz²)(1) = 2i, −2; d(i\|z\|²)(1) = 2i, 0; (log\|z\|)² gives log 2 both ways; moments π, 0, π/2, π/3 | Pass | Keep |
| R 7.4 Cousin Checks | two sets; one set; non-locally-finite cover | b = (1,0); 3c₁₁ = 0; zero cocycle, b = 0 | Pass | Keep |
| R Conventions | annulus 1<\|z\|<2 | index 1 − 1 = 0 at 0; area 4π − π = 3π | Pass | Keep |

**97 rows**, each with computed values; the seeded sample (0.2, 0.3, 1.1, 1.4, 2.1, 2.2, 2.4, 2.5, 6.1, 6.2, 6.4, 6.6, 7.1, 7.2, 7.3), every headline and every target a finding touches is covered.

## Not verifiable

- Ownership against open pull requests whose files the brief did not provide (ComplexComparisonPartII and AnalyticNumberTheoryPartI were read through the roadmap grep tool only, as consumers).
- Gray–Morris Lemma 1's own proof is delegated by the paper to Saks; the README's proof was checked as written above, not against Saks.

## Source issues

- none
