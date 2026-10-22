# Port report: AbelianSchemesAndArithmeticModuliPartII

- Branch: `roadmap/abelian-schemes-and-arithmetic-moduli-part-ii`.
- Head: `926aa5b25dda2304a38fc14d7a7a97b5f4d2b8b0`.
- Base: `a0af4de`; the initial worktree was clean.
- Commit message: `AbelianSchemesAndArithmeticModuliPartII: roadmap (README, Suggested.lean, metadata)`.
- Committed files: `TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md`, `TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/Suggested.lean`, and `TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/metadata.toml`.
- Final worktree: clean. No push, pull-request write, issue write or comment was performed. No Lean process remains running.

## Validation

The targeted module build exited 0. Its exact outcome line is:

```text
Build completed successfully (8976 jobs).
```

There are **22 warnings**, all reporting “declaration uses `sorry`”; there are no other warnings or errors. The final module has one `import Mathlib`, five real-bodied definitions/abbreviations, 22 admitted theorem signatures, six proved examples, and no admitted data. The examples test the invariant tensor, completion, character and annihilator definitions. Heavy geometric objects remain README targets.

A scratch binder probe, elaborated with the same permitted targeted build command, checked `#check @name` for all 22 admitted theorems. In particular the analytic-manifold instance, regularity, field/domain/DVR structures, scalar towers, finiteness instances, prime hypotheses and resultant nonvanishing guards remain in their elaborated types. The probe was removed before the final build and commit.

The pin check matches `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No pin or toolchain file changed. `git diff --check` and the staged whitespace check passed. Only the three target-folder files occur in the commit.

The full gate's exact summary is:

```text
gate AbelianSchemesAndArithmeticModuliPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 check-labels-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The gate requires a clean worktree, so its content checks were run before committing and the final clean-tree gate after committing. Both the content checks and the final gate pass.

The exact requested movable dependency-check output is:

```text
depcheck: 10 roadmaps, 91 edges, 0 problem(s)
```

There is no `UPWARD`, `CYCLE` or `moved:` line.

## Draft pull request body

Continue the abelian-scheme library from universal vector extensions, Poincaré geometry and arithmetic Hom groups to completed coefficient sheaves and moments, intrinsic Betti coordinates and degeneracy loci, and finite-field integral realizations. The roadmap connects these interfaces to curve-difference non-degeneracy, Tate and Honda–Tate classification at every prime, adelic lattice orbits and polarized counting. It includes the arithmetic, Hodge, Kuga and unitary-mass prerequisites needed to make those applications reusable, with explicit integral, small-characteristic and finite-level conventions.

AI assistance: Codex (GPT-6) performed the port, source and ownership checks, mathematical self-review and Lean signature validation.

## Dependencies still in pull requests

The following are new-roadmap dependencies at the supplied heads, cited in the roadmap by name and section:

- AbelianSchemesAndArithmeticModuli.
- AdelicAlgebraicGroups.
- AlgebraicModuliForArithmeticGeometry.
- ComplexComparisonPartII.
- DeligneWeightsAndPurity.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory.
- GeometryOfNumbersAndQuadraticArithmetic.
- JacobianChallengePartII.
- PELModuli.
- ShimuraVarieties.

DerivedModuleAlgebra, SchemeAndStackFoundations, AlgebraicVectorBundles, DifferentialGeometry, ClassFieldTheory, RepresentationTheory/SemisimpleAlgebras, Chebotarev, ImaginaryQuadraticClassNumber, JacobianChallenge, Completed/HodgeStructures and Completed/EffectiveBounds are consumed as main/completed roadmaps. None of the nine additional model heads is needed as a supplier.

## What moved from Lean to README

The elementary theory proofs `tensorSymmetricPower_mem` and `tensorSymmetricPower_diagonal` are now README API specifications; the invariant-submodule definition and its discriminating degree-zero, degree-one and nonfixed-tensor tests remain. The real proof needed to inhabit the all-unit tensor sequence is inline, with no admitted data.

The proved native-carrier boundary statements `compactLatticeImageLimit_rankZero` and `compactLatticeImageLimit_constant` are now the rank-zero and constant-map README Checks of `compactLatticeImageLimit`. Their mathematical statements remain; they are not standalone proofs about library matrices in the signatures file. `compactLatticeImageLimit_powers` remains a named theorem target.

`monicCoefficientLift` and `fixedResultantCongruence` were replaced by native supplier contracts, described below. No heavy construction or admitted datum was added to Lean. All remaining admitted signatures retain their original generality, and all existing discriminating proved definition examples remain.

## Supplier replacements and duplication sweep

The sweep covered every main and completed README, including sub-roadmaps, both pinned libraries by mathematical object, all nine supplied model heads, and all 308 supplied other open-roadmap records at their recorded heads. The main/completed pass covered 144 active README files and 12 completed README files. Object searches covered invariant tensors, divided powers, Poincaré coefficients, moments, Betti maps/forms, traces, torsion closures, Ax theorems, integral realizations, stable lattices, discriminants, unitary masses and the counting endpoints. Matching passages were read before deciding ownership.

- DerivedModuleAlgebra §0.DP.2 already states the free divided-power/invariant-tensor linear comparison. P0 consumes it and retains only shuffle-algebra compatibility, multigrading and degree completion. The own-word comparison statement, its generality and the nonflat boundary remain explicit in the supplier contract and the retained multiplicative variant. Roby line 2226 supports the comparison.
- Mathlib `Polynomial.lifts_iff_coeff_lifts` and `Polynomial.lifts_and_natDegree_eq_and_monic` supply monic lifting. The supplier contract explains the quotient-ideal application, natural degree and the unit-ideal/zero-ring cases. The standalone lifting target was deleted from both target files.
- Mathlib `Polynomial.resultant_map_map` supplies fixed-size resultant congruence through the quotient map. The contract preserves arbitrary Sylvester sizes and distinguishes actual-degree default resultants. The standalone congruence target was deleted from both files.
- AbelianSchemesAndArithmeticModuli A6.10–A6.11 supplies integer characteristic polynomials, degree and prime independence. F0 consumes that theorem and keeps reciprocity and the finite-field product corollaries; it does not restate `frobeniusPolynomial_integral` as a new target.
- The second internal export of the closed-torus character theorem was consolidated with B2.5. Its finite-equation and countability consequences remain there. No character mathematics was lost.
- Existing parent universal-extension construction, R07.2.19 polynomial descent, parent Frobenius semisimplicity, DWP root bounds/point-count identity, native tensor-square and discriminant APIs remain imports. Their replacements were verified against the supplied texts and pinned files rather than replanned.

All removal/ownership records in the roadmap occur in Scope and ownership. No removed-target stubs remain.

The eight accepted extension statements are preserved in full, but their exact cited suppliers do not state them. They are actual targets here rather than prospective obligations imposed on other roadmaps:

| Accepted prerequisite | Owner in this roadmap |
| --- | --- |
| Uniform Manin–Mumford in families | B2.3 |
| Lang–Néron modulo trace and bounded-degree torsion | B2.3 |
| Fixed-part theorem, semisimple monodromy, global flat Hodge Hom | B2.4 |
| Semirational block counting and mixed Kuga inputs | B2.6 and B3.1 |
| Abelian Ax–Lindemann/Betti Ax-type adapter | B2.15 |
| Fine curve-level moduli and universal curve | B4.1 |
| Semisimple local stable-lattice bounds | F4.4 |
| CM unitary mass and unweighted class asymptotics | F5.7 |

This retains their accepted hypotheses, checks and locators. GH line 546, ConradTrace line 1079, Deligne line 1377, GH line 1003, Gao-Ax line 359, DGH line 1311 and LT line 1067 locate the principal inputs. B2's counting theorem precedes its monodromy use; its abelian Ax input is independent of the mixed Ax–Schanuel conclusion.

Later-roadmap overlap is resolved in the permitted direction: HeightsRationalPointsAndObstructions §§1.9–1.10,5.6 also discusses traces, Lang–Néron and Manin–Mumford; EndoscopicTransferAndUnitaryTraceComparison §8.3 restates finite-field Tate/Honda–Tate; and JacobianChallengePartII's scope assigns fine curve-level moduli to StableReductionPartII. These notions remain owned here because those proposed suppliers are later or unavailable as earlier suppliers. No dependency on those later roadmaps was added. Their consumer texts can cite these targets when reconciled; none was edited in this job.

## Mathematical fixes made during the port

1. P4.3's translation connection diagram still called its projection `p`, although P4.2's Hodge retraction is `r` and exists on the generic fibre. The diagram now uses `r` and explicitly states the Cp domain. The integral connected-torsion translation comparison remains integral (KS line 2880).
2. The semirational theorem now counts distinct unrestricted-coordinate outputs from a finite set, with a constant uniform in definable parameters. Its rational projection is semialgebraic and real analytic; the whole definable curve is not claimed real analytic in an arbitrary o-minimal structure. The affine Betti incidence makes the needed output arc semialgebraic separately (GH line 931, GH line 953, GH line 958).
3. General Kuga congruence quotients are not automatically fine abelian schemes. B3.1 states the Kuga Hodge/group axioms, constructs the split-neat family, and retains finite descent, translation cocycles and quotient-stack isotropy at general level. The coarse quotient E/{±1}=ℙ¹ is the negative control (Gao-Ax line 359, Gao-Ax line 391; SchemeAndStackFoundations §1.21; PELModuli M6.7).
4. The fine curve-level argument had no verified geometric Torelli supplier. B4.1 now owns `curve_geometricTorelli`, including its pointed map/sign formulation, with a legal author source: MilneJV line 2827, Theorem 12.1 p.38 and §13 pp.40–44, [Milne's Jacobian Varieties](https://www.jmilne.org/math/xnotes/JVs.pdf). It consumes the actual smooth-curve stack in SchemeAndStackFoundations §4.15 and the level-cover interface of AlgebraicModuliForArithmeticGeometry §5.2.
5. The prime-field linear dual is now a named definition with composition, double-dual, F,V APIs and three checks. In particular it retains (F,V)=(1,p) on the rank-one étale module, distinguishing it from Cartier duality (Waterhouse line 143; WM Part II).
6. The ordered-root bound's prose now matches the Lean generality q≥1. The generator discriminant application stays at prime p. The reconstruction theorem explicitly permits q,g≥0 as a coefficient identity, with genuine finite-field counting still requiring q≥2.
7. Betti rank/form conventions explicitly use the smooth-base analytic locus. The nonvanishing-point API states smoothness of both the ambient base and the reduced image.

The package's existing corrections remain: moment factorials and integral versus rational completion; the modulo-p^r ordinary cofinality; the Hodge variance; factor-two Betti normalization; actual versus geometric trace; exceptional modular fibres; all-prime Dieudonné variance; repeated-root discriminants; explicit finiteness in orbit counts; the p=2 elliptic counterexample; the Hermitian leading coefficient 1/2; and the conditional status of the sharper numerical exponent.

## Adversarial mathematics pass

Each row covers the subsection's definitions, theorem claims, API and Checks. The construction paragraphs, supplier contracts and conventions were read with them. These are boundary calculations and hypothesis/source audits, not proofs of the admitted targets.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Tensor/shuffle/completion conventions | n=0,1,2; ℤ,𝔽₂; zero module | Empty tensor is R; v*v=2v^[2]; product admits infinite support | Native source vocabulary retained |
| Extension/connection conventions | Zero and elliptic schemes; k⊕M | A♮=E(A∨), cotangent H and tangent Hom(H,M) agree | Projection notation fixed in P4.3 |
| Betti conventions | One elliptic fibre; type (1,2); zero section | Form 2da∧db; periods 2,4; base directions excluded | Smooth-base locus explicit |
| Frobenius/Dieudonné conventions | a=1,2; two composed maps; [p] | F^a linear; opposite algebra and inverse marking correct | Linear-dual API made explicit |
| Discriminant/counting conventions | Empty/repeated roots; infinite quotients | D_*>0; finite cardinality assumptions indispensable | Ordered-root q-generalization explicit |
| Asymptotic conventions | g=0,1,2 and g→∞; fixed p,q | Weighted/unweighted counts and uniform errors distinct | Leading coefficient and conditional exponent retained |
| P0.1 Invariant tensor powers | Degrees 0,1,2; zero ring/module; e₀⊗e₁ | Empty and one-letter invariants are full; the off-diagonal tensor fails swapping | API proofs become README specifications |
| P0.2 Degree completion of symmetric tensors | All-unit sequence; coefficient N+1; empty tensor | Infinite support excludes a direct sum; truncation loses N+1; degree zero detects nonzero | Retain named boundary signatures |
| P0.3 Shuffle multiplication and divided powers | Rank one over 𝔽₂; rank two over ℤ | v*v=2v^[2]; mixed divided square has coefficient one | None |
| P0.4 Comparison with the degree-two invariant submodule | Flip-fixed square over ℤ and 𝔽₂ | Native binary equivalence gives the same submodule without averaging | None |
| P0.5 Shuffle compatibility of the divided-power comparison | Free ranks 0,1,2; nonflat source | Linear comparison supplied; shuffle compatibility is the additional statement | Consume DerivedModuleAlgebra §0.DP.2 |
| P0.6 Multigrading of invariant tensors | Empty summand set; degree zero; two rank-one summands | Degree and multidegree conventions agree; finite projectivity retained | None |
| P1.1 Connection and cotangent notation | Zero/elliptic scheme; k⊕M | Vector ranks 0/1 and total ranks 0/2; tangent is Hom(H,M) | None |
| P2.1 Moments of a formal smooth group | G_a over ℚ and 𝔽_p; n=0,1,p | Diagonal factor is n!; characteristic-p map can fail injectivity | None |
| P2.2 Finite and completed Poincaré sheaves | n=0,1,2 on an elliptic scheme | Ranks 1,2,3 versus 1,3,6; last kernels 1 versus 3 | None |
| P2.3 Fourier–Mukai input for completed Poincaré cohomology | d=0,1; finite versus inverse-limit coefficients | Shift −d and determinant-line cancellation agree; derived completion required | None |
| P2.4 Isogeny functoriality of completed Poincaré sheaves | Identity; prime-to-characteristic degree; inseparable isogeny | Direction is covariant in φ; inverse requires dual étaleness | None |
| P2.5 Canonical torsion splittings and moments | Zero torsion; étale dual; connected dual | Unit trivialization gives splitting exactly under the stated hypotheses | None |
| P2.6 Equivariant structure under relative automorphisms | Identity automorphism; two composed automorphisms | Inverse of γ_# gives the pullback cocycle direction | None |
| P2.7 Poincaré comultiplication and symmetric levels | n,m=0,1,2; n! invertible or zero | Counit and symmetry hold; factorial-invertibility condition is essential | None |
| P2.8 Top cohomology of the ordinary completed Poincaré sheaf | d=0,1; ordinary versus connection sheaf | The ordinary completed transform gives the stated top cohomology only | None |
| P3.1 Square-zero deformation and the logarithm class | H=0; M=H; identity versus zero map | Tangent class is id_H, not an arbitrary extension | None |
| P3.2 The smooth d+ν connection | Degree 0 and 1; elliptic Hodge splitting | Identity tensor gives d+ν; forms lie in the dual basis | None |
| P3.3 Comparison with the logarithm sheaf | Zero variety; positive-dimensional variety; split extension | Identity extension is nonsplit when H≠0; split class maps to zero | None |
| P3.4 Smooth tensor model and Dolbeault resolutions | Holomorphic trivial bundle; nontrivial frame; both Hodge pieces | Horizontal comparison and bundle-valued Dolbeault maps need frame compatibility | None |
| P4.1 Ordinary CM completion and completed base change | p=2; noetherian model versus O_Cp | Completed base change uses the model and never assumes O_Cp noetherian | None |
| P4.2 Ordinary infinitesimal trivialization and projected connection | 1+ε over O_Cp and modulo p^r | Never torsion integrally; killed by p^r modulo p^r; two completion limits retained | None |
| P4.3 Torsion translations of the ordinary trivialization | Zero torsion; connected torsion; integral versus generic fibre | Translation diagram (2) uses the generic-fibre Hodge retraction | Rename retraction to r in this diagram and state its Cp domain |
| B0.1 Period-coordinate trivializations | Point base; zero section; positive-dimensional constant base | Combined chart invertible; Betti projection kills base directions | None |
| B0.2 Birational invariance of generic Betti rank | Identity birational map; blowup exceptional locus | Common dense open preserves generic rank; exceptional rank is not asserted | None |
| B1.1 The descended Betti form | g=1; type (1,2); [0],[-1] | Form is 2da∧db; coordinate periods 2,4; multiplication scales by N² | None |
| B1.2 Pointwise kernel and rank identity | Point; whole fibre; Betti leaf | Positive Hermitian kernel is complex; ranks and top wedge agree | Make the regular-base locus explicit in conventions |
| B1.3 Non-degenerate subvarieties | Point fibre; diagonal E over a curve; torsion section | Ranks are 2dim X, at most 2, and 0 respectively | Specify smoothness of both base and reduced image at the chosen point |
| B1.4 Betti-form criterion for maximal rank | d=0; constant family; any nonempty Betti domain | Analytic identity theorem makes the local and generic conditions equivalent | None |
| B1.5 Non-vanishing of the top power of the Betti form on a non-degenerate subvariety | Smooth image; singular image with dense smooth open | Full-rank locus meets the preimage of image-smooth points | None |
| B2.1 Degeneracy over a curve | Vertical subvariety; torsion section; constant full family | Vertical fibres are discrete; the other two have Betti leaves | None |
| B2.2 Function-field trace and constant part | Constant B; zero B; non-isotrivial elliptic curve | Traces are B,0,0; geometric trace can increase after cover | None |
| B2.3 Uniform torsion closures and Lang–Néron modulo trace | Empty fibre; full A; torsion/non-torsion singleton; K=k; D=1 | Uniform torsion closures and quotient by trace have correct degenerate cases | Own both accepted arithmetic extension statements and cover argument |
| B2.4 Polarized fixed parts and equivariant Hodge Hom | Constant variation; zero invariants; finite cover | Fixed part must be a Hodge subvariation; cover invariants need not descend | Own the accepted fixed-part and global Hom extensions |
| B2.5 Integer characters and countably many closed torus subgroups | n=0; weights (1,-1); H=0,T,order two | Pairing a−b; annihilators ℤⁿ,0,2ℤ; disconnected groups included | Keep one character theorem rather than its duplicate export |
| B2.6 Semirational block counting | Irrational-slope graph; singleton; {0}×[0,1] | Count distinct unrestricted outputs; rational projection may be constant | Finite Σ and parameter-uniform constant; analytic first projection only in general |
| B2.7 Free matrix word growth at bounded height | k=0,1,2; submultiplicative height identically zero | Positive words give 1,2,4 distinct matrices and the power-growth exponent | None |
| B2.8 Tits: free subgroups of linear groups | Trivial group; rank zero; free subgroup | Virtually solvable groups fail the premise; characteristic zero is explicit | Retain the accepted Tits locator with source-text limitation reported |
| B2.9 Invariance of domain in equal real dimension | m=0; empty open; identity map | Equal-dimensional continuous injection is an open embedding | None |
| B2.10 Real constant-rank theorem for Betti fibres | Zero map; identity; rank-r projection; k=1,∞,ω | Local fibre dimension m−r; all differentiability and rank binders retained | None |
| B2.11 Good-cover refinement on a Riemann surface | Empty surface; ℂ; compact Riemann surface | Empty cover members allowed; nonempty finite intersections contractible | Retain explicit analytic-manifold hypothesis |
| B2.12 Fixed homology and equivariant Hom | Constant family; zero fixed homology; finite-index subgroup | Fixed homology algebraizes through flat Hodge Hom, not one fibre | Use the local fixed-part theorem |
| B2.13 Generically special subvarieties | Constant genus-two curve; torsion multisection; trace zero | GH specialness permits arbitrary constant subvarieties | None |
| B2.14 Invariant definable sets of Ax-type | Singleton; real subtorus coset; parabola arc | First two satisfy Ax-type; parabola admits no contained subgroup coset | Independent block counting precedes the alternative |
| B2.15 Algebraic subvarieties and the abelian Ax theorem | Point; abelian coset; nonalgebraic parabola | Algebraicity supplies the abelian Ax bridge independently of mixed Ax–Schanuel | Own the accepted abelian Ax extension; put it after the Ax-type definition |
| B2.16 Transport along nonisolated Betti fibres | Identity loop; torsion leaf; isolated vertical point | Nonisolated hypothesis and loop-compatible group law are necessary | None |
| B2.17 Free subgroups in curve monodromy | Trivial connected closure; nontrivial semisimple closure | Only the second triggers Tits, at every finite index | Use the local semisimplicity theorem |
| B2.18 Monodromy-invariant subvarieties of a fibre | Point; whole fibre; positive-dimensional stabilizer | Torsion-coset or stabilizer alternative retains all monodromy hypotheses | Use the local abelian Ax theorem |
| B2.19 Invariant homology gives the function-field trace | Constant family; zero invariant lattice | Fixed homology gives trace over the original function field | None |
| B2.20 Virtually invariant subvarieties in kernels | Finite étale covers; a torsion section; full Y=A | Kernel dimensions are total dimensions, including the base | None |
| B2.21 Finitely many maximal GH generically special subvarieties | Constant curve; torsion multisection; non-torsion trace-free section | Maximal family is respectively {X},{X},empty | Use locally owned uniform torsion and Lang–Néron inputs |
| B2.22 Curve degeneracy implies GH generic specialness | Constant family; geometrically trace-free family; vertical Y | Dominance and curve degeneracy are explicit; vertical case excluded by premise | None |
| B2.23 Full-rank algebraic points outside generic specialness | Constant versus varying family; any nonempty Betti domain | Non-specialness forces full generic rank; algebraic points meet the open locus | None |
| B3.1 Mixed Kuga uniformization and semirational counting | V=0; constant periods; normal W; inversion level | General congruence quotients retain isotropy; coarse E/{±1}=ℙ¹ is not elliptic | Own Kuga carriers and descent, with five Hodge/group axioms and split-neat refinement |
| B3.2 Quantitative estimates on the pure projection | Upper-half-plane ball; z↦z+N; pure point | Area π(T+T⁻¹−2); N²<T+T⁻¹−2; translate area π/3 | Use local Kuga inputs and preserve the separate quantitative targets |
| B3.3 Horizontal and vertical growth in mixed Ax–Schanuel | Pure projection point/positive dimensional; vertical growth | Both horizontal and vertical cases are required; positive total projection retained | Use local Kuga and counting interfaces |
| B3.4 Bigness of the rational stabilizer | Zero defect; positive-dimensional rational stabilizer | Dimension-defect/stabilizer alternative agrees in the boundary case | None |
| B3.5 Normality and quotient induction | Original pair versus very-general Hilbert pair | Normality is asserted only after the stated reduction | None |
| B3.6 Finite weakly optimal quotient data | Point; zero defect; moving orbit points | Finitely many rational subdata does not mean finitely many translating points | None |
| B3.7 Gao t-degeneracy loci | Point; torsion section; equality threshold; branched graph | Positive dimension and strict inequality exclude the wrong boundary cases | None |
| B3.8 Zariski closedness of degeneracy loci | Blowup graph; exceptional ℙ¹; jumping modular fibres | Global closedness cannot use only the generic fibre dimension | None |
| B3.9 Gao quotient criterion for Betti rank | l=0; zero/full abelian quotient; constant family | Strict rank inequality and quotient relative dimension are retained | Use the locally owned fixed-part and Kuga dictionary |
| B4.1 Fine curve moduli with symplectic level | g=2,ℓ=3; ℓ=2; identity and composite refinement | Level two retains hyperelliptic involution; fine moduli requires Torelli | Own fine curve-level moduli and add geometric Torelli with its map/sign form |
| B4.2 Non-degeneracy of a dominant fibre product | Point base; constant family; reducible product | Tangent kernels give the claim on dominating components | None |
| B4.3 The fibre-power dimension induction | Constant X=A; t≥dim S; multisection | Isotrivial stabilizers allowed; modular dimension differs from total dimension | None |
| B4.4 Non-degeneracy of universal-curve difference images | g=2; ℓ=3; M=3g−2; finite étale refinement | Fine curve family and level-independent rank descent are both required | Use local fine-level construction |
| B4.5 Non-degeneracy criterion for fibre powers | m=dim S; relative dimension zero; finite/infinite stabilizer | All relative-dimension, stabilizer and modular-finiteness conditions retained | None |
| B4.6 Non-degeneracy is preserved by the difference construction | One independent factor; point base; reducible fibres | Product non-degeneracy suffices; no generic injectivity assumed | None |
| F0.1 Compact preimages and exact lattice limits | Rank zero; constant/zero matrix; ℓⁿid,ℓ=2 | Compact preimages give intersection, not union; powers intersect in zero | Move two proved native-carrier boundaries to README Checks |
| F0.2 Frobenius polynomial and reciprocity | g=0; elliptic trace t; product traces a,b | P=1; quadratic/quartic coefficients satisfy descending reciprocity | Consume parent integrality, degree and prime independence |
| F0.3 Weil q-numbers | ±√p; 1 for q>1; Frobenius eigenvalues | Integrality plus every complex embedding is essential | None |
| F0.4 Tate’s isotropic image lemma | Zero A; maximal isotropic subspace; absent model finiteness | Polarization degree and finiteness hypothesis remain essential | None |
| F0.5 Point-count corollaries | r=1,2; zero variety; product and isogenous varieties | Point counts multiply and are isogeny invariant | Use DeligneWeightsAndPurity determinant identity |
| F0.6 Tate at a split Frobenius prime | Split/non-split prime; product and off-diagonal blocks | Commutant dimension and integral saturation are distinct steps | None |
| F0.7 Tate full faithfulness over finite fields | A=0; A=B; ℓ≠p | Integral and rational comparisons agree; characteristic prime not silently included | None |
| F2.1 Multiplicity detected by shifted factors | e=0; S=1; R=X; inseparable R; degree>2 | Resultant slope nd·e plus stable constant; quotient determinant controls precision | Replace lifting/congruence restatements by native suppliers |
| F2.2 Recognition from nonzero monic resultant tests | P=1 versus X; repeated factors; incomplete/equal-characteristic DVR | Dense common nonzero tests detect every multiplicity without completeness | None |
| F2.3 Integer tests for a p-adic polynomial | p=2,3; constant polynomial; zero resultant | Integer coefficient lifts suffice; zero valuation convention is guarded | None |
| F1.1 Degree from Dieudonné cokernel length | Identity; [p]; connected versus étale kernel | Cokernel length is v_p(degree), including connected torsion | None |
| F1.2 Saturated injection on integral p-realization Hom groups | Map divisible by p; connected A[p]; zero Hom | Finite-flat kernel factorization is required for saturation | None |
| F1.3 Characteristic polynomial on the p-realization | Nonsemisimple u; scalar [p]; perfect infinite field | Descent uses semilinear conjugation; no arbitrary-u semisimplicity | Consume R07.2.19, keep integer-polynomial agreement |
| F1.4 Algebra acting on a Frobenius polynomial block | a=1; split coefficient tensor; cyclic weighted matrix | Dimension a²; all idempotents retained | None |
| F1.5 Frobenius adapter on the isocrystal | a=1,2; zero A; Frobenius versus arbitrary u | F^a is linear; supplied Frobenius semisimplicity transports faithfully | None |
| F1.6 Central simplicity of a Frobenius block algebra | a=1; product coefficient algebra; algebraic closure | Splitting gives M_a, including nonfield coefficient tensor | None |
| F1.7 Dimension of the semilinear Frobenius commutant | One irreducible block; repeated block; ordinary elliptic curve | Centralizer dimensions are Σd_i e_i² | None |
| F1.8 Rational and integral p-Tate comparison | A=0; rational versus integral maps | Rational surjectivity plus saturation yields integral comparison | None |
| F1.9 Integral Tate full faithfulness at the characteristic prime | Ordinary and supersingular varieties; p=2 | Finite-flat integral Dieudonné morphisms include both types | None |
| F1.10 Rational p-Tate comparison | A=B; composition of two maps | Contravariance gives the opposite endomorphism algebra | None |
| F1.11 Characteristic-prime invariant of a simple endomorphism algebra | Ordinary slopes 0,1; supersingular slope 1/2; a=1 | Local invariant formula agrees with e_v,f_v and opposite convention | None |
| F3.1 Prime-to-p and p lattice spaces | Identity marking; zero variety; infinite support | Inverse C(α) restores left action; infinite support excluded | None |
| F3.2 Honda–Tate simple isogeny classification | Real ±√p; nonreal Weil number; powers of simple objects | Real division-algebra cases and the dimension index are retained | None |
| F3.3 Frobenius polynomial determines the isogeny class | Zero variety; equal versus distinct elliptic traces | Exactly equality of full characteristic polynomial gives isogeny | None |
| F3.4 Commutative endomorphisms in the nonreal prime-field case | Nonreal prime field; real Weil number; higher prime power | Commutativity is restricted to the nonreal simple prime-field case | None |
| F3.5 Prime-field p-realization Frobenius polynomial | Rank-one étale module; identity; composition; zero variety | Linear dual retains (F,V)=(1,p); Cartier duality gives (p,1) | Name linear-dual definition, functor API and three Checks |
| F3.6 Marked quasi-isogenies classified by lattices | Identity marking; [n]; composed marking | Contravariant inverse transport and pair isomorphism equation agree | None |
| F3.7 Finite-support lattice tuples are realized over the prime field | Single changed prime; characteristic-prime change; infinite support | Finite support and F,V-integrality permit quotient realization | None |
| F3.8 Realization of nonreal prime-field orders | Maximal order; nonmaximal order; missing π or p/π | Exactly the orders containing both Frobenius and Verschiebung are realizable | None |
| F3.9 Isomorphism classes as rational orbits | Two markings of one variety; zero variety | Postcomposition orbits forget the marking | None |
| F3.10 Prime-field marked and unmarked classification | Identity marking; prime-field linear dual; nonprojective order lattice | Prime-field specialization preserves actual lattices, not only ideal classes | None |
| F4.1 Adelic class set of the endomorphism group | Rational unit; conjugated level; nonmaximal order | Double cosets classify one genus; full class monoid need not be Pic(R) | None |
| F4.2 The prime-field p-component reduction | a=1 versus a>1; F-stable but V-unstable lattice | V=pF⁻¹ makes the stable locus centralizer invariant only at a=1 | None |
| F4.3 Discriminant and ordered-root bounds | Repeated roots; empty roots; q=1; nonmaximal power order | D_* stays positive; field discriminant retains square order index | Match the general ordered-root signature q≥1 in prose |
| F4.4 Local semisimple stable-lattice bounds | Scalar; unramified repeated factor; diag(0,ℓ),ℓ=2 | Δ=0 gives one orbit; projected lattices detect nonsplit gluing | Own the accepted local bound with explicit witnesses |
| F4.5 Finite-support adelic stabilizers in a prime-field isogeny class | Only one modified prime; Δ=0 away from D_* | Only finitely many nontrivial conjugators and indices are assembled | Use local bounds rather than a hypothetical supplier |
| F4.6 Class-set comparison by reduced norms | d=0,1,2; CM matrix factor; totally definite quaternion factor | Only d≥2 has narrow-class reduction; small d treated separately | None |
| F4.7 Conditional rational-orbit bound from local lattices | X empty; D=0,1; infinite stabilizer index | Finite orbit, class-set and index hypotheses prevent zero-cardinality vacuity | None |
| F4.8 Coarse prime-field isomorphism count at fixed adelic level | g=1; real quaternion block; finite h | D_*³h follows; class-set finiteness gives no uniform numerical exponent | None |
| F5.1 Lang surjectivity for an abelian variety | Zero variety; elliptic variety; p=2 | Frob−1 has derivative −1 and gives Lang surjectivity | None |
| F5.2 Units that are norms modulo norms of units (Lemmermeyer) | Norm unit; non-unit preimage; ambiguous/strongly ambiguous class | Quotient is a subquotient of the full class group, not all norms of units | None |
| F5.3 Density of primes splitting in a class-number-one CM field | All nine quadratic square classes; ramified primes | Independent signs give complement density 2⁻⁹ | None |
| F5.4 Elliptic curve with class-number-one endomorphisms | Split versus inert prime; p=2 or 3 when split | Norm-p generator and maximal order give an actual elliptic curve | None |
| F5.5 Elliptic point groups in odd characteristic | p=3; p=2 trace ±1 | At p=2 the point counts 2 and 8 are both p-powers | Retain accepted odd-prime restriction and negative control |
| F5.6 Line-bundle realization over a finite field | Symmetric nonpositive isogeny; characteristic two | Descent gives a line bundle; ampleness still requires positivity | None |
| F5.7 CM Hermitian mass and class asymptotics | g=0,1,2; ℤ[i]; dyadic/ramified local factors | Mass 1/4 versus class count 1; factorial logarithm has coefficient 1/2 | Own the accepted all-factor unitary mass theorem |
| F5.8 Principal polarizations on CM elliptic powers | Zero power; rank-one CM curve; g→∞ | Unweighted Hermitian orbit count transports to polarizations | Preserve coefficient 1/2 and its source correction |
| F5.9 Squarefree nonreal polarization bound | No principal polarization; repeated factor; real factor | Zero count allowed; squarefree nonreal hypotheses cannot be dropped | None |
| F6.1 Reconstruction from integer power sums | g=0,1,2; q=0,1; descending signs | First g power sums reconstruct; q=0 is purely a coefficient identity | Make q,g≥0 generality explicit |
| F6.2 Counting Weil polynomials by power sums | g=1; q=2; root multiplicities | Trace interval bound ≤5√q; polynomial set finiteness explicit | None |
| F6.3 Asymptotic count of isogeny classes | Fixed q; g→∞; repeated simple factors | Leading exponent is (log q)g²/4 with O_q(g log g) | None |
| F6.4 Coarse isomorphism counts and conditional numerical assembly | Fixed p; nonuniform versus uniform ε_g | 69/4 requires the stated uniform exponent-17 hypothesis | None |
| F6.5 DiPippo–Howe lower bound for isogeny classes | n=1; q=2; negative small-n right side | Strict lower bound remains meaningful; logarithms only eventually positive | None |
| F6.6 Asymptotic exclusion of squarefree nonreal ppavs | Repeated factors; real factor; split CM prime | Unweighted CM growth dominates the squarefree nonreal numerator | None |

## Source and review limits

All twenty legal source texts listed as available in the accepted manifest were found in the source cache and the passages needed for the port changes were consulted directly. The remaining source-locator inventory follows the accepted source audit; this report does not claim to re-prove the cited literature. The Tits original text remains the accepted locator-only source: its paywalled original was not supplied, and this port does not claim to have independently certified its theorem numbering. Its mathematical statement and accepted citation are unchanged. The additional MilneJV source is the author's public PDF and supplies the previously missing Torelli statement and proof.

The mathematical source adaptations remain explicit targets, especially the semisimple lattice bounds, all-factor unitary mass estimates, and arbitrary-base descent/completion comparisons. A successful elaboration build does not prove them. No source-verification issue other than the accepted Tits text limitation remains; no build, gate, dependency-order or file-scope issue remains.

One out-of-scope instruction in review data was disregarded. ReviewR2a line 66, in `packages/AbelianSchemesAndArithmeticModuliPartII/reports/RT-AbelianSchemesAndArithmeticModuliPartII~2a.md`, says:

> Exclude the `merge-order/ORDER.txt` insertion from the package pull-request diff

That requested a change outside this job's writable folder. It was treated as a scope claim about the prior package branch, not authority to edit the merge order. This content-repository commit touches only the named roadmap folder.

No helper agents were used. No downloaded code was executed, no credentials were read, and no external write was made.


Pull request: #1405 (roadmap/abelian-schemes-and-arithmetic-moduli-part-ii at 926aa5b)
