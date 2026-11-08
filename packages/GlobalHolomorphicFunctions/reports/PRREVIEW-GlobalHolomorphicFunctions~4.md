# Review of GlobalHolomorphicFunctions (pull request #992 at 241053b)

**Verdict:** needs changes

🤖 Independent AI review, full pass over the repaired head (the folder changed by 242 lines since `7018cfb`). Four findings, two blocking. The gate passes at this head and `Suggested.lean` elaborates with exactly 41 `sorry` warnings; the dependency check reports no problem; every Rainer and Gray–Morris locator opens on the cited statement. The two blocking findings are not about the mathematics, which the adversarial table below again found sound: one is the branch's Tau Ceti pin, an ancestor of main's pin at which the library now natively owns Layer 0, the filled exhaustion and the form carriers this roadmap builds or declares unstatable; the other is a supplier citation that DifferentialGeometry's open revision drops with no earlier owner.

**Repairs of the previous review's findings, finding by finding.**

- *R01 (`ProductCotangentTargets.lean`: native duplicates, one-lemma padding, no docstrings, names absent from the README).* Not repaired. The commit "one Suggested.lean (stray files folded in)" moved the file's 26 declarations verbatim into `Suggested.lean:358`–476 under a `section` and a `namespace` both named `ProductCotangentTargets`, with the old module docstring turned into a section comment (`:358`–364: "illustrative, nonexhaustive signatures … theorems marked sorry remain unimplemented proof targets"). No declaration gained a docstring, none of the 26 names occurs in `README.md` (grep count 0 for each), and the three native duplicates still close by one library lemma (R03 below).
- *R02 (no `sources.toml` in the folder).* Not repaired, and I withdraw it: a `sources.toml` inside the roadmap folder would itself be a `stray-files` gate hit ("sources are the README's references"); the manifest the brief names lives in the board package, which this review may not edit. The locators are verified below against the cache texts fetched from the README's two URLs, so nothing is owed here.
- *R03 (`:817` ConformalMapping L1 consumption; `:127` §1.2 pullback naturality).* Not repaired: `README.md` is byte-identical to the previous head (the diff touches only the two Lean files). R04 below re-raises it.

## R01 (P2) — The branch pins Tau Ceti `a91d3aaf`; at main's pin `2fd255d9` the library already owns Layer 0, the filled exhaustion and the form carriers the file calls missing

**Location:** `lake-manifest.json` (Tau Ceti `a91d3aafa8cd…`) against the content repository's `lake-manifest.json` on main (Tau Ceti `2fd255d997f4…`, of which `a91d3aaf` is an ancestor); `Suggested.lean:13`–18, `:28`–66, `:124`–130; `README.md:31`–37, `:162`–186, `:381`–435, `:708`–716, `:1809`–1832.

**Claim:** `barDerivative`, `zDerivative`, `cauchyGreen` and the three Layer-0 theorems are this roadmap's; the Runge exhaustion's topological part is Hyperfunctions' (`:31`–37); "DifferentialGeometry's generic `SmoothForm` and `mextDeriv` are missing" so the form-level closed completion and two-form exactness are not statable (`Suggested.lean:13`–15); `dx, dy, dz, dz̄` are built in 7.2.

**Witness (Tau Ceti at `2fd255d9`, the pin the roadmap is read with once merged):**

- `TauCeti/Analysis/Complex/Wirtinger/Basic.lean:66`, `:80`: `wirtingerDeriv`, `conjWirtingerDeriv` with `conjWirtingerDeriv g x v = 2⁻¹ • (fderiv ℝ g x v + I • fderiv ℝ g x (I • v))`, so `conjWirtingerDeriv f z 1` is `barDerivative f z` term for term; `Wirtinger/Holomorphic.lean:53` `differentiableAt_iff_conjWirtingerDeriv_apply_one_eq_zero` is 0.1's "∂̄u(z)=0 iff `DifferentiableAt ℂ`" under `DifferentiableAt ℝ`.
- `Analysis/Complex/Pompeiu/Basic.lean:162` (reconstruction `(2π)⁻¹ ∫ (w−z)⁻¹ • (∂ₓu + i∂ᵧu) = u w` for compactly supported C¹ `u`, which is `cauchyGreen_barDerivative_reconstruct` at C¹ rather than C^∞), `:261` `HasCompactSupport.conjWirtingerDeriv_integral_sub_inv_smul_apply_one` (`∂̄ ∫ (w−z)⁻¹ • f = π • f`, the kernel and sign of `cauchyGreen_barDerivative`), `:286` holomorphy off the support; `Wirtinger/Potential.lean:41` `exists_contDiff_conjWirtingerDeriv_apply_one_eq_of_hasCompactSupport` (a Cⁿ `∂̄`-primitive of a compactly supported Cⁿ source, n ≥ 1); `Pompeiu/Parameter.lean:75`–182 the parameter-dependent forms ComplexKahlerGeometry K2 wants.
- `Topology/FilledIn.lean:61` `IsFilledIn K Ω` is, symbol for symbol, the fourth clause of `IsRungeCompactPair` (`Suggested.lean:128`–130); `Analysis/Normed/Module/Exhaustion.lean:86` `IsOpen.exists_isFilledIn_compact_exhaustion` with the sets `closedBall 0 (n+1) \ thickening (n+1)⁻¹ Ωᶜ`, which are 2.2's `K_n` (`README.md:771`) and the filled exhaustion that 2.1 (`:708`–716) builds through the holomorphic hull and the Scope assigns to Hyperfunctions.
- `Geometry/Manifold/DifferentialForm/Basic.lean:41` `RoughForm`, `Smooth.lean:380`, `:479` `IsSmoothForm`, `SmoothForm`, `ExtDeriv.lean:140`, `:145` `mextDerivWithin`, `mextDeriv`, `Squared.lean:72` (d² = 0), `Wedge/Basic.lean:238` `wedgeWith`, `Wedge/Leibniz.lean:97`, `Opens.lean:72` (forms on open subsets, `extendByZero`), `Plane/Complex.lean:41`, `:46` `complexDz`, `complexDzBar` as `SmoothForm 𝓘(ℝ, ℂ) ℂ ℂ 1` with `mapCoeff_conj_complexDz`, `Dolbeault/Holomorphic.lean:113` (∂̄f = 0 iff holomorphic), `Analysis/Green/Cycle.lean:36` `Cycle.green_winding` (the winding-weighted Green for `TauCeti.Contour.Cycle`, 6.5's input), `Analysis/Green/DifferentialForm.lean:95` `green_ac_mextDeriv`. So at main's pin the module docstring's "not statable" claim is false, 7.2's `dz`, `dz̄` exist on the ambient plane, and the DifferentialGeometry contract's §§0.1, 0.3–0.4, 1.1, 1.3–1.4 and 5.6.3 are library declarations, not roadmap targets.

At the branch pin `a91d3aaf` none of these exists (checked: no `Pompeiu`, `Wirtinger`, `FilledIn`, `RoughForm` or `mextDeriv` in that checkout), which is why the gate's build passes. A roadmap is existing work on the library it merges into; stating what that library proves re-plans it.

**Exact repair:** Rebase the branch onto main's manifest. Then (i) delete `barDerivative`, `zDerivative`, `cauchyGreen` and the three Layer-0 theorems from `Suggested.lean`, write `conjWirtingerDeriv f z 1` and `wirtingerDeriv f z 1` in the remaining signatures (`cauchyPompeiu`, `exists_smooth_barDerivative_eq`, `exists_smooth_closed_completion`), and move 0.1 and 0.3 to `From Tau Ceti` by the names above, keeping as targets only what is not there (the C^∞ transfer of derivatives is `Potential.lean:41`; the uniform Riemann-sum lemma and the cutoff identity of Theorem 10.3 are still yours); (ii) define `IsRungeCompactPair Ω K` as `IsOpen Ω ∧ IsCompact K ∧ K ⊆ Ω ∧ TauCeti.IsFilledIn K Ω`, cite `IsOpen.exists_isFilledIn_compact_exhaustion` for the exhaustion of 2.1–2.2 and delete the Hyperfunctions sentence of the Scope; (iii) rewrite the module docstring and 7.2: the closed completion `d(g dz + f dz̄) = 0` and the exactness of a smooth two-form on `↥U` are statable on `SmoothForm 𝓘(ℝ, ℂ) ↥U ℂ 2` with `complexDz`/`complexDzBar` pulled back along `Opens.inclusion`, so state them (or say precisely which native carrier is still missing, by name); (iv) in `From TauCetiRoadmap.DifferentialGeometry` keep only what is not yet native. Re-run the one-tactic probe after the rebase: at `2fd255d9`, `cauchyGreen_barDerivative_reconstruct` is `Pompeiu/Basic.lean:162` up to `ContDiff ℝ ∞ → ContDiff ℝ 1`.

## R02 (P2) — The DifferentialGeometry §§6.1–6.2 supplier citation is dropped by that roadmap's open revision, and the content's new owner is later in the merge order

**Location:** `README.md:14`–15, `:129`, `:1878`–1879, `:1934`, `:1956`, `:1964` ("DifferentialGeometry §6.1's quotient", "§§6.1–6.2's real de Rham complex and quotient").

**Claim:** The real degree-two de Rham vanishing of 7.2/7.4 is a consequence drawn on DifferentialGeometry's `deRhamCohomology` quotient.

**Witness:** DifferentialGeometry on main has Layer 6 (`README.md:782`–806), but its open revision #886, by this pull request's author, ends its layer list at Layer 5.6 (`README.md:940`) and then jumps to Layer 12 (`:1204`): Layers 6–11 are gone, and its text says "DeRhamCohomologyAndDuality consumes this roadmap and owns de Rham cohomology" (`:1378`). DeRhamCohomologyAndDuality is merge-order line 395, after GlobalHolomorphicFunctions at 89, so it cannot be a supplier; and at its own head #1768 it still imports "6.1, 6.4: `deRhamComplex`, `deRhamCohomology`" from DifferentialGeometry (`README.md:167`), so no roadmap earlier than this one owns the quotient once #886 merges. Tau Ceti at `2fd255d9` has no `deRhamCohomology` either.

**Exact repair:** Keep the exactness statements of 7.2 (every smooth complex-valued and every smooth real-valued two-form on `↥U` is `dβ`), which are this roadmap's and need only the exterior derivative, and delete the quotient conclusion and every citation of DifferentialGeometry §§6.1–6.2 (`:14`–15, `:129`, `:1878`–1879, `:1934`–1938, `:1944`, `:1956`, `:1964`). Under `## Downstream consumers` say that DeRhamCohomologyAndDuality draws `H²_dR(U;ℝ) = 0` from 7.2's real exactness, as ComplexKahlerGeometry K5a draws the complex one.

## R03 (P3) — The folded-in block of `Suggested.lean` is still native duplicates, one-lemma padding, intermediate steps, undocumented and unnamed in the README

**Location:** `Suggested.lean:358`–476.

**Claim:** The block states acceptance targets of 1.4 and 6.2.

**Witness:** Elaborated on scratch copies at the pins: `majorant_exp` closes by `exact Real.prod_one_add_le_exp_sum s (fun i => norm_nonneg (u i))`; `regular` equals `Complex.integerComplement` by `ext z; simp [regular, Complex.integerComplement, eq_comm]` (`Mathlib/Analysis/Complex/IntegerCompl.lean:29`); with that equality `paired_summable` closes by `simpa [pairedTerm, cotTerm] using summable_cotTerm _` (`Cotangent.lean:211`), `improper_integral` by `simpa [integral_inv_one_add_sq] using Real.tendsto_arctan_atTop.mono_right nhdsWithin_le_nhds` (`Integrals/Basic.lean:349`), and `cotangent_identity` closes by `cot_series_rep' _` (`Cotangent.lean:222`) after `simp only [modelCot, pairedCot, pairedTerm, mul_div_assoc]` and unfolding `Complex.cot` (scratch elaboration exits 0). `finiteProduct` and `finiteMajorant` are `∏ i ∈ s, (1 + u i)` and `∏ i ∈ s, (1 + ‖u i‖)` renamed. The other fourteen theorems (`finite_shift`, `paired_periodic`, `entire_difference`, the strip bounds, `extension_*`, `riemann_error`, `imaginary_axis`, the vertical limits) are the steps of the 6.2 route, which the README itself files as examples that "do not define an additional theorem of the library" (`README.md:1403`, `:1465`–1466). No declaration of the block has a docstring; the section comment (`:358`–364) is process prose ("illustrative, nonexhaustive", "remain unimplemented proof targets", "README.md is the definitive specification"); the block sits after Layer 7 although its content is 1.4 and 6.2; none of its 26 names occurs in the README, which the file–README agreement rule requires.

Re-raised: R01 of the previous review (R02 and R04/R07 of the two before it).

**Exact repair:** Keep one theorem under `/-! ## Layer 1 -/`, with a docstring, stated on the products directly:

```lean
theorem norm_prod_one_add_sub_one_le_prod_one_add_norm_sub_one {ι : Type*} (s : Finset ι)
    (u : ι → ℂ) : ‖∏ i ∈ s, (1 + u i) - 1‖ ≤ ∏ i ∈ s, (1 + ‖u i‖) - 1 := by
  sorry
```

name it in 1.4 (`README.md:603`), and delete everything else of the block, including the section comment and the two wrapper definitions.

## R04 (P3) — A consumer claim and a supplier item the cited roadmaps do not support

**Location:** `README.md:817`; `README.md:127`.

**Claim and witness:** `:817` "ConformalMapping L1 consumes this topology for its compactness criterion": ConformalMapping on main (`Completed/ConformalMapping/README.md:97`, `:111`–113) states Montel on `TendstoLocallyUniformlyOn` and families `ℂ → ℂ`, and its open head #998 says "consumes nothing from it" (`README.md:86`–87). `:127` lists "§1.2's pullback naturality" in the DifferentialGeometry contract while no `*Needs:*` line of the README names §1.2 (7.2's is `:1878`–1879: §§0.1, 0.3–0.4, 1.1, 1.3–1.4).

Re-raised: R03 of the previous review.

**Exact repair:** Replace `:817` by "ConformalMapping's compactness criterion is stated on ambient families and does not consume this space"; drop "§1.2's pullback naturality" from `:127` (after R01 this contract shrinks anyway).

## Verified sound

**Gate and build.** The worker's gate at `241053b` passes every check (set_option, blobs, LaTeX, pull-request numbers, sorry'd data, residue words, imports, stray files, outside-folder, build). `git diff --stat origin/main...HEAD` outside the folder is empty. `lake env lean` on `TauCetiRoadmap/GlobalHolomorphicFunctions/Suggested.lean` (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`) exits 0 with exactly **41 `declaration uses sorry` warnings and no other output** (23 of the main file, 18 of the folded block). A scratch copy with `#check @name` for all 61 declarations elaborated once; each printed type was compared with its README statement: no standing binder disappeared (`Countable ι`, `Countable S`, `IsOpen`, the compactness, `ContDiffOn ℝ ∞`/`ContDiffOn ℝ 1`, nonvanishing and `≠ ⊤` clauses, the Runge-pair hypothesis and `cauchyPompeiu`'s trace and index hypotheses are all present; the block's declarations have no section variables). The one-tactic probe closed 0 of the 23 main-file admissions (`rfl`, `simp`, `norm_num`, `infer_instance`) and the four block admissions of R03 by the named library lemmas.

**Dependency check.** The command of the brief returned exactly:

```text
depcheck: 243 roadmaps, 2457 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Merge order: ComplexComparisonPartII 43, ZerosOfLFunctions 85, GlobalHolomorphicFunctions 89, AnalyticNumberTheoryPartI 90, AutomorphicSpectralTheoryPartII 302, DeRhamCohomologyAndDuality 395; DifferentialGeometry, ComplexKahlerGeometry, Hyperfunctions, RealAnalyticGeometry and ZerosOfLFunctions are on main under `TauCetiRoadmap/`, ConformalMapping under `Completed/`.

**Citations resolved, at the copy named, this round.** DifferentialGeometry on main (`3b3f7ef`): 0.1 (`README.md:272`–281, `wedgeWith_flip`, `wedgeWith_apply_one_one`), 0.3–0.4 (`:283`–309, `RoughForm.wedgeWith`), 1.1 (`:315`–319, `mextDeriv_ofFunction`), 1.2 (`:320`–321), 1.3 (`:322`–324, `mextDeriv_mextDeriv`, `isSmoothForm_mextDeriv`), 1.4 (`:325`–326, `mextDeriv_wedgeWith`), 5.6.3 (`:708`), 6.1–6.2 (`:786`–795); at its open head #886: 5.6.3 kept (`:1105`), Layers 6–11 dropped (R02). ZerosOfLFunctions on main: 5.2 `E₁ z = (1 − z) exp z` with `deriv E₁ z = −z exp z` (`README.md:938`–955), 5.3 canonical product under `OrderLE f 1` with divisor `divisor f univ` (`:957`–969), 5.4 entire logarithm (`:979`–987), 5.5 Hadamard (`:989`–1001); the README's E₁′(1) = −e Check agrees with 5.2's. ConformalMapping on main: L5 Jordan separation and `TauCeti.filledHull` (`Completed/ConformalMapping/README.md:136`–150). Hyperfunctions on main cites GH0 (`README.md:29`) and HF2.AnalyticPreparation (`:190`); ComplexKahlerGeometry on main consumes GH5.1's complex exactness (`:35`), GH0's operator and finite-rank Runge (`:198`–200) and GH2's Laurent construction (`:345`). Consumers at open heads citing this roadmap by section: AnalyticNumberTheoryPartI #1126 (`:88`, `:508`, `:522`, "Preparatory primary factors and locally uniform products"), AutomorphicSpectralTheoryPartII #1761 (`:15`, `:157`), ComplexKahlerGeometry #1234/#1398, RelativisticQuantumFieldTheory #1772 (GH2); the heading `README.md:447` still carries the cited title, and this pull request drops no id.

**Ownership by object.** Through the roadmap grep over main and the 476 open pull requests: Looman–Menchoff (0 hits elsewhere), the holomorphic hull (RealAnalyticGeometry uses the Stein-theoretic hull on a different carrier, `:697`, `:948`), Cousin I (RealAnalyticGeometry `:872` owns a Stein splitting), the Cauchy–Pompeiu formula (PseudoholomorphicCurveAnalysis on main, `:537`, defines the same `T f = π⁻¹ ∫ (w−z)⁻¹ f` and cites "Tau Ceti's Cauchy–Pompeiu files at `333c9e49`", the native work of R01, not a second roadmap owner), `cot_series_rep` (ZerosOfLFunctions cites it as the genus-0 model). AutomorphicSpectralTheoryPartII declares its own `elementaryFactor` under its namespace while citing this roadmap: a consumer restatement, not a second owner. Ownership against open pull requests whose files the brief did not give me was checked through the grep tool only.

**Sources.** Rainer: the README's Tuwien URL and the cached Univie copy are the same PDF (sha256 `c86be0dc…`, fetched through the sources service into a scratch manifest, not the roadmap's); printed page = PDF page − 6. Each cited line opens on the cited statement: 1189 (§10 head, p. 23), 1216 (Prop. 10.1, p. 23, with `dζ∧dζ̄` form), 1237 (polar kernel integrability), 1253 (`dξdη = −(2i)⁻¹ dζ∧dζ̄`), 1255 (Thm 10.2, p. 23), 1295 (Thm 10.3, p. 24), 1313 and 1329 ((11.1)–(11.2), Exercises 19–20, p. 25), 1333 (O(K)), 1338 (Thm 11.1 with its three equivalent conditions), 1437 (Lemma 11.3, five items as the README splits them, pp. 27–28), 1550 (Thm 11.7, p. 29), 1603 (Thm 12.1, p. 31, essential singularities allowed), 1630 (Thm 12.2, p. 31), 1658 and 1689 (Prop. 12.3, Thm 12.4, p. 32, with the cocycle convention `f_ik = f_ij + f_jk`), 1843 (monomial comparison in the proof of Prop. 14.2, p. 35), 1868 (Thm 14.3, pp. 35–36), 1950 (Prop. 15.2, p. 36–37), 1997 (Thm 15.3, p. 37), 2030 and 2050 (Remark 15.4, p. 38, `E_p` and the entire factorization), 2086 (Thm 15.5, p. 39, for a region), 2116 (Thm 15.6, p. 39). Gray–Morris (cache `2dbcc98e…`, author copy, printed page = PDF page + 245): line 66 is Theorem 3 with hypotheses (i)–(iii) as the Lean statement has (p. 247); 310 the Appendix (p. 252); 315–325 Lemma 1 with the constant `5N·m(R−E)`; 338–394 the proof with `E_n`, Baire, `|A(R)| ≤ 20N m(R−E)` (line 371) and the density step (pp. 253–254).

**Pinned declarations opened** (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`): `Complex.integerComplement` (`IntegerCompl.lean:29`), `cotTerm`, `summable_cotTerm`, `cot_series_rep'`, `cot_series_rep` (`Cotangent.lean:173`, `:211`, `:222`, `:229`), `Real.prod_one_add_le_exp_sum` (`Complex/Exponential.lean:682`), `Finset.norm_prod_one_add_sub_one_le` (`Log/Summable.lean:142`), `integral_inv_one_add_sq` (`Integrals/Basic.lean:349`), `HasLineDerivAt` (`LineDeriv/Basic.lean:80`), `Function.locallyFinsuppWithin` (`Topology/LocallyFinsupp.lean`), `MeromorphicOn.divisor` (`Meromorphic/Divisor.lean:40`), `IsOpen.locallyCompactSpace` (`LocallyCompact.lean:224`), `ContMDiffMap` (`ContMDiffMap.lean:38`); Tau Ceti `Cycle` (`Contour/Cycle/Basic.lean:183`), `trace` (`:189`), `IsIn` (`:252`), `integral` (`:303`), `windingNumber` (`:336`), `IsNullHomologous` (`:357`), `homologyCauchyTheorem` (`HomologyCauchy.lean:234`), the three `Primitive.lean` theorems (`:180`, `:253`, `:283`), `TauCeti.morera` (`Analysis/Complex/Conformal/Morera.lean:41`, not `Analysis/Conformal/Morera.lean`), `filledHull` (`Topology/FilledHull.lean:83`). At `a91d3aaf` there is no `RoughForm`, `mextDeriv`, `IsFilledIn`, `Pompeiu` or `Wirtinger` file; the declarations of R01 were opened at `2fd255d9` with the file and line given there.

**README shape and policy.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 0–7 with `### k.n` prose, `*Needs:*` lines, `**Checks.**` lists (at least three per definition), `### Examples` and `### Dependencies`, Downstream consumers, References; no LaTeX delimiters, process words, pull-request numbers or machine paths in the README (the gate agrees). Every backticked name of the roadmap's own in the README is declared in `Suggested.lean` (gate `readme-ids-missing=0`); the converse fails for the block of R03.

**Headline theorems.** From the README: Looman–Menchoff (0.2), Cauchy–Green and reconstruction (0.3), the exact primary product and its genus-one forms (1.1–1.2), Runge equivalence, hull equality, finite-rank operator, completeness (2.2, 2.5), zero-free approximation, divisor realization, boundary noncontinuation (3.1–3.2), Mittag–Leffler, isolated singularities, the quotient theorem (4.1), equal-divisor and full Weierstrass factorization (5.1), Cauchy–Pompeiu (6.5), global ∂̄, closed completion and Cousin I (7.1, 7.4). All are stated in `Suggested.lean`; the form-level statements are named as not statable in the docstring, which is true at the branch pin and false at main's (R01).

**Adversarial pass.** One row per statement; S = `Suggested.lean`, R = README.

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| S `barDerivative`, `zDerivative`; native `conjWirtingerDeriv` | u = z, z̄, \|z\|² at z = i | (∂z,∂̄) = (1,0), (0,1), (z̄,z) = (−i,i); native formula at v = 1 is `(fderiv 1 + I•fderiv I)/2`, the same expression | Pass (and native, R01) |
| S Looman–Menchoff | f = z; f = z̄; Looman's exp(−z⁻⁴) extended by 0; Ω = ∅ | f = z: fx = 1, fy = i = i·fx; f = z̄: fy = −i ≠ i; Looman's example: at z = 0.3·e^{iπ/4}, \|f\| ≈ 4.1·10⁵³, discontinuous at 0, excluded by `ContinuousOn`; ∅ vacuous | Pass |
| S `cauchyGreen` kernel and sign | φ = ∂̄ψ, ψ = h(\|z\|²), h(0) = 1 | T(∂̄ψ)(0) = −(1/π)∫h′(r²)dA = −2∫₀^∞h′(r²)r dr = h(0) = 1 = ψ(0); native `∂̄ ∫(w−z)⁻¹•f = π•f` has the same kernel | Pass (native, R01) |
| S `elementaryFactor` | p = 0,1,2 at w = 0, 1, −1 | E_p(0) = 1, E_p(1) = 0; \|E_p(−1)\| = 2, 0.7358, 1.2131 | Pass |
| R 1.1 sharp deviation | p = 0,1,2 on \|w\| = 1 (629 sample points) | max(\|1−E_p(w)\| − 1) = 0.000000 for each p; p = 1, w = −1: 1 − 2/e ≈ 0.2642 ≤ 1 | Pass |
| R 1.2 E₁′(1) | w = 1 | numeric derivative −2.71828 = −e; ZerosOfLFunctions 5.2 `deriv E₁ z = −z exp z` gives −e | Pass |
| S `exists_entire_primary_product_exact` | ι = ∅; ι = Fin 2, a = (1,1), p = 0 | F = 1, orders 0 = card ∅; F = (1−z)², order 2 = card fibre; cofinite on a finite type is ⊥, escape vacuous | Pass |
| S `exists_entire_genusOne_product` | S = ∅; S = {1}, m = 2; S = {2}, m = 0 | 1; (1−z)²e^{2z} with order and divisor 2 at 1; factor 1, order 0 while `if hz` returns 0 | Pass |
| S `..._of_divisor` | D = 0; D = 2[1] | product 1, divisor 0; Σ D/‖ρ‖² = 2, divisor 2[1] | Pass |
| R 1.3 genus and tail | a_n = n; a_n = 2ⁿ, N = 2, R = 1 | Σ1/n diverges, Σ1/n² converges: genus 1; tail R·2^{1−N} = 0.5 | Pass |
| R 1.4 / S `sharp_finite` | u = (1,1); (1,−1); (−1,0); ∅ | 3 ≤ 3; 1 ≤ 3; 1 ≤ 1; 0 ≤ 0; exponential comparison 4 ≤ e² ≈ 7.389 | Pass |
| S `majorant_exp` | u = (1,1) | 4 ≤ e²; closes by `Real.prod_one_add_le_exp_sum` | Padding (R03) |
| R 1.5 uniform tail | u_n(x) = 1/(n+1) at x = n | tail 1/(N+1) → 0; Σ sup = harmonic, diverges; u₀ = −1: product 0, order ⊤ | Pass |
| S `IsRungeCompactPair`; native `IsFilledIn` | (∅,∅); unit circle in ℂ; annulus 2 ≤ \|z\| ≤ 3 in D₄ and in 1 < \|z\| < 4 | true; false (open disk relatively compact); false; true (inner component's closure meets \|z\| = 1 ∉ Ω); the fourth clause is `IsFilledIn K Ω` verbatim | Pass (native, R01) |
| S `holomorphicHull` | K = ∅; circle in ℂ; annulus in 1 < \|z\| < 4 | B = −1, f = 0 excludes all: ∅; closed disk (maximum principle); 1/z bounds \|z\| ≥ 2: hull = K | Pass |
| R 2.1 distance equality | K unit circle in D₃, z = 2 | both infima 2; \|e^{2}\| = e² > e = sup_K\|e^z\| excludes 2 from the hull | Pass |
| R 2.2 K_n and metric | Ω = ∅, ℂ; constants differing by 1; 1/(n+1) | infEDist z ∅ᶜ = 0 so K_n = ∅; Ωᶜ = ∅ gives ∞; Σ2^{−n}/2 = 0.5; (1/(n+1))/(1+1/(n+1)) = 1/(n+2); native exhaustion sets `closedBall 0 (n+1) \ thickening (n+1)⁻¹ Ωᶜ` are these K_n | Pass (native, R01) |
| S `complete_holomorphicMapSpace` | f_j = z + 1/j; a sequence tending to z̄ | limit z holomorphic, error 1/j; a locally uniform limit z̄ would have ∂̄ = 1 ≠ 0, so the range is closed | Pass |
| R 2.3 O(K) | εz̄; Σzⁿ/(n+1)² | ∂̄ = ε ≠ 0; derivative coefficients n/(n+1)² sum to ∞ at 1 | Pass |
| R 2.4 contour estimate | unit circle, f − g = 1; reversed | 0 ≤ 2π; ∮dz/z = 2πi becomes −2πi, length 2π | Pass |
| S `isRungeCompactPair_iff_approximation` | annulus in D₄, f = 1/z | (z−a)g_n → 1 uniformly on K ⊇ ∂C hence on the hole, but 0 at a: contradiction; (∅,∅) both sides true | Pass |
| S `holomorphicHull_eq_fill` | component C with compact closure in Ω | C ⊆ hull(K̂) = K̂ with C ∩ K̂ = ∅ forces C = ∅; reverse inclusion by Thm 11.1(3) on K̃ | Pass |
| R 2.5 pole push, jets, finite rank | dist > 2δ, \|a−b\| < δ; f = z², marked 0, order 1; K = ∅ | ratio < 1/2; P = 0, Q = z², quotient 1; L = ∅, N = 0 | Pass |
| S `exists_finite_rank_runge_operator` | K = {0}, U = Ω = ℂ, f = c | N = 1, ζ = 0, w = 1, g = 1: error 0 ≤ εB | Pass |
| S `exists_zero_free_holomorphic_approximation` | annulus, u = z | g = z, winding 1; exponentials have winding 0 | Pass |
| R 3.1 direct construction | w_a = (b_a−a)/(z−b_a); B_p | 1 + w_a = (z−a)/(z−b_a); B_p(w) = E_p(−w); divisor 2[0]−[1] by z²/(z−1) | Pass |
| S `exists_holomorphic_with_zero_orders`, `exists_meromorphic_with_divisor` | m = 0; m = 2 at 2; ν = −[0]; f = 0 | 1; (z−2)²; 1/z; order ⊤ excluded | Pass |
| S `exists_holomorphic_no_meromorphic_boundary_germ` | Ω = ∅, ℂ; ℂ∖{0} at ξ = 0; ℂ∖ℝ at 0 | vacuous; zeros 1/n accumulate, F·zⁿ analytic vanishing on them is 0, contradiction off E; both half-disk components receive shell disks | Pass |
| R 3.2 shells | compact in K_N; x_j → ξ | shells n ≥ N+2 avoid K_N; radii < 1/n_j → 0 | Pass |
| R 3.3 connected V | Ω disk ⊔ disjoint disk | extension by 0 holomorphic: hypothesis necessary | Pass |
| S Mittag–Leffler, isolated singularities | E = ∅; E = {0}, P = 1/z² + z; P = exp(1/z) | f = 0; f = 1/z², f − P = −z; exp(1/z) admitted only by the general theorem | Pass |
| S `exists_holomorphic_quotient` | F = 1/z; F ≡ 0 on a component; Ω = ∅ | f = 1, g = z; f = 0, g = 1; codiscrete filter on ∅ is ⊥ | Pass |
| S `exists_entire_exp_mul_of_divisor_eq` | f = 2z², F = z²; f = 0, F = 1 | g = log 2; both divisors 0 but f has no nonzero value, excluded by `hf_ne` | Pass |
| S `entire_weierstrass_factorization` | f = z; (z−1)²; e^z | m = 1, P = 1, g = 0; m = 0, p = 0, P = (1−z)², g = 0; m = 0, P = 1, g = z | Pass |
| R 6.1 cosine, Gamma, shift | z = 0, 1/2; α = 1/2 | cos product 1 at 0, zero factor at 1/2; 1/Γ(0) = 0; sin(π/2) = 1, π cot(π/2) = 0 | Pass |
| R 6.2 / S strip bounds | z = i | \|q(i)\| = 3.15334 = π coth π ≤ 4 + 3π/2 = 8.7124; term n = 1: 1 ≤ 12/5 = 2.4; Σ y/((n−½)²+y²) at y = 1: 1.5649 ≤ 1 + π/2 = 2.5708; \|c(i)\| = 3.15335 = π(1+e^{−2π})/(1−e^{−2π}) | Pass |
| S `finite_shift`, `paired_periodic` | N = 0, z = 1/2 | (3/2)⁻¹ − (1/2)⁻¹ = −4/3 both sides; general: reindex k ↦ k−1 | Pass |
| S `riemann_error`, `imaginary_axis`, vertical limits | y = 1; y → ∞ | S₁ = 1.076669 = (π coth π − 1)/2; π/2 − S₁ = 0.494127 ∈ [0, 1]; q(iy) = −i(1/y + 2S_y) termwise; q(iy), c(iy) → −πi | Pass |
| S `paired_summable`, `cotangent_identity`, `regular` | z = 1/2 | telescoping absolute sum 2; `regular = Complex.integerComplement` by `ext; simp`; both close from `summable_cotTerm`, `cot_series_rep'` | Native (R03) |
| S `improper_integral` | R → ∞ | ∫₀^R = arctan R → π/2 by `integral_inv_one_add_sq`, `Real.tendsto_arctan_atTop` | Native (R03) |
| R 6.3 theta, shells, ratio | r = 1/2, z = 0; N = 1, 2; a_n = 2/n², b_n = 1/n² | H(2 log r)/H(0) = 2.000 = r⁻¹e⁰; shell N = 1: four cubes sum 4 ≤ 8√2 = 11.31, N = 2 has 8 points; m² = 2n² has no solution | Pass |
| R 6.4 crescent | z = −1/2; −t; −1+t | \|z\| = 1/2 < 1, \|2z−1\| = 2 > 1; \|1/z\| = 1/t → ∞; \|1/(z+1)\| = 1/t → ∞ | Pass |
| S `cauchyPompeiu` sign | unit disk, ξ = 0, f = \|z\|², 1, z̄ | 1 − π⁻¹·π = 0 = f(0); 1 − 0 = 1; 0 − 0 = 0 | Pass |
| S `cauchyPompeiu` index | annulus 1 < \|z\| < 2 | index 0 at 0, 1 at 3/2, 0 at 3 | Pass |
| R 6.5 moments, Euler product | (m,n) = (0,0), (1,1); e^z − 1 | π, π/2 = π/(m+1); e^z − 1 = z e^{z/2} ∏(1 + z²/(4π²n²)) | Pass |
| R 6.6 residues | z = 0; double zero; α = 1/2 | 1/z residue 1; residue 2; poles at ℤ + 1/2 only | Pass |
| S `exists_smooth_barDerivative_eq`, closed completion | f = z̄, z, z e^{−\|z\|²}; g = z̄ with f = 0 | z̄²/2, \|z\|², −e^{−\|z\|²} (e⁻¹ at 1); ∂z z̄ = 0 but dz̄ ≠ 0 | Pass |
| R 7.2 coordinate forms | (e_z 1, e_z i) | dz∧dz̄ = 1·(−i) − i·1 = −2i, dx∧dy = 1; η = dz∧dz̄: u = z̄, d(−z̄ dz) = dz∧dz̄; η = dx∧dy: u = z̄/2, β = (x dy − y dx)/2, dβ = dx∧dy; native `complexDz`, `complexDzBar` take v ↦ v, v ↦ v̄ | Pass (native, R01) |
| R 7.3 worked examples | z = 1, i, 2 | d(iz²)(1;1) = 2i, (i;1) = −2; d(i\|z\|²)(i;1) = 0; d(\|z\|⁴)(2;1) = 32; log-square: log 2 both sides | Pass |
| S `additive_cousin_I` | two sets c₁₂ = 1; one set; k = i | b = (1,0); 3c₁₁ = 0; c_ji = −c_ij, so the cyclic cocycle is Rainer's `f_ik = f_ij + f_jk` | Pass |
| R 0.2 Check z̄ on the unit square | counterclockwise edges | 1/2 + (1/2 + i) + (−1/2 + i) + (−1/2) = 2i = i·1 − (−i) | Pass |
| R 0.2 square-to-ball | r = 1 | 4 against 2π = 6.283; ratio π/2 | Pass |
| R Conventions | annulus 1 < \|z\| < 2 | index 1 − 1 = 0 at 0; area 4π − π = 3π | Pass |

**53 rows**, each with computed values; the seeded sample (0.1, 0.2, 0.3, 1.2, 1.3, 1.5, 2.4, 2.5, 3.1, 3.2, 3.3, 6.3, 6.6, 7.2, 7.4), every headline and every target a finding touches are covered.

**Notes that are not findings.** `hEscape` in `exists_entire_primary_product_exact` follows from `hsum`; `[Countable S]` in `exists_entire_genusOne_product` follows from compact finiteness in σ-compact ℂ. The previous review's R02 (a folder `sources.toml`) is withdrawn as explained above.

## Not verifiable

- Ownership against open pull requests whose files the brief did not provide was checked through the roadmap grep tool only.
- Gray–Morris Lemma 1's own proof is delegated by the paper to Saks; the README's balanced-rectangle proof was checked as written, not against Saks.

## Source issues

- none
