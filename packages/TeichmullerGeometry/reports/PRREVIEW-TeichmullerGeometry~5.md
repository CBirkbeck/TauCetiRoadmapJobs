# Review of TeichmullerGeometry (pull request #1169 at 4451421)

**Verdict:** needs changes

This is a full re-review. The folder changed by 950 lines since `927e679`. The new Layer 0 (§0.0a–§0.0h), §5.3a, §5.3b and §5.4a take over the material that used to be cited from SurfaceTopology and PlanarTopology. Three findings block: the gate fails, the Euler characteristic is planned a second time beside the one Tau Ceti already has, and the passage between the `𝓡 2` and `𝓡∂ 2` atlases is used throughout but owned nowhere.

Gate at this head (my own run, which agrees with the worker's): `sorry-data=13 statement-hygiene=6 … FAIL`; every other check is 0. `lake env lean TauCetiRoadmap/TeichmullerGeometry/Suggested.lean` elaborates with 51 `declaration uses 'sorry'` warnings and nothing else. Dependency check: `depcheck: 237 roadmaps, 2341 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder: nothing. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.

## Previous findings

- R01 (PlanarTopology contract omits its Layer 4): moot, so repaired. PlanarTopology is no longer cited anywhere (0 occurrences). The compact relative PL approximation is now owned in §0.0a, and §5.5 line 661 cites "the compact relative PL approximation theorem of §0.0a".
- R02 (Layer section comments out of README order): **not repaired**. `/-! ## Layer 5: … -/` is at line 687 and `/-! ## Layer 4: … -/` at line 778. Carried as R12 below.
- R03 (no `sources.toml` in the folder): withdrawn. None of the 153 roadmap folders on main carries a `sources.toml`. The manifest is the board package's `packages/TeichmullerGeometry/sources.toml`, so this is not a defect of the pull-request folder.

## R01 (P2) — Gate failure: thirteen definitions and instances carry `sorry`

Location: `Suggested.lean` lines 551–599, 614–641, 648–650, 661–677. These are `isotopicToIdSubgroup`, `boundaryFixingSubgroup`, `isotopicRelToIdSubgroup`, `MappingClassGroupPlus`, `PLStructure.plHomeomorphSubgroup`, `PLStructure.plIsotopicToIdSubgroup` and `smoothIsotopicToIdSubgroup` (`one_mem' := sorry` and the other fields), the three `.normal` instances (`:= by sorry`), and `MappingClassGroupPL.toTop` / `MappingClassGroupSmooth.toTop` (`QuotientGroup.map _ _ … (by sorry)`).

Claim: the carriers are real, but every mapping class group of the file is a quotient by a subgroup whose closure laws are admitted. The gate refuses a `sorry` in the body of any `def` or `instance`.

Witness: gate line `sorry-data=13 … FAIL`, listing lines 551, 557, 566, 574, 581, 592, 614, 632, 639, 648, 661, 667, 675.

Repair: discharge the obligations. Each takes a few lines with the pinned API:
- **Isotopy fields** use Tau Ceti's `TauCeti.Isotopic.refl/symm/trans` (`Topology/Homotopy/Isotopy/Basic.lean` lines 124–137) and `Isotopic.precomp_homeomorph/postcomp_homeomorph` (`…/Isotopy/Comp.lean` lines 106, 111, which adds the import `TauCeti.Topology.Homotopy.Isotopy.Comp`). Conjugation `h f h⁻¹` is the precomposition by `h⁻¹` followed by the postcomposition by `h`.
- **Relative fields** use Mathlib's `ContinuousMap.HomotopyRel.refl/symm/trans`.
- **Smooth fields** use `TauCeti.Diffeotopy.refl/trans/symm/transDiffeomorph` with `final_refl/final_trans/final_symm` (`Diffeotopy/Basic.lean` lines 209–316).
- **PL subgroup:** put `s.IsPLHomeomorph f ∧ s.IsPLHomeomorph f.symm` in the carrier of `plHomeomorphSubgroup`. Then `inv_mem'` is `And.symm`, and `mul_mem'` is `TauCeti.IsPLOn.comp` (`Topology/PL/Map.lean` line 254). As written, `inv_mem'` needs the theorem that a PL bijection has a PL inverse.
- **The two `QuotientGroup.map` side conditions:** a PL isotopy carries its `TauCeti.Isotopy` field, and a diffeotopy's slices give an isotopy.

The README's API sentence "its inverse is then piecewise linear as well" (line 243) stays as a target.

## R02 (P2) — The Euler characteristic of a compact surface is planned a second time

Location: `Suggested.lean` lines 191–219 (`simplicialEulerChar`, `Surface.eulerChar`, `Surface.eulerChar_eq`, `Surface.eulerChar_congr`, `Surface.eulerChar_sphere`). README line 149 ("Define the Euler characteristic of an abstract simplicial complex, `simplicialEulerChar` … Prove its invariance … under linear subdivision") and the Scope at line 9.

Claim: Tau Ceti at the pin already has this object, its triangulation formula, its invariance and the sphere value. AlgebraicTopology Stage 7 owns it, and the README lists Stage 7 in its own contract (line 82) without consuming it anywhere.

Two consumers need Tau Ceti's χ:
- **§4.5.** It concludes `e(ρ) = χ(Σ) = 2 − 2g` from CharacteristicClasses C2 item 3, whose χ is AlgebraicTopology Stage 7's (CharacteristicClasses README line 857, "which AT7 identifies with χ(M)"). §0.0f proves `2 − 2g` only for the roadmap's own `Surface.eulerChar`.
- **Layers 8 and 10.** They use FuchsianOrbifolds Layer 5 item 6's Riemann–Hurwitz formula, whose genus is defined from the same AT χ (FuchsianOrbifolds README line 313).

Witness: `TauCeti/AlgebraicTopology/SimplicialComplex/Realization/CWComplex/EulerCharacteristic.lean` line 156, `eulerChar_eq_finsum_of_homeomorph`, states `eulerChar M = ∑ᶠ σ : Face K, (-1)^(σ.1.card + 1)` for any triangulation `f : Realization K ≃ₜ M`. That is exactly `simplicialEulerChar`.

Repair:
- **Delete** the five declarations. Use `TauCeti.eulerChar` under `[TauCeti.FiniteCWType M]` (a `Prop` class; Radó's theorem installs it through `IsTriangulable.finiteCWType`, `Topology/Triangulable/FiniteCWType.lean` line 41).
- **Cite** `eulerChar_eq_finsum_of_homeomorph`, `Homeomorph.eulerChar_eq` (`…/Cellular/EulerCharacteristic/FiniteCWType.lean` line 163) and `TauCeti.eulerChar_sphere` (`…/Sphere.lean` line 62) in the Tau Ceti contract and the Scope, and drop the subdivision-invariance route of §0.0c.
- **Restate** `StandardSurface.eulerChar_model`, `homeomorph_iff_invariants`, `Surface.eulerChar_eq_two_sub_two_mul_genus` and `riemannHurwitz` with `TauCeti.eulerChar`.
- **In §10.2,** cite `TauCeti.eulerChar_eq_mul_of_isCoveringMap` (`…/Covering.lean` line 140) for the unbranched cover in place of `riemannHurwitz`.
- **In §0.0f,** add one sentence: on closed orientable surfaces `Surface.genus` is FuchsianOrbifolds Layer 5 item 1's topological genus.

Tested in a scratch copy:
- For `M : Type`, `s : PLStructure M` and `[TauCeti.FiniteCWType M]`, `TauCeti.eulerChar M = simplicialEulerChar s.K` closes with `rw [eulerChar_eq_finsum_of_homeomorph s.K s.e, simplicialEulerChar]` followed by `finsum_subtype_eq_finsum_cond`.
- `riemannHurwitz` restated on `TauCeti.eulerChar`, with `∑ᶠ x ∈ p ⁻¹' B` as its correction term, elaborates.

This also clears the statement-hygiene hit at line 202.

## R03 (P2) — The passage between the `𝓡 2` and `𝓡∂ 2` atlases is used throughout but owned nowhere

Location: README line 43 ("a closed surface charted on `𝓡 2` is read as one with empty boundary"). The reading is used in:
- §0.1 line 258, in both directions;
- §3.1 line 444;
- §5.3b line 625;
- §5.4 line 637, which applies `isotopic_of_homotopic_closedSurface` and `smoothIsotopic_of_isotopic` (stated on `𝓡∂ 2`) to the `𝓡 2` surface of `baer_epstein_smooth`;
- §5.4a line 649, where `MappingClassGroupPlus` needs `IsManifold (𝓡∂ 2) ∞` on Mathlib's sphere, which is charted on `𝓡 2`.

Also §0.2 line 279 takes `TauCeti.Diff (𝓡 2) M ∞` for "`M = D²` with a boundary collar", which no `𝓡 2` atlas can carry.

Claim: the comparison is a convention in prose, not a target. It is needed to compose the `𝓡 2` headlines (`exists_diffeomorph_mapOfEq_eq`, `baer_epstein_smooth`, lines 696–717) with the `𝓡∂ 2` ones (lines 229–300 and 744–761).

Witness: the pin has only the homeomorphism `TauCeti.EuclideanHalfSpace.interiorEmbedding` (`Geometry/Manifold/Boundary/Collar/Local.lean` line 246). It has no charted-space or smooth-structure comparison between the two models, and no `TauCeti.Diff (𝓡 2) M ∞ ≃* TauCeti.Diff (𝓡∂ 2) M ∞`.

Repair: add a target to §0.0e with a `*Needs:*` line, cited by §§0.1, 3.1, 5.3b, 5.4 and 5.4a. It should state three things:
- composing each chart of a smooth `𝓡 2` surface with `interiorEmbedding 1` gives a smooth `𝓡∂ 2` atlas with empty boundary, for which the identity is a diffeomorphism;
- hence `TauCeti.Diff (𝓡 2) M ∞ ≃* TauCeti.Diff (𝓡∂ 2) M ∞`, with diffeotopies corresponding;
- conversely, a smooth `𝓡∂ 2` surface with empty boundary has an `𝓡 2` atlas with the same smooth maps, using Mathlib's chart independence of interior points.

Write `TauCeti.Diff (𝓡∂ 2) M ∞` (or `TauCeti.DiscDiff 2`) in §0.2 and the Conventions for surfaces with boundary.

## R04 (P3) — Statement hygiene: five hits remain after R02

Location: `Suggested.lean` line 462 (`h.choose` in `Surface.genus`); lines 265 and 414 (`letI := σ; …` in `PLStructure.exists_smoothing` and `StandardSurface.isSurface_model`); lines 767 and 775 (`Nonempty (… ≃* …)` in `mcg_sphere_full`, `mcg_torus_full`).

Claim: the gate's statement-hygiene rule refuses each of these.

The two mapping class group theorems also record less than the README states. README line 649 pins the reflection as the nontrivial class of the sphere, `MappingClassGroupPlus` as trivial, and the torus isomorphism as the action on `π₁(T², 0)` sending the linear diffeomorphism of `A` to `A`.

Witness: gate output, `statement-hygiene=6` at lines 202, 265, 414, 462, 767, 775.

Repair, each tested in a scratch copy:
- **Genus.** Define `Surface.genus M := sInf {n | ∃ S : StandardSurface, S.genus = n ∧ Nonempty (M ≃ₜ S.model)}`. It is choice-free and is `0` when no model fits.
- **`letI`.** Write `@IsManifold _ _ _ _ _ _ _ (𝓡∂ 2) ∞ M _ σ ∧ @PLStructure.IsCompatible M _ σ s`, and similarly in `isSurface_model`.
- **Sphere.** State the canonical map. Let `c r = (QuotientGroup.mk (Diffeomorph.toHomeomorphHom (TauCeti.orthogonalToDiffSphere 2 ∞ r)) : MappingClassGroupFull S²)`. State that `c` is surjective on `Matrix.orthogonalGroup (Fin 3) ℝ` and that `c r = 1 ↔ det r = 1`.
- **Torus.** Define the linear homeomorphism of `AddCircle 1 × AddCircle 1` attached to `A : GL (Fin 2) ℤ`, and state that `A ↦` its class is bijective. If that definition is judged too heavy, rename the theorem `nonempty_mulEquiv_…` and move the canonical form to the docstring's not-statable list.

## R05 (P3) — Padding: six declarations close in one step or restate a definition

Location: `Suggested.lean`:
- line 179, `isTriangulable_of_compactSurface`;
- line 269, `PLStructure.IsCompatible.map_diffeomorph`;
- line 440, `exists_standard_homeomorph`;
- line 465, `Surface.genus_model`;
- line 512, `IsBranchedCover.finite_preimage_branch`;
- line 681, `MappingClassGroupSmooth.toTop_surjective`.

Claim: each is a one-step corollary of a library lemma or of another statement in the file, or restates a definition.

Witness (one-tactic probe, compiled in a scratch copy):
- `⟨s.ι, s.K, ⟨s.e⟩⟩` from `PLStructure.nonempty_of_compactSurface`;
- `obtain` and then `exact ⟨…, hg.trans_diffeomorph Φ (by simp), F, hF, …⟩`, using Tau Ceti's `IsSmoothTriangulation.trans_diffeomorph`;
- `classification_of_surfaces.exists`;
- `B.finite_toSet.preimage' fun b _ => hp.finite_fibers b`;
- `(MappingClassGroupSmooth.toTop_bijective M).2`;
- `Surface.genus_model` is the definition of `Surface.genus` read through `StandardSurface.homeomorph_unique`.

Repair: delete the six from `Suggested.lean` and keep their statements in the README as targets, unbackticked. `riemannHurwitz` then sums over `∑ᶠ x ∈ p ⁻¹' (B : Set Y)`.

## R06 (P3) — Epstein's Theorem 6.3 does not state the relative form it is cited for

Location: README line 172 ("homeomorphisms between compact surfaces that are homotopic relative to the boundary are isotopic relative to the boundary (Epstein, Theorem 6.3)") and the docstring of `isotopicRel_of_homotopicRel`, `Suggested.lean` lines 234–236.

Claim: Theorem 6.3 assumes a proper homotopy of pairs `(M, ∂M) → (M, ∂M)` and concludes an isotopy, not one fixing `∂M`. The rel-∂ form is read from its proof.

Witness: epstein1966 lines 533–535 (the statement, p. 99) and line 537 (the proof first moves `h|∂M` to the identity "by 5.3 and 5.4"). The isotopies built afterwards fix `∂M` (lines 559, 567–568, 590).

Repair: cite "Epstein 1966, Theorem 6.3 and its proof, pp. 99–101: when `h|∂M` is the identity and the homotopy is constant on `∂M`, the isotopies constructed there fix `∂M`". Make the same change in the Lean docstring.

## R07 (P3) — The docstring's reason for not stating the compact relative PL theorems is contradicted by the file

Location: `Suggested.lean` lines 80–86 ("read in barycentric coordinates they give the predicates for self-maps of one triangulated surface …").

Claim: `PLStructure.IsCompatible` (lines 250–259) already reads a map between two different complexes in barycentric coordinates (`F : (κ → ℝ) → (s.ι → ℝ)`). So two §0.0b/§0.0a statements are statable in the same encoding:
- the compact relative form of §0.0a (`f : |K| ≃ₜ |L|` PL on `|A|`, approximated within `ε` by a PL `g` equal to `f` on `|A|`);
- isotopy to a PL homeomorphism between two PL structures.

Witness: `IsCompatible`'s body, `∃ F, TauCeti.IsPLOn F (range coords of L) ∧ ∀ y, F (coords y) = coords (s.e.symm (g y))`, is a PL condition on a map `|L| → |K|`.

Repair: state these two in that encoding beside `exists_pl_approximation_open`. If you keep them out, give a reason that holds. Curves and arcs need a triangulated circle or interval, which can be encoded the same way.

## R08 (P3) — Sampled targets without a locator

Location: README §0.0c line 151 (orientation double cover, action of isotopic homeomorphisms on orientations); §0.0h line 245 (`MappingClassGroupPL.toTop_bijective`); §0.2 line 279 (parameter smoothing, local isotopy lemma); §0.3 line 299 (isotopy extension); §5.6 line 674 (the named "Macbeath–Singerman" implication).

Claim: these are standard theorems stated with exact hypotheses but with no source.

Witness: none of the five paragraphs has a parenthetical locator. §5.6 names Macbeath and Singerman and cites nothing.

Repair: add a locator to each:
- §0.0h: epstein1966, Theorem 6.4 a) in its PL reading, p. 101, for injectivity, and Appendix, Theorem A4, p. 107 (lines 778–779), for surjectivity;
- §5.6: Macbeath and Singerman's paper on spaces of subgroups and Teichmüller space;
- §0.3: Hirsch, *Differential Topology*, GTM 33, Chapter 8, for isotopy extension;
- §0.0c and §0.2: a textbook source for each theorem.

## R09 (P3) — The third Check of §0.3 is false

Location: README line 305 ("A moving embedding that leaves a compact set of a noncompact surface has no extension with compact support; the compactness hypothesis is used").

Claim: for compact `K` and `t ∈ [0, 1]` the track is compact. The cutoff velocity field then has compact support and its flow exists on any surface, so a compactly supported extension always exists. The Check refutes nothing.

Witness: a point pushed along a segment of the open plane extends to the compactly supported point-pushing isotopy of the first Check (line 303). The noncompact ambient changes nothing.

Repair: replace it with a Check on noncompact `K`. For example, the line `ℝ × {0} ⊂ ℝ²` translated by `e_t(s) = (s + t, 0)` extends only to diffeomorphisms moving every point of the line, so no compactly supported extension exists. Then say that the compactness of `K` is what is used.

## R10 (P3) — Three Checks attribute their conclusion to the wrong result

Location: README line 558 (§4.5 Check 3, "unless the twist is realized by an isometry, which Layer 0.5 excludes"); line 814 (§8.2 Check 2, "since Layer 0.5 excludes an isometry isotopic to a twist"); line 874 (§9.1 Check 3, "a generic point of `Teich(S_2)` by Layer 9.3" has a trace field that is not a number field).

Claim: Layer 0.5 excludes only isometries isotopic to the identity. A Dehn twist is excluded because the isometry group is finite (ComplexCurveModuli D0 item 5, §5.6) while a twist has infinite order. Layer 9.3 proves non-arithmeticity of generic points, not that their traces are transcendental.

Witness: §0.5 line 323 proves `Aut(X) ∩ Diff₀(Σ) = {id}` only. §9.3 line 892 concludes only that the arithmetic locus is closed and nowhere dense.

Repair: in the first two Checks write "since point stabilizers are finite (§5.6) and a Dehn twist has infinite order in `Mod±(Σ)`". In the third, either give the argument (the representations with all traces algebraic form a countable set) or drop the attribution.

## R11 (P3) — `baer_epstein_smooth` is narrower than its sources and its route

Location: `Suggested.lean` line 712 (`[TauCeti.Orientable (𝓡 2) S]`); README line 637 ("a diffeomorphism of a closed orientable surface").

Claim: the route is valid on every closed surface. Epstein's theorem (`isotopic_of_homotopic_closedSurface`) and `smoothIsotopic_of_isotopic` are both stated without orientability.

Witness: on the Klein bottle, a diffeomorphism homotopic to the identity is isotopic to it by epstein1966 Theorem 6.4 a) (line 604–607: only the plane and the cylinders need orientation). It is then smoothly isotopic by §5.3a ("orientable or not", line 613).

Repair: drop the binder and the word "orientable" in §5.4. The torus and sphere Checks are unchanged.

## R12 (P3) — Layer section comments of `Suggested.lean` are out of README order (carried, not repaired)

Location: `Suggested.lean` line 687 (`/-! ## Layer 5: … -/`) and line 778 (`/-! ## Layer 4: … -/`).

Witness: README Layer 4 begins at line 486 and Layer 5 at line 570.

Repair: move lines 778–788 (`exists_mulEquiv_isometryEquiv_glAction` and its comment) above line 687.

## R13 (P3) — Process wording and a dangling cross-reference in the README

Location: README line 18 ("named in words until Mathlib acquires them, when the definitions here are deleted in favour of Mathlib's"), line 754 ("these definitions are deleted in favour of Mathlib's the day Mathlib acquires them") and line 548 ("The marked hyperbolic and holonomy carriers (Conventions, carriers 3 and 4)").

Claim: the first two are "for later" narrative, which the house style forbids. The Conventions section numbers no carriers.

Witness: the Conventions section (lines 39–52) contains no numbered list of carriers.

Repair: delete the two clauses about future Mathlib. Replace "(Conventions, carriers 3 and 4)" with "(the third and fourth carriers of the Summary: marked hyperbolic metrics and holonomy classes)".

## Verified sound

**Adversarial table.** It covers the fifteen sampled targets, the headline statements of `Suggested.lean`, and the targets the findings touch.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §0.0c `simplicialEulerChar` | tetrahedron boundary; its barycentric subdivision; solid tetrahedron; seven-vertex torus | `4−6+4=2`; `14−36+24=2`; `4−6+4−1=1`; `7−21+14=0`; Mathlib faces are nonempty (`Basic.lean` lines 47–56), so no `−1` from `∅` | correct, and equal to `TauCeti.eulerChar` (probe) | R02 |
| §0.0c `Surface.eulerChar_congr` | `M` with no PL structure; `M` with `s` and `f : M ≃ₜ N` | both sides `0`; `s.map f` has the same complex, same count | true for every space | R02 (cite `Homeomorph.eulerChar_eq`) |
| §0.0c orientation double cover Checks | disc, sphere, Möbius band | two discs; two spheres; one annulus, two points over each point | consistent | R08 |
| §0.0f gluing convention | `a a⁻¹`; `c h c⁻¹`; `a a` | side 1 at `1−t` is `exp(−πit) = z̄`; arcs 0 and 2 folded by `z ↦ z̄`, free arc endpoints `e^{2πi/3}, e^{4πi/3}` identified; side 1 `= −`side 0 | sphere, disc with one boundary circle, `ℝP²` | none |
| §0.0f vertex count `1 + b` and `χ` | hole block; annulus `orientable 0 2`; Dyck word `x y x⁻¹ y⁻¹ z z` | `c(0)~c⁻¹(1)` chains first corners, `c(1)~c⁻¹(0)` new class; `V,E,F = 3,4,1`, `χ = 0 = 2−0−2`; `1−3+1 = −1 = 2−3` | `StandardSurface.eulerChar` agrees | none |
| §0.0f `Surface.genus` | Klein bottle, torus, disc | `2, 1, 0`; `(2−χ)/2` gives `1, 1, ½` | definition separates them | R04 (choice) |
| §0.0h MCG Checks | closed disc; annulus twist `([θ],t) ↦ ([θ+t],t)` | Rel trivial (Alexander), conjugation `≠ 1` in Full; path `([θ+st],t)` of homeomorphisms makes the twist trivial in Full, infinite order in Rel | consistent | R01 |
| §0.0h `MappingClassGroupPL.toTop_bijective` | PL `h ≃ id`; arbitrary homeomorphism | Epstein 6.4 a) PL isotopy (p. 101); Theorem A4 (p. 107) | both halves sourced | R08 |
| §0.2 paths and isotopies | `S²` rotation vs antipodal; torus shear; `f_t =` flow at `\|t−½\|` | antipodal reverses orientation; shear acts by `[[1,0],[1,1]]` on `H₁`; `τ(t) = 2(t−½)²` smooth with `τ(0)=τ(1)=½`, `τ(½)=0` | Checks hold; `D²` cannot carry `𝓡 2` | R03, R08 |
| §0.3 isotopy extension | point pushed along a segment of the open plane | compact track, compactly supported field, global flow | Check 3 false | R09 |
| §2.3 Hausdorff, second countable | `ℝ/ℤ` (collapse `ℤ`), closed non-open; `𝒥(T²)/Diff₀ = ℍ` | quotient not first countable at the collapsed point; `ℍ` Hausdorff | Checks hold | none |
| §3.2 action law | two orientation-reversing `f, g` | `(fg)·J = ((fg)⁻¹)^*J`; `f·(g·J) = (−1)²(f⁻¹)^*(g⁻¹)^*J = (g⁻¹f⁻¹)^*J`; `f^*` convention gives `(gf)^*` | left action; `f⁻¹ : (Σ,(f⁻¹)^*J) → (Σ,J)` holomorphic, so both formulas agree | none |
| §4.5 `e(ρ) = 2 − 2g` | genus 2; fibre orientation at `i` | counterclockwise directions end at `+1, ∞, −1, 0`, increasing `ℝ` = positive `∂ℍ`; `∫K = −4π = 2π(−2)` | sign consistent; C2.3's `χ` is AT7's | R02 |
| §4.5 Check 3, §8.2 Check 2 | Dehn twist | `Isom(X)` finite, `Isom → Mod` injective, twist of infinite order | conclusion true, cited reason wrong | R10 |
| §5.4 `baer_epstein_smooth` | `S²`; torus; Klein bottle | `f ≃ id ⇒ deg 1 ⇒ Diff⁺ = Diff₀` (Smale); trivial on `H₁` ⇒ isotopic; Epstein 6.4 a) + §5.3a | true, also without orientability | R11, R03 |
| §5.4 Epstein closed form | epstein1966 Theorem 6.4 a), 6.3 | homotopic ⇒ isotopic; closed `M` reduced to 6.3 (line 637) | supports the closed form | none |
| §5.6 Macbeath–Singerman | `H = Aut(Π)`; `H = Inn(Π)`; real curve | `[Aut:Inn] = ∞`, fixed set `∅`; index 1, fixes all; `Mod±` stabilizer `⊋ Mod⁺` stabilizer | consistent | R08 |
| §8.2 Nielsen realization | `F` trivial; `⟨h⟩` genus 2 | `L_C` has a minimum (compactness), unique (strict convexity); `h` fixes all | true | R10 |
| §8.3 quotient charts | hyperelliptic genus 2; three-oval reflection; free orientation-reversing involution | `−2 = 2(2 − 6·½)`; `χ = −1 = 2 − 3`; nonorientable `χ = −1` | consistent | none |
| §8.5 codimension | `F⁺` of order `n ≥ 2`; `g = 3` hyperelliptic | `2g−2 ≥ 2(2h−2+r/2) ⇒ r ≤ 2g+2−4h`, codim `g−2+h`; `h=0, r=8`, dim 5 of 6 | codim `≥ 1` for `g ≥ 3` | none |
| §8.5 genus-two kernel | `r = 6−3h` | `h=1`: `2 ≥ \|K\|·3/2 ≥ 3` impossible; `h=2`: `\|K\|=1`; `h=0`: `2 ≥ \|K\|`, so `\|K\|=2`, all `mᵢ=2` | case analysis complete | none |
| §9.1 Takeuchi | takeuchi1975 lines 27–30, 42–46, 50–58; `PSL₂(ℤ)`; `(2,3,7)` | `Γ(A,𝒪) ⊂ SL₂(ℝ)` (the README passes to `PSL₂`); traces in `ℤ`, `k₂ = ℚ`; traces `0, 1, 2cos(π/7)`, `ℚ(cos π/7) = ℚ(cos 2π/7)` cubic | statement and (I), (II₁) match | R10 (Check 3) |
| §9.3 arithmetic locus | `Teich(S₂)`, real dimension 6 | finite union of orbits of a properly discontinuous action with finite stabilizers: closed, discrete, no isolated points of the ambient | closed nowhere dense | none |
| `exists_pl_approximation_open` | `x ↦ ‖x‖x`, `φ = ε`; `φ = 1/q` at rationals | not PL at `0`, approximated; non-admissible `φ` forces `g = f` on a dense set | hypothesis needed | none |
| `image_boundary` | closed disc vs `S²` | boundary `S¹` vs `∅` | not homeomorphic | none |
| Radó, Hauptvermutung | tetrahedron vs octahedron on `S²` | 4 vs 6 vertices; great-circle common refinement | consistent | R05 (`isTriangulable_…`) |
| `isotopicRel_of_homotopicRel` | annulus twist; disc conjugation | twist shifts a crossing arc by the core; conjugation has boundary degree `−1` | neither homotopic rel ∂, consistent | R06 |
| `IsCompatible`, `exists_smoothing` | one-triangle disc; its barycentric subdivision; projected tetrahedron | both corner edges map into the boundary line, rank `≤ 1`; subdivision works; immersion | consistent | R04, R05 |
| `exists_isotopic_diffeomorph` | torus `(x,y) ↦ (x, y+u(x))` | isotopic to `id` through `t·u` | consistent | none |
| classification | torus / genus 2; torus / Klein bottle; torus / annulus | `χ` 0 vs −2; orientability; boundary count 0 vs 2 | each invariant needed | R05 (`exists_standard_…`) |
| `riemannHurwitz`, degree | `zⁿ` on `Ĉ`; `zⁿ` on closed disc; identity | `2 = 2n − 2(n−1)`; `1 = n − (n−1)`; weighted count `n` vs fibre size 1 | consistent | R02, R05 |
| §10.2 genus of `Σ_N` | `[Π:N] = 2` | `χ = 2(2−2g) = 2 − 2(2g−1)` | genus `2g − 1` | R02 (cite the covering lemma) |
| `exists_diffeomorph_mapOfEq_eq` | torus, `α = [[1,0],[1,1]]` | shear fixes `0` | consistent | none |
| Smale, disc and sphere | `π₀`, `π₁` | `π₀ O(3) = ℤ/2 = π₀ Diff(S²)`; `π₁ SO(3) = ℤ/2` | consistent | none |
| `smoothIsotopic_of_isotopic`, `toTop_bijective` | `S²` antipodal; `S⁶` | not isotopic (orientation); 28 smooth classes vs 1 topological | dimension used | R05 (`toTop_surjective`) |
| `mcg_sphere_full`, `mcg_torus_full` | reflection·antipodal; shear; `−I`; swap | rotation by `π`; `[[1,0],[1,1]]`; `det(−I) = 1`, four fixed points; `det = −1` | true; Lean records existence only | R04 |
| `exists_mulEquiv_isometryEquiv_glAction` | `diag(1,−1)`, `λI` with `λ < 0`, `diag(2,1)`, `diag(−2,1)` | `z ↦ −z̄`; `det = λ² > 0`, trivial; `dist(i,2i) = log 2 = dist(2i,4i)` | kernel is the centre | R12 |

**Signature check.** I appended `#check @` for all 79 named declarations to a scratch copy and elaborated it once. 72 resolved; the 7 inside `namespace StandardSurface` are covered by `signatures.md`. Every `theorem` carries the binders its README statement needs:
- `toTop_surjective` and `toTop_bijective` carry `IsManifold (𝓡∂ 2) ∞`, `T2Space` and `CompactSpace`;
- `riemannHurwitz` carries Hausdorff, compact and connected on both sides;
- `isotopic_of_homotopic_closedSurface` carries `boundary M = ∅` and `CompactSpace M`.

The 11 binder drops that `signatures.md` flags are all in definitions whose dropped class is a `Prop` the body never uses: `ChartedSpace` for the PL definitions and `IsManifold` for the smooth mapping class group. Nothing changed.

**Library declarations opened at the pins** (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`, which match the content checkout's manifest):
- Mathlib `PreAbstractSimplicialComplex` and `AbstractSimplicialComplex` (`AlgebraicTopology/SimplicialComplex/Basic.lean` lines 52, 155).
- Tau Ceti:
  - `Isotopy` and `Isotopic` (`Topology/Homotopy/Isotopy/Basic.lean` lines 87, 114) and `Isotopic.precomp_homeomorph` (`Comp.lean` line 111);
  - `Diff` (`Geometry/Diffeomorphism/Group.lean` line 214), `Diffeotopy` (`Diffeotopy/Basic.lean` line 78), `DiscDiff` (`Disc.lean` line 63);
  - `IsSmoothTriangulation` and `trans_diffeomorph` (`SmoothTriangulation/Basic.lean` lines 191, 209), and `barycentricSubdivisionRealizationHomeomorph_trans` (`Subdivision.lean` line 63);
  - `IsCombinatorialManifold` (`CombinatorialManifold/Basic.lean` line 214) and `realization_isManifold` (`ChartedSpace.lean` line 117);
  - `PLHomeomorphic` (`Realization/PL.lean` line 36), `IsTriangulable` (`Triangulable/Basic.lean` line 38), `IsPLOn` (`PL/Map.lean` line 187);
  - `IsJordanCurve` (`Topology/JordanCurve/Basic.lean` line 107), Schoenflies (`Jordan/Schoenflies.lean` line 122), `filledHull` (`FilledHull.lean` line 99);
  - invariance of domain (`Singular/InvarianceOfDomain.lean` lines 160, 248), `alexanderIsotopyClosedBall` (`Isotopy/Alexander.lean` line 132);
  - `deckFundamentalGroupEquiv_symm_op` (`UniversalCover/Deck/FundamentalGroup/UniversalCover.lean` lines 115–118, inverse `op g ↦ loopDeck x₀ g⁻¹`), `deckSubgroupQuotientProjEquivOfNormal` (`Classification/DeckGroup.lean` line 95);
  - `UpperHalfSpace.isPretransitive_isom` (`Hyperbolic/UpperHalfSpace/Basic.lean` line 488), `Orientable` (`Orientation/Basic.lean` line 263), `IsClosedConnectedSurface` (`Manifold/Basic.lean` line 128);
  - the Euler-characteristic files cited in R02, and `FiniteHolomorphicMap.eulerChar_eq_degree_mul_eulerChar_sub_ramificationDegree` (`RiemannSurface/Branch/EulerCharacteristic.lean` line 130).
- The other Mathlib and Tau Ceti names of the contracts elaborate under `#check`.
- The pin has no `Out` of a group (only `OuterAlgAut`), so the docstring's account of the full Dehn–Nielsen–Baer isomorphism holds.

**Cross-roadmap citations resolved on main (`b3d628f`):**
- ComplexCurveModuli D0 items 1–5 (lines 27–51), D3 items 3–6 (82–103), D4 items 1 and 4 (107, 114), D6 item 2 (150).
- ComplexKahlerGeometry K1 Newlander–Nirenberg (180), K4 (444), K5b (1168).
- DifferentialGeometry Layers 0, 2, 5, 12 and 3.5 `exists_timeDependentFlow` (400).
- GeometricTopology Layer 1 collars, tubular neighbourhoods and the disc theorem (205–228), Layer 3 (357), smoothing-and-triangulation comparison item 1 (938).
- AlgebraicTopology Stage 1 items 4–5 (301–306), Stage 6 (1561), Stage 7 (1573).
- CharacteristicClasses C2.3 (776, 857).
- RiemannianGeometry R4 item 7 (717–735).
- FuchsianOrbifolds Layer 0 items 2–3, Layer 1 items 1–3, Layer 4 item 5, Layer 5 items 1, 3, 6 (lines 198–339).
- PDE B8–B10 (§§2.1–2.3), ModularForms 10B (1068), Completed/UniversalCovers Stages 1–2.
- QuaternionArithmetic §8.1 at its open head is mentioned only as not consumed.

The 23 `roadmaps resolve` leads are this roadmap's own names declared in `Suggested.lean`, not library names.

**Ownership.** The Layer 0 material is owned here correctly. The brief forbids citing SurfaceTopology and PlanarTopology. No roadmap on main or earlier in the merge order owns Radó's theorem, the Hauptvermutung, Epstein's theorems, polygon schemas or surface mapping class groups: GeometricTopology lists only Whitehead's comparison, as a far-horizon item. The pin has none of them except the Euler characteristic (R02).
- The topological Riemann–Hurwitz formula of §0.0g is a variant kept beside FuchsianOrbifolds Layer 5 item 3 and Tau Ceti's holomorphic form; it differs in being topological and in allowing boundary.
- GroupActionsOnRiemannSurfaces (its open head) still cites SurfaceTopology for classification and mapping class groups. That is its own repair. The ids it cites here (§§5.6, 8.4, 10.1) exist.
- Ownership against MappingClassGroupsAndCanonicalRepresentations (merge-order line 287) was not checked, since no readable folder exists.

## Not verifiable

- Massey, Chapter 1 §§5–7, 10 (§0.0f); Moise, Theorems 6.2–6.4, 8.2, 8.3, 8.5; Munkres, Definition 8.3 and Theorems 10.5–10.6. These are Springer and Princeton books with no legal copy; the README cites them by locator as uncertified.
- Farb–Margalit, Chapters 7 and 8 (§§8.2, 5.4). It is paywalled. The cache copy comes from a third party's course page, which I did not read.
- Kerckhoff 1983, Theorem 1 (§8.2). It is waived in the manifest and cited by locator.

## Source issues

- **Error** in epstein1966 at Theorem 6.4 a), printed page 101: the source requires orientation preservation for "homotopic implies isotopic" only on the plane and the open and closed cylinders; it should also require it on the closed disc, where complex conjugation is homotopic but not isotopic to the identity; affects nothing.
