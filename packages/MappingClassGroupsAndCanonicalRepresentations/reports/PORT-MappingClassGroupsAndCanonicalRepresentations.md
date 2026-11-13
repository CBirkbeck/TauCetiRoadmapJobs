# PORT-MappingClassGroupsAndCanonicalRepresentations

## Result

- Branch: `roadmap/mapping-class-groups-and-canonical-representations`, created from `42813dd`.
- Head commit: `e40458f3` — "MappingClassGroupsAndCanonicalRepresentations: roadmap (README, Suggested.lean, metadata)".
- Files: `TauCetiRoadmap/MappingClassGroupsAndCanonicalRepresentations/README.md`,
  `TauCetiRoadmap/MappingClassGroupsAndCanonicalRepresentations/Suggested.lean`,
  `TauCetiRoadmap/MappingClassGroupsAndCanonicalRepresentations/metadata.toml` (`topic = "math.GT"`,
  the same form as the folders on main). Nothing outside the folder was touched.

### Build

`lake build TauCetiRoadmap.MappingClassGroupsAndCanonicalRepresentations.Suggested`:

    Build completed successfully (18239 jobs).

Warnings: 6 `declaration uses sorry` (lines 198, 215, 230, 246, 255, 268: the six headline
theorems) and nothing else from Lean. Lake additionally prints, twice, its notice that the file
"imports `Mathlib` from package `mathlib`, which is designed for use with the module system;
consider adding `module` to the start of this file". That is a Lake notice about the import header,
not a diagnostic of the file; the brief prescribes the plain `import Mathlib` header (138 of the 188
`Suggested.lean` files on main use it), so it was left as is.

### Gate

    gate MappingClassGroupsAndCanonicalRepresentations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

### Dependency direction

    depcheck: 215 roadmaps, 1918 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

## Draft pull request body

This roadmap builds the theory of canonical (MCG-finite) representations of surface groups up to
Landesman and Litt's theorem that a representation `π₁(Σ_{g,n}) → GL_r(ℂ)` whose actual conjugacy
class has finite orbit under the mapping class group has finite image as soon as `r² < g + 1`, with
no semisimplicity hypothesis. It adapts the surfaces, Dehn twists, point-pushing, Birman sequence
and capping of MordellLawrenceVenkatesh and GeometricTopology to presented surface groups and pure
based actions, adds the group cohomology of arbitrary discrete groups (transgression, lifting
through finite central isogenies, Artinian deformations with the constancy criterion,
representation schemes and the Jordan identity), and realizes irreducible MCG-finite
representations projectively and then linearly on étale-versal families of pointed curves. The
Hodge-theoretic core (parabolic Deligne extensions, isomonodromy, the mixed Hodge structure on `H¹`
of unitary local systems, the sub-local-system rank bound and its Artinian vanishing form,
nonabelian Hodge theory, rigidity, companions and integrality of rigid local systems) gives the
higher Prym rank bound and the Putman–Wieland property for finite groups of order `< g²`, then the
unitary, semisimple and general finiteness theorems, the free-group and Nielsen-tuple forms, finite
fibral monodromy, algebraic isomonodromy, arithmetic finite monodromy on the generic pointed curve
with its Hodge characterisation, the non-liftability of residual surjections onto `GL_r(𝔽_p)`, and
the examples that show which ranges and hypotheses are needed. `Suggested.lean` states the six
headlines that are statable at the pins (finite image, its free-group and rank-two forms, the
higher Prym rank bound and the two Putman–Wieland theorems) on the presented surface group and its
algebraic pure mapping class group.

## Dependencies that are still pull requests

Cited suppliers that are open roadmap pull requests at the time of the port (all re-resolved at
their current heads in the 2026-11-13T12:04 index): MordellLawrenceVenkatesh, TeichmullerGeometry,
FiniteGroupInvariants, ComplexComparisonPartII, InverseGaloisAndArithmeticFundamentalGroups,
ArithmeticGaloisRepresentations, LanglandsParameterStacks, LocalGaloisDeformationRings,
DeformationAndDerivedPatchingAlgebra, AutomorphicLFunctionsAndLocalFactors, DeligneWeightsAndPurity,
ShimuraData, LefschetzPencilsAndVanishingCycles. NoncommutativeAndEquivariantIwasawa (open) is named
only in Scope as a non-supplier comparison.

- FiniteGroupInvariants is another author's open pull request adding a new roadmap folder and is
  not in the merge order; the brief allows it as a supplier, and the worker should name it in the
  dependency paragraph.
- MixedHodgeModulesAndIrregularHodgeTheory (cited for §§3.1–3.3 and 5.6 in §5.4 and the supplier
  contracts) is neither on main nor an open pull request: it is a board package (merge-order line
  263, before this roadmap at 293) whose last review status is `needs_changes`. The citations were
  checked against that package's README (§3.1 graded-polarizable variations, §3.2 limit MHS, §3.3
  admissibility, §5.6 rigidity with constant local system all match the contract). See Unresolved.

On main: FreeGroupsAndLimitGroups, GeometricTopology, SchemeAndStackFoundations, ComplexCurveModuli,
ResolutionOfSingularitiesCharacteristicZero, AlgebraicTopology, DGFloer, ClassifyingSpaces,
ComplexKahlerGeometry, RepresentationTheory (CharacterTheory, InductionRestriction),
ProfiniteCohomology, Completed/UniversalCovers, Completed/HodgeStructures.

## What moved between the Lean file and the README

Nothing was moved out of `Suggested.lean`: the package file already had the required form (one
docstring, real-bodied definitions on native carriers, five headline theorems, no padding, no
`set_option`, no sorry'd data). Changes:

- **Added a statable headline.** The package docstring listed the higher Prym rank bound
  (Landesman–Litt, Theorem 7.2.1) as not statable ("only as an ad hoc encoding through type
  synonyms of the group algebra"). It is statable with one simple definition:
  `prymIsotypic ϕ σ`, the sum of the images of all linear maps `ℂ^d → Hom(ker ϕ, ℂ)` intertwining
  `σ ∘ ϕ` with the conjugation action `(x · f)(k) = f(x⁻¹ k x)` (Mathlib's `MulAut.conjNormal`), and
  the theorem `higherPrym_rank_bound`: for `H` finite, `ϕ` surjective, `σ` irreducible on `ℂ^d`,
  `Γ' ≤ prymStabilizer ϕ` of finite relative index and `W ≠ ⊥`, `W ≤ prymIsotypic ϕ σ`, `W`
  `Γ'`-stable, `2 * g ≤ finrank W + 2 * d`. Its case of a line is Landesman–Litt Theorem 1.4.2,
  which is therefore described in the docstring and README §6.8 rather than stated separately.
  README §6.1 now defines `prymIsotypic` with four API bullets and four Checks; §6.5 gives the Lean
  form; the summary lists the new end theorem. The definition was tested in a temporary copy
  (not kept): for the trivial quotient and trivial `σ` every class lies in it, and for `ℂ⁰` it is
  `⊥`, both proved.
- **Docstring corrected.** "Mathlib has no …" became "the pins have no …"; the arithmetic headlines
  are not statable because there is no moduli stack of pointed curves over `ℚ` (so the generic
  pointed curve cannot be named), no outer `Γ_K`-action on geometric fundamental groups and no
  polarizable variations, *not* because étale fundamental groups are missing: Tau Ceti has the
  étale fundamental group of a scheme at a geometric point (automorphisms of
  `TauCeti.FiniteEtaleScheme.fiber`, `TauCeti/AlgebraicGeometry/FiniteEtale/Fiber.lean`).
- Three 101-column lines of the package file were rewrapped.

### `#check` pass

All 14 declarations (`surfaceRelator`, `surfaceGroup`, `peripheralLoop`, `pureMappingClassAut`,
`HasFiniteConjugacyOrbitUnder`, `prymStabilizer`, `compactPrymCohomology`, `prymIsotypic`,
`higherPrym_rank_bound`, `putmanWieland_of_irreducible_dim_lt`, `putmanWieland_of_card_lt`,
`mcgFinite_finite_image`, `freeGroup_finite_image`, `rankTwo_mcgFinite_finite_image`) were
`#check @`-ed in one temporary copy of the module, built with the prescribed `lake build` command,
and the file restored. Every elaborated type matches its README statement; the file has no section
`variable`s, every binder is in the declaration's own signature, and none was lost. The same pass
`#check`-ed the cited library declarations (`FundamentalGroup.mul_def`, `FreeGroup.lift`,
`PresentedGroup`, `Subgroup.relIndex`, `Representation.IsIrreducible(.bijective_or_eq_zero)`,
`LinearMap.bijective_or_eq_zero`, `isotypicComponent`, `Representation.ind`,
`groupCohomology.H1InfRes_exact`, `IsCoveringMap`, `MulAut.conjNormal`,
`TauCeti.LocalCoefficientSystem(.monodromyRepresentation, .pullback)`, `TauCeti.IsAspherical`,
`ContRepresentation.IsUnitary.isSemisimpleRepresentation`, `TauCeti.sum_characterDegree_sq_eq_card`,
`TauCeti.groupCohomology.HInfRes_exact`, `TauCeti.groupCohomology.mono_HInfRes_f`, the six
`TauCeti.ContCohomology` names, `TauCeti.TopCat.serreFibrations`,
`TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization`, `TauCeti.TopCat.mem_serreFibrations_proj`).
The Tau Ceti modules for `TauCeti.socle`, `TauCeti.isSemisimpleModule_socle`,
`TauCeti.IsProjectiveRep*`, `TauCeti.isProjectiveRepEquivExtensionHom`,
`MonoidHom.exists_isProjectiveRep_toPGL_eq`, `IsFreeGroup.commute_iff_exists_common_zpow` and
`TauCeti.FreeGroup.nielsenMul` are not built in this checkout; those were confirmed by reading their
source at the pin (`TauCeti/RingTheory/SimpleModule/Socle.lean:42,57`,
`TauCeti/RepresentationTheory/ProjectiveRepresentation/Basic.lean:97`, `PGL/Basic.lean:59,182`,
`SchurMultiplier.lean:149,270`, `Extension.lean:343`, `TauCeti/GroupTheory/FreeGroup/Commuting.lean:58`,
`TauCeti/GroupTheory/FreeGroup/Nielsen.lean:45`).

## Supplier replacements and duplication removals

- **Pinned declaration replaces a roadmap citation.** "AlgebraicTopology Stage 5 item 5 (every
  locally trivial map is a Serre fibration)" in §2.6, the Layer 2 dependencies and the supplier
  contracts is now Tau Ceti `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization`
  (`TauCeti/Topology/Homotopy/SerreFibration/FiberBundle.lean`) with `TauCeti.TopCat.serreFibrations`
  (`…/SerreFibration/Basic.lean`), added to *From Tau Ceti*.
- **Pinned declarations now cited** (they were used implicitly): `IsFreeGroup.commute_iff_exists_common_zpow`
  for the free-group non-inversion argument of §0.2, `TauCeti.FreeGroup.nielsenMul` for the
  transvection among the Nielsen generators of §9.6 (the generation theorem itself is not at the
  pin), Mathlib `MulAut.conjNormal` for the conjugation action of §6.1.
- **Citation precision.** AutomorphicLFunctionsAndLocalFactors "§AL.3, *Leveled shtukas…* and *The
  unramified pure realization theorem*" are §§AL.3.10.13 and AL.3.10.14 at its head; cited so in
  Scope, the contracts, the gap request, §5.9a and the Layer 5 dependencies. AlgebraicTopology
  "Stage k" became "Layer k" throughout (that roadmap maps Stage k to Layer k, so the old form was
  valid; ClassifyingSpaces keeps its own Stage numbering). The IG.1.4 finite-image criterion is a
  Check of §IG.1.4 at its head, and the text now says so. `TauCeti.IsAspherical` is
  path-connectedness plus vanishing `πₙ`, `n ≥ 2` at the pin; the contract had omitted
  path-connectedness.
- **Duplication sweep** (after the edits, by object, `roadmaps grep` over main and all open heads,
  plus the board packages that cite this roadmap): Putman–Wieland, higher Prym, MCG-finite/canonical
  representations, Korkmaz's abelianization — no other owner. Nielsen generation of `Aut(F_N)` — no
  owner on main or open (FreeGroupsAndLimitGroups only uses Nielsen moves on bases); Tau Ceti has the
  elementary automorphisms only. Birman exact sequence — owned by MordellLawrenceVenkatesh §5.20,
  imported; SurfaceTopology mentions it only as out of scope (and is on the never-cite list).
  Chevalley–Weil — owned by GroupActionsOnRiemannSurfaces §7.2 (open, another author); the new
  genus-two Check was written to compute its dimensions directly (Euler characteristic and
  transfer) rather than rely on that formula. Teichmüller theory — TeichmullerGeometry is closed
  genus `≥ 2` only, so §2.3's punctured uniformization is owned here. No restatement had to be
  deleted; "Scope and ownership" needed no new removal entry.

## Fixes made as an upstream reviewer

1. `Suggested.lean`: a statable headline (higher Prym rank bound) was declared not statable; added
   (above).
2. `Suggested.lean` docstring: the claim "no étale fundamental groups of varieties over finitely
   generated fields" is false at the Tau Ceti pin; replaced by the actual missing carriers.
3. Supplier contract for `TauCeti.IsAspherical` described a weaker predicate than the pinned one.
4. §9.3 Check: "no bound better than linear in `g` holds without semisimplicity" was ambiguous; now
   "finiteness fails in rank `2g + 1`: without semisimplicity no range of ranks growing faster than
   linearly in `g` can hold".
5. §2.1 API bullet "passes to subgroups of `H` and to subgroups of finite index containing them in
   both directions" was garbled; now "passes from `H` to every subgroup of `H`, and from a subgroup of
   finite index in `H` back to `H`".
6. Shape: the top-level "Corrections to the sources" section (no roadmap on main has one) became
   `### Corrections to the sources` under References, unchanged in content; the two in-text pointers
   now read "(References, *Corrections to the sources*)".
7. Downstream consumers named concretely: StableReductionPartII §7.14 (it exports the pointed-family
   classifying property in the form §2.2 reads and leaves punctured families, charts, stack
   fundamental groups and mapping-class identifications to this roadmap), NonabelianLevelStructures
   and MotivicStructuresInModuliOfCurves (uniformization and `π₁ = PMod(g, n)`, §§2.3–2.4).
8. New Checks in §6.5: the open-`H¹` puncture quotient has no `Γ′`-stable complement for `g ≥ 1`
   (point-pushing a puncture acts by `x ↦ x ± î(α, x)[cⱼ]`), and the Lean inequality's form without
   truncated subtraction at `g = 1, d = 1`.

I re-read the whole README (all 13 layers, Scope, Conventions, contracts, Worked examples,
Corrections) once more after the edits; the review's non-blocking content (the three gap contracts,
the corrected source statements) is kept unchanged.

## Adversarial mathematics pass

Values computed here; "✓" means both sides agree on the instance. Changes are listed where made.

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| Conventions: twist sign | torus, `î(a,b)=1` | `T_a[b]=[b]+[a]`, matrix `[[1,1],[0,1]]`; `T_b[a]=[a]−[b]`, `[[1,0],[−1,1]]`; MLV §5.12 gives `[[1,−1],[0,1]]`, `[[1,0],[1,1]]` at its head | ✓ inverse conventions |
| Conventions: residue normalization | rank one, `0<a<1` on `ℙ¹∖{0,∞}` | residues `a`, `1−a`; `exp(−2πi·a)` = monodromy; degree `−1` | ✓ matches ComplexComparisonPartII §C5.6 (`τ`, `exp(−2πi Res)`) |
| Conventions: adjoint rank | `r=0,1,2` | `r²−1` = junk `−1`, `0`, `3`; stated for `r ≥ 1` | ✓ |
| §0.1 presentation and transport | `(1,1)`, `(0,3)`, `(1,0)`, `(0,0)` | FGLG relator `a⁻¹b⁻¹ab p₁` ↦ `aba⁻¹b⁻¹c₁` under inversion; `(ab)(a⁻¹b⁻¹ab)(ab)⁻¹ = aba⁻¹b⁻¹`; pants free on `c₁,c₂`, `ℤ²` abelianization; torus `ℤ²`; sphere trivial | ✓ |
| §0.2 `pureMappingClassAut`, non-inversion | `(0,1)`, `(0,2)`, `(1,1)`, `(g,n≥2)` | trivial group (`c₁=c₁⁻¹=1`); `ℤ`: `c₁≠c₁⁻¹`; free group: `hwh⁻¹=w⁻¹ ⇒ h²∈C(w)` cyclic ⇒ `w²=1 ⇒ w=1`; abelianization `[cⱼ]≠−[cⱼ]` | ✓; cites `IsFreeGroup.commute_iff_exists_common_zpow` |
| §0.2 PMod index | `p=3` | index `3! = 6` | ✓ |
| §0.3 `T^{LV}=T⁻¹`, push | annulus substitution `s=1−t` | `dt∧dθ = dθ∧ds`; `θ+2π(1−s) ≡ θ−s` (mod 1 in `θ/2π`); push collar: `ψ` rises on `[−1,−ε]`, falls on `[ε,1]` ⇒ `T_a⁻¹T_b`; genus two closed `[a]=[b]` ⇒ action `x` | ✓ |
| §0.3 pure Birman | `(0,3)`, torus | `1→F₂→PMod(0,4)→1`; torus Push trivial | ✓ `χ<0` needed |
| §0.4 capping | disc, `(1,1,0)`, pants, annulus `(0,2,0)` | `Mod(D²)=1`; kernel `ℤ`, quotient `SL₂(ℤ)`; kernel `ℤ³`; annulus: both boundary twists equal, kernel rank 1 ≠ `b=2`, but `2g−2+b+p=0` excluded | ✓ hypothesis needed |
| §0.5 abelianization | `g=1,r=0`; `g=1,r=1`; `g=2`; `g=3` | `ℤ/12`; `ℤ`; `ℤ/10`; `0` | ✓ finiteness not perfectness |
| §1.1 five-term, transgression | `ℤ/4 ⊃ 2ℤ/4`; `ℤ/2×ℤ/2 ⊃ ℤ/2×0`; `N=G`, `N=1` | nonsplit: `tg=1∈H²(ℤ/2,ℤ/2)=ℤ/2`; split: extends, `tg=0`; identities | ✓; degree-two filtration `F¹/F² = E_∞^{1,1} ⊂ E₂^{1,1}`, `F² = E_∞^{2,0}` = image of inflation |
| §1.2 isogeny obstruction | `r=1`; Klein four in `PGL₂`; `ℤ⊃2ℤ`, `D=μ₂,μ₄` | `μ_D = D`; `diag(1,−1)·[[0,1],[1,0]] = −[[0,1],[1,0]]·diag(1,−1)` so no lift, `Q₈` lifts; `ρ̃(1)²=−1`: `i∈μ₄`, none in `μ₂`; `tg = [−1] ∈ D/D²`: `0` for `μ₄`, `≠0` for `μ₂` | ✓ |
| §1.3 `d_n`, constancy | `n=0,1,2`; `r=1`; `G=N=ℤ`, `[[1,t],[0,1]]` | `R₀=0`; `a+bt ↦ a+bε`; `a+bt+ct² ↦ a+bt+ε(b+2ct)`, kernels `0`; `ad=0`; `H¹(ℤ,sl₂)=sl₂≠0`, not conjugate to constant | ✓ |
| §1.4 representation schemes | `Γ=ℤ/2`, `r=2` with/without `χ`; `Γ=1`; `Γ=ℤ`, unipotent | three components `{I},{−I}`, orbit of `diag(1,−1)` (dim `4−2=2`); `χ=1`: `±I`, ring `ℂ×ℂ` not a domain; point; same image in `M`, distinct actual classes | ✓ |
| §1.5 Jordan identity | `u^m l^m` vs `l^m u^m` in `GL₂(𝔽_p)`; `p=2`, `m` odd; `r=1` | `[[1+m²,m],[m,1]]` vs `[[1,m],[m,1+m²]]`, difference `diag(m²,−m²)`, zero iff `p∣m`; `p=2`: `diag(1,1)≠0`; `jordanBound 1 = 1` (FiniteGroupInvariants §10.5 Checks) | ✓ |
| §2.1 `HasFiniteConjugacyOrbitUnder` | rank 0; finite image; genus-two unipotent | `GL₀=1`, one class; image `F` fixed, homs `G→F` finite; `ρ_f ≅ ρ_{f'}` iff `f'=λf`, `Sp₄(ℤ)` orbit of a primitive line infinite | ✓; API bullet reworded |
| §2.2 versal families | `(0,3)`; constant family; ramified chart | `M_{0,3}=pt`; not dominant when `3g−3+n>0`; `z↦z²` derivative `0` | ✓ |
| §2.3 uniformization | `(0,4)`, `(1,1)` | `π₁=F₂`; stack `SL₂(ℤ)`, effective `PSL₂(ℤ)`, coarse `1` | ✓ |
| §2.4 moduli/Birman | kernel of `PMod(g,n+1)→PMod(g,n)` | `π₁(Σ_{g,n})`; with `PMod(g,n)` second the kernel would be wrong | ✓ |
| §2.5 finite index | `z↦z²`, dense open, point | indices `2`, `1`, `∞` | ✓ |
| §2.6 versal `π₁` | constant `(0,3)`; point | `1→F₂→F₂→1→1`; infinite index | ✓; Serre input now the pinned Tau Ceti theorem |
| §2.7 fibral MCG-finite | pulled-back system | fibre restriction trivial, orbit `1` | ✓ |
| §3.1 closure | `U` on `H⊕ℂ`, `g=0,1` | quotient by line `L` determines `L` (kernel of `q_{L'}=c·T∘q_L` forces `L=L'`); socle `H` (`g≥1`), `ℂ` (`g=0`) | ✓ |
| §3.2 point-pushing restriction | symplectic rep | restriction trivial; intertwiner `ρ(γ)` | ✓ |
| §3.3 rank one | torus; `(0,3)` `c₁↦2,c₂↦1/2` | `χ(a)^k=1` from `T_a^k`; genus zero MCG-finite, infinite image | ✓ `g≥1` needed |
| §3.4 projective extension | `r=1`; `Q₈×C₂` | `PGL₁=1`; `V₄` self-centralizing in `PGL₂`: 4 extensions; intertwiners scalar | ✓ |
| §4.1 pointed killing | `𝔾_m`, `ℤ/2` | squaring pulls back `H¹(ℤ,ℤ/2)` by `×2 = 0` | ✓ |
| §4.2 fibre-prescribed lift | `r=1` | lift = finite character after transgression | ✓ |
| §4.3 versal realization | order-3 character, genus 2 | cover genus `1+3(2−1)=4`; realization image `μ₃` | ✓ |
| §4.4 normal restriction | `G=N×ℤ`, `ρ(n,k)=2^kσ(n)`; `N=G` | `det = 2^{kr}det σ` infinite; image infinite non-unitary | ✓ finite determinant needed |
| §4.5 relative decomposition | `A=ℂ`, `V=π°^*χ`, `χ(1)=e^{2πi√2}`; `V=0` | `U₁=ℂ`, `W₁=χ`; `det` order infinite after any finite index `k`; empty index set | ✓ |
| §5.1 PVHS, integral | quaternion `(−1,3)/ℚ`; very general curve; `ℤ/3` character | `j²=3I`, `ij=−ji`, ramified at `2,3` (disc `6`), split at `∞`; `2 ≥ 2√3` false; `ℤ[ζ₃]` lattice, no `ℤ` lattice | ✓ |
| §5.2 parabolic degree | `ℙ¹∖{0,∞}` character; `O⊕O(1)` with `D=x` | `−1+a+(1−a)=0`; par-deg `1+a`, slope `(1+a)/2 < 1`; `O(1)` induced weight `0`, slope `1` | ✓ |
| §5.3 isomonodromic semistability | `O(p)⊕O(−p)`; `L⊕O` coarsened; canonical | residues `−1,+1`, slopes `1,−1`; `−a` vs `0` and `−1` vs `0`; canonical `0,0`; `par-deg F = deg F + Σ Re tr Res = −iΣ Im tr Res = 0` | ✓ equal-slope hypothesis excludes both |
| §5.4 limit/MHS | rotation by `2π√2`; SS22 example; monodromy `2` | residues `2−√2≈0.586`, `√2−1≈0.414`; extended line `(1,1)`, limit `(1,0)` since `e^{αz}→0`; `|2|≠1` | ✓ |
| §5.4 `H¹` shape | trivial `V`, `n≥2`; `g=2` conjugation | `W₂/W₁` rank `n−1`; `c_V` swaps `H^{1,0}`, `H^{0,1}` (dim 2 each, meet in 0) | ✓ |
| §5.5 rank lemma | `E=O`, `D=0`; rank one | `ρ=g`, `1≥0`; `ρ = g−1−deg E+h⁰(E) ≥ g−1`; equality at `E` nontrivial degree 0 | ✓ |
| §5.6 sub-local-system bound | `g=3`, trivial `V`; `n≥2` | bound `4`, whole `R¹` rank `6`; quotient `n−1` | ✓; `g>rk V ⇒ H⁰=0` since `1 ≥ 2g−2rk V` forces `rk V ≥ g` |
| §5.7 Artinian vanishing | `u,w≥1`, `w+2u≥2g` | `u=1`: `w≥2g−2≥g` (`g≥2`), `g=1`: `w≥1`; `1≤u≤g−1`: `uw ≥ 2u(g−u) ≥ 2(g−1) ≥ g`; graded pieces `W̄⊗m^k/m^{k+1}` | ✓ |
| §5.8 nonabelian Hodge | uniformizing `SL₂` | `dim H¹(ad) = 3(2g−2) = 6g−6 ≠ 0` | ✓ second statement not applicable |
| §5.9 rigidity | `r=1`; reducible fibre | `ad=0`; `π°_* ad ≠ 0`; `r<√(g+1) ⇔ r²−1<g` | ✓ |
| §5.9a companions | `Spec 𝔽_q`; Frobenius `q`; `SO(4)` | `Π=ℤ̂`, dense semisimple image finite; weight `2`, slope `1` vs twist `0,0`; char poly `(x²+1)(x²−x+1)` both, `∧²₊` traces `1+2cos(5π/6)=1−√3`, `1+2cos(π/6)=1+√3` | ✓ |
| §5.10 integrality | `GL₁`; `PGL_r`; monodromy `2`; Kummer on `𝔾_m`; elliptic minus 2 points | finite det ⇒ cyclotomic; trivial abelianization; `1/2` not integral; all cohomology `0`; `h¹=3`, weights `1,1,2`, weight-one part `2` | ✓ |
| §5.11 unitarity | Salem `x⁴−x³−x²−x+1`; `g=0` | `y²−y−3=0`, `y≈2.303,−1.303`, roots `≈1.722, 0.581`, two of modulus 1; `rk<2` | ✓ all conjugates needed |
| §6.1 `prymStabilizer`, `compactPrymCohomology` | `H=1`; torus `ℤ²→ℤ/3`; `g=2`, `ℤ`-quotient; order-3 elliptic | all of `pureMappingClassAut`; `−I` needs `2=1` in `ℤ/3`; infinite-dim vs dim 4; `A³=I`, `J⁻¹A^{−T} = AJ⁻¹ = [[−1,0],[−1,−1]]` | ✓ |
| §6.1 `prymIsotypic` (new) | `H=1`, `σ` trivial; `ℂ⁰`; genus-two double cover; torus double cover; `σ=1⊕1` | everything (proved in Lean scratch); `⊥` (proved); dims `6 = 4 + 2` (`χ=−4`, transfer); torus trivial part `ℂ²`, sign part `0`; sum of constituents | ✓ new Checks |
| §6.2 PW property | genus-zero covers; Marković | `V_K=0`; fails in genus two | ✓ |
| §6.3 boundary replacement | `b=0` | identity; genus `g′` kept | ✓ |
| §6.4 cover monodromy | `H=1` | `f_*ℂ=ℂ` | ✓ |
| §6.5 / `higherPrym_rank_bound` (new) | `g=0`; `g=1,d=1`; `g=3,d=1`; `H=1`, `W` = compact part; puncture quotient | `0 ≤ …`; `2 ≤ dim W+2`; `dim W ≥ 4`; `2g ≤ 2g+2`; push acts `x ↦ x ± î(α,x)[cⱼ]` so fixed classes vanish on `cⱼ` (`g≥1`) | ✓ new Checks |
| §6.6 / `putmanWieland_of_irreducible_dim_lt` | `g=0,1`; `S₃`; `ℤ/5`, `g=2`; `Fin 0` | trivial rep `d=1 ≥ g` so vacuous; needs `g≥3`; applies with `#H=5≥4`; zero rep not irreducible | ✓ |
| §6.7 / `putmanWieland_of_card_lt` | `g=0,1`; `H=1`, `g=2`; `#H=g²` | `#H<0,1` impossible; `1<4`, no fixed class in `H¹(Σ₂)` (`Sp₄(ℤ)` finite index has none); strictness kept | ✓ |
| §6.8 isotypic orbits | `dim σ = g−1`, `= g` | `1 ≥ 2g−2(g−1) = 2` contradiction; `= 0` gives nothing | ✓ |
| §7.1 multitwists | symplectic rep; `PMod(0,4)`; `A₃⊂S₃` | transvection `k=1`; `Γ(2)/±1 ≅ F₂` on two twists, character `2`; restriction `ω⊕ω²` | ✓ |
| §7.2–7.3 boundary monodromy | node `xy=t`; finite image | single twist, unipotent; finite order | ✓ |
| §7.4–7.5 integrality | `r=1`; inverses | `PGL₁=1`; `G_D→PGL_r` finite with kernel `μ_D` | ✓ |
| §7.6–7.7 unitary case | `Σ_{0,3}`, `c₁↦e^{2πiθ}`, `c₂↦e^{−2πiθ}`; `g=1,2` | `c₃↦1`, infinite image, `g=0` allows `r=0` only; `r²<2,3 ⇒ r≤1` | ✓ |
| §8.1 formal constancy | `g=4`, `r=2` | `r²−1=3<4` | ✓ |
| §8.2 algebraic constancy | `A(t)=[[1,t],[0,1]]` | `rank(A(t)−I) = 1` (`t≠0`), `0` at `t=0`; `I` in closure of non-closed orbit | ✓ |
| §8.3 semisimple case | `g<3`; special dihedral `g=1` | `r=1` (§3.3); `4 ≥ 2` outside range | ✓ |
| §9.1 socle | `U`, `H≠0` / `H=0` | socle `H` / `ℂ` | ✓ |
| §9.2 splitting | `a=b=1`; shear | `ab≤r²/4<(g+1)/4`, `3ab<3(g+1)/4≤2g` (`g≥3/5`); `2g−2>1` for `g≥2`; `(x,1)↦(x+1,1)` no fixed lift, `e₂*(x−y,y)=y` fixed covector | ✓ |
| §9.3 / `mcgFinite_finite_image` | `g=0`; `g=1,n=0,r=1`; `U` of rank `2g+1` | `r=0`; `(λ,μ)↦(λ,λ^kμ)` forces roots of unity; `(2g+1)² ≥ g+1` | ✓; Check reworded |
| §9.4 fibral | pulled-back system; `g=3`, `r=1` | trivial; finite-order character | ✓ |
| §9.5 isomonodromy | unpointed torus | outside `2g−2+n>0` | ✓ |
| §9.6 Nielsen | `N=2`, `N=1`; `GL₃` pair | images `[[0,1],[1,0]]`, `diag(−1,1)`, `[[1,0],[1,1]]` generate `GL₂(ℤ)`; `Aut(ℤ)={±1}`; `(I+E₁₃)(I+E₂₃) = I+E₁₃+E₂₃`, conjugate by `e₁↦e₁+e₂` | ✓; cites `TauCeti.FreeGroup.nielsenMul` |
| §9.7 / `freeGroup_finite_image` | `N=0,1,2,3` | `g=0` ⇒ `r=0`; `N=2,3` ⇒ `g=1`, `r≤1` | ✓ |
| §9.8 Nielsen tuples | `(1,λ)`, `λ` infinite order | `d,τ`: `(λ,λ),(λ²,λ),(λ³,λ²),…` infinite | ✓ |
| §9.9 characteristic quotients | `ℤ^N`, `N=1,2` | `(λ,μ)↦(λ,λ^kμ)`; `{2,1/2}` with `g=0` | ✓ |
| §9.10 total image | trivial rep | finite | ✓ |
| §10.1–10.2 arithmetic | `r=1`; modular-curve pullback | finite order; infinite image, `4<g+1` for `g≥4` | ✓ genericity essential |
| §10.3 characterisation | order-3 character | `L=ℚ(ζ₃)`; `ℤ`-lattice reading fails | ✓ |
| §10.4 wider range | `g=3` | `r²<4 ⇒ r=1` vs `r<4 ⇒ r≤3` | ✓ |
| §11.1–11.2 residual | trivial; `p∣m` | trivial lattice; no conclusion | ✓ |
| §11.3–11.4 non-lifting | `r=1`; `n=0`, `bᵢ↦1` | `GL₁(𝔽_p)` cyclic; relation `∏[aᵢ,1]=1` kept, free on `g≥2` | ✓ |
| §11.5 non-density | `r=1`; torus | torsion dense; abelian | ✓ hyperbolic range |
| §11.6 deformation rings | `ℤ_p[[x]]/(p)` | complete intersection, `R[1/p]=0`, not flat | ✓ |
| §12.1 unipotent `U` | `F₀,F₁,F₂` | `1`; `[[1,1],[0,1]]`; `I₃+E₁₃`, `I₃+E₂₃` | ✓ |
| §12.2 Morita | `g=2` | `dim ∧³H = 4 = dim H` | ✓ `g≥3` needed |
| §12.3 augmentation | `(1,1)`; free case | `ℤ²` commutative, log splits; `a⊗b−b⊗a≠0`; `αxα⁻¹ = x+[a,x] mod I³` | ✓ |
| §12.4 Morita pointed | `g=2,3` | `2−2g = −2, −4 ≠ 0` | ✓ |
| §12.5 genus one | `a↦diag(λ,λ⁻¹)`, `b↦J` | `J²=−I`, `JDJ⁻¹=D⁻¹`, traces `(λ+λ⁻¹,0,0)` finite orbit, irreducible, infinite | ✓ |
| §12.6 / `rankTwo_mcgFinite_finite_image` | `g=1`; `g=2,3`; determinant square root | false by §12.5 (excluded by `2≤g`); `4 ≥ g+1`; `ψ:ℤ^k→μ_m` has root in `μ_{2m}` | ✓ |
| §12.7 large rank | `g=8` | `r≥3`, `r² ≥ 9` | ✓ |
| §12.8–12.9 small examples | `F₁`, `λ`; `Σ_{0,4}` `(2,1/2,1,1)` | orbit `{λ,λ⁻¹}`; product `1`, one class, infinite image | ✓ |
| `surfaceRelator`, `surfaceGroup`, `peripheralLoop` | `g=0,n=1`; `g=1,n=0` | relator `c₁` ⇒ trivial group; `aba⁻¹b⁻¹` ⇒ `ℤ²` | ✓ |
| `pureMappingClassAut` | `n=0` | all of `MulAut` (stronger hypothesis than the topological image: index ≤ 2) | ✓ implication direction correct |
| `HasFiniteConjugacyOrbitUnder` | `r=0`; `H=⊥` | always true; `S={ρ}` | ✓ |
| `prymIsotypic` | see §6.1 row | proved ⊤-case and ⊥-case in scratch | ✓ |
| Worked examples | double cover of genus two; Nielsen rank one | `4+2`, both `≥2`; `(λ^aμ^b, λ^cμ^d)` | ✓ |

## Ownership against open work

Every object this roadmap states was searched by object (above). It owns the MCG-finite theory, the
higher Prym/Putman–Wieland theory, punctured Teichmüller uniformization and the moduli comparisons
of Layer 2, the discrete-group transgression and isogeny lifting of Layer 1, and the Hodge targets
of Layer 5 that its suppliers do not plan (real admissible variations without quasi-unipotence,
cohomological rigidity on versal families, companions in `G`-valued form, integrality); the three
gap contracts request the remaining inputs from their named earlier owners. No declaration of
`Suggested.lean` shares a fully qualified name with a declaration of a readable roadmap (the
namespace is `TauCetiRoadmap.MappingClassGroupsAndCanonicalRepresentations`; FreeGroupsAndLimitGroups'
`OrientableSurfaceGroup` is a different declaration in its own namespace, transported here along the
generator inversion because a roadmap module cannot be imported).

Overlaps: the worker's overlap file lists no pull request that changes this roadmap and no dropped
or revision-only id; the closest open roadmaps (MordellLawrenceVenkatesh, TeichmullerGeometry,
InverseGaloisAndArithmeticFundamentalGroups, SheafConvolutionOnAbelianVarieties,
GroupActionsOnRiemannSurfaces) were compared by scope and do not own these objects.

## Unresolved

1. **MixedHodgeModulesAndIrregularHodgeTheory is not yet a roadmap.** It is a board package
   (`needs_changes`) earlier in the merge order; `roadmaps resolve` lists the citation of its §§3.1
   as found nowhere. Its last review asks for a former-numbering table, so its section numbers may
   move. This pull request should wait for that roadmap's pull request (and re-check §§3.1–3.3,
   5.6 at its head), or §5.4 must take over the rational definitions it cites.
2. **Three gap contracts** remain acceptance conditions, unchanged: gap:local-system-direct-images
   (ComplexComparisonPartII §C6.1), gap:curve-companions (AutomorphicLFunctionsAndLocalFactors
   §AL.3.10.13), gap:tame-specialization (InverseGaloisAndArithmeticFundamentalGroups §IG.1.3).
3. **Consumers cite ids this README does not define.** The board packages NonabelianLevelStructures
   and MotivicStructuresInModuliOfCurves cite "MappingClassGroupsAndCanonicalRepresentations §C.0" /
   "C.0/moduli-monodromy"; the content is §§2.3–2.4 here. NonabelianLevelStructures also requests
   gap:punctured-torus-nielsen and gap:asada-cofinality from this roadmap, which the accepted package
   does not plan. These are those packages' to fix (or a Part II here); nothing was added.
4. **Index drift.** The tools' index reports main at `45f58db` while this worktree's base is
   `42813dd`; every supplier pull request cited is still open in that index. The worker should
   rebase before opening the pull request.
5. **Sources.** No source was re-fetched in this port; locators are those of the accepted package,
   whose review read 15 sampled targets and lists 13 settled-uncertified primary texts.
6. Lake's "module system" import notice (see Build).

No passage in the package, its reports or the roadmaps read contained instructions to the port.


Pull request: #2266 (roadmap/mapping-class-groups-and-canonical-representations at e40458f)
