module

import Mathlib

/-!
# Virtual fundamental classes: target signatures

The roadmap is `README.md`; this file is not the roadmap. It is the roadmap's acceptance test:
it states, against the pinned Mathlib and Tau Ceti, the headline theorems that the finished
roadmap proves. At the pins none of them is statable, so the file states nothing. The headline
theorems, and what each lacks at the pins, are the following.

Every headline is a statement about Deligne–Mumford stacks or algebraic stacks over a field
(the cone stacks `h¹/h⁰(E^∨)` and the intrinsic normal cone are algebraic stacks even over a
scheme). The pins have no carrier for them: Mathlib has `Pseudofunctor.IsStack` for
category-valued pseudofunctors, and Tau Ceti has algebraic spaces
(`TauCeti.AlgebraicGeometry.Spaces.IsAlgebraicSpace`) and the `Cat`-valued pseudofunctors on
schemes (`TauCeti.AlgebraicGeometry.SchPseudofunctor`), but neither has stacks in groupoids with
an algebraic or Deligne–Mumford structure, representability of morphisms of stacks, their
2-fibre products, inertia, properness or coarse moduli spaces (SchemeAndStackFoundations
§§1.18–1.23). Tau Ceti's Chow groups `TauCeti.AlgebraicGeometry.Chow.ChowGroup` are those of
schemes; the Chow groups of a Deligne–Mumford stack are this roadmap's Layer 2, a construction
by étale descent of cycles and rational equivalences on stacks that are not at the pins.

1. **The coarse-space comparison** (README 6.1; Vistoli 1989, (6.1)(i)). For a
   Deligne–Mumford stack `𝓜` of finite type over a field `k` with a proper cover and a proper
   morphism `p : 𝓜 → M̄` to an algebraic space of finite type over `k`, bijective on isomorphism
   classes of geometric points, `p_* : A_i(𝓜)_ℚ → A_i(M̄)_ℚ` is an isomorphism for every `i`. It lacks
   Deligne–Mumford stacks, proper morphisms of stacks, the rational Chow groups of stacks and of
   algebraic spaces, and rational proper pushforward.
2. **The comparison with equivariant Chow groups** (README 6.2; Edidin–Graham 1998,
   Propositions 10–11). For a smooth affine group `G` of dimension `g` acting on a
   quasi-projective `X` with a linearised ample sheaf and `[X/G]` a separated Deligne–Mumford
   stack, `A^G_i(X)_ℚ ≅ A_{i−g}([X/G])_ℚ`, a ring isomorphism for smooth `X`. It lacks quotient
   stacks, the Chow groups of stacks and the equivariant Chow groups `A^G_*(X)`
   (EquivariantIntersectionTheory §2.1).
3. **The degree of zero-cycles** (README 6.3; Vistoli 1989, (1.17)). For a proper
   Deligne–Mumford stack over `k` and a closed point `x`, `∫[𝒱_x] = [κ(x) : k]/|Aut(x̄)|`, and
   `∫` vanishes on rational equivalences. It lacks Deligne–Mumford stacks, their integral closed
   substacks, function fields and automorphism groups of geometric points, and the rational
   Chow groups of stacks.
4. **The relative intrinsic normal cone has pure dimension `m`** (README 8.5;
   Behrend–Fantechi 1997, Theorem 3.11). For a morphism `M → 𝔐` of Deligne–Mumford type from a
   Deligne–Mumford stack to an algebraic stack of pure dimension `m`, the cone stack `C_{M/𝔐}`
   is of pure dimension `m` with abelian hull `N_{M/𝔐}`, and it is a vector bundle stack exactly
   when `M → 𝔐` is a local complete intersection. It lacks algebraic stacks and their
   dimension, cone stacks, the small étale site of a Deligne–Mumford stack with its derived
   category of modules, and the truncated cotangent complex `τ^{≥−1}L_{M/𝔐}` of a morphism of
   stacks (Mathlib's `Algebra.Extension.cotangentComplex` is the naive complex of a ring
   presentation).
5. **The characterisations of an obstruction theory** (README 9.3; Behrend–Fantechi 1997,
   Theorem 4.5). For `φ : E → τ^{≥−1}L_{M/𝔐}`, being an obstruction theory, `φ^∨` being a
   closed immersion of cone stacks, and the two deformation-theoretic conditions on square-zero
   extensions are equivalent. It lacks the same carriers as 4, and the stacks `h¹/h⁰(E^∨)`.
6. **The virtual fundamental class** (README 10.2–10.3; Behrend–Fantechi 1997, Definition 5.2
   and Proposition 5.3). For a separated `M` and a perfect obstruction theory of rank `r` with a
   global resolution, `[M, E]^vir = 0^!_{F_1}[C(F^•)] ∈ A_{m+r}(M)_ℚ` does not depend on the
   global resolution. It lacks the carriers of 4 and 5 and the Gysin map of the zero section of
   a vector bundle on a Deligne–Mumford stack.
7. **The properties of the virtual class** (README 10.4–10.8; Behrend–Fantechi 1997,
   Propositions 5.5, 5.6, 5.7, 5.10, 7.2–7.5). No obstructions give `[M]`; a smooth `M` over the
   base gives `c_top(Ob) ∩ [M]`; products give exterior products; the class pulls back along a
   flat morphism of the base and, over a reduced base, along a regular local embedding;
   compatible obstruction theories satisfy `v^![X, E]^vir = [X', F]^vir` for a smooth `v`, and
   over a reduced base for a local complete intersection `v` between stacks smooth over it; over
   a reduced base, virtual counts are constant in a family over a smooth connected curve. They
   lack the carriers of 6, Chern classes and bivariant classes on stacks, and Vistoli's Gysin
   maps.
8. **The obstruction theory of spaces of maps from curves** (README 11.4–11.6;
   Behrend–Fantechi 1997, Proposition 6.2; Behrend 1997, Proposition 5). For a relative space of
   maps `F : 𝒞_M → X` from a family of prestable curves over an algebraic stack `𝔅` to a smooth
   quasi-projective `X`, `(Rπ_* F^*T_X)^∨ → τ^{≥−1}L_{M/𝔅}` is a perfect obstruction theory of
   rank `χ(F^*T_X)` on fibres, with a global resolution when `𝒞_M` carries an invertible sheaf
   ample on the fibres of `π`. It lacks the carriers of 4 and 5, derived
   pushforward along a representable morphism of Deligne–Mumford stacks and relative duality for
   it; Tau Ceti's `TauCeti.AlgebraicGeometry.PrestableFamily` is the prestable family over a
   scheme only.

Nothing is stated in place of these: a scheme-only or affine-only version of any of them would
be a weaker substitute, and the stack carriers are heavy constructions that the README states
as targets of its supplier roadmaps and of its own layers.
-/

namespace TauCetiRoadmap.VirtualFundamentalClasses

end TauCetiRoadmap.VirtualFundamentalClasses
