<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/133#issuecomment-6311514699 -->
Red team round 1 pass a (codex) of cdb320a

Verdict: needs_changes

1. **F01** (P1) The ramified replacement violates C1

   Location: packages/EffectiveClassNumbers/README.md:689, “replace the Euler factor of Ψ … by the local factor L_p(f⊗χ, s)”.

   Claim: The replacement satisfies C1–C4, including the square-supported coefficient bound in §1.2.

   Witness: At 139 the replacement is (1 + 4εX + 139X²)⁻¹ (§3.3), whose coefficient of X is −4ε ≠ 0. C1 requires the coefficient at nonsquare 139 to vanish. O85 line 432 (printed pp. 320–321, equation image) has the same error.

   Exact repair text: “At a prime where twisting restores an unramified factor with roots α, β, replace the factor of Ψ by ((1−α²p^(−2s))(1−β²p^(−2s)))⁻¹. Put G=L(f)L(f⊗χ)/Ψ and verify its resulting local factors and C1–C4.” Recompute the 139 correction, Taylor data and constants using this square-supported product, retaining every ramified case.

2. **F02** (P1) Two imported modules do not exist at the required pin

   Location: packages/EffectiveClassNumbers/Suggested.lean:3 and :5; packages/EffectiveClassNumbers/README.md:65.

   Claim: The imports and API discussion describe the pinned libraries.

   Witness: At Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, QuadraticTwist.lean and CanonicalHeight.lean are absent; their declarations live in QuadraticTwist/Basic.lean and CanonicalHeight/Basic.lean (and Limit.lean).

   Exact repair text: Replace the two imports with `import TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist.Basic` and `import TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight.Basic`; import `CanonicalHeight.Limit` only if needed. Replace the library commits in the supplier paragraph with Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, and audit the signatures against those commits.

3. **F03** (P1) The quadratic-character supplier citation is nonexistent

   Location: packages/EffectiveClassNumbers/README.md:95, “primitive quadratic character … GlobalNumberFields, Layer 10”.

   Claim: GlobalNumberFields Layer 10 supplies χ_D, its conductor, primitivity, parity, splitting values and the zeta factorization used in §0.6.

   Witness: TauCetiRoadmap/GlobalNumberFields/README.md:525–563 contains infinity types and cyclotomic arithmetic. TauCetiRoadmap/ImaginaryQuadraticClassNumber/README.md:53–65 instead owns precisely the primitive quadratic character and ζ_K=ζL comparisons.

   Exact repair text: “The primitive quadratic character, conductor, parity and splitting dictionary are supplied by ImaginaryQuadraticClassNumber H2.1; the equality ζ_K(s)=ζ(s)L(s,χ_D) is supplied by H2.2.” Replace every GlobalNumberFields Layer 10 citation for these inputs accordingly.

4. **F04** (P1) Existing imaginary-quadratic arithmetic is planned again

   Location: packages/EffectiveClassNumbers/README.md:149–177, `exists_squarefree_radicand` and `classNumber_eq_card_reducedForms`.

   Claim: This package owns the imaginary-quadratic radicand classification, maximal-order Picard comparison and class-number/reduced-form count.

   Witness: TauCetiRoadmap/ImaginaryQuadraticClassNumber/README.md:25–41 already requests the radicand classification, integral-basis/discriminant transport, Pic(O_K)=ClassGroup(O_K), and the unweighted reduced-form count.

   Exact repair text: “This is ImaginaryQuadraticClassNumber, Part II: the base roadmap supplies H1.1–H1.3 and H2.1–H2.4; this extension supplies effective lower bounds and class number three.” Import H1.1–H1.3 by target instead of replanning their imaginary-quadratic statements; retain only genuinely new adapters and separately identify the real-quadratic extension of the radicand statement. Align the roadmap identity and introduction with that Part II ownership.

5. **F05** (P2) Height normalization and the numerical Lean gap drifted

   Location: packages/EffectiveClassNumbers/README.md:55 and :565; packages/EffectiveClassNumbers/Suggested.lean:25 and :368–372.

   Claim: The required pin uses half the full x-coordinate height, so the README bound ĥ≥1/2 becomes canonicalHeight≥1/4, and imported height bounds must be doubled.

   Witness: Pinned TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean:119–120 defines lim h(2ⁿP)/4ⁿ. EffectiveDiophantineMethods §3.12–3.15, at head 076ace7d, uses that full height too.

   Exact repair text: “At the pinned commit, canonicalHeight is ĥ, the full x-coordinate doubling limit. The bound is `1/2 ≤ P.canonicalHeight`; EffectiveDiophantineMethods §§3.12–3.15 use the same normalization.” Remove the historical normalization comparison and all instructions to double those supplier bounds; change the Lean bound from 1/4 to 1/2 and its docstring accordingly.

6. **F06** (P1) Totalized gamma products cannot serve as the entire completion

   Location: packages/EffectiveClassNumbers/Suggested.lean:221–228; packages/EffectiveClassNumbers/README.md:308.

   Claim: The technical theorem represents C3 by differentiability of the pointwise `goldfeldCompletion` on all of ℂ.

   Witness: `Complex.Gamma 0 = 0`, hence this product is zero at 0 for every finite-valued Ψ,G. The genuine modular completion has F(0)=F(2)=Λ(E,2)Λ(E⊗χ,2)/d≠0, since the Euler products converge at 2.

   Exact repair text: “Supply an entire function `F : ℂ → ℂ` and equality `∀ s, 3/2 < s.re → F s = goldfeldCompletion d M Ψ G s`; impose reflection, central vanishing and strip decay on F.” Make this replacement in `oesterleTechnical` and in every assertion identifying the continued completion with the pointwise product outside the convergence half-plane. Keep the light product definition for right-half-plane identities.

7. **F07** (P1) Gross–Zagier and rank-zero/one suppliers have no available contracts

   Location: packages/EffectiveClassNumbers/README.md:125–131, and the dependent *Needs:* lines in Layers 2–3.

   Claim: RankZeroOneBSD Layer 0 and GrossZagierAndArithmeticHeights §§0.1, 8.4, 8.15, 8.19 supply the twist, root-number, height and Heegner interfaces.

   Witness: Neither roadmap occurs under TauCetiRoadmap/ or Completed/, in the merge-order list, or among the indexed open new-roadmap folders. No design gap is declared. The displayed relative README links have no destination in the supplied inputs.

   Exact repair text: Replace these unsupported supplier rows by owned targets with the full hypotheses: analytic-rank finiteness/parity; quadratic-twist conductor, coefficients and root numbers (including shared conductor primes); Petersson/parametrisation-degree and height normalization comparisons; the classical Heegner construction, Galois action and Gross–Zagier formula. Reuse existing earlier owners where their actual sections supply a target. If an eligible supplier is identified instead, declare each precise missing contract in the README and design gap manifest before consuming it.

8. **F08** (P1) Analytic-number-theory contracts have changed

   Location: packages/EffectiveClassNumbers/README.md:113–115 and :865.

   Claim: AnalyticNumberTheoryPartI §0.5 supplies unconditional Rosser–Schoenfeld bounds; §2.15 supplies the imaginary-quadratic Siegel bound; §2.18 supplies the class-number formula.

   Witness: At head 23d3de1c, TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:254 requires RosserSchoenfeldFiniteRangeInput; :1342 is Louboutin’s residue bound; :1427 is Artin coefficient regrouping. The two advertised class-number targets are absent there.

   Exact repair text: “For §4.4 consume the pinned qualitative prime number theorem only. The class-number formula and Siegel bound are ImaginaryQuadraticClassNumber H2.2 and H2.4.” Delete the unnecessary Rosser–Schoenfeld dependency from §4.4 and repoint the class-number references throughout. If explicit prime-count bounds are genuinely used elsewhere, retain the supplier’s finite-range hypothesis or own and prove its missing finite input.

9. **F09** (P1) The Rankin–Selberg strip-bound contract is missing and misstated

   Location: packages/EffectiveClassNumbers/README.md:119 and :664, `rs-vertical-strip-bounds`.

   Claim: AL.3 has the named target, supplies polynomial bounds for the finite Rankin–Selberg L-function, and permits only poles at 0 and 1 for arbitrary unitary cuspidal pairs.

   Witness: At head 691b4b33, that anchor does not exist. TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:2243 permits norm-twist poles at iσ,1+iσ; :2378 supplies bounds for the completed function, not the finite series.

   Exact repair text: “Use AL.3 ‘Hecke, eigensystem and Rankin–Selberg data’ for completed-function strip bounds, and ‘Continuation and the Rankin–Selberg pole criterion’ specialized to the self-dual self-pair π_f×π_f.” Add the named adapter deriving the precise finite-L-function polynomial bounds needed here, with gamma factors and pole removal explicit, or prove the desired gamma-weighted decay directly from the supplied completed bounds. Delete the nonexistent anchor and the unrestricted poles-only-at-0,1 claim.

10. **F10** (P1) A good prime with zero trace has a nontrivial Liouville factor

   Location: packages/EffectiveClassNumbers/README.md:656, “at p with a_p = 0 it is 1”.

   Claim: Vanishing of a_p makes the Euler factor of L(f)L(f⊗λ) trivial.

   Witness: `curve37` has good reduction at 5 and a₅=0. Its product factor is (1+5·5^(−2s))⁻², not 1; the general good-prime formula in the same paragraph gives this value.

   Exact repair text: “At an additive prime p²∣N, a_p=0 and the factor is 1. At a good prime with a_p=0 the factor is (1+p^(1−2s))⁻².” Add this good-prime zero-trace case as a negative-control Check.

11. **F11** (P2) The purported general symmetric-square and twist theory omits local types

   Location: packages/EffectiveClassNumbers/README.md:656–664 and :689.

   Claim: The symmetric-square factors and ramified twist system are defined for every rational weight-two newform/elliptic curve in the standing assumptions.

   Witness: Additive potentially multiplicative primes and additive potentially good primes not quadratic twists of good reduction have no factor in §3.1. AL’s local-conductor-test-vector-comparison explicitly assumes the original representation is unramified (supplier README:3000–3002).

   Exact repair text: “Define every bad symmetric-square factor from the inertia invariants and monodromy of Sym² of the local Weil–Deligne representation. Prove the Liouville comparison and twist conductor/factor formulas for every local reduction type, including residue characteristics 2 and 3.” Own the missing local comparisons, with named milestones and sources; retain E₁₃₉ and E₅₀₇₇ as specializations, not restrictions on the general theory.

12. **F12** (P1) The partial-zeta input is not in IntegralLattices B2

   Location: packages/EffectiveClassNumbers/README.md:241, “IntegralLattices B2 (the partial zeta function of a class as an Epstein sum)”.

   Claim: B2 supplies the analytic partial-zeta/Epstein identity used to prove the reduced-form decomposition.

   Witness: TauCetiRoadmap/IntegralLattices/README.md:1032–1092 supplies forms and ideal classes, not partial zeta functions. Its ownership table at :152 assigns number-field Mellin/zeta theory to LFunctions.

   Exact repair text: “Consume IntegralLattices B2 only for the form–ideal correspondence. Add `partialZeta_eq_epstein`: for the ideal class corresponding to a positive definite primitive form q of fundamental discriminant D<0 and Re s>1, ζ_[q](s)=w(D)⁻¹ Σ_(m,n)≠(0,0) q(m,n)^(−s).” State the ideal normalization and unit factor, cite O85 §1.2, p. 311, and derive §0.6 from this bridge and the existing arithmetic dictionary.

13. **F13** (P2) Central-derivative bounds create a forward dependency cycle

   Location: packages/EffectiveClassNumbers/README.md:545–551, “Each is proved the same way”.

   Claim: All five numerical targets in §2.7 use the single displayed Needs list, and §2.8 is then built on §2.7.

   Witness: The r=3 series at :548 requires §2.8's vanishing, and :550 requires §2.11's vanishing. Section 2.8 consumes §2.7 (:565), while §2.11 consumes its conductor-37 central bound. The shared Needs list omits these prerequisites.

   Exact repair text: “Place first-derivative smallness, twisted central nonvanishing and the conductor-37 central bound before the exact-vanishing arguments. Place the two third-derivative bounds after those arguments. Give each numerical target its own Needs list, including its exact lower-derivative vanishing theorem.” Reorder the matching Lean declarations and references accordingly.

14. **F14** (P3) The claimed counterexample to the BGZ remainder bound is false

   Location: packages/EffectiveClassNumbers/README.md:514, “the tail is not bounded by its first term”.

   Claim: At x=5, r=1, K=1 the error exceeds the first omitted term 25/4 because the next two terms increase.

   Witness: The truncation is 5−γ−log 5≈2.813346; G₁(5)≈0.00114830. The error is approximately 2.812198, strictly less than 6.25. Increasing initial terms do not imply the asserted failure.

   Exact repair text: “At x=5, r=1, K=1 the error is less than 25/4 even though the next terms increase; the decreasing-term test alone does not establish this case.” Prefer the general first-omitted-term remainder obtained by integrating the Taylor remainder of exp(−x), valid for r≥1, x>0 and every K≥0; otherwise label K≥x only as a sufficient hypothesis for the stated proof.

15. **F15** (P2) Easy numerical milestones are omitted from Suggested.lean

   Location: packages/EffectiveClassNumbers/README.md:547–551; packages/EffectiveClassNumbers/Suggested.lean:376–411 and :639–640.

   Claim: The named numerical inputs are left without Lean signatures despite being easy to state on existing carriers.

   Witness: `curve5077_deriv_small` and `curve37_central_bounds` need exactly the existing curves, an entire L and the same right-half-plane agreement used by `curve139_third_deriv_bounds`.

   Exact repair text: Add `curve5077_deriv_small` with `(L : ℂ → ℂ)`, `(hentire : Differentiable ℂ L)` and `(hseries : ∀ s, 3/2 < s.re → L s = curve5077.LSeries s)`, concluding `‖deriv L 1‖ < (10 : ℝ)^(-12 : ℤ)`. Add the analogous `curve37_central_bounds` signature concluding `(72/100 : ℝ) < (L 1).re ∧ (L 1).re < (73/100 : ℝ)`. These are inputs of the exact-vanishing milestones.

16. **F16** (P2) The height-gap specialization lacks its quantitative descent input

   Location: packages/EffectiveClassNumbers/README.md:565, “P_K lies in E(ℚ) up to torsion”.

   Claim: Rationality up to torsion and the rational-point gap immediately give δ=1 for the K-height of P_K; an unspecified positive lower bound for c finishes the argument.

   Witness: Galois invariance modulo torsion gives rationality in E(K)⊗ℚ, not an actual rational representative modulo torsion. A denominator 2 divides the height gap by 4. No named target proves descent or c>5·10⁻¹².

   Exact repair text: “Add `curve5077_heegner_descent`, proving this trace differs from an actual rational point by torsion (for example, prove E(ℚ(√−7)) is torsion-free and use the precise conjugation formula). Add `curve5077_grossZagier_constant_lower`, with the chosen parametrisation and height normalization, asserting c>5·10⁻¹². Include both in the Needs of exact vanishing.” Prove these inputs; rationality in the tensor product and positivity alone do not supply the quantitative gap.

17. **F17** (P2) The split-prime theorem deliberately excludes valid boundary fields

   Location: packages/EffectiveClassNumbers/README.md:207, “the hypothesis d > 4 is kept only because the applications use it”; packages/EffectiveClassNumbers/Suggested.lean:94.

   Claim: The general split-prime theorem is restricted to discriminant below −4 for route convenience.

   Witness: The same norm argument proves d≤4pʰ for d=3 and d=4. For ℚ(√−3), p=7 gives 3≤28; for ℚ(i), p=5 gives 4≤20. The README explicitly acknowledges the unnecessary restriction.

   Exact repair text: “For every imaginary quadratic K and unramified split rational prime p, |disc K|≤4p^h(K).” Replace `(hd : NumberField.discr K < -4)` by `(hneg : NumberField.discr K < 0)` and add the d=3,4 Checks. Keep d>4 only in later targets that actually require w=2.

18. **F18** (P2) Reduced-form milestones are omitted using a stale pin claim

   Location: packages/EffectiveClassNumbers/README.md:65; packages/EffectiveClassNumbers/Suggested.lean:634–636, “postdates the pinned library”.

   Claim: Reduced-form signatures cannot be stated on the pinned carriers.

   Witness: Tau Ceti a91d3aaf has `TauCeti.reducedForms`, `IsReducedForm` and `mem_reducedForms` in TauCeti/NumberTheory/BinaryQuadraticForm/Reduced.lean:60–84. Their input is the natural absolute discriminant, with D≠0 for the membership equivalence.

   Exact repair text: “The pinned reduced-form carrier is available.” Import `TauCeti.NumberTheory.BinaryQuadraticForm.Reduced` and state the new §0.2 milestone `reducedForm_four_mul_c_sq_ge`, including the primitive/d≠4 condition for strictness, directly on `BinaryQuadraticForm ℤ` and `IsReducedForm`. State the primitivity adapter at its proper owner; import the existing roadmap's class-number/count target instead of duplicating it (R04). Remove the stale reason for omitting all these signatures.

19. **F19** (P3) Checks do not meet the discriminating-example contract

   Location: packages/EffectiveClassNumbers/Suggested.lean:85–89, :469–475, :516–526, :601 and :630–633; packages/EffectiveClassNumbers/README.md:195–199 and :987–990.

   Claim: Every introduced definition has discriminating proved examples matching its statable README Checks.

   Witness: θ has only 0/prime examples, both passed by deleting either largest or smallest prime. `classThreeDiscriminants` has no example. `primeMajorant` has three examples and `effectiveKappa` four; the maximum is two per definition.

   Exact repair text: Replace θ's examples by two bundled tests including θ(15)=1/4 and θ(84)=1/12. Add two bundled examples testing the class-three set, including card=16, membership of −907 and exclusion of −243. Consolidate primeMajorant's three and effectiveKappa's four checks into at most two examples each. Add the missing statable normalization Checks by bundling them: F(2)=18, the inverse-Mellin a=1 factor and a<0 negative control, curve37's model/invariants, and IsInertPrime's positive membership alongside its composite rejection. Remove examples testing only the library fundamental-discriminant predicate; replace them by checks of this roadmap's definitions. Give each retained definition at least three discriminating README Checks, including positive and negative cases; a boundary convention alone is not three tests. Add docstrings to the two instances and to retained examples as required.

20. **F20** (P3) Theorem 2 has the wrong page locator

   Location: packages/EffectiveClassNumbers/README.md:302, “Theorem 2, p. 314”.

   Claim: Oesterlé's technical Theorem 2 is on printed p. 314.

   Witness: O85 places conditions C1–C4 on p. 314, but Theorem 2 in §3.5 on p. 318. O85 line 355 locates it; the package uses the correct page at :407.

   Exact repair text: “References: O85 §3, conditions C1–C4, p. 314; §3.5, Theorem 2, p. 318.”

21. **F21** (P3) The required source manifest is absent

   Location: packages/EffectiveClassNumbers/README.md:1008–1016; missing packages/EffectiveClassNumbers/sources.toml.

   Claim: Nine works underpin the targets, but none has a package source-manifest entry.

   Witness: The package contains no sources.toml; the references name O85, O88, GZ86, GZ83, BGZ85, MW74, LLS70, G77 and DLMF. Fetching a verification page can misleadingly return service status certified without supplying the work.

   Exact repair text: “Add sources.toml with schema tauceti-roadmap-sources/v1 and one entry per cited work: bibliographic data, exact locators and cited_for targets, plus the verified sources-service provenance.” Record O88 as unavailable pending a legal readable copy; do not certify the access-check HTML. Use the successfully fetched legal LLS70 PDF, not the unrelated AMS journal landing page. Do not place source files or machine paths in the package.

22. **F22** (P1) No inert primes is insufficient for the claimed Heegner construction

   Location: packages/EffectiveClassNumbers/README.md:131, “K imaginary quadratic in which no prime dividing N is inert”.

   Claim: This condition produces cyclic CM N-isogenies between maximal-order ideal lattices and the stated Heegner points on X₀(N).

   Witness: N=27, K=ℚ(√−3): 3 ramifies, so the stated condition holds. The unique ideal of norm 27 is 𝔭³; O_K/𝔭³ has additive group ℤ/9×ℤ/3, not cyclic of order 27.

   Exact repair text: “For the maximal-order classical construction require an integral ideal 𝔑 of norm N with O_K/𝔑≅ℤ/N as additive groups. Thus primes dividing N split, or ramify with valuation exactly one in N.” State separately the additional local, discriminant and sign hypotheses of the chosen Gross–Zagier formula, matching its actual source: GZ86 lines 156–168 assumes D odd and prime to N. If the intended general interface includes the excluded local cases, supply the appropriate CM-order/level construction and comparison as named targets instead of claiming the same maximal-order cyclic isogenies exist.

23. **F23** (P2) The elliptic Gross–Zagier contract drops a product-rule term

   Location: packages/EffectiveClassNumbers/README.md:131, “L′(E/K,1) = L′(E,1)L(E⊗χ_K,1)”.

   Claim: The displayed derivative identity holds for the elliptic-curve form of the supplier contract without a central-vanishing hypothesis.

   Witness: Differentiating L(E/K,s)=L(E,s)L(E⊗χ_K,s) gives an additional term L(E,1)L′(E⊗χ_K,1). The same paragraph does not assume either factor of that term vanishes.

   Exact repair text: “In general L′(E/K,1)=L′(E,1)L(E⊗χ_K,1)+L(E,1)L′(E⊗χ_K,1). The simplified formula used here assumes L(E,1)=0, established from w_E=−1 for E₅₀₇₇; for the conductor-37 argument apply the product rule in the other order.” Carry the relevant vanishing explicitly in the owned or supplied contract.

24. **F24** (P2) The stated truncation cannot certify the promised derivative bound

   Location: packages/EffectiveClassNumbers/README.md:545–547, “with B = 250”.

   Claim: The displayed absolute tail estimate, added to the 250-term sum, proves |L′(E₅₀₇₇,1)|<10⁻¹².

   Witness: At α=2π/√5077, B=250, r=1, §2.6's geometric tail bound is about 5.2262·10⁻¹⁰. Even its divisor-count majorant exceeds 10⁻¹². BGZ85 line 252 reports numerical agreement, not this error certificate.

   Exact repair text: “Use B=400 and certify the geometric tail is below 10⁻¹⁵; allocate the remaining error budget to the finite sum and its kernel enclosures.” Alternatively state and prove a sharper tail estimate that actually certifies the 250-term calculation. Keep the theorem |L′|<10⁻¹² and its use before exact vanishing.

## Verified sound

Coverage: all 1017 README lines and all 653 Suggested.lean lines; **89 declarations** (11 definitions, 54 theorems, 2 instances, 22 examples); **61 bold target paragraphs**, plus the four C1–C4 hypothesis blocks; **145 Checks assessed**, of which **133** received direct arithmetic or analytic boundary tests (including failed tests reported above); **33 locator groups checked** in eight readable works. These counts include findings and do not mean all declarations were verified true.

Supplier audit: **12 cited roadmap families / 11 supplier blocks** checked for availability and contract matching; the three explicitly supplied QWittVectors, ArithmeticDynamics and ErdosProgressionPowers heads were also searched for ownership. No package citation points to those three. The two unavailable supplier families are recorded in R07. The current ImaginaryQuadraticClassNumber contracts provide the ownership witness in R03–R04. No prior repair report marked these findings settled.

Independent arithmetic reproduced the discriminants and c₄/c₆ values of the three explicit curves; good-reduction point counts at 2,3,5,7,139; θ(15)=1/4 and θ(84)=1/12; every fundamental negative discriminant of magnitude at most 907 and exactly the sixteen class-three values; primality and inert-pattern membership of all three LLS candidates; minimality of the 43- and 67-inert prime candidates by finite prime searches. The κ exponents 302,814, cutoff exponents 604,605, prime-chain inequalities and 165<72log10 agree. Numerical scratch calculations are review witnesses, not Lean certificates.

The contour sign, factor1/d in the degree-four product, expanded residue, atomπ/2 in the nonaxial comparison measure, factorials in the BGZ kernel and third derivative, and distinction between primitive and imprimitive reduced forms survived the tests in the tables. The existing entire-L signatures explicitly bind both differentiability and agreement with the Euler series; their hypotheses do not silently disappear.

Policy checks found a single `import Mathlib`, no `lemma`, `set_option`, admitted data, admitted examples, `True` placeholders, PR numbers or process narrative in the package prose/docstrings, and no tracked changes outside the package. Import validity and example allocation still fail as reported. No Lean command was run.

### Dependency gate

The requested read-only gate returned exit 1 with exactly:

```text
NOT IN ORDER: EffectiveClassNumbers (insert it after its last supplier)
depcheck: 4 roadmaps, 25 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line for this roadmap. Not being in the order at this stage is not a finding. The gate's four-roadmap scan does not certify the existence or content of external supplier contracts; those were checked separately. R13 is the internal subsection cycle. The proposed repairs reuse earlier owners or retain missing prerequisites in this package; none recommends a later supplier.

The requested diff-stat check reports only packages/EffectiveClassNumbers/README.md, Suggested.lean, metadata.toml and review.json (1679 added lines). The report is the only new package output of this pass.

### Sources and locators

All nine cited works were attempted through the sources service. OCR was used for GZ83, GZ86, MW74 and LLS70, with scan inspection where formulas or table columns were ambiguous. The following are locator groups, not claims to have independently proved the cited results. Source line numbers refer to the fetched extraction or its numbered OCR. No source passage is reproduced here.

| Source | Locator checked | Text witness | Result |
|---|---|---|---|
| O85 | Introduction, Theorem1, pp.309–311 | O85 line 91 | Weighted effective statement located |
| O85 | §1.2 p.311 | O85 line 113 | Ideal-class/partial-zeta normalization and unit exceptions |
| O85 | §1.3 (1.3.1)–(1.3.2), p.312 | O85 line 126 | Equation images checked; axial and primitive decomposition |
| O85 | §1.4 p.312 | O85 line 146 | Split-prime norm bound and coefficient count |
| O85 | §2.3 (2.3.1)–(2.3.3), p.313 | O85 line 188 | Symmetric-square normalization located; general bad factors need adapters |
| O85 | §3 C1–C4 p.314 | O85 line 207 | Square support, signs, decay and continuation hypotheses checked |
| O85 | §3.1 p.314–315 | O85 line 229 | Contour zero and strict cutoff checked in image |
| O85 | §3.2 p.315 | O85 line 246 | Residue and contour orientation checked in image |
| O85 | §3.3 Lemmas1–3 pp.315–316 | O85 line 259 | Positive kernel and integrated-cumulative domination checked in images |
| O85 | §3.4 Proposition1, (3.4.2)–(3.4.9), pp.316–318 | O85 line 300 | All three numerical coefficients checked in images |
| O85 | §3.5 Theorem2 and (3.5.1)–(3.5.6), pp.318–319 | O85 line 337 | Theorem location and uniformity; R20 |
| O85 | §3.6 p.319 | O85 line 368 | Family effectivity conclusion located |
| O85 | §4.1 Proposition2 pp.319–320 | O85 line 377 | Coprime modular system and sign hypotheses |
| O85 | §§4.2–4.3 pp.320–321 | O85 line 399 | Images expose copied square-support error R01 |
| O85 | §5.1 p.321 | O85 line 439 | 7000/55 reported; no intermediate constant certificate |
| GZ86 | I §6 (6.3)–(6.5), p.230 | GZ86 line 255 | Normalization over H,K,ℚ; assumptions at line156 |
| GZ86 | I §7 Proposition(7.4), p.231 | GZ86 line 326 | Source model and arithmetic/analytic rank3 |
| GZ86 | I §8 (8.1)–(8.2), p.232 | GZ86 line 334 | Asymptotic,55 prime statement and class-three endpoint |
| GZ83 | Theorems1–2 and Corollaries2–6, pp.85–87 | GZ83 line 42 | Corollary6 proof at line92; image confirms η/CM argument |
| BGZ85 | Equation(2), p.473 | BGZ85 line 52 | Curve and sign convention |
| BGZ85 | §§1–2, (7)–(8), pp.474–476 | BGZ85 line 69 | Height convention, basis and regulator |
| BGZ85 | §4 (10)–(14), pp.478–479 | BGZ85 line 224 | Derivative formula, kernels and reported numerical values |
| BGZ85 | Table2 and §5, p.480 | BGZ85 line 285 | First summands and normalized third derivative |
| MW74 | Theorem p.530 | MW74 line 67 | Exclusion endpoints checked in scan |
| MW74 | §§2–4 Lemmas1–9, pp.530–539 | MW74 line 72 | Hypotheses and phase/error components located; no proof reimplementation |
| MW74 | TableI p.537 | MW74 line 254 | Three brackets and one-unit error statement |
| MW74 | §5 (8), pp.539–542 | MW74 line 337 | Incomplete-gamma calculation located; explicit Hardy scaling remains to certify |
| LLS70 | TableIII p.440 | LLS70 line 317 | Least prime column and sign pattern checked in scan |
| LLS70 | Class number three, pp.445–447 | LLS70 line 566 | List and inert-prime exclusion chain |
| G77 | §1 p.219 | G77 line 27 | Conditional historical starting point |
| G77 | §§2–5 pp.220–225 | G77 line 69 | Conditional rank/vanishing and general principle |
| DLMF | §5.11 (5.11.1) | DLMF line 104 | Continuous log-gamma expansion and sector |
| DLMF | §5.11(ii) | DLMF line 563 | First-neglected-term bound times argument factor |

### Adversarial pass tables


Read every declaration, including proved examples and instances. There are no section variables or include blocks: all hypotheses are explicit. `K : Type` is universe zero in the signatures; no hidden higher-universe claim is inferred. Field/number-field instances exclude zero rings and positive characteristic; DVR, flatness, inseparability and non-quasi-separated-space tests have no carrier in these targets. “Sound” below means no counterexample in the stated tests, not a Lean proof or a replacement for the recorded missing certificates.

| Bold target (README.md line) | Section | Instances tried | Result / change |
|---|---|---|---|
| Radicand of a quadratic field. (:153) | 0.1 | radicands −1,−2,−3,−5 and +2; exclude 0,1 | Arithmetic sound; ownership R04 |
| The discriminant is fundamental. (:155) | 0.1 | D=−3,−4,−8,−20,+8; predicate accepts 1 | Sound; ownership R04 |
| Genus divisibility for every imaginary quadratic field. (:157) | 0.1 | D=−4,−8,−20,−84; exponent t−1 | Sound genus bridge |
| Fields with one ramified prime. (:159) | 0.1 | D=−4,−8,−3; reject −16,−243 | Sound |
| Reduced forms of a fundamental discriminant. (:175) | 0.2 | forms (1,0,1),(2,0,2); primitive versus imprimitive | Sound; missing mirror R18 |
| Class number as a count of reduced forms. (:177) | 0.2 | D=−3,−4,−20,−23,−907; unweighted count | Duplicate R04 |
| The weight θ. (:193) | 0.3 | d=0,1,3,4,8,15,20,23,84,907 | Sound; Checks R19 |
| Split-prime size bound. (:207) | 0.4 | d=3,4,23; p=2,5,7; exclude ramification | Unnecessary exclusion R17 |
| Quadratic character and Liouville agreement. (:221) | 0.5 | n=1,4,5,6 for d=907; n sharing d | Sound arithmetic; supplier R03 |
| Reduced-form decomposition. (:233) | 0.6 | d=23: ν₁=1,ν₂=2,ν₂₃≥1; w=2 versus 4,6 | Sound formula; missing input R12 |
| Nonaxial count and its integrated bound. (:254) | 0.7 | q=(1,1,6), A=0,√23/2,6,12; atom mass π/2 | Normalization sound; general proof not reproduced |
| Goldfeld's completion. (:290) | 1.1 | s=0,1,2; Ψ=0; positive d,M | Product algebra sound; continuation R06 |
| The kernel I_{a,m}. (:319) | 1.3 | a=0,1,−1; m=1,2,3; x=0,1/2,1,2 | Sound with m≥2 and a≥0 where required |
| Comparison of positive measures. (:332) | 1.4 | zero measures; δ₁ versus mean of δ₁/₂ and δ₃/₂ | Integrated comparison sound; local finiteness/integrability explicit |
| Vanishing of the central contour integral. (:351) | 1.5 | even/odd Gaussian times central monomials; order 0,3,4 | Sign and residue sound |
| Residue of the truncated integrand. (:369) | 1.6 | H=G=1; H(1)=0; U=2 strict cutoff | Expanded Lean residue sound; nonzero data justify prose divisions |
| The tail J*. (:388) | 1.7 | d=23 reciprocal-a sum2; M=N/(4π²); U≥1 | Three coefficients match O85 Proposition1; J₂ normalization checked |
| The technical theorem. (:409) | 1.8 | h=1,4; t=1,3; s=0 versus s=2 | Technical source found; typed completion R06 |
| The curve. (:444) | 2.1 | model invariants; (0,0),(−156,77); inverse substitution | Exact algebra checked; source-model isogeny not constructed |
| The curve. (:458) | 2.2 | (0,2),(1,0),(2,0),(0,−2); sign y↦−y | Exact algebra sound |
| Local data of the two curves. (:471) | 2.3 | counts at 2,3,5,7,139; good trace zero | Counts checked; full local reduction computations not reproduced |
| Mordell–Weil ranks. (:484) | 2.4 | height matrix positive determinant; dependent point −2Q₂ | Rank lower-bound reasoning sound; pin normalization R05 |
| The kernels G_r. (:506) | 2.5 | r=0,1,2,3; x≤0 and x>0; derivative factorial | Kernel normalization sound |
| Remainder bounds. (:508) | 2.5 | x=5,r=1,K=1; Y=exp(r−1) | False negative-control R14 |
| The derivative series. (:523) | 2.6 | r=1 versus r=3; coefficient n=0,1,2; Fricke sign | Formula and lower-vanishing hypothesis sound |
| Tail bound. (:531) | 2.6 | r=0,1,3; α>0; B=0,250,400 | Bound sound; inadequate B in application R24 |
| Coefficients from point counts. (:543) | 2.7 | good a₂=−2 for E5077; bad factors 0,±1 | Recurrences sound; finite-model computations need minimality |
| Numerical values. (:545) | 2.7 | first versus third derivative; B=250; central value sign | Ordering R13, missing signatures R15, error budget R24 |
| The height-gap principle. (:563) | 2.8 | η=0; η≥δ; δ≤0 impossible under smallness | Scalar Lean deduction sound; missing geometric supplier R07 |
| The data for E₅₀₇₇. (:565) | 2.8 | K=−7; rational point versus half a rational point | Descent/constant inputs R16; height drift R05 |
| The η-quotient u. (:578) | 2.9 | cusp orders ±3; exponents ±1 versus ±2; q-leading terms | Normalization agrees with GZ83 |
| The CM relation. (:591) | 2.10 | norm of (3+√−139)/2=37; roots of unity; h=3 | GZ83 relation checked; general ramified interface R22 |
| Vanishing of L′(E₁₃₉,1). (:604) | 2.11 | three Galois conjugates; degree-three fiber; base L(1)≠0 | GZ83 argument checked; supplier R07 and product term R23 |
| Rank three for E₁₃₉. (:616) | 2.12 | odd sign; derivative zero and nonzero third derivative | Source rank-three proposition checked; dependencies R07,R13 |
| Rank three for E₅₀₇₇. (:628) | 2.13 | same test with E5077; normalized third derivative 1.7318… | Source value checked; dependencies R05,R07,R13,R16,R24 |
| The Liouville product and its local factors. (:656) | 3.1 | good p=5 with a₅=0; multiplicative/additive p; twistgood | False good-prime clause R10; missing local types R11 |
| Continuation and the simple zero. (:664) | 3.1 | self-pair versus norm twist; ζ pole factor 2; completed growth | Derivative factor 2 sound; supplier drift R09 |
| The system for coprime discriminants. (:677) | 3.2 | K=−23 versus −7 for E5077; p ramified in K | Sign distinction sound; totalization R06 |
| Overlapping conductors. (:689) | 3.3 | p=139 shared ramification; restored good local factor | Square-support failure R01; missing local theory R11 |
| The cases for E₁₃₉. (:691) | 3.3 | a₁₃₉(curve37)=−4; both ε; scales at 37 and139 | Local coefficient checked; replacement fails R01 |
| The explicit constants. (:704) | 3.4 | fixed Ψ,M versus finitely many local corrections | Constants are targets; quantitative certificates unavailable |
| Exclusion of −5077. (:717) | 3.5 | −5077 mod4=3; +5077 versus negative discriminant | Sound |
| The constant 7000. (:729) | 3.6 | d=3,4; 37 split versus nonsplit/ramified | Claim supported by O85; broken route R01 |
| The constant 55. (:741) | 3.7 | d prime versus composite; 5077∣d; splitting branch | Statement supported; strictness quantified in source |
| The majorant C_c(t). (:770) | 4.1 | t=0,1,2; c=0,55,7000 | Definition sound; excess examples R19 |
| Domination and growth. (:783) | 4.2 | c=0 versus c>0; t=0; p=2,3; nonmonotone floors | Inequalities and direction checked |
| Bounds in terms of t. (:796) | 4.3 | t=1; θ=1; noncoprime branch omitted only where stated | Combination sound |
| The n-th prime and the sum of p^(−1/2). (:808) | 4.4 | n=0,1 harmless; large n; integral of 1/√(x log x) | Asymptotics sound; supplier drift R08 |
| Growth of log C_c(t). (:820) | 4.5 | c<1,c=1,c>1; fixed log c; remainder log t | Leading constant 4 sound |
| The witness. (:832) | 4.6 | q≤0,q=1,1/2,1/4; ceiling exponents 302,814 | Arithmetic checked; excess examples R19 |
| The effective bound. (:845) | 4.7 | h=1; d=3,4; q≥1; ε≥q and log d>1 | Uniform exponent comparison sound |
| A computable cutoff. (:858) | 4.8 | H=0 impossible; H=1; exp versus power-of-two cutoff | Constants604,605 and strictness checked |
| Comparison. (:870) | 4.9 | ε small versus ≥1/2; effectivity of chosen rational q | Comparison sound; supplier locators R08 |
| Reduction to prime discriminants. (:898) | 5.1 | D=−4,−8,−3 excluded by h; p≡7 mod8 gives p≤32 | Sound |
| The completed function and its Hardy function. (:910) | 5.2 | odd Γ((s+1)/2); t=0; continuous log branch | Phase normalization sound; exact approximate-FE scaling not certified |
| Three zeros on the critical line. (:923) | 5.3 | k=17923,115147,123204; χ(2)=−1,−1,0 | Brackets support found; endpoint signs not recomputed |
| No class number three for 10¹² ≤ d ≤ 10²⁵⁰⁰. (:936) | 5.4 | closed endpoints 10¹²,10⁵²,10²⁵⁰⁰; two windows | MW source supports exclusion; interval certification not reproduced |
| Inert patterns. (:948) | 5.5 | x=0,1,2; composite77683; positive candidates43,67,163 | Membership checked; minima 43,67 independently checked |
| No class number three for 907 < d < 10¹². (:961) | 5.6 | 318028; transitions43→67→163; p<10¹² | Integer chain checked; exhaustive forms to318028 not reproduced |
| The cutoff. (:973) | 5.7 | log p<165; 165<72log10; d=5077 impossible | Combination sound |
| The list. (:985) | 5.8 | all negative fundamental D with abs(D)≤907; reject−243 | Exact list reproduced; converse existence belongs to R04 owner |
| C1 (:306; hypothesis block) | 1.2 | n=139 nonsquare; n=m² | R01 |
| C2 (:307; hypothesis block) | 1.2 | zero roots, ramified factors, p=2 | General rational local form valid; R11 incomplete applications |
| C3 (:308; hypothesis block) | 1.2 | s=0 versus2; odd versus even sign | R06 |
| C4 (:309; hypothesis block) | 1.2 | simple zero versus order≥3 of L; strip boundary1 | Source matches; R09 missing growth adapter |

Every declaration context and test follows; the sole additional quantification inside a consequent is expanded explicitly for `oesterleTechnical`.

| Statement (Suggested.lean line) | Section and explicit context | Instances tried | Result / change |
|---|---|---|---|
| `isFundamentalDiscriminant_discr` (:42) | Layer0; theorem isFundamentalDiscriminant_discr (K : Type) [Field K] [NumberField K]     (hdeg : Module.finrank ℚ K = 2) | D=−3,−4,−8,−20,−84; +8 for fundamental claim | Sound arithmetic; R04 ownership |
| `two_pow_sub_one_dvd_classNumber` (:51) | Layer0; theorem two_pow_sub_one_dvd_classNumber (K : Type) [Field K] [NumberField K]     (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0) | D=−3,−4,−8,−20,−84; +8 for fundamental claim | Sound arithmetic; R04 ownership |
| `discr_of_card_primeFactors_eq_one` (:58) | Layer0; theorem discr_of_card_primeFactors_eq_one (K : Type) [Field K] [NumberField K]     (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0)     (ht : (NumberField.discr K).natAbs.primeFactors.card = 1) | D=−3,−4,−8,−20,−84; +8 for fundamental claim | Sound arithmetic; R04 ownership |
| `ramifiedWeight` (:67) | Layer0; def ramifiedWeight (d : ℕ) | d=0,1,3,4,8,15,20,84,907; odd h | Sound; R19 tests |
| `ramifiedWeight_pos` (:72) | Layer0; theorem ramifiedWeight_pos (d : ℕ) | d=0,1,3,4,8,15,20,84,907; odd h | Sound; R19 tests |
| `ramifiedWeight_le_one` (:75) | Layer0; theorem ramifiedWeight_le_one (d : ℕ) | d=0,1,3,4,8,15,20,84,907; odd h | Sound; R19 tests |
| `ramifiedWeight_eq_one_of_odd_classNumber` (:78) | Layer0; theorem ramifiedWeight_eq_one_of_odd_classNumber (K : Type) [Field K] [NumberField K]     (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0)     (hodd : Odd (NumberField.classNumber K)) | d=0,1,3,4,8,15,20,84,907; odd h | Sound; R19 tests |
| `example@85` (:85) | Layer0; example | : ramifiedWeight 0 = 1 | Direct definition/predicate calculation checked; R19 allocation and mirrors |
| `example@87` (:87) | Layer0; example | : ramifiedWeight 907 = 1 | Direct definition/predicate calculation checked; R19 allocation and mirrors |
| `splitPrime_size` (:92) | Layer0; theorem splitPrime_size (K : Type) [Field K] [NumberField K]     (hdeg : Module.finrank ℚ K = 2) (hd : NumberField.discr K < -4)     (p : ℕ) (hp : p.Prime) (hunram : ¬ (p : ℤ) ∣ NumberField.discr K)     (hsplit : ∃ P : Ideal (𝓞 K), P.IsPrime ∧ P.absNorm = p) | d=3,4,23; split p=2,5,7 | R17 |
| `liouville_agreement` (:101) | Layer0; theorem liouville_agreement (χ : ArithmeticFunction ℤ) (n : ℕ)     (hone : χ 1 = 1) (hmul : ∀ m k : ℕ, χ (m * k) = χ m * χ k) (hn : 0 < n)     (hinert : ∀ p ∈ n.primeFactors, χ p = -1) | n=1, prime, prime square, two primes; χ(0)=0 | Sound scalar arithmetic; R03 supplier |
| `goldfeldCompletion` (:114) | Layer1; def goldfeldCompletion (d : ℕ) (M : ℝ) (Ψ G : ℂ → ℂ) | d=0 at s=1; d,M>0 in product; s=0,1,2 | Product identities sound; R06 continuation |
| `goldfeldCompletion_one` (:118) | Layer1; theorem goldfeldCompletion_one (d : ℕ) (M : ℝ) (Ψ G : ℂ → ℂ) | d=0 at s=1; d,M>0 in product; s=0,1,2 | Product identities sound; R06 continuation |
| `goldfeldCompletion_product` (:123) | Layer1; theorem goldfeldCompletion_product (d N Nχ : ℕ) (hd : 0 < d) (hN : 0 < N) (hNχ : 0 < Nχ)     (Ψ G L Lχ : ℂ → ℂ) (hprod : ∀ s, Ψ s * G s = L s * Lχ s) (s : ℂ) | d=0 at s=1; d,M>0 in product; s=0,1,2 | Product identities sound; R06 continuation |
| `example@132` (:132) | Layer1; example | : goldfeldCompletion 2 3 (fun _ ↦ 2) (fun _ ↦ 5) 1 = 30 | Direct definition/predicate calculation checked; R19 allocation and mirrors |
| `example@136` (:136) | Layer1; example (d : ℕ) (M : ℝ) (G : ℂ → ℂ) | (d : ℕ) (M : ℝ) (G : ℂ → ℂ) :     goldfeldCompletion d M (fun _ ↦ 0) G = fun _ ↦ 0 | Direct definition/predicate calculation checked; R19 allocation and mirrors |
| `inverseMellinKernel` (:141) | Layer1; def inverseMellinKernel (a : ℝ) (m : ℕ) | m=1,2,3; a=0,1,−1; x=0,1/2,1,2 | Sound within stated hypotheses |
| `inverseMellinKernel_convexOn` (:146) | Layer1; theorem inverseMellinKernel_convexOn (a : ℝ) (m : ℕ) (ha : 0 ≤ a) (hm : 2 ≤ m) | m=1,2,3; a=0,1,−1; x=0,1/2,1,2 | Sound within stated hypotheses |
| `inverseMellinKernel_mellin` (:151) | Layer1; theorem inverseMellinKernel_mellin (a : ℝ) (m : ℕ) (hm : 2 ≤ m) (s : ℂ) (hs : a < s.re) | m=1,2,3; a=0,1,−1; x=0,1/2,1,2 | Sound within stated hypotheses |
| `example@156` (:156) | Layer1; example | : inverseMellinKernel 0 2 2 = 0 | Direct definition/predicate calculation checked; R19 allocation and mirrors |
| `example@159` (:159) | Layer1; example | : inverseMellinKernel 0 2 (1 / 2) = Real.log 2 | Direct definition/predicate calculation checked; R19 allocation and mirrors |
| `positiveMellin_comparison` (:164) | Layer1; theorem positiveMellin_comparison (a x : ℝ) (m : ℕ) (ha : 0 ≤ a) (hx : 0 < x) (hm : 2 ≤ m)     (μ ν : Measure ℝ) (hμ : μ (Set.Iic 0) = 0) (hν : ν (Set.Iic 0) = 0)     (hlocμ : ∀ t : ℝ, μ (Set.Ioc 0 t) ≠ ⊤) (hlocν : ∀ t : ℝ, ν (Set.Ioc 0 t) ≠ ⊤)     (hdom : ∀ T : ℝ, 0 ≤ T →       (∫ t in Set.Icc 0 T, (μ (Set.Ioc 0 t)).toReal) ≤         ∫ t in Set.Icc 0 T, (ν (Set.Ioc 0 t)).toReal)     (hintμ : Integrable (fun t ↦ inverseMellinKernel a m (x * t)) μ)     (hintν : Integrable (fun t ↦ inverseMellinKernel a m (x * t)) ν) | zero measures; two-atom mean versus δ₁ | Sound integrated order; explicit finite/integrable binders |
| `fundamentalContour` (:178) | Layer1; theorem fundamentalContour (F : ℂ → ℂ) (hentire : Differentiable ℂ F)     (hFE : ∀ s, F s = F (2 - s)) (hzero : ∀ j : ℕ, j < 3 → iteratedDeriv j F 1 = 0)     (hdecay : ∀ A B : ℝ, ∀ r : ℕ, ∃ C : ℝ, 0 < C ∧ ∀ s : ℂ,       A ≤ s.re → s.re ≤ B → 1 ≤ \|s.im\| → ‖F s‖ ≤ C / \|s.im\| ^ r)     (σ : ℝ) (hσ : 3 / 2 < σ) | Gaussian even, odd, order0,3,4 | Sound sign and central-zero conditions |
| `truncatedResidue` (:187) | Layer1; theorem truncatedResidue (d : ℕ) (hd : 0 < d) (H G : ℂ → ℂ)     (hH : AnalyticAt ℂ H 1) (hG : AnalyticAt ℂ G 1) | H=G=1; H(1)=0; d=1 | Sound expanded residue without division |
| `oesterleTechnical` (:196) | Layer1; M>0; Ψ,a,U and coefficient/analytic/decay inputs; consequent quantifies K:Type, [Field K],[NumberField K], degree2, D<−4, G,b,ν,Gp,α,β,α′,β′ and displayed hypotheses | s=0,2 for genuine modular F; h=4 | R06 forced entire-completion representation |
| `curve139` (:240) | Layer2; def curve139 | invariants; point(−156,77); nonpoint(0,0); inverse substitution | Exact identities checked; R19 docstring on instance |
| `curve37` (:243) | Layer2; def curve37 | Δ37,c₄160,c₆−2008; #E(F₅)=6 | Exact identities checked; R19 missing example |
| `curve5077` (:246) | Layer2; def curve5077 | points(0,2),(1,0),(2,0); nonpoint(0,−2) | Exact identities checked; R19 instance docstring |
| `curve139_discriminant` (:249) | Layer2; theorem curve139_discriminant | invariants; point(−156,77); nonpoint(0,0); inverse substitution | Exact identities checked; R19 docstring on instance |
| `curve37_discriminant` (:255) | Layer2; theorem curve37_discriminant | Δ37,c₄160,c₆−2008; #E(F₅)=6 | Exact identities checked; R19 missing example |
| `curve5077_discriminant` (:261) | Layer2; theorem curve5077_discriminant | points(0,2),(1,0),(2,0); nonpoint(0,−2) | Exact identities checked; R19 instance docstring |
| `curve139_isElliptic` (:266) | Layer2; instance curve139_isElliptic | invariants; point(−156,77); nonpoint(0,0); inverse substitution | Exact identities checked; R19 docstring on instance |
| `curve5077_isElliptic` (:269) | Layer2; instance curve5077_isElliptic | points(0,2),(1,0),(2,0); nonpoint(0,−2) | Exact identities checked; R19 instance docstring |
| `curve139_c₄_c₆` (:274) | Layer2; theorem curve139_c₄_c₆ | invariants; point(−156,77); nonpoint(0,0); inverse substitution | Exact identities checked; R19 docstring on instance |
| `curve139_source_equation` (:281) | Layer2; theorem curve139_source_equation (X Y : ℚ) | invariants; point(−156,77); nonpoint(0,0); inverse substitution | Exact identities checked; R19 docstring on instance |
| `example@289` (:289) | Layer2; example | : ¬ curve139.toAffine.Equation 0 0 | Direct definition/predicate calculation checked; R19 allocation and mirrors |
| `example@292` (:292) | Layer2; example | : curve139.toAffine.Equation (-156) 77 | Direct definition/predicate calculation checked; R19 allocation and mirrors |
| `example@296` (:296) | Layer2; example | : curve5077.toAffine.Equation 0 2 ∧ curve5077.toAffine.Equation 1 0 ∧     curve5077.toAffine.Equation 2 0 | Direct definition/predicate calculation checked; R19 allocation and mirrors |
| `example@300` (:300) | Layer2; example | : ¬ curve5077.toAffine.Equation 0 (-2) | Direct definition/predicate calculation checked; R19 allocation and mirrors |
| `curve_local_data` (:305) | Layer2; theorem curve_local_data | good trace0 versus additive0; bad nonsplit−1 | Compatible with stated curves; full local certificate not reproduced |
| `mordellWeilRank_eq_three` (:309) | Layer2; theorem mordellWeilRank_eq_three | rank lower bound versus upper bound; torsion reductions | Source supports rank; descent certificate not reproduced |
| `bgzKernel` (:317) | Layer2; def bgzKernel (r : ℕ) | r=0,1,2,3; x=0,1,2; factorial | Sound; r≥1 explicit in derivative |
| `bgzKernel_hasDerivAt` (:323) | Layer2; theorem bgzKernel_hasDerivAt (r : ℕ) (hr : 1 ≤ r) (x : ℝ) (hx : 0 < x) | r=0,1,2,3; x=0,1,2; factorial | Sound; r≥1 explicit in derivative |
| `bgzKernel_le` (:328) | Layer2; theorem bgzKernel_le (r : ℕ) (x : ℝ) (hx : 0 < x) | r=0,1,2,3; x=0,1,2; factorial | Sound; r≥1 explicit in derivative |
| `example@332` (:332) | Layer2; example | : bgzKernel 0 1 = Real.exp (-1) | Direct definition/predicate calculation checked; R19 allocation and mirrors |
| `example@334` (:334) | Layer2; example | : bgzKernel 3 0 = 0 | Direct definition/predicate calculation checked; R19 allocation and mirrors |
| `centralDerivative_series` (:338) | Layer2; theorem centralDerivative_series (N r : ℕ) (hN : 0 < N) (hr : Odd r) (a : ℕ → ℝ) (L : ℂ → ℂ)     (hcoeff : ∀ n : ℕ, \|a n\| ≤ (n.divisors.card : ℝ) * Real.sqrt n)     (hentire : Differentiable ℂ L)     (hseries : ∀ s : ℂ, 3 / 2 < s.re → L s = LSeries (fun n ↦ (a n : ℂ)) s)     (hFricke : ∀ y : ℝ, 0 < y →       (∑' n : ℕ, a n * Real.exp (-2 * Real.pi * n / (y * Real.sqrt N))) =         -y ^ 2 * ∑' n : ℕ, a n * Real.exp (-2 * Real.pi * n * y / Real.sqrt N))     (hzero : ∀ j : ℕ, j < r → iteratedDeriv j L 1 = 0) | r=1,3; a₀=0 forced by bound; zero sequence | Sound Fricke sign and explicit lower vanishing |
| `heegnerHeight_gap` (:353) | Layer2; theorem heegnerHeight_gap (a b : ℂ) (c δ η : ℝ) (hc : 0 < c) (hb : b ≠ 0)     (hformula : a * b = ((c * η : ℝ) : ℂ)) (hgap : η = 0 ∨ δ ≤ η) (hsmall : ‖a * b‖ < c * δ) | η=0 or η≥δ; δ≤0 impossible | Scalar deduction sound; geometric interface R07,R16 |
| `curve5077_height_gap` (:370) | Layer2; theorem curve5077_height_gap (P : curve5077.toAffine.Point) (hP : P ≠ 0) | P=O excluded; P₁ height≈0.668 | R05: true weaker inequality misidentifies normalization |
| `heegnerTrace_139` (:376) | Layer2; theorem heegnerTrace_139 (L : ℂ → ℂ) (hentire : Differentiable ℂ L)     (hseries : ∀ s : ℂ, 3 / 2 < s.re → L s = curve139.LSeries s) | entire L versus totalized series; finite analytic order | Statements consistent with sources; route R07,R13 |
| `rankThree_139` (:382) | Layer2; theorem rankThree_139 (L : ℂ → ℂ) (hentire : Differentiable ℂ L)     (hseries : ∀ s : ℂ, 3 / 2 < s.re → L s = curve139.LSeries s) | entire L versus totalized series; finite analytic order | Statements consistent with sources; route R07,R13 |
| `curve139_third_deriv_bounds` (:390) | Layer2; theorem curve139_third_deriv_bounds (L : ℂ → ℂ) (hentire : Differentiable ℂ L)     (hseries : ∀ s : ℂ, 3 / 2 < s.re → L s = curve139.LSeries s) | entire L versus totalized series; finite analytic order | Statements consistent with sources; route R07,R13 |
| `rankThree_5077` (:397) | Layer2; theorem rankThree_5077 (L : ℂ → ℂ) (hentire : Differentiable ℂ L)     (hseries : ∀ s : ℂ, 3 / 2 < s.re → L s = curve5077.LSeries s) | entire L versus totalized series; finite analytic order | Statements consistent with sources; route R07,R13,R16,R24 |
| `exceptional_5077` (:412) | Layer3; theorem exceptional_5077 (K : Type) [Field K] [NumberField K]     (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0) | −5077≡3 mod4 | Sound |
| `example@420` (:420) | Layer3; example | : ¬ TauCeti.Multiquadratic.IsFundamentalDiscriminant (-5077) | Direct definition/predicate calculation checked; R19 allocation and mirrors |
| `global_7000` (:424) | Layer3; theorem global_7000 (K : Type) [Field K] [NumberField K]     (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0) | d=3,4; t=1; 5077 coprimality | Source-supported statements; route R01,R06 |
| `coprime_55` (:431) | Layer3; theorem coprime_55 (K : Type) [Field K] [NumberField K]     (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0)     (hcop : (NumberField.discr K).natAbs.Coprime 5077) | d=3,4; t=1; 5077 coprimality | Source-supported statements; route R01,R06 |
| `primeDiscriminant_55_strict` (:439) | Layer3; theorem primeDiscriminant_55_strict (K : Type) [Field K] [NumberField K]     (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0)     (hprime : (NumberField.discr K).natAbs.Prime)     (hcop : (NumberField.discr K).natAbs.Coprime 5077) | d=3,4; t=1; 5077 coprimality | Source-supported statements; route R01,R06 |
| `primeMajorant` (:453) | Layer4; def primeMajorant (c : ℝ) (t : ℕ) | t=0,1,2; c=0 versus c>0; d>1 | Sound inequalities; R19 examples |
| `primeMajorant_weight` (:459) | Layer4; theorem primeMajorant_weight (d : ℕ) (hd : 1 < d) (c : ℝ) (hc : 0 ≤ c) | t=0,1,2; c=0 versus c>0; d>1 | Sound inequalities; R19 examples |
| `primeMajorant_log_le` (:464) | Layer4; theorem primeMajorant_log_le (c : ℝ) (hc : 0 < c) (t : ℕ) | t=0,1,2; c=0 versus c>0; d>1 | Sound inequalities; R19 examples |
| `example@469` (:469) | Layer4; example | : primeMajorant 7000 0 = 7000 | Direct definition/predicate calculation checked; R19 allocation and mirrors |
| `example@471` (:471) | Layer4; example | : primeMajorant 55 1 = 55 | Direct definition/predicate calculation checked; R19 allocation and mirrors |
| `example@473` (:473) | Layer4; example | : primeMajorant 55 2 = 55 * (3 / (3 - 2 * Real.sqrt 2)) | Direct definition/predicate calculation checked; R19 allocation and mirrors |
| `explicitT_bound` (:478) | Layer4; theorem explicitT_bound (K : Type) [Field K] [NumberField K]     (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0) | t=0,1,2; c=0 versus c>0; d>1 | Sound inequalities; R19 examples |
| `nth_prime_isEquivalent` (:490) | Layer4; theorem nth_prime_isEquivalent | n=0,1 ignored by atTop; leading constants1,2,4 | Sound asymptotics; R08 supplier |
| `sum_inv_sqrt_nth_prime_isEquivalent` (:495) | Layer4; theorem sum_inv_sqrt_nth_prime_isEquivalent | n=0,1 ignored by atTop; leading constants1,2,4 | Sound asymptotics; R08 supplier |
| `primeMajorant_log_asymptotic` (:501) | Layer4; theorem primeMajorant_log_asymptotic (c : ℝ) (hc : 0 < c) | n=0,1 ignored by atTop; leading constants1,2,4 | Sound asymptotics; R08 supplier |
| `effectiveKappa` (:507) | Layer4; def effectiveKappa (q : ℚ) | q=0,1,1/2,1/4; ε≥q; H=0 impossible | Exact rational exponents and comparison checked; R19 |
| `effectiveKappa_pos` (:512) | Layer4; theorem effectiveKappa_pos (q : ℚ) (hq : 0 < q) | q=0,1,1/2,1/4; ε≥q; H=0 impossible | Exact rational exponents and comparison checked; R19 |
| `example@516` (:516) | Layer4; example | : effectiveKappa 0 = 0 | Direct definition/predicate calculation checked; R19 allocation and mirrors |
| `example@518` (:518) | Layer4; example | : effectiveKappa 1 = 1 / 2 | Direct definition/predicate calculation checked; R19 allocation and mirrors |
| `example@520` (:520) | Layer4; example | : effectiveKappa (1 / 2) = 1 / 2 ^ 302 | Direct definition/predicate calculation checked; R19 allocation and mirrors |
| `example@524` (:524) | Layer4; example | : effectiveKappa (1 / 4) = 1 / 2 ^ 814 | Direct definition/predicate calculation checked; R19 allocation and mirrors |
| `effectiveLogarithmic_bound` (:530) | Layer4; theorem effectiveLogarithmic_bound (K : Type) [Field K] [NumberField K]     (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0)     (q : ℚ) (hq : 0 < q) (ε : ℝ) (hqε : (q : ℝ) ≤ ε) | q=0,1,1/2,1/4; ε≥q; H=0 impossible | Exact rational exponents and comparison checked; R19 |
| `effective_cutoff` (:538) | Layer4; theorem effective_cutoff (K : Type) [Field K] [NumberField K]     (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0) (H : ℕ)     (hH : NumberField.classNumber K = H) | q=0,1,1/2,1/4; ε≥q; H=0 impossible | Exact rational exponents and comparison checked; R19 |
| `classThree_prime` (:552) | Layer5; theorem classThree_prime (K : Type) [Field K] [NumberField K]     (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0)     (hthree : NumberField.classNumber K = 3) | D=−4,−8; odd class number; p≡7 mod8 | Sound |
| `mwZero_brackets` (:560) | Layer5; theorem mwZero_brackets (k : ℕ) [NeZero k] (hk : k = 17923 ∨ k = 115147 ∨ k = 123204)     (χ : DirichletCharacter ℂ k) (hprim : χ.IsPrimitive) (hodd : χ (-1) = -1)     (hoddPrimes : ∀ p : ℕ, (hp : p.Prime) → p ≠ 2 →       χ p = (@legendreSym p ⟨hp⟩ (-(k : ℤ)) : ℂ))     (htwo : χ 2 = (ZMod.χ₈ (-(k : ZMod 8)) : ℂ)) | three conductors; even-conductor χ₂=0; endpoints | Source supports all three; no interval sign recomputation |
| `montgomeryWeinberger` (:574) | Layer5; theorem montgomeryWeinberger (K : Type) [Field K] [NumberField K]     (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0)     (hlo : 10 ^ 12 ≤ (NumberField.discr K).natAbs)     (hhi : (NumberField.discr K).natAbs ≤ 10 ^ 2500) | 10¹² and10²⁵⁰⁰ endpoints; overlapping windows | Source statement checked; proof certificates not reproduced |
| `IsInertPrime` (:583) | Layer5; def IsInertPrime (x p : ℕ) | x≤2; composite77683; three prime candidates | Membership all three; minima 43,67 recomputed;163 source only |
| `leastInertPrime_43` (:588) | Layer5; theorem leastInertPrime_43 | x≤2; composite77683; three prime candidates | Membership all three; minima 43,67 recomputed;163 source only |
| `leastInertPrime_67` (:592) | Layer5; theorem leastInertPrime_67 | x≤2; composite77683; three prime candidates | Membership all three; minima 43,67 recomputed;163 source only |
| `leastInertPrime_163` (:596) | Layer5; theorem leastInertPrime_163 | x≤2; composite77683; three prime candidates | Membership all three; minima 43,67 recomputed;163 source only |
| `example@601` (:601) | Layer5; example | : ¬ IsInertPrime 43 77683 | Direct definition/predicate calculation checked; R19 allocation and mirrors |
| `smallRange_sieve` (:604) | Layer5; theorem smallRange_sieve (K : Type) [Field K] [NumberField K]     (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0)     (hlo : 907 < (NumberField.discr K).natAbs) (hhi : (NumberField.discr K).natAbs < 10 ^ 12) | p=907,10¹²; chain constants | Source-backed chain checked; no full range enumeration |
| `classThree_cutoff` (:611) | Layer5; theorem classThree_cutoff (K : Type) [Field K] [NumberField K]     (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0)     (hthree : NumberField.classNumber K = 3) | p=907,10¹²; chain constants | Source-backed chain checked; no full range enumeration |
| `classThreeDiscriminants` (:618) | Layer5; def classThreeDiscriminants | all fundamental negative D to907; list cardinal16 | Enumeration checked; R19 missing definition tests |
| `classThree_enumeration` (:623) | Layer5; theorem classThree_enumeration (K : Type) [Field K] [NumberField K]     (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0) | all fundamental negative D to907; list cardinal16 | Enumeration checked; R19 missing definition tests |
| `example@630` (:630) | Layer5; example | : ¬ TauCeti.Multiquadratic.IsFundamentalDiscriminant (-243) | Direct definition/predicate calculation checked; R19 allocation and mirrors |

## Not verifiable

- **O88 §§8–9, pp.66–67:** the DOI lookup/landing page did not deliver the article, and the institutional content endpoint returned browser-verification HTML. The fetch status alone was misleading. Its model comparison, precise height argument and intermediate 7000/55 computations were not certified. The single missing-reference request records this work with full bibliographic data; LLS70's earlier access failure was resolved and removed from the pending request.
- **Lean elaboration and inferred types:** no Lean build or elaboration was run, as required. The written binder scopes and pinned source definitions were checked. R02 already prevents importing the submitted file at the required pin; other proof-script elaboration failures cannot be excluded.
- **Full numerical proof certificates:** the exact 139-curve descent/Selmer upper bound, height intervals and saturation, explicit lower bound for the Gross–Zagier constant, rational enclosures yielding 7000/55, MW endpoint signs and interval exclusions, and minimality of the 163-inert candidate up to 1432817816347 were not independently certified. Source support and finite arithmetic checks are identified separately above. R24 is an actual failing error budget, not merely an unavailable certificate.
- **Whole-current-head availability for other suppliers:** the required three sibling checkouts were inspected directly. The four other open supplier READMEs were read from the provided head-index snapshot, with the recorded heads in the findings; no claim is made that a later remote update cannot have superseded that snapshot. RankZeroOneBSD and GrossZagierAndArithmeticHeights have no readable contract among the authorized inputs.
- **General analytic subproofs:** no complete proof of the integrated lattice inequality, all ramified Weil–Deligne comparisons, gamma-growth adapter or the Hardy-function approximate-functional-equation scaling was reconstructed. Located references do not discharge missing owned interfaces or mathematical contradictions.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "cdb320a1fefa3003ef4c83015fe20e5e10a4d735", "job": "RT-EffectiveClassNumbers~1a", "model": "gpt-6-astra", "worker": "chris-1"} -->
