<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13172#issuecomment-6785951504 -->
Review (codex) of 7a53aa7

Verdict: needs_changes

1. **F01** (P2) Two algebraic branching identities already belong to the exceptional-theta supplier

   **Location:** `packages/LocalLanglandsCorrespondenceForG2/README.md:149`, §0.1: “Prove that v ∘ j ≅ 1 ⊕ Std₃ ⊕ Std₃∨ as algebraic representations of SL₃(ℂ), that s ∘ i ≅ 1 ⊕ v as representations of G₂(ℂ)”.

   **Claim:** This package assigns these two algebraic restriction theorems to itself, with a highest-weight proof route. Its ownership and supplier paragraphs import the inclusions and centralizers, but do not import these already-owned restriction theorems.

   **Witness:** Open pull request #1736, `TauCetiRoadmap/ExceptionalThetaCorrespondencesForG2/README.md:254`, §0.6: “Restriction of the seven-module to SL₃ is 1⊕3⊕3∨; restriction of the spin eight-module to G₂ is 1⊕7.”

   These are the same representations, embeddings and coefficient field. The supplier's §0.6 also assigns their weight-comparison proof. This is duplicate ownership, not a dispute about the truth of the identities.

   **Exact repair:** Add these two restrictions to the imports from ExceptionalThetaCorrespondencesForG2 §0.6 in Scope and ownership and Exact supplier contracts. In §0.1, use those imported identities when composing with parameters, preserving monodromy; remove them as separate algebraic proof obligations here. Keep the genuinely additional Spin₈-to-Spin₇ and Spin₆-to-Spin₇ restrictions, their hypotheses, and the numerical Checks. Retain the section number. The existing parameter-transport construction is also an import from that supplier's §0.7, not a new construction here.

   **Repair test:** At diag(2,3,1/6), both owners' seven-dimensional restrictions give {1,2,3,1/6,1/2,1/3,6}; both spin restrictions add one 1. At the identity their dimensions are respectively 7 and 8. Importing the supplier identities gives exactly the data used in §§0.2–0.5 without a second owner.

2. **F02** (P3) The finite-group counterexample is used as a local, discrete parameter example

   **Locations:** `packages/LocalLanglandsCorrespondenceForG2/README.md:215`, §0.6: “The two homomorphisms of §0.8 have the same weak class”; and line 962, §8.2: “two such φ̃ may be non-conjugate (§0.8)”. The analogous parameter assertion at line 189 and elementwise-parameter Check at line 227 refer to the same example.

   **Claim:** The pair constructed in §0.8 witnesses noninjectivity for parameters of the fixed local field, and also possible nonuniqueness among the discrete parameters of §8.2.

   **Witness:** CG line 490 gives domain μ₄×μ₄, not W_F. CG lines 508–512 give vector representation 1⊕2c⊕d⊕d⁻¹⊕e⊕e⁻¹; its connected centralizer has dimension 3, so it is not discrete.

   Here c=a²b², d=ab and e=a⁻¹b. The repeated quadratic character contributes an SO₂ and the two distinct dual pairs contribute two one-dimensional tori. Extending this pair trivially on SL₂ does not fix discreteness. Nor is an unspecified local pullback automatic: the maximal exponent-four abelian quotient of ℚ₃× is C₄×C₂, of order 8, whereas μ₄×μ₄ has order 16. A surjection exists for ℚ₅, but has not been supplied for the fixed arbitrary F. This does not refute the abstract finite-group theorem in §0.8, or the actual existence of unacceptable local parameters.

   **Exact repair:** Keep §0.8 and its Lean headline. For §§0.4, 0.6 and 0.7, use actual continuous finite-image W_F homomorphisms from CG Proposition 8.3, pp.32–33 (CG lines 1232–1253), extend trivially over SL₂, and explain preservation of elementwise versus simultaneous conjugacy on passing from the compact group to its complexification. Update the existing CG manifest entry's locator/cited-for information, without adding a second key. A concrete optional Check is the ℚ₅ quotient given by valuation modulo 4 and the residue-unit character. Delete §8.2's first Check: its remaining theorem asserts only weak uniqueness and does not need an assertion of nonunique conjugacy for its particular lifts. If a discrete local ambiguity example is retained elsewhere, use CG Proposition 8.5, pp.33–34, with its hypotheses, rather than Example 1; do not assert it arises from a particular heart representation without the additional comparison.

   **Repair test:** For ℚ₅ the indicated quotient has order 4·4=16, the pullbacks have finite inertia and N=0, and surjectivity preserves the nonconjugacy obstruction. CG Proposition 8.3 covers every allowed F, including residue characteristics 2 and 3, so this does not restrict the theorem to suitable primes. For the separate discrete example of Proposition 8.5, the vector representation has pairwise inequivalent absolutely irreducible summands of dimensions 1,2,4 (CG lines 1292–1310); its centralizer has dimension 0, versus dimension 3 for Example 1. Removing the §8.2 Check removes the unsupported discrete-instance inference.

Two findings: one P2 ownership defect and one P3 counterexample defect. All four findings from round 3 are repaired. The original acceptance test elaborates with only its two expected `sorry` warnings. The dependency check reports no problems. The fourteen declared supplier contracts remain conditions on the eventual mathematical implementation; their absence today is not a finding.

## Verified sound

### Previous findings, checked first

All locations in this table are in `packages/LocalLanglandsCorrespondenceForG2/README.md` except where stated. No finding in the last repair report was marked not actionable.

| Round-3 finding | Repaired passage and independent test | Status |
|---|---|---|
| F01: missing nonzero cuspidal classical theta lift before using SpinLift | §2.3, line 424: “the global similitude theta lift of Σ to split PGSO₈ is nonzero and cuspidal”. Its separate Needs now supply archimedean nonvanishing, Rallis and Steinberg lower-tower vanishing. Uses at §§2.4,5.2,5.3 explicitly invoke it; §8.1 uses the expanded contracts. GS lines 771–773 and 1574–1590 support the route. Sym⁶ has 0 invariants, whereas 1⊕Λ²Sym³ has 2, excluding the lower lift at the Steinberg place. | Repaired, conditional on the declared contracts. |
| F02: epsilon omitted in the unramified gamma Check | §2.4, line 438: “ψ of conductor O_F with its self-dual measure”. The Check gives the dual L-function in the numerator and distinguishes ψ₀ from ψ₅ over ℚ₅. At s=2 the answers are (6/25)⁸ and 5⁻¹²(6/25)⁸. The separate ψ-scaling Check agrees. | Repaired. |
| F03: untwisted degree-eight identity used as a full local converse | §2.5, line 445: “twisting by χ ∘ SN multiplies the SO₈-parameter by χ”. The route now uses theta twisting, the f₂ spinor-norm comparison, the declared SO₈ packet-twist contract, and GL₈ LLC. The unsupported converse alternative is gone; §10.3 imports the same new contract. χ=-1 fixes all seven vector eigenvalues and negates all eight spin eigenvalues; applying it twice restores them. | Repaired. |
| F04: spin detection omitted from the acceptance-test docstring | `Suggested.lean:34–40`: “and spin detection: a discrete … Spin₇-valued parameter whose spin L-factor has a pole”. It names the A₂ test, spin test, component-group comparison and missing carriers. The diamond-fibre headline is also named at lines 62–65. The native pins supply neither these parameter carriers nor the required group inclusions. | Repaired. |

The repairs were tested beyond their edited sentences: all uses of the global SpinLift prerequisite, arbitrary additive characters, quadratic twists, converse arguments, and the summary's parameter-comparison headlines were searched again. No further instance of F01–F04 was found. R01 and R02 are separate ownership and counterexample defects.

### Coverage, principles and shape

I read all 75 numbered targets in Layers 0–10, their statements, API bullets, Checks, Needs and layer dependencies, the four package inputs, the previous review and repair, and the plan's gap list. Changed passages were reviewed afresh; for unchanged material I retained earlier evidence only where the previous adversarial table gives computed values. The following table includes all fifteen newly sampled targets, the headlines and both findings; it deliberately does not reproduce a 75-target ledger.

The package is a new consumer of exceptional theta theory, not a replacement for that roadmap. The indexed object searches found no existing roadmap owning this entire direction. R01 is the specific duplicate found. F is of characteristic zero, but residue characteristics 2 and 3 remain in scope. The p=3 enhancement qualification does not remove local fields from the correspondence. No algorithm, copied source passage, source-chapter layer title, source-following instruction, process identifier, machine path or HTML anchor was found in the roadmap text. “Packet” is mathematical terminology here. Main shapes were compared with ClassFieldTheory, SpinRepresentations and GlobalQuadraticForms.

All eleven layers have Examples and Dependencies. The eighteen numbered blocks introducing objects with “Define” have API statements and at least three Check bullets; §0.0 treats its two native definitions explicitly. The theorem targets have locators and standing or local hypotheses. The layer order is explained by the parameter, globalization, transfer and comparison dependencies; it does not simply reproduce a source's chapter order. The wrong-domain Checks are R02, rather than evidence of a false headline theorem.

Zero rings, positive-characteristic F, q=1, rank-zero G₂ and rank-zero Spin₇ are outside the stated carriers. Their exclusion is explicit, not an implicit good-prime assumption. Empty prescribed sets, the trivial source group, reducible parameters, nontrivial monodromy, small residue characteristics, nongeneric constituents and nonfree quadratic actions were tested inside the actual scope. Over ℂ, 2 is invertible and a nondegenerate quadratic form need not be anisotropic; this distinction matters for the spinor arguments.

### Seeded source checks

All fifteen requested locators were read in the cached GS text, checking theorem number, printed page, hypotheses and the proposed use. The extra CG locators used in R02 were also read through their proofs. Source references below use extraction line numbers. No author-flagged unread locator remains other than the settled uncertified Griess citation.

| Sampled target | Locator checked and result |
|---|---|
| 0.2 Detection of discrete A₂ parameters | GS Lemma 2.4(i), pp.9–10, GS lines 396–431. Supports the duality quotient, discrete pole criterion and μ₃/S₃ distinction. The later erroneous order-three generalization is not repeated here. |
| 0.4 Standard injectivity | GS Lemma 2.4(iii), p.9, GS lines 415–418, and §3.4, p.13. The first gives SO₇ injectivity and the diamond discrete statement; the GL₇ formulation uses the Griess comparison and keeps N. The separate Check's use of §0.8 is R02. |
| 0.6 Weak equivalence of Spin₇-valued parameters | GS Definition 12.1, p.34, GS lines 1437–1450. Both the SO₇ and spin GL₈ images are part of the definition. The quotient/API is faithful; its finite-group noninjectivity Check is R02. |
| 1.4 Globalization with a nonzero quaternion period | GS Proposition 10.5, pp.28–29, GS lines 1179–1197. Prescribed finite and real components and a nonzero quaternion period are supported. The stronger control of other places is explicitly assigned to the Poincaré contract, not attributed to this proposition alone. |
| 2.1 The three triality maps over F | GS §4.1, pp.16–17, GS lines 687–710: the central quotients, vector map and two half-spin maps have the stated directions; compare GS's three-map construction preceding §4.2. Their restrictions give 1⊕q and s. The rational spinor-norm comparison is assigned its own input. |
| 2.4 Spin gamma factors of the local spin lift | GS Proposition 4.1(i), pp.18–19, GS lines 750–807. Genericity, nontrivial ψ, the global functional equations and complex places are present. The repaired global theta prerequisite and strengthened auxiliary-place contract supply what the cancellation uses. |
| 2.5 Quadratic twisting of the generic spin lift | GS Proposition 4.1(ii), pp.18–19, GS lines 755–756 and 808–810. Supports quadratic twisting. The package's replacement local route is supported by separately named theta and SO₈ twist contracts, not by an untwisted converse. |
| 3.1 The classical theta parameter factors through G₂ | GS Proposition 3.1, p.11, GS lines 458–485 and following proof. Nonsupercuspidals use lift tables; supercuspidals use quaternion globalization and the global comparison. The actual G₂ factorization, rather than only a GL₇ class, is asserted. |
| 3.7 Discrete series | GS Main Theorem (i), p.3, GS lines 106–107, and §3.4, p.12, GS lines 517–535. Discrete representations correspond to discrete parameters; the heart image need not itself be discrete in PGSp₆ on the A₂ branch. |
| 4.5 Enhanced compatibility with the PGL₃ and division theta lifts | GS Theorem 9.1(i), p.26, GS lines 1100–1110. The trivial/nontrivial restriction of enhancement, p≠3 qualification, and discrete input for division Jacquet–Langlands are retained. |
| 6.6 A diamond fibre is one of Xu's packets | GS Proposition 8.2, p.24, GS lines 992–1010, and §8.5, p.25, GS lines 1062–1067. One-in-all-in and the comparison give a distinguished whole Xu packet, not a free quadratic orbit. |
| 7.1 The local Langlands correspondence for split G₂ | GS Main Theorem, pp.3–4, GS lines 102–176. All ten properties are accounted for. The package corrects the intermediate codomain in the spin diagram to generic tempered and keeps the p=3 qualification on enhancement. |
| 8.1 The classical theta lift of a heart globalization | GS Lemma 12.5, pp.37–38, GS lines 1574–1590. The proof requires nonzero local lifts everywhere, boundary nonvanishing and a zero lower lift at the Steinberg place. All three now occur in the route and Needs. |
| 10.4 Quadratic twists in the lower towers | GS proof of Theorem 12.6, final paragraph, p.39, GS line 1628. The source leaves these cases to the reader. The package owns the check from its declared lower-tower formulas; χ²=1 gives the required exterior-square identity. This is not a claim that the omitted proof is printed there. |
| 10.6 Constancy on discrete diamond Xu packets | GS proof of Theorem 12.7(ii), pp.39–40, GS lines 1644–1675. The one-place replacement, trivial global component group, local lifts and global strong multiplicity one are the actual inputs. Genericity of every packet member is not assumed. |

The manifest has exactly twelve cited works: eleven readable cached sources and Griess marked uncertified. No new key, download or missing-source request was needed. The sources were read as mathematical evidence, not instructions. GS's all-field spin-pole application is not certified from GS20's ℚ-only theorem; its generalization is a declared contract.

### Computed adversarial table

These are tests and negative controls, not purported proofs of the deep correspondences. “Retained” means no change is required. Quotient and injectivity statements were tested in both directions where relevant. In particular, the finite-group and local-parameter domains are distinguished rather than silently identified.

| Statement | Instances tried | Computed values on the two sides / wrong model | Result and change |
|---|---|---|---|
| §0.0 octonionAut | Identity, 2·id, conjugation; upper Zorn vectors u₁,u₂ | At 1·1, identity gives 1=1, 2·id gives 2 versus 4. Conjugation of u₁u₂ is lower −e₃; product of their conjugates is lower +e₃. | Real predicate accepts automorphisms and excludes scaling and the anti-automorphism. Retained. |
| §0.0 octonionRep and Griess headline | Γ=1; Γ=C₅ and t=diag(ζ,ζ,ζ³), t² | Trivial actions have conjugator 1. ζ-multiplicities in the seven-representations are 2 and 1; adjoining the scalar line keeps 2 and 1. Principal action on octonions has dimension 7+1=8. | Intertwining is a substantive hypothesis; equal image subgroups do not suffice. Retained. |
| §0.1 branchings; R01 | diag(2,3,1/6); identity; a=-1,b=1 | Vector eigenvalues {1,2,3,1/6,1/2,1/3,6}, product 1; spin adds 1. Identity dimensions 7 and 8. Sign example gives (X−1)³(X+1)⁴, degree 7. | Identities agree with supplier §0.6, establishing duplication. Import those two facts. |
| §0.2 discrete A₂ detection | Sym²; cubic χ⊗Sym²; principal G₂ SL₂; trivial parameter | Self-dual A₂ vector is 1⊕2Sym²: dimension 7, invariants 1, pole order 1. Component group S₃ has order 6. Cubic case has μ₃ of order 3. Principal Sym⁶ has invariants 0. Trivial parameter has pole order 7 but is nondiscrete. | Both directions of the discrete criterion survive; the centralizers differ. Retained. |
| §0.3 spin detection headline | Principal and subregular SL₂ | Principal spin 1⊕Sym⁶ has invariants 1; raw centralizer μ₂ has order 2, fixed-split quotient order 1. Subregular spin 2·1⊕2Sym² has invariants 2 and a positive-dimensional centralizer. | Discreteness excludes the subregular countermodel. Retained. |
| §0.4 standard injectivity | τ versus τ∨; principal and trivial N | 1⊕τ⊕τ∨ equals 1⊕τ∨⊕τ; both give the same G₂ class. Principal and trivial SL₂ yield N ranks 6 and 0 on the seven-module. | Duality is correctly quotiented, and retaining N prevents a false identification. R02 repairs the separate Spin₇ Check. |
| §0.5 quadratic rigidity | ρ=1 and nontrivial χ; normalizer sign | For ρ=1, (vρ)⊗χ has invariants 0; spin changes from 1⁸ to χ⁸. In the normalizer sign example the distinguished vector line transforms by χ, so twisting makes it invariant of dimension 1. | Nontrivial χ does not itself preclude conjugacy; the invariant-spinor argument is the relevant condition. Retained. |
| §§0.6–0.7 weak equivalence | Trivial versus central quadratic parameter; principal unipotent versus identity | q-traces are 7 and 7; spin traces 8 and −8. Unipotent spin Jordan sizes (7,1) versus (1,1,1,1,1,1,1,1), although traces both equal 8. | Neither q alone nor semisimple traces alone define the relation. Retained. |
| §§0.4,0.6–0.7 local example; R02 | F=ℚ₃ and ℚ₅; Γ=C₄² | Maximal exponent-four abelian quotients have orders 4·2=8 and 4·4=16. A quotient of order 8 cannot surject onto Γ of order 16. The ℚ₅ pullback has finite inertia and N=0. | The abstract pair is not already a WD_F pair. Use CG Proposition 8.3 for all F. |
| §0.8 Spin₇ unacceptability headline | Γ=C₄², V weights (1,0),(1,2),(0,1),(2,1), η=(0,2) | Sum of weights (4,4)=0 mod 4. ηV weights {(1,2),(1,0),(0,3),(2,3)} equal neither V nor V∨={(3,0),(3,2),(0,3),(2,3)}. All 16 pairs have x even, y even or x+y even. | Determinant 1 and elementwise conjugacy hold; simultaneous conjugacy fails. Abstract headline retained. |
| sumSquaresSeven, used by §0.8 | 0, e₁, e₁+i e₂ | Q values 0,1,0. The polar matrix is 2I₇, determinant 2⁷≠0; the associated half-polar matrix is I₇. | Isotropic does not mean degenerate. Native form is correct. Retained. |
| §§0.9–0.10 Chenevier descent headlines | Principal Sym⁶; finite S₃ quotient in density comparison | Weights −6,−4,−2,0,2,4,6, sum 0, dimension 7. S₃ class densities 1/6,3/6,2/6 sum to 1; the identity class alone has density 1/6. | Almost-all Frobenius data, regularity and full representation comparison are genuine inputs. Retained. |
| §§1.1–1.2 detected period spectrum | V⊕V with functional p(x)+p(y) | Diagonal value 2p(v); anti-diagonal value 0. A nonzero scalar rescaling has the same kernel. | Detects a multiplicity-space copy, not the entire isotypic summand. Retained. |
| §1.3 Poincaré/Whittaker conventions | ψ(n)=-1; empty S | With f(1)=1 the equivariance gives f(n)=-1, versus +1 in the untwisted model. Empty product group has one element. Extra allowed finite-place counts are 1 in (a),(b) and 0 in (b′). | Twisted space and free-archimedean-place hypothesis retained. |
| §1.4 quaternion globalization | Empty prescribed set; an added Steinberg prescription; selected multiplicity copy | Empty local tensor has dimension 1. The allowed extra-place count is 1; the fixed Steinberg prescription adds one specified place, not an uncontrolled place. On the selected V⊕V copy the period is 2p(v) rather than 0. | Finite/real prescriptions and actual nonzero period are retained. Stronger level control remains a declared contract. |
| §§1.5–1.6 generic globalization | Two real discrete-series signs; St⊕⨁1; split ranks | Whittaker dimensions 1 and 0. St multiplicity in the full sum is 1 and in the trivial summands is 0. Ranks G₂=2, PGSp₆=3, versus PGL₂=1. | Isolation and genericity cannot be inferred merely from large infinitesimal character or a rank-one analogy. Retained. |
| §1.7 spin-regular weights | λ_t=t(8,4,2), t=1 and 0 | Coordinate sum 14t is even; simple pairings 4t,2t,2t. h₁=(11,6,3) gives ±10,±7,±4,±1. h₀=(3,2,1) gives −3,−2,−1,0,0,1,2,3. | Growing weights satisfy the regularity test; boundary weight fails. Retained. |
| §2.1 triality maps over F | Centre C₂² of Spin₈ and its three central quotients | Three different subgroups of order 2; the cyclic permutation cubed is 1. Restrictions of the three eight-modules have dimensions 1+7,8,8. | The three maps have distinct kernels and the intended pullbacks. Retained. |
| §2.3 global isobaric spin transfer | Exceptional lift whose transfer is 1⊞A | Rank 1+7=8, number of GL₈ isobaric summands 2, not 1. | The GL₈ transfer need not be cuspidal; the orthogonal theta prerequisite is separate. Retained. |
| §2.3 added global theta statement; F01 | Steinberg versus lower φ=Sym³ | (Sym⁶)^SL₂ has dimension 0. Λ²Sym³=Sym⁴⊕1; (1⊕Λ²Sym³)^SL₂ has dimension 2. Steinberg forces lower lift 0. The generic GL₇ transfer has one cuspidal summand and a finite nonzero value at s=1. | With everywhere-local nonvanishing and Rallis, upper theta is nonzero and cuspidal. Repaired; contracts explicit. |
| §2.4 cancellation | One and two prescribed copies of σ | R_uR_wR_σ=1 and R_uR_wR_σ²=1 imply R_σ=1. Uncontrolled extra factors would allow R_σ=2, R_z₁=1/2, R_z₂=1/4. | The strengthened globalization excludes this wrong model. Retained. |
| §2.4 spin gamma identity; F02 | ℚ₅, trivial spin Satake parameter, s=2; ψ₀ and ψ₅ | Each Tate ratio (1−5⁻²)/(1−5)=−6/25. Eight factors give (6/25)⁸. Scaling ψ by 5 multiplies by 5⁻¹²=1/244140625. | Correct conductor-zero and arbitrary-ψ statements now agree. Repaired. |
| §2.4 Steinberg spin image | Principal SL₂ in Spin₇ | Spin weights 6,4,2,0,0,−2,−4,−6, versus Sym⁷ weights 7,5,3,1,−1,−3,−5,−7. | Spin lift is 1×St₇, not St₈. Retained. |
| §2.5 generic quadratic twist; F03 | χ(Frob)=-1 and χ² | Seven vector eigenvalues unchanged; eight spin eigenvalues negated; a second twist restores all eight. A GL₂ converse twist has dimension 16, not 8. | Theta/SO₈ twist route has the right data. Untwisted-converse alternative removed. |
| §3.1 factorization through G₂ | τ=St_PGL₃ and principal G₂ parameter | A₂ vector 1⊕2Sym² has dimension 7 and N rank 4; its spin extension has dimension 8 and N rank 4. Principal vector Sym⁶ has dimension 7 and N rank 6. | Factorization accommodates both branches without erasing N. Retained. |
| §§3.2,3.5–3.7 classification and discrete series | Trivial and Steinberg G₂ at q=5; reciprocity inversion | Semisimple WD eigenvalues both 5⁻³,…,5³; N ranks 0 and 6. Arithmetic norm at Frobenius is 1/5, supplier ω is 5. A character value 2 becomes 1/2 under inversion, and 2 after dual transport. | N and the stated reciprocity transport distinguish the cases. The trivial representation is not discrete; Steinberg is. Retained. |
| §§3.9–3.13 standard lift and gamma characterization | A₂ τ=Sym²; rank-r twists; two maximal Levis | Standard dimension 3+1+3=7, N rank 4; tensor dimension 7r and determinant contribution det(τ)⁷. Levi decompositions have dimensions 2+2+1+1+1=7 and 2+2+3=7. | All required twists and monodromy occur here; degree-eight spin data is not substituted. Retained. |
| §3.14 theta characterization | Dual pair τ,τ∨ and a fixed heart standard parameter | The pair produces one G₂ class; injectivity of v gives one class from the heart datum. The two disjoint loci have intersection empty and union Irr(G₂). | The proposed characterization determines the map, without assuming its conclusion. Retained. |
| §3.15 all-places compatibility headline | Universal irreducibility premise; Steinberg local component | Empty prime set has density 0; the supplier's density-one set is nonempty. Local N rank remains 6 at Steinberg, not 0. | Universal premise is discharged for every eligible form; all-place comparison keeps N. Retained. |
| §§4.1–4.4 A₂ enhancements | S₃ and μ₃; p=3 subregular case; opposite algebra | S₃ irreducible dimensions 1,1,2 have squares summing to 6. μ₃ has three one-dimensional irreducibles. A 3-cycle has standard trace ζ+ζ⁻¹=-1. Opposite invariant −1/3=2/3, twice opposite returns 1/3. | Self-duality, enhancement labels and opposite algebra agree. The subregular fibre still has 3 members at p=3. |
| §4.5 enhanced theta compatibility | Restrict S₃ representations to μ₃ | Trivial and sign restrict to 1; the two-dimensional standard restricts to χ⊕χ⁻¹. Trivial-character multiplicities are 1,1,0. | PGL₃ versus division theta criterion distinguishes the two branches; division JL input remains discrete. Retained. |
| §§5.1–5.3 Kret–Shin headlines | Steinberg; central quadratic twist | q-image Sym⁶ has dimension 7; s-image 1⊕Sym⁶ dimension 8. A spin-changing twist fixes q and changes s. | The jointly constrained set is not arbitrary data. The repaired global theta prerequisite is used. |
| §§5.4–5.6 exceptional spin headline | Principal and subregular generic G₂ discrete series | Spin invariants 1 and 2; dimensions 1+7=8 and 2+3+3=8. Subregular PGSp₆ partner is tempered Siegel-induced, not discrete. | Generic tempered intermediate codomain is necessary and present. Retained. |
| §§6.1–6.5 diamond surjectivity and packet comparison | Principal diamond; bounded supercuspidal diamond; quadratic stabilizer H | Principal spin has one invariant line; the spin L-factor has a pole at 0. An orbit X/H has size [X:H]; if H=X its size is 1. | Pole test and nonfree twisting are preserved. Retained. |
| §6.6 a diamond fibre is one Xu packet | Principal parameter; one-in-all-in test | G₂ principal fibre and distinguished Xu packet each have cardinality 1. Within a selected packet, membership indicators are all 1, not one selected constituent and zeros elsewhere. | Whole-packet conclusion and its scope agree. Retained. |
| §7.1 G₂ LLC headline | Principal fibre; general A₂ fibre at p=3; subregular | Principal fibre size 1. A₂ enhancement target has 3 labels; at p=3 the general construction guarantees an injection with fibre size ≤3, while subregular size is exactly 3. | Surjectivity of L is separate from full enhancement at p=3. No prime restriction added. Retained. |
| §7.2 HKT headline | Generic and nongeneric supercuspidal cases | Whittaker dimensions 1 versus 0; a generic supercuspidal parameter has trivial SL₂ part, whereas the nongeneric subregular example has N rank 4. | Genericity is essential; no false extension to all supercuspidals. Retained. |
| §7.3 partial enhanced PGSp₆ headline | Principal diamond; quadratic orbit with full stabilizer | Raw centre order 2, fixed-split component quotient order 1. Full stabilizer gives orbit size 1, not the size of the quadratic-character group. | Correct central quotient and matching stabilizers. Retained. |
| §8.1 classical theta of a heart globalization | Heart versus spade at v₀; Steinberg at v₁ | Split local lift is nonzero in the heart case and 0 in the spade case. At v₁ the lower lift is 0; upper first occurrence is nonzero, with standard L-value finite and nonzero at 1. | Heart, archimedean nonvanishing, boundary nonvanishing and lower-tower vanishing are all used. Repaired inputs are explicit. |
| §8.2 Kret–Shin headline | Principal finite-place parameter; h=(11,6,3) at infinity | Local spin has two zero weights; global Hodge spin weights ±10,±7,±4,±1 are all distinct. An isobaric 1+7 decomposition would have 2 Galois summands, contradicting irreducibility of rank 8. | Local Steinberg does not violate global spin regularity. Main theorem retained. |
| §8.2 first Check; R02 | CG Example 1 versus Proposition 8.5 | Example 1 vector 1⊕2c⊕d⊕d⁻¹⊕e⊕e⁻¹ has centralizer dimension 1+1+1=3. Proposition 8.5 vector has distinct irreducibles of dimensions 1,2,4 and centralizer dimension 0. | Example 1 cannot witness discrete ambiguity. Delete the unsupported Check. |
| §§9.1–9.3 extended spin transfer | Lower-tower φ_τ=Sym³; its dual | Λ²Sym³=1⊕Sym⁴, dimension 6; vector is 2·1⊕Sym⁴, dimension 7, spin is 2Sym³, dimension 8. Duality keeps the eight-dimensional sum unchanged. | Both lower towers use the same JL parameter data and actual dual summand. Retained. |
| §§10.1–10.2 weak LLC headline | All proper standard Levis; trivial and principal parameters | Number of proper Levi subsets 2³−1=7. Trivial Spin₇ centralizer has dimension 21; principal centralizer is finite μ₂, quotient order 1. | All proper-Levi families and the discreteness distinction are present. Retained. |
| §§10.3–10.4 quadratic twists in lower towers | φ_τ eigenvalues 2,3,5,1/30; χ=-1 | Λ² eigenvalues {6,10,1/15,15,1/10,1/6}; χ² leaves them fixed. The eight spin eigenvalues are negated. Twice twisting restores the original lists. | Both vector and spin comparisons hold, using the twist contracts. Retained. |
| §10.6 constancy on discrete diamond Xu packets | One-place packet replacement with/without a nontrivial global sign condition | If two local signs are −1 their product is +1; replacing only one would give −1. For the actual globalization S_Ψ=1, the character product is necessarily 1 before and after one-place replacement. | Trivial global component group is what permits the replacement. Strong multiplicity one then fixes the same spin parameter. Retained. |
| §§10.7–10.9 weak fibres headline | Dual lower-tower pair; diamond spin image; CG local pair | φ_τ⊕φ_τ∨ has the same eight entries after duality. Diamond spin invariants have dimension 1 and rigidity yields one conjugacy class in the relevant fibre. CG Proposition 8.3 gives at least 2 conjugacy classes in one weak class elsewhere. | General fibres are unions of Xu packets; diamond uniqueness is not generalized. Use R02's local pair for the contrast. |

### Acceptance test, signatures and padding

The prescribed `lake env lean` invocation on the original `packages/LocalLanglandsCorrespondenceForG2/Suggested.lean`, run from the content checkout, exited 0. Its only diagnostics were `declaration uses 'sorry'` at 115:8 and 134:8. The imported octonion object file existed; no build or dependency update was needed.

A scratch copy with `#check @` for all five declarations also elaborated. The inferred signatures retain both semisimplicity hypotheses in `griess_conjugacy`, the explicit intertwining linear equivalence, the common-conjugator quantifier order, the group instance in `octonionRep`, and `Finite Γ` in `spin7_not_acceptable`. No binder disappeared and no signature was changed. `octonionAut` is an actual subgroup with a multiplicativity predicate, not assumed G₂ data. `sumSquaresSeven` has the real weighted-sum body on `Fin 7 → ℂ`.

| README headline family | Treatment in Suggested.lean |
|---|---|
| Griess conjugacy, §0.0 | `griess_conjugacy`, line 115; two simple definitions on native octonions. |
| Spin₇ unacceptability, §0.8 | `spin7_not_acceptable`, line 134; native quadratic form and spin group. |
| A₂ and spin detection, §§0.2–0.3 | Docstring lines 34–40 names both and their component groups; missing parameter/L-factor/inclusion carriers are specified. |
| Standard injectivity and quadratic rigidity, §§0.4–0.5 | Docstring lines 41–45; missing parameter carriers and G₂-to-Spin₇ comparison. The statable conjugacy core is stated. |
| Chenevier local and Galois descent, §§0.9–0.10 | Docstring lines 46–48; actual automorphic representations, Satake data and attached Galois representations missing. |
| Quaternion, generic and regular-weight globalizations, §§1.4–1.7 | Docstring lines 49–53; adelic spaces, period/Whittaker functionals, Fell duals and local discrete series missing. |
| Triality spin transfer and gamma identities, §§2.2–2.5 | Docstring lines 54–57; classical theta, smooth representations, Arthur correspondence and local factors missing. |
| G₂ LLC, standard lift, theta/gamma characterizations and A₂ enhancements, §§3–4 and 7.1 | Main LLC docstring entry, lines 22–28, supplemented by lines 32–40; actual smooth G₂ and parameter carriers missing. |
| Kret–Shin and exceptional spin identity, §§5.1–5.6 and 8.2 | Docstring lines 58–65; Spin₇ parameters, GSpin Galois construction and the actual representation comparisons missing. |
| Diamond fibres and partial enhancement, §§6.6,7.3 | Explicitly named at lines 62–65; theta and Xu packet carriers missing. |
| Generic supercuspidal correspondence, §7.2 | Lines 29–31; same group/parameter carriers and Whittaker genericity missing. |
| Weak PGSp₆ correspondence and fibres, §§10.1,10.9 | Lines 66–68; actual representation and weak-parameter carriers missing. |
| All-places global–local compatibility, §3.15 | Lines 69–70; automorphic and attached Galois representations missing. |

No statable headline was found missing or replaced by a stand-in. All five backticked names attributed to this roadmap are declared: `octonionAut`, `octonionRep`, `griess_conjugacy`, `sumSquaresSeven`, `spin7_not_acceptable`. Other backticked mathematical notation is not presented as a Lean declaration. The import header is one `import Mathlib` and the one used Tau Ceti module. There is no `set_option`, sorry'd data, free predicate substitute, `lemma`, admitted example or declaration quota.

The one-tactic probe covered both admitted theorems, not a sample. Separate `simp`, `rfl` and `infer_instance` probes all failed to close their goals: six failures, followed by the original `sorry` in the scratch file. The scratch file elaborated with only the expected sorry warnings. The one-library-lemma possibility was checked against the pinned near matches: element conjugacy does not give simultaneous conjugacy of homomorphisms; Maschke gives semisimplicity, not an octonion-multiplicative intertwiner; quadratic-form equivalence does not construct an unacceptable pair. Neither theorem restates a definition, computes a small value, mirrors a Check or treats only a boundary case. No padding finding.

### Pinned objects opened

The pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`, from the content manifest. Paths in this table are relative to the respective library roots.

| File and line | What was checked |
|---|---|
| `Mathlib/RepresentationTheory/Semisimple.lean:34` | `Representation.IsSemisimpleRepresentation` is complementedness of the subrepresentation lattice; it neither assumes Γ finite nor supplies conjugacy in G₂. |
| `Mathlib/RepresentationTheory/Maschke.lean:180` | Finite-group semisimplicity with characteristic/cardinality assumptions; cannot discharge the conjugacy conclusion. |
| `Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean:62,293,385` | Lipschitz group, even spin subgroup and Group instance. Native Clifford construction, without a p-adic smooth representation category or LLC. |
| `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1408,1415` | Weighted sum of squares and its evaluation; the seven coefficients here really are 1. |
| `Mathlib/LinearAlgebra/QuadraticForm/AlgClosed.lean:52,62` | Nondegenerate finite-dimensional forms over an algebraically closed field, with 2 invertible, are equivalent to sums of squares and to one another. This is not either headline theorem. The near-match lead naming a Complex.lean file was not treated as a pinned declaration. |
| `Mathlib/Algebra/Group/Conj.lean:32,84`; `Mathlib/GroupTheory/GroupAction/ConjAct.lean:207` | Elementwise conjugacy and conjugation orbits; the ∀γ∃g and ∃g∀γ quantifiers remain distinct. |
| `Mathlib/Data/Matrix/Diagonal.lean:50`; `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:140,158` | Diagonal matrices, characteristic polynomial and diagonal-product formula. |
| `Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean:115,119`; `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:80` | Degree with its nontrivial-ring hypothesis, monicity and diagonal determinant. Hypotheses hold over ℂ. |
| `TauCeti/Algebra/Octonion/Basic.lean:143,279,305` | Zorn carrier, multiplication signs and nonassociative ring. These give the explicit anti-automorphism negative control. |
| Same file, lines 336,354,365,537,551,831,861,869 | Conjugation, reversal of product, trace, norm multiplicativity, norm form, imaginary kernel, rank seven and nondegeneracy with the stated hypotheses. All needed hypotheses hold over ℂ. No native Griess theorem here. |
| `TauCeti/Algebra/Lie/D4/Tripled/Triality/Basic.lean:155,161,197` | Integral triality automorphism, root action and cube identity. The comparison with the three F-rational quotients is additional work here. |
| `TauCeti/NumberTheory/ClassFieldTheory/WeilGroup/Basic.lean:91,181,235` | Arithmetic Frobenius powers, native Weil group and degree. These do not supply the G₂-valued WD parameter or smooth G₂ category claimed missing. |

Object searches, not just exact-name searches, covered octonion automorphisms and representations, Spin₇ conjugacy, Weil–Deligne parameters, smooth representations, triality, local factors, relative isolation and weak containment. Existing general topological-representation objects were not mistaken for the absent smooth G₂ correspondence carriers. No fully qualified name of the five declarations collides with a readable supplier's acceptance test.

### Supplier citations, overlap and order

I read the board-package index before making absence claims, and the supplied overlap snapshot at the open heads. I used indexed `roadmaps grep`, `roadmaps show` and `roadmaps resolve`. The resolver reports no unresolved citations or Lean names; its host's unavailable library scan was replaced by direct pinned-file inspection above. The overlap snapshot reports no other head changing this roadmap, dropped cited ids, or revision-only ids. The material overlap is R01, established by reading the supplier rather than inferred from vocabulary similarity.

The following table records the resolved supplier objects. PR numbers identify the inspected heads in this report; the package itself correctly cites roadmap names rather than PR numbers.

| Supplier/head and repository evidence | Citation resolution / ownership comparison |
|---|---|
| #1736, `TauCetiRoadmap/ExceptionalThetaCorrespondencesForG2/README.md:130,247,268,295,318` | §§0.1,0.6–0.9: octonion G₂, inclusions and branchings, actual complex parameters, raw/fixed-split component groups and proper-Levi models. R01 removes duplicate ownership of two branchings. The small native octonion specializations here are justified by the Griess acceptance test. |
| Same file, lines 470,1005,1018,1033,1045,1090,1366–1488 | Partial unipotent labels, division Howe/nonvanishing, opposite algebras, outer signs, the p=2 exception, split-E₆/E₇ tables, trichotomy, spin pole and depth-zero example. Partial labels explicitly leave the full LLC to this consumer. |
| Same file, lines 1514–1588,1614–1716 | Quaternion pointwise stabilizers, relative embeddings, Steinberg/compact-real models; global exceptional theta occurrence, nonvanishing, cuspidality, genericity and real matching. These are distinct from this package's classical global theta application. |
| #1180, `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md:1488,1792,1850,2015,2047,2081,2253,3164` | §§2.43,3.5,3.8,3.15,3.17,3.19,3.27,5.1: universal extremely regular irreducibility, GSp₄, Arthur and Xu local/global packets, self-twist stabilizers, multiplicity, generic Sp-to-GL transfer. Trace-formula assumptions are retained. SO₈ spinor-norm twisting is a declared supplement, not falsely claimed from §3.15 alone. |
| #999, `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:504,1872,1893,3597,4125,4208,4224` | §1.13, §§4.7a–4.8 and §§10.1,10.26,10.30,10.31: inner-form normalization, JL, full WD parameters, local factors, twisting and inner forms. Geometric reciprocity is transported explicitly. Generic local converse is an additional contract. |
| #1063, `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:786,844,1026,1108,1116,1714,1722` | §§3.10,3.17,3.34,3.41,3.42,6.13,6.14: first occurrence, archimedean theory, similitudes, two towers and Rallis. §3.41 alone is nonarchimedean; the new archimedean nonvanishing contract supplies the missing scope. All-Levi tables, complex matching and similitude Rallis are also explicitly declared. |
| #924, `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:921,925,1430,2278` | Conductor-zero epsilon normalization and ψ scaling; AL.3 functional equations, isobaric transfer, strong multiplicity one and boundary nonvanishing; AL.4 unramified factors. The repaired numerical gamma Check matches these conventions. |
| #1756, `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:16,1060` | Scope and Layer 6 generalized local factors. The PGSp₆ Shahidi contract extends the same owner used by the exceptional-theta supplier; it does not create a second owner. |
| #1688, `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:1916,2045,2205,2571,2875,4763` | SR.2.1–2.3, SR.3.1,3.3, SR.5.2: induction, modulus, Whittaker models, classification and classical LLC inversion. |
| #1815, `TauCetiRoadmap/SmoothRepresentationsOfLocalGroupsPartII/README.md:99,422,542–606,867,893,1015,1027` | Finite-product Fell topology, weak containment/closure, generic limits, discrete isolation, rank-at-least-two Steinberg isolation and supercuspidal isolation. No subsequence conclusion or blanket real isolation is imported. |
| #1037, `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:416,446,644,662` | §§2.4–2.5 and4.2–4.3: real modules/parameters, cusp and Whittaker spaces. General Poincaré weak containment and the two regular-real bounds are declared supplements. |
| #925, `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:3148,3176,3196` | §§6.16,6.18,6.19: trace formula, pseudo-coefficients and Euler–Poincaré functions. Weight-sequence Plancherel density remains a declared addition. |
| #1006, `TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md:1263,1818,2149,2453,3226` | AG2.2, AG2.5 and AG2.6, including full N, universal irreducibility premise and totally real descent. GSpin construction is an additional contract, not a GL_n theorem renamed. |
| Main `TauCetiRoadmap/ClassFieldTheory/README.md:1054,1576`; `TauCetiRoadmap/ReductiveGroups/README.md:3029` | Layers 5 and 9 local Brauer invariants and Weil group; Layer 9 Chevalley–Demazure group schemes. |
| Main `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:665,777,839,969`; `Completed/OrthogonalSpinGroups/README.md:408,610` | Spin/fundamental representations, Spin₆≅SL₄ with vector Λ², triality and spinor norms. General-field algebraic spinor norms are in Layer 1; narrower analytic examples in Layer 2 do not restrict the algebraic input to ℚ_p. |
| Main `Completed/Chebotarev/README.md:410`; `TauCetiRoadmap/GlobalQuadraticForms/README.md:693,833,1066` | Density and Hasse/isometry/classification inputs used in the parameter and globalization arguments. They are not claims that the supplier already constructs this G₂ correspondence. |
| #1758, `TauCetiRoadmap/TwistedAutomorphicDescents/README.md:7–17`; #1404, `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md:11–19` | The remaining closest overlap leads own orthogonal descents and unitary relative periods. Their scope does not duplicate G₂ LLC, the PGSp₆ spin transfer or Griess conjugacy. |

Every Needs line and supplier citation was read. No upward edge, cycle or newly unowned prerequisite was found. All fourteen gaps have the same slug and named supplier in `design/plan.json` and the README's Exact supplier contracts:

`spin-pole-global-converse`, `gln-generic-local-converse`, `so8-spinor-norm-twist`, `pgsp6-similitude-theta-tables`, `pgsp6-pgso8-complex-theta`, `pgsp6-pgso8-archimedean-generic-theta`, `pgsp6-similitude-rallis`, `pgsp6-shahidi-spin-factor`, `relative-generic-isolation`, `poincare-weak-containment`, `regular-real-unitarity`, `regular-real-isolation`, `automorphic-plancherel-density`, `kret-shin-gspin-galois`.

Their hypotheses and requested APIs were compared with those supplier sections. Each has a precise scope and an earlier owner. Related clauses specify one construction's needed API, rather than unrelated projects. In particular, the two new gaps cover genuinely missing archimedean nonvanishing and SO₈ twisting; the expanded tables contract supplies Steinberg lower-tower vanishing. They do not ask again for native triality, the native spin group, the local Weil group or exceptional theta theory. No gap defect is added.

The prescribed dependency check returned exactly:

```text
depcheck: 236 roadmaps, 2147 edges, 0 problem(s)
```

There are no UPWARD, CYCLE or moved lines. No merge-order or tooling file was changed.

## Not verifiable

- Griess, *Basic conjugacy theorems for G₂*, Theorem 1: the original remains settled as uncertified/paywalled. It was not requested again. C and HKT's use of it is secondary evidence, not a claim that its original text was read.
- The fourteen supplier contracts are not proved merely by being declared. In particular, GS20's printed converse is over ℚ, and ILM's setting does not itself certify the full all-residue-characteristic general-group Poincaré contract. After repairs, acceptance would still be conditional on these named contracts.
- GS leaves the lower-tower twist and constancy/reduction details to the reader at the cited locations. The explicit identities and supplier inputs were tested here; a full proof is assigned to the roadmap, not alleged to have been read in the source.
- Supplier-owned references such as Arthur's book and the Xu papers were not independently fetched. Their actual supplier statements, sections and hypotheses were resolved at the available heads.
- Ownership against every open pull request named without a relevant supplied file/head was not checked individually. Indexed object searches, the board index, overlap snapshot, readable relevant heads and the five closest scopes were checked. No claim of exhaustive inspection of all 439 pull requests is made.

No new unread-source request was added. The package inputs were not edited; the deliverables are this report and review.json.

## Source issues

- **Gap** in GS at Proposition 4.1(i), proof, pp.18–19: the source says its globalization leaves no uncontrolled finite factor; it should be a strengthened globalization or an argument controlling the extra factor permitted by the cited proposition; affects the proof.
- **Error** in GS at Main Theorem (vi), p.4: the source says the intermediate PGSp₆ representation is generic discrete series; it should be generic tempered, allowing the Siegel-induced partners; affects a stated result.
- **Misprint** in GS at Main Theorem (ix), p.4: the source says the gamma expression ends before its tensor factor; it should be the gamma factor of the full tensor product with φ_τ; affects nothing.
- **Misprint** in GS at §3.1, p.10: the source says Theorem 2.1(i) gives the theta dichotomy; it should be Theorem 2.1(ii); affects nothing.
- **Misprint** in GS at §3.3, p.11: the source says the totally definite octonion algebra is over F; it should be over the totally real field k; affects nothing.
- **Misprint** in GS at §4.4, p.19: the source says the functional-equation comparison is for representations of G₂(F); it should be for PGSp₆(F); affects nothing.
- **Gap** in GS at Theorem 9.1(ii), p.27: the source says the enhanced PGSp₆ compatibility holds for every irreducible G₂ representation; it should be restricted to the diamond discrete range where that enhanced correspondence has been constructed; affects a stated result.
- **Gap** in GS at Lemma 12.4, proof, p.37: the source says Shin Theorem 5.8 supplies spin-regular infinity weights; it should be the weight-sequence limit of Corollary 4.12 applied to an explicit growing spin-regular sequence; affects the proof.

These source issues are not additional package findings: the relevant qualifications, corrected codomain and explicit contracts are present in the package. R02 concerns misuse of a correct source example, not an error in CG.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "7a53aa7f839b8bec7cd7257bd202f0023682fcef", "job": "REV-PKG-LocalLanglandsCorrespondenceForG2~4", "model": "gpt-6-astra", "worker": "chris-32"} -->
