Verdict: design
Name: DynamicalDegreesOfRationalMaps
Base: none
Owner: none

## Scope

The roadmap builds the degree theory of dominant rational self-maps of projective varieties over an
arbitrary field, from the graph of a rational map to the dynamical degrees and the algebraic entropy.
Nothing on the board, on main, in the open pull requests, in Mathlib or in Tau Ceti owns any part of
it: `ArithmeticDynamics` (#1335) owns rational self-maps of ℙ¹ only (its §0.18 monoid of pairs of
binary forms with multiplicative degree, §0.26 the comparison with endomorphisms of the scheme ℙ¹),
and `ArithmeticDynamicsPartII` is Markoff-orbit theory. The general theory, where indeterminacy
breaks multiplicativity of degrees and a limit is needed, exists nowhere.

**Carriers.** Throughout, `K` is any field, `X` an integral projective `K`-scheme of dimension
`d ≥ 1` (a projective variety; normality is a hypothesis of individual theorems, not of the
carrier, and the filed wording "normal projective" is kept as a Check), and `f : X ⤏ X` is a
dominant rational map in Mathlib's sense (`AlgebraicGeometry.Scheme.RationalMap` with
`RationalMap.IsDominant`, over `Spec K`), with domain of definition `f.domain` (Mathlib) and
iterates `f^n` formed by Mathlib's `RationalMap.comp`. Degrees are the intersection numbers of
`SchemeAndStackFoundations` Layer 5 on main: `deg(c_1(L_1) ∩ ⋯ ∩ c_1(L_d) ∩ [V])` for a proper
`d`-dimensional `K`-scheme `V` and invertible sheaves `L_i`, built from §5.3 (first Chern class cap
product on any algebraic scheme, commutativity, projection formula), §5.2 (proper pushforward with
residue-degree weights, degree of zero-cycles on proper schemes) and §5.1 (Chow groups). No
smoothness and no resolution of singularities enter the definitions, so the whole roadmap is
characteristic-free; `ResolutionOfSingularitiesCharacteristicZero` is not a supplier.

**What the roadmap owns.**

1. *The graph of a rational map.* `Γ_f ⊆ X ×_K X`, the closure, with reduced structure, of the
   image of `(id, f|_U) : U → X × X` for the domain `U` of `f`; independence of the representative;
   `Γ_f` integral, projective, of dimension `d`; `π_1 : Γ_f → X` a modification (SSF §4.11) with
   `π_1` an isomorphism over `U`; `π_2 : Γ_f → X` proper, surjective and generically finite, hence
   an alteration (SSF §4.16) with generic degree `[K(X) : f^*K(X)]`, the function-field degree of
   the pullback `f^* : K(X) → K(X)` of Mathlib's `RationalMap.equivFunctionField`. The graph of a
   composite, of an iterate, of a morphism (`Γ_f ≅ X`), and of a base change. The normalization
   `Γ̃_f → Γ_f` and arbitrary birational models `Γ' → Γ_f`.
2. *Numerical classes and positivity over an arbitrary field*, at the level the degrees need and
   no more: numerical equivalence of Cartier divisors and line-bundle classes on a projective
   `K`-scheme tested on integral curves (degree of SSF §3.3), the real space `N¹(X)_ℝ`; nef
   classes (nonnegative on every integral curve), ample classes, big Cartier classes (a positive
   multiple is ample plus effective) and big-and-nef real classes; pullback of nef, of ample and of
   big-and-nef classes along generically finite surjective morphisms; nonnegativity of top
   intersections of nef classes (Kleiman); the comparison "every Cartier class is dominated by a
   multiple of a fixed ample class"; invariance of intersection numbers under base change of the
   field. `AbundanceStatement` Layer 4 on main owns these notions over algebraically closed fields
   of characteristic zero and is imported there, with the comparison of the two carriers as a
   target; the arbitrary-field statements are new and are owned here because no roadmap has them.
3. *Degrees.* For `ω` ample, or big and nef, in `N¹(X)_ℝ` and `0 ≤ k ≤ d`,
   `deg_{k,ω}(f) := (π_2^*ω^k · π_1^*ω^{d−k})_{Γ_f}`, with: independence of the model `Γ' → Γ_f`
   (projection formula); the formula `deg_{k,ω}(f) = (f^*ω^k · ω^{d−k})_X` with
   `f^* := π_{1*} ∘ π_2^*` on cycle classes of `X`; the formula as an intersection number on
   `X × X` of `[Γ_f]` with `pr_1^*ω^{d−k} · pr_2^*ω^k`; positivity `deg_{k,ω}(f) > 0`;
   `deg_{0,ω}(f) = (ω^d)`; `deg_{d,ω}(f) = [K(X) : f^*K(X)] · (ω^d)`; integrality for
   `ω = c_1(L)`; `deg_{k,ω}(f) = e^k (ω^d)`-type formulas for morphisms; invariance under
   normalization of `X`; invariance under base change of the field.
4. *Sub-multiplicativity and comparison.* A constant `C = C(X, ω) > 0` with
   `deg_{k,ω}(f ∘ g) ≤ C · deg_{k,ω}(f) · deg_{k,ω}(g)` for all dominant `f, g`, and for big and nef
   `ω, ω'` a constant `C(ω, ω')` with `C^{-1} deg_{k,ω} ≤ deg_{k,ω'} ≤ C deg_{k,ω}`. These are
   proved first over an algebraically closed field (Dang, Truong) and transported to `K` by the base
   change invariance of item 3, following Truong's §6.3 (correspondences over the possibly
   reducible base change). The positivity theory this needs in codimension `≥ 2` (numerical cycle
   classes `N^k(X)_ℝ` on a projective variety, their finite-dimensionality via de Jong alterations,
   Siu's inequality for nef and big divisors, basepoint-free classes and the Siu-type inequality of
   Dang's Theorem 3, or Truong's Chow-moving-lemma route) is owned by this roadmap as an internal
   layer, since no roadmap has it; the design chooses one of the two published routes.
5. *Dynamical degrees.* `λ_k(f) := lim_n deg_{k,ω}(f^n)^{1/n}`, existence by Fekete's lemma
   (Mathlib's `Subadditive.tendsto_lim`), equality with `inf_n (C deg_{k,ω}(f^n))^{1/n}`,
   `λ_k(f) ∈ [1, ∞)`, independence of `ω`, `λ_k(f^n) = λ_k(f)^n`, `λ_0(f) = 1`,
   `λ_d(f) = [K(X) : f^*K(X)]` (the topological degree, a field degree so that inseparable degrees
   count), birational invariance, log-concavity from the Khovanskii–Teissier inequalities for two
   nef classes (owned here over an arbitrary field, through the Hodge index theorem of SSF §5.10 on
   a regular alteration of a surface cut out by very ample divisors, SSF §4.13 and §4.19), base
   change invariance, and the algebraic entropy `h_alg(f) := log max_k λ_k(f)` with its invariances
   and `h_alg(f^n) = n · h_alg(f)`.
6. *Examples on projective space and affine space.* For `ℙ^d_K` with the hyperplane class `H`:
   a dominant rational map is given by `d + 1` forms of a common degree `e` without common factor,
   `deg_{1,H}(f) = e`, `deg_{k,H}(f) ≤ e^k` with equality for a morphism; for a morphism of degree
   `e`, `deg_{k,H}(f^n) = e^{nk}` and `λ_k(f) = e^k`; `λ_1(f) = lim (deg f^n)^{1/n}` is Silverman's
   dynamical degree; the standard Cremona involution `σ` of `ℙ^d` (`d ≥ 2`) has `deg σ = d`,
   `σ² = id`, so `deg(σ²) = 1 < d²` and `λ_1(σ) = 1`; the map `[x : y : z] ↦ [yz : xy : z²]` has
   Fibonacci degree sequence and `λ_1 = (1 + √5)/2`. Polynomial self-maps of `𝔸^d_K` extend to
   dominant rational self-maps of `ℙ^d_K` when dominant, with `deg_{1,H}` the maximum of the
   degrees of the components; a proper polynomial map `𝔸^d → 𝔸^d` is finite, surjective and
   dominant, and `λ_d` is its generic degree.

**Boundaries.** Not owned: resolution of singularities; the Dinh–Sibony topological entropy bound
over ℂ (complex dynamics, positive currents); Dang–Favre's b-classes, Banach spaces and spectral
interpretation, and their Theorems 1–2 (algebraicity of `λ_1` for proper polynomial maps with
`λ_1² > λ_2`), which are consumers of the definitions made here, not targets; arithmetic degrees and
canonical heights for rational maps of `ℙ^N` (Silverman 2014 §§4–5, Kawaguchi–Silverman); relative
dynamical degrees and the product formula (Dang's Theorem 4, Truong's Theorem 1.1(4)), which are
the natural Part II; the theory of correspondences (used only internally in the base change
argument); the spectral-radius description `λ_k(f) = lim ‖(f^n)^*‖^{1/n}` on `N^k(X)_ℝ` (Truong
1.1(5), Dang Theorem 2), which may be a Check if the design's positivity layer yields it cheaply.

Note on the filed statement: Dang–Favre's Theorem 2 does not compute `λ_k` of a proper polynomial
map; it proves that `λ_1(f)` is an algebraic number of degree at most `d` when `λ_1(f)² > λ_2(f)`
(dangfavre2021 line 177). The roadmap supplies what that theorem needs to be stated: the degrees
`deg_{k,ω}` of a rational self-map of `ℙ^d_K` and the dynamical degrees `λ_1, λ_2`.

## Final targets

Each target is stated for a field `K`, a projective variety `X/K` of dimension `d ≥ 1`, and a
dominant rational map `f : X ⤏ X`; `ω` is an ample or big-and-nef class. Locators are to the
manifest's sources.

1. **Graph.** `Γ_f` is an integral projective `K`-scheme of dimension `d`; `π_1 : Γ_f → X` is a
   modification, an isomorphism over the domain of `f`; `π_2 : Γ_f → X` is proper, surjective and
   generically finite with generic degree `[K(X) : f^*K(X)]`. (Standard; dinhsibony2005 line 45
   for the analytic statement; Fulton 1998 Theorem 1.4 for `π_{2*}[Γ_f] = [K(X) : f^*K(X)] · [X]`,
   fulton1998 uncertified; dang2020 line 250 restates Fulton's Theorem 1.4 and 1.7.)
2. **Degrees.** `deg_{k,ω}(f) := (π_2^*ω^k · π_1^*ω^{d−k})_{Γ_f}` is independent of the choice of
   a projective birational model `Γ' → Γ_f` through which it is computed, equals
   `(f^*ω^k · ω^{d−k})_X` for `f^* = π_{1*}π_2^*`, equals the intersection number of `[Γ_f]`
   with `pr_1^*ω^{d−k} · pr_2^*ω^k` on `X × X`, is positive, satisfies `deg_{0,ω}(f) = (ω^d)` and
   `deg_{d,ω}(f) = [K(X) : f^*K(X)] (ω^d)`, is an integer when `ω = c_1(L)`, and is unchanged by
   normalization of `X` and by base change of `K` (computed on the base-changed graph with its
   fundamental cycle). (dangfavre2021 lines 436–443 and footnotes at lines 452–454; dang2020 lines
   21–25; truong2020 lines 1529–1533 for base change.)
3. **Sub-multiplicativity.** For `X` normal there is `C = C(X, ω) > 0` with
   `deg_{k,ω}(f ∘ g) ≤ C deg_{k,ω}(f) deg_{k,ω}(g)` for all dominant `f, g : X ⤏ X`, and for
   big-and-nef `ω, ω'` there is `C = C(ω, ω') ≥ 1` with
   `C^{-1} deg_{k,ω}(f) ≤ deg_{k,ω'}(f) ≤ C deg_{k,ω}(f)`. (dang2020 lines 27–34, Theorem 1 (i)
   and (ii); dangfavre2021 lines 448–460, Theorem 1.3; truong2020 lines 143–158, Theorem 1.1(1);
   dinhsibony2005 lines 245–247, Proposition 6, over ℂ.) Over a non-closed `K`, by base change to
   `K̄` and Truong's §6.3 (truong2020 line 1529).
4. **Dynamical degrees.** `λ_k(f) = lim_n deg_{k,ω}(f^n)^{1/n}` exists, equals
   `inf_n (C deg_{k,ω}(f^n))^{1/n}`, lies in `[1, ∞)`, is independent of `ω`, and satisfies
   `λ_k(f^n) = λ_k(f)^n`. (dangfavre2021 lines 461–465; dang2020 lines 42–46; dinhsibony2005 lines
   256–259, Corollaire 7; silverman2014 lines 383–413, Proposition 7, for the Fekete argument on
   `ℙ^N`; Mathlib `Subadditive.tendsto_lim`.)
5. **Properties.** `λ_0(f) = 1`; `λ_d(f) = [K(X) : f^*K(X)]`; for a birational map `φ : X ⤏ Y`
   of projective varieties, `λ_k(φ ∘ f ∘ φ^{-1}) = λ_k(f)`; `λ_k(f)² ≥ λ_{k−1}(f) λ_{k+1}(f)` for
   `1 ≤ k ≤ d − 1`; `λ_k(f_L) = λ_k(f)` for every field extension `L/K` when `X` is geometrically
   integral (and the cycle-level base change formula in general). (dang2020 lines 35–46;
   dangfavre2021 lines 464–467; dinhsibony2005 lines 260–262; truong2020 lines 159–168, Theorem
   1.1(2)–(3); guedj2010 lines 1178–1181, Théorème 2.4(a); Khovanskii–Teissier: lazarsfeld2004
   Theorem 1.6.1 and Corollary 1.6.3, uncertified.)
6. **Khovanskii–Teissier for nef classes over any field.** For nef classes `A, B` on a projective
   variety `V/K` of dimension `d`, the sequence `k ↦ (A^k · B^{d−k})` is log-concave:
   `(A^k · B^{d−k})² ≥ (A^{k+1} · B^{d−k−1})(A^{k−1} · B^{d−k+1})`. (lazarsfeld2004 Theorem 1.6.1,
   Corollary 1.6.3, uncertified, proved there over ℂ; the arbitrary-field proof through the Hodge
   index theorem on a regular alteration of a surface, SSF §5.10 and §4.19, is the roadmap's own.)
7. **Algebraic entropy.** `h_alg(f) = log max_{0 ≤ k ≤ d} λ_k(f) ≥ 0`, invariant under
   birational conjugacy and base field extension (geometrically integral `X`), with
   `h_alg(f^n) = n · h_alg(f)`, and `h_alg(f) = log λ_k(f)` for the `k` where the log-concave
   sequence peaks. (dinhsibony2005 lines 33–37 for the definition of `lov(f)` as this maximum;
   guedj2010 lines 1178–1181.)
8. **Projective space.** For a dominant rational map `f` of `ℙ^d_K` given by forms of common degree
   `e` without common factor, `deg_{1,H}(f) = e` and `deg_{k,H}(f) ≤ e^k`, with equality for all
   `k` when `f` is a morphism; for a morphism of degree `e`, `deg_{k,H}(f^n) = e^{nk}` and
   `λ_k(f) = e^k`; `λ_1(f) = lim (deg f^n)^{1/n}`. (russakovskiishiffman1997 lines 500–519, Lemma
   4.4, and lines 582–583, Lemma 4.6; guedj2010 lines 1141–1147, Exemple 2.2; silverman2014 lines
   350–357.)
9. **Indeterminacy breaks multiplicativity.** The standard Cremona involution
   `σ[x_0 : ⋯ : x_d] = [x_0^{-1} : ⋯ : x_d^{-1}]` of `ℙ^d_K`, `d ≥ 2`, has `deg_{1,H}(σ) = d`,
   `σ ∘ σ = id`, hence `deg_{1,H}(σ²) = 1 < d²`, `λ_1(σ) = λ_d(σ) = 1`; the map
   `[x : y : z] ↦ [yz : xy : z²]` of `ℙ²` has `deg(f^n)` the Fibonacci number `F_{n+2}` and
   `λ_1(f) = (1 + √5)/2`. (truong2020 lines 1542–1544; guedj2010 lines 1272–1282, Exemple 2.5;
   russakovskiishiffman1997 lines 542–545; silverman2014 lines 358–372, Example 5.)
10. **Polynomial maps of affine space.** A dominant polynomial map `F : 𝔸^d_K → 𝔸^d_K` extends to a
    dominant rational self-map `f` of `ℙ^d_K` with `deg_{1,H}(f) = max_i deg F_i`; if `F` is
    proper it is finite, surjective and dominant, `f` is defined on `𝔸^d`, and
    `λ_d(f) = [K(x_1, …, x_d) : K(F_1, …, F_d)]`. (dangfavre2021 lines 177–180 for the setting of
    Theorem 2; silverman2014 lines 373–380, Example 6; finiteness of proper affine morphisms is
    standard.)

Checks (not final targets): the filed normal-projective hypothesis as the hypothesis of target 3;
`ℙ¹` with `d = 1`, where `deg_{1,H}(f) = deg f` is `ArithmeticDynamics` §0.18's degree and
`λ_1(f) = deg f`; the relative Frobenius of `ℙ^d` over `𝔽_p` with `λ_d = p^d` and `λ_k = p^k`; a
non-normal `X` and its normalization giving the same degrees; a non-geometrically-integral `X` where
the base-changed graph is reducible but the cycle-level base change formula holds.

## Suppliers

- Mathlib: `AlgebraicGeometry.Scheme.RationalMap`, `PartialMap`, `RationalMap.domain`,
  `RationalMap.IsDominant`, `RationalMap.comp` with associativity and identities,
  `RationalMap.equivFunctionField`, `Scheme.functionField`, `Scheme.Birational`; `AlgebraicCycle`;
  `IsDominant`, `IsProper`, `IsFinite`, `IsAffineHom`; projective space `ℙ(n; S)`;
  `Subadditive`, `Subadditive.tendsto_lim`, `Subadditive.lim_le_div` (Fekete's lemma).
- Tau Ceti: `CartierDivisor`, `LineBundleClass`, `EffectiveCartierDivisor`, line-bundle degree on
  curves.
- `SchemeAndStackFoundations` (main): §0.7 dimension theory; §0.30 normal schemes; §3.3 degrees
  on curves; §4.11 modifications and strict transforms (`IsModification`,
  `functionField_equiv`); §4.12 Chow's lemma and domination of modifications; §4.13 regular
  schemes and Bertini; §4.16 alterations with `genericDegree`; §4.19 de Jong's alteration theorem
  over a field; §5.1 Chow groups; §5.2 proper pushforward with residue-degree weights, flat
  pullback, base-change square, degree of zero-cycles; §5.3 first Chern class cap product with
  `inter_comm`, `proper_pushforward`, `flat_pullback`; §5.6 intersection ring of `ℙ^n`
  (`test_pn_ring`) for the projective-space examples; §5.10 Hodge index theorem on smooth
  projective surfaces over algebraically closed fields; §5.12 Bézout.
- `AbundanceStatement` (main): Layer 4A curve degrees and the pairing, 4B `N¹(X)_ℝ`, 4C nef cone
  and curve-testing characterisation, 4D Kleiman's criterion and the nef-plus-ample lemma, all over
  algebraically closed fields of characteristic zero; imported where the hypotheses match and
  compared with the arbitrary-field carrier owned here.
- `StableReduction` (main): Layer 2 projective morphisms and the ampleness convention used by
  SchemeAndStackFoundations.
- `ArithmeticDynamics` (#1335, earlier in the merge order at line 319 only if this roadmap is
  placed after it; otherwise a consumer): §0.18 and §0.26 for the `ℙ¹` comparison Check. The
  comparison is a Check in either direction and does not force an ordering.

Merge-order position: after `SchemeAndStackFoundations`, `AbundanceStatement` and
`StableReduction` (all on main), so it can be inserted anywhere; before `ArithmeticDynamics` if that
roadmap's Part II wants to consume it.

## Consumers

- `ArithmeticDynamics` (#1335) and a future Part II on canonical heights and arithmetic degrees for
  dominant rational self-maps of `ℙ^N` (Silverman 2014 §§4–5, the inequality `α_f(P) ≤ λ_1(f)`,
  Kawaguchi–Silverman), which need `λ_1` and the sub-multiplicativity constant.
- A future roadmap on Dang–Favre's spectral interpretation (b-classes, the Picard–Manin space in
  higher dimension, Theorems 1–2 on `deg_{1,ω}(f^n) = Cλ_1^n + O(λ^n)` and algebraicity of `λ_1`
  for proper polynomial maps), which the filed target names as the motivation.
- A future Part II on relative dynamical degrees and the product formula (Dang Theorem 4, Truong
  Theorem 1.1(4), Dinh–Nguyen–Truong).
- Complex-dynamics roadmaps (entropy bounds of Dinh–Sibony and Gromov, Guedj's canonical measures)
  that need the algebraic side of `lov(f) = max log λ_k(f)`.
- Surface roadmaps (`K3Surfaces`, `EnriquesSurfaces`, `K3SurfacesAndSymplecticBoundedness`) for
  the dynamical degree of automorphisms and the classification of birational surface maps by degree
  growth.

## Sources

Manifest `packages/DynamicalDegreesOfRationalMaps/sources.toml`, all entries recorded by the
sources service.

- `dangfavre2021`: N.-B. Dang, C. Favre, *Spectral interpretations of dynamical degrees and
  applications*, Annals of Mathematics 194 (2021); arXiv:2006.10262v2, open repository, certified.
  §1.3 (lines 435–467): definition of `deg_{k,ω}` on a resolution of the graph, Theorem 1.3
  (sub-multiplicativity and comparison), existence and properties of `λ_k`, log-concavity; Theorem
  1 (line 148) and Theorem 2 (line 177) as consumer statements. Note: the filed issue cited
  arXiv:1905.01607, which is an unrelated paper; the manifest records the correct identifier.
- `dinhsibony2005`: T.-C. Dinh, N. Sibony, *Une borne supérieure pour l'entropie topologique d'une
  application rationnelle*, Annals of Mathematics 161 (2005); arXiv:math/0303271v2, open
  repository, certified. Théorème 1 (line 33), definition of `δ_l` and `λ_l` (lines 45–70),
  Proposition 6 (line 245), Corollaire 7 (line 256). Over ℂ only; used for the statements and for
  the birational-invariance argument.
- `dang2020`: N.-B. Dang, *Degrees of iterates of rational maps on normal projective varieties*,
  Proc. London Math. Soc. 121 (2020); arXiv:1701.07760v2, open repository, certified. Theorem 1
  (lines 27–34) over an algebraically closed field of arbitrary characteristic, definition on the
  normalization of the graph (lines 21–25), birational invariance and Fekete (lines 35–46), the
  Siu-type inequality Theorem 3 (line 141), Theorem 1.1.1 (line 250), Theorem 2.5.1 (line 608,
  finite-dimensionality of numerical cycles via de Jong alterations).
- `truong2020`: T. T. Truong, *Relative dynamical degrees of correspondences over a field of
  arbitrary characteristic*, J. reine angew. Math. 758 (2020); arXiv:1605.05049v2, open repository,
  certified. Theorem 1.1 (lines 143–181), §6.3 non-algebraically-closed fields (line 1529), §6.4
  the Cremona map (line 1542). Numbering of the published version not checked.
- `russakovskiishiffman1997`: A. Russakovskii, B. Shiffman, *Value distribution for sequences of
  rational mappings and complex dynamics*, Indiana Univ. Math. J. 46 (1997); the filed issue
  called it paywalled, but arXiv:math/9604204v1 is an open copy, certified. Definition of `δ_ℓ`
  (lines 500–511), Lemma 4.4 (line 516), Lemma 4.6 (line 582), Cremona example (line 544).
- `guedj2010`: V. Guedj, *Propriétés ergodiques des applications rationnelles*, Panoramas et
  Synthèses 30 (2010); arXiv:math/0611302v1, open repository, certified. §2.1: definition through a
  desingularized graph (lines 1099–1118), Définition 2.3 (line 1169), Théorème 2.4 (line 1178),
  Exemple 2.2 (line 1141), Exemple 2.5 (line 1272).
- `silverman2014`: J. H. Silverman, *Dynamical degree, arithmetic entropy, and canonical heights
  for dominant rational self-maps of projective space*, Ergodic Theory Dynam. Systems 34 (2014);
  arXiv:1111.5664v2, open repository, certified. §3 (lines 349–413): definition, Examples 5–6,
  Proposition 7.
- `lazarsfeld2004`: R. Lazarsfeld, *Positivity in Algebraic Geometry I*, Ergebnisse 48 (2004);
  DOI 10.1007/978-3-642-18808-4, paywalled, uncertified, cited by locator: Theorem 1.6.1 and
  Corollary 1.6.3 (Khovanskii–Teissier), Theorem 1.4.9 (Kleiman), Theorem 2.2.15 (Siu).
- `fulton1998`: W. Fulton, *Intersection Theory*, 2nd ed., Ergebnisse 2 (1998);
  DOI 10.1007/978-1-4612-1700-8, paywalled, uncertified, cited by locator: Theorem 1.4 (proper
  pushforward and degree), §§2.3–2.5, Theorem 2.4, Proposition 2.5 (Chern class cap product),
  §8.1 (projection formula). The same statements are available through SchemeAndStackFoundations
  §§5.2–5.3 on main, which cite Fulton and the Stacks project.

No text needed for the triage is missing; `needs-references.toml` was not created.

## Risks

- **Positivity in higher codimension.** Sub-multiplicativity for `k ≥ 2` needs, on either
  published route, machinery far above the library: Dang's route needs numerical cycle classes
  `N^k(X)_ℝ` with finite dimensionality (de Jong alterations plus the Néron–Severi-type finiteness
  of Kleiman and Milne), Siu's inequality for nef and big divisors (lazarsfeld2004 Theorem 2.2.15,
  paywalled) and the basepoint-free cone of Fulger–Lehmann with Dang's Theorem 3; Truong's route
  needs Roberts' version of Chow's moving lemma and de Jong alterations, and handles the singular
  case with correspondences. SchemeAndStackFoundations supplies alterations (§4.16, §4.19) and the
  cap-product calculus but neither numerical cycle classes in codimension `≥ 2` nor any Siu-type
  inequality. The design must plan this layer in full; if it proves too large, the `k = 1` and
  `k = d` cases (Siu's inequality for divisors suffices for `k = 1`, and `k = d` is multiplicative)
  must still be complete targets, and the general `k` must remain a target rather than be dropped.
- **Arbitrary base field.** The sources prove the main theorems over algebraically closed fields;
  Truong's §6.3 only sketches the descent. The roadmap must prove base change invariance of the
  degrees at the cycle level and handle a base-changed graph that is reducible or non-reduced. The
  nef, big and ample notions over an arbitrary field and Kleiman's nonnegativity are standard but
  unowned; AbundanceStatement's Layer 4 is characteristic-zero and algebraically closed only, so
  two carriers must be compared.
- **Khovanskii–Teissier over any field.** Lazarsfeld's proof is over ℂ. The characteristic-free
  proof through the Hodge index theorem needs a regular projective surface dominating a surface cut
  out of `Γ_{f^n}` by very ample divisors, which SSF §4.19 gives as an alteration, not a
  resolution; the degree of the alteration must be tracked. Alternatively Truong's Theorem 1.1(3)
  derives log-concavity from the Hodge index theorem and alterations directly.
- **Paywalled texts.** Lazarsfeld and Fulton are uncertified; every statement taken from them is
  also available either in SchemeAndStackFoundations on main or in the certified open sources
  (dang2020 §1 restates the needed Fulton results), so the design can avoid relying on them.
- **Mathlib API.** Mathlib's `RationalMap.comp` needs the first map dominant and irreducibility
  hypotheses on the schemes; the graph closure, its reduced structure and the generic finiteness of
  `π_2` are not in Mathlib and must be built on `Scheme.RationalMap` and `AlgebraicCycle`.
  `Suggested.lean` can state the headline theorems with simple definitions (graph closure as a
  closed subscheme, degree as the SSF intersection number) only if SSF Layer 5's declarations are
  on main under stable names; the design must check them.
- **Real classes.** `N¹(X)_ℝ` with the big-and-nef cone over an arbitrary field is more than the
  headline theorems need; the design may state the main theorems for ample or big-and-nef Cartier
  classes (integral, as in dang2020 Theorem 1) and obtain real classes from the comparison
  constant, but must not restrict to ample classes only.
