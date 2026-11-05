Verdict: design
Name: VirtualFundamentalClasses
Base: none
Owner: none

## Scope

Rational intersection theory on Deligne–Mumford stacks and the Behrend–Fantechi virtual
fundamental class, at the generality of the three source theories: Vistoli's cycle theory on
DM stacks of finite type over an arbitrary field `k` (vistoli1989 §3, lines 886–1118), the
Edidin–Graham comparison for quotient stacks (edidin-graham1998 lines 758–793), and
Behrend–Fantechi's cone stacks, intrinsic normal cone, obstruction theories and virtual classes
in their relative form over an algebraic stack of pure dimension (behrend-fantechi1997 §§2–5
and §7, lines 574–1366 and 1644–1739). The field `k` is arbitrary; no characteristic, perfectness
or algebraic-closure hypothesis is imposed except where the statement needs it, and then the
hypothesis is stated on that statement alone.

The roadmap owns, in this order:

1. **Cycles on DM stacks.** For a DM stack `ℳ` of finite type over `k` (SchemeAndStackFoundations
   §1.19 `IsDeligneMumford`): integral closed substacks (stacks-properties §9, tag 04YK, line 764,
   and §10), their dimension computed through an étale atlas and its independence of the atlas
   (stacks-properties §12, tag 0AFL, line 1370; Definition 12.2, tag 0AFN, line 1404), the group
   `Z_m(ℳ)` (vistoli1989 (3.1), line 892), the cycle `[𝒢]` of a closed substack (vistoli1989
   (3.5), line 971), and the degree `deg(ℱ/𝒢)` of a separated dominant morphism of integral
   stacks with the formula `deg(ℱ/𝒢) = (e(𝒢)/e(ℱ))·[k(ℱ):k(𝒢)]` (vistoli1989 (1.16)–(1.17),
   lines 357–432; `deg(BG/S) = 1/n` for `G` finite étale of order `n`, line 373).
2. **Rational equivalence and Chow groups.** The function field of an integral stack, the order
   `ord_𝒲(f)` along an integral substack of codimension one computed on an étale chart and its
   independence of the chart, `div(f)`, the group of rational equivalences `R_m(ℳ)` and
   `A_m(ℳ) = Z_m/R_m` (vistoli1989 (3.2)–(3.4), lines 901–961; Gillet's definition), and
   `A_m(ℳ)_ℚ`. Integral where the source is integral: only the statements the source proves
   with rational coefficients (non-representable pushforward, the coarse-space comparison, the
   degree) are rational.
3. **Operations.** Flat pullback, proper pushforward along representable proper morphisms
   (integral) and along arbitrary proper morphisms (rational), and the fact that they pass to
   rational equivalence (vistoli1989 (3.6)–(3.7), lines 974–997); the Gysin homomorphism of a
   regular local embedding and its three compatibilities (vistoli1989 (3.10)–(3.13), lines
   1096–1118), specialised to the zero section of a vector bundle on a DM stack; the bivariant
   classes used by Behrend–Fantechi (vistoli1989 (5.1), line 1550; behrend-fantechi1997 lines
   1630–1643).
4. **Comparisons.** Agreement with SchemeAndStackFoundations Layer 5 for schemes (`ChowGroup`,
   `RatEquiv`, `cyclesOfDimension`, `Chow.properPushforward`, §§5.1–5.2, §5.5) and with the
   Chow groups of algebraic spaces of the Stacks Project (stacks-chow-spaces §§3, 15, 32, lines
   10–39); for a separated `ℳ` with a coarse moduli space `p : ℳ → M̄` (SchemeAndStackFoundations
   §1.23 `keel_mori`; keel-mori1997 Theorem 1.1 line 13, Corollary 1.3 line 28) the
   isomorphism `p_* : A_*(ℳ)_ℚ ≅ A_*(M̄)_ℚ` with `p_*[𝒱] = deg(𝒱/p(𝒱))·[p(𝒱)]` (vistoli1989
   (6.1), line 1758; (2.1) line 542 for Vistoli's notion of moduli space and its agreement with
   the coarse space up to universal homeomorphism, lines 546–560), and `deg(𝒱/p(𝒱)) = 1/e(𝒱)`
   whenever the function field of `p(𝒱)` is perfect (vistoli1989 (2.4)–(2.5), lines 571–579);
   agreement with the Edidin–Graham groups of EquivariantIntersectionTheory Layer 2 after `⊗ ℚ`
   for a separated DM quotient stack `[X/G]` under the Edidin–Graham hypotheses
   (edidin-graham1998 Proposition 10, line 770; Proposition 11, line 790); the statement of
   Kresch's comparison `A°_*(ℳ) ⊗ ℚ ≅ A_*(ℳ) ⊗ ℚ` (kresch1999 Theorem 2.1.12 (ii), line 225) is
   recorded as a Check against a future roadmap on Chow groups of Artin stacks and is not proved
   here.
5. **Degree of zero-cycles.** `deg [𝒢_x] = [k(x):k]/|Aut(x̄)|` for the residual gerbe of a closed
   point (the residual gerbe and `Aut(x̄)` from StackPointsAndResidualGerbes T4–T9), its
   extension to `Z_0(ℳ)_ℚ`, vanishing on `R_0(ℳ)_ℚ` for proper `ℳ`, the map
   `∫_ℳ : A_0(ℳ)_ℚ → ℚ`, and its compatibility with `p_*` to the coarse space and with proper
   pushforward (vistoli1989 (3.6)(ii)–(3.7) applied to `ℳ → Spec k`, lines 980–997, and (1.17),
   line 428; the scheme case is `deg` of SchemeAndStackFoundations §5.2).
6. **Cones and cone stacks.** Abelian cones `C(ℱ) = Spec Sym ℱ`, normal cones `C_{U/W} ⊆ N_{U/W}`
   of a closed immersion into a scheme smooth over the base, of pure dimension `dim W`
   (SchemeAndStackFoundations §5.5 `normalCone`; behrend-fantechi1997 §1 and line 998 citing
   Fulton B.6.6); cone stacks and the quotient `[C/E]` of a cone by a vector bundle acting on it
   (behrend-fantechi1997 Proposition 1.4, line 323; Proposition 1.10, line 487).
7. **Stacks of the form `h¹/h⁰`.** For a complex `E` on the small étale site of `ℳ` satisfying
   Condition (⋆) (cohomology in degrees `≤ 0`, coherent in degrees `0` and `−1`;
   behrend-fantechi1997 Definition 2.3, line 670), the abelian cone stack `h¹/h⁰(E^∨)`, equal on a
   presentation `[E^{−1} → E^0]` to `[C(E^{−1})/C(E^0)]`, independent of the presentation, and a
   vector bundle stack when `E` is perfect of amplitude `[−1, 0]` (Proposition 2.4, line 674); a
   map `φ : E → F` gives a closed immersion `h¹/h⁰(F^∨) → h¹/h⁰(E^∨)` iff `h⁰(φ)` is an
   isomorphism and `h^{−1}(φ)` is surjective (Proposition 2.6, line 725).
8. **The truncated relative cotangent complex and the intrinsic normal cone.** For `M → 𝔐` of
   Deligne–Mumford type (unramified diagonal) with `𝔐` an algebraic `k`-stack of pure dimension
   `m`, the object `τ^{≥−1} L_{M/𝔐}` of the derived category of the small étale site of `M`,
   glued from the two-term complexes `[I/I² → Ω_{W/𝔐}|_U]` of local embeddings `U → W` (`U → M`
   étale, `U → W` a closed immersion into a scheme smooth over `𝔐`; behrend-fantechi1997
   Definition 3.7, line 906, and lines 940–951 citing Illusie III.3.1.3; the full cotangent
   complex of a morphism of algebraic stacks is olsson2007 §8, line 1127); the intrinsic normal
   sheaf `N_{M/𝔐} = h¹/h⁰((τ^{≥−1} L_{M/𝔐})^∨)` (Definition 3.6, line 902; relative form lines
   1652–1653); the closed subcone stack `C_{M/𝔐} ⊆ N_{M/𝔐}` glued from `[C_{U/W}/T_{W/𝔐}|_U]`
   (Corollary 3.9, line 972; Definition 3.10, line 983), of pure dimension `m` (Theorem 3.11,
   line 985; relative form line 1656); products and pullback (Propositions 3.13–3.14, lines
   1024–1040; Proposition 7.1, line 1676).
9. **Obstruction theories.** `φ : E → τ^{≥−1} L_{M/𝔐}` with `h⁰(φ)` an isomorphism and
   `h^{−1}(φ)` surjective, perfect if `E` is perfect of amplitude `[−1, 0]` (Definition 4.4, line
   1139; relative form line 1657), the rank, the virtual dimension `vd = rk E + m` (line 1269;
   relative form line 1666), the obstruction sheaf `h¹(E^∨)`, and the equivalence of (1) `φ` is
   an obstruction theory, (2) `N_{M/𝔐} → h¹/h⁰(E^∨)` is a closed immersion, (3) the
   deformation-theoretic criterion on square-zero extensions (Theorem 4.5, line 1162).
10. **The virtual fundamental class.** For a perfect relative obstruction theory with a global
    resolution `[F^{−1} → F^0] ≅ E` (Definition 5.2, line 1282), the cone `C(F) = C_{M/𝔐}
    ×_{h¹/h⁰(E^∨)} C(F^{−1})` of pure dimension `rk F^0 + m` and `[M]^vir := 0^!_{C(F^{−1})}[C(F)]
    ∈ A_{vd}(M)_ℚ` (lines 1286–1298), independent of the global resolution (Proposition 5.3, line
    1299); the unobstructed, locally-free-obstruction, product, pullback and functoriality
    properties (Propositions 5.5–5.7, lines 1353–1366; Propositions 7.2–7.5, lines 1682–1734);
    virtual counts `deg [M]^vir ∈ ℚ` for proper `M` with `vd = 0` (item 5). Kresch's removal of
    the global-resolution hypothesis (kresch1999 Theorem 6.2.1, line 1632) needs Chow groups of
    Artin stacks and is out of scope.
11. **The Gromov–Witten obstruction theory.** For a family of stable maps over a DM stack `M`,
    that is a proper flat relatively Gorenstein family of prestable curves `π : 𝒞 → M` with
    markings and a morphism `f : 𝒞 → X` to a smooth projective `k`-variety, with `M → 𝔐` of DM
    type to the smooth Artin stack of prestable pointed curves of dimension `3g − 3 + n`
    (behrend1997 Proposition 2, line 99): `E = (Rπ_* f^* T_X)^∨` is a perfect relative
    obstruction theory for `M/𝔐` (behrend-fantechi1997 Proposition 6.1, line 1549, and
    Proposition 6.2 in its relative form as used at behrend1997 lines 148–150), it has global
    resolutions (behrend1997 Proposition 5, line 165), and `vd = ∫_β c_1(T_X) + (dim X − 3)(1 − g)
    + n` (behrend1997 lines 193–197; li-tian1998 Theorem 4.3 (1), line 1586). The application to
    the moduli stack `M̄_{g,n}(X, β)` itself is a Check that imports that stack and its
    properness from the roadmap that will own them (see Risks).

**Boundaries.** Not owned here: Chow groups of schemes, Chern classes, deformation to the
normal cone and refined Gysin maps on schemes (SchemeAndStackFoundations Layer 5); algebraic
stacks, DM stacks, coarse moduli spaces and Keel–Mori (SchemeAndStackFoundations §§1.18–1.23);
the moduli stack of stable pointed curves (SchemeAndStackFoundations §4.15); points,
stabilisers, closed substacks as far as residual gerbes need them, and residual gerbes
(StackPointsAndResidualGerbes); equivariant Chow groups and the Picard groups of quotient
stacks (EquivariantIntersectionTheory, PR #1685); the cotangent complex of ring maps
(DerivedModuleAlgebra §§0.4–0.13, §0.25) and its animated enhancement (EnhancedDerivedSheaves
E5); stable maps as objects and families (StableReduction Layers 10–11); the Artin stack of
prestable curves, the moduli stack of stable maps, its properness and the Gromov–Witten
invariants of a projective variety with their axioms (a roadmap to be filed; behrend-manin1996
Theorem 3.14, line 1018; fulton-pandharipande1997 Theorem 1, line 581; behrend1997 Theorem 6,
line 198); Kresch's Chow groups of Artin stacks (kresch1999 Theorem 2.1.12, line 213);
torus localisation of virtual classes and cosection localisation (graber-pandharipande1999
Propositions 1 and 3, lines 222 and 1171; kiem-li2013 Theorem 1.1, line 21), which are
consumers; the symplectic virtual class (GromovWittenTheory PR #990, AnalyticStableMaps PR #987,
ImplicitAtlases PR #974) and any comparison with it.

**Generality.** The filed wording has three special cases that become Checks: `deg(𝒱/p(𝒱)) =
1/e_𝒱` "in characteristic zero" is proved whenever the function field of `p(𝒱)` is perfect
(vistoli1989 (2.5), line 578), so characteristic zero is a Check; the comparison with
Edidin–Graham is stated under the Edidin–Graham hypotheses of that roadmap (a `G`-linearised
ample invertible sheaf) rather than for every quotient stack, the general case belonging to
Kresch's theory; the Gromov–Witten class is stated for an arbitrary family of stable maps over
a DM stack of DM type over `𝔐`, the universal family being the Check. Everything else is at the
generality of the sources: arbitrary field `k`, DM stacks of finite type, base stack `𝔐` an
algebraic `k`-stack of pure dimension (behrend-fantechi1997 lines 1645–1651).

## Final targets

Each statement is in the author's words; locators are into the manifest texts.

- **T1 (Chow groups of DM stacks).** For `ℳ` a DM stack of finite type over a field `k` and
  `m ≥ 0`: `Z_m(ℳ)`, `R_m(ℳ) ⊆ Z_m(ℳ)` and `A_m(ℳ) = Z_m/R_m` are defined, with `A_m(ℳ)_ℚ`; for
  `ℳ` a scheme they are `cyclesOfDimension`, `RatEquiv` and `ChowGroup` of
  SchemeAndStackFoundations §5.1; for `ℳ` an algebraic space they agree with stacks-chow-spaces
  §§3 and 15 (lines 10 and 22). (vistoli1989 (3.1)–(3.4), lines 892–961.)
- **T2 (operations).** Flat pullback `f^* : A_m(𝒢) → A_{m+d}(ℱ)` for `f` flat of relative
  dimension `d`; proper pushforward `f_* : A_m(ℱ) → A_m(𝒢)` for `f` proper representable, and
  `f_* : A_m(ℱ)_ℚ → A_m(𝒢)_ℚ` for `f` proper, with `f_*[ℱ'] = deg(ℱ'/f(ℱ'))·[f(ℱ')]`; both pass
  to rational equivalence and are functorial; for `f : ℱ → 𝒢` a regular local embedding, the
  Gysin map `f^! : A_m(𝒴) → A_{m−d}(𝒴 ×_𝒢 ℱ)` commutes with proper pushforward and flat
  pullback and two Gysin maps commute; for the zero section `s` of a vector bundle `E → ℳ` of
  rank `r`, `s^! : A_m(E) → A_{m−r}(ℳ)` is inverse to `π^*`. (vistoli1989 (3.6)–(3.7), lines
  974–997; (3.10)–(3.13), lines 1096–1118; agreement with SchemeAndStackFoundations §§5.2, 5.5 on
  schemes.)
- **T3 (coarse moduli comparison).** For `ℳ` separated of finite type over `k` with coarse
  moduli space `p : ℳ → M̄` (an algebraic space, proper and quasi-finite over which `ℳ` lies;
  SchemeAndStackFoundations §1.23 `keel_mori`): `p_* : A_m(ℳ)_ℚ → A_m(M̄)_ℚ` is an isomorphism
  for every `m`, with `p_*[𝒱] = deg(𝒱/p(𝒱))·[p(𝒱)]` and `deg(𝒱/p(𝒱)) = [k(𝒱):k(p(𝒱))]/e(𝒱)`,
  which equals `1/e(𝒱)` when `k(p(𝒱))` is perfect; Check: characteristic zero. (vistoli1989
  (1.17), line 428; (2.1), (2.4)–(2.5), lines 542–579; (6.1), line 1758.)
- **T4 (Edidin–Graham comparison).** Let `G` be a smooth affine group scheme over `k` acting
  properly with finite stabilisers on a quasi-projective `k`-scheme `X` with a `G`-linearised
  ample invertible sheaf, so that `[X/G]` is a separated DM stack, and assume `[X/G]` has a
  quasi-projective coarse moduli scheme. Then `A^G_{m+dim G}(X) ⊗ ℚ ≅ A_m([X/G]) ⊗ ℚ`, where the
  left side is the equivariant Chow group of EquivariantIntersectionTheory §2.1; for `X` smooth
  the isomorphism is one of rings. (edidin-graham1998 Proposition 10, line 770, and Proposition
  11, line 790; Kresch's unconditional statement, kresch1999 Theorem 2.1.12 (ii)–(iii), lines
  225–229, is a Check against a future roadmap.)
- **T5 (degree of zero-cycles).** For `ℳ` proper over `k`, the homomorphism `Z_0(ℳ)_ℚ → ℚ`
  sending `[𝒢_x]`, the residual gerbe of a closed point `x` (StackPointsAndResidualGerbes T4,
  T7, T9), to `[k(x):k]/|Aut(x̄)|` vanishes on `R_0(ℳ)_ℚ` and defines `∫_ℳ : A_0(ℳ)_ℚ → ℚ`;
  `∫_ℳ = ∫_{M̄} ∘ p_*` for the coarse moduli space and `∫_𝒩 ∘ f_* = ∫_ℳ` for `f : ℳ → 𝒩` proper;
  on schemes it is `deg` of SchemeAndStackFoundations §5.2. (vistoli1989 lines 357–376 and 428;
  (3.6)(ii)–(3.7), lines 980–997, applied to the structure morphism.)
- **T6 (`h¹/h⁰`).** For `E` on the small étale site of a DM stack `ℳ` satisfying (⋆),
  `h¹/h⁰(E^∨)` is an abelian cone stack over `ℳ`, equal to `[C(E^{−1})/C(E^0)]` for any
  presentation `[E^{−1} → E^0]` with `E^0` locally free, hence independent of the presentation,
  and a vector bundle stack when `E` is perfect of amplitude `[−1, 0]`; a morphism `φ : E → F`
  of such complexes induces a closed immersion `h¹/h⁰(F^∨) → h¹/h⁰(E^∨)` iff `h⁰(φ)` is an
  isomorphism and `h^{−1}(φ)` is surjective, and an isomorphism iff both are isomorphisms.
  (behrend-fantechi1997 Definition 2.3, line 670; Proposition 2.4, line 674; Proposition 2.6,
  line 725.)
- **T7 (intrinsic normal cone).** For `M → 𝔐` of DM type with `M` a DM stack of finite type
  over `k` and `𝔐` an algebraic `k`-stack of pure dimension `m`: `τ^{≥−1} L_{M/𝔐}` satisfies
  (⋆); `N_{M/𝔐} = h¹/h⁰((τ^{≥−1} L_{M/𝔐})^∨)` is an abelian cone stack with local presentations
  `[N_{U/W}/T_{W/𝔐}|_U] ≅ N_{M/𝔐}|_U` for every local embedding `(U, W)`; there is a unique
  closed subcone stack `C_{M/𝔐} ⊆ N_{M/𝔐}` restricting to `[C_{U/W}/T_{W/𝔐}|_U]` on every local
  embedding; `C_{M/𝔐}` has pure dimension `m` and abelian hull `N_{M/𝔐}`; for a cartesian square
  over `v : 𝔐' → 𝔐` with `v` of finite unramified diagonal there is a closed immersion
  `C_{M'/𝔐'} → C_{M/𝔐} ×_𝔐 𝔐'`, an isomorphism when `v` is flat. (behrend-fantechi1997
  Definitions 3.6–3.7, lines 902–906; lines 940–951; Corollary 3.9, line 972; Definition 3.10,
  line 983; Theorem 3.11, line 985; lines 1644–1656; Proposition 7.1, line 1676.)
- **T8 (obstruction theories).** In the setting of T7, for `E` satisfying (⋆) and `φ : E →
  τ^{≥−1} L_{M/𝔐}`, the following are equivalent: (1) `h⁰(φ)` is an isomorphism and `h^{−1}(φ)`
  is surjective; (2) `φ^∨ : N_{M/𝔐} → h¹/h⁰(E^∨)` is a closed immersion of cone stacks; (3) for
  every square-zero extension `T ⊆ T̄` of `𝔐`-schemes with ideal `J` and every `g : T → M` over
  `𝔐`, the image of the obstruction class in `Ext¹(g^*E, J)` vanishes iff `g` extends to `T̄`,
  and the extensions then form a torsor under `Hom(g^*h⁰(E), J)`. (behrend-fantechi1997
  Definition 4.4, line 1139; Theorem 4.5, line 1162; relative form lines 1657–1663.)
- **T9 (virtual fundamental class).** In the setting of T7 with `M` separated, let `φ : E →
  τ^{≥−1} L_{M/𝔐}` be a perfect obstruction theory of constant rank with a global resolution
  `[F^{−1} → F^0] ≅ E`. Then `C_1 := C_{M/𝔐} ×_{h¹/h⁰(E^∨)} C(F^{−1})` is a closed subcone of
  the vector bundle `C(F^{−1}) = (F^{−1})^∨` of pure dimension `m + rk F^0`, and
  `[M]^vir := 0^!_{C(F^{−1})}[C_1] ∈ A_{vd}(M)_ℚ`, `vd = rk E + m`, is independent of the global
  resolution. Moreover: if `h¹(E^∨) = 0` then `M → 𝔐` is smooth and `[M]^vir = [M]`; if `M` is
  smooth over `𝔐` and `h¹(E^∨)` is locally free then `[M]^vir = c_{top}(h¹(E^∨)) ∩ [M]`;
  `[M × M']^vir = [M]^vir × [M']^vir` for products; for a cartesian square over a flat, or a
  regular local embedding, `v : 𝔐' → 𝔐` and the pulled-back obstruction theory,
  `[M']^vir = v^! [M]^vir`; compatible obstruction theories satisfy the functoriality relation.
  Virtual count: for `M` proper and `vd = 0`, `∫_M [M]^vir ∈ ℚ`. (behrend-fantechi1997
  Definition 5.2, line 1282; lines 1286–1298; Proposition 5.3, line 1299; Propositions 5.5–5.7,
  lines 1353–1366; Propositions 7.2–7.5, lines 1682–1734.)
- **T10 (Gromov–Witten obstruction theory).** Let `X` be a smooth projective `k`-variety, `𝔐`
  the smooth Artin stack of prestable `n`-pointed curves of genus `g`, of dimension
  `3g − 3 + n`, and `M` a DM stack of finite type over `k` with a morphism `M → 𝔐` of DM type,
  carrying the pulled-back universal curve `π : 𝒞 → M` with markings and a morphism
  `f : 𝒞 → X` such that every geometric fibre is a stable map of class `β`. Then
  `E := (Rπ_* f^* T_X)^∨`, with the map to `τ^{≥−1} L_{M/𝔐}` induced by the Kodaira–Spencer
  map, is a perfect relative obstruction theory, it admits a global resolution, and `[M]^vir ∈
  A_{vd}(M)_ℚ` with `vd = ∫_β c_1(T_X) + (dim X − 3)(1 − g) + n`. Check (imports the moduli
  stack and its properness from the roadmap that owns them): for `M = M̄_{g,n}(X, β)` the class
  `[M̄_{g,n}(X, β)]^vir` and, for the quintic threefold `Q ⊆ ℙ⁴`, `g ≥ 2` and `n = 0`, the
  virtual count `N_{g,d} = ∫ [M̄_g(Q, d)]^vir ∈ ℚ` with `vd = 0`. (behrend-fantechi1997
  Proposition 6.1, line 1549, and lines 1540–1548; behrend1997 Proposition 2, line 99,
  Proposition 4, line 139, lines 148–150, Proposition 5, line 165, lines 188–197;
  li-tian1998 Theorem 4.3 (1), line 1586; chang-guo-li2021 lines 168–173.)

## Suppliers

All on main unless stated. The roadmap is inserted in the merge order after its last
supplier that is itself a pull request.

- **SchemeAndStackFoundations** (main): §1.18 stacks in groupoids and 2-fibre products; §1.19
  `IsAlgebraicStack`, `IsDeligneMumford`; §1.20 inertia, `Stacks.points`, `IsSeparatedStack`,
  properties of morphisms and presentations; §1.21 quotient stacks; §1.22 `Stacks.QCoh`; §1.23
  coarse moduli spaces and `keel_mori`; §4.15 `StableCurves.Mbar` (for Checks); §5.1
  `cyclesOfDimension`, `RatEquiv`, `ChowGroup`; §5.2 `Chow.properPushforward`, flat pullback,
  `deg`; §5.3–5.4 Chern classes; §5.5 `normalCone`, `conormal`, `normalBundle`, deformation to
  the normal cone and refined Gysin maps on schemes; §2.18 derived categories of quasi-coherent
  complexes (on schemes; the étale-site derived category of a DM stack is a gap, see Risks).
- **StackPointsAndResidualGerbes** (board design DESIGN-StackPointsAndResidualGerbes, #6388):
  T1 finite type and closed points, T2 stabilisers `G_x`, T3 closed substacks and one-point
  reduced stacks, T4–T7 residual gerbes and closed points, T9 `𝒵_x ≃ BG_x` over the residue
  field. Must precede this roadmap in the merge order.
- **EquivariantIntersectionTheory** (PR #1685, another author): Layer 2 (§§2.1–2.2) equivariant
  Chow groups `A^G_*(X)`, their operations and the Edidin–Graham hypothesis (Convention 5), for
  T4 only.
- **DerivedModuleAlgebra** (main): §0.4 `Algebra.CotangentComplex`, §0.8 transitivity, §0.10
  base change, §0.12 smooth computation, §0.13 regular quotients and two-term models, §0.25
  cotangent obstruction theory for square-zero lifts (the affine input to T7–T8).
- **EnhancedDerivedSheaves** (main): the sheaf enhancement of the cotangent complex
  (E5:cotangent-export) and the derived-category framework on sites, if the design builds
  `τ^{≥−1} L_{M/𝔐}` from the global cotangent complex rather than by gluing local embeddings.
- **AlgebraicVectorBundles** (main): `linearSpecScheme`, `totalSpaceScheme` and the relative
  Spec of a symmetric algebra (abelian cones `C(ℱ)`); graded algebras and relative Proj.
- **StableReduction** (main): Layer 3 prestable and stable pointed families; Layers 10–11
  prestable and stable maps, evaluation maps, degree of a map and the stability condition (the
  objects of T10). It stops before the moduli stack of stable maps (its "Boundary: moduli
  spaces and properness").
- **Mathlib**: `AlgebraicGeometry.AlgebraicCycle.Basic` (`AlgebraicCycle`, `mapCoeff`),
  `RingTheory.Extension.Cotangent.Basic` (naive cotangent complex), `RingTheory.Sequence.IsRegular`,
  `reesAlgebra`.

## Consumers

- **MotivicStructuresInModuliOfCurves** (board design, in the merge order): its design cites
  `SchemeAndStackFoundations:SF.5/stack-chow`, `SF.5/dm-gysin-ring` and `SF.5/dm-rational-degree`
  for the rational Chow groups, Gysin ring and degree of `M̄_{g,n}` as a DM stack; those keys
  exist nowhere (SchemeAndStackFoundations Layer 5 is schemes only). T1–T5 are what it needs
  and its design should be re-pointed to this roadmap.
- **A roadmap on the moduli stack of stable maps and algebraic Gromov–Witten invariants** (to be
  filed; StableReduction names it as "the next roadmap"): consumes T9–T10 for
  `[M̄_{g,n}(X, β)]^vir`, the Gromov–Witten axioms (behrend1997 Theorem 6, line 198; li-tian1998
  Theorem 4.3, line 1585) and the quintic invariants of chang-guo-li2021.
- **Torus localisation and cosection localisation of virtual classes** (future; graber-
  pandharipande1999, kiem-li2013) consume T6–T9 and EquivariantIntersectionTheory.
- **GromovWittenTheory** (PR #990) and **AnalyticStableMaps** (PR #987): the algebraic class of
  T10 is the counterpart of their symplectic virtual class; a future comparison roadmap consumes
  both.
- **EquivariantIntersectionTheory** (PR #1685): T4 supplies the comparison its scope statement
  leaves open (Chow groups of stacks that are not global quotients, and of algebraic spaces).
- **A future roadmap on Kresch's Chow groups of Artin stacks**: consumes T1–T2 as the
  `A°_*` of kresch1999 Theorem 2.1.12.

## Sources

Manifest keys in `packages/VirtualFundamentalClasses/sources.toml`.

- `vistoli1989` — A. Vistoli, Intersection theory on algebraic stacks and on their moduli
  spaces, Invent. Math. 97 (1989), 613–670. Open repository (GDZ, OCR of the scan). §1 degrees
  and local embeddings, §2 moduli spaces, §3 Chow groups and Gysin maps, §5 bivariant classes,
  §6 the comparison (6.1).
- `kresch1999` — A. Kresch, Cycle groups for Artin stacks, Invent. Math. 138 (1999), 495–536.
  arXiv math/9810166. Theorem 2.1.12 (comparison), §6.2 (virtual class without global
  resolutions). Boundary and Checks only.
- `edidin-graham1998` — D. Edidin, W. Graham, Equivariant intersection theory, Invent. Math.
  131 (1998), 595–634. arXiv alg-geom/9603008. Propositions 10–11 (comparison with Vistoli).
- `behrend-fantechi1997` — K. Behrend, B. Fantechi, The intrinsic normal cone, Invent. Math.
  128 (1997), 45–88. arXiv alg-geom/9601010. §§1–5 and §7 as located above.
- `behrend1997` — K. Behrend, Gromov–Witten invariants in algebraic geometry, Invent. Math.
  127 (1997), 601–617. arXiv alg-geom/9601011. Propositions 2, 4, 5 and the dimension count.
- `li-tian1998` — J. Li, G. Tian, Virtual moduli cycles and Gromov–Witten invariants of
  algebraic varieties, J. Amer. Math. Soc. 11 (1998), 119–174. arXiv alg-geom/9602007. Theorem
  4.3 (properties of the virtual cycle), for Checks.
- `keel-mori1997` — S. Keel, S. Mori, Quotients by groupoids, Ann. of Math. 145 (1997),
  193–213. arXiv alg-geom/9508012. Theorem 1.1, Corollary 1.3.
- `olsson2007` — M. Olsson, Sheaves on Artin stacks, J. reine angew. Math. 603 (2007), 55–112.
  Author page. §8 the cotangent complex of a morphism of algebraic stacks.
- `stacks-chow` — Stacks Project, Chow Homology and Chern Classes, Tag 02P3. Open.
- `stacks-chow-spaces` — Stacks Project, Chow Groups of Spaces, Tag 0EDQ. Open. §§3, 15, 32.
- `stacks-cotangent` — Stacks Project, The Cotangent Complex, Tag 08P5. Open. §§24–26 (schemes
  and algebraic spaces).
- `stacks-properties` — Stacks Project, Properties of Algebraic Stacks, Tag 04XA. Open. §9
  immersions (04YK), §10 reduced stacks, §12 dimension (0AFL, 0AFN).
- `fulton-pandharipande1997` — W. Fulton, R. Pandharipande, Notes on stable maps and quantum
  cohomology, Proc. Sympos. Pure Math. 62 (1997). arXiv alg-geom/9608011. Theorem 1 (for the
  consumer roadmap).
- `behrend-manin1996` — K. Behrend, Yu. Manin, Stacks of stable maps and Gromov–Witten
  invariants, Duke Math. J. 85 (1996), 1–60. arXiv alg-geom/9506023. Theorem 3.14 (for the
  consumer roadmap).
- `chang-guo-li2021` — H.-L. Chang, S. Guo, J. Li, Polynomial structure of Gromov–Witten
  potential of quintic 3-folds, Ann. of Math. 194 (2021), 585–645. arXiv 1809.11058. Lines
  168–173 (`N_{g,d}`), Theorem 3 (for the Check).
- `graber-pandharipande1999` — T. Graber, R. Pandharipande, Localization of virtual classes,
  Invent. Math. 135 (1999), 487–518. arXiv alg-geom/9708001. Consumer statement only.
- `kiem-li2013` — Y.-H. Kiem, J. Li, Localizing virtual cycles by cosections, J. Amer. Math.
  Soc. 26 (2013), 1025–1050. arXiv 1007.3085. Consumer statement only.
- `fulton1998` — W. Fulton, Intersection Theory, 2nd ed., Springer 1998. Paywalled, recorded
  `uncertified`, cited by locator: Ch. 1 (cycles, §1.4 degree), Ch. 6 (Gysin maps), §14.1
  (localised top Chern class), App. B.6 (normal cones; B.6.6 for pure dimension).
- `gillet1984` — H. Gillet, Intersection theory on algebraic stacks and Q-varieties, J. Pure
  Appl. Algebra 34 (1984), 193–240. The service refused the publisher host as paywalled;
  recorded `uncertified`, cited by locator (§4 for the cycle definitions Vistoli attributes to
  it). Not needed for any statement: Vistoli restates the definitions.

## Risks

- **No owner for the moduli stack of stable maps or the Artin stack of prestable curves.**
  The filed text says StableReduction "plans families of stable maps and the properness of their
  moduli"; it does not. StableReduction Layers 10–11 define stable maps and their API and its
  boundary section says it defines no functor, stack or coarse space and proves no properness,
  leaving them to "the next roadmap", which no one has filed. Without it T10 can only be stated
  for an abstract family over `𝔐` and the Gromov–Witten class of `M̄_{g,n}(X, β)` and the
  quintic counts are Checks. `𝔐_{g,n}` itself (behrend1997 Proposition 2) belongs with that
  roadmap. A target "stacks of stable maps and algebraic Gromov–Witten invariants"
  (behrend-manin1996, fulton-pandharipande1997, behrend1997 Theorem 6) should be filed; its
  design consumes T9–T10.
- **Cotangent complex of a morphism of stacks.** No roadmap owns `L_{M/𝔐}` for algebraic
  stacks (DerivedModuleAlgebra is affine; the Stacks Project chapter stops at algebraic spaces,
  stacks-cotangent lines 31–33; Olsson §8 and Laumon–Moret-Bailly Ch. 17 are the references).
  Behrend–Fantechi only use `τ^{≥−1} L_{M/𝔐}` for DM-type morphisms, which is determined by the
  two-term complexes of local embeddings (behrend-fantechi1997 lines 940–951). The design must
  choose between gluing that truncation on the small étale site of `M` (self-contained, cites
  Illusie III.3.1.3, which is paywalled) and importing a full stack cotangent complex; the
  former is recommended and the identification with Olsson's `L_{M/𝔐}` is then a Check.
- **Derived category of the small étale site of a DM stack.** `h¹/h⁰(E^∨)` needs complexes
  on `M_ét` with coherent cohomology and their duals (behrend-fantechi1997 lines 641–669).
  SchemeAndStackFoundations §2.18 is for schemes and §1.22 gives `QCoh` on stacks; the design
  must check whether the étale-site derived category of a DM stack is available or must be set
  up (Olsson §§6–7).
- **Dimension theory of DM stacks and integral closed substacks.** Not owned by
  SchemeAndStackFoundations; StackPointsAndResidualGerbes declares dimension out of scope. T1
  must own dimension through an étale atlas (stacks-properties §12) and the reduced induced
  structure on an irreducible closed subset beyond what residual gerbes need (stacks-properties
  §§9–10).
- **Vistoli's text is an OCR of a scan.** Statement numbers are recoverable (lines quoted
  above) but formulas are garbled; the design should pair each Vistoli citation with the
  corresponding scheme statement in stacks-chow or stacks-chow-spaces where one exists, and with
  Fulton's locators (uncertified) otherwise.
- **Global resolutions.** T9 assumes a global resolution of `E`, as Behrend–Fantechi do; the
  stack of stable maps has one (behrend1997 Proposition 5). Removing the hypothesis needs
  Kresch's Chow groups of Artin stacks (kresch1999 Theorem 6.2.1), a separate theory; a design
  must not plan it here.
- **Supplier ordering.** StackPointsAndResidualGerbes is a board design, not yet in the merge
  order; EquivariantIntersectionTheory is another author's pull request. This roadmap must be
  inserted after both.
- **Paywalled texts.** Fulton 1998 and Gillet 1984 are cited by locator only (`uncertified`);
  Illusie's cotangent complex (SLN 239) and Laumon–Moret-Bailly's book are paywalled and were
  not fetched; the design should cite them by locator and rely on stacks-cotangent and
  olsson2007 for proofs.
