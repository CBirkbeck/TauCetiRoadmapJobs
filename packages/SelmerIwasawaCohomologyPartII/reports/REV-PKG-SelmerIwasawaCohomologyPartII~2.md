<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/589#issuecomment-6320247503 -->
Review (codex) of 1e33676

Verdict: needs_changes

1. **F01** (P1) Integral weight-sequence input exceeds the supplier and the declared gap

   **Location:** `packages/SelmerIwasawaCohomologyPartII/README.md:385`: “Apply the imported weight spectral sequence to the actual strata.” See also lines 161–165, 375, 401, 415 and 678.

   **Claim:** The imported filtration supplies the weight spectral sequence with integral and finite coefficients used in both parities in §2.5 and on the resolved product in §§2.6 and 5.3.

   **Witness:** `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:3759` restricts the graded nearby complex to ℚ_ℓ; line 3786 uses ℚ_ℓ in E₁. The package's line 163 covers only two components in relative dimension 2r−1 with specified parity vanishings.

   At odd rank N=3, the single-factor relative dimension is 2, outside that contract. At n=2, the resolved product has local equation xtv=p (package line 413), hence a three-component intersection and five possible weight columns. It is outside the two-component contract even though its relative dimension is odd. Finite/adic stalk descriptions in supplier §7a.7 do not construct a filtered complex with the asserted restriction/Gysin differential and derived inertia action. The supplier expressly distinguishes these facts. Rationalizing the sequence cannot recover its integral torsion information.

   **Exact repair:** Declare an additional residual obligation on LefschetzPencilsAndVanishingCycles for the integral/torsion filtered nearby-cycle complex and its weight spectral sequence for separated finite-type strictly semistable schemes over a henselian trait, with smooth intersection strata, ℓ invertible, coefficients Oλ and Oλ/λᵐ, without a properness assumption. Specify the stratum E₁ terms, alternating restriction/Gysin differential, integral tame operator on graded pieces, coefficient compatibility, and nearby-cohomology abutment; specialize to the two- and three-branch models here. Keep generic-fibre comparison under the separate native-model contract; no general equality with a cohomological weight-monodromy filtration is requested. Add the same new slug to the plan's top-level gaps and the README supplier contracts, and cite it in §§2.5, 2.6 and 5.3. Keep the existing `nearby-weight` gap for the additional parity-dependent filtration and inertia-cokernel assertions. Do not claim the rational supplier already supplies this extension or narrow the integral targets to rational coefficients.

2. **F02** (P2) Two product conclusions lose their supported generality

   **Location:** `packages/SelmerIwasawaCohomologyPartII/README.md:678`: “Under the first-law hypotheses”; line 680 imposes A7.1.1, A7.2.2, A7.2.3, A7.2.4 and H(n), H(n+1) on all the conclusions.

   **Claim:** Product nearby-cohomology vanishing and the compact-to-ordinary support comparison are offered only with the full rigidity, genericity, irreducibility and multiplicity hypotheses.

   **Witness:** ltxzz line 6011, Remark 7.2.6, p. 123: part (5) needs only A7.2.3; part (6) needs only A7.1.1. The two conclusions are identified in Lemma 7.2.5 at ltxzz line 5931 onward.

   The full-hypothesis implications are true, but the package omits the general statements explicitly supplied by its cited remark. These are useful independently of the first explicit reciprocity law. This violates the requirement to retain source-supported generality.

   **Exact repair:** Split §5.3 into named targets with separate dependencies. On Datum 5.1, state vanishing of Hⁱ_𝔗(Q,RΨOλ) off degree 2n−1 under A7.2.3 alone, and the stratum compact-to-ordinary comparisons under A7.1.1 alone. Retain the full first-law hypotheses for the other E₂, Frobenius-exclusion and weak-semisimplicity conclusions. Cite Remark 7.2.6 beside the two weaker-domain statements. Add a hypothesis-domain Check showing that their interfaces do not demand rigidity, cohomological genericity or H(n), H(n+1).

3. **F03** (P3) Spell out the component domains of the four resolved incidence maps

   **Location:** `packages/SelmerIwasawaCohomologyPartII/README.md:692`: “by restriction to the indicated component”.

   **Claim:** The superscripts of J°†, J°•, J•† and J•• identify the component to which restriction is taken.

   **Witness:** ltxzz line 5080 and line 5083 restrict the first two maps to Q°•; ltxzz line 5086 and line 5089 restrict the last two to Q••. A dagger labels an incidence operation, not that component.

   In §2.6 the notation Q°,† and Q•,† already denotes intersection strata, so reading the displayed labels as component labels gives the wrong domain.

   **Exact repair:** Write the four composites explicitly: J°† and J°• first restrict to Q°• and push to P°•; J•† and J•• first restrict to Q•• and push to P••. Then name the corresponding product incidence map and its definite-function target for each. Preserve the four coefficients in ∇ and its final Frobenius-coinvariant target. This is a clarification of the intended construction, not a change to the reciprocity identity.

Three findings: one P1, one P2 and one P3. The scope is a legitimate extension of SelmerIwasawaCohomology, so rejection is not warranted. The four repairs described in the preceding repair report are repaired. The additional integral nearby-cycle prerequisite in R01 is not covered by the existing declared gap; this finding does not object to the absence of an implementation of a declared contract.

## Previous findings, checked first

The named previous review file `packages/SelmerIwasawaCohomologyPartII/reports/REV-PKG-SelmerIwasawaCohomologyPartII.md` is absent. The available repair report is `packages/SelmerIwasawaCohomologyPartII/reports/FIX-PKG-SelmerIwasawaCohomologyPartII~2.md`; its four finding descriptions were used to identify the earlier claims, then checked independently against the package and sources. None is marked not actionable.

| Earlier finding | Repaired passage in the package README | Independent witness | Status |
| --- | --- | --- | --- |
| F01, exceptional bundle | Line 401: “Identify ρ:E=Q††→Z with ℙ_lines(L₀⊕L₁)”; line 403 retains η²+ρ*(a+b)η+ρ*(ab)=0. | The two blowup charts at line 413 give the normal sum. The section D₁ over the quartic has normal O_C(−4), degree −16, at line 421. Stacks projective-bundle and blowup conventions: stacks-projective line 3361, line 3479; stacks-blowup line 3632. | Repaired. The two section classes and both exceptional normal bundles also check. |
| F02, parity of the maps | Line 375: “Define ∇₁ on E₂⁰,²ʳ only for N=2r+1 odd, and ∇₀ on ker d₁⁰,²ʳ only for N=2r even”. | ltxzz line 4214 and line 4219. The odd boundary calculation gives (p+1,(p+1)²,−T•°), annihilated by (0,T•°,(p+1)²). At N=2 only the even balloon term survives. | Repaired. R01 concerns the separate filtered-complex prerequisite, not these parity guards. |
| F03, component transforms | Line 399: “the scheme-theoretic closure in Q of the inverse image of C∖Z under this isomorphism”. | The centre's ordinary strict transform is empty, whereas its component closure is Bl_Z(P°°); the charts at line 413 verify this. See stacks-blowup line 3906 and line 3918. | Repaired. The graph still uses ordinary strict transform on its appropriate dense-open domain. |
| F04, case-sensitive Rees locator | Line 69: “Mathlib/RingTheory/ReesAlgebra.lean”. | At the manifest Mathlib pin, `reesAlgebra` is at line 40 and `mem_reesAlgebra_iff` at line 65 in that file. | Repaired. |

No previous finding is re-raised.

## Seeded source verification

All six manifest works were readable from the supplied legal source cache. No author-marked unverified locator was found. All fifteen requested sample targets were read at their numbered statements, including the surrounding hypotheses and the printed page markers. Preprint and published numbering were kept distinct; §1.5 correctly uses the published reflexive closure, not the differing preprint description. No source fetch or manifest edit was necessary. The entries below paraphrase the evidence, rather than reproduce source passages.

| Sample target | Checked locator and text | Result |
| --- | --- | --- |
| §1.5 Special and very special inert places | ltxzz-published line 1533, line 1542, line 1549; Definitions 3.3.1–3.3.4 and Remark 3.3.3, p. 147 | Odd unramified p, degree-one base completion, inertness and splitting in the real reflexive closure agree. The intersection of reflex fields is the published convention. |
| §1.6 Admissible coefficient primes | ltxzz line 6368; ltxzz-published line 7345 through line 7386; Definition 8.1.1 and Remark 8.1.2, preprint pp. 131–132, published pp. 303–304 | All seven clauses retained, including both L5 alternatives, the simultaneous prime-to-ℓ conjugate-component witness, simple tensor fixed line, rigidity and genericity. |
| §2.1 Level-raising data | ltxzz line 5136 through line 5209; §6.1, Notation 6.1.3, pp. 106–107 | Finite supports, even special-maximal level, P1–P6 and contracted residual/congruence ideals match. A change of level does not automatically preserve P6. |
| §2.2 Basic isogeny correspondence | ltxzz line 1788 through line 1890; Definitions 4.3.1–4.3.4, Theorem 4.3.5, pp. 39–41 | Smooth geometrically irreducible fibres, floor dimensions and tangent/normal descriptions match the stated smooth standard-indefinite domain. |
| §3.2 Odd Tate cycles | ltxzz line 5295 through line 5313; Lemma 6.2.2, Theorem 6.2.3, p. 109 | Surjectivity, concentration and the stronger coinvariant/eigenvalue conclusions have the correct distinct assumptions. |
| §3.3 Even integral freeness | ltxzz line 5634 through line 5644; Theorem 6.3.5(1)–(2), pp. 115–116 | All even hypotheses retained, including coefficient bound, cyclotomic irreducibility, rigidity, genericity, nonzero definite support and H(N). |
| §3.6 Congruence realization | ltxzz line 5655 through line 5657; Theorem 6.3.5(5), p. 116 | Positive multiplicity, conjugation and twist retained; existence does not select a canonical summand. |
| §3.7 Changing odd levels | ltxzz line 6489 through line 6507; Lemma 8.1.7, pp. 133–134 | Odd rank, finite distinct rational supports, H(n₁), intertwining genericity and cohomological genericity retained; comparison is in every degree. |
| §5.2 First geometric law | ltxzz line 4899 through line 4929; Theorem 5.11.5(1)–(3), pp. 101–102 | Both individual intersections and the combined identity match, including (p+1)², the directions of T°•/T•° and the source trace. |
| §5.3 Product concentration | ltxzz line 5931 through line 6012; Lemma 7.2.5 and Remark 7.2.6, pp. 121–123 | The full-hypothesis claims are supported. R02 records the omitted weaker domains; R01 records the additional integral supplier input. |
| §5.4 Potential boundary | ltxzz line 5076 through line 5126 and line 6024 through line 6033; Construction 5.11.7, equation (5.28), Proposition 7.2.7, pp. 104–105, 123–124 | Invariants on the source, coinvariants on the target, degree shifts and the actual cycle-boundary value match. R03 requests explicit component domains. |
| §6.4 Second explicit bound | ltxzz line 6192 through line 6256 and line 6303 through line 6313; §7.3 assumptions, Theorem 7.3.4, pp. 127–129 | Absolute degree-2n cycle class, pushed-forward definite function and inequality direction agree. First-law rigidity is not silently imposed. |
| §7.1 Polarized image lifting | ltxzz line 918 through line 936; Lemma 2.7.1, p. 21 | Specialization F′=F⁺rflx and P=T²−1 gives the unit and simple free fixed-line conditions at every positive congruence depth. |
| §8.2 Rank one | ltxzz line 6773, line 6828, line 6887; Theorem 8.3.2 and proof, pp. 139–143 | Nonzero diagonal regulator, multiplicity and Selmer membership inputs agree. The package explicitly retains the additional actual-Frobenius span premise required by its corrected detection supplier and tracks the loss 2c; it does not infer a diagonalizing basis from a positive-loss span. |
| §8.5 Hilbert precursor | liu-tian line 1407, line 1477, line 1496; Assumption 4.1, Definition 4.5, Theorem 4.7, pp. 30–32 | Odd degree, LIInd, residual dimension equality, coefficient bound, excluded supports, product nondivisibility and Hecke congruences retained. The target is unramified H¹, not the unitary singular comparison. |

Additional reads checked the corrected product geometry, parity calculations and supplier residual obligations: ltxzz line 4023, line 4081, line 4122, line 4214, line 4710 and line 4755; stacks-blowup line 3632, line 3750 and line 3906; stacks-projective line 3352 through line 3398 and line 3479. The deformation domains were checked at ltxzz-deformation line 1444, line 1761 and line 1880. The erroneous global-product identification in the printed geometric source was not accepted as authority: the normal-line calculation above is an independent check of its correction.

## Adversarial mathematics pass

Each numbered-section row covers its assertions, defining fields, named API and Checks, not just its headline. Rows are split where different conclusions need different controls. “No additional defect” means the indicated tests passed on the stated hypotheses and declared supplier contracts; it is not a proof of the future implementation. “Change” below is the requested repair; no package mathematics was edited during this review.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Standing rank, coefficient and finiteness conventions | n=0,1,2; m=0,1,2; ramified Oλ; equal-characteristic and zero coefficients; infinite excluded set | n≥2, m≥1, finite exceptional sets and finite extensions of ℚℓ exclude the inapplicable cases; λ is not replaced by ℓ. Finite-period algebra separately permits zero/torsion coefficients. | None |
| Polarization, Frobenius and cochain conventions | (I,−1)c squared; inert p=3; sign action on ℤ | GL component −I; arithmetic Tate scalar 9 versus geometric 1/9; coboundary of 1 equals −2. Rank-(2,3) tensor has rank 6 and weight −1 after twist 2. | None |
| Hecke, duals, order and trace conventions | Rank-one paired parameter, q=3; exchange even/odd factors; free two-point orbit with 𝔽₂ coefficients | The parity-specific operators and twists stay distinct. Orbit trace of (1,1) is 1 while total trace is 0; no division by orbit size is used. | None |
| §1.5 inert predicates and four API assertions | ℚ(i) at 2,3,5; degree-two base completion; identity field transport | 3 accepted with residue size 9; 2 and 5 rejected; inertness alone does not imply degree-one base completion. | None |
| §1.6 admissibility and four API assertions | ℓ=2,3; ξ=±1; scalar identity; lattice homothety; polarization unit | Small primes and the forbidden image witnesses fail; conjugation and homothety preserve all seven conditions. Tensor twists add correctly. | None |
| §2.1 datum, reduction, ideals and level API | Empty raising set; infinite support; m=0,1,2; level change | Empty raising set allowed, infinite support and m=0 excluded; reduction is right exact, but level change needs a separate P6. Quotient, localization and annihilator are distinguished. | None |
| §2.2 correspondence and three API assertions | N=2,3; empty indexing scheme; residue extension | Fibre dimensions 0,1 and codimensions 1,1; empty source remains empty. The rank-two fibre is compatible with the source's incidence form. | None |
| §2.3 strata, charts and normal bundles | xy=p; p=3 quartic; invert p; branch exchange | Two reduced special branches, smooth generic chart and dual link normals; quartic normal degrees have opposite signs. | None |
| §2.4 cohomology, excess and trace | Minimal link; ℓ divides p+1; characteristic-two coefficient orbit | Minimal projective fibre is ℙ⁰; the restriction isomorphism retains its unit hypothesis; geometric freeness and orbit trace have their separate domains. | None |
| §2.5 incidence maps, parity and matrices | N=2,3,4; p=3; restriction on (1,0),(0,1) | Zero rank-two link; odd middle entry −16, even initial entry 4; restriction values 1,−1. Odd boundary cancellation is zero and the even balloon term remains. | Earlier F02 repaired |
| §2.5 weight sequence, functoriality and singular sequence | Odd N=3 versus even N=2,4; F=4 on ℤ₃; p²−1 nonunit | Invariants 0 differ from coinvariants ℤ₃/3. Even singular sequence keeps its unit assumption. General integral filtered input for odd rank is not supplied. | R01 |
| §2.6 component closures, lifting and graph | Centre itself; empty centre; exceptional point; dense generic graph | Ordinary centre transform empty; resolved closure nonempty. Effective-Cartier pullback suffices for a unique lift, but arbitrary exceptional-point maps do not satisfy a converse. Graph pushforward has multiplicity one. | Earlier F03 repaired |
| §2.6 projective and blowup products | Point fibre; trivial line sum; O_C⊕O_C(4); both sections; both equal components | η²=0 only in the trivial-Chern specialization; quartic D₁ square −16; section product zero; both normal formulas sum with the section classes to zero. Pushforwards give ρ!η=1 and ρ!η²=−a−b. | Earlier F01 repaired |
| §2.6 semistability and weight columns | n=2; charts xtv=p and usy=p | Relative dimension 3 and three branches; no fourfold intersection. This requires more than a two-component integral filtration. | R01 |
| §3.1 localization and integral concentration | Unlocalized bad constituent; adjacent integral torsion; derived coefficient reduction | Intertwining is used only on the localized support; ordinary reduction alone would not prove freeness. | None |
| §3.2 odd surjectivity, concentration and coinvariants | N=3; omit H(N); nonsemisimple Frobenius | Three sets of hypotheses remain distinct; strongest comparison is not asserted from concentration alone. | None beyond R01 prerequisite |
| §3.3 even freeness | N=2,4; zero localization; transferable level outside S_FL theorem domain | Nonzero support is required; arbitrary permitted transferable levels use the explicit residual oldform contract. | None beyond R01 prerequisite |
| §3.4 ground eigenvalues | Candidate eigenvalues 1,p²; distinguished level-raising pair | Exclusions retain the full even hypotheses and local constituent input. | None |
| §3.5 singular comparison | N=2; quotient versus simultaneous annihilator | Uses actual nΠ quotient and the filtered inertia morphism; neither a rational projector nor an eigenspace is substituted. | None |
| §3.6 multiplicity realization | μ=1,2; change of multiplicity basis | A positive multiplicity and existence of an isomorphism do not choose a canonical coordinate. | None |
| §3.7 odd level change | Empty set; singleton; repeated rational support | Empty change is identity; repeated supports lie outside the stated domain. | None |
| §4.1 compatible datum and refinement | n=2; incompatible levels; degree-two source-only refinement | Dimensions 1,2,3 and graph codimension 2; level compatibility is necessary; a commuting square need not be Cartesian. | None |
| §4.2 graph cycle and functoriality | Zero difference; degree-two cover; identity point graph | Class 0, trace 2Δ and positive point class 1; pullback multiplicities retained. | None |
| §4.3 projected arithmetic regulator | Zero cycle; n=2; point class on ℙ¹; nonproper residual boundary | Target H¹(F,H³(2)) at n=2; an arbitrary point class has no such single-row edge. Rational cuspidal concentration is separated from integral residual boundary exclusion. | None |
| §4.4 purity and finite membership | Weight −1; ℓ ramified in F; ramified coefficient field | L1 excludes the first ramification, not the second; all-place finite regulator theorem has a named supplier contract. | None |
| §4.5 multiplicities and conjugation | Reducible factor; zero tuple; change of basis of a nonzero tuple | H(N) keeps its irreducibility antecedent; a nonzero tuple has some nonzero coordinate without a canonical choice. | None |
| §4.6 regulator naturality | Identity; degree-two trace; non-Cartesian square | Trace uses source degree; pullback uses the full fibre product, including all components. | None |
| §5.1 first datum and polynomial conditions | Zero localization; m=1,2; displayed 𝔽₁₁ factor roots | Nonzero support and congruence depth retained; simple roots in the two factors need not give a simple tensor eigenvalue. | None |
| §5.1 definite period and its six API statements | Empty, singleton and double source; infinite X,Y; signed cancellation; 𝔽₂ | Values 0,1,2; source multiplicity is counted; nonzero summand does not imply nonzero sum. Finiteness of X,Y is needed only for the fibre expansion. | None |
| §5.2 three geometric identities | p=3; zero cycle; multiplicity-one fibre | Factors p+1=4 and (p+1)²=16 persist; actual cycle pullbacks and source trace preserve linearity. | None |
| §5.3 six product conclusions | Integral Tor; nontrivial exceptional bundle; omit rigidity or H(N) for the last two conclusions | Freeness removes Tor; additive splitting does not require a product bundle. Integral filtered input is missing; two conclusions have weaker source domains. | R01, R02 |
| §5.4 potential source, target, boundary and naturality | Unipotent Frobenius over 𝔽₃; differential π²; cycle 0; both sections | Invariant-to-coinvariant map can be zero; cokernel class of π has exponent 1. Chern terms and coefficient maps are retained. | None |
| §5.4 resolved incidence composites | J°†, J°•, J•†, J•• separately | The first two use Q°• and the last two Q••; dagger-labelled intersections are not the component domains. | R03 |
| §5.5 first explicit law | p=3; zero function; successive actual congruence quotients | Factor p+1 and both Hecke values retained; quotient is not replaced by eigenspace. | None |
| §5.6 exponent equality | Unit multiple; zero class; multiplication by π | Unit hypotheses justify equality; nonunit multiplication can lower exponent and is excluded. | None |
| §6.1 second datum and definite function | Two source points with one image; m=0; remove first-law-only rigidity | Function value is 2; m=0 is excluded; second-law hypotheses are separately stated. | None |
| §6.2 second geometric law | Zero class; rank pair (2,3) | Degree 2r₀ and twist r₀ agree with the incidence pushforward, and both legs remain. | None |
| §6.3 odd coinvariants | Odd rank 3; omit A7.3.2 or H(n₁); nonsemisimple action | Required concentration, multiplicity and weak-semisimplicity inputs are retained. | None |
| §6.4 second bound | O/π²→O/π; zero class | Exponents 2→1 demonstrate that the functorial bound need not be equality; source class is absolute cohomology. | None |
| §7.1 image lifting | m=1,2; ξ²=1; simple fixed line | Unit and prime-to-ℓ conditions are indispensable; integral idempotents preserve the rank-one fixed line under the supplier theorem. | None |
| §7.2 actual-Frobenius detection | Zero realized span; c=0 or c≥k; D=[[π,1],[0,π]], C=[[π,−1],[0,π]] | DC=CD=π²I does not imply a basis. The primitive vector (−1,π) kills row one and has row-two value π². The explicit span hypothesis prevents a vacuous detection claim. | None |
| §7.3 rigidity and annihilator construction | Empty raising set; two detecting places; N=2,p=3 modulo 11; doubled pair at N=4 modulo 19 | The first Frobenius pair is {5,1}; the doubled distinguished pair is excluded. The primitive first kernel removes the unwanted term without a basis assertion. | None |
| §7.3 local pairings and coefficient places | Perfect A₅ pairing on π,π²; nonperfect pairing πxy; uniformizer Kummer class; other place over p₁ | Exponents 2 versus 1 distinguish perfection. A nonfinite Kummer class is not covered by crystalline annihilation. Both arguments must be finite; native specialization covers nondetecting places over p₁. | None |
| §7.4 two eventual families | F⁺=ℚ; CM or isogenous elliptic factors; absent supercuspidal place | Outside-family cases are excluded; eventual admissibility does not supply the separate uniform span premise. | None |
| §8.1 rank zero | Hypothetical rank-one lattice; large m; ramified Oλ | Contradiction threshold retains fixed detection, lattice and different losses; none is silently set to zero. | None |
| §8.2 rank one | Nonzero regulator; hypothetical rank-two lattice; primitive pair not a basis | Lower bound comes from regulator membership; upper bound loses 2c and retains both crystalline local conditions. | None |
| §8.3 multiplicity removal | n=2 over ℚ; n≥3 over ℚ or larger F⁺ | Only N≤3 or F⁺≠ℚ removes H(N); all remaining admissibility and span premises stay. | None |
| §8.4 rank-(2,3) specialization | ℓ=2,3; omit L6 or L7 | Small ℓ fails L1; the specialization does not delete rigidity or genericity. | None |
| §8.5 Hilbert comparison | g=1,3; even g; missing LIInd or dimension equality | Odd-degree theorem retains its exact domain and unramified cohomology target. | None |
| Downstream interfaces | Nonzero definite period versus only an L-value derivative | No theorem producing a cycle from derivative nonvanishing is silently assumed. | None |
| Lean `definiteDiagonalPeriod` | Empty source; two points with same image; arbitrary target types | Real finite-sum body counts source points, without target finiteness. | None |
| Lean `definiteDiagonalPeriod_add` | Zero functions; torsion additive monoid | Termwise finite-sum additivity needs only AddCommMonoid. | None |
| Lean `definiteDiagonalPeriod_smul` | c=0; zero semiring; noncommutative semiring | The left regular action distributes over the sum; no commutative multiplication is needed. | None |
| Lean `definiteDiagonalPeriod_map` | Zero homomorphism; reduction to ZMod 2 | An additive homomorphism commutes with the finite sum. | None |
| Lean `definiteDiagonalPeriod_reindex` | Identity; Boolean swap; empty source | Equivalence permutes summands including multiplicity. | None |
| Lean `definiteDiagonalPeriod_fiber` | Empty target; double fibre; unhit pair | Fibres partition S and Nat.card gives multiplicities 2 and 0. Additive nsmul, not scalar division, is appropriate. | None |
| Lean `definiteDiagonalPeriod_exists_ne_zero` | Empty source; signed cancellation | Contrapositive of all summands zero is valid; no false converse. | None |
| Two proved Lean examples | Singleton/double/empty over ℤ; signed Boolean values; double over ZMod 2 | Mathematical values 1,2,0 and 0,0 check. Proof scripts were inspected but not elaborated. | None |

## Duplication and supplier-order audit

The pinned commits are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, as recorded in the content manifest. Object searches were followed by reading the relevant files at those commits. Scope, supplied constructions and signatures were compared, rather than relying only on proposed declaration names.

| Object | Earlier owner / pinned witness read | Audit result |
| --- | --- | --- |
| Polynomial evaluation, derivative and reversal | `Mathlib/Algebra/Polynomial/Eval/Defs.lean`; `Mathlib/Algebra/Polynomial/Derivative.lean:46`; `Mathlib/Algebra/Polynomial/Reverse.lean:88`, `Polynomial.reflect`, `coeff_reflect` | Imported. Parity-specific unitary conditions remain with SmoothRepresentationsOfLocalGroups §SR.4.4. |
| Finite PID modules | `Mathlib/Algebra/Module/PID.lean:168`, `Module.torsion_by_prime_power_decomposition`; `Mathlib/LinearAlgebra/FreeModule/PID.lean:397`, `Module.free_iff_isTorsionFree` | Imported with PID and finiteness scope; no arbitrary-ring enlargement. |
| Continuous cohomology and compatible-pair maps | `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:113`, `TopRep.homogeneousCochains`, and line 131, `continuousCohomology`; `Functoriality.lean:103`, `ContinuousCohomology.cochainsMap`, with `map`, `map_id`, `map_comp` | Canonical carrier and map direction are cited, not rebuilt. |
| Explicit H¹ and coboundaries | `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:172`, `TauCeti.ContCohomology.d0`; line 712, `H1`; line 717, `H1pi`; exponent and subsingleton results in the same file | Imported with continuous action; no identification with an arithmetic finite condition. |
| Rees algebra and affine blowup charts | `Mathlib/RingTheory/ReesAlgebra.lean:40`, `reesAlgebra`; line 65, `mem_reesAlgebra_iff`; `TauCeti/AlgebraicGeometry/Blowup/AffineCharts.lean`, `affineBlowupι` and the three cited chart-map identities | General APIs imported. The two-factor component-closure computation is a native specialization, not a second blowup theory. |
| Existing objects named Selmer or Abel–Jacobi | `Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean:161`, `selmerGroup`; `TauCeti/AlgebraicGeometry/WeilDivisor/AbelJacobi/Quotient.lean:54`, `weightedAbelJacobiQuotientClass` | K(S,n) and the weighted divisor quotient do not supply the Bloch–Kato Selmer condition or integral arithmetic étale regulator here. |
| Finite period | Existing finite-sum algebra versus the real-bodied `definiteDiagonalPeriod` | The source-multiplicity specialization is legitimate; six API statements refer to its own definition and do not propose a replacement summation library. |
| General blowups, projective bundles, Chern classes, Gysin maps | StableReduction Layer 4; SchemeAndStackFoundations §§0.3, 5.4–5.5; EtaleCohomologyFoundations §§F.6–F.7 | Imported; the corrected normal-sum calculation is not already a general supplier target. |
| Cohomology, Selmer conditions and detection algebra | ProfiniteCohomology Layers 1–3, 5–8, 10; SelmerIwasawaCohomology §§0.12–0.13, 2.6–2.7, 4.8–4.11, 4.24–4.25; EulerSystemsAndKolyvaginSystems §§1.2–1.3, 1.6, 1.11, 1.15, 4.4 | General objects remain owned earlier. Discrete cohomological exactness is not enlarged to arbitrary topological coefficients. Corrected realized-span and scaled-inverse hypotheses are respected. |
| Native models, uniformization and finite sets | PELModuli §§M0.25–M0.26, M2.8, M2.12–M2.14, M4.3, M4.5–M4.9; ShimuraVarieties §§5.1, 6.7; EndoscopicTransferAndUnitaryTraceComparison §§13.1, 13.8 | Native special-level and nonproper comparisons are residual contracts, not falsely attributed to smooth hyperspecial PEL statements. |
| Local packets, transfer and multiplicities | SmoothRepresentationsOfLocalGroups §§SR.4.1, SR.4.4; EndoscopicTransferAndUnitaryTraceComparison §§9.1, 11.2–11.4, 12.12–12.15, 13.5–13.9; AutomorphicGaloisRepresentationsPartII AG2.1b, AG2.2, AG2.5–AG2.7 | Normalizations and compact/transferable-level domains are retained. Full H(N), native concentration and unrestricted permitted oldforms are declared residual obligations. |
| Local rigidity, duality and eventual families | LocalGaloisDeformationRings §§1.6, 2.3, 2.12, 2.20; GlobalGaloisDeformations §§3.3–3.8, 5.2; ArithmeticGaloisDuality §§R02.4.2–R02.4.3, D7.4, D7.7; IgusaVarietiesAndTorsionConcentration §IG.7.2 | Fixed multiplier and distinguished Frobenius pair match. Rank-two cyclotomic irreducibility is cited only in its rank-two scope. Genericity includes every exceptional-set enlargement. |
| General nearby-cycle filtration | LefschetzPencilsAndVanishingCycles §§7a.7–7a.9 | R01: the general graded comparison read there is rational, while the residual gap covers only a special two-component integral case. |

All `*Needs:*` lines and supplier-contract headings were read. No later roadmap was cited as a supplier, and no ownership move is required. The other general interfaces named in the contracts—SchemeAndStackFoundations §2.15, MotivesAndAlgebraicCycles §§7.16–7.18 and AdelicAlgebraicGroups §4.1—were checked against their stated domains. Their additional adic edge, integral regulator and hermitian classification obligations remain explicitly declared gaps.

The open-roadmap heads for K3SurfacesAndSymplecticBoundedness, CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers and ArithmeticDynamics were inspected by scope and object searches. None supplies the native unitary level-raising, product-resolution or diagonal arithmetic reciprocity targets owned here. In particular, the p-adic/logarithmic comparisons of CohomologyComparisonsPartII do not fill the ℓ-invertible integral weight-filtration gap in R01. The base SelmerIwasawaCohomology roadmap remains the owner of the general Selmer and local annihilation theory. The opening scope explains the Part II extension rather than re-planning that work.

The dependency check exited with status 0. Its exact output was:

```text
depcheck: 7 roadmaps, 63 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. The tool's seven-roadmap graph is not represented as an exhaustive verification of all mathematical prerequisites; the manual domain audit above is what exposed R01.

## Declared-gap audit

All twenty existing slugs occur in both `packages/SelmerIwasawaCohomologyPartII/design/plan.json` and the README's exact supplier contracts with the same named supplier. None has supplier `none`. Their surrounding contract paragraphs specify the hypotheses and residual scope. The related clauses below were treated as interfaces of one identified mathematical input, rather than as requests to rebuild their already-supplied foundations.

| Gap slug | Supplier and residual scope checked | Result |
| --- | --- | --- |
| native-shimura | ShimuraVarieties; native special/hyperspecial models and ordinary/compact specialization, including other places over the detecting prime | Declared; more than the existing generic/smooth PEL model. |
| unitary-incidence | ReductiveGroupsPartII; Appendix A hermitian incidence geometry and cohomology | Declared as new, no nonexistent incidence section asserted. |
| nearby-weight | LefschetzPencilsAndVanishingCycles; two-component parity filtration and inertia quotient | Declared and precise on its domain; does not cover R01. |
| automorphic-multiplicity | AutomorphicGaloisRepresentationsPartII; exact H(N), c-conjugation and N≤3 or F⁺≠ℚ removal | Declared residual specialization. |
| diagonal-concentration | AutomorphicGaloisRepresentationsPartII; native rational cuspidal concentration beyond compact ST/END | Declared; separate from residual integral boundary vanishing. |
| boundary-cohomology | ShimuraCompactifications; localized native boundary theorem of Lemma 6.1.11 | Declared residual theorem. |
| rigid-r-equals-t | GlobalGaloisDeformations; polarized rigid R=T, freeness and deformation comparison | Declared; not supplied by generic GL deformation diagrams alone. |
| old-form-dimension | EndoscopicTransferAndUnitaryTraceComparison; permitted transferable levels outside S_FL and residue-characteristic restrictions | Declared; existing restricted theorem not duplicated. |
| local-unitary-representations | EndoscopicTransferAndUnitaryTraceComparison; primitive link constituent and Frobenius comparison | Declared; general local packets or LT tower comparison do not identify this link. |
| chow-abel-jacobi | MotivesAndAlgebraicCycles; integral arithmetic étale regulator and functoriality | Declared; not the existing conjectural/rational cycle interfaces. |
| hochshild-serre-adic | SchemeAndStackFoundations; adic spectral sequence and single-row edge | Same spelling in both records; residual to the existing covering descent. |
| purity-crystalline-regulator | ArithmeticGaloisDuality; finite rational regulator and compatible torsion crystalline lattice realization | Declared with good-reduction/support/Hecke domains; local Tate duality alone does not imply it. |
| unitary-special-compatibility | ShimuraVarieties; native addition-of-line and uniformization diagrams | Declared with isogeny scaling. |
| semistable-boundary | LefschetzPencilsAndVanishingCycles; potential-map comparison and Abel–Jacobi value | Declared with concentration, Frobenius, weak-semisimplicity and nonproper support premises. |
| polarized-image-lifting | ArithmeticGaloisRepresentations; finite image and prime-to-ℓ lifting | Declared with simultaneous polarization and cyclotomic compatibilities. |
| hecke-finite-support | IntegralHeckeAndGaloisDeterminants; finite-support/Frobenius separation for PI6, PI8, PII8 | Declared; distinct from abstract finite-sum algebra. |
| eventual-images | ArithmeticGaloisRepresentations; image and tensor facts for the two specified families | Declared, without an unrestricted eventuality claim. |
| eventual-rigidity | GlobalGaloisDeformations; the stated two families' eventual rigidity and cyclotomic irreducibility | Declared; checked against the deformation paper's domains. |
| hilbert-precursor | HilbertModularVarietiesAndShimuraCurves; Liu–Tian Assumption 4.1, Definition 4.5 and Theorem 4.7 | Declared; exact odd-degree hypotheses reproduced. |
| hermitian-local-global | AdelicAlgebraicGroups; prescribed compatible local invariants | Declared; weak approximation in §4.1 does not itself classify hermitian spaces. |

Their current absence from a supplier is not a finding. No existing gap was found to request a theorem already supplied in the needed generality. This verdict is needs changes, so `conditional_gaps` is not used in the JSON; a later acceptance would still depend on the declared contracts.

## Verified sound

- Read all 950 README lines, all 95 Lean lines, metadata, all six source records and the plan's twenty gap entries. Read StableReduction and Chebotarev on main for house shape. The package has eight layers and forty numbered target subsections, with examples and dependencies at every layer.
- Independently checked all four described earlier repairs; all four are repaired. The corrected projective bundle, component closure and parity formulas survive the explicit negative controls above.
- Read all fifteen seeded source targets. No inaccessible source or author-marked unverified locator remains. The two sample precision/generality issues are R02 and R03; R01 is a supplier-domain defect rather than a false printed theorem.
- The adversarial table covers all forty numbered sections, the standing conventions and downstream interface, all seven named Lean declarations and both examples. Particular controls included ramified coefficient DVRs, empty sources and prime sets, ranks 2 and 3, invariant/coinvariant distinctions, failure of averaging in characteristic two, exceptional Chern terms, positive-loss nonbasis detection and both crystalline pairing arguments.
- No route-specific “good primes” replacement, algorithmic development, copied source passage or re-planning of the base roadmap was found. Transfer beyond restricted supplier domains is requested as a contract. Rank zero/one endpoints retain the actual-Frobenius span premise rather than using the invalid implication from a fixed line alone.
- Lean static form: one `import Mathlib`, one real-bodied definition, six `theorem` statements with `sorry`, and two proved discriminating examples testing that definition. There is no `set_option`, sorry'd data, admitted example, placeholder condition or forced geometric carrier. All seven Lean names occur in the README. Binders needed by the displayed types are explicit, with no section-variable hypothesis loss. The six signatures are mathematically valid at their stated generality.
- Metadata/source TOML and plan JSON parse. All twenty existing gap names and suppliers match. Supplier direction check passes, with its exact output recorded above. SHA-256 comparisons confirm that the README, Lean, metadata, sources manifest and plan are unchanged. Deliverable JSON validation and whitespace checks passed.

## Not verifiable

- **Lean elaboration: not available.** The brief supplies no permitted elaboration command and explicitly specifies this outcome. No Lean command was run; no elaborated-type inspection or successful build is claimed. In particular, the two `norm_num` example scripts have only been inspected statically, so the assertion that `sorry` is the only compiler warning cannot be certified.
- **Original previous review:** the named first-round review file is absent. Only the four findings described in its available repair report can be checked finding by finding; all four were checked.
- **Future implementations of declared supplier contracts:** the review verifies ownership, exact contract scope and source support, not implementation of those contracts. Their declared status is not counted as a defect. R01 identifies an additional input outside them.

No cited text was unreadable, no new missing-reference request was needed, and no network write, package repair or Lean build was performed.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "1e33676777274dca38f74eba37a2a856c0e8d2d2", "job": "REV-PKG-SelmerIwasawaCohomologyPartII~2", "model": "gpt-6-astra", "worker": "chris-1"} -->
