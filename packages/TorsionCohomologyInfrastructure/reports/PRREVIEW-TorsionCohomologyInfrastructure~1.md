# Review of TorsionCohomologyInfrastructure (pull request #1087 at d3fb40f)

**Verdict:** needs changes

One blocking finding (P2): the supplier contract for PadicHodgeTheory names two declarations that do not exist at that roadmap's head. Four P3 notes. The mathematics of the roadmap, the fifteen sampled locators, the eleven Lean declarations and the dependency direction all check out; details under *Verified sound*.

## R01 (P2) — PadicHodgeTheory declarations `primitiveSNCCompactSupport` and `primitiveSingularProper` do not exist

**Location.** `TauCetiRoadmap/TorsionCohomologyInfrastructure/README.md` line 121 ("§2.7 … supplies … `primitiveSNCCompactSupport` for a smooth proper pair with strict normal-crossings boundary, and `primitiveSingularProper` for singular proper rigid spaces").

**Claim.** The two backticked names are declarations of PadicHodgeTheory consumed here.

**Witness.** PadicHodgeTheory at its open head (pull request #1062), read with `roadmaps show`: neither string occurs in its README nor in its `Suggested.lean` (the Lean mentions "primitive" only in a docstring). Its §2.7 does state both results in prose: the strict-normal-crossings compact-support primitive comparison for `U = Y ∖ D` and the singular proper extension through an analytic log resolution.

**Repair.** Replace the two names by prose, for example: "§2.7 supplies the absolute smooth proper primitive comparison, its strict-normal-crossings compact-support form for a smooth proper pair, and its extension to singular proper rigid spaces through analytic log resolution, with resolution independence, localization and amplitude." Nothing else changes: §2.1 cites the section, not the names.

## R02 (P3) — ShimuraCompactifications locators carry a `C` prefix that roadmap does not use

**Location.** README line 459 ("ShimuraCompactifications §§C2.8–C2.9"), lines 661 and 801 ("ShimuraCompactifications Layers C2–C3").

**Claim.** The toroidal-to-minimal morphism and the canonical models are ShimuraCompactifications §§C2.8–C2.9.

**Witness.** ShimuraCompactifications at #1053 numbers its sections plainly: §2.8 "The map to the minimal compactification" and §2.9 "Canonical models of toroidal compactifications" are exactly the cited results, and the only `C`-prefixed labels in its text refer to ComplexComparisonPartII. Unlike AutomorphicBundles, it states no letter-label convention for consumers.

**Repair.** Write "§§2.8–2.9" and "Layers 2–3". Optionally also modernise the AutomorphicBundles locators to that roadmap's current numbering (`B4.18` is §11.18 "Rational forms and field base change"; `B5.10–B5.11` are §§12.11–12.12, the geometric Hecke operators and their convolution law); those resolve already through AutomorphicBundles' own label map, so they are not a defect.

## R03 (P3) — About ninety backticked names of this roadmap's own are not declared in `Suggested.lean`

**Location.** Throughout the README, e.g. line 193 (`framedFormalModel.chartSections`), line 292 (`boundaryIdeal.colimit_iso`), line 680 (`classicalAmbientDeterminant`), line 839 (`finiteTorsionDeterminant`).

**Claim.** Under the house rule, a backticked name of the roadmap's own asserts that `Suggested.lean` declares it.

**Witness.** `Suggested.lean` declares eleven names (all of Layer 3a). The README backticks roughly ninety further own names (target and API names such as `integralBoundaryIdeal.eq_sup`, `heckeTopology.basis`, `weightedUnitLaw.map_mul`, `nonlifting_example`); the resolver lists twenty-six of them as "Lean names found nowhere". The gate's own identifier check passed, so this is style only.

**Repair.** Keep the backticks on the eleven declared names (the `*Lean:*` lines already list them) and write the other target and API names as plain or bold prose, as the README already does for most Layer 4 targets' statements.

## R04 (P3) — Unused hypothesis `1 ≤ N` in `laurentCoeffIdeal_pow_eq_bot`

**Location.** `TauCetiRoadmap/TorsionCohomologyInfrastructure/Suggested.lean` line 144 (`(hN : 1 ≤ N)`); README line 587 ("if `N ≥ 1` and `I^N = 0`").

**Witness.** For `N = 0`, `I ^ 0 = ⊤`, so `I ^ 0 = ⊥` forces `LaurentPolynomial R` to be the zero ring, hence `R = 0`, and then `laurentCoeffIdeal I ^ 0 = ⊤ = ⊥` holds. The statement is true without `hN`.

**Repair.** Drop `hN` (and "`N ≥ 1`" in §3a.7), or leave it; a note, not a defect.

## R05 (P3) — A named downstream consumer exists nowhere

**Location.** README line 933 ("**IntegralHeckeAndGaloisDeterminantsPartII** uses Layers 2, 3b and 4").

**Witness.** `roadmaps show IntegralHeckeAndGaloisDeterminantsPartII` reports no such roadmap on main or in an open pull request, and the board's package index does not list it.

**Repair.** Drop the bullet, or name the roadmap that will carry that Part II once it exists.

## Verified sound

**Gate.** The worker's gate at d3fb40f: every check passed, build 0 with `sorry` the only warning. Re-run of the dependency check from the worktree:

```text
depcheck: 205 roadmaps, 1435 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The merge order places TorsionCohomologyInfrastructure at line 166, directly after PerfectoidShimuraVarieties (165), AutomorphicBundles (163) and HodgeTateAndCanonicalSubgroups (164); every cited supplier is earlier (IntegralHeckeAndGaloisDeterminants 22, ArithmeticLocallySymmetricSpaces 61, ModularCurvesPartII 70, DeligneWeightsAndPurity 75, AutomorphicSpectralTheory 79, EtaleDualityAndPerverseSheaves 91, PadicHodgeTheory 107, EndoscopicTransferAndUnitaryTraceComparison 132, ShimuraCompactifications 143, AutomorphicGaloisRepresentationsPartII 146, CompletedCohomologyPartII 159) or on main (ClassFieldTheory, AdicSpacesPartIII, PerfectoidSpaces, SchemeAndStackFoundations, AlgebraicTopology, GeometricTopology). `git diff --stat origin/main...HEAD` outside the roadmap folder is empty.

**Principles.** No route-specific shortcut (all statements are over arbitrary commutative rings in Layer 3a, every prime `p` in Layers 0–2, both field branches in Layers 3b–4 with the transfer hypothesis `(EC)_n` named where it enters). No re-planned roadmap: perfectoid towers, completed cohomology, Borel–Serre geometry and determinants are consumed by name, and the ownership grep (`roadmaps grep` for Scholze's Lemma 2.1.2, Lemma 4.3.2, Lemma 4.3.3, Theorem 4.3.1, Corollary 4.2.2, Corollary 5.2.6, Theorem 5.3.1, Lemmas 5.3.10 and 5.3.13, "fake Hasse") finds no other roadmap stating them. The related objects in open pull requests were compared by object: AutomorphicBundles §10.3 (`siegelBoundaryHebbarkeit`, the scalar good-triple extension) and §10.8 (the smooth colimit sheaf `I^sm` of boundary ideals) do not state the coordinatewise lattice extension of §0.4 or the fixed-exponent ordinary colimit isomorphism of §2a.1; CompletedCohomologyPartII §8.6 constructs only the fixed-exponent carrier and names this roadmap's Layer 2 as the consumer of Theorem 4.2.1. No copied passages, no algorithm, no sorry'd data, no `set_option`, single `import Mathlib`. Ownership against open pull requests whose files the brief does not list was not checked beyond `roadmaps grep`.

**Seeded sample, all fifteen targets verified at their locators** (Scholze 2015, cache `ebac854f…`, printed page = file page + 944; Chenevier `f3c0e0d8…`; Shin `6bfc5628…`; Caraiani–Le Hung author PDF `1f9ef1c6…`, fetched this round; Stacks tags fetched this round):

- 0.5: Lemma 2.2.9(ii) at line 521–533 (the almost exact sequence `0 → I⁺/ϖⁿ → R⁺/ϖⁿ → S⁺/ϖⁿ → 0`) and the proof of Theorem 4.2.1 at lines 2952–2965; Remark 2.2.4 (line 459) does deny surjectivity, and Bhatt–Scholze Theorem 7.4 with Remark 7.5 (`1d91a6eb…` 2175–2183) and Étale cohomology of diamonds Theorem 5.8 (`0f81c3f0…` 1007–1011) give the corrected closed quotient, as the README says.
- 0.6: Theorem 4.2.1 proof, lines 2946–2965: `j_!O⁺ᵃ/pⁿ = I⁺ᵃ/pⁿ` from the strongly Zariski closed boundary, analytic versus étale by Propositions 6.14 and 7.13, Čech on affinoids.
- 0.7: Lemma 4.3.2, lines 3085–3102: normal `R`, finite generically étale `S`, `tr(S) ⊂ R` and `tr(J) ⊂ I` for `I` integrally closed with integral closure `J`, proved at valuations. The README's reduced-boundary trace target is correctly marked as owned here, since the lemma's `J` is the ideal-theoretic integral closure.
- 1.2, 1.4, 1.7: proof of Theorem 4.3.1, lines 3231–3292: sections `s_j^{(i)}` at level `K_p` with `|s_j − s_j^{(i)}|/|s_i^{(i)}| ≤ |pⁿ|`, the formal model via Lemma 2.1.1 on the preimages `Ṽ_{iK_p}` (line 3245: "In fact, we can also take the preimages"), independence of the approximating choice (3250), localisation `H⁰(V_{JK_p}, I/pⁿ) = colim_{×s̄_J} H⁰(X*, (ω^int)^{⊗k|J|} ⊗ I/pⁿ)` (3268), ampleness and `H¹ = 0` for `k` sufficiently divisible (3282–3286), `p`-torsion-freeness and the classical space (3289–3292). The correction "both places mean the genuine preimages" matches lines 3245–3249.
- 1.5: Stacks 01ZM (`a575d9ed…` 1094: finite presentation descends), 01ZR (1179: finitely presented modules descend), 05LY (1234: flatness descends), 081F (1512: properness descends when `f₀` is locally of finite type), 09MT (353: ampleness descends to some `i`), 0B5U (`b4980a08…` 2090: Noetherian Serre vanishing), 0B91 (`f79e0ebb…` 3421, part (2): `Rf_*G` perfect with formation commuting with arbitrary base change for `G` finitely presented and flat over `S`, `f` proper of finite presentation). The chain of descents and the base-change step are exactly as the README argues; flatness is used in 05LY and 0B91.
- 2.2, 2.3: Corollary 4.2.2 proof, lines 3001–3021: reduction to `n = 1`, `V ⊗ O_C/p` flat and nonzero hence not almost zero, cohomological dimension of a cofiltered limit of spectral spaces, formal-model alternative to Huber 2.5.8. Stacks 02UZ (`23fbd6af…` 1637) is Grothendieck's vanishing for Noetherian spaces.
- 2.5: Corollary 4.2.3, lines 3025–3050. The printed "`l₀ = d` and `q₀ = 0`" (3028) is exchanged for a Hermitian symmetric group, and the printed choice of the *maximal* violating codimension (3032) does not make the interfering terms vanish; the README's "minimal" does (see the table).
- 2.8: Corollary 5.2.6 proof, lines 3785–3804: auxiliary `ℓ ≥ 3`, normal `K_pK^p_{S⁺}` in the level-`ℓ` subgroup, Hochschild–Serre with continuous `E₂`-action, filtration by at most `d+1` terms, `J^{d+1} = 0`, "the desired result follows by varying ℓ" (3787) with footnote 26 on equivariance away from `ℓ`.
- 4.2, 4.3: Theorem 5.4.1 and proof, lines 4313–4356: reduction to small `K` and trivial `ξ`, boundary via `GL_{n'}` (`n' < n`), `I_∂`, `I_!` from Theorem 5.3.1, square-zero kernel, Corollary 1.14. Caraiani–Le Hung Proposition 3.3 and Remark 3.4 (author PDF `1f9ef1c6…` 399–407) give the filtration with `O/πᵐ` coefficients; the Satake display of the proof of Theorem 4.5 (509–520) gives the block exponents `−(n₁+⋯+n_{i−1})/2 + (n_{i+1}+⋯+n_k)/2`.
- 4.4: Corollary 5.4.2 proof, lines 4381–4395, and Remark 5.4.5, lines 4422–4431 (direct sums printed).
- 4.6: Corollaries 5.4.3–5.4.4, lines 4398–4417 (the display of 5.4.4 prints `σ_ψ`), the proof placed after Remark 5.4.5 (4436–4439, using irreducibility and Theorem 2.22(i)); Chenevier Theorem 2.12 (1165, p.28) and Theorem 2.22(i) (1404, p.34).

**Other locators opened.** Scholze Lemma 2.1.1 (339–392), Lemma 2.1.2 (394), Corollary 3.2.23 (1922–1943, constant `(g²+g+1)ε/pᵐ` per step), the chart-orbit sentence on p.1008 (2442), the end of the proof of Theorem 3.3.18(vi) (2718–2723), the proof of Theorem 4.1.1 (2884–2908), Proposition 5.1.1, Theorem 5.1.2, Remark 5.1.5, Corollaries 5.1.7, 5.1.10, 5.1.11, Lemmas 5.2.2, 5.2.3, 5.2.5 and the definition of `P_v`, `P_v^∨`, `P̃_v` (3748–3757), Theorem 5.3.1 with its proof (3849–3894), Lemmas 5.3.2–5.3.4, Corollary 5.3.5, the choice of the new prime (4011), Lemmas 5.3.6–5.3.8, 5.3.10–5.3.13 and the degree remark (4270–4273), the §5.4 polynomial (4304–4308) and setup (4284–4292), Remark 5.4.6 (4440–4459). Chenevier Corollary 1.14 (593), Example 2.32 (1560), Lemma 2.33 (1585), Lemma 3.8 (1792–1803), Lemma 3.10 (1834–1853). Shin Theorem 1.1 (41–54), the Labesse conditions including regular highest weight (55–57), Lemma 1.3 (115), Proposition 1.4 (118–127). Survey Theorem 3.13 and Lemmas 3.14–3.16 (`c18d6f9f…` 675–718, pp.17–18). Stacks 01PS (`2f5b9ba4…` 1807), 01PW (944), 09MW (`a575d9ed…` 1339), 02KH (`b4980a08…` 478).

**Supplier citations resolved** (every cited section exists with matching content at the head named): IntegralHeckeAndGaloisDeterminants #1689 Layers 0, 1, 2, 3a, 4, 5 and every named item (*Direct sums of determinants*, *Coefficient reconstruction from group words*, *Uniqueness from Frobenius density*, *Compact coefficient-ring gluing*, *Uniform congruence witnesses for classical systems*, *Integral interpolation with uniform congruences*, *Determinant from a quantified Hecke comparison*, *Nilpotence through a quotient extension*, *Nilpotence of sums of commutative ideals* with exponent `a+b−1`, *Nilpotence in a product of coefficient rings* for an arbitrary index family, *Error ideal on a filtered module*, *Quantified composition of Hecke error ideals*, *Residual semisimple specialization*, *Representation over the nilpotent quotient*, the open-kernel criterion, ghost nilpotence; §3a.1's polynomial `Σ(−1)^i q^{i(i−1)/2} T_i X^{n−i}`). The resolver's lead "IntegralHeckeAndGaloisDeterminants has no Layer 3" is a false positive: the README cites Layer 3a, which exists. PerfectoidShimuraVarieties #1085 §§1.3–1.6, 1.16, 2.1–2.3, 2.8, 3.3, 3.6, 3.8, 3.9 (with §2.3's integral approximation `R⁺/pʳ = colim R⁺_{K_p}/pʳ`, §1.16's normalised traces, §3.9's Scholze all-prime models and the `p = 2` Pilloni–Stroh qualification). CompletedCohomologyPartII #1035 §§1.1, 2.1, 2.3–2.9, 4.1–4.6, 5.5, 6.1–6.4, 7.6, 8.6. ArithmeticLocallySymmetricSpaces #871 ALS.0.7, 0.8, 0.9, 0.12, 1.2, 1.4, 1.5, 1.6, 2.3, 2.4, 2.8, 2.9, 3.6, 3.9, 3.12, 4.1–4.3, 4.7, 4.8, 5a.1–5a.4, 6.2. AutomorphicGaloisRepresentationsPartII #1006 AG2.3 (its three named items) and AG2.7. AutomorphicSpectralTheory #925 §4.14a and §6.20. EndoscopicTransferAndUnitaryTraceComparison #999 §§1.8, 5.1, 6.17, 6.19, 6.20, 6.25 (hypothesis `[F⁺:ℚ] ≥ 2` present), 6.29 (property (*)), 13.1, 13.4 (standard pairs). HodgeTateAndCanonicalSubgroups #1084 §§2.1–2.10. ModularCurvesPartII #913 §§13.1–13.6, 14.2–14.4, 14.15. EtaleDualityAndPerverseSheaves #1040 §§2.3, 5.6. DeligneWeightsAndPurity #929 §8.12. AutomorphicBundles #1069 via its stated label map. On main: ClassFieldTheory Layer 11 (`globalArtinMap`, `globalArtinMap_ideal`, `globalArtinMap_isArithFrobAt`, `globalArtinMap_local`; `geometricArtinMap` is the local map), AdicSpacesPartIII F0.3, F0.9, R2.1–R2.3, R2.5, R2.6, R3.7, R3.8, PerfectoidSpaces P0.1, P0.5, P0.29, P2.7, P2.8, P3.13, P3.21, P3.22, P4.14, P4.15, P7.15, SchemeAndStackFoundations §2.6, AlgebraicTopology Stage 5 item 1 (Künneth spectral sequence over every commutative ring) and Stage 6, GeometricTopology "Smooth implies PL". The consumer IgusaVarietiesAndTorsionConcentration #1090 cites §§2.1, 2.4, 2.6–2.8, 3b.1, 3b.2, 4.3, 4.6 and Layer 4, all of which exist here.

**Library declarations at the pins** (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`): `Polynomial.compRingHom` (`Algebra/Polynomial/Eval/Defs.lean:636`), `Matrix.charpolyRev` and `reverse_charpoly` (`LinearAlgebra/Matrix/Charpoly/Coeff.lean:290,292`), `Matrix.charpoly_map` (`Charpoly/Basic.lean:173`), `AddMonoidAlgebra.mapDomainRingHom` (`Algebra/MonoidAlgebra/MapDomain.lean:285`), `PowerSeries.rescale` (`RingTheory/PowerSeries/Basic.lean:559`), `Polynomial.coeToPowerSeries.ringHom` (ibid. 852), `PolynomialLaw` (`RingTheory/PolynomialLaw/Basic.lean:77`, test algebras in the universe of `R`), `continuous_iInf_rng` (`Topology/Order.lean:857`), `groupCohomology.H1IsoOfIsTrivial` (`GroupCohomology/LowDegree.lean:1018`), `Algebra.isIntegral_trace` (`RingTheory/Trace/Basic.lean:159`), `Ideal.exists_ideal_over_prime_of_isIntegral_of_isDomain` (`Ideal/GoingUp.lean:307`), `Ideal.comap_radical` (`Ideal/Maps.lean:678`), `Polynomial.coeff_reflect`, `reflect_reflect`, `reverse` (`Algebra/Polynomial/Reverse.lean:95,103,217`); `TauCeti.maximalProPQuotient.lift` (`Topology/Algebra/Group/Profinite/MaximalProP.lean`), `TauCeti.AlgebraicGeometry.Scheme.Modules.cohomologyδ` (`AlgebraicGeometry/Cohomology/LongExactSequence.lean`). Mathlib has no `PolynomialLaw.IsHomogeneousOfDegree` at this pin, so the inlined homogeneity clause in `weightedDeterminantFactors` is the right form. Formal schemes, perfectoid spaces, locally symmetric spaces and Hecke algebras are absent at both pins (only `RingTheory/Perfectoid/*` ring-level files exist), so the docstring's "not statable" list is correct.

**Lean form and binders.** Elaborated `#check @name` for all eleven declarations (scratch probe): each type agrees with its README statement; no section binder was dropped. Headlines: the README's end theorems (§§4.3–4.6) and milestones (§§2.1, 2.4, 2.7, 3b.9) are not statable at the pins and are named in the module docstring; the Layer 3a theorems are stated. One-tactic probe on a scratch copy, each `sorry` replaced by `first | simp | simp_all | rfl | decide | exact?`: all five theorems remain open (probe lines 60, 80, 89, 122, 146), so nothing is padding. The three definitions `weightedProduct`, `weightSubst`, `lawCharpoly`, `laurentSubst`, `substStableIdeal`, `laurentCoeffIdeal` have real bodies on native carriers.

**Adversarial table** (statement; instances; values on each side; result; change):

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| 3a.1 `weightedProduct` | `P=1−2X, Q=1−3X, u=2` over ℚ; `u=1`; constants `2,3,u=−1` | `P(X/2)Q(2X)=(1−X)(1−6X)=1−7X+6X²`; same-side scaling `1−10X+24X²`; `u=1` gives `PQ`; `6` | matches all three Checks | none |
| 3a.2 separation, negative control | ℤ/9, `u=2`, `P=1+3X,Q=1` vs `P'=1,Q'=1+3X` | products `1+3X`; twisted `1+3·5X=1+6X` both; `1−u²=−3≡6` not a unit | hypothesis fails, conclusion fails | none |
| 3a.2 positive | ℚ, `u=2`, `n=1`, swapped pair | `(1−(3/2)X)(1−4X)=1−(11/2)X+6X² ≠ 1−7X+6X²` | separates | none |
| 3a.2 degenerate | `n=0`; zero ring | all four polynomials `=1` (natDegree ≤ 0, constant 1) | holds | none |
| 3a.2 proof step | coefficient `j` | `δp_j+δq_j=0`, `u^{−j}δp_j+u^{j}δq_j=0 ⇒ u^{−j}(1−u^{2j})δp_j=0` | needs exactly `IsUnit(1−u^{2j})` | none |
| 3a.3 `weightSubst` direction | `m=2, F=1−X` (Lean-elaborated); `m=0` | `coeff₁ = −T²`; `m=0` constant Laurent coefficients | matches Check | none |
| 3a.3 uniqueness | `Q₀=1+aX, Q₁=1+bX`; `M=∅`; `S=0` | `1+(a+bT)X+abTX²`, `a,b` read off `T⁰,T¹`; vacuous; trivial | holds | none |
| 3a.3 polynomiality | shift `X↦T^{−m₀}X`; `Q'=Σ_e φ_e(X)T^e`, `deg φ_e ≤ e` | `T^e`-coefficient of `Q'Q₀` is `φ_eQ₀`; `Q₀` nonzerodivisor | README argument valid; Scholze's `X`-expansion is not coefficientwise | none |
| 3a.4 decomposition | `R=ℚ×ℚ, D=(aug,aug²)`; law `1`; ℤ with `aug²` | `f(T)=(T,T²)`: factors `ℚ×0` (deg 1), `0×ℚ` (deg 2); `f=1` deg 0; `f=T²` deg 2 | holds | none |
| 3a.5–3a.6 degree-zero weight | `n_m=0` | `P^{(m)}=1`, law constant `1`, `lawCharpoly 1 g = 1` | consistent | none |
| 3a.6 Lean form | `hchar` at `(g, ofAdd k)` | RHS `∏ P_m^g(T^{km}X)` = Scholze's `P_g^{(m)}(T^{km}X)`; homogeneity `Σ n_m` | matches Lemma 5.3.8; uniqueness by Amitsur (Chenevier 1.14) | none |
| 3a.6 exact degrees | Scholze lines 4270–4273 | `deg ∏ P^{(m)} = n` exactly ⇒ `deg P^{(m)} = n_m` | README's `d_m ≤ n_m`, `Σd_m=h` argument agrees | none |
| 3a.7 `laurentSubst` | `a=2` on `3T^{−1}+T²`; `a=0,1,−1`; `a=2,b=−3` on `T` | `3T^{−2}+T⁴`; `4`, unchanged, `3T+T^{−2}`; `T^{−6}` both ways | matches Checks | none |
| 3a.7 ℤ/4 | `I=(2)` | `I²=0`; `I⊂I_a ∀a`, `I₁=I ⇒ I'=I`; `J=(2)`, `J²=0`; `T−1∈I₀∖I` | holds | none |
| 3a.7 ℤ | `I=(T−1)` | substitution-stable, proper; `1∈J` | `I' ⊊ J·ℤ[T^{±1}]` | none |
| 3a.7 nilpotent example | `𝔽₂[a,b]/(a²,b²)`, `I=(a+bT)` | `I²=0`; `(a+bT)g` has `a`-part `g₀`, `b`-part `Tg₀` ⇒ `a+bT²∉I`; `ab∈I'`; `(a,b)²∋ab≠0` | `I'` is required | none |
| 3a.7 junk `N=0` | `I⁰=⊤=⊥` | forces `R=0`; `J⁰=⊤=⊥` | true without `hN` | R04 |
| 3a.7 bound | `f₁…f_N∈I'`, exponents in `[−B,B]`, `a_i=(2B+1)^{i−1}` | balanced base-`(2B+1)` digits unique ⇒ coefficient of `T^{Σa_ik_i}` in `∏f_i(T^{a_i})∈I^N=0` is `∏coeff_{k_i}f_i` | `J^N=0` | none |
| Conventions witness | `n=1`, `U₁=1` | `P_v=1−qX`; `ε(Frob_geom)=q^{−1}` ⇒ character `ε^{−1}`; arithmetic form `1−q^{−1}X` | consistent | none |
| `P_v` two forms | `U_i=q^{i(n−i)/2}e_i` | `i(n+1)/2 − i(n−i)/2 = i(i+1)/2` | matches Scholze p.1057 (line 4307) | none |
| 3b.1 standard conversion | `n=1,q=3,U₁=2`; `n=2,q=2,U₁=3,U₂=5` | `1−6X` vs reciprocal `1−2X` (root ×`q`); `1−6X+40X² = (1−3X+10X²)|_{X↦2X}` | holds | none |
| 3b.1 normalised reciprocal | `P=1−6X,c=−6`; ℤ/4 `P=1+2X+3X²,c=3` | `1−X/6`, twice gives `P`; `3·(3+2X+X²)=1+2X+3X²`; mod 2 `1+X²` | holds | none |
| 3b.1 unitary top sign | `(1−aX)(1−qbX)` | `1−(a+qb)X+qabX²`, top `+` | Scholze's display prints `−` | none (README corrected) |
| 3b.1 Levi root images | Lemma 5.2.5(i)–(iii) | `q^{(n+1)/2}X_i^{±1}`; `q^{n/2}X_i, q^{−n/2}Y_i`; `q_v^{n/2}X_i^{±1}` | match lines 3702, 3717, 3730 | none |
| 3b.1 `P^∨` formula | `c=(−1)^n q^{n(n+1)/2}e_n` | `c^{−1}X^nP(1/X)` has `X^j` coefficient `(−1)^j q^{−j(n+1)/2}e_{n−j}/e_n` | matches line 3750 | none |
| 3b.4, 3b.9 exponents | two-step filtration; twist sum | `(J₁∩J₂)^{2(d+1)}=0`; `(I₁+I_χ)^{4(d+1)−1}=0` | `2(d+1)`, `4(d+1)` as in Cor 5.2.6, Thm 5.3.1 | none |
| 3b.5 component count | `F=ℚ,n=1,p=3,S={3,7},K₇=1+7ℤ₇` | `(ℤ/7)^×/{±1}≅C₃`; `3a=1` impossible in `W(𝔽̄₃)` | holds | none |
| 3b.7 CM rank one | `q_v=7, P_v=1−7X` | `P^∨=1−X/7`; `Q_v=P^∨(7X)=1−X`; ambient `(1−7X)(1−X)` | holds | none |
| 4.2 Satake witness | `GL₂/ℚ`, `t=1+ℓ, d=1`; general blocks | `1−ℓ(1+ℓ)X+ℓ³X²=(1−ℓX)(1−ℓ²X)=P^{(1)}(ℓX)P^{(2)}(X)`; exponent `(n+1)/2−(n₁+…+n_{i−1})/2+c_i/2=(n_i+1)/2+c_i` | `P_v↦∏P^{(i)}(q^{c_i}X)` | none |
| 4.3 exponent | square-zero kernel `K` | `J^{2·max(4(d+1),N_∂)} ⊆ K² = 0` | holds | none |
| 4.4 kernel direction | `t` kills every `H^i(M/pᵐ)` | `H/pᵐ ↪ H^i(M/pᵐ)` ⇒ `t` kills `H/pᵐ` ∀m ⇒ kills `H=lim` | README direction right; Scholze's printed one reversed | none |
| 4.7 | `n=2,q=2,t=3,d=5` | `1−6X+40X²` | agrees with 3b.1 row | none |
| 4.8 | `{±1}`, `p=2`; odd `p` | `H¹(ℤ₂)=0`, `H¹(𝔽₂)=𝔽₂`, `H²(ℤ₂)=ℤ/2`, Bockstein iso; `0,0` | holds | none |
| 0.7 trace integrality | `ℤ_p[√p], f=p, I=p` | `tr(a+b√p)=2a`; `√p` not integral over `I` (`p∉I²`); `tr(pS)⊆2pℤ_p⊆I` | holds | none |
| 0.7 normality needed | cusp `ℤ_p[[t²,t³]]⊂ℤ_p[[t]]`, `f=t²` | `S[1/f]=R[1/f]`, `tr=id`, `tr(t)=t∉R` | negative control right | none |
| 0.7 integral closedness needed | `R=S=ℤ_p[[x,y]]`, `I=(x²,y²)` | `(xy)²∈I²`, `xy∉I` | right | none |
| 0.7 radical trace | `C⟨u⟩/C⟨q⟩`, `q=u^e` | `tr(u^k)=0` (`e∤k`), `eq^{k/e}` (`e∣k`), all in `(q)` | holds | none |
| 0.8 denominator | `ℤ_p[T]/(T^p−T−1)` | `e₁=…=e_{p−2}=0`, `e_{p−1}=(−1)^p` ⇒ `tr(T^{p−1})=p−1`; `f'≡−1` so étale | `(p−1)/p∉ℤ_p` | none |
| 0.8 constants | Cor 3.2.23 | step loss `p^{−(g²+g+1)ε/pᵐ}`, `C_m=Σ_{m'≥m}(g²+g+1)ε/p^{m'}→0` | README formula matches | none |
| 1.1 Lagrangian chart `{1,3}`, `g=2` | `span((1,0,0,1),(0,1,1,0))`; graphs `(1,a,0,b),(0,c,1,d)` | isotropy `1·1−1·1=0`, `p₁₃=p₁₂=1`; `bc−ad=1` ⇒ `p³−p` points vs `p³` | chart nonempty, not in the orbit | none |
| 1.1 lattice bounds | `L_fin=L_bdd`, then `pL_bdd` | `a=0,b=1`: `pL⊂L⊂p^{−1}(pL)` | holds | none |
| 2.2 almost faithfulness | `V=𝔽_p`; residue field | `p^{1/4}·p^{1/2}≠0` in `O_C/p`; `O_C/𝔪_C` killed by `𝔪_C` | holds | none |
| 2.3 sharpness | `𝔸¹_k`, `U=S∖{0,1}` | `H⁰(ℤ)=ℤ→ℤ²` diagonal, constant sheaf flasque ⇒ `H¹(j_!ℤ)=ℤ` | bound 1 sharp | none |
| 2.5 invariants | Hermitian symmetric `G` | `l₀=rk G(ℝ)−rk K_∞=0`, `q₀=dim_ℝX/2=d` | Scholze prints exchanged | none |
| 2.5 proof | `c` maximal vs minimal | maximal: a violating `H̃_k` (`k<i`) of codimension `c'<c` gives `E^{c'}` terms of codimension `<c`; minimal: all interfering terms have codimension `≥c+1` | README's choice needed | none |
| 2.6 initial topology | `ℤ→ℤ/2,ℤ/3`; `λ(t)=p`; `(p,1)` | opens `⊇6ℤ`, `4ℤ⊉6ℤ`; `t^r→0`; `(p^r,1)↛0` | holds | none |
| 3b.3 nilmanifold | `GL₃` Borel | Heisenberg, not a torus | holds | none |
| 3b.6 | `ℤ_ℓ`; `ℤ_p`; `ℤ/ℓ×ℤ_p`, `ρ̄` trivial | `H=G`; `H=1`; `H=ℤ/ℓ` | holds | none |
| 4.1 Tor | `ℤ/p²`, `k=𝔽_p` | periodic resolution ⇒ `Tor_a(k,k)=k` ∀a | holds | none |
| CLH correction | `GL₃/ℚ`, level 3, `p=5` | `Γ^{ab}=ℤ²⊕ℤ/3`, `H¹(Γ,𝔽₅)` dim 2; `∧¹(Lie U)^∨` dim 3 | CLH's `∧^j` formula fails for non-abelian `U` | none |
| Thm 5.1.2 segment | `|·|^{(1−ℓ_i)/2},…` | last exponent `(ℓ_i−1)/2`; printed `(ℓ_i−i)/2` | misprint | none |
| Remark 5.1.5 | `Π'=Π|·|^{(k+1−n)/2}` | `(Π'^∨)^c=Π'|·|^{n−1−k}`; printed `n+1−k` | misprint | none |
| 1.5 chain | Stacks tags | 01ZM, 01ZR, 05LY, 081F, 09MT descend; 0B91(2) perfect + base change; 0B5U | valid, flatness used twice | none |
| Lean padding | five theorems | `first | simp | simp_all | rfl | decide | exact?` fails on each | none padding | none |
| Lean binders | eleven `#check` | types equal README statements | no dropped hypotheses | none |

## Not verifiable

- Huber, *Étale cohomology of rigid analytic varieties and adic spaces*, Proposition 2.5.8: book, not read; not needed, since §2.3 gives the formal-model argument that Scholze offers as the alternative.
- Atobe–Gan–Ichino–Kaletha–Mínguez–Shin, arXiv:2410.13504v3 §§0.3–0.4: not opened; cited only for the status of the stabilisation behind `(EC)_r`, no mathematical dependency.
- Labesse's *Changement de base CM*, Pilloni–Stroh and Milne's canonical-model text: used only through the suppliers (EndoscopicTransferAndUnitaryTraceComparison §6.29, PerfectoidShimuraVarieties §3.9, AutomorphicBundles §11.18), whose statements were read; the primary texts were not re-read here.
- Caraiani–Le Hung page numbers were checked against the author PDF fetched this round (`1f9ef1c6…`); its published Compositio pagination was not available.

## Source issues

- **Misprint** in Scholze 2015 at Lemma 5.2.5(ii)–(iii), printed pp.1042–1043: the display ends the degree-`2n` ambient polynomial with a minus sign; it should be `+ q_v^n T_{2n,v} X^{2n}`, the product of two `(−1)^n` top coefficients; affects nothing.
- **Misprint** in Scholze 2015 at Theorem 5.1.2, printed p.1033: the last exponent of the segment is printed `(ℓ_i − i)/2`; it should be `(ℓ_i − 1)/2`; affects nothing.
- **Misprint** in Scholze 2015 at Remark 5.1.5, printed p.1034: the twisting character is printed `|·|^{n+1−k}`; it should be `|·|^{n−1−k}`; affects nothing.
- **Misprint** in Scholze 2015 at Corollary 4.2.3, printed p.1024: the parenthesis gives `l₀ = d` and `q₀ = 0`; for a Hermitian symmetric group it should be `l₀ = 0` and `q₀ = d`; affects nothing.
- **Error** in Scholze 2015 at the proof of Corollary 4.2.3, printed p.1024: the violating codimension is chosen maximal, and then terms of smaller codimension can interfere in the spectral sequence; it should be chosen minimal; affects the proof.
- **Error** in Scholze 2015 at the proof of Lemma 5.3.10, printed pp.1053–1054: the series `Q'` is expanded in powers of `X` with `S[T]` coefficients and `Q₀` is cancelled as an element of `S[T]`; the expansion must be in powers of `T` with `S[X]` coefficients, and the first-order index is off by one; affects the proof.
- **Error** in Scholze 2015 at the display before Lemma 5.3.12, printed p.1055: the inverse of `(1 − Ux)(1 − Uy)` is written with the factors in the same order; for noncommuting `x, y` the resulting element does not specialise to `1` at `U = 1`; the order must be reversed; affects the proof.
- **Gap** in Scholze 2015 at the proof of Corollary 5.2.6, printed p.1044: one auxiliary prime gives the exponent-`(d+1)` ideal and determinant only away from that prime, and "varying ℓ" is not spelled out; the stabilisation of the extended ideal over infinitely many primes in the finite Hecke image is needed; affects the proof.
- **Gap** in Scholze 2015 at the setup of Lemma 5.3.6, printed p.1050: the new prime is required only not to divide `[F̃:F]`; the proof also needs `I_{0,ℓ} = I₀` for the character family it uses; affects the proof.
- **Error** in Scholze 2015 at the proof of Corollary 5.4.2, printed p.1060: the containment of kernels is stated in the wrong direction; the true and needed statement is that the kernel of `T_{F,S} → ∏_m T_{F,S}(K,ξ,i,m)` lies in the kernel of `T_{F,S} → T_{F,S}(K,ξ,i)`; affects the proof.
- **Misprint** in Scholze 2015 at Corollary 5.4.4, printed p.1060: the characteristic identity is written for `σ_ψ`; it should be for `σ_𝔪`, with right-hand side in the local Hecke quotient; affects a stated result.
- **Misprint** in Scholze 2015 at Remark 5.4.5, printed p.1061: the simultaneous rings are written as images in direct sums; they should be images in products, and the proof printed after the remark is that of Corollary 5.4.4; affects a stated result.
- **Misprint** in Scholze 2015 at Lemma 5.2.2 and the paragraph before Lemma 5.2.3, printed pp.1038 and 1041: the spaces are indexed by the wrong symbols (`X^P_{X^P}`, `K^P_{K^P}`); they should read `X^P_{K_P} → X^M_{K^M_P}` and `X^M_{K^M} → X^P_{K^P}`; affects nothing.
- **Misprint** in Scholze 2015 at the §5.4 setup, printed p.1057: the sentence defining `K_S` repeats "is any compact open subgroup"; affects nothing.
- **Misprint** in Scholze 2015 at the proof of Theorem 4.1.1, printed p.1020: the first displayed limit runs over levels in `G(𝔸_f^p)`; the spaces are Siegel spaces, so it should be `G'(𝔸_f^p)`; affects nothing.
- **Misprint** in Scholze 2015 at the proof of Theorem 3.3.18(vi), printed p.1015: the open set `|h| ≤ |p|^{C+1}` is said not to meet the boundary; it does not meet the complement of the boundary, hence is contained in the boundary and empty; affects nothing.
- **Error** in Scholze 2015 at the paragraph on the Plücker charts, printed p.1008: `GSp_{2g}(ℤ_p)` is said to permute all the charts `Fℓ_J` transitively; only the `2^g` Lagrangian coordinate charts form one orbit (for `g = 2` the chart `J = {1,3}` has `p³ − p` special points against `p³`); affects nothing, since those charts cover.
- **Error** in Scholze 2015 at Remark 2.2.4, printed p.956: the map `R → S` to the universal perfectoid closed quotient is said not to be surjective in general; Bhatt–Scholze Theorem 7.4 shows it always is; affects nothing here; corrected in print at Bhatt–Scholze, *Prisms and prismatic cohomology*, Remark 7.5.
- **Gap** in Scholze 2015 at the proof of Lemma 2.1.1, printed p.954: the function `f` with `U_{J'} = {|f| = 1}` is derived from hypothesis (i) alone; it is the product of the ratios `s_j^{(i)}/s_i^{(i)}`, and its locus is identified by hypothesis (ii); affects the proof.
- **Gap** in Scholze 2015 at Corollary 5.1.11, printed p.1038: with weights `mk`, `k ≥ 1`, the first weight must lie in the range of Proposition 5.1.1, so the step satisfies `m > n` resp. `m ≥ n`; affects a stated result.
- **Error** in Caraiani–Le Hung at Remark 3.1, author PDF p.8: the local systems `R^jπ_*𝔽̄_p` of a boundary stratum are identified with `∧^j` of the adjoint representation on `Lie U` for every rational parabolic; for a non-abelian unipotent radical the nilmanifold cohomology is Lie-algebra cohomology, smaller than `∧^j` (Heisenberg lattice: `H¹` has rank 2, `∧¹` rank 3); affects the proof's description of the graded pieces, not the filtration bound.
