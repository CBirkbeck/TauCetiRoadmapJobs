Verdict: design
Name: StackPointsAndResidualGerbes
Base: none
Owner: none

## Scope

The local structure of an algebraic stack at a point, in the conventions of the Stacks
Project, built directly on the algebraic-stack layer of `TauCetiRoadmap/SchemeAndStackFoundations`
(main). Throughout, `𝒳` is an algebraic stack over a base scheme `S` in the sense of
SchemeAndStackFoundations §1.19, `|𝒳|` is its underlying topological space of §1.20, and a
*field-valued point* is a morphism `Spec K → 𝒳` from the spectrum of a field.

The roadmap owns, in this order:

1. **Points of finite type, closed points and rational points.** Finite type points of `|𝒳|`
   (represented by a locally finite type `Spec k → 𝒳`), their characterisation by closed points
   of smooth atlases, their density in every closed subset, their behaviour under locally finite
   type morphisms; the comparison with closed points; and the map `𝒳(k) → |𝒳|` from isomorphism
   classes of objects over `Spec k` (stacks-04XE, Properties of Algebraic Stacks §100.4;
   stacks-06RD chapter text, Morphisms of Algebraic Stacks §101.18). Alper's finite type points
   and their non-closedness on `[𝔸¹/𝔾_m]` are checks (alper-moduli line 6969 onwards).
2. **The stabiliser at a point.** The automorphism group algebraic space
   `G_x = Isom(x, x) = Spec k ×_𝒳 I_𝒳` of a field-valued point, its base change along field
   extensions, when it is a scheme, properties of `G_x` that depend only on the class of `x` in
   `|𝒳|`, and morphisms inducing isomorphisms on stabilisers (Morphisms of Algebraic Stacks
   §101.19). The object-level `automorphismGroup x` of SchemeAndStackFoundations §1.20 is the
   input; the point-level statements are new.
3. **Closed substacks and reduced one-point stacks.** Closed immersions of algebraic stacks and
   the reduced induced closed substack on a closed subset of `|𝒳|`, as far as the residual gerbe
   needs them (Properties of Algebraic Stacks §§100.9–100.10). SchemeAndStackFoundations owns
   open substacks and reductions implicitly through atlases but names no closed-substack API, so
   this roadmap owns the closed-substack statements it uses and states them as a supplier contract
   for the stack layer. The lemmas on reduced algebraic stacks with a single point: equivalence of
   "reduced with `|𝒵|` a singleton" with the existence of a flat surjective `Spec k → 𝒵`, the
   locally Noetherian refinement with `Spec k → 𝒵` locally of finite presentation, and the
   rigidity of monomorphisms into such a stack (stacks-06ML lines 1135–1237).
4. **Gerbes as morphisms of algebraic stacks.** The Stacks Project notion "`𝒳` is a gerbe over
   `𝒴`" and "`𝒳` is a gerbe", built on the site-level gerbe predicate of
   AlgebraicModuliForArithmeticGeometry §4.1 when that roadmap is ahead in the merge order, and
   the geometric consequences: a gerbe over an algebraic space with a section is the classifying
   stack of its automorphism group, local structure `[U/G]` after a flat cover, gerbe morphisms
   are surjective flat and locally of finite presentation, the inertia criterion (a stack is a
   gerbe iff its inertia is flat and locally of finite presentation), gerbe morphisms are universal
   homeomorphisms, and the dense open gerbe in a reduced stack with quasi-compact inertia
   (stacks-06QB, Morphisms of Algebraic Stacks §§101.28–101.29).
5. **Residual gerbes.** The characterisation lemma, the definition, uniqueness, and the
   properties (b)–(f) of the target, the existence theorems for finite type points, gerbes,
   stacks with quasi-compact inertia, quasi-DM stacks and locally Noetherian stacks, and the
   preimage `f^{-1}(𝒵_x) := 𝒲 ×_𝒳 𝒵_x` (stacks-06ML lines 1260–1345; stacks-06RD lines
   1609–1665, 2846–2904, 3048–3129, 4831–4878).
6. **The residual gerbe at a rational point, tangent and normal spaces.** The residue field of
   a point, the presentation `𝒵_x ≃ [Spec k / (Spec k ×_𝒳 Spec k)]` for a finite type
   representative, the identification `𝒵_x ≃ BG_x` when the residue field is `k`, the
   non-neutral case over a non-closed field, the tangent space `T_{𝒳,x}` with its `k`-structure
   and `G_x`-action, the infinitesimal neighbourhoods of a closed point, the normal space
   `N_x = (ℐ/ℐ²)^∨` as a `G_x`-representation, and `T_{𝒳,x} ≅ N_x` for smooth `G_x`
   (ahr2020 lines 39–44, 245–252, 475–486; alper-moduli lines 6859–6900, 6993–7025,
   16528–16552; rydh2011 lines 1227–1300).

**Boundaries.** The roadmap does not prove any form of the Luna étale slice theorem (ahr2020
Theorems 1.1 and 1.2 are consumers, and a design may state them only as Checks on the vocabulary,
never as targets). It does not own `|𝒳|`, inertia, quotient stacks, Keel–Mori, tame stacks or
quasi-coherent modules on stacks (SchemeAndStackFoundations §§1.19–1.23), banded gerbes and
their classification (AlgebraicModuliForArithmeticGeometry Layer 4), rigidification
(AlgebraicModuliForArithmeticGeometry §5.1), Chow groups of stacks (VirtualFundamentalClasses) or
equivariant intersection theory (EquivariantIntersectionTheory). Dimension theory of stacks is out
of scope unless the normal-space statement needs the dimension of `G_x`.

**Generality.** The filed wording states the rational-point proposition only for `k`
algebraically closed and `𝒳` locally of finite type over `k`. The general statement is for an
arbitrary field `k` and a finite type point `x : Spec k → 𝒳`: the residual gerbe is a gerbe over
the spectrum of the residue field `κ(x) ⊆ k`, its base change to `Spec k` is `BG_x`, and
`𝒵_x ≃ BG_x` exactly when `κ(x) = k`. The algebraically closed case is a Check.

## Final targets

Each statement is in the author's words; locators point into the fetched texts.

- **T1 (finite type points).** For `x ∈ |𝒳|` the following are equivalent: some representative
  `Spec k → 𝒳` is locally of finite type; there are a scheme `U`, a closed point `u ∈ U` and a
  smooth `U → 𝒳` sending `u` to `x`; the residual gerbe `𝒵_x` exists and `𝒵_x → 𝒳` is locally
  of finite type. The finite type points are dense in every closed subset of `|𝒳|` and are
  carried to finite type points by locally finite type morphisms. (stacks-06RD lines 1549–1601
  and 1609–1665: Lemmas 101.18.1, 101.18.3, 101.18.4, 101.18.6, 101.18.7.)
- **T2 (stabilisers).** For a field-valued point `x : Spec k → 𝒳`, `G_x := Spec k ×_{x, 𝒳} I_𝒳`
  is a group algebraic space over `k`, compatible with field extension; it is a scheme whenever
  the diagonal of `𝒳` is quasi-separated or locally separated, or `𝒳` is quasi-DM, or the inertia
  is quasi-separated, locally separated or locally quasi-finite; any property of `G_x` invariant
  under ground-field extension depends only on the class of `x` in `|𝒳|`. (stacks-06RD lines
  1667–1720: §101.19, Lemmas 101.19.1, 101.19.2, 101.19.4.)
- **T3 (one-point reduced stacks).** For an algebraic stack `𝒵`: `𝒵` is reduced with `|𝒵|` a
  singleton iff there is a flat surjective `Spec k → 𝒵` with `k` a field, iff such a morphism
  exists locally of finite type; `𝒵` is moreover locally Noetherian iff such a morphism exists
  locally of finite presentation; if the latter holds, every monomorphism `𝒵' → 𝒵` with `𝒵'`
  nonempty is an equivalence; and every reduced one-point `𝒵` contains a unique strictly full
  reduced locally Noetherian one-point algebraic substack, with inclusion a monomorphism.
  (stacks-06ML lines 1135–1237: Lemmas 100.11.1–100.11.5, Example 100.11.6.)
- **T4 (characterisation and definition of the residual gerbe).** For `x ∈ |𝒳|` the three
  conditions of the target are equivalent, and then there is a unique strictly full subcategory
  `𝒵_x ⊆ 𝒳` which is a reduced locally Noetherian algebraic stack with `|𝒵_x| = {x}`; the
  residual gerbe exists at `x` when they hold and is then `𝒵_x → 𝒳`, a monomorphism.
  (stacks-06ML lines 1260–1292: Lemma 100.11.7, Definition 100.11.8.)
- **T5 (properties).** When `𝒵_x` exists: (a) it is regular; (b) every field-valued point in the
  class `x` factors through `𝒵_x`; (c) every monomorphism from a reduced locally Noetherian
  one-point stack over `x` is an equivalence onto `𝒵_x`; (d) `𝒵_x` is a gerbe over a reduced
  locally Noetherian algebraic space with one point, and inherits DM, quasi-DM, separated and
  quasi-separated from `𝒳`; (e) a morphism `f : 𝒳 → 𝒴` with `f(x) = y` and both residual gerbes
  existing restricts to `𝒵_x → 𝒵_y`; (f) if `𝒳 → 𝒴` is a gerbe and `𝒵_y` exists then
  `𝒵_x = 𝒵_y ×_𝒴 𝒳`. (stacks-06ML lines 1312–1345: Lemmas 100.11.10–100.11.13; stacks-06RD
  lines 452–456, 2846–2861, 4831–4839: Lemmas 101.4.16, 101.28.12, 101.51.1.)
- **T6 (existence).** The residual gerbe exists at every point of `𝒳` when `𝒳` is a gerbe, or
  `I_𝒳 → 𝒳` is quasi-compact, or `𝒳` is quasi-DM (in particular Deligne–Mumford), or `𝒳` is
  locally Noetherian; and at every finite type point of any `𝒳`. The proof for quasi-compact
  inertia goes through the dense open gerbe of a reduced stack with quasi-compact inertia.
  (stacks-06RD lines 2893–2904, 2919–2938, 3048–3129: Lemma 101.28.15, Proposition 101.29.1,
  Lemmas 101.31.1–101.31.3.)
- **T7 (closed points).** For `𝒳` locally Noetherian and `x ∈ |𝒳|`, `x` is closed in `|𝒳|` iff
  `𝒵_x → 𝒳` is a closed immersion; for `𝒳` locally Noetherian or decent with quasi-compact
  inertia, every morphism from a reduced stack with image in the closure of `x` factors through
  `𝒵_x`. (stacks-06RD lines 4842–4878: Lemmas 101.51.2, 101.51.4, Remark 101.51.3.)
- **T8 (gerbe morphisms).** For `π : 𝒳 → U` with `U` an algebraic space and a section `x`,
  `𝒳` a gerbe over `U` implies `[U/Isom(x,x)] ≃ 𝒳` canonically, with `Isom(x,x) → U` flat
  locally of finite presentation and `U → 𝒳` surjective flat locally of finite presentation; `𝒳`
  is a gerbe over `𝒴` iff after some surjective flat locally finitely presented `U → 𝒴` it
  becomes `[U/G]`; a gerbe morphism is surjective, flat, locally of finite presentation and a
  universal homeomorphism; `𝒳` is a gerbe iff `I_𝒳 → 𝒳` is flat and locally of finite
  presentation. (stacks-06QB lines 2613–2617, 2664–2724, 2862–2875: Definition 101.28.1,
  Lemmas 101.28.6–101.28.8, 101.28.13, Proposition 101.28.9.)
- **T9 (the residual gerbe at a rational point).** Let `k` be a field and `x : Spec k → 𝒳` a
  finite type point. Then `Spec k → 𝒵_x` is flat, surjective and locally of finite presentation,
  `Spec k ×_{𝒵_x} Spec k = Spec k ×_𝒳 Spec k`, and `𝒵_x ≃ [Spec k / (Spec k ×_𝒳 Spec k)]`.
  If `𝒳` is locally Noetherian or has quasi-compact diagonal, the one-point space of T5(d) is
  `Spec κ(x)` for a field `κ(x) ⊆ k`, the *residue field* of `x`, `𝒵_x` is a gerbe over
  `Spec κ(x)`, and `𝒵_x ×_{Spec κ(x)} Spec k ≃ BG_x` with `x` corresponding to the trivial
  torsor. If `κ(x) = k`, then `Spec k ×_{𝒵_x} Spec k = G_x` and `𝒵_x ≃ BG_x = [Spec k/G_x]`
  canonically. Check: for `k` algebraically closed, `𝒳` locally of finite type over `k` and
  `x ∈ 𝒳(k)`, `κ(x) = k`, so `𝒵_x ≃ BG_x`, and `BG_x ↪ 𝒳` is a closed immersion when `x` is
  closed. (stacks-06ML lines 1214–1237, 1288–1305; stacks-06QB lines 2664–2695; alper-moduli
  lines 6993–7025 and 16528–16552: Propositions 4.5.16 and 7.4.39, Exercise 7.4.40; rydh2011
  lines 1268–1277: Theorem B.2.)
- **T10 (tangent space, infinitesimal neighbourhoods, normal space).** For `x : Spec k → 𝒳`,
  the tangent space `T_{𝒳,x}` is the set of pairs (`τ : Spec k[ε]/(ε²) → 𝒳`, `α : x ≅ τ|_k`)
  modulo isomorphisms of `τ` compatible with `α`; it is a `k`-vector space when `𝒳` has affine
  diagonal, and `G_x` acts `k`-linearly by precomposition on `α`. For `𝒳` locally Noetherian and
  `x` a closed point with `i : 𝒵_x → 𝒳` the closed immersion of T7 and `ℐ ⊆ O_𝒳` its
  quasi-coherent ideal, the `n`-th infinitesimal neighbourhood is the closed substack cut out by
  `ℐ^{n+1}`. When moreover `κ(x) = k` and `G_x` is affine, the normal space
  `N_x := (ℐ/ℐ²)^∨ = (i^*ℐ)^∨` is a finite-dimensional `G_x`-representation through
  `QCoh(BG_x) ≃ Rep(G_x)`, and `T_{𝒳,x} ≅ N_x` as `G_x`-representations when `G_x` is smooth.
  Check: for `𝒳 = [X/G]` with `G` smooth and `x ∈ X(k)`, `N_x = T_{X,x}/T_{G·x,x}`.
  (ahr2020 lines 39–44, 248–252, 475–486; alper-moduli lines 6859–6900: Definition 4.5.7,
  Proposition 4.5.10.)
- **T11 (comparison with Laumon–Moret-Bailly).** For `𝒳` with quasi-compact diagonal, every
  point is algebraic: there is a quasi-compact immersion `𝒵 → 𝒳` with `𝒵` an fppf gerbe over an
  integral affine scheme `Z` whose generic point is the image of `x`, and `𝒵_x` is the generic
  fibre `𝒵 ×_Z Spec κ(x)`, with `𝒵_x → 𝒳` quasi-affine. The residual gerbe of Laumon–Moret-Bailly
  Chapter 11 for quasi-separated stacks is this one; their definition is independent of the
  representative only for representatives finite over `κ(x)`. (rydh2011 lines 1227–1300:
  Appendix B, Theorems B.1 and B.2; stacks-06ML lines 1293–1297, footnote to Definition
  100.11.8; lmb2000 Chapter 11, uncertified.)

## Suppliers

- `TauCetiRoadmap/SchemeAndStackFoundations` (main): §1.7 points of algebraic spaces; §1.13
  group algebraic spaces and actions; §1.14 groupoids and stabilizers; §1.15 torsors; §1.18
  stacks in groupoids, stackification and 2-fibre products; §1.19 representable morphisms,
  algebraic and Deligne–Mumford stacks; §1.20 inertia, `automorphismGroup`, `SmoothLocal`
  morphism properties, `Stacks.points` with its topology, locally Noetherian stacks, separated
  stacks, presentations `[U/R]`; §1.21 quotient stacks, `BG`; §1.22 `Stacks.QCoh` and the
  `QCoh(BG) = comodules` check; §1.23 coarse spaces and tame stacks (for Checks only); §4.1
  thickenings. Layer 0 for schemes and residue fields.
- `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry` (PR #853, merge order 32): §4.1
  `IsGerbe` on a site, for the relative gerbe predicate of T8; §5.1 rigidification only as a
  Check. If the design chooses not to depend on this roadmap, it must own the site-level gerbe
  predicate in the Stacks Project form and record the duplication.
- `TauCetiRoadmap/ReductiveGroups` (main): Layer 1 representations of affine group schemes as
  comodules, for `N_x` as a representation; Tau Ceti's `linearlyReductiveAffineGroupSchemeProperty`
  only for Checks that mention linear reductivity.
- Mathlib: `AlgebraicGeometry` (schemes, residue fields, closed immersions, group schemes under
  `AlgebraicGeometry/Group`), `CategoryTheory.Sites.Descent.IsStack` and `IsPrestack` for the
  pseudofunctor-level stack predicate.

## Consumers

- `TARGET-VirtualFundamentalClasses` (#6027): residual gerbes as the zero-dimensional integral
  substacks of a Deligne–Mumford stack, for the degree of a zero-cycle.
- `EquivariantIntersectionTheory` (PR #1685), `GroupSchemesOverABase` (PR #1522): stabilisers
  `BG_x` at closed points of quotient stacks.
- `LanglandsParameterStacks` (PR #1202, merge order 61): its §1.16 Checks already speak of the
  structure sheaf of the residual gerbe at a parameter; it should import T4, T7 and T9.
- `DESIGN-FunctionFieldArithmeticPartII` (board, merge order 362): its GC1-PERMANENCE item claims a
  residual-gerbe fact for zero-dimensional Deligne–Mumford stacks of finite type over an
  algebraically closed field (reduction is a disjoint union of residual gerbes); that fact is T6
  with T7 and T9 and should be imported, not owned there.
- `MotivicStructuresInModuliOfCurves` (board, merge order 325): central rigidification and
  stabilisers of quotient stacks, through T2 and T9.
- A future roadmap on the Luna étale slice theorem (ahr2020 Theorems 1.1 and 1.2) and on
  deformation theory of stacks at a point: T9 and T10 are exactly its vocabulary.

## Sources

Manifest keys are those of `packages/StackPointsAndResidualGerbes/sources.toml`.

- `stacks-04XE`: Stacks Project, Properties of Algebraic Stacks, §100.4 (points, the topology on
  `|𝒳|`); open repository, certified. Lemmas 100.4.1–100.4.9 (lines 341–571).
- `stacks-06ML`: Stacks Project, Properties of Algebraic Stacks, §100.11 (residual gerbes);
  same chapter text, certified. Lemmas 100.11.1–100.11.13, Definition 100.11.8 (lines 1127–1345).
- `stacks-06QB`: Stacks Project, Morphisms of Algebraic Stacks, §101.28 (gerbes) and §101.29
  (stratification by gerbes); open repository, certified (lines 2613–2945).
- `stacks-06RD`: Stacks Project, Morphisms of Algebraic Stacks, §101.31 (existence of residual
  gerbes); the same chapter text also carries §101.4 (Lemma 101.4.16), §101.18 (finite type
  points), §101.19 (automorphism groups) and §101.51 (residual gerbes, closed points); certified.
- `ahr2020`: Alper, Hall, Rydh, *A Luna étale slice theorem for algebraic stacks*, Ann. of Math.
  191 (2020); read as arXiv:1504.06467v3 (dated 23 November 2020, the published numbering):
  Theorems 1.1–1.2, §1.5 notation (infinitesimal neighbourhoods), §3.1 (normal and tangent
  space); open repository, certified.
- `alper-moduli`: Alper, *Stacks and Moduli*, draft of 5 January 2026 on the author page
  (CC BY-NC-ND 4.0): §4.5.2 (Definition 4.5.7, Proposition 4.5.10), §4.5.3 (Definitions
  4.5.12–4.5.13, Proposition 4.5.16), §7.4.5 (Proposition 7.4.39, Exercises 7.4.40–7.4.42);
  author page, certified. Numbering is that of this draft.
- `rydh2011`: Rydh, *Étale dévissage, descent and pushouts of stacks*, J. Algebra 331 (2011);
  read as arXiv:1005.2171v2, Appendix B (Theorems B.1–B.2); open repository, certified. This,
  not the Noetherian-approximation paper, carries the residual-gerbe appendix the target cites.
- `rydh2015`: Rydh, *Noetherian approximation of algebraic spaces and stacks*, J. Algebra 422
  (2015), arXiv:0904.0227v4; certified; contains no residual-gerbe material and is kept only for
  Checks that approximate a stack by a Noetherian one.
- `lmb2000`: Laumon, Moret-Bailly, *Champs algébriques*, Springer 2000, Chapters 5 and 11;
  paywalled, uncertified, cited by locator.
- `olsson2016`: Olsson, *Algebraic Spaces and Stacks*, AMS 2016, Chapter 11; paywalled,
  uncertified, cited by locator; background only.

## Risks

- **No Lean carrier for algebraic stacks.** Neither the pinned Mathlib nor Tau Ceti has
  algebraic stacks, and the Suggested.lean of SchemeAndStackFoundations declares none of its stack
  layer (its README says the stack topology is specified in the README only). The acceptance
  test of this roadmap must therefore carry a minimal stack carrier of its own (a pseudofunctor
  on schemes with Mathlib's `IsStack`, a representable-diagonal predicate and a smooth atlas) in
  "simple definitions", and that carrier must match the one SchemeAndStackFoundations builds.
  This is the main design risk; the design should keep the carrier to what T4–T9 need.
- **Closed substacks.** SchemeAndStackFoundations names no closed-immersion or reduced-induced
  closed-substack API for stacks. T7 and T10 need both; the design owns them here and must
  record the supplier contract, or the ownership of these lemmas must be settled with the owner.
- **Residue field.** The one-point reduced locally Noetherian algebraic space of T5(d) is the
  spectrum of a field only after a decency argument (Stacks, Decent Spaces §68.13 residual
  spaces; Rydh's Theorem B.2 needs quasi-compact diagonal). T9's second clause is stated under
  "locally Noetherian or quasi-compact diagonal" for that reason; the design must fetch the
  Decent Spaces chapter and fix the exact hypothesis.
- **Paywalled comparisons.** Laumon–Moret-Bailly and Olsson cannot be read; the comparison T11
  is sourced from Rydh's Appendix B and the Stacks footnote only, and can state nothing about
  LMB's text beyond those two accounts.
- **Misdirected citation.** The target cites Rydh's Noetherian-approximation paper for residual
  gerbes; the material is in the étale dévissage paper (`rydh2011`). Recorded in the manifest.
- **Supplier choice for gerbes.** AlgebraicModuliForArithmeticGeometry is still a pull request;
  depending on its §4.1 fixes the merge-order position of this roadmap after it. The design must
  decide whether to import or to own the site-level predicate.
