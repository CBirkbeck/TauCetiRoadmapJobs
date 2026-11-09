# Review of AdelicAlgebraicGroups (pull request #792 at 938ba48)

**Verdict:** needs changes

Line numbers below refer to `TauCetiRoadmap/AdelicAlgebraicGroups/README.md` and `TauCetiRoadmap/AdelicAlgebraicGroups/Suggested.lean` at `938ba48`. Tau Ceti paths are relative to the pinned Tau Ceti (`2fd255d`), Mathlib paths to the pinned Mathlib.

The gate passes on this head, with every check at 0. All five findings of the previous review (r15, at `734ad39`) are repaired; details are under Previous findings. One finding blocks acceptance (R01). Last round's point-topology repair has a second case: the pinned Tau Ceti also carries the Weil restriction of affine group schemes, with its Hopf structure, point isomorphism and topology, and the adelic base change. So the restriction-of-scalars headline that `Suggested.lean` lists as unstatable is in fact statable, and a tested statement is given. The other three findings are P3:
- the congruence kernels are still attributed to RG2.0.3 although they are pinned;
- the module docstring claims instances the pins do not provide;
- one Borel locator does not contain its statement.

## Previous findings (r15 at `734ad39`)

- **R01 (P2), point topology restated.** Repaired.
  - `Suggested.lean:12–13` imports `TauCeti.Topology.Algebra.PointTopology.Group` and `.Separation`, and the scoped `evaluationTopology` is gone.
  - `#synth TopologicalSpace (AdelicPoints F H)` on a scratch copy returns `TauCeti.PointTopology.instTopologicalSpaceWithConv`. That instance is the topology induced from `A → R` (`Topology/Algebra/PointTopology/Basic.lean:110`), the same as the deleted infimum.
  - `README.md:313` adds the “Point topology” supplier row. `:981–1011` reads “with Tau Ceti's point topology `TauCeti.PointTopology.instTopologicalSpaceWithConv`”.
  - The *Adelic groups are locally compact* target is deleted, and nothing cites it any more.
- **R02 (P3), Conrad locator for points over a product.** Repaired. `:1137–1140` reads “the homeomorphism is this roadmap's deduction from `(R₁ × R₂)^H = R₁^H × R₂^H` … The bijection for a product of coefficient rings is the map (3.6.2) in the proof of [Conrad], Theorem 3.6, p. 7”. Conrad line 308 is on p. 7.
- **R03 (P3), basis-change Check.** Repaired. The Check at `:2735–2741` is the `diag(1, N)` test, recomputed in the table below. The rank-zero Check at `:2742–2743` matches the stated `C″ > 1`.
- **R04 (P3), *orbit-map-siegel-preimage*.** Repaired. `:3830–3837` cites “[BKT erratum], §1.5, p. 3 … [BGST], §28, Proposition 28.1, pp. 14–15” and adds *orr-schnell-containment* and *Intersecting Siegel sets with a subgroup* to *Needs:*. Both texts were checked: BKT erratum line 121–126 and BGST line 631–635.
- **R05 (P3), AA.4.5 locators.** Repaired.
  - `:4842–4852` derives the coset count from Tau Ceti `DoubleCoset.doubleCoset_eq_iUnion_leftCosets` (`GroupTheory/DoubleCoset/Basic.lean:45`), `DoubleCoset.mk_out_mul_injective` (`NumberTheory/HeckeRing/Basic.lean:429`) and `HeckeCoset.degree_eq_relIndex` (`:908`).
  - `:4869–4872` cites Milne §5, p. 58, for `T(g)` (Milne line 2520–2525).
  - `:4936–4939` gives LT (21) as the special case it is (LT line 519, p. 14).
  - The three new Checks at `:4856–4861` are recomputed below.

## R01 (P2) — Restriction of scalars on adelic points is statable at the pins, but `Suggested.lean` lists it as unstatable and the README cites RG2.0a for the pinned Weil restriction

Location:
- `Suggested.lean:35–40`: “The following headlines are not stated here, because their objects are not carried by the pins: … Weil-restriction transport (the coefficient-natural Weil-restriction interface)”.
- `README.md:1328–1329` (*base-change-adelic*): “*Needs:* AA.1.1; ReductiveGroupsPartII, RG2.0a (`WeilRestriction.functor`, `WeilRestriction.functor_isCorepresentable`)”.
- The same attribution appears at `:1299`, `:1304`, `:1308`, `:102–103`, `:204–205` and `:519–520`.

Claim: the pins carry no coefficient-natural Weil-restriction interface. So `Res_{E/F}(G_E)(𝔸_F) ≃ₜ* G_E(𝔸_E)` cannot be stated, and its inputs come from ReductiveGroupsPartII RG2.0a.

Witness: the Tau Ceti pin has `TauCeti.Algebra.WeilRestriction` with `instHopfAlgebra`, `pointsMulEquiv` (natural in `T`), `mapBialgHom`, `compAlgEquiv` and `homHomeomorph`, and `GlobalNumberFields.adeleBaseChangeAlgEquiv`. The statement below elaborates in a copy of `Suggested.lean`.

The declarations, at the pin:

| Declaration | Tau Ceti file and line |
|---|---|
| `instHopfAlgebra` | `Algebra/HopfAlgebra/WeilRestriction.lean:451` |
| `pointsMulEquiv` | `Algebra/HopfAlgebra/WeilRestriction.lean:215` |
| `pointsMulEquiv_naturality` | `Algebra/HopfAlgebra/WeilRestriction.lean:242` |
| `mapBialgHom` | `Algebra/HopfAlgebra/WeilRestriction.lean:274` |
| `homEquiv` | `RingTheory/WeilRestriction/Basic.lean:248` |
| `compAlgEquiv` | `RingTheory/WeilRestriction/Composition.lean:65` |
| `homHomeomorph` | `Topology/Algebra/PointTopology/WeilRestriction.lean:53` |
| `TauCeti.GlobalNumberFields.adeleBaseChangeEquiv` (and `_tower`) | `NumberTheory/NumberField/Global/Adeles/BaseChange.lean:209` |

Repair:

1. In `Suggested.lean`, add `import TauCeti.Algebra.HopfAlgebra.WeilRestriction` and `import TauCeti.NumberTheory.NumberField.Global.Adeles.BaseChange`. After `end AdelicPoints`, state the following with a docstring ([Conrad], Example 4.2, p. 10):

   ```lean
   theorem exists_weilRestriction_adelicPointsEquiv
       (E : Type) [Field E] [NumberField E] [Algebra F E] [FiniteDimensional F E]
       (H : Type) [CommRing H] [HopfAlgebra E H] [Algebra.FinitePresentation E H] :
       ∃ e : AdelicPoints F (TauCeti.Algebra.WeilRestriction F E H) ≃ₜ* AdelicPoints E H,
         ∀ x h, (e x).ofConv h =
           TauCeti.GlobalNumberFields.adeleBaseChangeAlgEquiv F E
             (Algebra.TensorProduct.comm F E (NumberField.AdeleRing (𝓞 F) F)
               ((TauCeti.Algebra.WeilRestriction.pointsMulEquiv F E H _ x).ofConv h)) := by
     sorry
   ```

2. Delete “Weil-restriction transport” from the docstring's list of unstatable headlines, and put the new name on *base-change-adelic*'s *Lean:* line (`:1331`).
3. In the README, add a “Weil restriction” row to the supplier table with the declarations and files above.
4. At `:1299`, `:1304–1308`, `:1328–1329`, `:102–103`, `:204–205` and `:519–520`, cite those declarations instead of RG2.0a's `WeilRestriction.functor` and `functor_isCorepresentable`. Keep RG2.0a only for what the pin lacks, if anything.

Tested:
- **Elaboration.** The scratch copy with exactly these additions runs `lake env lean` to exit 0, with 19 `sorry` warnings (the 18 existing ones and the new one). It needed only a cache unpack of the two Tau Ceti modules.
- **The formula fixes `e`.** For `E = ℚ(i)`, `F = ℚ` and `G_m`, it identifies `(ℚ(i) ⊗ 𝔸_ℚ)^×` with `𝔸_{ℚ(i)}^×` as in the Check at `:1334`.
- **It excludes the inversion-twisted isomorphism** of the Check at `:1338–1340`, which sends the point `2` to `1/2`.
- **It is not padding.** Continuity needs `homHomeomorph`, the module topology on `E ⊗_F 𝔸_F` and `adeleBaseChangeEquiv`; one tactic does not close it.

## R02 (P3) — The congruence kernels attributed to RG2.0.3 are pinned in Tau Ceti, and AA.5.2 reproves their clauses for `K(N)`

Location:
- `README.md:1465` (*local-congruence-levels*): “ReductiveGroupsPartII, RG2.0.3 (congruence kernels).” The same attribution appears at `:1487`, `:5192–5193`, `:100–101` and `:517–518`.
- `:5176–5186` (*number-field-congruence-levels*): “Define the principal level `K(N)` … with … `g − I₂ ∈ M₂(NÔ_F)` … Ring maps `Ô_F → R` carrying `NÔ_F` into an ideal `J` carry these entry conditions …”.

Claim: congruence kernels are a planned RG2.0.3 target. AA.5.2 also proves for `K(N)` its entrywise membership, its coefficient functoriality, `M ⊆ N ⇒ K(M) ≤ K(N)` and openness.

Witness: Tau Ceti `TauCeti.HopfAlgebra.congruenceSubgroup` (`Algebra/AlgebraicGroup/CongruenceSubgroup/Basic.lean:62`), with `mem_congruenceSubgroup_iff` `:73`, `congruenceSubgroup_mono` `:101`, `congruenceSubgroup_le_comap_mapValue` `:161`, `isOpen_congruenceSubgroup` (`Topology.lean:67`) and `TauCeti.GeneralLinear.mem_congruenceSubgroup_iff` (`GeneralLinear/CongruenceSubgroup.lean:48`).

Repair:
1. Add a supplier-table row “Congruence subgroups” listing these declarations, `hasBasis_nhds_one_congruenceSubgroup` (`Topology.lean:86`) and their files.
2. Cite them instead of “RG2.0.3 (congruence kernels)” at the five places above.
3. In AA.5.2, define `K(N)` as the image in `GL₂(𝔸_{F,f})` of `TauCeti.HopfAlgebra.congruenceSubgroup 𝒪_F (TauCeti.GeneralLinear.coordinateHopfAlgebra 𝒪_F 2) (NÔ_F)` over `Ô_F`.
4. Cite the four theorems for its entrywise membership, coefficient functoriality, monotonicity in `N` and openness.
5. Keep as owned clauses: `K₀(N)`, `K₁(N)`, the completed-ideal comparison `𝒪_F/N ≃ Ô_F/NÔ_F` and the local product formula of AA.1.5.

Tested on the section's own Checks:
- At `N = 𝒪_F`, `congruenceSubgroup_top` gives all of `GL₂(Ô_F)`, the first Check at `:5197`.
- For proper `N`, the matrix `[[1,1],[0,1]]` has entry `1 ∉ NÔ_F`, so `GeneralLinear.mem_congruenceSubgroup_iff` excludes it from `K(N)`, the second Check at `:5198`.

All six names elaborate on a scratch file with the two Tau Ceti modules imported.

## R03 (P3) — The module docstring claims second-countable and locally compact instances that the pins do not provide

Location: `Suggested.lean:30–32`: “Adelic, local and archimedean points carry Tau Ceti's point topology with its topological-group, Hausdorff, second-countable and locally compact instances (`TauCeti.PointTopology`).”

Claim: each of these carriers has all four instances at the pins.

Witness: on a scratch copy with the file's imports and `[Algebra.FiniteType F H]`, `inferInstance` fails for:
- `SecondCountableTopology (AdelicPoints F H)`;
- `SecondCountableTopology (AdelicPoints.FiniteAdelicPoints F H)`;
- `SecondCountableTopology (AdelicPoints.InfinitePoints F H)`;
- `LocallyCompactSpace (AdelicPoints.LocalPoints F H v)`.

The README itself makes the ring-level second countability a target (AA.0.4, `:823–829`).

Repair: replace the sentence by “Adelic, finite adelic, archimedean and local points carry Tau Ceti's point topology (`TauCeti.PointTopology.instTopologicalSpaceWithConv`), under which they are Hausdorff topological groups; for finite-type `H` the adelic, finite adelic and archimedean points are locally compact. Second countability of the adele rings is AA.0.4 and is not an instance at the pins.”

Tested: on the same scratch copy, `inferInstance` finds `T2Space` for all four carriers, `IsTopologicalGroup` for the local and archimedean points, and `LocallyCompactSpace` for the adelic, finite adelic and archimedean points.

## R04 (P3) — *Discreteness in the finite adeles alone* cites a Borel proposition about the `S`-component

Location: `README.md:1244–1248`: “prove that `G(F)` is discrete in `G(𝔸_{F,f})` if and only if `G(F) ∩ U` is finite for one (equivalently every) compact open subgroup `U` … ([Borel], §1.8, p. 9)”.

Claim: Borel §1.8 states this equivalence.

Witness: Borel line 184–186 (p. 9). Proposition 1.8 says that the projection of the `S`-units `G_{o(S)}` to `G_S` is discrete, with a fibration of compact fibre. It concerns the `S`-component, not `G(F)` in the finite adeles.

Repair: write “This is this roadmap's deduction: a subgroup `Γ` of a Hausdorff topological group with a compact open subgroup `U` is discrete iff `Γ ∩ U` is finite. A discrete subgroup is closed, so `Γ ∩ U` is compact and discrete. Conversely, `U` minus the finitely many nonidentity points of `Γ ∩ U` is an open neighbourhood of `1` meeting `Γ` only in `1`. [Borel], §1.8, p. 9, is the analogue for the `S`-component.”

Tested on `GL₁/ℚ` with `U = ℤ̂^×`:
- `ℚ^× ∩ ℤ̂^× = {±1}` is finite, so `ℚ^×` is discrete in `𝔸_f^×`.
- Borel 1.8 at `S = {∞}` gives `{±1}` discrete in `ℝ^×`, a statement about `ℝ^×`.

## Verified sound

**Gate and build.**
- My gate run on `938ba48` prints `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 … statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `lake env lean` on `Suggested.lean` exits 0 with exactly 18 warnings, all `declaration uses 'sorry'`.

**Dependency check.** The movable check prints `depcheck: 239 roadmaps, 2365 edges, 0 problem(s)`, with no UPWARD or CYCLE line. In `ORDER.txt`:
- suppliers: SmoothRepresentationsOfLocalGroups at line 25, PolylogarithmFunctions 38, AnalyticNumberTheoryPartI 49, AnalyticNumberTheoryPartII 50;
- this roadmap at 51;
- consumers: SieveMethodsAndPrimePatterns 54, ArithmeticLocallySymmetricSpaces 56, ProbabilisticAndMetricNumberTheory 60.

The PMNT §4.9b mentions (`:133`, `:1782`, `:3081`, `:3090`) are prose about a downstream special case, not *Needs:* edges. No never-cite roadmap is cited.

**Signatures.** I elaborated `#check @name` for 55 declarations in one scratch file: every theorem, definition and structure that a headline statement uses. I read the scoped Borel instances and the `GL₂` abbreviations `Af`, `diag`, `toReal`, `Components` and `LevelSpace` in the source.
- The dropped-binder leads in `signatures.md` are harmless:
  - `box` drops an unused `TopologicalSpace`;
  - `InfinitePoints`, `IsCentralCocharacter`, `algebraicPointMap` and `IsFaithfulAlgebraicPointHom` drop an unused `[NumberField F]`.
- Every theorem carries the hypotheses of its README statement. For example, `isCoveringMap_levelMap` binds `hK` and `hKH`, and `hasStrongApproximation_of_simplyConnected` binds `hsc` and `hS`.
- The statements are unchanged from `734ad39` apart from the topology instance, which is now Tau Ceti's and equal to the old one.

**One-tactic probe.** On a scratch copy, every `sorry` was replaced by `first | (rfl; done) | (simp; done) | (infer_instance; done) | (trivial; done) | (decide; done) | (norm_num; done) | (exact?; done)`. All 18 theorems failed, so none is padding.

**Headline theorems.** These are stated:

| Headline | Lean statement |
|---|---|
| Convergent Haar products | `exists_unique_convergentHaarProduct` |
| Restricted-product comparison | `exists_restrictedProductEquiv` |
| Arithmetic covolume | `arithmetic_finite_volume_iff` |
| Finite class numbers | `finite_classes` |
| Finite volume | `exists_fundamentalDomain_normOne_lt_top`, `finite_volume_iff` |
| Compactness | `exists_compact_normOne_iff` |
| `GL_n` reduction | `exists_reduced_GLZ` |
| Weak and strong approximation | `hasWeakApproximation_of_simplyConnected`, `hasStrongApproximation_of_simplyConnected` |
| Neat levels | `exists_isNeatLevel_le`, `isCoveringMap_levelMap` |
| Quaternion norms | `nrd_image` |
| Idele classes modulo squares | `compactSpace_ideleClassGroup_quotient_squares` |
| Fourier limits | `tendsto_quadraticKernel_haar`, `isMulLeftInvariant_of_tendsto` |
| `GL₁` tori | `nonempty_connectedComponent_homeomorph` |
| `GL₂` decomposition | `exists_componentHomeomorph` |

The docstring's other unstatable items name their missing carriers: Tamagawa normalization (Artin L-functions, gauge measures), Siegel covering and cusps, the disconnected criterion, the torsor Hasse principle, `GL₁` classes and cohomology, and `GL₂` Riemann surfaces. The Weil-restriction item is the exception (R01).

**Tau Ceti and Mathlib declarations opened at the pins (54).**

| Area | Declarations, file and line |
|---|---|
| Point topology | `PointTopology/Basic.lean:110, 122, 128, 134, 245, 261`; `Functoriality.lean:110, 145`; `Group.lean:102, 120, 129`; `Separation.lean:64, 97, 113`; `IntegralPoints.lean:65, 102, 116`; `PointTopology/WeilRestriction.lean:53, 110` |
| Concrete groups and local fields | `GeneralLinear/Topology.lean:100` (in `section PointTopology`, so the name is `TauCeti.GeneralLinear.pointsContinuousMulEquiv`); `MultiplicativeGroup/Topology.lean:57`; `NumberTheory/LocalField/Topology.lean:44`; `DedekindDomain/AdicValuation/ValuativeRel.lean:109`; `Center/Basic.lean:424` |
| Double cosets and Hecke cosets | `DoubleCoset/Basic.lean:45`; `HeckeRing/Basic.lean:429, 902, 908` |
| Congruence subgroups | `CongruenceSubgroup/Basic.lean:62, 73, 101, 161`; `CongruenceSubgroup/Topology.lean:67, 86`; `GeneralLinear/CongruenceSubgroup.lean:36, 48` |
| Weil restriction and adeles | `HopfAlgebra/WeilRestriction.lean:215, 242, 274, 451`; `RingTheory/WeilRestriction/Basic.lean:228, 248`; `Composition.lean:65`; `Adeles/BaseChange.lean:209`; `Adeles/LocallyCompact.lean:41` |
| Mathlib | `Algebra/Algebra/Prod.lean:105` (`AlgHom.prodEquiv`); `SpecialFunctions/ImproperIntegrals.lean:102`; `MeasureTheory/Group/Measure.lean:286` |

The instance probe found the following:
- `SecondCountableTopology` is not inferred for `InfiniteAdeleRing`, `FiniteAdeleRing` or `AdeleRing` at the pins. So AA.0.4's ownership of it is not a duplicate; Tau Ceti only uses a local `letI` in `Adeles/InfiniteBaseChange.lean:196`.
- Tau Ceti's integral-point theorems are stated for a bialgebra over `𝒪[E]`. Using them at `F_v` for a model over `𝒪_{F,S}` passes through base change to `𝒪_v`, a standard step the README leaves implicit.

**Cross-roadmap citations resolved (main at `35884a8`, open heads from the index).**
- **ReductiveGroupsPartII on main:**
  - RG2.0.3 `:729` (*integral-points-compact-open*, *congruence-subgroup* `:776`);
  - *smooth-group-analytic-charts* `:640`, *equal-characteristic-…* `:682`;
  - RG2.0a `:943`, *reductive-model* `:3858`, *hyperspecial-vertices* `:4447`;
  - *iwasawa-parabolic-integral* `:6304`, *kneser-tits-local* `:6339`, *parabolic-adjoint-determinant* `:6389`;
  - the names `GeometricRoots.characterValue(_coe)`, `Decomposition.modularCharacter_eq_one`, `Lang.lang_surjective`, `LocalIntegration.modularCharacter_eq_adjointModulus`, `WeilRestriction.functor_isCorepresentable` and `ZExtension.derivedIdeal_{gl,sl}_n`.
- **SchemeAndStackFoundations:** `Torsor.trivial_iff_section` (also in its `Suggested.lean`), `torsorClasses.mk_eq_base_iff`, `Torsor.baseChange`, `Torsor.hom_isIso`.
- **AnalyticNumberTheoryPartI** §2.18a (`README.md:1676` at its head).
- **AnalyticNumberTheoryPartII:**
  - §5.3f `:667` (with `dx_v(O_v)=1` at `:669`), §5.3g `:681`, §5.3h `:698`;
  - §5.3j `:719` (`d^×x_v` giving `O_v^×` mass `N(𝔇_v)^{−1/2}`), §5.3k `:732`, §5.3l `:744`;
  - `exists_unique_restrictedAddHaar` (`Suggested.lean:267`), `exists_unique_quotientMeasure` (`:312`), `gl2_classNumber` (`:352`);
  - its consumer record of this roadmap at `README.md:3163`.
- **ProbabilisticAndMetricNumberTheory:** §4.9a `:6319`, `modularQuotient_existsUnique_invariant` (`Suggested.lean:670`).
- **ArithmeticLocallySymmetricSpaces:** `IsCartanInvolution` (`README.md:1168`).
- **Consumers** citing this roadmap as single owner: ArithmeticLocallySymmetricSpaces `:2313–2325`; AutomorphicSpectralTheory `:938`, `:1946`.

**Ownership.** I ran `roadmaps grep` over main and every open head for `HasStrongApproximation`, `IsNeatLevel`/`IsNeatAut`, `evaluationTopology`, the convergent Haar product, Tamagawa measures, `levelArithmetic`, `IntegralModel`, `normOne` and Siegel sets. The only second definitions are the known ones in the ClassicalArithmeticCompletion revision, pull request 1409: its `Suggested.lean:670` (`evaluationTopology`) and `:677` (`HasStrongApproximation`). As r15 concluded, removing them belongs to that pull request's review; this folder's Downstream consumers row (`README.md:5465`) already hands the object over. Elsewhere:
- `IntegralModel` matches are unrelated objects (EtaleCohomologyFoundations' Galois lattices, RigidAnalyticGeometry sections).
- `normOne` matches are other objects (GlobalNumberFields' idele classes, QuaternionArithmetic orders).
- The Tau Ceti pin has no adelic points of Hopf algebras, Siegel sets, neatness, strong approximation or Tamagawa measures of algebraic groups; the only Tamagawa hits are elliptic-curve local Tamagawa numbers.
- `overlaps.md` reports no open pull request changing this roadmap and no dropped ids.

**Sources: the seeded sample, read at the locators.** Printed pages:
- Borel's printed page is the page marker plus 3, uniformly; Witte Morris's is the marker minus 16.
- For Conrad, Conrad RGS, Arthur, Milne, Rapinchuk, Orr, Khayutin, Rosengarten, Gordon, LT, BGST and the BKT erratum, page markers equal printed pages.
- Borel, Rapinchuk, Orr, Rosengarten, Khayutin, Gordon and Conrad RGS were fetched through the sources service from Numdam, arXiv and the author's page, with no manifest edit.

| Sample target | Locators checked (source line) | Result |
|---|---|---|
| 1.1 | Conrad Prop 2.1 p. 2 (line 53–61), Thm 3.4 p. 5 (232–247), Rem 3.5 p. 6 (253–266), Thm 3.6 p. 6 (281–295); Milne §4 p. 42 (1845–1857); Arthur §2 p. 11 (456–508); Conrad RGS Def 3.1.1 p. 81 (3334–3338), Cor 3.1.11 p. 88 (3659–3664) | supports |
| 1.2 | Conrad (3.6.2) p. 7 (308–316), §4 p. 9 (422–440), Thm 3.6 pp. 6–8; Borel §1.2 pp. 6–7 (88–120); Witte Morris A4.6 p. 435 (18075) | supports (R02 repaired) |
| 1.3 | Conrad Ex 2.2–2.3 p. 3 (107–118), Prop 2.1; Borel §1.2 p. 7 (114–116), §1.3 p. 7 (121–128), §1.8 p. 9 (184–195) | supports, except R04 |
| 1.4 | Borel §1.4 pp. 7–8 (129–146), §1.3 p. 7; Conrad Ex 2.4 p. 3 (119–125), Ex 4.2 pp. 9–10 (452–470); Arthur §2 p. 11 (506–508) | supports; R01 for the supplier |
| 2.3 | Borel Thm 5.8 p. 22 (716–721); Arthur §3 p. 16 (745) | supports |
| 2.4 | Rosengarten §1.1 pp. 2–3 (43–80); Gordon §2.1 and (1) pp. 2–3 (82–117), (48) p. 32 (1626) | supports; PRR Thm 3.71 and Ex 5.23 paywalled; Dudas–Michel not read |
| 3.3 | Orr §2.A pp. 5–6 (192–215); Borel §2.1–2.2 p. 11 (283–300), §3.1 Lemma p. 14 (398–418), §3.3 p. 15 (430), Lemma 4.3, Lemma 4.4, Thm 4.5 p. 17 (522–561), §5.3 and Thm 5.4 p. 20 (636–654) | supports; BHC and PRR paywalled |
| 3.4 | Arthur Thm 8.1 p. 37 (2044), §4 p. 21 (1067); Borel Def 4.1 p. 17 (510), Thm 4.6 p. 18 (581), Thm 5.1 p. 19 (608), Cor 2.5 and Prop 2.7 p. 13 (363–372), Thm 5.6 p. 21 (679), Thm 5.8 p. 22, 7.2–7.3 p. 25 (853–870); Milne Thm 3.3 p. 33 (1483), Prop 3.6 p. 34 (1531), Lemmas 5.12–5.13 p. 57 (2475–2486), Prop 4.1 p. 43 (1911); Rapinchuk §2.4 p. 11 (553–558), §2.6 p. 16 (742); Conrad Thm 3.4(3) p. 5 | supports |
| 3.7 | Orr Lemma 2.1 p. 6 (221), Thm 4.1 p. 15 (656), §4.A p. 16 (685), Lemmas 4.2–4.5 pp. 17–18 (715–767), §4.C and Prop 4.7 pp. 19–20 (802–817), Lemmas 4.8–4.9 pp. 20–21 (848–868), Lemmas 4.10–4.11 pp. 22–23 (924–951), Lemmas 4.12–4.13 p. 24 (984–995); BKT erratum §1.5 p. 3 (121–126), proof p. 3 (94–99); BGST Prop 28.1 p. 14 (631–635) | supports (R04 of r15 repaired); Orr–Schnell not in a legal licence class |
| 4.2 | Rapinchuk Def p. 7 (349–350), Prop 2.1 p. 9 (436), §2.3 pp. 9–11 (446–544), Thm 2.3 and Remark 1 p. 12 (565–584), Lemma 2.7 p. 16 (744), §3 p. 17 (814); Arthur Thm 2.1(a) p. 12 (539–542), §16 p. 89 (5167); Borel §2.6 p. 13 (366) | supports |
| 4.3 | Milne §3 neatness p. 34 (1514–1520), Prop 3.5 p. 34 (1521), §5 p. 58 (2511–2516) | supports |
| 4.4 | Milne Lemma 5.13 p. 57 (2486); LT §3.2 p. 11 (407), (20) p. 14 (496); Arthur §2 pp. 12–13 (551–574) | supports |
| 4.5 | Milne p. 58 (2520–2525), Lemma 5.21 p. 61 (2658); Arthur (2.1) p. 13 (572); LT (21) p. 14 (519), §3.2.3 p. 16 (578) | supports (R05 of r15 repaired) |
| 4.6 | Khayutin §2.3 pp. 15–16 (653), Def 3.1 p. 22 (912), Prop 3.6 p. 24 (1001), proof p. 25 (1013–1034) | supports; PRR Thm 1.34 paywalled |
| 5.2 | Milne §4 p. 42 (1845–1857), Prop 4.1 p. 43, Lemma 5.11 p. 56 (2462), Lemma 5.13 p. 57, `T(g)` p. 58, Thm 5.17 p. 59 (2579), p. 63 (2728–2730: `π₀ = (ℤ/N)^×` for `K(N)` with `ℍ^±`); Borel §1.7 p. 8 (168) | supports |

The README flags no locator as unverified.

**Adversarial table.** Every value was computed this round.

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| Lean `exists_unique_convergentHaarProduct` | `ι = ∅`; `ι = Unit`, `C₄`, `B = {0,2}`, counting; `SL₂` tails | Dirac mass, `∏∅·∏'∅ = 1`; `T = ∅`: `ν(B) = 1·2 = 2`, `T = {()}`: `ν(box C) = #C`, both give `ν(B) = 2`, `ν(univ) = 4`; `∑ q_v⁻² < ∞`, `∏(1 − q_v⁻²) > 0` | true |
| 0.1 Borel boxes | `ℕ` copies of `ℤ/4`, `B = {0,2}` | `{0}` = ⋂ₙ boxes, measurable, not open | true |
| 0.3 factorizable integral | one `C₂`, constant `2`; two copies, `2` and `3` | `4`; `4·6 = 24` (probabilities would give `2`, `6`) | true |
| 1.1 `AdelicPoints` topology | `H = F`; `G_a`; `G_m` | a point; `𝔸_F`; inversion discontinuous for subspace topology of `𝔸^×`; instance resolves to `instTopologicalSpaceWithConv` | true; r15 R01 repaired |
| 1.1 integral models | `G_a`, `X ↦ pT`; standard `G_m` over `ℚ`, `S = {∞}` | `localPoints = p⁻¹𝒪_v ⊋ 𝒪_v`; `Γ = {±1}`, with `p ∈ S`: `±p^ℤ` | true |
| 1.2 product of rings | `G_a`; `G_m` | `R₁ × R₂`; `R₁^× × R₂^×`, product topology induced from `(R₁×R₂)^H` | true |
| Lean `exists_restrictedProductEquiv` | `H = F`; standard `G_m` model | singletons; `𝔸_f^× ≃ Πʳ[F_v^×, 𝒪_v^×]`, coordinate formula `(e x v)(h) = x(h)_v` | true |
| 1.3 discreteness in `𝔸_f` | `G_a`; `SL₂/ℚ`; `GL₁/ℚ`; trivial | `𝒪_F` infinite, not discrete; `SL₂(ℤ)` infinite, not discrete; `{±1}` finite, discrete; `{1}`, discrete | true; R04 (locator) |
| 1.3 squaring on `G_m/ℚ` | `(𝔸^×)²` | closed; infinite index (`∏ ℤ_p^×/(ℤ_p^×)²` infinite); not open | true |
| 1.3 centre | `SL₂/ℚ` | `Z(ℚ) = {±I}`; `diag(2,½)` outside | true |
| 1.4 *base-change-adelic* | `ℚ(i)/ℚ`, `G_m`; tower `ℚ⊂ℚ⊂ℚ` | `Res G_m(ℚ) = ℚ(i)^× ≠ ℚ^×`; identity on points vs inversion twist `2 ↦ ½` | true; R01 (statable) |
| 1.5 `Δ` on compact and central | upper Borel of `GL₂(ℝ)`; closed `{diag(a,1)}` | pushforward of `da db dd/(a²\|d\|)` by `·diag(α,δ)` is `\|α/δ\|`·itself: `1` on `diag(a,a)`, `diag(±1,±1)`; `Δ(diag(2,1)) = 2` | true |
| Conventions `δ_P` | upper Borel, `nm`, `b = xd` | right Haar `dx da dd/(\|a\|\|d\|) = db da dd/(\|a\|d²)`; left/right `= \|d/a\| = δ_P(m)⁻¹` | true |
| 2.1 characters | `GL₂` det on centre; `Res_{ℚ(i)/ℚ}G_m`; squaring | `ℤ → ℤ`, `1 ↦ 2`, cokernel `ℤ/2`; rank `1` not `2`; `a(φ) = 2` | true |
| 2.3 automorphic quotient | quadratic `F`, scalar `t`; idele `u_∞ = −1` | `H_G(t) = 2 log t`, so `2dt/t`; norm `1`, not principal | true |
| 2.4 Weil volumes | `G_m`; `GL₂`, `q = 2`; `SL₂/𝔽₂`; nonsplit rank 1 | `1 − q⁻¹`; `6/16 = 3/8`, corrected `2·3/8 = 3/4 = 1 − ¼`; `2·1·3 = 6`; `\|−2−1\| = 3` | true |
| 2.4 corrected `GL_n`, `SL_n` | general `n`; `n = 0` | `(1−q⁻¹)⁻¹∏_{i≤n}(1−q^{−i}) = ∏_{2≤i≤n}`; `SL_n` same; rank zero `2 ≠ 1`, so `n ≥ 1` needed | true |
| 2.4 complex gauge measure | `G_a/ℂ` | unit square `2`, `[0,2]²` `8`, `G_a²` square `4`; `dx dy` gives `1` | true |
| 2.4 Tamagawa | `G_a/ℚ` on `[0,1)×ℤ̂`; `G_m` | `1`; `λ_v·(1−q_v⁻¹) = 1`, `ρ = Res ζ_F` | true |
| 3.2 basis change | `b = diag(1,N)`, `std`, swapped `e` | std: `1<2`, `N<2N`, `1<2N`, `N<2N`; in `e`: (2) `N < C″`, (3) `N < 2N`; rank zero `1 < C″` | true; r15 R03 repaired |
| Lean `exists_reduced_GLZ` | `n = 0, 1` | empty: `1 < C·1` needs `C > 1`; `β < Cβ` | true with `C = 2` |
| 3.3 Siegel domain | `[[√y, x/√y],[0,1/√y]]`; Gram; `diag(a,a⁻¹)` | in `Σ₂(u,t)` iff `\|x\| ≤ u`, `y ≥ t`, `g·i = x+iy`; columns `(1,0),(1,2)` give `[[1,1],[1,5]]`; `diag(a⁻²,a²)` | true |
| 3.4 `levelArithmetic` | `GL₂/ℚ`, `x = diag(p,1)`; `G_a`, `U′ = {0}`; `GL₁`, level 3 | `[[1,0],[1,1]] ↦ [[1,0],[1/p,1]] ∉ GL₂(ℤ)`, so `≠ GL₂(ℤ)`; `ℤ` vs `{0}`, index `∞`; `{1}` | true |
| Lean `arithmetic_finite_volume_iff` | `G_m/ℚ`; `SL₂/ℚ`; trivial | `{±1}\ℝ^×` infinite and `X* = ℤ`: false/false; finite and `X* = 0`: true/true; point/`{1}`: true/true | true |
| Lean `finite_classes` | `G_m`, `ℤ̂^×`; `U = {1}` | `Cl(ℤ) = 1`; excluded by `IsOpen` (`ℚ^×\𝔸_f^×` uncountable) | true |
| Lean `exists_fundamentalDomain_normOne_lt_top` | `G_m`; `G_a` | `ℚ^×\𝔸¹` compact; `𝔸/ℚ` compact (`normOne = ⊤`) | true |
| Lean `finite_volume_iff` | `G_m`; `G_a`; `X* = 0` | false/false; true/true; `Δ = \|det Ad\|` is a rational character, so unimodular and left Haar suffices | true |
| Lean `exists_compact_normOne_iff` | `G_m`; `GL₂`, `X₁₁ ↦ T` | compact and `T^k` central; noncompact and `[[2,2],[0,1]] ≠ [[2,1],[0,1]]` | true |
| 3.4 *S-arithmetic lattices* | `{±1} ⊂ ℝ^×`; `SL₂(ℤ[1/p])` | infinite covolume; lattice, not cocompact | true |
| 3.4 arithmetic lattices `n = 1` | `ℚ(2^{1/4})/ℚ(√2)` | unit ranks `2` and `1`, norm-one units rank `1`, a torus | true |
| 3.7 counterexample groups | tilted `x = 2`; nonsplit `(3,4)`; `η D η⁻¹` | `[[2,−3/2],[0,½]]`, `g·i = −3+4i = (1−y)+iy`, `y = 4`; `9 − 2·4 = 1`; `[[35/16,0,9/16],[0,1,0],[−9/16,0,5/16]]`, `DJD = J`, `(ηᵀη)₁₃ = −3/2` | true |
| 3.7 `logA` | `SL₂`, `diag(2,½)` | `α = t²` gives `log 4` | true |
| 4.2 strong approximation | `G_m/ℚ`, `x₂ = 2`, `U = (1+5ℤ₅)×∏ℤ_p^×`; `PGL₂`, class `2` at 5 | `±2 ≡ 2, 3 (mod 5)`, never `1`; even valuations give class `±1`, squares mod 5 are `{1,4}`, `2` is not | true |
| Lean `hasStrongApproximation_of_simplyConnected` | trivial; `SL₂ × D¹`, `D` definite, `Sf = ∅` | `hS` vacuous, point dense; quotient `D¹` has compact `D¹(ℝ)`, so `hS` fails, and the conclusion is false there | true |
| Lean `hasWeakApproximation_of_simplyConnected` | trivial; `Sinf = Sf = ∅` | dense in a point | true |
| 4.2 through finitely many places | `G_m/ℚ`, `{∞,p}` | `±p^ℤ` not dense in `ℚ_p^×` | true |
| 4.3 neat elements | `(0 −1; 1 1)·2`; `p = 2`, `−1`; `p = 3`, `ζ₃` | eigenvalues `2e^{±iπ/3}`, ratio `ζ₃`, det `4`; `\|−2\|₂ = ½` (boundary); `\|ζ₃ − 1\|₃ = 3^{−1/2}` | true |
| Lean `exists_isNeatLevel_le` | `GL₂`, `U = GL₂(ℤ̂)` | `U′ = K(3)` normal, neat, index `\|GL₂(𝔽₃)\| = 48`; `GL₂(ℚ) ∩ K(3) = Γ(3)` since det `±1 ≡ 1 (mod 3)` forces `1` | true |
| Lean `isCoveringMap_levelMap` | `GL₁`, `U(3) ⊃ U(9)`; `SL₂`, `Γ(9) → Γ(3)`; `ℚ(√2)`, `η = 17+12√2` | `2 → 6`, fibres `3`; `648/24 = 27`; `η ≡ 1 (mod 4)`, `≢ 1 (mod 8)`, `η² = 577+408√2 ≡ 1 (mod 8)`, `H_G(K∞) = L(ℤ + (1+√2)ℤ) ≠ ℝ` | true; `hKH` needed |
| 4.4 index of products | `S₀ = 2ℤ`, `S₁ = 3ℤ` | index `6` | true |
| 4.4 groupoid | `SL₂`, `K∞ = SO(2)`, over `i` | `⟨[[0,−1],[1,0]]⟩`, order `4` | true |
| 4.5 Hecke degree | `GL₂/ℚ`, `diag(p,1)`; `g ∈ U`; central `g` | `gUg⁻¹ ∩ U = {b ∈ pℤ_p}`, index `p+1`; `1`; `gUg⁻¹ = U`, degree `1`, `UgU = gU ≠ U` | true |
| 4.5 transposes and Iwahori | `g⁻¹ = p⁻¹·diag(1,p)`; `I diag(p,1) I` vs `I diag(1,p) I` mod `p` | `T_{g⁻¹} = T_g` translated by `p⁻¹`, `\|det x_∞\| × p²`; zero first column vs zero bottom row | true |
| 4.5 class sets, `G^der` simply connected | `GL₂/ℚ`, `GL₂(ℤ̂)`; `GL₂/F`, `GL₂(Ô_F)` | one point both sides; `Cl(F)` both sides (`det` onto `F^×`) | true |
| Lean `nrd_image` | Hamilton, `c = −1, 3`; `ℚ(i)`; split `a = 1` | `−1`: no norm, RHS false; `3 = 1+1+1`, RHS true; RHS vacuous, all `c` norms; RHS vacuous, all `c` norms | true |
| Lean `compactSpace_ideleClassGroup_quotient_squares` | real scalar `2`; `−1` at 3 | `√2` is an idele, dies; `−1` not a square in `ℚ₃`, survives | true |
| Lean `tendsto_quadraticKernel_haar`, `isMulLeftInvariant_of_tendsto` | coordinates on `∏ℕ {±1}`; repeated `χ` | `∫χ_m dm_n = 0` for `m ≠ n`, `→ 0`; a repeated `χ` (excluded by `hχ`) leaves its kernel's Haar measure as the limit | true |
| Lean `nonempty_connectedComponent_homeomorph` | `ℚ`; `ℚ(√2)`, `Q = ∅` | rank `0`, points; `Λ = ⟨2 log ε⟩`, a circle | true |
| 5.2 component groups | `det` on `Γ_{g,U}`; `−I` at levels 2, 3 | `ℚ_{>0} ∩ ℤ̂^× = 1`; `−I ∈ Γ(2)`, `∉ Γ(3)` | true |
| Lean `exists_componentHomeomorph` | `GL₂(ℤ̂)`; `K(3)`; `O(2)` vs `SO(2)` at `N = 3` | one component `SL₂(ℤ)\ℍ`; `(ℤ/3)^×`, two; `(ℤ/3)^×/{±1}` one vs two (Milne line 2730) | true |
| 5.2 `GL₂(ℝ)` section | `2+3i` | `[[3,2],[0,1]]`, det `3`, `(3i+2)/1 = 2+3i` | true |
| 5.2 congruence levels | `N = 𝒪_F`; `[[1,1],[0,1]]` | `GL₂(Ô_F)` (`congruenceSubgroup_top`); in `K₁(N)`, not `K(N)` | true; R02 (supplier) |
| Docstring instances | `AdelicPoints`, `FiniteAdelicPoints`, `InfinitePoints`, `LocalPoints` | `T2Space` all found; `LocallyCompactSpace` found except local; `SecondCountableTopology` found for none | R03 |

## Not verifiable

- **Platonov–Rapinchuk–Rapinchuk 2023 and Platonov–Rapinchuk 1994.** Cambridge University Press and Academic Press paywalls. Their locators are taken as given: Lemmas 3.63 and 3.66, Theorems 3.12, 3.71, 4.12, 4.20, 5.22, 5.24, 1.34 and 7.8, Example 5.23, and §§3.1, 3.5 and 4.4. The same holds for the `Suggested.lean` docstring locators “Theorem 5.24, pp. 318–321”, “Theorem 7.8, p. 415” and “Theorem 7.12, p. 427”.
- **Paywalled or unread:**
  - Borel–Harish-Chandra 1962 (JSTOR), Schneider 2011 and Voight 2021 (Springer): paywalled.
  - Orr–Schnell 2023: its MSP copy is not in a legal licence class, so I relied on Orr arXiv v6, which incorporates the correction.
  - BHV: no legal copy located.
- **Outside this round's sample:** Platonov 1969 and its addendum, Dudas–Michel, Casselman, Sutherland, CG, HW, Loeffler and Stacks tags 0245, 04TY and 04SK were not read this round.
- **Ownership against open pull requests:** checked by `roadmaps grep` over every open head. I did not read the full READMEs of ShimuraVarieties, ShimuraData or the ReductiveGroups revision in pull request 1797; their checkouts are not given in this brief.

## Source issues

- none
