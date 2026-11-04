# Review of AutomorphicBundles (pull request #1069 at 055b77e)

**Verdict:** needs changes

The gate fails on one rule (`target-ids`, 119 headings), so the folder cannot be accepted in this round whatever else is found. Two P2 findings concern the supplier contracts with ShimuraCompactifications: the section labels cited do not exist at that roadmap's head and several resolve to the wrong section, and the scalar Fourier–Jacobi expansion with arbitrary coefficient modules is built twice (there as `HodgeLineFJ`, here as B5.1a). The mathematics of the sampled targets and of the Lean headline checked out; the remaining findings are locators, naming and shape.

## R01 (P3) — Target headings use a letter-prefixed scheme the gate refuses

Location: `TauCetiRoadmap/AutomorphicBundles/README.md` lines 405–5374, every `### B0.1 …`, `### B1.general.0 …`, `### B3.Hilbert.0a …`, `### B3.log.1 …` heading (119 of them).

Claim: the worker's gate reports `target-ids=119 … FAIL`, each line of the form "target id 'B0.1'; write `### k.n Title` (digits only, no prefix)".

Witness: gate output for this head, first line "line 405: target id 'B0.1'"; the board reads only `### k.n` targets.

Repair: renumber the layers as `## Layer 0` … `## Layer 11` (B0, B1, B1.general, B2, B2.general, B3, B3.general, B3.Hilbert, B3.log, B3.BGG, B3.HT, B4, B5 become consecutive integers, or merge the `.general` layers into their base layers) and every target as `### k.n Title`; update all `*Needs:*` references, the "How to read the build" paragraph, the Downstream consumers list and the Lean module docstring (which names "B0", "B1.1", "B3.log" …). Add a one-line concordance in Conventions so consumers that cite `B3.HT.7` today can translate.

## R02 (P2) — ShimuraCompactifications is cited by a labelling that does not exist at its head, and several labels resolve to the wrong section

Location: `TauCetiRoadmap/AutomorphicBundles/README.md` lines 88–104 and 320–354 (the supplier contract), and every `*Needs:*` line naming `ShimuraCompactifications C…`.

Claim: the README cites `C0.15`, `C2.3`, `C3.8`, `C3.9`, `C5.15`, `C6.13`, `C6.40`, `C2.general.1`, `C3.general.1` and so on. ShimuraCompactifications at its open head (#1053) has no "C" labels: its layers are `## Layer 0` … `## Layer 8` with `### k.n` targets. The letter scheme maps C0→0, C1→1, C2→2, C2.general→3, C3→4, C3.general→5, C4→6, C5→7, C6→8, but the numbers inside Layers 4 and 8 do not line up with the cited declarations:

| README label | declaration named | section at #1053 that states it | section the label would denote |
|---|---|---|---|
| C3.8 | `ToroidalRefinement.pushforward_boundaryIdeal` | 4.9 The boundary ideal along refinements | 4.8 Higher direct images along refinements |
| C3.9 | `ToroidalRefinement.cohomology_iso` | 4.10 Coherent cohomology does not depend on the cone system | 4.9 |
| C6.13 | `HilbertCusp.Data` | 8.14 Cusp data, lattices and the trace pairing | 8.13 Ideal-level Hilbert moduli |
| C6.21 | `HilbertModular.toroidal_exists` | 8.23 The fine Hilbert toroidal compactification | 8.21 |
| C6.23 | `HilbertModular.boundary_formal` | 8.25 Formal neighbourhoods of the boundary | 8.23 |
| C6.36 | `HilbertModular.minimal_formal` | 8.38 Toroidal completion over a minimal cusp | 8.36 |
| C6.40 | `HilbertModular.qExpansion_injective` | 8.42 The q-expansion principle | 8.40 |

Witness: ShimuraCompactifications README at #1053, heading list (`### 4.9 The boundary ideal along refinements`, `### 4.10 Coherent cohomology does not depend on the cone system`, `### 8.14 Cusp data, lattices and the trace pairing`, `### 8.42 The q-expansion principle`); the worker's resolver lists nine of these labels as found nowhere (`citations.md`). The gate's depcheck passes because it reads roadmap names, not section labels.

Repair: replace every `C…` label by the `k.n` number at #1053 using the table above and the layer map (C0.n→0.n, C1.n→1.n, C2.n→2.n, C2.general.1→3.1, C3.1→4.1, C3.3→4.3, C3.4→4.4, C3.8→4.9, C3.9→4.10, C3.general.1→5.1, C4.n→6.n, C5.n→7.n, C6.13→8.14, C6.21→8.23, C6.23→8.25, C6.36→8.38, C6.40→8.42); the C5 labels (7.3, 7.4, 7.10–7.15, 7.17, 7.21) and the C0–C2, C4 labels are numerically right once the prefix goes. Also `HilbertCusp.Data` and `HilbertCusp.tracePairing_natural` (lines 2302, 2312) are not names ShimuraCompactifications uses: 8.14 gives the cusp data and trace pairing in prose with other names; cite the section.

## R03 (P2) — Two owners for the scalar Fourier–Jacobi expansion with arbitrary coefficient modules

Location: `TauCetiRoadmap/AutomorphicBundles/README.md` B5.1a (lines 4567–4610) and lines 88–96, 350–354, 4510–4513; ShimuraCompactifications 7.15 `HodgeLineFJ`.

Claim: ShimuraCompactifications 7.15 constructs, for `k ≥ 0` and any module `M`, the map `Γ(M^tor, ω^k ⊗ M) → [∏_ℓ Γ(M^Z, p_*Ψ(ℓ) ⊗ ((∧X) ⊗ ω_A)^k ⊗ M)]^Γ` with "M need not be flat", and says that "expansions of general automorphic bundles are AutomorphicBundles B5, which specializes to it". B5.1a constructs a second scalar expansion for the same inputs with target `Γ(C_Φ, Ψ(ℓ) ⊗ L^k ⊗ M)` on the torsor, and B5.2–B5.9 prove the expansion principle for this second map; the README then says the two agree only once a coefficient base-change isomorphism `p_*Ψ(ℓ) ⊗ M → p_*(Ψ(ℓ) ⊗ M)` is proved. The object is the same in the source: Lan's definition displays the torsor-level and base-level coefficient modules as canonically isomorphic for every `M` (LanPEL (7.1.2.3), printed p.535, and Definition 7.1.2.4), and ShimuraCompactifications took the base-level side. So two open pull requests each build Lan's scalar Fourier–Jacobi expansion for arbitrary `M`, and the vector expansion B5.14 and the expansion principle B5.7 specialize to this roadmap's copy rather than to the partner's, contrary to what the partner states.

Witness: LanPEL lines 23185–23201 (the displayed isomorphism in (7.1.2.3) between `[∏ Γ(C, Ψ(ℓ) ⊗ (…)^k ⊗ M)]^Γ` and `[∏ Γ(M^Z, FJ^(ℓ) ⊗ (…)^k ⊗ M)]^Γ`, with `FJ^(ℓ) := p_*Ψ(ℓ)` in Definition 7.1.2.2); ShimuraCompactifications 7.15 (quoted claim that the general case is AutomorphicBundles B5 "which specializes to it").

The caution in B5.1a is mathematically justified: Lan's isomorphism needs the pushforward along the abelian torsor `p : C_Φ → M^Z` to commute with `⊗ M`, which holds when `Ψ(ℓ)` has vanishing higher direct images (nondegenerate `ℓ`) and is not justified for degenerate `ℓ` and nonflat `M` (see Source issues). That is a reason to pin which side is the definition, not to build both.

Repair (either): (a) import `HodgeLineFJ` as the scalar expansion and state B5.1a as the torsor-level description of it, with the degenerate-`ℓ` base-change statement as an explicit hypothesis or lemma (`p_*(Ψ(ℓ) ⊗ M) ≅ p_*Ψ(ℓ) ⊗ M` for the `ℓ` and `M` in play), so that B5.2–B5.9 and B5.14 are theorems about the partner's map; or (b) declare a supplier gap at ShimuraCompactifications 7.15 (`What ShimuraCompactifications must provide (gap:torsor-level-fourier-jacobi)`: the expansion valued in the torsor-level modules `Γ(C_Φ, Ψ(ℓ) ⊗ L_Φ^k ⊗ M)` for arbitrary `M`, with the comparison to the base-level form where it holds) and import that, deleting B5.1a's construction. In both cases say in Scope which side is the definition and which is the comparison.

## R04 (P3) — Supplier declarations cited by names the suppliers do not use

Location: `TauCetiRoadmap/AutomorphicBundles/README.md` lines 283, 291, 2270–2272, 2302, 2312, 4153, 4176–4177, 4203, 4231, 554, 4915, 3210; lines 287, 498, 633, 942, 1267, 1433, 1518, 2683 (ShimuraData slugs).

Claim: the following backticked names appear nowhere at the cited supplier's head: HilbertModularVarietiesAndShimuraCurves `DelignePappasHilbertModel`, `finiteEtaleAmpleDescent`, `dpHilbertModel_isScheme`, `hodgeSplittingDescent`, `algebraicWeightsUnits` (sections H2.2, H2.2a, H2.2b, H5.3, H5.4 exist at #1005 and state the right results, under other names); AlgebraicModuliForArithmeticGeometry `fpqcQuasicoherentDescent` (§3.1 at #853 has `affineFpqcQuasicoherentDescent` and `spaceFpqcQuasicoherentDescent`); AdelicAlgebraicGroups `LevelMaps.hecke` (§4.5 at #792 has the bullet *Hecke correspondences* without that name); ShimuraData `*compact-dual*`, `*filtration-parabolic*`, `*borel-embedding*`, `*homogeneous-variation*`, `*reflex-flag-descent*` (ShimuraData at #1038 uses `### 3.7`, `### 3.8`, `### 3.9` and no slugs; it also states that homogeneous variations are owned by ShimuraVarieties §§P.1–P.5, line 15 of its README); `TauCeti.HodgeTate.canonicalSubgroup` (line 3210, a name of HodgeTateAndCanonicalSubgroups, which is later in the merge order, used in the body of B3.HT as if it denoted something). `AlgebraicModularFormsAndSerreWeights R15.1/R15.2` are fine (its README line 18 defines R15.k = Layer k).

Witness: `grep` of the scratch copies at the heads above returns nothing for each name; HMVSC H5.4 at #1005 line 1338 ("Algebraic Hilbert weights and central units") states the weight line and `Norm(t)^w` character with no Lean name.

Repair: cite these by roadmap and section (HMVSC H2.2, H2.2a, H2.2b, H5.3, H5.4; AMAG §3.1 with its two names; AAG §4.5 *Hecke correspondences*; ShimuraData §§3.7–3.9 and ShimuraVarieties §P.3 for the Borel embedding and homogeneous variations), drop the slugs, and move the `TauCeti.HodgeTate.canonicalSubgroup` identification out of B3.HT's body into Downstream consumers only.

## R05 (P3) — The Lean headline is narrower than the README's B1.1

Location: `TauCetiRoadmap/AutomorphicBundles/Suggested.lean` lines 70–85; README lines 801–815.

Claim: the README states B1.1 for "a faithful representation of a reductive group in characteristic zero", which is Deligne's Proposition 3.1(c) and holds for possibly disconnected reductive groups. The Lean hypothesis `TauCeti.reductiveCommHopfAlgProperty k H` is, at the pin, smooth, geometrically connected and with no nontrivial connected normal smooth unipotent subgroup over the algebraic closure.

Witness: `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean` lines 70–80 (docstring "smoothness, geometric connectedness, and absence of nontrivial connected normal smooth unipotent closed subgroups"); Deligne lines 927–958 (pp.22–23: "If H is reductive … then H = H′", no connectedness).

Repair: say in B1.1 and in the Lean docstring that the stated theorem is the connected case, which is what the pinned predicate expresses, and keep the general reductive statement as the README target (the disconnected case is not statable at the pin). Nothing else in the signature is wrong: `[CharZero k]` is present, the tensor family is chosen over `k`, and the stabilizer is tested over every commutative `k`-algebra, which is correct in characteristic zero because both closed subgroup schemes are reduced.

## R06 (P3) — B3.2 needs the later target B3.3

Location: `TauCetiRoadmap/AutomorphicBundles/README.md` line 1783 (`*Needs:* … B3.3 (`canonicalExtensionGluing`)`) and line 1807 (B3.3 needs B3.1 only).

Claim: a target needs a later target of the same layer; B3.3 does not need B3.2, so this is a build-order slip, not a cycle.

Witness: lines 1781–1783 and 1807–1810.

Repair: swap the two subsections (gluing before the canonical extension), or fold the gluing statement into B3.2.

## R07 (P3) — B5.1 re-declares the finite locally free trace under an alias

Location: `TauCetiRoadmap/AutomorphicBundles/README.md` lines 4520–4556.

Claim: the trace is AdicSpacesPartIII R3.8 `AlgebraicGeometry.Scheme.Hom.finiteTrace` (on main, README line 12082), and B5.1 introduces `finiteLocallyFreeTrace` as "a transparent alias" with its own API bullets restating linearity, unit, composition and base change. What exists elsewhere is cited, not aliased.

Witness: AdicSpacesPartIII README lines 11858–12090 (R3.8 "finite locally free traces and pull–identify–trace", `finiteTrace`, `finiteTrace_app_affine`).

Repair: delete the alias and the restated scalar laws; keep only the coefficient adapter `Tr_{π,𝓕}` and the stack-descent extension as this roadmap's targets, citing R3.8 by name.

## R08 (P3) — B3.HT.1 restates the supplier's API

Location: `TauCetiRoadmap/AutomorphicBundles/README.md` lines 3225–3304.

Claim: B3.HT.1 copies CohomologyComparisons §6.2's statement (weak and strong bounds, uniqueness, point criterion, base change, nesting, quotient exact sequence, isotropy) and lists its six API bullets under "The supplied API"; the roadmap's own contribution is the two sentences on identifying pullbacks along Siegel level maps. The restated block is a second plan of an imported object.

Witness: CohomologyComparisons README at #1064 lines 1153–1162 (§6.2, the same bullets `smallHasseCanonicalSubgroups_reduction`, `_unique`, `_baseChange`, … and Scholze locators).

Repair: reduce B3.HT.1 to the Siegel application (which family, which regions, which level maps and quotients are identified, with the one-line reference to §6.2 for every property used); keep the `p = 2` non-normal `R′` check, which is this roadmap's own and is correct.

## R09 (P3) — Locator slips

Location and claims (each verified against the cached text):

- Lines 2587, 5209: Diamond 2022 Proposition 6.2.1 and the Iwahori warning are on p.24, not p.25 (Diamond22 lines 1104–1125, between the markers for pages 24 and 25).
- Line 2370: LanPEL Theorem 7.3.3.4 is on printed p.572, not p.571 (LanPEL line 24650; the footer of that page reads 572); Definition 7.3.1.3 and Proposition 7.3.1.4 are on p.567 as cited.
- Line 4429: LanPEL Definition 7.1.1.1 starts on printed p.531 (line 23058, footer 531); Remark 7.1.1.3 is on p.532.
- Lines 844, 880, 2283, 4315: PELModuli M3 is cited for "the universal Siegel family", "fine-level universal abelian families" and "abelian quotients and polarization moduli"; at #966 Layer M3 is "Galois forms and complex uniformization" (M3.9 is the complex Siegel moduli at full level); the universal family and its level structures are M1.7 `M_H` and M5.2 `A_{g,D,n}`.
- Line 2266: Diamond 2022 §2.7 begins on p.5 (line 215, before the page-6 marker).
- Line 494–496: Conrad, Theorem 4.1.7 gives representability and `Z ⋉ U = P` (pp.112–113); the identity `Z_G(λ) = P_G(λ) ∩ P_G(−λ)` is not in its statement; cite the following discussion or CGP for it.

Repair: correct the page numbers and the M-layer labels.

## R10 (P3) — Checks carry Lean-style labels

Location: throughout, for example lines 438–444, 561–570, 4324–4329, 5363–5366.

Claim: the house shape says a Check "never names or claims a Lean counterpart"; most Checks here open with a backticked identifier (`centralSplitQuotient_test_gl2`, `SiegelHT.weights_nonzero`, …). The worker's gate did not flag them, so this is advisory.

Repair: drop the backticked labels and keep the prose; the kind annotations "(computation)", "(non-example)" can stay.

## Verified sound

**Gate and tooling.** The worker's gate at 055b77e: every scanner 0 except `target-ids=119` (R01); `build=0`; `depcheck=0`. I re-ran the dependency check: `depcheck: 205 roadmaps, 1444 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line. The merge order lists AutomorphicBundles at line 163, after CohomologyComparisons (161) and ShimuraCompactifications (143); HodgeTateAndCanonicalSubgroups (164), PerfectoidShimuraVarieties (165) and OverconvergentAutomorphicForms (234) are cited only as consumers. `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds README.md, Suggested.lean, metadata.toml only. Both lake pins (TauCeti a91d3aa, Mathlib 6b7abb3c) agree with main's manifest.

**Lean.** `lake env lean Suggested.lean`: the only output is `74:8: warning: declaration uses sorry`. One-tactic probe on a scratch copy: `simp` makes no progress on `finiteTensorStabilizer`; `rfl`/`infer_instance` do not apply to an existential. `#check @` of the three declarations in the probe file agrees with the worker's `signatures.md`; no section binder is lost (`[CharZero k]`, `[FiniteDimensional k V]`, the comodule instance and `IsFaithful` all appear). The two definitions have real bodies on Mathlib carriers: `mixedTensorAction g` acts on `V × V*` by `g` and by `g.symm.toLinearMap.dualMap` (precomposition with `g⁻¹`, the contragredient); `mixedTensorBaseChange A` is `TensorAlgebra.lift k` of `v ↦ 1 ⊗ v` and `Module.Dual.baseChange A` (exists at the pin, `#check` printed). Imports: `import Mathlib` plus two existing `TauCeti.*` modules; no `set_option`, no `lemma`, no sorry'd data. Headline inventory: the README's end theorems are the canonical principal bundle (B1.6/B1.general.4), the canonical extension (B3.2), the expansion principle with arbitrary coefficients (B5.7/B5.15), the ramified Hilbert q-expansion principle (B5.17), the classical `VB⁰` normalization (B4.21/B5.20) and the Siegel Hodge–Tate decompositions (B5.21–B5.22); none is statable at the pins (no Shimura datum, canonical model, toroidal model, Kummer site or period map in Mathlib or Tau Ceti; I grepped `TauCeti/Geometry` and `Mathlib/NumberTheory/ModularForms`), and the module docstring names each with what it lacks. B1.1 is the one statable headline and is stated.

**Pinned declarations opened** (file and line at the pin): `TauCeti.Comodule.IsFaithful` (`Representation/Faithful/Basic.lean:221`, a closed immersion into `GL_d` for some finite basis); `TauCeti.Comodule.pointsAction` (`Representation/PointsAction.lean:63`); `TauCeti.reductiveCommHopfAlgProperty` (`Reductive/Basic.lean:70`); `TauCeti.Cocharacter.parabolic/levi/limit_mem_levi/unipotent_sup_levi` (`Dynamic/Parabolic.lean`); `TauCeti.CommHopfAlgCat.centerQuotientFppfSheaf`, `fppfQuotientSheaf`, `isPullback_fppfQuotientTorsor` (`Center/Quotient.lean`, `Fppf/Quotient/*.lean`); `HeckeCosetModule.instRingHeckeRing` (`NumberTheory/HeckeRing/Associativity.lean`); `HeckeRing.GL2.heckeRingHomCharSpace` and `twistedHeckeSlashSum_diagCosetGamma0_of_prime` (`ModularForms/HeckeSlash/Nebentypus/*`); `Scheme.Modules.tensorProduct` (`Algebra/Category/ModuleCat/Sheaf/TensorProduct/Basic.lean`). Mathlib: `SlashAction`, `slash_mul`, `denom_cocycle`, `denom_cocycle'`, `SL_slash_apply`, `slash_action_eq'_iff` (`NumberTheory/ModularForms/SlashActions.lean`), `UpperHalfPlane.denom_ne_zero` (`Analysis/Complex/UpperHalfPlane/MoebiusAction.lean:63`), `ModularForm.smul_slash`, `ModularForm.qExpansion_injective`, `isCuspForm_iff_coeffZero_eq_zero`, `qExpansion` (`QExpansion.lean:171`), `ModularForm.trace`/`CuspForm.trace` (`NormTrace.lean:224,236`), `LinearEquiv.trans_symm`/`symm_apply_eq` (`Algebra/Module/Equiv/Defs.lean:376,391`), `Scheme.Modules.presheaf/pushforward/pushforward_obj_obj` (`AlgebraicGeometry/Modules/Sheaf.lean:89,165,169`), `tilde.isoTop` (`Modules/Tilde.lean:243`), `ShortComplex.mono_τ₂_of_exact_of_mono`, `IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime`, `induction_on_isQuotientEquivQuotientPrime` (`RingTheory/Ideal/AssociatedPrime/Finiteness.lean`), `Ideal.iInf_pow_smul_eq_bot_of_isLocalRing` (`RingTheory/Filtration.lean`), `IsHausdorff.of_isLocalRing` (`AdicCompletion/Noetherian.lean:26`, needs `I ≠ ⊤`, as the README's F₂ check says), `AdicCompletion.of_injective` (`AdicCompletion/Basic.lean:632`), `PowerSeries.isUnit_iff_constantCoeff`, `Algebra.trace_algebraMap_of_basis`, `Algebra.trace_trace`, `LinearMap.trace_baseChange`, `AddMonoidAlgebra.mapDomainBialgHom`, `LaurentPolynomial.invert`, `Int.emod_two_eq_zero_or_one`, `Module.Flat`: all present.

**Cross-roadmap citations resolved** (at the heads the brief gives or on main): ShimuraVarieties §7.0i `TauCeti.Shimura.abelian_absolute_hodge` (line 1871), §8.22, §P.3, Layers 0–8 with the titles the README paraphrases; ShimuraData §§3.7–3.9, 4.2–4.3, 4.9 (`Z_s`, `H^c = H/Z_s`, line 1020); AlgebraicModularFormsAndSerreWeights R15.1 = Layer 1 (§§1.1, 1.5, 1.6) and R15.2 = Layer 2 (§§2.1, 2.5, 2.15); CohomologyComparisons §6.1 and §6.2 (`smallHasseCanonicalSubgroups`, line 1155); ArithmeticLocallySymmetricSpaces ALS.F.5 (line 949) and ALS.4.5 `LocallySymmetric.kostant_splittingField` (line 3586); PrismaticCohomologyPartIV §8.60–8.61 with `TauCeti.LogAdic.LogStructure`, `KummerEtaleSite`, `NoetherianFsLogAdicSpace.kummerSite/kummerTopology/trivialLogSite` (lines 1520–1537); HilbertModularVarietiesAndShimuraCurves H0.3, H0.5, H2.2, H2.2a, H2.2b, H2.6, H4.6, H5.3, H5.4; PELModuli M0, M1, M3, M5; AlgebraicModuliForArithmeticGeometry §§1.3, 3.1, 3.5, 5.3 `ArithmeticModuli.tame_finite_flat_descent` (line 8898); AdelicAlgebraicGroups §4.2, §4.3 `Neat.IsNeatLevel` (line 4528), §4.5 bullets *Degree of a Hecke correspondence*, *Hecke correspondences*, *Cartesian squares of level maps* with `U′L = U` (lines 4890–4921); PerfectoidTowers P8.14, P8.21; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.19, R07.2.21, R07.6.6 `illusieObstructionHomomorphisms`; PadicHodgeTheory §§0.1, 2.1, 2.4, 2.7, 7.1, 7.3; DerivedDeRhamCohomology §§1.14, 1.22; ClassicalAdicEtaleCohomology §8.2; EtaleDualityAndPerverseSheaves §§0.1, 0.6, 2.2; AbelianSchemesAndArithmeticModuli A4 `AbelianH1dR`, `AbelianTate`, `exteriorCohomology`; ComplexComparisonPartII C0 `CoherentAnalytification`, `coherentPullbackOperations`, C1.9, C2 `projectiveGeometricDictionaries`, C5.5, C5.6 `RegularSingular`, `CanonicalLogExtension`, `deligneRiemannHilbert`; on main: SchemeAndStackFoundations §§0.6, 1.1 (`qcoh_fpqc_descent`), 1.11, 1.15 (`Groups.IsTorsor`), 1.16, 1.22, 1.23, 2.6, 2.18, 4.8, 4.9, 4.13; AdicSpacesPartIII F0 (`FormalScheme.completion`, EGA I 10.8.11 at line 2719), R2, R3.8 `finiteTrace`; AdicSpacesPartII R0; PerfectoidSpaces P0–P4, P3.11, P3.13, P6.8, P7.11, P7.12, P7.16; AdicEtaleGeometry A1.2, A1.5, A1.7, A1.12; DerivedModuleAlgebra §§0.4, 0.8; EnhancedDerivedSheaves §§0.1, 0.4, E1.1, E1.4, E1.8, E2:towers, E3.1, E3.4; EtaleCohomologyFoundations §§0.7, F.2.3, F.5; ReductiveGroupsPartII RG2.0a.3 (*deligne-torus*, line 1379); ModularForms 10C and `heckeRingHomCharSpace`; ClassicalGroups `schurFunctor`, `DominantWeight`; LieGroups Layer 8; AlgebraicVectorBundles L0A–L0C. The resolver's lead "AMFSW has no R15.2" is a false positive (its README line 18 defines the R15 labels).

**Ownership against open work.** The coefficient quotient `Gᶜ` is ShimuraData §4.9 and is only adapted here (B0.1); the canonical subgroups are CohomologyComparisons §6.2 (R08 asks for a thinner restatement); the Hodge-line Fourier–Jacobi expansion is ShimuraCompactifications 7.15 (R03); the finite locally free trace is AdicSpacesPartIII R3.8 (R07); regular-singular canonical extensions are ComplexComparisonPartII C5.6; the Kummer-étale site is PrismaticCohomologyPartIV §8.60; the dual BGG resolution's nilradical cohomology is ALS.4.5. The torsor-level pro-Kummer-étale site and perfectoid basis (B3.log.1), the relative BGG resolution in type C₂ (B3.BGG.1), the rational Levi torsor (B3.HT.7) and the ramified splitting-model boundary (B3.Hilbert) have no other owner among the roadmaps on main or the open pull requests whose files the brief gives; `roadmaps grep` for `HodgeLineFJ`, `smallHasseCanonicalSubgroups`, `finiteTrace` and `kostant_splittingField` returned only the owners named above. Ownership against open pull requests not listed in the brief with files was not checked beyond `roadmaps grep`.

**Sources sampled** (15 random targets plus the headline-bearing ones; cache texts cited as `<id> line N`): Milne90 (`f4a36ecc…`): Lemma 3.1 and Proposition 3.5 on p.58 (lines 2833, 2869) for B0.4; Remark 2.3(a) p.55 (2717) for B0.5; Proposition 2.1(a) p.55 (2695), Proposition 3.2 p.58 (2847), Remark 4.5 p.60 (2959) for B1.10; Theorem 4.6 pp.60–61 (3013) for B1.general.5; Theorem 5.1 p.61, Definition 7.1 and Proposition 7.2 p.62, Corollary 7.3 p.63, V Theorems 6.1–6.2 pp.90–91 (4369, 4395). Deligne (`827e3571…`): Proposition 3.1(a)–(c) pp.22–23 (927–958) for B1.1, with the proof via a generator of `D ⊗ D^∨`. CS (`aa93df39…`, arXiv v1; Annals pages not checked, arXiv pp.16–18 correspond): §2.3 opening, Lemmas 2.3.1, 2.3.2, Remark 2.3.3, Lemma 2.3.4, 2.3.5 (695–801) for B0.3, B1.1, B1.4, B1.7, B2.1. AG (`ecf6c8c0…`, arXiv v3 pp.29–30): Proposition 3.5.1 (1214) for B1.4, a torus setting, used here together with CS for the general case. LanHigher (`5916b37f…`): §2 p.3 (94–120), §3 p.5 (189–205), Proposition 5.6 pp.11–13 (539), Remark 5.7, Corollaries 5.8–5.9 p.13 (648–670), Definition 5.10, for B3.10 and B5.14. HarrisBundles (`dd083d8c…`): pp.1–2, equation (1) and its consistency check, for B0.7–B0.8. ConradLuminy (`1a63a17e…`): Theorem 4.1.7 pp.112–113 (4632) for B0.3. BCGP (`51d7eacc…`): 3.2.13–3.2.16, Example 3.2.18, Remark 3.2.19 pp.44–45 (2033–2087) for B0.3, B2.3, B2.9; §4.8, Remark 4.8.1, Theorem 4.8.2 pp.101–102 (4506–4545) for B5.21–B5.22. Diamond21 (`2d8f8fd3…`): §2.2 pp.7–8 (287–336), §3.1 pp.9–10 (380–470), Definition 3.2.1 and the paritious paragraph p.12 (559), (17)–(18) pp.31–32 (1485, 1498), (20) p.33 (1557), Proposition 7.1.1 p.34 (1588), Propositions 7.2.1–7.2.2 and (26) p.37 (1750–1779). Diamond22 (`01ab6d45…`): §§2.2–2.3 pp.3–4 (92–135), §§2.7–2.9 pp.5–7 (215–262), Proposition 6.2.1 p.24 (1104), (6.1) and Proposition 6.5.1 pp.27–28, Remark 6.5.2 p.28. LanPEL (`a7a454f5…`; PDF page = printed page + 28): Definition 7.1.1.1 p.531, Lemma 7.1.1.4, 7.1.1.5 pp.532–533, 7.1.2.1–7.1.2.13 pp.534–538, Proposition 7.1.2.14 and its proof p.539 (23309–23350), Definition 7.3.1.1 p.565–566 (convexity `pol(x+y) ≥ pol(x) + pol(y)`), Definition 7.3.1.3 and Proposition 7.3.1.4 p.567, Theorem 7.3.3.4 p.572. DLLZ (`209e5983…`): Definition 5.3.1(4), Lemma 5.3.4, Remark 5.3.5 pp.74–75 (3782–3830), Theorems 5.4.3–5.4.4 pp.79–80 (3980, 4037), Theorem 4.6.1, Corollary 4.6.7, Theorem 6.2.1, Corollaries 6.3.4–6.3.5, Lemma 6.3.6. DLLZRH (`6428b926…`): Proposition 2.3.15 pp.18–19 (861), Theorem 3.2.7 p.26 (1194), Corollary 3.2.10 and Theorem 3.2.12 p.27, Theorem 5.3.1 pp.56–57 (2761). LLZ (`cabfead1…`): Definition 3.1.1 p.17, Theorem 3.1.10 p.18, Theorems 5.5, 5.10 pp.49–50, Theorem 6.1.7 p.52 (2477), Remark 6.1.9, Theorem 6.1.10 p.53 (2502), Remark 6.1.16, Theorem 6.2.3 p.54 (2571), Theorem 6.2.9 p.55 (2605). RC22 (`78cb3108…`): (4.1) and Theorem 4.2.1 p.22 (854, 870). Stacks 07S7 (free finite locally free quotient is a scheme), 0CCJ (effective descent for quasi-projective V along finite locally free surjections), 0GQZ Lemma 103.13.5 (qcqs stack, finitely presented `G`, filtered colimits). LanIntro (`d9a3e755…`): §4.2.7 pp.49–50 (3659–3700). Every statement, hypothesis and theorem number the README attributes to these passages is what the passage says, except the page slips in R09.

**Adversarial pass.** One row per statement checked; values computed on both sides.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| B0.1 `Z_s` for `GL₂`, `Res_{F/ℚ}GL₂`, `T = Res¹_{ℚ(∛2)/ℚ}G_m` | `d = 1`; `d = 2`; cubic field | `GL₂`: split ranks 1 = 1, `Z_s = 1`. `Res GL₂`, `d = 2`: centre `Res G_m`, ℝ-rank 2, ℚ-rank 1, `dim Z_s = 1`. Cubic: character module = standard 2-dim `S₃`-module, irreducible, so no subtorus, `Z_s = 1`; `T_ℝ ≅ Res_{ℂ/ℝ}G_m` ℝ-rank 1, ℚ-rank 0; Lan's torus is `T`; `N(∛2 − 1) = 2 − 1 = 1` | agrees with text | none |
| B0.3 `P(μ)` for `μ = diag(z,1)` | lower shear, upper shear | `μ(t)[[a,b],[c,d]]μ(t)⁻¹ = [[a, tb],[t⁻¹c, d]]`; limit exists iff `c = 0`: `P(μ)` upper Borel, `P(μ⁻¹)` lower Borel; `F⁰ = H^{0,−1} = ⟨e₂⟩`, stabilizer lower Borel = `P(μ⁻¹)` | agrees | none |
| B0.4 `P ×^G χ ≅ 𝓛` for `P = Isom(O,𝓛)` | `χ = id`, `χ⁻¹` | `(η,v) ∼ (η∘g, g⁻¹v)`, `η∘g(g⁻¹v) = η(v)`: well defined; with `(tg, ρ(g)v)` instead it is `η(g²v)`, not well defined | agrees | none |
| B0.5 tautological line | `GL₂`, `P = Stab(Le₁)`, `χ(p) = a` | `[gp, a⁻¹v] ↦ a⁻¹ v g p e₁ = v g e₁`: image is the line `gP ↦ ⟨g e₁⟩`, i.e. `O(−1)`; Milne90 Example 2.4(b) p.56 places `ω(A/S)` as the dual of the determinant coefficient, consistent | agrees | none |
| B0.7/B0.8 descent and frame change | `−1 ∈ SL₂(ℤ)`, weight `k`; `u = 2` | `(−1)^k`: odd `k` fails coarse descent; `f(tu) = u⁻¹f(t)` gives coordinate `1/2` | agrees with HarrisBundles (1) | none |
| B1.1 Lean statement | `n = 0`; `A` nonreduced; disconnected `H` | `n = 0` gives `G = GL(V)`, a true instance; char 0 makes both closed subgroup schemes reduced so equality on `k̄`-points is equality of `A`-points for all `A`; `H` = `O₂` is reductive but not geometrically connected, so excluded by the pinned predicate | true as stated; narrower than README | R05 |
| B1.4/B1.3 polarization line | `GSp` vs `Sp` | fixing `ψ ∈ V^∨⊗V^∨` gives multiplier 1 (`Sp`); fixing the line `⟨ψ⟩` or `ψ ⊗ t` with the Tate coordinate gives `GSp` | agrees with Deligne 3.1(c) | none |
| B1.5 nonsplit flag | `B = (−1,3)/ℚ` | `(−1,3)_3 = (−1/3) = −1`, `(−1,3)_2 = −1`, `(−1,3)_∞ = +1`: division, split at ∞; `3` not a sum of two squares; conic has no ℚ-point | agrees | none |
| B1.10 Hecke pullback | identity, composite | identity level map gives identity frame map; isogeny pullback preserves `F¹`, is not multiplication by the degree (Milne90 Prop 2.1(a), Remark 4.5(i)) | agrees | none |
| B1.general.2 second jet | `z ↦ z/(cz+1)` | `= z − cz² + …`: derivative 1, quadratic coefficient `−c` | agrees | none |
| B1.general.5 compact-dual map | `GL₂` | Milne90 Theorem 4.6(a): `γ` rational over `E(G,X)`; no rational point asserted | agrees | none |
| B2.3 dual weights | `(a,b)`, `(r,r)` | `−w₀(a,b) = (−b,−a)`; `(1,0) ↦ (0,−1)`; `(r,r) ↦ (−r,−r)`; BCGP 3.2.18 `L_λ = (π_*O)[B_M = −w_{0,M}λ]` | agrees | none |
| B2.9 tautological sequence | `g = 1, 2`, general `g` | ranks `g, 2g, g`; BCGP Remark 3.2.19 displays exactly `0 → L_{(0,…,0,−1;1)} → O⊗St → L_{(1,0,…,0;1)} → 0` | agrees | none |
| B3.2/B3.4 twists and ideals | `O(D)` vs `O`; `(q₁q₂)` vs `(q₁,q₂)`; `O(−2D)` | lattices `q⁻¹O ≠ O`; `(q²) ⊊ (q)`; crossing ideal `(q₁q₂)` | agrees | none |
| B3.10 formal charts | `W = R`; `n = 0` | `Ecan = O`, `Esub = I_D`; LanHigher (5.5), Cor 5.9: `σ^∨(n)` vs `σ^∨(n)₊`; Prop 5.6's parenthetical: filtration on `C`, not on `X/Γ` | agrees | none |
| B3.Hilbert.0/0a lattices | `U(N)` | Diamond21 (17): `M = d⁻¹I⁻¹J`, `M* = J⁻¹I`; Stacks 07S7 hypotheses (finite locally free, free action, quasi-projective) match the construction | agrees | none |
| B3.Hilbert.1 polarization function | `pol(x,y) = x + y + min(x,y)` | `pol(1,0) + pol(0,1) = 2 ≤ pol(1,1) = 3`; Lan Def 7.3.1.1(4) requires `pol(x+y) ≥ pol(x) + pol(y)`; linearity domains are the two cones at `(1,1)` | agrees | none |
| B3.Hilbert.3 unit relation | `(α β; 0 δ)`, `k = m = 0`, `t = 0` | Diamond21 Prop 7.2.1: `r_{α⁻¹δm} = ζ_N^{−β(α⁻¹Nm)} χ_l(α)χ_{k+l}(δ) r_m`; at `t = 0` phase 1, characters remain | agrees (`l` there is `m` here) | none |
| B3.log.1 divisibility | one boundary coordinate, `ℓ ≠ p` | `ℕ[1/p]` not `ℓ`-divisible; `ℚ_{≥0}` is; DLLZ 5.3.1(4) requires `n`-divisibility for all `n` | agrees | none |
| B3.log.3 tensor exponents | residue exponents `3/4, 3/4` | sum `3/2`, normalized `1/2`; DLLZRH 3.2.7(2) eigenvalues in `[0,1)`, 3.2.12 tensor functor only on the unipotent subcategory | agrees | none |
| B3.log.4/5 `G_m ⊂ ℙ¹` | unit coefficient | `H¹ = C(−1)`, `H⁰(Ω¹(log)) = k`; `H_c⁰ = 0`, `H_c¹ = ℚ_p`, `H_c² = ℚ_p(−1)`; complex `O(−2) → O(−2)` | agrees | none |
| B3.BGG.1 lengths and ranks | `κ = 0` | `dim 𝔤/𝔭 = 3`, `^M W` has 4 elements of lengths 0–3; nilradical abelian gives `binom(3,j)` | agrees | none |
| B3.BGG.3 dictionary | `ρ_G`, `2ρ_U`, `κ = 0`, `κ = (0,−2;2)` | positive roots `e₁−e₂, −2e₁, −e₁−e₂, −2e₂`, sum `(−2,−4)`, `ρ_G = (−1,−2)`, `ρ_L = (1/2,−1/2)`, `2ρ_U = (−3,−3)`; `w = 1: −w_{0,M}(2ρ_U) = (3,3)`; `s₂, s₂s₁, s₂s₁s₂` give `(3−k₂,k₁+1), (2−k₁,k₂), (k₁,k₂)` = BCGP p.101's four weights; ranks of `ω^{(2,0)}, ω^{(3,1)}, ω^{(3,3)}` are 3, 3, 1 | agrees | none |
| B3.HT.1 point criterion at `p = 2` | `R′ = {(a,b) : a ≡ b mod 2}`, `s = (−1,1)` | `s − 1 = (−2,0)`; `(−2,0)/√2 = (−√2,0)`, `−√2 − 0 ∉ 2O_C` so `s ≢ 0 mod √2` while `s ∈ μ₂(R′)`; `(1,0)` is idempotent in `R′[1/2]` and not in `R′`, so `R′` is not integrally closed | agrees | none |
| B3.HT.5 refinement | subdivide `ℝ²_{≥0}` at `(1,1)` | `Bl₀𝔸² → 𝔸²` proper, exceptional `ℙ¹`, not finite | agrees | none |
| B3.HT.7 twist | `(1,0;−1)`, unit | RC22 (4.4): `π_HT^*M_{Fℓ} ≅ π^*M_{dR} ×^{G_m,μ} G_m(−1)`; unit twist 0 | agrees | none |
| B4.3 cocycle | `g = h = S`, `z = i`, `z = 2i` | `J(S,Sz)J(S,z) = (−1/z)z = −1 = J(−1,z)`; unshifted `z² = −4` at `2i` | agrees; LanIntro p.49 prints the unshifted law | Source issue |
| B4.3/B4.4 shears | `S_x, S_y` on `(1,0)`; `S_x⁻¹(0,1)` | `S_xS_y(1,0) = (2,1)`, `S_yS_x(1,0) = (1,1)`; `S_x⁻¹(0,1) = (−1,1)` | agrees | none |
| B4.11/B4.12 weights | `(k,w) = (4,2)`, `(4,2)+(2,0)` | `m = −1`; sum `(6,2)`, `m = −2 = −1 + −1`; central action `t^{k_τ + (w − k_τ)} = t^w`, product `Norm(t)^w` | agrees | none |
| B4.15 unit condition | `F` real quadratic, `k + 2m = (1,3)`, `N(u) = 1` | `θ₁(u)θ₂(u)³ = N(u)θ₂(u)² = θ₁(u)⁻²`, `≠ 1` unless `u = ±1` | agrees | none |
| B4.19 colimit | `⊕_ℕ R` vs `∏_ℕ R` | Stacks 0GQZ: qcqs and finite presentation of `G`; products not covered | agrees | none |
| B5.1 trace | `R[t]/(t² − a)`; trivial `p`-fold cover over `𝔽_p` | `Tr(1) = 2`, `Tr(t) = 0`, `Tr(t²) = 2a`; `Tr(1) = p = 0` | agrees | R07 (alias only) |
| B5.1a vs ShimuraCompactifications 7.15 | Lan (7.1.2.3) | Lan displays torsor-level `≅` base-level for all `M`; the two roadmaps each define one side | two owners | R03 |
| B5.3 invariants | shear on `𝔽_p²` | fixed vectors `b = 0`; image in quotient 0 | agrees | none |
| B5.4 separation | `F₂`-module, unit ideal | completion at `⊤` is 0; `IsHausdorff.of_isLocalRing` needs `I ≠ ⊤` | agrees | none |
| B5.10/B5.19 normalization | weight 0, `ℓ = 2, 3, 5`; `n = 0` | `(ℓ+1)/ℓ = 3/2, 4/3, 6/5`; `(1 + ℓ^{k−1})a₀` at `k = 0` gives `1 + 1/ℓ` | consistent across B5.10, B5.19 and the worked example | none |
| B5.17 principle | Diamond22 6.2.1 | hypothesis "S meets every connected component of `Y^min`" and the `R′ ⊂ R` recognition clause both present; Iwahori warning present | agrees | locator p.24 (R09) |
| B5.21/B5.22 | `κ = 0`, `(0,−2;2)`, `(0,0;1)` | BCGP Thm 4.8.2: weights `(k₁,k₂;−w), (2−k₁,k₂;−w), (3−k₂,k₁+1;−w), (3−k₂,3−k₁;−w)` with twists `−(k₁+k₂+w)/2, −(2−k₁+k₂+w)/2, −(4−k₂+k₁+w)/2, −(6−k₁−k₂+w)/2` and `(−D)` in the compact case; at `(0,−2;2)`: `(0,−2;−2), (2,−2;−2), (5,1;−2), (5,3;−2)`, doubled exponents `0, 2, 8, 10`; `(0,0;1)` has odd `k₁+k₂+w` | agrees | none |

**Declared gaps.** None declared (no `design/plan.json` readable from this worktree, and the README states no `What <Supplier> must provide (gap:…)` line). R03(b) proposes one.

## Not verifiable

- FC90 (Faltings–Chai, *Degeneration of abelian varieties*, DOI 10.1007/978-3-662-02632-8): the sources service resolves it only to a paywalled publisher page; recorded as uncertified. The locators in B3.BGG.2, B3.BGG.3, B5.21, B5.22 (VI §5 Proposition 5.4, Theorem 5.5, VI §6 Theorem 6.2) were cross-checked only through LLZ Remark 6.1.16 and BCGP Theorem 4.8.2, which attribute the same statements to those places.
- CS and AG Annals page numbers (649–766 and 391–531): I read the arXiv texts (1511.02418v1, 1508.00178v3); the statements and theorem numbers agree, the version-of-record pages were not checked.
- Ownership against open pull requests whose files the brief does not list was checked only through `roadmaps grep` for the key names.

## Source issues

- **Misprint** in LanIntro at §4.2.7, printed p.49: the source states the automorphy cocycle as `j(γ′γ,Z) = j(γ′,Z) j(γ,Z)` with both factors at the same base point; it should be `j(γ′γ,Z) = j(γ′,γZ) j(γ,Z)` (the first factor at the moved point), as the `SL₂(ℤ)` example `g = h = S`, `z = 2i` shows; affects nothing (the README already records the correction).
- **Gap** in LanPEL at Definition 7.1.2.4 and the display (7.1.2.3), printed p.535: the source identifies the torsor-level coefficient modules `Γ(C_Φ, Ψ(ℓ) ⊗ (…)^k ⊗ M)` with the base-level ones `Γ(M^Z, p_*Ψ(ℓ) ⊗ (…)^k ⊗ M)` for an arbitrary module `M` without argument; it should be stated for flat `M` or for `ℓ` with `R^{>0}p_*Ψ(ℓ) = 0`, or proved separately, since pushforward along the abelian torsor need not commute with `⊗ M` for degenerate `ℓ`; affects a stated result (the definition of the coefficient modules), not the proof of Proposition 7.1.2.14, which uses the completion along the stratum.
