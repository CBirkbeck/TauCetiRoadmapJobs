# PORT-FinitenessAndDualityOfGroups

## Result

- Branch `roadmap/finiteness-and-duality-of-groups`, head commit `9c048f90`
  ("FinitenessAndDualityOfGroups: roadmap (README, Suggested.lean, metadata)"), on base `e6f6358`.
  The commit touches only `TauCetiRoadmap/FinitenessAndDualityOfGroups/{README.md,Suggested.lean,metadata.toml}`.
- Build, `lake build TauCetiRoadmap.FinitenessAndDualityOfGroups.Suggested`:
  `Build completed successfully (18302 jobs).` 18 warnings, all `declaration uses 'sorry'` (the 18
  theorems); no other warning, no error.
- Gate: `gate FinitenessAndDualityOfGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency direction (`gate --depcheck … --movable`), full output:

  ```text
  depcheck: 245 roadmaps, 2213 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line. The merge order lists CohomologyOfGroups (line 318) and
  SpectralSequencesAndConvergence (line 18) before this roadmap (line 319).

## Draft pull request body

Adds the finiteness and duality of groups roadmap: the homological finiteness and dimension theory
of discrete groups over an arbitrary commutative ring, built on Mathlib's `groupCohomology`,
`groupHomology` and `tateCohomology` and on Tau Ceti's pseudocoherence, finite projective dimension
and Gorenstein-projective objects. It defines the types `FP_n`, `FP_∞`, `FP` and `FL`, proves the
Bieri–Eckmann–Brown criterion by directed colimits and products and the stability of the types
under finite index, extensions, products, amalgams and HNN extensions; develops cohomological,
homological, virtual cohomological and geometric dimension, with Serre's theorem on torsion-free
groups and the Eilenberg–Ganea theorem; develops duality and Poincaré duality groups with their
dualizing module and the duality criterion; defines the Hattori–Stallings rank over group rings and
proves Swan's theorem in its rational and mod-`p` forms; defines the Euler characteristic of groups
of finite homological type and proves its multiplicativity, the equivariant formula for actions on
acyclic complexes and Brown's denominator theorem, through Serre's proper action on a
finite-dimensional acyclic simplicial set and classical Smith theory; and constructs complete
resolutions and Farrell cohomology for groups of finite virtual cohomological dimension, compared
with ordinary cohomology above that dimension and with Tate cohomology for finite groups. No
roadmap owns this material: CohomologyOfGroups excludes finiteness conditions, dimensions, duality
groups, Euler characteristics and Farrell cohomology by name and lists such a roadmap among its
downstream consumers, and the theory is what arithmetic groups, mapping class groups and Fuchsian
and Bianchi groups use when their Euler characteristics, virtual dimensions and duality are stated.

## Roadmaps this one depends on that are still pull requests

- CohomologyOfGroups (§§1.2, 1.4, 1.5, 2.3, 3.2, 3.4–3.6, 4.6, 5.2, 6.1–6.3), every cited id checked
  at its head.
- SpectralSequencesAndConvergence (§§2.1, 3.4, 5.3), checked at its head.

Mentioned only as ownership boundaries or comparison points, never as suppliers (no `*Needs:*`
line, no supplier contract): ArithmeticKTheory §§3.2, 3.4, BianchiModularForms §9.3,
GorensteinHomologicalAlgebra, SheafTheoreticSmithTheory, PosetHomotopyAndSubgroupComplexes (all open
pull requests). The depcheck counts none of them as an edge problem.

SchemeKTheoryOperations (an open pull request) is no longer a dependency: see Supplier replacements.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already satisfied the form: 9 definitions with real bodies
on native carriers, each needed by a stated headline, and 18 headline theorems; no sorry'd data, no
`set_option`, no example, no padding. No headline statable at the pins was missing (checked: 2.8,
4.1, 4.3 and 7.5 are not among the roadmap's end theorems; 6.3, 6.4(b), 6.6, 9.4, the
Grothendieck-group form of 8.5 and 7.3(a) are not statable, see below). Lean changes are docstring
only:

- the old 5.4 is now 5.5 (a new 5.4 was inserted), in the module docstring and in the docstring of
  `exists_acyclic_action_finite_stabilizers`;
- the not-statable entry for 7.3(a) now says that its character form follows from the stated
  7.3(b);
- the not-statable entry for 6.6 says precisely what is missing: the orientation character
  `π₁(M, x) → {±1}` as a homomorphism (Tau Ceti has the local homology system and
  `TauCeti.HomologicalOrientation`, not the monodromy character).

Imports are unchanged: `import Mathlib` and five `TauCeti.*` modules, each present at the pin
`2fd255d` and used (`IsPseudoCoherentOver`, `IsFPD`, `leastENatBound`, `IsEilenbergMacLaneSpaceOne`,
`isGorensteinProjective`).

### Signatures checked mechanically

I put `#check @name` for all 27 declarations after a copy of the file
(`scratch/CheckSigs.lean`), elaborated it once with `lake env lean`, and compared every elaborated
type with its README statement. Every hypothesis is in the declaration's own binders (there are no
section variables); no binder was lost; the README generality equals the Lean generality in each
case (universe `u` for 1.5, 2.1 and 9.2; `Type` for the integral statements). Nothing changed in the
statements.

## Supplier replacements and duplication removals

- **SchemeKTheoryOperations §6.7 → Tau Ceti.** 2.5(a), `hd_R G = sup_i hd_R G_i` for a directed
  union, cited the full colimit identification of SchemeKTheoryOperations §6.7. The inequality `≤`
  needs only that `Hₙ(G, A)` vanishes when every `Hₙ(G_i, A)` does, which is
  `TauCeti.groupHomology.isZero_groupHomology_of_directed`
  (`TauCeti/RepresentationTheory/Homological/GroupHomology/DirectedUnion.lean` line 132, read at
  the pin); `≥` is 2.3(a). The supplier section, the scope bullet and the Layer 2 dependency on
  SchemeKTheoryOperations are deleted; the Tau Ceti declaration is recorded in "Scope and
  ownership" and the Tau Ceti contract.
- **Declared gap closed as a target.** The package depended on a declared gap
  (`simplicial-replacement-dimension`): AlgebraicTopology §8.11a (on main, read) replaces a CW
  complex by an abstract simplicial complex but states no dimension bound. Since main's text cannot
  be waited for, the bounded form is now target **5.4** here, recorded in "Scope and ownership" as
  the variant of §8.11a with the bound of Hatcher2002 Theorem 2C.5, with route, *Needs* (§8.11a,
  Tau Ceti `AbstractSimplicialComplex.dimension` and
  `AbstractSimplicialComplex.barycentricSubdivisionRealizationHomeomorph`, both read at the pin)
  and three computed Checks. The old 5.4 is 5.5; every internal reference (README and the two Lean docstrings) was renumbered. The
  second gap the acceptance named, `order-complex-nerve-realization`, is not used by the package
  README's route (the weakly-increasing-strings simplicial set `K_≤` avoids it) and does not appear.
- **Duplication sweep** (by object, with `roadmaps grep` over main and all open heads, and grep of
  the pinned Mathlib and Tau Ceti): finiteness types, `cd`/`hd`/`vcd`/geometric dimension,
  Eilenberg–Ganea, duality and Poincaré duality groups, Hattori–Stallings rank, Swan's theorem,
  Smith–Floyd theory, Wall's lemma, group Euler characteristics, complete resolutions and Farrell
  cohomology, signed tensor induction of complexes. Hits were all different objects: ProfiniteCohomology
  (continuous cd, compared in 2.8), EtaleCohomologyFoundations §F.10.3 (the trace, consumed),
  ArithmeticGaloisRepresentations §7.1 (continuous tensor induction of representations),
  BordismFormalGroups and GorensteinHomologicalAlgebra (profinite and module-level complete
  resolutions), SheafTheoreticSmithTheory (sheaf Smith theory), CohomologyOfGroups and
  InverseGaloisAndArithmeticFundamentalGroups (Swan's period and conductor theorems, different
  results), GeometricTopology (Smith normal form). Pinned Tau Ceti has `TauCeti.ChainComplex.cap`
  (cap along a given diagonal of complexes), Tate cohomology and `ExtEuler`, none of which is an
  object of this roadmap. No duplication removal was needed. Ownership against open pull requests
  was checked (the closest roadmaps list, the 209 sibling checkouts through `roadmaps grep`/`show`):
  this roadmap is the owner because CohomologyOfGroups excludes these objects by name and no other
  roadmap plans them. No declaration of `Suggested.lean` has the fully qualified name of a
  declaration in another roadmap.

## Fixes a mathematician would flag

1. **6.6 route had a gap.** It said the cohomology with local coefficients of the manifold `M` is
   group cohomology "by ClassifyingSpaces Stage 4 item 17", but item 17 (main, read) is about the
   classifying space. Added the two missing steps: `M` is homotopy equivalent to the classifying
   space (ClassifyingSpaces Stage 3 item 12) and local-coefficient cohomology is homotopy invariant
   (AlgebraicTopology §6.1). Both are now in the supplier contracts, *Needs* and Layer 6
   dependencies. The item 17 contract now describes item 17 accurately.
2. **1.2 FL criterion misattributed.** "By the Eilenberg swindle on the top two terms" is wrong for
   finitely generated modules (the swindle produces infinitely generated free modules). Replaced by
   the actual argument: if `P_m ⊕ RGᵃ ≅ RGᵇ`, add the identity `RGᵃ → RGᵃ` in degrees `m + 1` and
   `m`; conversely the generalized Schanuel lemma. Checked at `m = 0` (the new term sits in degree
   `1`), where the old "top two terms" phrasing did not apply.
3. **1.5 Check notation and argument.** "The element `(1 − 1/j!)_j` of `∏_j Rℚ`" mixed the additive
   group with group-ring notation. Rewritten with basis elements `([0] − [1/j!])_j`, and the
   argument made explicit (`Rℚ/I_S Rℚ ≅ R[ℚ/S]`, so `1/j! ∈ S` for all `j`, impossible for cyclic
   `S`; `R ≠ 0` used).
4. **FreeGroupsAndLimitGroups §4.8 contract overstated.** §4.8 (main, read) is the structure theorem;
   the freeness of a group acting freely is its consequence with trivial stabilizers. Reworded.
5. **Unresolvable downstream citation.** "MotivicStructuresInModuliOfCurves §2.1" is neither on
   main nor in any open pull request (`roadmaps list` and `roadmaps grep` find nothing), so a
   reader of the roadmap repository cannot resolve it. Removed; replaced by a resolvable instance of
   4.1 and 4.3: ArithmeticKTheory §3.4's Check `vcd SL₂(ℤ[i]) = 2`, `H³(SL₂(ℤ[i]); ℝ) = 0` (read at
   its head). This departs from the accepted review's decision to keep the citation; the review's
   point was that the board package exists, which is true but not visible upstream.
6. **Locators at the pins.** `groupCohomology.functor` line 534 (was 532), `groupHomology.functor`
   line 831 (was 829), `CategoryTheory.Limits.piComparison` line 448 (was 443, the docstring),
   `HomologicalComplex.homologyEulerChar` line 154 (was 151, the docstring);
   `Representation.nonempty_equiv_of_character_eq` is line 49 of its file (now "lines 59 and 49").
   Every `name (file line N)` locator was then rechecked by script against the pinned sources; the
   remaining script flags are all "lines A and B" pairs, each verified by hand. "line N–M" → "lines
   N–M" (4 places).

## Adversarial mathematics pass

Values computed by hand; `R ≠ 0` unless stated. `K` is the Klein bottle group, `A = ℤ/4 ∗_{ℤ/2} ℤ/6`.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conv.: action on `Hᵏ(G, RG)` | `G = ℤ`, `k = 1` | `H¹ = RG/(t−1)RG ≅ R` by augmentation; right mult. by `t⁻¹` preserves augmentation, acts as `1` | holds | none |
| Conv.: `FP_n` index | `ℚ`, `n = 0, 1`; shifted model | `FP_0` true (cyclic), `FP_1` false (`ℚ` not f.g.); shifted model makes `FP_0` = "ℚ f.g." = false | index pinned | none |
| Conv.: zero ring | `R = 0`, `G = ℤ/2` | all `Rep 0 G` zero, `cd_0 = hd_0 = 0`, but `cd_ℤ(ℤ/2) = ⊤` | holds | none |
| Conv.: duality map witness | `G = ℤ`, `D = R`, `e = [t]` | evaluation adjunction with `x = 1`: `x ∩ [t] = ⟨x,[t]⟩ = x(t)` | holds | none |
| Conv.: HS rank witness | `G = ℤ/2/ℚ`; `G = ℤ/4/𝔽₃` | `r_P = (1/2, 1/2) ≠ (1,0)`; at `[1]`: `1/4 = 1` in `𝔽₃` equals `δ_{[1]}([1]) = 1` | holds | none |
| Conv.: `χ_ℚ` vs `χ` | `ℤ/2`, `ℤ`, `F_∞` | `χ_ℚ(ℤ/2)=1`, `χ(ℤ/2)=1/2`; `ℤ`: `0, 0`; `F_∞`: finranks `(1,0,…)` give `1/1` and `1/2` for index 2, so `χ = 0` | holds | none |
| Conv.: Farrell indexing | `G = ℤ/2`, `M = ℤ` | `Ĥ⁰ = ℤ/2` (`ℤ^G/Nℤ`), `Ĥ⁻¹ = ker N/I = 0`, `Ĥ¹ = Hom(ℤ/2,ℤ) = 0`, `Ĥ² = ℤ/2` | holds | none |
| 1.1 (a)–(c) | `A = ℤ`, `M = ℚ`, `N_i = ℚ/(1/i!)ℤ`; `A = k[x₁,…]`, `M = k`; `M = 0` | colim `N_i = ℚ/ℚ = 0`, projections nonzero at every stage; `Hom(k, A/(x₁..x_i)) = 0` (x_{i+1} nzd) vs `Hom(k,k) = k`; `M = 0` all conditions | holds | none |
| 1.2 definitions, API | `G = 1`; `G = ℤ`; `ℤ/2` over `ℤ` and `ℚ`; FL criterion at `m = 0` | `0→R→R→0`; `0→R[ℤ]→R[ℤ]→R→0`; `ℤ/2`: `FP_∞` (ℤG noetherian), not FP/ℤ (cd ⊤), FP/ℚ (`R` summand); `m=0`: `0→RGᵃ→P₀⊕RGᵃ→R→0` | holds | FL-criterion wording fixed |
| 1.3 base change | `ℤ → 𝔽_p` on `ℤ[ℤ]` resolution; converse via `ℤ/2` | `0→𝔽_p[ℤ]→𝔽_p[ℤ]→𝔽_p→0` exact; `ℤ/2` FP/ℚ, not FP/ℤ | holds | none |
| 1.4 (a)–(c) | `ℚ`, `F_∞`, `F₂`, normal closure of `b` in `F(a,b)` | not f.g. ⇒ not `FP_1` over `R ≠ 0`; over `R = 0` they are; `F₂` resolution ranks over `ℤG`: `1, 2, 0` (degree-0 term `ℤG` infinite ℤ-rank) | holds | none |
| 1.5 (a)–(e) | `n = 0`; `G = ℚ`, `n = 1`; `R = 0` | `n=0`: colim of invariants injects (directedness); `M_i = R[ℚ/(1/i!)ℤ]`: invariants `0`, colim `R`, `R^ℚ = R`; (e) element `([0]−[1/j!])_j` not in `I·∏Rℚ`; `R=0`: maps `0→0` | holds | Check notation fixed |
| 1.6 finite index | `ℤ/2 × ℤ ⊇ 0×ℤ`; normal closure of `b` | `H` FL ⇒ `G` `FP_∞`; `G` not FP/ℤ (contains `ℤ/2`), FP/ℚ; infinite index: `F₂` FL, subgroup not `FP_1` | holds | none |
| 1.7 extensions, products | `ℤⁿ`; `ℤ/2×ℤ`; lamplighter | product of `n` copies of length-1 resolutions; ext. of `ℤ` by `ℤ/2`; `ℤ/2≀ℤ` 2-generated, quotient `ℤ`, base not f.g. | holds (no converse) | none |
| 1.8 amalgams, HNN | `A`; `BS(1,2)`; `n = 1` | factors and edge finite ⇒ `FP_∞`/ℤ; HNN of `ℤ` over `ℤ` ⇒ `FP_∞`; `n=1` needs `C` of type `FP_0` (always) | holds | none |
| 2.1 cd, hd | `G = 1`, `ℤ`, `R = 0` | `cd_R 1 = 0`; `H¹(ℤ,R) = R ≠ 0` ⇒ `cd = hd = 1`; `R = 0`: `0` | holds | none |
| 2.2 (a)–(d) | `ℤⁿ`, `ℚ`, `ℤ/2`, `G = 1` over `R = 0`, `ℤ²` | `Hⁿ(ℤⁿ,Rℤⁿ) = R`; `hd ℚ = 1 < cd ℚ = 2`; `ℤ/2`: `(ℤG)^G ≠ 0`, `Hᵏ(ℤ/2,ℤG) = 0` (k>0), `cd = ⊤`; `R=0`: no nonzero degree; `H²(ℤ², Rℤ²) = R` | holds | none |
| 2.3 subgroups | `ℤ/2×ℤ ⊇ 0×ℤ` over `ℤ`, `ℚ`; `2ℤ ≤ ℤ` | `cd H = 1`, `cd G = ⊤` (needs `cd G<⊤`); over `ℚ`: index 2 unit, `cd_ℚ G = 1`; `1 = 1`, over `0`: `0 = 0` | holds | none |
| 2.4 extensions | `ℤⁿ`; `ℤ/2×ℤ`; `K` over `𝔽₂` | `Hₙ(ℤⁿ,R) = ΛⁿRⁿ = R`; `⊤+1 = ⊤`; HNN sequence map `x ↦ x − x∘inv = 2x = 0`, `H²(K,𝔽₂) = 𝔽₂` | holds | none |
| 2.5 directed unions | `ℚ = ⋃(1/i!)ℤ`; `F_∞`; `ℤ²` = ⋃ cyclic | `hd = 1`, `cd ≤ 2`, `Ext¹(ℚ,ℤ) = Hom(ℚ,ℚ/ℤ)/ℚ ≠ 0` ⇒ `cd = 2`; `F_∞`: `hd 1`, bound `2`, true `1`; non-directed: `hd ℤ² = 2 > 1` | holds | supplier replaced (Tau Ceti) |
| 2.6 amalgams | `ℤ∗ℤ`; `A` over `ℚ`, `ℤ`; `BS(1,2)` over `R`, `0` | `1`; `max(0,0,1) = 1` (true: infinite ⇒ `cd_ℚ ≥ 1`); `⊤` over ℤ; `max(1,2) = 2`; over `0`: bound `1`, true `0` | holds | none |
| 2.7 finite subgroups | `ℤ/2` over `ℤ[1/2]`, `ℤ/6`; `ℤ/6` over `ℤ[1/2]`; `R = 0`, `ℤ` | `0`; `H²(ℤ/2,ℤ/6) = ℤ/2 ≠ 0` ⇒ `⊤` (`2 ≠ 0` but non-unit); `3` non-unit ⇒ `⊤`; `cd_0 ℤ = 0` with `ℤ` infinite | holds | none |
| 2.8 profinite comparison | `ℤⁿ`, nontrivial finite, `1` | `Hⁿ(ℤⁿ,ℤ/p) = ℤ/p` ⇒ both `n`; `p ∣ |G|` ⇒ both `⊤`; both `0` | holds | none |
| 3.1 signed tensor induction | `H=1`, `G=ℤ/2`, `F = (Rx → Ry)`; contractible `F`; `R = 0`, `H=G=ℤ` | `d s(x⊗x) = s d(x⊗x) = x⊗y − y⊗x`; sign-free defect `2(y⊗x − x⊗y)`; `dh+hd = id` in degrees 0,1,2; equivariant contraction needs `2k = 1`; index stabilizers `1`, submodule stabilizer `ℤ` | holds | none |
| 3.2 Serre | `ℤ/2×ℤ ⊇ ℤ`; `K ⊇ ℤ²`; `ℤ ⊇ dℤ` | `⊤ ≠ 1` (torsion); `2 = 2`; `1 = 1` | holds | none |
| 4.1 vcd | finite `G`; `ℤ/2×ℤⁿ`; `A`; `⊕_ℕ ℤ/2` | `0`; `n` vs `cd = ⊤`; kernel of `A → ℤ/12` (`×3`, `×2` injective, both send the edge generator to `6`) free of index 12, `vcd = 1`; no torsion-free finite-index subgroup ⇒ `⊤` | holds | none |
| 4.2 subgroups, extensions | `ℤ/2×ℤ` | `1 = 0 + 1`; `vcd(ℤ/2) = 0 < 1` while `cd = ⊤` for both | holds | none |
| 4.3 rational vanishing | `ℤ/2×ℤ` over `ℚ`, `𝔽₂`; finite `G` | `cd_ℚ = 1 = vcd`; split ⇒ `Hᵏ(ℤ/2,𝔽₂) ↪ Hᵏ(G,𝔽₂)`, `cd_{𝔽₂} = ⊤`; `0 = 0` | holds | none |
| 4.4 virtual types | finite `G`; `A`; `ℤ/2×ℚ`; `ℚ` | FHT, VFL; VFL via free kernel; `vcd = 2`, `H₁(ℚ,ℤ) = ℚ` not f.g.; not VFP, `vcd 2` | holds | none |
| 5.1 gd | `1`; `F_S`; `ℤⁿ`; finite; `S²` (one 0-, one 2-cell); shrinking wedge | `0`; `1`; `n`; `⊤`; `H₂(S²) = ℤ ≠ 0`, `π₂ = ℤ`; loop around `C_n` not null-homotopic | holds | none |
| 5.2 `cd ≤ gd`, finite complexes | `T²` | resolution ranks `1, 2, 1` ⇒ `cd ≤ 2`, FL | holds | none |
| 5.3 Eilenberg–Ganea | `ℤ³`; `ℤ²`; finite | `gd ≤ 3 = cd`, attained; bound `3`, true `gd 2`; `⊤` | holds | none |
| 5.4 (new) bounded replacement | `N = 0`; `S¹` with 2 cells; `Sⁿ` | discrete ↔ singletons, dim 0; `∂Δ²` (3 vertices, 3 edges) dim 1, dim 0 impossible (`H₁(S¹) = ℤ`); dim `< n` ⇒ ordered chains `0` in degree `n` ⇒ `Hₙ = 0 ≠ ℤ`; `∂Δⁿ⁺¹` dim `n` | holds; bound sharp | new target |
| 5.5 Serre's action | `G` finite, `Γ = 1`; `ℤ/2×ℤ`, `Γ = ⟨t⟩`; `ℤ^{(ℕ)}`; `K` a vertex, an edge, `∂Δ²` | `Z` point, stabilizer order `|G| = [G:1]`; `Z = W×W`, dim `2 = 2·1`, stabilizers `⟨s⟩` on diagonal; `cd = ⊤` ⇒ no such `Z`; `K_≤` normalized ranks `(1)`, `(2,1)`, `(3,3)` with `H₀ = H₁ = ℤ` | holds | renumbered from 5.4 |
| 6.1 duality groups | `ℤ`; finite of invertible order; `R = 0` | `x ↦ x(t)` bijective `R → R`; `M^G → M_G` with inverse `[m] ↦ |G|⁻¹Σgm` (both composites identity); `D = 0` works in every dimension | holds | none |
| 6.2 consequences | `ℤ`; `F_r`, `r ≥ 2`; order of factors at `F₂`; finite | `H¹(ℤ,Rℤ) = R`, `H⁰ = 0`; `D = coker(a ↦ ((s_i−1)a))`; `((s−1)t,(t−1)t)` image of `t` under left-factor map, not under right (forces `a = t`, then `ts = st` false); `H⁰(G,RG) = R·N` | holds | none |
| 6.3 criterion | `ℤⁿ`; `ℤ ∗ ℤ²`; finite over `ℤ` | `Hᵏ(ℤⁿ,Rℤⁿ) = 0` (k≠n), `R` (k=n); free-product sequence embeds `ℤG = H⁰(1,ℤG)` into `H¹` while `cd = 2` | holds | none |
| 6.4 PD groups | `ℤⁿ`; `K`; finite; `F_r` | orientable; `H²(K,ℤ) = ℤ/2 = H₀(K,ℤ_w)` (`t ↦ −1`), orientable model gives `ℤ`; finite PD iff order unit; `F_r` PD iff `r = 1` | holds | none |
| 6.5 finite index, extensions | `ℤⁿ⁺¹`; `K` with `N = ⟨a⟩`; `ℤ/2×ℤ` | `D = R⊗R = R`; `(t·d)(a) = −a`, augmentation `−1` ⇒ `w(t) = −1`; not duality (`cd = ⊤`) | holds | none |
| 6.6 aspherical manifolds | torus; Klein bottle; `S²`; doubled-point circle | orientable; `w(t) = −1`; `R → H₂(1,R) = 0` not bijective in dim 2; non-Hausdorff, `F₂`: `H¹ = ℤ²` vs `H₀(F₂,ℤ_w) ∈ {ℤ, ℤ/2}` | holds | route completed (item 12, §6.1) |
| 7.1 HS rank | `RG`; trivial module `R·e`; `Res RG` from `1` | `δ_{[1]}`; `1/|C_G(g)|` at every class (unit, ≠ 0 for `g ≠ 1`); `r([1]) = |G| = [G:1]·1` | holds | none |
| 7.2 characters | `RG`; trivial `R·e`; `R = ℚ×ℚ`, `P = R·(1,0)`; `ℤ/3` over `ℂ`; `𝔽_p[ℤ/p]` | `[g=1]`; `1/|C|` both sides, `χ_P(g) = 1`; `(1,0)` (Mathlib trace `0`); `ω/3` at `g⁻¹` vs `ω⁻¹/3` at `g`; `χ_P(1) = p = 0` but `r_P([1]) = 1` | holds | none |
| 7.3 Swan, rational | `(ℤG)²`; trivial `ℤ` over `ℤ/2`; `G = 1` | `m = 2 = 2|G|/|G|`; character `1` at generator, `ℚ` not free; `ℚ^m` | holds | none |
| 7.4 Swan mod `p` | `ℤG`; `G = 1`; trivial `ℤ` over `ℤ/p` | `m = 1`; `ℤ_(p)^m` etc.; `dim 1 < p` not free | holds | none |
| 7.5 Hom into `V` | `Γ` finite, `P = ℤΓ`, `V = K`; `Γ = ℤ`, `λ`; trivial `ℤ` over `ℤ`, `λ ≠ 1` | `K^Γ ≅ KΓ` rank 1; `dim = 1 = r·1`; `V^Γ = 0 ≠ 1` | holds | none |
| 8.1 Wall | `F →id F`; `k[x₁,…]`; f.g. free resolution | `D = 0`; `k` not finitely presented ⇒ no `D`; returns itself | holds | none |
| 8.2 finite groups on complexes | `ℤG` in degree 0, `G = ℤ/2`; trivial `ℤ`; rotated circle | `2 = 2·1`, Lefschetz `0`; `1 ≠ 2·1`; `0 = 2·0` | holds | none |
| 8.3 `χ_ℚ`, `χ̃` | `ℤ`; `F_r`; `ℤⁿ`; finite; `ℚ` | `0`; `1−r`; `Σ(−1)ᵏC(n,k) = 0`; `χ_ℚ = 1`, no `χ̃` (cd ⊤); `1 − 1 = 0` | holds | none |
| 8.4 `χ` | finite; `ℤ/2×ℤ`; `A` | `1/|G|`; `0/2 = 0`; `χ_ℚ(F₂)/12 = −1/12` | holds | none |
| 8.5 twisted coefficients | `ℤ`, `λ`; `F₂`; `ℤ/2`; `F₂ ⊇ Γ'` over `ℚ` and `𝔽₂` | `0`; `1−2 = −1`; `1 ≠ 1/2` (FP fails); `H¹ = 2·𝟙 ⊕ sgn` ⇒ `−𝟙−sgn = −[ℚ[ℤ/2]]`; length `1−3 = −2 = −1·2`, traces `0 = 0` | holds | none |
| 8.6 extensions | `ℤ/2×ℤ`; `F₂×F₃`; `K` | `(1/2)·0`; `E₂` dims `1,3,2,6`, totals `1,5,6`, `1−5+6 = 2 = (−1)(−2)`; `0·0` | holds | none |
| 8.7 equivariant formula | `A`; `ℤ/2∗ℤ/3`; free group on tree; `BS(1,2)`; HNN `1` over `1` | `1/4+1/6−1/2 = −1/12` (reversed sign `11/12`); `−1/6`; `1 − r`; `0−0`; `χ(ℤ) = 1−1 = 0` | holds | none |
| 8.8 Smith–Floyd, Brown | 4-cycle with reflection; free swap; subdivided interval; `E(ℤ/2)`; `Δ[0]`; `ℕ` discrete | `0 + 1·2 = 2·1`; `0+0 = 2·0`, `2 ∣ 0`; fixed `c`, point homology; orbits all of size 2 but `χ = 1`; normalized `ℤ` in degree 0 only; `H₀(X^G) = 𝔽₂^{(ℕ)}` excluded | holds | none |
| 8.9 denominators | `A`; `ℤ/2∗ℤ/3`; finite; `ℤ/2×ℤ`; `A` on its tree | `m = 12`, `12·(−1/12) = −1`, largest order `6` gives `−1/2`; `6·(−1/6) = −1`; `|G|·1/|G| = 1`; `2·0`; `Γ'` orbits `3+2 = 5` vertices, `6` edges, `χ = −1` | holds | none |
| 9.1 Gorenstein projective | `G` finite, `H = 1`, field; `H = G`; `ℤ` trivial module | every module GP; projective case; `pd = 1`, not projective, hypothesis fails | holds | none |
| 9.2 complete resolutions | `ℤ/2` periodic complex; `cd < ⊤`; `G = 1` | `ker(1−s) = (1+s)ℤG`, `ker(1+s) = (1−s)ℤG`; contractible; contractible | holds | none |
| 9.3 Farrell cohomology | `ℤ/2`, `ℤ`; `RG`; `G = ℤ` | `ℤ/2, 0, 0, ℤ/2` in degrees `0,−1,1,2`; `0`; `0` | holds | none |
| 9.4 comparison | `ℤ/2×ℤ`; `A`; `ℤ/2`, `n = 0` | `0 → Hᵏ⁻¹(ℤ/2) → Hᵏ(G) → Hᵏ(ℤ/2) → 0` gives `ℤ/2`; kernel of `ℤ/4⊕ℤ/6 → ℤ/2` of order 12 containing `(1,1)` of order 12, so `ℤ/12` (even), `0` (odd); `ℤ → ℤ/2` not injective | holds | none |
| 9.5 Tate | `ℤ/2`, `ℤ`; `1`; `RG` | `ℤ/2, 0, ℤ/2, 0`; `0`; `0` | holds | none |
| Lean defs (`IsOfTypeFPn`, `IsOfTypeFP`, `cohomologicalDim`, `virtualCohomologicalDim`, `HasFiniteHomologicalType`, `IsVirtuallyOfTypeFP`, `geometricDim`, `rationalEulerChar`, `groupEulerChar`) | one satisfying and one failing instance each | `FP_⊤` at `G = 1` / not `FP_1` at `ℚ`; `ℤ` FP / `ℤ/2` not over ℤ; `1` / `⊤` at `ℤ/2`, `0` over `R = 0`; `1` at `ℤ/2×ℤ` / `⊤` at `⊕ℤ/2` (every finite-index subgroup has `cd ⊤`); finite `G` / `ℤ/2×ℚ`; `ℤ/2×ℤ` / `ℚ`; `1` at `ℤ` / `⊤` at `ℤ/2`; `0` at `ℤ`, `1` at `F_∞` (junk, documented); `1/2` at `ℤ/2`, `0` at `F_∞` (two values) and `⊕ℤ/2` (empty) | each determines its object; wrong models (`χ_ℚ` without division, cd as "largest nonzero degree", choice of subgroup) excluded by stated Checks | none |
| Lean theorems: junk values | `exists_int_eq_mul_groupEulerChar` at `m = 0`; `exists_subgroup_card_eq_of_dvd_den` at `k = 0`; `exists_acyclic_action_finite_stabilizers` at `G` finite, `Γ = 1`, `n = 0`; `isGorensteinProjective_opcycles` at `n = 0` | `0·χ = 0 ∈ ℤ`; trivial subgroup, `1 = p⁰`; point, `|G| ≤ |G|`, dim `0 ≤ 3|G|`; `opcycles 0 = R`, GP when `R` projective over `RH` | holds | none |

Context: every Lean statement's hypotheses are in its own binders (checked by `#check @`, above).
Vacuity: every headline names the roadmap's objects (`IsOfTypeFPn`, `cohomologicalDim`,
`geometricDim`, `groupEulerChar`, `isGorensteinProjective` of a syzygy of the trivial
representation), and no hypothesis contains a conclusion.

## Unresolved

- Sources: BrownGTM87 and the other sources the accepted review recorded as uncertified remain
  uncertified; their locators were not text-checked here either.
- `roadmaps resolve` lists BieriEckmann1974 §3.3, BrownGTM87 §VIII.6 and BieriEckmann1973 §1.5 as
  roadmaps found nowhere: these are source keys, not roadmap citations (false positives). It also
  says Lean names outside TauCetiRoadmap were not checked on its host; I checked every cited Mathlib
  and Tau Ceti name against the pinned sources in this worktree (`.lake/packages`, Mathlib
  `1b1ccf4`, Tau Ceti `2fd255d`).
- Nine pinned Tau Ceti modules cited by the README have no built `.olean` in this worktree
  (`PseudoCoherent/RestrictScalars`, `TotallyAcyclic/Abelian/Extension`,
  `TotallyAcyclic/Abelian/Frobenius`, `Exact/Resolution/Complete/Comparison`,
  `MonoidAlgebra/ProjectiveTrace`, `Padics/GroupAlgebra/Swan`, `Padics/GroupAlgebra/Rational`,
  `GrothendieckGroup/Abelian`, `GrothendieckGroup/EulerCharacteristic`); their declarations were
  verified in the pinned source files, not by elaboration. `Suggested.lean` imports none of them.
- No suspicious instructions were found in the package, reviews, other roadmaps or tool output.


Pull request: #2343 (roadmap/finiteness-and-duality-of-groups at 9c048f9)
