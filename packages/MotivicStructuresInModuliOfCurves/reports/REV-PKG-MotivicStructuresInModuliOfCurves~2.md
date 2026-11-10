# Review of MotivicStructuresInModuliOfCurves (package, round 2)

**Verdict:** needs changes

Eight findings: two P1, five P2 and one P3. The package is repairable. Its headline results are supported by the sources; several intermediate formulations, a proof route, supplier locators and one Check need correction. No package mathematics or manifest entry was edited in this review.

## R01 (P1) — Tautological decorations are omitted from the graph degree and twist

**Location.** `packages/MotivicStructuresInModuliOfCurves/README.md:1484`, §11.2: “possibly multiplied by tautological decorations”; the asserted map is `L^e S₁₂ → H^{11+2e}`. The same assertion is repeated at lines 1490 and 1493.

**Claim.** The number of edges determines the degree and Tate twist even when the graph has positive-codimension tautological decorations.

**Witness.** On the zero-edge graph `(1,12)`, choose nonzero `α ∈ H¹¹` and a tautological ample divisor `a`. Hard Lefschetz gives `aα ≠ 0` in `H¹³`; the displayed rule places it in `H¹¹`.

Here `d=12`, so cup product with `a` is an isomorphism from degree 11 to degree 13. The source of that morphism is `L S₁₂`, not `S₁₂`. CLP's edge-only convention has no added tautological decorations: clp lines 1044–1048, §7.2 convention 5, printed p.24.

**Exact repair.** Keep the general decorated construction, but record the total Chow codimension `c` of all tautological decorations. Its source is `L^{e+c} S₁₂`, its target is `H^{11+2e+2c}`, and the graphical-basis definition fixes `e+c=(k−11)/2`. Make the API agree and add the divisor example as a negative-control Check. The graph families with unit decorations have `c=0` and retain their current degrees. Tested: `(e,c)=(0,1)` gives degree 13 and `L S₁₂`; `(2,0)` gives degree 15 and `L² S₁₂`.

## R02 (P1) — The weight-duality convention pairs the wrong degrees

**Location.** `packages/MotivicStructuresInModuliOfCurves/README.md:30`: “`W_k H^k(U)` is the lowest-weight part …; `Gr^W_k H_c^k(U)` is its dual top piece.”

**Claim.** The top weight piece of compactly supported degree `k` is dual to the lowest weight piece of ordinary degree `k`.

**Witness.** For `U=𝔸¹`, `k=0`, ordinary `W₀H⁰=ℚ`, but `Gr⁰_W H_c⁰=0`. Their dimensions are 1 and 0. The package's own duality contracts at lines 72 and 84 use complementary degrees.

**Exact repair.** For smooth pure-dimensional `U` of dimension `d`, write
`Gr^W_k H_c^k(U) ≅ (W_{2d−k} H^{2d−k}(U))^∨(−d)`.
State the analogous formula with the two cohomology theories interchanged. Add the affine-line computation as the convention witness and use this complementary-degree formula in §5.4's compact-support consequence. Tested: at `(d,k)=(1,0)` both corrected sides are zero; at `(1,2)` they are `ℚ(−1)`. On proper `ℙ¹`, the degree-two piece is `L`, whereas the untwisted dual of `H²` is `L⁻¹`.

## R03 (P2) — The transposed Specht module requires the signed tensor action

**Location.** `packages/MotivicStructuresInModuliOfCurves/README.md:452`, §3.1: “`V^{⊗n}` modulo … is `⊕_{|λ|=n} V_λ ⊗ T_{λ^T}` as local systems with `S_n`-action”.

**Claim.** The decomposition is stated without specifying that the permutation action is twisted by the sign character. The same paragraph defines `V_λ` using ordinary Young symmetrizers.

**Witness.** For rank-two symplectic `V`, the harmonic quotient of `V⊗V` is `Sym²V`, dimension 3. Ordinary transposition has trace `+3`; the displayed `T_(1,1)` factor gives trace `−3`.

Petersen–Tavakol–Yin §3.2 has the untransposed index (petersen-tavakol-yin lines 450–478, preprint pp.10–11). Remark 3.6 explicitly distinguishes the two actions and explains the transpose (lines 597–613, p.14). SchurWeyl §9.6 makes the same distinction. The explanation in this package's §4.2 does not specify the action on §3.1's locally defined tensor power.

**Exact repair.** Specify in §3.1 that the displayed transposed decomposition uses `σ ↦ sgn(σ)·permute(σ)`, with `V` placed in cohomological degree one; retain the ordinary action in the definition by Young symmetrizers. Alternatively display both decompositions and identify their sign twist. Add the rank-two, two-slot Check. Tested: the signed swap is `−id` on `Sym²V`, trace `−3`, agreeing with the transposed factor; the unsigned version has `T_(2)` and trace `+3`.

## R04 (P2) — The proposed degree-eleven induction misses its base region and second differential

**Location.** `packages/MotivicStructuresInModuliOfCurves/README.md:621`, §4.7: “whose base cases are `(1, n)` with `n ≤ 11`”; dependencies at line 623.

**Claim.** The induction of §§2.4–2.5, genus-one counts and the boundary formula suffice to prove the all-genus degree-eleven vanishing.

**Witness.** At `(g,n)=(2,9),(3,7),(4,5),(5,3)`, `max(2g,2g−2+n)=11`. These are degree-eleven base pairs outside the stated list. Moreover genus-one boundary factors have nonzero `H¹¹`.

The first boundary injection alone does not kill those factors. CLP-H11 uses an additional oriented two-edge differential: clp-h11 lines 406–444, §§4.1–4.3, preprint pp.10–14; injectivity for higher genus is lines 447–462, and the genus-two calculation begins at lines 463–488. The source's preliminary boundary injection itself uses additional low-genus input. This is a missing proof input, not a counterexample to the theorem.

**Exact repair.** Supply the weight-eleven boundary complex and its injective second differential as explicit intermediate targets, with the genus-two restriction calculation and the genus-at-least-three loop argument, citing CLP-H11 §§4.1–4.3. Correct the finite base region. Put the low-genus Chow–Künneth inputs before this target: §5.4 is independent of Layer 4 and can be placed earlier, with its own prerequisites. For genus two, CKgP gives the bases through ten markings using boundary `H⁹=0`; §4.6 at `(n,k)=(11,11)` then gives the eleven-marking base. Do not introduce a forward dependency or cite the unproved §4.7 from those inputs. Add the weight spectral sequence, orientation character, lower odd vanishing, and explicit cusp restriction maps to the Needs list.

Tested on the omitted `(2,9)` base: `W₁₁H¹¹(M₂,₉)=0` by CKgP and the normalized-boundary degree-nine groups vanish, so `H¹¹(M̄₂,₉)=0`. At `(2,11)`, the generators in §4.6 have degrees 11 on `(2,10)` and 9 on the other factors, all zero. For the subsequent oriented differential, an edge interchange acting by `−1` produces `id−(−id)=2id`, rather than an unsigned cancellation.

## R05 (P2) — The repair substitutes a route-dependent weakening for the general reduction

**Location.** `packages/MotivicStructuresInModuliOfCurves/README.md:608` restricts the original generating family to `2 ≤ k ≤ 23`; line 616 says “Whether the smaller family suffices at `k ≥ 24` is left open”.

**Claim.** Enlarging the generators above degree 23 completes the original all-degree target because the two present consumers use degrees 13 and 15.

**Witness.** CLP Lemma 3.2 has the original generating family without this degree bound (clp lines 433–440, p.10). The repair's `(n,k)=(23,24)` case has `11+11+2=24` and is explicitly excluded from that target.

The newly supplied low-degree route is useful. Its failure with two odd factors is not a disproof of the general source statement, and restricting to the present consumers violates the binding general-library principle. This is not a settled “not actionable” finding: F02 was marked “applied differently”, and its generality was changed.

**Exact repair.** Restore the all-degree original-generator statement as the target. Isolate containment of the two-odd-factor boundary contributions as a named intermediate target, with exact hypotheses and the source proof gap recorded. Retain the verified `k≤23` argument as a partial route, and the enlarged-family statement only as a separately identified weaker result if needed. Remove the “left open” scope exclusion and the argument from the two consumers. The review does not claim to have proved the missing containment. The regression test is coverage of `(n,k)=(23,24)` with the original family: merely adding both degree-eleven vertex classes to the generators must not count as proving that target.

## R06 (P2) — Supplier section identifiers have drifted

**Location.** `packages/MotivicStructuresInModuliOfCurves/README.md:64`, `:82`, `:122`, and the repeated Needs/Dependencies citations: `MC.0`–`MC.7`, `H.1/operations`, `H.0/projective-direct-image`, `§C.0`.

**Claim.** Those identifiers locate the consumed statements at the suppliers' current texts.

**Witness.** StableReductionPartII PR #1841, `TauCetiRoadmap/StableReductionPartII/README.md:7297`, now exports these operations in §7.11; there is no `MC.*` heading or old-to-new alias. The two board suppliers likewise have numerical sections instead.

The other verifiable witnesses are `packages/MappingClassGroupsAndCanonicalRepresentations/README.md:864` (§2.3, uniformization), and `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:431` and `:480` (§§4.5 and 5.1). None defines the cited old identifier. The first repair report's assertion that finding a board package resolves `C.0` was insufficient: the package exists, but that section does not.

**Exact repair.** Resolve each consumed object to its current section, throughout the README. In StableReductionPartII use §0.4 and SchemeAndStackFoundations §4.15 for the pointed stack; §2.248 for the universal-curve equivalence; §§3.1–3.3, 3.7, 3.10–3.11 for clutching, cotangent lines and boundary normalization; §§4.1 and 4.14 for the coarse/determinant results actually used; §§5.1, 5.10–5.11 for the Hodge bundle and its splitting; §7.11 for the consumer export. Their original README heading lines are respectively 337, 5614, 5780, 5808, 5836, 5938, 5980, 5994, 6081, 6313, 6347, 6501, 6513 and 7297. Use MappingClassGroupsAndCanonicalRepresentations §2.3 and MixedHodgeModulesAndIrregularHodgeTheory §§5.1, 4.5. Update destinations of the affected declared contracts without changing their slugs. Keep their additional unsupplied assertions as gaps, not claims that these sections already prove them.

Tested: §7.11 explicitly assigns tautological/cohomological operations to this consumer while supplying the stacks and algebraic maps; §3.10 retains graph automorphisms; §5.11 states the Hodge-bundle direct sum; the two board sections state precisely uniformization and Hodge-module operations. No new supplier or upward edge is needed.

## R07 (P2) — The Adams-series contract lacks a convergence hypothesis

**Location.** `packages/MotivicStructuresInModuliOfCurves/README.md:118`, `gap:complete-adams-series`: “complete filtered rational special λ-algebra with continuous Adams operations”. The same contract is in `packages/MotivicStructuresInModuliOfCurves/design/plan.json`.

**Claim.** These hypotheses suffice for plethystic exponential and logarithm on positive-filtration elements.

**Witness.** Give `ℚ[[t]]` its binomial λ-structure and `t`-adic filtration. All Adams operations are the continuous identity. For `x=t`, the partial sums of `Σ ψ_r(x)/r` modulo `t²` are `t, 3t/2, 11t/6, …`, never stationary.

Thus the plethystic exponential is undefined in the specified completion. SchemeKTheoryOperations PR #1229, `TauCetiRoadmap/SchemeKTheoryOperations/README.md:2156`, explicitly includes identity Adams operations for the binomial structure. HabiroNahmSeries §5.1 avoids the problem by powers of augmentation variables, not continuity alone.

**Exact repair.** State the filtration hypotheses ensuring convergence, for example a separated complete multiplicative filtration with `ψ_r(F^a) ⊂ F^{ra}` for `a≥1`, and continuous commuting Adams operations. Equivalently, for formal augmentation variables specify `ψ_r(t_i)=t_i^r` and the requisite coefficient action. Put the same corrected needs in the README and the plan's gap entry, retaining the slug. Tested: with the power action, the coefficient of `t^m` receives only finitely many contributions; `Σ ψ_r(t)/r=Σ t^r/r`, so `Exp(t)=(1−t)⁻¹` and `Log((1−t)⁻¹)=t`. The binomial counterexample is excluded because `ψ₂(t)=t∉F²`.

## R08 (P3) — The two-cusp Check is impossible in the stated genus-three range

**Location.** `packages/MotivicStructuresInModuliOfCurves/README.md:1722`, §12.10: “`S₁₂ ⊗ S₁₂` occurs through boundary strata with two genus-one vertices carrying cusp classes”.

**Claim.** Such a stratum occurs for the section's `g=3`, `n≤11` range.

**Witness.** Two cusp vertices require at least 22 incident flags. With exactly two genus-one vertices and `r` rational vertices, genus three forces `b₁=1`, so their combined valence is at most `n+4−r≤15`.

If there is a third genus-one vertex, the graph is a tree and the two chosen vertices have at most `n+3−r≤14` flags. These exhaust the possibilities. Thus no such graph exists. This does not refute the semiring theorem; that theorem permits tensor products without asserting that every monomial occurs.

**Exact repair.** Replace the occurrence claim by the computed flag bound and explicitly distinguish permission from occurrence. If a two-cusp example is wanted, label it outside this range: the separating genus-two graph with ten legs on each genus-one vertex has `n=20`, eleven flags per vertex, and decoration degree `11+11+2=24`. Do not infer nonzero global pushforward merely from the tensor on its normalization. Tested: the proposed replacement excludes all `g=3,n≤11` two-cusp strata while leaving the statement of Theorem 1.9 unchanged.

## Previous findings and repairs

These were checked first, against both the current passages and the texts cited in the repair report.

| Previous id | Status | Repaired passage and verification |
| --- | --- | --- |
| F01 | Repaired | README:34 now says “a polynomial `P ∈ ℚ[T]` with `N(q) = P(q)` at every prime power `q`”; :76 describes DM descent and purity in prose. WeilConjectures §5.22 and DeligneWeightsAndPurity §8.24 contain those statements. The three invented names no longer occur. The distinct stale-section pattern is R06. |
| F02 | Partly repaired | README:608 now says “these are not generators as they stand” and supplies the strata expansion, projection formula and re-association. The `k=15,n=13` Check at :615 correctly lands on `(1,15),(1,13),(2,12),(1,14)`. But the general target was narrowed: R05. |
| F03 | Repaired | README §2.6 now cites “Keel, Introduction, results (1) and (4), pp. 545 and 549” and “Theorem 1, p. 556”. keel lines 20–29, 180–181 and 476 support them. Printed p.556 is correct; the previous review's p.557 and proposed compact-product citation for an open CKgP use were not. The manifest agrees. |
| F04 | Repaired | README §9.1 retains “`h = 1 − (Σ_{j=1}^{r} k_j)/2`” and distinguishes the misplaced factor from Kannan's wrong upper endpoint. Identity in genus four: 4 versus 7/2 and 1; genus-two involution: 0 versus −1/2 and −2. gorsky lines 242–244, 347; kannan lines 572–577. |
| F05 | Repaired | README §3.4 cites “Wahl, Theorems 1.1 and 1.2” with Looijenga Proposition (2.1). wahl lines 44–53 and looijenga-stable lines 174–199 give boundary stability, capping and punctures. At `g=4`, the minimum of 2 and 8/3 is 2. The manifest agrees. |

No prior finding was marked “not actionable in this package”. R05 concerns a new weakening introduced by the repair, not a claim that the earlier reviewer proved the missing all-degree case.

## Verified sound

**Coverage and method.** Read all 106 numbered targets, their 106 Needs lines, the 13 layer endings, all 17 explicit definition/API blocks, the summary, conventions, supplier contracts and corrections. Each of the 17 API blocks has at least three Checks. Re-read every repaired passage and searched for the repaired patterns elsewhere. Only unchanged rows with actual computed values in the earlier review were reused; statements previously covered merely by “matches the table” were read again. The numerical rows below distinguish source-supported results from independent arithmetic and from identified failures. They are finite adversarial tests, not replacements for the proposed proofs.

The package imports the foundational stacks, cohomology, weights and operations rather than claiming their ownership. It is not a replacement for a roadmap already on main. The graph, Chow-generation and curve-moduli applications are its own mathematical targets. The point-count results include characteristic two and all prime powers, with the odd-characteristic quadratic-character calculation separated from the characteristic-two calculation. There is no good-primes restriction. R05 is the route-dependent scope exception found in the repaired text.

The headings are mathematical, and the build explicitly separates the counting branch from the Chow-generation branch. No heading is a source chapter name and the README does not prescribe following a source's exposition. The extra dependency needed in R04 also explains why the Chow-generation base cases must precede that use of the vanishing theorem. The sample statements are paraphrases with locators, not copied source passages. The sieve tables are mathematical assertions about configuration counts, not executable algorithms or certificates. No job identifier, machine path, PR number, HTML anchor, `set_option`, or sorry-defined datum occurs in the package README/Lean. The “left open” scope exclusion is addressed in R05.

### Seeded source sample

All 15 sampled targets were read in the legal cached texts, including the CLP figures on printed pp.25–27. There are no additional manifest entries flagged as unverified. Source line numbers below refer to the supplied line-numbered extractions; “preprint” distinguishes the version actually read from a journal page number.

| Target | Locator read | Support and qualification |
| --- | --- | --- |
| 1.6 Polynomial point counts in low genus | bfp lines 255–257, p.1329, and Corollary 9.5, lines 1278–1289, p.1353; bergstrom-hyperelliptic lines 1703–1722, §11.2, preprint p.27; bergstrom-genus-three lines 95–117, Theorems 2.1–2.4, pp.2–3 | Ranges `(1,≤10),(2,≤7),(3,≤5)` and equivariance agree. The compact Tate assertion uses the all-prime-power comparison, not an ordinary-cohomology trace for an open stack. |
| 3.1 Symplectic local systems | petersen-tavakol-yin lines 450–478, §3.2, pp.10–11; lines 597–613, Remark 3.6, p.14; clp lines 412–425, Lemma 3.1 proof, p.10 | Highest weight, contraction quotient and tensor weight agree. The transposed Specht factor requires the additional signed-action convention: R03. |
| 4.6 Odd-marking reduction | clp lines 433–440, Lemma 3.2, p.10 | Odd `n` and the three printed families agree. The source has no degree-23 bound. The proof's containment assertion needs work, now isolated in R05. |
| 4.10 Finite generation for homology | clp lines 446–448, Remark 3.3, p.10 | Source asserts existence with explicit bounds, but does not print this region. README correctly labels its own region as derived from §2.3; the finite-region arithmetic below agrees. |
| 6.1 Gonality strata in genus seven | clp lines 547–557, §5 opening, p.13 | Closed low-gonality loci and decomposition into gonality ≤3, 4 and 5 agree; the universal bound is `⌊(7+3)/2⌋=5`. Characteristic-zero cycle setting retained. |
| 6.2 Low-gonality locus | clp lines 559–560, §5.1, p.13; canning-larson lines 1790–1800, Lemma 9.9, preprint p.33 | `g≥4,n≤g+7` specializes to `g=7,n≤14`. Intrinsic CKgP and the tautological supported image are correctly distinguished. |
| 6.7 Special tetragonal strata | clp lines 621–623, Lemma 5.3, p.15, and lines 647–684, p.16; canning-larson-genus-seven lines 717–760, Lemmas 4.2–4.3, preprint pp.17–18 | Chow generation is by CE classes and marking hyperplanes. The marked evaluation map has rank `2n`; the two splitting types satisfy the appropriate distinct/equal-part hypotheses. Two minor source slips are recorded below. |
| 9.9 Equivariant genus-four counts | bfp lines 1386–1396, Theorem 11.1, p.1356 | All ten Schur polynomials agree, including the completed palindromic terms. Open coefficients are virtual; compact coefficients are actual. Values and dimension specializations appear below. |
| 11.2 Cusp-decorated graphs | clp lines 1036–1048, §7.2 conventions 1–5, p.24 | The source's undecorated degree/twist rule is correct. The README adds general tautological decorations without changing the rule: R01. |
| 11.6 Basis of degree 13 on `(2,12)` | clp lines 1092–1098, Lemma 7.7, p.26, with its figure | Family sizes `66,132,66`, total 264; basis is of rank-two morphisms, so rational dimension 528. |
| 11.7 Rank of the restriction matrix | clp Figure 2, p.25, and lines 1104–1129, proof of Lemma 7.3, p.27 | Nine families total 891. Independent restriction blocks give 825; 66 relations with distinct `R₁(ij)` pivots give the opposite bound. Relations are initially relations of restrictions, not global classes. |
| 12.2 Degree-fifteen homology | clp lines 1135–1147, Lemma 7.10 and proof of Theorem 1.7, p.27 | Exceptional genus-one markings 11–15 and genus-two markings 11–13 agree. Both cusp seeds are necessary. |
| 12.3 Complementary odd realizations | clp lines 1023–1029, Corollary 7.2, p.24, and lines 1151–1155, Corollary 7.11, p.28; getzler-semiclassical line 642, final genus-one table | Exponents `d−12,d−13,d−15` and multiplicity 186263 agree. Semisimplification is retained. |
| 12.4 Splitting on `(1,15)` | clp lines 1209–1224, Lemma 8.3, p.29 | The boundary image and compact-support image give the two geometric subspaces. Their Hodge types separate them; comparison transports the geometrically defined splitting to Galois representations. |
| 12.10 Genus three through 11 markings | clp lines 535–543, proof of Theorem 1.9, p.13; theorem on p.3 | The theorem and hard-Lefschetz range `k≤17` agree. The proposed occurrence Check does not: R08. The source does not assert that every tensor monomial occurs. |

### Computed adversarial table

`L` has weight 2 and `S₁₂` weight 11. For polynomials, evaluation at 1 is Euler-characteristic arithmetic, not a claim about a field with one element. In rows involving asymptotic sieve polynomials, the values are of the displayed polynomial parts; they are not asserted to be exact small-field counts.

| Statement | Instances tried | Values computed on the two sides / competing models | Result and change |
| --- | --- | --- | --- |
| Conventions: stability and dimension | `(0,2),(0,3),(1,0),(1,1)` | `2g−2+n = 0,1,0,1`; allowed pairs have `d=0,1`; unstable pairs excluded | No forgetful map to an unstable target is promised. |
| Conventions: duality | `𝔸¹,d=1,k=0,2`; `ℙ¹,k=2` | Same-degree proposal: `1≠0` at k=0. Corrected pairs: `0=0`, `L=L`; on proper `ℙ¹`, `L≠L⁻¹` | R02. |
| Conventions: Tate and homology | `ℙ¹/𝔽₂` | `Tr H⁰=1`, `Tr H²=2`, mass `1+2=3`; `H₀=H²(1)=ℚ`, `H₂=H⁰(1)=ℚ(1)` | Twist direction agrees with suppliers. |
| 0.1–0.2 Tautological operations | `(0,3),(1,1),(7,0)` | `κ₀=2g−2+n=1,1,12`; adding a mark adds 1; a codimension-one pushforward adds degree 2 | Real unit, stable target and degree tests. R01 is the later violation of this convention. |
| 0.3 Stable-pair order | `(0,4),(1,2)` | `2g+n=4=4`, genus `0<1`; forward order true, reverse false | Nontrivial equal-weight order test. |
| 0.4 Boundary exactness | `M₀,₄=ℙ¹−3pts` | `e_c=L−2`; add three boundary points to get `L+1=e_c(ℙ¹)` | Ordinary and compact-support theories stay distinct. |
| 0.5 Cusp realizations | weights 12,14,16,24 | analytic cusp dimensions `1,0,1,2`; realization ranks `2,0,2,4` | Matches pinned dimension formula; not a claim that weight 24 has rank two. |
| 1.1 Marking twists | two distinct points of `ℙ¹`, cycle types `(1,1),(2)`, q=2 | `(q+1)q=6`; conjugate ordered pair `q²−q=2` | Twist is not substitution of q² into the untwisted count. |
| 1.2 Equivariant Euler class | `𝔸¹,𝔾_m`; standard `S₃` representation | `L`, `L−1`; standard character at identity 2 | Compact supports, subtraction and multiplicity normalization correct. |
| 1.3–1.4 Graph transform and Laplacian | `p₁²,p₂`; genus-zero trivalent seed | `Δ(p₁²)=h=Δ(p₂)`; three stable partitions at `(0,4)` | The factor 1/2 and the second derivative both matter. |
| 1.5 Orientation convention | graph with two interchangeable edges | edge swap on `det E` is −1; invariant constant line changes from dimension 1 to 0 | Orientation character cannot be omitted. |
| 1.6 Low-genus ranges | terminal pairs `(1,10),(2,7),(3,5)` | dimensions `10,10,11`; next genus-one case has `dim H¹¹=2≠0` | Claimed ranges agree with sources; bound is discriminating. |
| 2.1–2.3 Cohomological dimensions | `M₂,M₁,₁`; `(4,1),(2,12)` | vcd `3,1`; compact-support vanishing thresholds `8,14`; `2d−k>vcd` rearranges to the stated strict inequalities | Small-genus exceptions retained. |
| 2.4 Boundary injection | `(1,11),k=11` | source dimension 2, restrictions 0; compact-support hypothesis fails | Correct negative control. |
| 2.5, 2.7–2.9, 9.8 Odd vanishing | k=7 and k=9 base regions | k=7: `7+6+4=17` pairs; k=9: `9+8+6+4=27`; first nonzero odd cusp degree 11 has dimension 2 | Universal ≤9 headline supported; degree11 cannot use the same vanishing premise. |
| 2.6 Genus zero | n=3,4 | point: `H⁰=ℚ`; `ℙ¹`: ranks `(1,0,1)` and boundary divisors equal the point class | Repaired Keel locator supports these. |
| 3.1 Harmonic tensors | g=1,n=2; g=2, partition `(1,1)` | rank-three symmetric quotient: swap trace +3 unsigned, −3 signed; primitive exterior square rank `6−1=5` | R03; primitive part is not the full exterior square. |
| 3.2–3.3 Genus one | k=11,n=11,12,13; k=13 | multiplicities `1,11,66`, ranks `2,22,132`; `S₁₄=0` | Fixed-marking hook dimension `binom(n−1,10)`, not `binom(n,11)`. |
| 3.4–3.5 Stability | g=4,k=2; g=10,9,k=6 | bounds `2,8/3`, minimum 2; `(2g−2)/3=6,16/3` | g=10 is inside degree-six stable range, g=9 outside. |
| 4.1–4.3 Marking quotients | n=1; n=k>0; n=k=0 | `Φ₁,₁=0` (no stable target); positive n=k gives `H⁰` of nontrivial weight-n local system =0; weight-zero trivial system gives ℚ | Zero-marking exception is retained; no “all n≥k” shortcut at n=k=0. |
| 4.4 STE definition | empty generators; cusp seed | generated system has unit ℚ and only tautological odd part 0; adding `S₁₂` gives rank2 in degree11 | Empty generators do not give the zero ring. |
| 4.5 Filling criterion | `S=RH`, `(1,12,11)` and `(1,11,11)` | quotient at first pair 0 but `H¹¹` rank22; at second quotient rank2 | Corrected same-degree hypotheses exclude the printed-source counterexample. |
| 4.6 Repaired low-degree route | n=13,k=15, `β⊗ψ` | `11+2+2=15`; after re-association source degree13 and landing pairs `(1,15),(1,13),(2,12),(1,14)` | Low-degree repair works; no assertion that β itself is a generator. |
| 4.6 All-degree target | n=23,k=24, two odd factors | `11+11+2=24`; original STE has no genus-one generators below22, enlarged family includes both degree11 factors | R05; different generating families are different statements. |
| 4.7 Degree-eleven route | `(2,9),(3,7),(4,5),(5,3)` | each `max(2g,2g−2+n)=11`; claimed genus-one-only list misses all four | R04; signed second differential gives `id−(−id)=2id`. |
| 4.8 Cusp closure | forget `(1,12)→(1,11)` | degree11 pushforward lands in degree9, which is 0 | Pushforward does not create an extra degree-nine seed. |
| 4.9 Finite cohomological generation | k′=4,11,13 | max genus for4 is6, not7; `(1,11,11)` qualifies; for13 genus≤20, genus-one n=13, genus-two n=9…13 | Strict and weak inequalities correctly separated. |
| 4.10 Homological generation | k=13, n≤1 versus n≥2 | g≤6 for n≤1; genus-one n≤13, genus-two n≤11; `(g,n)=(2,11)` has d=14 and complementary degree15 | Explicit region is finite and uses pair-specific d. |
| 4.11–4.12 Simple realizations/top-heaviness | degree11 and12; `ℙ¹` | simple types `S₁₂` and `L⁶`; multiplication `S⁰→S²` has ranks1→1 | No perfect pairing on every STE is inferred. |
| 5.1–5.3 CKgP | point, `ℙ¹`, elliptic E, `𝔾_m` | point exterior product identity; `Δ_ℙ¹=pt×ℙ¹+ℙ¹×pt`; E has forbidden diagonal `H¹⊗H¹` component of ambient rank4; `A¹(𝔾_m)=W₂H²=0` | Universal test-stack quantifier distinguishes the wrong property. |
| 5.4 Low-genus CKgP | `(1,10),(1,11)`; g=3,5,6 | first allowed, second has `S₁₂` rank2; bounds `11,7,5` | No uniform-in-genus bound asserted. |
| 6.1–6.2 Gonality/low-gonality | g=7, n=14; hyperelliptic and tetragonal curves | bound5; low-gonality marking bound `7+7=14`; gonality2 is in ≤3 and outside4, gonality4 outside5 | Nested loci and support conclusion agree. |
| 6.3–6.5 Cover bundles and strata | g=7; E=(2,4,4),(2,3,5), F=(4,6) | ranks3,2; degrees10,10; bidegree(3,4) genus `(3−1)(4−1)=6<7` | Trigonal genus-seven curves cannot also admit the required primitive degree-four map. |
| 6.6–6.7 Marked evaluation | n=0,3; f=4,g=7 | target ranks0,6; allowed `4f−2g+1=16−14+1=3`; CE determinants for `(2,4,4)` and `(4,6)` are2 and−2 | Rank `2n`, not n; characteristic-zero rational coefficients allow these inversions. |
| 7.1–7.2 Orthogonal geometry | rank5 isotropic subspace in rank10 | `dim OG⁺=45−35=10`; half-spin dimension `2⁴=16` | Quadratic structure, not merely underlying bundle, is retained. |
| 7.3–7.4 Spin quotient | central −1 and effective projective action | −1 acts as −1 on half-spin; SO quotient would retain generic μ₂, effective PSO quotient has trivial generic stabilizer | Correct lift/rigidification, no descent of half-spin through SO. |
| 7.5 Incidence | n=0,4 | `dim Gr(7,16)=7·9=63`; Q₄ rank12, E₄ rank3, quotient9 | Degenerate empty incidence and four-marking bundle ranks agree. |
| 7.6–7.7 Genus-seven headline | unmarked case | `κ₀=12`; push-pull divided by12 returns identity; `c(7)=3` | Nonzero denominator and n=0 route supplied. |
| 8.1–8.3 Hyperelliptic counts | g=2, q=2 and3, n=0…3 | q=2: `8,24,63,138`; q=3: `27,108,404,1368`, from `q³,(q+1)q³,(q+2)q⁴−1,(q²+3q−1)q⁴−3q` | Distinguishes the marking moments; even characteristic not excluded. |
| 8.4–8.6 Quadric incidences/masses | q=2; nonreduced equation | automorphism orders cone48, split72, nonsplit120; equation spaces have `2¹⁵=32768` or `p₁₅(2)=65535` points | Denominators nonzero; nonreduced equations remain in incidence carrier. |
| 8.7–8.8 Inverse zeta | `ℙ¹`, split and nonsplit quadrics, q=2 | `Z_ℙ¹⁻¹=1−3t+2t²`; nonsplit s₂=0,s₃=20; split s₃=−36 | Orbit signs and termination tested separately. |
| 8.9–8.11 Sieve rows | unmarked q=2 | cone tuple `(32768,−24576,4096,0)`; nonsplit `(65535,−40955,0,2540)`; split `(65535,−73719,28644,−4572)` | Agree with source polynomials; cone sum/48=`12288/48=256=2⁸`. Additional marked rows below. |
| 8.12–8.13 Four points/tail | q=2; n=0,1,2,3 | signed four-point count `9·4·1=36=6²`; cutoff exponents `9/2,5,11/2,6` | At n=3 the undetermined integer multiple of q⁶ must be retained. |
| 8.14 Twisted sieve | cone q=2, cycles(2),(3); nonsplit(3) | cone S₀ `114688,270336`; cone(3) S₂=24576; nonsplit(3) S₂=0; exact nonsplit S₀=491460 versus displayed high part491520 | Difference −60 has degree<6; truncation is not falsely called exact. |
| 9.1 Quotient genus/Euler characteristic | identity g=4; involution g=2; S₃ dimensions | quotient genera4,0; wrong half-factor `7/2,−1/2`; wrong endpoint `1,−2`; `2·1−6·2=−10` | Repaired formula discriminates both source misprints. |
| 9.2–9.3 Hyperelliptic equivariance/cutoff | n=3, g=4 | identity specialization gives `(q²+3q−1)q⁸−3q`; d=12,s=15 yields `2d−s=9`, error exponent7.5 | Local cutoff reaches exactly the needed odd degrees. |
| 9.4–9.7 Polynomial-count/Tate headline | q=2, n=0…3 | compact `7965,47517,388191,3955127`; open `832,2364,6120,14451`; differences `7133,45153,382071,3940676` | Compact−open=boundary; compact palindromicity checked coefficientwise. |
| 9.9 Schur counts (sample) | q=2, S₂ and S₃ | compact S₂ `265023+123168=388191`; compact S₃ `1352483+2·1207130+188384=3955127`; open S₂ `4852+1268=6120`; open S₃ `9408+2·2655−267=14451` | All ten source polynomials and dimension specializations agree. |
| 9.9 Euler/middle-degree check | q=1; degree6 coefficient | open S₃ coefficients `(2,−6,0)`, dimension−10; middle compact `3414+2·3304+583=10605` | Negative open sign coefficient is permitted. |
| 9.10 Local systems | q=2, partition(1) | `(832)(3)−(128+4)=2364`, the one-marking open count | Euler trace is not a claim of individual cohomology vanishing. |
| 10.1–10.3 Low even cohomology | `(0,4),(1,1)`; degree4 seed; g=10,9 degree6 | H² ranks1,1; k′=4 seeds genus≤6 and n≤4; stable bounds6 versus16/3 | Tautological generators, not merely Tate weights, are required. |
| 10.4–10.6 Even homology/complementary degrees | k=14 | genus≤7; genus7 n≤2; maximal n at g=3,4,5,6 are10,8,6,4; complementary twist exponent `d−7` | Finite seed region lies in CKgP ranges; conditional perfectness is not asserted unconditionally. |
| 11.1–11.2 Odd genus-two types/decorations | degree15; `(e,c)=(2,0),(0,1)` | `L²S₁₂` weight15; decorated graph weights15 and13, whereas edge-only second output is11 | R01; genus-two S₁₆ exclusion agrees with source. |
| 11.3–11.6 Graphical bases | family counts | `11`; `286+11+132=429`; `1001+4004+11+132+858=6006`; `66+132+66=264`, rank528 | Multiplicity counts distinguished from rational dimensions. |
| 11.7 Restriction matrix | nine family sizes and pivots | total891; first four blocks `132+11+132+220=495`, remaining independent blocks330; rank≥825;66 independent relations imply rank≤825 | Both bounds give825; kernel dimension66. |
| 11.8–11.10 Global genus-two generation | inducing group and residual relations | index `12!/(10!2!)=66=11+55`, not132; `825+11=836`, `891−836=55` | Restriction relations are not all global relations; adjacent reductions use k13,15. |
| 12.1–12.2 Homology headlines | degrees13,15 | degree13 exceptions `(1,11…13),(2,11)`; degree15 `(1,11…15),(2,11…13)` | Separate genus-one weight16 seed at `(1,15)` is necessary. |
| 12.3 Complementary twists | d=15 and general d | `2(d−12)+11=2d−13`; `2(d−13)+11=2(d−15)+15=2d−15`; d15 exponents3,2,0 | All three twist conventions agree. |
| 12.4 Splitting | `(1,15)` | V rank`2·186263=372526`, W rank2, total372528; `(13,2)+(0,15)=(13,17)≠(15,15)` | Cross pairing zero by Hodge type; the W-pairing is between `(15,0)` and `(0,15)`. |
| 12.5–12.8 Degree-fifteen induction | `(8,0),(8,1)`; first higher-genus loop | `2g=16>15`, although `2g−2+n=14,15`; lowered genus-one vertex has three flags | Corrected small-marking bound and stable loop insertion. |
| 12.9 Classification headline | weights13,14,15; `(1,15)` | `2+11=13`, `2·7=14`, `4+11=15`; genus-one exceptional S₁₆ has types `(15,0),(0,15)` | g≥2 in the degree15 classification is essential. |
| 12.10 Genus-three headline/Check | n=11, two genus-one cusp vertices | d=17; divisor genus-one factors≤12 flags; combined selected flags≤15 (or14), versus22 required | The theorem's range agrees; R08 corrects the impossible occurrence Check. |
| Adams-series contract | binomial versus power Adams on `ℚ[[t]]` | modulo t² partial sums `t,3t/2,11t/6`; power action gives `Exp(t)=1+t+t²+…` | R07; continuity does not imply summability. |

The tables not supported by numeric rows in the earlier review were also checked at the source. For reproducibility, the marked q=2 polynomial tuples `(S₀,S₁,S₂,S₃)` are:

| Table / markings | n=1 or cycle(2) | n=2 or cycle(2,1) | n=3 or cycle(3) |
| --- | --- | --- | --- |
| 8.9 cone | `(98304,−86016,18432,0)` | `(245760,−245760,64512,−1536)` | `(491520,−552960,172032,−8448)` |
| 8.10 nonsplit | `(163835,−122855,10240,7580)` | `(327660,−286620,46080,13680)` | `(491460,−491220,115200,14160)` |
| 8.11 split, displayed parts | `(294903,−368559,164352,−31232)` | `(1179576,−1621368,833920,−196800)` | `(4128264,−6186304,3638912,−1055744)` |
| 8.14 cone twists | `(114688,−73728,5120,1536)` | `(344064,−258048,30720,4608)` | `(270336,−184320,24576,−1536)` |
| 8.14 nonsplit twists, displayed parts | `(327660,−204700,−15360,31552)` | `(819100,−613900,12800,90112)` | `(491520,−307008,0,14208)` |
| 8.14 split twists, displayed parts | `(262144,−294912,129920,−29632)` | `(1179648,−1547840,812928,−221312)` | `(589824,−773824,404096,−103808)` |

These tuples were obtained by arithmetic evaluation, after comparison with bfp lines 773–806, 875–898, 934–962 and 1461–1548. Equality of finite evaluations alone would not prove the polynomial identities. All displayed polynomial coefficients were compared; low-degree terms omitted by the source's asymptotic convention were not invented.

### Pins, Lean acceptance and headline coverage

Ran `lake env lean` on `packages/MotivicStructuresInModuliOfCurves/Suggested.lean` from the pinned content checkout, using the absolute input required by the brief. Exit status 0; stdout/stderr empty; no warnings. No Tau Ceti import is present, so no targeted object build was needed. No review process remains running.

The file has exactly one import (`import Mathlib`), one module docstring and the required namespace. It has **zero definitions, zero theorem declarations and zero sorries**. Consequently the exhaustive one-tactic padding probe has zero subjects, and the exhaustive `#check @name`/lost-binder audit has zero subjects. The worker's single purported declaration `and : Bool → Bool → Bool` is a parser lead from English prose, not a declaration in this file. There is no surrogate theorem about free variables, no `True` placeholder, and no promised own Lean identifier missing from this empty namespace; backticked mathematics is notation, and the genuine imported names were resolved.

| Summary headline | README | Module docstring coverage / unavailable carrier |
| --- | --- | --- |
| Universal odd vanishing through degree nine | 9.8 | Listed; needs actual compact pointed-curve stacks and their cohomology. |
| Explicit genus-four counts and pure Tate cohomology, n≤3 | 9.5, 9.7 | Listed; needs stack point groupoids and geometric cohomology, not a bare polynomial. |
| Finite generation and finitely many simple realizations per degree | 4.9, 4.11 | Listed; needs the STE of actual curve-moduli cohomology with clutching/forgetting operations. |
| Tautological H⁴, stable-range H⁶, even homology through14 | 10.2–10.4 | Listed; needs stack Chow groups, cycle maps and tautological subspaces. |
| Cusp generation of homology13 and15 | 12.1–12.2 | Listed; needs the same geometric cohomology and STE carriers. |
| Genus-seven CKgP and tautological Chow ring, n≤3 | 7.7 | Listed; needs stack Chow groups and exterior products against arbitrary test stacks. |
| Realization classification in degrees13,14,15 | 12.9 | Listed; needs geometric stack cohomology with Hodge/Galois structures. Abstract Hodge carriers alone do not supply it. |
| Genus-three cohomology through eleven markings | 12.10 | Listed; needs those actual moduli and cohomology carriers. |

No statable headline was found missing. Simple numerical formulas from the README would be Checks or stand-ins, not replacements for these eight headline families.

The following declarations were opened at the pins, rather than inferred from name search. Paths below are relative to their library repositories.

| Pinned file and line | Declaration / what it actually provides |
| --- | --- |
| `Mathlib/NumberTheory/ModularForms/Basic.lean:78`, `:86` | `ModularForm`, `CuspForm`: slash-invariant holomorphic functions, respectively bounded and zero at cusps. They do not construct moduli realizations. |
| `Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean:167`, `:172`, `:262` | `CuspForm.rank_eq_zero_of_weight_lt_twelve`, `CuspForm.rank_eq_one_of_weight_eq_twelve`, `ModularForm.dimension_level_one`. The latter has the even-weight hypothesis and the residue-2 exception modulo12. |
| `Mathlib/Algebra/IsPrimePow.lean:28` | `IsPrimePow`; the point-count condition quantifies over prime powers, not all naturals and not primes alone. |
| `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean:120`, `:239` | `quadraticChar`, `quadraticChar_sum_zero`; the nontrivial quadratic-character calculation requires characteristic different from2. |
| `Mathlib/Algebra/Polynomial/Basic.lean:69` | `Polynomial`, finite-support coefficients over a semiring; no geometric counting function supplied. |
| `Mathlib/GroupTheory/Perm/Cycle/Type.lean:50`; `Mathlib/Combinatorics/Enumerative/Partition/Basic.lean:52` | `Equiv.Perm.cycleType`, `Nat.Partition`, the existing permutation and partition carriers. |
| `Mathlib/RepresentationTheory/Basic.lean:48`; `Mathlib/RepresentationTheory/FDRep.lean:63` | `Representation`; `FDRep R G = Action (FGModuleCat R) G`. General ring/monoid carrier; finite dimension follows over a field. Neither is a local-system realization on a moduli stack. |
| `TauCeti/RepresentationTheory/Spin/HalfSpin/Basic.lean:119`, `:260`, `:324` | `spinPlus`, `spinPlusAction`, `spinPlusSubrep`. The action/subrepresentation retain `P.line=⊥`; no SO descent is included. |
| `TauCeti/RepresentationTheory/Spin/Dimension.lean:73` | `finrank_spinPlus`, with nonzero polarization summand; rank-five specialization gives16. Rank zero is not substituted into a natural-subtraction formula here. |
| `TauCeti/RepresentationTheory/RepresentationRing/Basic.lean:106`, `:127` | `repRing = SplitK0 (FDRep k G)` and `repRingCharacter : repRing k G →+* (G → k)`. Exact and split K₀ are identified only in the finite-group characteristic-zero application. |
| `TauCeti/NumberTheory/ModularForms/LevelOne/PeriodPolynomial/Finrank.lean:213` | `finrank_periodPolynomials_eq_finrank_modularForm_add_finrank_cuspForm`; an analytic dimension comparison, not Eichler–Shimura on the moduli stack. |
| `TauCeti/Geometry/Hodge/Structure.lean:62`; `TauCeti/Geometry/Hodge/Tate/Basic.lean:93`; `TauCeti/Geometry/Hodge/Tate/Twist.lean:63` | `HodgeStructureOn`, `tate` and Tate twisting provide abstract realization carriers, with the usual negative weight shift. They do not construct Betti cohomology of algebraic stacks. |
| `TauCeti/AlgebraicGeometry/Curves/PointedPrestable/Basic.lean:68` | `PointedPrestableFamily` has a prestable morphism and ordered disjoint sections in its smooth locus. It does not include stability, a fixed genus, or the algebraic moduli stack and its cohomology. This nearby native carrier does not make the headline statements statable. |

### Suppliers, ownership and overlap

Read two main-roadmap forms, SchemeAndStackFoundations and RepresentationTheory/SchurWeyl, as well as the applicable open heads. Resolved every distinct supplier contract and matched its repeated Needs citations. R06 records all unresolved section-name patterns found; existence of a similarly named roadmap was not treated as resolution of a section.

| Supplier text read | Resolved input and current evidence |
| --- | --- |
| Main `TauCetiRoadmap/SchemeAndStackFoundations/README.md` | §§1.18–1.23 (beginning line2849), §3.2 (4845), §4.15 (6037), §4.17 (6389), §§5.1–5.8 (6902–7440): stack carriers, stable pointed curves, normal crossings and scheme Chow operations. Stack Chow operations are separately contracted. |
| PR #1841, `TauCetiRoadmap/StableReductionPartII/README.md` | Current sections and exact lines in R06. §7.11 expressly exports geometry and leaves tautological/cohomological operations to this roadmap. No double ownership of the STE or cusp graph theory. |
| PR #1208, `TauCetiRoadmap/WeilConjectures/README.md` | §§1.7–1.15 (447–661), §§5.22–5.27 (1191–1299), §6.8 (1598). Mass, compact supports, twists, configuration coefficients, polynomial recognition, equivariance and DM purity are present. §5.25 distinguishes actual all-Spec-ℤ Tate decompositions from open-base semisimplification. |
| PR #929, `TauCetiRoadmap/DeligneWeightsAndPurity/README.md` | §8.24 (2863 onward) contains the oriented spectral sequence and rational DM descent/coarse comparison/purity; §9.6 (3044) is hard Lefschetz for smooth projective schemes. The DM hard-Lefschetz request is a real extension, not duplicated here. |
| `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md` | §§4.5 and5.1 supply projective direct images and operations on varieties/supported categories. R06 fixes their old labels. The DM extension remains a declared contract. |
| PR #1313, `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md` | §0.6 (181), §§2.4,2.6,2.7 (387,417,435): diagonal-support methods and scheme realizations/cycle maps. The relative stack adapter is requested through the cycle-class gap. |
| PR #1007, `TauCetiRoadmap/AutomorphicGaloisRepresentations/README.md` | §1.2 (1711 onward): parabolic realizations with rank twice cusp-space dimension. Level-one weights12,16 are in its range. |
| PR #853, `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md` | §1.3 (609 onward), §5.1 (8413 onward): locally free quotient Grassmannians and rigidification by flat finitely presented normal inertia subgroups. The μ₄ use is in characteristic zero. |
| PR #856, `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md` | §§5.1,5.3 (3461,3513): density of Frobenius and recognition by characteristic polynomials for continuous representations. Arithmetic/geometric Frobenius inversion does not change the density argument; the count convention remains geometric. |
| Main `TauCetiRoadmap/RepresentationTheory/SchurWeyl/README.md` | Layer7, including §§7.5–7.6 (824,875), supplies Frobenius characteristic; Layer9, §§9.4 and9.6 (1304,1381), supplies harmonic tensors and matching/graded signs. The completion and graph transform are not mistaken for existing finite-degree algebra. R03 specifies which action is consumed. |
| PR #1229, `TauCetiRoadmap/SchemeKTheoryOperations/README.md` | §§6.2.1–6.2.2 (2136,2150): general λ-rings and Adams operations, including binomial identity Adams. R07 prevents an invalid extra convergence inference. |
| PR #1427, `TauCetiRoadmap/HabiroNahmSeries/README.md` | §5.1 (1081): augmentation mvLog/mvExp and specific plethystic coefficient expansion with power substitutions. The general filtered statement is a gap, corrected by R07. |
| `packages/MappingClassGroupsAndCanonicalRepresentations/README.md:864` | §2.3 has stable pointed-stack uniformization, properly discontinuous pure mapping-class action and finite stabilizers. R06 fixes `C.0`. No unstable `(1,0)` quotient is consumed. |

The board-package index was read before searching the board. Object searches used the supplied roadmap tools over main and open heads, and `rg` over the pinned libraries and board: harmonic tensors, half-spin, representation rings, stable/prestable families, Harer/Madsen–Weiss input, Casnati–Ekedahl geometry, the graph transform, Chow–Künneth generation and semi-tautological extensions. Existing native representations and Hodge structures are imported, not reconstructed in Lean. No second owner of the package's headline curve-moduli constructions was found.

The supplied overlap report has no conflicting head, dropped-id entry or revision-only-id entry for this package. The five closest heads were inspected, rather than taking that absence as an ownership proof:

- WeilConjectures #1208 owns the generic trace/count comparison and configuration machinery consumed here.
- StableReductionPartII #1841 owns the geometric maps; its §7.11 expressly assigns their Chow/cohomological applications to the consumer. Its numbering drift is nevertheless R06.
- CountingBundlesAndHallAlgebrasOfCurves #1547, `TauCetiRoadmap/CountingBundlesAndHallAlgebrasOfCurves/README.md:6`, owns nilpotent bundles, Hall convolution and Higgs counts, not the cohomology of moduli of curves. It also consumes complete Adams series; this package does not claim that general supplier construction.
- GromovWittenTheory #1998, `TauCetiRoadmap/GromovWittenTheory/README.md:289`, concerns stable-map descendants. Its Layer6 at line342 requires a separate CKgP input rather than proving this package's genus-seven result. Its Layer2 also discusses curve-stack geometry, which this package imports from the earlier foundational owners rather than owning again. The distinct symplectic GromovWittenTheory head was not substituted for this head.
- CanonicalModelsAndGonality #1726, `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:21`, uses function-field carriers and general canonical models/gonality. This package's genus-seven stratified Chow statements add family and cycle-theoretic content, and its existing scheme-curve inputs remain with SchemeAndStackFoundations. No upward citation to #1726 is introduced.

The search results are not a review of all other packages. They establish the ownership boundary relevant here; no claim is made about unseen heads beyond the supplied tool index.

### Declared gaps and order

All eight slugs occur in both the README's supplier subsections and the plan's top-level gaps list, with named suppliers. None has supplier `none`. The absence of their requested extensions was not counted as an unowned prerequisite.

| Slug | Audit result |
| --- | --- |
| stack-rational-chow | Scheme Chow operations are imported; the missing extension is rational stack Chow with the specified operations and universal test-stack products. No duplicate native stack theory found. |
| pointed-coarse-projectivity | Requests all stable pairs and a tautological ample pullback, beyond properness/coarse-space existence. Destination labels need R06. |
| open-dm-stack-duality | Requests the smooth nonproper pairing with compact supports. The current consumed smooth proper pairing alone does not supply it. Its complementary degrees are correct; R02 concerns contrary prose elsewhere. |
| dm-stack-hard-lefschetz | Precise smooth proper DM/projective-coarse hypotheses; the cited scheme theorem is narrower. |
| dm-stack-mixed-hodge | Coherent extension of geometric Hodge operations to DM stacks, including weights and normal-crossings orientations. Destination labels need R06; the additional operations are not falsely attributed to the variety-only sections. |
| dm-stack-cycle-class | The requested smooth-stack cycle map and operation/comparison compatibility extend the supplied scheme maps. |
| completed-symmetric-functions | Specifies power-sum and h Adams actions, filtration and graph-operator completion, beyond finite-degree Frobenius characteristic. |
| complete-adams-series | Named owner and matching slug, but insufficient convergence hypotheses: R07. |

Ran the prescribed dependency check with the package name, merge order, `--movable` and content checkout. Complete diagnostic output:

```text
depcheck: 236 roadmaps, 2146 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This checks the supplier direction; it does not validate the existence or content of cited sections. R06 therefore remains actionable despite the clean dependency graph. No forbidden supplier from the brief is cited. The source manifest has 25 distinct entries: 23 certified and two settled uncertified; each cited work is represented. No source needed fetching, and no original source entry was rewritten.

## Not verifiable

- `harer-vcd`, the main theorem, and `mukai`, the genus-seven linear-section theorem, remain the two settled uncertified references. Their original paywalled texts were not read, fetched again or listed as newly missing. The accessible CLP discussion of the Mukai application was checked, but is not presented as direct certification of Mukai's original text.
- No full independent reconstruction of the 891-by-restriction matrix or the complete Getzler–Kapranov expansion producing multiplicities 264, 836 and 186263 was performed. The accessible figures, source statements, pivot-count argument, rank bounds and consistency computations were checked. Source certification and those computations are distinguished from a new proof of every entry.
- The missing all-degree original-family boundary containment in CLP Lemma 3.2 was not proved. The report certifies the low-degree repaired argument and identifies the uncovered two-odd-factor case; it does not infer that the source theorem is false from a failure of that argument.
- Published/preprint numbering was used only as identified in the manifest. In particular the additional genus-seven source issues below are in the read arXiv v2 text, whose printed pages are numbered 18 and23; no claim is made that the journal edition retains them.

## Source issues

The following are errors or gaps checked in the course of this review, including previously reported ones whose computed witnesses were rechecked. A source issue already corrected in the package is not an additional package finding.

- **Error** in clp at Lemma 2.1, hypothesis (2.2), printed p.4: the source says only smaller triples of degree at most k−2 need surjectivity; it should also require same-degree smaller triples used by the induction; affects a stated result.
- **Gap** in clp at Lemma 3.2, printed p.10: the source says the three generating families contain all boundary contributions; it should justify lower-degree vertex decorations, including two odd genus-one factors from degree24; affects the proof.
- **Error** in clp at §5.3, equations (5.10)–(5.11), printed p.20: the source says the half-spin representation is an SO₁₀ representation and uses its quotient; it should use Spin₁₀ and distinguish the effective PSO₁₀ quotient and central gerbes; affects the proof.
- **Misprint** in clp at §6.2, proof of Theorem 1.5(3), printed p.23: the source says even k≥14; it should say even k≤14; affects nothing.
- **Misprint** in clp at proof of Lemma 7.3, printed p.27: the source says the relation-symbol representation is induced from S₁₀; it should be induced from S₁₀×S₂, with index66 rather than132; affects nothing.
- **Gap** in clp at proof of Lemma 8.2, printed p.28: the source says the remaining pairs after 2g−2+n>15 have CKgP from its table; it should additionally use 2g>15 for n≤1, covering (8,0) and (8,1); affects the proof.
- **Misprint** in bfp at Corollary 3.2, printed p.1330: the source says its conclusion holds for arbitrary genus g; it should say genus four, with all genera reached by the later induction; affects a stated result.
- **Misprint** in bfp at proof of Proposition 3.1, printed p.1330: the source says the trace error has exponent d/2; it should have exponent s/2 from the hypothesis; affects nothing.
- **Misprint** in bfp at §10.1, printed p.1355: the source says the coefficient −11 multiplies q⁴ in the three-marking open count; it should multiply q³, as in Theorem 1.5; affects nothing.
- **Misprint** in bfp at equation (3), printed p.1331: the source says normalized closed-stratum invariants without an orientation character form the E₁ terms; it should include the determinant character of the edge permutations; affects the proof.
- **Misprint** in bfp at §9.1, printed p.1351: the source says ordinary-cohomology Frobenius traces count points of a possibly nonproper variety; it should use compactly supported cohomology; affects a stated result.
- **Gap** in bfp at Definition 9.1, printed p.1351: the source says an arbitrary twisted-count class function belongs to the representation ring; it should establish character-lattice membership under the later polynomial-count hypotheses; affects a stated result.
- **Misprint** in gorsky at Theorem 3.8, arXiv v3 printed p.6: the source says the quotient genus is half of one minus the exponent sum; it should be one minus half the sum, including the rth exponent; affects a stated result.
- **Misprint** in gorsky at Definition 3.5 and Lemma 3.6, arXiv v3 printed p.5: the source says the local congruence modulus is k; it should be r, the automorphism order; affects a stated result.
- **Misprint** in kannan at Remark 3.8, arXiv v2 printed pp.11–12: the source says the corrected quotient-genus sum stops at r−1; it should stop at r, giving genus4 for the identity with k₁=−6; affects nothing.
- **Misprint** in canning-larson-genus-seven at proof of Lemma 4.2, arXiv v2 printed p.18: the source says a′₂=e₁r₁+2e₂ℓ and compares e₁ with 2e₁; it should use a′₂=(e₁+e₂)r₁+2e₂ℓ and determinant e₂−e₁≠0; affects the proof.
- **Misprint** in canning-larson-genus-seven at proof of Lemma 4.8, arXiv v2 printed p.23: the source says Lemma4.3(1) handles the (2,4,4) splitting stratum; it should cite Lemma4.2, since the last two parts coincide; affects nothing.
