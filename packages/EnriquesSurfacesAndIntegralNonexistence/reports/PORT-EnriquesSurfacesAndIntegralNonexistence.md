# Port: EnriquesSurfacesAndIntegralNonexistence

Branch: `roadmap/enriques-surfaces-and-integral-nonexistence`.
Head commit: `e3096fdee74684c91634b60d9bf86afcc0c43e73`.
Base: `ae2562c`; initial working tree empty.

The port contains only `TauCetiRoadmap/EnriquesSurfacesAndIntegralNonexistence/README.md`, `TauCetiRoadmap/EnriquesSurfacesAndIntegralNonexistence/Suggested.lean` and `TauCetiRoadmap/EnriquesSurfacesAndIntegralNonexistence/metadata.toml`. The topic is `math.AG`. The root README and pins were not edited. No push or GitHub write was made. Mathematics and edits were performed by Codex (GPT-6), without helper agents.

## Validation

Exact final build outcome:

```text
Build completed successfully (9021 jobs).
```

There are **6 warnings**, all `declaration uses sorry`, on the six headline theorems; no other warnings or errors. The final build's module outcome is:

```text
⚠ [9021/9021] Built TauCetiRoadmap.EnriquesSurfacesAndIntegralNonexistence.Suggested (2.9s)
```

```text
gate EnriquesSurfacesAndIntegralNonexistence: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The gate requires a clean committed tree: its precommit runs reported only the untracked/staged folder in `dirty`, with every content, import, scope and dependency check zero. The final gate passed on the clean committed tree.

Dependency direction, exact output:

```text
depcheck: 36 roadmaps, 337 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. The merge-order file was not edited.

The citation resolver reported no cross-roadmap citation or Lean name found nowhere. Its library scan reported that it did not discover the local Lake packages; all library declarations were therefore checked directly in the worktree's pinned sources. Tau Ceti HEAD is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; Mathlib HEAD is `6b7abb3c7686292736be2955bd3eb9ebf63b456a`.

## Draft pull request body

This roadmap builds characteristic-two and arithmetic Enriques geometry, extending EnriquesSurfaces beyond its characteristic-not-two core. It develops canonical coverings, Picard descent, genus-one fibrations and their rational Jacobians, then combines discriminant-lattice and fibre-incidence arguments with deformation obstructions to exclude nonexceptional constant-Picard surfaces over F₂ and Enriques families over the integers. The fourteen-case Jacobian classification and the three additional Enriques configuration exclusions remain explicit, separate proof targets.

Prepared with Codex (GPT-6); the port includes an author's mathematical audit and elaborated-signature comparison.

## Dependencies still in pull requests

The direct external roadmap suppliers still in pull requests, by name, are:

- EnriquesSurfaces, E0–E1f.
- InverseGaloisAndArithmeticFundamentalGroups, IG.0.3.
- AlgebraicModuliForArithmeticGeometry, §§7.6.1–7.6.1a.
- ComplexComparisonPartII, C3.2d.2, C3.2d.4–C3.2d.5.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.1.
- K3SurfacesAndSymplecticBoundedness, §§1.1–1.3 and 6.0b.
- NeronModelsAndSemistableAbelianVarietiesPartII, §§2–7 as individually specified in the README.
- WeilConjectures, WC.7.
- PadicHodgeTheory is the accepted named owner of the Fontaine extension contract; that extension is not a section of its base roadmap.

SchemeAndStackFoundations, EtaleCohomologyFoundations, AlgebraicVectorBundles, JacobianChallenge, LocalFieldsRamification and IntegralLattices are consumed at main, including IntegralLattices' completed layers. Open revisions of those main roadmaps were not substituted as dependencies.

## Ownership and supplier audit

The complete open-roadmap index and the main roadmaps were searched with `roadmaps list`, `roadmaps grep` and `roadmaps show`, by mathematical object: Enriques invariants and pencils; canonical coverings and conductrices; relative Picard spaces and numerical local systems; genus-one Jacobians and Kodaira comparisons; lifting obstructions; dyadic square classes; discriminant lattices and isotropic spinors. The supplied sibling heads and the board packages were included in the searches. Open-work ownership was checked; it was not restricted to the listed sibling names. No source text was treated as an instruction, and no suspicious instruction passage was encountered.

The characteristic-not-two programme in EnriquesSurfaces was not in the accepted package's ownership discussion. Its E1a–E1f now supplies those specializations. The retained work explicitly adds characteristic two, arbitrary fields or algebraic-space families. The Summary identifies the arithmetic Part II relationship and where that base stops. All headline Lean names remain under this roadmap's namespace; none acquires another roadmap's fully qualified declaration name.

Two duplicate targets were deleted: package §2.19 is NeronModelsAndSemistableAbelianVarietiesPartII §2.9, and package §4.3 is its §3.11. All consumers cite the suppliers directly. Their mathematical content survives in the supplier contracts, ownership discussion and relevant examples. The simple-fibre F₂ isomorphism is retained because it identifies an actual residue-field fibre, beyond a geometric Kodaira symbol.

The normality-sensitive finite-monodromy input in §3.2 now explicitly consumes InverseGaloisAndArithmeticFundamentalGroups IG.0.3. Spec ℤ meets its normal, connected, locally Noetherian hypotheses. A trivial profinite fundamental group alone was not used as an unexplained classification of arbitrary integral local systems.

Pinned square-class objects, four unit classes, eight total classes, the dyadic unit representative theorem, Hensel, the class-five nonsquare and the unramified extension are suppliers. The ordered rational representative comparison and canonical-cover twist matching remain here. No second square-class group or generic cardinality theorem was added.

## Source identifiers and resolved locators

The identifiers below refer only to repository-relative files, or to the legal sources in `packages/EnriquesSurfacesAndIntegralNonexistence/sources.toml`.

| Source id | Copy and evidence read |
| --- | --- |
| ES-HEAD | EnriquesSurfaces open-head README, E1a line 40, E1b line 48, E1c line 64, E1e line 94, E1f line 98; read using `roadmaps show`. |
| NERON-HEAD | NeronModelsAndSemistableAbelianVarietiesPartII open-head README: line 4058 (§2.9), line 4168 (§2.14), line 8706 (§3.11), line 8996 (§4.7), line 9020 (§4.8), line 9226 (§4.16), line 9268 (§4.17), line 9298 (§4.18), line 9555 (§5.8), line 9724 (surface rationality within §6.1), line 9893 (§7.4). |
| K3-HEAD | `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md` at its supplied head: line 224 (§1.1), line 253 (§1.2), line 267 (§1.3), line 733 (§6.0b and its proper-base restriction, fibre and Jacobian formulae). |
| WC-HEAD | WeilConjectures open-head README: line 1415 (numerical divisor descent), line 1451 (Enriques predicate/invariants), line 1520 (constant-Num surface count). |
| CC-HEAD | ComplexComparisonPartII open-head README: line 1972 (relative Picard representability), line 2008 (Picard–Brauer obstruction), line 2026 (finite Cartier-dual torsors). |
| AM-HEAD | AlgebraicModuliForArithmeticGeometry open-head README: line 9489 (relative Picard classes), line 9541 (rigidified representatives). |
| IG-HEAD | InverseGaloisAndArithmeticFundamentalGroups open-head README, IG.0.3 line 652: finite monodromy, normality and the nodal-curve counterexample. |
| ML-Unramified | `Mathlib/NumberTheory/NumberField/ExistsRamified.lean` at the Mathlib pin, line 57: finite, unramified, domain and faithful ℤ-action hypotheses. |
| ML-Hensel | `Mathlib/NumberTheory/Padics/Hensel.lean` at the pin, line 445 (included strict inequality), line 459 (root, neighbourhood uniqueness and derivative norm). |
| ML-Basis | `Mathlib/LinearAlgebra/StdBasis.lean` at the pin, Pi.basisFun line 120. |
| ML-Differentials | `Mathlib/RingTheory/Kaehler/Basic.lean` at the pin, KaehlerDifferential line 148. |
| TC-Lattice | `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean` at the Tau Ceti pin: line 63 (carrier, form, isLattice, isSymm, le_dual), line 156 (integral form), line 261 (Gram constructor), line 295 (basis pairing). No nondegeneracy field is present. |
| TC-Lattice-Examples | `TauCeti/LinearAlgebra/IntegralLattice/Examples.lean` line 83; `RootLattice/D8Plus/Basic.lean` line 164; `Orthogonal/Sum.lean` line 84; `Scaling.lean` line 261, all relative to the same integral-lattice directory at the pin. |
| TC-Quadratic | `TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Quadratic.lean` line 122 and line 129: the native half-norm, with no new discriminant map here. |
| TC-Overlattice | `TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.lean` line 347: even intermediate carriers versus isotropic subgroups. |
| TC-Picard | `TauCeti/AlgebraicGeometry/LineBundle/Class.lean` line 50; `CartierDivisor/Picard.lean` line 75; `WeilDivisor/Scheme/PicZero.lean` line 75 and line 88; `PicardFunctor/Rigidified.lean` line 66. Their namespace is TauCeti.AlgebraicGeometry. |
| TC-Duality | `TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean` line 271. |
| TC-Dyadic | `TauCeti/NumberTheory/Padics/SerreSigns.lean` line 194 and line 219; `TauCeti/NumberTheory/LocalField/UnitSquareClasses.lean` line 203; `SquareClass.lean` line 128; `Padic.lean` line 181; `WorkedExamples/UnramifiedQuadratic.lean` line 80. |
| SCH23 | arXiv v3 PDF, matching the package SHA-256. Text extraction line 248 (contraction descent), line 331 (graph descent), line 1755 (matrix (14)), line 1845 (matrix (16)). The displayed matrices and proof steps were read. |
| DI21 | arXiv v2 PDF, matching the package SHA-256. Text extraction line 470 (one-obstruction regularity), line 485 (flatness/characteristic-zero distinction), line 645 (finite-local-group nonlifting), line 690 (Picard-flatness use), line 822 (differential criterion). |
| Fontaine | Preprint 91-02 scan: cover and printed page 3/PDF page 4 inspected as images. Theorem 1 and Remark (a) explicitly allow separate smooth proper Z_p-models. Download SHA-256: `3a0d2b7a95db090438b43a86040d92b748e351a6461257dd083151864f33dc67`. |
| Lang1983 | GDZ PDF, matching package SHA-256; printed p. 62, Theorems 4.1–4.2, inspected as an image. The scan’s hidden page-label text disagrees with the printed pagination; the printed page is PDF page 19. |
| ESB21 / MMV22 / EHS12 | Legal arXiv copies and package locators: ESB21 §2, Proposition 3.16, Theorem 4.2 and Corollary 4.3; MMV22 Definition 1.1, Theorem 1.2, Remarks 1.4–1.5 and §2.1; EHS12 Proposition 4.2 and Corollary 4.3. |

The source line numbers for extracted PDFs depend on the extraction; printed page/theorem locators in the README are the stable locators. The version-specific CDL2021/2024 locators and the CD89 and LLR04 published locators remain as accepted; this port does not claim a new text certification of their full proofs. Mathlib/open-Zulip searches revealed no additional usable Enriques interface; no claim about unindexed open work is made.

## Changes following the upstream mathematical reading

1. Added the EnriquesSurfaces ownership boundary and exact E0–E1f contract. Characteristic-not-two geometry is imported; the same general conclusions are assembled with the characteristic-two variants, including the finite-Witt-extension theorem. This does not discard the source's wider generality.
2. Deleted the repeated graph-descent and geometric Kodaira targets and repaired their consumers. Retained the distinct residue-field isomorphism target.
3. Added the exact integral-local-system monodromy supplier and its normality hypothesis in §3.2.
4. Rephrased all absent-declaration API labels as prose while preserving every API fact. Strengthened the extra-special graph Checks with vertex/edge/cycle-rank values and the dyadic Checks with valuation/residue and x=0 controls.
5. Expanded the numerical extension contract with source/target, quotient and pullback laws and three discriminating Checks. These are extensions commissioned by the accepted review, not purported base-roadmap declarations.
6. Recorded the pinned eight-square-class cardinality as a supplier, and the absence of nondegeneracy from the native lattice structure. No lattice or local-field theory is redefined.
7. Reflowed the Lean docstring to avoid a declaration-scanner false positive. There is no theorem named `lack`: the supplied signature transcript parsed the sentence beginning “theorem lack” inside the module comment. This also explains its reported unknown identifier.

No false numerical identity was found in the retained statements. The audit does not prove the source classification obligations or the six admitted headlines.

## Lean retention and elaborated binders

Nothing moved from the accepted Lean file into the README during this port. Its six definitions and six headline theorems already satisfy the acceptance-file rule. No declaration, theorem type, definition body or import was changed; only two module-comment lines were reflowed. The matrix symmetry proofs remain inline constructor arguments. Existing README API facts and Checks were retained as prose.

A single scratch module containing `#check @name` for all **12 actual declarations** was elaborated successfully against the final built module. Each output type was compared with its README statement. No binder was lost: the positive-cone theorem retains h,d, both positive-square conditions and the positive h-pairing; the dyadic theorem retains x≠0; the four discriminant headlines concern the actual fixed native lattices, with evenness existentially asserted in the two isotropy statements. The definitions have concrete native carriers and bodies. No type change was necessary. The first probe reproduced the supplied transcript's spurious `lack` error; the corrected probe has zero errors.

## Adversarial mathematics pass

Rows cover every numbered target, each definition and its API, conventions, supplier-extension claims and the Lean headlines. Computations on hypothetical configurations are necessary consistency/negative controls, not proofs that such configurations exist or proofs of their exclusion. “Retained” in the change column means the accepted statement was unchanged; every such row still records computed values.

| Statement | Instances tried | Values computed on both sides | Result | Change |
| --- | --- | --- | --- | --- |
| Geometric surface convention | Enriques, K3, abelian surface | χ(O)=1,2,0 respectively; only 1 meets the supplier Enriques condition | separates objects | retained |
| Algebraic-space family convention | constant family, empty base | geometric fibres χ=1; empty base has zero fibres and zero obstruction groups | empty base allowed | retained |
| Full versus numerical Picard | ℤ¹⁰⊕ℤ/2 and ℤ¹⁰⊕α₂ | numerical ranks 10,10; torsion geometric-point counts 2,1 | conditions distinct | retained |
| Half/full convention | partner F,F′ | F·F′=1; (2F)·(2F′)=4 | factor four | retained |
| Intersection sign | U basis and root | e²=f²=0, e·f=1, (e+f)²=2; r²=−2 | fixes sign | retained |
| Discriminant convention | norms −2,−1,0,2 | half-norm mod 1 equals 0,1/2,0,0 | three nonzero classes need not all be isotropic | retained |
| Frobenius/Tate convention | q=2 divisor class | untwisted multiplier 2; twist(1) multiplier 2·1/2=1 | fixes direction | retained |
| Fibre labels | I₂ and Ĩ₂ over F₂ | two component vertices each; rational points 4 versus 6 | graph is not branch splitness | retained |
| Native lattice supplier | zero 1×1 Gram versus U | determinant 0 versus −1; finite discriminant only in second nondegenerate case | constructor does not assert nondegeneracy | clarified |
| Numerical quotient/contraction extension | split and nonsplit quadrics | geometric rank 2 each; invariant ranks 2 versus 1; ruling pairing U | constancy premise necessary | API and Checks added |
| Numerical family base change | constant α₂ over dual numbers | quotient rank 10; group algebra k-length 4=2·2 | infinitesimals retained | Check added |
| Picard-flatness extension | coherent pairs (0,0),(1,1) | 2(h¹−h²)=0 in both, equal to b₁=0 | h²=0 cannot replace equality | external contract retained |
| Finite-local-group W₂ obstruction | α₂ and its order-two Oort–Tate parameters | parameters both in (2) give ab=0, whereas required 2≠0 mod 4 | α₂ application consistent | external contract retained |
| General α_(p^n) binomial obstruction | p=2,n=1,2 and p=3,n=1 | coefficients 2,6,3 have valuation 1, nonzero mod 4,4,9 | coefficient survives | external contract retained; no uniqueness-of-scheme-lift inference |
| One-obstruction regularity | f=p and f=p−t² | both regular of dimension 1; reductions k[[t]] and k[[t]]/(t²), embedding dimensions 1,1 and dimensions 1,0 | regularity does not imply W-flatness | retained |
| Differential W₂ criterion | exceptional classical and C=0 | h⁰(L)=h⁰(L⊗ω)=1 and L·H=2C·H>0; at C=0 product 0 | positivity excludes trivial conductrix | retained |
| Fontaine extension | P² and a hypothetical everywhere-good K3 | h²(O)=0 versus 1; required off-diagonal value 0 | local-model formulation sufficient | scan verified |
| §0.2 Picard length/generator | characteristic-two μ₂,α₂,ℤ/2 | scheme lengths 2,2,2; points 1,1,2; canonical orders 1,1,2 | points do not measure length | other characteristics supplied |
| §0.3 coherent invariants | classical and nonclassical | (h¹,h²)=(0,0),(1,1); χ=1−h¹+h²=1 | bound and equality consistent | other characteristics supplied |
| §0.4 numerical lattice | U⊕E₈(−1) | rank 2+8=10, determinant −1, signature (1,9) | even unimodular indefinite domain | characteristic-two extension distinguished |
| §1.1 half-fibre definition | F,2F,0 for full fibre 2F | doubles 2F,4F,0; only first equals full fibre | wrong models rejected | prose API retained |
| §1.2 nodal/two-section predicates | R²=−2, partner F′²=0, conjugate pair | adjunction genera 0,1; full degrees 2,2; conjugate-pair square −2−2+2=−2 but two geometric components | geometric integrality and degree independent | retained |
| §1.3 canonical-type pencil | primitive F and full 2F | squares 0,0; linear systems use divisor coefficients 1 versus 2 | full/half alternatives kept | retained |
| §1.4 nef primitive criterion | F,2F,0 | squares all 0; primitive multipliers 1,2,0; only nonzero primitive F qualifies | both directions distinguish scale | retained |
| §1.5 nodal reflection | D=F+R, F²=0,R²=−2,F·R=1 | D²=0,D·R=−1; reflected D−R=F has square 0, coefficient removed 1 | norm preserved, effectivity maintained | characteristic-two extension distinguished |
| §1.6 pencil existence | primitive U class e | e²=0, (2e)²=0, pairing with partner 1 versus 2 | primitive class must precede doubling | other characteristics supplied |
| §1.7 double fibres | smooth and IV* half-fibres | primitive gcd 1 becomes gcd 2; central IV* coefficient 3 becomes 6 | multiplicity two is not reduction | retained |
| §1.8 integral two-section | rational R and partner half-fibre F′ | degrees 2,2; squares −2,0 | both branches retained | retained |
| §1.9 classical equivalence | classical and ordinary characteristic two | (ord ω,h¹,number multiple fibres)=(2,0,2),(1,1,1) | four classical conditions agree on controls | retained |
| §1.10 tame canonical formula | F₁,F₂ | 2(F₁−F₂)=2F₁−2F₂=0; F₁−F₂ nonzero has order 2 | order-one substitute rejected | other characteristics supplied |
| §1.11 tame half-fibre types | ordinary E, supersingular E, G_m in char 2 | rational 2-torsion sizes 2,1,1 | nontrivial normal bundle excluded in last two | retained |
| §1.12 ordinary type | μ₂ versus α₂ on same local ring | Δε has coefficients (1,1,1) versus (1,1,0); dual points 2 versus 1 | Hopf structure distinguished | retained |
| §1.13 classical type | k×k versus k[ε]/ε² | points 2 versus 1; identity tangent dimensions 0 versus 1 | local model rejected | retained |
| §1.14 supersingular type | α₂ and μ₂ | mixed coproduct coefficient 0 versus 1; Cartier dual α₂ versus ℤ/2 | type/dual separated | retained |
| §1.15 local canonical cover | classical,supersingular,ordinary | group ranks 2,2,2; geometric group-point counts 1,1,2 | ordinary étale case excluded | retained |
| §1.16 cover cohomology | local canonical cover, trivial disjoint cover | χ=1−0+1=2; h⁰=1 versus 2 | connected canonical object required | retained |
| §1.17 conductrix | multiplicities m=0,1,2 | pullback ideal orders 0,1,2 versus doubled 0,2,4 | C rather than 2C determined | retained |
| §1.17 biconductrix | C=0 and local t=0 | empty H¹=0; k[t]/t² has basis 1,t whereas k[t]/t has basis 1 | scheme structure essential | retained |
| §1.17 exceptionality | exceptional T₂,₃,₇ and its reduction | C²=−2,(2C)²=−8, χ(O_(2C))=4; h⁰−h¹=5−1=4; reduced tree h¹=0 | line-bundle/subscheme/reduction distinct | retained |
| §1.17a differential sequence | nonzero C | coefficient 2C=2 versus C=1; length W=12−8=4 | Frobenius square and finite ideal necessary | retained |
| §1.18 special-double characterization | IV*,III*,II* with rational bisection | exceptional types (3,3,3),(2,4,5),(2,3,7); half/full bisection intersections 1 and 2 | both directions carry specialness | retained |
| §1.19 quasielliptic restriction | simple/double III*,II* | primitive component counts 8,9 unchanged by factor 2; each implies exceptional value 1 | nonexceptional value 0 excludes both | retained |
| §1.20 special multiple restriction | rational and square-zero two-sections | full degrees 2 each; arithmetic genera 0 versus 1 | only first is special rational bisection | retained |
| §1.21 extra-special graph | arms 1,2,6; one extra vertex; one extra edge | (V,E,cycle rank)=(10,9,0),(11,10,0),(10,10,1) | only exact whole tree accepted | Checks strengthened |
| §1.22 extra-special implies exceptional | whole T₂,₃,₇ | ten curves contain same ten-vertex configuration; exceptional h¹(O_(2C))=1 versus 0 at C=0 | implication uses contained graph only | retained |
| §1.23 partner theorem | nonexceptional versus affine E₈ exception | pair intersections 1 and full 4; exceptional type has one pencil, giving zero distinct partners | exception necessary | retained |
| §1.24 nonexceptional partner | F·F′=1 | (2F)·(2F′)=4·1=4 | no full/half confusion | retained |
| §1.25 distinct-pencil bound | F′=F, F′=2F, primitive partner | intersections 0,0,1; second candidate nonprimitive; partner full intersection 4 | equality-zero branch gives same pencil | retained |
| §1.26 effective reducibility | D=0 and positive square 2 | 0 excluded; for e+f, 2=0+0+2·1 | no false zero-divisor split | retained |
| §1.26 native numerical model | e,f,r,e/2 | norms 0,0,−2,0; pairing (e/2,f)=1/2, so e/2 not integral carrier | native carrier necessary | retained |
| §1.26 positive-cone headline | h=e+f, d=e+f and d=2e+f+r | squares 2,2; pairings 2,3; summand squares (0,0) in both, h-pairings (1,1),(1,2) | nonzero positive-pairing summands | retained |
| §1.26 cone negative control | d=−e−f and 0 | squares 2,0; h-pairings −2,0, incompatible with sum of positive pairings | explicit hypotheses necessary | retained |
| §1.26 generic coset application | index-two generic curve | horizontal degrees at least 2; two horizontal summands give ≥4 instead of 2; vertical restriction degree 0 | generic class preserved | retained |
| §2.1 family | constant Y, dual-number restriction, P² | b₂=10,10,1 and χ=1,1,1 | χ alone insufficient | retained |
| §2.2 universal functions/Picard space | proper connected fibre and empty base | H⁰=k, extension k⊗K=K; empty sheaf groups 0 | no Pic^τ-flatness premise | retained |
| §2.3 relative invariants | flat α₂_R and R[t]/(t²,εt) | both special lengths 2; total k-lengths 4 versus 3 | constant fibre length insufficient | retained |
| §2.4 canonical family | nonempty classical fibre and empty base | edge of trivial torsor 0 versus nonzero inclusion; empty case 0=0 | nonempty qualification necessary | accepted control retained |
| §2.5 Leray obstruction | section and empty base | s*f*=1; empty exact row all 0; δχ maps to 0 | obstruction is coefficient-specific | retained |
| §2.6 injective criterion | zero kernel versus nonzero kernel | δχ∈ker f*={0} gives δχ=0; nonzero kernel could contain value 1 | injectivity used | retained |
| §2.7 section criterion | a∈H² | s*f*(a)=a; at a=0 output 0 | retraction gives kernel 0 | retained |
| §2.8 étale torsion cover | ω of order 2 | odd product source exponent −1−1=−2; multiplication ω⁻²→O has exponent 0 target | direct ω²→O has wrong source | retained |
| §2.9 twisting | classes a,0,−a | a+0=a and a+(−a)=0; H¹=0 gives one cover class after existence | freeness/transitivity consistent | retained |
| §2.10 numerical constancy | split local torsion; real sign descent | quotient rank 10; real fixed rank 9 when e₁↦−e₁ | constant geometric rank not constancy | retained |
| §2.10 full constancy | torsion ℤ/2,α₂,μ₂ in char 2 | geometric points 2,1,1; only first agrees with constant full scheme | nilpotents cannot be erased | retained |
| §2.10 splitness/iff | standard split and real shear descent | σ²(e₁)=e₁+2τ=e₁; σ(e₁+aτ)−(e₁+aτ)=τ≠0 for a=0,1 | invariant quotient need not split | retained |
| §2.11 cover classification | Pic(R)=0 | Kummer terminal term 0; units u and uv² have equal class; over ℤ[1/2] classes 4 | Brauer premise kept separate | retained |
| §2.12 canonical order | constant étale torsion versus ordinary type | ω orders 2 versus 1; ordinary Pic^τ has one point | full constancy needed | retained |
| §2.13 class descent | L,L⊗ω | equal Num class; difference ω of order 2, square ω²=O | uniqueness modulo ω | retained |
| §2.14 nodal descent | degree-one genus-zero bundle, nonsplit conic | degree lattice ℤ versus 2ℤ; h⁰(O_P¹(1))=2 | degree-one class splits conic | retained |
| §2.15 pencil descent | rational half-fibre base divisor, nonsplit conic base | base degree 1 versus minimum 2 | P¹ conclusion uses degree one | retained |
| §2.16 rational tame fibres | individually descended half-fibres | two degree-one points give 1+1=2; conjugate pair has one degree-two closed point | individual descent stronger than invariant sum | retained |
| §2.17 residue-field existence | primitive isotropic class | F²=0; full class 2F; partner full pairing 4 | descent supplies same pencil | retained |
| §2.18 finite-field descent | k=F₂,F₄ | Pic(k)=0 and Br(k)=0 in each | no integral model assumed | retained |
| Supplier replacing §2.19 | reducible fibre over F₂ | purely inseparable finite residue degree 1; separable degree 2 excluded | exact supplier domain | duplicate deleted |
| §3.2 integral Num/count | q=2,3,4 | 1+10q+q²=25,40,57; finite étale connected ℤ-domain rank 1 | count independent of full Picard | monodromy supplier added |
| §3.3 local projectivity | section and doubled numerical class | Brauer pullback retraction 1; 2τ=0; positive ample square a becomes 4a>0 | no general Brauer vanishing | retained |
| §3.4 local canonical cover | hypothetical μ₂ Picard branch | #Y(F₂)=25>0; dual group ℤ/2 has rank 2 and 2 points | section before full constancy | retained |
| §3.5 four global twists | ±2^n and 5 | sign/parity give 2·2=4; 2·2=4 square; 5 not a unit | global/local classes distinct | retained |
| §3.6 representative definition | eight bit triples in lexicographic order | 1,5,2,10,−1,−5,−2,−10, all nonzero | correct exponent ordering | Checks strengthened |
| §3.6 square-class headline | valuation parity and unit residue | 2 choices times residues 1,3,5,7 gives 8; x=0 gives 8 witnesses rather than unique 1 | nonzero binder necessary | native count cited |
| §3.7 twist identity | same eight triples | both sides 1,5,4,20,1,5,4,20; twists 1,1,2,2,−1,−1,−2,−2 | identity recomputed | retained |
| §3.8 difference class | c=5 and −10; equal covers | exponent triples (0,0,1),(1,1,1); equal-cover difference 1 | uniqueness in square-class quotient | retained |
| §3.9 removal/unramified model | c=−10,2; polynomial mod 2 | products 20=5·2² and 4=2²; z²+z+1 values at 0,1 are 1,1, derivative 1 | ramified factors removed | retained |
| §3.10 étale K3 cover | ordinary type and trivial disjoint cover | χ=2, h⁰=h²=1 yields h¹=0; disjoint cover h⁰=2 | canonical connectedness matters | characteristic-two extension distinguished |
| §3.10a fundamental group | ordinary,classical,supersingular | Hom(μ₂,Pic^τ) nonzero counts 1,0,0; cover degree d=χ≤2 gives group orders 2,1,1 | no K3 simple-connectivity circle | retained |
| §3.11 good local models | remaining b=0,1 | corrected difference classes 1 or 5; local unramified twist removes b, yielding 1 | Q₂ isomorphism retained | retained |
| §3.12 extension splitting | n=0,1,2 | n=0 gives zero section; chosen lifts project to 1 and (1,0),(0,1) | free/commutative hypotheses sufficient | retained |
| §3.13 full Picard over ℤ | two Oort–Tate branches | μ₂ branch would give h²(O_K3)=1 versus required 0; étale branch torsion points 2 and free rank 10 | independent contradiction route | retained |
| §4.1 Jacobian adapter | index-two torsor and quasielliptic compactification | torsor K-points 0, Jacobian identity 1; affine h⁰ dimension ∞ versus proper dimension 1; section degree 1 forces multiplicity 1 | carriers distinct | retained |
| §4.2 rationality | χ=0,1,2 Jacobians | h¹=1,0,0; second plurigenus 0,0,1; χ=1 gives R¹=O(−1), ω=f*O(−1) | section alone insufficient | retained |
| Supplier replacing §4.3 | torsor fibre 2F and Jacobian primitive F | scheme gcds 2,1; same primitive Kodaira components | multiplicity separated | duplicate deleted |
| §4.4 simple fibre | split I_n and IV over F₂ | each P¹ has 3 points; remove ≤2 giving ≥1, or 1 giving 2 | smooth point survives without terminal graph vertex | retained distinct F₂ isomorphism |
| §4.5 nonrational fibre | degree-two base point | residue degree 2 separable; reducibility would require purely inseparable degree 1 | contradiction 2≠1 | supplier links repaired |
| §4.6 Jacobian I₀* | central component | required 4 attachments versus 3 rational points | 4>3 | supplier links repaired |
| §4.7 semistable graph | split/nonsplit I₂ | component counts 2,2 and rational counts 4,6 | vertex graph does not split nodes | retained |
| §4.8 rational-fibre restriction | three rational base points and two tame multiple points | 3−2=1 remaining semistable/supersingular possibility | ordinary/additive distinction retained | retained |
| §4.9 MW descent | generic divisor degree 2m | subtract m·T of degree 2m, remainder degree 0; Br(F̄₂(t))=0 | square-zero T works | retained |
| §4.10 auxiliary count | I₁*,E₄,I₄ | 2·6+1=13,4,2·4=8; sum 25 | actual J count used after constancy | retained |
| §4.11 constant Jacobian Picard | rational rank-ten J | maximal count 1+20+4=25 agrees with auxiliary 13+4+8 | all six supplier premises listed | retained |
| §5.1 fourteen elliptic triples | every displayed row | totals respectively 19+4+2,19+2+4,17+4+4,17+2+6,17+4+4,15+3+7,15+5+5,19+4+2,13+4+8,13+5+7,16+4+5,15+4+6,17+4+4,15+4+6; all 25 | count consistent, not completeness proof | retained |
| §5.2 quasielliptic sum | three rational fibres | 10=2+Σ(r−1)=Σr−1 gives Σr=11; type counts 1,2,7,8,9,9 | multiplicity not component count | retained |
| §5.3 quasielliptic triples | all four rows | 9+1+1=11,8+2+1=11,9+1+1=11,7+2+2=11; wrong 7+2+1=10 | two nine-component symbols distinct | retained |
| §5.4 forced multiplicities | one semistable fibre among three | scheme multiplicities 1,2,2; simple count 1 and double count 2 | combinatorial control | retained conditional completeness |
| §5.5 simple III* | three elliptic III* rows | semistable rows consume one simple place; E₄+E₄ leaves two ordinary multiple places | only III*+E₄+E₄ allows simple III* | retained |
| §5.6 rational bisection exclusion | R·F=1 | R·2F=2; R²=−2 versus square-zero R′²=0 | specialness cannot be inferred from degree only | retained |
| §5.7 three additional exclusions | I₂*,I₃*,IV* additions | 15+4+6=25,17+4+4=25,15+4+6=25 | point count cannot exclude them | indispensable proof targets retained |
| §5.8 descended partner | F·F′=1 | full pairing 4, unchanged under extension F₂→F̄₂ | descent preserves intersection | retained |
| §5.9 I₈ exclusion route | generated I₃ and I₇ cycles | component counts 3,7; neither a permitted I₈ replacement in fourteen-plus-four list | route conditional on exhaustive list | retained |
| §5.10 II* exclusion route | weight-one tip versus second weight≥2 | partner intersection 1 versus lower bound 2 | 2>1 | retained |
| §5.11 multiple I₄* route | generated I₀* | four rational attachments needed, three available | 4>3 | retained |
| §5.12 IV* route | III/IV other half-fibre versus smooth E₄ | rational component branch needs 4>3; smooth E₄ has 4 points and no rational-component contradiction | additional branch separate | retained |
| §5.13 IV route | adjacent labels 2 and 1 | intersection lower bound 2+1=3 versus upper bound 2 | 3>2 | retained |
| §5.14 residual list | fourteen elliptic/four quasielliptic candidates | 14→5,4→3, residual 5+3=8 | depends on three extra exclusions | retained |
| §5.15 residual multiplicities | I₁*,I₄*,semistable | respective allowed gcds 2,1,1 | primitive symbol separate from gcd | retained |
| §6.1 firstGram | all 100 matrix positions | A−Aᵀ=0; entries (8,3)=1,(8,9)=1,(9,9)=0; det −4 | source matrix (14) inverse recovered | retained |
| §6.1 secondGram | all 100 matrix positions | A−Aᵀ=0; (8,3)=0,(8,8)=0,(8,9)=1,(5,6)=(5,7)=1; det −4 | D₈(−1)⊕U | retained |
| §6.1 firstLattice | e₁,e₁/2,e₁+e₂,−2e₁ | norms −2,−1/2,−2,−8; only half-integral vector outside carrier | full ℤ-carrier fixed | retained |
| §6.1 secondLattice | same four vectors | norms −2,−1/2,−2,−8; coordinate 1/2 outside ℤ | independent carrier control | retained |
| §6.2 first discriminant headline | quotient of exact inverse lattice | determinant −4, mod-2 rank 8, inverse denominator 2; four classes killed by 2 | (ℤ/2)², not ℤ/4 | retained |
| §6.2 first isotropy headline | all four quotient classes | q-values 0,0,0,1/2; zero count 3 | even half-norm convention | retained |
| §6.2 geometric index/dual entries | Num unimodular; selected inverse entries | index²=4 gives index 2; diagonal −1,−2,−2,0,−2 and cross 0,2,1 | all source values agree | retained |
| §6.3 second discriminant headline | quotient of second inverse lattice | determinant −4, mod-2 rank 8, inverse denominator 2; class order 4, exponent 2 | (ℤ/2)² | retained |
| §6.3 second isotropy headline | all four quotient classes | q-values 0,0,0,1/2; zero count 3 | U adds no discriminant | retained |
| §6.4 generic Pic⁰ quotient | degree 2m line bundle, index-two lattice | subtract (L·F)T=mT gives 2m−2m=0; quotient order 2 versus infinite degree factor 2ℤ | Pic⁰ necessary | retained |
| §6.5 generating two-section | nonzero quotient class | order 2; horizontal degree 2 versus minimum 4 for two horizontals; allowed even squares −2,0 | generic class preserved | retained |
| §6.6 spinor incidences | all fifteen weighted-degree-two D₈ vectors | 5 interior+4 double tips+6 tip pairs=15; four spinor pairs survive, two per class | zero/vector classes excluded | retained |
| §6.7 square calculation | n=0,1,2 | dual-square outputs 0,2,4 equal 2n | square zero forces n=0 | retained |
| §6.8 first forbidden graph | residual integral half-fibre | two smooth rational points available; two partner intersections plus R require three | 3>2 conditional incidence contradiction | retained |
| §6.9 independent opposite tips | hits C₀,C₈ | weighted sum 1+1=2; I₀* completion needs 4>3 attachments | no use of second forbidden graph | retained |
| §6.10 second forbidden graph | R·C₀=2,R·C₂=1 | weighted full intersection 2·1+1·2=4 | matches distinct-pencil bound | retained |
| §6.11 D₈ incidence orbits | all 3⁹ bounded vectors | fifteen solutions; orbit sizes 2,2,1,2,4,4 sum 15 | bound a_i≤2 follows from weights≥1 | retained |
| §6.12 I₄* exclusion | all six orbits | six representatives cover 15 vectors; fork case requires 4>3 points | coverage control only | retained |
| §7.1 multiple III* exclusion | partner half-fibres | required pairing 1 versus forced 2 | contradiction preserves half normalization | retained |
| §7.2 E₇ incidence orbits | all 3⁸ bounded vectors | six solutions; orbit sizes 2,1,2,1 sum 6 | correct fixed C₂ branch | retained |
| §7.3 simple III* exclusion | middle/double-tip branches | full intersections ≥8 versus bound 4; final 2 versus minimum 4 | 8>4 and 2<4 | retained |
| §7.4 restricted configurations | arbitrary characteristic partner pencils | full pairing 4 from 1·2·2; forbidden generated pencil gives 2<4 | no universal char-two inference | retained |
| §8.1 tangent cohomology | both types | 0−10+0=−10; 1−12+1=−10; h¹=10+2h⁰ gives 10,12 | sign fixed | retained |
| §8.2 supersingular nonlifting | Pic⁰=α₂ | tangent dimension 1,b₁=0; Oort–Tate product 0 versus 2 mod 4 | differential exact-order-two theorem inapplicable | retained |
| §8.3 lifting iff | unobstructed,classical exceptional,supersingular | h²(Θ)=0,1,1; exceptional h⁰(L)=h⁰(L⊗ω)=1; supersingular ordω=1 | three branches distinct | retained |
| §8.3a finite Witt extension | W[[t₁,…,t₁₀]]; V with π²=p | dimension 11; π↦pa in W₂ gives π²↦0≠p | ramified lift does not imply W₂ lift | non-two case supplied |
| §8.4 miniversal ring | unobstructed versus one-relation | dimensions 1+10=11 and 1+12−1=12; relation p alone would kill p | independent characteristic-zero input required | retained |
| §8.5 modulo-four obstruction | Z/4→W₂(F̄₂) | image 2≠0, square 4=0; thickening length 2 | retains mixed characteristic | retained |
| §8.6 finite-field endpoint | eight residual rows | remove 2 I₄* and 4 III* rows, leaving 2 globally restricted configurations | conditional route count | retained |
| §8.7 integral endpoint | hypothetical ℤ-family | F₂ count 25, torsion points 2; Z/4 gives nonexceptional lift; endpoint available only after classifications | independent routes assemble | retained |

The following rows separate the individual API laws of the definitions from the target-level controls above. They are still mathematical checks in prose, not Lean declarations or proposed padding.

| API statement | Instances tried | Values computed on both sides | Result | Change |
| --- | --- | --- | --- | --- |
| Half-fibre data retains multiplicities | double IV* | primitive central coefficient 3; full coefficient 6=2·3; reduced candidate gives 2 | determines divisor | prose label |
| Half-fibre base change | identity extension; algebraic closure | coefficient 3 pulls back to 3; equality coefficient 6=6 persists | equality retained | prose label |
| Half-fibre square | smooth double fibre | (2F)²=0=4F² gives F²=0 in ℤ | correct square | prose label |
| Half-fibre intersection | R·F=1; D=0 | R·2F=2=2·1; 0·2F=0=2·0 | bilinearity | prose label |
| Half-fibre extensionality | same divisor/base point, alternative equality proof | divisor coefficients (1,3) versus (1,3), base degree 1 versus 1 | proof choice changes no data | prose label |
| Half-fibre twice equality | primitive and doubled candidate | 2F has central 6; 2(2F) has central 12 | wrong scale rejected | prose label |
| Nodal-curve geometric condition | integral curve becoming two conjugate components | geometric component count 2≠1 despite square −2 | geometric integrality required | prose label |
| Two-section degree condition | R·F=1 or 2 | degrees R·2F=2 or 4 | four-section rejected | prose label |
| Two-section half-degree | degree two curve | 2=2(R·F) gives R·F=1 | no factor-two loss | prose label |
| Nodal-curve base change | P¹ and conjugate pair | geometric components 1 versus 2 remain 1 versus 2 after closure | preservation/reflection domain | prose label |
| Two-section iff intersection | degrees 0,2,4 | full intersections 0,2,4; half intersections 0,1,2 | equivalence both ways on controls | prose label |
| Ordinary type predicate | μ₂ and α₂ | mixed coproduct coefficient 1 versus 0 | algebra alone insufficient | prose label |
| Ordinary Cartier dual | μ₂ | dual ℤ/2 has two points and zero identity tangent | local/étale reversed correctly | prose label |
| Ordinary base change | identity and algebraic closure | group length 2→2, mixed coefficient 1→1 | type retained | prose label |
| Classical type predicate | constant ℤ/2 and μ₂ | points 2 versus 1; tangent dimensions 0 versus 1 | distinguishes schemes | prose label |
| Classical Cartier dual | ℤ/2 | dual μ₂ length 2, one point, tangent dimension 1 | not an étale cover group | prose label |
| Classical base change | algebraically closed extension | points 2→2, tangent 0→0 | type retained | prose label |
| Supersingular type predicate | α₂ and μ₂ | primitive coproduct mixed coefficient 0 versus 1 | wrong Hopf law rejected | prose label |
| Supersingular Cartier dual | α₂ | length 2 and tangent dimension 1 on both sides | self-duality | prose label |
| Supersingular base change | algebraically closed extension | primitive coefficient 0→0; length 2→2 | type retained | prose label |
| K3-like cover object | canonical and trivial local torsor | edge character inclusion versus 0; inclusion nonzero on group length 2 | trivial torsor rejected | prose label |
| K3-like base change | identity and field extension | edge inclusion maps to inclusion, rank 2→2 | construction relation retained | prose label |
| K3-like degree | classical and supersingular | Hopf algebra dimensions 2,2 | finite-flat rank two | prose label |
| K3-like universal homeomorphism | μ₂/α₂ versus ordinary ℤ/2 | geometric group-point counts 1,1 versus 2 | radicial local case separated | prose label |
| Conductrix divisor | generic multiplicity 1 | conductor ideal order 1 versus wrong doubled order 2 | uniquely fixes C | prose label |
| Conductrix conductor identity | local parameter t | ideal (t) has order 1; pullback of O(−C) also order 1 | agrees with ideal normalization | prose label |
| Biconductrix divisor | local C coefficient 1 | doubled coefficient 2, ring nilpotent t has t²=0 | keeps scheme structure | prose label |
| Exceptional predicate | exceptional doubled conductrix, empty conductrix | h¹ values 1 and 0 | positive/negative controls | prose label |
| Conductrix uniqueness | equal pulled-back principal ideals | equal local orders m=m; competing 2m=m forces m=0 | faithful flat descent detects multiplicity | prose label |
| Biconductrix twice law | m=0,1,2 | coefficients 0,2,4 equal 2m | no reduced-support substitute | prose label |
| Extra-special predicate | whole tree; tree plus curve | 10 versus 11 vertices | whole collection matters | prose label |
| Extra-special isomorphism transport | permutation of the tree | vertex/edge counts 10/9 on both sides; cycle ranks 0/0 | graph invariants preserved | prose label |
| Extra-special curve count | arms 1,2,6 | 1+1+2+6=10 | exact count | prose label |
| Extra-special no-cycle law | T₂,₃,₇ and graph plus edge | cycle ranks 9−10+1=0 and 10−10+1=1 | extra edge rejected | prose label |
| Enriques family object | constant Y and P² | geometric b₂=10 and 1, although both χ=1 | no coarse-invariant stand-in | prose label |
| Family base change | k[t]→k[t]/t² | each geometric fibre unchanged, b₂ 10→10 | nonreduced bases included | prose label |
| Family isomorphism laws | identity and inverse | induced numerical matrices I₁₀ and A⁻¹A=I₁₀ | actual structure maps retained | prose label |
| Family smoothness | constant dual-number deformation | relative dimension 2 on every geometric fibre; absolute base has nonzero nilpotent ε²=0 | relative smoothness, not reducedness | prose label |
| Canonical family object | nonempty classical case and empty base | edge target inclusion≠0 versus 0=0 | empty canonical torsor allowed | prose label |
| Canonical section base change | μ₂ and its dual after extension | group ranks 2→2; inclusion source length 2→2 | section tied to inclusion | prose label |
| Canonical torsor pullback | identity extension; composition of two extensions | degree 2 in both orders; pullback coefficient identity 1·1=1 | same edge condition | prose label |
| Canonical-family isomorphism | equivariant identity and zero character | identity preserves χ; zero maps nonzero χ to 0 | arbitrary torsor map insufficient | prose label |
| Numerical constancy definition | standard rank-ten group; real sign descent | fixed ranks 10 versus 9 | wrong local system rejected | prose label |
| Full constancy definition | étale/local torsion | torsion points 2 versus 1 | scheme, not point-group criterion | prose label |
| Splitness definition | section n↦(n,0) | projection of (1,0) is 1; projection after zero map is 0 | zero section-map substitute rejected | prose label |
| Full constancy implication | standard extension | quotient rank 10, torsion points 2, projection-section composite 1 | all three outputs retained | prose label |
| Full constancy iff | split ℤ/2 and split α₂ extension | (constant Num,split,étale torsion)=(1,1,1) and (1,1,0) | converse needs all three | prose label |
| Four global twist objects | units 1,−1,2,−2 | four distinct sign/parity pairs (0,0),(1,0),(0,1),(1,1) | exact allowed base | prose label |
| Four-twist group law | u=2,v=2 and u=−1,v=−1 | products 4 and 1, each trivial square class | multiplication convention | prose label |
| Four-twist exhaustion | unit ±2^n for n=0,1,2 | exponents reduce 0,1,0; signs two choices | exactly four classes | prose label |
| Four-twist canonical law | original χ and twisted χ | difference is pulled-back base class with edge 0, hence χ+0=χ | canonical character preserved | prose label |
| Dyadic representative body | all bits 0, all bits 1 | 1 and −10 | real body, no abstract parameter | retained |
| Dyadic nonzero API | eight values | 1,5,2,10,−1,−5,−2,−10 all ≠0 | denominator safe | retained |
| Dyadic decomposition API | e=a=b=1; all bits 0 | −10=(−2)·5; 1=1·1 | exponent order fixed | retained |
| Dyadic unique-class API | unit residues and valuation bit | (parity,residue) gives 2·4=8 distinct labels | distinct from native count-only theorem | retained |
| Global twist body | (e,a)=(0,0),(1,0),(0,1),(1,1) | 1,−1,2,−2 | precisely global units | retained |
| Global twist nonzero | same four values | absolute rational values 1,1,2,2 all >0 | denominators safe | retained |
| Global twist cancellation | b=0,1 and a=0,1 | products 1,5,4,20 on both sides | square factor 2^(2a) | retained |
| Numerical model pairing API | e,f,r | B(e,f)=1; B(e,r)=B(f,r)=0; r²=−2 | sum and sign fixed | retained |
| Numerical model carrier API | e,f,e/2 | first two integer coordinates 1,1; half coordinate 1/2∉ℤ; rank 10 | real carrier not ambient vector space | retained |
| Numerical decomposition API | h=d=e+f | d=e+f; both summands nonzero, squares 0, pairings 1 | all conclusion clauses tested | retained |
| Jacobian model adapter | index-two smooth torsor | torsor has 0 rational points, Jacobian has identity 1 | object determined by Pic⁰ | prose label |
| Jacobian zero-section API | scheme fibre mF | section degree 1=m(C₀·F), so positive integer m=1 | no inherited double fibre | prose label |
| Jacobian generic-fibre API | quasielliptic Pic⁰ and regular completion | affine global-function dimension ∞, proper completion dimension 1 | compactification is distinct | prose label |
| Jacobian isomorphism API | identity fibration map | identity on Pic⁰ takes zero to zero, degree 1 | keeps marked generic identity | prose label |
| First Gram definition | R–C₄ edge and R–F edge | entries 1,1 and R²=−2,F²=0 | specified basis order | retained |
| Second Gram definition | F′–C₄ and F′–F | entries 0,1 and both added squares 0 | distinguishes matrices | retained |
| First lattice definition | standard integral coordinate basis | ten basis vectors in carrier; e₁/2 absent | full ℤ-span | retained |
| Second lattice definition | same basis | ten basis vectors in carrier; e₁/2 absent | full ℤ-span | retained |
| Gram symmetry API | all 100 positions per matrix | every A_ij−A_ji=0 | constructor proofs sufficient | retained |
| First determinant API | exact Gaussian elimination | det −4; inverse times matrix equals I in all 100 entries | nondegenerate | retained |
| Second determinant API | exact Gaussian elimination | det −4; inverse times matrix equals I in all 100 entries | nondegenerate | retained |
| First evenness API | basis norm and arbitrary coordinate form | diagonal entries −2 or 0, cross contribution 2a_ia_j | norm in 2ℤ | retained |
| Second evenness API | U vector e₉+e₁₀ and root e₁ | norms 2 and −2, both in 2ℤ | even indefinite form | retained |

## Unresolved accepted obligations

The accepted review explicitly keeps the six extensions below external to this package. The ownership search did **not** find their proposed Part II sections in the base roadmaps or other open roadmap folders. Their full mathematical contracts and consumers remain in the README; they are not represented as existing declarations. No later roadmap was added as a supplier, and no new folder or supplier file was edited.

| Contract | Named owner | Consumers |
| --- | --- | --- |
| numerical-contraction-descent | SchemeAndStackFoundations, Part II | §§2.3, 3.2, 3.3 and numerical contraction applications |
| picard-flatness-betti | AlgebraicModuliForArithmeticGeometry, Part II | §§2.3, 8.2 |
| finite-local-group-w2-nonlifting | FiniteFlatGroupsAndIntegralPadicHodgeTheory, Part II | §8.2 |
| one-obstruction-regularity | SchemeAndStackFoundations, Part II | §8.4 |
| differential-w2-nonlifting | SchemeAndStackFoundations, Part II | §8.3 |
| fontaine-low-degree-hodge | PadicHodgeTheory, Part II | §3.13 |

These assignments require concrete supplier extensions before the mathematical dependency specification is fully supplied. Preserving them follows the accepted review's explicit ownership decision; the green gate does not establish that those extensions exist. They remain submission concerns for the worker, rather than silently asserted resolved facts.

The exhaustive fourteen-case theorem remains a proof target of NeronModelsAndSemistableAbelianVarietiesPartII §7.4. The three additional Enriques configuration exclusions remain this roadmap's §5.7; point totals 25 do not prove them. These are mathematical work commissioned by the roadmap, not assertions that this port supplies their proofs. No fully general finite-group nonlifting proof is certified here: in particular, the numerical binomial control does not justify the source proof's asserted uniqueness of the underlying complete-intersection scheme lift.

No further implementation, binder, build or gate issue is unresolved.


Pull request: #1488 (roadmap/enriques-surfaces-and-integral-nonexistence at e3096fd)
