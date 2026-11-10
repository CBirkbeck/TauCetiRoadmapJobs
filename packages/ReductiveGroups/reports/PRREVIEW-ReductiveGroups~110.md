# Review of ReductiveGroups (pull request #1332 at 9ca8df8)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/ReductiveGroups/README.md` (4986 lines) and `TauCetiRoadmap/ReductiveGroups/Suggested.lean` (488 lines: 34 declarations, 14 `sorry`'d theorems) at `9ca8df8`.

The head merges main, and that moves the pins of the branch's `lake-manifest.json` from Tau Ceti `a91d3aaf` to Tau Ceti `2fd255d9` (Mathlib `1b1ccf4b`). The README and `Suggested.lean` were written against the old pin and their text did not change in the merge. All four findings come from that: at `2fd255d9` the library proves four of the fourteen headlines, has the orbit and point-topology carriers the file defines for itself, and has the carriers that the module docstring says two further headlines lack.

The gate, the dependency check and the build pass. The seeded sample verifies against the texts. The three findings of the previous review (at `9d43baa`) are repaired in this folder.

## R01 (P2) — The §6B affine-quotient headline is statable at the pin, and its connected case is proved there; the docstring says it is not statable

**Location.** `Suggested.lean:54–58`: "Affineness of quotients … (§6B) lacks the comparison of the pinned fppf homogeneous quotient with the spectrum of the right invariants: the pinned representation … is for normal subgroups only." Also `README.md:1773–1834`, which plans the whole of §6B as open.

**Claim.** The pin has no map from the fppf quotient by a nonnormal closed subgroup to the spectrum of the right invariants, so the §6B headline cannot be stated.

**Witness.** At `2fd255d9`, `TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/Coinvariants.lean`:
- `:111` `TauCeti.HopfIdeal.fppfHomogeneousQuotientToCoinvariantsPoints`, for any Hopf ideal;
- `:219` `isIso_…_of_isLinearlyReductive` (geometrically reduced `G`, linearly reductive `N`, any field);
- `:255` `isIso_…_of_reductive` (characteristic zero, reductive `N`).

**Repair.**
1. Cite these three declarations in `### From Tau Ceti: fppf quotients`, and delete from §6B what they prove: the comparison map, and the isomorphism for a connected reductive subgroup.
2. Keep as §6B's targets what the pin does not have: the subgroup with reductive identity component that is not connected, the torsor comparison, base change to an arbitrary `k`-scheme, and the Reynolds projection through `H/H⁰`.
3. State the headline in `Suggested.lean` and remove the docstring sentence. This statement elaborates at the pin (scratch probe):

```lean
theorem affine_quotient {k : Type u} [Field k] [IsAlgClosed k] [CharZero k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k) (I : TauCeti.HopfIdeal k H.obj)
    (hred : TauCeti.reductiveCommHopfAlgProperty k
      (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I.identityComponent)) :
    IsIso (I.fppfHomogeneousQuotientToCoinvariantsPoints (H := H.obj)) := by sorry
```

`TauCeti.HopfIdeal.identityComponent` is in `TauCeti/Algebra/AlgebraicGroup/HopfIdeal/IdentityComponent.lean:49`.

**Tested.**
- `A=𝔾ₘ`, `H=μ₂`: `H⁰=1` is reductive, the invariants are `k[t²,t⁻²]`, and `t↦t²` identifies `𝔾ₘ/μ₂` with their spectrum, as §6B's Check says.
- The upper Borel of `SL₂`: `B⁰=B` is not reductive, so the hypothesis fails; the quotient `ℙ¹` is not affine.
- With `I.identityComponent` replaced by `I`, the statement is closed by `isIso_…_of_reductive I hred` (scratch probe), so only the disconnected case is new.

## R02 (P2) — The §7.2 Levi complement of a parabolic subgroup is statable at the pin; the docstring says the parabolic predicate is missing

**Location.** `Suggested.lean:66–68`: "The existence of Levi complements of parabolic `k`-subgroups of §7.2 lacks a parabolic predicate on Hopf ideals of a given group: the pinned dynamic parabolic of a cocharacter is a subgroup functor of points whose representability is not addressed." Also `README.md:261–264`: "Their documentation does not establish representability of arbitrary dynamic subfunctors".

**Claim.** The pin has no parabolic predicate on Hopf ideals, and its dynamic parabolics are not represented.

**Witness.** At `2fd255d9`:
- `TauCeti.HopfIdeal.IsParabolic` (`TauCeti/Algebra/AlgebraicGroup/Parabolic/Basic.lean:248`): smooth, and containing a Borel subgroup after base change to an algebraic closure;
- `parabolicDefiningHopfIdeal` (`Dynamic/Representability.lean:98`), `leviDefiningHopfIdeal` (`Dynamic/Levi/Representability.lean:47`), `parabolicCoordinateAlgEquiv` (`Dynamic/LeviDecomposition/Coordinate.lean:174`) and `parabolicLeviFppfQuotientIso` (`Dynamic/Levi/Quotient.lean:177`).

**Repair.**
1. Rewrite the Tau Ceti contract (`README.md:261–264`) to cite these declarations with their files.
2. In §7.2, cite `IsParabolic` as the predicate. The README defines a parabolic subgroup by properness of `G/P`; keep the equivalence of that with the native predicate as a target.
3. Delete from §7.2 the comparison items that the dynamic declarations already prove.
4. State the headline, in the same Hopf-coordinate form as `LeviComplements.exists_levi_complement`, and remove the docstring sentence. This elaborates at the pin (scratch probe):

```lean
theorem exists_parabolic_levi {k : Type u} [Field k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k)
    (hH : TauCeti.reductiveCommHopfAlgProperty k H)
    (I : TauCeti.HopfIdeal k H.obj) (hI : TauCeti.HopfIdeal.IsParabolic k H.obj I) :
    ∃ J : TauCeti.HopfIdeal k (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I),
      Function.Bijective
        ((Ideal.Quotient.mkₐ k J.toIdeal).comp
          (TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadicalDefiningIdeal
            (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I)).coinvariants.val) := by sorry
```

**Tested.**
- `GL₂` with `P` the upper Borel: the `k`-unipotent radical is `U={I+aE₁₂}`, its coinvariants are `O(T)`, and `J=(b)` (the ideal of `T` in `O(P)`) makes `O(T)→O(P)/J=O(T)` the identity.
- `P=G` (`I=⊥`, parabolic exactly when `G` is smooth): the radical is trivial, the coinvariants are all of `O(G)`, and `J=0` works.
- Over an imperfect field the `k`-unipotent radical of `P` is `U_G(λ)` and descends the geometric one (conrad-feng lines 2397–2401, p. 58), so `unipotentRadicalDefiningIdeal` is the right ideal.

## R03 (P3) — Four theorems of `Suggested.lean` are proved at the pin

**Location.** `Suggested.lean:147`, `:159`, `:206`, `:273`; `Suggested.lean:33–37` ("The pinned Tau Ceti proves conjugacy of Borel subgroups only under a hypothesis"); `README.md:246–250` ("so the unconditional statement is a target of §7.1"); `README.md:1856–1859`; §§3A.3–3A.4 (`README.md:954–979`).

**Claim.** These four are open headlines.

**Witness.** In a scratch copy at `2fd255d9`, each closes with `exact` on one native theorem:

| Declaration | Native theorem at the pin | Proof in the probe |
|---|---|---|
| `AlgebraicOrbits.boundary_dimension_lt` | `TauCeti.SchemeAction.topologicalKrullDim_orbitBoundary_lt` (`AlgebraicGeometry/GroupAction/LocallyClosed.lean:213`) | two `CompactSpace` instances from `QuasiCompact.compactSpace_of_compactSpace`, then `exact … G x` |
| `AlgebraicOrbits.exists_closed_orbit_in_closure` | `TauCeti.SchemeAction.exists_isClosed_orbit_subset_orbitClosure` (`GroupAction/ClosedOrbit.lean:150`) | the same instances, then `exact … G x` |
| `reductive_iff_linearlyReductive` | `TauCeti.reductiveCommHopfAlgProperty_iff_linearlyReductive` (`Algebra/AlgebraicGroup/Reductive/CompleteReducibility.lean:118`) | `exact … H hconnected` |
| `BorelTori.exists_conjugate_eq_of_isBorelOverAlgClosed` | `TauCeti.HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq` (`Borel/Conjugacy/Existence.lean:133`) | `have := hI.1; exact hI.exists_conjugate_eq hJ` |

The native theorems are stronger: the two orbit theorems assume neither smoothness of `G` nor separatedness of `X`, and the characteristic-zero equivalence does not assume smoothness (Cartier).

**Repair.**
1. Delete the four theorems from `Suggested.lean`, with the docstring paragraph at lines 33–37 and their mentions at lines 19–26.
2. In the README, cite the four native theorems in `### From Tau Ceti` with the files above.
3. Reduce §§3A.3–3A.4, the characteristic-zero equivalence of §6.2 and the Borel half of §7.1 to those citations. Rewrite `README.md:246–250` and `:1856–1859` to say the pin proves Borel conjugacy unconditionally.

The other ten theorems stay. `orbit_locallyClosed` is over any field, and the native `isLocallyClosed_orbit` (`LocallyClosed.lean:177`) needs `IsAlgClosed k`. The native torus conjugacy (`Torus/Conjugation.lean:149`) still has its two containment hypotheses. The native Nagata statement is for solvable groups only (`Solvable/LinearlyReductive.lean:86`).

**Tested.** The probe file elaborates with those four proofs and no error. With the generic one-tactic probe (`rfl`, `trivial`, `infer_instance`, `decide`, `simp`, `aesop`) all 14 theorems keep their `sorry`, so the four close only through the named theorems.

## R04 (P3) — `Suggested.lean` and §§3A.4a, 3A.5 define carriers that the pin has

**Location.** `Suggested.lean:113–129` (`orbitMorphism`, `geometricOrbit`, `orbitClosure`, `orbitBoundary`, `orbitDimension`) and `:175–191` (`affinePointEval`, `classicalPointSubbasis`, `classicalPointTopology`); `README.md:1000–1048` and `:1074–1077`; `README.md:20–21` ("Section 3A.5 owns the classical topology on complex scheme points").

**Claim.** These definitions are needed to state the headlines.

**Witness.** At `2fd255d9`:
- `geometricOrbit G X x = TauCeti.SchemeAction.orbit G x`, `orbitBoundary G X x = TauCeti.SchemeAction.orbitBoundary G x` and `orbitMorphism G X x = TauCeti.orbitMap G x` all hold by `rfl` (scratch probe). The native definitions are in `TauCeti/AlgebraicGeometry/GroupAction/Orbit/Basic.lean:49–65` and `TauCeti/CategoryTheory/Monoidal/Cartesian/Action.lean:41`.
- `TauCeti.SchemePointTopology.topology` (`TauCeti/Topology/Algebra/PointTopology/Scheme.lean:127`) is the final topology of the affine open charts on the `R`-points of any scheme over `Spec k`, for a topological `k`-algebra `R`.

**Repair.**
1. Delete the five orbit definitions and state the remaining orbit headline on the native orbit. This elaborates (scratch probe):

```lean
theorem orbit_locallyClosed {k : Type u} [Field k] (G X : Over (Spec (CommRingCat.of k)))
    [GrpObj G] [ModObj G X] [LocallyOfFiniteType G.hom] [QuasiCompact G.hom]
    [LocallyOfFiniteType X.hom] [QuasiCompact X.hom]
    (x : 𝟙_ (Over (Spec (CommRingCat.of k))) ⟶ X) :
    IsLocallyClosed (TauCeti.SchemeAction.orbit G x) := by sorry
```

2. Delete the three point-topology definitions and state compactness on the native topology. This elaborates (scratch probe):

```lean
theorem compact_complexPoints (X : Over (Spec (CommRingCat.of ℂ))) [IsProper X.hom] :
    @CompactSpace (TauCeti.SchemePointTopology.Points (R := ℂ) X.hom)
      (TauCeti.SchemePointTopology.topology X.hom) := by sorry
```

3. In the README, replace the "Define …" paragraphs of §3A.4a and §3A.5 by citations of the native definitions. Change the scope sentence at lines 20–21: Tau Ceti owns the chart topology on scheme points, and §3A.5 owns its smooth-chart and properness comparisons over `ℂ`. Keep the Checks as Checks on the native objects.

**Tested.** Both statements elaborate at the pin. For `ℙ¹` the two charts `ℂ` glue to the sphere, which is compact; for `𝔸¹` (`IsProper` fails) the points are `ℂ`, not compact; for `Spec ℂ[ε]/(ε²)` there is one point. `μ₃` on `𝔸¹` over `ℝ` at `x=1` has the closed two-point native orbit `{(t−1),(t²+t+1)}`.

## Previous findings (review of `9d43baa`)

| Previous | Status at `9ca8df8` | Evidence |
|---|---|---|
| R01 (P2), two owners of the plane configuration spaces | Repaired in this folder | `README.md:31–40` states that §11A owns them and names IG.5.1 as a consumer; `README.md:4440–4442` repeats it. The other half is a change on the open InverseGaloisAndArithmeticFundamentalGroups; see *Not verifiable*. |
| R02 (P2), cycle with LieGroups | Repaired | §11D proves simple connectedness of `G(ℂ)/B(ℂ)` in the roadmap (`README.md:4705–4723`); §6A says LieGroups Layer 7 applies its output and is not consumed (`README.md:1764–1767`); §11G names §7C.5 and the native two-set criterion (`README.md:4830–4832`). The three remaining mentions of LieGroups (lines 1203, 1765–1766) describe it as a consumer. |
| R03 (P3), six supplier contracts missing | Repaired | `README.md:448–509`: LieHighestWeight, ReflectionInvariantTheory, AlgebraicTopology, DGFloer, GroebnerGeometry, InductionRestriction. |

## Verified sound

### Gate, dependency check, build, signatures

- **Gate** (my run): `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate at this head adds `build=0`.
- **Dependency check:** `depcheck: 234 roadmaps, 2266 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ReductiveGroups'` is empty.
- **Build:** `lake env lean TauCetiRoadmap/ReductiveGroups/Suggested.lean` exits 0 at the new pin and prints exactly 14 `declaration uses 'sorry'` warnings (lines 138, 147, 159, 194, 206, 221, 245, 273, 289, 310, 404, 435, 442, 479).
- **`#check @` pass on all 34 declarations** (scratch copy, no error). Each elaborated type equals its README statement and none lost a binder. The worker's `signatures.md` failed on 20 names; this pass replaces it.
  - `orbit_locallyClosed` has only the two finite-type and two quasi-compactness instances.
  - The two §3A.3–3A.4 theorems have `IsAlgClosed k`, `Smooth G.hom`, `QuasiCompact G.hom`, finite type and `IsSeparated` on `X`.
  - `lang_surjective` has `Finite k`, `IsAlgClosed K` and `hF : ∀ a, F a = a ^ Nat.card k`.
  - `nonempty_mulEquiv_artinGroup` has `Finite Λ`, `IsModuleTopology ℂ M`, `FiniteDimensional ℂ M`, `IsCrystallographic` and `IsReduced`.

### Headlines

The README and the module docstring name the three orbit theorems, compactness of proper complex points, the characteristic-zero equivalence, Nagata, the Mostow Levi complement, Borel and torus conjugacy, Lang, integral PBW, Artin, braid nonsplitting and Brieskorn. All 14 are stated. Four are proved at the pin (R03); two listed as not statable are statable (R01, R02). For the remaining unstated endpoints I checked the docstring's reason at the pin:
- `TauCeti.CommHopfAlgCat.centerDefiningIdeal` (`Center/Basic.lean:302`) is over a field;
- `TauCeti.Pinning` (`Pinning/Basic.lean:88`) exists, and no root pairing is attached to an arbitrary split group;
- no configuration-space, hyperplane-complement, distribution-algebra or rational highest-weight carrier exists (`grep` over the pinned Tau Ceti);
- the integral PBW basis is not proved: `Kostant/Basis.lean` gives only the rational span statement `span_kostantForm_eq_top`;
- no Lang theorem for group schemes exists; `GroupTheory/FixedSubgroup/Lang.lean` is about abstract commutative groups.

### Seeded sample (all verified in the texts)

Milne 2017 is read in the author-page `iAG2017` copy in the sources cache (printed page = PDF page − 12).
- **1.0a, 1.0b:** Remark 4.1, p. 84 (line 3765); Theorem 4.9, p. 87 (line 3906).
- **1.1:** `jantzen-1985` I.3.3, p. 52 (line 1507); I.3.9, p. 60 (line 1688); I.4.14–I.4.16, pp. 77–79 (lines 2102–2155). Printed page = PDF page − 5.
- **2.1:** 10.14, p. 190 (line 7961); 10.23, p. 193 (line 8076); 10.28–10.29, p. 195 (lines 8143, 8160).
- **3.1:** Theorem 5.13, p. 101 (line 4421: a homomorphism killing the kernel factors uniquely through the quotient map); Proposition 5.18, p. 103 (line 4492: a normal subgroup of an affine group is the kernel of a quotient map with affine target).
- **4.1:** Theorems 9.11 and 9.18, pp. 168, 170 (lines 7065, 7194), over a perfect field.
- **4.2:** Proposition 12.3, p. 231 (line 9630); Remark 12.5, p. 232 (lines 9654–9657: smooth exactly when `M` has no `p`-torsion; smooth and connected exactly when `M` is free); Theorems 12.8–12.9, p. 233; Definition 12.14, p. 236.
- **4.3:** Definition 12.17, p. 236; Theorem 12.23 and Corollary 12.25, p. 240.
- **5.1:** 14.3 (p. 280), 14.5 (p. 281), 14.12 (p. 283), 16.30 (p. 334).
- **5.2:** Corollary 14.8, p. 282 (line 11750); Proposition 6.42, p. 134; 6.46, p. 135; Proposition 19.9, p. 399 (line 16386); Proposition 19.11, p. 400 (perfect field).
- **6.1:** 19.1 (p. 397), 19.2 and 19.5 (p. 398), 19.10 and 19.13 (p. 400).
- **7.1:** Corollary 17.3 and Definition 17.6, p. 353; Theorems 17.9–17.10, p. 354; Corollary 1.39, p. 18; Theorem 21.32, p. 434.
- **7.2:** `conrad-feng` lines 2397–2401, p. 58 (`P=Z_G(λ)⋉U_G(λ)`, and `Z_G(λ)` is a Levi `k`-subgroup); Proposition 12.3.1, p. 127 (line 5345: `U(k)` is simply transitive on Levi factors, and every maximal `k`-torus lies in a unique one).
- **7.3:** Corollary 21.12, p. 430 (line 17715); 21.17–21.18, p. 431; Proposition 21.75, p. 448 (Tits system for a split reductive group); Theorem 21.80, p. 450 (line 18538).
- **11.0:** `sga1` XII Théorème et définition 1.1, p. 239 (line 9399).
- Headline locators: 1.65, p. 26 (line 1461); 1.66, p. 27 (line 1504); 12.56, p. 249 (line 10330); 22.42, p. 477 (line 19713); 17.96–17.97, p. 383 (lines 15752, 15767).

### Library declarations opened at the pins

- Mathlib `Set.Countable.isPathConnected_compl_of_one_lt_rank` (`Analysis/Normed/Module/Connected.lean:45`); `QuasiCompact.compactSpace_of_compactSpace` (`AlgebraicGeometry/Morphisms/QuasiCompact.lean:148`).
- Tau Ceti:
  - `simplyConnectedSpace_of_interior_union` (`AlgebraicTopology/FundamentalGroup/VanKampen/Basic.lean:482`) and `isPushout_fundamentalGroup` (`:349`);
  - `TopCat.mem_serreFibrations_proj` (`Topology/Homotopy/SerreFibration/FiberBundle.lean:395`);
  - `IntegralLattice.integralForm` (`IntegralLattice/Basic.lean:167`); `rationalizationIsometry`, `ofIntegralForm` and `ofIntegralForm.carrierIsometry` (`IntegralLattice/Rationalization.lean:91, 118, 187`);
  - `reductiveCommHopfAlgProperty` (`Reductive/Basic.lean:71`: smooth, geometrically connected, no nontrivial connected normal smooth unipotent subgroup of the geometric fibre);
  - `unipotentRadicalDefiningIdeal` (`Unipotent/Radical/Construction.lean:69`: the `k`-unipotent radical);
  - the declarations named in R01–R04.
- The worker's 24 "found nowhere" Lean names are this file's own declarations, plus the InductionRestriction target `Gassmann.almostConjugate_iff_permutation_equiv`.

### Cross-roadmap citations resolved

- On main: GeometricTopology Layer 4.2.8 (line 2093, and its contract on §11A at 731); DGFloer Layer 1 item 2 (line 470) with *All-CW testing and based fibration sequence* (503); GroebnerGeometry G5 (394); ReflectionInvariantTheory and AlgebraicTopology READMEs exist with the cited sections.
- The pull request's merge-order block orders this pull request against #1676, #1807, #1808 and #1854, the four conflicting heads of `scratch/overlaps.md`. `overlaps.md` lists no dropped or revision-only id.

### §11D repair, checked

- `n_w n₀⁻¹·U⁺n₀B = n_w U⁻B`, since `n₀⁻¹U⁺n₀=U⁻`.
- `J_w n_w B = n_w (n_w⁻¹J_w n_w)B ⊆ n_w U⁻B`, since `J_w=U⁺∩n_wU⁻n_w⁻¹`; so the translates `Ω_w` cover `G/B` by Bruhat.
- A line through two points of a nonempty Zariski open `V⊆𝔸^N` meets the complement in a proper closed subset of `𝔸¹`, a finite set, and `ℂ` minus a finite set is path connected.
- `SL₂`: `U⁻·[1:0]={[1:c]}` and `n_s[1:c]=[−c:1]`; the overlap is `c≠0`.

### Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.0a comodules | `𝔾ₘ` weight 3 at `a=2`; weights 1 and 2 | 8; `2·4=8` | holds | none |
| 1.0b Tannakian | point `t↦2` on weight 3; unit object | acts by 8; by 1 | holds | none |
| 1.1 Hochschild complex | `H=A`, `M=A`; `𝔾ₘ` weight one | face counts 2, 3, 4 give `d=0, id, 0`, so `H⁰=A`, `H¹=H²=0`; `d⁰(1)=1⊗(t−1)` | holds | none |
| 1.1 induction | trivial subgroup of `C₂` over `ℤ`; `f=id` | `ℤ⊗ℤ²=ℤ²`; equalizer `≅M` by the counit | holds | none |
| 2.1 Lie | `SL₂`; Frobenius on `𝔾ₘ` in char `p` | `[E₁₂,E₂₁]=diag(1,−1)`; `d(tᵖ)=0` | holds | none |
| 3.1 quotients | `(t−2)` in `ℚ[t,t⁻¹]`; `μ₂` in char 2; `αₚ×αₚ/αₚ`; `S₃` | `ε(t−2)=−1≠0`; `t²−1=(t−1)²`; coinvariants `k[y]/(yᵖ)`; `(123)(12)(123)⁻¹=(23)` | holds | none |
| 4.1 Jordan | `[[2,1],[0,2]]` over `ℚ`; `I+E₁₂` in char 2 | `g_s=2I`, `g_u=[[1,1/2],[0,1]]`; `g²=I`, `g_s=I` | holds | none |
| 4.2 diagonalizable | character 3 on cocharacter −2; `M=ℤ/p` in char `p`; `×2` on `ℤ` | `t↦t⁻⁶`; `k[u]/(uᵖ)`, not smooth; kernel `μ₂` | holds | none |
| 4.3 lattices | `𝔾ₘ`; real norm-one torus; `μₚ` | `⟨3,−2⟩=−6`; `X^Γ=0` with rank 1; `X=ℤ/p`, `X_*=0` | holds | none |
| 5.1 unipotence | `𝔾ₐ→U₂`; `𝔾ₘ` | `(tE₁₂)²=0`; invariants 0 | holds | none |
| 5.2 radical | `𝔾ₐ`; `𝔾ₘ`; `Res_(K/k)𝔾ₘ`, `[K:k]=p` purely inseparable | ideal 0; ideal `(t−1)`; `dim R_(u,k)=0`, geometric `p−1` (1 at `p=2`) | holds | none |
| 6.1 radicals | `𝔾ₐ`; `𝔾ₘ`; `SL₂` in char 2 | dims `(1,1)`; `(1,0)`; centre `k[t]/((t−1)²)` | holds | none |
| 7.1 conjugacy | `GL₂` upper/lower; `SL₂` over `ℝ` | `w[[a,b],[0,d]]w⁻¹=[[d,0],[b,a]]`; real against non-real eigenvalues | holds | none |
| 7.2 Levi | `(I+aE₁₂)diag(s,t)(I−aE₁₂)`; `λ(t)=diag(t,1)`; `P=G` | upper entry `a(t−s)`; `E₁₂↦tE₁₂`, `E₂₁↦t⁻¹E₂₁`; `U=1`, `L=G` | holds | R02 |
| 7.3 roots, Bruhat | `SL₂`; `GL₂(𝔽_q)`; `𝔾ₘ` | `⟨α,α∨⟩=2`; cells 1 and `q`, 3 points at `q=2`; `Φ=∅`, `W=1` | holds | none |
| 11.0 cotangent | `𝔾ₘ`; `u=2t` | `D(t⁻¹)=−1`; `2·(1/2)=1` | holds | none |
| `orbit_locallyClosed` | `μ₃` on `𝔸¹` over `ℝ`; constant `ℤ` on `𝔸¹` over `ℚ`; trivial `αₚ` | closed two-point orbit; integers dense and not open (excluded by `QuasiCompact`); one point | holds | R04 |
| `boundary_dimension_lt` | `𝔾ₘ` on `ℙ¹`; fixed point; trivial `αₚ` on `Spec k` | `0<1`; `⊥<0`; `⊥<0` (not smooth: outside the roadmap's hypotheses, inside the native theorem's) | holds; native is stronger | R03 |
| `exists_closed_orbit_in_closure` | `SL₂` on `𝔸²` at `(1,0)`; `E` on `E` | `{0}`; `E` | holds; proved at the pin | R03 |
| `compact_complexPoints` | `ℙ¹`; `𝔸¹`; `Spec ℂ[ε]/(ε²)` | compact; excluded; one point | holds | R04 |
| `reductive_iff_linearlyReductive` | trivial group; `𝔾ₐ`; `SL₂` | T↔T; F↔F; T↔T | holds; proved at the pin without smoothness | R03 |
| `linearlyReductive_iff_torus` | `μₚ`; `ℤ/ℓ`; `SL₂` in char `p` | excluded (not smooth); excluded (`ℓ` components); F↔F | holds | none |
| `exists_levi_complement` | `𝔾ₘ⋉𝔾ₐ`; reductive `G`; `𝔾ₐ` | `J=(x)`; `J=0`; `J=(x)`, `k→k` | holds | none |
| Borel conjugacy | `GL₂`; `ℤ/2`; `SL₂` over `ℝ` | `g=w`; `g=1`; predicate false | holds; proved at the pin | R03 |
| torus conjugacy | `SL₂` over `ℝ`; `μₚ×𝔾ₘ` | excluded; unique torus | holds | none |
| `lang_surjective` | `𝔾ₘ` over `𝔽₃`; `𝔾ₐ` over `𝔽₂`; `C₂`; `K=k` | `g²=−1` has a root; `a²−a=1` in `𝔽₄`; constant 1 (excluded); `x^q−x=0` (excluded) | holds | none |
| `integral_pbw` | `m=r=0`; `A₁` | basis `{1}`; `ef=fe+h` | holds | none |
| `nonempty_mulEquiv_braidGroup` | `n=0,1,2` | point; `ℂ`; `ℤ` against the free group on one generator | holds | none |
| `permutation_extension_nonsplit` | `n=2`; `n=1` | `2a=0` forces `a=0` in `ℤ`; excluded | holds | none |
| `nonempty_mulEquiv_artinGroup` | `A₁`; `Λ=∅`; `A₁×A₁` | `ℂˣ/±1≅ℂˣ`, `ℤ`; trivial; `ℤ²` | holds | none |
| §6B candidate (R01) | `𝔾ₘ/μ₂`; `SL₂/B`; connected `H` | `k[t²,t⁻²]`, isomorphism; hypothesis fails; closed by the native theorem | holds | R01 |
| §7.2 candidate (R02) | `GL₂`, upper Borel; `P=G` | `J=(b)`; `J=0` | holds | R02 |
| §11D charts | `SL₂`; torus | overlap `ℂ*`, `π₁(ℙ¹)=1`; one chart `ℂ⁰` | holds | none |

## Not verifiable

- **Milne edition.** The manifest key `milne-iag` records the v2.00 notes (2015); the README's locators use the 2017 numbering, checked against the author-page `iAG2017` copy in the cache. The manifest is outside this folder.
- **Uncertified and unread texts.** `waterhouse`, `borel`, `springer`, `kohls`, `humphreys` and `howlett-lehrer` are settled as uncertified. `brieskorn-1971` is image-only. None is the only locator of a headline.
- **Ownership on the open side.** InverseGaloisAndArithmeticFundamentalGroups (#850, head `9432671`, read through `roadmaps show`) still states at its lines 5463–5468 that `Conf_n(𝔻)` has fundamental group `TauCeti.BraidGroup n`, with its own proof and no citation of ReductiveGroups §11A. This roadmap is on main and now says it is the owner, so the citation is a change on #850, not in this folder.
- **Description.** The author's text still says "Only README.md changed; existing Lean prototypes, helper, metadata and configuration are untouched" and names `ChevalleyModelTargets.lean`. At this head `Suggested.lean` is rewritten and the folder has no `*Targets.lean` file. Earlier rounds settled this as text outside the folder.
- **Lang with two owners.** ReductiveGroupsPartII on main still states `Lang.lang_surjective`; settled earlier as a change on that roadmap.
- **Other open heads.** GroupSchemesOverABase (#1522) and FlagVarieties (#2114) have no checkout in this brief; ownership against them was not rechecked this round.

## Source issues

- **Error** in milne-iag at Remark 12.56, p. 249: the source says a group in characteristic p is linearly reductive iff its identity component is a torus and p does not divide the index; it should be "identity component of multiplicative type" (μₚ is connected and linearly reductive); affects nothing.
