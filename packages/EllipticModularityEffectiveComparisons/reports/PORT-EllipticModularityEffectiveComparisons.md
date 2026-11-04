# PORT-EllipticModularityEffectiveComparisons

Branch `roadmap/elliptic-modularity-effective-comparisons`, head commit `5778fc4` (one commit on top of main `a0ad405`), message `EllipticModularityEffectiveComparisons: roadmap (README, Suggested.lean, metadata)`. The commit adds exactly `TauCetiRoadmap/EllipticModularityEffectiveComparisons/{README.md,Suggested.lean,metadata.toml}`; nothing outside the folder changed.

## Build

`lake build TauCetiRoadmap.EllipticModularityEffectiveComparisons.Suggested`, run from the pull-request worktree:

```text
⚠ [9205/9205] Built TauCetiRoadmap.EllipticModularityEffectiveComparisons.Suggested (7.2s)
Build completed successfully (9205 jobs).
```

Exit 0. Fourteen warnings, every one `declaration uses `sorry`` (the fourteen `sorry`'d theorems); no module-system notice on the roadmap's own file (the file carries the `module` / `public import` header with `@[expose] public section`, as `TauCetiRoadmap/CoboundaryExpansion/Suggested.lean` does on main), no other warning, no error.

## Gate

```text
gate EllipticModularityEffectiveComparisons: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0
OK
```

(`--order` pointed at the board's `merge-order/ORDER.txt`.) Before the commit the same run failed only on `dirty: ?? TauCetiRoadmap/EllipticModularityEffectiveComparisons/`.

Dependency direction, exact output of the required `--depcheck --movable` run on the ported README:

```text
depcheck: 235 roadmaps, 2060 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

Citation resolver on the ported README: "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None." (The two leads of the worker's `citations.md`, AlgebraicModularFormsAndSerreWeights R15.2 and R15.4, were label drift and are repaired, see below.)

## Draft pull request body

Starting from modularity of every elliptic curve over ℚ, this roadmap builds the effective comparisons between the residual torsion representation E[ℓ] and weight-two newforms that the Diophantine applications need: Martin's exact trivial-character newspace dimension with its sharp bound 12g(N) ≤ N+1 and the complete equality list, Bennett–Siksek's removed-multiplicative-prime bound ℓ ≤ (√p+1)^((M₀+1)/6), Kraus's exact thresholds F, G, H with his finite-prime recognition of rational coefficients, the ideal-valued Sturm theorem and the prime-power coefficient congruence, the exact-conductor comparison curves with rational and with full rational two-torsion, Mazur's prime-degree and Mazur–Kenku's composite cyclic-isogeny classifications with the two uniform irreducibility bounds (ℓ ≥ 11 with a rational two-point, ℓ ≥ 5 with full two-torsion), and Lemos's theorem that a non-CM curve with a nontrivial rational cyclic isogeny has surjective mod-p image for every prime p > 37, through Serre's inertia bound, Bilu–Parent–Rebolledo's split-Cartan exclusion, the Darmon–Merel winding quotient on the mixed Cartan curves and the finite integral j-lists. The six layers keep the general statements (wild conductor contributions, coefficient primes dividing the level, dyadic phenomena, every embedding of the coefficient field, geometric non-CM) rather than the numerical majorants, so that the thresholds are the sharp ones. `Suggested.lean` states the fourteen headline theorems that are statable at the pins against Tau Ceti's newspace, newform, torsion-action and isogeny APIs, with the nine simple definitions they need; the removed-prime exponent bound, the two Kraus realization theorems, the split-Cartan rational-point theorem, the exceptional-prime point exhaustions, the mixed winding quotient and the quantitative isogeny bound are README targets because the elliptic conductor, Serre weight, modular curves, Jacobians and the stable Faltings height have no carrier at the pins.

## Suppliers that are still pull requests

EllipticCurveModularity, SerreWeightAndLevelOptimisation, ArithmeticGaloisRepresentations, NeronModelsAndSemistableAbelianVarieties, HeightsRationalPointsAndObstructions, ModularCurvesPartII, AlgebraicModularFormsAndSerreWeights, AutomorphicGaloisRepresentations, DeligneWeightsAndPurity, EisensteinIdealAndRationalTorsion, ComplexMultiplicationAndExplicitReciprocity, ModularSymbolsPadicLFunctions, EulerSystemsAndKolyvaginSystems, ArakelovGeometryAndAbelianHeights, FaltingsFinitenessAndIsogenyTheorems, FiniteFlatGroupsAndIntegralPadicHodgeTheory. All sixteen are earlier than this roadmap in the merge order (lines 42–155 against 265). On main: ModularForms, EllipticCurves, ImaginaryQuadraticClassNumber, ClassFieldTheory; completed: Chebotarev. Every cited section label was checked against the supplier's head (or main): EllipticCurveModularity R29.1, R29.3–R29.6; SerreWeightAndLevelOptimisation §§2.8, 4.8, 6.1–6.3; ArithmeticGaloisRepresentations §§2.3–2.4, 3.1–3.6, 4.2–4.5, 5.1, 6.1–6.4; NeronModelsAndSemistableAbelianVarieties §§5.2, 5.3h, 5.4, 6.4d; HeightsRationalPointsAndObstructions §§1.4–1.7, 1.13–1.15, 1.15b, 1.18, 1.19; ModularCurvesPartII §§3.8, 4.1–4.2, 4.8, 5.2, 5.5, 9.1, 9.5–9.7, 10.1–10.3, 13.1–13.3, 14.11–14.12, 14.15, 16.2–16.6, 17.3; AutomorphicGaloisRepresentations §§6.1, 6.4; DeligneWeightsAndPurity Layer DWP.1 §§1.1–1.4; EisensteinIdealAndRationalTorsion §§2.3, 6.3–6.4, 7.8, 7.9, 8.9; ComplexMultiplicationAndExplicitReciprocity §§3.1, 5.1–5.5; ModularSymbolsPadicLFunctions §§0.6–0.8, 1.1–1.2; EulerSystemsAndKolyvaginSystems §§4.7, 5.13; ArakelovGeometryAndAbelianHeights §§1.12, 4.4, 5.9; FaltingsFinitenessAndIsogenyTheorems §§R28.4.5–R28.4.7; FiniteFlatGroupsAndIntegralPadicHodgeTheory Layers R07.1, R07.5; ImaginaryQuadraticClassNumber H1.1–H1.4, H3.2, H3.5, H3.6; ClassFieldTheory Layer 13 (`narrowHilbertClassField`, `gal_rayClassField_equiv_rayClassGroup`); ModularForms Layers 0–10, 8G, 10C and the Layer 4 "Bad-prime eigenvalues" item; EllipticCurves Layers 1–7; Chebotarev Layer 10. All found.

Pinned declarations named in the supplier contracts were opened at the pins (Tau Ceti `358314d`, Mathlib `f6090c7`): every `TauCeti.*` module imported by `Suggested.lean` exists, and `cuspFormsNew` (Newforms/Basic.lean 202), `cuspFormCharSpace` (DiamondOperators.lean 279), `modFormCharSpace` (315), `cuspFormsNew_inf_cuspFormCharSpace` (Nebentypus.lean 161), `cuspFormCharSpaceOneEquiv` (TrivialNebentypus.lean 220), `ModularForm.eq_of_sturm_bound` (SturmBound.lean 102), `HeckeRing.GL2.Newform` (Newform.lean 104), `torsionGaloisAction` (Point/Galois.lean 64), `Isogeny` (Isogeny/Basic.lean 139), `Isogeny.degree` (Degree.lean 94), `Isogeny.ker` (Kernel.lean 75), `Isogeny.map` (BaseChange/Basic.lean 212), `Isogeny.Hom` (Hom/Basic.lean 106) are there; on the Mathlib side `Nat.prod_factorization_pow_eq_self` (Factorization/Defs.lean 96), `moebius_apply_prime_pow` (112), `moebius_mul_coe_zeta` (156), `sigma_zero_apply` (Misc.lean 178), `totient_eq_mul_prod_factors` (Totient.lean 313), `norm_eq_prod_embeddings` (Transitivity.lean 261), `isIntegral_norm` (211), `norm_ne_zero_iff` (Norm/Basic.lean 110), `absNorm_mem` (AbsNorm.lean 329), `absNorm_dvd_norm_of_mem` (396), `coe_norm_int` (NumberField/Norm.lean 38), `card_algHom_le_finrank` (Finite/Matrix.lean 91), `Representation.IsIrreducible` (Irreducible.lean 29), `toZModLinearMap` (ZMod.lean 81), `torsionBy.zmodModule` (Torsion/Basic.lean 1010), `exists_ideal_in_class_of_norm_le` (ClassNumber.lean 77). No supplier replacement of a restated declaration was needed: the package already cites the pinned names and restates none of them.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already satisfies the acceptance-test rule (fourteen headline theorems, nine definitions with real bodies on native carriers, no API lemmas, no examples, no sorry'd data, no `set_option`), so it was kept apart from the header repair: the only change is the line `@[expose] public section` after the module docstring, so that the declarations are visible to importers (the package file had `module` and `public import` but no public section). The signature check was done: a scratch file with `#check @name` for all 24 declarations elaborated with `lake env lean` from the worktree (exit 0, no error), and each elaborated type equals the one in the worker's `signatures.md` and the corresponding README statement; no binder was lost, nothing changed.

## README edits in the port

- Gap tags rendered as supplier contracts, in the form of the recent ports: the "What X must provide (gap:slug):" headers became "What X must provide (the <name> contract):", and every `gap:slug` in Needs lines, routes and Dependencies became "the <name> contract". Slug → contract name: `optimized-elliptic-weight-two` → the optimized elliptic weight-two lift contract (SerreWeightAndLevelOptimisation); `weight-two-local-reduction` → the weight-two local reduction contract (SerreWeightAndLevelOptimisation); `mixed-cusp-charts` → the mixed cusp-chart contract (ModularCurvesPartII); `chen-winding-comparison` → the Chen winding comparison contract (ModularCurvesPartII); `positive-characteristic-support` → the positive-characteristic support contract (AlgebraicModularFormsAndSerreWeights); `all-embedding-frobenius` → the all-embedding Frobenius contract (AutomorphicGaloisRepresentations); `modular-rank-zero` → the modular rank-zero contract (EulerSystemsAndKolyvaginSystems); `quantitative-abelian-periods` → the quantitative abelian periods contract (ArakelovGeometryAndAbelianHeights). These are the eight `conditional_gaps` of `review.json`, with the same slugs.
- Label drift repaired: AlgebraicModularFormsAndSerreWeights has no "R15.2" or "R15.4" at its head (#928); its layers are numbered 1–7. "R15.2" (integral q-expansion and Hecke action) now cites Layer 2, §§2.1–2.2, 2.5, 2.7–2.8 (q-expansion principle, strong q-expansion principle, integral geometric Hecke operators, ring-valued eigensequences, integral cusp lattice); "R15.4" (extension-sensitive finite-flat weight recipe) now cites Layer 4, §§4.3, 4.6–4.7, 4.9 (extension-sensitive wild weight table, Raynaud input, finite flatness and peu ramifiée extensions, weight-two criterion). Seven occurrences (supplier contract, §§3.7a, 3.8, 3.9, 3.10, 3.18, 5.15 Needs and the Layer 3 Dependencies).
- The ninety "Work under the following standing conditions for this assertion: …" field lines became prose ("Throughout this subsection, …", with the seven that were bare labels rewritten as sentences, e.g. §0.10 "N is composite with 1<N≤1521 and ω(N)≤2"); the eight "The required API is:" became "Its API includes the following facts."; the Scope opening "This Part II continues EllipticCurveModularity" became "This roadmap continues EllipticCurveModularity" (the roadmap's name is not a Part II); the Layer 3 Dependencies "Chebotarev; the exact optimized-lift and local-reduction contracts" now names Chebotarev Layer 10 and the two contracts; the References preamble no longer refers to `sources.toml`, which is not part of the roadmap folder.
- Nothing else changed: every target, hypothesis, locator (page, theorem and extraction-line locators alike), API bullet, Check, Example and Dependencies list of the package is in the ported README. No mathematics was lost or added.

## Duplication sweep and ownership

Swept by object with `roadmaps grep` over main and the 453 open heads after the edits (Martin's newspace dimension, Kraus's thresholds and realizations, Mazur's and Kenku's degree lists, Lemos's theorem, the split-Cartan exclusion, the winding quotient, Bilu–Parent), and read the hits. Removals: none.

- **EllipticCurveModularityPartII (open #1491, same author, head d2cbd93 of 2026-11-03) plans the same six results** — Martin's table and bound, the Kraus thresholds, the removed-prime bound, the Kraus realizations, the uniform irreducibility bounds and Lemos's theorem, under its own layer numbering (its Layers 1–6), with overlapping Lean names (`localTerms`, `martinValue`, `newDimension`, `GeometricTorsion`, `torsionModule`, `torsionRepresentation`, `cyclic_isogeny_degrees`, `lemos_surjectivity`, …) in a different namespace. The accepted review (REV~4) and the repair reports settled this as "not actionable in this package: the maintainer must resolve the duplicate sibling", at a time when the merge order listed this roadmap (line 188) before that one (189). **The board's merge order now lists EllipticCurveModularityPartII at line 183 and this roadmap at line 265**, so under the ordering rule the sibling would be the owner and this roadmap would have to import rather than plan; its head also says "Its generic comparison contract is named EllipticModularityEffectiveComparisons; Layers 1–6 provide those comparisons", and AdelicImagesAndModularCurves (#1727, another author) consumes Mazur's and Kenku's theorems from "EM2 §§5.0a–5.0b" (EllipticCurveModularityPartII). I kept the accepted package's full scope, as the review decided, because deleting Layers 0–5 in favour of the sibling would void the accepted package and is the maintainer's decision; the README's Downstream consumers paragraph records, as the package did, that ErdosProgressionPowers cites EllipticCurveModularityPartII for EC.0–EC.5. The depcheck reports no problem because the README never cites EllipticCurveModularityPartII as a supplier. **This is unresolved and needs the maintainer**: either EllipticCurveModularityPartII is withdrawn or trimmed to import Layers 0–5 here (and ErdosProgressionPowers and AdelicImagesAndModularCurves repointed), or this roadmap is withdrawn.
- ErdosProgressionPowers, the named consumer, is at merge-order line 184, earlier than this roadmap (265); a consumer earlier than its supplier. Same root cause.
- EffectiveDiophantineMethods §6.31 (merge order 162) uses Bilu–Parent–Rebolledo's split-Cartan theorem for ℓ > 7, ℓ ≠ 13 as a declared input hypothesis, not as a target; §5.7 here (p > 11, p ≠ 13) is the owner of that theorem and could supply it. No edit made there.
- RankZeroOneBSDPartII's "rational cyclic isogeny of prime degree" hits are its Euler-system hypotheses, not a classification; AdelicImagesAndModularCurves consumes the classifications (from the sibling, see above) and plans none of them; "Kraus" on main is the c₄, c₆ integral-model criterion of EllipticCurves; HilbertModularForms and ModularForms (#1706) mention newspace dimensions in other settings.
- Ownership was checked against the open heads indexed by the tooling (2026-11-04T22:35:25Z); open pull requests outside that index were not checked.

## Adversarial pass (computed)

All computations were redone from scratch in a Python script in the job's scratch directory; the newspace comparator is the Γ₀(N) genus formula 1 + I/12 − ν₂/4 − ν₃/3 − cusps/2 inverted by the Möbius square, independent of the five-factor table.

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| §0.1 `localTerms`, junk branches | (0,0), (2,2), (3,2), (2,3), (4,1), (4,0) | (1,1,1,1,1); (1/4,0,−1,1,0); (5/9,1,1,−1,0); (3/8,0,1,0,0); (0,0,0,0,0); (1,1,1,1,1) | Lean body and README table agree; exponent 0 precedes primality. No change. |
| §0.2/§0.5 `martinValue` = newspace dimension | all 1 ≤ N ≤ 800 against Σ_{d|N}(μ∗μ)(N/d)g₀(d) | 0 mismatches; N = 0,1,11,30,35,64,154 ↦ 0,0,1,1,3,1,5 while g₀ = −,0,1,3,3,3,21 | Newspace, not full space. No change. |
| §0.8 prime levels | p = 2,3,5,7,13 | martinValue = 0,0,0,0,0; 12g(11)=12=p+1, 12g(23)=24 | p ≡ 11 mod 12 criterion holds. No change. |
| §0.16 `martin_sharp_bound` | all 1 ≤ N ≤ 20000 | 0 failures of 12g ≤ N+1; equality set = {35} ∪ {p prime, p ≡ 11 mod 12} exactly (567 levels) | Both directions of the iff. No change. |
| §0.7 coarse bound | N ≤ 5000 | 0 violations of 12g ≤ φ(N)+7·2^ω+12 | No change. |
| §0.9/§0.10 | composite, ω ≤ 2: N in (1521, 20000] and N ≤ 1521 | 0 nonstrict cases above 1521; below, equality only at 35, 0 violations | Cutoff 1521 = 39² exact. No change. |
| §0.11, §0.12, §0.13/§0.14 | p⁶ | N (N ≤ 20000); ω ≥ 3 with two primes > 5; gcd(N,6) > 1 with a prime > 41 | 0 violations of N−6, N−9, N respectively; 505 levels below 1548 in the last family | No change. |
| §0.15 residual family | all tuples | 11250 tuples, 10125 distinct levels, min(N−12g) = 18 | No change. |
| §0.6 V∞ ≤ √N | N = 4, 16, 49 | V∞ = 0, 1, 5 against 2, 4, 7 | No change. |
| §1.1/§1.3 | p=1,c=2,s=1; K=ℚ(√2), c=√2 and c=100−70√2 | α = 0 at the forbidden p = 1; Norm(3−√2) = 7 ≤ (√2+1)⁴ ≈ 33.97; Norm(3−(100−70√2)) = −391, |−391| > 33.97 with one embedding ≈ 1.005 | All-embedding hypothesis necessary. No change. |
| §§2.1–2.3 thresholds | N = 1, 4, 11, 35 | (I, g, F, I(lcm), G, H) = (1,0,1,6,4,4); (6,0,1,6,4,4); (12,1,3+2√2≈5.83,72,13+4√3≈19.93,G); (48,3,(1+√8)⁶≈3148.6,288,≈62.86,F); I(16)=24 gives 9 | lcm versus 4N and max versus product separate. No change. |
| §3.7 filters | (3,1,−1) | p+1−a = 5 | No change. |
| §3.8 odd Eisenstein series | n = 1..12 of S(q)−3S(q²)+2S(q⁴) | 1,0,4,0,6,0,8,0,13,0,12,0 = odd part of σ₁; quasimodular weights 1−3/2+2/4 = 0 | Holomorphic, matches. No change. |
| §3.15/§3.16 | y²=x³−x over 𝔽₃, 𝔽₅; y²=x(x²+2) over 𝔽₅ | 4, 8 points (both ≡ 0 mod 4); 2 points, 4 ∤ 2 | Both-nonsquare case refutes four-divisibility. No change. |
| §4.3 Frobenius recurrence | q = 3, a ∈ [−3,3]; q = 5 | A₁₂ ∈ {658, −1358, 1458}; a = 0,1,2,3 ↦ 1458,−1358,658,1458; A₁=1, A₂=−5 at a=1; q=5: {−28334,−25774,23506,31250} | Sign of the recurrence pinned; −1458 absent. No change. |
| §4.4/§4.5 prime lists | 1+3¹²−A, 3⁴+3⁸−A | 530784=2⁵3²·19·97, 532800=2⁶3²5²·37, 529984=2⁶7²13² → {2,3,5,7,13,19,37,97}; q=5 union {2,3,5,7,13,17,31,37,61,157,229}; 5984=2⁵·11·17, 8000=2⁶5³, 5184=2⁶3⁴ → {2,3,5,11,17} | Mazur's lists reproduced. No change. |
| §4.6 Minkowski | r = 11,19,43,67,163 | 2√r/π ≈ 2.11, 2.77, 4.17, 5.21, 8.13 < r/4 = 2.75, 4.75, 10.75, 16.75, 40.75 | No change. |
| §4.8 minimal levels | Mazur's 17 entries | {14,15,20,21,24,26,27,32,35,36,39,49,50,65,91,125,169} | Equal to the README set. No change. |
| §4.9 cusp counts | d = 14, 20, 27 | 4, 6, 6 geometric cusps (2 rational at 27) | 6−4=2, 6−6=0, 3−2=1 as stated. No change. |
| §4.22 negative control ℓ = 3 | y²=x(x+5)(x+32), P=(4,36) | 36² = 4·9·36; tangent slope 7; x(2P) = 49−37−8 = 4 | 2P = −P, order 3, E[3] reducible. No change. |
| §5.0 group orders | p = 11; p = 41 | 2(p−1)² = 200, 2(p²−1) = 240, |GL₂(𝔽₁₁)| = 13200; (41−1)/4 = 10 > 5 | No change. |
| §5.0 11a1 | Δ, j | Δ = −161051 = −11⁵, j = −122023936/161051 nonintegral; #E(𝔽₂) = 5, a₂ = −2 | Non-CM Check and §5.25a Check agree. No change. |
| §5.1 CM values | r = 19,43,67,163 | (−96)³ = −884736; (−960)³ = −884736000; (−5280)³ = −147197952000; (−640320)³ = −262537412640768000; numerators of (r−1)/12 at 43,67,163 are 7, 11, 27 | No change. |
| §5.3a | d = 1, 2 | 10⁷·985² = 9702250000000; √(4·10⁷)(985+4 log 2) ≈ 6247222 < 6895000; (10⁷+i) has degree 10¹⁴+1 > 4·10⁷·989² = 39124840000000 | Non-CM needed for the cyclic corollary. No change. |
| §5.3c Runge | p = 5, 17 | 48.033, 83.790 | No change. |
| §5.4a | p = 17, D = 51, 12 | H₋₅₁ ≡ X²+X+13 = (X−8)² mod 17; H₋₁₂ ≡ X−8; (−11) ≡ 5 mod 8 so 2 inert in ℚ(√−11) | No change. |
| §5.12 | p = 11, 3 | |PSL₂(𝔽₁₁)| = 660, |PSL₂(𝔽₃)| = 12 | No change. |
| §5.15 | p = 11 | 2p−1 = 21 > 13 | No change. |
| §5.19/§5.22 j-numerators | r = 2,3,5,7,13 | degrees 3,4,6,8,14, monic, constants 4096,729,125,49,13, signed divisors 26,14,8,6,4, distinct j-values 25,13,8,6,4; r=2: t=8,−64 ↦ 1728, t=−16 ↦ 0, t=1/2 ↦ 35937/4; r=5: t=−1 ↦ 64; r=13 set = {−2⁶3²·4079³, 576, 2¹²3³·19, 2¹²3³·19·991³} | Collision 8/−64 confirmed; sets as stated. No change. |
| §5.25 | r = 11, 17, 37 | −24729001, −32768, −297756989/2, −882216989/2¹⁷, −162677523113838677, −9317 | Values as stated. No change. |
| Lean generality versus README | all 14 headlines | elaborated types (`#check`) carry `[E.IsElliptic]`, the prime binder, the cutoffs 11 < p ∧ p ≠ 13, 37 < p, 11 ≤ ℓ, 5 ≤ ℓ, `GeometricallyNonCM`, `1 < n` exactly as the README states | No binder lost. No change. |

No statement was found false or vacuous; nothing in the mathematics was changed.

## Unresolved

- The EllipticCurveModularityPartII duplicate and the merge-order inversion (this roadmap after its named consumer ErdosProgressionPowers and after the sibling that plans the same results), above. Only the maintainer can settle ownership.
- The six Kenku sources (`kenku-1979`, `kenku-1980a`, `kenku-1980b`, `kenku-1981`, `kenku-169-corrigendum`, `kenku-1982`) remain cited by published locator only, as the accepted review left them.
- The extraction-line locators ("kraus-1997 line 294") were kept, as the SheafConvolutionOnAbelianVarieties port keeps them; the References preamble says what they refer to. If upstream prefers page and theorem locators only, the deletion is mechanical (123 occurrences).

Suspicious text: none. No fetched or pull-request text asked for any action.


Pull request: #1810 (roadmap/elliptic-modularity-effective-comparisons at 5778fc4)
