# Port: EllipticCurveModularityTotallyReal

Branch: `roadmap/elliptic-curve-modularity-totally-real`.
Head: `7df3ef697923f01b7ab9083e209f76b42bef1a46`.
Base checked: `c378f90`; initial worktree clean.

The commit contains only `TauCetiRoadmap/EllipticCurveModularityTotallyReal/README.md`,
`TauCetiRoadmap/EllipticCurveModularityTotallyReal/Suggested.lean` and
`TauCetiRoadmap/EllipticCurveModularityTotallyReal/metadata.toml`.
The top-level roadmap list is untouched. No push or GitHub write was performed.

## Validation

The requested module build exited 0:

```text
Build completed successfully (18938 jobs).
```

Warning count: **2**, both “declaration uses `sorry`” at Suggested.lean lines 58 and 80.
There are no other warnings. `Suggested.lean` is byte-for-byte identical to the accepted package;
its single Mathlib import and three individual Tau Ceti imports already satisfy the port rules.
There are two headline theorems, no definitions, admitted data, examples or option overrides.

Push gate exited 0:

```text
gate EllipticCurveModularityTotallyReal: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The final worktree is clean.

The separate dependency-direction check exited 0 with the complete output:

```text
depcheck: 232 roadmaps, 2089 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The staged pre-commit gate had zero content findings and
reported only the three staged files as dirty; the clean-worktree gate is recorded above.

I elaborated a scratch copy of the final module with `#check @name` for both declarations.
Both elaborated types agree with the README, and neither lost a binder. The field theorem retains
both number-field instances, total reality of k, `Algebra k M`, `2 < n`, cyclotomic generation and
the primitive-root hypothesis. The switch retains the number-field and ellipticity hypotheses,
the actual geometric torsion modules, the pairing equality, every Galois automorphism and every
basis. Its existential replacement curve carries its own ellipticity instance. Universes remain
polymorphic. No signature changed. An initial import-only probe could not access the package's
module-private declarations; checking the declarations within the scratch module succeeded.

I reread the complete final README after editing, including all supplier contracts and Checks.

The final citation resolver reports no unresolved cross-roadmap citation and no unresolved Lean
name. Its warning that it did not inspect local Lake packages was addressed separately at the
pins. The three supplied leads are planned declarations in
`TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md`: `GaloisRep.IsOdd` in §4.1,
`GaloisRep.iso_of_frobenius_charpoly_eq` in §5.3 and `TateModule.residualRep` in §§6.1–6.2.
They are not claimed to exist in pinned Mathlib or Tau Ceti.

## Draft pull request body

Build the reflection descent and geometric prime switch for elliptic curves over totally real
number fields. The roadmap turns the cyclic-cover character systems over a CM cyclotomic
extension into totally odd rank-two systems over its real subfield, carries modularity through
integral congruences and weight-two lifting, and descends to every elliptic curve over the
original field, including CM curves, with every coefficient prime and every local factor.

The accepted mathematical design retains three explicit supplier contracts: totally real
weight-two lifting, solvable residual modularity in cohomological weight, and the field of
definition of CM elliptic endomorphisms. They have the owners and exact hypotheses recorded in
the README; this port does not claim those extensions are already present in their suppliers.

AI assistance: Codex (GPT-6) performed the port, source and ownership checks, signature inspection
and the mathematical calculations recorded in this report.

## Dependencies still represented by open roadmap pull requests

These are new-roadmap dependencies, cited by roadmap and section in the README:

- EllipticCurveModularityImaginaryQuadratic — §§0.2, 1.1–1.3, 3.1, 4.1–4.4, 5.1, 7.1 and 7.4.
- AutomorphicGaloisRepresentations — §§3.10–3.14, 4.4 and 4.7.
- AutomorphicGaloisRepresentationsPartII — AG2.0 and AG2.P.
- PotentialAutomorphyInfrastructure — §2.3.
- GL2AutomorphicRepresentationsAndTransfer — R16.2–R16.4, R16.6.3–R16.6.4, R17.4.16 and R17.5.14, with its accepted residual-weight contract.
- ArithmeticGaloisRepresentations — Layers 1–3, §§4.1, 5.3 and 6.1–6.2.
- InverseGaloisAndArithmeticFundamentalGroups — IG.2.4, IG.2.6 and IG.2.7.
- ModularCurvesPartII — §4.10.
- SmallRamificationAndAbelianVarietyBaseCases — §5.0d.
- PotentialModularityAndCompatibleSystems — §§1.1 and 1.6.
- AbelianSchemesAndArithmeticModuli — A4.1 and A6, especially A6.11.
- NeronModelsAndSemistableAbelianVarieties — §§3.10, 5.1, 5.3, 5.6 and 6.10.
- FaltingsFinitenessAndIsogenyTheorems — R28.4.
- ShimuraVarieties — §5.3.
- GL2ModularityLifting — Layer 5, with its accepted weight-two contract.
- ComplexMultiplicationAndExplicitReciprocity — Layer 1 and §4.1, with its accepted endomorphism-field contract.

ModularCurves, EllipticCurves, JacobianChallenge and EtaleCohomologyFoundations are consumed as on
main. No citation uses numbering available only in an open revision. No conflict or dropped cited
identifier was identified in the supplied overlap report. HilbertModularForms and the other
Downstream consumers are not suppliers.

## Port changes and mathematical fixes

All 18 numbered sections, five definition/API blocks, Checks, worked examples, exact supplier
contracts, source locators and the opening Summary are preserved. The order of layers remains
reflection descent; totally real lifting and elliptic seeds; simultaneous specialization and
three lifts; descent, all-place comparison and CM modularity. Main-branch models read were
`TauCetiRoadmap/QuadraticCharactersAndReduction/README.md`,
`TauCetiRoadmap/LFunctions/README.md` and `Completed/NumberFieldArithmetic/README.md`, together
with the relevant main suppliers.

The upstream-review reread produced these corrections:

1. §2.1's label Check now says precisely that replacing ψ by ψ² loses the fixed-label
   comparison. It no longer suggests an absolute nonisomorphism, which accidental congruences
   or isomorphisms need not respect. The two fifth-root sums `(√5−1)/2` and `−(√5+1)/2` provide
   a discriminating value; the inverse-label isomorphism remains.
2. §4.3 now identifies the local field at the inert Gaussian prime as the unramified quadratic
   extension `KT_w/ℚ₃`, replacing the nonstandard `ℚ₉`. Its norm computation is explicit:
   `‖3‖=1/9`, square root `1/3`, central character `(−1)(−3)/3=1`.
3. The Conventions now specify local Euler factors as rational functions expanded at zero and
   global identities first in `Re(s)>3/2`, then by continuation. The added Check computes
   `1+T+3T²` at 0 and 1/3 as 1 and 5/3, and `1−T` at 0 and 1 as 1 and 0. This prevents total
   inversion at zero from being mistaken for a local analytic pole.
4. References now link all nine exact legal source versions. The reference introduction no
   longer points to a sources manifest absent from the three-file roadmap folder. Supplier
   headings omit temporary merge-status labels.

The accepted review had no remaining non-blocking finding. Its source correction is preserved in
this report: LeHung26 line 230 cites FLHS Theorem 3 for lifting, whereas the lifting theorem is
FLHS Theorem 2 (FLHS15 line 116); the roadmap already uses the correct theorem. The accepted
conditional contracts and their owners are unchanged.

### Lean-to-README moves, supplier replacements and duplication removals

None moved from Lean: both package declarations are genuine headline statements and are retained.
There is no API padding or admitted data to move. The absent automorphic, cover and compatible-
system carriers remain explicitly identified in the module docstring; no substitute theorem was
introduced.

No new supplier replacement or duplication removal was needed. Existing ownership deferrals stay
only in Scope and ownership. In particular the arbitrary-field cyclic covers, integral regular
module, character systems, lattices, congruences, large residual primes, fixed-pairing twists and
simultaneous specialization retain EllipticCurveModularityImaginaryQuadratic as owner. Shared
compatible data, generic lifting, residual modularity, Hilbert attachment and CM-character theory
retain the named earlier owners. The rational-base CM theorem in Mathlib does not prove the
relative conjunction with its exact maximal-real-subfield equality.

The object sweep used `roadmaps list`, `roadmaps grep` and `roadmaps show` against main and the
indexed open heads, plus README searches in the board packages. Searches covered reflection
cocycles and real cyclotomic descent; cyclic covers, integral regular modules, character systems
and congruences; symplectic five-torsion and the 3–5 switch; weight-two lifting and solvable
residual modularity; and CM differential actions. Neither headline's fully qualified name was
found in another readable roadmap. The nearest scopes were read:

- EllipticCurveModularityImaginaryQuadratic owns the arbitrary-field geometry and its
  imaginary-quadratic automorphy endpoint, not reflection descent over a real subfield.
- EllipticCurveModularityPartIIGL2TypeAbelianVarieties owns GL₂-type varieties over ℚ and ℚ-curves;
  the theorem here is for arbitrary elliptic curves over all totally real fields.
- EllipticCurveModularityWild3Adic owns the rational wild-three proof and its locally prescribed
  companions; it does not own this arbitrary-number-field unrestricted switch.
- PotentialModularityAndCompatibleSystems owns the family predicates and potential-modularity
  machinery imported here, not the reflection eigenspaces or universal totally real endpoint.
- AbelianSurfacesModularity owns polarized surfaces and its 2–3 switch, not this curve family.
- GL2ModularityLiftingPartII concerns defect-one weight-one and Bianchi patching; it does not
  fill the accepted totally real weight-two contract.

Package hits concerning endomorphism-field heights, CM Euler systems, RM images or cyclotomic
class groups do not construct the objects owned here. No ownership was moved to a later roadmap.
Public Mathlib/Zulip searches produced no relevant additional formalization; pinned source
inspection, not those search results, determines all library claims below.

## Pinned and supplier evidence

The checked pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti
`2fd255d997f47c0b5d834ee416c7015d55444ce5`, matching `lake-manifest.json`.
Source paths below are relative to `.lake/packages/mathlib/` or `.lake/packages/TauCeti/`.

| Pinned file | Opened declaration and exact content used |
| --- | --- |
| `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean` | IsTotallyReal line 48; maximalRealSubfield line 126; maximality line 140; total-reality instance line 157. Reality is required under every complex embedding, not one embedding. |
| `Mathlib/NumberTheory/NumberField/CMField.lean` | IsCMField line 70 includes total complexity and quadraticity; CMExtension.eq_maximalRealSubfield line 456; IsCMField.ofCMExtension line 510; IsCyclotomicExtension.Rat.isCMField line 564 fixes rational base. |
| `Mathlib/NumberTheory/Cyclotomic/Basic.lean` | IsCyclotomicExtension line 74 includes both primitive-root existence and generation. Merely containing a primitive root is insufficient. |
| `Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean`; `Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean` | IsPrimitiveRoot line 63 has exact-order divisibility; IntermediateField.adjoin line 34 includes the image of the base field as well as the generator. |
| `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean` | WeierstrassCurve line 76; IsElliptic line 366 requires unit discriminant; j line 388 is inverse discriminant times c₄³. Singular cubics are excluded. |
| `Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean` | IsMinimal line 275; minimal line 300; HasGoodReduction line 324; HasMultiplicativeReduction line 341; HasAdditiveReduction line 348; HasSplitMultiplicativeReduction line 360. The reduction predicates include minimality; the split predicate includes multiplicative reduction. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean` | torsionGaloisAction line 77 is on actual geometric torsion with the library's automorphism composition. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/Torsion/Structure.lean` | pointTorsionModule line 51; nonempty_basis_torsionBy line 149. Nonzero invertible N and separable closedness give actual bases, so the switch is not vacuous. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/WeilPairing/Basic.lean`; sibling `Galois.lean` | weilPairing line 225 takes values in additive roots of unity; weilPairing_torsionGaloisAction line 104 supplies its Galois equivariance. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Galois.lean`; sibling `Determinant.lean` | tateModuleGaloisRepresentation line 80; det_tateModuleGaloisRepresentation line 52, with invertibility of ℓ. The determinant is ε, dualized to ε⁻¹ in the roadmap. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean` | quadraticTwistOf line 164; quadraticTwist line 469; quadraticTwistPointEquiv line 824; quadratic-character equivariance line 945. The quadratic-extension and separability hypotheses are retained. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Differential.lean` | pullbackDifferential line 79; composition line 102; additivity on the invariant differential line 137. These are not the general endomorphism-field theorem. |

The native number-field, algebraic-closure, basis and determinant-one-matrix carriers are used
without replacements. Pinned object searches found topological cyclic covers but not the
arithmetic cyclic-cover family; preliminary étale-cohomology infrastructure does not provide
its required continuous rational Galois realizations, character actions and comparison maps.
No pinned number-field cuspidal GL₂ attachment or shared arithmetic compatible-system carrier
was located. These absences explain the omitted headline signatures, not a reduction in scope.

All supplier sections in Exact supplier contracts were reopened on main or through `roadmaps
show` at the indexed heads. In particular:

| Supplier | Contract verified |
| --- | --- |
| ModularCurves §0E; EllipticCurves Layers 0.5, 1, 4, 4.5a, 5; JacobianChallenge D–F | Effective projective descent with polarization, torsion/twist and differential actions, local minimal models, pointed Jacobians. The fixed point `(O,1)` provides the point required here. |
| EtaleCohomologyFoundations §0.11 | Smooth trace and curve duality give the cup product into the inverse Tate twist. |
| EllipticCurveModularityImaginaryQuadratic §§0.2, 1–4, 5.1, 7.1, 7.4 | The cover geometry and specialization are expressly over arbitrary number fields; §7.4 retains the normal-closure prime choice and all character labels. The fixed-pairing twists include levels three and five. |
| SmallRamificationAndAbelianVarietyBaseCases §5.0d; AutomorphicGaloisRepresentationsPartII AG2.P | Raw systems allow arbitrary positive rank and specified finite realization fields. Base restriction enlarges the bad set by ramified places; no good polynomial is stored there. The Hilbert member comparison and weak predicate are separate. |
| AutomorphicGaloisRepresentations §§3.10, 3.13, 3.14, 4.4, 4.7 | Unrestricted Hilbert attachment, geometric Hecke characters, determinant and absolute irreducibility, and full monodromy comparison away from and at the coefficient prime. |
| PotentialAutomorphyInfrastructure §2.3(2) | Descent of the prescribed representation, with irreducible restriction, over finite Galois soluble totally real extensions, retaining all-place local identities. |
| GL2AutomorphicRepresentationsAndTransfer R16.2–R16.4, R16.6.3–R16.6.4, R17.4.16 | Local parameters, Steinberg monodromy, conductors/newvectors, multiplicity one, weight conversion and quadratic induction including central character and the unitary twist. |
| ArithmeticGaloisRepresentations §§4.1, 5.3, 6.1–6.2 | All three original resolver leads occur as planned targets, with oddness, semisimple density recognition and actual residual Tate representations. |
| InverseGaloisAndArithmeticFundamentalGroups IG.2.4, IG.2.6, IG.2.7; ModularCurvesPartII §4.10 | Hilbert data use integral covers, not necessarily geometrically integral covers; fixed-pairing level-15 geometric connectedness gives SL₂ monodromy. |
| PotentialModularityAndCompatibleSystems §§1.1, 1.6 | Compatible-predicate comparison and automorphy by normalized good polynomials; no duplicated raw-system definition. |
| AbelianSchemesAndArithmeticModuli A4.1, A6.11; FaltingsFinitenessAndIsogenyTheorems R28.4.5 | Integral Tate realization/specialization; integral coefficient-independent endomorphism polynomials; rational Tate semisimplicity. |
| NeronModelsAndSemistableAbelianVarieties §§3.10, 5.1, 5.3, 5.6, 6.10 | Semistable extension, good-reduction criterion, residue-prime comparison, bad local factors and the abelian compatible system, with covariant Tate dualized to H¹. |
| ShimuraVarieties §5.3; ComplexMultiplicationAndExplicitReciprocity §4.1 | CM action over ℂ versus full CM endomorphisms defined over the number-field base are distinct. The latter supplier's Tate components use the inverse geometric avatar, hence dualize to the ξ used here. |
| GL2ModularityLifting §§5.7, 5.10 | Potentially Barsotti–Tate, component and residue-field restrictions remain; they do not supply the general accepted contract. |
| GL2AutomorphicRepresentationsAndTransfer R17.5.14 | Provides parallel weight one; the cohomological-weight contract is expressly additional. |

The three accepted contracts are not reported as existing declarations. Their exact hypotheses,
source locators and proof-route limitations remain in the README and under Unresolved below.

## Source inspection

The nine source files were read from the supplied legal cache at the hashes recorded by
`packages/EllipticCurveModularityTotallyReal/sources.toml`. Source passages were not copied.
Exact version links were transferred from that manifest into the references.

| Roadmap statements | Source locators checked |
| --- | --- |
| §1.1 field data; §§1.2–1.4 reflection, eigenspaces and pairing | LeHung26 line 237, line 241, line 245, line 247; Lemma 3.2, p.6. General n and general base are the elementary extension explained in §1.1, not a quotation of its n=3p case. |
| §§1.5–1.6 lattices and endpoints | LeHung26 line 243 and line 244; OpenAI26 line 521, line 547 and line 571; Proposition 5.2, Lemma 5.3, Corollary 5.4, pp.13–14. |
| §2.1 | LeHung26 line 221, §2.4, p.5. |
| §2.2 and its general lifting contract | LeHung26 line 231, Proposition 3.1, p.6; BD14 line 2144 and line 2171, Théorème 3.2.2, pp.36–37; FLHS15 line 116 and line 241, Theorem 2 and §2, pp.3,5–6. |
| §2.3 | FLHS15 line 421 and line 430, Lemma 6.1 and proof, p.10. The infinite-j strengthening uses the explicitly supplied Hilbert theorem and finite j-map. |
| §§2.4–2.5 | FLHS15 line 404, line 411, line 127 and line 426, Theorem 6, Corollary 5.1 and Theorem 3, pp.3,9–10. |
| §§3.1–3.3 | LeHung26 line 250 and line 264, §§3.3–3.4, pp.6–7; OpenAI26 line 990, Proposition 8.4, p.23. The extension to arbitrary-degree bases is imported from EllipticCurveModularityImaginaryQuadratic §7.4. |
| §§4.1–4.4 | LeHung26 line 357, line 361, line 364 and line 86, Lemma 5.1, §5 and Theorem 1.1, pp.2,9; OpenAI26 line 1200 and line 1207, §9.4, pp.27–28. |
| Ordinary lifting routes and their limitations | BLGG12 line 2024 and line 2198, Theorems 6.1.5 and 6.1.8, pp.41–42,45; BLGG13II line 82, line 129 and line 149, Theorems 2.1.2, 3.1.1–3.1.2, pp.2–4. The p=3 proof's hypotheses are not promoted to an all-odd-prime theorem. |
| Supporting finite-flat lifting and non-substitute | Kisin09 line 3976 and line 4068, Theorems (3.5.5), (3.5.7), pp.1170,1172; SW99 line 2491 and line 2495, Hypothesis H and Theorem B, p.75. Residually reducible theorems are not substituted for the accepted irreducible contract. |
| Rational endpoint Check | BCDT01 line 15, Theorem A, author-version p.1. |

## Adversarial mathematics pass

These are finite or symbolic instantiations of the statements, not proofs of the deep theorems.
Point counts, finite-field arithmetic, matrix identities, derived subgroup orders, discriminants
and residue degrees were recomputed independently; the remaining displayed values follow by
the indicated elementary substitutions. Every definition's API and each numbered theorem are
included. An unchanged result below means the displayed calculation agrees, not that elaboration
proves the mathematics.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Number-field/elliptic conventions | ℚ; singular cubic y²=x³ | [ℚ:ℚ]=1; Δ=0 for the singular cubic versus required Δ≠0 | Number-field and ellipticity binders exclude junk | None |
| Cohomological determinant, Hodge signs | 11a1, good prime 3 | H¹ determinant 3 and weights 0+1=1; covariant geometric Tate determinant 1/3 and weights 0+(−1)=−1 | ε versus ε⁻¹ distinguished | None |
| Geometric Frobenius polynomial | 11a1 over 𝔽₃ | #E=5, a=4−5=−1; polynomial X²+X+3, product of roots 3 | Good polynomial matches attachment | None |
| Half-shift normalization | Same roots α,β | αβ=3; (α/√3)(β/√3)=1; shift −1/2 gives 1+3^(−s)+3^(1−2s), opposite shift gives 1+3^(−s−1)+3^(−2s−1) | Correct shift | None |
| Euler-factor domain | Good prime 3, split prime 11 | 1+T+3T² at 0,1/3 gives 1,5/3; 1−T at 0,1 gives 1,0 | Pole cannot be total inverse of zero | Added convention and witness |
| Quadratic-twist convention | y²=x³−x+1 over 𝔽₅; twist by 2 | Counts 8,4 give traces −2,2; (−1)(−2)=2 | Twist sign fixed | None |
| General inverse-cocycle convention | b³=2, g(b)=ζ₃b | φ*ω=bω′; g(bω′)=ζ₃bω′; inverse cocycle gives ζ₃, uninverted gives ζ₃⁻¹ | Distinct order-three scalars | None |
| Column action | R=(0,−1;1,−1), first basis vector | R(1,0)=(0,1); row convention gives (0,−1) | Direction fixed | None |
| Semisimplified congruence convention | A nontrivial unipotent extension versus its split reduction | Trace 2 and determinant 1 on both; invariant dimensions 1 and 2 | Equality is only after semisimplification | None |
| Conductor convention | 11a1 at 11; everywhere good curve | Exponents 1 and all 0 give 11 and unit ideal (1) | Artin exponent and exact level agree | None |
| §1.1 definition, real generator | ℚ,n=3,4,6 | ζ+ζ⁻¹=−1,0,1; L=ℚ and [M:L]=2 | Even n in Lean agrees with prose | None |
| §1.1 primitive-root independence | n=5, exponent 2 | s=ζ+ζ⁻¹; ζ²+ζ⁻²=s²−2; inverse exponent gives s again | Same generated field | None |
| §1.1 quadratic polynomial | n=3, ζ²+ζ+1=0 | ζ²−(−1)ζ+1=0; constant term 1 | Degree bound 2 | None |
| §1.1 character definition | n=3; primes 7 and 2 | Exponents 7≡1 and 2≡−1 mod 3 give δ=1,−1 | Character is the quadratic field character | None |
| §1.1 abelianity | ℚ,n=15 | Cyclotomic Galois order 8; quotient real Galois order 4; both abelian | L/k direction valid | None |
| §1.1 total-reality theorem | ℚ(√2),n=8; ℚ(√5),n=5 | Real generators √2,(√5−1)/2 lie in base; [M:L]=2 in both | Relative theorem is substantive | None |
| §1.1 maximal-real negative control | ℚ(i),n=3 | L=ℚ(i); maximal real field of ℚ(ζ₁₂) is ℚ(√3); i not real | Total-reality guard needed | None |
| §1.1 trivial-extension control | ℚ(√−3),n=3; n=1,2 over ℚ | M=L in first case, degree 1; at n=1,2 generators ±2 and degree 1 | CM conclusion excludes n≤2 and nonreal base | None |
| §1.1 cyclotomic adjoining at ℓ | n=303,ℓ=3,101 | [M:L]=2; ζℓ nonreal forces [L(ζℓ):L]=2 | L(ζℓ)=M | None |
| §1.1 API: root change | n=9, exponent 2 | s₂=s²−2; s root of s³−3s+1; degree 3 | Independence survives nonprime n | None |
| §1.1 API: character factorization | n=3, restriction to G_M | δ values on identity and conjugation are 1,−1; on G_M only 1 | Kernel and factor group correct | None |
| §1.1 API: base extension | ℚ to ℚ(√−3),n=3 | Initial (L,M)=(ℚ,ℚ(√−3)); composita are both ℚ(√−3), δ restricts to 1 | Trivial extension included | None |
| §1.1 API: divisor restriction | n=15,d=3; excluded d=1 | Inversion exponent −1 restricts to −1 mod 3; d=1 character value 1 versus δ(c)=−1 | d≥3 guard necessary | None |
| §1.1 API: Mathlib agreement | ℚ,n=5 | Real degree 2, CM degree 4, quadratic quotient 4/2=2 | Native CM convention matches | None |
| §1.2 definition and cocycle | δ=1; δ order 2 | w⁰w⁰=1; w¹w¹=w²=1 | Identity and composition | None |
| §1.2 effective polarized descent | m=3 | Genus 3 gives canonical degree 2g−2=4>0; m=1 gives 0 | Canonical polarization only used for m≥3 | None |
| §1.2 rational rotations | R,W above | R²=(−1,1;−1,0), R³=I; WRW=R²; WR⁻¹W=R | Reflection makes rotation rational | None |
| §1.2 wrong rotation cocycle | Conjugation by R | RR⁻¹R⁻¹=R⁻¹≠R | Commuting rotations cannot repair inversion | None |
| §1.2 quotient-map composition | n=45,m=15,d=3 | Exponents 3 then 5 give 15, equal n/d | Tower maps compose | None |
| §1.2 rotation quotient | m=3; action on elliptic quotient | w*=-1; quadratic twist trace −2 becomes 2 | Quotient is B twisted by δ | None |
| §1.2 reflection quotient | n=15 compared with forced n=5 cubic | Two branch points give 2g−2=4,g=3; four give 8,g=5 | Cubic clause needs 3 dividing n | None |
| §1.2 integral pullback | Reflection cocycle | On H¹, (w*)²=1; inverse cocycle equals cocycle | Integral action uses same involution | None |
| §1.2 rational point | (O,1), δ(c)=−1 | c⋆(O,1)=w(O,1)=(O,1) | Point descends | None |
| §1.2 rationality negative control | (S,0); (O,ζ₃) | w(S,0)=(−S,∞)≠(S,0); w(O,ζ₃⁻¹)=(O,ζ₃) | Rational points of twist differ from untwisted points | None |
| §1.2 API: trivial twist | Base contains μ₃ | δ=1, φ=id, transported action ρ | Identity case holds | None |
| §1.2 API: finite extension | Extend from L to M | δ restricted to G_M=1; cocycle becomes w⁰=1 | Base change trivializes twist | None |
| §1.2 API: composition | n=303,m=101,d=1 | Quotient degrees 3·101=303 | Twisted tower preserves degrees | None |
| §1.2 API: Jacobian | Genus m=3 | dim Pic⁰=3; rank H¹=6; w²=1 on Jacobian | Correct abelian dimension | None |
| §1.2 API: splitting field | M/L quadratic | Restricted twisting sign 1; rotations and reflection unchanged under φ | Markings preserved | None |
| §1.3 definition: eigenspaces | n=3 | 6=2+2+2; trivial piece has rank 2, not 1 | Correct object and dimension | None |
| §1.3 API: restriction | M=L and [M:L]=2 | W rank 2 restricts to V rank 2; induction would have ranks 2 or 4 | Descent differs from induction | None |
| §1.3 API: reflection | θ of order 3 | θ(wuw)=θ(u)⁻¹; labels ζ₃ and ζ₃² exchanged | G_L-equivariant isomorphism | None |
| §1.3 API: idempotent | n=3, character exponents a,b | (1/3)Σζ₃^((b−a)j)=1 if a=b, else 0 | Projector determined, not arbitrary summand | None |
| §1.3 API: quotient realization | n=45,d=3 | Norm after pullback scalar 15≠0 in ℚ_ℓ | Rational isomorphism, no integral assertion | None |
| §1.3 API: coefficient embedding | ζ₃↦ζ₃² | Eigenvalue ζ₃ becomes ζ₃² under coefficient conjugation | Transport is semilinear | None |
| §1.4 rank and semisimplicity | n=3 and rank-zero candidate | Each character rank 6/3=2; zero module rank 0≠2 | Native summand, not unconstrained data | None |
| §1.4 pairing | Basis with pairing matrix (0,1;−1,0) | [e₁,e₂]=1,[e₂,e₁]=−1, determinant 1 | Perfect alternating form | None |
| §1.4 reflection insertion | θ³=1,θ≠1 | θ²≠1 forces self-cup 0; w changes θ⁻¹ back to θ | Excludes zero self-pairing model | None |
| §1.4 determinant and oddness | θ=1, δ(c)=−1 | det(H¹(B)⊗δ)=ε⁻¹δ²=ε⁻¹; at c equals −1 | Twist does not spoil determinant | None |
| §1.4 Hodge weights | {0,1} versus {0,2} | Sums 1 versus 2; pairing target weight 1 | Wrong weights excluded | None |
| §1.4 good/crystalline domain | v above n; good v outside S | Membership v∈S true for v|n; good v outside S has inertia 1 and N=0 | No accidental good-primes restriction on endpoint | None |
| §1.4 common polynomials | q=5 | P=X²−2X+5, monic degree 2, constant 5≠0 | Coefficient and nonzero-root requirements | None |
| §1.4 assembly of raw system | This P and weights | Rank 2, polynomial degree 2, Hodge cardinality 2 | Assembly uses established properties | None |
| §1.4 API: member at λ | Two embeddings inducing λ | 1⊗σ sends jθ(u)x to σ(jθ(u))(1⊗σ)x | Correct semilinearity and same local member | None |
| §1.4 API: restriction to M | 5 inert in ℚ(√−3) | (1±2i)²=−3±4i; trace −6, determinant 25; #E(𝔽₂₅)=32 gives 26−32=−6 | Stored polynomial X²+6X+25 | None |
| §1.4 API: reflection polynomials | θ and θ⁻¹ | Same two roots, trace and determinant equal; rank 2=2 | Same good polynomials and bad set | None |
| §1.4 API: identity base change | L′=L | f=1, α¹=α, β¹=β, S_res=S | Identity holds | None |
| §1.4 API: ramified base change | ℚ(√5)/ℚ at 5 | e=2,f=1,q′=5; member P=X²−2X+5; v′∈S_res, stored P absent | Preserves accepted repair | None |
| §1.4 API: wrong residue exponent | Same ramified extension | Using e gives X²+6X+25, constant 25≠5 | Excludes confusing e with f | None |
| §1.4 API: duality | α=1+2i,β=1−2i,q=5 | Inverses (1∓2i)/5 equal the multiset {α/5,β/5}; {0,−1}={0,1}−1 | Correct ε twist | None |
| §1.5 definition: coefficient ring | ℓ=3, roots of unity | v₃(1/3)=−1; root-of-unity values have valuation 0 | Field not contained in O, values are units | None |
| §1.5 API: evaluation quotient | O[C₃]² at ζ₃ | Each regular copy evaluates to O; quotient O² has rank 2 | Correct quotient and map | None |
| §1.5 API: freeness including ℓ dividing n | ℓ=3,n=303 | Regular rank 2 evaluates to O²; v₃(1/303)=−1 | Integral projector is invalid, quotient valid | None |
| §1.5 API: Galois stability | δ(g)=−1, θ³=1≠θ | Untwisted g changes θ to θ⁻¹≠θ; twisted g commutes with u′ | Twist required except θ=1 or δ=1 | None |
| §1.5 API: rationalization | O²⊗E_λ | E_λ², dimension 2; n becomes invertible | Agrees with θ eigenspace | None |
| §1.5 API: coefficient extension | O′/O | O²⊗O′=O′², rank 2 | Extension law | None |
| §1.5 API: restriction to G_M | δ restricted to G_M | Sign 1, same evaluation θ; lattice rank 2=2 | Imported lattice recovered | None |
| §1.5 API: reduction | O² modulo 𝔪 | κ², dimension 2; ζ₃≡1 at 3 | Reduction depends on reduced label | None |
| §1.5 chain at p | n=3p,ψ order p | ψ̄=1; χ̄=η̄ψ̄=η̄ | First and third congruences | None |
| §1.5 chain at 3 | Same χ=ηψ | η̄=1; χ̄=ψ̄; η̄=1 also gives η≡1 | Middle and extra cubic congruence | None |
| §1.5 accidental congruences | Base contains μ₁₅ and J[3] | All residual quotients are trivial κ² even though reduced labels differ | No false converse to equal-label implication | None |
| §1.6 cubic endpoint | n=3 | w invariants on W₁:0; on Wη⊕Wη⁻¹:2; total 2 | Correct elliptic H¹ | None |
| §1.6 trivial endpoint | Inert v, trace −2 of B | δ(v)=−1 gives W₁ trace 2; twisting back gives −2 | δ cannot be dropped | None |
| §1.6 rational quotient maps | n=45,d=3; n=303,d=101 | Norm scalars 15 and 3; neither 3-adic unit | Rational qualification needed | None |
| §1.6 two quadratic twists | δ,h both nonsquare characters | (−1)²=1 for each, product square 1 | E recovered, including square h case with character 1 | None |
| §2.1 theorem | Split and nonsplit extension of 1,ε⁻¹ | Both polynomials (X−1)(X−q); extension classes 0 versus nonzero | Semisimplicity necessary | None |
| §2.1 fixed-label Check | p=5,ψ versus ψ² | ζ₅+ζ₅⁻¹=(√5−1)/2 versus −(√5+1)/2; difference √5≠0 | General compatibility cannot relabel, accidental equality not excluded | Clarified |
| §2.2 summand lifting | A elliptic,e=1; e=0 | Ranks 2 and 0 respectively; e=0 violates rank-two hypothesis | No vacuous idempotent model | None |
| §2.2 odd-prime guard | ℓ=2,3 | −1≡1 mod 2; −1≡2≠1 mod 3 | Excludes ℓ=2 | None |
| §2.2 mixed local types | Tate-curve versus potentially good summand | N has rank 1 versus 0; both have weights {0,1} | Wider contract required | None |
| §2.2 genuine 𝔽₅-model alternative | GL₂(𝔽₅) residual image | Orders GL₂=480,SL₂=120,PSL₂=60; A₅ has no quotient of order 2 | Exceptional projective case handled | None |
| §2.2 determinant-only negative control | B=(0,2;1,0), C=aB,a²=3 | B²=2I,C²=I,det B=3 nonsquare,det C=4 square | Larger-field determinant is insufficient | None |
| §2.2 weight-one negative control | Artin rank two | Weights {0,0}, sum 0≠1 | Outside lifting domain | None |
| §2.3 switch headline | K=ℚ versus K containing ζ₃ | Arithmetic image orders 48 versus 24; required SL₂ order 24 | GL₂ requirement would be false in second case | None |
| §2.3 symplectic condition | α=id versus α=2 | Pairing exponent 1 versus 2²=4 mod 5; 4≠1 | Equivariance alone insufficient | None |
| §2.3 absolute irreducibility | SL₂(𝔽₃), line stabilizers | Group 24; rational-line stabilizer 6; nonrational at most 4 | No invariant line | None |
| §2.3 geometric components | Full 3-frame torsor | 2 components each degree 24; total 48. ζ₃∉K exchanges them; ζ₃∈K does not | Integral component, not false geometric integrality | None |
| §2.3 infinitude | Finite j-map, degree d>0 | m j-values have at most dm geometric preimages; finite dm cannot exhaust infinite Hilbert set | Infinite j conclusion follows | None |
| §2.3 wrong subgroup images | Borel, split/nonsplit normalizers | Orders 12,8,16; none divisible by 24 | Required SL₂ is substantive | None |
| §2.4 mod-three seed | Derived subgroups | Sizes 48→24→8→2→1, abelian quotient orders 2,3,4,2 | Solvability and odd determinant 2 supply residual route | None |
| §2.4 cyclotomic restriction | Cyclotomic determinant | Kernel det=image∩SL₂; determinant values 1,2 | Correct subgroup, not irreducibility over K alone | None |
| §2.5 mod-five seed | Generic image; 11a1 | Generic cyclotomic image order 120, projective order 60; 11a1 has a fixed 5-torsion line | Genuine model alternative applies; hypothesis excludes rational torsion | None |
| §3.1 nonzero coefficient | Cubic λ; characteristic 3 and prime order 101 | 2−λ−λ⁻¹=3 for cubic λ; at order 101, −(λ−1)²/λ≠0 | Correct sign and nonvanishing | None |
| §3.1 prime bound | p=7,13,101 | Orders of 3 modulo p are 6,3,100; 3⁴−1=80<101 | Regular-word bound differs from mere nonvanishing | None |
| §3.1 simultaneous irreducibilities | n=303,ℓ=3,101,5 | L(ζ₃)=L(ζ₁₀₁)=M, degree 2; G_(M(ζ₅))⊆G_(L(ζ₅)) | Subgroup irreducibility implies larger-group irreducibility | None |
| §3.1 original-curve residual condition | p=101,SL₂(𝔽₁₀₁) | SL₂ order 101(101²−1)=1030200; perfect group has abelianization order 1 | Abelian cyclotomic extension preserves SL₂ | None |
| §3.2 auxiliary seed | η and η⁻¹ | Each rank 2, both H¹(A_t); 5≠3 and 5≠101 | Same seed at every coefficient prime | None |
| §3.3 first lift | p=101,η to χ | Reduced labels χ̄=η̄; rank 2, determinant ε⁻¹, weights 0+1 | p-adic lifting inputs agree | None |
| §3.3 middle lift | ℓ=3,χ to ψ | Reduced labels χ̄=ψ̄; same rank 2 and Hodge sum 1 | Change of prime needed between rows | None |
| §3.3 final lift | p=101,ψ to 1 | ψ̄=1; target rank 2; all primes in rows are 101,3,101 | No five-adic condition in chain | None |
| §4.1 descent theorem | Quadratic step with irreducible restriction | Character twists 1,δ have values 1,−1 outside subgroup; same restriction | Prescribed representation selects the descent | None |
| §4.1 irreducible-restriction control | S₃ splitting field of x³−4x+1 | Discriminant 229>0 nonsquare; induced χ restricts to χ⊕χ⁻¹ and is isomorphic to sign twist | Reducible restriction has different descent count | None |
| §4.1 contrasting trivial restriction | C₃⊂S₃, restriction 1⊕1 | Three descents 1⊕1,1⊕sgn,sgn⊕sgn; two character twists of trivial sum give only first/third | Check distinguishes failure of hypothesis | None |
| §4.1 twist removal | h(t) square and nonsquare | χ_h=1 or ±1; χ_h²=1 in both | Original E, not a residual twist | None |
| §4.2(1) central character/uniqueness | Elliptic determinant | (χπε⁻¹)/(ε⁻¹)=χπ=1; good eigensystem (a_v,1) | Correct trivial character, uniqueness by supplier | None |
| §4.2(2) all coefficients | 11a1 at 3,ℓ≠3 | Every good polynomial X²+X+3, trace −1 and determinant 3 | Compatible system comparison | None |
| §4.2(3) non-residue-prime WD | Split multiplicative 11a1 at 11 | rank N=1, factor degree 1, conductor exponent 1 | F-ss retains N | None |
| §4.2(4) residue-prime WD | Same curve at ℓ=11; good p-adic curve | Semistable N rank 1 versus crystalline N rank 0 | p-adic comparison includes both | None |
| §4.2(5) local factors | Good, multiplicative, additive | Degrees 2,1,0; denominators 1+T+3T²,1−T,1 | Every finite type represented | None |
| §4.2(5) real factor | D₂ unitary | Γ_C((s−1/2)+1/2)=Γ_C(s) | Infinity normalization agrees | None |
| §4.2(6) exact conductor | y²=x³−x at 2; 11a1 at 11 | Local exponents 5 and 1; contributions 2⁵=32 and 11 | Exact level, not merely divisibility | None |
| §4.2(7) rationality | 11a1 at 3 | q+1−#=4−5=−1∈ℤ; s=3/3=1 | Hecke coordinates rational | None |
| §4.2(8) multiplicative split test | y²=x³−x+1 at 23, then ℚ(√5) | Δ=−368,c₄=48 unit; 5 not a square mod 23; f=2,q′=529 | Unramified quadratic extension splits node | None |
| §4.2(8) additive versus Steinberg | Potentially good additive and potentially multiplicative additive | Inertia invariants 0 in both; N ranks 0 and 1 respectively; Euler factor 1 in both | Factor alone does not determine monodromy | None |
| §4.3 imaginary CM field | ℚ and ℚ(√2),T=ℚ(i) | [KT:K]=2 in both; over ℚ(i) degree 1 | Only cuspidal branch for totally real K | None |
| §4.3 character splitting and induction | Gaussian curve at 3 and 5 | Counts 4,8 give a=0,−2; split roots −1±2i, product 5 | Rank-one components give correct induced trace | None |
| §4.3 half twist | Same curve at 5 | Unitary root product 1 versus untwisted product 5; shifted traces −2 versus −2√5 | Correct induction normalization | None |
| §4.3 inert central character | Same curve, inert prime 3 | Frob₃² eigenvalue −3; norm 9, norm square root 1/3; (−1)(−3)/3=1 | Central character trivial | Corrected local-field notation |
| §4.3 second CM example | y²=x³+1 over 𝔽₅ | #=6,a=6−6=0 | Inert induced trace zero | None |
| §4.3 endomorphism field | [i](x,y)=(−x,iy) | d(−x)/(2iy)=iω; conjugate scalar −i; i∉ℚ | Endomorphisms need KT | None |
| §4.3 characteristic-2 control | y²+y=x³ over 𝔽₂ | Δ=−27≡1; ω=dx; Frobenius pulls back to d(x²)=0 | Characteristic-zero injectivity cannot extend to p | None |
| §4.3 characteristic-3 control | y²=x³−x over 𝔽₃ | Δ=64≡1; d(x³)/(2y³)=0 | Same noninjectivity, no division by 2 in characteristic 2 | None |
| §4.4 endpoint, non-CM branch | y²=x³−x+1 over ℚ(√5) | j=48³/(−368)=−6912/23 nonintegral | Non-CM route applies | None |
| §4.4 endpoint, CM branch | y²=x³−x over same base | j=1728; T=ℚ(i),quadratic compositum | CM route covers excluded geometric branch | None |
| §4.4 unit conductor | Every local exponent zero | Product of prime ideals to power 0 is (1) | Level-one conclusion well formed | None |
| Worked examples and layer degrees | p=101,n=303 | φ(303)=200,[L:ℚ]=100; quotient exponents 101 and 3 | General endpoint has no base-degree exclusion | None |
| Accepted residual-weight contract | Inertia diag(−1,1) at odd p | Image order 2 survives unramified base change; ramified quadratic restriction kills it | Route allows ramification, and weight-one weights 0,0 differ from weight-two 0,1 | Owner/conditionality retained |
| Accepted lifting contract | ε⁻¹ν with ν nontrivial; elliptic model at 5 | Determinant ratio ν≠1; elliptic residual dual has genuine 𝔽₅ model and ratio 1 | General contract wider than §2.2; no hidden local matching | Owner/conditionality retained |
| Accepted CM endomorphism contract | [2],[i],zero endomorphism | Differential scalars 2,i,0; composition [2]∘[i] has scalar 2i; conjugation sends i to −i | Additivity, multiplication and equivariance determine field action | Owner/conditionality retained |

The zero ring cannot carry the field/number-field hypotheses; rank zero is excluded in the raw
carrier and in rank-two summands. Characteristic-p and inseparable examples are not in the
number-field theorems; the characteristic-2/3 differential controls explicitly show why this
matters. No empty frame set is used: native torsion bases exist. Identity and trivial extensions
are included, not silently forbidden. Nonabelian controls use S₃ and Q₈; cyclic controls use C₃,
C₂ and cyclotomic characters. All divisions by n in projectors or quotient inverses occur over
characteristic-zero coefficient fields, while integral lattices use evaluation quotients.

## Unresolved

The accepted review is conditional on these three named extensions. They remain absent from the
indexed supplier heads, with ownership unchanged:

- `totally-real-weight-two-lifting`: GL2ModularityLifting Layer 5 after §5.10. Its present
  potentially Barsotti–Tate theorems do not cover the full potentially semistable, mixed-local-type
  contract with the stated five-adic alternatives.
- `totally-real-solvable-residual-cohomological-weight`: GL2AutomorphicRepresentationsAndTransfer
  R17.5 after R17.5.14. A parallel-weight-one residual witness does not by itself supply the
  cohomological witness needed by the lifting theorem; the general return from the auxiliary
  totally real soluble extension is explicitly part of the contract.
- `cm-elliptic-endomorphism-field`: ComplexMultiplicationAndExplicitReciprocity Layer 1 before
  §1.1. The injective, Galois-equivariant differential scalar and exact endomorphism-field
  criterion are not supplied merely by pinned pullback operations or complex CM actions.

No additional unresolved mathematical or port defect was found. The port preserves the accepted
conditional design rather than silently claiming these theorems already exist. No source
permission issue or suspicious instruction was found in the inspected material.


Pull request: #2185 (roadmap/elliptic-curve-modularity-totally-real at 7df3ef6)
