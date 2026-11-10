# Review of GrossZagierAndArithmeticHeightsPartII (package, round 2)

**Verdict:** needs changes

Fifteen findings, ten blocking. The empty acceptance file elaborates, but the README contains false definitions and formulas, insufficiently qualified constructions, stale supplier identifiers, and a duplicated theorem. The package is repairable within its intended scope. All locations below refer to the reviewed versions; source references are to the supplied line-numbered extractions. No mathematical package file was edited. The sources service added three previously absent primary references; its returned metadata also needs the corrections in R15.

## Previous findings, checked first

| Earlier finding | Status | Repaired passage and verification |
|---|---|---|
| F01, exceptional invariant | Partly repaired | §6.7 now says “a ≥ 3” and “a = 3 does occur”; §6.8 uses the residual plane. For the displayed example, the two blocks have elementary divisors (2,2), hence full invariants (1,1,2,2). The bound is repaired; the new assertion about norm valuation uses the wrong valuation unit: R07. |
| F02, repeated Jacquet–Rallis request | Repaired | The contract now requests “the passage from the GL_n(F₀)-group formulation” and the augmented formulation to Zhang's versions. The new supplier subsection consumes EndoscopicTransferAndUnitaryTraceComparisonPartII §§4.4–4.5. Those are present in its package at lines 678 and 692. They do not themselves state Zhang's two formulations. |
| F03, pins | Repaired | README:42 now identifies “the content repository's `lake-manifest.json`”. Actual Mathlib pin: 1b1ccf4b088b32fa3f23f2de1127433254a81e1e; Tau Ceti pin: 2fd255d997f47c0b5d834ee416c7015d55444ce5. |
| F04, five locators | Repaired | §7.6 now cites “Definitions 4.5 and 4.7, Remark 4.6 and Lemmas 4.8–4.9”; §7.2 cites “Lemma 3.1, Proposition 3.2 and Remark 3.3”; §10.4 uses “pp. 85–86”; §6.8 uses “§2.7, pp. 34–37”; §4.6 says “lattice-indicator sections”. Verified respectively at K lines 1173–1195, 671–697; LZ line 3718; LL2 lines 1751–1895; LL1 lines 1845 and 2066. Another locator slip remains in §2.3: R15. |
| F05, Terstiege inputs | Repaired | §0.5 names “Ter13b Theorem 1, p. 2; Ter13a Lemma 3.1, pp. 21–22” and distinguishes the original ℚ_p setting from the general target. The entries and references exist; Ter13a line 1345 and Ter13b line 62 contain the cited results. The repeated pattern of unnamed primary inputs occurs in §§9.7, 13.7: R15. |
| F06, balloon locus | Repaired | §4.2 defines it as “the union of the type-zero strata V(Λ) ≅ ℙ^(n−1)”. LRZ line 2482, Definition 14.2.2, printed p. 57, gives that reduced closed locus. For n=2 its strata are projective lines. |

The repair report marks none of F01–F06 “not actionable in this package”. R07 is a defect in the replacement text, not a request to restore the false bound a>3. The repaired patterns were searched throughout the package.

## R01 (P1) — An open complement is not a primitive horizontal cycle

**Location.** `packages/GrossZagierAndArithmeticHeightsPartII/README.md:314`, §1.3: “Z(M) minus the lifting loci of the integral overlattices properly containing M”; repeated in its API.

**Claim.** Removing these closed lifting loci constructs the finite flat quasi-canonical component whose degree is subsequently computed.

**Witness.** In rank two with norm valuation 2, Z(y)=Z₂+Z₀. Both formal components have the same special point. Removing Z₀ leaves the empty formal scheme; the intended Z₂ has degree q²+q (12 at q=3).

LZ lines 768–805, §§4.1–4.2, pp. 19–20, define a closed quasi-canonical component, not that open complement. This directly contradicts the third Check, whose total degree is 13 at q=3.

**Exact repair.** Split off a self-dual rank n−2 summand and define Z(M)° as the closed level-s quasi-canonical lifting component in the resulting rank-two space, proving independence of that splitting as in LZ lines 796–805. Alternatively specify the flat closure of the primitive generic-fibre component. Replace the removal API. On the witness the retained component has degree 12, and adding the level-zero component gives 13; the open complement has degree 0 and is the negative control.

## R02 (P1) — The Euler characteristic omits sheaf cohomology

**Location.** `packages/GrossZagierAndArithmeticHeightsPartII/README.md:214`, §0.6: “the alternating sum of the lengths of the Tor sheaves”; repeated at line 220 and suggested by Conventions:30.

**Claim.** Proper vertical support makes the Tor sheaves finite-length modules over the base DVR.

**Witness.** On a vertical C=ℙ¹, with O(D)|C=O(−1), the two Tor sheaves are O_C and O_C(1). Their stalks have infinite DVR-length; their cohomology has lengths 1 and 2, giving −1.

This is precisely the kind of positive-dimensional support used later. LZ lines 358–362 define the double alternating sum of lengths of cohomology of the homology sheaves.

**Exact repair.** Define χ as the Euler characteristic of derived global sections, equivalently Σᵢⱼ(−1)^(i+j) length Hⁱ(X,Hʲ(C)). State boundedness and finite lengths there, obtained from proper vertical support. Restrict the shortcut using lengths of sheaves to zero-dimensional support. The witness then gives 1−2=−1, agreeing with deg O(D)|C.

## R03 (P1) — The rank-one derivative formula is false at negative valuation

**Location.** `packages/GrossZagierAndArithmeticHeightsPartII/README.md:259`, §0.9: “so that −D′(1) = (a+1)/2”; §3.2, line 494, repeats the unrestricted odd-a formula.

**Claim.** The displayed derivative formula holds for the odd valuations admitted in the paragraph, including its explicitly discussed nonintegral case.

**Witness.** Take a=−3 in the nonsplit unramified line. The representation polynomial and intersection are both 0, whereas (a+1)/2=−1. The existing a=−1 Check conceals the problem because its right side happens to be 0.

**Exact repair.** State D(X)=Σᵢ₌₀ᵃ(−X)ⁱ and −D′(1)=(a+1)/2 only for a≥1. For a<0 state D=0 and Int=−D′(1)=0. Propagate this to §3.2 and qualify the odd-a Check in §0.8 by its integrality hypothesis. Add a=−3 as negative control. This preserves the general full-rank identities, including nonintegral lattices.

## R04 (P2) — Density-sign vanishing needs equal rank

**Location.** `packages/GrossZagierAndArithmeticHeightsPartII/README.md:68`, and `packages/GrossZagierAndArithmeticHeightsPartII/design/plan.json`, gap `ramified-hermitian-densities`: “its vanishing when χ(M) ≠ χ(L)”.

**Claim.** Different signs force the local representation density to vanish without a dimension condition.

**Witness.** Let L be the minimal nonsplit exotic plane, with D_L(X)=1−X², and M=H₂ the split rank-four lattice. At q=3, Den(H₂,L)=(1−3⁻⁴)(1−3⁻²)=640/729, despite opposite signs.

LL2 lines 640–650 make the zero statement for the equal-rank H_r; the interpolation uses H_(r+s), of larger rank. The two cannot be conflated.

**Exact repair.** Qualify sign vanishing by equality of ranks (and nondegenerate spaces); in general formulate vanishing as nonexistence of a rational isometric embedding. Update the same gap sentence in the README and plan. The corrected statement gives 0 for H₁ versus L and permits 640/729 for H₂ versus L. The gap remains owned and otherwise necessary.

## R05 (P2) — The component-switching reflection requires a normal basis

**Location.** `packages/GrossZagierAndArithmeticHeightsPartII/README.md:720`, §5.6: “the reflection fixing x_i for i < n and sending x_n to −x_n”; its first Check calls this an isometry.

**Claim.** Negating the last vector while fixing the others is an isometry for the labels under discussion.

**Witness.** In a nonsplit ramified plane over residue field 𝔽₃ with Gram diag(1,1), take x₁=e₁, x₂=e₁+e₂. Then h(x₁,x₂)=1, but h(x₁,−x₂)=−1.

LL2 lines 1716–1719 first choose a normal basis with the last vector anisotropic. That hypothesis is absent here.

**Exact repair.** Use linear invariance to choose a normal basis with an anisotropic rank-one orthogonal block last; state h(x_i,x_n)=0 for i<n and h(x_n,x_n)≠0 before defining the reflection. For the orthogonal basis e₁,e₂, cross-pairings are 0 on both sides and determinant is −1; for the displayed nonorthogonal basis the proposed coordinate sign change is correctly rejected. Keep the component equality for arbitrary L, obtained by basis independence.

## R06 (P1) — Lattice type does not determine covolume

**Location.** `packages/GrossZagierAndArithmeticHeightsPartII/README.md:791`, §6.4: “vol(M) = [M^∨ : M]^(−1/2) = q^(−t(M)/2)”.

**Claim.** The formula holds for the integral lattices used in the extension expansion, not only vertex lattices.

**Witness.** If M has exotic invariants (1,1), then uM has invariants (3,3). Both have type 2. At q=3 their volumes are 1/3 and 1/27, whereas the asserted formula gives 1/3 for both.

**Exact repair.** Replace the final exponent by −length(M^∨/M)/2=−Σa_i/2. Specialize it to −t(M)/2 only for vertex lattices, whose invariants are 0 or 1. The dual-index formula now gives q⁻³ for (3,3), while the vertex values q⁻¹ and q⁻² used in §6.5 remain correct. Add this scaled lattice Check.

## R07 (P3) — Three norm-normalization Checks give impossible valuation changes

**Locations.** `packages/GrossZagierAndArithmeticHeightsPartII/README.md:823`, §6.7: “norm of valuation at least two”; line 852, §6.9: “the unit u²/ϖ … shift valuations by 2”; line 1187, §9.4: “changes the norm … by ε and can change its integrality”.

**Claim.** These statements obey the F₀ norm-valuation convention of line 15.

**Witness.** In §6.7's own example, h(e,e)=βu² has v_F₀=1. A unit has valuation 0. With conjugate √ε=−√ε, scaling by √ε multiplies a hermitian norm by −ε, again of valuation 0.

**Exact repair.** In §6.7 say “F-adic norm valuation at least 2, equivalently F₀-valuation at least 1”; retain the valid support inclusion. In §6.9 state the isometry of the relative and absolute scaled forms (LL2 lines 2180–2202); do not attribute the nonunit u⁻² scaling of §5.1 to a unit. In §9.4 give the exact −ε norm factor and use equality of norm values as the distinguishing test, not integrality. For norms u², a, and −εa the corrected valuations are respectively 1, v_F₀(a), and v_F₀(a).

## R08 (P3) — Chern-sign negative controls do not distinguish the claimed error

**Location.** `packages/GrossZagierAndArithmeticHeightsPartII/README.md:439`, §2.6: “changes the sign of every even-degree term”; line 451, §2.7: “the Fourier eigenvalue fails”.

**Claim.** Replacing exp(−c) by exp(c) flips the even-degree terms and breaks the Fourier eigenvalue.

**Witness.** On ℙ², exp(±H)=1±H+H²/2: the odd term flips. If f̂=−f, then (−f)̂=−(−f); multiplying a function by −1 preserves its Fourier eigenvalue.

**Exact repair.** Replace “even” by “odd”. Remove the claimed eigenvalue failure and test instead the Cartier exact sequence and the degree-one coefficient +H in ch(O_D)=H−H²/2. At q=3 the unramified curve values f=−8 and f̂=8 become 8 and −8 after negation, still with eigenvalue −1. The sign must be fixed by geometry, not this eigenvalue test.

## R09 (P3) — More than n labels can have a finite Euler characteristic

**Location.** `packages/GrossZagierAndArithmeticHeightsPartII/README.md:690`, §5.3: “n+1 labels are always dependent and have no Euler characteristic”.

**Claim.** Dependence or exceeding n prevents existence of the Euler characteristic.

**Witness.** Start with n labels of proper zero-dimensional intersection and repeat one label. The support stays proper and zero-dimensional. Tensoring with its Cartier complex gives equal-length terms, so the additional Euler characteristic exists and is 0.

**Exact repair.** Say only that the cited linear-invariance statement is asserted for at most n labels; do not infer nonexistence of an Euler characteristic outside that range. Replace the Check with the repeated-label example, keeping existence dependent on proper vertical support and boundedness. Length ℓ minus length ℓ is 0, not undefined.

## R10 (P2) — A Schwartz-weighted cycle is not determined by support

**Location.** `packages/GrossZagierAndArithmeticHeightsPartII/README.md:1241`, §10.1: “a Schwartz function φ … whose … Tate class lies in the support of φ”.

**Claim.** This moduli functor defines the global Z(T,φ) used in the later linear K-classes and generating series for arbitrary Schwartz φ.

**Witness.** For a nonempty characteristic-function cycle, φ=1_U and 2φ have identical support and hence identical stated functors. The weighted cycles have multiplicities 1 and 2. LL1 lines 1724–1746 distinguish characteristic functions and linear extension.

**Exact repair.** Define the moduli functor for suitable K-invariant characteristic functions with the required integral lattice data. Define arbitrary rational or complex Schwartz coefficients by a finite weighted linear combination of these cycles/classes, stating the coefficient ring and K-invariance. Do not claim the weighted combination itself represents that moduli problem. The witness must give Z(T,2φ)=2Z(T,φ), while the underlying support is unchanged.

## R11 (P3) — Gram congruence uses the opposite sesquilinearity convention

**Location.** `packages/GrossZagierAndArithmeticHeightsPartII/README.md:1253`, §10.1: “replaces T by … ā^t T a”, together with h linear in its first argument at line 17 and T_ij=h(x_i,x_j).

**Claim.** This is the Gram transformation for the ordinary right change of basis x′_i=Σ_j x_j a_ji.

**Witness.** Take T=I₂ and a=((1,u),(0,1)), with ū=−u≠0. Direct substitution gives ((1,−u),(u,1−u²)); the printed congruence gives ((1,u),(−u,1−u²)).

**Exact repair.** State the change-of-basis action explicitly and use a^t T ā for the adopted first-linear form. Alternatively conjugate the coordinate-action convention explicitly everywhere. For the ordinary right action, the two off-diagonal entries become −u and u as directly computed. Do not silently replace the special Hom pairing by its opposite.

## R12 (P2) — The Green integral lacks its top-degree condition

**Location.** `packages/GrossZagierAndArithmeticHeightsPartII/README.md:1638`, §13.6: “x = (x₁, …, x_m) … one half of the complex integral”; line 1650: “A divisor contained in another uses the current product”.

**Claim.** The scalar degree is defined for the stated arbitrary nonsingular tuple, and the displayed current product also covers containment of divisors.

**Witness.** On the complex (n−1)-fold with n=3,m=1, g has bidegree (0,0), not top degree (2,2). For D={z₁=0}, the term (−log|z₁|²)δ_D cannot be defined by restriction to D.

LZ lines 3779–3785 define star products; lines 3815 onward take n labels for the scalar degree. The containment Check also contradicts the package's own properly-intersecting API.

**Exact repair.** Retain the general Green-current construction with its bidegrees, but impose m=n for the unaugmented scalar integral and arithmetic degree. For smaller m, a degree would require a separately specified complementary class. Replace the containment Check by a proper-intersection example and say the displayed representative product is not asserted for D=D; any arithmetic self-product requires the moving/representative theory supplied by the contract. At n=3,m=3 the current has bidegree (2,2), so its integral is defined.

## R13 (P1) — Three suppliers are cited through identifiers absent from their available READMEs

**Location.** `packages/GrossZagierAndArithmeticHeightsPartII/README.md:46`, contracts at lines 58 and 72, and propagated `*Needs:*` lines: “U1”, “LT.6”, “FK.1”, followed by purported target slugs.

**Claim.** These identifiers resolve to sections/targets of the named supplier, without an undeclared mapping.

**Witness.** SchemeKTheoryOperationsPartII pull request #1741, `TauCetiRoadmap/SchemeKTheoryOperationsPartII/README.md:406`, has §1.7, “The supported cup product”, not FK.1 or `supported-cup-product`. No former-numbering map is present. The PEL and Lubin–Tate package READMEs likewise use decimal sections.

The objects generally exist, but citing missing identifiers as already supplied fails the exact-contract rule. The overlaps file's empty dropped-id list does not certify these citations.

**Exact repair.** Resolve the slugs to the actual section headings throughout Scope, Conventions, contracts, Needs and Dependencies. Concrete verified replacements:

- PELModuliPartII: unramified objects §§1.1–1.6 (`packages/PELModuliPartII/README.md:458` onward); exotic components §3.7 (818); relative/absolute comparison §4.6 (941); CM moduli §6.6 (1242); integral levels §6.7 (1258); Hecke §8.5 (1607); uniformizations §§9.5–9.9 (1763 onward). Use the individual numeric headings for the other imported PEL objects as well.
- LubinTateFormalModulesAndQuasiCanonicalLifts: canonical lift §6.1 (1299), marked quasi-canonical lifts §6.2 (1328), orders §6.4 (1378), level classification §6.5 (1402), degrees §7.1 (1468), in its package README.
- SchemeKTheoryOperationsPartII #1741: support/Tor §§0.6–0.7; supported K₀, cup and Tor §§1.4,1.7–1.8; filtrations and exhaustion §§2.2,2.5; union/Tor/Cartier §§3.1–3.4; Euler/projection §§4.2–4.7. Its §2.4, README:526, is affine multiplicativity. Keep the nonaffine gap and point its supplier section to §2.4.

Test the repaired citations by opening each numbered heading at the indexed head or the permitted board package. Do not create duplicate constructions to repair a locator. No modification to these suppliers is requested.

## R14 (P2) — The Fourier vanishing criterion already has an earlier owner

**Location.** `packages/GrossZagierAndArithmeticHeightsPartII/README.md:1761`, §14.3: “Prove that … if all Fourier coefficients … vanish … then φ is constant”.

**Claim.** This roadmap owns the general conductor-adjusted SL₂ Fourier vanishing theorem.

**Witness.** AutomorphicFormsOnReductiveGroups pull request #1037, `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:692`, §4.4, states `fourierUnitVanishing` with the same finite-place set, conductor-conjugated level, continuous function, identically vanishing coefficients, and constant/nonzero-weight conclusions.

The supplier also owns the root-group generation adapters in that proof. It is earlier in the permitted supply order. Z Lemma 13.6 supports the theorem but does not assign it a second owner.

**Exact repair.** Delete §14.3's theorem target, import AutomorphicFormsOnReductiveGroups §4.4 in Scope and Exact supplier contracts, and make §14.4 and Layer 14 consume it. Keep any useful application Check with the application. Preserve numbering or supply an old-to-new mapping if other targets are renumbered. At B=∅ a constant 1 has only zero Fourier coefficient; in nonzero weight the constant is 0. Both the old statement and the supplier give exactly these values, confirming duplication rather than a distinct variant.

## R15 (P3) — Primary locators and source metadata need completion

**Locations.** `packages/GrossZagierAndArithmeticHeightsPartII/README.md:383`, §2.3: “Lemmas 6.3.1–6.3.2”; line 1217, §9.7: “Mihatsch's maximal-order theorem”; line 1658, §13.7: “Liu; Garcia–Sankaran, as cited in LZ”; References and `sources.toml`.

**Claim.** Every named proof input is identified by a precise locator into the version recorded, with complete source metadata.

**Witness.** LZ line 1516 is Remark 6.3.2. The newly fetched GS19 v1 prints equation (1.1.19), line 206, not (1.19). The service added GS19 with only one author and Liu11a without authors, title or year.

**Exact repair.** Cite LZ Lemma 6.3.1 and Remark 6.3.2. Add explicit primary locators and References for Mih16 Corollary 9.9, pp. 39–40 (lines 1785–1798), and Liu11a Proposition 4.5/Theorem 4.17, printed pp. 889/905 (lines 1868/2716), with the signature conditions; identify the maximal-order specialization/reduction, rather than calling the whole corollary an unconditional theorem. Cite GS19 v1 (1.1.19), p. 5, or its Theorem 3.4.9 and the star-product comparison as appropriate to the chosen Green representative. Fix GS19 authors to Luis E. Garcia and Siddarth Sankaran and its versioned locator. Fill Liu11a with Yifeng Liu, “Arithmetic theta lifting and L-derivatives for unitary groups, I”, 2011, Algebra & Number Theory 5(7), 849–921, DOI 10.2140/ant.2011.5.849. These three keys were added by the sources service in this review; retain their recorded fetch provenance and do not create replacement keys. The original eleven entries were left unchanged.

## Verified sound

The following checks are evidence for the parts described, not an assertion that the fifteen defects are harmless.

**Principles and shape.** Read the 103 numbered targets in 15 layers, all Needs lines, conventions, API and Check blocks, and all four contracts. There are at least three Checks per target, API lists for the definitions, and Examples/Dependencies endings for each layer. The Check count alone missed R07–R09 and R11. No computational algorithm, copied source passage, source-chapter heading, or unsupported re-planning of the base roadmap was found. The base GrossZagierAndArithmeticHeights §7.2 supplies lifting lengths, while this Part II owns higher-dimensional local intersection identities. The layer order follows the stated geometric/analytic dependencies; sharing a source's order where those dependencies force it was not treated as a defect. The isolated hyperbolic and q=n proof cases remain targets rather than excluded primes. The main-branch introductions, scope and target layout of QuadraticCharactersAndReduction and NoncongruenceModularForms were consulted for the house-style comparison. `metadata.toml` has topic math.NT. No own backticked declaration lacking a Lean declaration was found; the two lattice constructors flagged by the resolver are supplier declarations.

**Acceptance file and headlines.** Ran the prescribed `lake env lean` on the package Suggested.lean from the pinned content checkout: exit 0, no output and no warnings. The file has one `import Mathlib`, one module docstring and an empty namespace. There are zero declarations, zero sorried theorems and zero sorry'd data. Consequently the exhaustive one-tactic probe and elaborated-signature comparison each have zero inputs; no nominal probe file was needed. There is no padding.

| Headline in README | In module docstring | Missing actual carrier, not a substitute |
|---|---|---|
| §3.5 unramified KR | Yes | RZ special cycles, derived Euler intersection, local densities |
| §4.5 almost self-dual KR | Yes | Almost self-dual RZ cycles and density correction |
| §6.8 exotic KR | Yes | Exotic RZ cycles and ramified densities |
| §8.7 Krämer KR | Yes | Krämer model, exceptional correction and ramified densities |
| §13.8 unramified arithmetic Siegel–Weil | Yes | Integral unitary model, arithmetic degrees, unitary Eisenstein derivatives |
| §13.10 modified arithmetic Siegel–Weil | Yes | Same carriers with local model corrections |
| §12.7 CM intersection modularity | Yes | Derived CM cycles, arithmetic Chow pairing and the resulting automorphic series |
| §14.6 strongly regular AFL | Yes | RZ graph intersections and Jacquet–Rallis orbital distributions |

Polynomial and local-field carriers alone do not make any of these eight statements statable. No missing statable headline was found. At the pin I opened `Mathlib/Algebra/Polynomial/Basic.lean:69` (`Polynomial`), `Mathlib/Algebra/Polynomial/Eval/Defs.lean:248` (`Polynomial.eval`), `Mathlib/Algebra/Polynomial/Derivative.lean:47` (`Polynomial.derivative`), and `Mathlib/NumberTheory/LocalField/Basic.lean:46` (`IsNonarchimedeanLocalField`). The last class imposes the valued/topological local-field conditions, not a hermitian form or density. Object searches also opened `TauCeti/AlgebraicGeometry/FormalScheme/Spf/Carrier.lean:73` and `TauCeti/AlgebraicGeometry/FormalScheme/Spf/StructureSheaf.lean:262,378`: affine Spf carrier, structure sheaf and global sections are present. They do not supply the general formal-scheme/RZ moduli carriers needed here. The docstring's absence statement was assessed at that necessary generality; no generic free-function encoding was requested.

**Seeded source sample.** All fifteen requested locators were opened in the cached legal texts. “Supported” here refers to the mathematical theorem at the source with the qualifications recorded; it does not certify a defective Check next to it.

| Target | Source text opened; locator and hypothesis comparison |
|---|---|
| 0.2 Unramified KR cycles | LZ lines 427–433, §2.4, p. 11: extension-of-Hom functor on the unramified signature-(1,n−1) space; O_F-span dependence. Zero label gives the whole space; Cartierness is separately restricted to nonzero labels. |
| 0.3 Unitary Deligne–Lusztig varieties | LZ lines 451–464, §2.5, p. 12; lines 1007 onward, Lemma 5.3.1, p. 25. Odd type 2d+1, dimension d, and squared-Frobenius convention were checked. The separately cited Lusztig source remains uncertified. |
| 2.3 Numerical reduction | LZ lines 1047–1068, Corollary 5.3.3, p. 26; §6.3, pp. 36–37. Supports numerical divisor pairings, not an effective canonical cycle. R15 corrects Remark 6.3.2. |
| 2.6 Cycle-class quotient | LZ lines 1525–1596, Definitions 6.4.1/6.4.3, pp. 37–38. Quotient is by cycle-class kernel, not by definition numerical equivalence. Cartier sign corrected in theorem; R08 concerns the Checks. |
| 5.4 Exotic Tate classes/line | LL2 lines 1168–1191, Lemma 2.32, pp. 23–24; lines 1339–1348, Lemma 2.42, p. 27. Per-component statements and degree q−1 agree. Type 2/4 cases and higher Coxeter calculation distinguished. |
| 6.9 Relative/absolute | LL2 lines 2180–2202, Corollaries 2.65–2.66, p. 43; F₀/ℚ_p unramified is essential and present. Form comparison is an isometry, contrary to the valuation Check in R07. |
| 7.8 Krämer Fourier bounds | K lines 1252–1308, Lemmas 4.12–4.13 and Theorem 4.14, pp. 31–32. Translation off the hyperplane and support down to norm valuation −1 were checked; trace and sharp duals must stay distinct. |
| 9.6 Local constancy/support | Z lines 1363–1419, Proposition 5.2, and lines 1462–1507, Theorem 5.5, pp. 24–27. Regular cyclic data, constancy and compact support use different parts of the proof; no unstated q>n restriction was imported. |
| 10.1 Global cycles | LL1 lines 1220–1267, Lemma 5.2/Definition 5.3/Lemma 5.4, pp. 26–27; lines 1724–1746, §8, pp. 37–38. Integral level and characteristic-function construction support the functor; arbitrary weights require R10. |
| 10.2 Integral K-classes | LL1 lines 1733–1746 and footnote at 1766, §8, pp. 37–38: r factors, component restriction, linear extension, and rational coefficients. Proper smooth hyperspecial model hypotheses are retained. |
| 11.4 Virtual CM one-cycle | Z lines 2047–2062, (7.15), pp. 36–37; lines 2385–2419, §9.1, p. 43. Dimension filtration, rational graded quotient and proper numerical one-cycle are distinct, as the README says. |
| 11.5 Formal Hecke/CM | Z lines 2078–2152, §7.5, pp. 37–38: fixed characteristic polynomial, matching nearby hermitian space, level and orbit weights. These restrictions are present. |
| 12.7 CM modularity | Z lines 2431–2439, Theorem 9.1, p. 44; lines 2644–2646, Corollary 10.4, p. 48. F₀=ℚ and the corrected Green comparison are retained; general totally real modularity is not claimed. |
| 13.6 Green star/degree | LZ lines 3762–3854, §§15.2–15.4, pp. 87–89. Star formula and half-sum normalization agree; top-degree and proper-intersection restrictions require R12. |
| 14.3 Fourier vanishing | Z lines 3645–3694, Lemma 13.6 and proof, pp. 64–65. Continuity, full infinity dependence and conductor-adjusted level agree. Ownership defect R14 is independent of source correctness. |

The formerly unread primary texts were fetched through the sources service and opened: Mih16 Corollary 9.9 (including its artinian and factorwise hypotheses); Liu11a Proposition 4.5 and Theorem 4.17; GS19 (1.1.19) and its comparison with star products. None remains a missing-source request. The initial search that selected Liu's Part II landing page was superseded by the legally fetched Part I publisher PDF under the same key. Lusztig76 was neither requested again nor renamed.

**Computed adversarial table.** Every requested sample, every headline, and every finding involving mathematics is represented below. Prior-round rows were reused only where they had actual values; source-only prose assertions were rechecked. These are finite falsification tests, not proofs of the end theorems. All local q-values below satisfy odd residue characteristic; q=1 and characteristic-two substitutions are outside the standing hypotheses.

| Statement | Instance | Computed values on the two sides / wrong model | Result and action |
|---|---|---|---|
| 0.2 lifting functor | x=0; unit scaling ax | obstruction 0 gives Z(0)=N; O_F x=O_F ax for a unit | Whole space, not Cartier; no change |
| 0.3 Fermat stratum | d=1,q=3 | degree 4, genus (4−1)(4−2)/2=3, rational points 3³+1=28 | Matches dimension/strata; no change |
| 0.5 dependent-label control | D=D | Tor₀=O_D, Tor₁=O_D(−D), latter nonzero | Independence restriction necessary |
| 0.6 Euler | C=ℙ¹, O(D)|C=O(−1) | sheaf stalk lengths infinite; cohomological lengths 1,2; χ=−1 | R02 |
| 0.9 rank-one density | a=1,3,−1,−3 | −D′(1)=1,2,0,0; (a+1)/2=1,2,0,−1 | R03; last instance separates formulas |
| 1.3 primitive cycle | n=2,a=2,q=3 | removed-locus degree 0; closed Z₂ degree 12; total with Z₀=13 | R01 |
| 2.3 numerical curves | zero class and [O_C], q=3, x∈Λ | pairing 0 and 1−q²=−8; coefficients 0 and 1 give 0 and −8 | Numerical representation, no effectiveness assertion |
| 2.6 Chern quotient/sign | hyperplane H on ℙ² | exp(−H)=1−H+H²/2; exp(H)=1+H+H²/2; ch(O_D)=H−H²/2 | R08 |
| 2.7 Fourier sign | q=3 curve and its negative | f=−8, f̂=8; −f=8, (−f)̂=−8 | Eigenvalue stays −1; R08 |
| 3.2 negative norm | n=1,a=−3 | analytic total 0, printed (a+1)/2=−1 | R03 |
| 3.5 unramified KR | n=1,a=3 | lifting length 2; −(−1+2−3)=2 | Headline normalization agrees |
| 4.2 balloon | n=2,q=3 | stratum dimension 1; covering degree/multiplicity q+1=4 | Repaired definition consistent |
| 4.5 almost-self-dual KR | rank-one a=2,q=3 | (q+1)Int_Y=4·1=4; ∂Den_Λ−Den=5−1=4 | Headline correction essential |
| 4.6 log conversion | q=3 | log(q²)=2log3, not log3 | Parameter conversion required and stated |
| 5.3 excess labels | repeat a divisor on finite proper support of length ℓ | two tensor terms lengths ℓ,ℓ; χ=0 | Exists; R09 |
| 5.4 modular line | t=4,q=3 | deg ω=2; χ(O)−χ(O(2))=1−3=−2=1−q | Source and §6.5 agree |
| 5.4 smallest strata | t=2 and 4 | dimensions 0 and 1; squared-Frobenius eigenvalues 1, respectively 1 and q²=9 in degrees 1,2 | Low-type cases agree |
| 5.6 reflection | x₁=e₁,x₂=e₁+e₂ | cross-pairings 1 vs −1; orthogonal e₁,e₂ gives 0 vs 0 | R05 |
| 6.1 density gap | L invariants (1,1), q=3 | Den(H₁,L)=0; Den(H₂,L)=640/729; signs differ in both | R04 |
| 6.4 volume | M and uM, invariants (1,1)/(3,3),q=3 | types 2/2; volumes 1/3 and 1/27; q^(−t/2)=1/3 both | R06 |
| 6.5 curve Fourier | q=3,x∈Λ; isotropic/anisotropic nonzero residues | f=−12+10=−2; f̂=−12/9+10/3=2; other transformed values −1 and 0 | Eigenvalue −1 agrees |
| 6.7 exceptional pair | a=3,β=1 | h(e,y)=−u,h(y,y)=0; u·Gram elementary valuations (2,2); v_F₀ h(e,e)=1 | Bound repaired; R07 valuation unit |
| 6.8 exotic KR | n=2 invariants (1,1)/(1,3) | Int=2/4; density=2·1/2·2=2/4 | Headline factors agree |
| 6.9 scaled form | c=u²/ϖ a unit | v_F₀(ca)=v_F₀(a)+0, not +2 | R07 |
| 7.8 trace dual bound | norm-unit line, trace annihilator π⁻¹O_F | N(π⁻¹)=−π₀⁻¹; norm valuation −1, whereas O_F line has lower bound 0 | Sharp/trace distinction agrees |
| 8.2 primitive density | q=3, t=2 with χ=±1; t=3 | 1−χq=−2 or 4; 1−q²=−8 | Signs distinguished |
| 8.4 negative-cone test | stated rank-three example,q=3 | det binary Gram=−1; β≡±1 modπ gives 2q=6 classes; partial integral 6vol(L♭), not 0 | Source correction retained |
| 8.6 hyperbolic reduction | L♭=⟨l₁+πl₂⟩⊂H₁ | norm −2π²; projection coefficient 1/(2π) nonintegral | Isolated repair target necessary |
| 8.7 Krämer KR | unimodular I₂,I₃; nonintegral lattice | Int/∂Den respectively 0/0,1/1,0/0 | Headline low-rank normalization agrees |
| 9.4 Cayley/unit | x=0,g=−1; omit (√ε)⁻¹ | c(0)=−1,c⁻¹(−1)=0; norm ratio −ε has valuation 0 | Cayley signs pass; unit Check R07 |
| 9.5 small residue | q=n versus q≥n+1 | q+1=n+1 possibly excluded residues; n+2>n+1 in second case | Separate q=n target retained |
| 9.6 cyclic linear map | h Gram ((0,1),(1,0)), x=((0,u),(0,0)), label e₂ | δ↦(h(δ,e₂),h(δ,−xe₂))=(δ₁,uδ₂), determinant u≠0 | Cyclicity yields bounded inverse images; zero/noncyclic x would not |
| 10.1 weights | φ=1_U,2·1_U | support functor same; intended coefficients 1,2 | R10 |
| 10.1 Gram | T=I₂,a=((1,u),(0,1)) | off-diagonals (−u,u) vs (u,−u) | R11 |
| 10.2 K-class | one Cartier factor; two repeated factors | [O]−[O(−D)]; [O]−2[O(−D)]+[O(−2D)] | Derived multiplicities, not support alone |
| 11.4 virtual one-cycle | class [O_C] and zero; divisor degree d | quotient coefficients 1,0; pairings d,0 | Numerical class need not be effective |
| 11.5 fixed-polynomial uniformization | distinct α,α′ | a point cannot have both characteristic polynomials: unwanted orbit coefficient 0; matching label counted with its prescribed weight 1 | Fixed α restriction meaningful |
| 12.7 CM series | φ(0)=0 versus 1, line degree d and normalization N | constant contributions 0 and −d/N; finite terms multiply by λ when φ multiplies by λ | Linear pairing and constant term retained |
| 13.6 bidegree | n=3,m=1 versus m=3 | Green degrees (0,0) vs (2,2); only second is top degree | R12 |
| 13.6 half embeddings | integrals I at conjugate pair | I/2+I/2=I | Half normalization agrees |
| 13.8 unramified ASW | three vanishing local factors | derivative at 0 of s³A(s)=0; no singleton local contribution | Headline Diff test agrees |
| 13.10 modified ASW | inert self-dual place; q=3 almost-self-dual coefficient | correction 0 in self-dual case; c₀=−1/(q+1)=−1/4 in the other | Reduces to unmodified formula exactly in stated case |
| 14.3 vanishing | B=∅, constant 1; nonzero weight | all nonzero Fourier coefficients 0, constant coefficient 1; weight forces constant 0 | Correct theorem, duplicate R14 |
| 14.6 AFL | semi-Lie dimension 1, norm valuations 1 and 3, q=3 | Int=1,2; matched derivatives (0−1)log3 and (0−1+2−3)log3, hence −ω∂Orb=Int·log3 | Headline sign and residue factor agree |

**Suppliers and ownership.** The supplied board-package index was read before resolving the three roadmaps absent from the indexed open/main search. `roadmaps show` was used for the indexed heads, and `roadmaps grep` for objects: special Hom spaces and RZ models, supported formal K-theory, local densities, quasi-canonical lifts, arithmetic Chow/Green pairings, CM cycles, Fourier vanishing and Jacquet–Rallis transfer. No duplicate Lean name is possible in this package, which declares none. The following contracts were opened and resolved by content; R13 distinguishes existing mathematics from invalid identifiers.

| Supplier | Sections resolved / ownership conclusion |
|---|---|
| GeometryOfNumbersAndQuadraticArithmetic | §§2.7.1–2.7.3,2.9,3.2.2,3.2.4–3.2.7: forms, duals, invariants, unramified densities and polynomial formulas; ramified extension remains a gap, subject to R04. |
| SchemeKTheoryOperations | §§6.12,7.7: supported scheme cycle classes and rational graded G₀/Chow comparison. |
| SchemeKTheoryOperationsPartII | Numerical sections listed in R13; affine product versus nonaffine exhaustion are different inputs. The nonaffine product request does not duplicate its affine theorem. |
| PELModuliPartII | Framed spaces, all four model types, CM data, Hecke and uniformization belong there. Decimal headings listed in R13 replace the absent U-slug locators. |
| LubinTateFormalModulesAndQuasiCanonicalLifts; base GrossZagierAndArithmeticHeights | §§6.1–6.5,7.1 and base §7.2 respectively: lifts/degrees versus lifting lengths. No local intersection theorem is moved back into the base roadmap. |
| AbelianSchemesAndArithmeticModuli | §A4.CR.7.2 and §A4.7: Grothendieck–Messing and homomorphism lifting. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | §§R07.1.8,R07.1.22,R07.2.10,R07.2.20: Tate modules, full faithfulness and covariant Dieudonné inputs. |
| MetaplecticAutomorphicForms | §§2.1,2.5,3.3,3.3a,3.3b,4.5,5.1,5.8,6.2,6.4,6.7: Weil index, oscillator action, uncertainty, theta and Siegel–Weil inputs. Its §3.3a supplies the uncertainty principle; this package does not own it. |
| AutomorphicLFunctionsAndLocalFactors; AutomorphicSpectralTheory | AL.0 Schwartz–Bruhat/Fourier input; §§1.1,1.2,2.4 normalized induction and Eisenstein input. |
| ArakelovGeometryAndAbelianHeights | §§1.8–1.10 provide arithmetic divisors/Green pairings and excluded-log quotient, not all-codimension arithmetic Chow; declared extension contract remains necessary. |
| PELModuli | §§M0.22,M1.3,M1.13,M3.4,M3.8,M6.1: moduli, Hodge/CM and Hecke background, distinct from local special-cycle constructions. |
| MotivesAndAlgebraicCycles; ClassicalAdicEtaleCohomology | §§2.4,2.7,7.19; Layer 8: cycle classes/cohomology. The motivic height result assumes a local RZ intersection input, so it does not duplicate this package's local identity. |
| SchemeAndStackFoundations | §§5.1,5.3,5.4,5.7: cycle/intersection background. |
| EndoscopicTransferAndUnitaryTraceComparison; its Part II | Earlier transfer framework and declared local comparison contract; Part II §§4.4–4.5 are the repaired inputs, with the remaining change of formulation explicitly a gap. |
| AdelicAlgebraicGroups; AutomorphicFormsOnReductiveGroups | §4.2 strong approximation; §4.4 exact Fourier criterion, requiring R14. |

The closest indexed open roadmaps in `overlaps.md` were inspected by scope/objects: ComplexMultiplicationAndExplicitReciprocityPartII #1695 owns CM reciprocity rather than these local derived intersections; MetaplecticAutomorphicForms #1063 owns oscillator/theta infrastructure; GrossZagierAndArithmeticHeights #1487 supplies the base theory; EndoscopicTransferAndUnitaryTraceComparison #999 supplies transfer; IgusaVarietiesAndTorsionConcentration #1090 owns Igusa geometry rather than these special-cycle pairings. The overlap file reported no conflicting head or dropped-id relation. Direct content inspection nevertheless found R13 and R14. Ownership was checked against the tool-indexed heads and provided board copies; unprovided/unindexed pull-request files were not independently located.

**Supplier order.** Prescribed dependency-check output:

```text
depcheck: 236 roadmaps, 2151 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The check validates roadmap edges, not target existence; it therefore does not repair R13. All four gap slugs occur in both the README contracts and plan: `ramified-hermitian-densities`, `nonaffine-formal-filtration-product`, `arithmetic-chow-star-products`, `jr-afl-local-inputs`. Each has a named earlier supplier. The latter three describe necessary extensions/formulation changes rather than unowned inputs; R04 qualifies the first. No request to wait for a later supplier is made.

## Not verifiable

- Lusztig76 remains settled as uncertified. Its original §§1.18,6.1,7.3 were not available to read. LZ and LL2 restate the eigenvalue consequences used here; those passages and low-rank computations were checked. No new request was made.
- The full proofs of the general local identities, the global arithmetic formulas and the modularity theorems were not reconstructed. This review verifies stated locators/hypotheses and computed adversarial instances; it does not turn source proofs into formal proofs. In particular K's long density-combinatorics derivation and the complete archimedean normalization conversion are not independently proved here.
- Only indexed open heads and the board files supplied by the brief were available for open-work ownership. No claim is made about other unprovided files. The PEL, Lubin–Tate and Endoscopic Part II citations were resolved against their permitted board packages where the indexed lookup had no copy.

## Source issues

- **Misprint** in LZ at Definition 2.9.1, p. 14: the source says the torsion-ideal quotient is the maximal vertical closed formal subscheme; it should be the maximal horizontal flat one; affects nothing.
- **Error** in LZ at §6.4, after Definition 6.4.1, p. 38: the source gives the negative of the Cartier structure-sheaf Chern character; it should be one minus the exponential of the negative divisor class; affects the proof.
- **Error** in K at Theorem 8.2, p. 64: the source asserts negative-cone vanishing of the vertical analytic partial integral; it should retain positive-cone constancy without that vanishing assertion; affects a stated result.
- **Gap** in K at Lemma 9.6, p. 74: the source decreases valuation through a nondegenerate hyperplane in every case; it should separately treat the hyperbolic block where the resulting hyperplane is isotropic; affects the proof.
- **Misprint** in LL2 at proof of Proposition 2.44, equation (2.17), p. 28: the conductor factor uses the inner summation variable; it should use the outer variable j; affects nothing.
- **Misprint** in LL2 at proof of Lemma 2.56, p. 34: the reflection sends the earlier basis vectors to the scalar one; it should fix those vectors; affects nothing.

The extraction's strict-looking inequalities in LL2 Lemma 2.57 are not asserted to be a printed mathematical error: the non-strict interpretation is necessary and is consistent with the explicit a=3 example. R07 concerns the package's valuation convention, not that OCR issue.
