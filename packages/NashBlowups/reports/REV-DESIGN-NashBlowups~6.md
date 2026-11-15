<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13795#issuecomment-6895137646 -->
Review (claude) of b70f2a2

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) A Check of the normalised universal property fails in dimension zero

   **Location:** `packages/NashBlowups/design/README.md:1214`: “A closed point `Spec k → X_sm` does not map a generic point to a generic point; it still factors … but is outside the hypotheses”. Also `packages/NashBlowups/design/plan.json`, target 6.2, test `lift_closed_point`.

   **Claim:** For every `X` in the Setting a closed point of `X_sm` violates the generic-point hypothesis of §6.2.

   **Witness:** `d = 0`, `X = Spec k` (in the Setting, §2.1 Check 4): the only closed point is the generic point, `Spec k → X_sm` is the identity, the hypothesis holds and the lift is the identity of `X̄* = X`.

   **Repair:** In both files write “For `d ≥ 1`, a closed point `Spec k → X_sm` …”. Tested: for `d ≥ 1` every irreducible component of `X` has dimension `d ≥ 1`, so its generic point is not closed and the image of `Spec k` is not generic; `d = 0` is excluded by the new hypothesis.

2. **F02** (P3) Seven SchemeAndStackFoundations names are now pinned Tau Ceti declarations under other names

   **Location:** `packages/NashBlowups/design/README.md:226–239` (the contract `From TauCetiRoadmap.SchemeAndStackFoundations`), e.g. “§0.17 `bijective_of_depth`: a linear map `M → N` with `M` finite is bijective if …”; also lines 45–48 (Scope).

   **Claim:** The code-spanned names are declarations of SchemeAndStackFoundations, with the stated hypotheses.

   **Witness:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:1071–1073`, `:1788`, `:2184–2187`, `:7016–7021` (main): these names “resolve to” Tau Ceti declarations; `TauCeti/RingTheory/Depth/Bijectivity.lean:120` has no finiteness hypothesis on `M`.

   **Repair:** The citations stay valid through the supplier's own mapping, so nothing breaks; move these to `From Tau Ceti` under their pinned names, keeping the section references:

   | README name | Pinned declaration (file, line) |
   |---|---|
   | `dimension_theory_finiteType`, `topologicalKrullDimAt_eq_stalk` | `TauCeti.AlgebraicGeometry.topologicalKrullDimAt_eq_ringKrullDim_stalk_add_toNat_trdeg_residueField`, `topologicalKrullDimAt_eq_iSup_toNat_trdeg_residueField`, `topologicalKrullDim_closure_singleton_eq_toNat_trdeg_residueField` (`TauCeti/AlgebraicGeometry/Scheme/LocalDimension.lean:105`, `:168`, `:76`) |
   | `bijective_of_depth` | `LinearMap.bijective_of_depth` (`TauCeti/RingTheory/Depth/Bijectivity.lean:120`); drop “with `M` finite” |
   | `universalHomeomorphism_criteria` | `isUniversalHomeomorphism_iff_isIntegralHom_universallyInjective_surjective` (`TauCeti/AlgebraicGeometry/Morphisms/UniversalHomeomorphism.lean:162`) |
   | `IsNormalScheme`, `IsNormalScheme.isDiscreteValuationRing_stalk` | `TauCeti.AlgebraicGeometry.IsNormalScheme` (`TauCeti/AlgebraicGeometry/Scheme/Normal.lean:84`, `:203`) |
   | `IsModification` | `TauCeti.AlgebraicGeometry.IsModification` (`TauCeti/AlgebraicGeometry/Morphisms/Modification/Basic.lean:53`) |
   | `serre_normality_criterion` | `TauCeti.forall_isDomain_and_isIntegrallyClosed_iff_satisfiesSerreR_one_and_satisfiesSerreS_two` (`TauCeti/RingTheory/SerreCondition/Normal.lean`) |
   | *IsRegular.isNormal* | `TauCeti.AlgebraicGeometry.IsRegular.isNormal` (cited at `SchemeAndStackFoundations/README.md:2697`) |

   *IsModification.Witness* and *IsRegular.isNormal* are set in italics, which the Conventions (line 114) reserve for this roadmap's own names: set them in code. `field_extension_descent` (§0.11) and *regularLocus_eq_smoothLocus* (§4.13) remain SchemeAndStackFoundations targets and stay as they are. Tested on the instance: step 4 of §5.3 applies the depth lemma with `N = F_*R`, whose finiteness is not needed by the pinned statement; no statement of this roadmap changes.

Two findings, both P3; no P1 or P2. Each carries a repair to the design text, so the verdict asks for changes. The five findings of round 5 are all repaired. No design file and no manifest entry was changed by this review. No supplier gap is declared (`plan.json` `gaps: []`, README line 268).

## Verified sound

**Previous review, finding by finding (REV-DESIGN-NashBlowups~5).**

- **F01 (P3), repaired.** README 582–587: “For `X` smooth over `k` of relative dimension `r ≥ 2` … For `r = 1` the maximal ideal of `O_{X,p}` is invertible, so `Bl_p X = X` and `q = h` is the identity”. Plan test `lift_blowup_not_terminal` matches. Recomputed: `𝔸²` at the origin, fibre `ℙ¹`; `𝔸¹`, `(x)` invertible.
- **F02 (P3), repaired.** README 784: “*NashIterationResolves* holds for `X` and `d` iff …”; 795: “the iteration with `d = 2` resolves `X` although the iteration with `d = 1` does not”; 1311 likewise. Script over the README: 54 italic names, none occurs in a code span.
- **F03 (P3), repaired.** README 980: “`(x²)` is not `∂`-stable (`∂(x²) = 2x ∉ (x²)`), so its non-stable minimal prime `(x)` is no counterexample”. Recomputed: least-degree element of degree `n` has `n`-th derivative `n!·a_n`, a unit of `ℚ`.
- **F04 (P3), repaired.** README 319–332 defines `b_{g'} = e ∘ c_{g'} : g'*Ω_{X/R} → Ω_{X'/R'}` and proves that it is an isomorphism; three Checks added (339–350). Recomputed below.
- **F05 (P3), repaired.** Headings `### 0.5`, `### 0.6` (README 420, 440); plan ids 0.1–0.6 contiguous, every `target:` prerequisite resolves; `sources.toml` `cited_for` of `stacksVarieties` and `stacksAlgebra` read §0.5 and §0.6. Every remaining “§0.7” in the README (12 places) is SchemeAndStackFoundations §0.7.

No repair was marked not actionable; nothing is re-raised. No maintainer notes were supplied.

**Adversarial pass.** Every statement of Layers 0–7 was recomputed this round (the table shows the sampled targets, the headlines, the repaired passages and the targets the findings touch). `C_p` is the cusp `y² = x³` in characteristic `p`.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 0.1 comparison map | `t ↦ (t², t³)` char 0, char 2; identity; `Spec k → 𝔸¹` | `dx ↦ 2t dt, dy ↦ 3t² dt`; `0, t² dt`; `dx ↦ dx`; `k·dx → 0` surjective, not injective | sound |
| 0.2 `b_{g'}` (F04) | `k → k(s)`, `X = Spec k`; `𝔽_p(t) → k(τ)`, `K = k[y]/(y^p − t)`; `ℤ → 𝔽₂`, `𝔸¹`; `R' = R` | `c: 0 → k(s)ds`, `b: 0 → 0`; `A' = k'[u]/(u^p)`, `Ω_{A'/k}` free on `dτ, du`, `c(dy) = dτ + du`, `b(dy) = du` generator; `dT ↦ dT`; identity | iso; target over `R'` pinned |
| 0.3 smooth locus of dimension `d` | `𝔸² ⊔ 𝔸¹`; `C_0`; `Spec k[ε]/(ε²)`, any characteristic | `(𝔸², 𝔸¹, ∅)` for `d = 2, 1, 0`; complement of origin; fibre of `Ω` has dimension 1, `X_sm = ∅` | rank alone is not the definition |
| 0.4 Grassmannian along a surjection | `O² → O`, `r = 1, 2`; identity | section `[1 : 0]` of `ℙ¹_S`; `∅ ⊂ S`; identity | sound, no Noetherian input |
| 0.5 smooth iff regular at closed points | `C_p`; `𝔸ⁿ`; `Spec 𝔽_p(t^{1/p})` over `𝔽_p(t)` | embedding dimension 2 > 1; regular; regular, `Ω ≠ 0`, not smooth | perfectness needed |
| 0.6 normal base change | `ℚ(i) ⊗ ℚ(i)`; `x^p + y² + t`, `k' = k(t^{1/p})`; `k(s)[y]` | `ℚ(i)²`; `u^p + y² = 0`, `(−s²)^p + (s^p)² = 0` for odd `p`, cotangent dimension 2; PID | separability needed |
| 1.2 / 1.3 (F01) | `O ⊕ O/(x)` on `𝔸¹`; `(x, y)` on `𝔸²`; two quotients `M, M'` on reduced `Z`; `Bl_p` for `r = 0, 1, 2` | `N = 𝔸¹` at `[1 : 0]`, fibre of `Gr` is `ℙ¹`; `N = Bl₀𝔸²`; `ker M → M'` vanishes on a dense open, so is 0; `∅`, identity, fibre `ℙ¹` | sound |
| 1.4 Plücker form | `r = 0`; `r = 1`; rank 2 in `O⁴` | `∧⁰F = O`, both sides `X`; identity; six minors, `∧²` of the identity quotient is the identity quotient of `∧²F|_U` | sound |
| 1.5 base change | flat `g` from reduced `X'`; `{0} → 𝔸²` | generic points go to generic points, so `g⁻¹(U)` is dense automatically; `ℙ¹` versus `∅` | sound (density is implied by flatness; harmless) |
| 2.1 definition | `C_0`; node; `Spec k`, `d = 0` | `k[t]²/t³(−3t, 2) ≅ k[t] ⊕ k[t]/(t³)`; branches `[1 : 0]`, `[0 : 1]`; `X` | sound |
| 2.2 modification | `C_0`; `y² = x²z`, char `≠ 2`; smooth | finite, not iso; charts of `Bl_{(y, xz, x²)}`: `k[x, u/x]`, `k[u, x/u]`, so `X* = Bl₀𝔸²`, fibre `ℙ¹` | proper, not finite |
| 2.4 universal property | `Bl₀𝔸² → 𝔸²`; `C_0`; one line of `𝔸¹ ⊔ 𝔸¹` | classifying map `π`, not closed; `t ↦ (t², t³, [1 : 3t/2])` closed; closed immersion, lift not onto; in general `q(X₁) ⊇ ν⁻¹(X_sm)` closed and dense | iff needs surjectivity, stated |
| 2.5 headline | `C_2`, `C_3`, `C_0`; `d = 0` | relation `x² dx`, quotient `(0, 1)`; relation `2y dy`, quotient `(1, 0)`; `b = (3t/2)a` in `k[[t², t³]]` forces `a, b` non-units; zero quotient always exists and `X` is smooth | iso: yes, yes, no, yes |
| 2.7 iteration (F02) | `C_0`; `C_2` with `d = 1, 2`; `𝔸²`, `d = 1` | `X^{(1)} = 𝔸¹`; all iterates `C_2`; `X_sm^{(2)} = ∅`, `X^{(1)} = ∅` smooth; `∅` | junk value pinned by Check |
| 3.2 blowup | `dx ↦ x` on `𝔸¹`; `I = 0`; `C_0`, `I = (y, x²)`; density | `Bl = 𝔸¹`; `Bl = ∅ ≠ X*`; charts `k[t²,t³][x²/y] = k[t]`; `Bl ∖ E ≅ X ∖ V(I) ⊇ X_sm ∖ V(I)` dense | sound |
| 3.3 hypersurface | signs for `n = 2`; `(n, f) = (0, 0), (1, x_1)`; `x^p − y^q`, `(2, 3), (3, 2), (p, 1)` | `dx ↦ −f_y`, `dy ↦ f_x`; `∅ ≠ Spec k`, both `Spec k`; `J = (y²), (y), (1)` | `n ≥ 1` needed |
| 4.1 coordinates | `k[x, y]_{(x,y)}`; `C_3`; `𝔽_p(t)[x]_{(x^p − t)}` | `∂/∂x_i`; `ker q = (R/y)·dy`; `d(a(x^p − t)) = (x^p − t)da` | separability needed for `x_j ∈ m` |
| 4.2 Lie derivative | `d/dx`; `x d/dx`; `k[x]/(x²)`, char `≠ 2` | `L(x dx) = dx`; `L(dx) = dx`; `L(x dx) = 2x dx = 0` | well defined |
| 4.3 Seidenberg (F03) | `ℚ[x]`, `(x²)`; `ℚ[x, y]`, `(y²)`; `𝔽_p[x]`, `(x^p)` | not stable; `(y)` stable; `(x^p)` stable, `(x)` not | `ℚ ⊆ R` needed |
| 4.4 free quotient forces smoothness | `d = 0`; stable prime of `k[X_1..X_d]`; `C_0`; `C_2` | `M = Ω`, minimal prime `P` has `T_P = 0`, so `Ω = 0`; contraction 0, `trdeg κ(P) ≥ d`; no quotient; quotient and singular | characteristic 0 needed |
| 4.5 headline | point; `C_0`; node; `C_2` | (smooth, iso) = (T, T), (F, F), (F, F); (F, T), excluded | sound over every field of characteristic 0 |
| 5.1 operators | `p = 2, d = 1`; `d = 0`; `C_3`; general entry | `φ_0 = id − x∂`, `φ_1 = ∂`; identity; orders of `Σ r_i³x^i` lie in `{3a, 3a+2, 3a+4}`, `a ∈ {0, 2, 3, …}`, never 3; `binom(β, α)x^{β−α}`, exactly unitriangular | sound |
| 5.3 freeness | `ρ_Q ∘ ψ_Q`; cokernel at a prime of height `≥ 2`; `𝔽_p(t)[s]_{(s)}`; `C_3` | `σ_Q(r_γ^p) = r_γ`, identity; `Hom(κ, C) = 0` from `Hom(κ, N) = 0` and `Ext¹(κ, M) = 0`; rank `p²` against `p`; `t³ ∉` image | normality and perfectness both used |
| 5.4 headline | cone `z² = xy`, `p ≠ 2`; `C_2`, `C_3`; `x^p + y² + t` over `𝔽_p(t)` | `J = (x, y, z)`, not invertible; not normal; quotient `(1, 0)`, regular, geometrically reduced, not smooth | sound; false over imperfect fields |
| 6.1 definition | `C_0`, `C_2`; node; `y² = x²z` in char 2 | `𝔸¹`, `𝔸¹`; `η = id`; `J = (x²)`, `X* = X` | normalise `X*`, not `X` |
| 6.2 lift (R01) | `Z = X̄*`; `C_2`, `Z = 𝔸¹`; closed point with `d = 0, 1` | identity; iso; `d = 0`: hypothesis holds; `d = 1`: fails | Check needs `d ≥ 1` |
| 6.4 headline | `C_2`; smooth line; `x^p + y² + t` | (normal, `ν` iso, `ν̄` iso) = (F, T, F), (T, T, T), (T, T, T); `ν ∘ (η ∘ ν̄⁻¹) = id` | iff sound |
| 7.1 normalised iteration | `𝔸¹`; `∅`; `C_2` | `Y_i = 𝔸¹`; `∅`; `Y_0` cusp, `Y_1 = 𝔸¹`, `X^{(1)}` cusp | sound |
| 7.3 headline | `C_2`, `m = 1`, Nash; `C_0`, `m = 0`; `i = 0` | no smooth iterate; `Y_1` smooth; `j = 1`, `Y_m ⊇ X` singular | `m ≥ 1` and `j ≥ 1` needed |

Zero ring and empty scheme: all constructions are empty and smooth, no singularity hypothesis is met. Natural subtraction occurs only in `n − 1` (guarded by `n ≥ 1`), `β − α` (under `α ≤ β`) and `q − 1` (`q ≥ 2`).

**Sources: the seeded sample**, each read at its locator in the cached text.

| Target | Locator read | Supports |
|---|---|---|
| 0.1 | stacksNormalization line 2900 (01UV) | comparison map for a commutative square |
| 0.2 | stacksNormalization lines 2918 (01UX), 2926 (01V0) | exact sequence with the surjection; base change |
| 0.3 | stacksAlgebra lines 17618–17624 (00TT) | smooth at `q` iff the fibre of `Ω` has dimension `dim_x X` |
| 0.5 | stacksVarieties lines 2130–2133 (0B8X) | perfect field, reduced locally algebraic: smooth locus equals regular locus |
| 0.6 | stacksVarieties line 1049 (0C3M); stacksAlgebra line 4671 (030O) | normal scheme, separable extension |
| 1.1 | stacksVarieties line 2112 (056V) | geometrically reduced iff a dense smooth open |
| 1.4 | gonzalezSprinberg1982 lines 99–104; nashModificationNotes2024 line 230 | Plücker closed immersion; `∧^d` form |
| 2.2 | nashModificationNotes2024 lines 153–155; gonzalezSprinberg1982 line 94; nobile1975 lines 314–320 | projective birational; Example 4 has a projective line over the origin, char `≠ 2` |
| 2.4 | nashModificationNotes2024 lines 153–162 | universal triple, algebraically closed field |
| 2.5 | nashModificationNotes2024 lines 170–171; duarteNunezBetancourt2020 lines 152–156; nobile1975 lines 136–141 | one direction; Examples 1 and 2 |
| 2.7 | nobile1975 lines 202–203 | iterated blowing-up |
| 4.5 | nobile1975 lines 143–145 and 59–60; nashModificationNotes2024 lines 143–145; duarteNunezBetancourt2020 lines 136–142 | algebraically closed in the sources; false in characteristic `p` |
| 5.1 | duarteNunezBetancourt2020 lines 271–283; nashModificationNotes2024 lines 394–407 | divided operators, inverse matrix, `R^p`-linearity |
| 5.3 | duarteNunezBetancourt2020 lines 284–305; nashModificationNotes2024 lines 408–439 | `ψ`, splitting at height one, rank `p^d`, `(S_2)` extension, Kunz |
| 5.4 | duarteNunezBetancourt2020 lines 256–257; nashModificationNotes2024 lines 362–364; stacksAlgebra lines 17720–17726 (00TY) | one direction, algebraically closed; the regular non-smooth curve |
| 6.4 | nashModificationNotes2024 lines 515–517; stacksNormalization line 6636 (0H7D) | normalisation an isomorphism iff normal |
| 7.1 | castilloDuarteLeytonLiendo2026 lines 28–32, 52–55 | iterating the normalised blowup; the two questions |
| 7.3 | castilloDuarteLeytonLiendo2026 lines 58–67 | items (i)–(iii) and the consequence |

No locator is flagged unverified by the author. Also read: castilloDuarteLeytonLiendo2026 lines 13–21 and 33–35. All fifteen manifest entries have one key each, no local path; the five paywalled entries stay `uncertified`. No source was fetched and `needs-references.toml` was not created.

**Supplier-order audit.** Gate output:

```
candidate: NashBlowups is not in the merge order yet; checked as if placed after DeformationAndDerivedPatchingAlgebra (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2232 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere (the two leads of the worker's citations file resolve at the DerivedDeRhamCohomology head). Citations resolved at the heads of this run:

- AlgebraicModuliForArithmeticGeometry (open new-roadmap pull request, earlier in the order): `README.md:610` §1.3, `:612` `coherentGrassmannian` (arbitrary `S`, finite type, classifying maps, base change, `Gr_1 = P(E)`, properness over `Spec R` at `:626`), `:663` `plucker`; `:8675` §5.4, `:8677` `DMNormalization.stack` (API: lifting, isomorphism for normal `X`, agreement with `Scheme.Hom.normalization`), `:8701` `.finite`, `:8711` `DMSchematicClosure.stack` (flat base change). Every use here is on schemes of finite type over a field, hence locally Noetherian.
- SchemeAndStackFoundations (main): §0.7 `:1049`, §0.11 `:1370` (`field_extension_descent` `:1372`, smoothness among the descending properties), §0.17 `:1669`, §0.23 `:2163`, §0.30 `:2681`, §4.11 `:6824` (`IsModification.Witness` `:6839`), §4.13 `:6951` (*regularLocus_eq_smoothLocus* `:6987`). Name mappings: R02.
- EnhancedDerivedSheaves (main) §E1.6 `:689`, `isRegular_of_frobenius_flat` `:800`. DiophantineApproximationAndTranscendence (main) §5.6 `:3555`, `lieDerivativeOneForm` `:3692`.
- DerivedDeRhamCohomology (open) §0.23 `README.md:451`, two-way p-basis statement `:459–460`; `Suggested.lean:53` `IsPBasis`, `:64` `pBasis_kaehler_basis`. DeformationAndDerivedPatchingAlgebra (open) §3.14 `README.md:832`, F-finiteness `:836`.

**Pins opened this round** (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`, equal to the plan's baseline). Mathlib: `Morphisms/Smooth.lean:291, 320, 333, 361`; `Geometrically/Reduced.lean:44`; `IdealSheaf/Subscheme.lean:658, 661`; `IdealSheaf/Basic.lean:691, 844`; `Morphisms/ClosedImmersion.lean:206, 409`; `Morphisms/Separated.lean:289`; `Normalization.lean:122, 371, 576, 598`; `FieldTheory/TranscendentalSeparable.lean:72, 76, 88`; `Morphisms/FiniteType.lean:112`; `Topology/JacobsonSpace.lean:105`; `Morphisms/UniversallyInjective.lean`; `RingTheory/Grassmannian.lean`; `Kaehler/TensorProduct.lean:238`; `Kaehler/Basic.lean:869`; `LocalRing/ResidueField/Basic.lean:33`; `Etale/Field.lean`; `RegularLocalRing/Defs.lean:52, 93`; `Modules/Sheaf.lean:183`. Tau Ceti: `Modules/Differentials/Basic.lean:85, 101`, `Quasicoherent.lean`, `Restriction.lean`, `LocallyFree.lean`, `Rank.lean`; `Morphisms/Smooth/RelativeDimension.lean`, `Regular.lean`, `Locus.lean`; `Topology/PureDimension.lean:52` (every irreducible component of dimension `d`; no nonemptiness); `Scheme/KrullDimension.lean`; `IdealSheaf/VanishingIdeal.lean`; `Blowup/IdealSheaf.lean:120, 124, 191`, `UniversalProperty.lean:297, 372`, `ExceptionalDivisor.lean:203`; `Sheaf/ExteriorPower/Basic.lean:66`; `Normalization/IsIso.lean`; `Kaehler/Conormal.lean:76` (`[Algebra.FormallyEtale R S]` and surjectivity only); `Depth/Bijectivity.lean:120`. Every name of the Mathlib and Tau Ceti contracts exists where cited. Searched both pins for `GeometricallyNormal`, `lieDerivative`, `IsPBasis`, an F-finiteness predicate: none.

**Duplication and ownership.** `roadmaps grep` over main and the indexed open heads for: Nash blow, Nash modif, 0C3M, 01V0, 01UV, 0B8X, 00TT, Seidenberg, Gauss map, p-monomial, geometrically normal, tensorKaehlerEquiv, Jacobian ideal with blowup, smoothLocusOfDim, mapOfSurjective, lieDerivative. No Nash construction, no scheme base change of `Ω_{X/R}`, no normality ascent along separable extensions and no derivation-stable-prime lemma is owned elsewhere. `relativeDifferentials.baseChangeIso` of AdicSpacesPartIII (`README.md:10624`, main) is for locally noetherian analytic adic spaces and is not in its `Suggested.lean`; the plan's name here is `AlgebraicGeometry.Scheme.relativeDifferentials.baseChangeIso`. The overlap file lists no pull request changing this roadmap, no dropped and no revision-only id; the open-pull-request list and the board-packages index contain no other Nash package.

Overlap check: read SchemeAndStackFoundations, AbhyankarLemma, ResolutionOfSingularitiesCharacteristicZero (main) and the open PurityOfBranchLocus, DirectSummandsAndBigCohenMacaulay, LogPluricanonicalForms entries; nothing shared (modifications, regular schemes, normal schemes and dimension theory are SchemeAndStackFoundations' and are cited, not restated).

**Shape.** Summary, Scope and ownership, Conventions, supplier contracts, How to read the build, eight layers each ending in Examples and Dependencies, consumers, references. The eight definitions (0.1, 0.3, 1.2, 2.1, 2.7, 4.2, 6.1, 7.1) each have an API list and at least three Checks; every theorem has hypotheses and a locator; `plan.json` parses: 37 targets, 118 tests, README headings equal plan ids. Layers are named by their mathematics; Layers 4 and 5 both start from §4.1, 6 needs 2, 4, 5, and 7 needs 2 and 6. No process words, pull-request numbers, machine paths or LaTeX delimiters in the roadmap text.

**Headlines.** §2.5 triviality criterion, §4.5 Nobile, §5.4 Duarte–Núñez-Betancourt, §6.4 normalised criteria, §7.3 never-resolves. Each mentions the Nash blowup, which needs the scheme Grassmannian, absent at the pins; the package docstring must name each as not statable. Remark for the package stage (no change to the design): §4.3 (Seidenberg's lemma) and §4.4 (a rank-`d` locally free quotient of `Ω_{X/k}` forces smoothness in characteristic 0) mention only pinned carriers and are candidates for `Suggested.lean`. There is no `Suggested.lean` at the design stage, so there are no declarations for the padding probe, the `#check` comparison or the import check.

**Copyright.** Compared with the sources at their locators: the eighteen sampled statements above, and the prose of §1.3 (route), §4.3 (route), §5.3 (steps 1–5), §6.3 (route), §7.2 (statement) and the Conventions on ground fields. Shared runs are formulas and statements of under a dozen words (`πq = h`, `q*L = G`). Contents of nashModificationNotes2024 (Sections 1–7: definition, basic results, Oneto–Zatini, Yasuda, normal case, toric, an example) against the layers: Layer 1 ↔ §3, Layer 2 ↔ §1, Layer 4 ↔ §2, Layer 5 ↔ §5, Layers 0, 3, 6, 7 without counterpart, §§4, 6, 7 not planned: neither one to one nor in order. No table, figure or list is taken over.

Source independence: 24 passages compared with 9 sources, none shared; largest share nashModificationNotes2024, 20 of 103 source citations in the README; contents compared with nashModificationNotes2024: independent.

## Not verifiable

- Lean elaboration: not available (this lane does not elaborate). No Lean command was run; there is no `Suggested.lean` to elaborate.
- `hironaka1983`, `spivakovsky1990`, `semple1954`, `teissier1982`, `ega1`: settled uncertified background texts, not opened; no target rests on them.
- Journal numbering of duarteNunezBetancourt2020 and castilloDuarteLeytonLiendo2026: the locators are bound to the arXiv versions read, as the manifest says.
- Ownership against open pull requests rests on the supplied index of open heads (index of 2026-11-15).

## Source issues

- **Misprint** in nashModificationNotes2024 at Theorem 5.1, printed p. 10: the source says the Nash map of a normal variety is an isomorphism exactly when the variety is singular; it should be nonsingular; affects a stated result.
- **Gap** in nashModificationNotes2024 at Section 3, printed p. 6: the source says every morphism with a rank-d quotient factors through the closure; it should require a reduced source with dense preimage of the open; affects a stated result.
- **Misprint** in castilloDuarteLeytonLiendo2026 at Introduction, printed p. 1: the source says the normalised Nash blowup is the pair with the map η followed by ν written as η∘ν; it should be ν∘η; affects nothing.
- **Misprint** in duarteNunezBetancourt2020 at Theorem 3.10 proof, printed p. 6: the source says the second sum for δ_t(x_j) uses coefficients indexed by k; it should be indexed by t; affects nothing.
- **Misprint** in hamann2003 at Lemma 0.1 proof, printed p. 2: the source says the radical J is the annihilator of an element outside J; it should be that P is the ideal quotient of J by such an element; affects the proof.

## For the human reviewers

- **Licence.** `alperModuli` is read from the author's university page (`sources.toml`, `licence_class = "author-page"`); the text is an unpublished book draft dated 19 August 2024, cited only for the route of §0.4.
- **Scope.** `nashModificationNotes2024`, the source with the largest share of locators (20 of 103), is an arXiv survey with no journal reference in the manifest; the headline theorems are also cited to refereed articles (`nobile1975`, `duarteNunezBetancourt2020`, `castilloDuarteLeytonLiendo2026`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b70f2a2cba9dd1ffc7f82f4de378166c7e4153df", "job": "REV-DESIGN-NashBlowups~6", "model": "fable", "worker": "chris-x29"} -->
