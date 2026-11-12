Verdict: part-ii
Name: VirtualFundamentalClassPartII
Base: VirtualFundamentalClass
Owner: none

## Scope

**VirtualFundamentalClass, Part II: integral and non-separated Chow groups of Deligne–Mumford
stacks, their comparisons, and virtual classes over general bases.**

The base roadmap VirtualFundamentalClass (roadmap pull request 1996, head `676f128`) owns the
Behrend–Fantechi construction: stack dimension (§§0.2–0.3), stack sites, cones and normal cones
(§§1.1–1.6), Vistoli's *rational* Chow groups of *separated* Deligne–Mumford stacks with proper
pushforward, flat pullback, localisation, exterior products, homotopy invariance, Chern classes,
refined Gysin maps, bivariant groups, Vistoli's canonical rational equivalence, its invariance under
the restricted tangent action of Kresch's Theorem 3.1 and the plane counterexample to the
unrestricted claim, and the cap action with the projection formula (§§2.1–2.5); the full relative
cotangent complex and absolute square-zero lifting (§§3.1–3.5); cone stacks and `h¹/h⁰`
(§§4.1–4.5); the intrinsic normal sheaf and cone, absolute and relative (§§5.1–5.5, 9.1); absolute
obstruction theories, their closed-immersion and lifting characterisations, perfectness and global
resolutions (§§6.1–6.6); the virtual class on separated stacks *with the resolution property*, its
formulas and virtual degree (§§7.1–7.7); compatible pullback and functoriality between *smooth*
bases (§§8.1–8.5); and the relative class over a pure-dimensional algebraic stack with flat base
change, regular base change and the no-obstruction and obstruction-bundle formulas *over smooth
bases*, relative functoriality under the smoothness hypotheses of Behrend–Fantechi Proposition 7.5,
and pullback from smooth stacks (§§9.1–9.6). AlgebraicGromovWittenTheory (roadmap pull request 1998,
head `1949322`) owns the prestable-curve stack (§2.1), the stack of stable maps (Layer 3) and its
obstruction theory and virtual class (§§4.1–4.5).

This Part II starts where the base stops. It plans nothing the base states; everything above is
imported by roadmap name and section. Each item below either widens the hypotheses of a named base
section or adds a statement the base does not have. It owns:

1. **Integral and non-separated intersection theory.** Proper covers; integral cycle groups,
   rational equivalence and Chow groups `A_i(ℳ)` of stacks that are not assumed separated; the
   comparison of `A_i(ℳ) ⊗ ℚ` with the base's §2.1 group and of the integral groups of algebraic
   spaces with those of the Stacks Project; the generic stabiliser order and the degree of a
   dominant morphism; flat pullback, proper representable pushforward, push–pull, localisation,
   exterior products and Gysin maps with scheme sources, all integrally; and, for stacks with a
   proper cover, rational proper pushforward, the bivariant action, homotopy invariance and Chern
   classes. (Widens base §§2.1–2.5.)
2. **Products and comparisons.** The intersection ring of a smooth stack and the identification of
   bivariant classes over it with Chow classes; the isomorphism with the rational Chow group of a
   moduli space that is an algebraic space; the comparison with the Edidin–Graham groups of a
   Deligne–Mumford quotient stack, as rings for smooth quotients; the degree of a closed point.
   (New statements; the point formula refines base §§2.1 and 7.7.)
3. **Virtual classes.** Independence of the global resolution with no resolution property on the
   stack, and for stacks with a proper cover; the relative obstruction class and the relative
   characterisation of obstruction theories; the relative no-obstruction and obstruction-bundle
   formulas over any base of pure dimension; invariance of Vistoli's rational equivalence along
   the relative tangent directions of a smooth morphism to a reduced base; regular-immersion
   pullback and functoriality over reduced bases and smooth-morphism functoriality over any base;
   deformation invariance of virtual counts. (Widens base §§2.5, 3.5, 6.1, 6.3, 7.3–7.4, 8.3–8.4,
   9.2, 9.4, 9.5.)
4. **Maps from curves.** The perfect relative obstruction theory of every relative space of maps
   from a prestable family over an arbitrary base of pure dimension to a smooth quasi-projective
   target, over any field, mapping to the full cotangent complex of base §3.3, with its global
   resolution and its virtual dimension. AlgebraicGromovWittenTheory §§4.1–4.3 is the special case
   of the stable-map stack of a smooth projective target over an algebraically closed field of
   characteristic zero; this roadmap does not build that stack.

**Duplicates removed from the filed wording.** The filed "Proposition (invariance)" asks for the
failure of invariance under the whole ambient tangent bundle, with an example in the affine plane.
Base §2.5 at its current head already states Kresch's restricted invariance over a field and has
that plane example as a negative check. By the maintainer's rule both are the base's; this roadmap
states only the relative invariance over a reduced base (T13) and imports the plane example as a
Check of base §2.5.

**Boundaries.** Not owned here, imported or left to others:

- everything in the base sections listed above, and the base's words: "local embedding" for a chart
  pair and "local immersion" for the class of representable unramified morphisms of finite type,
  which is what Vistoli calls a local embedding (vistoli1989 (1.19), lines 485–500);
- scheme cycles, Chow groups, Chern classes, normal cones, refined Gysin maps and intersection
  products on smooth schemes (SchemeAndStackFoundations §§5.1–5.6); algebraic stacks, the small
  étale site of an algebraic space and coarse moduli spaces with Keel–Mori (SchemeAndStackFoundations
  §§1.10, 1.18–1.23);
- closed and reduced substacks, automorphism groups of points, residual gerbes and residue fields
  (StackPointsAndResidualGerbes, a board design: Layers 0, 1 and 3–5);
- equivariant Chow groups (EquivariantIntersectionTheory §§2.1–2.2);
- prestable families, cohomology and base change, the relative dualising sheaf and relative
  ampleness (StableReduction Layers 2–3; Tau Ceti `PrestableFamily`);
- the prestable-curve stack, the stable-map stack, its properness, its virtual class and
  Gromov–Witten theory (AlgebraicGromovWittenTheory);
- Chow groups of Artin stacks and the virtual class without a global resolution (kresch1999
  Theorem 6.2.1, lines 1632–1636), virtual pullbacks, torus and cosection localisation, virtual
  structure sheaves, reduced, logarithmic and symmetric theories: not planned here;
- the symplectic virtual class (GromovWittenTheory, roadmap pull request 990; ImplicitAtlases,
  roadmap pull request 974) and any comparison with it.

**Conventions the design must keep.**

- `k` is an arbitrary field. A *stack* is a Deligne–Mumford stack of finite type over `k` in the
  sense of SchemeAndStackFoundations §1.19 whose diagonal is quasi-compact and separated, which is
  Vistoli's and Deligne–Mumford's convention (vistoli1989 (7.14), lines 2109–2110). The filed
  wording says "quasi-separated"; every source assumes a separated diagonal, and that is the
  generality adopted. "Separated" for a stack means a proper diagonal, as in the base.
- A *proper cover* of `ℳ` is a scheme `X` with a proper surjective morphism `X → ℳ`; for `ℳ`
  integral, a *proper covering* is a generically finite one from an integral scheme (vistoli1989
  (1.10)–(1.11), lines 299–328). Every stack with a separated finite-type morphism to a scheme has a
  proper cover (deligne-mumford1969 Theorem 4.12, lines 1012–1019; vistoli1989 lines 582–584), in
  particular every separated stack.
- Integral groups are `A_i(ℳ)`; their rationalisation is `A_i(ℳ)_ℚ = A_i(ℳ) ⊗ ℚ`, which T2
  identifies with the base's `A_i(ℳ)_ℚ` for separated `ℳ`, so every rational statement here is a
  statement about the base's groups and operations.
- Obstruction theories, relative obstruction theories and compatibility data are those of base
  §§6.1, 6.4, 8.1 and 9.2, as morphisms into the full cotangent complex of base §3.3. No truncated
  complex is defined. Where a source maps to the truncation `τ^{≥−1}L`, the design uses that for
  `E` perfect of amplitude `[−1, 0]` the morphisms `E → L` and `E → τ^{≥−1}L` correspond
  bijectively, because `Hom` and `Ext¹` from `E` into a complex concentrated in degrees `≤ −2`
  vanish.
- Behrend–Fantechi is cited in the arXiv v1 numbering, as in the base.

## Final targets

Statements are in the author's words; locators are into the manifest texts.

### Integral and non-separated intersection theory

- **T1 (proper covers; integral Chow groups).** For a stack `ℳ`: `Z_i(ℳ)` is the free abelian group
  on integral closed substacks of dimension `i` (dimension of base §0.2); `W_i(ℳ)` is the direct sum,
  over integral closed substacks `𝒱` of dimension `i + 1`, of the multiplicative groups of their
  function fields `k(𝒱)` (rational functions are morphisms to `𝔸¹` on dense open substacks); the
  boundary `∂ : W_i(ℳ) → Z_i(ℳ)` is the order-of-vanishing map computed on étale atlases and glued
  as a morphism of étale sheaves; `A_i(ℳ) := Z_i(ℳ)/∂W_i(ℳ)`. No separatedness and no proper cover
  is assumed for the definition. Every closed substack has a cycle `[𝒵]`. (vistoli1989 (1.5)–(1.6)
  and (1.14), lines 232–250 and 347–353; (3.1)–(3.5), lines 892–971; gillet1984 §4, uncertified.)
  Proper covers exist as in the Conventions, and for integral `ℳ` with a proper cover a proper
  covering exists (vistoli1989 Lemma 1.10, lines 299–303).
  *Check:* for `char k ≠ 2` and `μ₂` acting on `𝔸¹` by `x ↦ −x`, `A_0([𝔸¹/μ₂]) ≅ ℤ/2`, generated
  by the class of the residual gerbe `Bμ₂` at the origin, since `div(x²) = 2[Bμ₂]` and
  `div(x² − a) = [orbit of ±√a]`; rationally the group vanishes.
- **T2 (comparison).** For separated `ℳ`, `A_i(ℳ) ⊗ ℚ` is canonically the base's §2.1 group
  `A_i(ℳ)_ℚ`, and under this identification the rationalised operations of T4–T5 are the base's
  §§2.2–2.5 operations. For a quasi-separated algebraic space `X` of finite type over `k`,
  `A_i(X)` equals integrally the Stacks Project group `CH_i(X)` of stacks-chow-spaces Definition 15.1
  (Tag 0EQ6, lines 797–810; Situation 2.1 (Tag 0EDT), lines 57–61, with `B = Spec k`), and for a
  scheme it is the group of SchemeAndStackFoundations §5.1 (stacks-chow Definition 19.1, Tag 02RW,
  line 1356).
- **T3 (degrees).** For an integral stack `𝒱`, the generic stabiliser order `e(𝒱)` is the degree of
  the inertia `I_𝒱 → 𝒱` over a dense open substack (the order of the automorphism group of a general
  geometric point), and `e(𝒱) = 1` iff `𝒱` has a dense open substack isomorphic to a scheme. For
  a separated dominant morphism `f : ℱ → 𝒢` of integral stacks, `deg(ℱ/𝒢) ∈ ℚ_{≥0}` is defined
  through étale charts by integral schemes; it is well defined, multiplicative in composites, an
  integer when `f` is representable, and equal to `(e(𝒢)/e(ℱ)) · [k(ℱ) : k(𝒢)]` with
  `[E : K] = 0` for an infinite extension. No separatedness of `ℱ` or `𝒢` is assumed; on separated
  stacks these are the factors used by base §2.1. (vistoli1989 (1.12)–(1.13), lines 329–346;
  (1.15)–(1.17), lines 365–452.) *Check:* `deg(BG/Spec k) = 1/|G|` for a finite étale group of
  order `|G|` (vistoli1989 lines 372–376).
- **T4 (integral operations).** Integrally, for stacks with no separatedness hypothesis: flat
  pullback of constant relative dimension and pushforward along proper *representable* morphisms
  pass to rational equivalence and are functorial (vistoli1989 (3.6)(i)–(ii) and (3.7), lines
  974–997); push–pull holds for a proper representable and a flat morphism in a cartesian square
  (Lemma 3.9 (i), lines 1049–1065); the localisation sequence `A_i(𝒵) → A_i(ℳ) → A_i(ℳ ∖ 𝒵) → 0` is
  exact and exterior products `A_i(ℳ) ⊗ A_j(𝒩) → A_{i+j}(ℳ × 𝒩)` are defined (the scheme case is
  fulton1998 §§1.8 and 1.10, uncertified; vistoli1989 lines 1707–1708 for stacks); for a regular
  local immersion `F → G` of stacks and a morphism `Y → G` from a scheme, the refined Gysin map
  `A_*(Y) → A_{*−d}(F ×_G Y)` is defined integrally, commutes with proper pushforward and flat
  pullback along morphisms of schemes, and two such maps commute (vistoli1989 (3.10)–(3.13), lines
  1096–1123). This extends base §§2.2 and 2.4 from rational to integral coefficients.
  *Check:* integral pushforward along the non-representable `Bμ₂ → Spec k` cannot exist, since its
  degree is `1/2`.
- **T5 (stacks with a proper cover).** For stacks with a proper cover, not assumed separated:
  rational pushforward `A_i(ℱ)_ℚ → A_i(𝒢)_ℚ` along every proper morphism, with
  `f_*[𝒱] = deg(𝒱/f(𝒱)) [f(𝒱)]`, functorial and satisfying push–pull with flat morphisms
  (vistoli1989 (3.6)(iii)–(3.7), Lemmas 3.8–3.9, lines 985–1074); the action of the rational
  bivariant classes of representable morphisms on Chow groups of stacks, through proper coverings,
  compatible with proper pushforward and flat representable pullback, with the flat and
  regular-local-immersion orientations and `f^![G] = [F]` for a regular local immersion into an
  equidimensional `G` (vistoli1989 (5.1)–(5.5), lines 1550–1704); homotopy invariance
  `A_i(ℳ)_ℚ ≅ A_{i+r}(E)_ℚ` for a vector bundle `E → ℳ` of rank `r` with the zero-section Gysin
  inverse; and Chern classes of vector bundles with Whitney sum, pullback and top-Chern formula (the
  scheme cases are fulton1998 Theorem 3.3 and Chapter 3, uncertified; vistoli1989 lines 96–99 for
  their extension to stacks). This extends base §§2.2, 2.3 and 2.5 from separated stacks to stacks
  with a proper cover. *Check:* every scheme, separated or not, is its own proper cover; the line
  with a doubled origin has `A_0 ≅ ℤ`, generated by one origin, because `div(t)` is the sum of the
  two origins and every other closed point is a principal divisor, while `A_0(𝔸¹) = 0`. The base,
  whose groups are for separated stacks, has no such example.

### Products and comparisons

- **T6 (intersection ring).** For a smooth stack `ℳ` of pure dimension `n` with a proper cover (in
  particular a smooth separated stack), the product `x · y := Δ^!(x × y)` through the diagonal (the
  graph of the identity), a regular local immersion of codimension `n`, makes `A^*(ℳ)_ℚ = ⊕_c A_{n−c}(ℳ)_ℚ` a commutative,
  associative, unital graded ring with the formal properties of fulton1998 Proposition 8.1.1
  (vistoli1989 lines 1705–1718), and for every representable `T → ℳ` every rational bivariant class
  commutes with all others and evaluation on `[ℳ]` is an isomorphism `A^*(T → ℳ) ≅ A_*(T)_ℚ`
  (vistoli1989 Proposition 5.6, lines 1719–1724). Restricted to schemes it is the product of
  SchemeAndStackFoundations §5.6. *Check:* `A^*(BG)_ℚ = ℚ` for a finite étale group `G`.
- **T7 (moduli spaces).** Let `p : ℳ → M` be a moduli space in Vistoli's sense, with `M` an
  algebraic space of finite type over `k`: `p` is proper and induces a bijection between
  isomorphism classes of geometric points (vistoli1989 (2.1), lines 542–545, there with `M` a
  scheme). Then `𝒱 ↦ p(𝒱)` is a bijection of integral closed substacks with integral closed
  subspaces; `k(p(𝒱)) ⊆ k(𝒱)` is purely inseparable; `p_*[𝒱] = deg(𝒱/p(𝒱)) [p(𝒱)]` with
  `deg(𝒱/p(𝒱)) = [k(𝒱) : k(p(𝒱))]/e(𝒱)`, which is `1/e(𝒱)` when `k(p(𝒱))` is perfect; and
  `p_* : A_i(ℳ)_ℚ → A_i(M)_ℚ` is an isomorphism for every `i`, the right side being T2's group of
  the algebraic space. (vistoli1989 (2.4)–(2.5), lines 571–579; (6.1)(i), lines 1758–1776; Keel–Mori
  coarse spaces of separated stacks, SchemeAndStackFoundations §1.23 `keel_mori`, keel-mori1997
  Corollary 1.3, line 28, are moduli spaces in this sense, and vistoli1989 lines 546–560 compares
  moduli spaces with coarse ones up to universal homeomorphism.)
  *Checks:* for `[𝔸¹/μ₂] → 𝔸¹`, `p_*[Bμ₂] = ½[0]`, so integral pushforward is not defined and the
  integral `ℤ/2` of T1 dies rationally; in characteristic `p`, with `ℤ/p` acting on `𝔸²` by
  `y ↦ y + x`, the substack over `{x = 0}` has `e = p` and degree `1` over its image, so the
  inseparable factor `p` is visible and `1/e` is wrong; in characteristic `0` every degree is `1/e`.
- **T8 (quotients).** Let `G` be a smooth affine group of dimension `g` over `k` acting on a
  quasi-projective `k`-scheme `X` with a `G`-linearised ample invertible sheaf (the hypotheses of
  EquivariantIntersectionTheory Conventions 1 and 5), properly and with finite reduced stabilisers,
  so that `[X/G]` is a separated stack. Then flat pullback along the open `X ×^G U` of a
  representation bundle `[(X × V)/G] → [X/G]` gives isomorphisms
  `A^G_i(X) ⊗ ℚ ≅ A_{i−g}([X/G])_ℚ`, independent of `(V, U)`, compatible with flat pullback and
  proper pushforward; for `X` smooth they are ring isomorphisms between the equivariant product of
  EquivariantIntersectionTheory §2.2 and the product of T6. No quasi-projective moduli scheme is
  assumed: the route is homotopy invariance (base §2.3) and localisation (base §2.2), which is the
  homotopy property edidin-graham1998 names as the missing input (lines 758–768).
  *Checks (special cases):* edidin-graham1998 Propositions 10 and 11 (lines 770–773 and 790–793),
  where a quasi-projective moduli scheme exists; kresch1999 Theorem 2.1.12 (ii)–(iii) (lines
  225–229), the unconditional published form, which this roadmap does not import; for `μ_n` acting
  trivially on a point, `A^{μ_n}_*` has `ℤ/n` in every negative degree, invisible rationally.
- **T9 (points).** For a stack `ℳ` proper over `k` and the degree map `∫_ℳ : A_0(ℳ)_ℚ → ℚ`
  (pushforward to `Spec k`, base §2.2), the class of the residual gerbe `𝒢_x` at a closed point `x`
  (StackPointsAndResidualGerbes Layers 3–5) has `∫_ℳ [𝒢_x] = [κ(x) : k]/|Aut(x̄)|`, where `κ(x)` is
  the residue field of `x` and `Aut(x̄)` the automorphism group of a geometric point over `x`; the
  same formula on `Z_0(ℳ)` vanishes on integral rational equivalences; `∫_𝒩 ∘ f_* = ∫_ℳ` for proper
  `f : ℳ → 𝒩`, and `∫_ℳ = ∫_M ∘ p_*` for a moduli space as in T7; in particular base §7.7's virtual
  degree is computed on the moduli space. (vistoli1989 (1.15)–(1.17) applied to `𝒢_x → Spec k`,
  lines 365–452; (3.6)(iii)–(3.7), lines 985–997.) *Checks:* `∫[BG] = 1/|G|`; for the gerbe
  `[Spec ℂ/(ℤ/4)]` over `ℝ`, with `ℤ/4` acting through complex conjugation, which has no real point,
  `∫ = 2/4 = ½ = [ℝ : ℝ]/|Aut(x̄)|` with `|Aut(x̄)| = 2`, while dividing by the order `4` of the
  acting group gives `¼`; on `[ℙ¹/μ₂]` (`char k ≠ 2`) the two stacky points have degree `½` and
  `div(x²/(x² − 1)) = 2[𝒫] − [orbit of ±1]`, consistent with `2 · ½ = 1`.

### Virtual classes

Throughout, `𝔜` is an algebraic stack of pure dimension `d`, locally of finite type over `k`;
`X → 𝔜` is of relative Deligne–Mumford type with `X` a stack with a proper cover; `φ : E → L_{X/𝔜}`
is a perfect relative obstruction theory of constant rank (base §§6.4, 9.2); the absolute case is
`𝔜 = Spec k`.

- **T10 (no resolution property).** For any two global resolutions `F•`, `H•` of `E` (base §6.5),
  the fibre product `F₁ ×_{h¹/h⁰(E^∨)} H₁` is a vector bundle on `X` with smooth surjections onto
  `F₁` and `H₁`, and `0^!_{F₁}[C(F•)] = 0^!_{H₁}[C(H•)]` in `A_{d+rk E}(X)_ℚ`. Hence the class of
  base §§7.4 and 9.2 is defined, independent of the choice, whenever `E` has one global resolution,
  with no resolution property on `X` and for `X` with a proper cover rather than separated; it
  agrees with the base's class when the base's hypotheses hold. (behrend-fantechi1997 Definition
  5.2 and Proposition 5.3, lines 1282–1320, whose proof assumes at lines 1303–1305 that both
  resolutions map to `E` by morphisms of complexes, which on a stack without the resolution property
  need not hold; lines 1261–1262 for the condition of Vistoli in place of separatedness.)
  *Check:* for `E = [O(−4) --0--> Ω_{ℙ¹}]` on `ℙ¹`, the automorphism `1 + ξ` with
  `0 ≠ ξ ∈ Ext¹(Ω_{ℙ¹}, O(−4))` is represented by no morphism of complexes, yet the fibre product
  is defined.
- **T11 (relative lifting).** For `E` satisfying the coherence condition of base §4.4 and a morphism
  `φ : E → L_{X/𝔜}`, with `𝔜` only locally of finite type, the following are equivalent:
  (1) `H⁰(φ)` is an isomorphism and `H⁻¹(φ)` is surjective; (2) `𝔑_{X/𝔜} → h¹/h⁰(E^∨)` is a closed
  immersion; (3) for every square-zero extension `T ⊂ T̄` of schemes over `𝔜` with ideal `J` and
  every `g : T → X` over `𝔜`, the image in `Ext¹(g^*E, J)` of the relative obstruction class in
  `Ext¹(g^*L_{X/𝔜}, J)` vanishes exactly when `g` extends to `T̄` over `𝔜`, and the extensions then
  form a torsor under `Hom(g^*H⁰(E), J)`. The relative obstruction class and its universal property
  for lifts over `𝔜` are constructed here, globalising base §3.5. (behrend-fantechi1997 Theorem 4.5,
  lines 1162–1171, and its relative form, lines 1657–1663; extends base §§3.5, 6.1 and 6.3.)
- **T12 (relative formulas).** With `𝔜` of pure dimension but not necessarily smooth, `H⁰(E)`
  locally free and a global resolution: if `H⁻¹(E) = 0` then `X → 𝔜` is smooth and
  `[X/𝔜, E]^vir = [X]`; if `X → 𝔜` is smooth then `H¹(E^∨)` is locally free of rank `r` and
  `[X/𝔜, E]^vir = c_r(H¹(E^∨)) ∩ [X]`. (behrend-fantechi1997 Proposition 7.3, lines 1702–1711, in the
  setting of lines 1645–1651, whose base is pure-dimensional; extends base §9.4, stated over a smooth
  base.)
- **T13 (relative invariance of the rational equivalence).** Let `𝔅` be a reduced algebraic stack of
  pure dimension, `p : Y → 𝔅` smooth of Deligne–Mumford type from a stack, `𝔅' → 𝔅` a regular local
  immersion, `Y' = Y ×_𝔅 𝔅'`, and `X → Y` a local immersion such that `X → Y ×_𝔅 Y` is one too. Then
  Vistoli's rational equivalence `β(Y', X)` of base §2.5 is invariant under `T_{Y/𝔅}|_{X'}` acting on
  `N ×_Y C_{X/Y}`, and descends to the quotient by that action. For a regular local immersion
  `Y' → Y` of stacks smooth over a reduced pure-dimensional `𝔐`, it is invariant under
  `T_{Y'/𝔐}|_{X'}`. With `𝔐 = Spec k` this is kresch1999b Theorem 3.1 (lines 334–336), which base
  §2.5 owns. (Construction of `β` on a reduced equidimensional ambient: vistoli1989 Lemma 3.16,
  lines 1172–1173; behrend-fantechi1997 Propositions 3.3–3.4, lines 834 and 884, smooth base change
  and smooth factorisations; Proposition 3.5, line 889, claims invariance under all of `T_Y` and is
  wrong, kresch1999b lines 41–47 and 340–343.) *Check, imported:* the plane counterexample of base
  §2.5, whose bad direction is not relative to a base from which `Y'` is pulled back.
- **T14 (reduced bases).** In a cartesian square `X' → X` over `v : 𝔜' → 𝔜` of pure-dimensional
  bases with `v` of finite unramified diagonal, `u^*E` is a perfect relative obstruction theory with
  a global resolution, and `v^![X/𝔜, E]^vir = [X'/𝔜', u^*E]^vir` when `v` is a regular local
  immersion and `𝔜` is reduced (behrend-fantechi1997 Proposition 7.2 (2), lines 1682–1699, stated for
  smooth bases at lines 1668–1670). For theories compatible over a local complete intersection
  morphism `v : Z' → Z` of `𝔜`-stacks with finite unramified diagonal over `𝔜` (the compatibility
  data of base §§8.1 and 9.5), `v^![X, E]^vir = [X', F]^vir` when `v` is smooth, over any pure-dimensional `𝔜`,
  and when `Z` and `Z'` are smooth over a reduced `𝔜` (behrend-fantechi1997 Proposition 7.5, lines
  1721–1736, through Lemma 5.9 and Proposition 5.10, lines 1397 and 1428). Extends base §§8.4, 9.4
  and 9.5. The reducedness of `𝔜` enters only through T13 and vistoli1989 Lemma 3.16. *Check:* over
  the non-reduced `Spec k[ε]/(ε²)` the flat case applies and the regular case is not claimed.
- **T15 (deformation invariance).** Let `B` be a smooth connected curve over `k`, `𝔐` a reduced
  algebraic stack of pure dimension `m` (`𝔐 = Spec k` allowed), `X → 𝔐 × B` of Deligne–Mumford type
  with `X` proper over `B`, and `E` a perfect obstruction theory of rank `r` over `𝔐 × B` with a
  global resolution and `m + r = 0`. Then for every closed point `b ∈ B` the virtual count of the
  fibre `X_b` with the pulled-back theory, computed over `κ(b)`, is the same number. Route: T14 for
  the regular immersion `𝔐 × {b} → 𝔐 × B` and conservation of number on `B`. (li-tian1998 Theorem 4.2,
  lines 1472–1474, and its proof, lines 1486–1571; fulton1998 Proposition 10.2, uncertified.)
  *Checks:* without `m + r = 0` the fibre classes are not zero-cycles; a regular section of a bundle
  on a smooth proper family counts its zeros with multiplicity.

### Maps from curves

- **T16 (the obstruction theory of a space of maps).** Let `𝔅` be an algebraic stack of pure
  dimension `b`, locally of finite type over `k`, `𝒞 → 𝔅` a representable morphism whose base change
  to every scheme is a prestable family (Tau Ceti `PrestableFamily`; StableReduction Layer 3), `X` a
  smooth quasi-projective `k`-scheme, `M` a stack with a proper cover and a morphism `M → 𝔅` of
  Deligne–Mumford type, and `F : 𝒞_M → X` from the pulled-back family `π : 𝒞_M → M`, such that
  `(M, F)` is a relative space of maps: for every square-zero extension of schemes over `𝔅`, lifts of
  `T → M` correspond to extensions of the induced map `𝒞_T → X`. Every open substack of the stack
  of morphisms `Mor_𝔅(𝒞, X)` satisfies this, and the stack of stable maps is such an open substack
  over the prestable-curve stack (behrend1997 Proposition 4, lines 139–140).
  Then `Rπ_*F^*T_X` is perfect of amplitude `[0, 1]` and commutes with base change; the
  Kodaira–Spencer morphism and Grothendieck duality along `π` give
  `φ : (Rπ_*F^*T_X)^∨ → L_{M/𝔅}` into the cotangent complex of base §3.3, a perfect relative
  obstruction theory with obstruction sheaf `R¹π_*F^*T_X`; if `M` is quasi-compact and `𝒞_M`
  carries an invertible sheaf ample on the fibres of `π`, it has a global resolution
  `[R¹π_*H → R¹π_*G]`; and on the part where the fibres have genus `g` and `F^*T_X` has fibre degree
  `δ`, the rank is `δ + dim X · (1 − g)` by Riemann–Roch, so the virtual dimension is
  `b + δ + dim X · (1 − g)`. (behrend-fantechi1997 Proposition 6.2, lines 1602–1614, for `𝔅 = Spec k`
  and a fixed curve; behrend1997 lines 148–161 for the relative form and the rank, Proposition 5,
  lines 165–187, for the resolution; li-tian1998 Theorem 4.3 (1), lines 1585–1586.)
  *Checks:* `X = Spec k` gives `E = 0`, which is an obstruction theory exactly when `M → 𝔅` is étale;
  for `𝔅 = Spec k`, `C = ℙ¹` and `X = ℙ^r` the obstruction sheaf vanishes and the space of degree-`d`
  maps is smooth of dimension `(r + 1)d + r`; with `b = 3g − 3 + n` and `δ = c₁(T_X) · β` the
  dimension is `(1 − g)(dim X − 3) + n + c₁(T_X) · β`, the number of AlgebraicGromovWittenTheory
  §4.3, checked numerically without importing that roadmap; without the relative-space hypothesis
  the conclusion fails (a single point carrying `id : ℙ¹ → ℙ¹`).

**Generality.** Special cases of the filed wording kept as Checks: the Edidin–Graham comparison
under a quasi-projective moduli scheme (T8); moduli spaces that are schemes (T7, Vistoli's
statement); characteristic `0`, where degrees to the moduli space are `1/e` (T7); smooth bases
(T12, T14, the base's statements); separated stacks with the resolution property (T10, the base's
statement); smooth projective targets over an algebraically closed field of characteristic zero
over the prestable-curve stack (T16, AlgebraicGromovWittenTheory §§4.1–4.3). Widenings beyond the
filed wording, both supported by the sources: virtual-class statements for stacks with a proper
cover (behrend-fantechi1997 lines 1261–1262), and T8 without a moduli scheme.

## Suppliers

- **VirtualFundamentalClass** (roadmap pull request 1996; the base): §§0.2–0.3, 1.4–1.6, 2.1–2.5,
  3.1–3.5, 4.1–4.5, 5.1–5.5, 6.1–6.6, 7.1–7.7, 8.1–8.5, 9.1–9.6, as listed in the Scope. Not yet in
  the merge order; this roadmap must follow it.
- **SchemeAndStackFoundations** (main): Layer 1, in particular §§1.10, 1.18–1.22 and §1.23
  (`IsCoarseModuliSpace`, `keel_mori`); §§2.19–2.20 (right adjoint of pushforward, upper shriek,
  relative dualising sheaves) for duality along `π` in T16; §3.3 (Riemann–Roch on curves) for T16;
  §4.1 (thickenings and lifting for smooth targets) for T11 and T16; §§5.1–5.6 (scheme Chow groups,
  pushforward, pullback, localisation, Chern classes, Gysin maps, intersection products).
- **StackPointsAndResidualGerbes** (a design on the board, not yet a package and not in the merge
  order): Layer 0 (closed, reduced and integral substacks, the reduced induced closed substack),
  Layer 1 (automorphism groups of points, §1.3), Layers 3–5 (residual gerbes, existence at closed
  points, the residue field, §5.3) for T1, T3, T7 and T9. Its own scope lists the stopped package
  VirtualFundamentalClasses as a consumer; that consumer is now this roadmap.
- **EquivariantIntersectionTheory** (main): Conventions 1, 4 and 5; §2.1 (Totaro's approximation),
  §2.2 (operations and the equivariant product) for T8.
- **StableReduction** (main): Layer 2 (coherent pushforward, cohomology and base change, the relative
  dualising sheaf of nodal families, relative ampleness), Layer 3 (prestable families); Tau Ceti's
  `PrestableFamily` (`TauCeti/AlgebraicGeometry/Curves/Prestable.lean`) for T16.
- **EnhancedDerivedSheaves** (main): §0.3, E1.4 (pullback–pushforward adjunction on ringed sites) and
  E1.8 for `Rπ_*` and duality on stack sites in T16, as the base uses them.
- **DerivedModuleAlgebra** (main): §0.25 (square-zero obstruction classes of ring maps), through base
  §3.5, for the relative obstruction class of T11.
- The inputs of the stopped package from AlgebraicVectorBundles and EllipticCohomology are not
  needed: the base supplies cones, vector bundles on stacks, the cotangent complex and cone stacks.

## Consumers

- **AlgebraicGromovWittenTheory** (roadmap pull request 1998): its §§4.1–4.3 are the special case of
  T16 (with T10 removing its use of the resolution property, which its §4.2 derives from the quotient
  presentation); T15 gives deformation invariance of its invariants. It is a consumer, never a
  supplier: this roadmap does not import the stable-map stack.
- **StableReductionPartII** (roadmap pull request 1841): uses base §§2.1–2.3 and
  EquivariantIntersectionTheory for intersection theory on `M̄_g`; T6 (ring), T7 (the coarse space
  `M̄_g` and its inseparable degrees in positive characteristic) and T8 (`M̄_g` as `[U_g/PGL]`) are
  the comparisons it will want.
- **StackPointsAndResidualGerbes**: the board design names the stopped package as its consumer for
  degrees of zero-dimensional integral substacks; T9 is that consumer.
- Future roadmaps on torus localisation of virtual classes, cosection localisation, and
  Donaldson–Thomas or stable-pair theories over arbitrary fields: they consume T10–T16. None is
  filed.

## Sources

| id | work | locators used | where it can be read |
| --- | --- | --- | --- |
| vistoli1989 | A. Vistoli, *Intersection theory on algebraic stacks and on their moduli spaces*, Invent. Math. 97 (1989) | (1.1), (1.5)–(1.7), (1.10)–(1.17), (1.19)–(1.20), (2.1), (2.4)–(2.6), (3.1)–(3.13), Lemma 3.16, (5.1)–(5.6), (6.1), (6.7), (7.14) | GDZ, open repository (image scan, OCR text) |
| behrend-fantechi1997 | K. Behrend, B. Fantechi, *The intrinsic normal cone*, Invent. Math. 128 (1997) | Theorem 4.5; Definitions 4.4, 5.1–5.2; Propositions 3.3–3.5, 5.3, 5.10, 6.2, 7.1–7.5; Lemma 5.9 | arXiv alg-geom/9601010v1, open |
| kresch1999b | A. Kresch, *Canonical rational equivalence of intersections of divisors*, Invent. Math. 136 (1999) | Theorem 3.1, Proposition 2.3, remarks on BF Proposition 3.5 | arXiv alg-geom/9710011v2, open |
| behrend1997 | K. Behrend, *Gromov–Witten invariants in algebraic geometry*, Invent. Math. 127 (1997) | Propositions 2, 4, 5; relative obstruction theory and rank | arXiv alg-geom/9601011v1, open |
| li-tian1998 | J. Li, G. Tian, *Virtual moduli cycles and Gromov–Witten invariants of algebraic varieties*, J. AMS 11 (1998) | Theorem 4.2 and proof; Theorem 4.3 (1) | arXiv alg-geom/9602007v6, open |
| keel-mori1997 | S. Keel, S. Mori, *Quotients by groupoids*, Ann. of Math. 145 (1997) | Theorem 1.1, Corollary 1.3 | arXiv alg-geom/9508012v1, open |
| edidin-graham1998 | D. Edidin, W. Graham, *Equivariant intersection theory*, Invent. Math. 131 (1998) | Propositions 10–11 and the preceding remarks | arXiv alg-geom/9603008v3, open |
| kresch1999 | A. Kresch, *Cycle groups for Artin stacks*, Invent. Math. 138 (1999) | Theorem 2.1.12 (ii)–(iii), Theorem 6.2.1 (boundary and Check only) | arXiv math/9810166v1, open |
| deligne-mumford1969 | P. Deligne, D. Mumford, *The irreducibility of the space of curves of given genus*, Publ. IHÉS 36 (1969) | Theorem 4.12 | Numdam, open |
| stacks-chow | The Stacks Project, Chow Homology (Tag 02P3) | Situation 7.1, Example 7.2, Definition 19.1 | Stacks Project, open |
| stacks-chow-spaces | The Stacks Project, Chow Groups of Spaces (Tag 0EDQ) | Situation 2.1, Definitions 3.1, 15.1 | Stacks Project, open |
| gillet1984 | H. Gillet, *Intersection theory on algebraic stacks and Q-varieties*, JPAA 34 (1984) | §4 | paywalled: `uncertified`, cited by locator |
| fulton1998 | W. Fulton, *Intersection Theory*, 2nd ed. (1998) | §§1.8, 1.10, Theorem 3.3, Ch. 6, Proposition 8.1.1, Proposition 10.2 | paywalled: `uncertified`, cited by locator |

All texts other than the two paywalled ones were read through the sources service; no text is
missing, and `needs-references.toml` is not needed.

## Risks

- **Base and sibling are open pull requests by another author.** VirtualFundamentalClass and
  AlgebraicGromovWittenTheory are not in the merge order and their heads move (this triage read
  `676f128` and `1949322`). The design must cite base sections by number and title, re-check them
  against the head it reads, and be ordered after the base. If the base's §2.5 drops the
  Kresch invariance or the plane check, T13's absolute case and that Check return here.
- **A supplier that is only a design.** StackPointsAndResidualGerbes is under review (round 6, needs
  changes, with a finding on closed-substack ownership against the stopped package). T1, T3, T7 and
  T9 need its closed substacks and residual gerbes; the design must order after it, or fall back to
  SchemeAndStackFoundations §1.20 and the base's §2.1 integral closed substacks for the definitions
  it needs.
- **Foundations far above the library.** Neither Mathlib nor the pinned Tau Ceti has algebraic
  stacks, Chow groups of stacks or the cotangent complex of a stack; everything rests on planned
  roadmaps. The base's own `Suggested.lean` states no theorem. The design will have to decide how
  much of the acceptance test can be stated against the pins with simple definitions only, and
  T16's scheme-level special case (a fixed curve, `𝔅 = Spec k`) and T6–T9 on quotient examples are
  the likeliest candidates.
- **Statements no source states in this generality.** T13 (relative invariance over a reduced base),
  T14 (reduced instead of smooth bases), T7 (algebraic-space moduli spaces), T8 (no moduli scheme),
  T10 (no resolution property, repairing the assumption at behrend-fantechi1997 lines 1303–1305), and
  the virtual-class statements for non-separated stacks with a proper cover. Each needs a written
  proof route in the design; the stopped package's design text has routes for all of them and may be
  reused. If a route fails, the statement falls back to the source's hypotheses, which for T12–T14
  are the base's and would make it a duplicate to drop.
- **Vistoli's standing hypothesis.** vistoli1989 §3 assumes every stack has a proper cover (lines
  887–890). The design must check, statement by statement, which integral statements of T1 and T4
  use it (non-representable images and Lemma 3.8 do) and state the hypothesis there.
- **Errors in the sources.** behrend-fantechi1997 Proposition 3.5 is wrong (kresch1999b lines 41–47,
  340–343); Proposition 5.3's proof assumes morphisms of complexes; line 1609 in the proof of
  Proposition 6.2 takes an Ext over the curve that should be over the test scheme. The base's §8.4
  reduces functoriality through the graph and a projection, and the stopped package recorded a doubt
  about one compatibility in that reduction (a smooth conic in the plane); T14's functoriality must
  use a route that needs compatibility only over `v`.
- **Duality on stacks.** T16 needs Grothendieck duality `π^! = Lπ^*(−) ⊗ ω_π[1]` for prestable
  families over Deligne–Mumford stacks; SchemeAndStackFoundations §§2.19–2.20 has it for schemes
  only, and no roadmap plans the étale descent to stacks. This roadmap must own that step.
- **OCR and paywalls.** vistoli1989 is an image scan read by OCR, with damaged lines (the end of
  Definition 1.11 and the displayed formula of (1.15) are lost); paragraph numbers are reliable.
  gillet1984 and fulton1998 are paywalled and cited by locator only (`uncertified`).
- **Overlap left in AlgebraicGromovWittenTheory.** Its §§4.1–4.3 plan a special case of T16. This
  roadmap does not import them; a later revision of that roadmap may cite T16 instead. Until then the
  special case is planned twice, by the maintainer's decision.
