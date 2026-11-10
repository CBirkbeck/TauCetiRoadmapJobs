# Review of KloostermanMomentsAndPotentialAutomorphy (package, round 2)

**Verdict:** needs changes

Twelve findings: six P1 and six P2. The package is repairable within its scope. Its four Lean headline statements elaborate; the defects below concern the mathematics, supplier contracts and dependency order in the README, plus one definition's explanatory Lean docstring. No roadmap source file was changed.

## Previous finding: F01 — repaired

The sole preceding finding concerned the obsolete C0.15–C0.18 labels. The repair report marks it repaired, correctly. The repaired passage at `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:275` reads “ShimuraCompactifications §0.15 (smooth projective refinements), §0.16 (toric schemes of finite fans over every commutative ring, with base change)” The same correction occurs in the scope and §§6.1, 7.1. All occurrences of the old labels are gone.

At the head of ShimuraCompactifications, pull request #1053, `TauCetiRoadmap/ShimuraCompactifications/README.md:725`, `:750`, `:778`, `:801` contain the four sections. I checked their hypotheses, including arbitrary coefficient rings, the nonempty-base qualification on the properness converse, and relative rather than absolute reducedness of the boundary. The repaired labels and boundary computations pass; R12 records a separate projectivity prerequisite exposed by checking the content of §0.15. No previous finding is re-raised. The preceding review's other claims are not treated as certificates: only explicitly computed unchanged examples are inherited, and the seeded targets and changed supplier citations were checked again.

## R01 (P1) — The logarithm has the wrong sign

**Location:** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:570`, “Σ_m m₂ᵏ(p^m)T^m/m = −log det(1 − F_pT | H¹_c)”.

**Claim:** the moment logarithm is the negative logarithm of the compact-support determinant.

**Witness:** k=1 has every moment −1. The left side starts −T−T²/2; the displayed right side starts T+T²/2, since the determinant is 1−T. The preceding trace formula has already introduced the cohomological minus sign.

**Repair:** replace −log by log and add this k=1 sign check. Indeed log(1−T)=−T−T²/2−…, and exponentiating gives the correct Z₁=1−T, rather than its inverse. This also reconciles §1.4 with §0.3 and FSY line 81.

## R02 (P1) — The deck-group projector destroys the cover realization

**Location:** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:875`, “degree one is identified with the χ_n-isotypic part”; its only projector is defined at `:809` on S_k×μ_r.

**Claim:** that projector describes both the original connection and its cyclic cover.

**Witness:** FSY lines 628–629 distinguish S_k from S_k×μ_r. For r=2,k=3, cover H¹ has dimension 4 and middle dimension 3; taking μ₂-invariants gives dimensions 2 and 1. These are also the package's own §§5.5, 6.5–6.6 values.

**Repair:** distinguish the S_k projector, with denominator k!, from the S_k×μ_r projector, with denominator k!r. On the f presentation use S_k; on the tg presentation use S_k for the cover and S_k×μ_r for the descended connection. Correct §§3.2–3.5 and their downstream uses, including the Check that currently suppresses μ₂. Test with the four cover basis classes j=0,1,2,3: deck eigenvalues +1,−1,+1,−1 give invariant rank 2. The corrected middle dimensions are 3 before descent and 1 afterward.

## R03 (P1) — The inverse Fourier objects have incompatible ranks

**Location:** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:898`, “M̃ = FT⁻¹(j_{0,!*}Sym^k K̃l_r)”; `:900`, “ΠM ≅ M̃”. The same paragraph identifies M with the entire middle Gauss–Manin image.

**Claim:** the inverse Fourier transform of the intermediate extension is the exponential projection of that image.

**Witness:** for r=2,k=1 the declared M̃ has rank 1, whereas ΠM has rank 2. The finite degree-two map y↦y+y⁻¹ has middle direct image of rank 2, including a constant line. FSY lines 684–691, 732–751, 1219–1227 distinguish all three objects.

**Repair:** retain M̃ as the pure inverse Fourier transform, identify M with M̃, and identify ΠM with FT⁻¹(j_{0,+}Sym^k K̃l_r). Construct M as the image of the S_k-signed middle Gauss–Manin module **in** ΠM, as in (2.22), removing its maximal constant summand; it is not the whole Gauss–Manin image. Update the API and §5.4 references. At k=1 the corrected ranks are 2 for the full Gauss–Manin image, 1 for M=M̃, 2 for ΠM, and 1 for the constant cokernel.

## R04 (P1) — A Hodge Check contradicts its own theorem

**Location:** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:1005`, “(gr^W₁ H¹_c(K_{2,3}))^{sgn}(−1) is one-dimensional of weight 4”.

**Claim:** this is the r=2,k=3 instance of the preceding hypersurface comparison.

**Witness:** nk−1=2, not 1. A nonzero weight-one piece twisted by (−1) has weight 3, not 4. The theorem at `:992` and FSY lines 906–908 instead use gr^W₂ H²_c.

**Repair:** replace the Check by the S₃×μ₂,χ-part of gr^W₂ H²_c(K_{2,3})(−1), of dimension 1 and Hodge type (2,2). Explicitly retain deck invariants. Its weight is 2+2=4 and its dimension matches d₃=1.

## R05 (P1) — Supplier labels no longer name supplied prerequisites

**Location:** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:215` and `:223`, “Layer D … Layer H” and “Layer D: formal differential modules”; the obsolete labels recur throughout the Needs lines.

**Claim:** these named layers supply differential operators, formal theory, Hodge operations and stationary phase.

**Witness:** `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:26`, `:84` assigns formal theory to PadicDifferentialEquationsAndRigidCohomology RD.6.52a–RD.6.53. Its headings are numbered 1–12. Springer pull request #1828 has numbered §§8.1–9.7, with no Layer D/H aliases.

**Repair:** resolve every occurrence against the current supplier, not just the contracts table. For MixedHodgeModulesAndIrregularHodgeTheory use F→2, H.0→4, H.1→5, E→6, I→7, C→8, P→9, G→10, T→11, N→12, selecting the actual subsections consumed. Replace former D by PadicDifferentialEquationsAndRigidCohomology §§RD.6.52a–RD.6.53. For Springer use §§8.1–8.3 for coherent D-modules/good filtrations and §§9.1–9.7 for operations, holonomicity and intermediate extension. Ordinary differential operators themselves belong to ComplexComparisonPartII C5.1 and PBW to FormalConnectionsOpers F2.2, as `TauCetiRoadmap/SpringerResolutionAndCharacteristicCycles/README.md:16`, `:118`, `:136` explicitly state. Keep the irregular stationary-phase gap, with its section updated to the current numbered layer in the gap metadata and README. Tested: the replacement destinations contain the specified objects; e.g. intermediate extension is §9.6 at `:1051`, not a nonexistent H layer. This is a prerequisite-resolution defect, not a request to re-plan these suppliers.

## R06 (P2) — The advertised build order contains forward edges and a coarse cycle

**Location:** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:1316`, §6.4 needs §6.5; `:1877`, §10.4 needs §11.2; `:2016`, Layer 11 depends on “Layers 9–10”.

**Claim:** the layers and their subsections are in build order.

**Witness:** in consumer-to-prerequisite notation, 6.4→6.5 is forward; 10.4→11.2→11.1 is forward; aggregating the declared dependencies gives Layer 10→11→10. This is internal and therefore invisible to the external roadmap gate.

**Repair:** put the double-cover Hodge-number argument before its use in §6.4. Separate determinant/gamma/epsilon conventions from completion; place potential automorphy and local-factor transport after those conventions but before completion, then root numbers and functional equations. Rewrite each layer's dependencies to this actual target order. A valid order of the affected end targets is 10.1,10.2,10.3,11.1,11.2,10.4,11.3,11.4,11.5. With this ordering every listed edge points backward and the coarse cycle disappears. Preserve old-to-new labels for any moved externally referenced target.

## R07 (P1) — A worked example calls the inverse Euler factor the Euler factor

**Location:** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:1684`, “k = 5: Euler factors M₅(p; T) at p ≠ 3, 5”.

**Claim:** the good-prime Euler factor is M₅ rather than its reciprocal.

**Witness:** p=2 gives M₅=1−4T+64T², while L₅,₂=1+4T−48T²+…. The coefficients of T have opposite signs. The fresh finite-field computation gives Z₅=1−5T+68T²−64T³=(1−T)M₅.

**Repair:** write M₅(p;T)⁻¹, retaining the two bad-prime examples. Check M₅·L₅,₂=1 through T²: 4−4=0 and −48−16+64=0. This agrees with §§8.5,10.4 and `oddEulerFactor`.

## R08 (P2) — The Euler-series API lacks normalization and a sufficient convergence hypothesis

**Location:** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:1864`, “its Dirichlet series equals the Euler product wherever either converges absolutely”. `eulerCoeff` accepts an arbitrary family of power series.

**Claim:** the stated equality and convergence transfer hold for that family without additional hypotheses.

**Witness:** take L₂=2 and L_p=1 otherwise: the Euler product is 2, while eulerCoeff gives the Dirichlet series 1; both converge absolutely. Even after normalizing, L_p(T)=1+T−T² gives product 1 at s=0 but infinitely many prime coefficients of absolute value 1.

**Repair:** require [T⁰]L_p=1 for every prime. State the expansion under absolute summability of the Dirichlet coefficients (equivalently an appropriate absolute coefficient majorant), and delete the implication from mere absolute convergence of the product of evaluated factors. Use the pinned arithmetic-function Euler-product theorem after supplying its summability hypotheses; give each local series its own convergence/evaluation condition. Add Checks for n=1, a prime power, coprime multiplication and the two excluded families. For normalized L_p=(1−a_pT)⁻¹ with an absolutely summable coefficient majorant, eulerCoeff(p^j)=a_p^j and both expansions have constant coefficient 1. The actual moment factors are normalized; this repair need not narrow any headline.

## R09 (P2) — The eliminated-variable comparison includes a forbidden zero parameter

**Location:** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:390` and `packages/KloostermanMomentsAndPotentialAutomorphy/Suggested.lean:47`, “rank-two case of the product-fibre hyper-Kloosterman sum”. The definition permits a∈F.

**Claim:** the comparison holds for every allowed a, including zero.

**Witness:** over F₂ with ψ(1)=−1 and a=0, the defined sum is −1; the product fibre in (F₂×)² is empty and its sum is 0. CongruenceSpectralGap pull request #1504, `TauCetiRoadmap/CongruenceSpectralGap/README.md:649`, uses a unit parameter.

**Repair:** retain the useful total definition on F but qualify both comparison sentences and the supplier contract by a≠0, transporting to F×. Add the zero-parameter negative control. At a=1 both presentations give ψ(0)=1; at a=0 the qualified comparison is inapplicable and the total sum remains −1.

## R10 (P2) — The boundary spectral-sequence input assumes a smooth compactification

**Location:** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:1584` and `:1599`, the bad-prime proof uses the boundary spectral sequence and DeligneWeightsAndPurity §8.24; see also §§7.3–7.4 and the contract at `:269`.

**Claim:** this supplier provides the spectral-sequence argument on the integral model's singular special fibres.

**Witness:** DeligneWeightsAndPurity pull request #929, `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:2868`, assumes smooth proper X₀. At k=3,p=3, (1,1,1)∈K has g=6=0 and all three derivatives 0: tangent dimension 3 exceeds dimension 2. It remains an interior singularity of K̄.

**Repair:** retain all primes. Distinguish the smooth-fibre weight spectral sequence from the boundary localization argument on the singular fibre. State the needed latter comparison as a target for these compactifications, derived from EtaleCohomologyFoundations' localization and the alternating resolution by boundary intersections; prove exactly the required weight/kernel assertion using the local singularity inputs. Do not import purity of the central term or E₂ degeneration from §8.24 without its smoothness hypothesis. The repaired argument applies to the k=3,p=3 nodal fibre while invoking smooth proper purity only for its smooth proper boundary strata. Over the smooth characteristic-zero fibres §8.24's finite-field formulation is likewise not itself a Betti spectral-sequence theorem; cite the corresponding Hodge operations where needed.

## R11 (P2) — The 2-adic bound needs a coefficient-prime comparison

**Location:** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:1927`, “apply weak admissibility to the 2-adic realization and restore the trivial factor”.

**Claim:** the listed inputs identify the slopes of that realization with the local moment polynomial at 2.

**Witness:** PotentialModularityAndCompatibleSystems pull request #1075, `TauCetiRoadmap/PotentialModularityAndCompatibleSystems/README.md:214–216`, explicitly excludes the coefficient prime from BLGGT strictness. §9.1 here supplies de Rham admissibility at 2, but crystalline/semistable comparison only at odd primes. Thus neither input identifies WD(V_k,2) with WD₂ of the system.

**Repair:** add the coefficient-prime comparison as a named intermediate target before the bound, with its actual proof inputs. The polarized full comparison of AutomorphicGaloisRepresentationsPartII AG2.6, including totally real descent, is available; discharge its `ExtremelyRegularIrreducibility` premise using ModularityAndLanglandsExtensions §2.43, then supply the potential-automorphy/descent and semisimplification transport needed for this system. Retain N and inertia when extracting the local determinant. These are existing owners, not a new generic comparison. Test at k=3,p=2: the middle polynomial is 1+4T, its slope is 2, and after multiplying by 1−T the coefficient valuations are 0,0,2, meeting 0,0,2. In particular the new comparison must include p=ℓ=2; merely repeating away-prime strictness does not repair the gap.

## R12 (P2) — Projectivity used in the root-number argument has no supplied proof

**Location:** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:1944`, “K̄ is smooth and projective (§§6.1, 7.1)”. Section 6.1 asserts only smoothness and properness of X_k.

**Claim:** those two cited sections establish the smooth-projective hypothesis of the orthogonal-motive contract.

**Witness:** §7.1 proves smoothness along the boundary, not projectivity. ShimuraCompactifications #1053, `TauCetiRoadmap/ShimuraCompactifications/README.md:727`, proves existence of projective refinements of arithmetic fan systems at neat level; it does not prove this specified complete regular fan projective.

**Repair:** add projectivity of the specified X_k, hence of its closed hypersurface K̄, to §6.1. For example identify Σ_k with the normal fan of the lattice polytope conv{signed permutations of (1,2,…,k)} and use a precisely owned normal-fan projectivity theorem; if that generic prerequisite is absent, declare its exact contract with an earlier toric supplier. Alternatively give the explicit projective sequence of invariant blow-ups of (P¹)^k realizing this fan, with the blow-up/fan comparison supplied by name. Do not substitute an unspecified refinement without transporting the hypersurface and all subsequent comparisons. Test k=2: the polytope vertices (±1,±2),(±2,±1) have support values 2,2,3 on (1,0),(0,1),(1,1), and exactly the eight rays and eight chambers of Σ₂. This supplies an actual projectivity argument, rather than inferring it from completeness alone.

## Verified sound

**Coverage and limits.** Read all 58 numbered targets and all 58 Needs lines, the conventions, 22 API introductions, examples, supplier contracts, metadata, source manifest, previous review and repair report. Rechecked all 15 seeded source targets, rather than inheriting the preceding review's assertions about them. The table below covers the sample, headlines, repaired passage and every finding. An additional target-by-target working ledger records the remaining calculations. Finite examples test statements and conventions; they do not replace proofs of the general theorems.

The scope is a new general library roadmap: arbitrary-rank connections and sheaves, rank-two moments at every prime, and general theory imported from owners. No algorithmic target, good-primes-only replacement, re-planning of a main-branch roadmap, copied source passage, unqualified new foundational carrier in Lean, or forbidden supplier was found. The organization is mathematical rather than source-chapter headings. The internal ordering exception is R06. All twelve layers have Examples and Dependencies; the definitions have API lists and at least three listed Checks, but the defective Checks and missing discriminating Euler-coefficient tests are reported above. No process residue, machine paths, HTML anchors, LaTeX delimiters, `lemma`, or `set_option` was found in the reviewed roadmap/Lean text.

**Lean and padding.** Ran the prescribed `lake env lean` on the package's Suggested.lean from the pinned content checkout. Exit 0, exactly four `declaration uses 'sorry'` warnings, at lines 91, 110, 190, 205. The only import is `import Mathlib`; no Tau Ceti object build is necessary. All seventeen definitions have real bodies; no data is admitted. On a scratch copy, for each theorem, `fail_if_success (solve | simp)`, likewise `rfl`, `infer_instance`, and `exact trivial`, followed by the original sorry, elaborated successfully. Thus all sixteen closure attempts fail; tactic progress alone was not counted as closure. Inspected the library near-match results: symmetric polynomials, Chebyshev polynomials and Euler products do not prove these four Kloosterman headlines. No padding finding.

Appended and elaborated `#check @...` for all 21 declarations, compared the expanded types with the supplied signature report and README. There are no section-variable binders to disappear. Positive k, prime p, odd/even assumptions, all finite extension degrees used in the logarithm, polynomial degrees, root norms and the existential even-prime factor match. The total a=0 case remains legitimate in the Lean definition; R09 concerns its false identification in prose. Every backticked identifier attributed to this roadmap matches a declaration in Suggested.lean, and all 21 declarations occur in the README.

**Headline inventory.** The summary's six end results are accounted for:

| Headline | Acceptance statement or reason not statable |
|---|---|
| Integral polynomial moment series, exact degrees | `momentSeries_eq_intPolynomial` |
| Weights of reciprocal roots | `momentSeries_weights` |
| Hodge numbers of middle moments | Named in the module docstring; connections, their de Rham cohomology and irregular Hodge filtrations are missing at the pins |
| Polarized compatible systems and potential automorphy | Named in the docstring; motivic/Galois realization and automorphic representation interfaces are missing |
| Odd functional equation | `oddMoment_functionalEquation` |
| Even functional equation, including the existential factor at 2 | `evenMoment_functionalEquation` |

The monodromy and Nori-motive constructions are also explicitly named as not statable. Searches by object in both pinned libraries found no native carrier that would make these omitted geometric headlines immediately statable. The finite-sum and power-series definitions suffice for the four retained headlines, without a free predicate standing for unavailable geometry. No additional statable headline was identified as missing.

**Adversarial computations.** Rows marked “inherited” use explicitly computed, unchanged values from the first review, permitted by the brief; the other rows were recomputed or rederived in this round. In particular, the finite-field calculation was rerun independently for p=2, k=0,1,2,3,4,5,6,8,10,12 and extension degrees 1–4 (40 moment computations), followed by the formal exponential coefficient recurrence through degree 4.

| Statement | Instances tried | Values on the two sides | Result and change |
|---|---|---|---|
| §0.1 trace recurrence; scalar extension; repeated roots | k=0,2,3; roots 2,1 and 1,1; reduction mod 2; zero ring | h₂(3,2)=7=4+2+1; mod 2 both 1; h₃(2,1)=4=4·1³; h₀=1 (equal to 0 in the zero ring) | Correct, no division by root difference |
| §0.2 finite sums and product-fibre comparison | F₂,a=0,1; F₃,a=1,2; trivial ψ on F₅ | at a=0: −1 versus 0; at a=1: 1=1; F₃ sums −1,2 give moment 1−2=−1; trivial moment −16≠−1 | Unit comparison fails only as overextended; R09 |
| §0.3 exponential series | p=2,k=0,1,3,12 | k=0 coefficients 1,1,2,4,8 equal (1−T)/(1−2T); k=1 coefficients 1,−1,0,0,0; k=3 moments 3,−17,63,−257 give 1,3,−4,0,0; k=12 gives 1,−1,−4096,4096,0 | Correct signs and formal exponential; k=0 excluded from polynomiality |
| §1.4 logarithm | k=1 | −T−T²/2 versus +T+T²/2 | False; R01 |
| §1.2 pairing/normalization | F₂,a=1 | trace −1, determinant 2 give 1+T+2T²; root norms 1/√2 | Correct geometric Frobenius normalization |
| §2.2 cyclic pullback | r=2; r=3 primitive ζ | x+z/x=t(y+y⁻¹); correct action multiplies each term by 1; wrong action gives ζ² on ty; dz/z=2dt/t at r=2 | Correct; rank r rather than r² |
| §2.4 symmetric connection | rank 2,k=0,1,2; rank 1,k=2 | ranks 1,2,3 equal binomial values; ∇(e²)=2e∇e; a line connection d+a has symmetric square d+2a, whereas the unchanged line gives a | Correct Leibniz construction in characteristic zero |
| §3.2 projector | r=2,k=2; r=3,k=2; sign line and trivial line | (1−τ)/2 acts by 1 and 0 respectively; for n=2 the projector (1+τ)/2 reverses those values; denominators 4 and 6 are nonzero in Q₂,Q₃ | Projector itself correct, group must be distinguished; R02 |
| §3.3 Thom–Sebastiani | r=2,k=2; r=3,k=2 | relative dimensions 2 and 4, total cohomology degrees 3 and 5; swapping two n=1 blocks gives (−1)¹=−1, n=2 gives (−1)⁴=+1 | Correct degree and Koszul signs |
| §§3.4–3.5 cover versus descent | r=2,k=3 | cover H¹ dimension 4, deck invariant dimension 2; cover middle dimension 3, descended middle dimension 1 | False identification with single projector; R02 |
| §3.6 inverse Fourier objects | r=2,k=1 | ranks: full middle Gauss–Manin 2; pure nonconstant image 1; Π image 2; declared M̃ 1 | 2≠1 refutes displayed isomorphism; R03 |
| §4.3 hypersurface Check | r=2,k=3 | required cohomological degree 2, weight after twist 2+2=4; printed degree 1, weight 1+2=3 | False Check; R04 |
| §5.3 intermediate extensions | k=2,4; cover k=3 | regular local eigenvalue (−1)^(k/2)=−1,+1, so invariant dimensions 0,1; odd cover has no zero exponential coefficient | Correct infinity exceptions; the origin quotient has rank 1 |
| §5.5 dimensions | k=1,…,12 | d_k=0,0,1,0,2,2,3,2,4,4,5,4; even dimensions all even; at k=0 true H¹(O)=1 versus truncated formula 0 | Positive-k restriction necessary and present |
| §§6.1,7.1 repaired toric citations | k=1,2; boundary over F₂ and a square-zero base | rays 2,8; maximal cones 2,8; k=2 g₁(0,z₂)=1; at z₂=0,g₁=0 one has z₁=−1 and derivative 1 in every base | Correct boundary calculation; total reducedness over a nonreduced base is not asserted |
| §11.3 projectivity premise | k=2 signed-permutation polytope | support values h(1,0)=2,h(0,1)=2,h(1,1)=3; normal fan has eight chambers, matching Σ₂ | Projectivity must be made a target with its input; R12 |
| §6.6 Hodge numbers | k=3,4,5,6,7 | middle pairs (2,2); none; (2,4),(4,2); (2,5),(5,2); (2,6),(4,4),(6,2); counts 1,0,2,2,3 equal d_k; k=4 extra weights 6 and 10 | Correct Hodge symmetry, weights and regularity |
| §§6.4,10.4 dependency order | listed target positions | 6.4<6.5 but consumes it; 10.4<11.2 but consumes it; layer adjacency has 10→11 and 11→10 | R06; external gate does not test this |
| §§7.2,8.3 singular boundary input | k=3,p=3 | g(1,1,1)=6=0; gradient (0,0,0); Hessian diag(2,2,2); tangent dimension 3 versus variety dimension 2 | Smooth-X supplier inapplicable; R10 |
| §9.1 higher thickness | k=9,p=3, a=1,3 | constants 6 and 18 have valuations 1 and 2; over π²=−3 they have π-valuations 2 and 4 | Declared higher-thickness gap correctly needed; no finding for its absence |
| §8.1 middle weights and reciprocal pairing | k=3,p=2 | M=1+4T; inverse root −4 has square norm 16=2⁴; 16/(−4)=−4, whereas 4/(−4)=−1 | Correct package correction of FSY misprint |
| §8.2 degree/trivial factors | k=4,12,p=2; k=9,p=3 | degrees 1,3,3; k=12: a=b=1 and deg M=0, product (1−T)(1−64T)(1+64T); k=9: 5−floor(12/6)=3 | Correct; characteristic 2 not dropped |
| `momentSeries_eq_intPolynomial` | p=2,k=1,3,5,12; p=3,k=9 (last inherited) | degrees of computed coefficient lists 1,2,3,3 equal `momentDegree`; p=3,k=9 degree 3=5−2 | Correct; tested zero trailing coefficient through degree 4 at p=2 |
| `momentSeries_weights` | p=2,k=3,4,10,12 | roots of quotient by 1−T: −1/4; none; conjugate roots with norm²=1/2048=2⁻¹¹; ±1/64 with norm²=2⁻¹² | Correct middle versus boundary weight alternatives |
| §§8.3,8.5 local odd factors | k=9,p=3 (inherited, arithmetic rechecked) | Θ⁻={1}, Θ⁺={3}; (−2/3)=1 gives eigenvalue 3⁵=243; conductor sf(1)sf(3)sf(5)sf(7)sf(9)=105 | Correct odd valuation criterion and geometric Frobenius |
| §8.6 even factors | k=6,8,p=3 (inherited) | inverse factors 1+27T and 1+81T; u=1,v=0 in both; N′=3 | Correct N-dependent factor and conductor |
| §8 examples: good Euler factor | k=5,p=2 | M=1−4T+64T² versus inverse 1+4T−48T²+… | R07 |
| §9.1 Newton bound | k=3,p=3; k=3,p=2 comparison destination | at p=3 coefficients 1,−1 give valuations 0,0; at p=2 coefficients 1,3,−4 give 0,0,2 against n(n−1)=0,0,2 | Odd-prime route supports claim; 2-adic route needs R11 |
| §10.2 gamma factors | d=0,1,2; s=3 for d=1 | standard/paper ratios 1,√π,π^(3/2); Γ_R(2)=π⁻¹ and paperGamma(1,3)=π⁻³ᐟ² | Package's constant is correct; source normalization slip noted below |
| §10.3 epsilon convention | k=6,p=3; k=3 at infinity | local sign (−1)^floor(6/12)=+1; infinite factor i^((9−1)/8)=i; dropping N would discard a one-dimensional correction at k=6,p=3 | Correct sign distinction from inverse Euler polynomial |
| §10.4 generic expansion | L₂=2, others 1; normalized L_p=1+T−T² at s=0 | first case Dirichlet=1, product=2; second all evaluated factors=1 but Σ_p absolute prime coefficients=Σ_p1 diverges | Both missing conditions matter; R08 |
| §11.2 semisimplification and coefficient prime | k=6,p=3; k=3,p=ℓ=2 | rank N=1 on rank-2 space gives local determinant degree 1 rather than 2; at 2 middle slope 2 and Hodge number 2 would match, but away-prime hypothesis is 2≠2, false | Retaining N is correct; coefficient-prime input missing, R11 |
| `oddMoment_functionalEquation` | k=1; k=3 | Λ₁=1, both sides 1; k=3: N=3,d=1, reflection 5−s fixes 5/2 and matches shifted quadratic-character L-function | Correct headline, not a boundary-case-only statement |
| `evenMoment_functionalEquation` | k=2,4; k=6 | first two: r=0,P=1,ε=1 give 1=1; k=6: d=2,N′=3, middle local factor at 3 is (1+27·3⁻ˢ)⁻¹ and reflection 8−s | Correct existential form, retains the unknown factor at 2 |

**Seeded source audit.** All locators below were opened in the legal cached versions named by the manifest. “Supports” means the stated hypotheses and formula were compared, not that its proof is already formalized.

| Target | Text and printed locator read | Outcome |
|---|---|---|
| 0.1 | FSY lines 68–77, §1.1 p.2 | Supports eigenvalue sum; universal recurrence proved directly without division |
| 0.3 | FSY lines 81–96, §1.1 pp.2–3 | Supports exponential and small moments |
| 2.2 | FSY lines 429–440, §2.1 p.10; 939–941, §3.1 p.22 | Supports cyclic change and group-scheme action |
| 2.4 | FSY lines 524–533, Proposition 2.7 p.12; Proposition 2.10 pp.13–14 | Supports ranks/irreducibility and applications; Leibniz descent is the standard characteristic-zero tensor quotient construction |
| 3.2 | FSY lines 613–623, proof of Proposition 2.13 pp.14–15 | Source allows the two different groups; R02 records the lost distinction |
| 3.3 | FSY lines 565–566, Proposition 2.10 p.13; 590–596, Corollary 2.11 p.14 | Supports tensor identification with relative degree nk and total degree nk+1 |
| 3.5 | FSY lines 626–629 and 649–677, Proposition 2.13/Corollary 2.15 pp.15–16 | Does not support the package's single-group cover identification, R02 |
| 5.3 | FSY lines 1189–1203, Corollary 4.9 pp.28–29; formal regular component immediately preceding it | Supports the origin extension and infinity exceptions |
| 6.6 | FSY lines 314–341, Theorem 1.8 pp.7–8; proof pp.37–38 | Supports the full Hodge table and positive-k range |
| 7.1 | FSY lines 1740–1764, §5.1.2 pp.40–41; 1528–1534, (4.23) p.36 | Supports boundary smoothness with the derivative restricted to the hypersurface |
| 8.1 | FSY lines 1674–1698 and 1730–1731, §5.1.1 pp.39–40 | Supports pure middle factor; package correctly fixes reciprocal-root exponent |
| 8.2 | FSY lines 1699–1729, (5.3)–(5.4) p.40; lines 210–225, p.5 | Supports separate p=2 and odd-p degree/trivial-factor formulas |
| 9.1 | FSY lines 2199–2205, Proposition 5.23 p.49; 2249–2254, proof p.50; 2294–2320, Corollary 5.27/Remark 5.28 pp.51–52 | Supports conclusions; higher-thickness proof gap explicitly declared by package |
| 10.2 | FSY lines 2336–2362, recipe/Corollary 5.30 p.52; 2370–2399, p.53 | Package correctly distinguishes standard gamma factor from the constant-normalized paper completion |
| 11.2 | FSY lines 2629–2653, Lemma 5.40 p.58; 2660–2679, Remark 5.41 p.59 | Local semisimplification statement supported; source's coefficient-prime input must be supplied, R11; determinant erratum below |

Also opened the changed toric examples, the inverse Fourier construction (FSY (2.18)–(2.23), Proposition 2.21 and Lemma 2.24, pp.16–18), Theorem 3.8 pp.21–23, and the functional-equation statements at FSY lines 118–146, pp.3–4. XZ §1.1.1 pp.2–3 and §4.1.13 p.42 support the cyclic-generator/horizontal-solution sign dictionary. Serre-orthogonal Theorem 4.2.1, lines 363–385, pp.9–10, supports the characteristic-zero involution-compatible form contract, including preservation of symmetric versus alternating type.

**Source manifest.** Four works, one lifetime key each: FSY (arXiv v5), XZ (v2), Serre-orthogonal (v3), and settled uncertified Saito-orthogonal. References into other papers reported through FSY/XZ are identified as such, not claimed to have been read independently. No additional source was fetched or entry rewritten. The sole explicitly unread settled work is recorded under Not verifiable.

**Pinned library audit.** Opened the definitions, not just declaration-name search hits. The following paths are relative to the pinned package roots `.lake/packages/mathlib/` and `.lake/packages/TauCeti/` in the content repository.

| Pinned declaration | File and line | Relevant contract checked |
|---|---|---|
| `AddChar`, `compAddMonoidHom`, `sum_eq_ite` | `Mathlib/Algebra/Group/AddChar.lean:72`, `:242`, `:354` | Trivial additive character has value 1; orthogonality uses a domain |
| `ZMod.stdAddChar` | `Mathlib/Analysis/SpecialFunctions/Complex/CircleAddChar.lean:83` | Positive exponential convention |
| `GaloisField`, `GaloisField.card` | `Mathlib/FieldTheory/Finite/GaloisField.lean:68`, `:117` | Cardinality p^m needs m≠0; moment logarithm only uses m≥1 |
| `Algebra.trace` | `Mathlib/RingTheory/Trace/Defs.lean:70` | Trace of multiplication; field trace is not the identity on arbitrary extensions |
| `FiniteField.trace_to_zmod_nondegenerate`, `algebraMap_trace_eq_sum_pow` | `Mathlib/FieldTheory/Finite/Trace.lean:37`, `:49` | Nontrivial trace character and Frobenius-power sum |
| `SymmetricPower` | `Mathlib/LinearAlgebra/TensorPower/Symmetric.lean:53` | Quotient by tensor permutation relations; supplies no connection |
| `PowerSeries.exp`, `subst` | `Mathlib/RingTheory/PowerSeries/Exp.lean:50`; `Mathlib/RingTheory/PowerSeries/Substitution.lean:158` | exp coefficients 1/n!; `(exp ℂ).subst g` is exp composed with g |
| `MvPolynomial.hsymm` | `Mathlib/RingTheory/MvPolynomial/Symmetric/Defs.lean:312` | Complete homogeneous polynomial, not ordinary power of trace |
| `Polynomial.Chebyshev.U` | `Mathlib/RingTheory/Polynomial/Chebyshev.lean:263` | Integer indexing, recurrence compatible with h_k(2x,1) |
| `Polynomial.roots` | `Mathlib/Algebra/Polynomial/Roots.lean:56` | Polynomial roots, not inverse roots; headline uses negative weight powers accordingly |
| `LSeries`, `LSeriesSummable` | `Mathlib/NumberTheory/LSeries/Basic.lean:164`, `:178` | Summability is a real requirement; n=0 contributes no Dirichlet term |
| `MeromorphicNFOn` | `Mathlib/Analysis/Meromorphic/NormalForm.lean:632` | Normal form supplies point values for the global functional equation |
| `Complex.Gamma` | `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean:287` | Native complex gamma carrier |
| `legendreSym` | `Mathlib/NumberTheory/LegendreSymbol/Basic.lean:109` | Zero on multiples of p; odd-factor arguments remove the p-power first |
| `padicValNat` | `Mathlib/Data/Nat/PadicValNat.lean:21` | Defaults to 0 at n=0 or p=1; Θ sets use positive odd a and prime p |
| `ArithmeticFunction.IsMultiplicative.eulerProduct_tprod` | `Mathlib/NumberTheory/EulerProduct/Basic.lean:261` | Requires norm-summability; supplies the generic expansion after normalization, R08 |
| `TauCeti.Hodge.MixedHodgeStructure` | `TauCeti/Geometry/Hodge/Mixed/Basic.lean:72` | Bounded rational W, bounded complex F, pure graded pieces; finite dimension and graded polarizability are not fields of this structure |
| `...Hom.range_inf_F_eq_map_F`, `...Hom.range_inf_WQ_eq_map_WQ` | `TauCeti/Geometry/Hodge/Mixed/Strictness.lean:110`, `:131` | Strictness on images |
| `TauCeti.Hodge.tate` | `TauCeti/Geometry/Hodge/Tate/Basic.lean:93` | Tate m has weight −2m; (−1) raises weight by 2 |

No fully qualified name of a declaration in another readable roadmap is redeclared here. Searches by finite-sum, symmetric-power, trace, exponential, Euler-product, mixed-Hodge, Nori, irregular-Hodge and compatible-system objects were compared with the pinned definitions and roadmap scopes. Generic finite sums/symmetric powers/power series are reused. The simple rank-two eliminated sum makes the finite-field headlines statable; its overlap is legitimate after R09's unit restriction. R08 directs the generic analytic API back to the pinned Euler-product owner.

**Supplier and ownership audit.** Read the board package index before searching, then the supplied overlap report and the current supplier texts through `roadmaps show`/`roadmaps grep`, together with main-branch files and available board packages. Main-branch shape comparisons were TensorProductCombinatorics and QuadraticCharactersAndReduction. The package under review is not a replacement for an existing main roadmap.

| Supplier | Sections resolved and scope checked |
|---|---|
| CongruenceSpectralGap, #1504 | §§4.2a–4.2b: unit-product sum, actual compact direct image, Artin–Schreier trace, curve Euler–Poincaré; unit caveat R09 |
| PadicDifferentialEquationsAndRigidCohomology, #1002 | RD.6.94–RD.6.98, RD.7.20–RD.7.22 including RD.7.21a: rigid objects, geometric comparison premises, odd-prime factorization, Newton bound; RD.7.20 only unit thickness; formal theory RD.6.52a–RD.6.53 is the replacement owner in R05 |
| SpringerResolutionAndCharacteristicCycles, #1828 | Numbered §§8.1–9.7, not D/H aliases; operators/PBW imported from earlier owners, R05 |
| MixedHodgeModulesAndIrregularHodgeTheory, board package | Numbered Layers 1–12, including §9.3 Künneth, §9.4 middle weights, §§10.1–10.2 classicality/zero-locus comparison and Layer 11 Fourier Hodge formulas; old labels need R05 |
| ComplexComparisonPartII, #848 | C5.6–C5.7: logarithmic de Rham comparison with regular-singular hypotheses; C5.1 owns operators |
| EtaleCohomologyFoundations, main | F.0.4, F.2.4–F.2.7, F.4.5, F.5–F.7, F.10.1–F.10.2b: universal-homeomorphism invariance, rational coefficients, localization, duality, purity, blow-ups, Frobenius comparisons |
| InverseGaloisAndArithmeticFundamentalGroups, #850 | IG.0.T3: rational Grothendieck–Lefschetz trace formula |
| EtaleDualityAndPerverseSheaves, #1040 | §§2.3,2.8,3.3: intermediate extension and rational coefficient extension |
| DeligneWeightsAndPurity, #929 | §§0.16,7.12,8.14,8.19,8.24: weights, middle-image purity, monodromy and semisimplicity; smooth-proper hypothesis of 8.24 must be retained, R10 |
| SchemeAndStackFoundations, main | Layer 0, §§2.11,4.11,4.13,4.17: schemes/base change, Artin–Schreier, modifications/strict transforms, regularity and SNC |
| ShimuraCompactifications, #1053 | §§0.15–0.18: corrected labels confirmed; 0.15 does not by itself establish projectivity of the specified fan, R12 |
| LefschetzPencilsAndVanishingCycles, #873 | §§2.1–2.8, LPV.2 Examples, §6.6: quadratic vanishing cycles including discriminant character and the characteristic-2 specialization argument |
| MotivesAndAlgebraicCycles, #1313 | §2.7 and §§5.3–5.9: realizations, motivic projectors; no functorial Nori weight filtration is supplied, so its declared gap is needed |
| ArithmeticGaloisRepresentations, #856 | §§1.7,2.5–2.7,3.3,5.3,7.4: WD, purity from graded objects, epsilon factors, conductors, pairing carriers; preservation of form under global semisimplification is a declared gap |
| CohomologyComparisons, #1064; PadicHodgeTheory, #1062 | §§2.13,3.4–3.5,4.3–4.4; §3.2 and Layer 5: de Rham, good-reduction crystalline, semistable comparisons and weak admissibility, with geometric hypotheses |
| PotentialModularityAndCompatibleSystems, #1075 | §§1.1,1.5–1.6,1.15: weak/strict systems and archimedean recipe; strictness explicitly away from coefficient prime, R11 |
| ModularityAndLanglandsExtensions, #1180 | §§2.42,2.49: pure regular polarized potential automorphy and functional equation; §2.43 discharges the extra full-comparison premise proposed in R11 |

The five declared slugs match between `design/plan.json` and the README: higher-thickness-picard-lefschetz; irregular-stationary-phase; nori-weight-filtration; orthogonal-motive-root-number; semisimplification-similitude-form. Each has a named owner and concrete hypotheses. No gap has supplier `none`; no gap requests a result already present in a searched pin/earlier supplier. The stationary-phase contract genuinely extends the regular-input theorem: its slope-one factors at infinity belong to an irregular input. The higher-thickness example has valuation 2, so the contract is not redundant with unit thickness. The orthogonal root-number contract is settled but textually uncertified. The section locator associated with stationary phase needs the R05 update; the missing mathematical contract itself is not a finding.

The prescribed dependency check returned exactly:

```text
depcheck: 236 roadmaps, 2151 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No forbidden roadmap was consumed. The report does not confuse this passing roadmap-level gate with the internal coarse cycle in R06.

**Open-work overlaps.** The supplied head-based overlap report lists no other open pull request modifying this roadmap, no dropped cited ids and no ids defined only by an open revision. Compared the scopes and ownership of its five closest roadmaps: #1002 owns rigid cohomology/comparisons, #873 owns generic vanishing cycles, #1504 owns raw finite-field sums and basic Kloosterman sheaves, #2132 FourierDeligneTransform owns the étale Fourier transform, and #1712 CharacterSumsOverFiniteFields owns general character-sum infrastructure. None owns this package's characteristic-zero moment-Hodge calculation or its moment functional equations. KloostermanSheavesAndBesselIsocrystals' available board package explicitly consumes the scalar connections/monodromy here, and is later in supply order. No two-way ownership or duplicated headline declaration was found. The supplier-label and hypothesis defects are R05, R09–R11 rather than new generic ownership assignments.

## Not verifiable

- Saito-orthogonal, the 1995 orthogonal-motive root-number theorem, remains settled `uncertified` in the manifest. Its paywalled text was not read and was not requested again. Acceptance of a repaired package would remain conditional on the declared orthogonal-motive contract, alongside the other four supplier gaps.
- General even-k values of the conductor exponent, local factor and root number at 2 are existential in the theorem; no explicit formula is being certified. The checks cover k=2,4 and the stated k=6 example only. This is not a request to narrow the theorem.
- The finite-field calculation establishes only the computed coefficients, not eventual vanishing for arbitrary p,k. The source supports polynomiality; the fresh numerical run stops at extension degree 4. Unchanged larger-prime numerical values labeled inherited come from the preceding review's computed table, not a fresh computation here.

## Source issues

- **Misprint** in FSY at §5.1.1, printed p.40 (FSY line 1731): the source says reciprocal roots pair using p^((k+1)/2); it should be p^(k+1), as the pairing weight and k=3,p=2 show; affects nothing.
- **Misprint** in FSY at §3.2.1, printed p.23 (FSY line 987): the source says the single Kloosterman sheaf uses the nk-dimensional torus; it should be the n-dimensional torus, with nk reserved for the tensor power; affects nothing.
- **Misprint** in FSY at proof of Proposition 4.20, printed p.33 (FSY line 1408): the source says the primitive monodromy piece is indexed by k; it should be indexed by k−1 for the rank-k single Jordan block centered at k−1; affects nothing.
- **Misprint** in FSY at §5.1.2, printed p.41 (FSY line 1761): the source says the chart derivative is invertible on the coordinate divisor; it should be restricted also to the hypersurface, where the equation makes it −1/z₁; affects nothing.
- **Gap** in FSY at proof of Proposition 5.23, printed p.50 (FSY lines 2249–2254): the source says one quadratic resolution gives the required semistable model; it should also handle higher-thickness points, such as k=9,p=3 with local constant 18 and uniformizer valuation four; affects the proof.
- **Error** in XZ at §2.1.1, printed p.10 (XZ line 489): the source says exp(π(t−t^p)) gives the displayed Frobenius-to-original horizontal map; it should use exp(π(t^p−t)) for those connections and that direction; affects a stated result.
- **Misprint** in FSY at Corollary 5.30, printed p.52 (FSY lines 2336–2362): the source says its constant-normalized paper expression equals the standard gamma recipe; it should include the constant π^(d(d+1)/4), already √π when d=1; affects a stated result.
- **Misprint** in FSY at Example A.3, printed p.63 (FSY line 2876): the source says derived restriction of the shifted constant object has perverse degree zero; it should be the divisor's shifted constant object [1], with perverse cohomology in degree −1; affects a stated result.
- **Misprint** in FSY at Example A.27, printed p.71 (FSY line 3222): the source says the composite direct-image functor is the zero map; it should say the underlying geometric composite is constant at zero, whose direct image need not vanish; affects the proof.
- **Error** in FSY at Remark 5.41, printed p.59 (FSY line 2676): the source says the local determinant equals the determinant on the full semistable period module; it should retain monodromy-kernel and inertia/descent invariants; affects the proof.
- **Misprint** in Serre-orthogonal at proof of Theorem 4.2.1, printed p.10 (Serre-orthogonal line 393): the source says isotropy of S requires vanishing on every pair in E; it should require vanishing on pairs in S; affects nothing.
