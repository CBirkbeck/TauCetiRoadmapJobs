# Red-team review of #1336 ErdosProgressionPowers at e101259 (pass a (codex))
**Verdict:** changes needed

## R01 (P1) — Rational-isogeny classification has no owner

**Location:** `TauCetiRoadmap/ErdosProgressionPowers/README.md:487–499`, “as consequences of the rational-isogeny classification”.

**Claim:** The two irreducibility cutoffs follow from a supplied classification.

**Witness:** The six supplier contracts contain no rational-isogeny classification; EllipticCurves Layers 2–4 concern torsion, finite fields and local reduction. BS20 lines 294–297 and 334–336 explicitly use Mazur's classification.

**Exact repair text:** “Before the irreducibility consequences, consume a named earlier supplier target for the classification of rational cyclic isogeny degrees over ℚ. If no such target exists, declare a precise supplier gap for that classification, with its hypotheses and primary locator, and mirror it in the design and README gaps. Deduce the full-two-torsion cutoff ell≥7 and the rational-two-torsion cutoff ell≥11 from that contract.” Replace the current unowned reference in each dependent Needs line.

## R02 (P1) — Modulus uniqueness does not supply the real exceptional zero

**Location:** `TauCetiRoadmap/ErdosProgressionPowers/README.md:1057–1061,1104–1106`; `TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean:369–388`.

**Claim:** `boundedPage c`, together with a bound for real exceptional zeros, supplies the lower bound q≥log k.

**Witness:** `boundedPage` only equates q and r; two conjugate nonreal zeros at the same modulus satisfy that uniqueness condition. BS20 lines 1434–1438 additionally use that the exceptional zero must be real.

**Exact repair text:** “Strengthen the bounded-height Landau–Page contract to assert that every zero in its exceptional strip belongs to a real primitive character, is real and simple, and is unique as a character/zero pair. Retain modulus uniqueness as a consequence. Carry that full contract with the same c into `exceptional_moduli_bounds` and `exceptional_indices_sparse`, and use its realness conclusion before applying the real-zero upper bound.” Add the full zero contract to §5.1 before its consumers; do not infer realness from the existing predicate.

## R03 (P1) — The conductor-versus-largest-prime estimate is unowned

**Location:** `TauCetiRoadmap/ErdosProgressionPowers/README.md:882`, “log N<1.07*(log k)^(1-c1)” and “reciprocal mass is<2.13/log N_1”.

**Claim:** The stated inputs supply these constants in the harmonic criterion.

**Witness:** BS20 lines 872–890 prove the separate Lemma 7.3, P(N)>0.94 log N. Neither §0.9 nor the squareclass supplier states this bound. Chebyshev alone leaves an additive dyadic term.

**Exact repair text:** “Add `quadraticConductor_maxPrime_lower`: for every primitive quadratic character of conductor N>1, `0.94 * log N < Nat.maxPrimeFac N`. Prove it for all such conductors, including the small range and conductor 24, retaining the correct 2-part 1,4,8. Cite BS20 Lemma 7.3, p. 375; add it to the Needs of §3.2. Derive both 1/0.94<1.07 and 2/0.94<2.13 from this target.”

## R04 (P2) — Strict exceptional-conductor growth fails at the first index

**Location:** `TauCetiRoadmap/ErdosProgressionPowers/README.md:844`, repeated at 882 and 1352, “Nⱼ>N₁^(2^(j−1))”.

**Claim:** The strict inequality holds throughout a conductor-ordered exceptional family.

**Witness:** At j=1 the right side is N₁, giving N₁>N₁. BS20 line 904 repeats this endpoint slip; the valid pairwise inequality is BS20 lines 813–819.

**Exact repair text:** “For N₁<⋯<Nₛ, Nⱼ≥N₁^(2^(j−1)) for 1≤j≤s, with strict inequality for 2≤j≤s.” Apply this replacement at all three occurrences. Keep the strict prime-factor lower bound separately when estimating reciprocal mass.

## R05 (P2) — The signed-factorization milestone is an omitted easy headline

**Location:** `TauCetiRoadmap/ErdosProgressionPowers/README.md:282–291`; `TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean:60–76`.

**Claim:** The file represents Layer 0 milestones, but none states the signed-factorization existence/uniqueness contract.

**Witness:** Fin k → ℕ and Fin k → ℤ already express A and z. No new geometric carrier or admitted data is needed; the four concrete factorization Checks also have no Lean counterpart.

**Exact repair text:** “Add a lightweight real-bodied predicate `SignedFactorization n d k ell A z`, with A : Fin k → ℕ and z : Fin k → ℤ, expressing positivity, nonzero z, the term equation and both prime-support conditions. Add `signed_factorization_exists_unique` under positive odd ell, nonzero terms and large-prime valuation divisibility. Add two proved examples grouping the four Checks of §0.4, and list both names in §0.4.” Use a theorem asserting existence and uniqueness, not a sorry-bodied factor constructor.

## R06 (P2) — Fixed-exponent theory is narrowed to the application's length

**Location:** `TauCetiRoadmap/ErdosProgressionPowers/README.md:1235–1239`; `TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean:461–464`, “length k≥5”.

**Claim:** The general diagonal-curve finiteness library is developed only at lengths at least five.

**Witness:** DG95 lines 338–367 treat k≥3, ell≥2 and 2/k+1/ell<1. The omitted (k,ell)=(3,4) and (4,3) give genus 3 and 10 respectively by the package's own formula.

**Exact repair text:** “State the signed diagonal-curve adapter and fixed-exponent finiteness for k≥3, ell≥2 and `2*ell+k < k*ell`. Preserve the k≥5 theorem as the immediate specialization consumed by fixed-length finiteness. State both in Lean using the existing integer tuple carrier.” Add the two omitted boundary instances as Checks of the genus calculation.

## R07 (P2) — General smooth-modulus cancellation is named but not specified

**Location:** `TauCetiRoadmap/ErdosProgressionPowers/README.md:860–866`, “Build the general smooth-modulus Graham–Ringrose cancellation input”.

**Claim:** A general library input supports the specialized two-character correlation bound.

**Witness:** BS20 Theorem 6, lines 939–946, has explicit conductor, squarefreeness, coprimality, interval-length and product-character hypotheses; none is given for this unnamed general target.

**Exact repair text:** “Add a named `smoothModulusCharacterSum` target before `smoothCharacterCorrelation`: for r≥1, characters π_i of positive moduli q_i, with q=q_1>1 squarefree, π_1 primitive and gcd(q,q_2⋯q_r)=1, bound the absolute product-character sum over M<m≤M+R by `4R*(τ(q)^(r^2)/q)^(2^(-r))` when `R≥max(q_2,…,q_r,q^(1/4))*q^(5/4)`. State real powers, the integer interval, and all moduli explicitly; identify the precise version with BS20 Theorem 6, pp. 376–377, and its Iwaniec–Kowalski Theorem 12.13 source. Make the specialized correlation target depend on it.” The exponent r² was checked against the typeset p. 377.

## R08 (P2) — The smooth-character correlation headline is missing from Lean

**Location:** `TauCetiRoadmap/ErdosProgressionPowers/README.md:856–860`; `TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean:228–244`.

**Claim:** Layer 3 exports a uniform effective power saving for distinct primitive quadratic characters, but the representative file only states the Gram inequality.

**Witness:** The signature needs only `DirichletCharacter ℝ N`, positive moduli, `IsPrimitive`, `IsQuadratic`, `Nat.maxPrimeFac`, a finite interval and real powers—all existing carriers already used here.

**Exact repair text:** “Add `smoothCharacterCorrelation` with the quantified c₂>0, ∃c₃>0, ∃K, k≥K, positive N₁,N₂<k^c₂, both largest-prime bounds, primitivity and quadraticity; require distinctness of the integer-valued character functions, and conclude the displayed half-interval power saving.” Define cross-modulus distinctness by unequal pulled-back functions, not ill-typed equality of characters at different levels.

## R09 (P2) — Stable lattice existence is planned again instead of imported

**Location:** `TauCetiRoadmap/ErdosProgressionPowers/README.md:419–420`, “invariant integral lattices exist”.

**Claim:** §1.1 owns stable-lattice existence for its newform representations.

**Witness:** `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:850–886`, §F.4.0, already owns `ContinuousRep`, `ContinuousRep.exists_stable_lattice_iff` and `GaloisLattice.IntegralModel` over nonarchimedean local fields.

**Exact repair text:** “Consume EtaleCohomologyFoundations §F.4.0's `ContinuousRep`, stable-lattice theorem and `GaloisLattice.IntegralModel`. Apply them to the jointly continuous two-dimensional K_λ-representation of the compact absolute Galois group. The remaining local target is semisimplified residual lattice-independence and its newform specialization.” Add this earlier owner to Exact supplier contracts and §1.1's Needs.

## R10 (P2) — Two numerical analytic inputs lack their actual inequalities

**Location:** `TauCetiRoadmap/ErdosProgressionPowers/README.md:375–379`, “∑(log p)/p bounds with explicit endpoints” and “explicitTotientRatio in the range used”.

**Claim:** §0.9 specifies all numerical inputs required by the Kraus threshold and the smooth factorial estimate.

**Witness:** §1.11 uses a prime product ≤2 log k; §4.5 uses a factorial prime contribution ≥(9/16)k log k−5k. Neither quantified input is stated in §0.9; BS20 lines 428–438 and 1309–1323 supply the missing formulas.

**Exact repair text:** “State `explicitTotientRatio` as `∏_(p prime, p≤x)(1+1/p)≤2 log x` for real x≥10⁸, with its cited stronger estimate if used. State a named bound for `Σ_(k^(7/16)<p≤k) v_p((k−1)!) log p ≥ (9/16)k log k−5k` throughout the certified range, or give the precise general weighted-prime inequality and endpoint from which it follows. Supply a separate Needs line and locator for each.” Do not leave the numerical obligation as ‘in the range used’.

## R11 (P3) — The cited integer valuation multiplication declaration is absent

**Location:** `TauCetiRoadmap/ErdosProgressionPowers/README.md:123–124,276`, “padicValInt.mul”.

**Claim:** This declaration is supplied by `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean` at the pin.

**Witness:** At Mathlib 6b7abb3, `padicValInt`'s namespace ends at line 124 without `mul`; line 420 supplies `padicValNat.mul`, with prime-instance and nonzero-factor hypotheses.

**Exact repair text:** “Use the definition `padicValInt p z = padicValNat p z.natAbs`, `Int.natAbs_mul`, and `padicValNat.mul` in `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean`, with `[Fact p.Prime]` and both factors nonzero.” Replace both `padicValInt.mul` citations.

## R12 (P3) — Coefficient comparison is attributed past its pinned owner

**Location:** `TauCetiRoadmap/ErdosProgressionPowers/README.md:163–164`, “supplies the rational-squareclass and real/complex scalar comparisons”.

**Claim:** ClassicalArithmeticCompletion §1.51 supplies the coefficient comparison used to pass from integer-valued squareclass characters to real and complex characters.

**Witness:** `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:1789–1836` does not state that comparison. The pin already supplies `DirichletCharacter.conductor_ringHomComp` and `DirichletCharacter.isPrimitive_ringHomComp_iff` in `TauCeti/NumberTheory/DirichletCharacter/Conductor.lean:50–61`, for injective ring maps and nonzero level.

**Exact repair text:** “ClassicalArithmeticCompletion §1.51 supplies the integer-valued squareclass character. Form its real and complex versions with Mathlib `MulChar.ringHomComp`; use `MulChar.ringHomComp_apply` and `MulChar.IsQuadratic.comp` for values and quadraticity. Consume Tau Ceti `DirichletCharacter.conductor_ringHomComp` and `DirichletCharacter.isPrimitive_ringHomComp_iff` from `TauCeti/NumberTheory/DirichletCharacter/Conductor.lean`, with the injective integer casts and positive level, for conductor and primitivity.” Cite these pinned inputs in the character-family dependency contract; do not add new transport theory.

## R13 (P3) — Several definition Checks fail to distinguish the definitions

**Location:** `TauCetiRoadmap/ErdosProgressionPowers/README.md:330–332,733–737,995–1005`; `TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean:195–226,285–287,512–514`.

**Claim:** The Checks discriminate equal-sum quadruples, both squareclass branches and thin sets, within the two-examples-per-definition limit.

**Witness:** Quadruple Checks 2–3 repeat. Removing the twice-square branch passes both examples; thinSet has none. primitive_solution is tested at lines 79, 83 and 512, exceeding two; line 512 repeats the first signed sample.

**Exact repair text:** “Add the negative quadruple `(0,1,1,3)∉I(4)`, which satisfies the ordering but fails equal sum. Add `inCaseSquareclasses 2` and the Case-II partition with constant parameter set {2}. Add thinSet Checks at k=9 for ∅, {7}, {2}, and {9}, separating the reciprocal-mass and primality conditions. Group them into at most two proved examples per kept definition.” Retain the distinct existing Checks and remove the duplicated repeated-middle bullet. Give the retained Landau–Page zero predicate its own discriminating Checks (zero modulus, principal pole and an above-height candidate are excluded), with proved mirrors; the present tests cover only `zeroWithin`. Merge line 512’s positivity boundary into the initial `primitive_solution` example, removing the third example of that definition.

## R14 (P3) — The smoothness endpoint example cannot test endpoint strictness

**Location:** `TauCetiRoadmap/ErdosProgressionPowers/README.md:940`; `TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean:298–302`, “(p : ℝ) = (k : ℝ)^(7/16 : ℝ)”.

**Claim:** This example distinguishes the open lower endpoint of the prime set.

**Witness:** If p is prime and p=k^(7/16), then k⁷=p¹⁶, so 7v_p(k)=16, impossible. With composite p the primality filter rejects it regardless of < versus ≤. The zero-survivor conjunct is unrelated.

**Exact repair text:** “Replace the endpoint-equality example with concrete membership and nonmembership Checks, for example `Tpr 2={2}` and `Tpr 16={5,7,11,13}`. State that the prime endpoint equality is impossible for natural k, while retaining the open interval as the mathematical convention. Add an actual Upr membership/nonmembership Check, since the current example mentions only Tpr.”

## R15 (P3) — Easy roadmap-specific Checks have no Lean mirror

**Location:** `TauCetiRoadmap/ErdosProgressionPowers/README.md:392–394,709–710,922,1166`; `TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean:193–244`.

**Claim:** Statable Checks test the roadmap's analytic and Legendre constructions.

**Witness:** No example tests a von-Mangoldt prime-power contribution, the complex order-four witness's curve equation, or either numeric cutoff calculation. All use existing finite sums, ℂ arithmetic, natural powers and real log/rpow carriers.

**Exact repair text:** “Add a `weightedHalf 4 (fun _=>1)=log 3+log 2` example to test prime powers. Keep a lightweight native Legendre/twisted model and prove the `(1+i,−1+i)` equation Check against it. State the quantitative Roth substitution and Granville k≥64 scale inequality as named theorem targets if their proofs do not fit compact proved Checks; list their names in the README.” Avoid standalone examples unrelated to a kept roadmap definition; combine or relocate the remaining statable Checks accordingly.

## R16 (P3) — A numerical bound is wrapped in a prohibited predicate

**Location:** `TauCetiRoadmap/ErdosProgressionPowers/README.md:995`; `TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean:282–283`, “def certifiedThreshold”.

**Claim:** A separate predicate packages the single real inequality k≥exp(exp(10⁷)).

**Witness:** Repository `README.md:216–219` explicitly prohibits wrapping a one-line bound in a new predicate. This definition has no other content and is unused by any Lean theorem.

**Exact repair text:** “Remove `certifiedThreshold` from Suggested.lean and its definition sentence from §4.6. Carry `(k : ℝ) ≥ Real.exp (Real.exp (10^7))` directly in the witness theorem and its API.” Retain the mathematical cutoff and its numerical verification.

## R17 (P3) — Primary theorem locators are replaced by downstream summaries

**Location:** `TauCetiRoadmap/ErdosProgressionPowers/README.md:490,720–721,1216–1217,1285`.

**Claim:** These references identify the sources of rational-isogeny surjectivity, Faltings finiteness and consecutive-product non-powers.

**Witness:** Primary statements are Kraus1997 lines 284–293, Lemos2017v2 lines 44–46, Faltings1983 lines 682–683, and ErdosSelfridge1975 lines 29–30. The README instead points to BS20/DG95 or an unnamed cited Lemos theorem.

**Exact repair text:** “Cite Kraus, Canadian J. Math. 49 (1997), §3.1, Théorème 4, p. 1144, for the realization input, retaining its weight-two hypotheses and identifying the roadmap’s numerical majorant; Lemos, arXiv:1702.01985v2, Theorem 1.1, p. 2, for `rationalIsogeny_surjective`; Faltings, Invent. Math. 73 (1983), §6, Satz 7, p. 365, for `faltingsFiniteness`; and Erdős–Selfridge, Illinois J. Math. 19 (1975), Theorem 1, p. 292, for `consecutiveProduct_not_perfectPower`. Add each to References and sources.toml. Keep BS20/DG95 citations for their application adapters.” The Lemos preprint version is explicit because publication-numbering identity was not checked.

## R18 (P3) — The source manifest is absent

**Location:** `TauCetiRoadmap/ErdosProgressionPowers/README.md:1412–1417`; missing `TauCetiRoadmap/ErdosProgressionPowers/sources.toml`.

**Claim:** The package has reproducible legal-source provenance for its locators.

**Witness:** The folder contains README.md, Suggested.lean and metadata.toml only. BS20 and DG95 are cited throughout; no source record captures version, legal origin, hash or certification status.

**Exact repair text:** “Add sources.toml with schema `tauceti-roadmap-sources/v1`. Record BS20, DG95 and each primary work actually cited, with authors, title, year, locator_scheme, locator, cited_for and the source service's provenance/status fields. Use no machine paths. Record unread paywalled material as uncertified.” The review fetched the two main works legally; provenance must be recorded by the repair worker, not inferred from this report.

## Verified sound

Coverage: **83 Lean declarations** read (33 definitions, 2 aliases, 22 admitted theorem statements, 26 proved examples); **57 numbered README target sections** read; **252 distinct inline identifiers** inventoried, including named Checks and imported declarations; all **33 bold spans** inspected (the package uses numbered headings/inline names rather than bold target titles). All **93 README Check bullets** received a boundary/discrimination audit. **65 target citation groups** in BS20/DG95 were inspected against the legal texts; **4 primary theorem locators** were additionally verified: Kraus1997 line 284, Lemos2017v2 line 44, Faltings1983 line 682 and ErdosSelfridge1975 line 29. “Inspected” includes the source mismatches reported above, not a claim that every locator supports its target.

All **6 named roadmap supplier contracts** were checked against the supplied main checkout. ArithmeticDynamics was searched at its supplied head: there are **0 sibling citations in either direction** and no relevant duplicate target was identified. EtaleCohomologyFoundations §F.4.0 is the additional existing owner found in R09. Dependency direction is forward for the declared contracts. The unchanged-package dependency check returned:

```text
depcheck: 2 roadmaps, 6 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. This check cannot detect an omitted prerequisite. HEAD is `e101259371172a32b3dd13e926676ae33b6af5cd`; the outside-folder diff and final working-tree status were empty. No repository file was edited, no Lean command or build was run, and nothing was posted.

The declaration context audit found no dropped standing instance: all relevant binders are explicit; there is no `variable`/`include` block. There is one `import Mathlib`, no admitted data or examples, no `set_option`, no `lemma`, and no placeholder proposition. Every named Lean declaration appears in the README. The representative file has 530 lines.

The two native invariant identities were checked against the pinned Weierstrass formulas, including the discriminant factor 16, the negative second-family sign, signed terms, d=0 in the unconditional identity, and dyadic exclusions in local conclusions. Independent arithmetic sweeps tested 10,304 gcd instances, 31,680 residue-count instances, 2,592 first-family normalizations/invariant instances and 6,358 second-family instances. All four signed-factorization samples were computed. Finite-field checks covered 1,658 Legendre curves and 1,600 order-four witnesses over odd prime fields through 127. These sweeps found no additional counterexample; they do not replace the general proofs.

The genus formula gives 3, 10, 5 and 1 for (k,ell)=(3,4),(4,3),(5,2),(4,2). The corrected Darmon–Granville index coefficients, retained divisor-count +1, Gram margin `1/68<0.1239²`, Roth cutoff between 10⁶ and 10⁷, and Granville boundary k=64 were checked. The pole exclusion, positive-modulus instances and distinction between continued LFunction and naive LSeries were checked against the pinned API.

The pins used were Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Positive code-search identifications were re-read at these commits. In particular the generic descent/halving input already exists: `WeierstrassCurve.Affine.μ`, `exists_eq_two_smul_iff` and `ker_μ_eq` in `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/XSubT.lean:794,855,961`, over a field in characteristic-not-two normal form with ellipticity and the point API’s decidable equality. Its split-coordinate specialization is local application work, not an unowned general theory. The coefficient-change results in R12 also already exist at the pin.

The complete declaration/context, target-name and Check inventories are retained in the scratch notes. The following table records the adversarial pass by target section; a finding on a shared input also affects its downstream consumers.

| Statement / section | Instances tried | Result | Change | Source locator read |
|---|---|---|---|---|
| 0.1 | k=0, ell=2, signed square, gcd=2 | Conjunctions exclude zero length and nonprimitive example | None | BS20 line 249 |
| 0.2 | d=0,n=±1; i=0,j=1; negative terms | Gcd divides index difference | None | BS20 line 249 |
| 0.3 | k=1, q=k prime, nonzero negative terms | Unique divisible factor; zero terms excluded | R11 | BS20 line 252 |
| 0.4 | ell=1; negative cubes; p=k=2; A=64 | Existence/sign/support/uniqueness sound; easy signature missing | R05 | BS20 line 254 |
| 0.5 | k=0,1,2,3,5; constant triples | Counts 0,0,0,1,4; strictness correct | None | BS20 line 268 |
| 0.6 | k=2,3; repeated middle; kappa=-1 | Ordering and signed kappa correct; repeated-middle Check duplicated | R13 | BS20 line 310 |
| 0.7 | r=0,1; empty range; divisible difference | Total definition and finite support correct | None | BS20 line 1143 |
| 0.8 | r=1, r>k, k=0, d=0,n=1 | +1 retained; prime discrepancy strictly below 1 | None | BS20 line 1145 |
| 0.9 | x=1,2,4; n=p^a; explicit estimate domains | Displayed bounds match secondary source; index product contract underspecified | R10, R15 | BS20 line 303; BS20 line 1221 |
| 1.1 | N=1,4,11; p=ell; good/multiplicative cases | Kraus hypotheses and numerical majorant checked; isogeny ownership and duplicate lattice input need repair | R01, R09, R17 | BS20 line 184; BS20 line 213 |
| 1.2 | n=d=1; n=2,d=1; signed n=-3,d=2 | g=1,2,1; normalization and coefficients correct | None | BS20 line 277 |
| 1.3 | first models above; p=2 excluded from odd minimality | Native Delta factor 16 correct, including source normalization correction | None | BS20 line 281 |
| 1.4 | indices 0,1,2 and unequal spacings | Linear coefficients cancel n and d exactly | None | BS20 line 263 |
| 1.5 | q=(0,1,1,2), signed n,d | A-B=kappa*d² and coefficient signs correct | None | BS20 line 310 |
| 1.6 | p=3, p=2 excluded by p≥k; d=0 invariant identity | Second Delta/c4 identities correct; half interval has its own p≥5 clause | None | BS20 line 323; BS20 line 407 |
| 1.7 | ell=7, dyadic conductor, p=k | Support and level bounds match source after upstream contracts | None | BS20 line 287 |
| 1.8 | ell=11, p=3, kappa-primes | Wild 2/3 and kappa factors retained | None | BS20 line 331 |
| 1.9 | one versus two p-divisible terms; p=k | Two branches owned and coefficient prime excluded by H | None | BS20 line 395 |
| 1.10 | good ell; finite-flat multiplicative ell; deletion versus original level | No automatic identification; explicitly requested bridge | None | BS20 line 423 |
| 1.11 | M=1,4,11; lcm(M,4) | Threshold formulas correct; numerical input missing specification | None | BS20 line 428 |
| 1.12 | same residual prime; full two-torsion; fixed chosen curve | Existence and simultaneous choice are correctly separated | None | BS20 line 423 |
| 1.13 | p≡3 mod4; p=3 versus p≥5; Hasse difference | Trace-zero and supersingularity ranges correctly distinguished | None | BS20 line 447 |
| 2.1 | lambda=0,1,2; F3,F5; t=v=1/2; ell>37 | Formula and finite-field tests pass; pinned general halving input verified; primary Lemos locator needed | R17, R15 | BS20 line 526; Lemos2017v2 line 44 |
| 2.2 | empty parameter assignment; -1,2,3; k=0 | Partition true; twice-square branch untested | R13 | BS20 line 517 |
| 2.3 | residue classes 1,3,5,7 mod8; absolute signs | Projection coefficients (0,4,0,0), correct absolute bound | None | BS20 line 576 |
| 2.4 | t=v=1/2; p≡5 mod8; twist by 2 | Positive normalization and exact two-primary obstruction agree | None | BS20 line 688 |
| 2.5 | a=b, b=c, a=c; signed powers of 2 | First two force d dividing 3, last forces d=0 | None | BS20 line 776 |
| 2.6 | odd conductor 1; tv square or twice square | Primitive positive quartic reduction preserves hypotheses | None | BS20 line 736 |
| 2.7 | modulus1; chi(0),chi(1); prime-power tail | Same-witness and numerical margin correct; coefficient comparison needs its pinned owner citation | R12 | BS20 line 499 |
| 3.1 | empty Gram family; equal/orthogonal vectors; principal character; j=1 | Gram and PNT boundaries consistent; conductor index, general cancellation contract and headline need repair | R04, R07, R08 | BS20 line 799; BS20 line 939; BS20 line 1046 |
| 3.2 | c1<1/2, c1>1/2; smallest conductor24 | Decay exponent correct; conductor-versus-prime estimate unowned | R03 | BS20 line 851; BS20 line 872 |
| 3.3 | equal versus distinct characters; diagonal rows | Correct squared-sum coefficient 1/68, not fourth power | None | BS20 line 923; BS20 line 1068 |
| 4.1 | singleton; constant triple; density10^-5 | Quantitative threshold exceeds10^6 and is below10^7 | R15 | BS20 line 1135 |
| 4.2 | k=0,2,16; p at lower endpoint | Set convention sound; prime endpoint equality impossible | R14 | BS20 line 1180 |
| 4.3 | empty J, all units; sample/tie | Remaining set {0,1,4}, product2; least tie1 | None | BS20 line 1289 |
| 4.4 | m=1; zero excluded; telescoping endpoints | Stirling normalization sqrt(pi) and 1/(12m) correct | None | BS20 line 1300 |
| 4.5 | small S; half primes divide d; +1 losses | Constants and density arithmetic match source with larger cutoff | None | BS20 line 1203; BS20 line 1293 |
| 4.6 | S empty; 2 in S; Roth density10^-5 | Simultaneous witness logic correct; thinSet Checks missing; numerical wrapper prohibited | R13, R15, R16 | BS20 line 1327 |
| 4.7 | empty B; duplicate largest primes; extension by new witness | Maximality argument and reciprocal-mass dichotomy sound | None | BS20 line 1335 |
| 4.8 | 17log k split; closed small endpoint | 0.1683>0.166 and c1=1/20000 handle endpoints | None | BS20 line 1345 |
| 5.1 | q=1 principal pole; height bound; rho=0 integral | Bounded-height realness contract missing from supplied predicate | R02 | BS20 line 1401 |
| 5.2 | q=0, q>k^4; pole and high zero; k=0,1 | Totalization guards correct; separate Page predicates lack checks | R02, R13 | BS20 line 1413 |
| 5.3 | q<T versus q≥T; conjugate zeros at same q | Modulus uniqueness alone does not supply realness | R02 | BS20 line 1417; BS20 line 1434 |
| 5.4 | principal versus nonprincipal; rho near0 | Pole excluded; integral bound removes 1/rho singularity | None | BS20 line 1440 |
| 5.5 | empty moduli; q8,r1; q1000,r1000>k | All explicitly tested divisor thresholds correct | None | BS20 line 1468 |
| 5.6 | q>k; +1 divisor errors; signed coprime n,d | Errors summed before asymptotic estimate, uniform in n,d | R02 | BS20 line 1468 |
| 5.7 | disjoint triples; k64 boundary | More than2k/7 blocks gives one product≤k^(7/2) | R15 | BS20 line 1489 |
| 5.8 | odd squarefree factor versus full modulus; dyadic≤8 | Three gcds product≥N/8 and cube-root witness correct | None | BS20 line 1495 |
| 5.9 | primitive nonprincipal selected character; fixed constants | Contradiction follows once analytic inputs supplied | None | BS20 line 1501 |
| 6.1 | genus1 excluded; number field; geometric connectedness | Hypotheses match primary Faltings Satz 7 | R17 | Faltings1983 line 682; DG95 line 26 |
| 6.2 | yd=0; ell2; fixed k; negative signs | Logical headline matches published Theorem2; effectivity separately required | None | BS20 line 107 |
| 6.3 | (k,ell)=(5,2),(4,2),(3,4); signed coefficients | Genus5,1,3; indexing correction valid; range narrowed | R06 | DG95 line 325; DG95 line 350 |
| 6.4 | y=0,±1; p divides ell; Y=-8 | Power identity and finite root fibres correct | None | BS20 line 110 |
| 6.5 | fixed k versus varying k; prime-divisor reduction | Finite union and root fibres give stated signed finiteness | None | BS20 line 107; DG95 line 325 |
| 7.1 | k1,n4; k2,n1; signed progression | Positive/nontrivial hypotheses match primary Theorem 1 | R17 | ErdosSelfridge1975 line 29 |
| 7.2 | K0,K3; signed negative n; monotonicity | Known square excludes thresholds0,3, positivity retained | None | BS20 line 42 |
| 7.3 | b0,b1; tau<1/2, k2,b2 | Domain and support conditions true; this sample actually fails until tau≥1 | None | BS20 line 1378 |

## Not verifiable

- Lean elaboration and tactic execution were intentionally not run under the read-only/no-build brief. The report certifies neither successful elaboration nor the elaborated types of the admitted declarations; it audits the written signatures and contexts.
- The analytic inputs attributed through BS20 were checked against that published paper, not against every original proof it cites. In particular the Iwaniec–Kowalski zero-free/PNT/short-sum theorems, the numerical prime-estimate tables and the small-conductor zero computations were not independently recertified from their original proofs or data. No claim about their computational certification is made here.
- GitHub code search indexes default branches. Every positive pinned-library witness was fetched at the manifest commit, but search cannot certify absence of every duplicate in historical files absent from that index.
- Apart from ArithmeticDynamics, no head checkout for the other earlier open roadmaps in the merge-order list was supplied. Their exact current targets and any further overlap with the generic modularity, Galois-representation or Faltings blocks were not certified. The main/completed checkout and supplied sibling were searched; no nonexistent sibling contract was invented as a repair.

The source service resolved the texts needed for the reported witnesses, including the initially failed BS20 and Kraus publisher URLs. There is no unresolved missing-reference entry for those witnesses. No settled prior repair finding was supplied for this first round.
