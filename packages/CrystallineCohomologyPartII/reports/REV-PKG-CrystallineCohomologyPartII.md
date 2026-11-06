<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2469#issuecomment-6675991910 -->
Review (claude) of 2c35a87

Verdict: needs_changes

1. **F01** (P2) Three statable headline theorems are absent, and the Lean docstring's "lacks" claims about the pinned Tau Ceti are false

   **Location.** `Suggested.lean` lines 23–33 (module docstring: "no pullback along a morphism of schemes", "no ample line bundles or principal polarizations", "no Chow groups of zero-cycles"), lines 76–89 (`card_rationalPoints_modEq_one_of_cohomology_vanishing`); README line 17 and line 50 ("has no pullback along morphisms of schemes"); README §6.4 (ii), (iv), §6.9, §6.14 (i).

   **Claim.** The headline theorems BBE07 Corollary 1.6 (relative form), BBE07 Theorem 1.4 (theta divisors) and Esnault's point count (ESN03 Corollary 1.2, README §6.14 (i)) are not statable at the pins, for the reasons given.

   **Witness.** At Tau Ceti `2fd255d9`: `TauCeti/AlgebraicGeometry/Cohomology/Pullback.lean` line 65 defines `AlgebraicGeometry.Scheme.Hom.cohomologyPullback g M n : Hⁿ(X, M) →+ Hⁿ(Y, g^* M)`, and `Modules/Pullback/Basic.lean` line 211 gives `Scheme.Modules.pullbackObjUnitIso f : (pullback f).obj (𝟙_ Y.Modules) ≅ 𝟙_ X.Modules`; `LineBundle/Ample.lean` line 71 defines `LineBundleClass.IsAmple`, `LineBundle/Dual.lean` line 44 `InvertibleSheaf.dual`, `EffectiveCartierDivisor/Invertible.lean` line 307 `IsEffectiveCartier.toInvertibleSheaf`, `Cohomology/Module/Base.lean` line 48 the base-ring module structure on `Cohomology M i` (so `Module.finrank K (Cohomology L 0)` is available), `AbelianVariety/Basic.lean` line 95 `AbelianVariety K`; `Chow/Basic.lean` line 295 defines `Chow.ChowGroup X k` with `cyclesOfDimension` (line 86) and `RatEquiv` (line 257) for locally Noetherian `X`; `ProjectiveSpectrum/ProjectiveOver.lean` line 57 `Scheme.IsProjectiveOver`; Mathlib `Geometrically/Connected.lean` line 40 `GeometricallyConnected`, `Noetherian.lean` line 236 `LocallyOfFiniteType.isLocallyNoetherian`. A scratch file importing these modules elaborated the three statements below with `sorry` as the only warning (built `TauCeti.AlgebraicGeometry.Cohomology.Pullback`, `Chow.Basic`, `LineBundle.Ample`, `Cohomology.Module.Base`, `EffectiveCartierDivisor.Invertible`, `AbelianVariety.Basic`, `ProjectiveSpectrum.ProjectiveOver` first). The absolute theorem (iv) was introduced by the package as a stand-in for (ii) (package report, "New statements, added to carry the Lean headlines"); with (ii) stated it is the boundary case `Y = Spec K`.

   **Repair.** (a) In `Suggested.lean` add the imports `TauCeti.AlgebraicGeometry.Cohomology.Pullback`, `TauCeti.AlgebraicGeometry.Cohomology.Module.Base`, `TauCeti.AlgebraicGeometry.Chow.Basic`, `TauCeti.AlgebraicGeometry.LineBundle.Ample`, `TauCeti.AlgebraicGeometry.LineBundle.Dual`, `TauCeti.AlgebraicGeometry.EffectiveCartierDivisor.Invertible`, `TauCeti.AlgebraicGeometry.AbelianVariety.Basic`, `TauCeti.AlgebraicGeometry.ProjectiveSpectrum.ProjectiveOver`, `open … Limits MonoidalCategory` and `open TauCeti.AlgebraicGeometry`, and state (tested text; each elaborated at the pins):

   ```lean
   /-- BBE07 Corollary 1.6: `f : X ⟶ Y` between proper `K`-schemes inducing bijections
   `Hⁱ(Y, 𝒪_Y) → Hⁱ(X, 𝒪_X)` for all `i` gives `|X(K)| ≡ |Y(K)| mod |K|`. -/
   theorem card_rationalPoints_modEq_of_cohomologyPullback_bijective {K : Type u} [Field K]
       [Fintype K] {X Y : Scheme.{u}} (πX : X ⟶ Spec (.of K)) (πY : Y ⟶ Spec (.of K))
       [IsProper πX] [IsProper πY] (f : X ⟶ Y) (hf : f ≫ πY = πX)
       (hH : ∀ i, Function.Bijective (fun x =>
         (Scheme.Modules.cohomologyFunctor X i).map (Scheme.Modules.pullbackObjUnitIso f).hom
           (f.cohomologyPullback (𝟙_ Y.Modules) i x))) :
       Nat.card {s : Spec (.of K) ⟶ X // s ≫ πX = 𝟙 _} ≡
         Nat.card {s : Spec (.of K) ⟶ Y // s ≫ πY = 𝟙 _} [MOD Fintype.card K] := by
     sorry

   /-- A theta divisor on `A`: an effective Cartier ideal `I = 𝒪_A(−Θ)` whose inverse class is
   ample and whose inverse has a one-dimensional space of global sections (a principal
   polarization). -/
   def IsThetaDivisor {K : Type u} [Field K] (A : AbelianVariety K)
       (I : A.toScheme.IdealSheafData) : Prop :=
     ∃ hI : I.IsEffectiveCartier,
       (LineBundleClass.mk hI.toInvertibleSheaf.dual).IsAmple ∧
       letI : A.toScheme.Over (Spec (.of K)) := ⟨A.toOver.hom⟩
       Module.finrank K (Scheme.Modules.Cohomology hI.toInvertibleSheaf.dual.obj 0) = 1

   /-- BBE07 Theorem 1.4 (Serre's congruence): two theta divisors on an abelian variety over a
   finite field have congruent numbers of rational points modulo `|K|`. -/
   theorem card_thetaDivisor_modEq {K : Type u} [Field K] [Fintype K] (A : AbelianVariety K)
       (I I' : A.toScheme.IdealSheafData) (hI : IsThetaDivisor A I) (hI' : IsThetaDivisor A I') :
       Nat.card {s : Spec (.of K) ⟶ I.subscheme // s ≫ (I.subschemeι ≫ A.toOver.hom) = 𝟙 _} ≡
         Nat.card {s : Spec (.of K) ⟶ I'.subscheme // s ≫ (I'.subschemeι ≫ A.toOver.hom) = 𝟙 _}
           [MOD Fintype.card K] := by
     sorry

   /-- The degree of a zero-cycle relative to `π : X ⟶ Spec L`: the sum of its coefficients
   weighted by residue degrees. -/
   noncomputable def zeroCycleDegree {X : Scheme.{u}} {L : Type u} [Field L]
       (π : X ⟶ Spec (.of L)) (z : AlgebraicCycle X ℤ) : ℤ :=
     ∑ᶠ x, z x * (π.residueDegree x : ℤ)

   /-- Universal rational `CH₀`-triviality (README §6.10): over every field extension `L` of `K`,
   every zero-cycle of degree `0` on `X_L` is torsion modulo rational equivalence. -/
   def UniversallyCH0Trivial {K : Type u} [Field K] {X : Scheme.{u}} (π : X ⟶ Spec (.of K))
       [IsProper π] : Prop :=
     ∀ (L : Type u) [Field L] [Algebra K L],
       let πL := pullback.snd π (Spec.map (CommRingCat.ofHom (algebraMap K L)))
       haveI : IsLocallyNoetherian (pullback π (Spec.map (CommRingCat.ofHom (algebraMap K L)))) :=
         LocallyOfFiniteType.isLocallyNoetherian πL
       ∀ z : Chow.cyclesOfDimension (pullback π (Spec.map (CommRingCat.ofHom (algebraMap K L)))) 0,
         zeroCycleDegree πL z = 0 → ∃ N : ℕ, 0 < N ∧ N • z ∈ Chow.RatEquiv _ 0

   /-- Esnault's theorem (ESN03 Corollary 1.2; README §6.14 (i)): a smooth projective
   geometrically connected universally `CH₀`-trivial variety over a finite field has a number of
   rational points congruent to `1` modulo `|K|`. -/
   theorem card_rationalPoints_modEq_one_of_universallyCH0Trivial {K : Type u} [Field K]
       [Fintype K] {X : Scheme.{u}} [X.Over (Spec (.of K))] [X.IsProjectiveOver K]
       [IsProper (X ↘ Spec (.of K))] [Smooth (X ↘ Spec (.of K))]
       [GeometricallyConnected (X ↘ Spec (.of K))] (h : UniversallyCH0Trivial (X ↘ Spec (.of K))) :
       Nat.card {s : Spec (.of K) ⟶ X // s ≫ (X ↘ Spec (.of K)) = 𝟙 _} ≡ 1 [MOD Fintype.card K] := by
     sorry
   ```

   (b) Delete `card_rationalPoints_modEq_one_of_cohomology_vanishing` from `Suggested.lean` (it is the case `Y = Spec K` of the first theorem); keep README §6.4 (iv) as a target with its Checks, without the backticked name. (c) Rewrite the docstring's "not statable" list: keep the rigid-cohomology, Witt-sheaf, h-topology, Witt-rational-singularity and `ζ^{<1} = ζ^W` items; remove the three refuted ones. (d) README: line 17 and line 50 drop "no pullback along morphisms of schemes" and cite `AlgebraicGeometry.Scheme.Hom.cohomologyPullback` and `Scheme.Modules.pullbackObjUnitIso` in `## Exact supplier contracts` (From Tau Ceti), together with `LineBundleClass.IsAmple`, `InvertibleSheaf.dual`, `IsEffectiveCartier.toInvertibleSheaf`, `AbelianVariety`, `Scheme.IsProjectiveOver`, `Chow.cyclesOfDimension`, `Chow.RatEquiv`, `Scheme.Hom.residueDegree` and Mathlib `GeometricallyConnected`; attach the new names to §6.4 (ii), §6.9 and §6.14 (i); in §6.10 record that `UniversallyCH0Trivial` encodes "deg ⊗ ℚ bijective" as "the kernel of deg is torsion" (surjectivity after ⊗ ℚ is automatic for a nonempty proper scheme, §6.10 route step 2) and that `zeroCycleDegree` is the residue-degree-weighted sum of SchemeAndStackFoundations §5.2 restricted to zero-cycles. Tested: the theorems above are the ones refuted by `Spec 𝔽_{q²}`, `∅`, the ordinary elliptic curve and the split nodal cubic in §6.4's Checks (each violates one hypothesis and fails the conclusion), by `D = 2{0}` versus `{0} + {∞}` on `ℙ¹` for the theta-divisor hypotheses (BBE07 Remarks 6.6 (ii)), and by a genus-one curve for `UniversallyCH0Trivial` (§6.10 Check 3).

2. **F02** (P3) Supplier declaration names that do not exist at the supplier's current head

   **Location.** README line 70 and line 877 ("CrystallineCohomology §CR.3:duality.1, crysTrace_iso; … crysTrace_etale_local"), line 894 ("import Crystalline.crysTrace_iso and Crystalline.crysTrace_etale_local"); line 66 and line 1122 ("ClassicalAdicEtaleCohomology §5.4, PlurinodalAlteration.exists"), line 1135; line 13, line 117 and line 130 ("CrystallineCohomology §CR.4.6, wittScheme"); line 883 ("the canonical sheaf of SchemeAndStackFoundations:SF.2").

   **Claim.** The named declarations exist where cited.

   **Witness.** CrystallineCohomology at #857: `grep crysTrace` finds nothing; §CR.3:duality.1 "Proper smooth crystalline trace" (1) states that `Tr^Ek : W_nΩ^d_X → f_n^!W_n[−d]` is an isomorphism compatible with étale maps (Ekedahl I, Theorem 4.1 and (2.11)), and `wittScheme` is SchemeAndStackFoundations §0.26's perfect-scheme constructor, while CR.4.6's target is "Witt schemes on locally p-nilpotent schemes" (`W_rX`). ClassicalAdicEtaleCohomology at #875: `grep -i plurinodal` finds the plurinodal alteration theorem inside §5.4 (de Jong Corollary 5.10 and Theorem 5.9) but no `PlurinodalAlteration` name. SchemeAndStackFoundations on main has no section "SF.2"; `ω_X := H^{−d}(f^! k)` is §2.20 (README line 4353).

   **Repair.** Cite by section and statement: "CrystallineCohomology §CR.3:duality.1, proper smooth crystalline trace (the isomorphism `Tr^Ek` and its étale compatibility)" in the contract, §4.1 *Needs:* and route step 4; "ClassicalAdicEtaleCohomology §5.4, plurinodal alteration theorem" in the contract and §5.2; "CrystallineCohomology §CR.4.6, Witt schemes on locally p-nilpotent schemes" at lines 13, 117, 130 (keep the scope sentence, which is correct); "SchemeAndStackFoundations §2.20" at line 883. Tested: each replacement names a section whose statement was read at the head and covers the use (smooth `X` of pure dimension `d` for the trace; integral finite-type `X` over an excellent base for the alteration; locally `p`-nilpotent `X` for `W_rX`; Cohen–Macaulay `X` of pure dimension `d` over `k` for `ω_X`).

3. **F03** (P3) Library pin labels, line numbers and one hypothesis in the Mathlib contract

   **Location.** README line 46 ("At 6b7abb3c: … lines 44, 99, 138; … line 263; … line 283 … line 109"), line 50 ("At a91d3aaf").

   **Claim.** The cited Mathlib declarations sit at those lines of the pinned Mathlib; `WittVector.Isocrystal` requires a perfect characteristic-p domain.

   **Witness.** The pins are Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9` (`lake-manifest.json`). At the Mathlib pin: `frobenius_verschiebung` line 43, `verschiebung_mul_frobenius` line 102, `verschiebung_frobenius` line 141 (`Mathlib/RingTheory/WittVector/Identities.lean`), `map_surjective` line 263, `frobeniusEquiv` line 283, `char_dvd_card_solutions_of_sum_lt` line 110. `#check @WittVector.Isocrystal` elaborates to `(k : Type*) [CommRing k] [CharP k p] [PerfectRing k p] (V : Type*) [AddCommGroup V]`: no `IsDomain k` in the class signature. Commit hashes in roadmap prose are process residue.

   **Repair.** Replace "At 6b7abb3c:" and "At a91d3aaf:" by "At the pinned Mathlib:" / "At the pinned Tau Ceti:"; write lines 43, 102, 141 and 110; write "requires a perfect ring of characteristic p (no domain hypothesis)". Tested: the six `#check`s and `grep -n` at the pin give exactly these lines.

4. **F04** (P3) Manifest `cited_for` fields name design node ids absent from the README, and nine recorded works are cited by no target

   **Location.** `sources.toml` lines 20, 38, 56, 74, 92, 112, 131, 150, 168, 184, 200, 216, 231, 245, 260, 276, 292, 307, 323, 337, 351, 365, 379, 395, 411 (`cited_for = ["WV.0–WV.6"]`, `["WV.6/universal-chow-zero-triviality"]`, …); README lines 1752–1766 (References entries Gro85, Eke84, EkeII, CT03, Tsu03, Del74, BS83, Tsu04, EGAIII1).

   **Claim.** `cited_for` points a reader to where the work is cited, and every recorded work is cited at a target.

   **Witness.** The README's targets are `§k.n` sections; `grep -c "WV\." README.md` is 0, so the node ids survive only in `design/plan.json`. The keys `Gro85`, `BS83`, `Tsu04`, `Tsu03`, `CT03`, `Del74`, `EGAIII1`, `Eke84`, `EkeII` occur nowhere in lines 1–1740: §4.3 cites "the cycle class of Gros" through CR12 only, §4.1 cites Ekedahl through CR12 §1.10, §2.5 writes "Deligne (Hodge III, (6.2.5))" and "Tsuzuki's (HC)", §2.6 writes "EGA III 3.3.1", §3.4 writes "cited by BBE as [28, 7.3.3] and [10, 11.2.5]", §5.11 cites ESN03 and CR12 for the Bloch–Srinivas argument.

   **Repair.** Add the key to the locator parentheses of the target that uses the work: Gro85 (II, Définition 4.1.7, p. 50) in §4.3; Eke84 (Theorem 4.1 and (2.11)) and EkeII in §4.1; Del74 ((6.2.5)) and Tsu03 (condition (HC)) in §2.5; EGAIII1 (Proposition 3.3.1, pp. 117–118) in §2.1 step 2 and §2.6 step 1; CT03 (Proposition 11.2.5) and Tsu04 (§7.3.3) in §3.4 step 3; BS83 (Proposition 1) in §5.11. Then rewrite each `cited_for` as README sections, for example BBE07 `["§0.1–§0.8", "§2.1–§2.6", "§3.2–§3.7", "§6.1–§6.9"]`, Stacks `["§6.10"]`, Tan18 `["§6.11"]`, dJ97 and dJ96 `["§5.2"]`, Gro85 `["§4.3"]`, Ser58 and Ser58Top `["§6.8"]`, Ax64 `["§6.6"]`, BS83 `["§5.11"]`, CT03 and Tsu04 `["§3.4"]`, Del74 and Tsu03 `["§2.5"]`, EGAIII1 `["§2.1", "§2.6"]`, Eke84 and EkeII `["§4.1"]`. Tested: each listed section is the one whose route names the work in words.

Reviewed read-only: `packages/CrystallineCohomologyPartII/README.md` (1767 lines, 59 targets in seven layers), `Suggested.lean` (91 lines, three sorried theorems, no definitions), `metadata.toml`, `sources.toml` (25 entries: 17 certified, 8 uncertified), against Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9` (the pins of `lake-manifest.json`), main `ffac5139`, and the supplier heads printed by `roadmaps show` (CrystallineCohomology #857, PadicDifferentialEquationsAndRigidCohomology #1002, MotivesAndAlgebraicCycles #1313, ClassicalAdicEtaleCohomology #875, AbelianSchemesAndArithmeticModuli #849, NeronModelsAndSemistableAbelianVarietiesPartII #870, DerivedDeRhamCohomology #868, ArcTopologyAndDescent #1755; EnhancedDerivedSheaves, DerivedModuleAlgebra, SchemeAndStackFoundations, AdicSpacesPartIII and EtaleCohomologyFoundations on main). No previous review of this package. Four findings: one P2, three P3.

## Verified sound

**Principles.** No route-specific shortcut (every Layer is stated over a perfect field of characteristic `p`, no "good primes"); the parent CrystallineCohomology is consumed, not re-planned (Scope and ownership names what the parent owns, and §4.1 imports its trace rather than rebuilding it); supply is downward (gate below); no copied passages (the 15 sampled statements are paraphrases with locators); no algorithms; `Suggested.lean` has no `def`, no `set_option`, no `lemma`, imports `Mathlib` and one `TauCeti.*` module, three sorried theorems, one module docstring, `namespace TauCetiRoadmap.CrystallineCohomologyPartII`, a `## Layer 6` section comment.

**Elaboration.** `lake env lean packages/CrystallineCohomologyPartII/Suggested.lean` from the content checkout: 6 seconds, exactly three warnings, "declaration uses `sorry`" at lines 59, 71, 82, nothing else. `TauCeti.AlgebraicGeometry.Cohomology.Basic` had its object file.

**`#check` comparison.** All three declarations were `#check`ed in a scratch file; each elaborated type equals the README statement: projective Ax–Katz (`∀ j, (F j).IsHomogeneous (d j)`, `∀ j, 1 ≤ d j`, `∑ j, d j ≤ n`, count of `Projectivization K (Fin (n+1) → K)` on representatives, `≡ 1 [MOD Fintype.card K]`), affine Ax (`∑ i ∈ s, (f i).totalDegree < Fintype.card σ`, `Fintype.card K ∣ Nat.card {…}`), absolute point count (`IsProper π`, `Function.Bijective π.appTop`, `Subsingleton (Cohomology (SheafOfModules.unit X.ringCatSheaf) i)` for `0 < i`). The file has no section `variable`s, so no binder can be lost; nothing changed. `K : Type u` and `X : Scheme.{u}` share a universe.

**One-tactic probe.** On a scratch copy each theorem was tried with `first | simp | rfl | infer_instance | decide | omega` (and, for the affine form, `exact char_dvd_card_solutions_of_sum_lt …`): all alternatives failed on all three (the reported errors are omega's counterexample, the missing `DecidableEq σ` of the Mathlib lemma, and "type class instance expected"). Nothing in the file restates a definition, mirrors a Check, computes a value or treats a boundary case; no padding. (After R01 the absolute theorem becomes a boundary case of the relative one and is deleted.)

**Pinned declarations opened** (file and line at Mathlib `1b1ccf4b` unless said): `WittVector.frobenius_verschiebung` (Identities.lean 43), `verschiebung_mul_frobenius` (102), `verschiebung_frobenius` (141, `[CharP R p]`), `WittVector.map_surjective` (Basic.lean 263), `WittVector.frobeniusEquiv` (Frobenius.lean 283, `[PerfectRing R p]`), `char_dvd_card_solutions_of_sum_lt` (ChevalleyWarning.lean 110: `p ∣ Fintype.card {…}` with `[CharP K p]`, `[DecidableEq σ] [DecidableEq K]`), `CategoryTheory.ObjectProperty.IsSerreClass` (SerreClass/Basic.lean 45), `SerreClassLocalization.abelian` (Localization.lean 416), `isZero_obj_iff` (133: `IsZero (L.obj X) ↔ P X`), `WittVector.Isocrystal` (Isocrystal.lean 112), `Projectivization.rep` (Projectivization/Basic.lean 91), `SheafOfModules.unit` (ModuleCat/Sheaf.lean 170), `Scheme.Hom.appTop` (Scheme.lean 182), `IsProper` (Morphisms/Proper.lean 41), `IsFinite` (Finite.lean 41), `IsSeparated` (Separated.lean 44), `Smooth` (Smooth.lean 59), `Surjective` (UnderlyingMap.lean 58), `DerivedCategory` (DerivedCategory/Basic.lean 87), `LinearMap.charpoly` (Charpoly/Basic.lean 44), `PowerSeries.exp` (WellKnown.lean), `TruncatedWittVector`, `WittVector.teichmuller`; Tau Ceti `2fd255d9`: `Scheme.Modules.Cohomology` (`TauCeti/AlgebraicGeometry/Cohomology/Basic.lean` 61, `abbrev … := CategoryTheory.Sheaf.H …` of the underlying abelian sheaf). All 23 names in the README's Mathlib and Tau Ceti contracts resolve by `#check`.

**Sources: the seeded sample (15 targets), each read at its locator in the cached text.** §0.4: BBE07 Proposition 2.1 (i)–(ii), p. 7 (BBE07 lines 259–282: `WN_K = 0` because `F` is nilpotent on `WN`, `p = VF`), CR12 Lemma 4.6.2, p. 90 (line 4277), NT20 Remark 2.2, p. 6 (line 275) — supports (i), (ii) and the isogeny version; (iii) is the README's own extension with the nilpotent-nilradical hypothesis and the negative control `𝔽_p[t_1, t_2, …]/(t_i^{p^i})`. §1.2: BS17 Notation 11.42, Lemma 11.43 with proof, Remark 11.44, pp. 51–52 (lines 2395–2416) and the `n = 2` case of Lemma 11.45, p. 53 (2440–2449) — (a) derived base change over affine `Y`, (b) `W(A)[1/F] ≃ W(π_0 A)[1/F]`, (c) cone killed by `p`, all as stated. §1.5: BS17 Proposition 11.41 and proof, pp. 51, 53–54 (2389, 2454–2500) with §2 Definition 2.5, Lemma 2.6, Theorem 2.9, Lemma 2.10 (214–234, 289–325); BS17 §11.5 fixes "a noetherian `𝔽_p`-scheme `S` of finite Krull dimension" (line 2384), exactly the README's hypothesis; the pushout step the README replaces by §1.3 is BS17's "`Y′ = X ⊔_E Z` … Cartesian up to universal homeomorphisms" (2471–2478). §2.2: CR12 Corollary 4.6.4 and proof, pp. 90–91 (4301–4313: isolated singularity, `f` projective birational, any scheme structure on `E`), HW23 Corollary 4.6 and proof, p. 21 (953–980, the sequence `0 → WI_{S,ℚ} → WO_{Y,ℚ} → u_*WO_{S,ℚ} → 0` at 975), GNT19 Lemma 2.25, p. 18 (812–827) — the README's form with a closed `Y_0` and the hypothesis `R^q f_* O_X = 0` off `Y_0` is CR12 Proposition 4.6.1 (4259–4275) plus the long exact sequence; checked. §2.6: BBE07 Proposition 3.2 and proof, pp. 18–21 (722–839) — hypotheses (reduced `X`, `N`-truncated proper hypercovering, étale over `U`) and conclusions (acyclic in degrees `≠ N`, isomorphisms for `q < N`) as stated. §3.4: BBE07 Lemma 5.1 and proof, pp. 28–30 (1207–1278), conditions (i)–(iv) and the construction `P_• = P × ∏_{m ≤ N} Γ_•(W_m)` with the citations [28, 7.3.3] and [10, 11.2.5] as the README reports. §3.5: BBE07 5.2 second paragraph, p. 31 (1309–1315) and Theorem 4.5 with (4.13), pp. 26–27 (1118–1131). §3.6: BBE07 Theorem 1.1, p. 2 (67–69), proof in 5.2, pp. 30–33 (1279–1412: induction on dimension, reduction to projective `X̄`, `N ≥ 2d`, étale over a dense `U`). §5.2: CR12 Definition 4.3.1, the factorization remark and Remark 4.3.2, p. 79 (3751–3771); proof of Proposition 4.4.6, p. 83 (3960–3963); Corollary 4.5.1, p. 86 (4101–4119); GNT19 Remark 3.1, p. 19 (842–850); dJ97 Corollary 5.15 and proof, printed p. 620 (798–808: "resolved up to quotient singularities and a purely inseparable extension of `R(X)`"); dJ96 Corollary 7.4, printed p. 88 (1459–1461). §5.4: CR12 Theorem 2, p. 3 (138), Theorem 4.3.3 with proof, pp. 79–80 (3772–3838: cycles `α, β, γ`, relations (4.3.1)–(4.3.4), inverse isomorphisms up to `deg a · deg b · deg u`), Lemma 4.3.4, pp. 80–81 (3839–3847). §5.6: CR12 Theorem 3, p. 4 (179), Corollary 4.4.7, Remark 4.4.8, Proposition 4.4.9 with proof, p. 83 (3965–3983); the proof handles conditions (2) and (3) separately, so the README's "(resp. WO-rational)" is supported. §6.5: CR12 Corollary 2, p. 5 (218), Corollary 4.4.16 with proof, p. 85 (4054–4058: quasi-birational integral projective `X, Y` with WO-rational singularities, all finite extensions `k′`), GNT19 Remark 3.1 (842–850). §6.6: BBE07 Corollary 1.5, p. 5 (177–180) and Proposition 6.8 with proof and the proof of Corollary 1.5, pp. 37–38 (1594–1633: `r = 1` via `H^i(ℙ^n, O(−d)) = 0` for `d ≤ n`, then Corollary 2.3 for the closed cover `D = ∪ D_j`); Ax64 is uncertified (by locator). §6.8: BBE07 §6.5, p. 36 (1536–1546: condition b) follows from Serre's Bockstein vanishing, cited as [24, §1, 3] and [25, Théorème 2]); Ser58Top is the Mexico symposium volume, Serre's paper at printed pp. 24–53 (PDF pages 36–65; line 990 is its title, lines 1130–1163 define the Bockstein operations and "sans torsion"); Ser58 Théorème 2 is uncertified. §6.11: GNT19 Definition 4.5 and Remark 4.6, p. 29 (1298–1312; Remark 4.6 (1) cites Kollár IV Exercise 3.2.5 and Tanaka Proposition A.4 without the properness and geometric normality that Tan18 Proposition A.4 requires — the README carries those hypotheses, correctly), ESN03 §1, p. 2 (41–82), Tan18 Remark 5.3 (1), p. 20 (763–765) and Proposition A.4, p. 30 (1183–1186: proper, geometrically normal, geometrically connected); Kol96 uncertified. Also read for other targets: BBE07 Theorem 2.4 (345–356), Corollary 1.2 (129–142), Proposition 2.10 (618–632), Proposition 6.3 (1475–1494: the four equivalent conditions as in §6.3), Proposition 6.4 (1498–1518: conditions a), b) as in §6.7), Corollary 1.6 (195–198), Proposition 6.9 (1637–1640); CR12 Definition 4.4.4, Remark 4.4.5, Proposition 4.4.6 (3932–3963), Theorem 4.7.4, p. 93 (4444–4456: projective cone of `(X_0, L)` with `H^i(X_0, ω ⊗ L^n) = 0`; the README's "Separately" statement for the possibly nonnormal cone uses only the WO-conditions and proves condition (1) through §0.5 (ii), so the stronger hypothesis is not needed), Theorem 4.8.1 (4544–4559: hypotheses exactly as §5.12); GNT19 Lemma 2.22 (767–779), Proposition 2.23 (785–790); NT20 Lemma 2.17 (650–674) and the convention "connected fibres" (217–219: `X ×_Y Spec L` empty or connected for every field `L`), matching Conventions 7.

**Supplier citations resolved** (section titles read at the head or on main): CrystallineCohomology §CR.4.4 "Inputs on Witt vectors" (finite-length `F_r, V_r`, `F V = p`, Witt lifting of torsion-free Frobenius lifts, divided powers on `V W_{r−1}`), §CR.4.6 (classical de Rham–Witt, "Witt localization and étale descent", Witt schemes on locally `p`-nilpotent schemes), §CR.4.7 (crystalline comparison, Dieudonné–Manin blocks, "Degree filtration and the slope spectral sequence"), §CR.4.8 "Logarithmic Hodge–Witt sheaves", §CR.3:duality.1 (trace; the sign `ε_d = (−1)^{d(d−1)/2}` is `1` for `d = 1`, agreeing with §4.1's last Check); EnhancedDerivedSheaves §E1.3 `enhancedDerived`, §E1.4, §E2.6 `hypercoverDescent_boundedBelow`, §E2.8 `properSurjective_inductiveLevel` and `descendableCover_fppf`, §E5:descent `moduleDescent`, §E5:animation.1–3 (`simplicialWitt`, `wittFrobeniusLocalization`, `frobenius_zero_on_positive_homotopy`, bounded totalizations); DerivedModuleAlgebra §1.T.1 (Mittag-Leffler towers, `lim¹`); SchemeAndStackFoundations §0.20, §0.23 (`universalHomeomorphism_criteria`), §0.26 (`wittScheme`, `frobenius_factors_through_universalHomeomorphism` for finite type over `𝔽_p`, which is why the gap is needed), §0.29 (relative Frobenius integral radicial universal homeomorphism), §2.6 (`qcoh_higherDirectImages`, `projectiveSpace_cohomology`, `ample_serre_vanishing`, `proper_fibreDimension_vanishing`), §2.7, §2.19, §2.20 (`ω_X`, Serre duality), §2.21 (`SchemeDualizing`, `coherent_duality`, `trace_finite`), §4.9 (Stein factorisation), §4.12 (`modification_domination`), §4.14, §4.16, §4.19 (`alteration_theorem`), §5.1, §5.2 (proper pushforward with residue-degree weights, flat pullback, localisation), §5.5 (`Chow.gysin`, `pushforward_compat`, `pullback_compat`, `functoriality`; "gysin interchange" and "gysin proper flat" in the README are these); AdicSpacesPartIII §F0.6 *graded-cohomology-finiteness*; EtaleCohomologyFoundations §G.2 `nagataCompactification`; MotivesAndAlgebraicCycles §0.1, §0.6 ("`NΔ_X = Γ_D + Γ_Y`" under integral fixed support; the README's §5.11 is its rational extension and carries its own localization step), §2.2 (continuity over algebraic extensions and torsion kernel for smooth projective `X`); PadicDifferentialEquationsAndRigidCohomology §RD.3.1, RD.3.2, RD.4.1, RD.4.5, RD.4.12, RD.4.17–RD.4.19, RD.4.24, RD.4.36–RD.4.38, RD.5.67, RD.5.73, RD.5.74, RD.5.77, RD.5.78, RD.5.89, RD.5.90, RD.6.22, RD.6.23, RD.6.58, RD.7.4 (all headings present with the cited content); AbelianSchemesAndArithmeticModuli §A2.4 `ampleCohomologyAndDegree`; NeronModelsAndSemistableAbelianVarietiesPartII §1.1 ferrand geometric pushouts; DerivedDeRhamCohomology §PD.6 (universal base-compatible envelope, completed envelopes); ArcTopologyAndDescent §1.1 (universal descent with composition and right cancellation), §1.3 (h-site generated by finitely presented v-covers, abstract blowup squares), §1.6 (affine approximation, Rydh refinement via PrismaticCohomology §2.0). The citation resolver reported none missing; the four stale names are R02.

**Declared gaps.** `gap:qcqs-frobenius-factorization` (SchemeAndStackFoundations §0.26): precise (both composites, `N ≥ 0`, finite finitely presented universal homeomorphism of qcqs `𝔽_p`-schemes), minimal (§0.26 at main has only the finite-type-over-`𝔽_p` form, and §1.5's `Sch^fp_S` over a noetherian `S` is not finite type over `𝔽_p`), declared with the same slug in `plan.json` and the README (lines 100, 249, 447). `gap:h-descent-formalism` (ArcTopologyAndDescent §§1.1, 1.3, 1.6): precise and matched by the three sections at #1755; declared in both places (lines 62, 445, 447). Neither is unowned.

**Dependency check.** `tauceti-roadmap gate --depcheck … --movable`: `depcheck: 242 roadmaps, 2485 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. CrystallineCohomologyPartII is at line 133 of the merge order; ArcTopologyAndDescent at 116, PadicDifferentialEquationsAndRigidCohomology at 132, ClassicalAdicEtaleCohomology at 61, every other supplier earlier.

**Duplication, by object** (`roadmaps grep` over main and the 459 open heads, so the open pull requests named by the brief were covered through that index): "Witt vector cohomology", "WO-rational|Witt-rational", "Ax–Katz", "rationally chain connected", "Berthelot–Bloch–Esnault", "Frobenius-inverted|[1/F]", "universally CH_0", "card_dvd_card_solutions|char_dvd_card_solutions": no hit outside this roadmap; "theta divisor": only genus-one and Jacobian uses (ModularCurvesPartII, JacobianChallengePartII, FaltingsFinitenessAndIsogenyTheorems), different objects; "quasi-resolution": one occurrence in PadicDifferentialEquationsAndRigidCohomology §RD.5 in Kedlaya's sense, consumed not re-planned. Mathlib: `char_dvd_card_solutions_of_sum_lt` gives `p`, cited; `AlgebraicCycle` (locally finite functions) is the carrier Tau Ceti's Chow groups use. Tau Ceti: no Witt vector sheaf of a scheme (`WittVector` occurs only in Fargues–Fontaine and Tate-algebra files), no h- or v-topology, no rigid cohomology.

**Adversarial pass** (values computed; `q = |K|`):

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| Conventions 2, `FV = VF = p` | `W_2(𝔽_2) = ℤ/4` | `F(V(1)) = V(F(1)) = 2`, `[1] = 1` | holds |
| Conventions 6, slopes | `E = K ⊕ K` over `𝔽_4`, `F = (σ, 2σ)` | `φ = F² = (1, 4)`, `v_4 = 0, 1`; `E^{<1}` = first summand | holds |
| Conventions 6, `ζ` exponents | `ℙ¹/𝔽_q` | `ζ = (1−t)^{−1}(1−qt)^{−1}`, `ζ^W = (1−t)^{−1}`; degrees 0, 2 exponent `−1` | holds |
| Conventions 11, zero vector | `x² − ay²`, `a` nonsquare, `q` odd | projective zeros 0, affine zeros 1 = `1 + (q−1)·0` | holds |
| §0.1 `W_nI` vs Teichmüller ideal | `I = (t) ⊂ 𝔽_p[t]`, `n = 2` | `V(t) = (0, t) ∈ W_2(I)`; `[t](a_0, a_1) = (ta_0, t^p a_1)` | distinct |
| §0.1 `W_2O_X` not an `O_X`-module | `X = Spec 𝔽_p` | `p·1 = V(1) = (0,1) ≠ 0` in `ℤ/p²` | holds |
| §0.2 Serre class vs power of `p` | `p = 2`, constant `ℤ/3`; `⊕ ℤ/p^n` on a point | `ℤ/3 ∈ T(X)`, not 2-power torsion; `⊕ℤ/p^n ⊗ ℚ = 0` but `q(⊕ℤ/p^n) ≠ 0` | both conventions distinct, as stated |
| §0.2 `End(WO_{X,ℚ})` | `X = Spec 𝔽_p` | `colim_k Hom(p^kℤ_p, ℤ_p) = ℚ_p` | holds |
| §0.3 `[1/F]` kills nilpotents | `A = 𝔽_p[ε]/ε²` | `F` kills `W(εA)`; `W(A)[1/F] = ℤ_p`; `frobeniusEquiv` not applicable (`A` not perfect) | holds |
| §0.4 (iii) unbounded nilradical | `A = 𝔽_p[t_i]/(t_i^{p^i})` | `F^c(t_1, t_2, …)` has `t_i^{p^c} ≠ 0` for `i > c`; not injective on `[1/F]` | hypothesis needed |
| §0.5 (ii) connected fibres | `Spec 𝔽_{q²} → Spec 𝔽_q` | `W(𝔽_q)_ℚ → W(𝔽_{q²})_ℚ` has dimensions 1 vs 2 | fails, as the Check says |
| §0.5 (i) Frobenius factorization | `𝔽_p(t) ⊂ 𝔽_p(t^{1/p})`, `g^* = (·)^p`; identity of `∅`, `Spec 𝔽_p` | both composites `= F` (`N = 1`); `g = id`, `N = 0` | holds |
| §0.7 (3) properness | `j : 𝔸² ∖ 0 → 𝔸²` | fibres of dimension 0 but `H¹(𝔸² ∖ 0, O) ∋ [x^{−1}y^{−1}] ≠ 0` | properness needed |
| §0.8 slopes | ordinary / supersingular `E` | `H¹(E, WO)_K`: dim 1, slope 0 / dim 2, slope 1/2 | holds |
| §1.2 derived structure | `k[t]/(t) ⊗^L_{k[t]} k[t]/(t)` | `π_1 = k` (Tor), `W(−)[1/F] = W(k)` | holds |
| §1.3 pushout | `J = (f)`, `f` nonzerodivisor; `Y = 𝔸²`, `J = (x, y)` | `B′ = A ×_{A/J} A/J = A`; `H^0(X,O) = k[x,y]`, `H^0(E,O) = k`, `B′ = k[x,y]` | `Y′ = Y` |
| §1.3 (ii) Cartesian square | general `J` | `B′ → A/J` onto with kernel `K = H^0(X, JO_X)`, `J ⊂ K ⊂ Γ(JO_X)` so `KO_X = JO_X` | `E = X ×_{Y′} Z` scheme-theoretically |
| §1.3 (iv) fibre sequence | `H^i(X, O(−E)) = 0`, `i > 0` | `H^0` left exact by construction, right exact since `H^0(X) → H^0(E)` onto; `H^i(X) ≅ H^i(E)` for `i ≥ 1` | holds |
| §2.1 Check | blowup of the cone over a canonical curve, genus ≥ 3 | `R¹f_*(I′) ⊃ H¹(C, ω_C) = k ≠ 0`; `R¹f_*(WI′)_ℚ = 0` | holds |
| §2.2 Check | cone over elliptic `E` | `R¹f_*WO_ℚ = H¹(E, WO_ℚ)`: dim 1 or 2 | nonzero |
| §2.3 Checks | `𝔸¹`, `𝔾_m` | `H^*_c(𝔸¹) = 0` from `K → K` iso and `H¹(ℙ¹) = 0`; `H¹_c(𝔾_m) = K²/K = K`, `H^0_c = H²_c = 0` | holds |
| §2.4 Check | `𝔸²` | `H²_c(𝔸², WO_K) = 0`, `H⁴_{rig,c} = K(−2)` slope 2 | consistent |
| §2.6 Check | split node, `N = 1` vs `N = 2` | `N = 1`: `d^0 = 0`, `H¹ = K³`; `N = 2`: `d¹` gives `a = 0`, `b + c = 0`, `H¹ = K` (`= H¹(X, WO_K)`, slope 0) | range `q < N` essential |
| §3.1 slope parts | `K`, `F = p^aσ`; ordinary / supersingular `P` | `E^{<1} = E` iff `a ≤ 0`; `P^{<1} = 1 − αt` / `P^{<1} = P` | holds |
| §3.3 Check | `ℙ¹`, ordinary `E` | `H²(a_X): K(−1) → 0`; `H¹(a_E)` onto `K` with kernel the slope-1 line | holds |
| §3.5 Check | abelian variety, `p`-rank `f` | `dim H¹(A, WO)_K = f + (2g − 2f) = 2g − f` | holds |
| §3.6 Checks | `ℙ¹`, nodal cubic, `E` | `H^0`: `K ↔ K`; `H²_rig = K(−1)` slope 1 ↔ `0`; nodal `H¹ = K` slope 0; `E`: dim 1/2 | holds |
| §4.1 sign | `ℙ¹`, point cycle | parent `ε_1 = (−1)^0 = 1`; trace of the point `1` | agrees |
| §4.2 degree formula | `π: ℙ¹ → pt`; `F: 𝔸¹ → 𝔸¹^{(1)}` | `π_*` iso on `H¹(WΩ¹)`, `0` on `H^0(WO)` (shift `(−1,−1)`); `F_*F^* = p` | holds |
| §4.4 composition | finite flat `h` of degree `d` | `[Γ_h] ∘ [Γ_h^t] = p_{13*}{(h(x), x, h(x))} = d[Δ_Y]` | holds |
| §4.5 Check | `ℙ¹ × ℙ¹`, `[ℙ¹ × x]`, `[x × ℙ¹]` | first: `H^0 ↦ 0`, `α ↦ (∫α)ĉl(x)`; second: `id` on `H^0`, `0` on `H¹(WΩ¹)`; sum `= id` since `[Δ] = [x × ℙ¹] + [ℙ¹ × x]` | holds |
| §4.6 Checks | same cycles, `r = 1` | `[ℙ¹ × x]` lands in `H¹(WΩ¹)`: zero into `H^0(WO)` | holds |
| §5.1 Checks | quadric cone `p` odd; `F_{X/k}` | tame of degree 2; degree `p^{dim X}` universal homeomorphism | holds |
| §5.2 Checks | elliptic double cover of `ℙ¹`; cusp; split node | separable, not a quasi-resolution; `𝔸¹ → cusp` universal homeomorphism; node normalization degree 1 but two points over the node | holds |
| §5.4 / §5.5 Checks | quadric cone resolution; elliptic cone; `ℤ/p^n` quotient | `H¹(ℙ¹, WO_ℚ) = 0`; `H¹(E, WO_ℚ) ≠ 0`; finite quotient, not CM | holds |
| §5.9 normality | split nodal cubic | `f` finite, `R^{>0}f_* = 0`, `f_*O_{ℙ¹} ≠ O_S`, `H¹(S, WO)_K = K ≠ 0` | normality needed |
| §5.10 cone | `Z = Spec 𝔽_{q²} ⊂ ℙ¹` | `W(𝔽_q)_ℚ → W(𝔽_{q²})_ℚ` not onto; geometric connectedness needed | holds |
| §5.11 | `ℙ^d`; elliptic curve | `[Δ] = [pt × ℙ^d] + Γ`, `N = 1`; `CH_0(E_Ω) ⊗ ℚ ≠ ℚ` | holds |
| §6.1 / §6.2 | `pt`, `ℙ¹`, `𝔸¹`, `∅`, `E` | `ζ^W = (1−t)^{−1}, (1−t)^{−1}, 1, 1`; `P^W_1(E) = 1 − αt` or `P_1` | holds |
| §6.3 | `Φ = 1/(1−qt)`, `1/(1−t)` | `N_r = q^r`: (i)–(iv) with `κ = 1`; `N_r = 1`: none | holds |
| §6.4 (iv) and the Lean theorem | `ℙ¹`; two `ℙ¹` at a point; `∅`; `Spec K′`, `[K′:K] = 2`; ordinary `E/𝔽_p`; split node | `q+1 ≡ 1`; `2q+1 ≡ 1`; `Γ = 0`, 0 points; `Γ = K′`, 0 points; `H¹ ≠ 0`, `p+1−a ≢ 1`; `H¹ ≠ 0`, `q ≢ 1` | each negative control violates exactly one hypothesis |
| §6.5 Check | quadric cone `V(xy − z²) ⊂ ℙ³`, `F_2` | `1 + q(q+1) = q²+q+1`, `(q+1)²`, both `≡ 1` | holds |
| §6.6 projective Lean theorem | `r = 0`; `n = 0`; conics (smooth, `x² = 0`, `xy = 0`, `x² − ay²`); `F_j = 0`; `d = 0`, `F = 1`; cubic in `ℙ²` | `1 + q + ⋯ + qⁿ ≡ 1`; 1; `q+1`, `q+1`, `2q+1`, 1, all `≡ 1`; zero polynomial cuts out `ℙⁿ`; `0 ≢ 1` (hence `d_j ≥ 1`); `p+1−a ≢ 1` (hence `∑ d_j ≤ n`) | holds; hypotheses sharp |
| §6.6 affine Lean theorem and step 4 | `s = ∅`, `m ≥ 1`; nonzero constant; zero polynomial; `𝔽_9`, ternary quadric; `m = 1`, `f = x` | `q^m`; 0; no condition; `81 = 9²` (Chevalley–Warning gives only 3); `1 < 1` fails so excluded | holds |
| §6.8 Checks | `g = 0`; `g = 1`, every `i` | `V^i : k → W_{i+1}(k)` injective; `W_{i+1}(k) → W_i(k)` onto so the boundary vanishes | holds |
| §6.9 Check | `g = 1` | theta divisor = one rational point: `1 ≡ 1` | holds |
| §6.10 push-pull | `ℙ¹/𝔽_q`, `L′ = 𝔽_{q²}` | rational `x`: `π_*π^*[x] = 2[x]`; degree-2 `y`: two conjugate points, `2[y]` | weights needed |
| §6.11 RCC | `Spec k`; projective cone | `U = ℙ¹`, constant `u`; chains of two lines through the vertex, `u^{(2)}` dominant | holds |
| §6.13 / §6.14 | `ℙⁿ`; cubic surface | `H^i(ℙⁿ, WO) = 0`, slopes `j` in degree `2j`; `|ℙⁿ(𝔽_q)| ≡ 1` | holds |
| R01 candidate statements | `Spec 𝔽_{q²}`, `∅`, split node for the relative theorem; `2{0}` vs `{0}+{∞}` on `ℙ¹` for theta; genus-one curve for `UniversallyCH0Trivial` | each fails one hypothesis and the conclusion | statements not vacuous |

**Shape.** Summary, Scope and ownership, Conventions (12 items with 5 Checks), Exact supplier contracts (per supplier, both gaps in their suppliers' subsections), How to read the build, Layers 0–6 with `### k.n` prose targets, *Needs:* lines, API bullets, at least three Checks per definition (counted: every "The construction has the following API" block is followed by ≥ 3 Checks), `### Examples` and `### Dependencies` per layer, Downstream consumers, References (25 entries, all in `sources.toml`). No LaTeX delimiters, no target tables, no local paths; the only process residue is the two commit hashes (R03). `Suggested.lean`'s three names appear in the README with the right generality.

**Manifest.** 25 entries, ids match the References; `Ser58Top` is recorded as `institutional` from the Edinburgh page hosting the 1958 symposium volume; the HW23 entry records the v2/published numbering shift in `version_note`.

## Not verifiable

- Ser58 (Serre, AJM 1958, Théorème 2), Kol96 (IV.3.2.5, IV.3.6, IV.3.13.3, V.2.13), Ax64, Eke84, EkeII, Tsu03, Tsu04, BS83: settled as `uncertified`, cited by locator only; not read.
- HW23 published Corollary 1.3 and pp. 19–20 (cited in §3.6, §5.5, §6.5, §6.11, §6.13, §6.14): the certified text is arXiv v2, which has no Corollary 1.3 (its page 19 is lines 836–883, the dlt-modification corollary is 4.7); the published text was not fetched. The uses are supplementary to CR12 and ESN03, which were read.
- Ownership against open pull requests was checked through the `roadmaps grep` index of their heads, not file by file.

## Source issues

- **Misprint** in CR12 at Corollary 4.5.1, printed page 86: the source says the two quasi-resolutions are quasi-birational over X; it should be over S, the common target; affects nothing.
- **Misprint** in GNT19 at Proposition 2.23, printed page 18: the source calls the ideal a coherent ideal sheaf of O_X "on Y"; it should be an ideal of O_X (the BBE07 Theorem 2.4 setting); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2c35a876b58155ca0bcab93dd9c3545b90da580e", "job": "REV-PKG-CrystallineCohomologyPartII", "model": "fable", "worker": "chris-x10"} -->
