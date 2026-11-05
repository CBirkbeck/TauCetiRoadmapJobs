# Review of EnriquesSurfacesAndIntegralNonexistence (pull request #1488 at 7cee31c)

**Verdict:** accepted

No new findings. All three previous findings are repaired; no P1 or P2 remains. This is readiness for human final approval, conditional on the six declared supplier contracts, not approval or a claim that the planned theorems have been proved.

:robot: Independent AI review. This is an incremental re-review of 64 changed lines since e030a1b. The unchanged mathematical audit is carried forward from [r1]; fresh verification covers the repairs, changed passages, their suppliers and affected consumers.

## Previous findings

- R01 — repaired: TauCetiRoadmap/EnriquesSurfacesAndIntegralNonexistence/README.md:73 names WeilConjectures §§7.12–7.14 and their actual prose targets. The corresponding Needs lines, conventions and downstream paragraph no longer advertise the seven nonexistent exports.
- R02 — repaired: TauCetiRoadmap/EnriquesSurfacesAndIntegralNonexistence/Suggested.lean:115–120 retains the two discriminant-group headlines. Both isotropic-cardinality declarations are deleted; README.md:1591 and :1615 retain the mathematics without claiming those Lean declarations.
- R03 — repaired: TauCetiRoadmap/EnriquesSurfacesAndIntegralNonexistence/README.md:1940 cites NeronModelsAndSemistableAbelianVarietiesPartII §3.11 and distinguishes its geometric Kodaira comparison from this roadmap's §4.4 residue-field isomorphism.

## Verified sound

**Scope and counts.** Both files are at 7cee31ca86aa751c9c1d4b81be728a5fbc9259bd. The diff contains 26 insertions and 38 deletions. All changed passages were read, including fourteen numbered subsections, supplier and convention edits, the LLR reference, the import change and deleted declarations. The table has 20 fresh rows and 107 individually attributed carried rows. It retains the prior report's coverage of 110 numbered targets, the headlines and the present fifteen-target sample. The outside-folder diff and final git status are empty. No pull-request file was changed.

**Gate, dependency direction and elaboration.** The worker's head-specific gate passed, including its targeted build. The independent gate rerun passed all reported scanners and dependency checks. Independently running the targeted build and direct Lean elaboration succeeded with only four declaration-uses-sorry warnings. The required dependency command returned:

~~~text
depcheck: 204 roadmaps, 1498 edges, 0 problem(s)
~~~

There is no UPWARD, CYCLE or moved line. The independent scanner result was:

~~~text
gate EnriquesSurfacesAndIntegralNonexistence: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
~~~

The targeted build was lake build TauCetiRoadmap.EnriquesSurfacesAndIntegralNonexistence.Suggested. Direct elaboration used lake env lean on the original file, then a scratch copy containing #check @name for all ten declarations. All ten expanded signatures match the README: the positive-cone statement keeps its three inequalities; the dyadic statement keeps nonzero x and three Fin 2 exponents; the Gram lattices use integral carriers; both group conclusions are additive equivalences. No binder was lost. A separate scratch copy tried rfl, simp and infer_instance, each required to close the goal, for all four remaining admitted theorems. None closed. The prior audit of direct single-library-lemma candidates is unchanged.

**Resolved suppliers and ownership.** The citation resolver checked main at fa41b37 and indexed open heads and reported no unresolved cross-roadmap citations or roadmap Lean names. Its library-name check was unavailable on the service host, so relevant library definitions were opened locally at the pins. The following contracts were read at their indexed heads; line numbers exclude the display banner.

| Repository-relative supplier locator | Contract verified |
| --- | --- |
| TauCetiRoadmap/WeilConjectures/README.md:1710, §7.12 | Numerical Picard local system, cycle comparison, characteristic-sensitive Enriques condition, projectivity, field extension, b₁=0 and b₂=ρ=10. Nonclassical characteristic-two surfaces are expressly included. |
| TauCetiRoadmap/WeilConjectures/README.md:1822, §7.13 | Smooth proper geometrically connected surfaces with b₁=0, b₂=ρ and constant Num; all-extension count 1+b₂q^r+q^(2r). |
| TauCetiRoadmap/WeilConjectures/README.md:1840, §7.14 | Enriques and geometrically rational relatively minimal genus-one surfaces; a section is not required. Counts 25 and 57 agree. |
| TauCetiRoadmap/NeronModelsAndSemistableAbelianVarietiesPartII/README.md:8729, §3.11 | Strictly henselian local comparison: full torsor fibre mT versus Jacobian type T. Local period, multiplicity and geometric Kodaira type are distinguished; no F₂-fibre isomorphism is asserted here. |
| Same supplier README.md:9337, §4.17 | Generic Pic⁰, compactification for nonsmooth genus-one curves, minimal regular models and Jacobian identity section. |
| Same supplier README.md:9792, §6.1 | Its supporting rationality paragraph, besides the model list, supplies the characteristic-independent criterion H¹(O)=H⁰(ω²)=0 used in §4.2. |
| Same supplier README.md:9367, §4.18 | Tsen/Picard descent only over algebraically closed constants; no Brauer-vanishing assertion over F₂(t). |

Ownership searches covered numerical Picard local systems, geometric torsor Kodaira comparison, ten-curve lattices, positive-cone decomposition and dyadic representatives across main and indexed open heads. Board-package searches also covered the changed geometric interfaces. They locate shared objects with existing suppliers, and the two specific ten-curve applications with this roadmap. AlgebraicModuliForArithmeticGeometryPartII records the relation to the numerical-descent request; this edit introduces no competing construction. Native-library searches found no Enriques surface implementation. The pre-existing ownership and cross-roadmap audit in [r1] is carried forward outside the changed dependency paths. The main-branch IntegralLattices and JacobianChallenge READMEs were read for ownership and document shape.

All six gap slugs still match packages/EnriquesSurfacesAndIntegralNonexistence/design/plan.json and the README's supplier contracts: numerical-contraction-descent, picard-flatness-betti, finite-local-group-w2-nonlifting, one-obstruction-regularity, differential-w2-nonlifting and fontaine-low-degree-hodge. No gap or supplier domain changed. Their earlier precision/minimality audit is carried forward; they are declared contracts, not missing-supplier findings.

**Pinned declarations reopened.** The checked pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.

| File and line at the pin | Evidence |
| --- | --- |
| TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Group.lean:109 | DiscriminantGroup is the quotient of dualCarrier by carrierInDual. The reduced import supplies the surviving headline's object. |
| TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:261, :269, :295 | ofGramMatrix uses the integral span of the rational basis; its pairing recovers the matrix entries. It does not assume nondegeneracy. |
| TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Quadratic.lean:122, :129 | The quadratic map requires evenness and evaluates to half the ambient norm modulo ℤ; finiteness separately needs nondegeneracy. |
| Mathlib/NumberTheory/NumberField/ExistsRamified.lean:57 | bijective_algebraMap_int_of_finite_of_unramified retains finite, unramified, domain and faithful-scalar hypotheses in the §3.2 route. |

**Sources and seeded sample.** The incremental scope intersects the new sample at §§3.3, 4.1 and 6.3. The repaired final reference also requires §4.4, and the retained lattice claims feed §6.4. These five targets were freshly compared to legal cached texts. The other ten sample targets are unchanged and their adversarial evidence is carried from [r1].

| Sample or affected target | Source evidence and scope |
| --- | --- |
| 3.3 local projectivity | SCH23 Proposition 5.5 proof, pp. 15–16, SCH23 lines 682–702, gives the context, not the strengthened local-projectivity theorem. The README labels its addition. Stacks tag 0D3D, Stacks line 1008 and line 1028, gives openness of relative ampleness for proper algebraic spaces. Over a local base an open containing the closed point is the whole base. |
| 4.1 Jacobian | SCH23 §6 and Proposition 6.2 proof, p. 19, SCH23 lines 822–838, distinguish Pic⁰ from its regular compactification and compare after field extension on a dense open. The repaired citation adds no section to the original torsor. |
| 4.4 simple fibres; LLR reference | SCH23 Proposition 9.2, p. 24, SCH23 lines 1071–1095, has the F₂ constant-Picard elliptic setting and separates geometric type from residue-field isomorphism. LLR2018 lines 14–30 identifies the corrected global comparison. Original local LLR04 text remains uncertified. |
| 6.3 second lattice | SCH23 matrix (16), p. 43, SCH23 lines 1920–1956, matches the recomputed inverse, elementary order-four group and two isotropic nonzero classes. |
| 6.4 generic Pic⁰ quotient | SCH23 lines 1957–1960, p. 43, contains the Pic/Pic⁰ slip already recorded in [r1]. The README retains the infinite degree summand separately. |
| 1.4, 1.6, 2.7, 2.8, 3.10a, 5.1, 5.7, 7.1, 8.2, 8.4 | Unchanged sample targets: their individually listed computations are carried from [r1] below. This incremental round does not claim a fresh reading of their locators. |

Additional fresh checks: SCH23 Corollaries 7.2–7.3, p. 21, SCH23 lines 942–958, support the point-count contract; matrix (14), pp. 41–42, SCH23 lines 1826–1879, supports the first-lattice claim. Both inverses were recomputed with exact rational arithmetic. Their four classes have full norms 0, −1, −2, −2 and half-norms 0, 1/2, 0, 0 modulo ℤ. The discriminant order is four, its exponent two, and the even unimodular extension index two. Deleting the Lean cardinality checks changes none of the downstream mathematics.

**Headline coverage.** Deep goals remain: numerical-lattice isometry and decomposition (§§0.4, 1.26); canonical-cover and Picard descent (§§2–3); fundamental groups (§3.10a); Jacobian comparisons (§4); configuration exclusions and the restricted-configuration theorem (§§5–7); characteristic-zero lifting, W₂ lifting and miniversal deformation (§§8.2–8.5); finite-field and integral nonexistence (§§8.6–8.7). The four native headlines remain in Lean: positive-cone decomposition, ordered dyadic representatives and two discriminant-group identifications. The docstring still names the geometric headline families and missing carriers. It now omits the deleted cardinality tests from its list of stated headlines. No stand-in or replacement padding was introduced.

**Adversarial table.** Numerical and boundary tests are consistency checks, not proofs of classification or nonexistence. Every unchanged row cites [r1]. Fresh rows include every changed numbered target and the altered conventions, supplier contract, LLR reference and Lean form.

| Statement | Instances tried | Computed values on the two sides | Result; change |
| --- | --- | --- | --- |
| Scope, conventions, supplier §7.12; downstream paragraph | Classical and nonclassical characteristic-two surfaces; K3 and abelian controls | χ(O)=1−0+0=1 or 1−1+1=1; K3 χ=2 and abelian χ=0 fail; b₂=ρ=10 in both Enriques cases | Correct supplier section; no classical-only narrowing |
| Supplier §§7.13–7.14 and Layer 3 dependencies | q=2,4; r=1,2; split/nonsplit quadric | Enriques counts 25,57; q=4,r=2 gives 417; quadric twisted eigenvalues (1,1) versus (1,−1), constancy flags 1 versus 0 | All-extension count retained; q=1 is not a finite field |
| 0.2 Pic^τ | μ₂, α₂, constant ℤ/2 in characteristic two | Lengths 2,2,2 versus geometric point counts 1,1,2 | Rechecked after supplier repair |
| 0.3 coherent invariants | Classical and nonclassical characteristic-two cases | (h¹,h²)=(0,0),(1,1); both give 2(h¹−h²)=0=b₁ and χ=1 | Nonclassical case retained |
| 1.1 half-fibre | Smooth 2E, double IV*, zero divisor | 2E=2E; central coefficient 2·3=6 versus twice reduced support 2; twice zero 0≠2E | Supplier edit preserves multiplicities |
| 1.2 curves and two-sections | Root, conjugate pair, degree-four curve | p_a=1−2/2=0; conjugate union has square −2 but two geometric components; R·F=2 gives R·2F=4≠2 | Geometric integrality and degree conditions unchanged |
| 1.3 canonical-type fibration | Primitive D and 2D | D²=(2D)²=0; coefficient gcd 1 versus 2; same pencil, multiplicities 1 versus 2 | Full and half fibres remain distinct |
| 2.1 family | Constant family over k[ε]/ε²; P² | Fibre dimension 2 in both; Enriques b₂=10 versus P² b₂=1; ε²=0 changes the base, not the geometric fibre | Nonreduced bases retained |
| 2.3 relative invariants | R=k[ε]/ε²; R[t]/t² versus R[t]/(t²,εt) | Special-fibre lengths 2 in both; total lengths 4 versus 3; coherent pairs (0,0),(1,1) both give 0=2(h¹−h²) | Flatness contract still required |
| 3.2 numerical constancy and count | Residue p=2,3; extension F₄ | 1+10·2+4=25; 1+10·3+9=40; 1+10·4+16=57 | Repaired citation supplies these without full Picard constancy |
| 3.3 local projectivity | Z₂ and Z₃; section splitting | 25>0 and 40>0; s* f*=id gives obstruction-map kernel 0; an open containing the closed point of Spec R is all Spec R | Section and Noetherian local hypotheses retained |
| 4.1 Jacobian adapter | Index-two torsor; quasielliptic group; imperfect-field control | Torsor points 0 versus identity point 1; affine Pic⁰ has infinite-dimensional functions versus compactification H⁰=K of dimension 1; (u−√s)²=0 after inseparable extension | Repaired predicate citation does not replace the Jacobian construction |
| 4.4 and repaired LLR reference | Simple versus double torsor fibre; split I₂ over F₂ | Simple multiplicities 1=1; double torsor versus Jacobian 2≠1; on each I₂ component, 3−2=1 smooth rational point remains | Residue-field isomorphism stays in §4.4; supplier §3.11 compares geometric type |
| 4.10 auxiliary count | I₁, nonsplit I₁, I₂, nonsplit I₂, additive r=7; II*+E₄+I₁ | Counts 2,4,4,6,15; 19+4+2=25=1+20+4 | Num-only total precedes Jacobian Picard constancy |
| 5.2 quasielliptic component sum | Three rational base points; component triples | 10=2+Σ(r−1)=Σr−1, hence Σr=11; 9+1+1=11, 8+2+1=11, 7+2+2=11 | Rank normalization retained |
| 6.2 first discriminant group and retained isotropy | Exact rational inversion; dual classes 0,C₁*,C₇*,C₈* | det=−4; inverse denominators 1,2; four distinct cosets of exponent 2; Smith 1⁸,2,2; full norms 0,−1,−2,−2; half-norms 0,1/2,0,0; isotropic count 3 | Group headline retained; fixed-cardinality declaration deleted |
| 6.3 second discriminant group and retained isotropy | D₈(−1)⊕U; same four dual classes | det=4·(−1)=−4; inverse denominators 1,2; four distinct cosets of exponent 2; Smith 1⁸,2,2; full norms 0,−1,−2,−2; half-norms 0,1/2,0,0; isotropic count 3 | Group headline retained; fixed-cardinality declaration deleted |
| 6.4 affected generic Picard quotient | L=T and degree 2m; either index-two lattice | T−(T·F)T=0; degree(L−mT)=2m−2m=0; index √4=2; Pic⁰ order 2 versus infinite Pic⁰⊕ℤ | Deleted Lean cardinality statements are not prerequisites |
| Lean imports and remaining coverage | Ten declarations and four admitted theorems | 10 expanded types, 0 lost binders; four sorry warnings; 0 of 4 closed by rfl, simp or infer_instance | Group import suffices; no replacement padding |
| SCH23 Corollary 7.2 field-subscript control | Projective plane over F₄ | 1+1·4+4²=21=#P²(F₄); the descended P² has 7 F₂-points, not 21 | Source subscript misprint; roadmap uses F_q correctly |
| Conventions: full/half fibre | R·F=1; F·F′=1 | R·2F=2·1=2; (2F)·(2F′)=4·1=4 | Consistent; none; carried from [r1] |
| Conventions: signs and Frobenius | U basis e,f; a root; q=2,4 | e²=f²=0, e·f=1, (e+f)²=2; root²=−2; untwisted eigenvalues 2,4 versus twisted 1,1 | Consistent; none; carried from [r1] |
| Numerical-descent contract | Split/nonsplit quadric; α₂ over k[ε]/ε² | Split rank 2 versus nonsplit invariant rank 1; α₂ coordinate k-length 4 versus geometric point count 1 | Hypotheses distinguish the cases; carried from [r1] |
| Picard-flatness contract | Classical/nonclassical Enriques | b₁=0=2(0−0)=2(1−1); nonflat test below has length 3≠4 | Consistent conditional contract; carried from [r1] |
| Finite-local-group contract | α₂ over W₂(k); ramified π²=2 | Unramified Oort–Tate a,b∈(2) gives ab=0≠2; ramified a=b=π gives ab=2 | W₂ obstruction does not exclude ramified lifts; carried from [r1] |
| One-obstruction contract | k[[t₁,…,t₁₂]]; W[[t₁,…,t₁₂]]/(2−t₁²) | Both regular dimension 12; first has 2=0 and is not W-flat, second has 2=t₁²≠0 and is W-flat | Independent characteristic-zero premise matters; carried from [r1] |
| Differential obstruction contract | Classical exceptional versus supersingular | ord(ω)=2 versus 1; classical h⁰(L)=h⁰(Lω)=1 | Supersingular case correctly excluded from this input; carried from [r1] |
| Fontaine contract | K3 and ℙ² over characteristic zero | h²(O_K3)=1 versus required off-diagonal 0; h²(O_ℙ²)=0 | Correct obstruction, conditional on settled source; carried from [r1] |
| 0.4 numerical lattice | U⊕E₈(−1); U alone | Rank 10, determinant −1, signature (1,9); U has rank 2, so fails the surface invariant | Consistent; carried from [r1] |
| 1.4 half-fibre iff | F; 2F; 0 | Squares 0,0,0; primitive flags 1,0,0 and nonzero flags 1,1,0 | Both directions use all stated conditions; carried from [r1] |
| 1.5 reflection | C²=−2, D·C=−1 | (D−C)·C=1; (D−C)²=D²−2(−1)−2=D² | Reflection sign correct; carried from [r1] |
| 1.6 genus-one existence | U basis isotropic vector | e²=0 and divisibility gcd(1,0)=1; zero vector divisibility 0 | Numerical input consistent; geometric existence separately sourced; carried from [r1] |
| 1.7 multiple fibres | 2F versus candidate 3F | Primitive multiplicity gcd 2 versus 3; 2F has even intersection with every divisor | The target excludes multiplicity 3; carried from [r1] |
| 1.8 integral two-section | Square −2 and square 0 | Adjunction arithmetic genera 0 and 1; degree against 2F is 2 in both | Neither branch is suppressed; carried from [r1] |
| 1.9 classical criteria | Classical; nonclassical char 2 | (ordω,h¹,number of tame doubles)=(2,0,2); nonclassical ordω=1,h¹=1 | Correct direction and characteristic split; carried from [r1] |
| 1.10 canonical bundle | Distinct tame half-fibres F₁,F₂ | 2(F₁−F₂) linearly 0; numerical class 0; canonical order 2 rather than 1 | Numerical zero is not line-bundle zero; carried from [r1] |
| 1.11 tame types | E₂/E₄ and E₁/E₃/E₅ over F₂; semistable fibre | Traces 3−n are odd for n=2,4 and even for n=1,3,5; two tame positions exclude semistable/supersingular candidates | Consistent; carried from [r1] |
| 1.12 ordinary type | μ₂ versus constant ℤ/2 | Lengths 2=2; points 1≠2; dual μ₂↦ℤ/2 | Scheme condition discriminates; carried from [r1] |
| 1.13 classical type | Constant ℤ/2 versus μ₂ | Points 2≠1; canonical order 2≠1; dual ℤ/2↦μ₂ | Consistent; carried from [r1] |
| 1.14 supersingular type | α₂ versus μ₂ | Both have one point; α₂ coproduct t⊗1+1⊗t versus μ₂ extra t⊗t; α₂ self-dual | Point count alone correctly insufficient; carried from [r1] |
| 1.15 local canonical cover | Integral degree-two torsor versus trivial product torsor | Generic degree 2; radicial geometric fibre point count 1; trivial μ₂/α₂ torsor has nonzero nilpotent t with t²=0 | Integrality excludes trivial wrong model; carried from [r1] |
| 1.16 cover cohomology | K3-like cohomology | h⁰−h¹+h²=1−0+1=2 | Correct Euler characteristic; carried from [r1] |
| 1.17 conductrix | C≠0, B=2C; reduced tree; C=0 | C²=−2, B²=−8, χ(O_B)=4; exceptional h¹=1 gives h⁰=5; reduced tree h¹=0; empty divisor h¹=0 | Thickened divisor essential; carried from [r1] |
| 1.17a differential sequence | C²=−2 versus C=0 | length(W)=12+(2C)²=4 versus 12; h⁰(O_Y(2C))=1 is not h⁰(O_2C)=5 | Corrected source notation used; carried from [r1] |
| 1.18 exceptional iff | Special double IV*/III*/II*; ordinary | Exceptional flag 1 with special double fibre; ordinary Pic^τ=μ₂ gives exceptional flag 0 | The iff uses a rational two-section, not merely a type label; carried from [r1] |
| 1.19 quasielliptic restriction | III*, II*, each multiplicity 1 and 2 | Four type/multiplicity pairs all give exceptional=1 by ESB3.16; none satisfies nonexceptional=1 | Sample consistent; carried from [r1] |
| 1.20 special multiple restriction | Rational R with R·F=1 | R·2F=2; special-double criterion forces exceptional=1, contradicting premise 0 | Consistent; carried from [r1] |
| 1.21 extra-special E₈ | T₂,₃,₇ versus affine E₈ alone | Arms 1,2,6 give 1+1+2+6=10 vertices and 9 edges; affine E₈ alone has 9 vertices | Full-graph condition discriminates; carried from [r1] |
| 1.22 E₈ implies exceptional | Full T₂,₃,₇ | Ten-vertex graph satisfies ESB4.3; resulting exceptional flag 1 rather than 0 | Sample consistent; carried from [r1] |
| 1.23 partner theorem | Nonexceptional half-fibre; unique-pencil E₈ | Partner F·F′=1 versus same pencil F²=0; full intersections 4 versus 0 | Exception retained; carried from [r1] |
| 1.24 partner pencil | Characteristic-two nonexceptional pair | Half intersection 1 gives full intersection 4 | Consistent; carried from [r1] |
| 1.25 distinct pencils | F′=F; partner; hypothetical half intersection 2 | Full products 0,4,8 respectively; equality 4 iff half product 1 | Distinctness excludes zero; both directions tested; carried from [r1] |
| 1.26 numerical decomposition | h=d=e+f; d=−h; d=0; rational h/2 | d=e+f with summand squares 0,0 and pairings 1,1; (−h)·h=−2; 0²=0; h/2 has nonintegral coordinates | Native integral carrier and positive-cone premises discriminate; carried from [r1] |
| 1.26 negative E₈ check | h=e+f, d=2e+f+r with r²=−2 | h²=2,d²=4−2=2,d·h=3; e and e+f+r have squares0,0 and pairings1,2 | Negating E₈ is essential; carried from [r1] |
| 1.26 effective/two-section application | T²>0, generic degree 2 | Two positive horizontal degrees would sum at least 4>2; exactly one remains horizontal; degree after vertical subtraction is 2−0=2 | Generic class, not just degree, preserved by vertical restriction; carried from [r1] |
| 2.2 relative Picard | Connected proper geometric fibre | H⁰(O)=k has dimension 1; pullback of constants is k→k, identity | Universal-functions premise retained; carried from [r1] |
| 2.4 canonical torsor | Canonical inclusion versus trivial torsor; empty base | Edge classes inclusion Pic^τ→Pic versus 0; nonempty Pic^τ has rank 2, so inclusion≠0; over empty base both maps uniquely coincide | Correct edge-class definition; carried from [r1] |
| 2.5 five-term obstruction | Section s of f | s*f*=id, so kernel f* on H² is 0; exactness gives obstruction 0 | Map directions correct; carried from [r1] |
| 2.6 injective pullback | Injective H² map | ker f*=0, hence image obstruction=0 | No arbitrary surjectivity of edge map assumed; carried from [r1] |
| 2.7 section criterion | Identity f=s=id | f*s*=id; canonical obstruction maps to 0 and was 0 | Consistent; carried from [r1] |
| 2.8 étale Pic torsion | Order-two ω, Pic(base)=0 | O⊕ω⁻¹ has rank 1+1=2; multiplication uses ω⁻²≅O | Existence uses trivialization of the square; carried from [r1] |
| 2.9 twisting | Trivial twist; twice a μ₂-class | Twist by 1 leaves class unchanged; [a]+[a]=[a²]=0; [5]≠0 over ℚ₂ | Free transitive action, not a canonical choice of origin; carried from [r1] |
| 2.10 constant/split Picard | ℝ-action e₁↦e₁+τ; split α₂ extension | Action squared e₁↦e₁+2τ=e₁; any lift e₁+cτ changes by τ≠0; α₂ geometric torsion points 1 versus constant ℤ/2 points 2 | Constant Num does not imply split or constant full Picard; carried from [r1] |
| 2.11 canonical covers | Units modulo squares with trivial Pic(base) | Unit 1 gives identity twist; 5 is nontrivial over ℚ₂; a² gives trivial class | Kummer domain and obstruction separated; carried from [r1] |
| 2.12 canonical order | Full constant Picard; α₂ case | Nonzero torsion class has order 2; α₂ has one geometric point and ω order 1, so fails full constancy | Sample consistent; carried from [r1] |
| 2.13 numerical descent | Two lifts differing by ω | Both map to same Num class; kernel has 2 elements over geometric classical field | Uniqueness is modulo ω; carried from [r1] |
| 2.14 nodal descent | Split rational curve over F₂ | P¹(F₂) has 3 points; conic Brauer obstruction 0 | Finite-field form is split; carried from [r1] |
| 2.15 fibration descent | Conic base over F₂ | Br(F₂)=0; descended base P¹ has 3 rational points | Rational base justified; carried from [r1] |
| 2.16 double-fibre descent | Classical fibration over F₂ | Exactly 2 tame double fibres among 3 rational base points; remaining count 1 | Multiplicity and base rationality retained; carried from [r1] |
| 2.17 residue-field existence | Descent of one geometric pencil | One descended pencil; its base has 3 rational points, not a selected section of the surface | No false section conclusion; carried from [r1] |
| 2.18 finite-field descent | F₂ and F₄ | Pic=0, Br=0 in both; P¹ point counts 3 and 5 | Sample does not specialize away the general field statement; carried from [r1] |
| 3.4 μ₂ branch | Pic^τ=μ₂ over ℤ₂ | Cartier dual is étale ℤ/2, degree 2 | Correct dual, not μ₂ as covering group; carried from [r1] |
| 3.5 four global twists | ℤ[1/2] units | ±2^n modulo squares gives {1,−1,2,−2}, cardinality 4 | All four retained; carried from [r1] |
| 3.6 dyadic representatives | All Fin 2 triples; x=0 negative control | Representatives {1,5,2,10,−1,−5,−2,−10}, size 8; 0/r=0 is square for all 8 | Nonzero x is essential for uniqueness; carried from [r1] |
| 3.7 global twist | Triples (000),(001),(010),(011),(100),(101),(110),(111) | r·u=1,5,4,20,1,5,4,20 respectively; 5^b(2^a)² gives exactly the same list | All eight products agree; carried from [r1] |
| 3.8 difference class | Equal covers; nontrivial twist | Difference 1 in first case; class 5 has order 2 and is not class 1 | Difference is a class, not a unique scalar; carried from [r1] |
| 3.9 remove ramification | r=−10; r=5 | u=−2 gives ru=20=5·2²; u=1 leaves 5 | Residual class is 1 or 5, not necessarily trivial; carried from [r1] |
| 3.10 K3 cover | Étale degree 2 | χ upstairs=2·1=2, connected h⁰=1 and ω=O give h²=1, h¹=0 | Correct K3 invariants; carried from [r1] |
| 3.10a fundamental group | Ordinary/char≠2; classical/supersingular char2 | Orders 2 versus 1; connected étale degree d satisfies d=χ(cover)≤2 | Local canonical cover is not an étale generator; carried from [r1] |
| 3.11 local models | Class 5 model; odd primes | z²−z−1 mod2=z²+z+1 has values 1,1 at 0,1 and derivative 1; degree2 étale; 2 is a unit at every odd prime | Unramified residual twist extends; sample consistent; carried from [r1] |
| 3.12 extension splitting | Rank n=0,1,10 | Zero obstruction for each of n basis lifts gives 0,1,10 choices of lifts to make; extension rank remains n | Uses vanishing of ℤ/2 torsors, not merely constant quotient; carried from [r1] |
| 3.13 full Picard over ℤ | Two Oort–Tate possibilities | μ₂ branch would give K3 h²(O)=1 versus Fontaine 0; surviving ℤ/2 has two geometric points | Correct conditional contradiction; carried from [r1] |
| 4.2 geometric rationality | Hodge degree 1 | R¹f*O=O(−1), H¹(O)=0; ω=−F gives H⁰(ω²)=0; χ=1 | Rationality criterion's inputs present; carried from [r1] |
| 4.5 nonrational fibres | Closed point degree 2 | Reducible flag 1 would force residue degree 1; degree 2 therefore permits only irreducible geometric fibre | Correct contrapositive; carried from [r1] |
| 4.6 no I₀* | Central component with four outer attachments over F₂ | Four distinct required rational points versus #P¹(F₂)=3 | 4>3 contradiction; carried from [r1] |
| 4.7 graph descent | Nonsplit I₁ and I₂ | Rational point counts 4,6 versus split 2,4; component labels unchanged while conjugate branches differ | Graph descent does not imply split nodes; carried from [r1] |
| 4.8 at most one excluded tame type | Three rational base points, two tame doubles | 3−2=1 possible semistable/supersingular position | Correct bound; carried from [r1] |
| 4.9 Mordell–Weil descent | Generic line bundle of degree 2; geometric Tsen | Subtracting one two-section gives degree 2−2=0; Br(k̄(t))=0 used, not Br(F₂(t)) | Domain retained; carried from [r1] |
| 4.11 Jacobian Picard | ρ=10,q=2 | Auxiliary total 25=1+10·2+2² | Correct maximal-count input; carried from [r1] |
| 5.1 fourteen elliptic rows | All fourteen displayed rows in order | Totals 19+4+2,19+2+4,17+4+4,17+2+6,17+4+4,15+3+7,15+5+5,19+4+2,13+4+8,13+5+7,16+4+5,15+4+6,17+4+4,15+4+6; all 25 | Necessary counts agree; completeness remains supplier theorem; carried from [r1] |
| 5.3 four quasielliptic rows | Six allowed symbols | 9+1+1=11 twice with distinct symbols; 8+2+1=11; 7+2+2=11; 7+2+1=10 fails | Exactly four symbol triples; carried from [r1] |
| 5.4 forced doubles | Additional IV*+E₄+Ĩ₂ | Ĩ₂ cannot be tame double; two remaining positions = two required doubles | Added nonsplit branch retained; carried from [r1] |
| 5.5 simple III* | III*+E₄+I₂; III*+E₂+Ĩ₂; III*+E₄+E₄ | First two reserve one simple semistable slot and force III* double; last has two smooth double slots | One simple-III* candidate remains; carried from [r1] |
| 5.6 forbidden rational bisection | R·F=1, R²=−2 | R·2F=2; special-double criterion gives exceptional=1 versus premise 0 | Consistent; carried from [r1] |
| 5.7 three new exclusions | Three added Jacobian rows | Counts 15+4+6=25,17+4+4=25,15+4+6=25 | Counts do NOT exclude them; new proof target correctly explicit; carried from [r1] |
| 5.8 F₂ partner | Descended F,F′ | Intersection remains 1 after extension; full intersection 4 | Correct descent invariant; carried from [r1] |
| 5.9 I₈ elimination | I₈+E₄+III candidate | Points 16+4+5=25; root rank 7 | Count alone insufficient; graph/partner proof retained; carried from [r1] |
| 5.10 II* elimination | II*+E₄+I₁; II*+II+II | Counts 19+4+2=25 and 19+3+3=25; E₈ root rank 8 | Uses exceptionality/partner geometry, not count alone; carried from [r1] |
| 5.11 no double I₄* | I₄*+E₄+E₂; quasielliptic version | Counts 19+4+2=25 and 19+3+3=25; primitive central coefficients doubled 2→4 | Multiplicity remains a separate restriction; carried from [r1] |
| 5.12 IV* elimination | IV*+E₃+IV; IV*+E₅+III | 15+3+7=25;15+5+5=25; smooth E₄ in extra row has 4 points, not the other half-fibre type | New row correctly handled in §5.7; carried from [r1] |
| 5.13 IV elimination | D₅ and A₂ components in same fibre branch | Required additional incidence lower bound 3 versus available 2 | 3>2 contradicts the branch; carried from [r1] |
| 5.14 residual list | Fourteen elliptic plus four quasielliptic | 18 candidates minus 9 elliptic and 1 quasielliptic removals =8; 5 elliptic+3 quasielliptic | Requires both classification obligations; carried from [r1] |
| 5.15 residual multiplicities | I₁*, I₄*, semistable | Multiplicities 2,1,1 respectively | Matches tame exclusions and §5.11; carried from [r1] |
| 6.1 firstGram/firstLattice | e₁,e₁/2,e₁+e₂,−2e₁; entries | Norms −2,−1/2,−2,−8; e₁/2 outside ℤ-span; entries (8,3)=1,(8,9)=1,(9,9)=0 | Native carrier excludes rational wrong model; carried from [r1] |
| 6.1 secondGram/secondLattice | Same vectors; fork and U entries | Same four norms; (8,3)=0,(8,8)=0,(8,9)=1,(5,6)=(5,7)=1 | Distinguishes the two matrices; carried from [r1] |
| 6.5 generating two-section | Nontrivial coset in group of order2 | [R̃]≠0, 2[R̃]=0; degree2 retained; self-intersection possibilities −2,0 | Coset-preserving refinement stated; carried from [r1] |
| 6.6 spinor incidences | Four cross-tip pairs versus same-end pair | Cross-tip q=0; {0,1} and {7,8} vector-class q=1/2; weighted degree2 in each | Even overlattice excludes wrong pair; carried from [r1] |
| 6.7 square-zero calculation | C₈*+nR*+F*, n=0,1,2 | Square −2−2+2·2+2n=2n gives 0,2,4; square0 iff n=0 | Sign and factor2 agree; carried from [r1] |
| 6.8 first forbidden graph | Smooth locus of chosen half-fibre | Required distinct rational points ≥3 versus available2 | 3>2 contradiction; carried from [r1] |
| 6.9 opposite-tip argument | Remaining cross-tip orbit | Weighted degree 1+1=2; same spinor q=0; forbidden completion reached without using §6.12 | No local dependency cycle; carried from [r1] |
| 6.10 second forbidden graph | R·C₀=2,R·C₂=1 | Full fibre incidence 2+2·1=4; paired half-fibres intersection1 | Both spinor branches retained; carried from [r1] |
| 6.11 I₄* incidences | Weights (1,1,2,2,2,2,2,1,1) | Degree2 vectors: 4 doubled tips+6 tip pairs+5 internal=15; orbit sizes 1,2,2,2,4,4 sum15 | Six orbits confirmed; carried from [r1] |
| 6.12 no I₄* | Elliptic and quasielliptic I₄* candidates | Two type triples, six incidence orbits each; all use the preceding exclusions; raw counts still25 | No count-only shortcut; carried from [r1] |
| 7.1 no multiple III* | Primitive auxiliary D and C₆ | D·C₆=1; full fibre 2D gives2; two remaining III slots contain exactly one additional double fibre | Parity retained; not both additional fibres declared simple; carried from [r1] |
| 7.2 III* incidences | Weights (1,2,2,3,4,3,2,1) | Degree2 vectors 2 doubled tips+1 tip pair+3 weight2 entries=6; reversal orbit sizes1,1,2,2 | Four cases independently confirmed; carried from [r1] |
| 7.3 no simple III* | C₂ and double-terminal branches | Required full-fibre intersection ≥8 versus4; terminal construction gives2 versus minimum4 | Both contradictions use full fibres; carried from [r1] |
| 7.4 restricted configurations | I₁*+I₄; I₂*+III+III | Root ranks 5+3=8 and6+1+1=8; partner construction produces IV*/I₀*/I₄ outside the two allowed patterns | No characteristic-two lemma applied universally; carried from [r1] |
| 8.1 tangent cohomology | (0,10,0);(1,12,1) | χ=0−10+0=−10;1−12+1=−10; also −c₂+2χ(O)=−12+2=−10 | Source sign error not propagated; carried from [r1] |
| 8.2 supersingular W₂ obstruction | Pic^τ=α₂ | a,b≡0 mod2 gives ab=0 in W₂, whereas rank-two lift needs ab=2≠0 | Correct nonlifting check; carried from [r1] |
| 8.3 lifting iff | Ordinary/nonexceptional classical versus exceptional/supersingular | Obstruction h²Θ=0 versus1; ω orders1 or2 distinguished; exceptional h⁰(L)=h⁰(Lω)=1 | Separate α₂ and differential routes; carried from [r1] |
| 8.3a ramified characteristic-zero lift | V with π²=2 | 2=π², ramification2; quotient V/(π²) has 2=0 whereas W₂(k) has 2≠0 | Ramified lifting does not contradict W₂ nonlifting; carried from [r1] |
| 8.4 miniversal ring | Smooth case; regular ramified hypersurface | dim W[[t₁,…,t₁₀]]=11; dim W[[t₁,…,t₁₂]]/(2−t₁²)=12; e=1 versus2 | Dimension and ramification equivalences consistent; carried from [r1] |
| 8.5 modulo-four obstruction | ℤ/4→W₂(F̄₂) | 2≠0, 2²=0 on both; reduction is a scheme, so nilpotent thickening is a scheme | Algebraic-space scope preserved; carried from [r1] |
| 8.6 finite-field endpoint | Residual eight cases | Remove2 I₄*+4 III* cases from8, leaving2 forbidden universal patterns | Conditional proof chain closes after both classification obligations; carried from [r1] |
| 8.7 integral endpoint | Hypothetical ℤ family reduced mod4 and mod2 | Full Picard constancy=1; exceptional flag forced0; §8.6 excludes their conjunction | No exclusion of prime2 or weakening to schemes; carried from [r1] |
| SCH23 rank-two group-law control | a=1,b=2,f=g=1 over ℤ | Printed plus law gives4 with4²=16≠4; minus law gives0 with0²=0 | Sign misprint; supplier uses the minus sign; carried from [r1] |
| DI21 proof control | W₂(k)[t]/t² and W₂(k)[t]/(t²−2), characteristic two | Both free rank2 with reduction k[t]/t²; lifted t squares are 0 versus2≠0; in the second ring a lift a+bt of t has a∈2W₂, b a unit, and square 2b²≠0 | Scheme-lift uniqueness step is false; see Source issues; carried from [r1] |

## Not verifiable

- CDL2021 and BM1977 remain settled as waived; CD89 and LLR04 remain settled as uncertified. Their unchanged source locators retain the limitations in [r1]; no unavailable source was requested again.
- Fontaine's Theorem 1 and Remark (a) remain waived and the precise supplier contract remains in force.
- Fourteen-case completeness and the three extra configuration exclusions remain explicit proof obligations. Counts of 25 do not establish them. Acceptance is conditional on the six declared supplier contracts.
- Untouched statements and source locators outside the changed dependency paths were not freshly re-reviewed. Their evidence and limitations are those of [r1], carried forward as required. No additional missing reference was found.

## Source issues

The first six entries are carried forward from [r1]; the last was found while checking the repaired count citation.

- **Misprint** in DI21 at Proposition 7.1 proof, printed p. 23, DI21 line 1019: the source says the tangent-sheaf Euler characteristic is positive ten; it should be negative ten, since −12+2=−10; affects the proof.
- **Misprint** in ESB21 at Proposition 2.8(2), printed p. 6, ESB21 line 205: the source says the biconductrix structure sheaf has one global section; it should be the line bundle O_X(B), as the proof at line 220 computes; affects a stated result.
- **Error** in DI21 at Proposition 4.2 proof, printed p. 16, DI21 lines 696–699: the source says freeness of ordinary differentials makes all scheme lifts isomorphic; it should be a cotangent-complex deformation argument; W₂(k)[t]/t² and W₂(k)[t]/(t²−2) already give distinct flat lifts; affects the proof.
- **Gap** in SCH23 at Proposition 5.5 proof, printed p. 16, SCH23 lines 699–702: the source says existence of a local canonical cover gives good reduction of the previously chosen generic cover; it should be a comparison controlling their torsor difference before applying the good-reduction obstruction; affects the proof.
- **Misprint** in SCH23 at Proposition 12.3 proof, printed p. 43, SCH23 line 1960: the source says the entire generic Picard group equals the finite numerical quotient; it should be its degree-zero subgroup, with the infinite degree summand retained separately; affects the proof.

- **Misprint** in SCH23 at the rank-two group law following Proposition 5.3, printed p. 14, SCH23 line 614: the source says to add the bilinear term in the group law; it should be subtracted: for a=1,b=2, combining 1 with 1 must give 0, not 4; affects a stated result.

- **Misprint** in SCH23 at Corollary 7.2 and proof, printed p. 21, SCH23 lines 943 and 947: the source says the formula counts points over the prime field F_p; it should be points over the ground field F_q; affects a stated result.

[r1]: packages/EnriquesSurfacesAndIntegralNonexistence/reports/PRREVIEW-EnriquesSurfacesAndIntegralNonexistence~1.md
