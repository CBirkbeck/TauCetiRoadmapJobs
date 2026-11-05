# GATE-McKaySkewGroup~1: answers to human review

Reviewed head `a9ef22a`. The repairs are in three commits, none pushed:
- `88c7cd49`: review repairs;
- `42584783`: `Suggested.lean` rebuilt as a headline-only acceptance test;
- `cdab583e`: order-48 conjugacy corrected.

Points are numbered in the order they appear in the comments, oldest first. H01–H11 were raised against earlier heads and were re-checked at `a9ef22a`.

`Suggested.lean` now states only the headline theorems (303 lines, previously 2942). The FKS, relative-Koszul and representation-ring carriers that several points below were about are no longer Lean declarations. The module docstring names them as not statable at the pins and gives the carrier each lacks. The corrections those points asked for are kept in README prose, at the locations cited.

## H01 (CBirkbeck) — applied

The CBH weight is the trace `Tr_{ρ_i}(z)`. In `TauCetiRoadmap/McKaySkewGroup/Suggested.lean` it is the hypothesis `hlam` of `exists_full_corner_equiv_deformedPreprojectiveAlgebra`: `lam (e (mk X)) = LinearMap.trace ℂ X (Representation.asAlgebraHom X.ρ z)`. The block scalar `f_i` is not a parameter. README Layer 5 keeps the Q₈ test: scalar weights `(1, −1)` against trace weights `(1, −2)`, through `∑ λ_i dim(e_i M) = 0`. A new Layer 5 Check states the trace invariant.

## H02 (CBirkbeck) — applied

`hdet : ∀ g, LinearMap.det (V.ρ g) = 1` is a hypothesis of `exists_isMcKayLabelling` and of all three corner theorems. It is not implied by `IsMcKayLabelling`. The README Layer 1 Check records the ordinary dihedral group of order 8: it has the same `D̃₄` labelling as `Q₈`, but `det = −1` on a reflection.

## H03 (CBirkbeck) — applied

README Layer 6 defines the stable category as graded modules over the curved extension algebra modulo maps factoring through projective graded modules (README line 769). That category is abelian, so "projective" has its usual meaning. No triangulated category is quotiented by its categorical projectives. The Lean carrier is gone: the docstring names the FKS stable category as not statable, because there are no curved modules or stable categories of graded modules at the pins.

## H04 (CBirkbeck) — applied

README Layer 3 keeps the separable-semisimple-base hypothesis on every right-dual statement, together with the counterexample `S = ℚ[t]`, `W = S ⊗_ℚ S`. That counterexample shows the right dual is uncountable while every finitely generated `S⊗Sᵐᵖᵖ`-module is countable. The Lean declaration `rightDual_finiteProjective` no longer exists, because relative quadratic duals are not at the pins (docstring).

## H05 (CBirkbeck) — applied

README Layer 6 has the comparison going from stable to homotopy, as in FKS (4.1), and states "No stable-to-homotopy equivalence is inferred" (README line 916). There is no Lean declaration, because FKS is not statable at the pins.

## H06 (CBirkbeck) — applied

In README Layer 6, the homotopy category is the quotient by null-homotopic maps, using StablePeriodicCurved's morphism-ideal quotient. The orbit category is the disjoint union of the fibres over the reflection orbit, and the reflection functors are defined fibrewise (README lines 812–813). There is no Lean declaration (FKS is not statable).

## H07 (CBirkbeck) — applied

The false universal nonvanishing claim is absent. README Layer 6 keeps two Checks:
- negative: over `ℚ[u,u⁻¹]` with `c = u`, the homotopy category is zero by `h = u⁻¹d/2` (README line 784);
- positive: the disk over `ℚ[t]/(t²)` is nonzero in the stable category (line 781).

## H08 (CBirkbeck) — applied

README Layer 3 states `T_S(Wᵛ)/(R⊥) ≅ Λ(V∗) ⋊ Γ` with no opposite. The degree-one formula `f ↦ Σ_h (h·φ_h) # h` fixes the handedness (README line 542).

## H09 (CBirkbeck) — applied

This repeats H05–H07; see those sections.

## H10 (CBirkbeck) — applied

The README Conventions state the FKS §2.4 convention: a curved bimodule supercommutes with the left action and commutes with the right action, with no sign. A duplex is one `ℤ/2`-graded module on which odd elements exchange the components.

## H11 (CBirkbeck) — applied

The FKS Weyl layer has bipartite scope with a chosen two-colouring (README lines 138, 395, 793), so it applies only to even cyclic `n ≥ 4` among the cycles.

## H12 (kim-em) — answered

README Layer 6 specifies the kernel `Λ(V)⊗End(ρ_a)⊗Λ(V)` on the skew-group side and its transport through the McKay Morita equivalence, as README targets (FKS §§8.1–8.2, 9.3). These are README targets, not Lean declarations. The FKS carriers are not statable at the pins, and the `Suggested.lean` docstring says so.

## H13 (kim-em) — applied differently

README Layer 3 fixes the gradings rather than leaving them chosen:
- on `Sym(V)⋊Γ` and `Λ(V)⋊Γ`, the degree-`n` piece is the set of elements with all coefficients in `Symⁿ(V)`, resp. `Λⁿ(V)`;
- on the quadratic dual, it is `D₀·D₁ⁿ`, and these pieces form an internal direct sum;
- the algebra isomorphism carries `D₀·D₁ⁿ` onto `Λⁿ(V∗)⋊Γ` for every `n`.

The `k[ε]/(ε²)` Check stays. The intermediate Lean definitions of these gradings were removed with the relative-quadratic carriers, which are not at the pins.

## H14 (roed-math) — applied

`TauCetiRoadmap/McKaySkewGroup/metadata.toml` contains `topic = "math.RT"`.

## H15 (CBirkbeck) — applied

README Layer 3 defines Koszulity by the canonical complex with fixed maps:
- the differential `b⊗(w₁⊗⋯) ↦ bw₁⊗(w₂⊗⋯)`;
- the augmentation through `B⊗_S S ≅ B` onto `S`, which must be surjective.

The reviewer's chain (`d₀ = id`, zero augmentation) is a negative-control Check. The generic theory is cited to its owner, DGAInfinity Layer 11. Relative Koszul carriers are not at the pins, so Koszul duality is named in the docstring as not statable.

## H16 (CBirkbeck) — applied

README Layer 0 no longer says that the inverse image of a cyclic rotation group is a circle. The cyclic image fixes an axis, and the maximal torus is the inverse image of the full circle of rotations about that axis. `p⁻¹(p(H))` is cyclic of order `2|H|`; for example `C₃ ↦ C₆`.

## H17 (CBirkbeck) — applied differently

The build failure (`TauCeti.SplitK0.of` against a roadmap `repRing`) no longer occurs, and the module builds. The README supplier contract uses the native `TauCeti.repRing k G := TauCeti.SplitK0 (FDRep k G)`, and Layer 2 consumes it. The Layer 2 headline, the map from the representation ring onto the affine root lattice modulo `ℤδ`, is not statable, because there is no affine root lattice at the pins. So `Suggested.lean` declares no representation-class map, and the docstring says so.

## Gate repairs (sorry-data, imports, build warnings)

`Suggested.lean` is rewritten as the acceptance test.

**Imports.** `import Mathlib` plus six pinned Tau Ceti modules:
- `RepresentationTheory.Simple.Basic`;
- `LinearAlgebra.RootSystem.AffineDynkinType.Basic`;
- `RingTheory.Idempotents.Corner`;
- `RepresentationTheory.Quiver.Preprojective.Basic`;
- `RepresentationTheory.Quiver.Zigzag.Orientation`;
- `RepresentationTheory.Quiver.Zigzag.Relations`.

No roadmap modules are imported, so the deprecation and instance-reducibility warnings coming from CharacterTheory and DGAInfinity are gone.

**Sorry'd data.** There is none. The definitions are:
- `IsMcKayLabelling` (a predicate);
- `symmetricAlgebraAut`, `exteriorAlgebraAut`, `tensorAlgebraAut`, fully proved through `SymmetricAlgebra.algHom_ext`, `ExteriorAlgebra.hom_ext` and `TensorAlgebra.hom_ext`;
- six instances (the three actions via `MulSemiringAction.compHom`, and their `SMulCommClass`, from `map_smul`);
- `deformedPreprojectiveAlgebra`, `cbhRelator` and `CBHAlgebra`, which are quotients by spans with real bodies.

**Headline theorems** (each `sorry`):
- `finite_subgroup_SL2_classification`, `finite_subgroup_SL2_conjugate_of_mulEquiv`, `card_eq_48_conjugate`;
- `exists_isMcKayLabelling`, `exists_isMcKayLabelling_of_valid`;
- `exists_full_corner_equiv_preprojectiveAlgebra`, `exists_full_corner_equiv_zigzag`;
- `exists_full_corner_equiv_deformedPreprojectiveAlgebra`.

**Not statable, as named in the docstring:**
- the relative Koszul duality of Layer 3;
- the representation-ring-to-root-lattice map of Layer 2;
- FKS (Layer 6);
- geometric McKay (Layer 7).

**README changes:**
- The opening paragraph describes the new file.
- Backticks are removed from the 20 names of deleted declarations, which are now prose (Layers 0, 1, 3 and 5).
- Prose with API bullets and Checks is added for each new declaration: Layer 0 classification, Layer 1 `IsMcKayLabelling`, the Layer 3 actions, Layer 4 corners and Layer 5 CBH.
- The supplier contract names each newly consumed Tau Ceti declaration with its file.

**Unresolved: three companion files no longer build.** `CBHTraceControls.lean`, `McKayClassificationTargets.lean` and `GeometricMcKayTargets.lean` import `Suggested.lean` and use declarations it no longer has. They are not built by `lake build TauCetiRoadmap.McKaySkewGroup.Suggested`, and this job may not edit them, so they need a human decision: delete them or rework them. README Layer 5 still mentions `CBHTraceControls.lean` (line 697).

**Elaborated signatures.** The scratch `#check @name` pass was not run, because the only Lean command this job may run is the module build. Every declaration carries its binders in its own signature. The only section `variable`s are `{k G} [Field k] [Group G]`, in the action section, and every declaration there mentions both. The build elaborates every signature.

## Adversarial pass on the new statements

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `card_eq_48_conjugate` (first version: order 48 only) | `C₄₈ = ⟨diag(ζ₄₈, ζ₄₈⁻¹)⟩`, `QuaternionGroup 12`, binary octahedral | orders `48`, `4·12 = 48`, `48`; one is abelian, two are not, and the dicyclic group has a cyclic subgroup of index 2 while `2.S₄` does not | **false** | exclusions `¬IsCyclic` and `IsEmpty (≃* QuaternionGroup 12)` added; README Check |
| `finite_subgroup_SL2_classification` | trivial; `{±I}`; `Q₈`; `SL(2,3)`; `SL(2,5)`; `S₃` | orders `1, 2` (cyclic); `8 = 4·2`; `|SL(2,3)| = 24`; `|SL(2,5)| = 120`; `S₃`'s 2-dim irrep has `det = sign`, so `S₃ ⊄ SL₂(ℂ)`, and the statement correctly excludes it (order 6 is not a multiple of 4, `S₃` is not cyclic, `6 ∉ {24, 48, 120}`) | holds | README Check (orders 24 and 120 are shared with `QuaternionGroup 6`, `QuaternionGroup 30` and the cyclic groups, so those cases are stated by isomorphism) |
| `finite_subgroup_SL2_conjugate_of_mulEquiv` | two cyclic subgroups of order 4 | both are generated by a matrix with eigenvalues `±i`, so they are conjugate to `diag(i, −i)`; a `GL₂` conjugator `P` becomes `P/√det P ∈ SL₂` | holds | — |
| `IsMcKayLabelling`, `exists_isMcKayLabelling` | `C₂ = {±I}` | `V = 2·sign`; multiplicities `[[0,2],[2,0]]`; `2δ − C(A 1) = 2I − !![2,−2;−2,2]` gives the same matrix | holds | README Check |
| same | `C₃` | `V⊗χⁱ = χⁱ⁺¹ ⊕ χⁱ⁻¹`; cycle on 3 nodes = `A 2`; marks `1,1,1` | holds | — |
| same | `Q₈` | simples of dims `1,1,1,1,2`; `D 4` marks (dMarks: node 1 → 2, others 1); `∑δ² = 8` | holds | README Check |
| same | trivial group | `V = 2·triv`; matrix `(2)`; no valid type has 1 node (`A 0` is invalid) | **fails without** `[Nontrivial G]` | hypothesis present; README Check |
| same | `S₃`, 2-dim irrep (faithful, `det = sign`) | `V⊗V = triv ⊕ sign ⊕ V`, so the diagonal multiplicity at `V` is `1`, but `2 − C_VV = 0` for every affine type | **fails without** `hdet` | hypothesis present |
| `exists_isMcKayLabelling_of_valid` | `A n`, `D n`, `E6/7/8` | nodes `n+1` = classes of `C_{n+1}`; `D n`: `n+1` nodes = `4 + (n−3)` classes of `Dic_{n−2}`; E6/E7/E8: 7/8/9 classes of `SL(2,3)`, `2.S₄`, `SL(2,5)`; `∑marks²`: E6 `9+4+1+4+1+4+1 = 24`, E7 `16+4+9+4+1+9+4+1 = 48`, E8 `36+9+16+4+25+16+9+4+1 = 120` | holds | — |
| `exists_full_corner_equiv_preprojectiveAlgebra` | `C₃`; `Q₈`; `C₂` | `C₃`: the sum of the 3 character idempotents is `1`, so the corner is all of `B`, which is basic; `Q₈`: `f = 1` is not an admissible witness because the degree-0 corner `ℂ[Q₈]` has a `2×2` matrix block, so `B` is not basic; `C₂`: `A 1` is not graphical | holds; `C₂` excluded by `hgraph` | docstring note |
| `exists_full_corner_equiv_zigzag` | `Q₈`; `C₃`; `C₄` | `Q₈`: `Λ(V) = triv ⊕ V ⊕ triv`, so the corner has dimension `∑_j(2 + deg j) = 10 + 8 = 18`, and the zigzag algebra of `D̃₄` has dimension `2·5 + 2·4 = 18`; `C₃`: `V.ρ g = diag(ω, ω²) ≠ −1`, excluded (odd cycle: rescaling around the cycle would force `1 = (−1)³`); `C₄`: `g² = −I`, even cycle | holds | docstring note |
| `deformedPreprojectiveAlgebra` | one vertex with one loop | `λ = 1`: `aa* − a*a = 1`, the Weyl algebra; `λ = 0`: `k[a, a*]` | determines the object | README Check |
| `exists_full_corner_equiv_deformedPreprojectiveAlgebra` | `z = 0`; `z = 1`; `Q₈` scalar vs trace weights | `z = 0`: `λ = 0` gives `Π⁰ = Π`, consistent with the Sym corner; `z = 1`: `λ_i = δ_i`, `∑λ_iδ_i = |G| ≠ 0`, so there is no finite-dimensional module on either side; `Q₈`: trace `(1, −2)` against scalar `(1, −1)` (README Layer 5 computation) | holds; the trace normalization is forced | README Check |
| same, change of basis | `x' = cx` | `[x', y] = c[x, y]`, and rescaling all arrows gives `Π^λ ≅ Π^(cλ)` | the statement is basis-independent | docstring note |
| `symmetricAlgebraAut` etc. | `C₂` sign on `k` | `x ↦ −x`, `x² ↦ x²`; multiplicativity is in `AlgEquiv` | holds (proved, no `sorry`) | README Check |
| skew product convention | `C₂` sign | `(1#g)(x#1) = −x#g` and `(x#1)(1#g) = x#g` | pins the left skew product | README Check |

## Ownership and direction

- The McKay labelling, the skew-group actions, the corner theorems and the CBH algebra are owned here. They are stated on carriers that exist at the pins: `TauCeti.AffineDynkinType`, `TauCeti.SimpleFDRepClasses`, `TauCeti.preprojectiveAlgebra`, `TauCeti.nonisolatedZigzagQuotient`, `SkewMonoidAlgebra`, and the corner algebra `IsIdempotentElem.Corner.instAlgebra`.
- `roadmaps resolve` on the README found no unresolved citation or Lean name.
- No declaration reuses a fully qualified name from another roadmap.
- No supplier was moved.

## Sources

No new sources are cited beyond those already in the README:
- McKay 1980;
- Springer, *Invariant theory*, §4.4;
- CBH98 Theorem 0.1;
- HK01 §6.3, Props. 16–17.

HK01 was fetched earlier (arXiv:math/0002060v2). No `needs-references.toml` was written.

## Build

`lake build TauCetiRoadmap.McKaySkewGroup.Suggested`: **Build completed successfully (9001 jobs)**. The only warnings are `declaration uses 'sorry'`, one for each of the 8 headline theorems.

## Gate

`gate McKaySkewGroup: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`

Depcheck output:

```
depcheck: 148 roadmaps, 999 edges, 0 problem(s)
```

## Suspicious text

None. The reviews contain no instructions beyond mathematical requests.
