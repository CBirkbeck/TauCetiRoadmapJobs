# Review of GlobalHolomorphicFunctions (pull request #992 at c42ca42)

**Verdict:** needs changes

🤖 Independent AI review, full pass over the repaired head (the folder changed by 802 lines since `241053b`). Six findings, three blocking. The gate passes at this head, `Suggested.lean` elaborates with exactly 20 `sorry` warnings and no other output, the dependency check reports no problem, every Rainer and Gray–Morris locator opens on the cited statement, and the adversarial table below again found the mathematics sound. The branch now carries main's pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`), as the previous review asked; the three blocking findings are all consequences of reading the folder against that pin and against the supplier it now imports: Tau Ceti already owns the compact-open space of holomorphic functions of Layer 2.2 with its completeness, it owns the smooth-form carrier and the de Rham quotient that the module docstring and the Scope say are missing, and AnalyticNumberTheoryPartI §0.15a already states the full factorization of Layer 5.

**Repairs of the previous review's findings, finding by finding.**

- *R01 (branch pin; Layer 0, the filled exhaustion and the form carriers native at main's pin).* Repaired in substance: `lake-manifest.json` now pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b` (main's), `barDerivative`, `zDerivative`, `cauchyGreen` and the three Layer-0 theorems are gone, 0.1 and 0.3 consume `conjWirtingerDeriv`, the Cauchy transform identities and `exists_contDiff_conjWirtingerDeriv_apply_one_eq_of_hasCompactSupport` by name (`README.md:131`–152, `:204`–215, `:430`–445), the exhaustion is `IsOpen.exists_isFilledIn_compact_exhaustion` (`:37`–39, `:741`–745), and the Hyperfunctions sentence is reversed (`:40`–41). Not repaired in two parts: the module docstring still declares the form-level statements "not statable at the pins" because "the pinned Tau Ceti does not contain" `SmoothForm`, `mextDeriv`, `complexDz` (`Suggested.lean:25`–30), which is false at `2fd255d9` (R01 below); and `IsRungeCompactPair` writes the filled-in clause out instead of naming `TauCeti.IsFilledIn` (R06).
- *R02 (DifferentialGeometry §§6.1–6.2 dropped by its revision).* Repaired: DifferentialGeometry is no longer a supplier and no quotient is cited (`:13`–19, `:1880`–1881). The replacement sentence "No supplier owns a de Rham quotient" (`:18`) is false at the pin (R01), and the new Downstream sentence about DeRhamCohomologyAndDuality (`:1997`–1999) is not supported by that roadmap's head (R05).
- *R03 (the folded-in block).* Repaired: the block, its section comment and the two wrapper definitions are deleted; the one sharp-bound theorem is kept with a docstring under Layer 1 (`Suggested.lean:92`–99) and named in 1.4 (`README.md:623`).
- *R04 (ConformalMapping L1 consumer claim; §1.2 pullback naturality).* Repaired: `:1998`–1999 says ConformalMapping consumes nothing here; the DifferentialGeometry contract is gone.

## R01 (P2) — The form-level headlines of 7.2 and the degree-two de Rham vanishing are statable at the pin and absent; the docstring's "not statable" and the Scope's "no supplier owns a de Rham quotient" are false

**Location:** `Suggested.lean:25`–30 ("Not statable at the pins: the form-level closed completion … and the exactness of every smooth … two-form … are stated on Tau Ceti's smooth-form carrier …, which the pinned Tau Ceti does not contain; nothing is stated in their place"); `README.md:18`–19 ("No supplier owns a de Rham quotient: the real degree-two de Rham vanishing of a plane domain is a consumer's conclusion"); `:1880`–1881; `:198`–200 ("the form-level statements of Layer 7.2 are on Tau Ceti's smooth-form carrier").

**Claim:** the exactness of every smooth complex-valued and real-valued two-form on an open subset of ℂ (7.2), the form identity `d(g dz + f dz̄) = 0` (7.1), and `H²_dR(U;ℝ) = 0` cannot be written against the pinned libraries.

**Witness (Tau Ceti `2fd255d9`, the branch's own pin):** `TauCeti/Geometry/Manifold/DifferentialForm/Smooth.lean:479` `SmoothForm I M F k`; `ExtDeriv.lean:145` `mextDeriv`; `Plane/Complex.lean:41`, `:46` `SmoothForm.complexDz`, `complexDzBar : SmoothForm 𝓘(ℝ, ℂ) ℂ ℂ 1`; `Pullback/Basic.lean:241` `mpullback`; `Wedge/Basic.lean:238` `RoughForm.wedgeWith`; `Opens.lean:63` `mpullback_inclusion_apply`; and `TauCeti/Geometry/Manifold/DeRham/Basic.lean:127` `deRhamCohomology I M k` (the homology of the de Rham complex of real smooth forms, for `[IsManifold I 2 M]`), with `closedForms`, `exactForms` and `mem_closedForms_of_finrank_le` in the same file. The README's own `From Tau Ceti` contract cites every one of these form declarations by file (`:138`–152), so the README and the docstring contradict each other. On a scratch copy at the pins (after `lake build` of the Tau Ceti modules named below, whose oleans the worktree lacked) the three statements below and the closed-completion form identity elaborate with exactly four `sorry` warnings and no error.

**Exact repair:** in `Suggested.lean` import `TauCeti.Geometry.Manifold.DifferentialForm.Plane.Complex`, `TauCeti.Geometry.Manifold.DifferentialForm.Opens`, `TauCeti.Geometry.Manifold.DifferentialForm.Pullback.Smooth` and `TauCeti.Geometry.Manifold.DeRham.Basic`, delete the "Not statable" paragraph, and state under `/-! ## Layer 7 -/`:

```lean
open scoped Manifold ContDiff

/-- Every smooth complex-valued two-form on an open subset of ℂ is exact (README 7.2). -/
theorem exists_mextDeriv_eq_complex_two_form (U : TopologicalSpace.Opens ℂ)
    (η : TauCeti.SmoothForm 𝓘(ℝ, ℂ) U ℂ 2) :
    ∃ β : TauCeti.SmoothForm 𝓘(ℝ, ℂ) U ℂ 1, TauCeti.mextDeriv β.1 = η.1 := by
  sorry

/-- Every smooth real-valued two-form on an open subset of ℂ is exact (README 7.2). -/
theorem exists_mextDeriv_eq_real_two_form (U : TopologicalSpace.Opens ℂ)
    (η : TauCeti.SmoothForm 𝓘(ℝ, ℂ) U ℝ 2) :
    ∃ β : TauCeti.SmoothForm 𝓘(ℝ, ℂ) U ℝ 1, TauCeti.mextDeriv β.1 = η.1 := by
  sorry

/-- `H²_dR(U; ℝ) = 0` for every open `U ⊆ ℂ`, from the real exactness (README 7.2). -/
theorem subsingleton_deRhamCohomology_two (U : TopologicalSpace.Opens ℂ) :
    Subsingleton (TauCeti.deRhamCohomology 𝓘(ℝ, ℂ) U 2) := by
  sorry
```

and the closed completion as the vanishing of `mextDeriv` of `wedgeWith (ContinuousLinearMap.mul ℝ ℂ) (RoughForm.ofFunction 𝓘(ℝ, ℂ) g) (mpullback 𝓘(ℝ, ℂ) 𝓘(ℝ, ℂ) Subtype.val complexDz.1) + wedgeWith … f … complexDzBar.1` for a smooth `g` (the form of `README.md:1850`–1857). In the README replace `:18`–19 by "Tau Ceti owns the de Rham complex and its cohomology (`deRhamCohomology`); Layer 7.2 proves `H²_dR(U;ℝ) = 0` from its real exactness", make that vanishing a target of 7.2 (`:1880`–1881) with its `*Needs:*` (`closedForms`, `exactForms`, `mem_closedForms_of_finrank_le`), and rewrite the module docstring accordingly.

## R02 (P2) — Layer 2.2 and its Lean carrier restate Tau Ceti's `holomorphicFunctions`, whose completeness is a library instance

**Location:** `Suggested.lean:160`–190 (`HolomorphicMapSpace`, `HolomorphicMapSpace.toContinuousMap`, the scoped instances `HolomorphicMapTopology.openSubtypeLocallyCompact`, `HolomorphicMapTopology.compactConvergenceUniformity`, `complete_holomorphicMapSpace`); `README.md:766`–870 (2.2: "Define `HolomorphicMapSpace` … Equip H(U) with the uniformity induced by ι from native compact convergence on `C(U,ℂ)` … Prove the precise range comparison … prove that range ι is closed … Thus the induced metric on H(U) is complete"); `:12`–13; `:77`–81 ("`ContMDiffMap` … supplies the analytic map subtype, not a chosen compact-convergence uniformity").

**Claim:** the compact-open space of holomorphic functions on an open `U ⊆ ℂ`, its identification with ambient `DifferentiableOn`, its closedness in `C(U, ℂ)`, its completeness and the continuity of restriction are this roadmap's targets, and `complete_holomorphicMapSpace` is a headline.

**Witness (Tau Ceti `2fd255d9`, `TauCeti/Analysis/Complex/HolomorphicFunctions/Basic.lean`):** `:33` `holomorphicFunctions (U : Opens ℂ) : Subalgebra ℂ C(U, ℂ)` with carrier "there is `g` with `DifferentiableOn ℂ g U` agreeing with `f` on `U`", topology inherited from `C(U, ℂ)`; `:57`, `:62`, `:71` `mem_holomorphicFunctions_iff`, `…_of_eqOn`, `…_extend` (2.2's range comparison, including extension by zero); `:76`, `:106` `HolomorphicFunctions.restrict`, `continuous_restrict` (restriction to a smaller open set as a continuous algebra homomorphism); `:161` `tendsto_iff_tendstoLocallyUniformlyOn` (2.2's "representative-level equivalence with `TendstoLocallyUniformlyOn`"); `:173` `TauCeti.isClosed_holomorphicFunctions`; `:144` of the public section, `instance (U : Opens ℂ) : CompleteSpace (holomorphicFunctions U)`. On the scratch copy `example (U : Opens ℂ) : CompleteSpace (TauCeti.holomorphicFunctions U) := inferInstance` closes on the same scratch copy with no error, so the headline is a one-term theorem on the native carrier; the only difference is the carrier (`ContMDiffMap … ω` with a comap uniformity against a subalgebra of `C(U, ℂ)`), which is a second definition of the same object. Its neighbours `HolomorphicFunctions/Jet.lean` (finite jets, kernel of finite codimension) and `RestrictionEstimate.lean` (the `(r/R)^(n+1)` restriction bound) also cover the jet bookkeeping 2.5 uses.

**Exact repair:** delete the five declarations `Suggested.lean:160`–190 and the `open scoped HolomorphicMapTopology` line; nothing replaces them (completeness is an instance). Rewrite 2.2 as a consumer: `H(U)` is `TauCeti.holomorphicFunctions U`; cite `mem_holomorphicFunctions_iff_extend`, `isClosed_holomorphicFunctions`, the `CompleteSpace` instance, `tendsto_iff_tendstoLocallyUniformlyOn`, `restrict` and `continuous_restrict` under `From Tau Ceti`, and keep as targets only what is not there: the explicit comparison metric `d_C` on `C(U, ℂ)` with its equality of uniformities, the continuity of `f ↦ f'` (Rainer Exercise 20), and the `ContMDiffMap`-to-`holomorphicFunctions` comparison if a consumer needs the manifold bundle. Update `:12`–13 and `:77`–81, and drop the backticked names of the deleted declarations from the README (`:768`, `:774`, `:777`–778, `:828`).

## R03 (P2) — Layer 5's full factorization is stated by AnalyticNumberTheoryPartI §0.15a, the supplier this head imports

**Location:** `README.md:1312`–1348 (Layer 5, "The headline `entire_weierstrass_factorization` states: for every nonzero entire f with zero order m at 0 … prove `f(z)=z^m exp(g(z)) ∏ E_{p_n}(z/a_n)` for an admissible sequence p_n and entire g"); `Suggested.lean:270`–286; `:3`–5 (Summary).

**Claim:** the full Weierstrass factorization without a growth hypothesis is this roadmap's theorem, assembled from AnalyticNumberTheoryPartI's `exists_entire_primary_product_exact` and `exists_entire_exp_mul_of_divisor_eq`.

**Witness:** AnalyticNumberTheoryPartI at its open head (pull request #1126, merge order line 49, before this roadmap at 95), `README.md:550`, §0.15a, after stating `exists_entire_exp_mul_of_divisor_eq`: with §0.15 this gives every nonzero entire `f` the form `z^m exp(g(z)) ∏ E_{p_a}(z/a)^{m_a}` over its nonzero zeros, for admissible genera and an entire `g`, without a growth hypothesis — the statement of 5.1 word for word (its Lean file states the finite-order form `finite_order_hadamard`, `Suggested.lean:374`, and leaves the growth-free form to the text). Layer 5.1 adds no step of its own ("The entire function `z^m ∏ E` has the native divisor of f, so AnalyticNumberTheoryPartI §0.15a supplies g", `:1322`–1323): it re-plans a supplier's stated result.

**Exact repair:** cite AnalyticNumberTheoryPartI §0.15a for the full factorization under `From TauCetiRoadmap.AnalyticNumberTheoryPartI` (`:175`–182), delete Layer 5 and `entire_weierstrass_factorization` (its three Checks `:1333`–1337 move under that contract as Checks of the consumed statement), and drop "full Weierstrass factorization" from the Summary and from "How to read the build" (`:191`–196), renumbering nothing else (Layer 6's `*Needs:* Layers 1 and 5` lines `:1416`, `:1551` then cite the contract). If the project wants this roadmap to own the theorem instead, that is a change to AnalyticNumberTheoryPartI's pull request (dropping its sentence), not to this folder.

## R04 (P3) — The ZerosOfLFunctions citations are shifted by one section, and 1.1 is a stub

**Location:** `README.md:28`–29 ("ZerosOfLFunctions, Layer 5.2–5.5, owns the zero-support API, the genus-one factor and its basic API, its canonical product under order-one growth, and the entire logarithm"); `:170`–172 ("Layer 5.2's countable locally finite zero support, Layer 5.3's genus-one factor and basic API, Layer 5.4's growth-to-summability canonical product, and Layer 5.5's entire logarithm"); `:576` ("ZerosOfLFunctions Layer 5.2's support API"); `:710`; and `:510`–515 (1.1, three lines saying its content "are AnalyticNumberTheoryPartI §0.15").

**Witness:** ZerosOfLFunctions on main, `TauCetiRoadmap/ZerosOfLFunctions/README.md:929` "5.1 Zeros of a function of finite order" (the countable locally finite zero support as the support of `MeromorphicOn.divisor f univ`), `:938` "5.2 The elementary factor" (`E₁`, `deriv E₁ z = −z exp z`, `deriv E₁ 1 = −e`), `:957` "5.3 The canonical product" (from `∑ m_ρ ‖ρ‖⁻² < ∞`), `:979` "5.4 The entire logarithm", `:989` "5.5 Hadamard's theorem at order at most one". Every citation names the section after the one that holds the content. A subsection whose whole text is "stated by roadmap X" is the "(removed)" stub the house style forbids: the deferral belongs to the Scope (`:29`–32 already carries it).

**Exact repair:** renumber the four citations to 5.1 (support), 5.2 (factor), 5.3 (canonical product), 5.4 (entire logarithm) at `:28`, `:170`–172, `:576`, `:710`. Give 1.1 content of this roadmap's own: move the primary-factor derivative identities `Eₚ′(w) = −wᵖ exp(Qₚ(w))`, `Eₚ′/Eₚ = −wᵖ/(1−w)` and `log ‖E₁(w)‖ ≤ ‖w‖²` from the head of 1.2 (`:519`–525) into 1.1 with their Check `E₁′(1) = −e` (`:574`), and leave 1.2 to begin at the weighted-support specialization.

## R05 (P3) — A consumer claim DeRhamCohomologyAndDuality's head does not make

**Location:** `README.md:1997`–1999 ("DeRhamCohomologyAndDuality draws `H²_dR(U;ℝ)=0` for an open `U⊆ℂ` from Layer 7.2's real exactness on its own de Rham quotient").

**Witness:** DeRhamCohomologyAndDuality at its open head (pull request #1768) contains no occurrence of GlobalHolomorphicFunctions and no planar `H²` statement (grep over its README: 0 hits); its quotient is Tau Ceti's `deRhamCohomology` in any case (R01). The sentence states as a fact what no roadmap does.

**Exact repair:** after R01 the vanishing is this roadmap's theorem; replace the clause by "Layer 7.2 proves `H²_dR(U;ℝ) = 0` on Tau Ceti's `deRhamCohomology`, available to every consumer".

## R06 (P3) — `IsRungeCompactPair` writes the native predicate out instead of naming it

**Location:** `Suggested.lean:103`–110 (docstring: "`K` filled in `Ω` …, Tau Ceti's `IsFilledIn K Ω`, written out"); `README.md:932`–933 ("Define `IsRungeCompactPair` by openness, compact containment and `IsFilledIn K Ω`, the native absence of relatively compact complementary components").

**Witness:** `TauCeti/Topology/FilledIn.lean:61`–64 defines `IsFilledIn K Ω` by exactly the clause `Suggested.lean:108`–110 repeats; on the scratch copy `IsOpen Ω ∧ IsCompact K ∧ K ⊆ Ω ∧ TauCeti.IsFilledIn K Ω` is `Iff.rfl`-equal to the file's definition (elaborated on the same scratch copy). The README says the definition uses the native predicate; the Lean does not, and the module `TauCeti.Topology.FilledIn` exists at the pin to import.

**Exact repair:** add `import TauCeti.Topology.FilledIn` and define `IsRungeCompactPair Ω K := IsOpen Ω ∧ IsCompact K ∧ K ⊆ Ω ∧ TauCeti.IsFilledIn K Ω`; the docstring then says "Tau Ceti's `IsFilledIn`" without "written out".

## Verified sound

**Gate and build.** The worker's gate at `c42ca42` passes every check (set_option, blobs, LaTeX, pull-request numbers, sorry'd data and examples, residue words, imports, Mathlib sub-imports, line count, statement hygiene, dropped ids, README ids, empty sections, layer and target ids, depcheck, metadata, stray files, outside-folder, source material, build). `git diff --stat origin/main...HEAD` outside the folder is empty. `lake env lean` on `TauCetiRoadmap/GlobalHolomorphicFunctions/Suggested.lean` (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`) exits 0 with exactly **20 `declaration uses sorry` warnings and no other output**. A scratch copy with `#check @name` for all 24 declarations inside the namespace elaborated once with no error; each printed type was compared with its README statement: the file has no `variable` line, every hypothesis is in the declaration's own signature (`IsOpen`, the compactness and inclusion clauses, `Countable S`, `ContDiffOn ℝ ∞`/`ContDiffOn ℝ 1`, `hne`, `≠ ⊤`, the Runge-pair hypothesis, `cauchyPompeiu`'s trace and index hypotheses, `hcycle`), and nothing changed. The one-tactic probe (`simp`, `norm_num`, `rfl`, `infer_instance`, `exact Finset.norm_prod_one_add_sub_one_le _ _`) on a scratch copy closed 0 of the 9 theorems it was run on (the sharp bound, Looman–Menchoff, the Runge equivalence, the hull equality, `complete_holomorphicMapSpace`, the quotient theorem, Cousin I, the closed completion, Cauchy–Pompeiu); the completeness headline closes on the native carrier by `inferInstance` (R02). The folder has exactly `README.md`, `Suggested.lean`, `metadata.toml`.

**Dependency check.** The command of the brief returned exactly:

```text
depcheck: 238 roadmaps, 2349 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Merge order: ZerosOfLFunctions 48, AnalyticNumberTheoryPartI 49, GlobalHolomorphicFunctions 95, AutomorphicSpectralTheoryPartII 300, DeRhamCohomologyAndDuality 393; DifferentialGeometry, ComplexKahlerGeometry, Hyperfunctions, RealAnalyticGeometry and ZerosOfLFunctions are on main under `TauCetiRoadmap/`, ConformalMapping under `Completed/`. AnalyticNumberTheoryPartI is not on main; it is cited at its open head (#1126), which is earlier in the order and which cites nothing from this roadmap (0 hits), so no cycle.

**Citations resolved, at the copy named.** AnalyticNumberTheoryPartI #1126: `README.md:526` §0.15 (`elementaryFactor`, the sharp estimate `|1−E_p(w)| ≤ |w|^(p+1)` on the closed disc, compact-summability product with additive orders and unit tail, reindexing and grouping of finite fibres, `E₁` identified with ZerosOfLFunctions 5.2), `:550` §0.15a (`exists_entire_exp_mul_of_divisor_eq`, both nontriviality hypotheses, and the full-factorization sentence of R03); its `Suggested.lean:347` `elementaryFactor p w = (1 − w) * exp (∑ k ∈ range p, w^(k+1)/(k+1))`, which is term for term the factor written out in `exists_entire_genusOne_product` at `p = 1` and in `entire_weierstrass_factorization`; `:352` `exists_entire_primary_product_exact` (countable `ι`, `a i ≠ 0`, cofinite escape, `∀ R > 0, Summable ((R/‖a i‖)^(p i + 1))`, `HasProdLocallyUniformlyOn`, `DifferentiableOn ℂ F univ`, `analyticOrderAt F z = Nat.card {i // a i = z}`), the hypotheses 1.2 translates from `Σ m/‖ρ‖² < ∞`; `:364` `exists_entire_exp_mul_of_divisor_eq`. ZerosOfLFunctions on main: Layer 5 headings as in R04; its 5.2 `deriv E₁ 1 = −e` agrees with 1.2's Check. ComplexKahlerGeometry on main consumes GH5.1's complex exactness (`README.md:35`), GH0's compact-support operator and finite-rank Runge operator (`:198`–200) and GH2 (`:345`), and at #1398 names §§0.3, 2.5, 7.2 (`:50`) and the Mittag–Leffler owner (`:740`); Hyperfunctions on main cites GH0 (`:29`); ConformalMapping (`Completed/ConformalMapping/README.md:86`–87, `:133`–150, `:1374`) states Montel on ambient families, owns L5 Jordan separation and `TauCeti.filledHull`, and records that it consumes nothing here. AutomorphicSpectralTheoryPartII #1761 (`:15`, `:157`) cites this roadmap by a heading, "Preparatory primary factors and locally uniform products", that neither this head nor the previous one carries (the previous 1.1 was "Arbitrary genera and compact summability"): that citation was stale before this change and is that pull request's to repoint, to AnalyticNumberTheoryPartI §0.15, which the Scope here names as the owner (`:29`–32).

**Ownership by object.** Through the roadmap grep over main and the 466 open pull requests: Looman–Menchoff (0 hits elsewhere), Mittag–Leffler for meromorphic functions (only the inverse-limit condition elsewhere), Cousin I (SchemeAndStackFoundations' Cousin complexes are a different object), the holomorphic hull (RealAnalyticGeometry `:697`, `:948` uses a Stein hull on a different carrier), Runge (ComplexComparisonPartII cites this roadmap's scalar inputs), Cauchy–Pompeiu (PseudoholomorphicCurveAnalysis consumes Tau Ceti's files, as this roadmap now does), Weierstrass factorization (R03). Tau Ceti at the pin: no Runge theorem, no Mittag–Leffler, no Cousin, no Looman–Menchoff, no holomorphic hull (`PolynomialHull/Basic.lean` is the polynomial hull in ℂⁿ, a different object); `Wirtinger/Potential.lean:64` solves `∂̄g = f` only near a point of an open set, not globally (7.1 stays this roadmap's); `DeRham/NormedSpace.lean` proves `H^(k+1)_dR(E) = 0` for a normed space `E`, not for its open subsets. Ownership against open pull requests whose files the brief did not give me was checked through the grep tool only.

**Pinned declarations opened** (Tau Ceti `2fd255d9`): `Wirtinger/Basic.lean:66`, `:80` (`wirtingerDeriv`, `conjWirtingerDeriv g x v = 2⁻¹ • (fderiv ℝ g x v + I • fderiv ℝ g x (I • v))`), `:91`, `:96`, `:102`, `:170`; `Wirtinger/Holomorphic.lean:53` (under `DifferentiableAt ℝ`); `Pompeiu/Basic.lean:163` (`(2π)⁻¹ • ∫ (w − z)⁻¹ • (fderiv u z 1 + I • fderiv u z I) = u w`, compactly supported `C¹`), `:261` (`conjWirtingerDeriv (∫ (w − z)⁻¹ • f) w 1 = π • f w`), `:286` (holomorphic off a compact set outside which `f` vanishes); `Wirtinger/Potential.lean:41` (`1 ≤ n`, `n : ℕ∞`); `CauchyKernel.lean:44`; `Topology/FilledIn.lean:61`; `Analysis/Normed/Module/Exhaustion.lean:86` (stages `closedBall 0 (n+1) \ thickening (n+1)⁻¹ Ωᶜ`); `DifferentialForm/Basic.lean:41`, `:48`; `Smooth.lean:380`, `:479`; `ExtDeriv.lean:145`, `:371`; `Squared.lean:72` (`IsSmoothBundleForm … 2 φ`); `Wedge/Basic.lean:238`, `:269`, `:370`; `Wedge/Leibniz.lean:97` (`MDifferentiableAt` of both forms at the point); `Pullback/Basic.lean:241`, `:247`; `Opens.lean:63`, `:72`, `:354`; `Plane/Complex.lean:41`, `:46`; `Green/Cycle.lean:36` (`IsOpen U`, `IsIn C U`, `ContDiffOn ℝ 1 P U`, `ContDiffOn ℝ 1 Q U`, `IsNullHomologous C U`); `Contour/Primitive.lean:183`, `:263`, `:293`; `Contour/Cycle/Winding.lean:137`; `Contour/Cycle/Basic.lean:91` (`PiecewiseC1ClosedCurve.of`); `Conformal/Morera.lean:40`; `FilledHull.lean:99`; `HolomorphicFunctions/Basic.lean` (R02); `DeRham/Basic.lean:127`. Mathlib `1b1ccf4b`: `Log/Summable.lean:137` (`Finset.norm_prod_one_add_sub_one_le`, the exponential bound only; no sharp `∏(1+‖uᵢ‖) − 1` bound exists at the pin), `:214`; `Complex/Exponential.lean:679`; `Cotangent.lean:122`, `:136`, `:215`, `:233`; `IntegerCompl.lean:23`; `Gamma/Beta.lean:31`; `Harmonic/EulerMascheroni.lean:21`; `Manifold/PartitionOfUnity.lean:556` (`SmoothPartitionOfUnity.exists_isSubordinate`, closed `s`, open cover); `ContMDiff/Basic.lean:383`; `DivergenceTheorem.lean:374`; `VectorMeasure/AddContent.lean:23`, `:340`; `Covering/Differentiation.lean:838`; `LocallyUniformLimit.lean:136`, `:201`; `LogDerivUniformlyOn.lean:24`; `Meromorphic/Divisor.lean:79`; `Analytic/Order.lean:46`; `Meromorphic/Order.lean:97`; `CompactConvergence.lean:171`, `:224`, `:256`; `HasPrimitives.lean:99`, `:281`; `EulerSineProd.lean:245`; `Gamma/Digamma.lean:48`; `Lebesgue/Complex.lean:46`; `VolumeOfBalls.lean` (`Complex.volume_closedBall`); `Measure/Complex.lean:113`; `VectorMeasure/WithDensity.lean:145`; `Decomposition/Lebesgue.lean:187`, `:429`, `:434`; `LocallyCompact.lean:224`; `InfiniteSum/UniformOn.lean:147`; `MultipliableUniformlyOn.lean:87`; `LineDeriv/Basic.lean:81`; `ContMDiffMap.lean:41`.

**Sources.** Rainer (cache `c86be0dc…`, the README's Tuwien URL; printed page = PDF page − 6): line 81 (a domain is a nonempty open set, a connected one a region: the Conventions' claim), 1189 (§10 head, (10.1)), 1216 (Prop. 10.1, bounded domain, finitely many simple closed C¹ paths, `dζ∧dζ̄` form), 1237 (polar kernel integrability), 1253 (`dξdη = −(2i)⁻¹ dζ∧dζ̄`), 1255 (Thm 10.2, `C^k_c`, `k = 1, …, ∞`), 1295 (Thm 10.3 cutoff identity), 1313 and 1329 ((11.1)–(11.2), Exercises 19–20), 1333 (O(K)), 1338 (Thm 11.1), 1437 (Lemma 11.3, items (1) distance, (2) convex hull, (3) union with relatively compact components, as the README splits them), 1550 (Thm 11.7), 1603 (Thm 12.1, essential singularities allowed), 1630 (Thm 12.2), 1658 and 1689 (Prop. 12.3, Thm 12.4, cocycle `f_ik = f_ij + f_jk`), 1843 (the monomial estimate inside the proof of Prop. 14.2), 1868 (Thm 14.3), 1950 (Prop. 15.2, `K = K̂_U`, nowhere-zero `f ∈ O(K)`), 1997 (Thm 15.3), 2030 and 2050 (Remark 15.4, `E_p` and the entire factorization `z^m e^g ∏ E_{p_n}`), 2086 (Thm 15.5, for a region), 2116 (Thm 15.6). Gray–Morris (cache `2dbcc98e…`, author copy): line 66 Theorem 3 with (i) the four partials everywhere, (ii) CR everywhere, (iii) continuity, as the Lean states; 310–325 the Appendix and Lemma 1 with the constant `5N·m(R−E)`.

**README shape and policy.** Summary, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, ZerosOfLFunctions, AnalyticNumberTheoryPartI, ConformalMapping), How to read the build, Layers 0–7 with `### k.n` prose, `*Needs:*` lines, `**Checks.**` lists (at least three per definition), `### Examples` and `### Dependencies`, Downstream consumers, References; no LaTeX delimiters, pull-request numbers or machine paths (the gate agrees). Every backticked name of the roadmap's own in the README is declared in `Suggested.lean` and conversely (gate `readme-ids-missing=0`; the 24 names grep to the README). Imports are `import Mathlib` and one existing `TauCeti.*` module; no `set_option`, `lemma`, `#eval` or sorry'd data.

**Headline theorems.** From the README: Looman–Menchoff (0.2), the sharp finite-product bound (1.4), the weighted genus-one products (1.2), Runge equivalence, hull equality and the finite-rank operator (2.5), completeness (2.2, native: R02), zero-free approximation, divisor realization and boundary noncontinuation (3.1–3.2), Mittag–Leffler, isolated singularities and the quotient theorem (4.1), full factorization (5.1, a supplier's: R03), Cauchy–Pompeiu on a cycle (6.5), global `∂̄` and the closed completion (7.1), the two-form exactness and the degree-two de Rham vanishing (7.2, statable and absent: R01), Cousin I (7.4). All but the 7.2 statements are in `Suggested.lean`.

**Adversarial pass.** One row per statement; S = `Suggested.lean`, R = README; values recomputed this round.

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| R 0.1 operators, native `conjWirtingerDeriv` | u = z, z̄, \|z\|² at z = i | (∂z,∂̄) = (1,0), (0,1), (z̄,z) = (−i,i); native formula at v = 1 is `2⁻¹•(fderiv 1 + I•fderiv I)`, the README's | Pass |
| S Looman–Menchoff | f = z; f = z̄; Looman's exp(−z⁻⁴) extended by 0; Ω = ∅ | fx = 1, fy = i = i·fx; fy = −i ≠ i·1, excluded; Looman's example is discontinuous at 0 (\|f(0.3e^{iπ/4})\| ≈ 4·10⁵³), excluded by `ContinuousOn`; ∅ vacuous | Pass |
| R 0.2 Check z̄ on the unit square | counterclockwise | ∮ z̄ dz = 2i·area = 2i; i·fx − fy = i·1 − (−i) = 2i | Pass |
| R 0.2 square-to-ball | r = 1 | square 4, ball of radius √2: 2π; ratio π/2 = 1.5708 | Pass |
| R 0.3 kernel sign | native `(2π)⁻¹∫(w−z)⁻¹•(uₓ+iu_y) = u w`; radial cutoff | T(∂̄ψ)(0) = −2∫₀¹ h′(r²) r dr·… = h(0) = 1 = ψ(0); kernel `w − z` as the README states | Pass |
| R 0.3 kernel norm on a disk | r = 1 | ∫_{\|ζ\|<1} \|ζ\|⁻¹ dA = 2π | Pass |
| R 1.1 / ANTPI `elementaryFactor` | p = 0,1,2 at w = 0, 1, −1 | E_p(0) = 1, E_p(1) = 0; \|E_p(−1)\| = 2.0000, 0.7358, 1.2131 | Pass |
| ANTPI sharp estimate consumed in 1.2, 6.3 | p = 0,1,2, 720 points of \|w\| = 1 | max(\|1−E_p(w)\| − 1) = 0.000000 each | Pass |
| R 1.2 `log‖E₁(w)‖ ≤ ‖w‖²` | 50 radii × 360 angles in the disk | max(log\|E₁\| − \|w\|²) = −0.0002 ≤ 0 | Pass |
| R 1.2 E₁′(1) | w = 1 | numeric −2.71828 = −e; ZerosOfLFunctions 5.2 `deriv E₁ 1 = −e` | Pass |
| S `exists_entire_genusOne_product` | S = ∅; S = {1}, m = 2; S = {2}, m = 0 | 1; (1−z)²e^{2z}, order and divisor 2 at 1; factor 1, order 0 with the `if` returning 0 | Pass |
| S `…_of_divisor` | D = 0; D = 2[1] | product 1, divisor 0; Σ D/‖ρ‖² = 2, divisor 2[1]; `(D ρ).toNat = 2` | Pass |
| R 1.2 majorant | S = {1}, m = 2, radius R | Σ_ι (R/\|a_i\|)² = 2R² = R²·Σ m/\|ρ\|² | Pass |
| R 1.3 genus and tail | aₙ = n; aₙ = 2ⁿ, N = 2, R = 1 | Σ1/n = ∞, Σ1/n² < ∞: genus 1; Σ2⁻ⁿ = 1: genus 0; tail R·2^{1−N} = 0.5 | Pass |
| S sharp bound (1.4) | u = (1,1); (1,−1); (−1,0); ∅ | ‖P−1‖ = 3 ≤ 3; 1 ≤ 3; 1 ≤ 1; 0 ≤ 0; exponential bounds 6.389, 6.389, 1.718, 0 | Pass |
| R 1.5 uniform tail | uₙ(x) = 1/(n+1) at x = n | tail 1/(N+1) → 0; Σ sup = harmonic, diverges; u₀ = −1: product 0, order ⊤ | Pass |
| S `IsRungeCompactPair`; native `IsFilledIn` | (∅,∅); unit circle in ℂ; annulus 2 ≤ \|z\| ≤ 3 in D₄; in 1 < \|z\| < 4 | true; false; false; true; the fourth clause is `IsFilledIn K Ω` by `Iff.rfl` | Pass (R06) |
| S `holomorphicHull` | K = ∅; circle; annulus in 1 < \|z\| < 4 | B = −1, f = 0 excludes all: ∅; closed disk; 1/z bounds \|z\| ≥ 2 so hull = K | Pass |
| R 2.1 distance and convex hull | K unit circle in D₃, z = 2 | both infima 2; \|e^{2}\| = e² > e = sup_K\|e^z\| | Pass |
| R 2.1/2.2 K_n | Ω = ∅; ℂ; native stage | thickening of ∅ is ∅ so K_n = closedBall 0 (n+1) in ℂ; in ∅ every stage ∅ | Pass |
| R 2.2 metric | constants differing by 1; 1/(n+1); t = 1 | Σ2⁻ⁿ/2 = 0.5; (1/(n+1))/(1+1/(n+1)) = 1/(n+2) (0.2 at n = 3); min(1,t)/2 = t/(1+t) = 1/2 | Pass |
| S `complete_holomorphicMapSpace`; native instance | f_j = z + 1/j; limit z̄ | limit z holomorphic; z̄ has ∂̄ = 1 ≠ 0 so not a limit; `inferInstance` on `holomorphicFunctions U` | Native (R02) |
| R 2.3 O(K) | εz̄; Σzⁿ/(n+1)² | ∂̄ = ε ≠ 0; derivative coefficients n/(n+1)² sum to ∞ at 1 | Pass |
| R 2.4 contour estimate | unit circle, f − g = 1; reversed | 0 ≤ 2π; ∮dz/z = 2πi becomes −2πi, length 2π | Pass |
| S `isRungeCompactPair_iff_approximation` | annulus in D₄, f = 1/z; (∅,∅) | (z−a)gₙ → 1 on the hole, 0 at a: contradiction; both sides true | Pass |
| S `holomorphicHull_eq_fill` | relatively compact component C | C ⊆ hull(K̂) = K̂, C ∩ K̂ = ∅ forces C = ∅; reverse by Lemma 11.3(3) on K̃ | Pass |
| R 2.5 pole push, jets | dist > 2δ, \|a−b\| < δ; f = z², marked 0, order 1 | ratio < 1/2; P = 0, Q = z², quotient 1 | Pass |
| S `exists_finite_rank_runge_operator` | K = {0}, U = Ω = ℂ, f = c; K = ∅ | N = 1, ζ = 0, w = 1, g = 1: error 0 ≤ εB; L = ∅, N = 0 | Pass |
| S `exists_zero_free_holomorphic_approximation` | annulus, u = z | g = z, winding 1; exponentials have winding 0 | Pass |
| R 3.1 direct construction | w_a = (b_a−a)/(z−b_a); B_p | 1 + w_a = (z−a)/(z−b_a); B_p(w) = E_p(−w); 2[0]−[1] by z²/(z−1) | Pass |
| S zero orders, divisor | m = 0; m = 2 at 2; ν = −[0]; f = 0 | 1; (z−2)²; 1/z; order ⊤ excluded | Pass |
| S boundary germ | Ω = ∅, ℂ; ℂ∖{0} at 0; ℂ∖ℝ at 0 | vacuous; zeros 1/n accumulate, extension vanishes, contradiction off E; both half-disk components receive shell disks | Pass |
| R 3.2 shells | compact in K_N; x_j → ξ | shells n ≥ N+2 avoid K_N; radii < 1/n_j → 0 | Pass |
| R 3.3 connected V | disk ⊔ disjoint disk | extension by 0 holomorphic: hypothesis necessary | Pass |
| S Mittag–Leffler, isolated singularities | E = ∅; E = {0}, P = 1/z² + z; exp(1/z) | f = 0; f = 1/z², f − P = −z; exp(1/z) only by the general theorem | Pass |
| S `exists_holomorphic_quotient` | F = 1/z; F ≡ 0 on a component; Ω = ∅ | f = 1, g = z; f = 0, g = 1; codiscrete filter on ∅ | Pass |
| ANTPI `exists_entire_exp_mul_of_divisor_eq` as consumed | f = 2z², F = z²; f = 0, F = 1 | g = log 2; both divisors 0, f has no nonzero value, excluded | Pass |
| S `entire_weierstrass_factorization` | f = z; (z−1)²; e^z | m = 1, P = 1, g = 0; m = 0, p = 0, P = (1−z)², g = 0; m = 0, P = 1, g = z | Pass (owner: R03) |
| R 6.1 cosine, Gamma, shift | z = 0, 1/4, 1/2; z = 1/2; α = 1/2, z = 1/4 | cos product 1.00000, 0.70711, 0.00000 = cos(πz); z e^{γz}∏ = 0.564190 = 1/√π; shifted product 0.707107 = sin(3π/4) | Pass |
| R 6.2 strip bounds | z = i; n = 1; y = 1 | \|q(i)\| = 3.15334 = π coth π ≤ 8.7124; term 1.0000 ≤ 2.4000; Σ y/((n−½)²+y²) = 1.5649 ≤ 2.5708; \|c(i)\| = 3.15335 = π(1+e^{−2π})/(1−e^{−2π}) | Pass |
| R 6.2 periodicity, constant | N = 0, z = 1/2; y = 1 | (3/2)⁻¹ − (1/2)⁻¹ = −4/3 both sides; S₁ = 1.076669 = (π coth π − 1)/2; π/2 − S₁ = 0.494127 ∈ [0,1]; q(iy), c(iy) → −πi | Pass |
| R 6.3 theta, shells, ratio, sparse | r = 1/2, z = 0; N = 1, 2; aₙ = 2/n², bₙ = 1/n²; aₙ = 2ⁿ | H(2 log r)/H(0) = 2.000000 = r⁻¹; shell N = 1: 4 ≤ 8√2 = 11.31, N = 2 has 8 points; m² = 2n² has no solution; tail 0.5 | Pass |
| R 6.3 hyperbolic sine | z = 1/2 | πz∏(1+z²/n²) = 2.301296 vs sinh(π/2) = 2.301299 (truncation 2·10⁵) | Pass |
| R 6.4 crescent | z = −1/2; −t; −1+t | \|z\| = 1/2 < 1, \|2z−1\| = 2 > 1; \|1/z\| = 1/t → ∞; \|1/(z+1)\| = 1/t → ∞ | Pass |
| S `cauchyPompeiu` sign | unit disk, ξ = 0, f = \|z\|², 1, z̄ | 2∂̄f = 2z: (2π)⁻¹∫2z/z = 1, boundary (2πi)⁻¹∮dz/z = 1, so 0 = 1 − 1; 1 = 1 − 0; 0 = 0 − 0 | Pass |
| S `cauchyPompeiu` index | annulus 1 < \|z\| < 2 | index 0 at 0, 1 at 3/2, 0 at 3 | Pass |
| R 6.5 moments, Euler product | (m,n) = (0,0), (1,0), (1,1); z = 1 | π, 0, π/2; z e^{z/2}∏(1+z²/(4π²n²)) = 1.718282 = e − 1 | Pass |
| R 6.6 residues | z = 0; double zero; α = 1/2 | 1/z residue 1; residue 2; poles at ℤ + 1/2 only | Pass |
| S `exists_smooth_conjWirtingerDeriv_eq`, closed completion | f = z̄, z, z e^{−\|z\|²}; g = z̄ with f = 0 | z̄²/2, \|z\|², −e^{−\|z\|²} (e⁻¹ at 1); ∂z z̄ = 0 but dz̄ ≠ 0 | Pass |
| R 7.2 coordinate forms | (e_z 1, e_z i) | dz∧dz̄ = 1·(−i) − i·1 = −2i, dx∧dy = 1; η = dz∧dz̄: u = z̄, d(−z̄ dz) = dz∧dz̄; η = dx∧dy: u = z̄/2, β = (x dy − y dx)/2, dβ = dx∧dy; native `complexDz`, `complexDzBar` are v ↦ v, v ↦ v̄ | Pass (statable: R01) |
| R 7.3 worked examples | z = 1, i, 2 | d(iz²)(1;1) = 2i, (i;1) = −2; d(i\|z\|²)(i;1) = 0; d(\|z\|⁴)(2;1) = 32; log-square: log 2 both sides | Pass |
| S `additive_cousin_I` | two sets c₁₂ = 1; one set; k = i | b = (1,0); 3c₁₁ = 0; c_ji = −c_ij, so the cyclic cocycle is Rainer's `f_ik = f_ij + f_jk` | Pass |
| R Conventions | annulus 1 < \|z\| < 2 | index 1 − 1 = 0 at 0; area 4π − π = 3π | Pass |

**52 rows**, each with computed values; the seeded sample (0.1, 0.2, 1.1, 1.2, 1.3, 2.1, 2.4, 2.5, 3.3, 6.1, 6.2, 6.3, 6.6, 7.2, 7.3), every headline and every target a finding touches are covered.

**Notes that are not findings.** `[Countable S]` in `exists_entire_genusOne_product` follows from `hfinite` (ℂ is σ-compact); `hEscape` of the supplier's theorem follows from its `hsum`. `exists_entire_genusOne_product` is the `p = 1`, `ι = Σ ρ, Fin (m ρ)` instance of AnalyticNumberTheoryPartI's product theorem plus its grouping bullet and the native divisor identification; the Scope records the coordination with ZerosOfLFunctions and AnalyticNumberTheoryPartI (`:29`–36), so it is left as the roadmap's summability-input interface.

## Not verifiable

- Ownership against open pull requests whose files the brief did not provide was checked through the roadmap grep tool only.
- Gray–Morris Lemma 1's own proof is delegated by the paper to Saks; the README's balanced-rectangle proof was checked as written, not against Saks.

## Source issues

- none
