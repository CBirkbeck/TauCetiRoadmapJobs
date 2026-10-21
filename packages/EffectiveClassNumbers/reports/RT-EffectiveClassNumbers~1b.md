<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/133#issuecomment-6313435582 -->
Red team round 1 pass b (claude) of cdb320a

Verdict: needs_changes

1. **F01** (P1) Supplier RankZeroOneBSD does not exist

   Location: `packages/EffectiveClassNumbers/README.md:30`, `:125-127` ("From TauCetiRoadmap.RankZeroOneBSD, Layer 0"), and the *Needs:* lines of §§2.3, 2.6, 2.8, 2.11, 2.12, 2.13, 3.1, 3.2, 3.3 (lines 471, 563, 604, 616, 628, 662, 677, 689), Dependencies lines 642, 756, References line 1017.

   Claim: RankZeroOneBSD Layer 0 supplies the analytic rank, root-number parity, the local factors, conductor and coefficients of a quadratic twist, and the root number of a twist (§§0.2, 0.5, 0.6, 0.7, 0.10).

   Witness: no folder `TauCetiRoadmap/RankZeroOneBSD` on main, no line in `merge-order/ORDER.txt`, no open pull request adding it (the board's registry of other open pull requests lists 310 heads; only design packets named `RankZeroOneBSDPartII` exist elsewhere, no base roadmap). The relative link `../RankZeroOneBSD/README.md` resolves to nothing.

   Repair: remove every citation of RankZeroOneBSD. State the consumed facts as targets of this roadmap, since no earlier roadmap owns them: in §2.3 add `analyticRank_parity` (for E/ℚ with entire L and Λ(E,2−s) = w_E Λ(E,s) from EllipticCurveModularity R29.6, `analyticOrderNatAt (L) 1` is even iff w_E = 1, and `analyticOrderAt L 1 ≠ ⊤`), `twist_LFunction_coeff` (for a quadratic twist by ℚ(√D) with D prime to N_E, `WeierstrassCurve.LFunction` of the twist at n equals χ_D(n)·a_n(E); the twist curve itself is EllipticCurves Layer 5 `quadraticTwistOf`), `twist_conductor` (conductor N_E·D² via EllipticCurves Layer 4 and EllipticCurveModularity R29.4 applied to the twist curve) and `twist_rootNumber` (w(E^D) = χ_D(−N_E)·w_E, from the functional equations of E and E^D). Add Lean signatures for the first three, which are statable on `WeierstrassCurve ℚ`, `quadraticTwistOf` and `LFunction`; §§2.8, 2.12, 2.13, 3.2 then cite these names.

2. **F02** (P1) Supplier GrossZagierAndArithmeticHeights does not exist, and the Heegner hypothesis is misstated

   Location: `packages/EffectiveClassNumbers/README.md:31`, `:55` ("GrossZagierAndArithmeticHeights §0.1"), `:129-131`, §2.8 (lines 561, 563, 565), §2.10 (589, 591), §2.11 (602, 604), §3.4 (702, 704), Dependencies 642, 756, References 1017.

   Claim: the height dictionary (§0.1), the Petersson norm and parametrisation degree (§8.4), the Gross–Zagier formula on X₀(N) (§8.15) and its elliptic-curve form (§8.19) are supplied by that roadmap; its Heegner hypothesis is "K imaginary quadratic in which no prime dividing N is inert" (line 131).

   Witness: no folder on main, no line in `merge-order/ORDER.txt`, no open pull request adding it. On the hypothesis: GZ86 line 159 ("discriminant D is relatively prime to N") and line 170 ("we shall assume throughout that D is odd"); "not inert" admits ramified primes, which GZ86 excludes.

   Repair: remove the citations. Add a subsection "2.0 Gross–Zagier inputs" stating, with GZ86's exact standing hypotheses (D a fundamental discriminant, D odd, D prime to N, every prime dividing N split in K), the two formulas this roadmap uses as named targets `grossZagier_heegnerTrace` (GZ86 I (6.3), p. 230: L′(f,K,1) equals an explicit positive constant times the height of the f-isotypic part of the Heegner trace) and `grossZagier_ellipticCurve` (GZ86 I (7.3)–(7.4), p. 231), plus the Galois action on the points x_a that §2.10 uses; record them as the heaviest obligations of Layer 2 with no Lean signature (Heegner points are not formalised at the pins). Replace "no prime dividing N is inert" by "D odd, prime to N, and every prime dividing N splits in K" wherever the hypothesis is quoted (lines 131, 563, 565, 594), and note that D = −7 and D = −139 satisfy it. Replace "§0.1" of line 55 by this roadmap's own Conventions, and §8.4 of line 704 by a target `peterssonNorm_sym2` of §3.4 (O85 (2.3.3), p. 313, with the Petersson norm defined on the modular-form carrier of ModularForms) or cut the Petersson route and bound c₁ directly from L(Sym² f, 2) by the convergent product of §3.1.

3. **F03** (P1) GlobalNumberFields Layer 10 does not contain the quadratic character χ_D

   Location: `packages/EffectiveClassNumbers/README.md:23`, `:93-95`, §0.5 line 219 and 221, §0.6 line 241, §5.2 line 910, §5.3 line 921, §5.4 line 936, §5.5 line 946 and 948, Dependencies 276, 1000.

   Claim: "The primitive quadratic character χ_d of ℚ(√d) … with χ_d(n) the Kronecker symbol (D(d)/n) including its value at 2, and its primitivity and parity" is GlobalNumberFields Layer 10; §0.6 also takes ζ_K = ζ·L(s,χ_D) from it.

   Witness: GlobalNumberFields on main, Layer 10 (README lines 525-563) is "archimedean characters, infinity types, and cyclotomic arithmetic": characters of ℝˣ and ℂˣ, `AlgebraicInfinityType`, `normCharacter`, ray class groups of ℚ(ζ_n). No Kronecker symbol, no χ_d, no ζ_K factorization. The object exists elsewhere: Tau Ceti at the pin has `TauCeti.Multiquadratic.fundamentalDiscriminantChar D hD : DirichletCharacter ℤ D.natAbs` (`NumberTheory/Multiquadratic/FundamentalDiscriminant/Character.lean`, value `legendreSym q D` at odd primes, `fundamentalDiscriminantChar_neg_one`), and ImaginaryQuadraticClassNumber H2.1 on main owns "χ_D(p) = 0, 1, −1 according as p ramifies, splits or is inert, including 2", H2.2 owns ζ_K(s) = ζ(s)L(s,χ_D).

   Repair: replace every "GlobalNumberFields Layer 10" by "Tau Ceti `TauCeti.Multiquadratic.fundamentalDiscriminantChar` (the character) and ImaginaryQuadraticClassNumber H2.1 (its splitting values, primitivity and parity), H2.2 (ζ_K = ζ·L(s,χ_D))"; delete the GlobalNumberFields subsection of the supplier contracts and the Layer 0/5 dependency lines on it; in §5.3 and §5.5 the Lean hypotheses on χ (values at odd primes by `legendreSym`, at 2 by `ZMod.χ₈`) should be matched by a README sentence that these are the values of `fundamentalDiscriminantChar (−k)`.

4. **F04** (P1) ImaginaryQuadraticClassNumber (on main) owns §0.1, §0.2 and the analytic inputs and is never cited

   Location: `packages/EffectiveClassNumbers/README.md:153` (`exists_squarefree_radicand`), `:177` (`classNumber_eq_card_reducedForms`), `:241` (ζ_K = ζ·L), `:114-115` and `:870` (Siegel and the class-number value), `:9-41` (no mention of the roadmap).

   Claim: these are targets of this roadmap, with the analytic statements supplied by AnalyticNumberTheoryPartI.

   Witness: `TauCetiRoadmap/ImaginaryQuadraticClassNumber/README.md` on main: H1.1 "every degree-two number field with no real embedding has a negative squarefree radicand" (its `Suggested.lean` line 44, `exists_negative_squarefree_presentation`, with `minpoly ℤ θ = X² − C d` and `Algebra.adjoin ℚ {θ} = ⊤`, under `[NumberField.IsTotallyComplex K]`); H1.3 "At f = 1 identify this Picard group with native ClassGroup(O_K)" and "its cardinality as the unweighted class number" from the reduced representative list; H2.2 "ζ_K(s) = ζ(s)L(s,χ_D) on Re(s) > 1" and "h(D) = w_D √|D| L(1,χ_D)/(2π)"; H2.4 "h(D) ≥ C_ε|D|^(1/2−ε) for every negative fundamental D" (`imaginary_classNumber_lower_bound`, line 63).

   Repair: add an "From TauCetiRoadmap.ImaginaryQuadraticClassNumber" subsection to the supplier contracts citing H1.1, H1.3, H2.1, H2.2, H2.4 and the four Lean names. In §0.1 delete `exists_squarefree_radicand` and keep only the bridge `isTotallyComplex_of_discr_neg` (a degree-two number field with `NumberField.discr K < 0` is `IsTotallyComplex`, and conversely), through which H1.1 is applied; keep `discr_eq_fundamentalDiscriminant_radicand`, `isFundamentalDiscriminant_discr`, the genus statement and `discr_of_card_primeFactors_eq_one` (not in H1). In §0.2 replace `classNumber_eq_card_reducedForms` by a citation of H1.3 together with Tau Ceti `orbit_mk_reducedForms_bijective`, keeping `reducedForms_primitive` and `reducedForm_four_mul_c_sq_ge`. In §0.6 cite H2.2 for ζ_K = ζ·L(s,χ_D). In §4.9 and in the supplier table cite H2.4 for Siegel's class-number bound and H2.2 for L(1,χ_D) = πh/(u√d) (see R05). Record the convention difference once: this roadmap spells "imaginary quadratic" as `Module.finrank ℚ K = 2 ∧ NumberField.discr K < 0`, ImaginaryQuadraticClassNumber as `[IsTotallyComplex K]`; the bridge lemma carries the transport.

5. **F05** (P1) AnalyticNumberTheoryPartI §2.15 and §2.18 are cited for statements they do not make

   Location: `packages/EffectiveClassNumbers/README.md:27`, `:114-115`, `:870`, `:873`, `:884`.

   Claim: §2.15 is "h(D) ≥ c_ε|D|^(1/2−ε) for negative fundamental D"; §2.18 is "L(1,χ_D) = πh/(u√d) with u half the number of roots of unity".

   Witness: AnalyticNumberTheoryPartI at its head (README of pull request 1018's sibling, head `23d3de1c`): `<a id="s2-15">` is "2.15 Explicit residue bound for Dedekind zeta functions (Louboutin)", κ_K ≤ (e log D_K/(2(d−1)))^(d−1), an upper bound; `<a id="s2-18">` is "2.18 Norm-regrouped Artin coefficient comparison", `artin_euler_series_eq`. Neither mentions h(D) or L(1,χ_D). (§0.9, Siegel's L(1,χ_D) ≥ c(ε)|D|^(−ε), and §0.33, the 1/ζ logarithmic bound, are cited correctly.)

   Repair: replace both citations by ImaginaryQuadraticClassNumber H2.4 (`imaginary_classNumber_lower_bound`) and H2.2 (the class-number formula, from which L(1,χ_D) = πh/(u√d) is the u = w/2 rewriting), as in R04; keep §0.9 and §0.33 of AnalyticNumberTheoryPartI.

6. **F06** (P1) AutomorphicLFunctionsAndLocalFactors: `rs-vertical-strip-bounds` does not exist, the self-pair is excluded from the strip bounds, and one anchor is in AL.5

   Location: `packages/EffectiveClassNumbers/README.md:28`, `:117-119`, §3.1 lines 654 and 664, §3.3 line 689, Dependencies 756.

   Claim: AL.3 supplies "boundedness on vertical strips away from the poles ([`rs-vertical-strip-bounds`])" for Λ(s, π × π′∨), used in `liouvilleProduct_C4` with π = π′ = π_f; and `local-conductor-test-vector-comparison` is in AL.3.

   Witness: the supplier README has no anchor `rs-vertical-strip-bounds` (anchors present: `rs-global-poles` line 2241, `rs-global-functional-equation` 2252, `rs-boundary-nonvanishing` 2265). Strip boundedness is `BoundedOnStrips` (anchor `bounded-on-strips`, line 2354) inside `IsNicePinned` (`pinned-niceness`, 2364), proved for the Rankin–Selberg datum in `automorphic-l-data` (line 2378) "outside the contragredient norm-twist pole case", and its Checks say "A self-pair π×π∨ has a pole and supplies data but no `IsNicePinned`". §3.1 needs exactly the self-pair. `local-conductor-test-vector-comparison` is at line 2996, in "Layer AL.5: Values, signs and finite corrections" (2881), not AL.3.

   Repair: in the supplier table cite `automorphic-l-data` and `pinned-niceness` (AL.3) for strip bounds of non-self pairs, and AL.5 for `local-conductor-test-vector-comparison`. For the self-pair add to §3.1 a target `rankinSelberg_selfPair_stripBound`: for a unitary cuspidal π of GL₂ over ℚ, s(s−1)Λ(s, π × π∨) is entire and bounded on every bounded vertical strip; proof plan: `rs-global-poles` for the pole set, `rs-global-functional-equation`, and Phragmén–Lindelöf on the strip from polynomial growth of the archimedean factors and of the Dirichlet series at Re s = 2 (the same route `automorphic-l-data` takes for non-self pairs). Alternatively declare it as a gap on AutomorphicLFunctionsAndLocalFactors with slug `gap:rs-self-pair-strip-bound` in the README and in `design/plan.json`.

7. **F07** (P2) The pinned canonical height is the full height ĥ, not ĥ/2

   Location: `packages/EffectiveClassNumbers/README.md:55` ("by 2·4ⁿ in the pinned library … which is ĥ/2"), `:135` ("§§3.12–3.15 there use the height for (O), half of ĥ"), `:498` ("the pinned Tau Ceti `canonicalHeight` of P₁ is 0.6682…/2 ≈ 0.3341"), `:565`, `:570`; `packages/EffectiveClassNumbers/Suggested.lean:25-26`, `:368-372` (`curve5077_height_gap : 1/4 ≤ P.canonicalHeight`).

   Claim: at the pin, `WeierstrassCurve.Affine.Point.canonicalHeight` is lim h(2ⁿP)/(2·4ⁿ) = ĥ/2, and EffectiveDiophantineMethods §§3.12–3.15 use the (O)-height.

   Witness: Tau Ceti `a91d3aaf`, `AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean` line 119: `Point.canonicalHeight P := limUnder atTop fun n ↦ ((2 ^ n) • P).naiveHeight / 4 ^ n`, with `naiveHeight = logHeight P.xRep` (Mathlib `NumberTheory/Height/EllipticCurve.lean` line 37), the logarithmic height of the x-coordinate: this is ĥ for 2(O), BGZ85's normalization (BGZ85 line 127, (7): h(P) ≤ ĥ(P) ≤ h(P) + 1.205). EffectiveDiophantineMethods README line 89: "The elliptic height ĥ(P) = lim h_x(2ⁿP)/4ⁿ is the full limiting logarithmic x-height, as in `CanonicalHeight.Basic`" and §3.12: "Pinned Tau Ceti ĥ agrees with Cremona's displayed height".

   Repair: in Conventions say that `canonicalHeight` at the pin is ĥ and that EffectiveDiophantineMethods uses the same ĥ, deleting the halving and doubling sentences (lines 55, 135, 498, 570); in §2.8 state the gap as ĥ(P) ≥ 1/2 for P ≠ 0; change `curve5077_height_gap` to `(1 / 2 : ℝ) ≤ P.canonicalHeight` and its docstring and the module docstring (lines 25-26) accordingly; the README Check at line 498 becomes "the pinned `canonicalHeight` of P₁ is 0.6682…".

8. **F08** (P2) The stated pins are not the manifest's, and the reduced-form statements and Checks of §0.2 have no Lean mirrors although statable

   Location: `packages/EffectiveClassNumbers/README.md:65` ("Mathlib `082e2d37…` and Tau Ceti `f790474…` … the current Tau Ceti library additionally supplies the reduced binary forms used in §0.2 (after the pin, so they do not appear in `Suggested.lean`)"), `:173-185`; `packages/EffectiveClassNumbers/Suggested.lean:638-641`.

   Claim: `reducedForms` postdates the pin, so §0.2 has no Lean statements.

   Witness: `lake-manifest.json` pins Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; at `a91d3aaf`, `NumberTheory/BinaryQuadraticForm/Reduced.lean` lines 60 and 76 define `TauCeti.IsReducedForm` and `TauCeti.reducedForms`, and `Reduction.lean` line 204 proves `orbit_mk_reducedForms_bijective`. The six Checks of §0.2 (d = 23, 20, 907, 4, 16, 12) are decidable equalities of finite sets.

   Repair: correct line 65 to the manifest pins. Add to `Suggested.lean`, with `import TauCeti.NumberTheory.BinaryQuadraticForm.Reduction`, the signatures `reducedForms_primitive` (for `TauCeti.Multiquadratic.IsFundamentalDiscriminant (-(d : ℤ))`, every `f ∈ TauCeti.reducedForms d` has `Int.gcd (Int.gcd f.a f.b) f.c = 1`), `reducedForm_four_mul_c_sq_ge` (`f ∈ reducedForms d → (d : ℤ) ≤ 4 * f.c ^ 2`, strict under primitivity and `d ≠ 4`), and two `example`s, for instance `TauCeti.reducedForms 23 = {⟨1,1,6⟩, ⟨2,-1,3⟩, ⟨2,1,3⟩}` and `⟨2,-2,3⟩ ∉ TauCeti.reducedForms 20` by `decide`; after R04 the class-number count is cited, not restated.

9. **F09** (P3) X₀(N) with its cusps is ModularCurves Layer 10, not Layer 8

   Location: `packages/EffectiveClassNumbers/README.md:25`, `:103`, `:578`, `:642`.

   Claim: "ModularCurves, Layer 8, supplies the modular curve X₀(N) over ℚ with its cusps ∞ and 0."

   Witness: ModularCurves on main: "## Layer 8: KM Chapter 6, cyclicity, and `[Γ₀(N)]`" (line 1648) is the moduli problem; the compactified curve and "the two disjoint cusp sections 0 and ∞" are "## Layer 10: compactified coarse curves over ℤ[1/N], cusps, and the Shimura covering" (lines 2103, 2222-2223).

   Repair: replace "Layer 8" by "Layer 10" at the four locations.

10. **F10** (P3) AnalyticNumberTheoryPartI §0.5 is conditional

   Location: `packages/EffectiveClassNumbers/README.md:113`, `:808`, `:884`.

   Claim: §0.5 supplies the Rosser–Schoenfeld bounds for x ≥ 59 unconditionally.

   Witness: supplier README line 254: "Under `RosserSchoenfeldFiniteRangeInput`, for x ≥ 59, …", a finite-range input up to exp(10000) that the supplier carries as a hypothesis.

   Repair: §4.4 needs only p_n ∼ n log n, which follows from Tau Ceti `primeCount_univ_isEquivalent_div_log` alone; delete §0.5 from the supplier table and the *Needs:* line, or cite it with its hypothesis.

11. **F11** (P3) Build order: the third-derivative bounds of §2.7 need §2.8 and §2.11

   Location: `packages/EffectiveClassNumbers/README.md:545-550` (`curve5077_third_deriv_bounds`, `curve139_third_deriv_bounds`, "available once L′(…) = 0 (§2.8)/(§2.11)"), `:139` ("each `### k.n` subsection lists its statements in dependency order").

   Claim: §2.7 precedes §§2.8–2.11 in the build.

   Witness: `centralDerivative_series` at r = 3 requires `iteratedDeriv 1 L 1 = 0` (Suggested.lean line 345); that is the conclusion of `heegnerTrace_139` (§2.11) and of the E₅₀₇₇ data of §2.8. The *Needs:* line 545 names neither. `Suggested.lean` itself places `curve139_third_deriv_bounds` (line 390) after `heegnerTrace_139` (line 376).

   Repair: move the two third-derivative bounds into §2.12 and §2.13 (or a new §2.11a) with *Needs:* `heegnerTrace_139` respectively `heegnerHeight_gap` with the §2.8 data, leaving `curve5077_deriv_small`, `curve5077_twist7_central_bounds` and `curve37_central_bounds` in §2.7.

12. **F12** (P3) C₅₅(2) is 961.7, not 961.8

   Location: `packages/EffectiveClassNumbers/README.md:774`, `:878`.

   Claim: C_55(2) = 165/(3 − 2√2) ≈ 961.8.

   Witness: 3 − 2√2 = 0.1715729; 165/0.1715729 = 961.690.

   Repair: write "≈ 961.7" in both places.

13. **F13** (P3) Example counts: more than two per definition, and one definition with a single mirror while Checks are statable

   Location: `packages/EffectiveClassNumbers/Suggested.lean:469-475` (three `example`s on `primeMajorant`), `:516-525` (four on `effectiveKappa`), `:601` (one on `IsInertPrime`), `:85-89` (two on `ramifiedWeight`, both the empty product).

   Claim: the file keeps at most two discriminating examples per definition and mirrors the statable Checks.

   Witness: the counts above; README Checks θ(15) = 1/4 and θ(84) = 1/12 (lines 197-198) and "1333963 is 43-inert" (line 952) are statable (`Nat.floor (2 * Real.sqrt 3) = 3` from rational bounds on √3; `IsInertPrime 43 1333963` by `norm_num` with the Legendre-symbol extension on thirteen primes).

   Repair: keep `primeMajorant 55 1 = 55` and the p₀ = 2 factor; keep `effectiveKappa (1/2) = 1/2^302` and `effectiveKappa 0 = 0`; replace `ramifiedWeight 0 = 1` by `ramifiedWeight 15 = 1/4` (a discriminating value, the largest prime removed); add `IsInertPrime 43 1333963` beside the 77683 negative control.

14. **F14** (P3) The strict constant C₅₅ < 55 is unsourced and unnecessary

   Location: `packages/EffectiveClassNumbers/README.md:704` ("with C replaced by a constant C₅₅ < 55 (so that the inequality is strict) when d is prime"), `:708`, `:741` (`primeDiscriminant_55_strict`), `:973`; `packages/EffectiveClassNumbers/Suggested.lean:439-444`.

   Claim: a constant strictly below 55 is needed for the cutoff.

   Witness: O85 lines 447-448 state C = 55 for d prime to 5077 with no strictness; GZ86 line 356 states (8.2) with C(1) = 55. The cutoff only needs log p ≤ 165, since e¹⁶⁵ < 10⁷² (165/log 10 = 71.66), so p ≤ e¹⁶⁵ < 10⁷² ≤ 10²⁵⁰⁰ already follows from `coprime_55` with θ(p) = 1.

   Repair: delete `primeDiscriminant_55_strict` and the C₅₅ < 55 clause of `oesterleConstant_5077`; in §5.7 derive p ≤ e¹⁶⁵ < 10⁷² from `coprime_55` and `Real.exp_one_lt_d9`; keep GZ86 (8.2) as the reference for the prime-discriminant form.

15. **F15** (P3) LLS70 is linked to a host outside the licence classes

   Location: `packages/EffectiveClassNumbers/README.md:1014`.

   Claim: the link `oeis.org/A002189/a002189.pdf` is the source text.

   Witness: the sources service records that host as "in no licence class" (job scratch `needs-references.previous.toml`); the article is open at the AMS Mathematics of Computation archive, `https://www.ams.org/journals/mcom/1970-24-110/S0025-5718-1970-0271006-X/`, which is the cached text (`LLS70`).

   Repair: link the AMS URL (DOI 10.1090/S0025-5718-1970-0271006-X).

Files reviewed in full: `packages/EffectiveClassNumbers/README.md` (1017 lines) and `packages/EffectiveClassNumbers/Suggested.lean` (653 lines). Suppliers were checked against the content repository's main branch, the merge order, and the heads of the open roadmap pull requests recorded on the board (EllipticCurveModularity, EffectiveDiophantineMethods, AnalyticNumberTheoryPartI, AutomorphicLFunctionsAndLocalFactors); libraries against the manifest pins Mathlib `6b7abb3c` and Tau Ceti `a91d3aaf`; sources against the cached texts of O85, GZ86, GZ83, BGZ85, MW74, LLS70 and G77.

Dependency check (unchanged tooling, read-only):

```text
NOT IN ORDER: EffectiveClassNumbers (insert it after its last supplier)
depcheck: 4 roadmaps, 25 edges, 1 problem(s)
```

No UPWARD or CYCLE line. The roadmap is not yet in `merge-order/ORDER.txt`; that is the intake's insertion, not a finding. The check only sees the four suppliers with relative links; the two suppliers of R01 and R02 are not detectable by it because they exist nowhere.

## Adversarial mathematics pass

| Statement | Instances tried | Result | Change |
|---|---|---|---|
| `isFundamentalDiscriminant_discr` | ℚ(i) (−4), ℚ(√−3) (−3), real ℚ(√5) (5), D = 1 excluded | true; both predicates accept 1, excluded by the third conjunct | none |
| `two_pow_sub_one_dvd_classNumber` | ℚ(i) (t = 1, 1 ∣ h), ℚ(√−5) (t = 2, 2 ∣ 2), ℚ(√−21) (t = 3, 4 ∣ 4) | true; Tau Ceti input needs d < −1, ℚ(i) handled separately as README says | none |
| `discr_of_card_primeFactors_eq_one` | −4, −8, −3, −7, −20 (t = 2, excluded) | true | none |
| `ramifiedWeight` | d = 0, 1, 907, 15, 84, 20; factors at 2, 3, 5, 7, 11, 13 = 1/3, 1/4, 1/3, 3/8, 1/2, 1/2 | matches README; "at least 1/2 for p ≥ 11" true (p = 13 gives 1/2) | none |
| `splitPrime_size` | d = 23, p = 2; d = 7, p = 2; d = 20, p = 3; ramified p excluded by `hunram`; ⊥ ideal has norm 0 ≠ p | true | none |
| `liouville_agreement` | n = 1; n = 4, 6 at d = 907; m = 0 in `hmul` (χ 0 = 0) | true | none |
| `goldfeldCompletion_one/_product` | d = 0 (0⁰ = 1), d = 2, M = 3; product identity with positive-real powers | true | none |
| `inverseMellinKernel_convexOn/_mellin` | a = 0, m = 2 (−log x, corner at 1); a = −1 (not monotone, excluded by a ≥ 0); Re s ≤ a divergent, excluded | true | none |
| `positiveMellin_comparison` | μ = δ₁, ν = (δ_{1/2}+δ_{3/2})/2 (integrated but not pointwise domination); signed μ excluded by `Measure` | true by the hinge representation and Tonelli | none |
| `fundamentalContour` | F = (s−1)³e^{(s−1)²} (odd sign, fails), F = e^{(s−1)²} (order 0, integral 1/2) | hypotheses necessary; statement true (I(2−σ) = −I(σ) by s ↦ 2−s) | none |
| `truncatedResidue` | G ≡ 0 (analytic, residue 0), G(1) = 0 ≠ G′(1) (simple pole) | formula agrees with Tau Ceti's Laurent-coefficient `residue` in all cases | none |
| `oesterleTechnical` | d = 5 (d > 4 boundary), P(d) = ∅ (min = 1), α′ = √p (denominator 1 + p^{−1/2} ≠ 0), U = 2 | matches O85 C1–C4 (lines 212-224) and Theorem 2 (355); constant quantified before K, G | none |
| `curve139_discriminant`, `curve139_c₄_c₆`, `curve139_source_equation` | recomputed: Δ = 37·139⁶, c₄ = 139²·160, c₆ = (−139)³·(−2008), j = 4096000/37; substitution identity holds with constant ratio −2685619/64 | true | none |
| `curve_local_data` | #E₅₀₇₇(𝔽₃) = 7, (𝔽₅) = 10; node at x = 92, 12·92 = 1104 a non-square mod 5077 (nonsplit, a₅₀₇₇ = −1); 139 ∥ conductor exponent 2 (additive, a₁₃₉ = 0) | true against Mathlib's `localPolynomial` | none |
| `mordellWeilRank_eq_three` | #E₁₃₉(𝔽₃) = 5, (𝔽₇) = 9 coprime; 2Q₂ = (350, −3741) | consistent; the E₁₃₉ 2-descent is an honest open obligation | none |
| `bgzKernel`, `_hasDerivAt`, `_le` | r = 0, 1, 2; x ≤ 0; G₁(1) = 0.21938, G₃(2) = 0.003544 ≤ e^{−2}/8 | true (integration by parts checked for r = 1, 2) | none |
| `centralDerivative_series` | n = 0 term (a₀ = 0 forced by `hcoeff`); w sign: f(i/(√N y)) = −y² f(iy/√N) for w = −1; r = 1 and r = 3 | derivation gives L^{(r)}(1) = 2 r! Σ (a_n/n) G_r(αn) exactly; BGZ Table 2 reproduced | none |
| `heegnerHeight_gap` | proved in file | checked | none |
| `curve5077_height_gap` | pin normalization | true but mis-normalized (R07) | 1/2 |
| `rankThree_139`, `rankThree_5077`, `curve139_third_deriv_bounds` | L′(E₁₃₉,1) = −4·10⁻²³, L‴/3! = 18.4294; L′(E₅₀₇₇,1) = −6·10⁻¹⁴, L‴/3! = 1.7318499; L(37b2,1) = 0.72568; L(E₅₀₇₇⊗χ₋₇,1) = 4.4768 | all brackets hold | none |
| `exceptional_5077` | proved in file; +5077 fundamental and real | checked | none |
| `global_7000`, `coprime_55` | d = 3, 4 (θ = 1, log d ≤ 7000); K = ℚ(√−7) at N = 5077 (split branch, log(7/4) ≤ 8.6) | consistent with O85 lines 444-448 | strictness (R14) |
| `primeMajorant*` | t = 0, 1, 2, 3; C₅₅(2) = 961.69; θ(84)C(3) = 10.88c; log factor at 2 (2.86 ≤ 5.66) | true | 961.7 (R12) |
| `effectiveKappa`, `effectiveLogarithmic_bound`, `effective_cutoff` | q ≤ 0, q = 1/4, 1/2, 1, 2; ε > 1; d = 3 (log d > 1) | derivation re-done: C₇₀₀₀(t) < 2^{45+⌈256/δ⌉}h^δ with δ = q/(1−q) | none |
| `classThree_prime`, `classThree_enumeration` | class-number-three list recomputed by reduced forms for d ≤ 2000: exactly the sixteen; 23, 31 ≡ 7 mod 8 | true | none |
| `mwZero_brackets` | 17923 prime, 115147 = 113·1019, 123204 = 4·3·10267, 10267 prime; χ(2) = −1, −1, 0; Table I γ = 0.030986, 0.003158, 0.010650 (MW74 lines 270-277) | brackets contain the tabulated zeros | none |
| `IsInertPrime`, `leastInertPrime_*` | 222643 (41), 1333963 (43, 47), 51599563 (67, 71), 1432817816347 (151–163) against LLS70 lines 535-575; 77683 composite | true; minimality of 1432817816347 not re-derived | none |
| `smallRange_sieve`, `classThree_cutoff` | 4·43³ = 318028 < 1333963, 4·67³ = 1203052 < 1333963, 4·163³ = 17322988 < 51599563; e¹⁶⁵ = 10^{71.66} | chain sound (LLS70 lines 1127-1133 use the same inequalities) | none |

## Verified sound

- Declarations read: 67 definitions, theorems and instances and 22 examples in `Suggested.lean` (all); every example re-derived by hand against the definitions; the sorry'd signatures checked for truncated types, sorry'd data and hypothesis-contains-conclusion (none found).
- README targets read: all 66 named targets in §§0.1–5.8 and the 51 Checks lists (145 Check items), each tested on at least the boundary instances in the table above; conventions (θ, χ at 2, ĥ, Fricke sign, the 1/d in the completion, strict cutoff p < U, (r−1)! in G_r) each pinned by a computed two-term example.
- Sibling and library citations checked: EllipticCurveModularity R29.3–R29.6 with the five quoted subsection titles (lines 1330, 1364, 1471, 1507, 1889 of its README) exist and say what is consumed; EffectiveDiophantineMethods §§0.11, 3.2–3.7, 3.12–3.15, 3.17, 3.18, 3.20, 3.22 exist with the stated content; AnalyticNumberTheoryPartI §0.9 and §0.33 exist as cited; AutomorphicLFunctionsAndLocalFactors `rs-global-poles`, `rs-global-functional-equation`, `rs-boundary-nonvanishing` exist (the last for the partial L^S, which §3.1 corrects by its own bad factors); IntegralLattices Layer B (B1, B2, B5, `NumberFieldOrder.mkPic`) on main; EllipticCurves Layers 3–6 (Hasse, Tate's algorithm with split/nonsplit test and Ogg exponent, quadratic twists, two-descent, canonical height pinned as lim h(x(nP))/n²); ModularForms worked example #19 (η, its SL₂(ℤ) law, Ligozat); Completed ContourIntegration Layer 2. Pinned declarations grepped and found: 31 of the 33 named Mathlib declarations (the two others, `two_pow_classGroupTwoRank_dvd_classNumber` and `mem_ramifiedPrimes_iff_dvd_discr`, are Tau Ceti, as the README's Tau Ceti table says) and all 25 named Tau Ceti declarations, including `fundamentalDiscriminantChar`, `reducedForms`, `quadraticTwistOf`, `PointModTorsion`, `Contour.residue`, `classicalResidueTheorem_nullHomologous`, `HasEntireExtension`, `primeCount_univ_isEquivalent_div_log`, `primeNumberTheoremTransfer`, `LSeries.wienerIkehara`.
- Locators verified against cached texts (37): O85 Theorem 1 and P(d), θ(d) (lines 88-93), §1.3–1.4 (131-158), C1–C4 and (3.1.1) (212-236), Proposition 1 (319-330), §3.5 Lemma 1 with m = 3/2 for h = 4 and Theorem 2 (338-357), §5.1 (439-452); BGZ85 (2) (line 52), (7) (127), (12)–(14) (234-278), the Heegner argument (252-256), Table 2 (286-301), Ω·R (308), the note on modularity (315); GZ86 Proposition (7.4) (329-330), Theorem (8.1), (8.2), C(1) = 55 and 907 (340-358), the standing hypotheses on D (159, 170); GZ83 Corollary 6 and its proof (95-111); MW74 Theorem (70-72), Table I (270-277), the ranges and windows (299-329); LLS70 Table III (527-575) and the class-number-three chain (1123-1138); G77 §1 (27-30); DLMF §5.11 cached.
- Numerics recomputed independently (scripts in the job scratch): curve invariants and points, point counts and a_p, the twist coefficients, the nonsplit node, the reduced forms and the sixteen discriminants, θ values, C_c(t), κ(q), the inert-prime thresholds, L(37b2,1), L′ and L‴ of both curves, L(E₅₀₇₇⊗χ₋₇,1), the BGZ partial sums, e¹⁶⁵ < 10⁷².
- Policy: the package changes only its folder (`git diff --stat origin/main...HEAD`: README.md, Suggested.lean, metadata.toml, review.json); no `lemma`, no `set_option`, no `#eval`, no pull-request numbers, no machine paths, single `import Mathlib` plus five `TauCeti.*` modules that exist at the pin; every target has a locator.

## Not verifiable

- O88 (L'Enseignement Mathématique 34, pp. 66-67): the e-periodica copy returns a bot-check page and no legal text was obtained; the §2.1 statements about the printed model were instead recomputed (its c₄, c₆, Δ = 37³·139⁶, j = 1404928000/37³ and the twist relation with y² + y = x³ + x² − 23x − 50 all check), so nothing in this report depends on it. Listed in the job's `needs-references.toml`.
- The E₁₃₉ height Gram matrix, its determinant 15.36, Ω ≈ 0.29985 and the Buhler–Gross–Zagier regulator 0.41714: not recomputed here (the independent review reports recomputing them); they enter only §2.4's independence claims, which the published sources support.
- Minimality of 1432817816347 as the least 163-inert prime: taken from LLS70 Table III; membership and primality were checked, the residue-class sieve was not re-run.
- O85 Proposition 1's constants c₄ = M/96, c₅ = (2π⁴/3)M^{3/2}, c₆ = 4π²eM^{3/2}sup(2, log 4M) and (3.5.1)–(3.5.6): the pdftotext extraction garbles the displayed formulas; the earlier session of this job read them from the page images and found them as the README states, and they are not re-derived here.
- Whether the roadmap belongs after EffectiveDiophantineMethods or after ErdosProgressionPowers in the merge order is the intake's decision; its last existing supplier is EffectiveDiophantineMethods.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "cdb320a1fefa3003ef4c83015fe20e5e10a4d735", "job": "RT-EffectiveClassNumbers~1b", "model": "fable", "worker": "chris-f"} -->
