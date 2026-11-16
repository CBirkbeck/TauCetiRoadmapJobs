# PORT-StackPointsAndResidualGerbes

Branch `roadmap/stack-points-and-residual-gerbes`, head commit
`3688535b9e38b6dff4a662f09acfe0acc8ce7b83` (one commit on `51d880d`,
"StackPointsAndResidualGerbes: roadmap (README, Suggested.lean, metadata)"). The commit adds
`TauCetiRoadmap/StackPointsAndResidualGerbes/{README.md,Suggested.lean,metadata.toml}` and touches
nothing outside the folder.

## Checks

**Build.** `lake build TauCetiRoadmap.StackPointsAndResidualGerbes.Suggested`:

    ✔ [18238/18239] Built TauCetiRoadmap.StackPointsAndResidualGerbes.Suggested (5.7s)
    Build completed successfully (18239 jobs).

Warnings: 0. The file declares nothing, so there is no `sorry` warning either.

**Gate** (on the committed tree):

    gate StackPointsAndResidualGerbes: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

**Dependency check** (`gate --depcheck … --movable`):

    depcheck: 240 roadmaps, 2252 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line. The suppliers are SchemeAndStackFoundations,
AlgebraicModuliForArithmeticGeometry and ReductiveGroups, all three on main. No notion was moved down
from a later roadmap.

**Citations.** `roadmaps resolve` on the ported README: no cross-roadmap citation and no Lean name
found nowhere. The 9 leads in `scratch/citations.md` are SchemeAndStackFoundations names, written
there under their parent namespace. All of them exist on main: `Groups.GroupSpace` §1.13,
`Groups.IsTorsor` §1.15, `.iff_unramified_diagonal` §1.19, `SmoothLocal.atlas_independent` §1.20,
`Spaces.EtaleLocal` §1.8, `Stack.stackification` §1.18, `Stacks.points.pullbackSurjective` §1.20,
`actionQuotient.torsorEquiv` §1.21, and AlgebraicModuliForArithmeticGeometry §4.1
`IsGerbe.equivalence_iff`.

**`#check` comparison.** `Suggested.lean` declares nothing: one module docstring and an empty
namespace. No scratch `#check` file was needed, and no elaborated type can differ from the README.

## Draft pull request body

This roadmap develops the local structure of an algebraic stack at a point. It builds on the
algebraic stacks, inertia, underlying topological spaces, quotient stacks and quasi-coherent modules
of SchemeAndStackFoundations, and on the site-level gerbes and framed deformations of
AlgebraicModuliForArithmeticGeometry. Layer 0 is the substack vocabulary: monomorphisms, immersions,
closed substacks with their quasi-coherent ideals and infinitesimal neighbourhoods, and reduced
induced structures. Layer 1 covers finite type points and the automorphism group algebraic space
`G_x`. Layer 2 treats gerbes as morphisms of algebraic stacks, through the inertia and diagonal
criteria, up to the dense open gerbe of a reduced stack with quasi-compact inertia. Layers 3–4 cover
reduced one-point stacks and the residual gerbe `𝒵_x`, with its existence at finite type points, on
stacks with a flat locally quasi-finite presentation, on gerbes, on stacks with quasi-compact inertia
and on locally Noetherian stacks. Layer 5 covers decent stacks, the residue field `κ(x)` and the
algebraicity of points. Layer 6 proves `𝒵_x ×_{κ(x)} k ≃ BG_x` at a representative and the canonical
`BG_x ≃ 𝒵_x` at a rational point. Layer 7 proves the exact sequence
`0 → T_{BG_x} → T_{𝒳,x} → N_x → 0` relating the tangent space to the normal space at a closed
rational point with affine stabiliser.

Moduli roadmaps use these pointwise notions whenever they speak of the stabiliser, the residual
gerbe, or the tangent and normal spaces at a point of a stack. No roadmap on main defines them:
SchemeAndStackFoundations stops at `|𝒳|` and inertia. `Suggested.lean` states nothing because the
pinned Mathlib and Tau Ceti have no algebraic stack. Its docstring lists the headline theorems and
the carriers each one lacks.

## Dependencies still in pull requests

None. Every supplier is on main: SchemeAndStackFoundations §§1.2, 1.7–1.9, 1.12–1.23, 4.8, 4.12 and
4.13; AlgebraicModuliForArithmeticGeometry §§4.1, 5.4, 8.1 and 8.3 and Layers 4–5; ReductiveGroups
Layers 1, 3 and 3A. Each cited heading and name was checked on main.

The open revision of SchemeAndStackFoundations and ReductiveGroups (the draft that moves the
ModularCurves foundations) keeps every cited heading: §§1.2, 1.7–1.9, 1.13–1.15, 1.17–1.23, 4.8,
4.12, 4.13 and ReductiveGroups Layers 1, 3 and 3A are all present at its head. `scratch/overlaps.md`
lists no dropped id and no id defined only by an open revision. So no citation depends on an open
revision.

The four roadmaps under "Downstream consumers" are consumers, not suppliers, and all are later in
the merge order: LanglandsParameterStacks, FunctionFieldArithmeticPartII,
MotivicStructuresInModuliOfCurves and VirtualFundamentalClasses. Their cited sections were checked:
LanglandsParameterStacks §1.16 and FunctionFieldArithmeticPartII line 54 at their open heads, and
the other two in the board checkout.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already had the required form: one docstring and no
declaration. It lists the headline theorems (1.1/4.1, 2.4/2.6, 4.2–4.4, 4.5, 5.3, 5.4, 6.2/6.3, 6.4,
7.3) and says why none is statable.

I re-checked that claim at the pins. `TauCeti/AlgebraicGeometry/Stack/` contains only `Basic.lean`
(the abbreviation `SchPseudofunctor`, line 37), and `TauCeti/AlgebraicGeometry/AlgebraicSpace/`
only `Basic.lean` (presheaves of sets). A grep of both pinned libraries for `IsAlgebraicStack`,
`AlgebraicStack`, `IsGerbe`, `residualGerbe`, `inertiaStack` and `quotientStack` finds nothing.

Every headline is a statement about algebraic stacks. Stating any of them would need 2-fibre
products, representability by algebraic spaces, smooth atlases, inertia, `|𝒳|` and quotient stacks.
That is a long encoding of objects SchemeAndStackFoundations owns. No headline is statable at the
pins and missing from the file. The import is `import Mathlib` alone, since no `TauCeti.*` module
is used.

One edit was made to the docstring. The supplier sentence now names SchemeAndStackFoundations
§§1.8–1.9 rather than §1.8: the separation axioms of morphisms of spaces come from §1.9. It also
says that the README builds `G_x` from the automorphism group sheaves of §1.20, because `G_x`
itself is this roadmap's own (1.3).

## Supplier replacements and duplication removals

**Supplier replacements: none needed.** The package restates nothing a supplier provides. The
scheme cases are cited, not restated: Mathlib's `Scheme.residueField`, `IdealSheafData.subscheme`
and `vanishingIdeal`, and SchemeAndStackFoundations §4.8's levels `V(I^{n+1})`. Everything else is
consumed by name.

All 27 Mathlib declarations of the contracts were opened at their cited lines at Mathlib
`1b1ccf4b`, and each is the stated declaration. All 18 Tau Ceti declarations were opened at Tau
Ceti `2fd255d9`, each at its cited line, with namespaces checked: `TauCeti.AlgebraicGeometry.IsRegular`
(and `.of_flat_of_surjective` in `TauCeti.AlgebraicGeometry.IsRegular`),
`TauCeti.AlgebraicGeometry.Smooth.geometricallyReduced`,
`TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear`,
`TauCeti.HopfAlgebra.smooth_iff_finrank_lie_eq_ringKrullDim`,
`AlgebraicGeometry.Scheme.Hom.exists_finite_isSeparable_comp_eq`, and the `CommHopfAlgCat`
homogeneous-quotient declarations.

**Duplication removals: none.** The sweep was by object, over main and the heads of all 452 open
roadmap pull requests, using `roadmaps grep`. It searched for: residual gerbe, decent stack, finite
type point, reduced induced closed substack, dense open gerbe, one-point stack, gerbe over an
algebraic space or stack, monomorphism or immersion of algebraic stacks, closed substack, quasi-DM,
normal space, automorphism group algebraic space, and tangent space of a stack. The results:

- No roadmap defines residual gerbes, decent stacks, finite type points, reduced induced or
  one-point stacks, the dense open gerbe, gerbes over algebraic stacks, or monomorphisms and
  immersions of algebraic stacks.
- "Residual gerbe" occurs only in two later consumers, LanglandsParameterStacks and
  FunctionFieldArithmeticPartII. Both use it and neither defines it.
- "Closed substack" occurs in AlgebraicModuliForArithmeticGeometry §5.4 on main and in several open
  roadmaps. All of them use closed substacks of particular stacks, or of DM stacks, without defining
  them. VirtualFundamentalClass builds Chow groups on integral closed substacks of DM stacks and does
  not define closed substacks.
- "Normal space" hits are the topological notion or normal spaces of manifold embeddings. The one
  hit in VirtualFundamentalClass is its intrinsic normal space, a different object.

**Ownership.** This roadmap owns the objects of its Scope section. It is the earliest roadmap in the
merge order that needs them (line 38, right after its last supplier,
AlgebraicModuliForArithmeticGeometry, at line 37), and SchemeAndStackFoundations on main stops at
`|𝒳|`, inertia and presentations. Ownership was checked against every open roadmap pull request
through the `roadmaps` tools, not only the 234 listed with checkouts. No declaration of
`Suggested.lean` carries the name of another roadmap's declaration, since it has none.

## Fixes made as an upstream reviewer

1. **How to read the build.** "Layer 4 proves its existence in each case the Stacks Project treats"
   described the plan by a source's coverage. It now lists the five cases by their mathematics:
   finite type points, flat locally quasi-finite presentations, gerbes, quasi-compact inertia and
   locally Noetherian stacks. It also says "the closed-immersion criterion at closed points".
2. **References.** I removed `[olsson2016]` ("Chapter 11, background only, cited by locator"). No
   sentence of the README cites it, so "cited by locator" was false, and the source was never
   certified.
3. **`Suggested.lean` docstring.** Changed the supplier sections and the ownership of `G_x`, as
   described above.

Nothing else needed changing. The README already had the required shape: Summary, Scope and
ownership, Conventions, Exact supplier contracts, How to read the build, Layers 0–7 each ending with
Examples and Dependencies, Downstream consumers, Worked examples, References. It has 38 subsections,
each with a `**Checks.**` list of 3–6 bullets. A grep found no process words, LaTeX delimiters or
pull-request numbers. Every `gap:` used in a `*Needs:*` line is one of the 17 declared
"What <Supplier> must provide" paragraphs; main uses the same form, for example in
AlgebraicModuliForArithmeticGeometryPartII.

## Adversarial mathematics pass

`Suggested.lean` has no statement, so item 2 (context) has nothing to test; every row below concerns
the README. Values were computed by hand.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conv. 3 (quasi-compact inertia via `RepresentableProperty`) | `Bℤ_k`; `B𝔾_m` | inertia pulled back to `Spec k`: `ℤ_k = ⊔_ℤ Spec k` (not qc), resp. `𝔾_m` (qc) | separates the two | none |
| Conv. 4 (substack equality) | `Spec k ⊔ Spec k` | `Spec k ⊔ ∅`, `∅ ⊔ Spec k`: equivalent stacks, object sets over `Spec k` disjoint | uniqueness = equality | none |
| Conv. 5 (left action, contragredient) | `[𝔸¹/𝔾_m]`, `λ·t = λt`, `x = 0` | `t ↦ λ⁻¹t`: weight `−1`; `I/I² = k·t`: `−1`; `N`, `T`: `+1`; right action `α∘g` gives `−1` on `T` | consistent in 7.2–7.4 | none |
| Conv. 6 (`𝒳^{[n]}` by `ℐ^{n+1}`) | `𝔸¹` at 0, `n = 0,1,2`; `Spec k[ε]` | lengths `1,2,3`; `ℐⁿ`-indexing gives `V(O) = ∅` at `n = 0`; `ℐ² = 0` so `𝒳^{[n]} = 𝒳` for `n ≥ 1` | matches §4.8 `V(I^{n+1})` | none |
| Conv. 7 (`κ(x) → k`) | `𝔸¹_ℚ` at `t²+1`, rep `t ↦ i` over `ℂ` | `ℚ[t]/(t²+1) = ℚ(i) ⊂ ℂ` | holds | none |
| Conv. 8 (`α` vs `β = α⁻¹`) | `[𝔸¹/𝔾_m]`, `τ = bε` | iso by `λ = λ₀+λ₁ε`: `(b,α) ↦ (λ₀b, λ₀α)`, invariant `α⁻¹b`; `g·` gives `gα⁻¹b` in both forms | weight `+1` both | none |
| Conv. 9 (`QCoh(BG)` = comodules) | `G = 𝔾_m, μ_p, 1` | `ℤ`-graded, `ℤ/p`-graded, plain vector spaces | holds | none |
| 0.1 smooth-local `P` | `Bμ_p/𝔽_p`; `[Spec k[t]/(t²)/𝔾_m]`; node; `∅` | `𝔾_m ×_{Bμ_p} Spec 𝔽_p = 𝔾_m` (Kummer torsor), smooth, regular; atlas `k[t]/(t²)` nonreduced; node: `dim 𝔪/𝔪² = 2 > 1`; `∅` has every `P` | holds; flat-atlas model refuted (`μ_p` length `p`) | none |
| 0.2 mono ⇔ fully faithful ⇔ `Δ` equivalence; rigidity | `Spec k → B(ℤ/2)`; `𝔾_m ⊂ 𝔸¹`; `Spec ℂ → Spec ℝ`; `∅ → Spec k`; `Spec k → Spec k[ε]`; section of `U/G` | `Spec k ×_{BG} Spec k = G`: 2 points ≠ 1; `Spec ℂ ×_ℝ Spec ℂ`: 2 points; `∅` mono not iso (nonempty needed); `k[ε]` mono not iso (field needed); `U ×_X Spec ℚ̄ = G × Spec ℚ̄` discrete, `U` profinite | proof re-derived (`V ×_T V = V ×_k V` as `Δ_{T/k}` iso; a mono with a section is iso) | none |
| 0.3 immersions, presentation bijection | `[𝔸¹/𝔾_m]`; `Spec k(t) → 𝔸¹`; `Spec k ⊔ Spec k`; closed `[Spec k[t]/(t²)/𝔾_m]` | invariant subschemes `{0}`, `𝔾_m`; complement of `{η}` (closed points) not closed; open substack atlas `𝔾_m` regular, closed one `k[t]/(t²)` not reduced | holds both ways | none |
| 0.4 ideals ↔ closed substacks | `𝔸¹` at 0; `Spec(k×k)`; `(t²) ⊂ k[t]` | fppf kernel: `(t)` over `id`, `0` over origin; QCoh pullback `(t)⊗k = k·t`, dim 1; split case both `0×k`; `V((t²))` has ideal `(t²) ≠ (t)`; `(ℐ^{n+1})² = ℐ^{2n+2} ⊆ ℐ^{n+2}` | kernel must be in `QCoh` | none |
| 0.5 reduced induced | `Spec k[ε] → 𝔸¹`, `t ↦ ε`; `[Spec k[t]/(t²)/𝔾_m]`; `T = ∅` | `ε ≠ 0`: no factorisation; reduction `B𝔾_m`; `T = ∅` gives the empty substack | reduced source needed | none |
| 1.1 finite type points | `Spec ℤ_(p)` generic; `𝔸¹_k` generic, `K = k(t)`; `Spec ℚ̄ → Spec ℚ` | `ℚ = ℤ_(p)[1/p]`; integral equation for `1/t` times `tⁿ` gives `1 ∈ (t)`; `[ℚ̄:ℚ] = ∞`; "every representative" model: `Spec k(t) → Spec k` not lft, so no ft points | iff on all three | none |
| 1.2 `π₀ 𝒳(k) → |𝒳|` | `B(ℤ/2)_ℝ`; `Spec ℚ(i)`; `𝔸¹_ℝ` | 2 classes → 1 point; `σ∘id = id∘σ` but `ι(i) ≠ −ι(i)`; `t²+1` not hit | not injective, not surjective, two embeddings needed | none |
| 1.3 `G_x` | `BS₃`; `[𝔸¹/𝔾_m]`; `Bμ_p`; `Bμ_3/ℚ` | `G_x = S₃` (matches `I_{BG} = [G/G]`); `G_0 = 𝔾_m`, `G_1 = 1`; `μ_p(𝔽̄_p) = 1`; `μ_3(ℚ) = 1`, `μ_3(ℚ(ζ₃)) = ℤ/3` | `P` must be extension-invariant | none |
| 1.4 `G_x` a scheme | `B(𝔾_a/ℤ)/ℚ`; `Bℤ`; `B𝔾_m`; `Bμ_p` | diagonal pulls back to `⊔_n {y = x+n}`: not qc, dense, misses generic point, not locally closed; `ℤ_k` étale not finite; `𝔾_m` scheme, `B𝔾_m` not quasi-DM; `μ_p` (quasi-DM case) | sufficient, not necessary; a hypothesis is needed | none |
| 2.1 gerbe over an algebraic space | `BG/k`; `[𝔸¹/𝔾_m]`; `Spec k → BG`; `𝔸¹_k`; `B𝔾_{m,𝔽_p}`; `B𝔾_{m,ℤ}`; `∅` | base `Spec k`; `0`, `1` not locally isomorphic; `Aut = G(T)` does not lift; `𝔸¹` gerbe over itself, not `IsGerbe`; no object over `ℚ`-schemes; `∅` gerbe over `∅` | `IsGerbe` = gerbe over `Spec ℤ` | none |
| 2.2 section ⇒ classifying stack | `BG` trivial torsor; `[𝔸¹/𝔾_m]` with section `1`; `S₃/ℝ`, `H¹(ℝ,S₃) = {1,[τ]}` | identity; `Isom(1,1) = 1`, `Spec k` (1 point) vs 2 points; inner form twisted by `τ` | gerbe hypothesis needed | none |
| 2.3 flatness, smoothness | `Bμ_p → Spec 𝔽_p`; `Spec 𝔽_p → Bμ_p`; `Spec k → B𝔾_m` | smooth although `μ_p` is not (`dim Lie μ_p = 1 > 0`); fibre `μ_p`: flat lfp, not smooth; flat lfp surjective, not a gerbe | holds | none |
| 2.4 inertia criterion | `[𝔸¹/𝔾_m]`; `Bμ_p`; `BS₃`; free action | fibres `𝔾_m` / trivial: not flat; `μ_p × Bμ_p` flat; `S₃` finite étale; trivial inertia | iff on all four | none |
| 2.5 diagonal criterion | `Spec k → B𝔾_m`; `Spec k → Spec k[ε]`; `Bℤ → Spec k`; `Bμ_p → Spec 𝔽_p` | `Δ` = unit section of `𝔾_m`, not flat; univ. homeo, not flat; `Δ_{Bℤ}` pulls back to `⊔_ℤ Spec k` vs `Δ_{Spec k}` iso; both `f` and `Δ_f` flat lfp surjective | iff and one-way lemma consistent | none |
| 2.6 dense open gerbe | `[𝔸¹/𝔾_m]`; `[Spec k[ε]/𝔾_m]`; Example 101.29.2; `∅` | open point; `B = k[ε][λ^{±1}]/((λ−1)ε)`: `λ−1` kills `ε`, image in `B/εB = k[λ^{±1}]` nonzero, so not flat; only dense open is the whole stack; stratum `x₀ ≠ 0` | reducedness needed | none |
| 3.1 reduced one-point | `Bμ_p`, `B𝔾_m`; `Spec k[ε]`; `U/G` | `Spec k → BG` surjective flat lfp; `Spec k → Spec k[ε]` not flat; ideal of `a⊗1 − 1⊗a` not f.g. (point not open in profinite `|U|`) | the two lemmas are distinct | none |
| 3.2 rigidity, locally Noetherian core | `U/G`; `Spec k → BG`; `BG`; `Spec k` | core `Spec ℚ̄`, proper; not a mono; cores `BG`, `Spec k` | hypotheses needed | none |
| 3.3 residual gerbe | scheme; `[𝔸¹/𝔾_m]`; `Spec k → BG`; `Spec k[ε]` | `Spec κ(x)`; `B𝔾_m`, `Spec k`; not a mono; `Spec k` (reduced) | holds | none |
| 3.4 properties | node; `Spec ℚ(t)/ℤ` (fixed scheme of `t ↦ t+n` is `Spec ℚ(t)/(n) = ∅`); `[𝔸¹/𝔾_m] → Spec k`; `Bμ_p` | `𝒵 = Spec k` regular; an étale `Spec ℚ(t) → Spec F` would make `ℤ × Spec ℚ(t)` finite; pullback = whole stack, 2 points; `I ×_𝒵 Spec 𝔽_p = μ_p` ft ⇒ lfp ⇒ 2.4 | gerbe hypothesis needed | none |
| 3.5 functoriality | `Spec k → BG`, `G = ℤ/2, μ_p, 1`; open immersion | 1 vs 2 points; lengths 1 vs `p`; both `Spec k` for `G = 1` | criterion discriminates both ways | none |
| 4.1 (headline) | `[𝔸¹/𝔾_m]` at 1; `𝔸¹` generic; `Spec ℤ_(p)` generic | open immersion lft; `Spec k(t) → 𝔸¹` not lft; `Spec ℚ` f.t. | three conditions agree | none |
| 4.2 flat lqf presentation | `B(ℤ/2)`; `Bμ_p`; `𝔸¹_ℚ/ℤ`; `B𝔾_m` | DM; `Spec 𝔽_p → Bμ_p` with finite fibre `μ_p`; residual space `Spec ℚ(t)/ℤ` not a field; not quasi-DM, 4.3 applies | sufficient, not necessary | none |
| 4.3 gerbes, qc inertia | `[𝔸¹/𝔾_m]`; `Bℤ`; `B(𝔾_a/ℤ)` | qc inertia; gerbe without qc inertia; inertia qc (image of qc `𝔸¹`), not qs | cases independent | none |
| 4.4 locally Noetherian | `Spec ℚ(t)/ℤ`; `[Spec k[x₀,…]/𝔾_m]`; `U/G` | locally Noetherian; covered by 4.3; covered by 4.1 | cases independent | none |
| 4.5 closed points (headline) | `[𝔸¹/𝔾_m]`; DVR; `U/G` | `0` closed and closed immersion, `1` neither; `Spec R/𝔪` closed, `Spec K` open; `U/G` point closed, `Spec ℚ̄ → X` not a closed immersion | iff both ways; Noetherian needed | none |
| 5.1 decency | `𝔸¹_ℚ/ℤ`; `B𝔾_m`; `Spec ℚ(t)/ℤ`; `U/G`; `X` = two `Spec k[x₁,…]` glued | not decent; decent; `⊔_ℤ Spec ℚ(t)` not qc; `G` infinite; `D(x_{i₁}) ∪ … ∪ D(x_{iₙ})` misses `(x_{i₁},…,x_{iₙ})` | both alternatives needed | none |
| 5.2 factorisation | identity of `𝔸¹`; `Spec k[ε] → 𝔸¹`; `Y/Γ`, `Γ` profinite | closure vs singleton; nonreduced; neither hypothesis holds | hypotheses needed | none |
| 5.3 residue field (headline) | `𝔸¹_ℚ` at `t²+1`; `[Spec ℂ/(ℤ/4)]/ℝ`; `Spec ℚ(t)/ℤ`; `Spec 𝔽₂` | `ℚ(i)`; `H¹(ℝ,ℤ/4) = {0, 1↦2}`, both ↦ 0 in `Hom(ℤ/2,ℤ/2)`: no real object, `κ = ℝ`; base not a field; `κ = 𝔽₂` | decency needed | none |
| 5.4 algebraicity (headline) | `[𝔸¹/𝔾_m]`; `𝔸¹` generic; glued `X`; `𝔸¹_ℚ/ℤ` | `Z = Spec k` at both points; `Spec k(t) → 𝔸¹` affine, not an immersion; `X` has non-qc diagonal, first statement only; `P(t+n) − P(t)` has `t^{d−1}`-coefficient `dn ≠ 0` | statements separated | none |
| 5.5 fppf image | `Spec κ(t) → Spec κ`; finite `k/κ`; `𝔽_p(t^{1/p})/𝔽_p(t)`; `BG_k` at `k̄` | not lfp; image `Spec κ`; finite flat, image `Spec κ`; `k̄/k` infinite, not fppf | iff both ways, inseparable case included | none |
| 6.1 `R_x` | `BG`; `k/κ` splitting field of `x³−2` over `ℚ`, `Γ = S₃`; `[𝔸¹/𝔾_m]` at 0 | `R_x = G`, equal projections; `Spec(k⊗k)` = 6 points, projections differ, `G_x = 1`; `R_x = 𝔾_m` | holds | none |
| 6.2 base change (headline) | `BG_k`, `G = ℤ/2, μ_p, 1`; `𝔸¹` generic; `Spec ℚ(t)/ℤ`; `[Spec ℂ/(ℤ/4)]` at `ℂ` | `BG` (1 point, Aut of order 2), `Spec k`, `G` (2 points); `μ_p` length `p`; `Spec K = B1`; `Spec ℚ(t)`; `B(ℤ/2)_ℂ` | holds without ft/Noetherian | none |
| 6.3 neutrality (headline) | `Spec ℚ(t)`, `σ : t ↦ t²`; `ℚ(t) ⊂ ℚ(s)`, `s² = t`; quaternion `(t,−1)`; `[Spec ℂ/(ℤ/4)]` | canonical `Spec σ` not iso, `σ` not onto; degree 2 canonically, `t ↦ s` abstractly; tame symbol at `t = 0`: `−1 ∉ ℚ^{×2}`, `(t²,−1)` split; non-neutral | canonical form and decency needed | none |
| 6.4 rational points (headline) | `Bμ_p/𝔽_p(t)`; finite nontrivial `k/κ`; `Spec k[x₀,…]`; `B(ℤ/2)/𝔽₂` | `𝒵 = Bμ_p = BG_x`; `𝒵 = Spec κ ≠ Spec k`; origin lft, not lfp, `𝒵 = Spec k`; `𝒵 = B(ℤ/2)` | section condition needed; no finiteness of `𝒳` | none |
| 7.1 neighbourhoods | `[𝔸¹/𝔾_m]` at 0, `n = 0,1`; `𝔸²` at 0; `BG` | `[Spec k[t]/(t^{n+1})/𝔾_m]`; length 3; ideal 0 | holds | none |
| 7.2 normal space | `[𝔸¹/𝔾_m]`; `BG`; `[𝔸ⁿ/GLₙ]`; `𝔸²`; extension `k ⊂ k'` | weight `+1`; `0`; standard; `k²` trivial; `BG_{x'} → 𝒳_{k'}` closed immersion with one-point image, so `x'` closed | holds | none |
| 7.3 tangent–normal (headline) | `[𝔸¹/𝔾_m]`; `Bμ_p`; `[𝔸¹/μ_p]`; cusp; `Spec k` (`G_x = 1`, `n = 0`) | `dim T_{BG} = dim Lie − dim G`: `1−1 = 0`, `1−0 = 1` (`T = {1+aε} ≅ k`, `N = 0`); `2 = 1+1`; `2 = 0+2`; `0 = 0+0` | sequence and iff hold | none |
| 7.4 quotient stacks | `GLₙ` on `𝔸ⁿ`; `𝔾_m` on `𝔸¹` at 0 and 1; `SL₂` on quadrics at `uv`; `E × 𝔾_m`; `ℤ` on `(ℤ×𝔸¹) ⊔ 𝔸¹` | standard both sides; weight `+1` both sides; orbit `𝔾_m` not closed; `disc(uv) = 1`, `d disc = 2 db ≠ 0`; an exchange in `SL₂` has `ab = −1`, so `uv ↦ −uv` and the stabiliser is the torus; orbit dim `3−1`; `k∂_t` weight 1; `ℚ∂_t`, stack not qs | holds beyond the source | none |
| Worked example (0-dim DM) | `Bℤ/K`; `B(ℤ/2) ⊔ Spec K`, `K = k̄` | `G_x = ℤ` not finite (non-qc diagonal); `𝒳_red = B(ℤ/2) ⊔ Spec K` | diagonal hypothesis needed | none |
| Docstring headline bullets vs README | each bullet against 1.1, 2.4, 2.6, 4.1–4.5, 5.3, 5.4, 6.2–6.4, 7.3 | hypotheses compared: decency in 5.3/6.2/6.3; `p∘x = id` in 6.4; closed, affine stabiliser, lft over `k` in 7.3 | agree | supplier sentence only |

No row needed a change of statement. The only changes are the three listed under "Fixes made as an
upstream reviewer".

## Unresolved, for the worker and the humans

- **FunctionFieldArithmeticPartII** (open, later in the merge order) asks SchemeAndStackFoundations
  for `gap:zero-dimensional-dm-residual-gerbes`, at its README lines 54 and 7367 at its head. This
  roadmap proves that statement in its worked example from 0.3, 0.5, 1.4, 3.3, 4.5 and 6.4, and adds
  the quasi-compact diagonal hypothesis that `Bℤ` shows is necessary. That roadmap should cite this
  one and add the hypothesis. Only that roadmap can change.
- **VirtualFundamentalClasses** (board package, later in the merge order) restates closed substacks,
  their presentation description and the reduced induced substack for DM stacks (its §1.2) without
  citing this roadmap. The README records the ownership in "Scope and ownership". Only that package
  can change.
- **Licences, carried over from the accepted review.** `alper-moduli` is an author's draft of
  lecture notes, cited for eight line locators, each beside a Stacks Project or journal locator.
  `sga3-vi-a` was read in the editors' online compilation; it supports one gap. A human decides
  both.
- **Conditional supplier gaps.** There are 17. `review.json` lists 16 conditional gaps; the
  README's 17th, `gap:qcoh-stacks-abelian-tensor` (SchemeAndStackFoundations §1.22), was added by
  the red-team repair after the review. It is declared in the contracts and used by 0.4, 7.2 and
  Layer 7's Dependencies.
- **Downstream consumers not yet public.** MotivicStructuresInModuliOfCurves and
  VirtualFundamentalClasses are board packages that are not yet on main or in a pull request. They
  are named only under "Downstream consumers", as consumers. The dependency check accepts them.
- Nothing in the texts read asked for an action; no passage was suspicious.


Pull request: #2429 (roadmap/stack-points-and-residual-gerbes at 3688535)
