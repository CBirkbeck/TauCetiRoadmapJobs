# PORT-NonabelianLevelStructures

- Branch: `roadmap/nonabelian-level-structures`, from `45f58db`.
- Head commit: `b13e2218` — "NonabelianLevelStructures: roadmap (README, Suggested.lean, metadata)".
- Folder: `TauCetiRoadmap/NonabelianLevelStructures/{README.md,Suggested.lean,metadata.toml}`. Nothing
  outside the folder is touched.

## Build

`lake build TauCetiRoadmap.NonabelianLevelStructures.Suggested`:

    Build completed successfully (18342 jobs).

There are 4 warnings, all `declaration uses 'sorry'`, at `Suggested.lean` lines 122, 136, 260 and
278: `combinatorial_congruence`, `simple_group_congruence`, `integral_trace_coordinates` and
`sl2_cusp_automorphism_central`. The package file as copied raised one further warning: the file
imports `Mathlib` without a `module` header. I added `module` as the first line, the form
NoncongruenceModularForms uses on main, and the warning is gone.

## Gate

    gate NonabelianLevelStructures: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Dependency check (`gate --depcheck … --movable`), exact output:

    depcheck: 222 roadmaps, 1972 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line. `roadmaps resolve` on the ported README: "Cross-roadmap
citations found nowhere: None. Lean names found nowhere: None."

## Draft pull request body

This roadmap develops Chen's theory of nonabelian level structures on elliptic curves. For a finite
group G, it takes the moduli stack M(G) of connected G-torsors over punctured elliptic curves, a
finite étale cover of the elliptic moduli stack whose geometric fibre is Epi^ext(F₂, G), from
ArithmeticDynamicsPartII §6.0. From it the roadmap builds:

- the ramification, branch-cycle and functoriality theory of these covers, the Galois
  correspondence between covers of the elliptic stack and finite SL₂(ℤ)-sets, and the cofinality
  of nonabelian levels;
- a complete description of the cusps by finite group data, with their automorphism groups and
  the representability criterion;
- the combinatorial congruence: the order of the commutator, divided by an explicit cusp exponent
  and a centralizer obstruction, divides the size of every Out⁺(F₂)-orbit on Epi^ext(F₂, G)/⟨γ₋ᵢ⟩.
  For nonabelian finite simple groups other than PSL₂(𝔽_q) it yields a prime-power congruence;
- the rank-two SL₂ trace coordinates over every commutative ring, R[x, y, z] ≅
  𝒪(SL₂ × SL₂)^GL₂, with the finite-field trace data and the vertical automorphisms of
  SL₂(𝔽_q)-level structures;
- the modular geometry of the trace −2 Markoff level curves: two components, branch data, genus,
  finiteness of j-invariants over number fields, large projective monodromy and noncongruence.

The point is that these finite-group divisibility and noncongruence statements, and the geometry
that proves them, become part of a general library on moduli of G-covers rather than one-off
computations. `Suggested.lean` states four headline theorems against the pinned Mathlib and Tau
Ceti: the combinatorial congruence, the simple-group congruence, the integral trace-coordinate
isomorphism and the centrality of SL₂ cusp automorphisms. It names the stack-level headlines that
the pins cannot yet state.

## Dependencies that are still pull requests

ArithmeticDynamicsPartII, InverseGaloisAndArithmeticFundamentalGroups, ComplexComparisonPartII,
AnabelianGeometryAndNonabelianChabauty, AlgebraicModuliForArithmeticGeometry, ModularCurvesPartII,
ArithmeticGaloisRepresentations, LanglandsParameterStacks,
MappingClassGroupsAndCanonicalRepresentations and HeightsRationalPointsAndObstructions. All of them
precede this roadmap in the merge order; MappingClassGroupsAndCanonicalRepresentations is the line
directly above it.

The suppliers on main are StableReduction, SchemeAndStackFoundations, ClassicalArithmeticCompletion,
BelyiMaps, NoncongruenceModularForms and CFSGBasicProperties. Every cited section, target title
and roadmap declaration name was opened at these heads or on main:

- ArithmeticDynamicsPartII: §§0.1, 1.4, 2.1–2.4, 3.6–3.7, 4.2, 6.0–6.6, 7.2–7.4a, `traceOrder`.
- InverseGaloisAndArithmeticFundamentalGroups: §§IG.1.2–1.4, IG.3.1, IG.3.2 (*Exterior
  epimorphisms and `T`-systems*), IG.5.4 (*Admissible G-covers of marked curves*, *Admissible
  stacks and stable marked G-curves*).
- AnabelianGeometryAndNonabelianChabauty: §1.1 and §1.2 with their four named targets.
- AlgebraicModuliForArithmeticGeometry: §5.1 `ArithmeticModuli.Rigidification.stack`,
  `…vertical_kernel`; §8.3 `schemeFramedCompletionEquiv`, `completedAtlasPresentation_equivalence`.
- ModularCurvesPartII: §§3.1, 3.11, 3.12.
- ArithmeticGaloisRepresentations: §§1.7, 4.3, 4.4.
- LanglandsParameterStacks: §§2.1, 3.8.
- MappingClassGroupsAndCanonicalRepresentations (open as a draft pull request): §§1.4, 2.3.
- HeightsRationalPointsAndObstructions: §4.6 `mordell_finite`.
- ComplexComparisonPartII: §C6.2 `riemannExistence`.
- SchemeAndStackFoundations: §§1.19, 1.20 `setoid_criterion`, 1.21, 1.23, 3.2
  `scheme_riemann_hurwitz`, 4.6 `node_versal_deformation`, 4.15.
- ClassicalArithmeticCompletion: §§4.57, 4.58, 4.76.
- BelyiMaps: Layer 10 §10.4.
- NoncongruenceModularForms: §1.1, §3.5 `compositionFactor_of_isCongruenceSubgroup`.
- CFSGBasicProperties: A0.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already met the acceptance-test form. It states four
headline theorems on native carriers. Its fourteen definitions (two of them abbreviations) are all
needed to state those headlines, and all have real bodies. It has no sorry'd data and no
`set_option`. Its one proved `example` checks that `evalSL2Pair` sends `traceCoordinates` to
(tr A, tr B, tr AB) through both tensor factors and that each trace coordinate is conjugation
invariant. That excludes the wrong model which takes both generic matrices from one factor, so it
tests the retained definitions rather than mirroring a Check.

The only change to the Lean file is the `module` header. No headline that is statable at the pins
is missing:

- The stack-level headlines need carriers the pins lack, and the docstring names those carriers:
  cusp classification, representability, the Markoff components, degree and genus, the
  j-finiteness, the monodromy and noncongruence, and cofinality.
- The finite-group lemmas of Layers 2, 4, 5 and 6 (the exact sequence, the square-subgroup lemma,
  the matrix-algebra criterion, admissible traces, D(q, G), rotation periods) are intermediate
  targets, not headlines.

**Signature check.** I appended `#check @name` for all 18 declarations to the file, built it once
with the brief's `lake build` command, and then removed the lines. Each elaborated type is identical
to the baseline in the job's signature evidence, and each matches its README statement:

- the finite, generation, nonabelian, prime and size hypotheses;
- the same-universe exclusion of PSL₂(K), which is harmless because every finite field has a copy
  in universe 0;
- the ring and algebra binders of the trace-coordinate declarations, with the universal algebra in
  the same universe;
- `habs` and `hdih` on `sl2_cusp_automorphism_central`.

No binder was lost and no signature changed.

## Supplier replacements and duplication removals

- **Supplier replacements: none needed.** Every Mathlib and Tau Ceti name in the README was opened
  at the pins: Mathlib `1b1ccf4`, Tau Ceti `2fd255d`. Examples are
  `Matrix.SpecialLinearGroup.trace_commutatorElement_fin_two` (`TauCeti/LinearAlgebra/Matrix/Trace/FinTwo.lean`
  line 231), `TauCeti.SpecialLinear.coordinateHopfAlgebra` / `coordinateMap` /
  `pointsMulEquiv` (`TauCeti/Algebra/AlgebraicGroup/SpecialLinear/Basic.lean` lines 121, 127),
  `TauCeti.GeneralLinear.genericMatrix` (`…/GeneralLinear/Coordinate/HopfAlgebra.lean` line 464),
  `TauCeti.GeneralLinear.coordinateHopfAlgebraBaseChangeIso_hom_genericMatrix`
  (`…/GeneralLinear/Coordinate/BaseChange.lean` line 374), `TauCeti.ComoduleAlgebra.coinvariants`
  (`TauCeti/Algebra/Bialgebra/ComoduleAlgebra.lean` line 136),
  `TauCeti.PermutationTriple.IsConnected.two_sub_two_mul_genus` (`…/EulerCharacteristic.lean`
  line 208), `TauCeti.IsFunctionField.exists_isAlgebraicBelyiPair` (`…/Belyi/Existence.lean`
  line 163), `MulAction.toPermHom` (`Mathlib/Algebra/Group/Action/End.lean` line 184),
  `orbit_subgroup_eq_rightCoset` (`Mathlib/GroupTheory/Coset/Basic.lean` line 170),
  `alternatingGroup.isSimpleGroup` (`…/Alternating/Simple.lean` line 201), `Monoid.exponent`,
  `Function.minimalPeriod`, `CongruenceSubgroup.Gamma` / `IsCongruenceSubgroup`.

  The pins contain none of the following, so nothing the package restates is already supplied:
  - an Out(F₂) ≅ GL₂(ℤ) identification or an abelianization map of `MulAut (FreeGroup _)`. Tau Ceti
    has only `TauCeti.FreeGroup.nielsenMul`/`generatorInversion` and the two-generator subgroup
    theorem;
  - SL₂ trace invariants or a character variety;
  - Nielsen orbits of generating pairs, cusp groups, Markoff curves or noncongruence statements.
- **Duplication removals: none.** The sweep was by object, over main, all 446 open roadmap heads
  (`roadmaps grep`) and the board packages. Its only new finding is
  MappingClassGroupsAndCanonicalRepresentations §1.4, which builds representation schemes and
  character varieties of finitely presented groups over ℂ. §5.1 here is a different statement: the
  rank-two, trivial-determinant case for F₂, over every commutative ring, with its trace-coordinate
  isomorphism. It is kept, and Scope and ownership plus one clause in §5.1 now say how it differs
  and that the two agree over ℂ. The other near owners were read and the division recorded in the
  package's Scope stands:
  - ArithmeticDynamicsPartII §§2.1–2.2, 6.0–6.1 (the prime-field zero level; here every level and
    every finite field);
  - InverseGalois §IG.3.2 (exterior epimorphisms; Chen's divisibility *question* is only a named
    proposition there);
  - LanglandsParameterStacks §3.8 (characteristic zero only);
  - IntegralHeckeAndGaloisDeterminants §0.4, Vaccarino's theorem. It identifies the subring
    generated by characteristic coefficients of words, but not the scheme invariants, and does not
    restrict to SL₂ × SL₂.
  - GroupActionsOnRiemannSurfaces, which hands Nielsen classes to InverseGalois;
  - MordellLawrenceVenkatesh and ModularCurvesPartII, which have no overlapping object.

**Ownership.** This roadmap owns the finite cusp calculus, the combinatorial and simple-group
congruences, the integral rank-two trace coordinates and the Markoff modular geometry. No other
roadmap on main, at an open head or in a board package states them. No `Suggested.lean` declaration
shares a fully qualified name with a declaration of a readable roadmap.

## README edits made in the port

The mathematics fixes come first:

1. **Summary.** It said the modulus divides "every Out⁺(F₂)-orbit on Epi^ext(F₂, G)". Chen's
   statement, and the Lean, are about orbits on Epi^ext(F₂, G)/⟨γ₋ᵢ⟩. The old wording is true but
   weaker, and it hid what the Lean states, so it now names the quotient by γ₋ᵢ.
2. **§6.4 Check and Layer 6 Examples.** "Each ±2 slice has 10 points with periods 5 and 10" read
   as if each slice had both periods. Computed: at p = 5 the slice a = 2 is two 5-cycles and the
   slice a = −2 is one 10-cycle. The Examples paragraph now lists the γ∞-cycles slice by slice:
   a = 0: 4, 4; a = 2: 5, 5; a = −2: 10; a = 1: 6; a = −1: 3, 3. That is 8 cycles on 40 points.
3. **§5.1, new Check.** It shows injectivity of `integralTraceMap` over every ring, including rings
   with nilpotents, using the universal pair A = `[[x, 1], [−1, 0]]`, B = `[[0, −ζ], [ζ⁻¹, y]]`,
   whose trace coordinates are (x, y, ζ + ζ⁻¹).
4. **§4.2 Check.** The A₇ Check now carries the computed orbit sizes (below), and also the ℓ = 5
   case.

The remaining edits are scope and wording:

5. **Scope and ownership, and a clause in §5.1.** These record the relation to
   MappingClassGroupsAndCanonicalRepresentations §1.4.
6. **§0.1 route.** "This repairs the proof of Chen's Proposition 3.2.2(b)" is rewritten neutrally:
   Chen's proof uses properness of maps whose fibres are open curves.

## Adversarial mathematics pass

All finite computations were run by scripts of my own in the job scratch directory: pure-Python
enumeration of groups, fields and orbits, using exactly the Lean definitions
(`positiveNielsenGroup`, `exteriorInversionGroup`, `coarseNielsenOrbit`, `cuspVerticalExponent`,
`centralizerQuotientOrder`).

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `combinatorial_congruence` (§3.3), all generating pairs | C₂, C₃, C₂², S₃, D₁₀, D₁₄, D₁₆, A₄, S₄, A₅, SL₂(𝔽₃), SL₂(𝔽₅), PSL₂(𝔽₇) | (ord c, m′, d′, modulus, orbit classes): C₂ (1,1,2,1,3); C₃ (1,1,3,1,4); C₂² (1,1,4,1,6); S₃ (3,3,1,1,3); D₁₀ (5,5,1,1,3)×2; D₁₄ (7,7,1,1,3)×3; D₁₆ (4,4,2,1,6)×2; A₄ (2,2,2,1,4); S₄ (3,1,1,3,9); A₅ (3,1,1,3,18), (5,1,1,5,10)×2; SL₂(𝔽₃) (4,2,1,2,16); SL₂(𝔽₅) (6,2,1,3,72), (10,2,1,5,40)×2; PSL₂(𝔽₇) (3,1,1,3,18), (4,1,1,4,16)×2, (7,1,1,7,7)×2 | divisibility holds on every orbit; matches every §§3.1–3.3 Check and the Layer 3 Examples | none |
| Degenerate c = 1 | abelian groups above | modulus 1 | holds | none |
| Omitting m′ (negative control) | D₁₀ | 5 ∤ 3 | the correction is necessary (§2.5 Check) | none |
| `simple_group_congruence` (§4.2) | A₇, the smallest group to which it applies; 958 classes of Epi^ext/⟨γ₋ᵢ⟩ | orbits for ord c = 7: 21×4, 28×2, 42×4 (7 ∣ each); ord c = 5: 30, 40, 60, 60 (5 ∣ each); ord c = 3: 36, 36, 72, hypothesis false (729 < 2520) | holds | Check extended |
| r = 0 | any | ℓ⁰ = 1, Lean `(0+1)/2 = 0` | holds | none |
| ⌈r/2⌉ = (r+1)/2 in ℕ | r = 0..4 | 0, 1, 1, 2, 2 | correct | none |
| PSL₂ exclusion | A₅ ≅ PSL₂(𝔽₄) | abelian subgroup of order 5 ≥ 60^(1/3) ≈ 3.9 | exclusion needed | none |
| Universe of `hPSL` | K in another universe | GaloisField p n : Type 0, lifted by ULift | harmless | none |
| `cuspVerticalExponent` (§3.2) | D₁₆, c = ρ² | (ρ,σ): A∩⟨[u⁻¹,h⁻¹]⟩ orders {1,2,4,4}; (σ,σρ): {1,2}; lcm 4, not 8 | matches Check | none |
| Empty family | class not a commutator of a generating pair | `Finset.lcm_empty` gives 1 | matches Check | none |
| Exact sequence of §2.2 | all generating pairs of C₂, C₃, S₃, D₆, D₁₀, D₁₄, D₁₆, A₄, SL₂(𝔽₃), SL₂(𝔽₅) | 0 failures of ker z = Z(G), im z = ⟨u^k⟩, \|A\| = \|Z\|·\|u\|/k; (\|u\|, k) e.g. D₁₆ {(2,2),(8,2)}, A₄ {(2,1),(3,3)} | holds | none |
| k_(u,h) = \|u\| for SL₂(𝔽₅) (§2.3 Check, Chen Remark 4.10.2) | all generating pairs | (3,3), (4,4), (5,5), (6,6), (10,10) | holds | none |
| \|I(G)\| (§1.6, Layer 1 Examples) | C₂, C₃, S₃, D₁₀ | 2, 4, 2, 4 (also D₁₄ 6, A₄ 4, SL₂(𝔽₃) 8, SL₂(𝔽₅) 30) | matches | none |
| §2.1 Checks | S₃ (123),(12); SL₂(𝔽₃) \|u\|=3, \|h\|=4 | \|M\| = 3, \|A\| = 3, k = 1; \|M\| = 24, A = {±I} | matches | none |
| §1.3 coset side | S₃, H = ⟨(12)⟩, h = (123) | Hh = {(123),(23)}, hH = {(123),(13)} | matches | none |
| `sl2_cusp_automorphism_central` (§6.6), all 2-generated subgroups | q = 2, 3, 4, 5, 7, 8, 9, 11 | abs. irr. non-dihedral subgroups: 0, 1, 1, 6, 19, 1, 34, 34; failures 0; types (\|G\|, \|image\|): (24,12), (48,24), (60,60), (120,60), (336,168), (504,504), (720,360), (1320,660) | holds; vacuous at q = 2 | none |
| Non-dihedral hypothesis (negative control) | dihedral-type abs. irr. subgroups | conclusion fails in 1, 1, 4, 5, 14, 14, 16, 31 subgroups for q = 2..11; Q₈ ≤ SL₂(𝔽₃): i ∈ A(Q₈, i, j), i not central | hypothesis necessary, Klein four included | none |
| §6.6 proper subgroups | SL₂(𝔽₃) ≤ SL₂(𝔽₅); 2O ≤ SL₂(𝔽₇) | 384 and 864 generating pairs; A = {±I} | matches | none |
| `integral_trace_coordinates` (§5.1), zero ring | R = 0 | both sides 0; every S is 0; predicate holds trivially | holds | none |
| Injectivity over every R | universal pair above | det = 1, 1; AB = `[[ζ⁻¹, y−xζ],[0, ζ]]`; traces (x, y, ζ+ζ⁻¹); the ζⁿ-coefficient of P(x,y,ζ+ζ⁻¹) is the w-leading coefficient of P | holds | Check added |
| Point-only invariance (negative control) | 𝔽₂, N = ∏ of the 6 GL₂(𝔽₂)-conjugates of a₁₂ | traces of `[[s,0],[c,s⁻¹]]`, `[[p,1],[pw−1,w]]` are (s+s⁻¹, p+w, sp+c+s⁻¹w), all of 𝔸³(𝔽̄₂) | scheme invariance needed | none |
| Fricke witness (Conventions) | `[[1,1],[0,1]]`, `[[1,0],[1,1]]` | (2,2,3); 4+4+9−12−2 = 3 | holds | none |
| Anti-action witness | r∘t at (2,3,5) | r then t: (2,3,1) → (2,1,3); reverse (2,5,3) → (2,5,7) | holds | none |
| Branch formulas (§6.2) | symbolic | γ∞∘γ₁₇₂₈∘γ₀ on (x,y,z): (xy−z, x, x²y−xz−y) → (x, xy−z, y) → (x, y, z) | holds; on X*(𝔽_p) for all 12 primes tested | none |
| §5.2 generators | r, s, t | abelianizations diag(−1,1), swap, `[[−1,1],[0,1]]`; t·r = `[[1,1],[0,1]]`; they generate GL₂(ℤ) | image = Vieta + permutations | none |
| §5.3 matrix-algebra criterion | every pair over ℤ/2, ℤ/3, ℤ/4, ℤ/6 (36, 576, 2304, 20736 pairs) | 0 mismatches between "adjoin = M₂" and "tr[A,B]−2 unit"; ℤ-witness (2,2,4): span I, 2E₁₂, E₂₁, 2E₁₁ | holds over non-domains | none |
| §5.5 admissible traces | q = 2, 3, 4, 5, 7, 8, 9, 11, 13 | non-admissible: {0}, {1,2}, {0}, {0,2,4}, {0,1,2}, {0}, {1,2}, {1,2}, {2}; one class per trace except two admissible trace −2 classes for q = 5, 7, 11, 13; three trace −2 classes for odd q | matches §5.5 list exactly | none |
| Layer 5 Examples | q = 2, 3, 5, 7 | trace map hits 8, 27, 125, 343 triples | matches | none |
| §5.6 D(q, G) | SL₂(𝔽₅), SL₂(𝔽₄), SL₂(𝔽₃), SL₂(𝔽₇), Q₈ ≤ SL₂(𝔽₃), SL₂(𝔽₃) ≤ SL₂(𝔽₉), 2O ≤ SL₂(𝔽₇) | (\|N\|, \|C\|, \|GC\|, \|D\|) = (480,4,240,2), (180,3,180,1), (48,2,24,2), (2016,6,1008,2), (48,2,8,6), (192,8,96,2), (144,6,144,1) | matches every Check; \|D(q)\| = gcd(2, q−1) | none |
| §§6.3–6.5 slice counts and §6.4 periods, every t ≠ 2 and a | q = 3, 4, 5, 7, 8, 9, 11, 13, 16, 25 | 0 count mismatches, 0 period ≠ n_q(a) on C₁(a)_t*; 𝔽₇ eigenline orbit length 6; 𝔽₄ L_a order 5; 𝔽₂₅ a=1, t=4 slice 49 points, n = 6 | holds, including characteristic 2 | 2 wordings made precise |
| §7 counts (D, c₀, c₁₇₂₈, cusps, genus, d_p) | p = 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43 | e.g. p = 5: 40, 14, 20, 8, 0, 10; p = 13: 208, 70, 104, 26, 5, 52; p = 43: 1720, 574, 860, 106, 91, 430; Γ transitive at all twelve | brute force = closed formulas of §§7.2–7.3 at every p | none |
| §7.3 genus formula | all 340 primes 5 ≤ p < 2304 | always integral; equals RH from the §7.2 count formulas at every p; minimum over the 337 primes ≥ 13 is 5 at p = 13 | holds | none |
| γ₀ and γ₁₇₂₈ fixed points | symbolic | γ₀: x = y, z = x² − x, Markoff gives x²(3 − x) = 0, so (3,3,6); γ₁₇₂₈: x = y, x² = 2z, so z(4 − z) = 0, giving (x,x,4) with x² = 8 | f_p = 2 iff p ≡ ±1 (mod 8) | none |
| §7.6 parity | p = 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43; residue rule for all primes < 2304 | signs (γ₀, γ₁₇₂₈, γ∞) on Y*: even exactly for p ≡ 1, 3, 13, 15 (mod 16); p = 17 fixed block (5,5,4); rule holds for every prime < 2304 | matches | none |
| §0.3 Γ(3), §0.7 Γ(2)′ | PSL₂(𝔽₃), PSL₂(𝔽₂) | γ₀, γ₁₇₂₈, γ∞ orders 3, 2, 3: 4/6/4 points, 24−8−6−8 = 2; Γ(2)′: 2/3/3 points, 12−4−3−3 = 2; traces ≡ 2 (mod 4), −I ∉ Γ(2)′ | g = 0 in both | none |
| §0.3 C₃ orbifold point | γ₀² on (x,y) | (x,y) ↦ (−y, x−y) fixes (2,1); γ₀³: (2,1) ↦ (1,2) | holds | none |
| Peripheral witness (𝔽₇) | `[[−1,1],[0,−1]]` | inverse `[[−1,−1],[0,−1]]`; ratio −1 is a nonsquare mod 7 | other class | none |
| §5.4 coprime power | diag(3,4) over 𝔽₁₁ | order 5, trace 7; square diag(9,5), trace 3 | holds | none |

Context of each Lean statement (variables and binders in scope): checked by `#check @name`, see
above. The Lean file has no `variable` block, so every hypothesis is in the declaration's own
signature.

## Unresolved

1. **gap:markoff-alternating-three-mod-four.** §7.6, for p ≡ 3 (mod 4), and through it §7.7 need
   this gap, which is requested from ArithmeticDynamicsPartII. At that roadmap's head, its Scope
   and ownership says that alternating containment for general p ≡ 3 (mod 4) under MP(p),
   Meiri–Puder Theorem 1.4 by the classification, "is outside this roadmap". Its §7.4a proves only
   p ≡ 1 (mod 4) and the finite case p = 11. So the requested supplier currently declines the
   statement. Either ArithmeticDynamicsPartII takes it on, or another owner is chosen (this
   roadmap, as a Layer 7 target, is a possibility). This is the author's decision; I left the
   contract as the accepted review has it.
2. **Supplier gaps not yet at the supplier heads.** The other seven declared gaps are still only
   requests:
   - punctured-torus-nielsen and asada-cofinality: MappingClassGroupsAndCanonicalRepresentations
     #2266 has §§1.4, 2.3 and 9.6, Nielsen generation of Aut(F_N), but neither request;
   - gaschutz-generating-pairs: not in InverseGaloisAndArithmeticFundamentalGroups;
   - equivariant-node-smoothing: not in SchemeAndStackFoundations;
   - geometric-point-completion: not in AlgebraicModuliForArithmeticGeometry;
   - integral-rank-two-invariants: not in LanglandsParameterStacks;
   - vdovin-abelian-subgroups: not in CFSGBasicProperties.

   These are the review's conditional gaps; the worker files them.
3. **Source note, not acted on.** CHEN2024 line 5209, Proposition 6.4.1 (E4), and line 5231 write
   S₅ where the exceptional subgroup of PSL₂(𝔽_q) is S₄. The README's §5.6 and §6.6 already use
   A₄, S₄, A₅.
4. **Ownership against open pull requests** was checked with `roadmaps grep`/`show` over all 446
   indexed heads and the board packages. MappingClassGroupsAndCanonicalRepresentations, which the
   job's index file listed without a checkout path, was read at its open head #2266.

No suspicious instructions were found in the reviews, the package, the supplier texts or the
sources.


Pull request: #2273 (roadmap/nonabelian-level-structures at b13e221)
