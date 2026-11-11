<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13085#issuecomment-6782493147 -->
Review (codex) of d3225b4

Verdict: needs_changes

1. **F01** (P2) The Whittaker test lattice is the wrong lattice

   **Location.** `packages/GrossZagierAndArithmeticHeightsPartII/README.md:472`, §3.1: “W′_T(0, 1_(L^n))”.

   **Claim.** The density derivative for the represented lattice L uses its own characteristic function as the standard Siegel–Weil input.

   **Witness.** LZ line 646–649 uses the separate self-dual Λ=⟨1⟩_n and φ₀=1_(Λ^n). In rank one, L=⟨ϖ⟩ has determinant valuation 1, whereas Λ has valuation 0; they are not isometric.

   **Exact repair.** Introduce the reference self-dual lattice Λ in its reference hermitian space, put φ₀=1_(Λ^n), and write W′_T(1,0,φ₀). L supplies T, not the Schwartz lattice. Preserve the product and log(q²). LZ line 665–668 then gives, for n=1, q=3, valuation 1, W′=(1+1/3)log 9=(8/3)log 3, agreeing with the Check. Add the two determinant parities as a negative control against identifying L with Λ. Propagate this distinction to consumers of the local section.

2. **F02** (P2) Arbitrary Schwartz support requires rational Hom

   **Location.** `packages/GrossZagierAndArithmeticHeightsPartII/README.md:1247`, §10.1: “x_i: A₀ → A homomorphisms” for a general K-invariant open compact U.

   **Claim.** Actual homomorphisms with Tate labels in arbitrary U give the cited global special cycles and their integral extensions.

   **Witness.** Let A₀=E and A=E×Ē with principal polarizations and unit-norm inclusion x. Rational x/3 has norm 1/9 and can lie in U. Actual Hom has integral norms. LL1 line 1240 explicitly uses Hom⊗ℚ.

   **Exact repair.** Use O_F-linear rational homomorphisms on the generic moduli problem, transported under its quasi-isogenies. For an integral model, state the model-prime integrality/p-basic condition and the allowed denominators away from that prime before asserting finite unramified extension. LL1 line 1719–1732 makes this restriction explicit. Retain the repaired coefficient-linear extension, and propagate the rational-Hom wording to its API. Test a small K-invariant compact-open neighbourhood of x/3 disjoint from the integral Tate lattice at 3: the intended generic cycle contains this CM point for T=1/9; the written actual-Hom functor does not. At a model prime other than 3, the denominator 3 is allowed and its local integrality can be imposed. This repairs the remaining integral-data part of earlier R10 without restricting general Schwartz inputs to integral support.

3. **F03** (P2) Nonzero labels need not have nonempty cycles

   **Locations.** `packages/GrossZagierAndArithmeticHeightsPartII/README.md:655`, §5.1: “N(x) meets each”; and line 241, §0.7: “has a horizontal part and is not killed”.

   **Claim.** Every nonzero exotic label meets both components, and every rank-(n−1) unramified lattice has a nonempty horizontal cycle.

   **Witness.** In the exotic plane take h(e,e)=1 and x=u⁻¹e. Then h(x,x)=−u⁻² has F₀-valuation −1, so N(x)=∅ by LL2 line 499. It meets zero components, not two.

   **Exact repair.** Qualify the component-incidence assertion by h(x,x)∈O_F₀; explicitly state emptiness for a nonintegral norm. For the rank-(n−1) Check, use the actual positive example n=2, L=O_F e with h(e,e)=1, whose cycle is N₁, rather than a universal assertion. Add L=O_Fϖ⁻¹e as its negative control: its norm is ϖ⁻², its unramified cycle is empty, its horizontal part is empty, and it is killed by every power of ϖ. The positive example remains flat and nonempty. These qualifications retain the general cycle functors, including empty cycles.

4. **F04** (P2) The incidence construction omits m ≥ 1

   **Location.** `packages/GrossZagierAndArithmeticHeightsPartII/README.md:896`, §7.2: “For a 2m-dimensional symplectic space” and “dim U′ = m−1”.

   **Claim.** The stated construction and dimension theorem apply to all symplectic dimensions admitted by the paragraph.

   **Witness.** At m=0, V=0 and U=0, but U′ would have dimension −1. Thus S_V is a point and Y_V has no such pair. K line 654 expressly assumes m≥1.

   **Exact repair.** Put m≥1 in the initial quantifier and API. Keep the independent m=1 and m≥2 clauses. Add m=0 as an excluded control, not a natural-subtraction reinterpretation of the incidence problem. For m=1, U′=0 and Y_V=S_V=ℙ¹ of dimension 1; for m=2, the fibre over a rational Lagrangian is ℙ¹. These test the repaired range and the stated exceptional-fibre dimension.

5. **F05** (P1) The regularized Green and Borcherds input has no supplying target

   **Locations.** `packages/GrossZagierAndArithmeticHeightsPartII/README.md:1466`, §12.4: “the regularized-theta Green function G_B of the source”; line 1485, §12.5: “regularized theta lift of MetaplecticAutomorphicForms §5.8 and Borcherds products”.

   **Claim.** The cited supplier supplies the regularized Green lift and Borcherds divisor relation needed by the arithmetic modularity route.

   **Witness.** Pull request #1063, `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:1398`, constructs a GQT integral against an auxiliary H-Eisenstein series. It supplies neither logarithmic Green currents nor Borcherds sections. Z line 2379 explicitly requires their integral-model divisor computation.

   **Exact repair.** Add named targets before §12.4 for the regularized-theta Green current used there and for the unitary Borcherds divisor/metric relation used by §12.5, with actual domains, weights, input conditions, normalizations and locators. Include their integral-model comparison over the indicated localized base, keeping the vertical discrepancy rather than silently discarding it before taking the quotient. Make §§12.4–12.5 depend on those targets; do not describe the GQT integral as their supplier. If a general analytic part is assigned to an earlier supplier instead, declare that exact extension in both gap locations before consuming it.

   The check for the repaired interface is a nonzero principal part supported at a positive index: its lift must have the specified logarithmic singularity along the corresponding special divisor, and its meromorphic section must have that divisor with the prescribed multiplicity. With principal part zero and constant coefficient c, the Hodge weight/metric term must have coefficient c; the zero input must give zero Green current. The present GQT interface cannot express either divisor condition. The closest other owner, pull request #1695, `TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocityPartII/README.md:667`, §4.2a, concerns GSpin data with n≥3. It does not supply this general unitary integral comparison and must not be imported upward or duplicated as though it did.

6. **F06** (P2) Finite-field scheme cohomology is attributed to analytic adic theory

   **Locations.** `packages/GrossZagierAndArithmeticHeightsPartII/README.md:84`, supplier contract: “ClassicalAdicEtaleCohomology Layer 8”; repeated at lines 370 and 382 in §§2.1–2.2 and at the layer's end.

   **Claim.** This supplies the compactly supported cohomology and open–closed excision used for the finite-field Deligne–Lusztig schemes.

   **Witness.** Pull request #875, `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:3985`, §8.1, starts with locally noetherian analytic adic spaces. The target uses schemes over finite fields. Main's `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:443` supplies the scheme localization triangle.

   **Exact repair.** Repoint the algebraic support/excision contract and its Needs lines to EtaleCohomologyFoundations §§0.7–0.8, including §§F.4.1–F.4.6 for its adic-coefficient realization when passing to ℚ_ℓ; retain MotivesAndAlgebraicCycles §2.7 for the geometric realization and Frobenius conventions. Do not introduce an analytification bridge for these finite-field schemes. Main's §0.8 at line 567 supplies their lower shriek. Test U=𝔸¹⊂ℙ¹ and closed complement a point: the scheme localization triangle gives H⁰_c(U)=0, H¹_c(U)=0 and H²_c(U)=ℚ_ℓ(−1), with Frobenius q. It applies directly to this finite-field object; the cited analytic-adic contract does not.

7. **F07** (P3) The AFL base-case Check conflates two rank indices

   **Location.** `packages/GrossZagierAndArithmeticHeightsPartII/README.md:1798`, §14.5: “n = 1: the group statement is trivial, and the semi-Lie statement in dimension one”.

   **Claim.** The dimension-one semi-Lie base is associated with the same n=1 instance in this Check.

   **Witness.** The theorem at line 1794 places the semi-Lie problem in dimension n−1. At n=1 that dimension is 0; dimension 1 corresponds to n=2.

   **Exact repair.** Split the Check: group rank n=1 is the trivial group boundary; the semi-Lie dimension-one calculation is the n=2 instance. At norm valuations a=1 and 3 its two intersections are 1 and 2 and its normalized derivative values are −1 and −2. Keep these in the README only; do not add acceptance-file padding.

Seven findings, six blocking. The package remains repairable in its intended scope. The acceptance file elaborates without warnings and the dependency graph passes, but those checks do not establish the mathematical statements or the domains of supplier contracts. No mathematical package file or source-manifest entry was changed.

## Previous findings, checked first

Locations in this table are in `packages/GrossZagierAndArithmeticHeightsPartII/README.md` unless specified otherwise. The repair report marks no finding not actionable. These are checks of the actual replacement text, not acceptance of the repair report's assertions.

| Round-2 finding | Status | Repaired passage and verification |
|---|---|---|
| R01, primitive horizontal component | Repaired | §1.3:316 now specifies “the component corresponding to Z_(val(M))” and “maximal degree”. At q=3 and valuation 2, the closed level-two component has degree 12, the level-zero component degree 1, total 13. Removing the latter as an open complement would still give 0. LZ line 768 and line 796 support the closed-component construction. |
| R02, Euler characteristic | Repaired | Conventions:30 and §0.6:216 use “the Euler characteristic of derived global sections”. On C=ℙ¹ with O(D) restricted to C equal to O(−1), cohomological lengths are 1 and 2, hence χ=−1; stalk lengths are infinite. The same corrected convention is used downstream. |
| R03, negative rank-one valuation | Repaired | §0.9:260 separates “a ≥ 1” from “a < 0”; its Check includes a=−3. The polynomial derivatives at a=1,3,−3 give 1,2,0, respectively. §§0.8, 3.2 and 3.3 retain the integrality qualification. |
| R04, density-sign vanishing | Repaired | Contract:68 now says “of equal rank” and uses nonexistence of an isometric embedding in general. The same sentence is in the plan's gap. Minimal exotic L has Den(H₁,L)=0 but Den(H₂,L)=640/729 at q=3; the repaired contract allows both. |
| R05, reflection | Repaired | §5.6:723 uses “a normal basis with an anisotropic last vector” and explicitly requires the earlier cross-pairings to vanish. For an orthogonal plane, reflection preserves 0 cross-pairings and has determinant −1. The earlier basis e₁,e₁+e₂ would change 1 to −1 and is excluded. |
| R06, covolume | Repaired | §6.4:796 uses “val(M) = Σ a_i”; invariants (1,1) and (3,3) have equal type 2 but volumes 1/3 and 1/27 at q=3. Only vertex lattices specialize valuation to type. |
| R07, valuation units | Repaired | §6.7:829 distinguishes “F-adic” from “F₀-valuation”; §6.9:858 says the unit comparison does not shift valuation; §9.4:1193 gives the norm factor “−ε”. The three valuation changes are respectively 2 versus 1 in the two units, 0, and 0. |
| R08, Chern/Fourier controls | Repaired | §2.6:442 says “odd-degree”; §2.7:454 recognizes that negation “preserves the eigenvalue −1”. On ℙ² the two series are H−H²/2 and −H−H²/2. At q=3 the pairs (f,f̂)=(-8,8) and (8,-8) both have eigenvalue −1. |
| R09, excess labels | Repaired | §5.3:693 says the repeated-label Euler characteristic “exists and equals zero”. On proper finite support the two lengths are ℓ and ℓ, so their difference is 0. |
| R10, Schwartz weights | Partly repaired | §10.1:1247 now defines “Σ_c c·Z(T,1_(φ⁻¹(c)))”. Weights 1 and 2 give multiplicities 1 and 2, as required. However, the characteristic-function functor still uses actual Hom for arbitrary U, without the required rational Hom and local integrality data: new R02. |
| R11, Gram action | Repaired | §10.1:1260 explicitly gives “a^t·T·ā”. For T=I₂ and upper-right entry b with b̄=−b, the off-diagonals are −b,b and the final diagonal is 1−b². |
| R12, Green top degree | Repaired | §13.6:1645 imposes “m = n” for the scalar degree and proper intersections for the displayed star product. For n=3, m=1 has bidegree (0,0), while m=3 has (2,2). The containment restriction is explicit. |
| R13, nonexistent supplier IDs | Repaired | Contracts:46,58,72 and the Needs lines now use numerical sections, including “§§1.4, 1.7, 1.8” for supported K-theory and “§6.1” for the canonical lift. The numbered headings were reopened at the heads/packages. The different domain mismatch in new R06 was not fixed by renumbering. |
| R14, duplicate Fourier criterion | Repaired | Contract:104 imports “§4.4 `fourierUnitVanishing`”; §14.3:1770 applies it instead of owning it. The earlier owner is AutomorphicFormsOnReductiveGroups, pull request #1037, `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:692`. Its empty-exceptional-set test gives constant 1, and positive weight forces constant 0. |
| R15, primary locators/metadata | Repaired | §2.3:386 cites “Corollary 5.3.3” and the two later corollaries; §9.7:1223 specifies “Mih16 Corollary 9.9” with artinian and maximal-order hypotheses; §13.7:1665 specifies Liu11a Proposition 4.5/Theorem 4.17 and GS19 “(1.1.19)”. The manifest supplies authors, title, year and version information. These texts were reopened at those locators. |

The repaired patterns were checked elsewhere: negative valuations, duality/valuation units, actual cohomological Euler lengths, basis changes, weighted cycles, Green degree, supplier numbering and duplicated Fourier vanishing. Findings below include failures in previously untested passages and in the revised global-cycle definition.

## Verified sound

The following evidence is limited to the aspects stated; it does not waive R01–R07.

**Coverage and principles.** Read all 102 numbered targets and their 102 Needs lines in 15 layers, including every changed passage, all API/Check blocks, conventions and contracts. There are 38 paragraphs beginning Define/Construct; each has an API and at least three Check bullets. Every layer has Examples and Dependencies. Numerical tests below cover the seeded sample, eight headlines, repaired patterns and all findings. Unchanged computed rows from round 2 were retained only after checking that their statements and inputs remained unchanged; uncomputed descriptions were not treated as evidence.

The scope extends the base roadmap rather than replacing it: the base §7.2 supplies quadratic lifting lengths; this Part II owns their higher-dimensional local and global arithmetic intersections. No computational algorithm, copied source passage, source-chapter layer heading, route-specific prime shortcut, sorry'd data or set_option was found. The explicit Krämer hyperbolic exception and the q=n scalar-avoidance case remain mathematical targets. The source's imperfect proof is not being used to exclude those cases. The layer order is explained by geometric, density, global-cycle and trace-comparison dependencies rather than by source chapter order. House-style comparison used the main-branch roadmaps QuadraticCharactersAndReduction and NoncongruenceModularForms. Metadata records math.NT. No own backticked declaration absent from Suggested.lean was found; the backticked constructors are supplier declarations.

**Acceptance file, pins and padding.** Ran the prescribed `lake env lean` on `packages/GrossZagierAndArithmeticHeightsPartII/Suggested.lean` from the pinned content checkout: exit 0, no output, no warnings. It has one import Mathlib, one module docstring and an empty namespace. There are zero declarations, zero sorried theorems, zero data definitions and zero admitted examples. Thus the exhaustive one-tactic probe and elaborated-signature comparison each have zero inputs; there is no theorem to replace by a tactic and no declaration to inspect with #check. No stand-in or padding was found.

| README headline | Named in module docstring | Required carrier absent at the pins |
|---|---|---|
| §3.5 unramified KR | Yes | RZ cycles, supported derived Euler intersection, hermitian densities |
| §4.5 almost self-dual KR | Yes | Almost self-dual RZ cycles and corrected densities |
| §6.8 exotic KR | Yes | Exotic RZ cycles and ramified densities |
| §8.7 Krämer KR | Yes | Krämer cycles, exceptional corrections and ramified densities |
| §13.8 unramified arithmetic Siegel–Weil | Yes | Integral unitary models, arithmetic degrees and unitary Eisenstein derivatives |
| §13.10 modified arithmetic Siegel–Weil | Yes | The same objects with ramified local corrections |
| §12.7 CM intersection modularity | Yes | Derived CM cycles and their arithmetic Chow pairing |
| §14.5 strongly regular AFL | Yes | RZ graph intersections and Jacquet–Rallis orbital distributions |

Polynomial expressions alone cannot replace those objects. No statable headline absent from the file was found. Opened at the pin: `Mathlib/Algebra/Polynomial/Basic.lean:69` (Polynomial), `Mathlib/Algebra/Polynomial/Eval/Defs.lean:248` (eval), `Mathlib/Algebra/Polynomial/Derivative.lean:47` (derivative), and `Mathlib/NumberTheory/LocalField/Basic.lean:46` (IsNonarchimedeanLocalField). The local-field class supplies valued/topological local-field hypotheses, not a hermitian form or density. Object searches also opened `TauCeti/AlgebraicGeometry/FormalScheme/Spf/Carrier.lean:73` and `TauCeti/AlgebraicGeometry/FormalScheme/Spf/StructureSheaf.lean:262` and line 378: the affine Spf carrier, structure sheaf and global sections exist. They do not provide the general formal-scheme/RZ moduli carriers needed by these headlines; the docstring's absence statement was assessed at that required generality.

**Seeded sources.** All fifteen requested targets were compared with the cached legal text, including hypotheses and locator numbering. The manifest contains the fourteen readable works and the settled uncertified Lusztig76 entry; no additional source had to be fetched and no entry was rewritten. References use the recorded preprint or published pagination, not an assumed interchange of versions.

| Target | Locator and source text checked | Outcome |
|---|---|---|
| 0.3 unitary Deligne–Lusztig varieties | LZ §2.5, p.12, line 451–464; §5.3, p.25, line 1007 onward | Odd dimension 2d+1, projective stratum dimension d, rational-point boundary and squared Frobenius agree. Lusztig76 itself remains uncertified. |
| 0.8 self-dual cancellation | LZ §2.11, Lemma 2.11.1, p.15, line 582 onward | Self-dual rank r<n and integral orthogonal complement are retained; r=0 is permitted. |
| 0.9 rank-one normalization | LZ Example 2.4.3, p.12, line 448–450; §§3.2–3.5, pp.16–18 | Odd positive valuation and the separate nonintegral zero case now agree. |
| 1.1 horizontal/vertical classes | LZ Definition 2.9.1/Lemma 2.9.2, p.14, line 543–565; §§5.1–5.2, pp.23–24, line 961 onward | Flat closure and supported class are distinguished. The source's horizontal/vertical misprint is not propagated. |
| 3.4 analytic regularity/restricted vanishing | LZ Proposition 7.3.4, pp.45–48, line 1900 onward; Corollary 7.3.7/Theorem 7.4.1, p.51, line 2140–2168 | Schwartz extension concerns the vertical function. Fourier vanishing keeps orthogonality to L♭ and negative valuation. |
| 6.1 exotic density | LL2 Definition 2.16/Remark 2.18/Lemma 2.19, pp.14–15, line 640–681 | X=q^(−s), trace duality and derivative normalization agree; unequal-rank sign vanishing is no longer asserted. |
| 6.8 exotic identity | LL2 Theorem 2.7, p.11, line 484; §2.7, pp.34–37, ending at line 1895 | Even rank, nonsplit space, total over both components and residual-plane induction are retained. |
| 8.4 Krämer partial integral | K Theorem 8.2, p.64, line 3445–3451; proof pp.64–72 | The roadmap correctly keeps the integral-cone constancy and rejects the source's negative-cone vanishing with its explicit counterexample. |
| 9.6 local constancy/support | Z Proposition 5.2, pp.24–25, line 1363–1419; Theorem 5.5, pp.26–27, line 1462–1507 | Fixed-g and joint statements are distinguished; cyclicity does not require an étale algebra. The rank-m avoidance count q+1>m is retained. |
| 12.2 complex uniformization/CM line | Z Proposition 8.2, p.40, line 2255–2259; Theorem 10.1, pp.46–47, line 2579–2595 | Negative-line convention and cyclic-vector exclusion agree; irreducible CM data are required. |
| 12.3 Kudla Green function | MZ §3.6, (3.15), pp.13–14, line 711–726; dd^c at line 505–507 | Corrected 4π hermitian argument agrees with the orthogonal −2R convention and specified zero label. |
| 13.1 unitary Eisenstein specialization | LZ §§12.1–12.2, pp.77–79, line 3363–3444 | Normalized induction and unnormalized exponent s+n/2 agree; splitting character and measures remain explicit. |
| 13.3 admissible global data | K §10.2, (G0)–(G5), (H1)–(H4), pp.77–79, line 4050–4130 | Lattice types, dyadic distinction, unramified-base constraints and local reflex conditions are preserved. |
| 13.7 archimedean coefficient | LZ Theorem 15.3.1, p.88, line 3815–3826; Liu11a Proposition 4.5, p.889, line 1868–1882, Theorem 4.17, p.905, line 2716; GS19 Theorems 1.1.1–1.1.2/(1.1.19), pp.4–5, line 149–206 | Signature and top-degree conditions, half-sum, compactness in the alternative route and exact-current comparison are present. |
| 14.1 relative trace/Gaussians | Z Theorem 12.14, p.61, line 3487–3505; MZ Proposition 7.4, p.35, line 1930–1936 | Fixed irreducible polynomial, entire family, nilpotent term and corrected half-Whittaker/Ei factor agree. The JR input remains a declared contract. |

No readable author-flagged unverified locator remains outside that comparison and the repaired primary references: Mih16 Corollary 9.9, pp.39–40, line 1785–1798, was also read with its artinian and factorwise assumptions; Ter13a/Ter13b and Howard19 remain the correctly identified local-cycle inputs.

**Computed adversarial table.** These are finite falsification and convention tests, not proofs of the headline theorems. In particular, §8.6 remains an explicit general proof target; this review does not represent it as a result already proved in K. “Retain” means no change to that tested assertion. q=1, characteristic 2 in the odd-residue local theories, inseparable quadratic fields, the zero ring as a local field, and n=0 where n≥1 is standing are excluded inputs, not covert zero values. The m=0 incidence case was not excluded and is R04.

| Statement | Instance tried | Computed values on each side / wrong model | Result; change |
|---|---|---|---|
| 0.1 Hom convention | h(e,e)=1, a with ā=−a | h(ae,e)=a; H(ae,e)=−a; both norms h(ae,ae)=H(ae,ae)=−a² | Conjugation adapter retained |
| 0.2 cycle functor | x=0; ax with a a unit | lifting obstruction 0 gives whole N; O_F ax=O_F x | Zero label not Cartier; retain |
| 0.3 sampled stratum | d=0; d=1,q=3 | dimensions 0,1; first point count 1; Fermat degree 4, genus 3, point count 28 | Retain |
| 0.5 Tor | repeated Cartier D | Tor₀=O_D and Tor₁=O_D(−D)≠0 | Independence condition retained |
| 0.6 repaired Euler | C=ℙ¹, O(D) on C=O(−1) | χ(O_C)=1, χ(O_C(1))=2; 1−2=−1=deg O(D) | Retain; stalk-length substitute rejected |
| 0.7 horizontal Check | n=2, norm 1 versus ϖ⁻² | first cycle N₁ has nonempty generic fibre; second cycle ∅ has horizontal part ∅ | R03 |
| 0.8 sampled cancellation | unit self-dual summand plus rank-one norm ϖ³ | Int₂=Int₁=2; r=0 removes zero summands and leaves value 2 | Retain |
| 0.9 sampled polynomial | a=1,3,−1,−3 | −D′(1)=1,2,0,0; positive formula gives 1,2 while its illicit negative extension would give 0,−1 | Repaired range retained |
| 1.1 sampled flat closure | A=R[t]/(ϖt,t²) | torsion ideal=(t); A/(t)=R flat; (t)∩ϖA=0; (t) killed by ϖ | Horizontal/vertical definitions distinguish the square-zero model |
| 1.1 derived pairing | C=ℙ¹ and degree −1 divisor line | χ(O_C)−χ(O_C(1))=−1=degree; ignoring Tor gives 1 | Retain |
| 1.3 repaired primitive component | q=3, valuation 2 | closed primitive degree 3²+3=12; total 12+1=13; open removal gives 0 | Retain closed construction |
| 2.1 cohomology | d=1,q=3 | eigenvalues 1,−3 in H¹_c, 9 in H²_c; H⁰_c=0; closed curve count 1+9+3·6=28 | Retain |
| 2.1–2.2 support supplier | 𝔸¹⊂ℙ¹ over 𝔽₃ | compact cohomology dimensions (0,0,1); degree-two Frobenius 3 | R06: use scheme localization |
| 2.3 numerical reduction | zero class; one type-three curve at q=3 | pairings 0; 1−q²=−8; coefficients 0,1 recover these values | Numerical quotient retained |
| 2.6 repaired Chern sign | H on ℙ² | correct 1−exp(−H)=H−H²/2; other sign −H−H²/2 | Retain |
| 2.7 repaired Fourier sign | q=3 and negative of curve function | (-8,8) versus (8,-8); eigenvalue −1 in both | Geometry, not eigenvalue, fixes sign |
| 3.1 Whittaker input | n=1,a=1,q=3 | v(det L)=1 versus v(det Λ)=0; corrected derivative (4/3)log9=(8/3)log3 | R01 |
| 3.4 sampled regularity | n=2, unit-norm L♭ | vertical function 0, Fourier transform 0 at negative normal x | Retain; no total-function Schwartz claim |
| 3.4 indicator normalization | lattice of valuation 1,q=3 | vol=1/3; transform at dual point=1/3, outside dual=0 | Retain self-dual measure |
| 3.5 headline | n=1,a=3 | Int=2; −D′(1)=−(−1+2−3)=2 | Retain |
| 4.2 comparison model | n=2,q=3 | balloon stratum dimension 1; covering multiplicity q+1=4 | Retain |
| 4.5 headline | rank-one a=2,q=3 | (q+1)Int_Y=4·1=4; derivative minus density=5−1=4 | Correction retained |
| 4.6 parameter conversion | q=3 | log(q²)=2log3; replacing it by log3 halves value | Retain |
| 5.1 nonempty components | h(e,e)=1; x=u⁻¹e | norm −u⁻² has valuation −1; N(x) meets 0 components versus asserted 2 | R03 |
| 5.3 repaired excess labels | repeat one Cartier label on finite support | lengths ℓ and ℓ; Euler value ℓ−ℓ=0 | Retain |
| 5.4 line degree | t=4,q=3 | deg modular line=2; 1−χ(O(2))=1−3=−2=1−q | Retain |
| 5.6 repaired reflection | orthogonal e₁,e₂ versus e₁,e₁+e₂ | cross-pairings 0→0 versus 1→−1; good reflection det=−1 | Normal-basis hypothesis retained |
| 6.1 sampled density | minimal exotic plane,q=3 | D=1−X², −D′(1)=2; Den(H₁,L)=0, Den(H₂,L)=640/729 | Retain equal-rank sign clause |
| 6.1 derivative weight | type 4,q=3 | 2(1−q²)=−16 | Sign distinguished from +16 |
| 6.4 repaired volume | invariants (1,1)/(3,3),q=3 | type=2/2; valuation=2/6; volumes=1/3,1/27 | Retain sum-of-invariants exponent |
| 6.5 curve Fourier | q=3, x∈Λ | f=−12+10=−2; f̂=−12/9+10/3=2 | Eigenvalue −1 retained |
| 6.7 exceptional pair | a=3,β=1 | elementary exponents (2,2); h(e,e)=u² has v_F=2, v_F₀=1 | Repaired units retained |
| 6.8 sampled headline | n=2,q=3, invariants (1,1),(1,3),(3,3) | intersections 2,4,12; density sums 2·1,2·2,2·(2+4)=2,4,12 | Both components included |
| 6.9 repaired scaling | c=u²/ϖ unit versus u⁻² | norm-valuation shifts 0 versus −1 in F₀ units | Distinct scalings retained |
| 7.2 incidence | m=0,1,2 | m=0 requires rank −1; m=1 gives ℙ¹ of dimension 1; m=2 rational fibre ℙ¹ | R04 |
| 7.8 trace dual | norm-unit line | sharp lattice O_F versus trace annihilator π⁻¹O_F; norm valuation at π⁻¹ is −1 | Retain lower support bound −1 |
| 8.2 primitive signs | q=3,t=2,χ=±1; t=3 | 1−χq=−2,4; 1−q²=−8 | Distinct signs retained |
| 8.4 sampled partial integral | stated rank-three example,q=3 | determinant −1; β classes 2q=6; partial integral 6vol(L♭), not 0 | Roadmap correction retained |
| 8.4 orthogonal-sum sign | q=5,n₁=1 | χ(−1)=1 versus (-1)^1=−1 | Retain corrected source factor |
| 8.6 hyperbolic exception | H₁, L♭=⟨l₁+πl₂⟩ | norm −2π²; projection 1/(2π); every line norm has π-valuation ≥2, not <2 | Separate proof target needed and present |
| 8.7 headline | unimodular I₂,I₃; nonintegral L | Int/modified density=0/0,1/1,0/0 | Parity correction retained |
| 9.4 Cayley/scale | x=0,g=−1; conjugate √ε=−√ε | Cayley(0)=−1, inverse(−1)=0; norm ratio −ε has valuation 0 | Repaired norm Check retained |
| 9.5 small residue | q=m versus q≥m+1 in rank-(m+1) avoidance | q+1=m+1 can exhaust exclusions; next size m+2>m+1 | Boundary reduction retained |
| 9.6 sampled cyclicity | Gram ((0,1),(1,0)), x=((0,u),(0,0)), label e₂ | cyclic map δ↦(δ₁,uδ₂); determinant u≠0; noncyclic zero label gives determinant 0 | No étaleness hypothesis needed |
| 9.6 sampled rank-m avoidance | q=m | q+1=m+1>m | Correct rank is essential; retain |
| 10.1 repaired weights | 1_U,2·1_U | supports equal; coefficients 1 and 2 | Linear extension retained |
| 10.1 rational labels | unit norm inclusion x and x/3 | norms 1 and 1/9; actual Hom integral norm set excludes 1/9 | R02 |
| 10.1 repaired Gram action | I₂ and upper-right b, b̄=−b | direct Gram off-diagonals (−b,b); a^tTā same; old expression (b,−b) | Retain |
| 10.2 K-class component | two labels with Gram diagonal 1,1 | off-diagonal 0 and b produce distinct T-components despite identical diagonal entries | Component restriction retained |
| 10.4 residue normalization | q=3, residue degree f=2, length ℓ | ℓlog(3²)=2ℓlog3=fℓlog3 | Actual residue cardinality retained |
| 11.4 virtual one-cycle | regular sequence versus repeated divisor | regular Koszul higher Tor=0; repeated divisor Tor₀ and Tor₁ both survive | Derived class not naive fixed locus |
| 12.2 sampled CM-line control | signature (1,1), δ=diag(i,−i), u=(1,1) | cyclic determinant −2i≠0; negative-line projection norm −1; noncyclic e₁ has projection 0 | Cyclic exclusion retained |
| 12.3 sampled Green normalization | R=−1,a=1; zero label a=e | hermitian argument −4π=orthogonal −2π·2; G=−Ei(−4π)>0; zero-label value −1 | Retain corrected scaling |
| 12.4–12.5 missing interface | positive-index principal part; zero input | required divisor multiplicity 1 versus 0; supplier's output has no divisor map | R05; not a numerical identity supplied by GQT |
| 12.7 headline zero coefficient | φ(0)=0 or 1, CM Hodge degree d, denominator N | constant 0 or −d/N respectively | Sign and normalization retained |
| 13.1 sampled modulus | n=1,s=0,unramified q=3, det=ϖ | |ϖ|_F=1/9; half-modulus=(1/9)^(1/2)=1/3, not 1 | Retain normalized induction |
| 13.3 sampled admissibility | ramified quadratic place with base e=1 versus e=2 | unramified-base predicate true versus false; inert split self-dual quotient length 0 versus almost-self-dual length 1 | Local types kept distinct |
| 13.6 repaired top degree | n=3,m=1 or 3 | current bidegrees (0,0) versus (2,2); only latter integrates without extra class | Retain m=n |
| 13.7 sampled coefficient | two conjugate embeddings with equal integral I | half-sum I/2+I/2=I; dropping half gives 2I; negative index q=2 implies derivative 0 | Retain signature/order restriction |
| 13.8 headline | three obstructing places | local product s³A(s) has derivative 0 at 0; first-derivative contributions all 0 | Retain singleton-Diff localization |
| 13.10 headline correction | self-dual; minimal almost-self-dual q=3 | correction 0; c₀=−1/(q+1)=−1/4 | Corrections not interchangeable |
| 14.1 sampled Gaussian | ξ=−1,a=1, normalized by W | derivative/W=Ei(−4π)/2; Green=−Ei(−4π); twice derivative/W+Green=0 | Retain corrected common argument |
| 14.3 imported vanishing | empty bad set; constant function 1 | all nonzero Fourier coefficients 0; constant 1 allowed in weight 0, forced 0 in nonzero weight | Supplier import retained |
| 14.5 headline/base Check | semi-Lie dimension 1, valuations 1,3 | normalized derivatives −1,−2; intersections 1,2; n−1=1 requires n=2 | Headline signs pass; R07 indexing |

**Ownership, citations and order.** Used the roadmap service's head searches by object (Rapoport–Zink/special cycles, hermitian densities, supported formal K-theory, Green/Borcherds, arithmetic Chow and Fourier vanishing), read the board package index before resolving local packages, and compared the closest open scopes. The overlap report lists no conflicting head, dropped cited ID or open-revision-only ID. ComplexMultiplicationAndExplicitReciprocityPartII #1695 owns GSpin/CM-height constructions, not these unitary intersections; IgusaVarietiesAndTorsionConcentration #1090 owns Igusa towers and period-fibre/cohomology comparisons, not KR cycle arithmetic; GrossZagierAndArithmeticHeights #1487 supplies the base lifting lengths. MetaplecticAutomorphicForms #1063 and EndoscopicTransferAndUnitaryTraceComparison #999 supply the named analytic and transfer objects, subject to R05 and the declared JR gap. No duplicate fully qualified declaration is possible in this empty Suggested.lean.

The following resolutions were opened this round. Lines for service-fetched files are the README's own lines, omitting the service's one-line provenance header. Main was used for roadmaps already present there; package copies resolved the three names absent from the indexed show command.

| Supplier | Resolved sections and evidence |
|---|---|
| PELModuliPartII | `packages/PELModuliPartII/README.md:458` onward: §§0.7,1.1–1.6,2.1–2.5,3.3–3.7,4.6,5.1–5.3,5.5,5.7–5.8,6.1,6.5–6.8,7.3–7.5,7.10,8.5,9.3,9.5–9.9. Component §3.7 at 818; relative form §4.6 at 941; global levels at 1258 and uniformizations at 1763 onward. These supply spaces/forms/levels, not this package's special cycles. |
| LubinTateFormalModulesAndQuasiCanonicalLifts | `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:1299`,1328,1378,1402,1468: §§6.1,6.2,6.4,6.5,7.1; canonical/marked quasi-canonical lifts, orders, levels and degrees. |
| EndoscopicTransferAndUnitaryTraceComparisonPartII | `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/README.md:678`,692: §§4.4–4.5, group and augmented Lie formulations. Their passage to Zhang's spaces is explicitly a gap. |
| GrossZagierAndArithmeticHeights #1487 | `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md:2944`, §7.2: integral endomorphism filtration and quadratic quasi-canonical lifting lengths, including ramified fields. |
| AbelianSchemesAndArithmeticModuli | `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:2125`,2143: A4.7 and A4.CR.7.2, filtered-crystal deformation/lifting criteria. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:988`,1858,3389,3698: R07.1.8,1.22,2.10,2.20, with mixed-characteristic/perfect-residue hypotheses. |
| GeometryOfNumbersAndQuadraticArithmetic #851 | `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:703`,769,879: §§2.7,2.9,3.2. The constructors flagged by the resolver are there; conjugate-first pairing is explicitly adapted in §0.1. Density scope remains unramified. |
| SchemeKTheoryOperationsPartII #1741 | `TauCetiRoadmap/SchemeKTheoryOperationsPartII/README.md:406` onward: support/Tor §§0.5–0.7,1.4,1.7–1.8, regular comparison/filtration/exhaustion §§2.1–2.5, union and Tor §§3.1–3.4, Euler/projection §§4.1–4.7. §2.4 at 526 is affine; the nonaffine extension is correctly a gap. |
| SchemeKTheoryOperations | `TauCetiRoadmap/SchemeKTheoryOperations/README.md:2811`,3047: §§6.12,7.7, rational supported products and cycle classes for schemes with their stated regularity/dimension hypotheses. |
| SchemeAndStackFoundations, main | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:6902`,7045,7065,7318: §§5.1,5.3,5.4,5.7, Chow/Chern/K-theory inputs. |
| MotivesAndAlgebraicCycles | `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:387`,435: §§2.4,2.7, cycle classes, geometric étale realization, twists, traces and Frobenius. No general Tate conjecture is supplied or assumed. |
| ClassicalAdicEtaleCohomology #875 | Layer 8 exists at `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:3983`; its analytic domain causes R06. Main's EtaleCohomologyFoundations §§0.7–0.8 is the earlier algebraic owner. |
| AutomorphicLFunctionsAndLocalFactors | AL.0 explicitly redirects its Fourier foundation to AnalyticNumberTheoryPartII §5.3g–h with a former-numbering mapping. This preserves the citation; it is not a dropped-ID defect. |
| MetaplecticAutomorphicForms #1063 | `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:402`,520,550,618,638,646,1218,1292,1398,1553,1589,1621: §§2.1,2.5,2.7,3.3,3.3a–b,4.5,5.1,5.8,6.2,6.4,6.7. The uncertainty and normalization targets exist; §5.8's different regularization is R05. |
| AutomorphicSpectralTheory | `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:886`,909,1560: §§1.1,1.2,2.4, induction, convergence and continuation, not a Siegel–Weil identity. |
| AutomorphicFormsOnReductiveGroups #1037 | `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:686` onward, §4.4: conductor-adjusted Fourier vanishing including continuous functions and nonzero weight. |
| ArakelovGeometryAndAbelianHeights #1000 | `TauCetiRoadmap/ArakelovGeometryAndAbelianHeights/README.md:393`,430,457: §§1.8–1.10, divisor Green relation, metrized line and one-cycle pairing. All-codimension arithmetic products remain a justified gap. |
| PELModuli | `TauCetiRoadmap/PELModuli/README.md:1309`,1638,2069,2924,3116,3766: M0.22,M1.3,M1.13,M3.4,M3.8,M6.1, hermitian/abelian data, complex uniformization and levels. |
| EndoscopicTransferAndUnitaryTraceComparison #999 | `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:688`,764,998: §§2.1,2.4,2.13. Ordinary orbital/Fourier results do not silently replace the separate JR contract. |

All four existing gap slugs agree between the README and plan, name earlier suppliers, and specify the missing extension with its hypotheses: ramified-hermitian-densities; nonaffine-formal-filtration-product; arithmetic-chow-star-products; jr-afl-local-inputs. Each is necessary beyond the supplier's displayed scope. In particular affine filtration multiplicativity is not already the nonaffine theorem, divisor arithmetic Chow is not all codimensions, and the two spherical JR formulations are not Zhang's formulations with factors and Fourier compatibility. These declared contracts are not findings. R05 identifies a different undeclared input.

Ran the prescribed dependency check against the supplied order and content checkout. Complete output:

```text
depcheck: 236 roadmaps, 2152 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. No merge-order file or tooling was edited. The graph pass checks names/direction; R05–R06 concern what the sections actually provide.

## Not verifiable

- Lusztig76, §7.3 case ²A_(2n), with §§6.1 and 1.18: the manifest settles this work as uncertified. Its text was not requested again. LZ's stated specialization and the computed small-dimensional controls were checked; they do not certify the inaccessible original proof.
No other cited text needed for this review was inaccessible.

## Source issues

- **Misprint** in LZ at Definition 2.9.1, printed p.14: the source calls the torsion-free horizontal quotient maximal vertical; it should be maximal horizontal; affects nothing. See LZ line 547.
- **Error** in LZ at §6.4 after Definition 6.4.1, printed p.38: the source reverses the two terms of the Cartier complex's Chern character; it should be 1−exp(−c₁(O(D))); affects the proof. See LZ line 1612.
- **Misprint** in LL2 at Proposition 2.44 proof, equation (2.17), printed p.28: the source uses b₂−l although the component index is j; it should be b₂−j; affects nothing. See LL2 line 1443.
- **Misprint** in LL2 at Lemma 2.56 proof, printed p.34: the source sends every earlier normal-basis vector to 1; it should fix each such vector; affects nothing. See LL2 line 1718.
- **Error** in K at Theorem 8.2, printed p.64: the source asserts zero partial integral on the negative cone; it should retain integral-cone constancy without that vanishing; affects a stated result. See K line 3451 and the computed 2q-volume counterexample above.
- **Error** in K at Lemma 9.6, printed p.74: the source asserts a strict smaller hyperplane valuation for every nonintegral orthogonal projection; it should exclude or separately handle hyperbolic-block obstructions; affects a stated result. See K line 3934–3936 and the H₁ calculation above.
- **Error** in K at equation (8.6), printed p.67: the source uses (−1)^n₁ for the orthogonal-sum sign; it should use χ(−1)^n₁; affects the proof. At q=5,n₁=1 the factors are −1 and 1.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "d3225b4c09c163056806d4773d74cf9d29201a61", "job": "REV-PKG-GrossZagierAndArithmeticHeightsPartII~3", "model": "gpt-6-astra", "worker": "chris-8"} -->
