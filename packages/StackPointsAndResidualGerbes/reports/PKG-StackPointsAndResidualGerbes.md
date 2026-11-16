# PKG-StackPointsAndResidualGerbes: package report

Deliverables: `packages/StackPointsAndResidualGerbes/README.md` (2084 lines, 8 layers, 38 targets),
`Suggested.lean`, `metadata.toml` (`topic = "math.AG"`, as SchemeAndStackFoundations and
EquivariantIntersectionTheory on main), `sources.toml` (one `cited_for` reworded). The `gaps` list of
`design/plan.json` is unchanged: its 16 gaps are exactly the 16 `What <Supplier> must provide
(gap:<slug>)` lines of the README, with the same suppliers and sections (script comparison), and
each was rechecked as still unmet at its supplier (below).

The accepted design (review ~14: accepted, no finding) already had the upstream shape, so the README
is the design text with the corrections listed under "Corrections". Every target, Check, API
bullet and worked example of the design is kept: 38 sections for the 38 plan targets, each with at
least as many Checks as the plan has tests and at least three, each with a *Needs* line; every layer
ends with Examples and Dependencies (script).

## Headline theorems

| Headline | README | Status at the pins |
|---|---|---|
| Characterisation of finite type points (closed point of a smooth chart; residual gerbe exists and is locally of finite type) | 1.1, 4.1 | not statable: no algebraic stack, no `|𝒳|`, no smooth or locally-of-finite-type morphism of stacks |
| Inertia criterion for gerbes; dense open gerbe of a reduced stack with quasi-compact inertia | 2.4, 2.6 | not statable: no inertia stack, no gerbe of algebraic stacks (relative gerbes of AlgebraicModuliForArithmeticGeometry §4.1 are not at the pins) |
| Existence of residual gerbes (flat locally quasi-finite presentations, DM and quasi-DM; gerbes; quasi-compact inertia; locally Noetherian) | 4.2–4.4 | not statable: no monomorphism of stacks, no substack, no algebraic stack |
| Closed-point criterion: closed iff the residual gerbe is a closed immersion | 4.5 | not statable: no closed immersion of stacks, no `|𝒳|` |
| Residue field: on a decent stack `𝒵_x` is a gerbe over `Spec κ(x)` | 5.3 | not statable: no decent stack, no gerbe base |
| Algebraicity of points (Lemma 101.50.2, Rydh Theorem B.2) | 5.4 | not statable: no immersion of stacks, no gerbe |
| `𝒵_x ×_{κ(x)} k ≃ BG_x`; neutrality iff some representative has `κ(x) → k` an isomorphism | 6.2, 6.3 | not statable: no classifying stack `BG`, no automorphism group space `G_x` |
| Rational points: `𝒵_x ≃ BG_x`, closed in a locally Noetherian stack at a closed point | 6.4 | not statable: as above |
| Tangent–normal sequence `0 → T_{BG_x} → T_{𝒳,x} → N_x → 0`; `θ_x` iso iff `G_x` smooth | 7.3 | not statable: no algebraic stack, no quasi-coherent ideal on a stack, and no framed deformation functor (AlgebraicModuliForArithmeticGeometry §8.1) |

No headline is stated. The pinned libraries have no algebraic stack: Tau Ceti's
`TauCeti.AlgebraicGeometry.SchPseudofunctor` (`TauCeti/AlgebraicGeometry/Stack/Basic.lean:37`, the
only file of `TauCeti/AlgebraicGeometry/Stack`) is a `Cat`-valued pseudofunctor with no stack
condition; Mathlib's `CategoryTheory.Pseudofunctor.IsStack` is the descent condition alone; Tau
Ceti's `IsAlgebraicSpace` is for presheaves of sets, with no morphism properties of algebraic spaces.
A search of both pins for algebraic stacks, gerbes and residual gerbes finds nothing
(`AlgebraicStack`, `gerbe`, `AlgebraicSpace` in Mathlib: no hit; `gerbe`, `IsAlgebraicStack`,
`algebraic stack`, `residual` in Tau Ceti: only network-flow files). Building the carrier (2-fibre
products, representability by algebraic spaces, smooth atlases, inertia, `|𝒳|`) would be a long ad
hoc encoding of SchemeAndStackFoundations §§1.8, 1.18–1.22, which that roadmap owns. The module
docstring of `Suggested.lean` lists each headline and what it lacks; the file declares nothing,
in the form of `CFSGStatement/Suggested.lean` and `DiagrammaticCoherence/Suggested.lean` on main.

## Elaboration

`lake env lean packages/StackPointsAndResidualGerbes/Suggested.lean`, run from the content
checkout: exit 0, no message. Count of `sorry` warnings: 0 (nothing is stated). No other message.

`#check` comparison: `Suggested.lean` has no declaration, so there is no elaborated type to compare
with a README statement. Instead, a scratch file (`import Mathlib` and the eight cited Tau Ceti
modules whose object files exist) ran `#check @name` on 37 cited library declarations: all resolve
with the full names the README uses. The other cited Tau Ceti declarations
(`TauCeti.AlgebraicGeometry.SchPseudofunctor`, `TauCeti.AlgebraicGeometry.IsRegular.of_flat_of_surjective`,
`TauCeti.linearlyReductiveAffineGroupSchemeProperty`,
`CommHopfAlgCat.isPullback_fppfHomogeneousQuotientTorsor`,
`CommHopfAlgCat.isLocallySurjective_fppfHomogeneousQuotientSheafProjection`) are in modules without
object files and were checked by reading the cited line and the enclosing `namespace` at the pin. All
44 file:line locations of the two supplier contracts were opened at the pins (Mathlib `1b1ccf4b`,
Tau Ceti `2fd255d9`, unchanged in `lake-manifest.json`): each holds the named declaration.

## Corrections to the design text

1. Scope and ownership cited "VirtualFundamentalClasses §1.2", a roadmap that is neither on main nor
   in an open pull request (a board package later in the merge order; the citation resolver lists
   it). The boundary now names that roadmap as a consumer without a section; Downstream consumers
   keeps its §1.2, which exists in the package folder.
2. "Left to other roadmaps" named no owner for the étale slice theorems. Rewritten as "Owned
   elsewhere, and outside the scope", naming AlgebraicModuliForArithmeticGeometry Layers 4–5 and
   SchemeAndStackFoundations §1.23 for what they own, and the slice theorems as outside the scope.
   The Downstream-consumers bullet for a nonexistent "roadmap on the étale slice theorems" is
   deleted.
3. Convention 10 put proposed names in `TauCeti.AlgebraicGeometry.Stacks`; it now says they extend
   SchemeAndStackFoundations' `Stacks` namespace and that `Suggested.lean` declares none of them.
   All proposed names stay in italics, as on main (`*Stacks.ValuativeLift*` in
   SchemeAndStackFoundations §1.20), so no backticked name of this roadmap's own is unmatched.
4. Process wording "every declaration below was read there" replaced by "Declarations and line
   numbers are those of the pinned revision".
5. The Tau Ceti contract said representability of `G/H` is proved only for linearly reductive `H`;
   the pin also proves it for reductive `H` in characteristic zero
   (`Coinvariants.lean:255, 268`, `GeneralLinear.lean:56`). Corrected; the gap is unaffected (`G_x`
   need not be reductive, nor the field of characteristic zero).
6. 4.3 used `𝒵^♭_x` both for the residual space of `𝒳^♭` and (in 3.4) for the base of `𝒵_x`. It now
   names the residual space `Z`, says why `(𝒳 ×_{𝒳^♭} Z)_red = 𝒳 ×_{𝒳^♭} Z` and why `Z` is the base of
   `𝒵_x` (3.4's pullback formula and 2.1's uniqueness of the base), and adds 3.4 to the *Needs* line.
7. 5.1's fourth Check said that pulling `X × BG_k → BG_k` back along `Spec k → BG_k` "recovers the
   diagonal of `X`"; the base change is `X → Spec k` (whose failure of quasi-separatedness is the
   point). Corrected.
8. Downstream consumers quoted another roadmap's gap slug (`gap:zero-dimensional-dm-residual-gerbes`)
   as a `gap:` token; it is now described in words, so the README's `gap:` tokens are exactly its
   own 16.
9. `sources.toml`: `rydh2015`'s `cited_for` said "not cited by the design"; reworded, and it now
   records that Appendix B (algebraicity of points) is in `rydh2011` (checked: `rydh2015` never
   mentions residual gerbes; `rydh2011` line 1227 is Appendix B).

Nothing the README states was found false, so no statement was weakened or deleted.

## What the README could not support

Nothing. Every target has its locator in a text the manifest records as certified, apart from
`lmb2000` and `olsson2016` (settled as uncertified; cited by locator only). No source was fetched
and `needs-references.toml` was not written: every text needed is in the sources cache.

## Notions moved down from later roadmaps

None. The roadmap consumes only SchemeAndStackFoundations (main), ReductiveGroups (main) and
AlgebraicModuliForArithmeticGeometry (open, line 36 of the merge order, directly above this
roadmap at line 37).

## Duplication sweep and ownership

Removals: none. No definition or theorem of this roadmap exists elsewhere.

- Pinned libraries: no algebraic stack, gerbe of stacks, residual gerbe, decent stack, closed
  substack, finite type point, monomorphism of stacks or normal space at a point of a stack (search
  above). Scheme cases are cited from Mathlib in the contracts (`Scheme.residueField`,
  `IdealSheafData.vanishingIdeal`, `.subscheme`, `LocallyOfFiniteType.jacobsonSpace`).
- Main and all 450 open roadmap pull requests, searched by object with `roadmaps grep -i`:
  `residual gerbe` (users only: FunctionFieldArithmeticPartII, LanglandsParameterStacks §1.16
  Checks), `residualGerbe`, `decent (algebraic )?stack`, `finite type point`,
  `reduced induced closed substack`, `IsGerbeOver`, `gerbe over (a|an|its|the) (algebraic
  space|residue field|field)`, `monomorphism of algebraic stacks` (no match anywhere), `quasi-DM`
  (FunctionFieldArithmeticPartII, a user), `dense open gerbe` (no match), `normal space` (other
  meanings: normal bundles, normed spaces), `closed substack` (users of particular closed substacks
  of their own stacks: AlgebraicModuliForArithmeticGeometry §5.4's schematic closure,
  ModularCurvesPartII, LocalGaloisDeformationRings, HeckeStacksAndLocalShtukas,
  VirtualFundamentalClass §2.1 and others; none defines closed substacks of an arbitrary algebraic
  stack).
- Closest roadmaps of `scratch/overlaps.md`, scope read: SchemeAndStackFoundations (main and its open
  revision: the 19 cited headings are identical, no gerbe of stacks, decency, quasi-DM, monomorphism
  or substack theory; `quotientStack_algebraic` is for groupoid schemes, so
  gap:flat-groupoid-quotients stands), AlgebraicModuliForArithmeticGeometry (gerbes on a site
  §4.1, deformations §§8.1, 8.3; no statement that algebraic stacks satisfy (RS), so
  gap:algebraic-stacks-satisfy-rs stands), GroupSchemesOverABase (no stack objects in its scope),
  NashBlowups (normalisation of DM stacks only), VirtualFundamentalClass (open, another author:
  imports stacks from SchemeAndStackFoundations, owns stack dimension, which this roadmap does not
  use), EquivariantIntersectionTheory (main: quotient-stack Picard and Chow groups).
- ReductiveGroups Layer 3 (main) leaves representability of `G/H` "a theorem with hypotheses", so
  gap:homogeneous-quotient-scheme asks for nothing it has.

Ownership is this roadmap's for the objects in its Scope section: the search shows no other owner on
main or in an open pull request. One package on the board, VirtualFundamentalClasses (later in the
merge order), defines closed substacks and reduced induced structures in its own §1.2; that package
should cite 0.3–0.5 here. Only that package can change.

## Citations

`roadmaps resolve` on the final README (main `0a79ce7`, 450 open heads): no cross-roadmap citation
and no Lean name found nowhere. Checked by hand at the copies named:

- SchemeAndStackFoundations on main: §§1.2, 1.7–1.9, 1.12–1.23, 4.8, 4.12, 4.13 headings, and 44
  contract names searched one by one (`points_atlas_surjective` … `generic_flatness`), all present; dotted names
  such as `IsDeligneMumford.iff_unramified_diagonal` and `Stacks.points.pullbackSurjective` occur
  there as `.iff_unramified_diagonal` and `.pullbackSurjective` under their parents (§§1.19, 1.20).
  The Checks of §§1.7, 1.21 and 1.22 cited in this README exist.
- AlgebraicModuliForArithmeticGeometry at its open head: §4.1 (`IsGerbe`,
  `IsGerbe.equivalence_iff`, `relativeGerbe`, `relativePullback`, `relativeComposition`,
  `relativeDescent`), §8.1 (`deformationGroupoid`, `deformationFunctorOfPoint`,
  `stabiliserActionOnDeformations`), §8.3 (`FramedDeformation`, `framedDeformation_twoFibre`,
  `framedTangent_exactSequence`); §8.3's reframing is `α ∘ g`, as Convention 5 says.
- ReductiveGroups on main: Layers 1, 3 and 3A.
- Consumers: LanglandsParameterStacks (open, §1.16 Checks mention the residual gerbe),
  FunctionFieldArithmeticPartII (open, its README line 53 asks for the zero-dimensional statement),
  MotivicStructuresInModuliOfCurves §§7.3, 8.4, 8.6 and VirtualFundamentalClasses §1.2 (board
  packages, later in the merge order).

## Dependency check

    depcheck: 237 roadmaps, 2242 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The roadmap sits at line 37 of the merge order, directly after
its last supplier AlgebraicModuliForArithmeticGeometry (line 36). The overlaps tool cannot run on
this name (no roadmap of this name on main or in a pull request yet); the worker's
`scratch/overlaps.md` lists no dropped id, no revision-only id and no conflicting pull request.

## Adversarial pass

Values computed in this pass, one row per statement. "Same" in the last column means the design text
is kept unchanged.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Conv. 4 (substacks as subcategories) | `Spec k ⊔ Spec k` | `Spec k ⊔ ∅` and `∅ ⊔ Spec k`: equivalent stacks, object sets disjoint over `Spec k` | holds | same |
| Conv. 5 (left action `α ∘ g⁻¹`) | `[𝔸¹/𝔾_m]` at `0`; left-action law | `g·(h·(τ,α)) = (τ, α∘h⁻¹∘g⁻¹) = (gh)·(τ,α)`; `(τ_b, α∘λ⁻¹) ≅ (τ_{λb}, α)` via `λ`, weight `+1`; `t ↦ λ⁻¹t`, conormal weight `−1`, `N_0` weight `+1`; Alper's `(τ, g∘α)` (alper-moduli line 6950) frames the other way and agrees | holds | same |
| Conv. 6 (indexing `ℐ^{n+1}`) | `𝔸¹`, origin | `k[t]/(t²)` length 2; with `ℐ^n`: `V(ℐ⁰) = ∅` | holds | same |
| Conv. 7 (residue field) | `t² + 1` on `𝔸¹_ℚ` | `ℚ[t]/(t²+1) = ℚ(i)`; `t ↦ i` gives `ℚ(i) ⊂ ℂ` | holds | same |
| Conv. 9 (`QCoh(BG) ≃` comodules) | `G = 𝔾_m` | descent datum on `V` over `G ⇉ Spec k` = coaction `V → V ⊗ k[λ^±]`, i.e. a `ℤ`-grading | holds | same |
| 0.1 smooth-local properties | `Bμ_p/𝔽_p`; `[Spec k[t]/(t²)/𝔾_m]`; `Spec k[x,y]/(xy)` | atlas `𝔾_m → Bμ_p` (torsor `t ↦ t^p`), fibre over `Spec 𝔽_p` is `𝔾_m`, smooth, regular; flat point has fibre `𝔽_p[λ]/(λ−1)^p`, length `p`, nonreduced; atlas `k[t]/(t²)` nonreduced; `dim 𝔪/𝔪² = 2 > 1` at the node, reduced | holds | same |
| 0.2 monomorphisms, rigidity | `Spec k → BG`; `Spec ℂ → Spec ℝ`; `Spec k → Spec k[ε]`; `X₁ = U/G` | fibre square `G ≠ Spec k`; `ℂ ⊗_ℝ ℂ ≅ ℂ × ℂ`, two points; mono, not iso, target not a field; `V ×_T V = V ×_k V` from `T ×_k T = T`, so `V → Spec k` étale by descent along the fpqc `V → Spec k` | holds; field target needed | same |
| 0.3 immersions, substacks | `[𝔸¹/𝔾_m]`; generic point of `𝔸¹`; `Spec k ⊔ Spec k` | invariant `{0}` ↔ `B𝔾_m`, `𝔾_m` ↔ `Spec k`; complement of `{η}` is the infinite set of closed points, not closed, so `{η}` not locally closed; factorisation through `Spec k ⊔ ∅` only | holds | same |
| 0.4 ideals, neighbourhoods | `𝔸¹`, origin, `n = 0, 1, 2`; `Spec k[ε]`; `Spec(k × k)` | lengths `1, 2, 3`; `ℐ = (ε)`, `ℐ² = 0`, `𝒳^{[n]} = 𝒳` for `n ≥ 1`; all-modules kernel `T ↦ tO(T)`: `(t)` over `id`, `0` over the origin, QCoh kernel value `k·t ↦ 0`; split case: kernel `O(T₂)` both ways | holds | same |
| 0.5 reduced induced substack | `Spec k[ε]`; `k[t]/(t²)` vs `k` in `𝔸¹`; `t ↦ ε` | `(k[ε])_red = k`; same support `{0}`, only `k` reduced; `t ↦ ε ≠ 0`, no factorisation through `V(t)` | holds; reduced source needed | same |
| 1.1 finite type points | `η ∈ 𝔸¹_k`, `K = k(t)`; `Spec ℚ ⊂ Spec ℤ_(p)`; `Spec ℚ̄ → Spec ℚ` | integral equation for `1/t` times `tⁿ` gives `1 ∈ (t)`; `ℚ = ℤ_(p)[1/p]`; `[ℚ̄:ℚ] = ∞`, so not finitely generated (Zariski); Lemma 101.18.1 read (stacks-06RD lines 1549–1554) | holds | same |
| 1.2 points of objects | `B(ℤ/2)_ℝ`; `Spec ℚ(i)`; `𝔸¹_ℝ` | `|H¹(ℝ,ℤ/2)| = |ℝ^×/ℝ^{×2}| = 2` objects, 1 point; `σ∘id = σ = id∘σ`, while over one `ι`: `ι(i) ≠ ι(−i)`; `t²+1` has no real point | holds | same |
| 1.3 `G_x` | `Bμ_p`; `B(μ_3)/ℚ`; `[𝔸¹/𝔾_m]` | `μ_p(𝔽̄_p) = 1`, `μ_p` nonreduced; `μ_3(ℚ) = 1`, `μ_3(ℚ(ζ_3))` order 3; `G_0 = 𝔾_m`, `G_1 = 1` | holds | same |
| 1.4 `G_x` a scheme | `B(𝔸¹/ℤ)` char 0; `Bℤ`; `B𝔾_m` | diagonal of `𝔸¹/ℤ` pulls back to `⊔_ℤ 𝔸¹ → 𝔸²`, image dense without generic point, not locally closed, not qc; `G_x = ⊔_ℤ Spec k` étale not qc; Prop. 79.10.3 (separated group space over a field is a scheme) and Lemma 79.9.4 (decent ⇒ separated) read | holds | same |
| 2.1 gerbes, base | `[𝔸¹/𝔾_m] → Spec k`; `Spec k → BG` | objects `0`, `1` over `k̄` lie in different points; `Aut` of trivial torsor `G(T)` does not lift to trivial automorphisms | holds | same |
| 2.2 section ⇒ `BG` | `[𝔸¹/𝔾_m]`, section `1`; `BS₃/ℝ` | `Isom(1,1) = 1`, `[Spec k/1]` one point vs two; `H¹(ℝ,S₃)` = 2 classes (identity, transposition) | holds; gerbe needed | same |
| 2.3 local structure, smoothness | `Bμ_p → Spec 𝔽_p`; `Spec k → B𝔾_m` | base change of `Spec 𝔽_p → Bμ_p` to itself is `μ_p`, flat degree `p`, not smooth; diagonal `Spec k → 𝔾_m` unit section, codimension 1, not flat | holds | same |
| 2.4 inertia criterion | `[𝔸¹/𝔾_m]`; `Bμ_p` | stabiliser `k[t][λ^±]/(t(λ−1))`: `λ − 1` is `t`-torsion, not flat over `k[t]`; `μ_p` finite flat | holds | same |
| 2.5 diagonal criterion, homeomorphism | `Spec k → Spec k[ε]`; `Bℤ` | `Tor₁^{k[ε]}(k,k) = k ≠ 0`, not flat, yet a universal homeomorphism; `Spec k ×_{Bℤ} Spec k = ⊔_ℤ Spec k` not qc | holds; converse fails | same |
| 2.6 dense open gerbe | weights `pⁱ`; `[Spec k[ε]/𝔾_m]` | stratum `x₀=…=x_{i−1}=0≠xᵢ`: `⋂_{j≥i, x_j≠0} μ_{pʲ} = μ_{pⁱ}`, `i = 0` trivial; `λ−1` kills `ε`, nonzero mod `ε`, not flat | holds; reducedness needed | same |
| 3.1 reduced one-point stacks | `Spec k[ε]`; `X₁` | one point, nonreduced; `ℚ̄ ⊗_ℚ ℚ̄` absolutely flat, local rings `ℚ̄`, so `Spec ℚ̄ → U` flat; lfp would make the ideal generated by an idempotent, the point open, but `|U| ≅ Gal(ℚ̄/ℚ)` has no isolated point | holds | same |
| 3.2 rigidity in one-point stacks | `X₁`; `Spec k → BG` | core of `X₁` is `Spec ℚ̄ ≠ X₁`; not mono since `G ≠ Spec k` | holds | same |
| 3.3 residual gerbe | scheme point; `Spec k[ε]`; `Spec k → BG` | `Spec κ(x)`; `Spec k`, not `Spec k[ε]`; not mono | holds | same |
| 3.4 properties | node of `k[x,y]/(xy)`; `X₀ = Spec ℚ(t)/ℤ`; `[𝔸¹/𝔾_m] → Spec k` | `Spec k` regular; free action (`φ(t+n) = φ(t)` forces `n = 0` in a `ℚ`-algebra), `ℤ × Spec ℚ(t)` infinite vs finite étale; pullback of `Spec k` is the whole stack | holds | same |
| 3.5 functoriality | `Spec k → B(ℤ/2)`; `Bμ_p → Spec 𝔽_p` | 2 points vs 1; length `p` vs 1; `G = 1` identity | holds | same |
| 4.1 finite type points | `1 ∈ [𝔸¹/𝔾_m]`; `η ∈ 𝔸¹`; `ℤ_(p)` | open immersion; `Spec k(t)` exists, not lft; `Spec ℚ` finite type | holds | same |
| 4.2 flat qf presentations | `Bμ_p`; `B(ℤ/2)`; `𝔸¹_ℚ/ℤ`; `B𝔾_m` | `R' = μ_p`, degree `p`; `Ω_{μ_p} = 𝔽_p[λ]/(λ−1)^p dλ ≠ 0`, not DM; generic residual space `X₀`; stabiliser `𝔾_m` not qf | holds; sufficient only | same |
| 4.3 gerbes, qc inertia | `[𝔸¹/𝔾_m]`; `Bℤ`; `B(𝔸¹/ℤ)` | any nonempty open of `cl{1} = |𝒳|` contains `1`; `Bℤ` a gerbe; inertia `𝔸¹/ℤ` qc (image of `𝔸¹`), not qs | holds | notation `Z`; *Needs* + 3.4 |
| 4.4 locally Noetherian | `X₀`; weights `pⁱ`; `X₁` | atlas `Spec ℚ(t)` Noetherian; `k[x₀,…]` not; `X₁` by 4.1 | holds | same |
| 4.5 closed points | `[𝔸¹/𝔾_m]`; DVR `R`; `X₁` | `B𝔾_m` closed, `Spec k` open not closed; `Spec R/𝔪` closed, `Spec R[1/π]` open; in `X₁` a closed immersion with full support onto reduced `X₁` would be an iso (0.5), contradicting 0.2; Lemma 101.51.4 read (stacks-06RD lines 4870–4878) | holds | same |
| 5.1 decency | `B𝔾_m`; `X₀`; two copies of `Spec k[x₁,…]` glued along `⋃D(xᵢ)` | fibre `𝔾_m` affine; `⊔_ℤ Spec ℚ(t)` not qc; prime `(x_{i₁},…,x_{iₙ}) ∈ D(x_j)` misses `D(x_{i₁}) ∪ … ∪ D(x_{iₙ})`; base change of `X × BG → BG` along `Spec k → BG` is `X → Spec k` | holds | Check wording |
| 5.2 factorisation | `id_{𝔸¹}`; `t ↦ ε`; profinite `Y/Γ` | image `𝔸¹ ≠ {η}`; `ε ≠ 0`; Lemma 101.51.2 (1)–(4) read (stacks-06RD lines 4842–4849) | holds; each hypothesis used | same |
| 5.3 residue field | `X₀`; `t²+1`; `[Spec ℂ/(ℤ/4)]/ℝ` | base of `X₀` not a field; `ℚ(i)`; `Hom(ℤ/2,ℤ/4) = {0,2} ↦ {0,0}` in `Hom(ℤ/2,ℤ/2)`, no real object, base `Spec ℝ` | holds; decency needed | same |
| 5.4 algebraicity of points | `[𝔸¹/𝔾_m]`; `η ∈ 𝔸¹`; glued scheme; `𝔸¹_ℚ/ℤ` | `𝒵 = B𝔾_m/Spec k`, `Spec k`; `Spec k(t) → 𝔸¹` affine, not an immersion; coefficient of `t^{d−1}` in `P(t+n)` is `a + dn ≠ a` for `n ≠ 0`, no finite stable set, so no proper nonempty open | holds | same |
| 5.5 fppf image | `Spec κ(t) → Spec κ`; `Spec k̄ → BG_k` | `κ(t)` not finitely generated; fppf cover point has residue field finite over `κ`, cannot receive `κ(t)` or infinite `k̄` | holds | same |
| 6.1 representative groupoid | `BG`; `Spec κ`, `k/κ` Galois `Γ`; `[𝔸¹/𝔾_m]` at `0` | `R_x = G`; `k ⊗_κ k ≅ ∏_{σ∈Γ} k`, only `σ = id` on the diagonal, `G_x = 1`; `R_x = 𝔾_m` | holds | same |
| 6.2 base change to `BG_x` | `BG`, `G = ℤ/2, μ_p, 1`; `η ∈ 𝔸¹`; `X₀` | three products: one point with `|Aut| = 2` / one point / two points; `R_x` length `p`; all `Spec k`; `Spec K = B1` both sides; `X ×_X Spec ℚ(t) = Spec ℚ(t)` | holds; source's hypotheses unused | same |
| 6.3 neutrality | `[Spec ℂ/(ℤ/4)]`; `B(ℤ/2)_ℝ`; `(t,−1)/ℚ(t)`, `σ: t ↦ t²` | not neutral; neutral; tame symbol at `t=0`: `(−1)^{0}·t⁰/(−1)¹ = −1 ∉ ℚ^{×2}`, `σ^*A = (t²,−1)` split | holds | same |
| 6.4 rational points | `Bμ_p/𝔽_p(t)`; `k/κ` finite nontrivial; origin of `Spec k[x₀,…]` | `𝒵 = Bμ_p = BG_x`, `μ_p` not smooth; `Spec κ` vs `Spec k`; closed immersion, lft, not lfp, `𝒵 = Spec k` | holds | same |
| 7.1 neighbourhoods of a point | `𝔸²`; `BG`; `[𝔸¹/𝔾_m]` | `k[x,y]/(x,y)²` basis `1,x,y`, length 3; ideal `0`; `[k[t]/(t^{n+1})/𝔾_m]` | holds | same |
| 7.2 normal space | `[𝔸ⁿ/GLₙ]`; `BG`; `𝔸²` | `ℐ/ℐ²` = coordinates = dual of `kⁿ`, `N_0 = kⁿ`; `N = 0`; `k²` trivial | holds | same |
| 7.3 tangent–normal sequence | `Bμ_p`; `[𝔸¹/μ_p]` char `p`; cusp; `B𝔾_m` | `(dim T_{BG}, dim T, dim N) = (1,1,0)`; torsors `z^p = 1+aε`, weight-one functions `k[ε]·z`, map `t ↦ bεz`, framed isos `z ↦ (1+cε)z` fix `(a,b)` as `(1+cε)^p = 1`: `(1,2,1)`; cusp `(0,2,2)`; `dim Lie − dim = 1−1 = 0`, `Pic(k[ε]) = 0` | holds | same |
| 7.4 quotient stacks | `SL₂` on binary forms at `uv`; `𝔾_m` at `1`; `E × 𝔾_m`; `ℤ` on `(ℤ×𝔸¹) ⊔ 𝔸¹` | `[[0,c],[b,0]]`, `det = −bc = 1`, `uv ↦ bc·uv = −uv`: stabiliser the torus, orbit dimension `3−1 = 2`; orbit `𝔾_m` not closed; `N = k∂_t`; `(n,t) ↦ (t,t+n)` not qc, `N = ℚ∂_t` | holds | same |
| Worked example (0-dim DM) | `Bℤ/K`; `B(ℤ/2)` | `G_x = ℤ` infinite, diagonal not qc; finite type representative has `[k:K] < ∞`, `K` closed, `k = K` | holds | same |
| Supplier note (Tau Ceti `G/H`) | the pin | `Coinvariants.lean:219` (linearly reductive), `:255, 268` (reductive, `CharZero`), `GeneralLinear.lean:56` | the design understated it | corrected |

Context: no Lean statement exists, so no `variable` block can drop a hypothesis. Generality: the
README's statements are at the generality of the Stacks Project, and no Lean signature narrows them.
No Check contradicts a theorem of its section; the Checks on `X₀`, `X₁`, `Bμ_p`, `[𝔸¹/𝔾_m]` and
`[Spec ℂ/(ℤ/4)]` give the same values wherever they recur (0.2, 3.1, 3.2, 3.4, 4.2, 4.4, 4.5, 5.1,
5.3, 6.2, 6.3).

## Notes for human reviewers

- The accepting review's ownership note stands: the VirtualFundamentalClasses package defines
  closed substacks and the reduced induced structure in its §1.2, which this roadmap owns for every
  algebraic stack (0.3–0.5); only that package can change.
- FunctionFieldArithmeticPartII states the zero-dimensional statement without the quasi-compact
  diagonal that `Bℤ` shows necessary; this README's worked example has the corrected form.
- Licences, as the review noted: `alper-moduli` is an author's draft (CC BY-NC-ND 4.0), cited by
  locator beside Stacks Project or journal sources; `sga3-vi-a` is read in the editors' online
  re-edition.

No text read in this job contained instructions; nothing suspicious to quote.
