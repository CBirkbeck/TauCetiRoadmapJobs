# Review of ReductiveGroups (pull request #1332 at f510911)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/ReductiveGroups/README.md` (6292 lines) and `TauCetiRoadmap/ReductiveGroups/Suggested.lean` (514 lines: 21 declarations, 10 `sorry`'d theorems) at `f510911`. Against main the folder differs by 1726 added and 295 removed lines, all in these two files. Three findings: one P2 and two P3. The gate fails on one `tex` hit (R02).

## Previous findings (review of `a9e6e77`)

The previous review listed no finding, so there is nothing to carry. Since then the head merged main's revision of the folder: `Suggested.lean` is now main's file with five changes (Nagata without algebraic closedness, the Weyl-arrangement theorem on an arbitrary coroot space, docstring additions). R01 below comes from that merge: a theorem the file stated at `a9e6e77` is no longer stated while the README still has it as a target.

## R01 (P2) — the orbit theorem of §3A.2 is statable at the pins and is neither stated nor named

**Location.** `TauCetiRoadmap/ReductiveGroups/README.md:1662–1663` and `:1700–1714`; `:135–136`; `TauCetiRoadmap/ReductiveGroups/Suggested.lean:48–55` and `:124–127`.

> "The targets of this layer are local closedness of orbits over an arbitrary field (§3A.2) and the projective, complex and representation-theoretic statements of §§3A.5–3A.7."

**Claim.** The scope section says "3A.2 owns the local closedness of orbits over a field that is not algebraically closed", and the title of the pull request names the orbit target. The README (`:1158–1159`) says `Suggested.lean` states the statable headline theorems and that its docstring names the missing carrier for the others.

**Witness.** The module docstring lists Layer 3A only as "Proved in the pinned Tau Ceti" (algebraically closed case) and as not statable for 3A.5f. The statement below elaborates at the pins with `sorry` as the only warning (scratch copy of the file plus this theorem). `first | rfl | trivial | infer_instance | decide | simp | aesop` does not close it, and the pinned `TauCeti.SchemeAction.isLocallyClosed_orbit` (`AlgebraicGeometry/GroupAction/LocallyClosed.lean:177`) has `[IsAlgClosed k]`. The file stated this theorem at `a9e6e77`.

**Repair.** Add `import TauCeti.AlgebraicGeometry.GroupAction.LocallyClosed`, and after Layer 3, under `/-! ## Layer 3A: algebraic orbits -/`:

```lean
theorem orbit_locallyClosed {k : Type u} [Field k] (G X : Over (Spec (CommRingCat.of k)))
    [GrpObj G] [ModObj G X]
    [LocallyOfFiniteType G.hom] [QuasiCompact G.hom]
    [LocallyOfFiniteType X.hom] [QuasiCompact X.hom]
    (x : 𝟙_ (Over (Spec (CommRingCat.of k))) ⟶ X) :
    IsLocallyClosed (TauCeti.SchemeAction.orbit G x) := by sorry
```

(with `open CategoryTheory AlgebraicGeometry MonoidalCategory` and a docstring giving Milne, Proposition 1.65(b), pp. 26–27, and the two Checks of §3A.2). Add the sentence for it to the "Stated here" paragraph of the module docstring and name it in §3A.2 as the headline signature, as the other layers do. Tested on the instances of §3A.2: `μ₃` on `𝔸¹` over `ℝ` at `1` (closed two-point orbit), `𝔾_m` on `𝔸¹` at `1` and `0` (open, closed), and the constant group `ℤ` on `𝔸¹_ℚ`, which the `QuasiCompact G.hom` binder excludes.

## R02 (P3) — gate `tex`: a formula outside a code span

**Location.** `TauCetiRoadmap/ReductiveGroups/README.md:1998`.

> "computation H⁰(ℙⁿ_A, O(d)) = Sym^d(A^{n+1}) of §2.6. Prove the actual natural identification"

**Claim.** The formula uses `^{…}` outside a code span; the push gate reports `tex=1` and fails on it.

**Witness.** Gate at this head: `tex=1 … FAIL`, "line 1998: computation H⁰(ℙⁿ_A, O(d)) = Sym^d(A^{n+1}) of §2.6".

**Repair.** Write it as a code span: `` `H⁰(ℙⁿ_A, O(d)) = Sym^d(A^(n+1))` `` (for `d ≥ 0`). Values: `n = 1, d = 1` gives rank 2 on both sides; `d = 0` gives `A`; `n = 0` gives `A` for every `d ≥ 0`.

## R03 (P3) — §§8.1–8.2 restate split tori and pinnings that the pin declares, without citing them

**Location.** `TauCetiRoadmap/ReductiveGroups/README.md:3682–3702` (§8.2) and `:3655–3680` (§8.1); `TauCetiRoadmap/ReductiveGroups/Suggested.lean:112–115`.

> "A pinning of split data is a positive system in the constant root datum, its associated Borel containing T, and a generator of each simple-root line"

**Claim.** §8.2 defines pinnings and lists as API that a pinned isomorphism preserves torus, Borel and simple-root parameters, with no supplier citation. The module docstring of `Suggested.lean` (added at this head) relies on "the pinned `TauCeti.Pinning`", a name the README never mentions.

**Witness.** At the pinned Tau Ceti: `TauCeti.SplitMaximalTorus` (`Algebra/AlgebraicGroup/SplitTorus/Maximal.lean:54`), `TauCeti.HopfIdeal.IsBorelOver` (`Borel/Over.lean:59`), `TauCeti.Pinning` (`Pinning/Basic.lean:88`, connected base, simple roots read off torus and Borel), `TauCeti.Pinning.comapOfIso` and `comapOfIso_rootVector` (`Pinning/Isomorphism.lean:102, 154`). `grep` of the README for `TauCeti.Pinning`, `SplitMaximalTorus`, `IsBorelOver`: no hit.

**Repair.** Add a supplier-contract bullet naming these four declarations with their files, and what they do not include: `SplitMaximalTorus` asks for a closed rank-`r` split torus that is maximal on geometric fibres, with no freeness of root spaces and no constancy of roots or coroots; `Pinning` requires `ConnectedSpace (PrimeSpectrum R)` and has no base change of the whole pinning (`Pinning/BaseChange.lean` identifies one root space only). In §8.2 cite `TauCeti.Pinning` as the connected-base case and `TauCeti.Pinning.comapOfIso` for transport along an isomorphism, and keep as targets what the pin lacks: disconnected bases with a constant positive system, base change of pinnings, and the equivalence with normalized simple-root parameterizations. Tested on the Check that separates the two notions: over `Spec(k × k)` with `B⁺` on one `SL₂` component and `B⁻` on the other, the pinned `Pinning` does not apply (the base is disconnected) and §8.2's constant positive system rejects the pair.

## Verified sound

### Gate, dependency check, build, signatures

- **Gate** (the worker's run at this head): every check 0 except `tex=1` (R02); `build=0`, `depcheck=0`, `readme-ids-missing=0`, `stray-files=0`, `outside-folder=0`, `statement-hygiene=0`.
- **Dependency check** (my run): `depcheck: 227 roadmaps, 2109 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ReductiveGroups'` is empty.
- **Build:** `lake env lean TauCetiRoadmap/ReductiveGroups/Suggested.lean` exits 0 with exactly 10 `declaration uses 'sorry'` warnings (lines 148, 165, 187, 208, 230, 251, 276, 299, 461, 504) and nothing else.
- **Signatures.** The worker's `signatures.md` (21 declarations, none with a lost binder) was compared with the README, and `#check @` was rerun in a scratch file on the two theorems this head changed and on `RegularOrbits`. `linearlyReductive_iff_torus`: `Field k`, `Fact p.Prime`, `CharP k p`, `Algebra.Smooth`, geometric connectedness, no `IsAlgClosed`; README §6 (`:2476–2481`) says the same. `nonempty_mulEquiv_artinGroup`: `TopologicalSpace N`, `IsModuleTopology ℂ N`, `FiniteDimensional ℂ N`, `Finite ι`, `IsCrystallographic`, `IsReduced`; README §11B (`:5819–5822`) says the same. `RegularCoroots` and `RegularOrbits` mention only `ι M N` and the four module instances, which their types use. The other eight theorems are unchanged from main and agree with §§3, 6, 6A, 7, 7a, 11A.
- **Padding probe.** In a scratch copy every `sorry` was replaced by `first | rfl | trivial | infer_instance | decide | simp | aesop | sorry`: none of the 10 theorems closes (nine end in an error with the goal left, one keeps its `sorry`). The pinned `TauCeti.HopfIdeal.exists_conjugate_eq_of_isMaximalTorus` (`Torus/Conjugation.lean:149`) still carries its two containment hypotheses, and the pinned Nagata statement `linearlyReductiveCommHopfAlgProperty_iff_torus_of_isSolvable` (`Solvable/LinearlyReductive.lean:86`) is the solvable case over an algebraically closed field, so neither headline is the native theorem. `halfTwist_injective` is proved, not admitted, and is needed by `halfTwistLoop`.

### Headlines

Stated: the quotient by a normal subgroup (§3), the characteristic-zero criterion and Nagata (§6), Mostow's Levi complement (§6A), conjugacy of maximal tori, the Tits system and the parabolic Levi decomposition (§7), Lang (§7a), Artin's theorem in generator-characterized form (§11A), Brieskorn for Weyl arrangements (§11B). Missing: local closedness of orbits over any field (R01). Named as not statable, with reasons checked at the pin: rational representation categories (Layers 0–1), `G/P` and the extracted root datum (7, 9D), the relative centre (`TauCeti.CommHopfAlgCat.centerDefiningIdeal`, `Center/Basic.lean:302`, is under `[Field k]`), the Harish–Chandra functors (7c–7f), Lang–Steinberg (9E), the pinned model of a root datum (9; `TauCeti.Pinning` indexes by simple roots read off the group), highest-weight modules (10), the spectral comparison (11) and the complex orbit comparison (3A.5f). §6B's extension to subgroups with reductive identity component is the stated §6 criterion followed by the pinned `…_of_isLinearlyReductive`, and the nonsplitting of `B_n → S_n` in §11A is the parity argument the README gives; neither was counted as a headline.

### Library declarations opened at the pin (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`)

All 163 backticked identifiers that this head adds to the README were looked up in the pinned sources and `Suggested.lean`; each exists (the six without a hit are mathematical notation such as `O_alg`, `V_reg`). Opened, with the file the README gives confirmed:
- `TauCeti.isPushout_fundamentalGroup` (`AlgebraicTopology/FundamentalGroup/VanKampen/Basic.lean:349`: interiors cover, `A`, `B`, `A ∩ B` path connected through the basepoint), `TauCeti.TopCat.mem_serreFibrations_proj` (`Topology/Homotopy/SerreFibration/FiberBundle.lean:395`: any `FiberBundle`, no paracompactness).
- `TauCeti.HopfIdeal.exists_minimal_isBorelCandidate` (`Borel/Existence.lean:100`), `IsBorelOverAlgClosed.exists_le_conjugate_of_isBorelCandidate` (`Borel/Conjugacy/Containment.lean:47`).
- `TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadicalDefiningIdeal_baseChange_le` (`Unipotent/Radical/BaseChange.lean:94`), `eq_solvableRadicalDefiningIdeal_iff` (`Solvable/Radical/Construction.lean:96`), `semisimple_coinvariants_solvableRadical` (`Semisimple/RadicalQuotient.lean:69`).
- `TauCeti.Bialgebra.cotangentLinearEquivZariski` and `…_toCotangent` (`Tangent/Scheme.lean:46, 55`), `derivationCompLieHom_id`, `_comp` (`Tangent/Lie/Map.lean:162, 171`), `Derivation.adRepresentation` (`Tangent/Adjoint.lean:183`).
- `TauCeti.SchemeAction.isClosed_orbitBoundary` (`GroupAction/LocallyClosed.lean:198`), `topologicalKrullDim_orbit_lt_of_mem_orbitBoundary` (`GroupAction/ClosedOrbit.lean:119`).
- `TauCeti.HopfAlgebra.Point.jordanDecomposition_mapValue` (`Representation/JordanDecomposition/ScalarExtension.lean:63`), `jordanDecomposition_mul_of_commute` (`…/Commuting.lean:142`).
- `TauCeti.Comodule.isClosedImmersion_coordinateGroupSchemeHom_iff` (`Representation/Embedding.lean:173`: `CommRing k`, one universe, as the README says), `fgPointRepresentationCategoryEquivalence` (`Comodule/Equivalence.lean:231`).
- `TauCeti.CommHopfAlgCat.IsIsogeny` (`Isogeny/Basic.lean:72`), `fppfHomogeneousQuotientHomEquiv` (`Fppf/Quotient/Homogeneous/Basic.lean:281`), `finiteType_coinvariants_of_isLinearlyReductive` (`HopfIdeal/Coinvariants/InvariantTheory.lean:62`).
- The toral closure: `kostantToralDefiningIdeal` (`ToralClosure/Basic.lean:79`), `kostantToralPointsSubgroup`, `kostantToralRootSubgroupPoints`, `kostantToralWeightTorusPoints`, `…_conj_rootSubgroupPoints`, `kostantToralSchemePointMulEquiv` (`ToralClosure/Points.lean:90, 161, 184, 241, 311`), `isTorsionFree_kostantToralCoordinateHopfAlgebra` (`ToralClosure/Flat.lean:53`).
- The sign cover: `Matrix.SignCover.inv_canonicalSection` (`OrderedSignCover.lean:211`), `forall_canonicalSection_signFactorSet_mul_iff_of_isSimplyLaced` (`OrderedSignCover/SimplyLaced.lean:44`), `negOnePow_orderedSignForm_mul_inversionSign_add` (`OrderedSignCover/Reindex.lean:183`), `SignCover.orderOf_reindex` (`OrderedSignCover/Order.lean:93`), `add_mem_normTwoShell_iff` (`NormTwoShell/Basic.lean:145`).
- `TauCeti.exists_isCompl_of_isKilling` (`Algebra/Lie/HighestWeight/CompleteReducibility.lean:259`), `DifferentiableOn.analyticOnNhd_of_finiteDimensional` (`Analysis/Complex/CauchyIntegralPolydisc.lean:351`), `TauCeti.SpecialLinear.not_isAtom_binaryForms_mul_char` (`BinaryForm/Frobenius.lean:125`), `isAtom_binaryForms_of_charZero` (`BinaryForm/Basic.lean:710`).
- Mathlib: `AlgebraicGeometry.Smooth.exists_isStandardSmooth` (`AlgebraicGeometry/Morphisms/Smooth.lean:94`), `smoothSheafCommRing.evalHom`, `.eval` (`Geometry/Manifold/Sheaf/Smooth.lean:345, 353`), `smoothSheafCommRing.isUnit_stalk_iff` (`…/Sheaf/LocallyRingedSpace.lean:59`), `IsNilpotent.exp_add_of_commute` (`RingTheory/Nilpotent/Exp.lean:77`), `RootPairing.restrictScalarsRat` (`LinearAlgebra/RootSystem/BaseChange.lean:132`). §3A.2's "universal openness of schemes over a field" is the instance `[IsIntegral Y] [Subsingleton Y] : UniversallyOpen f` (`AlgebraicGeometry/Morphisms/UniversallyOpen.lean:146`), which needs no finite presentation, so it applies to `Spec k̄ → Spec k`.

### Seeded sample and locators

- **1.1** (`jantzen-1985`, printed page = PDF page − 5): §2.8, the comodule equivalence, p. 38 (lines 1128–1136); §2.10 on p. 41 (from line 1206); §3.3 from p. 52 (line 1484); §3.9, injective modules, p. 60 (line 1688); §4.2 on pp. 69–70 (lines 1910–1936); §§4.14–4.16 on pp. 77–79 (lines 2093–2137). The statement keeps the source's flatness hypothesis on the Hopf algebra and places none on the module.
- **8.1** (`conrad-rgs`): Definition 5.1.1, p. 136 (lines 5651–5659): a maximal torus `T ≃ D_S(M)`, roots and coroots constant sections, root spaces free of rank one, over a nonempty scheme; the README states these three conditions. Example 5.1.2 (line 5669) is the disconnected-base example behind "even on disconnected bases".
- **8.2** (`conrad-rgs`): Definition 6.1.1, p. 186 (lines 7725–7730), and Remark 6.1.2, pp. 186–187 (from line 7738): a positive system and trivializing sections of the simple root spaces; the Borel of a positive system is unique, and on a disconnected base not every Borel containing `T` arises. Theorems 6.1.16 and 6.1.17, pp. 196–197 (lines 8159, 8173), over a nonempty scheme, with uniqueness up to `(T/Z_G)(S)`.
- **Milne 2017** (author-page copy in the cache, printed page = PDF page − 12): all 54 page locators that this head adds or keeps in changed passages agree with the text: 1.37 p. 18; 1.65 p. 26; 1.66 p. 27; 2.37 p. 51; 2.38 p. 52; 3.6 p. 66; 3.7, 3.10, 3.12 p. 67; 3.15 p. 68; 4.9 p. 87; 5.13 p. 101; 5.65, 5.68 p. 116; 6.42 p. 134; 6.46 p. 135; 6.47, 6.48 p. 136; 9.11 p. 168; 9.19–9.21 p. 171; 12.3 p. 231; 12.14, 12.17 p. 236; 12.25 p. 240; 12.54 p. 248; 12.56 p. 249; 14.7, 14.9 p. 282; 14.12 p. 283; 14.18 p. 284; 14.31 p. 288; 14.32 p. 289; 16.30 p. 334; 17.96–17.98 p. 383; 19.1 p. 397; 19.2, 19.5 p. 398; 19.9 p. 399; 19.10, 19.13 p. 400; 21.12 p. 430; 21.17, 21.18 p. 431; 21.32 p. 434; 21.80 p. 450; 22.21 p. 468; 22.27, 22.29 p. 470; 23.25 p. 492; 23.55 p. 501; C.22 p. 612; C.53 p. 624. Statements read: 1.65(b) (image of an equivariant map from a homogeneous space is locally closed, line 1467), 1.66 with its proof (line 1504), 12.25 (line 9974), 14.9, 14.12, 14.18 (lines 11755–11820), 16.30 (line 13741), 17.96–17.97 (lines 15752–15769: the source's map is `g ↦ g F(g⁻¹)`, as the new docstring sentence says), 21.32 (line 17912), the footnote to 12.54 (line 10309).

### Cross-roadmap and overlap checks

- The worker's citation list reports no cross-roadmap citation found nowhere; its 18 Lean names are this file's own declarations and `VanishingCycles.lisseMonodromyEquiv`, which EtaleCohomologyFoundations declares on main.
- Resolved on main: SchemeAndStackFoundations §0.9 (`README.md:1026`) and §1.16 (`:2693`); ModularCurves §0B (`:688`) and §0E (`:839`); AlgebraicTopology Stages 1 and 4 (`:289`, `:499`); ReflectionInvariantTheory §§1 and 3 (`:7`, `:40`); CFSGStatement's *From TauCetiRoadmap.ReductiveGroups* (`:162`) and Layer 1.1 (`:197`); LieGroups Layer 7's two named bullets (`RepresentationTheory/LieGroups/README.md:1013`, `:1031`); GeometricTopology's contract (`:725–733`) names §11A as owner of the plane and disc configuration spaces and Layer 4.2.8 as consumer, in agreement with the new scope sentence.
- Open heads: GroupSchemesOverABase and FlagVarieties (read through `roadmaps show`) cite ReductiveGroups Layers 3, 7, 8.1–8.2, 9B and 9D as owner and state none of its targets.
- `scratch/overlaps.md`: no dropped id, no revision-only id. The conflicting heads #1807, #1808 and #1854 are ordered after this pull request in the description's merge-order block.

### Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 invariants | weight-one line of `𝔾_m`; `μ_p` over `𝔽_p`; trivial group on `ℤ/2` | universal point gives `1⊗t ≠ 1⊗1`, invariants 0; every `𝔽̄_p`-point acts by 1 yet `t ≠ 1` in `𝔽_p[t]/(t^p−1)`; invariants `ℤ/2` | holds | none |
| 1.1 Hochschild complex | `ℤ[t,t⁻¹]`, weight one; trivial group | `d⁰(1)=1⊗(t−1)`; `d¹`: `t⊗(t−1)−(t⊗t−1⊗1)+(t−1)⊗1=0`; differentials `0, id, 0` | holds | none |
| 1.1 induction | `1⊂C₂` over `ℤ`; `C₂⊂S₃`; `q=id`, weight one; unit map `ℤ→ℤ[t,t⁻¹]` | rank 2; rank 3; `F(t)=t ↦ f(t)=t⁻¹`, both 1 at the identity; weight-one line gives 0, trivial line `ℤ` | holds | none |
| 8.1 split data | `SL₂` against `PGL₂`; `SL₂` over `𝔽₂`; `GL(R⊕L)`, `L` not free; rank 0 | root `2ϖ` against a generator of `X`; dimension 3, centre of length 2; root spaces `L`, `L∨` not free (excluded); `X=Y=0` | holds | none |
| 8.2 pinnings | `x_α(t)`, `x_α(2t)` over `ℚ`; the same over `𝔽₂`; `Spec(k×k)` with `B⁺`, `B⁻` | tangents `E₁₂`, `2E₁₂`; `2E₁₂=0`, not a generator; signs `(+,−)`, no constant positive system | holds | R03 (citation) |
| §3A.2 orbits (R01) | `μ₃` on `𝔸¹_ℝ` at 1; `𝔾_m` on `𝔸¹` at 1, 0; constant `ℤ` on `𝔸¹_ℚ` | `t³−1=(t−1)(t²+t+1)`, closed two-point orbit; `D(t)` open, `{0}` closed; integers dense, not open (excluded by quasi-compactness) | holds | R01 |
| §3A.6 formula (R02) | `n=1,d=1`; `d=0`; `n=0` | rank 2 = 2; `A`; `A` | holds | R02 (form) |
| `isIso_coinvariantsQuotient_of_isNormal` | `μ_p⊂μ_(p²)`, char `p`; `N=1`; `N=G`; `αₚ×αₚ` | coinvariants `k[t^p]`, rank `p²` over rank `p`; all of `O(G)`; `k`; `k[y]/(y^p)` | holds | none |
| `linearlyReductive_iff_reductive_identityComponent` | `ℤ/2`; `𝔾_a`; `O₂`; `ℤ/p` in char `p` | T↔T; F↔F; T↔T; excluded by `CharZero` (F against T) | holds | none |
| `linearlyReductive_iff_torus` | `𝔾_m`; `SL₂`, char 2; `μ_p`; `ℤ/ℓ`; norm-one torus of `𝔽_(p²)/𝔽_p` | T↔T; F↔F; excluded (not smooth; T against F); excluded (`ℓ` components); T↔T, nonsplit | holds | none |
| `exists_levi_complement` | `𝔾_a⋊𝔾_m`; reductive `G`; `𝔾_a` | `J=(x)`, complements `{(a(1−t),t)}`; `J=0`; augmentation ideal, `k→k`; `J=0` fails (`k→k[x]`) | holds | none |
| `exists_conjugate_eq_of_isMaximalTorus` | diagonal torus of `SL₂` and its conjugate; `SL₂` over `ℝ`; `𝔾_a` | `g=I+E₁₂`; excluded (real against non-real eigenvalues); trivial torus, `g=1` | holds | none |
| `exists_titsSystem_of_isBorel` | `GL₂(𝔽₂)`; `𝔾_m`; `T⊄B` | `|B|=2`, `|N|=2`, `2+4=6`; `B=N=G`, `W=1`; excluded by `hTB` | holds | none |
| `exists_levi_complement_of_isParabolic` | upper Borel of `GL₂`; `P=G` | conjugating `diag(s,t)` by `I+aE₁₂` gives upper entry `a(t−s)`, `J=(b)`; `J=0` | holds | none |
| `lang_surjective` | `𝔾_m/𝔽₃`; `𝔾_a/𝔽₂`; `C₂`; `K=k` | `g⁻¹g³=g²`, `i↦−1`; `a²−a=c` solvable; constant 1 (excluded); `x^q−x=0` (excluded) | holds | none |
| `plane_braid` | `n=0,1,2` | trivial; trivial; `(z₁−z₂)²=e^(2πit)`, generator of `ℤ` | holds | none |
| `nonempty_mulEquiv_artinGroup` | `A₁` on `ℂ`; no roots; `A₁×A₁`; `A₁` with a central `ℂ` | `ℂˣ/±1`, `ℤ`; trivial; `ℤ²`; `ℤ`, not `ℤ²` | holds | none |
| New Checks, recomputed | `U₃`; A₂ sign cover; `S₃` idempotents; `W_L\S₃/W_M`; `SL₂→PGL₂` on distributions; `SL₂` at `t=H`; `SL₂(𝔽₂)` charts | `(1,3)` entries 1 and 1/2; `ε(α₁,α₂)=1`, `ε(α₂,α₁)=−1`, Jacobi terms `0, −x, x`; `cos²(π/3)=1/4`, `(−1/2)²=1/4`; sizes 4 and 2; `binom(2H′,2)=4binom(H′,2)+H′`; coefficients `−2, 2, 1`, determinant `−4`; `4+4−2=6` | holds | none |

## Not verifiable

- **Milne edition.** The manifest key `milne-iag` records the 2015 notes; the README's locators use the 2017 numbering and were checked against the author-page 2017 copy in the cache. The manifest is outside this folder.
- **Uncertified and unread texts.** `waterhouse`, `borel`, `springer`, `kohls`, `humphreys`, `howlett-lehrer` and `serre-linear-reps` are settled as uncertified, so the chapter and section locators the head adds for Waterhouse, Borel, Springer and Humphreys §26 were not read. Ernst's Theorem 6.10 and Fang–Lim–Tan §2.1 are in the cache but were not opened this round; neither is the only locator of a headline.
- **Merge-order block.** The generated block still lists "#1676 (ReductiveGroups) → this pull request"; #1676 is on main (`b06dcdf3`). The block is generated, and the order against the three conflicting open heads is stated.
- **Other open heads.** InverseGaloisAndArithmeticFundamentalGroups has no checkout in this job; the new *Downstream consumers* sentence about its IG.5.1 was not checked against its head.

## Source issues

- **Error** in milne-iag at Remark 12.56, p. 249: the source says a group in characteristic p is linearly reductive iff its identity component is a torus and p does not divide the index; it should be "identity component of multiplicative type" (μₚ is connected and linearly reductive); affects nothing.
