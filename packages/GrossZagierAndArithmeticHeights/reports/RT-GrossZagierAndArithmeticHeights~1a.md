<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/147#issuecomment-6325652852 -->
Red team round 1 pass a (codex) of 140543f

Verdict: needs_changes

1. **F01** (P2) The normalization discussion identifies the wrong library pin

   **Location:** packages/GrossZagierAndArithmeticHeights/README.md:281: “the pin at which Suggested.lean elaborates”. Also lines 11, 13, 25 and 295.

   **Claim:** The supplied pin is f790474, its canonical height is h_(O), and its Hasse theorem is unavailable.

   **Witness:** lake-manifest.json:8 pins TauCeti to a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean:120 defines the limit with denominator 4^n; its line 161 proves convergence to that value.

   **Exact repair text:** Replace the version discussion with: “At the supplied Tau Ceti pin a91d3aaf, `Point.canonicalHeight` is h_x, `neronTatePairing` is its half polar form B_x, and `regulator` is the absolute Gram determinant of B_x. All comparisons below use this pin.” Delete the f790474 exception and version Check; cite the pinned Hasse declarations directly.

2. **F02** (P1) The integral differential proof consumes its own downstream bounds

   **Location:** packages/GrossZagierAndArithmeticHeights/README.md:1079 and :1261: “These local and cusp-expansion bounds are proved here”.

   **Claim:** §3.1 uses CNS local Whittaker bounds to construct integral differentials; §3.8 owns those bounds and needs §3.1.

   **Witness:** README.md:1079 uses CNS Proposition 5.14/Theorem 5.15; :1261 assigns their inputs, Theorems 3.14–3.15/4.6, to §3.8; :1267 explicitly makes §3.8 depend on §3.1.

   **Exact repair text:** Insert a target preceding §3.1: “Integral Whittaker and cusp-expansion bounds. On the supplied normalized local newvector, prove CNS Theorem 3.14 over its odd-residue-characteristic local fields, Theorem 3.15 over Q₂, and Theorem 4.6 with its stated cusp, character and conductor hypotheses. These targets depend only on local representation theory, local factors and cusp charts.” Make §3.1 depend on this target and remove ownership of these bounds from §3.8. Retain §3.8’s dependence on §3.1 for the resulting Manin bound.

3. **F03** (P1) Bounded support does not make the pseudo-theta sum converge

   **Location:** packages/GrossZagierAndArithmeticHeights/README.md:1772: “Bounded bad-place support and positive definite Gaussian decay give local finiteness/convergence”.

   **Claim:** Local constancy and bounded support on V₁−V₀ suffice for convergence of every pseudo-theta datum in §6.5.

   **Witness:** Take F=Q, V₁=V=Q² positive definite, V₀={0}, S={p}, u=1. Set φ′(x,1)=exp(p^(4n)) on min ord_p(x_i)=n≥0. At x=p^n e₁, summands exp(p^(4n)−2πp^(2n)) do not tend to zero.

   **Exact repair text:** Add to `pseudoTheta_constructor`: “Require compact support in u. For V₀=∅ use Schwartz data; otherwise impose a quantitative growth bound near V₀, uniform for g in compact subsets: on the bounded x-support, |φ′_v(g,x,u)|≤C(1+|log dist_v(x,V₀)|)^m, with the analogous bounds after every operation used below. Prove these bounds for the local intersection and derivative functions before forming their sums. Gaussian decay then supplies absolute and locally uniform convergence; bounded support alone does not.” Replace “locally finite” in the constructor by “absolutely and locally uniformly convergent.” Add the displayed shell function as a rejected Check. The same omission in a cited definition does not establish the convergence assertion.


4. **F04** (P1) The general kernel identity uses only maximal-level Colmez targets

   **Location:** packages/GrossZagierAndArithmeticHeights/README.md:3902: “combines the projected derivative decomposition 6.56”; also :3906 and :3928.

   **Claim:** §7.47 establishes the identity for all data (D) using §§6.56, 7.12 and 7.32.

   **Witness:** Those three prerequisites explicitly assume (Q′), at README.md:2691, :3274 and :3656. Block (Q′), :80, requires maximal U and excludes common ramification; (D), :81, permits deep U and common ramification.

   **Exact repair text:** Add separate general targets before §7.47: “Projected derivative decomposition for data (D), including its character average and convergence”; “CM multiplicity and diagonal-omission formulas for the deep principal levels in (D)”; “Vertical-kernel decomposition for those levels”; and “Full height decomposition for (D), including the terms of §7.65.” State their full formulas and hypotheses and cite the corresponding YZZ/Disegni locators. Make §7.47 consume these targets. Keep the existing maximal-order Colmez computations as specializations; do not restrict the general Gross–Zagier theorem to (Q′).

5. **F05** (P1) Placewise finiteness is asserted for the whole derivative series

   **Location:** packages/GrossZagierAndArithmeticHeights/README.md:2703: “Only finitely many v contribute.”

   **Claim:** The place sum of the full mixed theta–Eisenstein derivative has a fixed finite support.

   **Witness:** Take F=Q, E=Q(i), standard finite data. For every p≡3 mod4, B(p) contains j²=−p. At y=j,u=1, §7.25's good-place formula gives k_p(1,j,1)=log p, a nonzero Fourier contribution.

   **Exact repair text:** Replace the final sentence with: “For each fixed nonzero Fourier index only finitely many places contribute. The complete derivative is the convergent sum of the placewise kernels; its support in places need not be finite. The analytic-minus-arithmetic correction vanishes outside a fixed finite exceptional set, as proved in §7.25.” Supply the coefficientwise finiteness and convergence arguments in the outline; do not infer them from finite bad-place support.

6. **F06** (P1) The dyadic CM case is excluded from a prerequisite but used downstream

   **Location:** packages/GrossZagierAndArithmeticHeights/README.md:5583 and :5596: “Even CM discriminant is outside the claimed local constant calculation.”

   **Claim:** §9.9 supplies §§9.11, 9.15 and 9.16, whose hypotheses allow even CM discriminants, while omitting their dyadic local constants.

   **Witness:** Take K=Q(i), N⁻=21, N⁺=1, p=5, the weight-two level-21 newform and j=1 (type (3,−1) respects the units). Brooks allows these data: brooks line 199; BDP excludes D=−4: bdp line 2320.

   **Exact repair text:** Add before §9.9: “Dyadic CM toric constants. Evaluate the local Waldspurger integral at 2 for every imaginary quadratic K allowed by Brooks §2.1, with the specified additive character, self-dual measure, order and test vector; include ramified dyadic K and extra units. Compare the result with Brooks Theorem 8.2 and state any resulting correction to C(f,χ).” Use that result in the general §§9.9–9.16. Retain BDP's odd-discriminant theorem as its stated specialization. Remove the scope exclusion at :5880 once this prerequisite is owned; restricting the downstream theorem would violate the general-library contract.

7. **F07** (P1) Seven named suppliers have no eligible roadmap

   **Location:** packages/GrossZagierAndArithmeticHeights/README.md:96, :115, :117–118, :121–122 and :125.

   **Claim:** The exact supplier table imports named sections from TropicalAndBerkovichArithmetic, AnalyticNumberTheory, AutomorphicPadicLFunctions, AbelianSchemesAndArithmeticModuliPartII, PadicHodgeRegulators, GeneralizedHeegnerCycles and QSeriesPartitionsAndMockModularForms.

   **Witness:** None of these seven folder names exists in the supplied main/Completed trees or six sibling heads; none occurs in merge-order/ORDER.txt. No design/plan.json declares their interfaces as gaps.

   **Exact repair text:** Replace the seven asserted imports with explicitly owned prerequisite targets for: the polarized metric-graph Green/admissible-measure comparison; partial ideal zeta and genus-character factorization; CM periods and the anticyclotomic root distribution; the fixed-CM connection trivialization; point Kummer/Bloch–Kato logarithm comparison; the generalized Heegner-cycle Abel–Jacobi and BDP special-value inputs; and the normalized E₂* family. Preserve each consumed statement's full hypotheses and source range. If an eligible earlier owner already has an individual interface, replace that individual target by its verified current name, section and declaration. In particular, do not treat `AnalyticNumberTheory` as interchangeable with the ordered `AnalyticNumberTheoryPartI`/`PartII` without checking their actual target. No later-roadmap citation can repair this.

8. **F08** (P1) Semistable integration and the Tate correction are planned a second time

   **Location:** packages/GrossZagierAndArithmeticHeights/README.md:5488–5492: “This supplies the semistable case missing from the good-reduction integration suppliers.”

   **Claim:** §9.5 owns general semistable abelian integration and its Tate-curve logarithm correction.

   **Witness:** TauCetiRoadmap/ColemanIntegrationPartII/README.md:1094 supplies proper holomorphic integration via the Jacobian; :1134 supplies divisor evaluation; :1207 states exactly log(z)−ν(z)log(q)/ν(q), at all primes and arbitrary reduction.

   **Exact repair text:** Replace the general construction with: “Import ColemanIntegrationPartII §§4.2–4.3, 7.2, 7.4 and 7.7 for harmonic semistable integration, its Jacobian logarithm, degree-zero divisor evaluation and Tate normalization. This target supplies the additional p-new modular-form relation, cusp normalization, comparison with Castella's Abel–Jacobi evaluation, and p-new CM root interpolation.” Add these exact supplier sections to the table and Needs line. Keep the point Kummer comparison separate from the integration theorem.

9. **F09** (P2) An easy height headline is omitted despite existing carriers

   **Location:** packages/GrossZagierAndArithmeticHeights/Suggested.lean:16: “The geometric height and kernel milestones stay in the README”; packages/GrossZagierAndArithmeticHeights/README.md:315.

   **Claim:** No height milestone can be stated against the supplied libraries.

   **Witness:** TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean:341 already supplies `canonicalHeightQuadratic`; Mathlib supplies `QuadraticMap`, `TensorProduct` and rational modules. README §0.2's unique rational extension needs no arithmetic-model carrier.

   **Exact repair text:** Import `TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight.Basic` after `import Mathlib`. Open the `TensorProduct` notation scope. Add the §0.2 headline `canonicalHeightRat_exists_unique` asserting: for `(K : Type*) [Field K] [AdmissibleAbsValues K] [DecidableEq K]`, `(W : WeierstrassCurve.Affine K) [W.toAffine.IsElliptic]`, there exists a unique `q : QuadraticMap ℚ (ℚ ⊗[ℤ] W.Point) ℝ` satisfying `∀ P : W.Point, q ((1 : ℚ) ⊗ₜ[ℤ] P) = P.canonicalHeight`. Use this scalar-first carrier with Mathlib's existing `TensorProduct.leftModule` (Mathlib/LinearAlgebra/TensorProduct/Defs.lean:317), and identify it with §0.2's reversed tensor order through `TensorProduct.comm`; do not assume an inferred ℚ-action on the reversed order. Give the theorem a docstring, list its name in §0.2, and use `by sorry`; do not create an admitted data definition. Replace the blanket omission explanation with the precise statement that the arithmetic-model headlines still lack carriers.

10. **F10** (P3) A source's editorial sentence is carried into the roadmap

   **Location:** packages/GrossZagierAndArithmeticHeights/README.md:1903: “not removed in the announcement [17], which is in error; there it was denoted L_σ(f, s)”.

   **Claim:** This is original roadmap exposition with an exact external locator.

   **Witness:** gz86 line 198 contains the same announcement/error aside and its source-internal reference [17]; the roadmap has no corresponding numbered reference.

   **Exact repair text:** Delete the parenthetical aside. Write: “The quadratic factor omits the Euler factors at every prime dividing N (Gross–Zagier, I §5, equation (5.3), printed p.229).” Keep the mathematical Euler-factor correction in the author's own words.

11. **F11** (P3) The package has no source manifest

   **Location:** packages/GrossZagierAndArithmeticHeights/README.md:5888, References; missing packages/GrossZagierAndArithmeticHeights/sources.toml.

   **Claim:** The cited versions and source certification are reproducible from the package.

   **Witness:** The package contains README.md, Suggested.lean, metadata and review.json but no sources.toml. In particular the 2011 and 2013 YZZ editions and the two Skinner editions have materially different locators/statements.

   **Exact repair text:** Add `sources.toml` with schema `tauceti-roadmap-sources/v1`, one entry per distinct cited edition, authors/title/year, actual locator scheme and locators, cited target sections, and the sources service's URL, fetch provenance, hash, licence class and status. Record BLR as uncertified; retain unresolved YZZ access in the consolidated reference request until a legal text or waiver is supplied. Do not mark a public restatement as certification of a book-only proof or use “README target locators” as the locator.

12. **F12** (P3) Existing examples do not test the inverse-character convention, and easy Checks have no mirror

   **Location:** packages/GrossZagierAndArithmeticHeights/Suggested.lean:103–140; packages/GrossZagierAndArithmeticHeights/README.md:5151.

   **Claim:** The kept character adapters' examples test the inverse-character convention described in their docstrings.

   **Witness:** Replacing χ by χ⁻¹ in both definitions preserves the trivial-character and fixed-vector examples. README :5151 supplies the missing discriminator: C₃ over F₇ gives (1,2,4), with eigenvalue 4 rather than 2.

   **Exact repair text:** Replace the unfolding membership example with a proved C₃/F₇ example for the cyclic permutation representation: the χ-weighted sum of e₀ is (1,2,4), this vector belongs to `chiIsotypic ρ χ`, and its generator image is 4 times it and differs from 2 times it. Add the README's C₂/Q² average and self-pairing computation, (1/2,−1/2) with pairing 1/2, by replacing a weaker example. Also mirror §6.2's p₀=1, p₁=1−t and p_(2,1)=1−t, and §9.7's Euler factors at (5,1), (5,−4), (23,−1). Combine parallel checks into conjunctions to retain at most two proved examples per kept definition. No admitted examples.

13. **F13** (P3) The imprimitive-series definition lacks three discriminating README Checks

   **Location:** packages/GrossZagierAndArithmeticHeights/README.md:5731 and :5733; packages/GrossZagierAndArithmeticHeights/Suggested.lean:207–220.

   **Claim:** The introduced `bdpIncomplete` definition has the required checks of finite Euler-factor multiplication.

   **Witness:** Its README entry has no dedicated Checks. The two Lean examples test only an empty set and a zero singleton; neither tests multiplication of two nonzero Euler factors.

   **Exact repair text:** Add: “Checks for `bdpIncomplete`: an empty set leaves F unchanged; F=1+T with the singleton factor 1−T gives 1−T²; F=1 with two distinct factors 1−T and 1+T gives 1−T², whereas adding those factors gives 2; a zero factor gives zero.” Mirror these using at most two proved examples, grouping cases if necessary, and test the introduced definition itself.

14. **F14** (P1) The norm-ideal map assigns an ideal class to the zero ideal

   **Location:** packages/GrossZagierAndArithmeticHeights/README.md:4393, also :4156: “Prove that 𝔠 ∈ 𝒜^{−1}”.

   **Claim:** The assumption b₋≠0 suffices to put both ideals (α)𝔡𝔞⁻¹ and (β)𝔡𝔮𝔫⁻¹𝔟̄⁻¹𝔟𝔞̄⁻¹ in ideal classes.

   **Witness:** In §7.75 take D=−7,N=1,f=Δ,k=6,p=3,q=23,𝔞=𝔟=O,b=j (α=0,β=1),m=69. All congruences hold and b₋≠0, but 𝔠=(0) has no ideal class.

   **Exact repair text:** Split the norm-ideal map: “For α≠0 and β≠0 the two nonzero integral ideals have the stated classes and norm relation. For α=0 retain a separate endpoint contribution, with N𝔠=0; no class is assigned to 𝔠. Its weighted contribution is computed separately with r_A(0)=1/w.” Do this for both the inert and ramified formulas. Preserve the N=1 endpoint in the general local theorem; add the displayed α=0 rejected class-assignment Check.

15. **F15** (P1) The ramified valuation formula omits the norm of the ideal

   **Location:** packages/GrossZagierAndArithmeticHeights/README.md:4156: “ord_p(n) = ord_p(D·N(b₋))”.

   **Claim:** The ramified norm-ideal map has that valuation formula for arbitrary 𝔞.

   **Witness:** Take D=−7,N=1,f=Δ,k=6,p=7,q=2,𝔞=(7),𝔟=O,b=7(1+j),j²=−2,m=3. Then N𝔠′=14 has valuation 1, but |D·N(b₋)|=686 has valuation 3.

   **Exact repair text:** Replace the equality by “ord_p(n)=ord_p(D·N(b₋))−ord_p(N𝔞)” (p∤N in the standing hypotheses). State the printed equality as the separate corollary when p∤N𝔞. Add the example 1=3−2 as a negative control. The parallel inert target already records this prime-to-p distinction at :4411.

16. **F16** (P3) Published Skinner locators link to the superseded preprint

   **Location:** packages/GrossZagierAndArithmeticHeights/README.md:5847, also :5745 and :5863.

   **Claim:** The linked source supports the published O^ur coefficient-ring correction on pp.342–343.

   **Witness:** The link is arXiv:1405.7294v1. The claimed correction is in skinner-published line 556, which defines O^ur and places the function in O^ur[[Γ]]; these are distinct editions.

   **Exact repair text:** Link published §2.6, pp.342–343 to the publisher's open PDF, `https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf`, and give it a separate `skinner-published` manifest entry. Keep arXiv v1 links only with that version's locators and statements. Apply the same edition distinction to every Skinner citation labelled “Published”.

## Verified sound

Read all 5,926 README lines and all 243 Lean lines. The inventories below cover **31 Lean declarations** (9 definitions, 6 theorem targets, 16 proved examples), **302 README targets** (292 section targets and 10 bold subtargets), and the seven standing hypothesis blocks. Read **390 Checks**; the explicit computation ledger contains **34 controls**, with the other boundary/hypothesis examinations recorded beside each target. Inspected **55 source locator groups** against legally fetched text; failures of mathematical support remain findings rather than endorsements.

All six Lean theorem statements survived the stated mathematical boundary tests. Their required nonzero, derivative, field and representation hypotheses are present in their types. In particular: the completion factor is √N/π; character averaging has the inverse eigencharacter; the pairing scales by the inverse square of the group order; characteristic dividing that order gives zero; and the Euler-factor theorem excludes p≤1. There is no forced arithmetic headline through an admitted carrier. R09 records the missing easy headline.

All 15 named Lean declarations occur in the README. There is one `import Mathlib`, no other import, no admitted data, no admitted example, no `set_option`, no forbidden command, and no `lemma` declaration. Every declaration has its mathematical docstring. The file is within the line limit and has at most two examples per definition. These are textual and mathematical checks, not a claim of fresh elaboration.

The comparison `origin/main...HEAD` changes exactly the four original files in `packages/GrossZagierAndArithmeticHeights/`: README.md, Suggested.lean, metadata.toml and review.json (6,178 inserted lines). No edit outside that package is in the pull-request diff. The reviewer changed only this report and scratch notes.

**Supplier checks.** There are **zero direct citations to the six supplied sibling names** in this package. All six supplied heads were searched by object for ownership and interface conflicts. The Coleman overlap is R08. The following **17 supplier sections** were inspected at their supplied versions; this count does not certify the unavailable supplier heads listed below.

| Supplier sections checked | Repository-relative witness | Result |
|---|---|---|
| ImaginaryQuadraticClassNumber H1.2, H1.4 (2) | TauCetiRoadmap/ImaginaryQuadraticClassNumber/README.md:29, :43 | Exceptional unit counts and quadratic-order conductor sequence match the imports. |
| ClassFieldTheory Layers 11–13 (3) | TauCetiRoadmap/ClassFieldTheory/README.md:1683, :1724, :1843 | Arithmetic Artin normalization, global existence and quadratic-order ring class fields are owned there. |
| GlobalNumberFields Layer 11 (1) | TauCetiRoadmap/GlobalNumberFields/README.md:565 | Actual orders, invertible Picard carrier and compatible ambient-field morphisms exist as targets. |
| ModularCurves 7F/ST-1 (1) | TauCetiRoadmap/ModularCurves/README.md:1551 | Elliptic Serre–Tate equivalence has the required Artinian Witt-base scope. |
| PadicMeasuresIwasawaAlgebras §§1.6, 2.1, 2.5 (3) | TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:888, :1148, :1471 | Character evaluation, weighting and bounded inverse Amice transform are real interfaces; completeness and ultrametric hypotheses are explicit. |
| NewtonPolygons §§6.3–6.4 (2) | TauCetiRoadmap/NewtonPolygons/README.md:901, :945 | Abstract complete-DVR μ, λ and preparation do not require a finite residue field. |
| ColemanIntegrationPartII §§4.2–4.3, 7.2, 7.4, 7.7 (5) | TauCetiRoadmap/ColemanIntegrationPartII/README.md:1094, :1134, :1207 | General semistable integration and Tate normalization already have an earlier owner; R08. |

Pinned-object searches located candidates for all **66 distinct cited library identifiers**. The height definitions, quadratic carrier, pairing/regulator convention, finite representation operations, power-series operations and Hasse-bound inputs were checked in context. Mere search hits for the remaining identifiers are not a certification of every intended application.

**Mechanical dependency output.** The prescribed dependency gate returned exit status 1 with exactly:

```text
NOT IN ORDER: GrossZagierAndArithmeticHeights (insert it after its last supplier)
depcheck: 7 roadmaps, 65 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line. The NOT IN ORDER diagnostic is excluded as a finding by the brief. It does not certify prose-only proof dependencies: the §3.1/§3.8 cycle in R02 is visible in the outlines, not in that output. No ownership is moved upward by any repair proposed here.

**Standing hypothesis audit.**

| Block | README line | Boundary instances examined | Result / change |
|---|---:|---|---|
| (C) | 75 | N=1 with f=Δ and k=6; r_A(0)=1/w; nonzero newform normalization | N=1 is genuinely permitted; it supplies R14/R15 witnesses. |
| (H) | 76 | D=−3,−7; N=1 identity diagram; N>1 marked cusps; split versus nonsplit p | D odd excludes D=−4 here. Marked-divisor targets separately require N>1. |
| (G) | 77 | D_i=1; D=−3; exchanging ordered factors; signed n | Fundamental-discriminant and signed-character conventions retained. |
| (L) | 78 | residue degree one/two; ramified uniformizer; completed maximal unramified extension | π remains a uniformizer; residue cardinality and degree are distinguished. |
| (Q) | 79 | F=Q, E=Q(i); nearby switch at a finite or real place | Incoherent original and coherent nearby algebras are distinct. |
| (Q′) | 80 | maximal U; common ramification excluded; residue F₂ | Order containment is stronger than unit containment; cannot supply general (D), R04. |
| (D) | 81 | at least two S₁ places; two split S₂ places; deep U; common ramification | General range is broader than (Q′); source restatement is available, book-only existence/support proofs remain uncertified. |

**Lean declaration inventory.** Contexts below are a manual reading of the binders and their uses; no `#check` run is claimed.

| Declaration | Lean line | Section and variable/instance context (manual audit) | Boundary test and result |
|---|---:|---|---|
| `unitIndex` | 31 | Layer 0; K : Type u; Field K, NumberField K | Rational half of finite roots-of-unity count; arithmetic interpretation restricted to imaginary quadratic K. |
| example: 2u=w | 35 | Same explicit K instances | Arithmetic identity correct; weak by itself. |
| example: w=6 | 41 | Same, explicit h : torsionOrder K=6 | Gives 3; does not construct the Eisenstein field. |
| `unitIndex_of_imaginaryQuadratic` | 49 | Explicit K, Field, NumberField, IsTotallyComplex; finrank=2 | D=-3,-4,other give 3,2,1; no lost hypothesis found. |
| `completed_derivative_at_central_zero` | 57 | N : R, 0<N; L : C→C, d : C; derivative at 1 and L(1)=0 explicit | N=1,L(s)=s-1 gives 1/pi; factor sqrt(N)/pi correct. |
| `rankinPolynomial` | 66 | Layer 6; n : N, t : Q | n=0,1,2 computed; factorial never zero. |
| example: p2 | 70 | t : Q | 1-2t+t²/2; discriminates missing factorial. |
| `rankinKernelPolynomial` | 77 | k,r : N, t : Q | Arithmetic range k≥1, r≤k-1; total truncated subtraction outside range is documented. |
| example: p20 | 84 | t : Q | t²/8; discriminates both normalizations. |
| example: p32 | 89 | t : Q | Equals p2; correct. |
| `chiIsotypic` | 99 | Characters; L,G,V : Type*; Field L, CommGroup G, AddCommGroup V, Module L V; unused Fintype G drops | Zero module and trivial character sound; missing order-three control, R12. |
| example: membership | 103 | Same representation context | Correct unfolding; cannot discriminate inverse-character choice, R12. |
| example: fixed nonzero vector | 108 | Same, with explicit hx,hfix,hchi | Correct; field eliminates a nonzero scalar annihilator; also passes inverse convention, R12. |
| `heegnerFinite` | 126 | Characters plus Fintype G; rho : Representation L G V, chi : G→*Lˣ | Trivial group, C3/F7, zero vector; formula is the chi-weighted finite sum. |
| example: trivial character | 130 | Same | Plain sum correct; insufficient convention test, R12. |
| example: nontrivial fixed-vector sum | 135 | Same, explicit fixed-vector and nontrivial-character hypotheses | Orthogonality valid in any characteristic when such chi exists. |
| `heegnerAverage` | 146 | Same finite representation context | Characteristic dividing card(G) gives zero; no projection claim there. |
| example: fixed-vector average | 150 | Same plus explicit nonzero card in L | Cancellation correct; required hcard retained. |
| example: characteristic 3 | 158 | L=ZMod 3, G=Multiplicative(ZMod 3), trivial representation | Inverse card is zero; correct negative control. |
| `heegnerAverage_isotypic` | 169 | Finite representation context explicit through type; no hcard needed | Reindex g by h*g; inverse eigenvalue; characteristic-dividing-card case zero. |
| `heegnerAverage_pairing` | 174 | Same, W : Type w with AddCommGroup/Module; bilinear B; hcard explicit | Inverse square scaling correct; hcard is stronger than needed but harmless. |
| `bdpLFunction` | 190 | CentralValue; R : Type u, CommRing R; root : PowerSeries R; normalization a unit | Actual square adapter, not a claimed construction of a CM measure; zero ring allowed algebraically. |
| example: constant coefficient | 194 | Same | Ring hom preserves multiplication and square; correct. |
| example: root doubled | 201 | Same | Factor 4; holds also in characteristic 2. |
| `bdpIncomplete` | 207 | Same R; index type iota : Type*; S : Finset iota; localFactor | Empty, singleton and two factors; no implicit finiteness gap; R13 checks missing. |
| example: empty removal set | 212 | Same | Returns input; correct but weak. |
| example: zero factor | 217 | Same plus DecidableEq iota, w, explicit localFactor(w)=0 | Returns zero; correct but weak. |
| `bdpLFunction_evaluation` | 223 | R,S : Type*, CommRing R,S; ev : PowerSeries R→+*S, root, normalization | Algebraic ring-map identity; no unsupported analytic convergence assertion. |
| `bdpEulerFactor` | 231 | Outside section; p,a : Q | Total division at p=0 gives zero; arithmetic range stated separately. |
| example: p=1,a=2 | 235 | No context | Zero despite Hasse equality; correct negative control. |
| `bdpEulerFactor_ne_zero` | 240 | p,a : Q; 1<p; explicit real Hasse bound | (sqrt(p)-1)²>0 gives positive numerator; denominator nonzero. |

**Adversarial statement table.** “No additional counterexample” records the listed cases only. It is not a proof of the target or certification of an uninspected locator. Section-level rows include their displayed identities, defining clauses, named API and Checks; bold subtargets are listed separately.

| Statement | README line | Instances / hypotheses examined | Result / change |
|---|---:|---|---|
| 0a.1 Ring-class tower comparisons | 139 | c=1; tower c\|d\|e; noninvertible order ideals excluded | No additional counterexample in the listed cases; no change. |
| 0a.2 The Heegner cyclic-isogeny pair at every quadratic discriminant | 162 | D=-3,-4,-7; N=1; ramified level primes; c not coprime to N excluded | No additional counterexample in the listed cases; no change. |
| 0a.3 Optimal embeddings and the cyclic-level dictionary | 187 | N=1; imprimitive binary forms excluded; reversed ideal action | No additional counterexample in the listed cases; no change. |
| 0a.4 Quaternionic CM points, levels and canonical-model descent | 209 | split B over Q; division B; stabilizers of order 4 and 6 | No additional counterexample in the listed cases; no change. |
| 0a.5 From CM moduli points to level triples | 239 | identity isogeny; non-neat level; prime dividing the CM conductor | No additional counterexample in the listed cases; no change. |
| 0.1 The dictionary of height conventions | 277 | torsion point; doubling P; rank-zero determinant; current pin | R01 |
| 0.2 The canonical height on E(K) ⊗ ℚ | 305 | P=0; torsion P; rational scalar 1/2; tensor relations | R09 |
| 0.3 The motivic centre s = 1 and the unitary centre s = 1/2 | 335 | L(s)=s-1; N=1; completion factor Gamma_C(1)=1/pi | No additional counterexample in the listed cases; no change. |
| 0.4 The unit index u | 353 | D=-3,-4,-7; real quadratic field outside arithmetic interpretation | No additional counterexample in the listed cases; no change. |
| 0.5 The Artin-map convention and the Galois action on Heegner points | 384 | identity Artin element; inverse ideal; class of order three | No additional counterexample in the listed cases; no change. |
| 0.6 Full real period, identity-component period and c∞ | 409 | one versus two real components; sign of discriminant | No additional counterexample in the listed cases; no change. |
| 0.7 Base-change signs and measure comparison | 425 | F=Q; split/inert/ramified primes; measure rescaling | No additional counterexample in the listed cases; no change. |
| 0.8 Genus-character factorization | 450 | trivial genus character; nontrivial factorization; D with one prime factor | R07 |
| 0.9 Trace versus normalised average of a Galois orbit | 464 | group of order one and two; torsion points; average versus sum | No additional counterexample in the listed cases; no change. |
| 0.10 Rescaling height and period identities | 480 | scaling by 2; rank zero; square scaling of bilinear self-pairing | No additional counterexample in the listed cases; no change. |
| 0.11 Relative-field height comparison | 496 | K=Q; quadratic base extension; normalized versus relative height | No additional counterexample in the listed cases; no change. |
| 0.12 CM action convention comparison | 510 | identity and inverse ideal action; class of order three | No additional counterexample in the listed cases; no change. |
| 1.1 Poincaré height pairing | 542 | A=0; P=0; symmetric polarization; change of height normalization | No additional counterexample in the listed cases; no change. |
| 1.2 Endomorphism-field height pairing | 572 | M=Q; M real quadratic; trace pairing and multiplication by 2 | No additional counterexample in the listed cases; no change. |
| 1.3 Elliptic Poincaré comparison | 604 | elliptic principal polarization; P=0; half-polar convention | No additional counterexample in the listed cases; no change. |
| 1.4 Character-component height pairing | 620 | trivial character; chi versus inverse chi; bilinear versus Hermitian pairing | No additional counterexample in the listed cases; no change. |
| 1.5 Rational Galois descent of Mordell–Weil spaces | 649 | trivial extension; torsion killed by tensor Q; averaging denominator | No additional counterexample in the listed cases; no change. |
| 2.1 Global arithmetic intersection on curves | 676 | principal divisor; disjoint sections; proper/flat regular model assumptions | No additional counterexample in the listed cases; no change. |
| 2.2 Arakelov probability form | 706 | genus one; genus zero excluded by normalization denominator | No additional counterexample in the listed cases; no change. |
| 2.3 Arithmetic normalization of the admissible skeleton measure | 735 | one vertex; tree; loop; field extension and refinement | R07 |
| 2.4 Archimedean admissible metric | 756 | degree zero; trivial line; rescaling a metric by a constant | No additional counterexample in the listed cases; no change. |
| 2.5 Local intersection height comparison | 785 | torsion divisor class; change of field; finite versus archimedean terms | No additional counterexample in the listed cases; no change. |
| 2.6 Degree-weighted admissible Green function | 799 | degree zero and degree one; additive constant; diagonal singularity | No additional counterexample in the listed cases; no change. |
| 2.7 Complex admissible metric existence | 828 | genus one; constant rescaling; mean-zero condition | No additional counterexample in the listed cases; no change. |
| 2.8 Normalized Arakelov Green function | 844 | interchange x,y; integral-zero normalization; approach to diagonal | No additional counterexample in the listed cases; no change. |
| 2.9 Admissible arithmetic extension | 873 | trivial bundle; vertical divisors; model refinement | No additional counterexample in the listed cases; no change. |
| 2.10 Arakelov dualizing metric | 907 | genus one; local coordinate rescaling; residue sign | No additional counterexample in the listed cases; no change. |
| 2.11 Squared-norm complex height symbol | 936 | f=1; rescaling local parameter; squared norm versus ordinary norm | No additional counterexample in the listed cases; no change. |
| 2.12 Faltings–Hriljac comparison | 963 | principal divisor; torsion class; polarization factor of two | No additional counterexample in the listed cases; no change. |
| 2.13 Admissible metrics at real places | 979 | real place versus conjugate complex pair; total weight | No additional counterexample in the listed cases; no change. |
| 2.14 Residue-normalized adjunction line | 1008 | dx/x residue 1; t replaced by at; adjunction sign | No additional counterexample in the listed cases; no change. |
| 2.15 Archimedean CM height sum | 1035 | class number one; trivial CM character; field-relative factor | No additional counterexample in the listed cases; no change. |
| 3.1 Integral modular differential lattices at bad primes | 1073 | p=2,3; bad additive reduction; local-estimate dependency order | R02 |
| 3.2 Normalized Hodge class | 1097 | genus one; denominator-clearing integer; cusp correction | No additional counterexample in the listed cases; no change. |
| 3.3 Rational ξ-normalized realization | 1128 | m=1 where integral; m=2; torsion ambiguity after rationalization | No additional counterexample in the listed cases; no change. |
| 3.4 Strict GL₂ realization and transfer | 1160 | coefficient field Q versus real quadratic; rational versus coefficient projector | No additional counterexample in the listed cases; no change. |
| 3.5 Manin constant | 1178 | identity isogeny; change of Neron differential by -1; nonoptimal map | No additional counterexample in the listed cases; no change. |
| 3.6 Volume-normalized composition pairing | 1207 | identity map; composing by [2]; volume rescaling | No additional counterexample in the listed cases; no change. |
| 3.7 Integral Manin constant and p-unit range | 1239 | p=2 outside asserted odd range; good versus semistable primes | No additional counterexample in the listed cases; no change. |
| 3.8 Manin constant and modular degree | 1255 | p=2,3; newvector estimate dependency on integral differential lattice | R02 |
| 3.9 Petersson and modular-degree comparison | 1271 | composing quotient with [2]; degree and norm both scale by 4 | No additional counterexample in the listed cases; no change. |
| 3.10 Manin isogeny and twist transfer | 1287 | isogeny of degree p; twist; differential pullback factor | No additional counterexample in the listed cases; no change. |
| 3.11 Eigendifferential period comparison | 1303 | coefficient field degree one and two; a single eigencomponent | No additional counterexample in the listed cases; no change. |
| 3.12 Modular period-degree comparison | 1317 | connected versus disconnected real locus; modular degree scaling | No additional counterexample in the listed cases; no change. |
| 3.13 Quadratic-twist real-period comparison | 1331 | positive versus negative quadratic twist; real period component factor | No additional counterexample in the listed cases; no change. |
| 4.1 Local toric functional space | 1356 | split torus; division algebra; incompatible central character | No additional counterexample in the listed cases; no change. |
| 4.2 Saito–Tunnell dichotomy | 1385 | split/inert/ramified quadratic algebra; dyadic place; both quaternion signs | No additional counterexample in the listed cases; no change. |
| 4.3 Normalized local toric form | 1401 | spherical vectors; zero vector excluded from denominator; Haar scaling | No additional counterexample in the listed cases; no change. |
| 4.4 Admissible toric order | 1431 | maximal order; conductor zero; ramified character and non-Eichler order | No additional counterexample in the listed cases; no change. |
| 4.5 Unramified toric value and finite product | 1460 | unramified place; empty exceptional set; local factor equal to 1 | No additional counterexample in the listed cases; no change. |
| 4.6 Nonzero toric test vectors | 1476 | wrong local sign; ramified character; conductor boundary | No additional counterexample in the listed cases; no change. |
| 4.7 Explicit local toric constants at test vectors | 1492 | split, inert and ramified places; conductor zero and positive conductor | No additional counterexample in the listed cases; no change. |
| 5.1 Coherent quaternionic theta specialization | 1524 | anisotropic (2,0),(3,0); split (3,1) outside ordinary convergence | No additional counterexample in the listed cases; no change. |
| 5.2 Half-weight Waldspurger value | 1549 | root number +1/-1; zero period; square-root sign ambiguity | No additional counterexample in the listed cases; no change. |
| 5.3 Waldspurger period formula | 1574 | zero local contraction; Haar rescaling; trivial character | No additional counterexample in the listed cases; no change. |
| 5.4 Toric period nonvanishing criterion | 1590 | vanishing central value; toric Hom dimension zero versus one | No additional counterexample in the listed cases; no change. |
| 5.5 Finite test-vector variation | 1606 | empty variation set; a single changed local vector; zero toric contraction | No additional counterexample in the listed cases; no change. |
| 5.6 Petersson pairing as a product of local Whittaker pairings | 1622 | spherical vector; rescaled Haar measure; normalized versus unnormalized Whittaker pairing | No additional counterexample in the listed cases; no change. |
| 6.1 Petersson projectors and their growth domains | 1655 | weight two with logarithmic growth; cusp forms; constant/Eisenstein input | No additional counterexample in the listed cases; no change. |
| 6.2 The classical V-kernel, terminating polynomials and decay | 1682 | n=0,1,2; (k,r)=(2,0),(2,1),(3,2); t=0 | R12 |
| 6.3 Special correspondence cycle | 1708 | identity Hecke correspondence; non-neat stabilizers; zero coefficient | No additional counterexample in the listed cases; no change. |
| 6.4 ξ-normalized CM divisor | 1737 | degree-one CM point minus xi; denominator-clearing m; torsion ambiguity | No additional counterexample in the listed cases; no change. |
| 6.5 Pseudo-theta datum | 1766 | V0 empty versus {0}; x=p^n e1; unbounded locally constant shell values | R03 |
| 6.6 Mixed theta–Eisenstein kernel | 1793 | incoherent sign; zero Fourier coefficient; two auxiliary split places | No additional counterexample in the listed cases; no change. |
| 6.7 Normalized local Whittaker terms | 1820 | spherical finite place; ramified character; zero versus nonzero Fourier index | No additional counterexample in the listed cases; no change. |
| 6.8 Finite CM orbit average | 1847 | orbit size one and two; unit stabilizer; finite sum versus average | No additional counterexample in the listed cases; no change. |
| 6.9 Two auxiliary split places | 1874 | distinct split places; one auxiliary place insufficient; finite exceptional set | No additional counterexample in the listed cases; no change. |
| 6.10 Ideal-class Rankin series | 1901 | N=1; level Euler factors; k=1 and k=2 | R10 |
| 6.11 Hecke height-series cuspidality | 1929 | zero divisor; cusp condition; Eisenstein contribution | No additional counterexample in the listed cases; no change. |
| 6.12 Classical trace adjunction | 1943 | level one; identity trace; subgroup index normalization | No additional counterexample in the listed cases; no change. |
| 6.13 Prime-to-level newform detection | 1957 | zero form; prime-to-level coefficients; oldform exclusion | No additional counterexample in the listed cases; no change. |
| 6.14 Classical Eisenstein transformation | 1971 | identity modular transformation; weight two boundary; ramified level | No additional counterexample in the listed cases; no change. |
| 6.15 Ramified theta reindexing | 1985 | identity ideal class; ramified prime ideal; inverse reindexing | No additional counterexample in the listed cases; no change. |
| 6.16 Rankin genus-sign function | 1999 | n=0 excluded where required; one ramified prime; genus-character signs | No additional counterexample in the listed cases; no change. |
| 6.17 Different ideal reindexing | 2027 | trivial different; principal different; inverse ideal convention | No additional counterexample in the listed cases; no change. |
| 6.18 Eisenstein Mellin asymptotics | 2041 | t tending to zero and infinity; constant term separated | No additional counterexample in the listed cases; no change. |
| 6.19 Cusp constant matrix inverse | 2055 | one cusp; singular matrix excluded; level-one constant term | No additional counterexample in the listed cases; no change. |
| 6.20 Picard-valued generating series | 2069 | zero degree; identity Hecke operator; Picard versus Jacobian projection | No additional counterexample in the listed cases; no change. |
| 6.21 Special test function and integral j | 2098 | g=1; norm-zero boundary; standard finite lattice | No additional counterexample in the listed cases; no change. |
| 6.22 Norm congruence shells and ramified correction | 2125 | unramified/inert versus ramified shell; empty shell; dyadic valuation | No additional counterexample in the listed cases; no change. |
| 6.23 Local Whittaker series for incoherent sections | 2152 | a=0; spherical place; coefficient with wrong local sign | No additional counterexample in the listed cases; no change. |
| 6.24 Incoherent central derivative | 2166 | incoherent central value zero; single bad local coefficient; completed factor | No additional counterexample in the listed cases; no change. |
| 6.25 Pseudo-theta comparison on a small bad-place compact | 2182 | g in prescribed compact; compact shrunk; bad-place support boundary | No additional counterexample in the listed cases; no change. |
| 6.26 Classical Rankin normalization | 2196 | k=1; finite versus completed L-function; missing level factor | No additional counterexample in the listed cases; no change. |
| 6.27 Rankin absolute convergence | 2210 | Re(s)>3/2; boundary excluded; ideal-count growth | No additional counterexample in the listed cases; no change. |
| 6.28 CM Hecke disjointness criterion | 2224 | r_A(m)=0 versus positive; m=1; diagonal CM point | No additional counterexample in the listed cases; no change. |
| 6.29 Classical Rankin unfolding | 2238 | identity level; cusp form kills constant term; convergence half-plane | No additional counterexample in the listed cases; no change. |
| 6.30 Möbius level decomposition | 2252 | N=1; squarefree N; Mobius cancellation | No additional counterexample in the listed cases; no change. |
| 6.31 Classical Rankin kernel | 2266 | N=1; k=1; s=1; removed Euler factors | No additional counterexample in the listed cases; no change. |
| 6.32 Trace coset classification | 2293 | identity coset; prime level; inverse reindexing | No additional counterexample in the listed cases; no change. |
| 6.33 Genus Eisenstein combination | 2307 | one discriminant prime; trivial genus character; cancellation of signs | No additional counterexample in the listed cases; no change. |
| 6.34 Genus-sign reversal | 2334 | n and -n; odd discriminant assumption; epsilon(-1) | No additional counterexample in the listed cases; no change. |
| 6.35 Signed divisor sums | 2348 | empty divisor sum; n=1; ramified prime divisors | No additional counterexample in the listed cases; no change. |
| 6.36 Genus-sign multiplicativity | 2375 | coprime factors; shared ramified prime excluded; n=1 | No additional counterexample in the listed cases; no change. |
| 6.37 Boundary Eisenstein cusp constants | 2389 | k=1 versus k>1; cusp infinity; zero index | No additional counterexample in the listed cases; no change. |
| 6.38 Arithmetic height kernel | 2403 | zero divisor; diagonal term retained; rational xi denominator | No additional counterexample in the listed cases; no change. |
| 6.39 Arithmetic theta lifting comparison | 2434 | zero eigencomponent; arithmetic versus analytic normalization | No additional counterexample in the listed cases; no change. Primary YZZ proof not certified. |
| 6.40 Automorphic sum reduces to nondegenerate outer theta | 2450 | V1=V versus positive codimension; empty V0; automorphy hypothesis | No additional counterexample in the listed cases; no change. |
| 6.41 Rankin kernel pairing | 2464 | k=1; rescaling cusp form; zero pairing | No additional counterexample in the listed cases; no change. |
| 6.42 Rankin kernel U formula | 2478 | k=1; N=1; endpoint s=1 | No additional counterexample in the listed cases; no change. |
| 6.43 Prime-discriminant Eisenstein formula | 2492 | prime D versus composite D; n=0 separate | No additional counterexample in the listed cases; no change. |
| 6.44 Eisenstein zero coefficient | 2506 | zero Fourier coefficient; s=0; gamma pole cancellation | No additional counterexample in the listed cases; no change. |
| 6.45 Eisenstein nonzero coefficient | 2520 | positive and negative Fourier index; s=0; local sign mismatch | No additional counterexample in the listed cases; no change. |
| 6.46 Genus sigma identity | 2534 | n=1; one ramified prime; trivial genus character | No additional counterexample in the listed cases; no change. |
| 6.47 Boundary Eisenstein orthogonality | 2548 | cusp form paired with Eisenstein series; logarithmic boundary growth | No additional counterexample in the listed cases; no change. |
| 6.48 Projection boundary coefficients | 2562 | zero Fourier index; logarithmic term; normalized projection | No additional counterexample in the listed cases; no change. |
| 6.49 Positive-codimension theta cancellation | 2576 | codimension zero versus two; distinct Vandermonde exponents | No additional counterexample in the listed cases; no change. |
| 6.50 Local derivative and zero-term corrections | 2590 | a=0 versus nonzero; good inert and ramified places | No additional counterexample in the listed cases; no change. |
| 6.51 Automorphy and cuspidality of the height series | 2617 | degree-zero projection; zero divisor; constant term | No additional counterexample in the listed cases; no change. |
| 6.52 Hodge-class terms vanish and the height series splits into horizontal and vertical parts | 2631 | rational xi-normalization; horizontal versus vertical part; diagonal | No additional counterexample in the listed cases; no change. |
| 6.53 Rankin kernel Fourier expansion | 2645 | k=1; n=0; endpoint in s | No additional counterexample in the listed cases; no change. |
| 6.54 Logarithmic prime decomposition | 2659 | n=1; one versus two nonsplit prime factors | No additional counterexample in the listed cases; no change. |
| 6.55 Logarithmic weight-two projection | 2673 | logarithmic growth; constant term; k=1 boundary | No additional counterexample in the listed cases; no change. |
| 6.56 Projected derivative decomposition | 2687 | general D versus special Q-prime datum; nonmaximal level | R04 |
| 6.57 Derivative of the mixed theta–Eisenstein series before projection | 2701 | infinitely many p=3 mod 4 for E=Q(i); coefficientwise versus global support | R05 |
| 6.58 Rankin kernel meromorphic continuation | 2715 | central point; gamma poles; finite versus completed series | No additional counterexample in the listed cases; no change. |
| 6.59 Logarithmic coefficient parity | 2729 | one versus two inert factors; n=1 | No additional counterexample in the listed cases; no change. |
| 6.60 Single-prime logarithm criterion | 2743 | one inert prime; two inert primes; ramified prime | No additional counterexample in the listed cases; no change. |
| 6.61 Archimedean holomorphic projection of log δ∞·W^(2) | 2757 | g=1; delta=1; derivative of archimedean completion | No additional counterexample in the listed cases; no change. |
| 6.62 Integral Rankin kernel values | 2771 | integral k=1; r=0 and r=k-1; factorial denominators | No additional counterexample in the listed cases; no change. |
| 6.63 Kernel coefficient functional equation | 2785 | central point; sign +1/-1; zero coefficient | No additional counterexample in the listed cases; no change. |
| 6.64 Central kernel holomorphy | 2799 | weight two; central zero; cusp constant | No additional counterexample in the listed cases; no change. |
| 6.65 Classical L functional equation | 2813 | central point; sign -1; N=1 | No additional counterexample in the listed cases; no change. |
| 6.66 Classical central-value kernel | 2827 | k=1; coherent sign +1; zero value | No additional counterexample in the listed cases; no change. |
| 6.67 Classical central-derivative kernel | 2841 | k=1; incoherent central zero; derivative factor | No additional counterexample in the listed cases; no change. |
| 6.68 Completed Rankin functional equation | 2855 | s versus 2k-s; central sign; gamma normalization | No additional counterexample in the listed cases; no change. |
| 6.69 Weight-two central-value formula | 2869 | k=1; zero central value; trivial class character | No additional counterexample in the listed cases; no change. |
| 6.70 Rankin cusp constants | 2883 | cusp infinity; constant coefficient; weight two | No additional counterexample in the listed cases; no change. |
| 6.71 Rankin Mellin regularization | 2897 | divergent boundary term; subtract constant; Mellin endpoints | No additional counterexample in the listed cases; no change. |
| 6.72 Central-value endpoint normalization | 2911 | endpoint k=1; factor two and gamma normalization | No additional counterexample in the listed cases; no change. |
| 6.73 Central-value genus-sum filter | 2925 | trivial genus character; vanishing genus sum; exceptional genus signs | No additional counterexample in the listed cases; no change. |
| 6.74 Rankin boundary coefficients | 2941 | zero and positive Fourier indices; cusp projection | No additional counterexample in the listed cases; no change. |
| 6.75 Definite period specialization | 2955 | definite quaternion; zero toric period; unit stabilizers | No additional counterexample in the listed cases; no change. |
| 6.76 Projected Rankin derivative cusp form | 2969 | vanishing derivative; logarithmic boundary; cusp projection | No additional counterexample in the listed cases; no change. |
| 6.77 Definite central-value square class | 2983 | zero central value; nonzero square class; normalization under rescaling | No additional counterexample in the listed cases; no change. |
| 6.78 Projected Rankin derivative coefficients | 3003 | n=1; single inert factor; ramified factor | No additional counterexample in the listed cases; no change. |
| 7.1 Ordinary CM lift charts and split intersection lengths | 3028 | ordinary split prime; identity lift; coincident versus distinct sections | No additional counterexample in the listed cases; no change. |
| 7.2 CM lifts and the integral endomorphism filtration | 3050 | unramified/ramified CM; p=2; n=0; finite flat deformation conditions | No additional counterexample in the listed cases; no change. |
| 7.3 Hom of actual integral CM isogeny diagrams | 3088 | identity cyclic isogeny; N=1; automorphisms versus coarse diagrams | No additional counterexample in the listed cases; no change. |
| 7.4 Degenerate Schwartz classes | 3113 | S1 empty/nonempty; S1 near E; S2 split-place condition; nonzero contraction | No additional counterexample in the listed cases; no change. Primary YZZ proof not certified. |
| 7.5 Nearby coherent kernel orthogonality | 3151 | matching versus mismatching quaternion signs; zero local Hom space | No additional counterexample in the listed cases; no change. |
| 7.6 Integral order sandwich | 3171 | maximal order; lattice inclusion both directions; unit ideal | No additional counterexample in the listed cases; no change. |
| 7.7 Inert norm-shell cutoff | 3185 | norm shell empty; valuation boundary; residue size 2 | No additional counterexample in the listed cases; no change. |
| 7.8 Ramified norm-shell volume | 3199 | ramified quadratic extension; p=2; normalized additive volume | No additional counterexample in the listed cases; no change. |
| 7.9 Archimedean zero-term correction | 3213 | archimedean zero Fourier index; gamma derivative | No additional counterexample in the listed cases; no change. |
| 7.10 Finite zero-term correction | 3227 | unramified versus ramified finite place; zero coefficient | No additional counterexample in the listed cases; no change. |
| 7.11 Regularized archimedean multiplicity | 3241 | y outside E; approach to E; s tending to zero | No additional counterexample in the listed cases; no change. |
| 7.12 Finite local multiplicities and diagonal omission | 3270 | nonmaximal U; missing diagonal; general D versus Q-prime | R04 |
| 7.13 Superspecial multiplicity by uniformization | 3297 | superspecial point; residue extension; quotient stabilizer | No additional counterexample in the listed cases; no change. |
| 7.14 Vertical correction vanishes at B-split places | 3311 | B split versus division; zero vertical correction | No additional counterexample in the listed cases; no change. |
| 7.15 Nonzero associated weight-one theta | 3325 | zero Schwartz function excluded; positive standard function; trivial character | No additional counterexample in the listed cases; no change. |
| 7.16 Archimedean derivative kernel | 3339 | lambda<0; diagonal limit; sign of complementary norm | No additional counterexample in the listed cases; no change. |
| 7.17 Marked Green height characterization | 3368 | constant shift; divisor degree zero; diagonal singularity | No additional counterexample in the listed cases; no change. |
| 7.18 CM Eisenstein sum | 3382 | class number one; trivial character; ramified discriminant primes | No additional counterexample in the listed cases; no change. |
| 7.19 Tangent-normalized CM height symbol | 3396 | t replaced by at; nonzero tangent required; product formula | No additional counterexample in the listed cases; no change. |
| 7.20 Eta-normalized CM tangent | 3423 | scaling invariant differential; discriminants -3,-4; roots of unity | No additional counterexample in the listed cases; no change. |
| 7.21 Supersingular Eichler realization | 3450 | ordinary versus supersingular reduction; N=1; level-prime restrictions | No additional counterexample in the listed cases; no change. |
| 7.22 CM level reduction component | 3464 | split/inert/ramified reduction; identity isogeny; component choice | No additional counterexample in the listed cases; no change. |
| 7.23 Half Hom count | 3478 | b and -b; extra units; identity map | No additional counterexample in the listed cases; no change. |
| 7.24 New CM homomorphisms | 3505 | n=0; maps already lift to W; first new lift | No additional counterexample in the listed cases; no change. |
| 7.25 Good-place arithmetic identity | 3532 | spherical inert place; y=j with q(y)=p; k=log p; bad places excluded | No additional counterexample in the listed cases; no change. |
| 7.26 Inert logarithmic singularity and diagonal extension | 3555 | approach to E; logarithmic pole; extension after subtracting singular part | No additional counterexample in the listed cases; no change. |
| 7.27 Ramified logarithmic singularity and diagonal extension | 3569 | ramified quadratic place; dyadic case; different contribution | No additional counterexample in the listed cases; no change. |
| 7.28 Diagonal coefficient and modified self-intersection | 3583 | self-intersection versus distinct sections; changing tangent | No additional counterexample in the listed cases; no change. |
| 7.29 Nonsplit proper-height expression | 3610 | nonsplit place; horizontal/vertical decomposition; diagonal term | No additional counterexample in the listed cases; no change. |
| 7.30 Ordinary multiplicity and local pairing | 3624 | ordinary split place; equal versus distinct sections; valuation length | No additional counterexample in the listed cases; no change. |
| 7.31 Superspecial local intersection | 3638 | superspecial intersection; quotient by units; residue-degree weight | No additional counterexample in the listed cases; no change. |
| 7.32 Vertical correction is nonsingular pseudo-theta | 3652 | division versus split B; compact support near diagonal | No additional counterexample in the listed cases; no change. |
| 7.33 Archimedean adjunction constant | 3666 | genus-one curve; residue normalization; metric rescaling | No additional counterexample in the listed cases; no change. |
| 7.34 Extended local diagonal vanishes at small away-v level | 3680 | shrinking away-v level; identity orbit excluded; finite stabilizer | No additional counterexample in the listed cases; no change. |
| 7.35 Corrected CM multiplicity at 𝔹-split, E-nonsplit places | 3694 | B split but E nonsplit; standard versus special test function | No additional counterexample in the listed cases; no change. |
| 7.36 Hecke kernel action | 3708 | identity Hecke operator; degree-one CM point; stabilizer weights | No additional counterexample in the listed cases; no change. |
| 7.37 Tangent product formula | 3722 | scaling tangent by a field unit or uniformizer; sum of logs | No additional counterexample in the listed cases; no change. |
| 7.38 Complex tangent asymptotic | 3736 | approach to diagonal; coordinate t replaced by at; finite part | No additional counterexample in the listed cases; no change. |
| 7.39 Degree-one CM intersection count | 3750 | m=1; extra CM units; residue-degree weight | No additional counterexample in the listed cases; no change. |
| 7.40 Inert quaternionic order model | 3764 | D=-7, p=3, q=23; q congruence; connecting-ideal orientation | No additional counterexample in the listed cases; no change. |
| 7.41 CM component orthogonality | 3791 | distinct components; same component; zero Hom contribution | No additional counterexample in the listed cases; no change. |
| 7.42 Prime-to-p Hom decomposition | 3805 | m=1; prime-to-p hypothesis; p-power factor excluded | No additional counterexample in the listed cases; no change. |
| 7.43 Diagram isomorphism intersection count | 3819 | isomorphic diagrams; extra automorphisms; quotient by sign | No additional counterexample in the listed cases; no change. |
| 7.44 Split CM intersection vanishing | 3833 | split ordinary prime; disjoint generic sections; diagonal excluded | No additional counterexample in the listed cases; no change. |
| 7.45 CM endomorphism congruence order | 3847 | n=0; identity endomorphism; ramified different | No additional counterexample in the listed cases; no change. |
| 7.46 Tangent self-intersection number | 3861 | tangent scaled by uniformizer; self-term versus disjoint terms | No additional counterexample in the listed cases; no change. |
| 7.47 Nearby quaternionic approximation | 3888 | general D and nonmaximal level; Q-prime incompatible at S1 | R04 |
| 7.48 Archimedean proper-height expression | 3932 | archimedean diagonal omitted; regularized limit; horizontal terms | No additional counterexample in the listed cases; no change. |
| 7.49 Split proper height and zero extended diagonal | 3946 | split place; diagonal extension; zero correction | No additional counterexample in the listed cases; no change. |
| 7.50 Supersingular inert local intersection | 3960 | inert prime; m=1; disjoint-support hypothesis | No additional counterexample in the listed cases; no change. |
| 7.51 Wild-inclusive ramified local intersection | 3974 | ramified p=2 versus odd p; different exponent | No additional counterexample in the listed cases; no change. |
| 7.52 Diagonal-correction local coefficient | 3988 | diagonal multiplicity zero/nonzero; tangent normalization | No additional counterexample in the listed cases; no change. |
| 7.53 Geometric realization of extended self-intersection | 4002 | chosen integral model; nonintegral tangent; extra stabilizers | No additional counterexample in the listed cases; no change. |
| 7.54 Resolvent cusp expansion | 4016 | cusp y tending to infinity; nonzero Fourier index; finite part | No additional counterexample in the listed cases; no change. |
| 7.55 Hecke Green kernel | 4030 | identity Hecke operator; self-value; continuous spectrum | No additional counterexample in the listed cases; no change. |
| 7.56 Norm-one generator count | 4057 | norm-one elements; roots of unity; b versus -b | No additional counterexample in the listed cases; no change. |
| 7.57 Finite CM intersection height | 4071 | residue degree one/two; disjoint sections; sum over places | No additional counterexample in the listed cases; no change. |
| 7.58 CM Hom intersection count | 4085 | identity map; disjointness; new maps minus lifted maps | No additional counterexample in the listed cases; no change. |
| 7.59 CM Hom quaternion realization | 4099 | scalar versus anti-linear element; reduced norm; degree denominator | No additional counterexample in the listed cases; no change. |
| 7.60 Special j tangent values | 4113 | j=0 and j=1728; extra stabilizers; eta tangent normalization | No additional counterexample in the listed cases; no change. |
| 7.61 Inert CM Hom lattice | 4127 | connecting ideal O and nonambiguous class; reverse orientation | No additional counterexample in the listed cases; no change. |
| 7.62 Ramified quaternionic order model | 4154 | D=-7, p=7, q=2, a=(7), b=7(1+j); also alpha=0 | R14, R15 |
| 7.63 CM tensor stabilizer height | 4181 | stabilizer u=1,2,3; r+k=0 excluded; tensor rescaling | No additional counterexample in the listed cases; no change. |
| 7.64 Modular cusp and boundary correction | 4197 | split modular B; cusps retained; genus zero boundary | No additional counterexample in the listed cases; no change. |
| 7.65 Full local decomposition of the height series | 4213 | arbitrary D versus Q-prime; diagonal and vertical terms | No additional counterexample in the listed cases; no change. |
| 7.66 Split diagonal cancellation | 4227 | split place; self-intersection correction; zero-vector term | No additional counterexample in the listed cases; no change. |
| 7.67 Finite adjunction lattice identity | 4241 | trivial lattice; scaling by uniformizer; different contribution | No additional counterexample in the listed cases; no change. |
| 7.68 Marked modular Green kernel | 4255 | diagonal limit; cusp limit; degree-zero normalization | No additional counterexample in the listed cases; no change. |
| 7.69 Atkin–Lehner kernel invariance | 4282 | identity Atkin-Lehner element; involution squared; tangent scaling | No additional counterexample in the listed cases; no change. |
| 7.70 CM kernel invariants | 4296 | identity CM pair; same versus distinct ideal classes | No additional counterexample in the listed cases; no change. |
| 7.71 Diagonal Green finite part | 4323 | z approaching z-prime; subtract logarithmic pole; tangent scale | No additional counterexample in the listed cases; no change. |
| 7.72 Inert disjoint intersection formula | 4350 | r_A(m)=0; p inert; a prime to p; valuation positive | No additional counterexample in the listed cases; no change. |
| 7.73 Ramified disjoint intersection formula | 4364 | r_A(m)=0; p ramified; a prime to p explicitly imposed | No additional counterexample in the listed cases; no change. |
| 7.74 New automorphism length | 4378 | u=1 versus u=2,3 excluded; v dividing N excluded; new automorphisms | No additional counterexample in the listed cases; no change. |
| 7.75 Inert norm-ideal map | 4392 | D=-7, N=1, p=3, q=23, b=j; zero alpha and zero ideal | R14 |
| 7.76 Modified CM intersection pairing | 4419 | equal versus distinct sections; r+k=0 excluded; u=1 versus elliptic point | No additional counterexample in the listed cases; no change. |
| 7.77 Analytic–arithmetic difference is a finite pseudo-theta sum | 4449 | good places outside S-prime; finite difference versus infinite original sums | No additional counterexample in the listed cases; no change. |
| 7.78 Arithmetic adjunction for the CM point | 4463 | degree-one CM point; field extension; diagonal adjunction | No additional counterexample in the listed cases; no change. |
| 7.79 Modular Green constant | 4477 | cusp constant; diagonal regularization; tangent rescaling | No additional counterexample in the listed cases; no change. |
| 7.80 CM genus-orbit count | 4491 | principal genus; class number one; 2-torsion classes | No additional counterexample in the listed cases; no change. |
| 7.81 Hyperbolic norm parameter | 4505 | diagonal parameter; positive versus negative complementary norm | No additional counterexample in the listed cases; no change. |
| 7.82 Renormalized resolvent self-value | 4519 | s tending to 1; pole removed; additive normalization | No additional counterexample in the listed cases; no change. |
| 7.83 New Hom intersection formula | 4533 | m=1; no new lifts; extra automorphism contribution | No additional counterexample in the listed cases; no change. |
| 7.84 Inert unit-orbit count | 4547 | b and -b; extra units; zero alpha excluded here by N>1 and gcd(m,N)=1 | No additional counterexample in the listed cases; no change. |
| 7.85 Tensor-normalized local-to-global CM height | 4561 | tensor rescaling; r+k=0 excluded; product formula | No additional counterexample in the listed cases; no change. |
| 7.86 Nonsplit diagonal cancellation | 4577 | inert/ramified place; proper and vertical diagonal corrections | No additional counterexample in the listed cases; no change. |
| 7.87 Archimedean modular height formula | 4591 | diagonal versus off-diagonal; relative height factor | No additional counterexample in the listed cases; no change. |
| 7.88 Quadratic-pair representation count | 4605 | alpha=0; beta=0 excluded where required; ideal-class count | No additional counterexample in the listed cases; no change. |
| 7.89 Inert total intersection formula | 4619 | endpoint n=m\|D\|/N; zero norm ideal convention | No additional counterexample in the listed cases; no change. |
| 7.90 Ramified total intersection formula | 4633 | ramified prime; non-prime-to-p representative; endpoint norm zero | No additional counterexample in the listed cases; no change. |
| 7.91 Split total intersection formula | 4647 | split prime; zero coefficient; product formula | No additional counterexample in the listed cases; no change. |
| 7.92 Level intersection formula | 4661 | prime dividing level; cyclic diagrams; stabilizer correction | No additional counterexample in the listed cases; no change. |
| 7.93 Rational-prime CM height sum | 4675 | class number one; sum over places above p; residue-degree factor | No additional counterexample in the listed cases; no change. |
| 7.94 Hecke archimedean height formula | 4704 | m=1; diagonal multiplicity r_A(m); Green finite part | No additional counterexample in the listed cases; no change. |
| 7.95 Ramified-congruence pair count | 4718 | ramified congruence; sign choice; two roots versus no root | No additional counterexample in the listed cases; no change. |
| 7.96 Diagonal archimedean CM formula | 4732 | self-value; tangent normalization; zero-index convention | No additional counterexample in the listed cases; no change. |
| 7.97 Split-prime height sum | 4746 | split prime; valuation zero; vanishing local contribution | No additional counterexample in the listed cases; no change. |
| 7.98 Inert-prime height sum | 4760 | one inert prime; valuation parity; zero-index endpoint | No additional counterexample in the listed cases; no change. |
| 7.99 Ramified-prime height sum | 4774 | ramified prime; p-adic norm of a; different factor | No additional counterexample in the listed cases; no change. |
| 7.100 Prime-discriminant pair count | 4788 | prime discriminant; one genus; zero norm ideal endpoint | No additional counterexample in the listed cases; no change. |
| 7.101 Genus pair count | 4802 | trivial and nontrivial genus characters; cancellation | No additional counterexample in the listed cases; no change. |
| 7.102 Total finite CM height formula | 4816 | empty finite contribution; split/inert/ramified terms; diagonal endpoint | No additional counterexample in the listed cases; no change. |
| 7.103 Genus kernel evaluation | 4830 | trivial genus; identity class; sign cancellation | No additional counterexample in the listed cases; no change. |
| 7.104 CM orbit kernel evaluation | 4844 | class number one; unit orbit; diagonal value | No additional counterexample in the listed cases; no change. |
| 7.105 Genus-character filter | 4858 | trivial/nontrivial genus character; vanishing character sum | No additional counterexample in the listed cases; no change. |
| 7.106 Self-value CM orbit sum | 4872 | identity orbit; extra units; resolvent finite part | No additional counterexample in the listed cases; no change. |
| 7.107 Disjoint archimedean CM formula | 4886 | disjoint CM orbits; r_A(m)=0; off-diagonal Green kernel | No additional counterexample in the listed cases; no change. |
| 7.108 Total archimedean CM formula | 4900 | diagonal and off-diagonal terms; zero-index contribution | No additional counterexample in the listed cases; no change. |
| 7.109 Global-local archimedean comparison | 4914 | Q versus K-relative height; local residue weights; product formula | No additional counterexample in the listed cases; no change. |
| 8.1 Projected arithmetic kernel identity | 4939 | zero isotypic projection; wrong local sign; general D normalization | No additional counterexample in the listed cases; no change. |
| 8.2 The χ-isotypic Mordell–Weil space A(χ) | 4963 | trivial G; nontrivial order-three character over F7; zero module | R12 |
| 8.3 Matching local signs force the global sign −1 | 5002 | local sign mismatch; one nearby quaternion switch; product -1 | No additional counterexample in the listed cases; no change. |
| 8.4 Petersson norm, parametrisation degree and Manin constant | 5018 | identity isogeny; composing with [2]; squared Manin constant | No additional counterexample in the listed cases; no change. |
| 8.5 Admissible orders and the test-vector line V(π, χ) | 5034 | conductor zero; ramified local character; non-Eichler allowed orders | No additional counterexample in the listed cases; no change. |
| 8.6 The main identity on X₀(N): heights as Fourier coefficients | 5067 | m=1; diagonal coefficient; classical odd-D hypotheses | No additional counterexample in the listed cases; no change. |
| 8.7 The L-linear Néron–Tate pairing on A(χ) × A^∨(χ^{-1}) | 5083 | M=Q and real quadratic; inverse character; bilinear versus Hermitian | No additional counterexample in the listed cases; no change. |
| 8.8 The χ-Heegner point P_χ(f) and its finite form P⁰_χ(f) | 5119 | orbit size one/two; order-three character; inverse-character convention | R12 |
| 8.9 Toric integral versus finite trace | 5161 | h=1,2; finite sum versus probability average; h^-2 pairing | R12 |
| 8.10 The Heegner map is a toric-invariant functional | 5177 | trivial character; change by torus element; zero local functional | No additional counterexample in the listed cases; no change. |
| 8.11 The Yuan–Zhang–Zhang Gross–Zagier formula (YZZ Theorem 1.2) | 5199 | zero point; wrong local sign; local and global measure rescaling | No additional counterexample in the listed cases; no change. |
| 8.12 The zero case: vanishing of the toric Hom space | 5215 | one vanishing local Hom space; trivial versus arbitrary twist distinction | No additional counterexample in the listed cases; no change. |
| 8.13 Heegner points detect a nonzero central derivative | 5233 | torsion point; trivial character; simultaneous conjugate derivatives | No additional counterexample in the listed cases; no change. |
| 8.14 The explicit Gross–Zagier formula of Cai–Shu–Tian | 5249 | F=Q; c=1; ramified level; exceptional Euler set | No additional counterexample in the listed cases; no change. |
| 8.15 The Gross–Zagier formula on X₀(N) for ring-class characters | 5265 | c=1; D=-3,-4; ramified level; conductor non-coprime excluded | No additional counterexample in the listed cases; no change. |
| 8.16 Variation of the explicit formula for other test vectors | 5281 | empty variation set; one vector changed; zero toric contraction | No additional counterexample in the listed cases; no change. |
| 8.17 Heegner points on X_{N⁺,N⁻} over ℚ and the trivial character | 5297 | Cases I/II; M=Q; replacing quotient or polarization by twice itself | No additional counterexample in the listed cases; no change. |
| 8.18 Non-torsion of the trace point on a parametrised GL(2)-type quotient | 5327 | F=Q; nonadmissible level excluded; trivial character; rank-zero alternative | No additional counterexample in the listed cases; no change. |
| 8.19 Heights of Heegner points on an elliptic curve | 5343 | E=37.a1; K=Q(sqrt(-7)); isogeny; current canonical-height pin | No additional counterexample in the listed cases; no change. |
| 8.20 Corollaries on derivatives: positivity and Galois invariance | 5359 | sign +1 versus -1; zero/simple/triple zeros; all Galois conjugates | No additional counterexample in the listed cases; no change. |
| 9.1 Cotangent saturation for good-reduction optimal quotients | 5386 | p=2 excluded by e<p-1; product quotient; inclusion pR in R | No additional counterexample in the listed cases; no change. BLR locator uncertified. |
| 9.2 The algebraic-point subgroup input to eigenlogarithms | 5409 | torsion x; W=0; A1 times A2; arbitrary Cp-points excluded | No additional counterexample in the listed cases; no change. |
| 9.3 CM coefficient rings, Amice series and interpolation uniqueness | 5435 | infinite residue field; zero power series; accumulating arithmetic characters | No additional counterexample in the listed cases; no change. |
| 9.4 Integral ordinary CM moments on modular and Shimura curves | 5461 | ordinary good prime; integral differential lattice; p-power conductor | No additional counterexample in the listed cases; no change. |
| 9.5 The semistable integration adapter for p-new weight two | 5486 | split/non-split multiplicative reduction; Tate q=p^3; supplied integration | R08 |
| 9.6 The ratio α(f, f_B) of Petersson norms | 5509 | squarefree versus nonsquarefree level; excluded small p; primitive lattice | No additional counterexample in the listed cases; no change. |
| 9.7 The Euler factor at the BDP point | 5545 | p=1,a=2; p=2,a=0; p=5,a=2; Hasse boundary | R12 |
| 9.8 In weight two the p-adic Abel–Jacobi map is the formal logarithm | 5563 | torsion point; degree-zero divisor; coefficient-field embedding | No additional counterexample in the listed cases; no change. |
| 9.9 The Waldspurger formula at CM points of X_{N⁺,N⁻} | 5579 | D odd versus D=-4; N-minus=21; p=5 | R06 |
| 9.10 Compatibility with isogenies, differentials and characters | 5606 | differential multiplied by 2; isogeny; inverse character | No additional counterexample in the listed cases; no change. |
| 9.11 Brooks's quaternionic p-adic L-function | 5622 | D=-4; N-minus=21; p=5; nonordinary f allowed; CM point ordinary since p splits | R06 |
| 9.12 The weight-two formula at a multiplicative prime | 5655 | a_p=1 versus -1; p=2; semistable correction | No additional counterexample in the listed cases; no change. |
| 9.13 Heegner points have nonzero logarithm in every eigencomponent | 5671 | torsion; actual algebraic point versus tensor component; real embedding | No additional counterexample in the listed cases; no change. |
| 9.14 Normalization of the toric root and its square | 5687 | root multiplied by 2; unit normalization; twist then square | No additional counterexample in the listed cases; no change. |
| 9.15 The BDP anticyclotomic p-adic L-function in weight two | 5713 | D=-4,N-minus=21,p=5; empty/singleton/two Euler factors | R06, R13 |
| 9.16 The quaternionic weight-two formula of Brooks and JSW | 5751 | k=2,r=j=0; square of logarithm; quaternionic CM point field | Algebraic square is consistent; dyadic prerequisite remains R06. |
| 9.17 The BDP p-adic Gross–Zagier formula in weight two | 5767 | class number one; p>1 Hasse bound; squared logarithm | No additional counterexample in the listed cases; no change. |
| 9.18 The formula for a p-optimal quotient | 5783 | degree divisible by p; connected versus finite kernel; primitive differential | No additional counterexample in the listed cases; no change. |
| 9.19 The formal logarithm detects non-torsion Heegner points | 5799 | zero/nonzero eigenpoint; CM period nonzero; logarithm of torsion | No additional counterexample in the listed cases; no change. |
| 9.20 Bloch–Kato logarithm of the Heegner Kummer class | 5815 | torsion Kummer class; dual Tate twist; Fil0 de Rham pairing | No additional counterexample in the listed cases; no change. |
| 9.21 The BDP function lies in the Iwasawa algebra | 5837 | infinite unramified coefficient ring; ramified characters; boundedness | R07, R16 |
| 9.22 Dictionary between Skinner's L^S_𝔭(f) and the BDP and Brooks functions | 5853 | n=1; omitted p-factors; finite Euler set; archimedean period units | No additional counterexample in the listed cases; no change. |
| 7.4: Vanishing near E_v and near 0 | 3117 | S1 empty; E_v subset; support inequality | No additional counterexample. |
| 7.4: Terms on the line E | 3118 | x2=0; auxiliary split places | No additional counterexample. |
| 7.4: Existence | 3119 | nonzero toric contraction; arbitrary bad places | Book-only proof input not certified. |
| 7.47: Local nonsingularity | 3896 | general D at nonmaximal level; S1 | R04; book-only deep-level proof not certified. |
| 7.47: Vanishing off S-prime | 3897 | unramified good place; standard lattice | Local good-place formulas match; scope repair R04. |
| 7.47: Pseudo-theta form | 3898 | general D versus Q-prime | R04. |
| 7.47: Identity | 3899 | positive codimension; automorphy | Depends on the repaired general decomposition, R04. |
| 7.47: Projection | 3900 | matching versus mismatching local signs | Additional sign hypothesis is explicit; R04 upstream. |
| 9.2: p-adic analytic subgroup theorem | 5413 | V=0 excluded; logarithm nonzero; algebraic point | Matches Fuchs–Pham Theorem 2.2. |
| 9.2: abelian algebraic-point form | 5415 | torsion; W=0; identity component after a multiple | Matches BSW Theorems 3.1–3.2, retaining zero-dimensional subgroup. |

**Explicit computed controls.**

| Control evaluated | Result |
|---|---|
| Unit index, discriminant -3 | 6/2=3. |
| Unit index, discriminant -4 | 4/2=2. |
| Unit index, discriminant -7 | 2/2=1. |
| Completed derivative, N=1 and L(s)=s-1 | Gamma_C(1)=1/pi, hence derivative 1/pi. |
| rankinPolynomial 0 t | 1. |
| rankinPolynomial 1 t | 1-t. |
| rankinPolynomial 2 t | 1-2t+t²/2. |
| rankinKernelPolynomial 2 0 t | t²/8. |
| rankinKernelPolynomial 2 1 t | 1-t. |
| rankinKernelPolynomial 3 2 t | 1-2t+t²/2. |
| C3 acting by right cyclic shift, chi(generator)=2 over F7, x=e0 | Character-weighted sum (1,2,4). |
| Apply generator to that sum | (4,1,2)=4(1,2,4); inverse-character eigenvalue. |
| Opposite weight convention | (1,4,2) has eigenvalue 2, not 4. |
| C2 permuting two coordinates, sign character, x=(1,0) | Average (1/2,-1/2). |
| Dot-product self-pairing of that average | 1/2, versus finite-sum self-pairing 2. |
| Trivial character, fixed vector, invertible group order | Average returns the vector. |
| Trivial representation of C3 over F3 | Average is zero because card(G)=0 in the field. |
| bdpLFunction with root multiplied by 2 | Output multiplied by 4. |
| bdpLFunction constant coefficient | normalization(0) times root(0)². |
| bdpIncomplete with empty set | Input series unchanged. |
| bdpIncomplete, input 1+T, singleton factor 1-T | 1-T². |
| bdpIncomplete, input 1, distinct factors 1-T and 1+T | 1-T², whereas summing the factors gives 2. |
| bdpIncomplete with a zero factor | Zero. |
| bdpEulerFactor 1 2 | Zero, although the Hasse bound is an equality. |
| bdpEulerFactor 2 0 | 3/2. |
| bdpEulerFactor 5 2 | 4/5. |
| bdpEulerFactor 0 a | Zero by Lean's total division; excluded by theorem hp. |
| Rank-zero Gram determinant | Empty determinant is 1; scaling factor 2^0=1. |
| Galois orbit of size 2 | Averaged bilinear pairing is 1/4 of finite-sum pairing. |
| R14 inert norm-ideal witness | alpha=0 gives zero ideal, without an ideal class. |
| R15 ramified norm-ideal witness | ord_7(14)=1; ord_7(686)=3; missing ord_7(49)=2. |
| R03 pseudo-theta shell witness | exp(p^(4n)-2pi p^(2n)) does not tend to zero. |
| R05 nearby quaternion witness | Each p=3 mod 4 gives k_p(1,j,1)=log p>0. |
| Tate correction over Q_p, q=p³ and log(p)=1 | Each harmonic jump is −1; F(p)=1−(1/3)·3=0, and F(p²)=2−(2/3)·3=0. |

**Source locator audit.** Source identifiers refer to the source-service records retained with the scratch notes. No source text is reproduced here.

| Source locator checked | Source line | Result |
|---|---:|---|
| muller-stoll, Remark 3.1 | `muller-stoll line 156` | x-height is twice Silverman's convention. |
| gross84, I.4 (4.2) | `gross84 line 121` | Arithmetic Artin acts by inverse ideal. |
| conrad-msri, Some conventions, p.69 | `conrad-msri line 94` | Arithmetic Frobenius convention confirmed. |
| conrad-trace, (9.8) | `conrad-trace line 1627` | Relative field factor confirmed. |
| conrad-trace, (9.9) | `conrad-trace line 1630` | Dual-map adjunction confirmed. |
| conrad-trace, Theorem 9.10 | `conrad-trace line 1644` | Poincare/polarization factor two confirmed. |
| gz86, I.5 (5.3)–(5.5), p.229 | `gz86 line 190` | Level Euler removal and Re(s)>3/2; source prose copied, R10. |
| gz86, I.6 (6.1), p.230 | `gz86 line 224` | Classical derivative normalization checked. |
| gz86, IV.3 (3.2)–(3.3), pp.277–278 | `gz86 line 2052` | Terminating polynomial factors checked. |
| yuan-zhang, §6.2, pp.579–580 | `yuan-zhang line 1931` | Located bounded-support claim; counterexample R03. |
| yuan-zhang, (6.2.1) | `yuan-zhang line 2052` | Ambient-dimension factors present. |
| yuan-zhang, Lemma 6.1 | `yuan-zhang line 2059` | Automorphy and codimension separation explicit. |
| yuan-zhang, §7.1 derivative decomposition | `yuan-zhang line 2293` | Located finite-place wording; R05. |
| yuan-zhang, Lemma 7.3 | `yuan-zhang line 2597` | Maximal-order comparison and original/nearby algebras distinguished. |
| yuan-zhang, Lemma 7.4 | `yuan-zhang line 2619` | Inert/ramified logarithmic extension checked. |
| yuan-zhang, local k normalization, p.593 | `yuan-zhang line 2653` | L(1,eta)/vol(E^1), visually checked as a fraction. |
| cst, Theorem 1.1 | `cst line 70` | Cyclic Heegner hypotheses, finite sum and 2^(-mu) confirmed. |
| cst, Theorem 1.5 | `cst line 336` | Central-character/sign assumptions and exceptional Euler set confirmed. |
| cst, Special case 1 | `cst line 370` | Prime-to-discriminant/conductor specialization located. |
| cst, Special case 2 | `cst line 381` | Ramified-prime test-vector condition located. |
| prasanna, Theorem 2.3 | `prasanna line 414` | Rationality statement and rational structures checked. |
| prasanna, Theorem 2.4 | `prasanna line 490` | Squarefree level, p>k+1 and exclusions retained. |
| brooks, Theorem 8.2 | `brooks line 1831` | Norm ratio and CM Waldspurger constant checked. |
| brooks, Theorem 8.11 | `brooks line 2029` | Squared Abel–Jacobi formula checked. |
| brooks, Propositions 8.12–8.13 | `brooks line 2106` | README correctly restores square using preceding formula. |
| fuchs-pham, Theorem 2.2 | `fuchs-pham line 77` | Positive dimension, algebraic point and nonzero logarithm retained. |
| bsw, Theorem 1.1 | `bsw line 113` | Field degree and real embedding assumptions retained. |
| bsw, Theorem 2.8(i) | `bsw line 262` | Totally real coefficient field specialization checked. |
| bsw, Theorem 3.1 | `bsw line 423` | Algebraic point; connected multiple distinction checked. |
| bsw, Theorem 3.2 | `bsw line 439` | Endomorphism-stable connected subgroup argument checked. |
| castella-hsieh, de Rham logarithm pairing | `castella-hsieh line 986` | Dual Tate twist is correct; rejected suspected defect. |
| skinner-published, §2.6, pp.342–343 | `skinner-published line 556` | O^ur correction confirmed; edition link repair R16. |
| skinner-published, Proposition 2.6.1 | `skinner-published line 606` | Formal logarithm squared and eigenform projection confirmed. |
| skinner-published, Corollary 2.6.2 | `skinner-published line 621` | Located; README supplies its eigenlogarithm input separately. |
| gqt, §1.7 | `gqt line 137` | Ordinary convergence excludes split (3,1) at n=1. |
| yuan-bigness-pku, Proposition A.5 | `yuan-bigness-pku line 3975` | Graph measure and genus normalization located. |
| yuan-modular, Theorem 4.3 | `yuan-modular line 2731` | Extra Eisenstein/diagonal terms present. |
| cns, Theorem 3.14 | `cns line 1016` | Odd-p local Whittaker assumptions checked. |
| cns, Theorem 3.15 | `cns line 1053` | Q2, not an arbitrary extension of Q2; assumption retained in repair. |
| jsw, Proposition 5.1.7 | `jsw line 1392` | Good reduction, irreducibility and p-optimality distinctions checked. |
| jetchev, §1 Manin-unit discussion | `jetchev line 61` | Good-prime Manin statement located. |
| dit, Theorem 4 | `dit line 665` | Half-integral-weight normalization and discriminant hypotheses located. |
| dit, (5.17) | `dit line 717` | Absolute-square formula located, no chosen square-root sign. |
| castella-exceptional, Theorem 2.11 | `castella-exceptional line 748` | Linear-root formula has one multiplicative Euler factor. |
| castella-multiplicative, Theorem 3.2 | `castella-multiplicative line 433` | Central-value formula squares the factor and logarithm. |
| burungale, Lemma 5.5 | `burungale line 1041` | Integral CM expansion/measure comparison located. |
| burungale, (5.8) | `burungale line 1046` | Finite translated linear-measure sum located. |
| yzz-erratum-pku, item 4 | `yzz-erratum-pku line 26` | Torus measure volume 2L(1,eta) confirmed. |
| yzz-erratum-pku, item 5 | `yzz-erratum-pku line 33` | Base-change versus Rankin root-number convention confirmed. |
| yzz-erratum-pku, item 10 | `yzz-erratum-pku line 61` | Measure is not uniformly Tamagawa. |
| disegni, Theorem 5.4.1 | `disegni line 2418` | Public arithmetic-theta restatement; underlying book proof not certified. |
| zhang2010, Theorem 4.3.1 | `zhang2010 line 773` | Located as rank-one descent consequence, not independent proof of Gross–Zagier. |
| cns, Proposition 6.2 | `cns line 2052` | Excellent DVR, normal proper flat curve and smooth special-fibre point match the stated comparison. |
| brooks, §2.1 | `brooks line 199` | Even CM discriminants are allowed; compare R06. |
| bdp, Remark 4.7 | `bdp line 2320` | Odd conductor and discriminant are retained in the cited local calculation. |

## Not verifiable

- **Yuan–Zhang–Zhang, 2013 book (`yzz-book`).** Publisher and DOI attempts returned no legally readable text. Proposition 5.8 (README §7.4, existence of degenerate data with nonzero contractions) and Theorem 7.8(4) (§7.47, deep-level support/local constancy) therefore remain uncertified as proofs. Disegni supplies restatements, not those proofs. Other edition-specific book locators are likewise not certified by a different edition. This is recorded in the consolidated scratch `needs-references.toml`.
- **Yuan–Zhang–Zhang, 6 November 2011 draft (`yzz-draft`).** The linked author upload returned HTTP 403. Its Proposition 2.2.1 and §7.1 locators, used for §5.1 and §§1.2–1.4 and elsewhere, could not be compared with that edition. Published numbering cannot substitute. The same consolidated reference request contains this entry; there is no separate request for each target.
- **Bosch–Lütkebohmert–Raynaud, Néron Models, §7.5 Theorem 4 (`blr`).** Settled as uncertified/paywalled in the source-service scratch record. Its locator is retained; it is not reopened or included among missing-text requests.
- **Other source locators.** The 55 groups above are the individually certified locator checks. The remaining displayed theorem/page/equation locators were read in the README and their works were fetched, but are not all individually certified by this report. In particular, a fetched PDF or a matching theorem number alone does not certify every normalization or proof input.
- **Unavailable eligible supplier heads.** The supplied merge order permits the following names, but their folders are absent from the supplied main/Completed trees and they are not among the six supplied sibling heads: AbelianSchemesAndArithmeticModuli; ArakelovGeometryAndAbelianHeights; AutomorphicFormsOnReductiveGroups; AutomorphicGaloisRepresentations; AutomorphicLFunctionsAndLocalFactors; AutomorphicSpectralTheory; ColemanIntegration; ComplexComparisonPartII; ComplexMultiplicationAndExplicitReciprocity; EffectiveDiophantineMethods; EllipticCurveModularity; FiniteFlatGroupsAndIntegralPadicHodgeTheory; GL2AutomorphicRepresentationsAndTransfer; HeightsRationalPointsAndObstructions; HilbertModularVarietiesAndShimuraCurves; MetaplecticAutomorphicForms; ModularCurvesPartII; ModularSymbolsPadicLFunctions; NeronModelsAndSemistableAbelianVarieties; PELModuli; PadicHodgeTheory; ShimuraVarieties; SmoothRepresentationsOfLocalGroups. Their exact section/declaration contracts cannot be certified from the supplied files. Their availability limitation is distinct from R07's seven names, which have no eligible owner in the supplied order or main trees.
- **Lean elaboration and inferred universe parameters.** No Lean process was run, as required by the read-only brief. Mathematical truth and visible binder retention were audited manually; the report does not certify elaborated signatures or proof-script acceptance. The absence of a build is not itself a package finding.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "140543fb18d1698afda7f0f76bdee51c2845ffa7", "job": "RT-GrossZagierAndArithmeticHeights~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
