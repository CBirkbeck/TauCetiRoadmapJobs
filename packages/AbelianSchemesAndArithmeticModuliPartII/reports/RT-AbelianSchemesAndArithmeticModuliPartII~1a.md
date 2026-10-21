<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/122#issuecomment-6310604217 -->
Red team round 1 pass a (codex) of 46bb981

Verdict: needs_changes

1. **F01** (P1) Admitted data underlies the tensor signatures

   Location: `packages/AbelianSchemesAndArithmeticModuliPartII/Suggested.lean:52–229,319–328`; “def tensorSymmetricPower … := by sorry”.

   Claim: The file supplies usable invariant tensors, shuffle operations, ring instances and comparison maps.

   Witness: Lines 52–53, 65–68, 129–142, 148–152, 175–186 and 210–229 admit data and instances; all subsequent tensor statements depend on them. Lines 319–328 also admit the torus-character and annihilator data.

   Exact repair text: “Keep `tensorSymmetricPower` only with its actual intersection-of-equalizers body. Keep degree completion and evaluation with real bodies. Move shuffle multiplication, its ring/algebra instances, comparison equivalences and multigrading constructions to README targets until their carriers and maps have real definitions. Define the torus character by the finite integer pairing and its annihilator as the intersection of character kernels, with real bodies. Remove every signature mentioning removed data.”

2. **F02** (P3) Imports, options, namespace and declaration form violate the contract

   Location: `packages/AbelianSchemesAndArithmeticModuliPartII/Suggested.lean:1–55`; “set_option autoImplicit false”.

   Claim: The file follows the required representative-signature format.

   Witness: Lines 1–27 import individual Mathlib modules; line 45 sets an option; line 48 uses `AbelianArithmetic`; line 55 and subsequent declarations use `lemma` without mathematical docstrings.

   Exact repair text: Replace the Mathlib imports by `import Mathlib`; remove `set_option`; use `namespace TauCetiRoadmap.AbelianSchemesAndArithmeticModuliPartII`; use `theorem` throughout. Replace the module docstring by “AbelianSchemesAndArithmeticModuliPartII: representative target signatures. The roadmap is README.md; this file records statements suggested against the pinned APIs and is not exhaustive.” Give every retained declaration a mathematical docstring and arrange layers in README order with the required layer comments.

3. **F03** (P3) Checks are admitted rather than tested

   Location: `packages/AbelianSchemesAndArithmeticModuliPartII/Suggested.lean:74–122,192–207,335–344`; “example … := by sorry”.

   Claim: These examples test the roadmap definitions.

   Witness: All twelve examples in these ranges end in `sorry`; the tensor-power, completion and annihilator groups each contain three examples, exceeding the maximum of two per retained definition.

   Exact repair text: “For each retained real-bodied definition, keep at most two proved discriminating examples. Replace an unprovable boundary example by a named theorem target with the same statement in README.md. Remove the definitional-equality `degreeCompletion_product` check and replace it by a discriminating coefficient/truncation check.”

4. **F04** (P1) Connected torsion is not the unit-adic formal functor over O_Cp

   Location: `packages/AbelianSchemesAndArithmeticModuliPartII/README.md:617–619,651–655`; “Its formal filtered union is Â”. Also `Suggested.lean:613`.

   Claim: The filtered union of the ordinary connected p-power kernels equals completion along the unit, as fixed in the conventions.

   Witness: On the ordinary multiplicative formal group over `O_Cp[ε]/(ε²)`, the point `1+ε` lies in unit completion but `[p^n](1+ε)=1+p^n ε≠1` for every n. KS line 2783 uses the same shorthand.

   Exact repair text: “For each r≥1, work over O_Cp/p^r. Prove that the connected p-power kernels and the unit thickenings are cofinal as formal functors over this base. Construct the compatible trivializations modulo p^r, then take the p-adic inverse limit and prove its comparison with the unit-completed coefficient sheaf. Do not identify the p-divisible torsion functor with the unit-completion functor over O_Cp itself.” Add the dual-number example as a negative-control Check.

5. **F05** (P2) An easy compact-lattice headline is omitted

   Location: `packages/AbelianSchemesAndArithmeticModuliPartII/Suggested.lean:918–922`; “Signature omitted: Compact preimages and exact lattice limits”.

   Claim: The stated omission requires abelian-variety carriers.

   Witness: The first assertion of README lines 1390–1391 involves only finite free p-adic modules, endomorphisms, convergence and set intersection. `PadicInt`, matrices, `Filter.Tendsto` and `Set.range` already provide all carriers.

   Exact repair text: “Add `compactLatticeImageLimit` on `(Fin d → PadicInt ℓ)` with prime ℓ, a convergent sequence of matrices, and antitone image sets, concluding `Set.range u = ⋂ n, Set.range (u_n)`. State the Tate application separately in the README.” Include d=0, constant maps and multiplication by ℓ^n as Checks.

6. **F06** (P3) Lean names and the README do not match

   Location: `packages/AbelianSchemesAndArithmeticModuliPartII/Suggested.lean:234–466`; for example “theorem resultantRecognition”.

   Claim: Suggested signatures bind contributors to the corresponding README targets.

   Witness: `resultantRecognition`, `powerSumReconstruction`, `weilPolynomialCount`, `rationalOrbitCount`, `constantRankLocal` and `titsFreeSubgroup` never occur in README.md. The declaration inventory finds 37 missing names in total.

   Exact repair text: “Add each retained Lean declaration's exact name to its existing README target. Remove the commented catalogue of omitted signatures at Suggested.lean lines 471–1267; retain those mathematical statements only in the README.”

7. **F07** (P1) P1 reconstructs the parent's universal vector extension

   Location: `packages/AbelianSchemesAndArithmeticModuliPartII/README.md:302–356`; “Construct a smooth commutative S-group A♮”.

   Claim: Universal vector extensions and their connection-moduli construction are new work here.

   Witness: `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:1789–1817` at `a9b3fcc` already constructs `AbelianVectorExtension`, its connection-moduli interpretation on A∨, invariant forms and base change; line 1810 explicitly identifies the moduli problem on A with E(A∨).

   Exact repair text: “Put A♮ := AbelianVectorExtension(A∨), supplied by AbelianSchemesAndArithmeticModuli A4.2. Import its connection-moduli representation, universal bundle, vector kernel, base change and Hodge identifications from A4.2–A4.3. P1 records only their comparison with the completed-Poincaré notation used here.” Delete the duplicated representability and extension-construction obligations and update the introduction's description of the parent's stopping point.

8. **F08** (P1) GN.2 does not supply Frobenius-stable lattice orbit estimates

   Location: `packages/AbelianSchemesAndArithmeticModuliPartII/README.md:2008,2068–2073`; “The GN.2 local suppliers must use the successive projected lattices”.

   Claim: GeometryOfNumbersAndQuadraticArithmetic supplies the local orbit counts and stabilizer-index estimates used in F4.

   Witness: At `01c64f0`, its README §§2.1–2.9 (lines 893–1246) treat quadratic/hermitian lattices; §2.5 (1040–1074) is invariant-factor theory. It contains no semisimple-endomorphism lattice-orbit estimate with Δℓ, discriminants or resultants.

   Exact repair text: “Add F4 targets `localSemisimpleLatticeOrbitBound` and `localSemisimpleLatticeStabilizerIndex`: for a semisimple operator on a finite-dimensional Q_ℓ-space with monic integral characteristic factors ∏f_i^{n_i}, set Δℓ=Σn_i²vℓ(disc f_i)+2Σ_{i<j}n_in_jvℓRes(f_i,f_j). Bound centralizer orbits of stable full Z_ℓ-lattices by ℓ^{2Δℓ}, and contain each stabilizer in a conjugate maximal compact with index at most ℓ^{Δℓ}. Prove these using successive projected lattices. F4's global assembly consumes these targets; GN.2 supplies only the actual invariant-factor prerequisites.” Alternatively declare these precise missing contracts as supplier gaps in the required design and README locations.

9. **F09** (P1) GN.3 does not supply the claimed CM Hermitian counting asymptotic

   Location: `packages/AbelianSchemesAndArithmeticModuliPartII/README.md:2165,2203–2206`; “use GN.3's local genus factors, residue bounds and conversion”.

   Claim: GN.3 supplies enough quantitative unitary mass theory to deduce the unweighted CM elliptic-power count with coefficient 1/2.

   Witness: `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:1484–1503,1572` at `01c64f0` defines quadratic genus mass, an SO volume identity and a totally-real quadratic mass formula. It does not state the positive-definite O_K-Hermitian rank-g asymptotic needed here.

   Exact repair text: “Add `cmHermitianUnimodularClassAsymptotic`: for a fixed imaginary quadratic class-number-one field K, the number H_K(g) of GL_g(O_K)-classes of positive-definite unimodular Hermitian forms satisfies log H_K(g)=½g²log g+O_K(g²). Give separate targets for the unitary mass formula, its ramified local factors, uniform genus and automorphism bounds, and passage from weighted mass to unweighted count, with exact LT §§5.3–5.5 locators. The E^g polarization theorem consumes these targets and the Rosati orbit dictionary.” Explicitly correct LT v1 equations (51) and (56), which print coefficient 1 (LT lines 1243 and 1418): the unitary archimedean factorial product contributes Σ_{j=1}^g log((j−1)!)=½g²log g+O(g²). Alternatively declare precise supplier gaps; do not state these inputs as already supplied by GN.3.

10. **F10** (P1) Universal curve and level moduli are attributed to a supplier that excludes them

   Location: `packages/AbelianSchemesAndArithmeticModuliPartII/README.md:51–53,1338–1344`; “JC7/universal-faltings-zhang”.

   Claim: JacobianChallengePartII supplies the universal-curve setting needed for the B4 application.

   Witness: `TauCetiRoadmap/JacobianChallengePartII/README.md:45,1080,1097–1105` at `5a975b3` excludes construction of curve moduli and the universal curve. §7.2 `RelativeJacobian.levelFaltingsZhang` assumes a curve family with full level; it does not construct one.

   Exact repair text: “Use JacobianChallengePartII §2.6 `RelativeJacobian.CurveDifference` and §7.2 `RelativeJacobian.levelFaltingsZhang` for a supplied family. Add an owned target constructing the fine full-level curve moduli M_g[ℓ], its universal curve and the quasi-finite Torelli map, or declare a precise supplier gap. State B4 for ℓ≥3 and the resulting fine moduli spaces, with descent independent of level.” Do not add a dependency on an unplaced/later supplier without satisfying the merge-order contract.

11. **F11** (P1) H.2 and LD.6 have no available supplier contract

   Location: `packages/AbelianSchemesAndArithmeticModuliPartII/README.md:48–50,969–974,1018–1022,1166–1218`; “HodgeStructuresPartII, H.2” and “LogicAndDefinabilityInNumberTheory, LD.6”.

   Claim: These suppliers provide the fixed-part/equivariant-Hom and o-minimal/mixed Ax–Schanuel inputs.

   Witness: Neither named roadmap exists in the supplied main tree or merge order. Repository pull-request searches for the exact names find no introducing pull request; HodgeStructuresPartII appears only as a mention in ComplexComparisonPartII. No supplier gaps are declared.

   Exact repair text: “Import the linear Hodge carriers from Completed/HodgeStructures L0–L3. Declare precise supplier gaps for polarized variations, fixed-part and equivariant Hodge-Hom comparison, and for definable counting and the mixed weakly-special infrastructure actually consumed in B2–B3, naming existing supplier roadmaps and sections. Alternatively introduce these as owned targets before their uses. Replace every H.2/LD.6 citation with the resulting valid contract.” A roadmap name alone is not a contract; retain the stated hypotheses on the base, variation, monodromy and definable sets in each gap.

12. **F12** (P3) Dolbeault and parent section locators have drifted

   Location: `packages/AbelianSchemesAndArithmeticModuliPartII/README.md:22–25,40–41,579–581`; “C0, supplies analytification and bundle-valued Dolbeault comparison”.

   Claim: The cited sections own these inputs.

   Witness: ComplexComparisonPartII at c9ccfac places bundle-valued Dolbeault in C1.1, lines 1244–1262. The parent's A3.9 owns Rosati, and A4.2 owns universal vector extensions; the introduction attributes Rosati to A2 and omits A4.2.

   Exact repair text: “Use ComplexComparisonPartII C0 for analytic sheaf/bundle carriers and C1.1 `localDolbeault` for the bundle-valued Dolbeault resolution. Describe the parent's A3.9 `Polarization.rosati` and A4.2 `AbelianVectorExtension` at their actual sections.” Replace pseudo-declaration slugs in supplier references with the current target numbers and names, including FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.10 `dieudonnePDivisible`.

13. **F13** (P2) The fibre-power headline drops the general theorem it cites

   Location: `packages/AbelianSchemesAndArithmeticModuliPartII/README.md:1323–1328`; “finite geometric generic stabilizer” and “full total-dimension Betti rank”.

   Claim: This is the fibre-power dimension induction promised by Gao–Betti Theorem 10.1.

   Witness: Gao–Betti lines 1276–1282 allow an isotrivial stabilizer, quantify over every t≥0, and bound rank using the dimension of the modular image, without requiring its map to be generically finite.

   Exact repair text: “State Theorem 10.1 in full: assume positive relative dimension, generating fibres and no non-isotrivial abelian subscheme stabilizing X. For every t≥0 and m≥1, rank(db^[m]|X^[m])≥2(dim ι^[m](X^[m])−t) if m≥dim S−t; the corresponding difference image has rank≥2(dim D_m(ι^[m+1](X^[m+1]))−t) if m≥dim X−t. Keep the existing finite-stabilizer, generically-finite, t=0 assertions as corollaries.” Add a constant-family example with a positive-dimensional constant stabilizer to test the additional generality.

14. **F14** (P3) The source manifest is absent and API links use different pins

   Location: `packages/AbelianSchemesAndArithmeticModuliPartII/README.md:2312–2383`; “Library declaration locations”.

   Claim: The references and library interfaces identify the evidence against which the package is stated.

   Witness: No sources.toml is present. All Mathlib links use 082e2d3 and the Tau Ceti link uses f790474; lake-manifest.json instead pins 6b7abb3 and a91d3aa respectively.

   Exact repair text: “Add sources.toml with schema tauceti-roadmap-sources/v1, one entry for each cited work, exact locators and cited_for targets, and the sources service's legal-fetch provenance and status. Replace the API links with the corresponding files at Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.” Keep the linked preprint version numbers where their numbering differs from publication metadata.

15. **F15** (P3) Several introduced definitions lack discriminating Checks

   Location: `packages/AbelianSchemesAndArithmeticModuliPartII/README.md:527–565,1009–1022`; “Define Log^(1)” and “Invariant definable sets of Ax-type”.

   Claim: The logarithm construction and Ax-type predicate are sufficiently specified for implementation.

   Witness: Neither definition has three Checks. The P3 construction paragraphs contain no Checks block; B2's Ax-type predicate has none. Existing tests elsewhere for non-degeneracy and generic specialness do not test these definitions.

   Exact repair text: “Give at least three discriminating Checks for each definition. For Log^(1): dimension-zero A, a positive-dimensional A with identity extension class, and the split extension with zero class as a negative control. For Ax-type: a singleton, a translate of a real subtorus, and the image of the small polynomial arc t↦(t,t²), 0≤t≤1/4, in the two-torus as a negative control. In the negative control the displayed lift is semialgebraic and analytic, but its image contains no positive-dimensional coset; compute this failure of the defining implication.” Supply proved Lean examples only when the actual carriers and real-bodied definitions are retained, with at most two per definition; move other statable boundary assertions to named theorem targets.

16. **F16** (P1) The point-count identity already has an earlier owner

   Location: `packages/AbelianSchemesAndArithmeticModuliPartII/README.md:1466–1475`; “#A(F_(q^r))=det(1−Frob_q^r|V_ℓA)”.

   Claim: F0 develops this identity from the parent's characteristic-polynomial API.

   Witness: `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:1205–1222` at e9585a0 already owns the identity for every extension degree, including separability and the determinant/product formula. DWP is already an admitted earlier supplier here.

   Exact repair text: “Import DeligneWeightsAndPurity DWP.1 target 1.5 for the point-count identity. Retain only the isogeny-invariance and product corollaries here, citing that target and the parent's Tate-module isogeny/product interfaces. Do not reconstruct the point-count formula.”

17. **F17** (P3) DGH 2.5 is a corollary, not a lemma

   Location: `packages/AbelianSchemesAndArithmeticModuliPartII/README.md:752,832`; “Lemmas 2.3–2.6”.

   Claim: These lemma numbers locate the Betti-form and kernel calculations.

   Witness: DGH line 489 labels 2.5 “Corollary 2.5”; Lemmas 2.3, 2.4 and 2.6 appear at lines 382, 450 and 504.

   Exact repair text: “DGH, Lemmas 2.3, 2.4 and 2.6, Corollary 2.5, and Proposition 2.7, PDF pp.9–12.” Use the subset relevant to each target.

18. **F18** (P2) The nine class-number-one facts have no supplier citation

   Location: `packages/AbelianSchemesAndArithmeticModuliPartII/README.md:2112–2119`; “each of class number one”.

   Claim: The density target has all its prerequisites supplied by Chebotarev layer 14.

   Witness: `TauCetiRoadmap/ImaginaryQuadraticClassNumber/README.md:142–146`, H3.6, already owns and certifies all nine class-number-one cases. Chebotarev supplies their splitting density, not those class-number computations.

   Exact repair text: “Add ImaginaryQuadraticClassNumber H3.6 to this target's Needs and the supplier table. Import its maximal-order class-number-one certificates for discriminants −4,−8,−3,−7,−11,−19,−43,−67,−163; prove only square-class independence and the Chebotarev density application here.”

## Adversarial statement audit

Each line refers to `packages/AbelianSchemesAndArithmeticModuliPartII/README.md`. “No counterexample” records the stated boundary tests, not an independent proof or certification of every source locator. Generality and supplier findings remain applicable to dependent targets.

| Line / statement | Instances or convention tested | Result | Change |
|---|---|---|---|
| 170: Invariant tensor powers | n=0,1,2; zero ring; Z² off-diagonal tensor | Invariant and quotient remain distinct | R01 |
| 198: Degree completion of symmetric tensors | zero sequence; one supported degree; product versus I-adic completion | Carrier equality is tautological | R03 |
| 222: Shuffle multiplication and divided powers | m=n=1 over F₂; n=0 | Shuffle square zero, diagonal square nonzero | R01,R03 |
| 248: Comparison with the degree-two invariant submodule | e₀⊗e₁ in Z²; flip and Fin 2 transposition | Same fixed submodule under binary equivalence | R01 |
| 260: Comparison with the existing divided power algebra | free rank 0,1; characteristic 2; nonfree module excluded from iso | No false free-module assertion found | R01 |
| 271: Multigrading of invariant tensors | empty index; one summand; two rank-one projectives | Degree-zero and mixed components agree | R01 |
| 302: Universal vector extension of the dual | zero abelian scheme; elliptic dual; kernel variance | Already owned | R07 |
| 336: Lie and cotangent identifications | elliptic ranks 1,2; dual Hodge sequence | Variance matches A♮=E(A∨) | R07 |
| 365: Moments of a formal smooth group | G_a in Q and F_p; n=0,p | Factorial map and characteristic-p failure agree | none |
| 394: Finite and completed Poincaré sheaves | n=0,1; finite pushforward before inverse limit | Exact graded pieces have symmetric quotient, not invariants | none |
| 431: Fourier–Mukai input for completed Poincaré cohomology | d=0,1; determinant twist; derived inverse limit | No counterexample; requires its stated formal-functions comparison | none |
| 444: Isogeny functoriality of completed Poincaré sheaves | identity; multiplication by p in characteristic p | Isomorphism clause correctly conditional on étaleness | none |
| 456: Canonical torsion splittings and moments | unit; prime-to-p torsion; nonétale dual excluded | Etale hypothesis retained for splitting | none |
| 469: Equivariant structure under relative automorphisms | identity and two automorphisms | Inverse pullback convention coherent | none |
| 479: Poincaré comultiplication and symmetric levels | n=0,1,p in characteristic p | Factorial invertibility guards symmetric-level iso | none |
| 493: Top cohomology of the ordinary completed Poincaré sheaf | d=0; elliptic family; ordinary versus connection completion | Cohomological degree and twist consistent | none |
| 527: Square-zero deformation and the logarithm class | H=0; M=0; identity versus zero Ext class | Identity class distinguishes split extension | R15 |
| 538: The smooth d+ν connection | elliptic Hodge pair; constant coefficients | dν=0 and ν∧ν=0 in commutative coefficient algebra | none |
| 550: Comparison with the logarithm sheaf | dimension zero; split extension on positive-dimensional A | Definitions need discriminating Checks | R15 |
| 567: Smooth tensor model and Dolbeault resolutions | degree zero; elliptic (1,0)/(0,1) pieces | Resolution needs actual supplier C1.1 | R12 |
| 602: Ordinary CM completion and completed base change | ordinary elliptic CM; nonnoetherian O_Cp | Completed base-change warning retained | none |
| 615: Ordinary infinitesimal trivialization and projected connection | formal G_m over O_Cp[ε]/ε² | 1+ε is not p-power torsion | R04 |
| 634: Torsion translations of the ordinary trivialization | zero torsion translation; composition; p-power formal point | Construction inherits formal-union defect | R04 |
| 670: Period-coordinate trivializations | base point; zero section; constant positive-dimensional base | Base directions correctly absent from Betti map | none |
| 701: Birational invariance of generic Betti rank | identity; birational exceptional locus | Generic rank unchanged on common open | none |
| 725: The descended Betti form | g=1; D=diag(1,2); multiplication 0 and −1 | Factor 2 and polarization weights consistent | none |
| 756: Pointwise kernel and rank identity | vertical tangent; horizontal Betti leaf; zero tangent | Kernel equals kernel of db | none |
| 766: Non-degenerate subvarieties | point; torsion section; elliptic-family diagonal | Total complex dimension correctly used | none |
| 797: Betti-form criterion for maximal rank | zero-dimensional X; vertical X; torsion section | Wedge and full-rank criteria agree | none |
| 812: Non-vanishing of the top power of the Betti form on a non-degenerate subvariety | smooth full-rank point; regular-base open | GGK top wedge uses total dimension | none |
| 841: Degeneracy over a curve | torsion section; vertical subvariety; constant full family | Nonisolated-fibre condition discriminates | none |
| 870: Function-field trace and constant part | zero, constant and non-isotrivial elliptic generic fibre | Geometric trace may grow after cover | R11 |
| 899: Integer characters and countably many closed torus subgroups | n=0; full and trivial subgroups; order-two subgroup | Integer character lattices include nonsaturated ones | R01,R03 |
| 909: Free matrix word growth at bounded height | word length 0,1; height identically 0; c>1 | Injectivity supplies distinct positive words | none |
| 921: Tits: free subgroups of linear groups | n=0,1; solvable and free subgroups | Small ranks excluded by hypothesis | none |
| 931: Invariance of domain in equal real dimension | m=0; identity on open set; empty domain | Equal-dimensional hypothesis retained | none |
| 940: Real constant-rank theorem for Betti fibres | r=0; identity; m≠n | Normal form uses r coordinate directions | none |
| 951: Good-cover refinement on a Riemann surface | empty surface; C; noncompact Riemann surface | Local finiteness, compact closures and Hausdorffness included | none |
| 962: Fixed homology and equivariant Hom | trivial monodromy; non-isotrivial elliptic variation | Fixed-part input has no supplied contract | R11 |
| 976: Generically special subvarieties | constant genus-two curve; torsion point; trace zero | Arbitrary constant subvariety allowed | none |
| 1009: Invariant definable sets of Ax-type | singleton; subtorus coset; short parabola in T² | Ax-type excludes curved semialgebraic arc | R11,R15 |
| 1024: Transport along nonisolated Betti fibres | isolated and nonisolated Betti fibre; identity loop | Nonisolated hypothesis is needed and present | none |
| 1039: Free subgroups in curve monodromy | constant family; no fixed part; finite cover | Monodromy hypotheses exclude trivial group | R11 |
| 1050: Integer-character description of closed subgroups of a real torus | H=0,T,order-two; n=0 | Annihilator  Z,0,2Z respectively in T¹ | R01,R03 |
| 1062: Monodromy-invariant subvarieties of a fibre | constant factor; zero fixed space | Uses explicit fixed-part/definable hypotheses | R11 |
| 1076: Invariant homology gives the function-field trace | constant family; nontrivial isotrivial twist | Function-field trace differs from geometric trace | R11 |
| 1086: Virtually invariant subvarieties in kernels | zero homomorphism; connected kernel; finite cover | Total dimensions and virtual invariance retained | R11 |
| 1109: Curve degeneracy implies GH generic specialness | constant subvariety; torsion section; non-special curve | GH specialness includes constant noncosets | R11 |
| 1121: Full-rank algebraic points outside generic specialness | vertical X; positive base dimension; ramification | Conclusion selects a point outside rank-drop locus | R11 |
| 1166: Horizontal and vertical growth in mixed Ax–Schanuel | zero horizontal or vertical growth | Mixed infrastructure not supplied | R11 |
| 1178: Bigness of the rational stabilizer | trivial stabilizer; positive-dimensional stabilizer | Requires precise definable-counting contract | R11 |
| 1190: Normality and quotient induction | zero normal subgroup; full subgroup; quotient dimension drop | Induction conditional on missing infrastructure | R11 |
| 1206: Finite weakly optimal quotient data | single weakly-special component; finite quotient list | No available LD.6 contract | R11 |
| 1220: Gao t-degeneracy loci | point; torsion section; equality boundary; branched graph | Strict inequality differs from pointwise rank drop | none |
| 1254: Zariski closedness of degeneracy loci | point; t<0 and t>dim ambient; empty locus | No falsifying boundary instance found | R11 |
| 1268: Gao quotient criterion for Betti rank | base point; identity quotient; zero quotient | Strict quotient inequality matches rank criterion | R11 |
| 1310: Non-degeneracy of a dominant fibre product | Y a section; X vertical over point; product components | Projection rank plus vertical rank proves bound | none |
| 1321: The fibre-power dimension induction | constant stabilizer; t>0; positive-dimensional modular fibre | Valid special case omits cited theorem's generality | R13 |
| 1336: Non-degeneracy of universal-curve difference images | g=2,M=4; full level versus coarse moduli | Universal family has no cited owner | R10 |
| 1346: Non-degeneracy criterion for fibre powers | m=1; constant family; reducible fibre product | Irreducible-component caveat retained | R13 |
| 1359: Non-degeneracy is preserved by the difference construction | independent first factor; M=1; constant family | Product identity yields non-degeneracy | R10 |
| 1388: Compact preimages and exact lattice limits | rank zero; constant matrices; ℓ^n times identity | Compactness proof gives exact intersection | R05 |
| 1400: Frobenius polynomial and reciprocity | g=0,1; q=p^a; a_i reciprocity | Constant term q^g and sign convention correct | none |
| 1428: Weil q-numbers | ±sqrt(p); 1 with q>1 | Real Weil values retained; 1 excluded | none |
| 1454: Tate’s isotropic image lemma | zero and maximal isotropic subspace | Image is stated with finiteness hypothesis | none |
| 1466: Point counts are isogeny invariant | dimension zero; elliptic; products | Identity already supplied by DWP.1.5 | R16 |
| 1477: Tate at a split Frobenius prime | split prime; repeated Frobenius eigenvalue | Commutant dimension counts multiplicities | none |
| 1494: Tate full faithfulness over finite fields | A=0; A=B; inseparable p-isogeny with ℓ≠p | Integral map uses saturation, not rational equality alone | none |
| 1524: Monic coefficient lifting | unit ideal; zero coefficient ring; P=1 | Monic leading coefficient may be chosen exactly | none |
| 1535: Fixed-size resultant congruence | zero/unit ideal; degree drops modulo ideal | Fixed Sylvester sizes avoid degree mismatch | none |
| 1546: Multiplicity detected by shifted factors | e=0; R=X; S=1; equal-characteristic and ramified DVR | Slope n·deg(R)·e and nonzero guard agree | none |
| 1557: Recognition from nonzero monic resultant tests | P=1; repeated linear factor; infinite residue field | Dense coefficient lifts detect multiplicity | none |
| 1570: Integer tests for a p-adic polynomial | p=2; common zero resultant excluded | Natural valuation's zero convention guarded | none |
| 1599: Degree from Dieudonné cokernel length | identity; [p]; Frobenius elliptic isogeny | Lengths 0,2g,1 agree with degree valuation | none |
| 1609: Saturated injection on integral p-realization Hom groups | A=0; connected p-kernel; division by p^n | Finite flat torsion, not points, supplies saturation | none |
| 1621: Characteristic polynomial on the p-realization | zero/nilpotent endomorphism; arbitrary perfect k | No semisimplicity assumed for u | none |
| 1634: Algebra acting on a Frobenius polynomial block | a=1; split coefficient tensor; a=2 cyclic U | Full etale tensor and all idempotents retained | none |
| 1665: Semisimplicity of the linear q-Frobenius realization | ordinary/supersingular elliptic; repeated isotypic factor | Only q-Frobenius is asserted semisimple | none |
| 1678: Central simplicity of a Frobenius block algebra | a=1; L⊗K a product | After splitting B is M_a | none |
| 1690: Dimension of the semilinear Frobenius commutant | a=1; one block; repeated multiplicity e | Dimension deg(m)·e² agrees with centralizer | none |
| 1704: Rational and integral p-Tate comparison | A=0; A=B; integral versus rational maps | Opposite algebra required and retained | none |
| 1722: Integral Tate full faithfulness at the characteristic prime | connected kernels; p=2 | Integral full faithfulness follows from saturation | none |
| 1733: Rational p-Tate comparison | endomorphism algebra with noncommuting elements | Contravariance reverses multiplication | none |
| 1742: Characteristic-prime invariant of a simple endomorphism algebra | unramified K; ramified e_v>1; supersingular slope 1/2 | f_v·ord_v(π)/a includes correct ramification cancellation | none |
| 1775: Prime-to-p and p lattice spaces | identity marking; dimension zero; infinite support | Action C(α)^−1 restores left composition | none |
| 1803: Honda–Tate simple isogeny classification | ±sqrt(p); ordinary elliptic Weil number | Real places and division-algebra multiplicity retained | none |
| 1817: Frobenius polynomial determines the isogeny class | dimension zero versus positive; repeated simple factor | Equal polynomials give equal multiplicities | none |
| 1827: Commutative endomorphisms in the nonreal prime-field case | real factor excluded; nonordinary nonreal prime-field simple A | Prime-field invariant forces commutativity | none |
| 1838: Prime-field p-realization Frobenius polynomial | a=1; dual of rank-two realization | Linear dual preserves characteristic polynomial | none |
| 1851: Marked quasi-isogenies classified by lattices | identity; [ℓ] marking; contravariant p-component | Transport by C(f)^−1 has correct direction | none |
| 1867: Finite-support lattice tuples are realized over the prime field | one changed prime; two primes; infinite support excluded | Finite flat quotient realizes finite modifications | none |
| 1884: Realization of nonreal prime-field orders | maximal/nonmaximal order; nonprojective rank-one lattice | All orders containing π,p/π allowed | none |
| 1895: Isomorphism classes as rational orbits | change of marking; automorphism stabilizer | Rational orbit forgets marking | none |
| 1904: Prime-field marked and unmarked classification | dimension zero; identical B with distinct markings | Prime-field dual convention compatible | none |
| 1939: Adelic class set of the endomorphism group | rational unit; conjugate compact; nonmaximal order | Class set distinguished from full lattice monoid | none |
| 1967: The prime-field p-component reduction | ordinary/supersingular p-component; a=1 | Prime-field assumption essential and present | none |
| 1979: Discriminant and ordered-root bounds | degree 0,1; repeated roots; q=1 | Unequal-value ordered product stays positive | none |
| 1991: Finite-support adelic stabilizers in a prime-field isogeny class | standard lattice; nonmaximal endomorphism order | Local orbit and index estimates not supplied | R08 |
| 2015: Class-set comparison by reduced norms | one CM field; definite quaternion factor; conjugate maximal compact | Narrow versus ordinary class conventions retained | none |
| 2030: Conditional rational-orbit bound from local lattices | empty X; D=0; one orbit; nontrivial stabilizer index | Finite quotient hypotheses prevent Nat.card vacuity | none |
| 2050: Coarse prime-field isomorphism count at fixed adelic level | repeated simple factors; D_*=1 | Global bound remains conditional on missing local contracts | R08 |
| 2088: Lang surjectivity for an abelian variety | dimension zero; ordinary/supersingular elliptic | d(Frob−1)=−1 makes isogeny etale | none |
| 2098: Units that are norms modulo norms of units (Lemmermeyer) | trivial ambiguous class; norm of unit versus norm of element | Exact quotient matches Lemmermeyer | none |
| 2110: Density of primes splitting in a class-number-one CM field | ramified finitely many primes; all nine quadratic characters | Independent square classes yield density 1−2^−9; class-number certificates need their owner | R18 |
| 2121: Elliptic curve with class-number-one endomorphisms | split versus inert prime; exceptional finite set | Splitting and class-number-one hypotheses retained | none |
| 2133: Elliptic point groups in odd characteristic | odd p; p=2 excluded; trace constraints | p=2 exclusion needed | none |
| 2143: Line-bundle realization over a finite field | zero symmetric map; polarization; nonclosed finite field | Lang kills descent obstruction; ampleness geometric | none |
| 2153: Principal polarizations on CM elliptic powers | rank 1; large rank; weighted versus unweighted count | Unitary mass asymptotic not supplied | R09 |
| 2170: Squarefree nonreal polarization bound | repeated factor excluded; real factor excluded | Squarefree/nonreal assumptions protect commutative bound | none |
| 2216: Reconstruction from integer power sums | g=0,1; q=0; reciprocal polynomial pair | Newton induction recovers upper half, reciprocity lower half | none |
| 2227: Counting Weil polynomials by power sums | g=1; q=2; endpoint integer counts | Enlarged (4g+1)^g bound controls floors | none |
| 2237: Asymptotic count of isogeny classes | fixed q; g→∞ | g log g error is o(g²) | none |
| 2249: Coarse isomorphism counts and conditional numerical assembly | fixed p; conditional exponent 17 | 69/4 is explicitly conditional; no unproved sharp bound asserted | R08 |
| 2267: DiPippo–Howe lower bound for isogeny classes | small n with negative lower bound; n large | Only eventual positivity used for logarithm | none |
| 2281: Asymptotic exclusion of squarefree nonreal ppavs | repeated and real factors excluded; fixed split prime | ½g²log g lower bound dominates O_p(g²) | R09 |

## Suggested.lean declaration and context inventory

All lines refer to `packages/AbelianSchemesAndArithmeticModuliPartII/Suggested.lean`. In the tensor rows, `R,M` means independent type universes with `[CommRing R] [AddCommGroup M] [Module R M]`. Later declarations do not retain those section variables. Finite/free/projective, prime, topological and finite-quotient assumptions listed below occur explicitly in the respective signatures. These are read-off contexts, not elaborator output: no Lean command was run.

| Line | Layer | Declaration | Variable and instance context | Body / audit |
|---|---|---|---|---|
| 52 | P0 | def `tensorSymmetricPower` | R,M; n:ℕ | admitted; R01 |
| 55 | P0 | lemma `tensorSymmetricPower_mem` | R,M; n; t:TensorPower R n M | admitted; read; see statement audit |
| 61 | P0 | lemma `tensorSymmetricPower_diagonal` | R,M; n; v:M | admitted; read; see statement audit |
| 65 | P0 | def `tensorSymmetricPower_map` | R,M; N with AddCommGroup and Module R; n; linear f:M→N | admitted; R01 |
| 70 | P0 | lemma `tensorSymmetricPower_ext` | R,M; n; x,y in invariant subtype | admitted; read; see statement audit |
| 75 | P0 | example `example` | R,M; degree 0 | admitted; R03 |
| 79 | P0 | example `example` | R,M; degree 1 | admitted; R03 |
| 83 | P0 | example `example` | R=ℤ, M=Fin 2→ℤ; no section parameters | admitted; R03 |
| 89 | P0 | abbrev `degreeCompletion` | R,M; dependent product over n:ℕ | real body; read; see statement audit |
| 91 | P0 | def `degreeCompletion_component` | R,M; n; c:degreeCompletion | admitted; R01 |
| 95 | P0 | lemma `degreeCompletion_component_apply` | R,M; n; c | admitted; read; see statement audit |
| 99 | P0 | lemma `degreeCompletion_ext` | R,M; c,d | admitted; read; see statement audit |
| 104 | P0 | lemma `degreeCompletion_zero` | R,M; n | admitted; read; see statement audit |
| 109 | P0 | example `example` | R,M; degree 0 | admitted; R03 |
| 113 | P0 | example `example` | R,M; n; x in degree n | admitted; R03 |
| 121 | P0 | example `example` | R,M; type equality | admitted; R03 |
| 129 | P0 | def `dividedTensor` | R,M; n; v | admitted; R01 |
| 132 | P0 | lemma `dividedTensor_coe` | R,M; n; v | admitted; read; see statement audit |
| 138 | P0 | def `shuffleDividedPowers` | R,M; m,n; bilinear map | admitted; R01 |
| 144 | P0 | abbrev `tensorSymmetricAlgebra` | R,M; direct sum over ℕ | real body; read; see statement audit |
| 148 | P0 | instance `tensorSymmetricAlgebra_commRing` | R,M; proposed CommRing instance | admitted; R01 |
| 151 | P0 | instance `tensorSymmetricAlgebra_algebra` | R,M; proposed Algebra R instance | admitted; R01 |
| 154 | P0 | def `tensorSymmetricAlgebra_include` | R,M; n; DirectSum inclusion | real body; read; see statement audit |
| 158 | P0 | lemma `tensorSymmetricAlgebra_mul` | R,M; m,n; invariant x,y | admitted; read; see statement audit |
| 164 | P0 | lemma `tensorSymmetricAlgebra_unit` | R,M; ring unit and degree-zero diagonal | admitted; read; see statement audit |
| 169 | P0 | lemma `tensorSymmetricAlgebra_divided` | R,M; m,n; v | admitted; read; see statement audit |
| 175 | P0 | def `dividedPowerComparison` | R,M; algebra homomorphism | admitted; R01 |
| 179 | P0 | lemma `dividedPowerComparison_dp` | R,M; n; v | admitted; read; see statement audit |
| 184 | P0 | def `dividedPowerComparisonEquiv` | R,M; explicit Module.Free R M | admitted; R01 |
| 188 | P0 | lemma `dividedPowerComparisonEquiv_toAlgHom` | R,M; explicit Module.Free R M | admitted; read; see statement audit |
| 193 | P0 | example `example` | R,M; degree-zero linear equivalence | admitted; R03 |
| 198 | P0 | example `example` | R=M=ZMod 2; no section parameters | admitted; R03 |
| 205 | P0 | example `example` | R,M; explicit Module.Free R M | admitted; R03 |
| 210 | P0 | def `tensorSquareEquiv` | R,M; binary tensor equivalence | admitted; R01 |
| 213 | P0 | lemma `tensorSquareEquiv_tprod` | R,M; v:Fin 2→M | admitted; read; see statement audit |
| 217 | P0 | theorem `degreeTwoInvariant` | R,M; submodule map under binary equivalence | admitted; read; see statement audit |
| 223 | P0 | def `invariantTensorMultigrading` | R; finite decidable ι; N_i additive R-modules; explicit Module.Finite and Module.Projective for every i; k:ℕ; M absent | admitted; R01 |
| 234 | F2 | theorem `monicCoefficientLift` | D,O commutative rings; ring map φ; ideal I; coefficient-surjectivity modulo I; monic P | admitted; read; see statement audit |
| 243 | F2 | theorem `fixedResultantCongruence` | O commutative ring; ideal I; P,Q,Q′; m,n:ℕ; coefficients Q≡Q′ mod I | admitted; read; see statement audit |
| 251 | F2 | theorem `padicResultantRecognition` | prime p; P,Q over PadicInt p monic; equal valuations on all common nonzero integer monic tests | admitted; read; see statement audit |
| 265 | B2 | theorem `titsFreeSubgroup` | K field of characteristic zero; n:ℕ; subgroup Γ of GL_n(K); every finite-index subgroup nonsolvable | admitted; read; see statement audit |
| 272 | B2 | theorem `freeMatrixWordGrowth` | n; injective free-group map; nonnegative submultiplicative ρ; ρ(1)≤1; c>1; generators and inverses bounded | admitted; read; see statement audit |
| 288 | B2 | theorem `constantRankLocal` | m,n,r; r≤m,n; k≥1; open U; C^k f; constant derivative rank r on U; x∈U | admitted; read; see statement audit |
| 303 | B2 | theorem `riemannGoodCover` | S topological, T2, second-countable, charted over ℂ; arbitrary index type ι; open covering C | admitted; read; see statement audit |
| 316 | B2 | abbrev `BettiTorus` | n:ℕ; native AddCircle 1 | real body; read; see statement audit |
| 319 | B2 | def `torusCharacter` | n:ℕ; m:Fin n→ℤ | admitted; R01 |
| 322 | B2 | lemma `torusCharacter_apply` | n; m:Fin n→ℤ; x:BettiTorus n | admitted; read; see statement audit |
| 326 | B2 | def `torusAnnihilator` | n; additive subgroup H of BettiTorus n | admitted; R01 |
| 330 | B2 | lemma `torusAnnihilator_mem` | n; H; integer character vector m | admitted; read; see statement audit |
| 335 | B2 | example `example` | n=1; trivial subgroup | admitted; R03 |
| 338 | B2 | example `example` | n=1; full subgroup | admitted; R03 |
| 341 | B2 | example `example` | m:Fin 1→ℤ; subgroup generated by 1/2 | admitted; R03 |
| 346 | B2 | theorem `closedTorusSubgroup_characters` | n; subgroup H; explicit closedness of H; x in torus | admitted; read; see statement audit |
| 351 | B2 | theorem `countableClosedTorusSubgroups` | n:ℕ; closed-subgroup set | admitted; read; see statement audit |
| 355 | B2 | theorem `invarianceOfDomain` | m:ℕ; open U⊆ℝ^m; continuous injective f:U→ℝ^m | admitted; read; see statement audit |
| 362 | F2 | theorem `shiftedFactorSlope` | O domain and DVR; fraction field K and scalar map; irreducible π; monic R,S; deg R>0; coprime over K; e:ℕ; approximations mod π^(2n) | admitted; read; see statement audit |
| 378 | F2 | theorem `resultantRecognition` | D commutative; O domain and DVR; ring map φ dense modulo every π^N; irreducible π; monic P,Q; equal valuations on common nonzero tests | admitted; read; see statement audit |
| 392 | F6 | theorem `powerSumReconstruction` | q,g:ℕ; monic P,Q over ℤ of degree 2g; explicit indexed complex root factorizations; reciprocal coefficients; first g power sums equal | admitted; read; see statement audit |
| 409 | F6 | theorem `weilPolynomialCount` | q,g:ℕ; q≥2,g≥1; monic reciprocal integer polynomials with specified complex root modulus | admitted; read; see statement audit |
| 424 | F4 | theorem `weilGeneratorDiscriminantBound` | K number field; prime p; integral π generating K over ℚ; every complex embedding has norm sqrt p | admitted; read; see statement audit |
| 438 | F4 | theorem `orderedRootProductBound` | q,m:ℕ; q≥1; monic integer P degree m; indexed complex root factorization and modulus | admitted; read; see statement audit |
| 454 | F4 | theorem `rationalOrbitCount` | G group acting on X; subgroups Γ,K₀; D,h:ℕ; explicit Finite instances for orbit and double-coset quotients; orbit bound; class number equality; stabilizer containment and finite index bound | admitted; read; see statement audit |

## Named README API and Check inventory

The mathematical audit for each API is the containing headline row above. All 56 Checks were read and tested mathematically; no admitted Lean example is counted as a proved test.

| Line | Kind | Name | Containing headline |
|---|---|---|---|
| 178 | API | `tensorSymmetricPower_mem` | Invariant tensor powers |
| 179 | API | `tensorSymmetricPower_diagonal` | Invariant tensor powers |
| 180 | API | `tensorSymmetricPower_map` | Invariant tensor powers |
| 182 | API | `tensorSymmetricPower_ext` | Invariant tensor powers |
| 187 | Check | `tensorSymmetricPower_zero` | Invariant tensor powers |
| 188 | Check | `tensorSymmetricPower_one` | Invariant tensor powers |
| 190 | Check | `tensorSymmetricPower_nonfixed` | Invariant tensor powers |
| 206 | API | `degreeCompletion_component` | Degree completion of symmetric tensors |
| 207 | API | `degreeCompletion_ext` | Degree completion of symmetric tensors |
| 208 | API | `degreeCompletion_zero` | Degree completion of symmetric tensors |
| 212 | Check | `degreeCompletion_zero_component` | Degree completion of symmetric tensors |
| 213 | Check | `degreeCompletion_single` | Degree completion of symmetric tensors |
| 215 | Check | `degreeCompletion_product` | Degree completion of symmetric tensors |
| 230 | API | `tensorSymmetricAlgebra_mul` | Shuffle multiplication and divided powers |
| 232 | API | `tensorSymmetricAlgebra_unit` | Shuffle multiplication and divided powers |
| 234 | API | `tensorSymmetricAlgebra_divided` | Shuffle multiplication and divided powers |
| 238 | Check | `tensorSymmetricAlgebra_zero_degree` | Shuffle multiplication and divided powers |
| 239 | Check | `tensorSymmetricAlgebra_char_two` | Shuffle multiplication and divided powers |
| 241 | Check | `tensorSymmetricAlgebra_free` | Shuffle multiplication and divided powers |
| 312 | API | `universalVectorExtension_forget` | Universal vector extension of the dual |
| 313 | API | `universalVectorExtension_kernel` | Universal vector extension of the dual |
| 314 | API | `universalVectorExtension_represent` | Universal vector extension of the dual |
| 316 | API | `universalPoincare_pullback` | Universal vector extension of the dual |
| 321 | Check | `universalVectorExtension_zero` | Universal vector extension of the dual |
| 323 | Check | `universalVectorExtension_elliptic` | Universal vector extension of the dual |
| 325 | Check | `universalVectorExtension_dual` | Universal vector extension of the dual |
| 374 | API | `momentMap_truncate` | Moments of a formal smooth group |
| 376 | API | `momentMap_degree_one` | Moments of a formal smooth group |
| 377 | API | `momentMap_functorial` | Moments of a formal smooth group |
| 382 | Check | `momentMap_zero` | Moments of a formal smooth group |
| 383 | Check | `momentMap_additive_char_zero` | Moments of a formal smooth group |
| 385 | Check | `momentMap_additive_char_p` | Moments of a formal smooth group |
| 411 | API | `completedPoincare_truncate` | Finite and completed Poincaré sheaves |
| 413 | API | `completedPoincare_unit` | Finite and completed Poincaré sheaves |
| 414 | API | `completedPoincare_filtration` | Finite and completed Poincaré sheaves |
| 419 | Check | `completedPoincare_zero` | Finite and completed Poincaré sheaves |
| 420 | Check | `completedPoincare_first` | Finite and completed Poincaré sheaves |
| 422 | Check | `completedPoincare_base` | Finite and completed Poincaré sheaves |
| 680 | API | `periodCoordinates_betti` | Period-coordinate trivializations |
| 682 | API | `periodCoordinates_fibre` | Period-coordinate trivializations |
| 684 | API | `periodCoordinates_leaf` | Period-coordinate trivializations |
| 685 | API | `periodCoordinates_transition` | Period-coordinate trivializations |
| 690 | Check | `periodCoordinates_point` | Period-coordinate trivializations |
| 692 | Check | `periodCoordinates_zero` | Period-coordinate trivializations |
| 693 | Check | `periodCoordinates_base_not_counted` | Period-coordinate trivializations |
| 736 | API | `bettiForm_pullback` | The descended Betti form |
| 738 | API | `bettiForm_closed` | The descended Betti form |
| 739 | API | `bettiForm_nonnegative` | The descended Betti form |
| 740 | API | `bettiForm_scale` | The descended Betti form |
| 744 | Check | `bettiForm_elliptic` | The descended Betti form |
| 745 | Check | `bettiForm_zero_multiplication` | The descended Betti form |
| 746 | Check | `bettiForm_single_fibre` | The descended Betti form |
| 748 | Check | `bettiForm_nonprincipal_type` | The descended Betti form |
| 777 | API | `nonDegenerate_rank` | Non-degenerate subvarieties |
| 779 | API | `nonDegenerate_form` | Non-degenerate subvarieties |
| 780 | API | `nonDegenerate_smooth_point` | Non-degenerate subvarieties |
| 785 | Check | `nonDegenerate_single_fibre` | Non-degenerate subvarieties |
| 787 | Check | `nonDegenerate_diagonal` | Non-degenerate subvarieties |
| 789 | Check | `nonDegenerate_torsion` | Non-degenerate subvarieties |
| 851 | API | `curveDegenerate_point` | Degeneracy over a curve |
| 852 | API | `curveDegenerate_open` | Degeneracy over a curve |
| 854 | API | `curveDegenerate_rank` | Degeneracy over a curve |
| 859 | Check | `curveDegenerate_torsion` | Degeneracy over a curve |
| 860 | Check | `curveDegenerate_fibre` | Degeneracy over a curve |
| 862 | Check | `curveDegenerate_full_family` | Degeneracy over a curve |
| 882 | API | `functionFieldTrace_map` | Function-field trace and constant part |
| 883 | API | `functionFieldTrace_universal` | Function-field trace and constant part |
| 885 | API | `functionFieldTrace_complement` | Function-field trace and constant part |
| 890 | Check | `functionFieldTrace_constant` | Function-field trace and constant part |
| 891 | Check | `functionFieldTrace_zero` | Function-field trace and constant part |
| 892 | Check | `functionFieldTrace_nonconstant` | Function-field trace and constant part |
| 987 | API | `genericallySpecial_components` | Generically special subvarieties |
| 989 | API | `genericallySpecial_constant` | Generically special subvarieties |
| 991 | API | `genericallySpecial_torsion` | Generically special subvarieties |
| 996 | Check | `genericallySpecial_constant_curve` | Generically special subvarieties |
| 998 | Check | `genericallySpecial_torsion_point` | Generically special subvarieties |
| 1001 | Check | `genericallySpecial_trace` | Generically special subvarieties |
| 1230 | API | `degeneracyLocus_member` | Gao t-degeneracy loci |
| 1232 | API | `degeneracyLocus_mono` | Gao t-degeneracy loci |
| 1233 | API | `degeneracyLocus_zero` | Gao t-degeneracy loci |
| 1239 | Check | `degeneracyLocus_point` | Gao t-degeneracy loci |
| 1241 | Check | `degeneracyLocus_torsion_section` | Gao t-degeneracy loci |
| 1243 | Check | `degeneracyLocus_strict` | Gao t-degeneracy loci |
| 1245 | Check | `degeneracyLocus_ramified_graph` | Gao t-degeneracy loci |
| 1409 | API | `frobeniusPolynomial_integral` | Frobenius polynomial and reciprocity |
| 1410 | API | `frobeniusPolynomial_reciprocal` | Frobenius polynomial and reciprocity |
| 1412 | API | `frobeniusPolynomial_product` | Frobenius polynomial and reciprocity |
| 1413 | API | `frobeniusPolynomial_points` | Frobenius polynomial and reciprocity |
| 1417 | Check | `frobeniusPolynomial_zero` | Frobenius polynomial and reciprocity |
| 1419 | Check | `frobeniusPolynomial_elliptic` | Frobenius polynomial and reciprocity |
| 1420 | Check | `frobeniusPolynomial_native` | Frobenius polynomial and reciprocity |
| 1438 | API | `weilQNumber_norm` | Weil q-numbers |
| 1439 | API | `weilQNumber_conjugate` | Weil q-numbers |
| 1440 | API | `weilQNumber_power` | Weil q-numbers |
| 1444 | Check | `weilQNumber_real` | Weil q-numbers |
| 1445 | Check | `weilQNumber_one` | Weil q-numbers |
| 1446 | Check | `weilQNumber_frobenius` | Weil q-numbers |
| 1645 | API | `frobeniusBlock_relation` | Algebra acting on a Frobenius polynomial block |
| 1646 | API | `frobeniusBlock_dimension` | Algebra acting on a Frobenius polynomial block |
| 1648 | API | `frobeniusBlock_action` | Algebra acting on a Frobenius polynomial block |
| 1653 | Check | `frobeniusBlock_prime` | Algebra acting on a Frobenius polynomial block |
| 1654 | Check | `frobeniusBlock_split` | Algebra acting on a Frobenius polynomial block |
| 1656 | Check | `frobeniusBlock_product_coeff` | Algebra acting on a Frobenius polynomial block |
| 1784 | API | `markedLattice_primeToP` | Prime-to-p and p lattice spaces |
| 1786 | API | `markedLattice_p` | Prime-to-p and p lattice spaces |
| 1788 | API | `markedLattice_action` | Prime-to-p and p lattice spaces |
| 1793 | Check | `markedLattice_identity` | Prime-to-p and p lattice spaces |
| 1794 | Check | `markedLattice_zero` | Prime-to-p and p lattice spaces |
| 1795 | Check | `markedLattice_support` | Prime-to-p and p lattice spaces |
| 1946 | API | `adelicClassSet_mk` | Adelic class set of the endomorphism group |
| 1948 | API | `adelicClassSet_equiv` | Adelic class set of the endomorphism group |
| 1949 | API | `adelicClassSet_stabilizer` | Adelic class set of the endomorphism group |
| 1954 | Check | `adelicClassSet_rational` | Adelic class set of the endomorphism group |
| 1955 | Check | `adelicClassSet_compact` | Adelic class set of the endomorphism group |
| 1957 | Check | `adelicClassSet_notPic` | Adelic class set of the endomorphism group |

## Source verification ledger

All 17 bibliography works were fetched through the sources service from legal repositories, publisher archives or author pages. WM and Milne were image-only scans; the service's OCR completed and their numbered extracts were read. No source text is embedded here. A matched locator is not certification of every auxiliary assertion or every line of its proof.

| Source | Locator group checked | Numbered extraction | Result |
|---|---|---|---|
| KS | Definition 1.6 | KS line 367; line 385 | Multigrading and factorial convention; not a proof of all the proposed arbitrary-module API. |
| KS | Notation 2.2; equation (2.1.1) | KS line 571 | Dual universal extension and cotangent conventions. |
| KS | Equations (2.1.2)–(2.1.3), Remark 2.3 | KS line 592 | Moments, associated graded and rational isomorphism. |
| KS | Definitions 2.4/2.7; equations (2.1.4)–(2.1.5) | KS line 633; line 661 | Finite pushforwards, truncation sequence and rigidification. |
| KS | Theorem 2.8 | KS line 700 | Isogeny-map direction and etale isomorphism condition. |
| KS | Corollary 2.9; Definition 2.10 | KS line 731; line 741 | Torsion splitting and moments retain etale-dual conditions. |
| KS | Corollary 2.11 | KS line 751 | Inverse-pullback equivariance. |
| KS | Proposition 2.12; Corollary 2.14 | KS line 754; line 784 | Comultiplication and factorial condition. |
| KS | Theorem 2.15 | KS line 795 | Ordinary completed cohomology, degree d and canonical twist. |
| KS | Theorem 2.36 | KS line 1203 | Field of characteristic zero; identity extension and splitting. |
| KS | Definitions 3.2–3.3; Theorem 3.5 | KS line 1308; line 1316; line 1360 | d+ν convention and moment-compatible smooth model. |
| KS | Notation 5.1; Proposition 5.9 | KS line 2633; line 2766 | Ordinary CM setting located; formal-union shorthand fails as a unit-adic functor over O_Cp (R04). |
| KS | Lemmas 5.11–5.12; Definition 5.13; Lemma 5.14 | KS line 2805; line 2855; line 2861; line 2880 | Generic-fibre recompletion, projected connection and translations distinguished. |
| DGH | Propositions 2.1–2.2 | DGH line 326; line 341 | Betti coordinates and full total-dimension wedge criterion. |
| DGH | Lemmas 2.3/2.4/2.6; Corollary 2.5 | DGH line 382; line 450; line 489; line 504 | Factor two, kernel and descent; locator-type correction R17. |
| DGH | Proposition 2.7 | DGH line 532 | Top wedge versus maximal Betti rank. |
| DGH | Theorem 6.2 | DGH line 1285 | Quasi-finite curve-moduli map, g≥2 and M≥3g−2. |
| DGH | Lemma B.3; Definition B.4 | DGH line 2074; line 2090 | Dense-open invariance and smooth-base convention. |
| GH | Theorem 5.1; Ax-type definition; Lemma 5.2 | GH line 866; line 878; line 902; line 909 | Curve hypotheses and invariant-definable-set dichotomy. |
| GH | Proposition 5.3 | GH line 996 | Monodromy-type and fixed-space hypotheses. |
| GH | Proposition 5.4 | GH line 1075 | Nonisolated Betti-fibre transport and functoriality. |
| GH | Lemmas 5.5–5.6 | GH line 1178; line 1186 | Free monodromy and function-field trace input; upstream Hodge obligations remain R11. |
| GH | Lemma 5.8 | GH line 1238 | Virtual invariance in kernels and dimension hypotheses. |
| GH | Lemma 6.2 | GH line 1454 | Algebraic full-rank point outside generic specialness. |
| GGK | Proposition 5.2 proof, Step 1, (5.4) | GGK line 1053; line 1061 | Total dimension rm+dim S and smooth-base restriction. |
| Gao–Betti | Theorem 1.1 | Gao–Betti line 81 | Strict quotient/rank criterion. |
| Gao–Betti | Theorem 10.1 | Gao–Betti line 1276 | General t-dependent modular-image rank bounds; narrowed in package (R13). |
| Gao–Ax | Theorem 4.1; Proposition 5.1; Theorem 5.2 | Gao–Ax line 620; line 700; line 715 | Graph component, stabilizer alternative and sequence of height bounds. |
| Gao–Ax | Proposition 6.1; Definition 8.1; Theorem 8.2 | Gao–Ax line 851; line 1139; line 1143 | Normality reduction and finite weakly-optimal data. |
| Gao–Survey | Lemma 6.2; Theorem 6.5 and footnote 6 | Gao–Survey line 735; line 776; line 794 | Product rank and geometrically irreducible component convention. |
| LT | Lemma 2.1; Corollary 2.2 | LT line 165; line 180 | Source has overly small power-sum interval and lacks the full reciprocity caveat; package enlarges the constant and states reciprocity. |
| LT | Proposition 4.11; Example 4.13 | LT line 768; line 780 | Rosati orbits and units modulo norm units. |
| LT | Propositions 4.16–4.17 | LT line 842; line 907 | Both repeated-factor and real-factor exclusions are retained. |
| LT | Equation (51); Lemma 5.11; equation (56) | LT line 1237; line 1405; line 1418 | Source prints coefficient 1; corrected coefficient 1/2 requires its own mass calculation (R09). |
| LT | Lemma 5.19 | LT line 1554 | Source omits the characteristic-two exception; package corrects it. |
| Lemmermeyer | Proposition 1 | Lemmermeyer line 75 | Ambiguous/strongly ambiguous quotient; source line 93 has a strongly-ambiguous slip not copied into the package statement. |
| Conrad | Lemma 2.3; Theorem 2.6 | Conrad line 290; line 359 | Algebraically closed realization followed by finite-field descent. |
| Tate | Theorem 1(c) | Tate line 219 | Isogeny/polynomial/point-count equivalence. |
| Waterhouse | Theorem 6.1 | Waterhouse line 1196 | Nonreal prime-field orders and nonprojective lattices. |
| WM | Part I Theorems 5–6 and saturation proof | WM line 150; line 155; line 163 | Contravariant injection and saturation. |
| WM | Part II Theorems 1–2 and proofs | WM line 299; line 302; line 338; line 345 | p-Tate commutant dimensions and two opposite-algebra sign reversals. |
| Milne | §1, printed pp.65–66 | Milne line 85; line 137 | Polynomial recognition and Dieudonne/Frobenius comparison; scan read through service OCR. |
| DPH | Theorem 1.3 | DPH line 79 | Constants and possibly negative finite-n lower bound match. |

## Supplier and dependency audit

The current-head contracts inspected were AbelianSchemesAndArithmeticModuli (a9b3fcc), ComplexComparisonPartII (c9ccfac), GeometryOfNumbersAndQuadraticArithmetic (01c64f0), FiniteFlatGroupsAndIntegralPadicHodgeTheory (90b0086), JacobianChallengePartII (5a975b3), DeligneWeightsAndPurity (e9585a0), AdelicAlgebraicGroups (7b84aae), and PELModuli (2d82d07). Main-tree supplier sections inspected were SchemeAndStackFoundations, AlgebraicVectorBundles, DifferentialGeometry, ClassFieldTheory, RepresentationTheory/SemisimpleAlgebras, Chebotarev, Completed/EffectiveBounds, Completed/HodgeStructures and ImaginaryQuadraticClassNumber. Missing H.2/LD.6 contracts are R11. The two explicitly supplied sibling heads, ArithmeticDynamics and ErdosProgressionPowers, were searched locally for overlapping objects and names; this package contains no supplier citation to either of them.

The pinned files were read for TensorPower/PiTensorProduct reindexing, eqLocus and submodule intersections, divided-power algebra, AddCircle, polynomial resultants, PadicInt coefficient approximation and valuation, Newton identities, and TauCeti.symmetricTensors. Mathlib's symmetric tensor-power quotient was distinguished from the proposed invariant submodule. The named library interfaces exist at the manifest pins; the links in the package still require R14.

Exact dependency-gate output (exit status 1):

```text
NOT IN ORDER: AbelianSchemesAndArithmeticModuliPartII (insert it after its last supplier)
depcheck: 3 roadmaps, 20 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line. Absence from the order is not a finding under the supplied design-stage rule. The gate's three-roadmap graph is not evidence that the missing supplier contracts exist. No ownership move from a later roadmap is proposed; the repairs import earlier owners or introduce explicit prerequisites/gaps.

## Verified sound

Read all 2,383 README lines and all 1,267 Suggested.lean lines, including the omitted-signature comments. Inventoried **62 executable declarations** (50 named declarations and 12 examples), **115 headline targets**, **59 named API entries**, and **56 Checks** in 18 blocks. The mathematical boundary tests are recorded above. There are **43 checked source-locator groups** in the ledger, and all **115 Source paragraphs** were inventoried. Eight available current-head supplier roadmaps and nine main/completed supplier roadmaps were inspected by section; the two designated siblings have **zero citations** to check in this package. Thirty-seven actual Lean declaration names are absent from the README. No Lean example is proved: all 12 are admitted.

No counterexample was found to the F2 recognition signatures under their explicit hypotheses, including zero/unit ideals in lifting, characteristic-two and equal-characteristic DVR tests, and nonzero-resultant guards. The reciprocal polynomial reconstruction/count, ordered unequal-root product, and finite-quotient rational-orbit bound survived the recorded degenerate tests. The factor-two Betti normalization, contravariant p-realization, opposite-algebra signs and finite-support lattice convention were checked against the cited constructions. These conclusions do not discharge R01's admitted data or the missing inputs R08–R11.

The pull-request diff changes only the package's README.md, Suggested.lean, metadata.toml and review.json (3,659 inserted lines). The review added only this report and scratch notes. No Lean build, git write, issue/PR mutation or message was performed.

## Not verifiable

- **Lean elaboration and elaborated implicit binders:** no Lean build or scratch elaboration command was authorized in this read-only pass. The inventory records source-level signatures; it does not claim successful elaboration.
- **Complete proof coverage of the legal sources:** the ledger certifies the listed locator groups. It does not independently certify every subsidiary lemma in the 115 citation paragraphs, in particular the full DPH lattice-volume estimates, all local mass factors in LT, and all formal-functions/derived-completion comparisons in KS. These are available texts, not missing-source requests.
- **Future supplier implementations:** current roadmap statements are contracts, not implementations. The absent H.2/LD.6 contracts and the falsely attributed GN/JC inputs are findings, not assumptions accepted for verification.
- **Published/preprint numbering beyond the versions read:** the source checks use the linked, versioned preprints or publisher/author scans. No assertion is made that every preprint page locator agrees with the separately listed journal version.

No unresolved missing-text request remains. The initial GGK fetch required the publisher-open licence classification and then succeeded; both scanned sources were read after OCR.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "46bb9812d1f7c1386aabbe7dba3f514309c714db", "job": "RT-AbelianSchemesAndArithmeticModuliPartII~1a", "model": "gpt-6-astra", "worker": "chris-1"} -->
