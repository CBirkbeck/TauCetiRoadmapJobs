# Review of EnhancedDerivedSheaves (pull request #1630 at 9158199)

**Verdict:** needs changes

This is a full review of the head that r15 read. `scratch/changes.md` lists no change in the folder. The pins are Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`. `README:N` and `Suggested.lean:N` refer to the two files of `TauCetiRoadmap/EnhancedDerivedSheaves/`. A line `#PR README:N` gives the line of that pull request's README at its head, as printed by `roadmaps show`, with the tool's one-line header removed.

## R01 (P2) — Two open pull requests both claim to own `MonoidalCategory.IsInvertible`

Location: `README:3026`, "Section 0.3 is the single owner of invertible objects of a monoidal category, `MonoidalCategory.IsInvertible`". The same definition is at `README:569` and `Suggested.lean:178`.

Claim: §0.3 is the only owner of the predicate, and EtaleCohomologyFoundations consumes it.

Witness: EtaleCohomologyFoundations at #1891 (`bdbf9b3`), `README:1830`–`1831`: "(the predicate MonoidalCategory.IsInvertible, built here)". Main's EtaleCohomologyFoundations never mentions the predicate. Both open heads therefore own it.

Repair: keep §0.3 as the owner. EnhancedDerivedSheaves is on main and is a supplier of EtaleCohomologyFoundations, so it comes first. #1891 also needs this head's §0.1 instance `IsGrothendieckAbelian.hasDerivedCategory` (its `README:46` cites "EnhancedDerivedSheaves §0.1"). Add one sentence to this pull request's description: "#1891 merges after this pull request, and before it merges, `README:1830`–`1831` there replaces 'built here' by 'EnhancedDerivedSheaves §0.3'." The folder itself needs no change. r15 R01 carried this item as part of a P3 description finding. The brief's overlap rule makes a two-owner object P2, so it is raised separately here.

## R02 (P3) — The description is wrong about what changes and says nothing about #1330

Location: the description (`scratch/pull-request.md`, line 22): "Amendment of the merged roadmap EnhancedDerivedSheaves (README only; no Lean change, so no importer is affected)."

Claim: only the README changes, and no ordering against other pull requests is needed.

Witness: `git diff --stat origin/main...HEAD` reports `Suggested.lean | 581 +++------`. #1330 (`856fe7a`, draft) changes both files of this folder and conflicts with this head (`overlaps.md`). It also adds `import TauCetiRoadmap.PurityOfBranchLocus.Suggested`, which this head makes unnecessary through `TauCeti.IsRegularLocalRing.of_hasProjectiveDimensionLE` (`README:20`).

Repair: in the description, replace the quoted sentence by: "`README.md` and `Suggested.lean` are revised. `Suggested.lean` is in module form with the single Tau Ceti import `TauCeti.Algebra.Homology.DerivedCategory.KInjective`. No roadmap imports it, and no roadmap cites a declaration it drops." Then add: "This pull request supersedes #1330, which is closed rather than merged." Carried from r15 R01, the description part.

## R03 (P3) — Comparisons with DerivedModuleAlgebra's derived category never mention its second `HasDerivedCategory` instance

Location: `README:445`, "Statements about Mathlib's `DerivedCategory` of a Grothendieck abelian category use this instance; none assumes `HasDerivedCategory.standard` or a separately chosen instance". Against this:
- `README:534`–`536` use DerivedModuleAlgebra's `DerivedDeRham.derivedCompletion` and `DerivedDeRham.completionUnit` and require `α_K : q(ĈK) ≅ Λ_(ℓ)(qK)`.
- `README:2641` asks that `IsDerivedComplete` agree with `DerivedDeRham.derivedCompleteness R I (M[0])`.

Claim: every derived category of modules in the roadmap is the one built from the global instance `IsGrothendieckAbelian.hasDerivedCategory`, whose Hom types lie in `Type u`.

Witness: DerivedModuleAlgebra on main builds its §§1.2–1.5 objects under `local instance moduleDerived … HasDerivedCategory.{u+1} (ModuleCat.{u} R) := HasDerivedCategory.standard _` (`Suggested.lean:569`–`571`, `README:1709`). #1701 keeps the same instance (its `README:2040`–`2041`). So `Λ_(ℓ)(qK)` and `q(ĈK)` live in different `DerivedCategory (ModuleCat ℤ)` types.

Repair: after `README:445`, add one sentence. It should say that DerivedModuleAlgebra's Lean prototypes use the local instance `moduleDerived`, which is `HasDerivedCategory.standard` with Hom types in `Type (u+1)`. It should also say that every comparison with its §§0.2, 1.1.1 and 1.2–1.5 objects is made through the `CategoryTheory.Localization.uniq` equivalence between the two localizations of `CochainComplex (ModuleCat R) ℤ`. That equivalence commutes with `Q`, shifts and triangles, so it matches the completeness predicates, units and reductions. Name the equivalence once at `README:534`–`536` and at `README:2641`.

## R04 (P3) — `isDerivedComplete_iff_derivedCompleteness` assumes `I.FG`, which the statement does not need

Location: `Suggested.lean:248`, `(hI : I.FG)`. `README:2641`: "For a commutative ring R, a finitely generated ideal I and any R-module M, prove `isDerivedComplete_iff_derivedCompleteness`".

Claim: the telescope criterion agrees with the vanishing of all maps `R[1/f][n] → M[0]`, for finitely generated I.

Witness: both sides are conjunctions over `f ∈ I` of conditions on f alone. For each f, `RHom(R_f, M) = [M^ℕ → M^ℕ]` with the telescope map T_f, so the maps from `R_f[0]` and `R_f[−1]` into `M[0]` are `ker T_f` and `coker T_f`. Stacks 091P and BS-proet Lemma 3.4.7 (line 996) state this for any single element. The equivalence therefore also holds for `I = (x₁, x₂, …) ⊂ ℤ[x₁, x₂, …]`. DerivedModuleAlgebra's `derivedCompleteness` (its `Suggested.lean:904`) takes no generation hypothesis either.

Repair: delete `(hI : I.FG)` from `Suggested.lean:248`. In `README:2641`, change "a finitely generated ideal I" to "any ideal I".

## R05 (P3) — The *Needs:* line of `perfect_projectiveDimension_le` puts a commutative-algebra theorem behind the presentability of the enhancement

Location: `README:847`: "*Needs:* `TauCeti.IsRegularRing.hasProjectiveDimensionLE`; … ; *enhancedDerived_isPresentable*; Mathlib `IsRegularRing`, …".

Claim: the bound `pd ≤ d + 1` needs *enhancedDerived_isPresentable*, the presentability of `D∞(O)` from E1.3.

Witness: the route (`README:845`) and BS17 Prop. 11.31 (BS17 lines 2242–2253, p. 48) use only module theory. They need flat Frobenius steps, the telescope `0 → ⊕Fₙ → ⊕Fₙ → M → 0`, and `M ≃ M ⊗ᴸ_P R`. The *Needs:* lines at `README:867`, `:880`, `:892` and `:2609` cite this target, so Kunz's converse and the Tor bound also wait on the dg nerve.

Repair: in `README:847`, replace *enhancedDerived_isPresentable* with "DerivedModuleAlgebra §0.2 (module derived tensor, for `M ≃ M ⊗ᴸ_P R`); Mathlib `CategoryTheory.Tor`".

## Previous findings

- r15 R01, not repaired: the head and the description are unchanged. The description part is carried as R02. The two-owner part is raised as R01 (P2) under the overlap rule.
- r15 R02–R04 were repaired at r15, and the head has not changed since. I re-read `README:2734`–`2741`, `README:2762`–`2764`, `Suggested.lean:262`–`284` and `README:460`, `:92`, `:636`, `:644`. The README has 0 hits for `HodgeStructuresPartII`. All still hold.

## Verified sound

**Gate, order, worktree.** `HEAD` is `9158199`, and the worktree is clean. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/EnhancedDerivedSheaves'` is empty. My rerun of `gate … --base origin/main` exited 0, every counter was 0, and it printed `OK`. The dependency check (`gate --depcheck … --movable`, exit 0) printed:

```text
depcheck: 240 roadmaps, 2349 edges, 0 problem(s)
```

The README cites no roadmap from the never-cite list. Every cited DerivedModuleAlgebra section resolves on main: §§0.I.1, 0.2, 0.4–0.17, 0.K.1, 1.1, 1.1.1 and 1.2–1.5. So do the names `DerivedDeRham.derivedTensor`, `derivedExteriorPower`, `moduleDerivedHom`, `derivedCompleteness`, `derivedCompletion`, `completionUnit`, `koszulCompletionTower`, `Algebra.CotangentComplex.smooth` and `regularQuotient`. SchemeAndStackFoundations §§0.17, 0.24, 0.25, 2.1, 2.2, 2.5, 2.6, 2.17, 2.18 and 4.13 resolve with the cited names: `cech_to_cohomology`, `cohomology_filtered_colimits`, `qcoh_higherDirectImages`, *IsReplete.derived_limits*, *IsReplete.derivedCategory_leftComplete*, `DQCoh.affineEquiv`, `torIndependent_baseChange`, *IsRegular.isCohenMacaulay*, `Sheaf.derivedPushforward` and `leray_spectral_sequence`. So do BordismFormalGroups F6.5 with its three named paragraphs, AlgebraicTopology Stage 6 item 0, AdicSpacesPartII §R0.19.10, and PerfectoidSpaces P0.1–P0.15 and P7.16a with `Almost.Algebra.IsFiniteEtale`, `isUnramified_iff_exists_idempotent` and `powerSeries_regular_field`.

**Elaboration and signatures.** `lake env lean Suggested.lean` gives exactly 10 warnings, all `declaration uses sorry`, at lines 101, 121, 148, 184, 196, 207, 219, 247, 262 and 279. I ran `#check @` on all 17 declarations (in a scratch probe file). Every binder of the README statements is present. The "looks dropped" leads in `signatures.md` are parser false positives: `[inst : Category.{u_2,u_1} A]` and the other binders appear in the elaborated types. A second scratch probe confirms three README claims:
- `inferInstance` finds `TauCeti.HasKInjectiveResolutions` for `Sheaf X.smallEtaleTopology (ModuleCat.{u} Λ)` and for `SheafOfModules.{u} O` on a small site (`README:460`, `:472`).
- `K ⟶ L` in `DerivedCategory (Sheaf X.smallEtaleTopology (ModuleCat.{u} Λ))` and in `DerivedCategory (ModuleCat.{u} R)` has type `Type u` (`README:445`, `:452`).

**Padding probe.** I tried `first | infer_instance | aesop | exact?` (or `simp`) on copies of eight statements. None closes:
- `locallySmall_localization_quasiIso`: `exact?` finds `locallySmall_max`, which fails on `max (max u' v) ?u =?= w`.
- `smallEtaleTopology_W_isMonoidal`: `exact?` finds `GrothendieckTopology.W.monoidal`, which fails on `u =?= max (u+1) ?u` from `HasLimitsOfSize.{u+1,u+1}` in `ModuleCat.{u} Λ`. These are exactly the reasons `README:445` and `:478` give.
- `isAdicComplete_iff_derivedComplete_separated`: `simp` leaves the unfolded goal.
- `hasKInjectiveResolutions`, `isInvertible_iff`, `isRegular_of_frobenius_flat` and `perfect_projectiveDimension_le`: `exact?` finds nothing.

**Headline theorems.** The file states every headline that the README marks statable at the pins: K-injective resolutions, local smallness and the derived-category instance (§§0.1–0.2), étale tensor stability (§0.2), invertible objects (§0.3), Kunz's converse and the two perfect-ring bounds (E1.6), and the telescope, classical and weak-Serre comparisons (E4.1, E4.3). The module docstring (`Suggested.lean:49`–`78`) names, per layer, what is not statable and which carrier is missing: D∞(O), coherent mapping spaces, spectra, animated rings and presentable tensor products. At the pins Mathlib has no `HasDerivedCategory` instance for Grothendieck abelian categories, only `HasDerivedCategory.standard` and local uses. Tau Ceti has `HasKInjectiveResolutions` only for `ModuleCat` (`ModuleCat/KInjective.lean:180`), and has no Kunz converse, no perfect-ring global-dimension bound and no derived-complete predicate.

**Library declarations opened at the pins (file:line).**
- Mathlib:
  - `IsGrothendieckAbelian` (`Abelian/GrothendieckCategory/Basic.lean:70`: `LocallySmall.{w}`, `HasFilteredColimitsOfSize.{w,w}`, `AB5OfSize.{w,w}` and `HasSeparator`; this matches Stacks' AB5 with a generator).
  - `Scheme.isGrothendieckAbelian_sheaf_smallEtaleTopology` (`AlgebraicGeometry/Sites/AffineEtale.lean:149`, `.{u}` through `AffineEtale.sheafEquiv`).
  - `GrothendieckTopology.W.monoidal` (`Sites/Monoidal.lean:150`) and `W.transport_isMonoidal` (`:119`).
  - `MorphismProperty.hasLocalizationOfLocallySmall` (`Localization/LocallySmall.lean:37`).
  - `CochainComplex.IsKInjective.Qh_map_bijective` (`DerivedCategory/KInjective.lean:42`).
  - The `SheafOfModules` Grothendieck instance on small sites (`GrothendieckAxioms/SheafOfModules.lean:24`).
  - `Skeleton.instMonoid` (`Monoidal/Skeleton.lean:60`) and `CommRing.Pic` (`RingTheory/PicardGroup.lean:429`, `Shrink (Skeleton (SemimoduleCat R))ˣ`).
  - `IsRegularRing extends IsNoetherianRing` (`RingTheory/RegularLocalRing/Defs.lean:93`).
  - `IsGrothendieckAbelian.hasExt` and `Abelian.Ext.homEquiv`.
- Tau Ceti:
  - `HasKInjectiveResolutions` (`Algebra/Homology/DerivedCategory/KInjective.lean:92`).
  - `IsRegularRing.flat_frobenius` (`RingTheory/RegularLocalRing/Frobenius.lean:85`, under `ExpChar`).
  - `IsRegularRing.hasProjectiveDimensionLE` (`ProjectiveDimension.lean:239`) and `IsRegularLocalRing.of_hasProjectiveDimensionLE` (`:336`).
  - `isZero_Tor_succ_of_perfectRing` (`RingTheory/Perfect/Tor.lean:159`) and `isZero_Tor_perfectClosure_mvPolynomial_quotient` (`:268`).
  - `exists_quasiIso_isKFlat_sheafOfModules` (`Sheaf/TensorProduct/KFlat.lean:96`, flat terms as `PreservesFiniteLimits (tensorLeft _)`) and `kFlatResolution` (`Monoidal/KFlat/Resolution.lean:283`).
  - `rlp_monomorphisms_inf_quasiIso_iff_of_isZero` (`ModelCategory/Injective.lean:162`).
- A `#check` of 208 qualified non-roadmap names from the README against Mathlib, with every remaining name grepped in Tau Ceti, left no unresolved library name. `CochainComplex.Plus.modelCategoryQuillen` is a namespace of scoped instances, as the README says.

**Seeded sample: sources read in the cache, with pages from the page markers.**
- 0.1:
  - HA Definition 1.3.5.8 and Proposition 1.3.5.9 (lines 4739, 4743, p. 125): D(A) is the dg nerve of the fibrant complexes, and it is stable.
  - HA Proposition 1.3.5.21 (line 4874, p. 129): presentable, t-structure, compatible with filtered colimits.
  - Stacks Injectives Theorem 19.12.6, tag 079P (line 883, p. 19): for Grothendieck A, a functorial quasi-isomorphism, termwise injective, into a K-injective complex of injectives. Statement, hypotheses and functoriality match `README:429`, `:445`, `:460` and `:492`.
- 0.2:
  - Stacks Cohomology on Sites Lemma 21.17.11, tag 06YS (line 1342, p. 31): K-flat with flat terms, termwise surjective.
  - §21.19 (line 1605): Mod(O) is Grothendieck, 07A5.
  - Modules on Sites §18.26 (tag 03EK, line 1563), Lemma 18.26.1 (0GMW, line 1580, p. 34; sheafification commutes with ⊗), §18.27 (04TT, line 1618), Lemma 18.27.1 (03EM, line 1630, p. 35) and Lemma 18.27.7 (03EP, line 1710, p. 37).
  - HA Proposition 4.1.7.4 (line 18583, p. 486).
- 0.3:
  - HA Example 4.1.7.6 (line 18605, p. 487) and Theorem 7.1.2.13 (line 46530, p. 1212).
  - Stacks Cohomology on Sites §21.35 (line 3668, 08J7) and Derived Categories §13.34, 08TB (line 5254, a definition by the distinguished triangle).
  - More on Algebra 15.88.1/07KW (line 10638), 15.88.10/07KY (10814, the Milnor sequence), 15.89.1/091D (10946), 091N (11993), 15.93.10/091V (12163, the left adjoint for finitely generated I), 15.93.18/0920 (12293), 15.93.20/0G1U (12344) and 15.95.2/0923 (12520, naive completion iff f-power torsion bounded; ℤ is torsion free).
- 0.4: Stacks Cohomology on Sites §21.18 (line 1447, 06YV) and §21.19.
- Conventions: HA Remark 7.1.1.16 (line 46277, p. 1206; R discrete, `D(A) ≃ LMod_R`, no monoidal claim).

All of these locators, pages and hypotheses support the statements as written.

**BS17 (E1.6), read in arXiv v3 and in the author PDF; same pagination.**
- Lemma 3.16 and Remark 3.17 are on p. 14, Lemma 11.10 on p. 42, Proposition 11.29 on p. 47, Proposition 11.31 and Remark 11.32 on p. 48, and Remark 11.33 with footnotes 24–25 on p. 49. Corollary 11.35 is stated on p. 49 and proved on p. 50.
- Proposition 11.31's proof is the telescope argument of `README:845`, with `N = d + 1` (line 2253).
- Remark 11.33 gives `N = 2 dim R`. Footnote 24 gives the nodal counterexample to `N = d` and Gabber's unproved `2d + 1`, as `README:869` says.

**Ownership and overlaps.**
- #1187 carries main's copy of `Suggested.lean` byte for byte, so a rebase is enough.
- #1330: R02.
- #1891: R01.
- No cited id is dropped, and nothing this head drops is cited elsewhere; the gate reports `dropped=0`.
- The `README:31` wording of DerivedModuleAlgebra §§1.1–1.1.1 matches #1701's head (its `README:1865`–`1875` defers the construction to `TauCeti.ModuleTower.derivedLimit`). The description names #1701 as merging first.
- DiamondSixOperations (#927) owns invertible objects of `D_ét(Y, Λ)` in ECD's sense (étale-locally `Λ[n]`), not the monoidal predicate.
- #1901 HigherToposTheory (`README:50`) says EnhancedDerivedSheaves builds on it. EnhancedDerivedSheaves is on main and earlier, and this head adds no HTT-level object, so the repair belongs to #1901.
- `roadmaps grep` finds no second definition of `hasKInjectiveResolutions`, `hasDerivedCategory`, `smallEtaleTopology_W_isMonoidal`, `isRegular_of_frobenius_flat`, `perfect_*` or `derivedCompleteModules`. Consumers (#857, #1034, #1044) cite them.

**Adversarial computations** (all computed at this head; T/F means left and right side of an iff).

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| 1 | `hasKInjectiveResolutions` (`Suggested.lean:101`) | `ModuleCat (ℤ/4)`, P with `Pⁱ = ℤ/4`, `d = 2`; zero category | `ker 2 = {0,2} = im 2`, so `H(P) = 0`; a contraction needs `2(hₙ₋₁ + hₙ) = 1` in ℤ/4 (even = odd), so P is termwise injective but not K-injective; its resolution is `P → 0` (quasi-iso, 0 K-injective); zero category: `id` | Pass |
| 2 | `locallySmall_localization_quasiIso` (`:121`) | `ModuleCat.{u} R`; general A | `Hom_D(X,Y) ≅ Hom_K(X,I)`, a quotient of `∏_{n∈ℤ} Hom(Xⁿ,Iⁿ)`, which is w-small since A is `LocallySmall.{w}`; library `locallySmall_max` gives only `max u' v` (probe) | Pass |
| 3 | `hasDerivedCategory` (`:129`), Check `README:452`–`453` | étale sheaves; `ModuleCat.{u} R` | Hom in `Type u` (probe elaborates); `standard` gives `max (u+1) u = u+1`; étale sheaf morphisms are in `Type (u+1)` (`X.Etale : Type (u+1)`) | Pass |
| 4 | `smallEtaleTopology_W_isMonoidal` (`:148`) | `X = Spec k ⊔ Spec k`, `f : Λ^pre → Λ_X` (constant presheaf to sheaf) | `f ∈ W`; `f ⊗ Λ_X` on X-sections is `Λ ⊗ Λ² = Λ² → Λ²⊗Λ² = Λ⁴`, not a presheaf iso, but both sides sheafify to `Λ_X` (0GMW), so `f ⊗ Λ_X ∈ W` | Pass |
| 5 | Check `README:487` | same X, `F = G = Λ_X` | presheaf sections `Λ⁴`, sheaf sections `Λ²`; `Λ⁴ ≇ Λ²` for nonzero commutative Λ (rank) | Pass |
| 6 | Koszul Check `README:488` | `a ∈ K⁰`, `b ∈ K¹`, `K = [ℤ_X →id ℤ_X]` | `τ(d(a⊗b)) = b⊗da`, `d(τ(a⊗b)) = −b⊗da`; difference `2 b⊗da ≠ 0` in ℤ; Koszul sign `(−1)^{1·1} = −1` on `K¹⊗K¹` | Pass |
| 7 | Checks `README:501`, `:564` | `Λ = ℤ/4`, `(ℤ/2)_X` | `Tor_i^{ℤ/4}(ℤ/2,ℤ/2) = ℤ/2` for all `i ≥ 0` (resolution `⋯ →2 ℤ/4 →2 ℤ/4`); a bounded flat P would give bounded cohomology, so `P(ℤ/2)` is unbounded | Pass |
| 8 | 0.1 Checks `README:439`–`440` | nonzero A | `A[1]ⁿ = Aⁿ⁺¹`: `H⁻¹(A[1]) = A`; `Cone(0: A→A) = A[1] ⊕ A`: `H⁻¹ = A`, `H⁰ = A`; `Cone(id)` acyclic | Pass |
| 9 | 0.3 Checks `README:516`, `:530`–`531` | ℤ; `ℤ/ℓ^{i+1}`; `K_i = [ℤ → ℤ/ℓ^{i+1}]` | `Tor₁(ℤ/n,ℤ/n) = ℤ/n`; `lim = ℤ_ℓ`, `lim¹ = 0`; `H⁰(K_i) = ℓ^{i+1}ℤ` (not ML), `H¹ = 0`; `Rlim K = [ℤ → ℤ_ℓ]`, `H¹ = ℤ_ℓ/ℤ = lim¹ H⁰` | Pass |
| 10 | 0.3 Checks `README:548`–`550` | `ℤ/ℓ`, `ℤ[1/ℓ]` | `ℤ/ℓ ⊗ᴸ ℤ/ℓ`: `ℤ/ℓ` in degrees −1, 0; `ℤ[1/ℓ] ⊗ᴸ ℤ/ℓ = Cone(ℓ) = 0`, yet `id ∈ Hom(ℤ[1/ℓ], ℤ[1/ℓ]) ≠ 0`, so not complete | Pass |
| 11 | `isInvertible_iff_isUnit_toSkeleton` (`:184`), Checks `README:573`–`575` | `𝟙`; ℤ/2 in `ModuleCat ℤ`; discrete monoidal S₃; discrete monoidal (ℕ,+); `Λ_X[1]` | `𝟙`: T/T; ℤ/2: `ℤ/2 ⊗ ℚ = 0 ≠ ℚ` and `ℤ/2 ⊗ N` is 2-torsion, never ℤ: F/F; S₃: all objects units: T/T; `1 ∈ ℕ`: `tensorLeft 1` misses 0, `[1]` not a unit: F/F; `ε(Λ_X[1]) = −1 ≠ 1` when `2 ≠ 0` | Pass |
| 12 | 0.4 exchange `README:583`, Check `:592` | identity square | `g*Rf_* → Rf'_*g'^*` is the identity for `g = f = id` | Pass |
| 13 | `isRegular_of_frobenius_flat` (`:196`) | `𝔽_p[t]`; `𝔽_p[ε]`; `𝔽_p[t^{1/p^∞}]`; R = 0 | `𝔽_p[t]` free on `1,…,t^{p−1}`: T/T; `F(ε) = 0`, a flat local map is faithfully flat hence injective, so not flat, and not regular: F/F; perfection: Frobenius bijective, but excluded by `IsNoetherianRing` (needed, `Defs.lean:93`); R = 0 excluded by `CharP` | Pass |
| 14 | `perfect_projectiveDimension_le` (`:207`) | `P₀ = 𝔽_p[t]`, `d = 1`, `R = P`, `M = R/J_t`; `R = k` via `k[t] → k` | `J_t` is not finitely generated, so not projective (projective ideals of a domain are invertible); it is flat and countably generated, so `pd J_t = 1`; `pd M = 2 = d+1`, sharp; `R = k`: bound 2, actual 0; the colimit is ℕ-indexed, so no cardinality hypothesis is needed (BS17 l. 2252) | Pass |
| 15 | `perfect_torDimension_le_two_mul_dim` (`:219`) | `R = (k[x,y]/(xy))_perf`, `d = 1`; `d = 0` | `0 → J → R →x R → R/(x) → 0`, `J = (y^{1/pⁿ})` flat; `Tor₂(R/(x), R/(y)) = yR/yJ ≅ k·ȳ ≠ 0` (degree 2d); `Tor₃ = 0` (degree 2d+1); `J ∩ P₀ = J₀` finitely generated gives `R = (P₀/J₀)_perf`, BS17's setting; `d = 0`: products of perfect fields | Pass |
| 16 | `IsDerivedComplete` (`:240`) | `I = 0`, `I = ⊤`, `ℤ_p`, ℤ | `f = 0`: identity, all M; `f = 1`: kernel = constants ≅ M, only 0; `ℤ_p` bijective; ℤ: cokernel `ℤ_p/ℤ` | Pass |
| 17 | `isDerivedComplete_iff_derivedCompleteness` (`:247`) | ℤ, ℤ/p, `(p)`; non-finitely-generated I | ℤ: `Ext¹(ℤ[1/p], ℤ) = lim¹(ℤ ←p ℤ) = ℤ_p/ℤ ≠ 0`, telescope cokernel the same: F/F; ℤ/p: p invertible on `ℤ[1/p]`, zero on ℤ/p, so all Ext vanish: T/T; per-element equivalence for any I | Pass; `hI` unneeded: R04 |
| 18 | `isAdicComplete_iff_derivedComplete_separated` (`:262`) | `ℤ_p`; ℤ; `coker ψ` (`README:2771`) | T/T; ℤ separated, not derived complete, `ℤ → ℤ_p` not onto: F/F; `ψ(e_k) = −e₀ + pᵏe_k`, so `ē₀ ∈ pᵏM` for all k; `ψ(b) = e₀` forces `bₙ = 0` (n ≥ 1) and then `0 = 1`, so `ē₀ ≠ 0`: not separated, derived complete: F/F | Pass |
| 19 | `derivedCompleteModules_weakSerre` (`:279`) | `0 → ℤ → ℤ_p → ℤ_p/ℤ → 0`; `pℤ_p`; `I = 0, ⊤` | snake lemma on products gives extensions, kernels and cokernels; `ℤ ⊂ ℤ_p` shows no closure under submodules; multiplication by p on `ℤ_p`: kernel 0, cokernel `𝔽_p`, both complete | Pass |
| 20 | E5:descent Checks (`README:1907`–`1908`) | `ℤ[a,b,c,d]/(ab+cd−1)`; `𝔽_p[x₁,x₂,…]/(x₁², x₂³, …)` | Jacobian `(b,a,d,c)` generates (1) since `ab+cd = 1`: smooth of relative dimension 3, dimension 4, Gorenstein, index ≤ 5, `(a,c) = 1`; `xₙⁿ ≠ 0`, so `Iⁿ ≠ 0` for all n, while finitely generated subideals are nilpotent | Pass |
| 21 | E1.3 Check (`README:671`) | `G = C_p`, `𝔽_p` | `Hom(𝔽_p, ⊕ₙ 𝔽_p[n]) = ∏ₙ Hⁿ(C_p,𝔽_p) ≠ ⊕ₙ`, since `Hⁿ = 𝔽_p` for all n: not compact | Pass |
| 22 | E0.4 Checks (`README:253`–`268`) | `{0} → Δ[1]`; `N(Mod_ℤ)` | fibre over 1 of `Δ[1]_{1/}` is empty; the square `0,0,0,ℤ` is a pullback, but the pushout of `0 ← 0 → 0` is `0 ≠ ℤ` | Pass |
| 23 | *Needs:* of `perfect_projectiveDimension_le` (`README:847`) | route `README:845`; BS17 l. 2242–2253 | needs flat Frobenius, the telescope and `R ⊗ᴸ_P R ≃ R`; never presentability of `D∞(O)` | R05 |
| 24 | Instance convention `README:445` | DerivedModuleAlgebra `Suggested.lean:569`, `README:1709` | `.{u}` here versus `.{u+1}` (`standard`) there, with no bridge named | R03 |
| 25 | Ownership of `MonoidalCategory.IsInvertible` | `README:3026`; #1891 `README:1830`–`1831` | "single owner" versus "built here" | R01 |
| 26 | Description | `git diff --stat`; #1330 | 581 changed `Suggested.lean` lines against "no Lean change"; #1330 open and in conflict | R02 |

## Not verifiable

- Nothing was blocked. Every text in the seeded sample (§§0.1–0.4 and the Conventions) was read in the cache: HA, Stacks Injectives, More on Algebra, Cohomology on Sites, Modules on Sites and Derived Categories. BS17 and BS-proet were also read for E1.6 and E4.
- I did not open these this round, outside the sample: HTT, SAG, ECD, Liu–Zheng, Nikolaus–Scholze, Mathew, Bhatt (two papers), Bhatt–Lurie, Robalo, Ramzi (two papers), Efimov, Fargues–Scholze, Scholze's *Berkovich motives*, and the Stacks chapters Commutative Algebra, Local Cohomology, Simplicial Spaces, Cohomology of Schemes and The Cotangent Complex. Their locators are as r14 left them.
- `sources.toml` records only HA, Stacks Injectives, Stacks More on Algebra and BS-proet. This review edits no manifest. My fetches of BS17 and three Stacks chapters went to a scratch copy.

## Source issues

- **Misprint** in BS17 at the proof of Corollary 11.35, printed p. 50: the source credits Remark 11.3 for finite Tor-dimension of every `R_perf`-module; it should be Proposition 11.31 or Remark 11.33 (Remark 11.3 concerns Theorem 11.2 (4)); affects nothing.
- **Error** in BS-proet at Lemma 3.4.14, printed p. 23: the source says the derived I-complete modules form an abelian Serre subcategory of `Mod_R`; it should be a weak Serre subcategory (kernels, cokernels, extensions; not submodules, as `ℤ ⊂ ℤ_p` shows); affects nothing.
