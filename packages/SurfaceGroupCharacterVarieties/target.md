Verdict: design
Name: SurfaceGroupCharacterVarieties
Base: none
Owner: none

Title of the roadmap: **Surface group character varieties: mapping class groups of punctured
surfaces, the outer action on the fundamental group, and character varieties of real reductive
groups.** Folder `TauCetiRoadmap/SurfaceGroupCharacterVarieties`. Merge-order slot: after
`TeichmullerGeometry` (line 285) and before `MappingClassGroupsAndCanonicalRepresentations`
(line 289), which is its first consumer; every other supplier is earlier in the order, on main, or
another author's open pull request.

## Scope

The filed target has three layers. The first is mostly planned already and is imported; the
second is planned in outline by one roadmap and is completed here; the third is planned nowhere
and is the roadmap's centre of gravity.

**What is imported, never planned again.**

- Surfaces with punctures and boundary as actual topological data, the mapping class group
  `Mod(S)` of a finite-type surface (homeomorphisms fixing `∂S` pointwise, punctures may be
  permuted, isotopy rel `∂S`), the marked-point group `Mod(S*)`, `Forget : Mod(S*) → Mod(S)`,
  the evaluation fibration of `Homeo⁺(S, ∂S)`, Hamstrom's contractibility of `Homeo₀(S)`, the
  point-pushing homomorphism and the Birman exact sequence for `χ(S) < 0`, capping and
  forgetting, and the action of `Mod(S)` through `Out(π₁ S)` on conjugacy classes of
  homomorphisms `π₁(S) → G`: `MordellLawrenceVenkatesh` Layer LV.5, §§5.1, 5.9, 5.16–5.21, 5.23
  (pull request #1231, merge order 156). The board package
  `MappingClassGroupsAndCanonicalRepresentations` (design README, R1) and
  `GroupActionsOnRiemannSurfaces` (#1728) already import these by node id, and the former records
  that LV.5 is "pending transfer to topology owners": this roadmap imports LV.5 by name and section
  and does not become that owner by stealth (see Risks).
- The topological mapping class groups of compact surfaces, `MappingClassGroupFull`,
  `MappingClassGroupPlus`, `MappingClassGroupRel`, the PL and smooth comparison homomorphisms and
  their bijectivity, Dehn twists, and the base cases `Mod(D²) = 1`, `Mod(annulus) = ℤ`,
  `Mod⁺(S²) = 1`, `Mod(S²) = ℤ/2`, `Mod⁺(T²) ≅ SL₂(ℤ)`, `Mod(T²) ≅ GL₂(ℤ)`: `SurfaceTopology`
  Layer 9 (pull request #271, another author's roadmap, not yet in the merge order), with
  Epstein's theorem and the smoothing theorems from `PlanarTopology` Layer 8 (same pull request).
- For closed surfaces: `Diff(Σ)` with the weak Whitney topology (Tau Ceti `TauCeti.Diff`,
  `Diffeomorph.weakWhitneyTopology`), smooth isotopies versus paths in `Diff(Σ)` (Tau Ceti
  `TauCeti.Diffeotopy.joined_one_final` and the parameter-smoothing converse), one-parameter
  isotopy extension, `Mod±(Σ) = π₀ Diff(Σ)` and its comparison with SurfaceTopology Layer 9, the
  smooth Dehn–Nielsen–Baer theorem (Douady–Earle realization, Smale's theorems, the smooth
  Baer–Epstein kernel theorem) and the Euler number of a `PSL₂(ℝ)`-representation with the
  uniformizing holonomy: `TeichmullerGeometry` §§0.2–0.3, 3.1, 4.4–4.5, 5.1–5.4 (pull request
  #1169, merge order 285).
- The presented surface groups `S⁺(g, m)` with their peripheral tuple, abelianisation and freeness
  for `m ≥ 1`: `FreeGroupsAndLimitGroups` §§6.1–6.2 (main); van Kampen and the fundamental group
  of a wedge of circles: `AlgebraicTopology` Stage 1 (main); the universal cover and deck group:
  `Completed/UniversalCovers`.
- Real forms and complexification of Lie groups (`LieGroups` Layer 7, main), Cartan involutions,
  `K = G^θ` and the Cartan decomposition (`LieGroups` Layer 9, main, refined at the head of pull
  request #1051), the algebraic Cartan involution of `𝐇(ℝ)` with its existence and conjugacy
  (`ArithmeticLocallySymmetricSpaces` ALS.0.1–0.2, pull request #871, merge order 68), and the
  conjugacy of Cartan involution data (`LieGroupsPartII`, board design #6276, item 1). The filed
  text names "the real forms of ReductiveGroups (main)"; `ReductiveGroups` on main has no
  real-form section, so the supplier is corrected to these.
- Algebraic groups over a field: Zariski closures of subgroups, reductivity, parabolic and Levi
  subgroups, closed orbits and orbit closures (`ReductiveGroups` Layers 2, 3A, 6–7, main); the
  affine quotient of an affine variety by a reductive group with its finite generation and
  closed-orbit fibre property over fields, `G`-complete reducibility of closed subgroups and of
  homomorphisms, and Richardson's criterion that the simultaneous-conjugacy orbit of a tuple in
  `G(k)^m` (`k` algebraically closed) is closed exactly when the Zariski closure of the generated
  subgroup is `G`-completely reducible, with the semisimplification by projection to a Levi:
  `ArithmeticGaloisRepresentations` §1.7, the paragraphs "Reductive quotients over fields and
  DVRs" and "Complete reducibility and closed tuples" (pull request #856, merge order 46).
- The moduli of flat `K`-connections on a closed surface for compact `K` and its comparison with
  `Hom(π₁Σ, K)/K`: `SymplecticGeometry/HamiltonianReduction` R5 (main); this roadmap's compact
  case is compared with it, not re-planned.

**What this roadmap owns.**

1. *Mapping class groups of punctured surfaces, completed.* For `g, n ≥ 0` and `Σ_{g,n} = Σ_g ∖ P`
   with `|P| = n`: the comparison of the punctured model and the marked-point model (every
   homeomorphism of `Σ_{g,n}` extends uniquely to a homeomorphism of `Σ_g` preserving `P`,
   isotopies extend, and `Mod_{g,n} ≅ Homeo⁺(Σ_g, P)/isotopy through P-preserving maps`); isotopy
   as a congruence and as path-connectedness in the compact-open topology; the permutation
   homomorphism `Mod_{g,n} → Sym(P)`, its surjectivity, and the pure mapping class group
   `PMod_{g,n}` as its kernel, of index `n!`; the pure Birman sequence
   `1 → π₁(Σ_{g,n}) → PMod_{g,n+1} → PMod_{g,n} → 1` for `2g − 2 + n > 0` (requested from LV.5's
   owner by `MappingClassGroupsAndCanonicalRepresentations` R1 and planned nowhere); independence of
   the choice of `(Σ_g, P)` up to inner automorphisms; the smooth model
   `Diff⁺(Σ_g, P)/smooth isotopy` and its isomorphism with the topological group, extending
   TeichmullerGeometry §3.1 from the closed case; and the low-genus identifications
   `Mod_{0,0} = Mod_{0,1} = 1`, `Mod_{0,2} ≅ ℤ/2`, `Mod_{0,3} ≅ S₃`, `PMod_{0,3} = 1`,
   `Mod_{1,0} ≅ SL₂(ℤ)` as Checks against SurfaceTopology Layer 9 and LV.5 §5.9.
2. *The outer action, made precise.* `Inn(Γ)`, `Out(Γ) = Aut(Γ)/Inn(Γ)` for any group `Γ`
   (Mathlib has `MulAut` and `MulAut.conj` but no `Out`); for a homeomorphism `f` and a path `δ`
   from `x` to `f(x)` the automorphism `f_δ` of `π₁(Σ_{g,n}, x)`, its change-of-path, composition,
   inverse and homotopy-invariance laws, the lemma that a homeomorphism isotopic to the identity
   induces an inner automorphism (through the track of the basepoint), the homomorphism
   `Ψ : Mod_{g,n} → Out(π₁(Σ_{g,n}, x))` and its canonicity under change of basepoint; the induced
   left action of `Out(Γ)` on the set `Hom(Γ, H)/H` of conjugacy classes of homomorphisms into any
   group `H`, `[φ]·[ρ] = [ρ ∘ φ⁻¹]`, hence of `Mod_{g,n}` through `Ψ`, and the negative result that
   `Mod_{g,n}` acts on classes, not on `Hom(Γ, H)` itself (`LandesmanLitt2024` lines 41–50). LV.5
   §5.9 records this action as a construction remark; the laws, the basepoint canonicity and the
   general `Out(Γ)` formulation are owned here. The Dehn–Nielsen–Baer theorem for `2g − 2 + n > 0`
   (`Ψ` injective, with image the automorphisms preserving the peripheral structure, and
   `Mod±_{g,n} → Out` an isomorphism in the closed case) is a stated target; its closed smooth case
   is consumed from TeichmullerGeometry §§5.2–5.4, and the punctured case (`FarbMargalit2012`
   Chapter 8, §8.2) is proved here or left `sorry` with the closed case as its Check.
3. *Character varieties of real reductive groups.* For a connected complex reductive algebraic
   group `G`, a real form `τ` (an antiholomorphic involution, `G^ℝ = G^τ`), a Cartan involution `σ`
   for `τ` and the maximal compact `H^ℝ = (G^ℝ)^σ` (`BCGGO2024` lines 466–481, `Knapp2002`
   Ch. VI §§1–2), and a finitely generated group `Γ`: the representation space `Hom(Γ, G^ℝ)` with
   the pointwise topology, its identification with the closed real-algebraic subset of `(G^ℝ)^m`
   cut out by the relators of a presentation (for `Γ = π₁(Σ_g)` the tuples `(A_i, B_i)` with
   `∏[A_i, B_i] = 1`); **reductive representations** (`Ad ∘ ρ` completely reducible on `𝔤^ℝ`); the
   **character variety** `𝒳(Γ, G^ℝ) = Hom^red(Γ, G^ℝ)/G^ℝ` with the quotient topology
   (`BCGGO2024` lines 2706–2713, Definition 8.1); the equivalences for a representation `ρ`:
   `Ad ∘ ρ` completely reducible on `𝔤^ℝ` ⇔ completely reducible on `𝔤 = 𝔤^ℝ ⊗ ℂ` ⇔ the Zariski
   closure of `ρ(Γ)` in `G` is reductive ⇔ `ρ(Γ)` is `G`-completely reducible ⇔ the `G`-orbit of
   `ρ` in `Hom(Γ, G)` is closed ⇔ the `G^ℝ`-orbit of `ρ` in `Hom(Γ, G^ℝ)` is closed in the
   classical topology (`Sikora2012` line 228 Proposition 8 and lines 572–586 Theorem 30 for the
   complex steps, resting on `Richardson1988` Theorem 3.6 through `ArithmeticGaloisRepresentations`
   §1.7; `RichardsonSlodowy1990` §7 for the real-orbit step); the Hausdorffness of `𝒳(Γ, G^ℝ)`
   (`RichardsonSlodowy1990` §9); the comparison, for complex `G` regarded as a real form of
   `G × Ḡ` or directly, of `𝒳(Γ, G)` with the complex points of the affine quotient
   `Hom(Γ, G)//G` of `ArithmeticGaloisRepresentations` §1.7 (`Sikora2012` lines 824–837: every
   fibre of `Hom → Hom//G` contains a unique closed orbit, so `Hom^red/G → (Hom//G)(ℂ)` is a
   bijection, and a homeomorphism for the classical topology); basepoint independence of
   `𝒳(π₁(Σ, x), G^ℝ)`; the action of `Out(Γ)` on `𝒳(Γ, G^ℝ)` by homeomorphisms and of
   `Mod_{g,n}` through `Ψ`; and, as Checks, the compact case `𝒳(Γ, H^ℝ) = Hom(Γ, H^ℝ)/H^ℝ` (every
   representation into a compact group is reductive; comparison with HamiltonianReduction R5), the
   abelian case, `G^ℝ = GL_r(ℝ)` and `GL_r(ℂ)` where reductive means semisimple on `ℂ^r`, the
   Fuchsian locus `Fuch(PSL₂(ℝ)) ⊆ 𝒳(π₁Σ_g, PSL₂(ℝ))` identified with Teichmüller space through
   TeichmullerGeometry §§4.4–4.5 and 6 (`BCGGO2024` lines 2714–2726, Example 8.2), and the
   non-example of a non-closed orbit (a unipotent representation whose orbit closure contains the
   trivial one).

**Generality.** The filed text states layer 3 for closed `Σ` of genus `g ≥ 2`, as the sources do.
The general statement the library needs is for an arbitrary finitely generated group `Γ`: the
representation space, reductivity, the character variety, the Richardson–Slodowy equivalences,
Hausdorffness and the `Out(Γ)`-action are all theorems about `Γ` and `G^ℝ`, and consumers need them
for free groups (punctured surfaces, `2g − 2 + n > 0`, `n ≥ 1`) and for 3-manifold groups
(Culler–Shalen theory, named by GeometricTopology as Part II work). The surface cases are the
instances: closed `Σ_g` (the filed statement), punctured `Σ_{g,n}` (where `Hom(π₁, G^ℝ) ≅
(G^ℝ)^{2g+n−1}`), the torus and the sphere as degenerate Checks. Layers 1 and 2 are stated for all
`g, n ≥ 0`; the hypothesis `2g − 2 + n > 0` enters only where the sources need it (Birman,
Dehn–Nielsen–Baer, trivial centre). Real forms are taken as the fixed points of an antiholomorphic
involution of a connected complex reductive group, with the bridge to "real points of a connected
reductive `ℝ`-group" (the hypothesis of Richardson–Slodowy) a theorem of the design, not a
restriction to the algebraic case; the design must not retreat to `G^ℝ` semisimple, connected, or
split, and must keep `G^ℝ` possibly disconnected (`SO(p, q)`, `BCGGO2024` lines 470–472).

**Boundaries.** Not owned: Dehn twists, generation theorems, the symplectic representation and
the action on homology (SurfaceTopology Layer 9, LV.5 §§5.11–5.13, 5.21a–5.22); Teichmüller space,
the `Mod`-action on it, Fenchel–Nielsen coordinates, Nielsen realization (TeichmullerGeometry
Layers 1–3, 7–8); Teichmüller uniformization of the pointed moduli stack, MCG-finite
representations, Putman–Wieland and the canonical-representation theorems
(`MappingClassGroupsAndCanonicalRepresentations` C.0–C.9); the scheme structure of the `GL_r`
Betti moduli and its component theory (`HodgeStructuresPartII` H.1, cited by several board designs
as `H.1/betti-framed` and `H.1/betti-coarse`; only the set-and-topology comparison with
`𝒳(Γ, GL_r(ℂ))` is stated here); the nonabelian Hodge correspondence, Higgs bundles, Hitchin
components, Anosov and `Θ`-positive representations (`BCGGO2024` §§5–8 beyond Definition 8.1, a
later roadmap); Goldman's symplectic form on `𝒳` (`Goldman1984`, a later roadmap; the tangent-space
and smoothness theory of `Sikora2012` §§8–9, 13–14 goes with it); wild character varieties
(`PainleveEquations`); minimal vectors, the Kempf–Ness theory and the real Hilbert–Mumford
criterion beyond what the closed-orbit and Hausdorffness statements need (a Part II, or
`LieGroupsPartII`).

## Final targets

Throughout, `Σ_g` is a closed connected oriented topological surface of genus `g`, `P ⊂ Σ_g` a
finite set of `n` points, `Σ_{g,n} = Σ_g ∖ P`, `x ∈ Σ_{g,n}`; `Γ` is a finitely generated group;
`G` is a connected complex reductive algebraic group with real form `τ`, `G^ℝ = G^τ`, Cartan
involution `σ` commuting with `τ` and `H^ℝ = (G^ℝ)^σ`. Locators into waived or paywalled texts are
section-level.

1. **Marked-point model and pure subgroup.** Every homeomorphism of `Σ_{g,n}` extends uniquely to
   a homeomorphism of `Σ_g` preserving `P`, and every isotopy of `Σ_{g,n}` extends to an isotopy of
   `Σ_g` through `P`-preserving homeomorphisms; hence
   `Mod_{g,n} = Homeo⁺(Σ_{g,n})/Homeo₀ ≅ Homeo⁺(Σ_g, P)/isotopy rel P`. Isotopy is a congruence on
   `Homeo⁺`, and two homeomorphisms are isotopic exactly when they lie in one path component of the
   compact-open topology. The permutation map `Mod_{g,n} → Sym(P)` is a surjective homomorphism
   with kernel `PMod_{g,n}`, of index `n!`; for `2g − 2 + n > 0` the pure Birman sequence
   `1 → π₁(Σ_{g,n}, x) → PMod_{g,n+1} → PMod_{g,n} → 1` is exact, with the first map point-pushing
   (LV.5 §§5.19–5.20). A homeomorphism `(Σ_g, P) → (Σ'_g, P')` of pairs induces an isomorphism of
   mapping class groups, unique up to inner automorphism. (`FarbMargalit2012` Ch. 1 §1.1, Ch. 2
   §2.1, Ch. 4 §4.2; `LandesmanLitt2024` line 474 for the index, lines 503–515 for the pure Birman
   sequence as used downstream.)
2. **Smooth model.** For a smooth structure on `Σ_g`, `Diff⁺(Σ_g, P)/smooth isotopy rel P` is
   isomorphic to `Mod_{g,n}` through the forgetful map, by the smooth comparison of SurfaceTopology
   Layer 9 and TeichmullerGeometry §§0.2, 3.1 extended to the marked-point case; and the low-genus
   groups are `Mod_{0,0} = Mod_{0,1} = 1`, `Mod_{0,2} ≅ ℤ/2`, `Mod_{0,3} ≅ S₃` with `PMod_{0,3} = 1`,
   `Mod_{1,0} ≅ SL₂(ℤ)` (Checks against SurfaceTopology `mcg_sphere_plus`, `mcg_torus_plus`, and
   LV.5 §5.9's `Sym(3)` Check). (`FarbMargalit2012` Ch. 2 §2.1 and §2.2.)
3. **The automorphism `f_δ` and the homomorphism `Ψ`.** For `f ∈ Homeo⁺(Σ_{g,n})` and a path `δ`
   from `x` to `f(x)`, `f_δ([γ]) = [δ · f(γ) · δ⁻¹]` is an automorphism of `π₁(Σ_{g,n}, x)`;
   `f_{δ'} = c_{[δ'·δ⁻¹]} ∘ f_δ` for a second path `δ'`, `(f ∘ g)_{δ·f(ε)} = f_δ ∘ g_ε`,
   `(f⁻¹)_{f⁻¹(δ)⁻¹} = (f_δ)⁻¹`, and `f_δ` depends only on the homotopy class of `δ` and on `f` up to
   homotopy (through the track of `x`); if `f` is isotopic to the identity then `f_δ` is inner.
   Consequently `Ψ : Mod_{g,n} → Out(π₁(Σ_{g,n}, x))`, `[f] ↦ [f_δ]`, is a well-defined
   homomorphism, and for `x' ∈ Σ_{g,n}` the change-of-basepoint isomorphism conjugates `Ψ_x` to
   `Ψ_{x'}`. (`FarbMargalit2012` Ch. 8 §8.1; the inner-automorphism lemma is the based form of LV.5
   §5.19's statement that `Push(α)` acts by conjugation by `α`.)
4. **Action on conjugacy classes.** For any group `H`, `Out(Γ)` acts on `Hom(Γ, H)/H` by
   `[φ]·[ρ] = [ρ ∘ φ⁻¹]`, so `Mod_{g,n}` acts on `Hom(π₁(Σ_{g,n}, x), H)/H` through `Ψ`,
   compatibly with change of basepoint; `PMod_{g,n}` and `Mod_{g,n}` have the same finite orbits
   (index `n!`). There is no action of `Mod_{g,n}` on `Hom(π₁(Σ_{g,n}, x), H)` itself lifting this
   one in general: the Check is `H = GL_r(ℂ)` with a non-trivial inner automorphism moving a
   representation (`LandesmanLitt2024` lines 41–50, Definition 1.1.1 and the paragraph after it;
   §2.1, line 523, for the properties the consumer needs).
5. **Dehn–Nielsen–Baer (stated target).** For `2g − 2 + n > 0`, `Ψ` is injective, and
   `Mod±_{g,n} → Out(π₁(Σ_{g,n}))` is an isomorphism onto the subgroup preserving the set of
   peripheral conjugacy classes (all of `Out` in the closed case). The closed smooth case is
   TeichmullerGeometry §§5.2–5.4 and is consumed; the punctured case is stated with `sorry` and its
   proof route recorded (`FarbMargalit2012` Ch. 8 §§8.1–8.2, Theorems 8.1 and 8.8).
6. **Representation spaces of real forms.** `Hom(Γ, G^ℝ)` with the pointwise (compact-open from
   discrete `Γ`) topology is homeomorphic, through any finite presentation with `m` generators, to
   a closed real-algebraic subset of `(G^ℝ)^m`; for `Γ = π₁(Σ_g)` with the standard presentation it
   is `{(A_i, B_i) ∈ (G^ℝ)^{2g} : ∏ [A_i, B_i] = 1}`, and for `Γ = π₁(Σ_{g,n})`, `n ≥ 1`, it is
   `(G^ℝ)^{2g+n−1}` (`FreeGroupsAndLimitGroups` §§6.1–6.2). `G^ℝ` acts continuously by
   conjugation, and `Hom(Γ, G^ℝ) = Hom(Γ, G)^τ` with `Hom(Γ, G)` the complex points of the
   representation scheme of `ArithmeticGaloisRepresentations` §1.7.
7. **Reductive representations.** For `ρ : Γ → G^ℝ` the following are equivalent: (a) `Ad ∘ ρ` is
   completely reducible on `𝔤^ℝ`; (b) `Ad ∘ ρ` is completely reducible on `𝔤`; (c) the Zariski
   closure of `ρ(Γ)` in `G` is reductive; (d) `ρ(Γ)` is `G`-completely reducible; (e) the `G`-orbit
   of `ρ` in `Hom(Γ, G)` is Zariski closed; (f) the `G^ℝ`-orbit of `ρ` in `Hom(Γ, G^ℝ)` is closed in
   the classical topology. The set `Hom^red(Γ, G^ℝ)` is `G^ℝ`-invariant, and every `ρ` with values
   in a compact subgroup, every `ρ` with `ρ(Γ)` Zariski dense in a reductive subgroup, and every
   `ρ` whose centralizer is finite modulo the centre is reductive; a representation into a proper
   parabolic with no Levi containing its image is not. (`Sikora2012` line 228, Proposition 8, for
   (c) ⇔ (d); lines 572–586, Theorem 30, for (d) ⇔ (e), resting on `Richardson1988` Theorem 3.6,
   which `ArithmeticGaloisRepresentations` §1.7 "Complete reducibility and closed tuples" plans in
   every characteristic; (a) ⇔ (b) is scalar extension; (b) ⇔ (c) is the standard characterization
   of reductive linear groups by complete reducibility of the adjoint representation in
   characteristic zero; (e) ⇔ (f) is `RichardsonSlodowy1990` §7, real points whose `G(ℂ)`-orbit is
   closed have closed `G(ℝ)`-orbit and conversely.)
8. **The character variety and its topology.** `𝒳(Γ, G^ℝ) := Hom^red(Γ, G^ℝ)/G^ℝ` with the
   quotient topology is Hausdorff, second countable and locally compact; the map
   `Hom(Γ, G^ℝ) → 𝒳(Γ, G^ℝ)` sending `ρ` to the class of the unique closed orbit in the closure of
   `G^ℝ·ρ` is continuous and is the universal Hausdorff quotient of `Hom(Γ, G^ℝ)/G^ℝ`; for complex
   `G` the map `𝒳(Γ, G) → (Hom(Γ, G)//G)(ℂ)` is a homeomorphism onto the complex points of the
   affine quotient with their classical topology. For `Γ = π₁(Σ, x)`, change of basepoint induces
   a canonical homeomorphism `𝒳(π₁(Σ, x), G^ℝ) ≅ 𝒳(π₁(Σ, x'), G^ℝ)`, so `𝒳(Σ, G^ℝ)` is
   well-defined. (`RichardsonSlodowy1990` §§4, 7, 9; `Sikora2012` lines 824–837 for the affine
   quotient and the unique closed orbit in each fibre; `BCGGO2024` Definition 8.1, lines 2712–2713.)
9. **The mapping class action.** `Out(Γ)` acts on `𝒳(Γ, G^ℝ)` by homeomorphisms, `[φ]·[ρ] =
   [ρ ∘ φ⁻¹]`, preserving reductivity; hence `Mod_{g,n}` acts on `𝒳(Σ_{g,n}, G^ℝ)` through `Ψ`,
   and this action is the restriction of target 4 to reductive classes. Checks: the compact case
   `𝒳(Γ, H^ℝ) = Hom(Γ, H^ℝ)/H^ℝ` with every representation reductive and its comparison with
   HamiltonianReduction R5 for closed `Σ`; `G^ℝ = GL_r(ℝ)`, `GL_r(ℂ)` with reductive ⇔ semisimple
   on `ℂ^r`, where the `Mod_{g,n}`-orbits of target 4 restricted to semisimple classes are the
   orbits of target 9 (`LandesmanLitt2024` lines 47–50); `𝒳(ℤ, G^ℝ)` as the set of semisimple
   conjugacy classes of `G^ℝ`; the Fuchsian locus of `𝒳(π₁Σ_g, PSL₂(ℝ))`, `g ≥ 2`, as the classes
   of discrete faithful representations, identified with Teichmüller space by TeichmullerGeometry
   §§4.5 and 6 (`BCGGO2024` lines 2714–2726), and its `Mod`-equivariance; the non-closed orbit of a
   unipotent representation of `π₁(Σ_2)` into `SL₂(ℝ)`.

`Suggested.lean` should pin, with `sorry`: target 1's extension theorem and the exactness of the
permutation sequence for a surface given as a type with a `ChartedSpace (EuclideanSpace ℝ (Fin 2))`
structure and the simple definitions `Homeo⁺`, isotopy and the quotient; target 3's homomorphism
`Ψ` into `MulAut (FundamentalGroup S x) ⧸ (MulAut.conj).range`; target 4's action on
`(Γ →* H) ⧸ conjugacy`; and targets 7–8 for `G^ℝ = GL_r(ℝ)` and `GL_r(ℂ)` on
`Matrix.GeneralLinearGroup`, with `Γ` any `FinitelyGenerated` group and the surface group of
`FreeGroupsAndLimitGroups` §6.1 as the instance: reductive = semisimple on `ℂ^r`, closed orbit in
the product topology, and Hausdorffness of the quotient of the semisimple locus. Real forms as
fixed points of an involution of `GL_r(ℂ)` are statable; the general connected reductive `G` is
not in Mathlib and stays in the README.

## Suppliers

- `MordellLawrenceVenkatesh` Layer LV.5 (pull request #1231, merge order 156): §5.1 (surfaces),
  §5.9 (`Mod(S)`, `Mod(S*)`, `Forget`, the action on conjugacy classes of homomorphisms through
  `Out(π₁ S)`), §5.16 (trivial centre for `χ < 0`), §5.17 (evaluation fibration), §5.18 (Hamstrom),
  §5.19 (`Push`), §5.20 (Birman), §5.21 (capping and forgetting), §5.23 (configuration fibration
  and the free basis of `π₁(Σ_{g,1})`).
- `SurfaceTopology` Layer 9 and `PlanarTopology` Layers 5–8 (pull request #271, another author's
  roadmap): the compact mapping class groups and base cases, the PL/smooth comparison, Epstein's
  theorem.
- `TeichmullerGeometry` (pull request #1169, merge order 285): §0.2 (`Diff`, smooth isotopy versus
  paths), §0.3 (isotopy extension), §3.1 (`Mod± = π₀ Diff` and the comparison), §§4.4–4.5 (Euler
  number, uniformizing holonomy), §§5.1–5.4 (smooth Dehn–Nielsen–Baer), Layer 6 (representations
  to marked surfaces) for the Fuchsian-locus Check.
- `FreeGroupsAndLimitGroups` §§6.1–6.2 (main): presented surface groups, peripheral tuple,
  freeness. `AlgebraicTopology` Stage 1 (main) and `Completed/UniversalCovers` Stages 1–2.
- `GeometricTopology` Layers 1 and 3 (main): collars, isotopy extension, `Diff(M)` as a topological
  group; Tau Ceti `TauCeti.Diff`, `Diffeomorph.weakWhitneyTopology`, `TauCeti.Diffeotopy`,
  `TauCeti.Diffeotopy.joined_one_final`.
- `LieGroups` Layers 7 and 9 (main; head of pull request #1051): complexification, real forms,
  Cartan involution, `K = G^θ`, Cartan decomposition. `LieGroupsPartII` (board design #6276,
  `packages/RealReductiveGroupsStructure/target.md`): conjugacy of Cartan involution data.
  `ArithmeticLocallySymmetricSpaces` ALS.0.1–0.2 (pull request #871, merge order 68): the algebraic
  Cartan involution of `𝐇(ℝ)`, `IsCartanInvolution.exists`, `IsCartanInvolution.conj`.
- `ReductiveGroups` Layers 2, 3A, 6, 7 (main): Zariski closure, closed orbits and orbit closures,
  reductivity, parabolics and Levis. `ArithmeticGaloisRepresentations` §1.7 (pull request #856,
  merge order 46): "Reductive quotients over fields and DVRs" (the affine quotient, finite
  generation, unique closed orbit per fibre) and "Complete reducibility and closed tuples"
  (`IsGCompletelyReducible`, Richardson's closed-orbit criterion, semisimplification).
- `SymplecticGeometry/HamiltonianReduction` R5 (main): flat `K`-connections modulo gauge compared
  with `Hom(π₁Σ, K)/K` (Check only).
- Mathlib: `FundamentalGroup`, `FundamentalGroup.mul_def`, `Path.Homotopic`, `Homeomorph`,
  `ContinuousMap.Homotopy`, `ZerothHomotopy`, `MulAut`, `MulAut.conj`, `ConjAct`,
  `MonoidHom.range`, `Matrix.GeneralLinearGroup`, `Representation.IsIrreducible`,
  `IsSemisimpleModule`, `Group.FG`, `PresentedGroup`, `T2Space`, `QuotientGroup`.

## Consumers

- `MappingClassGroupsAndCanonicalRepresentations` (board package, merge order 289): C.0/finite-orbit
  (the action of target 4 and `PMod`/`Mod` finiteness equivalence), C.0/moduli-monodromy (pure
  Birman sequence, target 1), C.6 and C.8 (semisimple classes as points of the character variety,
  targets 8–9); its R1 request to LV.5's owner (pure group, pure Birman sequence) is answered by
  target 1 and its design should be told to cite this roadmap for those two items.
- `GroupActionsOnRiemannSurfaces` (pull request #1728): the outer action on classes of
  surface-kernel epimorphisms (target 4 for `H` finite).
- A nonabelian Hodge and higher Teichmüller roadmap (`BCGGO2024` §§5–8: `G^ℝ`-Higgs bundles,
  Theorem 8.3, Hitchin and `Θ`-positive components), a Goldman symplectic form roadmap
  (`Goldman1984`, `Sikora2012` §14), and `GeometricTopology` Part II (Culler–Shalen theory at
  ideal points of `𝒳(π₁ M, SL₂(ℂ))`) consume targets 6–9 for general `Γ`.
- `InstantonFloerTheory` (#1083) and `GaugeQuiltFieldTheory` (#1076): representation spaces of
  surface groups into compact groups (target 9's compact Check). `TopologicalMirrorSymmetryForHitchinSystems`
  (board design): comparison of its Betti moduli with `𝒳(π₁Σ, GL_n(ℂ))`.
- `FuchsianOrbifolds` Part II and `TeichmullerGeometry` Layer 10 style work on discrete
  representations: the Fuchsian locus as an open subset of a Hausdorff space.

## Sources

Recorded in `packages/SurfaceGroupCharacterVarieties/sources.toml`.

- `LandesmanLitt2024` — A. Landesman, D. Litt, *Canonical representations of surface groups*,
  Ann. of Math. 199 (2024), no. 2; arXiv:2205.15352v4 read, certified. Lines 41–50 (outer action of
  `Mod_{g,n}`, Definition 1.1.1, classes not representations), 474 (`PMod` of index `n!`), 503–515
  (Lemma 2.0.1 and the Birman sequence), 523 (§2.1, basic properties).
- `BCGGO2024` — S. Bradlow, B. Collier, O. García-Prada, P. Gothen, A. Oliveira, *A general
  Cayley correspondence and higher Teichmüller spaces*, Ann. of Math. 200 (2024), no. 3;
  arXiv:2101.09377v2 read, certified. Lines 466–481 (real forms as fixed points of antiholomorphic
  involutions, possibly disconnected; Cartan involutions for `τ`, existence and conjugacy),
  2706–2713 (§8.1, `Hom(π₁Σ, G^ℝ)`, reductive representations, Definition 8.1), 2714–2726
  (Example 8.2, Fuchsian locus), 2767–2770 (centralizer and double centralizer).
- `Sikora2012` — A. S. Sikora, *Character varieties*, Trans. AMS 364 (2012), 5173–5208;
  arXiv:0902.2589v3 read, certified. Line 228 (Proposition 8: completely reducible ⇔ Zariski
  closure linearly reductive), 262–266 (representations, the `GL_n` case), 572–586 (Theorem 30:
  closed orbit ⇔ completely reducible, via Richardson), 824–837 (§11, `X_G(Γ) = Hom(Γ, G)//G` as
  the categorical quotient, unique closed orbit per class).
- `Richardson1988` — R. W. Richardson, *Conjugacy classes of n-tuples in Lie algebras and
  algebraic groups*, Duke Math. J. 57 (1988), 1–35; DOI 10.1215/S0012-7094-88-05701-8, Theorem 3.6
  (closed orbit of a tuple ⇔ the generated algebraic subgroup is reductive). The manifest records
  it as certified from Project Euclid, but the cached extraction is a five-line access-denied page,
  so the design must cite it by locator only, as `Sikora2012` line 586 does; it is settled by a
  human answer and is not requested again.
- `RichardsonSlodowy1990` — R. W. Richardson, P. J. Slodowy, *Minimum vectors for real reductive
  algebraic groups*, J. London Math. Soc. (2) 42 (1990), 409–429; waived, cited by locator: §4
  (closed orbits and minimal vectors), §7 (real points: `G(ℝ)`-orbit closed ⇔ `G(ℂ)`-orbit closed),
  §9 (the quotient of the closed-orbit real points is Hausdorff).
- `FarbMargalit2012` — B. Farb, D. Margalit, *A Primer on Mapping Class Groups*, Princeton 2012;
  waived, cited by locator: Ch. 1 §§1.1–1.4 (surfaces, isotopy, Baer, Hamstrom), Ch. 2 §§2.1–2.2
  (definition of `Mod`, Alexander lemma, sphere, annulus, torus, punctured spheres), Ch. 4 §4.2
  (Birman exact sequence), Ch. 8 §§8.1–8.2 (Dehn–Nielsen–Baer, closed and punctured).
- `Knapp2002` — A. W. Knapp, *Lie Groups Beyond an Introduction*, 2nd ed., Birkhäuser 2002;
  waived, cited by locator: Ch. VI §§1–2 (real forms, Cartan involutions, Theorems 6.16 and 6.31).
- `Goldman1984` — W. M. Goldman, *The symplectic nature of fundamental groups of surfaces*, Adv.
  Math. 54 (1984), 200–225; DOI 10.1016/0001-8708(84)90040-9, uncertified (the service resolves the
  DOI only to a paywalled page; Elsevier's open archive copy was not fetched). Cited for §1 (the
  space `Hom(π, G)/G`) as background; no target rests on it.

## Risks

- **Foundations far above the library.** Mathlib and Tau Ceti have no surface carrier, no mapping
  class group, no `Out`, no reductive algebraic groups and no affine quotients; every supplier
  section named above is itself a `sorry`-target. The roadmap is statement-level for a long time;
  its value is the fixed interface (`Ψ`, the action on classes, `𝒳(Γ, G^ℝ)` Hausdorff) that the
  consumers already cite.
- **Three owners of "the mapping class group".** SurfaceTopology Layer 9 (compact, topological,
  another author's pull request outside the merge order), LV.5 (punctured with boundary, inside
  a Mordell roadmap, "pending transfer to topology owners"), TeichmullerGeometry §3.1 (closed,
  smooth). Target 1 must be stated as comparisons between these, not as a fourth definition; if a
  human moves LV.5's surface layer to a topology owner, this roadmap is the natural host, but the
  design must not pre-empt that move (LV.5 node ids are cited by three packages).
- **Real-form bridge.** The sources state the Lie-theoretic notion (antiholomorphic involution of
  a complex reductive Lie group) while Richardson–Slodowy work with real points of a reductive
  `ℝ`-group. The design has to prove, or cite from `ReductiveGroups`/`LieGroups` Layer 7, that the
  fixed points of an antiholomorphic involution of a connected complex reductive algebraic group are
  the real points of an `ℝ`-form, and must keep `G^ℝ` possibly disconnected.
- **Unreadable main sources.** Richardson–Slodowy, Farb–Margalit and Knapp are waived; the
  Richardson 1988 cache is a block page; Goldman is uncertified. The closed-orbit and Hausdorffness
  theorems over `ℝ` therefore rest on locators alone; the design should route the complex steps
  through `Sikora2012` and `ArithmeticGaloisRepresentations` §1.7, which are readable, and state the
  real step with its own proof sketch (Kempf–Ness or minimal vectors) or as a cited theorem.
- **HodgeStructuresPartII H.1.** Several board designs cite `H.1/betti-framed` and
  `H.1/betti-coarse` for the `GL_r` representation scheme and its quotient, but no README for
  `HodgeStructuresPartII` is on main, in an open pull request, or in the board index. The design
  must treat H.1 as the owner of the scheme structure for `GL_r` and only compare, and record the
  missing file.
- **Dehn–Nielsen–Baer for punctured surfaces.** Target 5 needs the peripheral-structure argument of
  Farb–Margalit §8.2, planned nowhere; it is a stated target with the closed smooth case consumed.
- **Suggested.lean carriers.** The surface statements need a surface type with simple hypotheses;
  the character-variety statements are only statable for matrix groups. The design should pin
  targets 7–9 for `GL_r(ℝ)` and `GL_r(ℂ)` and keep the general `G^ℝ` in prose.
