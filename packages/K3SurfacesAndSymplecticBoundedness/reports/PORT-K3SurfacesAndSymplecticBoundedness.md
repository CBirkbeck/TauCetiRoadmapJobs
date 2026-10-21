# Port report: K3SurfacesAndSymplecticBoundedness

Branch: `roadmap/k3-surfaces-and-symplectic-boundedness`.
Head: `b82cbb70e85924d052746bdfe84156c20d8e201f`.
Base: `83f4d77`; the initial working tree was clean. The commit changes only `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md`, `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/Suggested.lean`, and `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/metadata.toml`. No push or GitHub write was performed.

## Validation

Command: `lake build TauCetiRoadmap.K3SurfacesAndSymplecticBoundedness.Suggested`.

Exact outcome:

```text
Build completed successfully (8976 jobs).
```

Warning count: **3**, all warnings of the form “declaration uses `sorry`”, for `GeneralLinearGroup.oddCongruenceKernel_torsionFree`, `finiteSubgroup.reduction_injective`, and `finiteSubgroup.integral_reduction_injective`. There are no other warnings or errors. The final file has 165 lines, one `import Mathlib`, three real-bodied definitions, six proved examples, and three admitted theorem targets. All six examples compile. Temporary `#check @...` probes were built for the three admitted signatures; their elaborated types retain `Fact ell.Prime`, oddness, the reduction and finite-order premises, and `[Finite H]` exactly where required. The probes are absent from the committed file.

Exact push-gate summary:

```text
gate K3SurfacesAndSymplecticBoundedness: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 check-labels-missing=0 empty-sections=0 round-labels=0 long-fences=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The gate requires a clean tree: before the commit its only failing counter was `dirty`; after the commit all counters are zero. `git diff --cached --check` passed before committing, and the final working tree is clean.

Exact dependency-check output:

```text
depcheck: 6 roadmaps, 42 edges, 0 problem(s)
```

No UPWARD or CYCLE line remains. A scope-only comparison initially produced the false-positive line `UPWARD: K3SurfacesAndSymplecticBoundedness (#35) -> ArithmeticDynamics (#148) at README lines [15]`: the parser treated the word “supplies” in a negative boundary sentence as a dependency marker. The final boundary simply describes the independent examples. Neither the checker nor the merge order was changed.

## Draft pull request body

Build a characteristic-independent library of K3 surfaces, their geometric and arithmetic Picard lattices, and their automorphism actions. The roadmap develops integral cohomological comparisons and faithful actions to obtain uniform bounds for finite automorphism subgroups, the sharper tame symplectic bounds with their exceptional branch, and fixed-degree polarized moduli over the integers with finite-field finiteness.

AI assistance: Codex performed the port, supplier and duplication searches, mathematical boundary audit, Lean proof repairs, and validation.

## Dependencies that are still open roadmaps

- CrystallineCohomology: CR.2.3, CR.3.2–CR.3.3, CR.3:duality.1, CR.4.1, CR.4.6–CR.4.7 and CR.7.3.
- AlgebraicModuliForArithmeticGeometry: §§7.6.1–7.6.1a and §9.10.
- ComplexComparisonPartII: C−1.1, C1.9, C2.2, C3.2d.2–C3.2d.5, C5.1 and C6.3/C6.6.

The remaining direct roadmap suppliers are on main, including the completed IntegralLattices foundations. No module from an open roadmap is imported. The named existing supplier interfaces were checked in their main texts or in the supplied open-roadmap snapshot; the explicit Part II extensions remain the conditional contracts described below.

## Preservation, supplier replacements and duplication

All **60** numbered subsections, **216** named Check bullets, and the eight Examples and eight Dependencies subsections are retained. Every original backtick identifier is retained except the reference to the absent `sources.toml`. All definition/construction subsections retain at least three Checks. No mathematics moved from Lean to README: the package's existing three definitions, all theorem statements and all examples were kept. Only elaboration/proof scripts changed in Lean.

No new supplier replacement or duplicate theorem deletion was needed. The package already consumes native scheme predicates and differentials, `LineBundleClass`, `IntegralLattice.ofSubmodule`, the field-Brauer comparison and finite-field Brauer triviality. Searches verified these at the manifest pins, Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. In particular, `PadicInt.toZMod`, `ker_toZModPow`, `ext_of_toZModPow`, and the nonzero-entry valuation criterion supply coefficients and filtration, but no existing general GL congruence torsion theorem was found. The pinned Mathieu files give presentations; they do not give the faithful permutation models or recognition required here.

The object sweep covered all 155 other main/completed roadmap READMEs, both pinned libraries, the cached 130 other open-roadmap texts, and the five specified sibling heads. Relevant boundaries were read: IntegralLattices owns the abstract K3 lattice, discriminants and primitive embeddings; AdicSpacesPartIII F0.8 uses a quartic universal deformation as an algebraization counterexample; ArithmeticDynamics §1.26 uses a K3 eigenclass in a height example; Completed/AlgebraicCodingTheory and Rank24LatticeConstructions exclude Mathieu identification. NoncommutativeAndEquivariantIwasawa §§0.1–0.2 discusses uniform groups and congruence examples, without a competing general GL reduction theorem. The five sibling heads contain no competing geometric target. The independent ArithmeticDynamics example is now distinguished explicitly in Scope and ownership. No notion moved from a later supplier, and no new supplier edge was introduced.

## Repairs from the upstream-reader pass

1. Applied the accepted review's locator note: §5.2 now cites the unnumbered definition following Remark 3.3.2 and Proposition 3.3.3, pp.14–15. Witnesses: rizov line 608, rizov line 610, rizov line 615.
2. Replaced the forward use of the generic Picard lattice in §4.1's specialization injectivity argument. Intersection compatibility and §1.5's already-proved numerical kernel theorem give injectivity directly. This avoids relying on §4.2, which itself consumes §4.1. Witness: huybrechts line 14132 through huybrechts line 14138; the target and its hypotheses are unchanged.
3. Included order 14 alongside 11 and 15 in §6.2's proof explanation. Its candidate lattice has rank 20 and determinant 196, as specified in §6.1a; the shorter explanation had omitted that already-retained case. The source's short case list at dolgachev-keum line 517 and dolgachev-keum line 518 is not used to erase the arithmetic order-14 candidate.
4. Corrected the remaining Stacks 0BCL prose locator to p.104, lines 4764–4775. The page-105 marker is stacks-projective-morphisms line 4776, after the proof. This applies the locator precision already recorded in the package's repair report.
5. Made References self-contained. The target folder contains three files and no source manifest, so the README now identifies all 28 source records by legal source links and document digests where available, retaining printed locators and the published-locator distinctions. No source passage was copied.
6. Repaired the two rank-one congruence examples: fixed the implicit matrix index at `Fin 1`, explicitly rewrote reduction of −1 with `RingHom.map_neg` and `map_one`, and used the residue-characteristic test or `decide`. Removed unnecessary tactic continuations from the unipotent power and prime-character proofs. All statements remain unchanged; the final build has only the three intended `sorry` warnings.

## Adversarial mathematics pass

Each subsection row covers its defining conditions, theorem/API assertions and Checks. These are boundary and dependency audits, not proofs of the admitted geometric targets. “Retained” means no additional repair was identified. The source limitations and conditional contracts are recorded separately below.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: intersection and half-norm | Quartic H; rational curve C; characteristic 2 | Squares 4 and −2 give half-norms 2 and −1; RR stays integral | Retained |
| Conventions: pullback, twists and contraction | Two noncommuting deck maps; frame e₁,e₂; point class | Pullback reverses composition; contraction gives e₂*,−e₁*; trace of a point is +1 | Retained; Wehler witnesses compile |
| Conventions: identity, order and degree | Identity; d=0; d=1,2 | Identity character 24; positive degree required; cubic ranks 11,20 | Retained |
| 1.1 native K3 predicate | Empty scheme; plane; E×E; quartic | Nonemptiness, canonical triviality and H¹ impose independent restrictions | Retained |
| 1.2 field and isomorphism transport | Identity; extension tower; purely inseparable field; rescaled form | Faithful flat descent detects H¹ and both inverse-line section spaces | Retained |
| 1.3 projectivity | Imperfect field; dimension-three control | Relative smoothness makes the field surface regular; no higher-dimensional conclusion | Retained |
| 1.4 RR and contraction | O; quartic H; p=2 | 2χ(O)=4 and 2χ(H)=8 in integers; contraction remains an isomorphism | Retained |
| 1.5 numerical and torsion kernel | O; nonzero effective curve; p-torsion candidate | Positive ample intersection and χ=2 rule out nontrivial kernel | Retained |
| 1.6 quartics | t=−1,0,1; Fermat at 2; dimension-zero ample divisor | Euler values 4,2,4; Fermat at 2 nonreduced; dimension bound necessary | Retained |
| 2.1 relative Picard space | Field; jumping classes; nilpotent base; arithmetic obstruction | Unramified does not force relative flatness or étaleness; Brauer obstruction retained | Retained |
| 2.1a infinite-height kernel | Zero/nonzero kernel witnesses; finite height; p=2 | Nonzero vector field and nonzero kernel witness are essential | Retained |
| 2.2 closed one-forms | Zero form; both height branches; p=2,3 | Finite height uses degeneration; infinite height uses Witt kernel and V-separation | Retained |
| 2.3 tangent vanishings | E×E; characteristic zero; imperfect field; p=2 | Algebraic closure meets Oda's perfect-field/point conditions; contraction gives tangent vanishings | Retained |
| 2.4 Hodge/crystalline modules | Degrees −1,1,3,5; hypothetical W/p summands | Universal coefficients exclude torsion; ranks 1,0,22,0,1; perfect k retained | Retained |
| 2.5 marked deformations | Dual numbers; unmarked groupoid | Marked tangent dimension 20; automorphisms are not discarded globally | Retained |
| 2.6 line deformation divisor | O; L=M^p; p dividing degree; good degree | O has dimension 20; divisible classes require integral normalization; good degree gives 19 | Retained |
| 2.7 polarized lift | p=2; ramified trait; arbitrary specified deformation | Existence allows finite ramification and does not promise every deformation works | Retained |
| 3.1 analytic predicate | Empty manifold; torus; complex quartic | Complex dimension two and H¹ separate the examples | Retained |
| 3.2 GAGA image | Projective/nonprojective analytic K3; rescaled form | Algebraic essential image is exactly projective | Retained |
| 3.3 integral topology | nx=0; O(1) on P¹; quartic cup square | Picard torsion argument applies to torsion x; Chern degree +1, square 4 | Retained |
| 3.4 étale ranks | ℓ=p; ℓ=2 invertible; very large characteristic-zero base field | Invertibility is essential; spread replaces an unjustified embedding of the whole field into C | Retained |
| 4.1 descent/specialization | Identity field; inseparable field; skew conjugate lines; constant trait | Arithmetic and geometric invariants differ; specialization pairing gives kernel zero via §1.5 | Repaired forward dependency |
| 4.2 geometric lattice | O; Gram [4]; rational curve; R to C | Integral pairing and normalized degree preserved; half-norm not the bilinear discriminant | Retained |
| 4.3 ranks | Closed extension; ample class; real Fermat surface | Arithmetic rank may increase; geometric rank remains fixed and positive | Retained |
| 4.4 rank bounds/cycle saturation | Ranks 1,20,22; multiplication by ℓ on Z_ℓ | Rank alone cannot give an isomorphism; Kummer saturation is required | Retained |
| 4.5 congruence theorem/API | Size 0; −1 at 2 and 3; I+3E₁₂; coprime powers | Size 0 trivial; dyadic torsion excludes ℓ=2; unipotent powers have linear off-diagonal | Explicit index/reduction repairs; all witnesses compile |
| 4.6 bounded descent | Closed field; imperfect field; rational point; finite field | Bounded separable degree gives rank; integral equality needs stated obstruction hypotheses | Retained |
| 5.1 symplectic predicate | Identity; product; inverse; rescaled generator; −1 | Kernel of inverse pullback matches actual fixed-volume condition | Retained |
| 5.2 polarized stabilizer | Identity; powers; Wehler H₁,H₂; scalar choices | First deck map fixes H₁, moves H₂, and is nonsymplectic over C | Locator repaired |
| 5.3 finite étale stabilizer | Geometric versus rational points; p=2; line-isomorphism scalars | Zero tangent and finite type give finite étale group; scalar data is absent | Retained |
| 5.4 Wehler example | Both deck matrices; both composition orders; nonample cut | Pairing preserved; S₂S₁ has trace 14 and determinant 1; canonical scalar product +1 | Proofs compile; height-example boundary clarified |
| 6.0 supersingular discriminant | σ=0,1,11; p=2 | Negative sign; σ=0,11 excluded; scaled evenness at 2 is explicitly required | Retained |
| 6.0a height inequality | h=1,10,11; infinite height | Bounds 20 and 2; h=11 impossible; infinity is not an integer substitution | Retained |
| 6.0b pencils | Rank-one [4]; F and 2F; quasi-elliptic p=2,3 | Rank threshold and primitive nef class essential; smooth generic fibre not forced at 2,3 | Retained |
| 6.0c height/rank and Jacobian | Missing section; finite height; rank 21; quasi-elliptic case | Jacobian and unirational alternatives close both small-characteristic branches | Retained |
| 6.1 tame quotients | G=1; involution; wild group; square rank-20 determinant | Root determinants 1 and 2⁸; tame assumption needed; Jacobian divisibility excludes square case | Retained |
| 6.1a cyclic arithmetic | Orders 2,4,9,12,14,16; determinants 121,196,225 | Order 14 satisfies subgroup relations; discriminants exclude 11,14,15 | Retained |
| 6.2 fixed-point table | Identity; orders 2,7,8; wild element | Identity excluded; point counts 8,3,2; involution H² trace 6 | Proof explanation now includes 14 |
| 6.2a wild fixed loci | Empty locus at 2; negative versus semidefinite cycle; D²=2,d=1 | Enriques branch retained; last inequality has zero denominator candidate and is not divided | Retained |
| 6.3 wild quotients | Rational resolution; nonzero exceptional lattice; free C₂ at 2 | Rational descent gives Enriques e=12 and b₂=10 without Picard equality | Retained |
| 6.3a wild refinements | p=11; p=13; quasi-elliptic p=2,3; omitted section | Exceptional prime retained; p-torsion statement restricted to elliptic K3 with section | Retained |
| 6.4 prime bound | p=2; p=13; nonsymplectic subgroup | Cauchy gives order-p symplectic element; no symplectic premise on entire group | Retained |
| 6.4a Picard faithfulness | Identity; p=2; deck map fixing just an ample class | Rank 22 and entire Picard action essential; one fixed ample class gives only finite order | Retained; primary source waiver recorded |
| 6.5 étale faithfulness | ℓ=p excluded; rational quotient; Enriques quotient at 2; K3 resolution | All quotient branches included; finite order precedes semisimplicity | Retained |
| 6.6 uniform bound | Trivial G; p=3; wild G | ℓ=5 at p=3, ℓ=3 otherwise; no averaging by group order | Retained |
| 6.7d involution lift | Identity instead of involution; L=M^p; p=2 | Exact order two; invariant tangent 12; integral normalization; p=2 excluded | Retained |
| 6.7d involution pencil | Swap matrix modulo 2; p=3; rank-one surface | Rational anti-invariant classes plus ample class give rank at least 9; specialization gives pencil | Retained; §4.1 dependency repaired |
| 6.8 Artin-one predicate | Signs ±9; −81; rank 20; Fermat at 3,7,5 | Rank, sign, exponent and actual characteristic distinguish examples | Retained |
| 6.8a invariant dimension/API | G=1,C₇, order 21; both Artin-one; nonflat A₁ quotient | Dimensions 24,6,6; exceptional four-dimensional branch retained; resolved trace avoids false flatness | Retained |
| 6.9 Mathieu function/character | n=0,1,2,7; wild element | Function values 0,24,8,3; only positive n used geometrically; wild trace excluded | Prime-formula tactic simplified; examples compile |
| 6.10 characteristic-zero bound | Trivial group; involution; 23-cycle | Orbit counts 24,16,2 on retained 24 letters; containment gives bound 960 | Retained |
| 6.11 tame exceptional bound | Four orbits; tame p=2; nonclosed field | Bound 10200960 remains; bound 960 requires its stated alternative | Retained |
| 7.1 primitivity | Zero; generator; double; squarefree d | Zero and doubles fail; n² divides d by lattice evenness | Retained |
| 7.2 multiplication/root loci | n=0; n=p=3; F,2F; zero section | n=0 excluded; square-zero sections use ample intersection; primitive locus open | Retained |
| 7.3 polarized families | d=0; nilpotent base; Picard section without line; scalar isomorphism | Positive degree and local ample representatives; Cartesian class-preserving arrows | Retained |
| 7.4 cohomology | m=0,−1,1,2,3; quartic; p=2 | Higher vanishing only m>0; positive section counts 4,10,20 | Retained |
| 7.5 embeddings | d=1,2; m=2,3; p=2; nonreduced base | Cubic ranks 11,20; evenness excludes Reider failure; base change retained | Retained |
| 7.6 Hilbert locus | Singular flat degeneration; equal-rank unequal line classes; nilpotent base | Canonical-class equality is scheme-theoretic, not a rank comparison | Retained |
| 7.7 atlas/projective bundle | Root at p=3; Fermat coordinate swap; nonsplit real quartic; line twist | PGL frames retain source identification; Brauer–Severi projectivization descends without a vector bundle | Retained |
| 8.1 moduli stacks | Nontrivial stabilizer; p dividing 2d; primitive locus | All-prime finite-type quotient; scalar inertia not introduced | Retained |
| 8.2 separation | Generic identity; two given smooth traits; missing smooth extension | Extends isomorphisms, not arbitrary punctured-trait objects | Retained |
| 8.3 coarse spaces | Stabilizers; nonisomorphic k-forms | Universal property and geometric bijection do not identify forms | Retained |
| 8.4 smoothness | d=1; p dividing 2d; coarse space | Smooth stack base Z[1/2] at d=1; bad primes remain in finite-type endpoints | Retained |
| 8.5 finite-field finiteness | Fixed field/degree; twists; coarse rational point without frame | Brauer triviality gives line and rational cubic frame; finite Hilbert points cover forms | Retained |

## Conditional extension-contract audit

The accepted review's inventory predates the package's subsequent documented repairs. The delivered README has **23** explicit extension contracts: the three surface-Brauer localization/Kummer/descent contracts listed in `review.json` are absent from the source README, while `tame-equivariant-deformations` is present. The port preserves the source README's complete contract text and does not revive deleted prerequisites or turn a contract into an extra hypothesis on a K3 surface. These extensions are not claimed to be implemented declarations at the pins or additional existing main-branch roadmaps.

| Contract | Instances tried | Result | Change |
| --- | --- | --- | --- |
| surface-projectivity | Imperfect field; surface versus dimension three | Smooth field surface fits the general regular-surface theorem | Retained |
| tame-equivariant-deformations | Trivial G; tame involution; wild group | Exact invariants require invertible order; fixed-functor comparison needs no infinitesimal automorphisms | Retained |
| hypersurface-cohomology | Quartic; Wehler; nonample cut; zero-dimensional ample cut | Regular sequence, ampleness in all factors and positive final dimension retained | Retained |
| surface-arithmetic-quotient | R to C; purely inseparable extension; curve descending over finite extension | Residue-weighted pushforward includes field degree; pulled-back divisor intersection stays unchanged | Retained |
| surface-quotient-resolutions | Identity; wild quotient | Normality and resolution maps asserted without wild higher-image vanishing | Retained |
| tame-quotient-singularities | A₁; trivial stabilizer; wild order | ADE, discrepancy zero and rationality belong only to tame local model | Retained |
| quotient-transcendental-comparison | G=1; wild G; ℓ dividing group order | Rational averaging permitted; exceptional divisor contributions tracked; no integral comparison | Retained |
| ruled-surface-two-forms | Point blowup; P¹-bundle; K3 volume | Reflexive extension gives birational invariance; fibre O(−2) gives vanishing | Retained |
| matsusaka-mumford | Identity; two smooth trait models; ruled control | Nonruled special fibre and polarization retained; no moduli properness claim | Retained |
| elliptic-surface-geometry | No section; wild multiple fibre; quasi-elliptic p=2,3 | Torsion in R¹O, wild canonical coefficients, Jacobian Euler comparison and root lattices retained | Retained |
| rational-surface-cohomology | Rational/unirational smooth surface; inseparable dominant map | Nonzero degree is invertible in rational ℓ-adic coefficients | Retained |
| adjoint-positivity | r=0,1; general type; p=2 | Full Reider–Terakawa alternatives retained; characteristic-zero vanishing imported separately | Retained |
| tame-lefschetz | Identity; isolated tame point; wild element | Identity supplied by Gauss–Bonnet; nonidentity isolated tame index +1; wild formula excluded | Retained |
| integral-topology | O(1), O(−1); logarithm increment | exp(2πiz) fixes integer kernel and positive Chern sign | Retained |
| oda-interface | Imperfect base; rational point absent; p=2 | Applied after algebraic closure; perfectness and point conditions then hold | Retained |
| witt-formal-brauer | Finite/infinite height; inseparable finite-flat map; point blowup | One-dimensional additive alternative, rank-h realization and degree norm retained | Retained |
| crystalline-chern-derivative | Trivial line; divisible c₁; good/bad degree | Derivative is tied to actual crystalline class and filtered connection | Retained |
| artin-discriminant | p=2; σ=1 and >1; discriminant length 22 | Scaled evenness needed at 2; de Rham injection is F_p-linear, not k-linear after tensoring | Retained |
| cross-realization | Finite order; infinite-order unipotent operator | Equal characteristic polynomials alone do not force identity; semisimplicity used only after finite order | Retained |
| tame-linear-groups | Trivial/cyclic group; A₄; binary tetrahedral group | SL₂ classification uses binary groups; A₄ has too many involutions | Retained |
| mathieu-permutation-model | Identity; involution; retained fixed letter | Character values 24 and 8; group orders 244823040 and 10200960 | Retained |
| mukai-eleven-groups-recognition | Rational realization; compatible ℓ-adic family; even group order | Sylow embedding remains a proved geometric input; Q₂ obstruction used when p≠2 | Retained |
| exceptional-mathieu-embeddings | Groups of equal order with different extension structures | Actual abstract extensions require embeddings; order alone is insufficient | Retained |
| Ample-space derived interfaces | Actual line versus Picard section; non-qc base; field | Scheme criterion uses actual line; global projectivity uses qcqs; unbounded projective dimensions retained | Stacks locator repaired |

## Unresolved conditions and source limits

The 23 Part II contracts above remain the accepted mathematical supply conditions. No new unresolved port/build/gate failure remains. Source records retain three primary-text waivers (`rudakov-shafarevich`, `matsusaka-mumford`, `nygaard-vectorfields`) and two uncertified published locators (`shioda-transcendental`, `arapura-chern`). Application locators and the explicit Chern derivation are preserved; they are not represented as independent primary-text verification. The Enriques source extraction has damaged mathematical font encoding, as recorded by the package reports. No source waiver was silently promoted to certification.

No suspicious instruction was identified in the mathematical source material read. Review text was treated as claims to verify, and none of its embedded workflow text was used to authorize actions.


Pull request: #1375 (roadmap/k3-surfaces-and-symplectic-boundedness at b82cbb7)
