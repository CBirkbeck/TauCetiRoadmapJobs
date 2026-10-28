# Review of ComplexComparisonPartII (pull request #848 at 2d50a88)

**Verdict:** needs changes

The gate fails (depcheck 4, residue 8, layer-ids 1; build passes). The dependency check output, run on this head:

```text
not movable: ComplexComparisonPartII consumes ComplexKahlerGeometry (#295) and is consumed by FormalConnectionsOpers (#43), which comes first: moving ComplexComparisonPartII after ComplexKahlerGeometry would put a supplier after a consumer, a cycle through ComplexComparisonPartII
UPWARD: ComplexComparisonPartII (#42) -> AlgebraicCurves (#258) at README lines [589, 2272, 2319, 4533]
UPWARD: ComplexComparisonPartII (#42) -> ComplexKahlerGeometry (#295) at README lines [27, 134, 135, 143, 144, 241]
UPWARD: ComplexComparisonPartII (#42) -> FormalConnectionsOpers (#43) at README lines [2426, 2456]
CYCLE among: ComplexComparisonPartII, FormalConnectionsOpers
depcheck: 156 roadmaps, 1082 edges, 4 problem(s)
```

## R01 (P1) — Supply cycle with FormalConnectionsOpers

Location: `TauCetiRoadmap/ComplexComparisonPartII/README.md` lines 138, 175–181, 2399–2426 ("Use FormalConnectionsOpers F2.2's ordinary algebraic foundation … *Needs:* FormalConnectionsOpers F2.2's algebraic operator and principal-parts foundation") and 2456.

Claim: C5.1 consumes FormalConnectionsOpers F2.2 for `IsDifferentialOperator`, the commutator-order calculus and the all-order principal parts.

Witness: FormalConnectionsOpers (merge order #44, right after this roadmap at #43) consumes this roadmap: its README supplier table reads "ComplexComparisonPartII C−1.1, C0.3–C0.4 and C5.1–C5.2 | The single scheme analytification functor … analytic differential-operator and connection dictionaries", and its F2.4 "Take ComplexComparisonPartII C−1.1's `complexSchemeAnalytification`". The dependency check reports `CYCLE among: ComplexComparisonPartII, FormalConnectionsOpers`.

Repair: this roadmap is the earlier one, so the notion moves down. State in C5.1 as this roadmap's own targets the order predicate `IsDifferentialOperator k m D` with its commutator characterisation, additivity, monotonicity, composition bound, localization and sheafification, and the principal-parts modules `P^m_{A/k}(M)` with universal jet, the Hom bijection, order transitions and composition maps (the README already states all of this verbatim as "the required F2.2 interface" at lines 2402–2425, with EGA IV₄ §§16.7–16.8 as locator). Delete the row at line 138, the bullet at lines 175–181 and the two `*Needs:* FormalConnectionsOpers F2.2` items; replace "F2.2 owns …" sentences by "this roadmap owns …". FormalConnectionsOpers then consumes C5.1 only, and the cycle is broken by ownership, not by the merge order.

## R02 (P2) — Upward edges reported to AlgebraicCurves and ComplexKahlerGeometry

Location: README lines 27, 134–135, 143–144, 241 (ComplexKahlerGeometry K2–K6) and 589, 2272, 2319, 4533 (AlgebraicCurves Layer 2, 12B–12C).

Claim: both roadmaps are consumed as suppliers.

Witness: the dependency check prints the two `UPWARD` lines quoted above, so the gate fails. In my reading both lines are false positives: `AlgebraicCurves` and `ComplexKahlerGeometry` are on the content repository's main branch, and the merge-order file's own header says a roadmap may consume "roadmaps on main". Every cited section exists on main: ComplexKahlerGeometry K2 (main README line 193), K3 (296), K4 (444), K5 and K5a (568, 570), K6.0 (1245), K6.1 (1274), `BundleTest`/`BundleDistribution` (631, 641), Lelong estimates (1301); AlgebraicCurves Layer 2 (436), 12B (1115), 12C (1128). The open revisions of these roadmaps are not cited.

Repair: none in the README if the board agrees these are main roadmaps; otherwise the only movable repair is R01, after which the "not movable" line disappears. I report the exact lines so the board can settle it; I did not edit the tooling or the order.

## R03 (P2) — `perfect_proper_pushforward` is cited for a statement EnhancedDerivedSheaves E1.9 does not make

Location: README lines 217–219 ("*EnhancedDerivedSheaves, E1.9.* `perfect_proper_pushforward` supplies perfect pushforward of a perfect complex tensored with a bounded finitely presented, target-flat complex with proper support, and its arbitrary derived base-change comparison"), 609–612, 1913, 2000.

Claim: C3.2b (`strongProperSupportExistence`), C3.2d.1 and C3.2d.3 consume this from E1.9.

Witness: on main, `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` line 925 "### E1.9 Perfect pushforward with proper support" states one target, `spaceProperSupport_coherent`: for a locally finite type quasi-separated `f` of algebraic spaces with Noetherian target and coherent `M` with proper support, `R^q f_*M` is coherent, and `D^b_Coh` is preserved. No perfectness of the pushforward, no tensor with a target-flat complex and no base-change comparison is stated. The name `perfect_proper_pushforward` occurs nowhere on main or at any open head except this pull request (and AbelianSchemesAndArithmeticModuli citing it). The input of C3.2b is therefore unowned.

Repair: either state the perfect proper-support pushforward with its base-change comparison as a target of C3.2b here, with hypotheses (perfect `K`, bounded finitely presented `F` flat over the target, support proper over the target, Noetherian base), consuming E1.9 `spaceProperSupport_coherent` and AlgebraicModuliForArithmeticGeometry §7.7 `spacePerfect.torAmplitude`; or declare `gap:perfect-proper-pushforward` on EnhancedDerivedSheaves E1.9 with exactly that sentence as `needs`, in the README and in `plan.json`. In both cases cite the supplier by its existing name.

## R04 (P3) — Process residue: anchor tags and "handoff"

Location: README lines 890, 1233, 1700, 1775, 2142, 2325, 3976 (`<a id="c0"></a>` … `<a id="c6"></a>`) and line 132 (table header "Reciprocal handoff and retained scope").

Witness: gate rule "no process residue … `<a id=` anchor tags … handoff"; eight hits.

Repair: delete the seven anchor lines; rename the column, for example "What this roadmap adds and what the supplier retains".

## R05 (P3) — Layer id `C−1` is not a bare label

Location: README line 697 "## Layer C−1: Analytic local foundations".

Witness: gate rule "a layer heading reads `Layer N: title`: its id, before the colon, is a bare label"; the id contains a Unicode minus.

Repair: renumber the layers C0–C7 (C−1 → C0, …, C6 → C7) and update every `§C−1.k` and `Ck` reference, or use an ASCII label such as `Layer CA`.

## R06 (P3) — CharacteristicClasses locator: the small-chain sheaf resolution is in C1.2b, not "C1.2 item 2"

Location: README lines 264–268 ("*CharacteristicClasses, C1.2, locally acyclic resolution in item 2.*"), 498–507, 517–518, 4096.

Witness: on main, CharacteristicClasses C1.2 item 2 (README line 326) is "Bockstein input". The locally acyclic singular-cochain sheaf resolution on a Hausdorff CW representative is constructed inside `cechSingularCWTypeComparison` (lines 462–470), within C1.2b (line 419).

Repair: cite "CharacteristicClasses C1.2b, `cechSingularCWTypeComparison`'s locally acyclic singular-cochain sheaf resolution" at each of the four places.

## R07 (P3) — `CoherentAnalyticModule.presentation_iff` does not exist in RealAnalyticGeometry on main

Location: README lines 145, 154, 237, 902, 919, 965.

Witness: `TauCetiRoadmap/RealAnalyticGeometry/README.md` on main, R3.2 item 0 (lines 735–800), constructs the coherent carrier and says "prove equivalence with that finite-presentation predicate over coherent O" without naming a declaration; `roadmaps grep presentation_iff` finds the name only in this pull request. The open revision of RealAnalyticGeometry is not a dependency.

Repair: cite "RealAnalyticGeometry R3.2 item 0, the finite-presentation equivalence" and drop the backticked name.

## R08 (P3) — GlobalHolomorphicFunctions has no section GH0.3

Location: README lines 29, 134, 149, 230, 522, 1246, 1261, 1656.

Witness: at its open head, GlobalHolomorphicFunctions has "### GH0. Plane domains, compact hulls, and Runge approximation" (line 378) with the finite-rank Runge operator at line 563, and the compact-support Cauchy–Green lemma in the preparatory section "#### Compact-support Cauchy–Green" (line 192). No "GH0.3" exists; the worker's citation check reports the same.

Repair: cite "GlobalHolomorphicFunctions, preparatory compact-support Cauchy–Green and GH0's finite-rank Runge operator".

## R09 (P3) — `LogCrystalline.PrelogRing.IsLog` is not a CrystallineCohomology name

Location: README line 188.

Witness: at CrystallineCohomology's open head, CR.5:log-algebra.1 names `LogCrystalline.PrelogRing` (line 7530) and the log-structure carrier `LogCrystalline.LogStructure` with `stalk_is_log` (lines 7561–7563); no `PrelogRing.IsLog`.

Repair: cite `LogCrystalline.LogStructure`.

## R10 (P3) — Pull-request links in the README

Location: README lines 175 and 269 (links to `pull/1056` and `pull/973`).

Witness: house rule "Cross-roadmap citations name the roadmap and its section or target, never a pull-request number, including for roadmaps still in pull requests."

Repair: keep the roadmap name and section; delete the two URLs.

## R11 (P3) — Roadmaps that exist nowhere are named

Location: README lines 347 and 4434 (LogicAndDefinabilityInNumberTheory LD.6), 352 and 4460 (HodgeStructuresPartII), 4469–4470 (AbelianVarietiesIsogenousToNoJacobian, HyperbolicCurveVolumesAndGonality, EllipticRegulators).

Witness: `roadmaps show HodgeStructuresPartII` answers "no roadmap … on main or in an open roadmap pull request"; the other four names are absent from main and from `roadmaps list` (LogicAndDefinabilityInNumberTheory is a board package only). None is a supplier, so nothing is blocked.

Repair: describe these consumers and exclusions generically, or name only roadmaps that exist.

## R12 (P3) — Locators: Freitag absent from References; a Stacks theorem cited without its tag

Location: README lines 711, 731, 740, 3442, 3485 (Freitag, *Complex Spaces*) and line 1690 ("Stacks, More on Morphisms of Spaces, Theorem 42.11, pp. 103–104").

Witness: `## References` (lines 4475–4533) has no Freitag entry; every other Stacks citation in the README carries a tag, and chapter page numbers are not stable locators.

Repair: add Freitag with edition and year to References; replace the Stacks locator by its tag.

## R13 (P3) — `relativeHodgeBundles` is narrower than its source

Location: README line 2994 ("let `f : X → S` be smooth and proper with `S` locally Noetherian over a field of characteristic zero").

Witness: deligne1968 line 651, Théorème (5.5), printed p. 123: `S` is any scheme of characteristic zero; the README's own route (line 3001, Noetherian approximation) needs no Noetherian hypothesis because a proper smooth morphism is of finite presentation.

Repair: drop "locally Noetherian" or state why it is kept.

## Verified sound

**Gate and build.** `lake env lean` on a copy of `Suggested.lean` with `#check @` lines appended: the three declarations elaborate with `sorry` as the only warning; no section variables exist, so no binder is lost. Elaborated types agree with the README: `montelTheorem` on a finite-dimensional complex normed space `E` (README "open Ω ⊆ ℂⁿ"), `schwartzFiniteness` on complete metrizable Hausdorff locally convex complex spaces (README "Fréchet spaces", surjection plus compact operator), `sheafSingularComparison` with `LocallyContractibleSpace T` and arbitrary `A : AddCommGrpCat` (README "semilocal contractibility, every abelian group, no Hausdorff assumption"). The Mathlib definition at the pin (`Mathlib/Topology/Homotopy/LocallyContractible.lean` line 81) is "for every `x` and neighbourhood `U`, some neighbourhood `V ⊆ U` has null-homotopic inclusion", and Sella's definition (sella2016 line 16) is "every open `U` is covered by opens contractible in `U`"; the two are equivalent (pass to the interior of `U`, then to an open neighbourhood inside `V`), so the Lean hypothesis is exactly the source's.

**Padding probe.** Each of the three theorems with `exact?` alone, and with `simp`: none closes (three "could not close the goal"); nothing is padding. No sorried data, no `set_option`, single `import Mathlib` plus one existing `TauCeti.*` module.

**Headlines.** The README's layer table lists 60 headline targets. All but the three stated need carriers absent at the pins (complex analytic spaces with nilpotents, analytification, algebraic-space derived categories, global form and connection complexes, log schemes, constructible étale coefficients), and the module docstring names each group and what it lacks. `frechetOpenMapping` is not a duplication: Mathlib's open-mapping theorem at the pin (`Mathlib/Topology/Algebra/Group/OpenMapping.lean`) needs a σ-compact group, which infinite-dimensional Fréchet spaces are not.

**Pinned declarations opened** (file and line): `TauCeti.montel` (`TauCeti/Analysis/Complex/Conformal/Montel/Basic.lean` 81, one variable, proper target); `ContinuousLinearMap.IsFredholm.add_of_isCompactOperator` (`TauCeti/Analysis/Fredholm/CompactPerturbation.lean` 87); `TopCat.singularCohomology` and `singularCohomologyFunctor` (`TauCeti/AlgebraicTopology/Cohomology/Basic.lean` 129); `TopCat.singularCup` (`Cohomology/Cup.lean` 203); `smallSingularSubcomplex` (`Singular/Subdivision/Small/Relative.lean` 53); `smallSingularChainHomotopyEquiv` (`Small/Equiv.lean` 422); `smallSingularSubdivisionHomotopy` (`Small/Homotopy.lean` 153); `TauCeti.LocalCoefficientSystem` (`AlgebraicTopology/LocalCoefficient.lean` 43, `FundamentalGroupoid X ⥤ ModuleCat R`); `twistedCochainComplex` (`Cohomology/Twisted/Basic.lean` 79); `TauCeti.Hodge.HodgeStructureOn` (`Geometry/Hodge/Structure.lean` 62: decreasing exhaustive filtration, `opposed` via `IsCompl`) and `Conjugation` (`Hodge/Conjugation.lean` 102); `TauCeti.holomorphicSheaf` (`Analysis/Complex/HolomorphicSheaf.lean` 180); `ringCatSheaf` (`Algebra/Category/ModuleCat/Sheaf/Defs.lean` 60); `isMonoidal_isFinitePresentation` (`Sheaf/Quasicoherent/Monoidal.lean` 162); `subsingleton_H_succ_of_isFlasque` (`Topology/Sheaves/Flasque.lean` 156); `FinitelyPresentedSheaf` (`AlgebraicGeometry/FinitelyPresentedSheaf/Basic.lean` 48); `IsSemialgebraic`, `IsSemialgebraicOn`, `IsSemialgebraicMap` (`Geometry/RealAlgebraic/Semialgebraic/Basic.lean` 68, `Image.lean` 139–227); `AnalyticAt.exists_openPartialHomeomorph` (`Analysis/Analytic/Inverse.lean` 105). Mathlib: `LocallyContractibleSpace`, `IsCompactOperator`, `Sheaf.H`, `Ext.mapExactFunctor`, `Module.FaithfullyFlat.of_flat_of_isLocalHom`, `Module.free_of_flat_of_isLocalRing` (`RingTheory/LocalRing/Module.lean` 299), `Module.Flat.of_flat_tensorProduct` (`RingTheory/Flat/FaithfullyFlat/Basic.lean` 588, descent along faithfully flat `S`), `AddSubmonoid.NSMulSaturated`, `Algebra.GrothendieckGroup`, `SheafOfModules.IsFinitePresentation`/`IsLocallyFree`, `Distribution.lineDerivCLM`/`ofFun`/`delta`, `TestFunction`, `ContDiffAt.to_localInverse`, `circleIntegral.integral_sub_inv_of_mem_ball`, `topologicalKrullDim`, `IsSchemeTheoreticallyDominant`, `Module.length`, `Manifold.IsSubmersion` (`Geometry/Manifold/Submersion.lean` 553), `IsLocallyNoetherian`, `IsProper`, `Scheme.Hom.ker`, `Flat`, `smoothSheafCommRing`: all present with the stated meaning.

**Cross-roadmap citations resolved** (on main unless noted): EtaleCohomologyFoundations G.1–G.3 (lines 57, 105, 139), F.0.1–F.0.4, 0.7, 0.8, 0.11 and every `VanishingCycles.*` / `ClassicalAlgebraic.*` name cited (lines 107–1203); EnhancedDerivedSheaves 0.1–0.4 (429–492), E1.9 (925), `ClassicalDerived.tensorHom`/`functorCoherence`/`inverseLimits`/`derivedCompletion`; DerivedModuleAlgebra 1.E.1 `perfectInverseSystemEffectivity` (2200); SchemeAndStackFoundations 2.1, 2.2, 2.6, 2.18, 2.19, 2.20, 4.12, Layers 0, 1, 2, 5 and the named declarations; GeometricCurrents G1 `Current k M` with `∂T(ω)=T(dω)` (line 55); AffineMorseLefschetz A4 (208); ComplexManifolds Milestones 1 and 7 (172, 319); AlgebraicVectorBundles L0A–L0C; DifferentialGeometry Layers 0–2, 5, 6, 8 (`deRhamEquiv` 852), 9; PDE Lanes A, D, E; JacobianChallenge Layers B, C; StableReduction Layer 2; AlgebraicTopology Stages 2, 6, 8; RealAlgebraicGeometry Layers 3, 6; UniversalCovers; HodgeStructures. At open heads: ResolutionOfSingularitiesCharacteristicZero §§1.3, 6.2, 6.4 with `sncBoundary`, `sncCompactification`, `sncCoordinates` (its export table lists this roadmap as consumer); AlgebraicModuliForArithmeticGeometry §7.7 with all six `spaceDQCoh.*` names, `spacePerfect.*`, §7.9 `spaceSectionComponentCriterion`, §7.3 `PicardStackSpaces`, §8.3, §§9.10–9.11, `relativeSerre`, `coherentDevissage`, `devissageViaChow`, `properSpaceCompletionEquivalence`; DerivedDeRhamCohomology Layer 2, `DeRham.complex`, `DeRham.complexMap` (3199), `DeRham.d_squared`, `DeRham.d_leibniz`, `DeRham.pullback`; CrystallineCohomology CR.1.3 "Modules with integrable connection and their de Rham complexes" (1230) with `Crystalline.Connection.extend`, CR.5:log-algebra.1–.4, CR.5.1, `IsFineMonoid`, `IsSaturatedMonoid`, `IsLogSmooth`, Kato chart criterion (7907), `divisorialLog`, `logDifferentials.dlog_mul`/`d_alpha`/`lift`, `logDeRham`; TopologicalSheafCohomology TS3 items 1–3 and 7 (item 7 does state the compact-support sheaf/singular bridge on finite-dimensional locally finite Hausdorff CW pairs through CC S0–S4 with S5's controlled collars); SmoothBundlesConnections B1 item 5 (Ehresmann, componentwise fibres), B2, B6.1–B6.4; GlobalHolomorphicFunctions finite-rank Runge (563); LefschetzPencilsAndVanishingCycles 0.8a and InverseGaloisAndArithmeticFundamentalGroups IG.3.1, IG.5.5 as consumers; DiamondsAndVStacks D0.19. Conventions agree across suppliers: K4's holomorphic connection is forms-first `∇:E→Ω¹⊗E` with monodromy `M(γ)=e⁻¹T_γe` (main lines 495–512), as C5.2 says; GeometricCurrents' unsigned boundary matches C5.4's sign `(−1)^(2n−q+1)`.

**Ownership against open pull requests** was checked by name for `perfect_proper_pushforward`, `presentation_iff`, `GH0.3` and `IsDifferentialOperator`; a by-object search of all 376 open pull requests for the analytification, current and Artin-comparison constructions was not done.

**Seeded sample, sources at their locators.** grothendieck1966 lines 30, 72, 86: Theorem 1 (affine, p. 95), Theorem 1′ (general smooth, p. 96) and the complete-case remark (p. 96) as cited. sella2016 lines 45, 69, 157, 188: Theorem (p. 2), Lemma 0.1 (pp. 2–3), Example 0.3 (p. 5), nestings (p. 6). deligne1968 lines 651, 689, 701: Théorème 5.5 (p. 123), Lemme 5.5.3 and (5.5.4) (p. 124) state exactly the resolution of the constant sheaf `A` and the length identity used by `artinDeRhamBetti`. deligne1970 (IAS copy, extraction page = printed page + 3): I.2.3 (p. 6), 2.10 (p. 9), 2.19 (p. 13), 2.20.3 (p. 13), 2.22 (p. 14), 2.23.3 (p. 16), 2.25 (p. 19), 2.27–2.29 (pp. 19–21), II.5.3 (printed "4.3", p. 94), 5.4 (p. 94), 5.6 (p. 96), II.6.5–6.6 (pp. 100–101: operators extend through `P^N(F)^an = P^N(F^an)`, hypercohomology comparison by the stupid-filtration spectral sequence), II.7.7 Katz–Oda (p. 117). ega4-4: §16.8 at p. 39, (16.8.1)–(16.8.4), (16.8.8), (16.8.9) and (16.8.9.2) on pp. 39–42. demailly-agbook (extraction page = printed page): I.2.6 `⟨dT,u⟩=(−1)^(q+1)⟨T,du⟩` and I.2.7 `d[Z]=(−1)^(m−p+1)[∂Z]` (p. 15), I.3.12 Montel (p. 23), III.1.14–1.15 (pp. 133–134), III.1.21, 1.24 (pp. 135–136), III.2.3 El Mir (p. 139), III.2.5–2.7 Lelong (p. 140), III.2.10 (p. 141), V.13.1–13.4 with `i d′d″ log|s|² = 2π Σ m_j[Z_j] − iΘ(E)` (p. 271), VI.8.6 (p. 311), IX.1.8 Schwartz and IX.1.9 (pp. 406–407). sga1 (arXiv edition, printed page = extraction page − 16): XII Théorème et définition 1.1 (p. 239), 2.1 (242), 3.1–3.2 (244–245), 4.2 (248), 4.3 (249), 4.4 (249–250), 5.1 Riemann existence (251). milne-lec: Theorem 21.1 (p. 130), 21.5 (132), Definition 21.7 and Proposition 21.8 (133). bhattscholze2015: §6.5 (line 2294) and §6.6 present. hatcher-at: §3.H from p. 327. dgh2021: Proposition 4.2 (p. 17), (4.3) (p. 17), (4.9) (p. 18).

**Adversarial table** (statement; instances; values on each side; result; change):

| Statement | Instances | Values | Result | Change |
| --- | --- | --- | --- | --- |
| `montelTheorem` | `Ω = ∅`; `E = ℂ`; `f n = zⁿ` on the unit disc | empty case: every clause vacuous, take `φ = id`, `g = 0`; `E = ℂ` is `TauCeti.montel` with proper target `ℂ`; `zⁿ` bounded by 1 on compacts, limit `0` locally uniformly | true | none |
| `schwartzFiniteness` | `h = 0`; `E = F = ℂ`, `g = id`, `h = −id`; `ℓ²`, `g = id`, `h = diag(−1,0,0,…)`; `g = diag(1,1/2,…)`, `h = 0` | range `F`, codim 0; range `0`, codim 1; range `{x₁=0}`, codim 1; last `g` not surjective and range not closed, so surjectivity is needed | true, hypothesis necessary | none |
| `sheafSingularComparison` | point; `∅`; `S¹`, `A = ℤ`, `q = 1`; Cantor set | `A`/`A`, then `0`/`0`; `0`/`0`; `ℤ`/`ℤ`; Cantor set is not locally contractible and sheaf `H⁰` (locally constant maps) differs from singular `H⁰` (all functions on points), so the hypothesis is needed | true | none |
| Current sign `(dT)(η)=(−1)^(k+1)T(dη)` | smooth `k`-form; closed disc; segment `[a,b]` | Stokes gives `∫dα∧η = (−1)^(k+1)∫α∧dη`; `n=1, q=2`: `(−1)^1`, `dJ₂[D] = −J₁[∂D]`; `q=1`: `(−1)^2`, `dJ₁[a,b] = J₀(δ_b−δ_a)` | agrees with Demailly I.2.6–2.7 and the three Checks | none |
| Lelong–Poincaré normalisation | `‖e‖² = e^(−|z|²)`; `O(1)` on `P¹` | `(i/π)∂∂̄ log‖e‖ = −(i/2π)dz∧dz̄ = −c₁`, and `(i/2)dz∧dz̄ = dx∧dy > 0`; `∫π⁻¹(1+r²)⁻² r dr dθ = 1`; the function equation on the global section would read `0 = 1` | agrees with Demailly V.13.2 after dividing by `2π` and `log|s|² = 2log|s|` | none |
| Chern class conventions | frame bundle of `L∨`, inverse character | associated line is `L`; `Θ(L) = −iF_P` gives `(i/2π)Θ = F_P/2π`; `φ^P = −2πu` gives `−δφ^P/2π = δu` | consistent with Conventions and SmoothBundlesConnections B6 | none |
| Residue and monodromy `d + a dz/z` | `a = 0, 1/2, 1/4`; strip at `−1/4`, `3/2` | `z^(−a)` horizontal: `−a z^(−a−1)dz + a z^(−a−1)dz = 0`; monodromy `e^(−2πia)`: `1, −1, −i`; `residueStripRep`: `3/4`, `1/2` | all Checks correct | none |
| `regularSingularDeRhamComparison` Checks | lattices `z⁻¹ℂ{z}`, `zℂ{z}`, global frame `z⁻¹` on `G_m` | residues `(−1,0)`: `Ē = O(1)` (sections `a + b/z`), differential `diag(0,−1)`, `H⁰ = H¹ = ℂ`; `(1,0)`: `Ē = O(−1)`, acyclic; `(−1,+1)`: `Ē = O`, map `−1`, acyclic | matches `H^*(ℂ^*,ℂ)` only when no residue is a positive integer | none |
| `artinDeRhamBetti` | `A = ℂ`; `A = ℂ[ε]/ε²`, `X = P¹_A`; `X = Spec A` | recovers `properDeRhamBetti`; `H⁰ = H² = A` of length `2 = 2·1`, `H¹ = 0`; complex `A` in degree 0 | matches Deligne 1968 (5.5.3)–(5.5.4) | none |
| Connection carrier comparison | frame change `g`; left gauge `h = g⁻¹`; `d + z dw`; `d + dz`; `d_z + t dz` | `∇(gs′) = g(ds′ + (g⁻¹Ag + g⁻¹dg)s′)`; `A′ = hAh⁻¹ − dh·h⁻¹`; curvature `dz∧dw`; frames `exp(−z)`, `exp(−tz)` | agrees with K4's forms-first carrier and gauge law | none |
| `coherentFlatConnection_locallyFree` | `O/(t)` on `A¹`, char 0; `O/(t^p)`, char `p` | Leibniz on `t·1 = 0` gives `dt⊗1 = 0`, false in `Ω¹⊗O/(t)`; `d(t^p f) = t^p df`, so `O/(t^p)` carries `d` and is torsion | characteristic hypothesis necessary | none |
| `AnalyticLogDifferentials` Checks | `ℂ{z,ε}/(ε²)`; standard log point; `xy = 0` | `Ω¹ = A dz ⊕ (A/ε)dε` from `2ε dε = 0`; `ℂ·dlog t` absolute, `0` relative to itself; `Res_y(dlog x∧dlog y) = −dlog x` | correct | none |
| `compactEllipticHodge` Checks | `P = −d² − 2`, `u = 1`; `P = −d² − 1` | `Re⟨Pu,u⟩ + ‖u‖² = −‖u‖²`; with `λ = 3`, `c = 1`: `‖u′‖² + ‖u‖²`; kernel `e^(±iθ)`, `ker(P+2) = 0` | correct | none |
| Metric and mass comparisons (C5.4) | `c g ≤ h ≤ C g`; complex comass | `√det` scales by `c^d`, `C^d` on `2d`-volumes; `Re(e^(iθ)J(T)(η)) = T(Re(e^(iθ)η))` with comass `≤ 1` | correct | none |
| C6 Checks | `Λ = ℤ/4`, `K = ℤ/2[0]`; `A¹`; `A¹ ⊔ A¹` trace | periodic resolution by `×2`: `Tor_i = ℤ/2` for all `i`, so in `D^b_c` not ctf; `H⁰_c = 0`, `H⁰ = Λ`; `Λ² → Λ` addition, not injective for `n > 1` | correct | none |
| `AlgebraicDeRham.bounded` | `⊔_{n≥0} Aⁿ` | `Ω^p ≠ 0` for every `p` on the component `A^p` | finiteness hypothesis necessary, as the Check says | none |
| `relativeHodgeBundles` | `S` non-Noetherian of characteristic 0 | Deligne 5.5 needs no Noetherian hypothesis; the route approximates | README narrower than source | R13 |
| `perfect_proper_pushforward` | E1.9 on main | `spaceProperSupport_coherent`: coherence only | citation does not match | R03 |
| `IsDifferentialOperator` / `P^m` | supplier order | FormalConnectionsOpers #44 consumes C5.1 | cycle | R01 |

## Not verifiable

- Katz–Oda 1968, Theorem 1 and §3 (13): the sources service returned only the Project Euclid landing page, not the article text; not read.
- tom Dieck, *Differential Manifolds* (2009), Theorems 2.2.1, 2.2.3, Corollary 2.2.4: the Göttingen host timed out twice; not read.
- Kato 1989, §§1.1–1.9: no legal open copy found (Johns Hopkins volume); cited by locator only.
- Freitag, *Complex Spaces*, I §§1–6, II.2: no legal copy found by the service; cited by locator only (and missing from References, R12).
- Hironaka 1975 (PSPUM 29): only the AMS landing page, licence unknown; not read.
- SGA 4 Exposés XI, XII, XVI, XVII and SGA 4½ *Théorèmes de finitude*: no open copy found; SGA 4½ resolves to a paywalled DOI; uncertified.
- Bochnak–Coste–Roy §9.2 and Dimca §§2–4: paywalled DOIs; uncertified.
- Qian, *Potential automorphy for GL_n*, Lemma 3.10(2); Peterzil–Starchenko; Whitney; Bakker–Klingler–Tsimerman; Caraiani–Scholze §2.3; Mok–Pila–Tsimerman; Serre GAGA and Séminaire Cartan 18–19; Hall, *GAGA theorems*: outside the seeded sample, not opened at their locators.
- The Stacks citation of R12 could not be resolved without a tag.

## Source issues

- **Misprint** in deligne1970 at II.5.3, printed p. 94: the source numbers the paragraph choosing the residue section `τ` as 4.3 inside §5, between 5.2 and Proposition 5.4; it should be 5.3; affects nothing.
