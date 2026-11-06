# Review of SheafConvolutionOnAbelianVarieties (pull request #1809 at c1edbd9)

**Verdict:** needs changes

Incremental re-review of the 134 lines changed since b38940e (74 insertions, 60 deletions in `TauCetiRoadmap/SheafConvolutionOnAbelianVarieties/README.md`, one docstring line in `Suggested.lean`; no file changed outside the folder). Gate at c1edbd9: every check passed (build with `sorry` the only warning, depcheck 0 problems, outside-folder diff 0 paths). Dependency check run again by this review:

    depcheck: 241 roadmaps, 2362 edges, 0 problem(s)

No UPWARD or CYCLE line. All six previous findings are repaired (see `## Previous findings`); the repairs introduced two small defects, both P3.

## R01 (P3) — The §0.4 support-criterion Check's last clause is false for one of its two instances

Location: `TauCetiRoadmap/SheafConvolutionOnAbelianVarieties/README.md` line 277 ("The criterion separates the two, and a version without the shift by dim S would reverse the verdicts").

Claim: dropping the normalizing shift (taking ω=S instead of S[1] for S=k[x]) reverses the verdict "RHom_S(M,ω) lies in D^(≥0)" for both test modules k and S.

Witness, computed: with ω=S, RHom_S(k,S)=Ext¹_S(k,S)[−1]=k[−1], which still lies in D^(≥0) (cohomology in degree 1), so the verdict for the module k does not change; only the module S changes verdict, since RHom_S(S,S)=S[0] now lies in D^(≥0) although dim Supp H⁰(S)=1>0. With the shift (ω=S[1]) the values are as the Check says: RHom_S(k,S[1])=k[0] in D^(≥0), RHom_S(S,S[1])=S[1] not in D^(≥0).

Repair: replace the last clause by "and a version without the shift by dim S would place RHom_S(S,S)=S[0] in D^(≥0) although dim Supp H⁰(S)=1, so the criterion would fail for S (the verdict for k is unchanged, k[−1] still lying in D^(≥0))". Tested on the instance above.

## R02 (P3) — AlgebraicModuliForArithmeticGeometry §§1.1–1.2 cited for a universal divisor they do not construct

Location: README line 159 ("AlgebraicModuliForArithmeticGeometry §§1.1–1.2 supplies the projective space of sections P(H⁰(A,L)) with its universal divisor"), and the matching Needs lines of §9.1 (line 1354) and the Layer 9 Dependencies (line 1425), which cite "§§1.1–1.2" for the same.

Claim: the universal divisor 𝒟⊂A×P(H⁰(A,L)) is supplied by AlgebraicModuliForArithmeticGeometry §§1.1–1.2.

Witness: at the open head of AlgebraicModuliForArithmeticGeometry, §1.1 "Projective quotients and all integer twists" constructs `ProjectiveBundles.projectiveBundle` (P_S(E)=Proj_S Sym(E) with its tautological quotient π*E→O(1) and the twists O(m)) and §1.2 "Cohomology and multiplication" the cup maps on twists; the strings "universal divisor", "Cartier divisor", "zero locus" and "zero scheme" occur in neither section (the only zero-scheme construction there is the Frobenius-stable locus of §10). §9.1's proof route (line 1346) forms 𝒟 as a relative effective Cartier divisor itself, which is correct but is then this roadmap's own step, cited to a supplier that does not state it.

Repair: write "AlgebraicModuliForArithmeticGeometry §§1.1–1.2 supplies the projective space of sections P(H⁰(A,L)) with its tautological quotient; the universal divisor 𝒟⊂A×P(H⁰(A,L)) is the zero scheme of the tautological section of pr₁*L⊗pr₂*O(1), a relative effective Cartier divisor because its restriction to each fibre A×{t} is the nonzero section t of L on the integral variety A, formed in §9.1", and in §9.1's statement or route say the same in one clause. Tested on the instance A=E an elliptic curve, L of degree 2: P(H⁰(E,L))=P¹, 𝒟⊂E×P¹ is the graph of the degree-two map E→P¹, flat of degree 2 over P¹, with exactly the four ramification points as non-smooth fibre points; their image is the closed set of four points and M is its complement.

## Previous findings

- R01 — repaired: the Hom variation of polarized integral variations is now a target of §9.3 (lines 1374–1390) with its API (weight w′−w, (0,0) classes are morphisms, compatibility with pullback and the flat continuation of the identity, polarization norm of the identity) and four Checks (constant variation, Y(3) weight and norm 2, non-(0,0) transport in a local frame, swap matrix); ShimuraData §§3.1–3.4 is cited only for carriers, morphisms, sums and pullback, and Tau Ceti `TauCeti.Hodge.HodgeStructure.internalHom`, `TauCeti.Hodge.HodgeStructure.Hom.exists_toIntLinearMap_eq_iff`, `TauCeti.Hodge.IsPolarization.internalHom` exist at the pin (TauCeti/Geometry/Hodge/InternalHom/Basic.lean lines 615 and 594, Polarization.lean line 55) and say what the README attributes to them.
- R02 — repaired: SpringerResolutionAndCharacteristicCycles is cited as §8.1 (coherent modules), §§8.3–8.4 (good filtrations), §8.6 (characteristic cycle with generic-length multiplicities), §9.1 (transfer modules, direct/inverse image, duality), §9.4 (holonomic), §9.5 (finite length and cycle additivity), §9.7 (regular holonomic), all present at its open head (lines 832–1075) with the stated contents; the microdifferential contract says it extends Layer 8 (§§8.1–8.6), which has no microdifferential operators (0 occurrences). The plan's `gaps` entry still names section "D": the brief allows no change to existing plan entries at the package stage, so this is recorded here and is not a finding.
- R03 — repaired: StableReductionPartII is cited as §4.8 (fine full-level curve scheme), §§6.3, 6.12 (Torelli), §§6.6, 6.14 (finite fibres and sign ambiguity), and the polarized integral Jacobian contract extends §§6.7 and 6.13 (Hodge-bundle comparisons along Torelli); all seven sections exist at its open head (lines 6201–6940) with those titles. The plan's `gaps` entry still names "MC.6"; same remark as for R02.
- R04 — repaired: all eighteen contracts carry `(gap:<slug>)` with exactly the slugs of the plan (grep: each of the eighteen slugs occurs once in the README, none missing, none extra).
- R05 — repaired: §A1.2 (rigidity) and §A6.25 (relative Hom) exist at AbelianSchemesAndArithmeticModuli's open head (lines 758, 3439) and are cited in the contract and in §9.2; the ReductiveGroups paragraph now attributes derived groups, central isogenies and simply connected/adjoint forms to Layer 6, Borel subgroups, tori and root data with Weyl groups to Layer 7, the isomorphism theorem and inner/outer automorphism interfaces to Layer 8, and the dominant-weight classification to Layer 10, which matches ReductiveGroups on main (lines 466–470, 627–645, 1023–1057, 1731–1776); §4.3 has the character-map API bullet (line 736) with K2 line 714 and cites LieHighestWeight Layers 4 and 6 for highest weights and Weyl invariance (its lines 538, 806–813); the AlgebraicModuli sentence cites §§1.1–1.2 and Mathlib `AlgebraicGeometry.Scheme.Hom.isOpen_smoothLocus` (Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean line 291, hypothesis `LocallyOfFinitePresentation f`, as the README states) and drops §2.1; Layer 7 runs §§7.1–7.5 with every reference renumbered (nine occurrences of §7.4/§7.5, no §7.6 anywhere, `Suggested.lean` line 13 updated). The new universal-divisor clause is R02 of this report.
- R06 — repaired: §0.4 has the local-duality support criterion as an API bullet (line 266) in exactly the form of BSS Lemma 2.8 (BSS line 192: Noetherian S, dualizing complex normalized with dualizing sheaf in degree −dim S, D^(≥−k) iff dim Supp H^i(M)≤k−i) with the Gorenstein reformulation of Remark 2.9 (BSS line 214), the proof route (Stacks 0A7U Ext range, the spectral sequence, localization ω_𝔭≅ω_(S_𝔭)[c] as BSS lines 196–213) and the k[x] Check; `NormalizedDualizing.localization_shift` is in SchemeAndStackFoundations §2.21 on main (line 4405) and at both open heads (#1656 line 4513, #1276 line 4374). The Check's last clause is R01 of this report.

## Verified sound

**Gate, build, elaboration.** Gate at c1edbd9 all green. `lake env lean TauCetiRoadmap/SheafConvolutionOnAbelianVarieties/Suggested.lean` elaborated with exactly four "declaration uses `sorry`" warnings (lines 77, 85, 97, 114) and nothing else. The Lean diff is one docstring line (§7.5→§7.4); the eight declarations and their elaborated types are unchanged from the previous review (signatures.md: 0 dropped binders, no `variable` block), so the `#check @name` comparison and the one-tactic probes of the previous review stand (no padding; the four theorems are LS Lemma B.7, Lemma B.4, Lemmas B.5–B.8 and Proposition B.1).

**Changed-passage locators** (read at the stated lines): BSS Lemma 2.8 (line 192) and its proof (196–213), Remark 2.9 (214), as above; K2 Corollary 2.2.4 proof (line 714: image of R(G°)→ℤ[X] is the Weyl invariants); CDK Corollary 1.3 unchanged. Seeded sample: of the fifteen sampled targets only §0.4 falls in the diff; its added locators are those just listed. The other fourteen are untouched and were verified by the previous review.

**Adversarial table** (rows for untouched statements carried from the previous report, with its values; new rows computed here):

| statement | instances tried | values computed | result |
|---|---|---|---|
| §0.4 support criterion (new bullet) | S=k[x], ω=S[1]; M=k, M=S | RHom(k,S[1])=k[0]∈D^(≥0), dim Supp H⁰(k)=0≤0; RHom(S,S[1])=S[1]∈D^(≥−1)∖D^(≥0), dim Supp H⁰(S)=1 needs k≥1 | matches BSS 2.8 |
| same, unshifted ω=S | M=k, M=S | k[−1]∈D^(≥0) (verdict unchanged); S[0]∈D^(≥0) with dim Supp 1>0 (iff fails) | R01: only one verdict changes |
| §0.4 Gorenstein form (Remark 2.9) | S regular dim 2g, k=2g | D^(≥−2g) for RHom(M,S[2g]) ⇔ D^(≥0) for RHom(M,S); dim Supp≤2g−i ⇔ codim≥i | matches BSS 214 |
| §0.4 localization step | S=k[x,y] local at (x,y), 𝔭=(x), c=1 | ω=S[2]; ω_𝔭=S_𝔭[2]=ω_(S_𝔭)[1] since dim S_𝔭=1 | shift by c as stated |
| §9.3 Hom variation weight | V weight 1 (Y(3)); V weight 0 | 1−1=0; 0−0=0; Tau Ceti `internalHom` weight n₂−n₁ | matches |
| §9.3 norm of identity | Y(3), Q unimodular, rank 2 | Σ_(i,j)(Q⁻¹)_(ij)Q_(ij)=±tr(I₂)=±2, sign fixed positive by Hodge–Riemann on (0,0) | 2 = rank × 1 |
| §9.3 flat continuation of identity | path (γ₁,γ₂) from (s,s) to (s₁,s₂) | T_(γ₂)∘id∘T_(γ₁)⁻¹ = transport along γ₁⁻¹γ₂ | matches bullet |
| §9.3 constant variation | V constant | Hom(pr₁*V,pr₂*V)=const Hom(V,V), identity global flat (0,0) ⇒ R_V=S×S | matches Check |
| §9.3 local-frame Check | U⊂Y(3) contractible, s₁≠s₂ | identity of ℤ² carries F¹_(s₁) to F¹_(s₁)≠F¹_(s₂) (period map U→ℍ injective) | not (0,0) |
| §9.3 (0,0) ⇔ morphism | weights w≠w′ | no (0,0) piece and no morphisms: both sides empty; w=w′: `exists_toIntLinearMap_eq_iff` (same weight n) | matches |
| §4.3 character map | G°=SL₂, T=𝔾_m | ch V₁=x+x⁻¹ (orbit sum), ch V₂=(x²+x⁻²)+1: unitriangular; image = symmetric Laurent polynomials | injective onto ℤ[X]^W |
| §4.3 why G_u° and not G_u | G=O₂⊃T=SO₂ | trivial and det restrict equally to T | injectivity needs connectedness, as stated |
| §9.1 open smooth locus | A=E, deg L=2 | P¹, 𝒟 = graph of E→P¹ of degree 2, 4 ramification points, image closed, M=P¹∖4 points | open, as stated |
| `smoothLocus` hypotheses | Mathlib pin | `isOpen_smoothLocus [LocallyOfFinitePresentation f]`, points with formally smooth stalk map | README states the hypothesis |
| ReductiveGroups attributions | Layers 6, 7, 8, 10 on main | lines 469–470 (G_der, central isogenies, sc/adjoint), 628–645 (Borel, tori, root datum, Weyl group), 1024–1057 (isomorphism theorem, inner/outer automorphisms), 1771–1776 (classification by X⁺) | matches |
| Layer 7 renumbering | grep | §7.1–7.5 headings; 9 references to §7.4/§7.5; 0 to §7.6 | consistent |
| gap slugs | grep | 18 slugs, each once, equal to the plan's 18 | consistent |
| `exceptionalPair` (§5.2) | j=0..4 | (1,5),(5,20),(20,76),(76,285),(285,1065) | previous report |
| Pell descent, a=b, `exceptionalDegree`, Eulerian rows, `wedgeMultiplicity` rows, B.6 identity, §6.1 ratios, §6.2 thresholds and B.11 constant, §6.4, §6.5 ceilings, §3.1 rows, §3.3 weights, §4.7 divisibility, §4.8 sign, §4.3 λ-ring Check, §4.6 genus, §9.2 degree, §0.6, §1.5, §8.1, §8.2, §9.3 ℤ[i], §9.1 degree, §0.7 holonomy, LS 4.10 ℓ=p | as listed there | values as listed there | previous report, untouched |

**Library declarations at the pins** (file and line): Tau Ceti `TauCeti.Hodge.HodgeStructure.internalHom` TauCeti/Geometry/Hodge/InternalHom/Basic.lean:615 (lattice of integral linear maps, weight n₂−n₁), `TauCeti.Hodge.HodgeStructure.Hom.exists_toIntLinearMap_eq_iff` :594 (same-weight source and target, F⁰ of the internal Hom), `TauCeti.Hodge.IsPolarization.internalHom` TauCeti/Geometry/Hodge/InternalHom/Polarization.lean:55 (pullback of Q₁⊗Q₂ along the inverse contraction, Q₁ a polarization of `hs₁.dual`); Mathlib `AlgebraicGeometry.Scheme.Hom.isOpen_smoothLocus` Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:291, `Scheme.Hom.smoothLocus` :300. The declarations of the previous report are unchanged.

**Cross-roadmap citations resolved this round** (on main or at the open head): ShimuraData §3.1 (`Variation`, `variationMk`, `variationPullback`), §3.2 (`VariationHom`, `variationSub`, `variationDirectSum` with flat idempotent splitting), §§3.3–3.4 (`RationalPolarizedVariation`, `polarizedIntegralVariation`, `integralVariationMk`, `integralVariationPullback`), no Hom/tensor/dual variation; AbelianSchemesAndArithmeticModuli §A1.2, §A6.25; SpringerResolutionAndCharacteristicCycles §§8.1, 8.3–8.4, 8.6, 9.1, 9.4, 9.5, 9.7; StableReductionPartII §§4.8, 6.3, 6.6, 6.7, 6.12, 6.13, 6.14; SchemeAndStackFoundations §2.21 `NormalizedDualizing.localization_shift` (main and both open heads); ReductiveGroups Layers 3, 6, 7, 8, 10; LieHighestWeight Layers 4, 6; AlgebraicModuliForArithmeticGeometry §§1.1–1.2 (R02 above); FiniteGroupInvariants §10.5 unchanged. LieHighestWeightPartII §N2 is a board design package, as the previous report records; the resolver's lead on `NormalizedDualizing.localization_shift` is a README-only name of SchemeAndStackFoundations, present there.

**Declared gaps.** Unchanged in substance; the README now labels each with its slug. Supplier sections in the plan for the microdifferential and polarized-Jacobian gaps remain "D" and "MC.6" (design-stage labels); the README's contracts name the sections that exist.

**Principles.** No route-specific shortcut, no re-planned roadmap, no copied passage (the new §0.4 bullet and route paraphrase BSS; the §4.3 bullet paraphrases K2), no algorithm, no sorry'd data, no `set_option`, single `import Mathlib`, no LaTeX, no process words or pull-request numbers; outside-folder diff empty.

## Not verifiable

- none. Ownership against open pull requests was checked by the previous review; nothing in the diff adds a construction another roadmap could own (the Hom variation was searched there: no owner in ShimuraData, HodgeStructures or ShimuraVarieties).

## Source issues

- none new this round (the previous report's four LS items stand).
