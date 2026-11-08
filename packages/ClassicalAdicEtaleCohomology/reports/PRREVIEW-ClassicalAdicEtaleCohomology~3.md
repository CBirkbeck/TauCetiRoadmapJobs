# Review of ClassicalAdicEtaleCohomology (pull request #875 at 67f459d)

**Verdict:** needs changes

This is a full re-review of the repaired head (210 changed lines since d99fe53, the head the previous review read). The previous review's six findings are checked first, then the whole roadmap: every section was read, the seeded sample was verified in the cached texts, the four Lean statements were elaborated and probed, and the supplier citations were resolved on main and at the open heads named in the brief. One blocking finding (R01) and five P3 findings remain.

**Previous findings.**

- R01 (own Lean-style identifiers backticked without a declaration) — partly repaired. The names `Huber.IsHenselian`, `EtaleDPlus`, `FormalScheme.SmallEtale`, `filtrationCutoff`, `OrientedEtaleProduct`, `Trait.variation`, `AnalyticLCICycleClass`, `PreadicSpace.ZpLocalSystem` and the IsTaut Check are gone. Still backticked without a declaration: `IsSurjectiveValuationMap` (`TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:62`, 3500, 3504–3506, 3509), `closedDisc(…)` and the other radial loci (5348–5358, 5364, 5378–5380, 5386, 5397, 5402–5403, 5413, 5427–5428, 5446, 5469, 5474, 5755, 5770), `QpLocalSystem(X)` (1515, 1899) and `ClassicalAlgebraic.IsUniversallyLocallyAcyclic` (3351, 3371, 3394). The repair also added many unbackticked Lean identifiers, including in Checks (see R03 below).
- R02 (five works without References entries) — repaired: the Kato, Achinger–Lara–Youcis, Bhatt–Mathew, Berkovich 1990 and Prestel entries are at 5907–5911.
- R03 (two pairs of targets with different coefficient hypotheses) — not repaired: 4328–4330 (“`n` invertible in `C⁺`: the `p`-torsion analogue is not asserted”) against 4456 (“does not require `n` to be a unit in `C⁺`”), and 4338 (`n` invertible in `O_Y⁺`) against 4466 (every `n>0`), are unchanged. Re-raised as R04.
- R04 (two supplier declaration names not where cited) — half repaired: LPV §0.8a is now cited by its prose title (38, 2515, 2519), and the two `Tau Ceti TauCetiRoadmap/…#layer-…` citations are now `AdicSpaces`, Layer 1 and `JacobianChallenge`, Layer B (3767, 4193). The `AlgebraicModuliForArithmeticGeometry` §9.7 (`relativeEmbeddedResolution`) citation at 5694 and 5847 is unchanged. Re-raised as R05.
- R05 (Huber 1993 page) — repaired: 1092 reads “Introduction, pp. 703–704”; the statement `A_i` is on the scan page with running head 703 and `B_i` begins on 704 (HuberHenselian1993 lines 61–70).
- R06 (tube–fibre comparison beyond Orgogozo 5.1) — repaired: 3046 states Orgogozo's finite-presentation and bounded-constructible scope and the closed-embedding transfer through the proper push-forward compatibility (b).

## R01 (P1) — Section 1.1, 1.4 and 3.3 definitions are declared as instances of supplier objects that do not exist where they are cited

**Location:** `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:85` “`EtaleCohomologyFoundations`, §F.0.1, supplies the site-generic classes Sheaf.IsLocallyConstant and Sheaf.IsLocallyConstantOfFiniteType, the shape of its structure ConstructibleStratification, the class IsWeakSerreClass … its §0.7 supplies … etaleExtensionByZero, its §F.1 the object property cohomologyProperty and the one lisse predicate, and its §F.4.1 the adic systems AdicSystem X (Λ, I) over a Noetherian pair”; the same at 214 (“etaleExtensionByZero is the extension by zero of `EtaleCohomologyFoundations`, §0.7, and etalePullback, etalePushforward, etaleAdjunction and Etale.overEquiv name … (`SchemeAndStackFoundations`, §§2.1 and 2.5)”), 229, 451, 459, 592, 608 and 739.

**Claim:** every cited supplier section states what it is cited for, on main or at the open head the brief names.

**Witness:** on main (eaf17b1), `TauCetiRoadmap/EtaleCohomologyFoundations/README.md` §F.0.1 (line 175) is the target `VanishingCycles.constructibleEtale` and contains none of the strings `IsLocallyConstant`, `ConstructibleStratification`, `IsWeakSerreClass`; §0.7 (line 439) constructs extension by zero for open immersions only, with no `etaleExtensionByZero`; §F.1 (line 457) has no `cohomologyProperty` and defines `Dᵇ_c` as a full subcategory, not an object property; §F.4.1 (line 959) is `VanishingCycles.normalizedAdicSystems` for `Λ_n = ℤ/ℓⁿ` with `ℓ` invertible on `X`, not an `AdicSystem X (Λ, I)` over a Noetherian pair. `SchemeAndStackFoundations` §§2.1 and 2.5 on main (lines 3265, 3388) contain neither `etalePullback` nor `Etale.overEquiv`. Every one of these names occurs only in the revision pull requests of those two main roadmaps (`roadmaps grep --fixed`: EtaleCohomologyFoundations at #1891, lines 240–275, 685, 748–756, 1360; SchemeAndStackFoundations at #1656), and a pull request that revises an existing roadmap is never a dependency. Even at #1891, `AdicSystem X (Λ, I)` requires `Scheme.IsInvertibleOn (ringChar (Λ/I)) X` (its line 1360), so the roadmap's systems “without its invertibility hypothesis” (85, 608) are not instances of it on any head.

**Repair:** cite `EtaleCohomologyFoundations` and `SchemeAndStackFoundations` as they are on main, and own here what main does not supply: state the analytic local-constancy and finite-type predicates, the stratification structure, the weak-Serre-class statement for analytic constructible sheaves, the object-property form of the analytic `Dᵇ_c`, the analytic adic systems over a Noetherian pair `(Λ, I)` with no invertibility, and the étale-map extension by zero as this roadmap's targets (they were already stated in prose at 451–494 and 302 before the repair), with the convention that the scheme-side names are chosen to agree with `EtaleCohomologyFoundations` §F.0.1's `VanishingCycles.constructibleEtale` and §0.7's open-immersion extension by zero. Delete the sentences “These are consumed by name; this roadmap adds only their analytic instances” (85) and “no separate inverse-system notion is introduced” (608), and replace “(`SchemeAndStackFoundations`, §§2.1 and 2.5)” at 214 by the scheme-site functors main actually names there (`Functor.sheafPullback` in §2.1). Applied to §F.4.1: “Integral coefficients on analytic sites are analytic adic systems over a Noetherian pair, defined here; on locally noetherian `X` with `ℓ` invertible they agree with `EtaleCohomologyFoundations` §F.4.1's `VanishingCycles.normalizedAdicSystems` transported along the analytification morphism of sites”.

## R02 (P3) — A Check asserts a splitting that fails for `n ≥ 2`

**Location:** `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:617` “The `ℤ_ℓ`-sheaf `ℤ/ℓ` has levels `K_n = ℤ/ℓ ⊕ ℤ/ℓ[1]`, of Tor amplitude `[−1, 0]` over `ℤ/ℓⁿ`”.

**Claim:** the level `K_n = ℤ/ℓ ⊗ᴸ_{ℤ_ℓ} ℤ/ℓⁿ` is the direct sum of its cohomology sheaves in `D(ℤ/ℓⁿ)`.

**Witness:** `K_n` is the complex `[ℤ/ℓⁿ →(ℓ) ℤ/ℓⁿ]` in degrees `−1, 0`, with `H⁻¹ = ℓⁿ⁻¹ℤ/ℓⁿ ≅ ℤ/ℓ` and `H⁰ = ℤ/ℓ`. If it split as `ℤ/ℓ ⊕ ℤ/ℓ[1]` over `ℤ/ℓⁿ`, then `K_n ⊗ᴸ_{ℤ/ℓⁿ} ℤ/ℓ` would have `Tor_i^{ℤ/ℓⁿ}(ℤ/ℓ, ℤ/ℓ) = ℤ/ℓ` in every degree `i ≥ 0`; but by associativity `K_n ⊗ᴸ_{ℤ/ℓⁿ} ℤ/ℓ = ℤ/ℓ ⊗ᴸ_{ℤ_ℓ} ℤ/ℓ`, which has exactly two nonzero cohomology groups. So the extension class in `Ext²_{ℤ/ℓⁿ}(ℤ/ℓ, ℤ/ℓ) = ℤ/ℓ` is nonzero for `n ≥ 2` (for `n = 1` the differential is zero and the sum is correct). The other assertions of the Check (Tor amplitude `[−1, 0]`, zero transitions on `H⁻¹`, heart membership, `H⁰`-system `ℤ/ℓ`) are correct.

**Repair:** “has levels `K_n = [ℤ/ℓⁿ →(ℓ) ℤ/ℓⁿ]` in degrees `−1, 0`, with both cohomology sheaves `ℤ/ℓ`, non-split over `ℤ/ℓⁿ` for `n ≥ 2` (its derived reduction to `ℤ/ℓ` has two cohomology groups, that of a split complex would have infinitely many), of Tor amplitude `[−1, 0]`”.

## R03 (P3) — Own Lean identifiers remain backticked without a declaration, and Checks name Lean counterparts

**Location:** `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:62` “is abbreviated `IsSurjectiveValuationMap` only as that inline condition” (also 3500, 3504–3506, 3509); 5348 “`closedDisc(A⁺,T,b) ⊆ Spa(A,A⁺)`” and the backticked `puncturedDisc`, `closedAnnulus`, `strictAnnulus`, `openAnnulus`, `openDisc`, `radiusBall` at 5349–5770; 1515 and 1899 “`QpLocalSystem(X)`”; 3351 “Extend that supplier's ULA notion as `ClassicalAlgebraic.IsUniversallyLocallyAcyclic`” (also 3371, 3394). Checks naming Lean identifiers: 222–224 (“AdicSpace.etaleExtensionByZero h and AdicSpace.etalePushforward h agree”, “AdicSpace.etalePullbackId identifies”), 237 (“isIso_toPoint_map needs its hypothesis”), 240, 601, 604 (“AdicSpace.constructibleSheaf”), 1973 (“FormalScheme.smallEtaleTopology `X` is Mathlib's …”), 2636 (“FiltrationCutoff `p e ≤ m`”).

**Claim:** a backticked name of this roadmap's own is a claim that `Suggested.lean` declares it; a Check never names a Lean counterpart; a target in another roadmap's namespace (`ClassicalAlgebraic`, EtaleCohomologyFoundations') is not this roadmap's to declare.

**Witness:** `Suggested.lean` declares exactly `ValuationSpectrum.zariskiRiemannLocus`, `ValuationSpectrum.zariskiRiemann_cohomology_eq_zero`, `aic_valuation_finite_conditions_transfer`, `aic_valuation_section_lift` and `field_cohomological_dimension_transcendence` (lines 69, 78, 96, 114, 125); none of the names above is among them, and `ClassicalAlgebraic.*` is the namespace of `EtaleCohomologyFoundations` on main (its `Suggested.lean`).

**Repair:** write these in prose or mathematical notation: “surjective map of spectra” (62 and §6.1), “the closed disc of radius `b`” and “`{v ∈ Spa(A,A⁺) : T ≤ᵥ b}` ” for the radial loci, “the category of `ℚ_p`-local systems on `X`”, “the universally locally acyclic predicate of Section 5.6” (and drop the `ClassicalAlgebraic` prefix); rewrite the Checks at 222–224, 237, 240, 601, 604, 1973 and 2636 as computations (“extension by zero along the split double cover sends `(F, G)` to `F ⊕ G`, as the pushforward does”).

## R04 (P3) — Two pairs of targets still state the same theorem with different coefficient hypotheses

**Location:** `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:4328`–4330 “`n` invertible in `C⁺`: the `p`-torsion analogue is not asserted” against 4456 “does not require `n` to be a unit in `C⁺`” (both: `X → Spa(C, C⁺)` proper, a sheaf vanishing on the pseudo-adic closed fibre has `RΓ(X, F) = 0`); 4338 (`j_! Rg_* → Rf_* j'_!` for `n` invertible in `O_Y⁺`) against 4466 (the same for every `n > 0`). Re-raised: previous review R03.

**Claim:** one theorem has one hypothesis set; the weaker statements are subsumed.

**Witness:** Zavyalov, *Some foundational results*, Proposition 9.3(1) (cache lines 1110–1118, p. 26) is stated for `D(X'_ét; ℤ/nℤ)` with no invertibility, as 4456 and 4466 say; invertibility in `O_Y⁺` enters only Lemma 9.1(3) (lines 972–980).

**Repair:** keep 4456 and 4466; delete 4328–4336 and 4338–4346, or rewrite them as the named corollaries that §8.3 uses, without the clause “the `p`-torsion analogue is not asserted”.

## R05 (P3) — `relativeEmbeddedResolution` is cited from a roadmap that consumes it, under a name nobody declares

**Location:** `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:5694` “`AlgebraicModuliForArithmeticGeometry`, Layer 9, Section 9.7 (`relativeEmbeddedResolution`), supplies the resolution with a regular normal-crossings boundary” (also 5847). Re-raised: previous review R04.

**Claim:** the cited roadmap and section own the statement under that name.

**Witness:** `AlgebraicModuliForArithmeticGeometry` at its head (#853) lists `relativeEmbeddedResolution` as consumed from “ResolutionOfSingularitiesCharacteristicZero §5.6” (its README lines 110, 272, 10434). `ResolutionOfSingularitiesCharacteristicZero` at its head (#1199) has §5.6 “Relative embedded resolution with an initial boundary” (its README line 852), which states the theorem used here (strict transform smooth and simultaneously SNC with the transformed boundary), but the string `relativeEmbeddedResolution` occurs nowhere in that roadmap (`roadmaps grep --fixed` finds it only in AMAG and here).

**Repair:** “`ResolutionOfSingularitiesCharacteristicZero`, §5.6 (*Relative embedded resolution with an initial boundary*), supplies the resolution with a regular normal-crossings boundary” at 5694 and 5847, with no backticked name.

## R06 (P3) — Locator slip for the tilde-limit definition

**Location:** `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:3882` “Scholze, Perfectoid spaces, §7, Definition 7.14, p. 44” (also 3925).

**Claim:** Definition 7.14 is on p. 44.

**Witness:** in the arXiv text (cache 065441…, line 2120) Definition 7.14 begins on p. 43; Theorem 7.17 and Corollary 7.18 are on p. 44 (lines 2135, 2142).

**Repair:** “Definition 7.14, p. 43”.

## Verified sound

**Head, gate, build.** The worktree is at `67f459def65e12888ac66428e03068c7835adcea`, clean; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ClassicalAdicEtaleCohomology'` is empty (the files listed under “outside the folder” in the change set are the merge of main at c3891e3a). The worker's gate passes every check (`depcheck=0 … build=0 OK`). `lake env lean` on a scratch copy of `Suggested.lean` with `#check @name` for the five declarations elaborates with exactly the four `declaration uses 'sorry'` warnings (lines 78, 96, 114, 125); the printed types keep every binder (`[IsSepClosed K]`, `IsAddTorsion G`, `0 < n`; `[IsAlgClosed K] [IsAlgClosed L]`, `[v.IsNontrivial] [w.IsNontrivial]`, the order hypothesis and the three `Finset`s; `[IsDomain V] [ValuationRing V] [IsAlgClosed (FractionRing V)] [Algebra.FiniteType V B] [Module.Flat V B]`; `ℓ.Prime`, both `cohomologicalDimensionAt.{v}` and `Cardinal.toENat`), and they agree with the README statements at 1120, 4601, 4609 and 5718. The header is `module` / `public import Mathlib` plus the two Tau Ceti modules / `@[expose] public section`; no `set_option`, no sorry'd data, no admitted `example`.

**Dependency direction.** Output of the required `--movable` command:

```text
depcheck: 240 roadmaps, 2352 edges, 0 problem(s)
```

**Padding probe.** On a scratch file each sorried theorem was tried with `simp`, `rfl`, `infer_instance` and `aesop` (the Zariski–Riemann theorem), with `simp` and `aesop` (transfer), and with `simp`, `aesop` and `exact?` (section lift, field bound): every attempt fails (`unsolved goals`, `rfl failed`, `failed to synthesize instance`, `simp made no progress`, `aesop … made no progress`); `exact?` found only the sibling admitted declarations of the probe file, no library lemma. None of the four restates a definition, mirrors a Check or computes a value; the single `def` is needed to state the Zariski–Riemann theorem.

**Headline inventory.** End theorems by layer: strict-local fibres and continuity (1); henselian comparison, Zariski–Riemann vanishing, perfectoid approximation (2); local lattices, analytic coverings, rational monodromy and the isogeny localization (3); completion and inertia-equivariant nearby-cycle comparison, perverse compatibility, Bloch–Kato–Hyodo (4); valuation nearby-cycle base change, constructibility, AIC generic extension (5–6); geometric-field invariance (7); compactifications, proper supports, base change, projection (8); traces and duality at every rank (9); radial cohomology and smooth families (10); purity, cohomological dimension, affine exhaustion, frontier duality (11). The four statable at the pins are stated; the module docstring names the missing carriers for the rest, now including the site functors, stratifications, adic systems and the Serre-quotient isogeny category added by this head. The henselian-pair lemma (757), the surjective-spectrum equivalences (3480) and the Serre-class statement for towers (1550) are statable on pinned carriers but are foundational lemmas, not headlines.

**Pinned declarations opened** (Mathlib and Tau Ceti at the pins of `lake-manifest.json`):

| Declaration | File at the pin | What it says |
|---|---|---|
| `Functor.sheafPullback`, `sheafAdjunctionContinuous` | `Mathlib/CategoryTheory/Sites/Pullback.lean:56–76` | pullback of sheaves along a continuous functor and its adjunction (needs `HasWeakSheafify`) |
| `Functor.sheafPushforwardContinuous` | `Mathlib/CategoryTheory/Sites/Continuous.lean:358` | direct image along a continuous functor |
| `MorphismProperty.Over.map` | `Mathlib/CategoryTheory/MorphismProperty/OverAdjunction.lean:41` | composition with `f` on `P.Over Q X`, for `P f` |
| `GrothendieckTopology.over`, `overPullback` | `Mathlib/CategoryTheory/Sites/Over.lean:231, 270` | the induced topology on `Over X` and restriction of sheaves |
| `GrothendieckTopology.Point`, `Point.comap`, `sheafFiber`, `sheafFiberComapIso` | `Mathlib/CategoryTheory/Sites/Point/Basic.lean:70, 275`, `Comap.lean:40, 68` | points of a site, their comap along a continuous functor, fibre functors and the fibre comparison |
| `ObjectProperty.IsConservativeFamilyOfPoints` | `Mathlib/CategoryTheory/Sites/Point/IsMonoidalW.lean:35` | conservative families of points |
| `Scheme.pointSmallEtale`, `isConservativeFamilyOfPoints_pointSmallEtale'` | `Mathlib/AlgebraicGeometry/Sites/EtalePoint.lean:63, 147` | the point of the small étale site of a separably closed point, and conservativity |
| `Scheme.AffineEtale.sheafEquiv` | `Mathlib/AlgebraicGeometry/Sites/AffineEtale.lean:140` | sheaves on the affine étale site ≌ small étale sheaves |
| `DerivedCategory.TStructure.t`, `TStructure.bounded` | `Mathlib/Algebra/Homology/DerivedCategory/TStructure.lean:33`, `Triangulated/TStructure/Basic.lean:262` | the standard t-structure and `plus ⊓ minus` |
| `ObjectProperty.IsTriangulated`, `HasInducedTStructure` | `Triangulated/Subcategory.lean`, `TStructure/Induced.lean:39` | triangulated object properties and induced t-structures |
| `ObjectProperty.IsSerreClass`, `isoModSerre`, `SerreClassLocalization.abelian`, `MorphismProperty.Localization` | `Mathlib/CategoryTheory/Abelian/SerreClass/Basic.lean:45`, `Bousfield.lean`, `Localization.lean:16–101`, `Localization/Construction.lean:106` | Serre classes, morphisms invertible modulo them, the abelian localization |
| `Sheaf.IsConstant`, `constantSheaf`, `Sheaf.H` | `Sites/ConstantSheaf.lean:79, 64`, `SheafCohomology/Basic.lean:56` | constancy, sheafified constant presheaf, `Ext` from `ℤ` |
| `Opens.grothendieckTopology` | `Mathlib/CategoryTheory/Sites/Spaces.lean:47` | the topology of a space |
| `TauCeti.ValuationSpectrum`, `basicOpen` | `TauCeti/AlgebraicGeometry/AdicSpace/ValuationSpectrum/Basic.lean:73, 106` | valuative relations on `K`; for a field, `basicOpen f s = {f/s ∈ V}` (`s ≠ 0`), Huber's `D(a)` (HuberHenselian1993 line 51–52) |
| `TauCeti.cohomologicalDimensionAt` | `TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/Basic.lean:146` | least `ℕ∞` bound over discrete `p`-primary modules |
| `Field.absoluteGaloisGroup`, `Cardinal.toENat`, `Valuation.IsNontrivial` | `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42`, `SetTheory/Cardinal/ENat.lean:192`, `RingTheory/Valuation/Basic.lean:591` | as named |

Not at the pins (checked by grep): `IsWeakSerreClass`, `Sheaf.IsLocallyConstant`, `etalePullback`, `Etale.overEquiv` (R01).

**Cross-roadmap citations resolved.** On main: `AdicEtaleGeometry` has every slug cited by the new text (`etale-site-and-geometric-points` ×14, `etale-enough-points` ×6, `analytification-etale-site` ×5, `slice-site` ×8, `basis-comparison`, `pro-etale-site-corrected`, `proetale-projection-nu`, `strict-localisation-analytic`) and the names `AdicSpace.etaleSheafPushforward`, `etaleSheafPullback`, `smallEtale.map`, `smallEtale.mapComp`, `smallEtale.sliceEquiv`, `GeometricPoint.point`, `GeometricPoint.comp`, `stalk_pullback_iso`, `isConservativeFamilyOfPoints_geometricPoint`, `AdicSpace.smallEtaleTopology`, `AdicSpace.GeometricPoint`; `EtaleCohomologyFoundations` has `ClassicalCoefficients.finitePresentationDescent`, `constructibleDerivedDescent`, `constructibleHomContinuity`, `ClassicalAlgebraic.supportLocalization`, `properSupports`, `smoothTrace`, `lciCycleClass`, `cycleClasses`, `VanishingCycles.localAcyclicity`, `properBaseChange`, `compactSupportCohomology`, `etaleExceptionalInverseImage`, `etaleBaseChange`, `exists_stable_lattice_iff`, `GaloisLattice.IntegralModel.nonempty`, `nagataCompactification`, `compactificationCommonRefinement`, `DenseCompactification`, `normalizedAdicSystems`, §§0.5–0.11, F.0.1–F.4.6, F.5–F.8, G.1–G.3; `EnhancedDerivedSheaves` has `ClassicalDerived.derivedCompletion`, `functorCoherence`, §§0.1–0.4, E0, E1, E4; `SchemeAndStackFoundations` has `Sheaf.derivedPushforward` and §§0.9, 0.12–0.14, 2.1, 2.2, 2.5, 2.11, 2.15, 2.16, 4.14, 4.15; `PerfectoidSpaces` has `PerfectoidSpace.IsTildeLimit` and `PairOfDefinition.isAdicComplete_of_completeSpace` (also in AdicEtaleGeometry); `AdicSpacesPartIII` has `Huber.GelfandSpectrum`; `AdicSpaces` is under `Completed/`; `JacobianChallenge`, `AlgebraicCurves`, `StableReduction`, `EllipticCurves`, `ProfiniteCohomology`, `DerivedModuleAlgebra`, `PadicMeasuresIwasawaAlgebras` are on main. At their open heads (earlier in the merge order): `LefschetzPencilsAndVanishingCycles` §0.8a “Nearby-cycle and inertia comparison”, `ResolutionOfSingularitiesCharacteristicZero` §5.6, `AlgebraicModuliForArithmeticGeometry` §9.7 (R05). Unresolved on main: the `EtaleCohomologyFoundations` §F.0.1/§0.7/§F.1/§F.4.1 names and the `SchemeAndStackFoundations` §§2.1/2.5 names of R01. No second owner of the five Lean declarations was found by `roadmaps grep` across main and the open heads.

**Sources: seeded sample.** Cache files are cited by the first six characters of their id; pages are the printed pages of the cited edition (Berkovich 1993: file page + 3; Huber 1993: scan page + 701; Berkovich 1994: file page + 537; Lütkebohmert: file page + 165; BLR: file page + 359; de Jong 1995: file page + 87; Li–Reinecke–Zavyalov: running heads, the arXiv v1 file having blank pages; Scholze–Weinstein Berkeley: file page − 10; the others file page = printed page).

| Target | Text inspected | Outcome |
|---|---|---|
| 1.3 | Berkovich 1993 Theorem 5.2.2 (Leray) p. 98, Prop. 5.2.6 p. 100, Prop. 5.2.8 p. 101 (bd864c lines 3534, 3592, 3638); de Jong–van der Put Prop. 2.5.4 p. 12 (34a0f0, OCR, line 472), §3.2 items 5–6 p. 25 (1036–1039), §3.3 p. 28 (1159), Theorem 3.7.3 p. 38 (1571); Kedlaya–Liu Prop. 8.2.20 p. 163, Prop. 8.2.21 p. 164, Theorem 8.2.22 p. 165 (a6a117 6408–6481); Scholze pAdicHodge Prop. 3.7(iii) p. 14–15 (`Hⁱ(pt, F_M) = Hⁱ_cont(G, M)`, ed9187 650–652), Lemma 3.16 p. 19 (889), Cor. 3.17(i)–(ii) p. 20 (917), Lemma 3.18 p. 21 (950), Theorem 4.9 p. 25 (1173), Prop. 8.2 p. 48 (2201); Erratum item (1) p. 1 (3cfa56 8–34: Prop. 3.7(i) is false, covers are restricted to transfinite compositions of pullbacks of finite surjections, the categories are unchanged) | all exact; the roadmap's corrected-coverings convention is the erratum's |
| 2.4 | Huber 1993 Theorem 0.2 p. 703 (ff6beb 54–57: `K` separably closed, `E, F` subsets, `Y = {A ∈ Spv K : E ⊆ A, F ⊆ 𝔪_A}`, `Hⁿ(Y, G) = 0` for torsion `G`; topology by `D(a) = {a ∈ A}`, line 51), Lemma 2.1 p. 705 (149), Lemma 2.4 p. 706 (177–179), Prop. 4.1 p. 708 (255–258); ECD Lemma 19.4 p. 110 (4ce3d1 4533) | exact; the Lean statement has the same data, with `0 < n` and `IsAddTorsion G` |
| 3.1 | Kedlaya–Liu Def. 8.1.10 and Remark 8.1.11 p. 158 (6213–6220: taut = quasiseparated and closures of quasicompact subsets quasicompact; the doubled line); ECD Prop. 18.10 p. 106 (4378; the cited “before the proof, p. 107” is the proof's start); Zavyalov PD Remark A.4 p. 84 (4b4ba0 4006–4008: qcqs and partially proper morphisms are taut), Def. A.6 p. 84, Lemmas A.7–A.8 p. 85, Cor. A.11 and Remark A.12 p. 86, Def. A.13 and Remark A.14 p. 86 (4019–4105) | exact |
| 3.5 | de Jong 1995 Definition 2.1 p. 91 (24f2e3 118), Lemmas 2.2–2.4 pp. 91–93 (166–204), Lemma 2.6 p. 93, Remark 2.11(i) p. 96 (321); ALY Construction 2.1.3 and Prop. 2.1.4 p. 5 (75155f 193–217) | exact |
| 4.4 | Berkovich 1994 Prop. 4.1 and Cor. 4.2 p. 548 (5ea479 428–443), Lemma 4.3 p. 548 (456), Theorem 4.9 p. 551 (551), Theorem 5.1 p. 554 (671–673: `i^*Rj_*F ≅ RΘ(F)` for torsion `F`), Cor. 5.3–5.5 p. 555 (722–735); Stacks 04DZ by tag | exact; Huber (3.5.12)–3.5.16 not readable (below) |
| 5.1 | Orgogozo Introduction p. 1 and Théorème 1.1 p. 2 (10f18b 86–87: coherent irreducible `S`, finitely presented `f`, `n` invertible, `F ∈ Dᵇ_c`), Prop. 2.3 p. 3 (140), Remarques 4.4–4.5 p. 13 (656–665), Théorème 5.1 p. 14 (682), 6.1 p. 16 (801), Remarque 6.3 p. 16 (815), §7.1 p. 17 (831), Lemme 8.1.1 p. 19 (935); Illusie §1.1 pp. 1–2, §2.1 p. 3, (2.2)–(2.3) p. 4, 2.4 p. 5, 2.5 p. 6, Theorem 3.2/Remark 3.3 p. 7, 4.1 p. 8 (18bfa0 9–365); Hansen–Zavyalov A.4 p. 64, Lemma A.4.3 p. 65, Theorem A.4.4 p. 66, Remark A.3.6 p. 62 (98ef44 2624–2931); Gabber–Ramero Lemma 6.2.5 and (6.2.3) p. 159, Prop. 6.2.12 p. 160, Def. 6.2.16 p. 162, Example 6.1.4 p. 151, Lemma 6.1.9 p. 153, Remark 5.1.9 p. 104 (c4ab39 5142–7896) | exact |
| 5.6 | Hansen–Scholze Theorem 2.2 p. 9, Prop. 3.3 p. 13, Prop. 3.4 p. 14, Lemma 3.5 p. 16, Prop. 3.7 p. 17, Cor. 3.10 p. 18, Theorem 4.1 pp. 19–21 (7fcca4 990–999: AIC valuation ring, separated finite presentation, settings (B)/(C), inverse `Rj_*`), Cor. 4.2 p. 19, Lemma 4.3 p. 21, Theorem 4.4 p. 22, Cor. 4.5 pp. 22–23 (1192–1203: finite type for `D_ét`, any scheme for `D⁺`) | exact; the §6.3 “no finite-type assumption in the bounded-below form” is Cor. 4.5's second clause |
| 7.1 | ECD Lemma 16.3 p. 93 (3812), Lemma 14.6 p. 84 (3462), Lemma 14.5 p. 83 (3424), Prop. 14.3 p. 82 (3382), Theorem 16.1 and Remark 16.2 p. 92 (3761, 3782); Scholze–Weinstein Prop. 4.2.5 p. 30 (225505 1431), Theorem 2.3.3 p. 14 (804); Hansen Prop. 3.2 p. 11 (dbb780 464), Theorem 1.7 p. 3, Lemma 3.1 p. 10, (†) p. 16, (∗) p. 17; Berkovich 1993 Theorem 7.6.1 p. 150 (5354) | exact; Huber 4.1.1(c) not readable |
| 7.2 | Scholze, Perfectoid spaces, Prop. 6.11 p. 36 (065441 1760), Lemma 6.13(i) p. 37 (1786–1788: `K` of characteristic `p`, `R⁺` a `K°`-algebra, completed direct limit of `p`-finite algebras), Definition 7.14 p. 43 (2120; R06), Theorem 7.17 and Cor. 7.18 p. 44 (2135–2142); ECD proof of Lemma 16.3 p. 93 | exact apart from the page of Definition 7.14 |
| 8.2 | ECD §18 before Prop. 18.6 p. 103 (4244), Cor. 18.8(vi) p. 106 (4373); Fargues–Scholze Theorem IV.5.3 p. 153 (1f8040 5912); Zavyalov Foundations Lemma 9.1 p. 23–24, Theorem 9.4 p. 27–28 (ace033 966, 1175), Theorem 1.3 p. 2 (83), Cor. 5.11 p. 12, Lemma 7.14 p. 18; LRZ Def. 4.1.3, Remark 4.1.4, Lemma 4.1.5, Prop. 4.1.6 p. 30, Lemma 4.1.7 p. 31, Lemmas 4.2.1–4.2.2 p. 32, 4.2.4–4.2.5 p. 33, Lemmas 4.5.1–4.5.2 p. 41 (dd6ff5 running heads 1604–2431); Lütkebohmert Theorem 5.3 and Prop. 5.4 p. 197, Lemma 5.5 p. 198, Def. 5.6 and Prop. 5.7 p. 200, Lemma 5.8 p. 202, Def. 7.1 p. 211, Lemma 7.3 and Theorem 7.4 p. 212, Prop. 7.5 and Lemma 7.6 p. 213, Lemma 7.7 p. 216 (663f1f 1073–1742, OCR); BLR Theorem 2.1 p. 367, 2.1′ p. 368, Props. 2.2–2.3 p. 369, Lemma 2.4 p. 370 (48eae8 304–432, OCR) | exact |
| 8.4 | Zavyalov Foundations Lemma 9.1(1)–(3) pp. 23–25 (966–980: (3) alone needs `n` invertible in `O_Y⁺`), Lemma 9.2 p. 25 (1067), Prop. 9.3(1)–(2) p. 26 with footnote 6 p. 27 (1110–1121, 1182); Berkovich 1993 Theorem 5.3.9 p. 105 (3768), Theorem 7.7.1 p. 153 (5444); ECD Props. 22.8 p. 132 (5464), 22.23 p. 139 (5761), 22.9 p. 132, 22.10 p. 133, Def. 22.4 p. 129 | exact; R04 |
| 9.6 | ECD Theorem 24.1 p. 152 (6329), Prop. 23.10 p. 145 (6060); Berkovich 1993 Theorem 7.3.1 p. 135 (4841), Prop. 7.3.2 p. 137 (4912), Theorem 6.4.1 p. 125 (4477), Theorems 7.4.1, 7.4.3 and Cor. 7.4.4 p. 143 (5091–5110), Theorem 7.4.9 p. 145 (5168); Zavyalov Foundations Lemma 10.3 p. 31 (1378: overconvergent `F`, dense pro-open `j`, `F ≅ Rj_*j^*F`); Hansen §1 p. 2 | exact; Huber 7.4.2–7.5.6 not readable |
| 10.4 | Berkovich 1993 Theorem 6.2.1 p. 112 (4001), Remark 6.2.10 p. 118 (4225: the last statement fails without `n` prime to the residue characteristic), Theorem 6.3.2 p. 119, Cor. 6.3.3 and Remarks 6.3.4 and Theorem 6.3.5 p. 121 (4311–4338), Cor. 6.3.6 p. 122 (4369), Theorem 6.4.1 p. 125, Remark 6.4.2 p. 127; ECD Theorem 19.5 pp. 110–111 (4551) and its proof p. 112 | exact |
| 11.2 | Stacks Lemma 59.95.4, tag 0F0T (read online: `cd(L) ≤ cd(K) + trdeg_K(L)` for any field extension, infinite transcendence degree allowed); ECD Prop. 27.2 p. 163 and its proof p. 164 (6788); Berkovich 1993 Cor. 7.5.3 p. 150; Huber 2.8.1–2.8.4 and 6.1.1 not readable | exact for the readable items |
| 11.3 | ECD Theorem 25.1 pp. 158–160 (6584); Ito Example A.1 p. 47 and A.1 p. 46 (0cb1be 2098–2133), Theorem 6.8 and Remark 6.9 p. 35 (1592–1597), Lemma 6.12 p. 37 (1701), §6.1 p. 31; LRZ Prop. 4.1.6 p. 30 | exact |

**Adversarial computations.** `Λ` is a nonzero finite ring of order prime to the residue characteristic unless stated; tuples list ranks in degrees 0, 1, 2, ….

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| ZR vanishing (Lean, 78) | `E = F = ∅` | `Y = Spv K`; the trivial valuation `K` lies in every nonempty open; constant sheaves flasque; `Hⁿ = 0`, `n ≥ 1` | holds |
| ZR vanishing | `E = K, F = {0}`; `E = K, F ∋ 1` | `Y = {K}`, `Hⁿ = 0` for `n ≥ 1`; `Y = ∅`, all `0` | holds; `F ⊆ 𝔪` is the condition |
| ZR vanishing | `n = 0`, `G = ℤ/2`, `Y` connected nonempty | `H⁰ = ℤ/2`, not subsingleton | `0 < n` needed, present |
| ZR vanishing | `G = ℤ` | Huber Prop. 4.1: some `K, E, F` with `H¹(Y, ℤ) ≠ 0` | torsion needed, present |
| ZR topology | `K` a field, `basicOpen f s` | `s ≠ 0`: `{f/s ∈ V}`; `s = 0`: `∅` | Tau Ceti's topology is Huber's `D(a)` topology |
| Transfer (Lean, 96) | `ι = id`, `E = {x}`, `W = S = ∅`; `E = {1}` | both sides true at `x = 0`; both false | holds |
| Transfer | `S = {(0, x), (x, 1)}`, `v` trivial, `w` nontrivial | `K`-side false, `L`-side true | `v.IsNontrivial` needed, present |
| Transfer | `n = 0`, all empty; `S = {(1, 1)}` | both true; both false | holds |
| Transfer | model theory | Robinson's model completeness of nontrivially valued algebraically closed fields gives `K ≼ L` for an embedding preserving and reflecting `≤` on values; the stated existentials transfer | true as stated |
| Section lift (Lean, 114) | `V = K` a field | `ResidueField V = K`, `t = s` | holds |
| Section lift | `V = O_C`, `B = V[x, y]/(xy − π)`, `s(x) = s(y) = 0` | `B` torsion-free hence flat; `x = y = √π ∈ 𝔪` | holds, needs `C` algebraically closed |
| Section lift | `V = O_C`, `B = V/𝔪` | `s = id` exists, no `V`-map `V/𝔪 → V`; `B` not flat | flatness needed, present |
| Section lift | `B = V[x]/(πx − 1)` | no `s` (`πx = 1 ↦ 0 = 1`) | vacuous instance, consistent |
| cd bound (Lean, 125) | `K = L = 𝔽_q`, `ℓ ∤ q`; `K = ℚ`, `ℓ = 2`, `L = ℚ(t)`; `trdeg` infinite | `1 ≤ 1 + 0`; `⊤ ≤ ⊤ + 1`; right side `⊤` | holds, `⊤` handled |
| cd bound | `K` separably closed char `p`, `L = K(t)`, `ℓ = p` | `cd_p(L) = 1 ≤ 0 + 1` (Artin–Schreier) | holds at `ℓ = p` |
| 1.1 universes (44, 97, 130) | `ν^*` on `Λ_X` | `ν_*ν^*Λ_X ≅ Λ_X` (Scholze Cor. 3.17(i)); sections of `ν^*F` over `U ∈ X_ét` are `u`-small | Check 225 consistent |
| 1.1 extension by zero (222–223) | split double cover `X ⊔ X → X`; rational `U = {|T| ≤ |p|}` in the closed disc, rank-two frontier point `x` | `h_!(F, G) = F ⊕ G = h_*(F, G)`; `(j_!Λ)_x = 0`, `(j_*Λ)_x = Λ` | Checks correct |
| 1.1 points (237, 239) | rank-two `Spa(C, C⁺)`, skyscraper at `s`; `Spec C → Spec K`, finite étale `L` | stalks `Λ → 0`; fibre `Hom_K(L, C)` has `[L : K]` elements | Checks correct |
| 1.4 `Dᵇ_c` (602–603) | `ℓ: ℤ/ℓ² → ℤ/ℓ²`; `⊕_{n ≥ 0} Λ[n]` | kernel and cokernel `ℤ/ℓ`; cohomology in every degree `≤ 0`, not in `t.plus` | Checks correct |
| 1.4 adic systems (616–620) | constant `ℤ/ℓⁿ`; `ℤ/ℓ`; `(ℤ/ℓⁿ[1])`; `(μ_{pⁿ})`; `E = ℚ_ℓ(√ℓ)` | `H⁻¹ = 0`; `K_n = [ℤ/ℓⁿ →ℓ ℤ/ℓⁿ]`, `H⁻¹ ≅ ℤ/ℓ` with zero transitions, non-split for `n ≥ 2` (R02); `H⁻¹ = ℤ/ℓⁿ` surjective transitions, not pro-zero; locally free rank one; `𝒪_E/ℓⁿ = 𝒪_E/𝔪_E^{2n}` | all correct except the splitting |
| 1.4 heart and `H⁰` (608) | `K_{n+1} ⊗ᴸ ℤ/ℓⁿ ≅ K_n`, `K_n` in degrees `≤ 0` | `H⁰(K_n) = H⁰(K_{n+1}) ⊗ ℤ/ℓⁿ = H⁰(K_{n+1})/ℓⁿ` (right exactness) | strictness claim correct |
| 2.1 Gabber test (753); henselian non-example (833); `A^h ≠ Â` (879) | `ℤ_(3)`, `T² − T + 3`; `ℚ` 3-adic, `X² − 7`; `ℚ` `p`-adic | root `1` mod 3, discriminant `−11` not a rational square; `7 ≡ 1` mod 3, no root in `ℤ_(3)`; `A^h = ℚ_p ∩ ℚ̄` countable, `ℚ_p` not | correct |
| 2.2 special subset (940–941) | `S(∅|{T}/1)` in `Spa(ℤ_p[T], ℤ_p[T])` | complement `R({1}/T)`; connected spectrum | closed, not open; correct |
| 2.4 models (1106) | `A = K`; `A = ℤ, K = ℚ` | `{K}`; `{ℤ_(p)} ∪ {ℚ} ≅ Spec ℤ` | correct |
| 3.1 tautness (1323, 1326) | two discs glued along the punctured disc; open unit disc | intersection of two affinoids not quasi-compact; partially proper, taut, preimage of the base not quasi-compact | correct |
| 3.3 Serre class `P` (1550) | extension `0 → F' → F → F'' → 0` with bounds `(r', k')`, `(r'', k'')` | `p^{k''}τ_{r''}(x) ∈ F'`, then killed by `p^{k'}` after `r'` more steps: bounds `(r' + r'', k' + k'')` | closed under extensions, as stated |
| 3.3 `pᵏ ∈ isoModSerre` (1550, 1558) | trivial rank-one `T` | kernel `(pⁿ⁻ᵏT_n)_n`: transition from level `n + k` lands in `pⁿT_n = 0`; cokernel killed by `pᵏ` | correct |
| 3.3 faithfulness (1550) | `f: T → T'` zero in the localization | `im f ∈ P`; transitions of `T` surjective, so `pᵏ` kills `f_n(T_n) ⊆ T'_n[pᵏ] = p^{n−k}T'_n`; lifting `x` to level `n + k` gives `f_n(x) = 0` | argument sound |
| 3.3 uniformity (1560) | `⊔_{n ∈ ℕ} Spã(K, K°)`, tower `ℤ/pⁿ` on component `n` | no single `k` kills it; `End = (∏ ℤ_p) ⊗ ℚ_p ≠ ∏ ℚ_p` | correct |
| 3.4 bounded lattices (1609, 1611) | rank one, `m = 0, 1, 2` | `1, 3, 5` lattices; empty join `ℤ_p`, `pℤ_p`; `pℤ_p ∨ p⁻¹ℤ_p = p⁻¹ℤ_p` | correct |
| 3.5 coverings (1663–1665) | identity; empty; proper open of connected `X` | fibres `1`; `0`; image not a union of components | correct |
| 3.6 (1747–1749, 1803) | `M(k)`; `M(C)`; Tate curve; two `ℙ¹` glued at `0, ∞` | `Gal(k^sep/k)`; trivial; `ℤ`; `π₁^alg = ℤ̂`, image `ℤ` | correct |
| 3.7 degree-one criterion (1834–1836) | identity; split degree `d`; `T ↦ T^d`, `d > 1` prime to `p` | one point per fibre; `d` points; residue extension `k(t)/k(t^d)` of degree `d` | correct |
| 4.1 étaleness (1939–1941) | `Spf W(𝔽_{pⁿ})`; `Spf ℤ_p[√p]`; `Spf 𝔽_p → Spf ℤ_p`; `Spf ℤ_p[[T]]` | étale; `𝔽_p[x]/(x²)` not étale; `𝔽_p` not flat over `ℤ/p²`; `pℤ_p[[T]]` not an ideal of definition | correct |
| 4.2 support vs tube (2073–2074) | `Spf ℤ_p⟨T⟩`, `L = {(p, T)}` | `λ⁻¹L = {|T| < 1}` contains `η_{1⁻}`; the tube does not | correct |
| 4.4 completion data (2332–2334, 2362) | `Spec O_K`, `(ϖ)`; `𝓘 = O_X`; `Spec O_C[T]`, `(p, T)`; `Spec ℤ_(p)`, `(p)`, `ℤ/ℓ` | `Y = Spec k`, `d(X^) = Spa(K, O_K)`; `Y = ∅`; not of type (S); `H¹(Spec ℚ, ℤ/ℓ)` infinite, `H¹(Spa ℚ_p, ℤ/ℓ)` finite | correct |
| 4.5 microbial base (2432–2434) | rank-two `A ⊂ O_K`, `K = ℚ_p(t)^` Gauss | `d(X^) = Spa(K, A)` has two points, `T = {v_2}` closed not open | correct |
| 4.6 classes (2550–2553) | `r = 1`; `XY − ϖ_K`; `XY − uϖ_K²`; `X² − ϖ_K` | smooth; nodal, reduced; `(ϖ_K, X, Y)` needs 3 generators in dimension 2; non-reduced fibre | correct |
| 4.7 cutoff (2641–2644) | `p = 2, e = 0, 3`; `p = 3, e = 1, 2` | `0`, `6`; `⌈3/2⌉ = 2`, `3` | correct |
| 4.7 square (2738) | `p = 2, e = 2, m = 2` | `(1 + ϖ)² ≡ 1 + ϖ²` mod `ϖ³` since `v_K(2) = 2`; `1 ↦ 0` in `O_Y/Z⁰` | correct |
| 5.1 quadruple (2857–2858) | `Γ = ℤ × ℤ` lex, `0 ⊊ 𝔭 ⊊ 𝔪`; `ℤ_(p)` | `V_𝔭` a DVR with residue field `Frac(V/𝔭)` not separably closed; `K` not separably closed; `ℤ_(p)` not henselian | only `s = 𝔪`; correct |
| 5.1 strict henselization (2865) | `𝔭 ≠ 0` | residue field of the integral closure in `K^s` is algebraically closed: `X^p − α − πX` is separable with root reducing to `ā^{1/p}` | (c) correct |
| 5.2 Kummer (2929–2930, 2957) | `X = Spec V[t]/(tⁿ − π)`, `n` prime to `p` | `X_η̃ = Spec L[t]/(tⁿ − π) = ∏_n L`, `R⁰Ψ = Λⁿ`, `R^qΨ = 0`; `i^*R(j_η)_*ℤ/n` has `H¹ = Hom(I_K, ℤ/n) ≠ 0` | correct; Galois action permutes the `n` embeddings |
| 5.3 amplitude; Gauss valuation; tame quotient (3066, 3113, 3076) | `⊔_d` products of `xy = π`; `V = ℤ_(p)`, `p + T`; `Γ = ℤ, ℤ_(p), ℤ × ℤ` | `R^dΨ = ℤ/ℓ(−d)`, unbounded; `|p + T|_G = 1`, `(p + T)/p ∉ V(T)`; `∏_{ℓ ≠ p} ℤ_ℓ(1)`, trivial, `∏ ℤ_ℓ(1)²` | correct |
| 5.4 tube–fibre (3044, R06 of r2) | `X = Spec V[x]/(πx)`, `n` prime to `p` | tube and fibre at the origin both `Λ`; elsewhere both empty | holds; route via `𝔸¹` now stated |
| 5.6 ULA (3357, 3390) | nonfield rank-one AIC `V`, `i_*Λ` | generic restriction `0`, closed stalk `Λ`; `j^*A = 0 ⇒ A = 0` for ULA `A` | correct |
| 6.1 surjectivity (3504–3509) | `O_C → O_{C'}`; `C⁺ ⊊ O_C`; `A → A/𝔭`; `ℤ_(p) → ℤ_p` | onto `{0, 𝔪}`; closed point of `Spec O_C` lands on the height-one prime; generic point missed; faithfully flat | (i)⇔(ii)⇔(iii) instances correct |
| 6.2 `c_U` (3579–3580) | rank-two `C⁺`, `S₀ = {s}`, `E = j_{U*}ι_*Λ`; `S₀ = V(𝔭_A)` | left stalk `Λ`, `RΨ_S(j^*E) = 0`; `U_S = {η}` | not an isomorphism; isomorphism; correct |
| 6.2 proper comparison (3594–3596) | `X = Spec K ⊆ S`; `ℙ¹` with `ℤ/p`; char-`p` `C`, `𝔽_p` | `RΓ(X_s, RΨΛ) = 0 ≠ Λ`; `Hⁿ(ℙ¹_k, RΨℤ/p) ≅ Hⁿ(ℙ¹_C, ℤ/p)`; `H²(ℙ¹_C, 𝔽_p) = 0` | correct |
| 6.3 invariance (3610–3612) | rank-two `C⁺ → O_C`, `G = j_!Λ`; `𝔸¹_K ⊂ 𝔸¹_L` char `p`, `ℤ/p`; `ℙ¹`, `ℤ/p` | `H⁰(S, G) = 0`, pullback `Λ`; `λx`, `λ ∉ K`, not in the image; isomorphism (proper) | hypotheses necessary and present |
| 7.1 extensions (3831–3834) | `(C, C⁺) → (C, O_C)` rank two; `C⁺ = O_C` | image `{η}`; one point | correct |
| 7.2 approximation (3878, 3901–3903) | `X = S`; perfectoid disc, `I = {T}`, `{T^{1/pᵏ}}` | `S_I = C`, `S_I⁺ = C⁺`; `C⟨T⟩` not perfectoid; `R = ⋃ S_I` since `r = ϖ^{−k}r⁺` and `r⁺ ∈ S_{{r⁺}}` | correct |
| 7.3 connectedness (3949, 3969) | `Z = S`; `Z = S ⊔ S`; `Z = X ⊔ X` | `Z° = {η}`; `{η} ⊔ {η}`; disconnected base change | correct |
| 8.2 compactification (4040–4044, 4070–4072) | closed disc; proper `ℙ¹`; open disc; empty morphism | one rank-two point `η_{1⁺}` (`|T| ≤ |ϖ|⁻¹` for all `ϖ`); `j` iso; `D̄ = D`; `dim.tr = −∞` | correct |
| 8.3 `f_!` (4260–4264, 4290–4294) | open unit disc; closed disc `B`, `μ_n` | `f_!Λ = 0`, `f_*Λ = Λ`; `H⁰_c = 0`, `H²_c = ℤ/n`; Berkovich compact disc `(1, 0, 0)` | correct |
| 8.3/8.4 duplicates (4328, 4456; 4338, 4466) | `X = ℙ¹_S`, rank-two `C⁺`, `F = j'_!Λ`, `Λ = ℤ/p` | Zavyalov 9.3(1) gives `RΓ = 0` for every `n`; 4328 declines to assert it | inconsistency, R04 |
| 8.4 projection (4450) | `Λ = ℤ/4`, `K = G = ℤ/2` | derived tensor has `ℤ/2` in every nonpositive degree | unbounded form needed; correct |
| 8.6 flat trace (4542–4543) | `⨿_{m ∈ ℕ} X → X`; `T ↦ T²`, `p ≠ 2`, stalk at `0` | finitely supported sums; `a ↦ 2a` (length 2) | correct |
| 9.2 traces (4691–4697) | `ℙ¹_S`, `c₁(O(1))`; rank-two `S`, `f = j ∘ p` | `Tr = 1`; `R²f_!μ_n = j_!Λ`, `Γ(S, j_!Λ) = 0`, `Hom(j_!Λ, Λ) = Λ` | sign fixed; numerical trace cannot determine the sheaf map; correct |
| 9.2 trace iso (4732–4733) | two discs; `ℙ¹_{A₀} × D(ū)` tube | `R²f_!μ_n = Λ²`, sum map; `j_!Λ_η` with zero closed stalk | correct |
| 9.3 boundary (4855, 4887) | `g = T` at the exterior boundary | `v(T)` has secondary degree `−1`; `∂[T⁻¹]` has trace `+1` | conventions consistent with 54 |
| 9.4 dimensions (4945–4949) | `B^d_Y`; origin in `B¹_K` then `B¹_K → Spa K`; `B¹_K` realization; empty space | `d + e`; `0 ≠ 1`; Gauss boundary, quasi-smooth; `−∞` | correct |
| 9.6 duality (5173, 5229) | `G = j_!ℤ/n`, `q = −2` on the ball; closed disc over open `η` of rank-two `S` | `H⁰(D, μ_n) = μ_n = Hom(H²_c(D, ℤ/n), ℤ/n)`; `RΓ(S, Rf_!Λ) = 0`, `H⁰(X, Λ) = Λ` | relative form holds, numerical pairing excluded; correct |
| 10.1 radial loci (5355–5358, 5378–5380, 5402–5404, 5427) | `T = 0`; `b = 1`; `T = 1`; `a = b`; `C⟨T/ϖ⁻¹⟩` | whole `Spa`; rational subset; `∅`; circle (weak) and `∅` (strict); contains `T = ϖ⁻¹` | correct |
| 10.4 non-concentric control (5570) | `C = ℂ_3`, `Λ = ℤ/2`, `V = {|9| ≤ |T − 1| ≤ |3|}` | `|S| ≤ |3| < 1`, `(1 + S)^{1/2}` converges, `δ₂(T) ↦ 0`; dual map `H¹_c(V) → H¹_c(A)` is `0` | correct |
| 10.4 root towers (5614, 5620) | `ℓ`-th vs `p`-th roots on `H¹(−, 𝔽_ℓ)` | `×ℓ = 0`; `×p` invertible | correct |
| 11.2 bounds (5738–5739) | `Spa(C, O_C)`; strict `m`-ball | `0`; `2m` | correct |
| 11.3 frontier (5814–5815) | annulus `0 < |a| ≤ |b| < 1`; `|b| = 1` | `{η(a), η(b)'}`; `{η(a)}` | correct |
| Conventions: variation (54) | `u = [[1,1],[0,1]]`, `v = [[1,0],[1,1]]` | `(u − 1)(v − 1) = [[1,0],[0,0]]`; `uv − 1 = (u−1) + (v−1) + (u−1)(v−1) = [[1,1],[1,0]]` | formula and order correct |

## Not verifiable

- **Huber 1996 (the book):** paywalled at the publisher; no local text. This affects every Huber book locator, in particular §§2.3–2.8, 3.1–3.9, 4.1–4.2, 5.1–5.5, 6.1–6.3, 7.1–7.5 and 8.1–8.3 (among the sampled targets: (3.5.12)–3.5.17 in 4.4, Theorem 4.1.1(c) in 7.1, 7.4.2–7.5.6 in 9.6, 2.8.1–2.8.4 and 6.1.1 in 11.2). Where a public source restates a Huber result (Zavyalov, Li–Reinecke–Zavyalov, Hansen, Hansen–Scholze, Ito, Kato, Illusie, Berkovich 1994), that restatement was checked instead and is listed above.
- **de Jong–van der Put 1996:** now readable through OCR, but the OCR is degraded (statement labels are legible, displayed formulas are not); the four sampled locators were confirmed by page and label only.
- **Berkovich 1990 (AMS Surveys 33), Prestel 1986:** no legal text found; cited by locator alone.
- **Scholze–Weinstein, Berkeley lectures:** the cached author PDF is paginated 10 pages ahead of the README's locators (Theorem 2.3.3 on file page 24, cited p. 14; Proposition 4.2.5 on file page 40, cited p. 30); the offset is uniform, so the locators are taken as consistent.

## Source issues

- **Error** in HirokiKato2020 at §3.2, before Definition 3.4, printed p. 14: the source says every finite-dimensional valuation ring is microbial; it should exclude dimension zero, since a field has no height-one prime; affects nothing (Definition 3.4 assumes microbial).
