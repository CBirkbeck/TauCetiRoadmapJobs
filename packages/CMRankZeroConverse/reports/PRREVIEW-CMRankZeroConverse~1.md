# Review of CMRankZeroConverse (pull request #1744 at 5c3c0b5)

**Verdict:** needs changes

Two blocking findings: one stale supplier contract and two missing statable milestones, grouped as one acceptance-test finding. The gate passes. The thirteen declared supplier gaps are treated as contracts, not as failures merely because their implementations are absent.

## R01 (P1) — Repair the CM supplier locations and ownership

**Location:** `TauCetiRoadmap/CMRankZeroConverse/README.md:131`; also lines 135, 424, 434 and 596.

**Claim:** “Section 1.1 supplies idealLatticeCurve.endomorphismRing and idealLatticeCurve.automorphism_factors over ℂ.” The roadmap also obtains the rational self-twist isogeny from §1.2.

**Witness:** `TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocity/README.md:338` is rational CM twisting; line 354 starts Serre tensor comparisons. Its supplier contract at line 158 assigns the full ideal-lattice endomorphism order to ImaginaryQuadraticClassNumber §H3.1.

The named ideal-lattice targets are absent from the cited CM section. This is a supplied-as-existing dependency with the wrong owner, not the permitted absence of the separately declared descent gap. The current self-twist target is in §1.1, at line 342. The §4.2 mathematics is present, but its target titles are now “Full elliptic CM L-factorization, including bad primes” and “CM induction and compatible-system comparison”; the older identifiers in this consumer do not resolve as named targets.

**Repair:** Cite ComplexMultiplicationAndExplicitReciprocity §1.1 for the rational self-twist in §§4.3–4.4. Cite ImaginaryQuadraticClassNumber §H3.1, specifically its all-order complex elliptic dictionary, for the geometric endomorphism-order input in §6.3. Update the exact supplier contract and the stale §1.1 reference inside `gap:cube-sum-full-cm`; keep that gap for the additional descent to an arbitrary characteristic-zero field containing a cube root. Use the current §4.2 target titles for its factorization and rational induction inputs.

**Repair check:** ImaginaryQuadraticClassNumber §H3.1, `README.md:87`, explicitly includes every imaginary quadratic order and the full endomorphism-order comparison, covering the Eisenstein order for the n=1 cube-sum model. The CM supplier's actual §1.1 checks distinguish the Gaussian unit i, of norm 1, from 3i in the conductor-three order, of norm 9. These are precisely the unrestricted-order self-twist inputs needed here. No new construction or narrower prime range is required.

## R02 (P2) — Include the statable analytic-doubling and descent-count milestones

**Location:** `TauCetiRoadmap/CMRankZeroConverse/Suggested.lean:15`; compare `README.md:430` and `README.md:628`.

**Claim:** The acceptance test lists only the five density endpoints, although §§4.4 and 6.5 explicitly give native formulations of two substantial intermediate results needed by the final arguments.

**Witness:** Both omitted signatures elaborate with the existing imports and definitions: analytic-order doubling on actual base-changed curves, and an eventual C√X bound on actual descending squareclasses. Neither requires a new carrier.

**Repair:** Add these two sorried milestone theorems, in README layer order:

- §4.4: K a totally complex number field of rational dimension two; A an elliptic curve over ℚ with non-scalar endomorphisms over K; entire F and G agreeing with the actual L-series of A and A_K on Re(s)>3/2; conclude `analyticOrderNatAt G 1 = 2 * analyticOrderNatAt F 1`. Do not assume G=F²: deriving that identity is the arithmetic content.
- §6.5: for every such K and every elliptic A/K, conclude that some real C>0 bounds, eventually in X, the number of squareclasses of height below X whose native twists satisfy `descendsToRat` by C√X. C depends on A,K and precedes the quantifier over X. CM and non-inertness of three are not hypotheses of this milestone.

**Repair check:** I elaborated both complete proposed signatures on a scratch copy, using the existing four definitions and no added imports. They produce only the expected `sorry` warnings. The doubling signature gives orders 0,2,4 from orders 0,1,2, without a rank bound. The count signature allows an empty descent set (count 0, C=1), and retains the ramified-prime exception witnessed by H([2])=1 over ℚ(i), while H([3])=9 and H([5])=25. These are mathematical milestones on the roadmap's actual objects, not replacements by scalar identities or small-value examples.

## Verified sound

### Scope, gate and elaboration

I read all 30 numbered targets, their APIs, Checks and dependency lines, both reviewed files, the repository's writing/review rules, and three main-branch shape examples: EllipticCurves, AlgebraicCurves and PadicMeasuresIwasawaAlgebras. The worktree is at the requested head and has no edits outside this folder in the PR diff. No reviewed file was changed.

The worker's gate has zero failures in every listed scanner, dependency check and targeted build; its final result is `OK`. In particular there is no sorry'd data, option override, prohibited import, stray file, copied source file or outside-folder edit. Independently running the requested dependency check returned:

```text
depcheck: 204 roadmaps, 1629 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. This mechanical result does not detect the stale section ownership in R01.

Direct elaboration of `TauCetiRoadmap/CMRankZeroConverse/Suggested.lean` succeeds, with exactly five admitted-theorem warnings and no other warning. A separate copy with `#check @name` for all nine declarations confirms all binders: four real-body definitions and five theorems. No standing field, number-field, ellipticity, CM, degree-two or non-inertness hypothesis disappears. In particular the CM lower-proportion signatures retain `¬(Ideal.span {3}).IsPrime`, and the descent definition retains the ℚ-algebra structure.

Each of the five admitted theorems was tried separately with single-tactic `simp`, `rfl` and `infer_instance` probes. None closes. The object searches found no pinned theorem with the same density conclusion to supply a one-lemma `exact` proof. I found no padding among these five statements. The four definitions serve those statements directly.

The opening goals and deep milestones separate as follows:

| README result | Acceptance-test assessment |
|---|---|
| §2.3 central Kato class is a basis; §§3.2–3.3 conditional/general CM central converses | Actual zeta, modular realization, Iwasawa-complex and finite-Selmer carriers are missing at the pins; these cannot be replaced by arbitrary predicates. The docstring identifies the central converse obstruction. |
| §4.2 elliptic converse over K; §4.5 elliptic converse over ℚ | The docstring correctly names the missing classical p∞ Kummer Selmer/corank interface. Existing finite two-descent groups do not supply it. |
| §4.4 unrestricted analytic-order doubling | Native statement explicitly given in the README and independently elaborated; absent, R02. |
| §§5.2–5.4 three congruent-number density results | All three are stated on actual curves and the stated counting families. |
| §6.1 CM lower-half nonvanishing | Stated with actual endomorphisms, squareclasses, height, twists and continuation. |
| §6.5 quantitative descent bound | Native statement explicitly given in the README and independently elaborated; absent, R02. |
| §6.6 lower-half non-descending nonvanishing | Stated with the same height and actual pointed descent. |

### Seeded source audit

All 15 requested sampled targets were checked against the three legal cached texts. There were no additional unverified-locator flags in the target. Kato's page images at printed pp. 221 and 240–242 were also read to resolve OCR ambiguities about inverse Frobenius, central exponents and the signs. This is locator verification of the cited text, not an assertion that reading a theorem formalizes it.

| Sampled target | Locator checked | What the source supports, and qualification |
|---|---|---|
| §0.3 central realization dictionary | Kato (14.10.1)–(14.10.5), pp. 240–241; Kato lines 4793–4812 | The cohomological realization, dual/Tate-twist dictionary and inverse arithmetic Frobenius in the polynomial. The roadmap's central determinant and purity convention agree. |
| §0.4 central specialization prime | BT proof of Theorem 3.1, pp. 5–6, BT lines 224–249, especially 240; Kato proof of Proposition 14.13, p. 242, Kato lines 4850–4870 | The central cyclotomic-character prime and the associated specialization. The rational sign component at two is essential. |
| §1.2 Selmer zero and global H² | Kato (14.9.3), (14.9.5), p. 240, Kato lines 4771–4790; BT lines 231–234 | The duality/Euler route after rationalization. The roadmap keeps the dual representation and the integral errors killed by two before passing to coefficients. |
| §1.4 geometric condition is finite | Kato Proposition 14.12 and its proof, pp. 241–242, Kato lines 4832–4849; purity discussion at lines 4793–4812 | Local dimensions are 2 and 1 throughout the critical interval. Equality with the geometric condition additionally uses the named regulator dimension formula and the vanishing of the dual crystalline fixed space; it is not claimed for every de Rham representation. |
| §2.2 central zeta class | Kato Theorem 12.5(1), p. 221, Kato lines 4053–4071 | The actual coefficient-linear morphism, complex-conjugation relation, critical exponent and interpolation on rational vectors. No unrestricted embedding of a completed coefficient field into ℂ is inferred. |
| §2.3 central class is a basis | BT proof of Theorem 3.1, p. 6, BT lines 240–245 | Vanishing of localized H² and the characteristic-ideal equality force length zero of the rank-one quotient. The equality is an explicit input. |
| §3.1 reciprocity detects nonvanishing | Kato Theorem 12.5(1), p. 221, Kato lines 4053–4071; BT lines 245–249 | The signed central period detects the p-depleted value. Nonzero product implies the full value is nonzero; no prior division by an unchecked Euler factor is used. |
| §3.2 converse under rational Kato equality | BT Remark 3.2, p. 6, BT lines 251–252, following Theorem 3.1 | The deduction applies to elliptic newforms when the rational Kato equality is supplied. It does not assume CM in the conditional result. |
| §4.2 all-prime elliptic converse over K | BT Theorem 1.1, p. 1, BT lines 39–43; proof p. 6, lines 253–259 | Any prime and any CM order, with all CM defined over K. The typed comparison in this roadmap repairs the source's abbreviated display; see Source issues. |
| §4.3 rational Selmer doubling | BT proof of Theorem 1.1, p. 6, BT lines 260–261 | Doubling when the curve descends to ℚ. The expanded proof uses rational Shapiro and a self-twist isogeny, not an integral splitting at two. |
| §4.4 rational analytic-order doubling | BT proof of Theorem 1.1, p. 6, BT lines 260–261 | Full analytic-order doubling without a rank restriction. The native formulation is valid subject to the declared full-factorization supplier contract; omission from Lean is R02. |
| §4.5 elliptic converse over ℚ | BT Theorem 1.1, pp. 1, 6; BT lines 33, 39–42, 260–261 | Every prime, including two, and no good-reduction or maximal-order restriction. |
| §5.1 even Goldfeld proposition | BT Theorem 1.2, p. 2, BT lines 47–52 | Fundamental-discriminant half-density and the stronger positive even-family assertion. The two orderings need their separate transfer calculation. |
| §5.2 density one in positive even family | BT Theorem 1.2, p. 2, BT lines 50–52; Theorem 3.3 and deduction, p. 6, lines 265–269 | Positive squarefree n in residues 1,2,3 modulo eight, using the unconditional corank distribution as a supplier gap. |
| §6.1 at least half of CM twists | BT Proposition 1.3, p. 2, lines 58–60; Theorem 3.5, p. 7, lines 273–276; BKLOS §2, p. 2, lines 80–98, Theorem 2.7, p. 5, lines 196–198, and proof pp. 18–19, lines 831–879 | Odd-support-ideal height and three split or ramified. BKLOS's rank statement alone is not substituted for corank zero: the reduced Selmer estimate in its proof and the explicit unconditional supplier gap are the necessary inputs. |

BT is the cited arXiv v2 text; its numbering and page references above are to that version. Kato uses printed pagination. The stronger lower-half assertion for non-descending curves in §6.6 is explicitly derived here: BT Remark 3.6(ii), p. 7, BT lines 279–282, states a positive proportion, not that strengthened constant.

### Computed adversarial pass

The following 47 rows cover all 30 numbered targets, the four Lean definitions, the sampled targets, sign/height/model conventions and both findings. “Pass” means the specified calculation agrees with the statement and its hypotheses; finite examples are not proofs of a density limit. Rows marked conditional retain the declared arithmetic supplier input. The finite counts below count candidate parameters, not L-values.

| Statement or convention | Instances tried | Computed values on the two sides, or positive/negative values | Result; change |
|---|---|---|---|
| Standing domains and ellipticity | Zero ring, 𝔽₂, square-zero thickening; n=0 versus n=1 | The first three have no required number-field structure. Δ(congruentTwist 0)=0; Δ(congruentTwist 1)=64≠0. | Excluded by actual binders/family filters; no change. |
| §0.1 rank-r implication | (corank, analytic order)=(0,0),(0,1),(1,0) | Rank-zero implications have truth values true,false,true respectively; the last is vacuous because its antecedent fails. | Definition distinguishes the false converse instance; no free Selmer predicate added in Lean. |
| §0.1 entire arithmetic L-value definition | Actual continuation F; candidates 0 and 2F | First Dirichlet coefficients are 1,0,2 respectively, so agreement on the half-plane rejects 0 and 2F. | Uniqueness pins the arithmetic value; no change. |
| §0.2 total central sign | k=0,2,4,6 | Sign values +1,+1,−1,+1; for k=2,4,6 multiplication by (−1)^(k/2) gives −1 each time. The total-function k=0 value instead gives +1. | The central claims require even k≥2; boundary not silently used. |
| §0.2 rational projectors | c=diag(1,−1), v=(1,−1); swapping involution on ℤ₂² | e₊v=(1,0), e₋v=(0,−1), sum=v, cross-products=0. For the swap, e₊(1,0)=(1/2,1/2)∉ℤ₂². | Rational sign splitting passes; integral replacement fails. |
| §0.3 determinant and Frobenius | k=2,h=1; geometric roots with product 3 at ℓ=3 | det M=χ⁻¹, det M(1)=χ. Twisted geometric root product is 3/3²=1/3, versus arithmetic determinant value 3. | Inverse-Frobenius distinction preserved. |
| §0.3 dual twist | k=4,h=2 | 1−k+h=−1=1−h. | Central dual convention agrees; no change. |
| §0.4 coordinate and residue | p=3, γ=4,h=1; p=2,γ=5,h=1 | Evaluation gives T=−3/4 and −4/5; T−evaluation vanishes, whereas T itself does not. The quotient is E; p evaluates to p≠0 and is inverted. | Central prime is not augmentation or (p); no change. |
| §0.4 sign component at two | h=1 and h=2 | σ evaluates to −1,+1; σ+1 to 0,2; σ−1 to −2,0. Selected rational idempotent evaluates to 1, the other to 0. | Correct component; the scalar 2 is invertible after rationalization. |
| §1.1 global invariants | Irreducible rank-two modular representation; 1⊕χ as negative control | Invariant dimensions 0 and 1. | Irreducibility excludes the countermodel, including at p=2. |
| §1.2 duality dimension step | Dual invariants zero, central local dimensions (2,1) | Local quotient dimension 2−1=1; global h¹=1, kernel dimension 0. Replacing quotient by zero would leave kernel dimension 1. | Route uses both duality and local hypotheses; conditional on named contracts. |
| §1.2 rational real-place correction | A finite ℤ/2 error, p=2 | (ℤ/2)⊗ℚ₂=0, while the integral error has two elements. | Discarding it only after rationalization is justified. |
| §1.3 central global line | Negative eigenspace dimension 1, H⁰=H²=0; zero representation | 0−h¹+0=−1 gives h¹=1; zero representation instead gives h¹=0. | Zero representation is not the modular rank-two input. |
| §1.4 crystalline fixed-space test | p=2 good central weight; bad weight-two exception; p=3 exception | Relevant absolute values 1/√2,1/2,1/3 are all different from 1. Thus fixed-space dimension 0 and geometric-minus-finite dimension 0. | Includes small/bad primes; no good-prime restriction. |
| §1.4 negative representation control | V=ℚ_p(1) | V*(1)=ℚ_p has crystalline fixed dimension 1; dim H_g¹=2 and dim H_f¹=1. | Shows why equality is not a general de Rham assertion. |
| §2.1 derived control | DVR complex R —π→ R in degrees 1,2 | H¹=0, H²=R/π; after reduction H¹ has dimension 1, supplied by Tor₁(R/π,R/π), also dimension 1. If H²=0, this Tor is 0. | Tor cannot be omitted; actual vanishing comes from §1.2. |
| §2.2 zeta linearity | γ=0,γ,2γ,γ/2 | Images 0,z,2z,z/2; at k=2 the minus projection is killed, at k=4 the plus projection is killed. | Actual morphism and sign select the object; even p=2 permits rational scaling. |
| §2.3 basis via length | A rank-one module, z=πe versus z=e | Quotient lengths 1 and 0 respectively; H² length 0 matches only the second. Wrong sign gives z=0, not a basis. | Equality excludes the nonbasis model; conditional on rational main conjecture. |
| §2.4 non-finite localization | Selmer=0, global basis e≠0; zero class | If e were finite everywhere it would lie in {0}, contradicting e≠0. Zero lies in {0} but is not a basis. | Nonzero basis is essential; unramified conditions away from p retained. |
| §3.1 reciprocity normalization | k=2,4,6 at r=k/2 | Exponents k−r−1 are 0,1,2; factors are 1,2πi,−4π² and signs +,−,+. | Agrees with Kato's formula, not a uniform sign or period. |
| §3.1 Euler-factor implication | P=2,L=3; P=0,L=3 | P·L=6≠0 implies L≠0; P·L=0 in the second case cannot imply nonzero period. | No division by zero; bad-prime factor must be the actual one. |
| §3.2 conditional converse | z↦2z; quotient length 1 versus H² length 0 | Ideal unchanged since 2 is a rational unit; period doubles. Length equality fails for (1,0). | Equality and normalization play distinct roles; no CM hypothesis needed. |
| §3.3 CM cyclotomic-contained cases | ℚ(i),p=2; ℚ(√−2),p=2; ℚ(ζ₃),p=3 | i²=−1; (ζ₈+ζ₈³)²=−2; ζ₃²+ζ₃+1=0. These CM fields are contained in the respective cyclotomic towers. | Named contained-case descent is needed; no disjointness shortcut. |
| §4.1 typed Selmer decomposition | Splitting coefficients, summand dimensions a,b | V_pA has dimension 2 over ℚ_p; its two coefficient-character lines have dimension 1 each. Finite Selmer dimension a+b=0 forces a=b=0. | Distinguishes coefficient extension from Pontryagin duality and Tate twisting. |
| §4.2 elliptic converse over K | Two nonzero central factors; zero-factor negative control | 2·3=6≠0; 0·3=0. Both finite Selmer summands must vanish before invoking their converses. | Product deduction passes, conditional on theta and CM main-conjecture contracts. |
| §4.3 corank doubling | Rational coranks 0,1,2; swapping lattice | K-coranks 0,2,4. Vectors (1,1),(1,−1) have determinant −2, integral index 2, rational index 1. | Rational doubling valid; stale self-twist citation is R01. |
| §4.3 actual-order isogeny | Gaussian order; conductor-three Gaussian order | Norm(i)=1; Norm(3i)=9, and i is absent from ℤ+3ℤi. | Current §1.1 supplies the needed order-sensitive map; R01 repair tested. |
| §4.4 analytic doubling | F=(s−1)^r u, u(1)≠0, r=0,1,2 | Orders of F,F² are (0,0),(1,2),(2,4). The zero function has infinite analytic order and is excluded by first coefficient 1. | Correct unrestricted statement; add native signature, R02. |
| §4.5 rational converse | r=0,1,2, including p=2 | 2r=0 is true,false,false, so only r=0 survives. | Equality is in ℕ, not modulo two. |
| §5.1 even Goldfeld convention | All, none, three-quarters nonvanishing; squarefree n=1,2,3 | Fractions 1,0,3/4 differ from 1/2. Fundamental discriminant pairs are (1,−4),(8,−8),(12,−3). | Ordering changes require the stated transfer, not a bijection preserving height. |
| §5.2 congruent curve definition | n=−1,0,1,2,3 | a₄=−1,0,−1,−4,−9; Δ=64,0,64,4096,46656; j=1728 for nonzero n. | Negative twist symmetry and singular exclusion agree. |
| §5.2 two-torsion versus corank | Curve y²=x³−x | Roots 0,±1 give four rational two-torsion points, dimension 2, while corank can be 0. Root-difference products −1,2,2 are nonsquares over ℚ. | Finite two-descent dimension is not substituted for p∞ corank. |
| §§5.2–5.3 candidate counts | Positive squarefree n≤100000 | Residue counts at 1,2,3,5,6,7 are 10126,10132,10131,10134,10135,10136. Even candidates 30389; total 60794. | Consistent finite check of family arithmetic only; analytic density uses the supplied theorem. |
| §5.3 exact-half transfer | Six equal asymptotic squarefree residue classes | Three permitted classes give 3/6=1/2; the other three have central value 0 by negative root sign. | Negative sign need not mean analytic rank exactly 1. |
| §5.4 fundamental-discriminant transfer | Absolute-discriminant cutoff; even residues 1,2,3 | Paired height weights are 5/4,1/2,5/4, total 3 against total weight 6. At 100000: 30371 even candidates among 60787 discriminants. | Correct asymptotic half; finite counts are not asserted to be exactly half. |
| §5.4 filter and model comparison | d=0,4,9,8; n=2 | Filter rejects 0,4,9 and accepts 8. a₄(d=8)=−64 versus a₄(n=2)=−4; scaling x by 4,y by 8 accounts for factor 16. | Fundamental-discriminant predicate and isomorphic twist convention agree. |
| §6.1 support height definition | ℚ: 2,1/2; ℚ(i): 5,3,2 | H([2])=H([1/2])=2 over ℚ. Over ℚ(i), H([5])=25, H([3])=9, H([2])=1. | Valuation parity, inverse representatives and ramification distinguished. |
| §6.1 height boundary and squareclasses | ℚ(i), X=1 and X=2; classes 1,i | H(1)=H(i)=1. H<1 is empty; H<2 contains both classes. Also [2]=[i], since 2=−i(1+i)² and −1 is a square. | Strict inequality and unit fibres correct; empty small cutoffs do not invalidate eventual statements. |
| §6.1 non-inertness of three | K=ℚ(√−2),ℚ(i),ℚ(ζ₃) | Modulo 3: T²+2 splits; T²+1 is irreducible; T²+T+1=(T−1)². Quotients are 𝔽₃×𝔽₃,𝔽₉,𝔽₃[ε]/ε². | “Ideal (3) not prime” includes split and ramified, excludes inert. |
| §6.1 CM and native twist | y²=x³−x over ℚ(i) versus ℚ(√−2); native parameter t=2 | Endomorphism ranks over ℤ are 2 versus 1, so non-surjectivity holds only in the first. Native twist parameter 4t gives a₄=−64, isomorphic to short-twist a₄=−4. | Field of definition of CM and factor-four twist convention retained. |
| §6.1 lower proportion | N=1000000, ε=0.01 | Required numerator ≥490000; 750000 also satisfies it. For ε≥1/2 the lower bound is nonpositive. | Lower half is not an exact-half claim. |
| §6.2 cube-sum model and maps | n=1,3,0; off-curve point (2,3,1) at n=1 | a₆=−27,−243,0; Δ=−314928,−25509168,0. At the off-curve point F=33 and G(forward)=3564=108·33; inverse-after-forward=(36,54,18)=18(2,3,1). | Polynomial identities pass off the locus as well; n=0 loses invertibility and is excluded. |
| §6.2 pointed comparison | Source origin; affine point (1,1) at n=1 | Origin maps to [0:18n:0]=[0:1:0]; (1,1) maps to (3,0). Pullback X/Y=2z/(3(x−y)) has order 1 at the marked origin. | Marked-place hypothesis distinguishes an unmarked model correspondence. |
| §6.3 full CM and ramified prime | ζ₃ action versus identity; n=1 | α³=1 and 1+α+α²=0; identity would give 3≠0. Polynomial discriminant −3; prime norm 3, square norm 9. | Correct geometric model; full-ring supplier reference needs R01. |
| §6.4 descent definition and cosets | Rational base change; a₄=1,a₆=1+i; exceptional t=√−2 | Identity change gives descent. Second model has j=6912/(4+54i)∉ℚ, hence no descent. For j=1728, t²=−2 gives rational short coefficient +2 but t∉ℚ×K×². | Necessary second coset verified; at j=0, [s]³=[s] forces identity in the exponent-two quotient. |
| §6.5 quantitative count | Empty descent set; rational primes 3,5 over ℚ(i); X=10⁶ | Empty count 0≤1·√X. Heights 9,25 equal ℓ²; ramified 2 has height 1. Two coset bounds C√X add to 2C√X; √X/X=0.001. | General square-root bound passes these tests; native signature missing, R02. |
| §6.6 deleting descending twists | Total 10⁶, at most 1000 descending; original numerators 500000 and 750000 | Remaining numerators ≥499000,749000, proportions ≥0.499,0.749. Restricted denominator ≥999000; its ratio to total tends to 1. | Loss tends to zero, so lower-half survives for both denominators. |

The zero ring, positive-characteristic and nonreduced examples are excluded at the carrier level, rather than tested by meaningless substitution into a number-field theorem. The source arithmetic hypotheses similarly exclude reducible “modular” countermodels. The rational local algebra uses a characteristic-zero coefficient field after inverting p; it does not transfer an integral ℤ_p identity to an arbitrary ramified DVR without that step. No purported conclusion about integral splitting at two, exact half-density for all CM curves, or rational cube sums varying n was found.

### Pinned-library and ownership audit

The opened pins are Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. Main-roadmap context was `929496d4221b974c60787257a3cdc28b600fc49c`. The table gives 21 groups of declarations opened by object, not just a search for proposed names. Paths beginning Mathlib or TauCeti are relative to the respective pinned library.

| Pinned file and line | Declaration/object checked and consequence |
|---|---|
| `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:76`, 131, 230, 366, 388 | WeierstrassCurve is a five-coefficient structure; Δ, map, IsElliptic and j are separate. The bare carrier does not assert nonsingularity. |
| `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:44`, 79, 84 | localPolynomial, LFunction and LSeries retain the actual finite-prime factors. The raw series is not its entire continuation; the roadmap correctly supplies an agreement predicate. |
| `Mathlib/NumberTheory/NumberField/Basic.lean:101` | RingOfIntegers is the actual integral closure, not an arbitrary order chosen by the user. |
| `Mathlib/NumberTheory/Cyclotomic/Basic.lean:652` | CyclotomicField supplies the splitting-field carrier. |
| `Mathlib/NumberTheory/NumberField/Cyclotomic/Basic.lean:56`; `Mathlib/NumberTheory/NumberField/Cyclotomic/Ideal.lean:83`, 106, 124 | discr_odd_prime', absNorm_span_zeta_sub_one, map_eq_span_zeta_sub_one_pow, ramificationIdx_span_zeta_sub_one. The first is a power-basis discriminant statement; identifying the field discriminant also needs the integral-basis dictionary. |
| `Mathlib/RingTheory/DedekindDomain/Factorization.lean:309`, 596 | FractionalIdeal.count and finite_factors support signed valuation parity and finite support. Junk value at the zero ideal cannot enter via a unit representative. |
| `Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean:258` | Ideal.absNorm is the relevant finite quotient-cardinality norm, with its required arithmetic hypotheses. |
| `Mathlib/NumberTheory/ModularForms/LFunction.lean:134`, 190 | ModularForm.L and CuspForm.differentiable_L provide the native analytic modular L-function at positive weight. |
| `Mathlib/Analysis/Analytic/Order.lean:523`, 528 | analyticOrderAt_mul and analyticOrderNatAt_mul; the latter needs finite orders, so a zero-function stand-in would be invalid. |
| `Mathlib/Analysis/Analytic/Uniqueness.lean:234`; `Mathlib/NumberTheory/LSeries/Injectivity.lean:124` | AnalyticOnNhd.eq_of_eventuallyEq and LSeries.tendsto_atTop support uniqueness and nonzero continuation from first coefficient 1, with analyticity/convergence hypotheses. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean:169`, 411, 739 | quadraticTwistOf, ellipticity for nonzero discriminant parameter, and generic twist classification. The generic classification excludes j=0,1728; §6.4 separately handles both. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/ShortWeierstrass.lean:109`, 168 | shortCurve and smul_shortCurve; changes scale short coefficients by inverse fourth/sixth powers. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/NormalForms.lean:131`, 140 | variableChange_a₄_of_isShortNF and variableChange_a₆_of_isShortNF, with the characteristic restrictions satisfied over ℚ-algebras. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Basic.lean:106`; `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Ring.lean:174` | The native pointed algebraic hom carrier and its endomorphism ring, including the zero map. This makes the non-scalar-endomorphism CM hypothesis a real condition. |
| `TauCeti/FieldTheory/SquareClassGroup/Basic.lean:45`, 66 | SquareClassGroup is the additive form of the units quotient by squares; squareClass_toMul_out recovers the quotient class of the chosen unit representative. |
| `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:84`, 104 | EigenformAwayFromLevel requires nonzero; Newform additionally includes newness and first coefficient 1. These do not contain a modular Galois realization. |
| `TauCeti/NumberTheory/ModularForms/Newforms/AnalyticInvariants.lean:72`, 80, 107 | analyticOrderAt_L_ne_top, analyticRank, analyticRank_eq_zero_iff. Analytic rank itself is available, unlike the required p∞ Selmer carrier. |
| `TauCeti/NumberTheory/ModularForms/LFunction/EulerProduct.lean:217` | Newform.L_eulerProduct, including bad-prime factors through the zero-extended character convention. |
| `TauCeti/NumberTheory/ModularForms/LFunction/FunctionalEquation.lean:324` | CuspForm.frickeCompletedL_functional_equation requires the actual normalized Fricke companion; it does not itself compute congruent-number root signs. |
| `TauCeti/NumberTheory/ModularForms/Conjugate.lean:309`; `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145` | CuspForm.conj and the inverse-limit completed group algebra exist. Neither is the missing all-place zeta/interpolation comparison. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean:104`; `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroupA.lean:129` | selmerGroup₂ and selmerGroupA concern finite two-descent. They are not the classical p∞ group or Bloch–Kato finite Selmer carrier needed by §§3–4. |

Object searches used the roadmap service over main and indexed open heads, plus the board packages and the provided sibling worktrees. The searched objects included central Kato specialization, rank-zero converse, CM induction, squareclass support height, descending quadratic twists, and the five Lean theorem names. There is no second declaration of this file's fully qualified namespace/name combination in the searched roadmaps. Ownership against open work was checked; it was not inferred from main alone.

The general squareclass support-height and density machinery belongs to ArithmeticStatisticsPartI §§0.1, 0.5–0.7, 0.15. The four small native definitions here make the headline signatures possible; they do not schedule a second construction of that machinery. RankZeroOneBSDPartII consumes this roadmap's converse instead of owning it. Generic duality, control, regulators, induction, CM characters and unconditional statistical inputs remain suppliers. The work owned here is the central specialization/nonvanishing deduction and its elliptic and density applications. No mathematical re-planning of an existing roadmap or computational algorithm was found.

### Supplier resolution and declared gaps

I read every supplier subsection and every *Needs:* line. The following 16 resolution groups cover the cross-roadmap contracts; the cited section's mathematics, not merely its heading, was compared with the use here.

| Supplier | Resolved input and boundary |
|---|---|
| ModularForms, Layer 7 | Analytic modular L-functions and Euler products; coefficient-conjugate/all-place central identities remain the explicit gap. |
| EllipticCurves, Layers 1–2 and 5 | Actual pointed isogenies, Tate functoriality and quadratic twists. No integral p=2 splitting is imported. |
| AlgebraicCurves, Layer 10 | Function fields and pointed degree-one places; the plane-cubic comparison is the separate declared contract. |
| PadicMeasuresIwasawaAlgebras | Completed-group-algebra character evaluation and rational component/localization inputs. |
| AutomorphicGaloisRepresentations §§1.5, 4.4–4.8, 6.1, 6.4, 7.2 and CM comparison | Cohomological dual/Frobenius convention, compatible realizations, weight-two comparison, local factors and purity. The determinant check above distinguishes the Tate convention. |
| ArithmeticGaloisDuality R02.4.3–R02.4.4 and D7.3, D7.5–D7.7 | Finite/global duality, Euler characteristic, compact cochains and rational dual conditions. The precise Kato j_* complex and real-place errors remain the stated extra contract. |
| SelmerIwasawaCohomology §§2.10–2.12a, 2.15, 2.19–2.20; §§3.0, 3.6–3.7, 3.10, 3.13–3.16; §§4.9, 4.26 | Corank, local conditions, twisting, semilocal Shapiro, derived Tor and lattice/Kummer comparison. The H³ Tor term cannot be erased before the amplitude input. General §3.13 hypotheses do not themselves solve the dyadic j_* case. |
| PadicHodgeRegulators §§1.1, 1.4–1.8 | Dual exponential has kernel H_g¹; the dimension comparison with H_f¹ and dual crystalline fixed space is required. Local Shapiro and twist compatibility use these same maps. |
| ModularIwasawaMainConjectures §§0.6–0.7 | Actual rational Iwasawa complex, rank-one input and rational characteristic-length formulation; not an unconditional proof of all-prime CM equality by itself. |
| ModularIwasawaMainConjecturesPartII CZ.4–CZ.6 | Resolved against `packages/ModularIwasawaMainConjecturesPartII/design/README.md:143`, 159, 182. Its ownership index names cm-contained-descent at 173 and cm-kato-main-conjecture/normalization-dictionary at 195–197. CZ.4 retains conductor corrections and imports the canonical CMAllPrimeMainConjectures contract. This is a design-contract resolution, not a readable merged implementation. |
| GL2AutomorphicRepresentationsAndTransfer R17.4.16 | Quadratic automorphic induction, distinct conjugate character condition for cuspidality, full L-identity. Distinct infinity types supply that condition. |
| ComplexMultiplicationAndExplicitReciprocity §§1.1, 4.1–4.2 | Actual CM characters and full factors are present. The rational self-twist is in §1.1; full lattice-order ownership moved to ImaginaryQuadraticClassNumber §H3.1. R01 records the inconsistent consumer citations. |
| ImaginaryQuadraticClassNumber §H3.1 | Resolved the replacement all-order complex lattice/elliptic dictionary and full endomorphism order, at `README.md:83`–87. |
| EllipticCurveModularity R29.3–R29.6 | Actual newform attachment, coefficient comparison, convergence and continuation. Full quadratic base-change factorization and the explicit congruent-number root signs remain declared gaps. |
| ArithmeticStatisticsPartI §§0.1, 0.5–0.7, 0.15 | Families, odd-support height, finite fibres, residue and discriminant transfers, and a positive linear denominator. Finiteness alone is not substituted for c_KX+o(X). |
| ArithmeticStatisticsPartVII §§5.9–5.11 | The positive-family Smith transfer still assumes its distribution law; the three-isogeny numerator still retains its counting input. The two unconditional corank contracts are therefore substantive, not requests to duplicate existing unconditional theorems. |

KatoEulerSystems is the outstanding access limitation described below. Its absence is not silently converted into a new defect already settled by the earlier repair.

All thirteen gap slugs in the brief occur both in the plan's gaps list and the README's exact supplier contracts. Each names an owner; none uses supplier “none”. The package does not use a declared gap as if it were an already proved theorem.

| Declared gap | Audit |
|---|---|
| all-coefficient-places-zeta | Specifies the actual all-place morphism, its conjugation law and compatible central interpolation. The supplied-range/minimality boundary cannot be fully rechecked without KatoEulerSystems; no contrary duplicate was found at the pins. |
| newform-central-analytic-interface | Specifies the same newform's conjugate continuation and full p-factor, including bad primes; native L and conjugation carriers alone do not supply that whole comparison. |
| elliptic-quadratic-analytic-identities | Entire full-factorization identity with every conductor/ramified factor; the needed base-change assertion is stronger than rational modular attachment. |
| congruent-number-root-numbers | Explicit analytic sign of the indicated family. SelmerIwasawaCohomology's isogeny/parity sign input is not already this Fricke sign formula. |
| pointed-cubic-model-comparison | Specifies source and target function fields, invertible projective map, both marked points and their places. The marking excludes the (1,1) negative control. |
| kato-rational-duality | Precise j_* convention, amplitude, Euler characteristic and retained integral real-place terms describe one coherent comparison contract. |
| central-jstar-control | Actual complex, finite generation and both degree-one and degree-two Tor sequences; the H³ term is explicitly present. |
| finite-condition-shapiro | General finite extension and representation, semilocal conditions at every place, including unramified away from p; not merely abstract global Shapiro. |
| central-modular-local-dimensions | Both conjugate forms, all primes and critical r; the bad weight-two character exception is explicit. |
| theta-induction-arbitrary-cm-curve | Removes rational descent from the rational CM comparison, with both characters and central Tate twist; the existing rational target does not already give this range. |
| cube-sum-full-cm | The field-of-definition descent is additional to the geometric full ring. Its premise points to a stale section and must be updated as part of R01. |
| smith-unconditional-positive-corank | Requests discharge of the Smith-law premise for the specified positive residue family, rather than re-proving its conditional density transfer. |
| cm-three-selmer-unconditional | Requests discharge of the retained counting premise for actual CM 3∞ corank, with nonmaximal orders and non-inert three. Rank zero alone would be too weak. |

The several compatibility clauses in a gap concern its single exported morphism or comparison; they do not introduce unrelated tasks. No cycle or upward supplier was found. The report does not require completing the thirteen gaps before approving this roadmap's plan once the findings are repaired.

## Not verifiable

- **KatoEulerSystems section contents.** The roadmap service has no readable main or open-roadmap copy of this supplier. The board package has source/review material but no readable target README supplying §§2.2, 4.4, 4.6, 5.1, 5.3 and 7.2. I checked the service result, main context and package material. Consequently I cannot certify its asserted already-supplied range or the minimality boundary of the all-place extension. Kato's original text is readable and supports the mathematics checked above. The earlier repair marked this unavailable supplier interface not actionable in this package; the present review does not re-raise it without evidence that that reason is wrong.
- **Implementation status of the Part II CM main-conjecture supplier.** The CZ target names were resolved in its board design ownership index, as detailed above; there is no readable main/open README for independent comparison of an implemented export. This limits what “resolved” means here. Its named contract is not evidence that the all-prime equality has already been formalized.
- **Legal-source access:** none of the three cited works was inaccessible. No additional text request is needed. The source checks and finite calculations do not constitute formal proofs of the admitted headlines or discharge any declared gap.

## Source issues

- **Error** in BT at proof of Theorem 1.1, arXiv v2 p. 6 (BT line 256): the source says the Pontryagin-dual Selmer module tensored with K identifies with untwisted modular finite Selmer spaces; it should be the rational Tate-module Selmer comparison over a p-adic splitting field, with central twists and conjugate summands; affects the proof.

