# CMRankZeroConverse repair report

## F01 (P2) — applied

Five omitted density headlines → native-curve statements with unique entire continuation, plus the statable analytic-order doubling and descent-count headlines. Added three simple definitions and their README APIs and Checks. Updated Scope, §§0.1, 4.4, 5.2–5.4, 6.1, 6.5–6.6 and the module docstring. The two geometric headlines remain inputs to the applications. Evidence: BT line 50, BT line 58, BT line 260.

## F02 (P2) — applied

Missing newform analytic function and finite order → pinned Mathlib and Tau Ceti declarations, with their hypotheses. Narrowed the README and plan gap to coefficient conjugation, the entire removed-factor identity and theta compatibility. Updated Scope, the module docstring and §§3.1, 4.2, 4.4. Evidence: ModularForms/LFunction.lean:134,190; Newforms/AnalyticInvariants.lean:72,80,107; LFunction/EulerProduct.lean:217; LFunction/FunctionalEquation.lean:324; Conjugate.lean:298.

## F03 (P2) — applied

KatoEulerSystems as equality supplier → ModularIwasawaMainConjecturesPartII §§CZ.4–CZ.6, retaining gap:cm-rational-kato-equality. Updated Scope, supplier contracts, §3.3 and the plan gap. KatoEulerSystems excludes equalities; the named supplier's design §CZ.6 contains the endpoint and normalization dictionary, with §CZ.4 conductor corrections and independent §CZ.5 module structure. It precedes this package at merge-order positions 215 and 281.

## F04 (P2) — applied

Model-specific CM request plus cyclotomic arithmetic → general characteristic-zero j=0 endomorphism-ring contract. Kept the slug, specialized the contract through j=0 in §6.3, and cited pinned discriminant, prime-norm and ramification results. Updated both gap copies and §6.3's route. Evidence: Cyclotomic/Basic.lean:56; Cyclotomic/Ideal.lean:83,106,124. At p=3 these give −3, norm 3 and index 2.

## F05 (P2) — applied

Bundled cubic comparison and exceptional-j classifications → general pointed projective-linear comparison only. Updated both gap copies, Scope, the EllipticCurves contract and §§6.2, 6.4. The exceptional classifications use native short-form scaling, with regularity of two and three. Evidence: EllipticCurves Layer 5; Tau Ceti NormalForms.lean:131,140 and ShortWeierstrass.lean:168. The cubic comparison remains an explicit supplier gap.

## F06 (P2) — applied

Supplier-owned product additivity → pinned analytic-order multiplication theorems. Deleted that clause from both gap copies and added the declarations and finite-order hypotheses under Mathlib and in §4.4's route. Evidence: Mathlib Analysis/Analytic/Order.lean:523,528. The square of a function with central order r has order 2r; r=0,1,2 gives 0,2,4.

## F07 (P3) — applied

Earlier RankOneConverse as consumer → later RankZeroOneBSDPartII in Scope and Downstream consumers. RankOneConverse retains its rank-one ownership. Evidence: merge-order positions 251,281,282 and RankZeroOneBSDPartII's design import of CMRankZeroConverse:C.0/p-converse-property. No merge-order file or other roadmap changed.

## F08 (P3) — applied

Attribution of the half lower bound to Remark 3.6(ii) → explicit distinction between its positive-proportion statement and the half bound derived from §§6.1, 6.5. Updated the §6.6 locator and stated its native headline. Evidence: BT line 279 through BT line 282; subtracting O(√X) from a numerator over cX+o(X) loses a ratio tending to zero.

## F09 (P3) — applied

Five-field cube-sum constructor → specialization of WeierstrassCurve.shortCurve with coefficients 0,−27n². Added its used module import and README citations. Evidence: Tau Ceti ShortWeierstrass.lean:109. The targeted module build succeeded. Recomputed all cube-sum coefficients, discriminants, substitutions, origins and inverse scalars; their values are unchanged.

## F10 (P3) — applied

Request to extend all of CM §4.2 from rational curves → request only for theta newforms and their L-function/central-realization comparison without rational descent. Cited ellipticCMLFactorization for the existing all-prime A/K factorization. Updated both gap copies, supplier contracts and §4.2's route. Evidence: ComplexMultiplicationAndExplicitReciprocity §4.2 distinguishes ellipticCMLFactorization from the rational-curve cmInductionComparison.

## F11 (P3) — applied

Incomplete list of contained CM fields → include ℚ(√−2) at two in the Kato contract and §3.3 Check. Evidence: Kato line 5731 through Kato line 5734 covers K⊂ℚ(μ_p∞); for ζ₈⁴=−1, (ζ₈+ζ₈³)²=ζ₈²−2−ζ₈²=−2. This adds a README boundary witness, with no Lean padding.

## Verification outcomes

- Targeted build: `lake build TauCeti.AlgebraicGeometry.EllipticCurve.ShortWeierstrass` succeeded, exit 0. It built the requested module and its missing TwoPowMulThreePow prerequisite; completion reported 1927 jobs. The other four imported modules had object files.
- Acceptance elaboration: `lake env lean` on `packages/CMRankZeroConverse/Suggested.lean`, from the pinned content checkout, succeeded, exit 0. Exactly nine warnings, all “declaration uses sorry”; no errors, option overrides or admitted data. The initial draft exposed a missing NumberField namespace and placement of docstrings before local opens; both were corrected before this successful run.
- Signature audit: a single scratch copy containing `#check @name` for all 14 declarations elaborated, exit 0, with the same nine intended warnings. Every elaborated type was compared with its README statement; no binder disappeared. The five definitions and nine headline theorems agree with the README, including the negative-rational quadratic-field witness in the original coset theorem, the dimension-two/totally-complex hypotheses in the new field statements, all ellipticity and CM hypotheses, and the strict support-height cutoff. No existing declaration was renamed or deleted.
- Dependency direction: the prescribed command, with `--depcheck`, `--name CMRankZeroConverse`, the supplied order and `--movable`, exited 0. Its complete output was:

```text
depcheck: 46 roadmaps, 497 edges, 0 problem(s)
```

- No UPWARD, CYCLE or moved line was emitted. No gate failures were supplied in the brief.
- `git diff --check` passed. A structural comparison with the original plan confirmed that only its top-level gaps array changed. All 13 slugs, suppliers and needs sentences match their README contracts. Metadata and sources manifests are unchanged. No change was committed.

## Sources, citations and ownership

The content checkout is main ae2562cd6d39ddeac99ac18bdf78e6e46a068586. Its manifest pins Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039; both package checkouts match those commits. All cited library files were read at those pins. The raw elliptic L-series uses minimal-model factors, including bad primes (Mathlib AlgebraicGeometry/EllipticCurve/LFunction.lean:39–85). Entire continuation is uniquely specified by half-plane agreement (Analysis/Analytic/Uniqueness.lean:234); this does not evaluate the raw total series at one.

The retained missing-carrier statements were checked by object searches at the pins. Tau Ceti's MordellWeil/SelmerGroup.lean defines finite two-descent Selmer conditions, and SelmerGroupA.lean defines S-unit squareclass conditions. Neither supplies the classical p∞ or Bloch–Kato carriers used here. ModularForms contains the entire L-function but no CM-newform or Kato zeta carrier. These distinctions account for the remaining docstring omissions.

The legal cached BT, Kato and BKLOS extractions were read at every used locator. All citations remain to their manifest versions. In particular the new density statements use BT line 50, BT line 58, BT line 265 and BT line 273; the full-CM application uses BT line 277; the source/proved-bound distinction uses BT line 279. The statistical Selmer-strength route was reread at BKLOS line 654 through BKLOS line 661 and BKLOS line 831 through BKLOS line 879. No new work was cited, no reference is missing, and no source extraction or source passage was copied into the repository.

Read EllipticCurves, ModularForms and ComplexTori on main for roadmap shape. Used `roadmaps grep` by object over main and the indexed open heads, `roadmaps show` for the relevant suppliers, and searches in board designs. Generic squareclass height and denominator theory remain with ArithmeticStatisticsPartI §§0.5, 0.15; statistical numerator theory remains with ArithmeticStatisticsPartVII §§5.9–5.11. The three simple new acceptance definitions express native objects without claiming those suppliers' theories. No fully qualified declaration name was copied from another roadmap. The converse deductions, explicit cube-sum specialization, and descent-coset/count application have this package as owner.

Revalidated the following cross-roadmap sections against the supplied heads or main, reading the mathematical contracts as well as their headings:

| Supplier | Sections and evidence used |
| --- | --- |
| ModularForms, main | Layer 7; only the narrowed central analytic compatibility remains requested. |
| EllipticCurves, main | Layers 1, 5, 7; Layer 5 classifies pointed twists and constructs quadratic twists, without explicit exceptional quartic/sextic classification. |
| AutomorphicGaloisRepresentations, indexed head | §§1.5, 3.15, 4.4–4.8, 6.4, 7.2: cohomological normalization, CM, irreducibility, all-prime factors and purity. |
| SelmerIwasawaCohomology, indexed head | §§2.4, 2.10–2.12a, 2.19–2.20, 3.0, 3.7, 3.10, 3.13–3.16, 4.9, 4.26, 4.29. Exact Kato-complex extensions remain gaps. |
| ArithmeticGaloisDuality, indexed head | §§R02.4.3–R02.4.4, D7.3, D7.5–D7.7: compact Shapiro and rational/local-condition duality. |
| ArithmeticStatisticsPartI, indexed head | §§0.1–0.2, 0.5–0.7, 0.15, including its Positive squareclass denominator target and the congruent discriminant weights. |
| ArithmeticStatisticsPartVII, indexed head | §§5.9–5.11: Smith-law deduction and conditional CM numerator; both unconditional supplier gaps remain explicit. |
| ComplexMultiplicationAndExplicitReciprocity, indexed head | §§1.2, 4.1–4.2: self-twist, CM components, ellipticCMLFactorization and cmInductionComparison. |
| EllipticCurveModularity, indexed head | §R29.6, Continuation and the functional equation: actual elliptic L-series comparison on Re(s)>3/2. |
| KatoEulerSystems, board head 5fb6ef4 | §§2.2, 4.4, 4.6, 5.1, 5.3, 7.2; its admissibility scope and explicit exclusion of equalities were retained. |
| PadicHodgeRegulators, supplied board head 5eff35d | §§0.1, 1.1–1.8: Tate convention, dual exponential, finite/geometric dimensions and local comparison. |
| ModularIwasawaMainConjecturesPartII, board design | §§CZ.4–CZ.6: conductor-corrected rational input, independent CM structure, equality and dictionary. The supplier is still a gap, not asserted to be implemented. |
| RankZeroOneBSDPartII, board design | Imports the rank-r proposition and CM end theorems; later in the order. |

The citation resolver reports the three board-only suppliers KatoEulerSystems, PadicHodgeRegulators and ModularIwasawaMainConjecturesPartII as absent from main/open roadmap heads. Their supplied board copies above settle these leads; they were not mistaken for missing mathematics. The resolver also says it did not inspect pinned packages from the board checkout; the direct pin audit above supplies that check. Its Lean-name missing list is empty. RankZeroOneBSD in the historical opening is context, with no supplier contract or imported declaration.

## Adversarial mathematics pass

Each row records exact calculations, conditional dimension calculations, or asymptotic leading constants. They test the statements and their advertised routes; they do not claim proofs of admitted theorems. All existing Checks and worked examples were reconciled with the new definitions. General fields, bad primes and nonmaximal orders remain in scope; finite denominators and their eventual positivity come from their named owners.

| Statement | Instances tried | Values computed on both sides or against the wrong model | Result | Change |
| --- | --- | --- | --- | --- |
| Number-field and ellipticity conventions | ℚ; imaginary quadratic; n=0 | ℚ-dimensions 1 and 2; only dimension 2 plus total complexity qualifies; Δ(0)=0 is not a unit | No zero-ring or characteristic-p input enters number-field headlines | Native field hypotheses explicit |
| Cohomological Frobenius convention | k=2, αβ=ℓ | det M_f=κ⁻¹; geometric central roots α/ℓ,β/ℓ have product 1/ℓ; arithmetic determinant is ℓ | Coherent with supplier dictionary | None |
| Central dual twist | k=4,h=2 | 1−k+h=−1=1−h; h−1 would give −2 | Correct dual exponent | None |
| Tate period convention | p=2,3 | φ(t⁻¹⊗v)=p⁻¹(t⁻¹⊗v), eigenvalues 1/2,1/3 | Correct inverse Frobenius | None |
| §0.1 rank-r proposition and API | (corank,rank)=(0,0),(0,1); r=0,1 | Implications true,false at r=0; (0,1) gives true vacuously at r=1; rational two-torsion forces dim Sel₂≥2 | Direction and corank distinction preserved | Consumer corrected |
| ellipticLNonvanishingAtOne and uniqueness API | n=1,5; F,2F,0 | n=1 value≠0; sign −1 at n=5 forces 2F(1)=0; first series coefficients 1,2,0 distinguish F,2F,0 | Agreement fixes the actual entire function | Added definition and Checks |
| §0.2 total sign | k=0,1,2,3,4,6 | ε=1,1,1,1,−1,1; ε(−1)ʰ=−1 at k=2,4,6 and +1 at k=0 | Arithmetic domain even k≥2 necessary | None |
| §0.2 projection API | c=diag(1,−1), v=(1,−1); dyadic swap | P₊v=(1,0), P₋v=(0,−1); sum=v; swap gives P₊(1,0)=(1/2,1/2) outside ℤ₂² | Rational, not integral, projection | None |
| §0.3 realization dictionary | k=2,4 | det M_f(1)=κ; k=4 dual exponent −1 on both sides | Tate twist and conjugate dual agree | None |
| §0.4 central evaluation/kernel | h=1,2; p=3,c=4 | ev(σ₋₁)=−1,+1; ev(σ₄)=1/4 at h=1; ev(σ₄−1/4)=0 whereas ev(σ₄−4)=−15/4 | Negative exponent required | None |
| §0.4 selected rational component | p=2,h=1,2 | σ₋₁+1 or σ₋₁−1 evaluates to 0; the other evaluates to −2 or 2, invertible after rationalizing | Correct component before DVR localization | None |
| §1.1 global invariant vanishing | irreducible rank two; 1⊕κ | Invariant dimensions 0 and 1; only the first qualifies | No reducible representation admitted | None |
| §1.2 duality deduction | h⁰=h²=0; local quotient 2−1 | −h¹=−1 gives h¹=1; kernel dimension 1−(2−1)=0; a quotient of dimension 0 would leave kernel 1 | Both Poitou–Tate steps needed | None |
| §1.2 real correction at two | ℤ/2 before/after rationalizing | Cardinality 2 integrally, dimension 0 over ℚ₂ | Dyadic terms retained until rationalizing | None |
| §1.3 global line | negative eigenspace dimensions 1,0 | h¹=1,0 from Euler values −1,0 | Rank-two oddness selects the line | None |
| §1.4 geometric equals finite | p=2,3 central eigenvalues; ℚ_p(1) | Moduli 1/√2,1/2,1/3 are <1; ℚ_p(1) has dim H_g=2, dim H_f=1 | Central purity excludes the negative control | None |
| §2.1 control with Tor | R→R via π | H²=R/π; derived specialization has Tor₁=R/π of length 1 in degree one; vanishing H² gives length 0 | Correct order of Nakayama and Tor removal | None |
| §2.2 zeta map, scalar and sign APIs | γ=0,γ,2γ; h=1,2 | z(0)=0, z(2γ)=2z(γ); specialization sign −(−1)ʰ=+1,−1; wrong eigenspace gives z=−z=0 | E-linearity and projection fixed | None |
| §2.3 basis under equality | DVR quotient 0 or R/π | Characteristic ideals (1),(π); lengths 0,1; only length 0 can equal the vanishing H² divisor | Divisibility alone insufficient | Equality owner corrected |
| §2.4 nonfinite localization | global line E versus zero Selmer space | Nonzero basis has dimension-one span and cannot lie in dimension-zero subspace; zero class is finite everywhere | Class-specific contradiction valid | None |
| §3.1 explicit reciprocity | k=2,4,6 | h−1=0,1,2; factors 1,2πi,(2πi)²; signs +1,−1,+1 | F-rational period route and exponents agree | Native L-function cited |
| §3.1 removed factors | P=0 or P=3/5 | 0·L=0 never nonzero; (3/5)L≠0 forces L≠0 without inversion of P | No division by zero | Gap narrowed |
| §3.2 conditional converse | localized quotient lengths 0,1 | Length 0 gives basis; length 1 fails equality when H²=0 | Hypothesis does not contain the conclusion | None |
| §3.3 all-prime CM converse | ℚ(i),ℚ(√−2),ℚ(ζ₃),ℚ(√−7) | Containment levels 4,8,3,7; at level 8, (ζ+ζ³)²=−2; p values 2,2,3,7 | Contained-field cases all included | Added √−2 Check and equality supplier |
| §4.1 typed CM comparison | ηη̄=κ; dyadic order conductor 2 | η̄=η⁻¹κ; Ind η⁻¹ and Ind η̄ determinants differ by κ²; a faithful extension multiplies zero dimension by its degree to give 0 | Central twist necessary, integral freeness unnecessary | Theta-only gap |
| §4.2 CM elliptic nonvanishing | two nonzero central factors | (2+3i)(2−3i)=13≠0; a zero factor would give 0 | Full Hecke factorization and theta comparison separated | Source ownership corrected |
| §4.3 rational corank doubling | coranks 0,1; dyadic swap lattice | 0→0,1→2; determinant of columns (1,1),(1,−1) is −2, integral index 2 | Rational doubling survives finite dyadic errors | None |
| §4.4 cm_analyticOrder_double | local order r=0,1,2 | (s−1)ʳu squared has orders 0,2,4; u(1)²≠0 | Native curve/CM hypotheses determine F,G | Added headline; cited product-order API |
| §4.5 rational rank-zero converse | 2r=0 in ℕ, including p=2 | r=0 is the only solution; r=1 gives 2≠0 | No reduction modulo p | None |
| §5.1 even Goldfeld definition/API | limiting proportions 0,1,3/4 | Each differs from 1/2; 3/4 still has lower bound ≥1/2 | Exact limit distinguished from lower bound | None |
| congruentTwist coefficients and API | n=0,1,−1,2 | a₄=0,−1,−1,−4; Δ=0,64,64,4096; wrong a₄=−n gives 512 at n=2 | Correct signed twist and singular boundary | Added native short-form definition |
| §5.2 congruentNumber_densityOne | roots 0,1,−1; three even residues | Obstruction products −1,2,2 are nonsquares; rational torsion cardinality 4; leading numerator and denominator both 3/π² | Corank-zero route gives relative limit 1 | Added headline |
| §5.3 congruentNumber_half_positive | six squarefree residues | Each has mass 1/6; allowed mass 3/6=1/2; sign −1 yields F(1)=−F(1)=0 | Upper and lower bounds agree | Added headline |
| §5.4 discriminant predicate | d=1,−4,8,−8,12,−3; d=0,4,9 | First six accepted; last three rejected; squarefree n=1,2,3 yield pairs (1,−4),(8,−8),(12,−3) | Both directions of family description agree | Added filter explanation and Checks |
| §5.4 twist scaling | d=8=4·2 | a₄(E₂)=−4, a₄(E₈)=−64=2⁴·(−4); Y scales by 2³ | Discriminant-indexed model has intended L-function | Added scaling witness |
| §5.4 congruentNumber_half_discriminants | odd/even cutoff weights | Allowed 5/4+1/2+5/4=3; full 4·5/4+2·1/2=6; ratio 1/2 | Piecewise height comparison preserved | Added headline |
| Empty cutoffs in density theorems | X=0 | Positive and discriminant counts both 0; Lean ratio 0/0=0; limits concern X→∞ with positive denominator | No theorem asserts finite-cutoff ratio 1/2 | Explained eventual denominator |
| squareclassHeight and representative API | [2],[1/2] over ℚ; multiplication by squares | Valuations 1,−1 are both odd; heights 2,2; adding 2v(u) preserves parity | Negative valuations retained | Added definition and Checks |
| squareclassHeight finite-support and unit APIs | ℚ(i), [1],[i],[5],[3],[2] | Heights 1,1,25,9,1; [2]=[i]; H<1 has count 0 | Height one is not a singleton; finite product has no zero representative | Added Checks |
| §6.1 native CM hypothesis | scalar endomorphisms; ζ₃ action | End=ℤ makes ℤ→End surjective, so hCM false; ℤ[ζ₃] has ℤ-rank 2, so hCM true | Any CM order allowed, not only maximal | Native predicate explained |
| §6.1 non-inert-three hypothesis | ℚ(i),ℚ(√−2),ℚ(ζ₃) | Mod-three rings are 𝔽₉, 𝔽₃×𝔽₃, 𝔽₃[e]/(e²); cardinalities 9 each, primality true,false,false | Split and ramified included, inert excluded | Added split-three witness |
| §6.1 cmTwists_nonvanishing_lowerHalf | hypothetical lower ratios 1/2,3/4; ε=1/10,1 | Both exceed 2/5 eventually; ε=1 gives negative lower coefficient −1/2 | Lower bound does not force exact half-density | Added headline |
| §6.2 cubeSumModel coefficients/invariants | n=0,1,−1,3 | a₆=0,−27,−27,−243; Δ=0,−314928,−314928,−25509168; j=0 when elliptic | Model unchanged by new constructor | Native constructor reused |
| §6.2 affine substitutions | n=1,(1,1); n=−1,(−1,−1) | Both give (3,0); 0=27−27; coefficient −432 would give −405 | Scale and sign correct | Recomputed |
| §6.2 projective identities | n=−3,−1,1,3; 125 integer triples each | G(fwd)=108n²F and F(inv)=54nG on all 500 triples per direction; both composites equal 18n times input | Two directions and equations agree | Recomputed exact arithmetic |
| §6.2 pointed origin and singular case | [1:−1:0]; n=0,1 | Origin maps to [0:18n:0]; n=1 gives [0:18:0]=[0:1:0]; n=0 gives zero tuple and Δ=0 | Nonzero n required for projective isomorphism | General comparison gap retained |
| §6.2 conventional rescaling | n=1, X↦4X,Y↦8Y | a₆ multiplies by 64: −27·64=−1728; source x³+y³=n instead has −432n² | No parameter conflation | Recomputed |
| §6.3 cubeSum_fullCM and generic contract | α³=1,α≠1; identity; characteristic 3 boundary | α²+α+1=0 in the endomorphism domain; identity gives 3≠0 in characteristic zero; in characteristic 3 this control becomes 0 | Characteristic-zero and primitive-root hypotheses essential | Generalized supplier need |
| §6.3 cyclotomic arithmetic | p=3,k=0 in prime-power ideal formulas | Discriminant (−1)¹3¹=−3; norm 3; e=3⁰(3−1)=2; norm of prime square 9 | Ramified three supplied by pin | Removed arithmetic from gap |
| descendsToRat and API | rational base change; singular curve; irrational j | Identity variable change gives descent; singular Δ=0 cannot be a change of an elliptic curve; j=6912/(4+54i) has nonzero imaginary part | Actual pointed curve required | None |
| §6.4 descendingTwist_twoCosets | j=0, quotient exponent 2; t=t₀ | [u]³=[u], so [u]³=1 forces [u]=1; q=u=1 gives t=t₀ | First branch and j=0 classification agree | Native exceptional scaling cited |
| §6.4 exceptional second coset | ℚ(√−2), t=√−2, A=−1 | Classical twist coefficient t²A=2; native coefficient (4t)²A=32, scaling by u=2 gives 2 | Second coset necessary; native factor 4 harmless | Recomputed |
| §6.4 imaginary-field boundary | hypothetical D=4 in ℚ(√2) | θ=2∈ℚ; √2-twist of coefficient −1 has rational coefficient −2 but parameter outside the proposed rational coset | D<0 excludes this wrong field | Original hypothesis retained |
| §6.5 descendingTwists_count_sqrt | split 5,inert 3,ramified 2 in ℚ(i) | H([5])=25, H([3])=9, H([2])=1; non-excluded rational part n_out obeys n_out<√(X/c) | Two cosets give O(√X); ramified primes give bounded choices | Added headline |
| §6.5 empty descent set | any elliptic A with D_A empty | Count 0≤1·√X for X≥0 | C=1>0 handles empty case | Explained in README |
| §6.6 non-descending lower bound | model total=X, removed=√X, numerator=X/2 | X=100,10000,1000000 give full ratios 2/5,49/100,499/1000 and restricted ratios 4/9,49/99,499/999 | Both approach 1/2 from below; an initial 3/4 remains 3/4 | Added headline, corrected attribution |
| Newform analytic supplier and narrowed gap | k=2,p=5 dividing N,a_p=2,s=1 | Bad polynomial 1−2/5=3/5; adding a good quadratic term gives 4/5; conjugate of 2+3i is 2−3i | Actual conductor factor and coefficient conjugation specified | F02 |
| CM equality supplier contract | conductor correction lengths 0,1 | Corrected equality reads a=b+0 or a=b+1; replacing both by a=b would fail at length 1 | Conductor corrections retained at CZ.4 before CZ.6 descent | F03 |
| Generic j=0 supplier contract | short curve x³+1; singular x³ | ζ³=1 preserves x³+1 and fixes infinity; Δ=−432 versus 0 | Generic theorem restricted to elliptic characteristic-zero curves | F04 |
| Pointed cubic supplier contract | invertible linear map, inverse; n=0 | M⁻¹M=I on projective classes; cube-sum compositions 18nI give I for n≠0 and zero at n=0 | Invertibility plus marked origins required | F05 |
| Exceptional coefficient classification | scaling u=2 | u⁻⁴=1/16 and u⁻⁶=1/64; a₄=32 becomes 2 and a₆=64 becomes 1 | Quartic and sextic exponents differ | F05 |
| Analytic-order supplier boundary | identically zero analytic function | Order is ⊤, while nonzero (s−1)ʳ has finite r; natural-order additivity explicitly requires finiteness | No junk natural-order use | F06 |
| Theta comparison and existing factorization | weight two | M_f(1)=Ind η̄ and η̄=η⁻¹κ; central factors 2+3i,2−3i multiply to 13 | Only theta identification remains requested | F10 |
| Other retained supplier gaps | duality, control, local dimensions, isogeny | Euler 0−1+0=−1; Tor length 1; local dimensions 2−1=1; dual-isogeny composites [d] become invertible over ℚ_p even at p dividing d | Exact prerequisite contracts retained | No broader supplier rewrite |
| Statistical supplier gaps | even Selmer rank with mean≤1; degree-three maximal-order isogeny | Even rank≥2 on a fraction a forces mean≥2a, hence a≤1/2; ratio-one product 3·(1/3)=1 | Correct Selmer numerator; unconditional gaps remain explicit | No statistical theory duplicated |

## Maintainer notes

Only packages/CMRankZeroConverse/README.md, Suggested.lean, the plan's gaps list and this report changed. The equality gap now belongs to ModularIwasawaMainConjecturesPartII; the general j=0 and pointed-cubic contracts remain requests to their named suppliers. Resolving those supplier obligations requires work outside this package, and this repair does not claim their completion. The existing cubeSumModel, cubeSum_fullCM, descendsToRat and descendingTwist_twoCosets names are unchanged. RankOneConverse is no longer advertised as a consumer. Fresh independent review remains necessary.
