# Review of MotivesAndAlgebraicCyclesPartII (package, round 2)

**Verdict:** needs changes

Eleven findings: three P1, six P2 and two P3. The six previous findings are repaired. The remaining findings concern mathematical assertions, proof inputs, generality and newly available pinned results; none requires replacing this Part II roadmap. The package's README, Lean file, metadata and source manifest were not edited.

### Previous findings, checked individually

| Previous finding | Status | Repaired passage and verification |
|---|---|---|
| F01, invented supplier declarations | Repaired | README 70 now says “§3.2 (functorial connective K-theory of unital rings)”; 90 says “§S2.4 (the exceptional direct image `Rf_!` with its base change and projection formula)”. The other listed invented identifiers are absent. The sections resolve at their heads. R08 concerns a different surviving identifier. |
| F02, nonexistent Tau Ceti Adams operation | Repaired | README 70: “Adams operations `ψ^k` on `K_m(A)` for every commutative ring `A`, through the universal lifting property”. This is SchemeKTheoryOperations §6.4, not a pinned Tau Ceti declaration. |
| F03, nonexistent KII section labels | Repaired | README 680: “GeneralAlgebraicKTheoryPartII §1.2 and RefinedTraceMethods §4.10”. Their respective group-completion and multiplicative K-theory statements are present. The contracts, scope and Layer 6 dependencies agree. |
| F04, triangular vanishing direction | Repaired | README 686: “vanishes for `i > j`”. For difference 1, the source has homological connectivity at least 1 and the target is in degree 0, giving Hom = 0. The opposite direction over the projective line gives Pic(ℙ¹)⊗ℚ = ℚ. |
| F05, division-algebra containment argument | Repaired | README 926: “intersection matrix has rows `(0, 1, 1)`, `(1, 0, 1)`, `(1, 1, 0)` and determinant `2`”. Negative K-vanishing and duality force the hypothetical Tate multiplicities to be n₀,₀ = n₁,₂ = 1 only, so End has dimension 2, whereas the intersection matrix proves dimension at least 3. This works in characteristics 2 and 3: its determinant is evaluated over ℚ, not the ground field. Vakil and the new supplier citation were checked. |
| F06, discrete fields excluded from quasi-pro-étale tests | Repaired | README 179: “an algebraically closed Banach field `C`, discrete or not”. The identity of a trivially normed algebraically closed field gives the singleton profinite set. For analytic A, a map to a trivially normed field would send generators of the unit ideal to zero. |

No previous repair was marked not actionable. No settled finding is re-raised.

## R01 (P2) — The introduction explicitly makes the source the plan

**Location:** `packages/MotivesAndAlgebraicCyclesPartII/README.md:3`: “following Scholze's *Berkovich motives*”.

**Claim:** The roadmap describes its construction as following a source, contrary to the binding organisation rule.

**Witness:** The quoted sentence is explicit. README 98 already provides a mathematical dependency explanation and identifies the independent Layer 7 and Layer 8 branches.

**Repair:** Delete the source-following clause. Retain the mathematical construction and end theorems in the summary, the dependency explanation in “How to read the build”, and exact source locators at the statements. No reordering is demanded merely because necessary dependencies share the paper's order. Tested against the repaired summary: it still specifies inputs, objects and endpoints without prescribing the source's exposition.

## R02 (P1) — Norm less than one is not equivalent to pointwise spectral smallness

**Location:** `packages/MotivesAndAlgebraicCyclesPartII/README.md:573`: “on the norm of `A` (equivalently, `|p| < 1` at every point of `M(A)`)”.

**Claim:** The equivalence is asserted for an arbitrary Banach ring, not only a uniform one.

**Witness:** On ℤ₂ set ∥x∥ = 2^(−⌊v₂(x)/2⌋), ∥0∥ = 0. Then ∥2∥ = 1, ∥4∥ = 1/2, but every spectral point satisfies |2|² ≤ 1/2.

**Repair:** Keep the theorem with its literal norm hypothesis, as in Scholze line 1656. Replace the parenthesis by: norm-smallness implies pointwise smallness; the latter is equivalent to spectral radius less than one, and agrees with norm-smallness on uniform rings. If the pointwise extension is retained, derive it through uniformization (§0.3). Add the witness as a negative control. Its norm is submultiplicative because ⌊(a+b)/2⌋ ≥ ⌊a/2⌋+⌊b/2⌋, is ultrametric, and induces the complete 2-adic topology; its spectral radius at 2 is 2^(−1/2). Thus the repaired implication, unlike the original equivalence, passes this example.

## R03 (P1) — The motivic rank Check has the wrong coefficient ring

**Location:** `packages/MotivesAndAlgebraicCyclesPartII/README.md:674`: “the rank gives a map `π₀ Kmot(C) → ℤ`, split by the unit”.

**Claim:** Such a rank retraction exists at every geometric point.

**Witness:** For C = ℂ₂, §7.6 gives π₀Kmot(C) = ℤ[1/2]. A unit-preserving additive map to ℤ would give 2·rank(1/2) = 1, impossible in ℤ.

**Repair:** State the nonarchimedean rank calculation as π₀Kmot(C) = ℤ[1/p], where p is the residue-characteristic exponent, and describe the unit map as ℤ → ℤ[1/p]. Keep π₀ = ℤ at the complex point and when p = 1. Alternatively state the integral rank retraction for E_K(C), as §7.7 does, rather than for its p-inversion. Test p = 2, 3 and exponent 1: the answers are respectively ℤ[1/2], ℤ[1/3] and ℤ. This also reconciles §§6.1, 7.6 and 7.7.

## R04 (P2) — Rational sheafification is narrowed to special line domains

**Location:** `packages/MotivesAndAlgebraicCyclesPartII/README.md:557` and 565: “rationally its values on open subsets of `A¹_A` with disc complements are unchanged”.

**Claim:** The rational assertions of Scholze Theorems 6.3 and 6.1 are planned only on these special open domains.

**Witness:** Scholze lines 1491–1492 cover every affine arc-subset Marc(B) of A¹_A. Lines 1512–1514 separately assert sheaf descent on all open subsets and unchanged values on affine subsets.

**Repair:** Restore both source conclusions in §4.6: rational sheaf descent on the site of all open subsets of A¹_A, and invariance under derived arc-sheafification on every affine subset. Restore the group-completion evaluation of §4.7 on every affine subset after rationalization. Keep disc-complement domains as the proof input of §4.4. Add the closed unit disc Marc(C⟨T⟩₁) as a Check: it is an affine subset covered by the source theorem but is not the open domain presently quantified over; the free motive on a point evaluates rationally to ℚ on it before and after the comparison. This restores generality rather than changing coefficients or restricting fields.

## R05 (P2) — The initial six-functor construction uses a stronger projection formula than supplied

**Location:** `packages/MotivesAndAlgebraicCyclesPartII/README.md:850` and 852: “`P` the affine maps of finite cohomological dimension, verifying base change and projection formulas from §§1.6, 8.4”.

**Claim:** §8.4 proves the projection formula for this entire class P before geometric rigidity is available.

**Witness:** §8.4 additionally requires an embedding into a finite-dimensional closed ball, arc-locally on the target. Marc(Cont(βℕ,ℂ)) over Marc(ℂ) has dimension 0, but its nonmetrizable spectrum cannot embed in a finite-dimensional complex ball.

**Repair:** Use initially the class generated by the bounded-embedding maps actually handled in §8.4, with the required base-change, composition and decomposition properties verified. Retain the enlargement to all proper maps of locally finite cohomological dimension at §9.4, after §9.1. Alternatively insert and prove a separate approximation theorem upgrading §8.4 before invoking it. Do not use §9.4 to prove §8.5: §9.1 needs §8.5. The βℕ example is then admitted at the later stage and is no longer falsely covered by the initial input. AnalyticStacks §0.5 explicitly requires the projection formula for every member of the chosen P.

## R06 (P2) — The transfer-free 2-primary rigidity route is not supported by the cited proof

**Location:** `packages/MotivesAndAlgebraicCyclesPartII/README.md:1015`: “the rigidity argument of Cisinski–Déglise §4.5 run without transfers”.

**Claim:** That proof supplies the missing comparison in odd positive characteristic with ℤ/2ᵃ coefficients.

**Witness:** For k = 𝔽̄₃ and R = ℤ/2, neither hypothesis of CD Corollary 5.5.7 applies (lines 2579–2584). Theorem 4.5.2's proof explicitly uses the transfer category and Propositions 3.1.7, 4.4.3, 4.5.1 (lines 1902–1905).

**Repair:** Keep the full integral objective, but replace the unsupported proof transplant by an explicit independently owned transfer-free rigidity target: for algebraically closed k of odd characteristic and a ≥ 1, the natural functor D(k_et,ℤ/2ᵃ) → DM_et(k,ℤ/2ᵃ) is an equivalence. Give an actual primary proof locator or a precise supplier contract, including the transfer-free generation/base-change input used to prove essential surjectivity. Its proof may not use §§10.4–10.6, which already consume §10.2. CD Remark 5.5.8 identifies the separatedness/(SS)₂ issue; absence of orderings does not establish that input. Test k = 𝔽̄₃, a = 1 explicitly: the repaired plan must account for this case with an owned theorem instead of pretending it is inside CD's cited hypotheses. Do not repair by discarding 2-primary coefficients.

## R07 (P3) — The direct-sum Check also holds for the alleged wrong product

**Location:** `packages/MotivesAndAlgebraicCyclesPartII/README.md:646`: “`⊕_{n≥0} ℚ[2n]`, which is a sum and not a product”.

**Claim:** The complex-point example distinguishes a direct sum from the product of these shifted complexes.

**Witness:** In D(ℚ), both ⊕ₙℚ[2n] and ∏ₙℚ[2n] have exactly one ℚ in degree −2m for each m ≥ 0 and zero in other degrees. Their canonical comparison is an equivalence.

**Repair:** Keep the direct-sum theorem and the cell calculation, but remove this claimed distinction. Replace the Check by the finite-stage inclusion: ℙ¹ accounts for degrees 0 and −2 and misses the nonzero degree −4 class of BG_m. Explicitly allow that this particular increasing-connectivity family has coincident sum and product at the complex point. The computed degree −4 values are 0 and ℚ, so the replacement really distinguishes the finite-stage truncation.

## R08 (P3) — A surviving cohomological-dimension name no longer resolves on main

**Location:** `packages/MotivesAndAlgebraicCyclesPartII/README.md:94` and 333: `scd_p_le_cd_p_add_one` attributed to ProfiniteCohomology Layer 11.

**Claim:** The cited roadmap supplies that declaration name.

**Witness:** ProfiniteCohomology on main, README 3132, uses `TauCeti.strictCohomologicalDimensionAt_le_cohomologicalDimensionAt_add_one`. The cited old name is absent from its README and Suggested.lean; the pinned theorem is in `TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/Strict.lean:181`.

**Repair:** Cite the pinned declaration and its file in the Tau Ceti contract, and use it in §2.1's Needs. Retain the compact/profinite-group hypothesis. The neighbouring `cd_p_le_of_isClosed` is explicitly mapped to its new declaration in ProfiniteCohomology README 4125 and is not an unresolved citation. Testing the intended bound gives cd ≤ 1 ⇒ scd ≤ 2, hence the disc bound 1+2 = 3; no change to that mathematics is needed.

## R09 (P1) — The discrete-field left-adjoint route has a functor with the wrong domain

**Location:** `packages/MotivesAndAlgebraicCyclesPartII/README.md:1029`: “its dual represents `M ↦ Hom(1, f_* M)`”.

**Claim:** The object (f_*ℤ)∨ in Dmot(k) represents this functor and therefore is f_♯ℤ.

**Witness:** Here f_* has domain Dmot(K), whereas a represented functor for an object of Dmot(k) takes M in Dmot(k). The needed functor is Hom(1_K,f^*M), not Hom(1_k,f_*M).

**Repair:** Replace the displayed functor by M ↦ Hom(1_K,f^*M), with M ∈ Dmot(k), and write the chain Hom((f_*1_K)∨,M) ≃ Hom(1_k,M⊗f_*1_K) ≃ Hom(1_k,f_*f^*M) ≃ Hom(1_K,f^*M). Then the left-adjoint conclusion follows with the stated domains. In the two-point model f^*M=(M,M), f_*(M₁,M₂)=M₁⊕M₂, both corrected sides are M⊕M and f_♯1=ℤ². The original expression cannot even be applied to the required M. This is a route correction, not a defect in Theorem 11.1's generator statement.

## R10 (P2) — The one-unit section reconstructs a pinned ideal and its unit estimate

**Location:** `packages/MotivesAndAlgebraicCyclesPartII/README.md:405` and 409, defining A_<1 as an ideal and proving invertibility of 1+a; the Tau Ceti contract at 44 supplies none of this.

**Claim:** This algebraic carrier and its geometric-series unit input are new work here.

**Witness:** `TauCeti/Analysis/Normed/Ring/UnitBall.lean:94` defines `TauCeti.unitBallIdeal` by ∥x∥<1 in the closed unit ball. Lines 171 and 185 prove the inverse estimate and invertibility within that ball.

**Repair:** Import `TauCeti.unitBallIdeal`, `TauCeti.mem_unitBallIdeal`, `TauCeti.norm_inverse_one_sub_sub_one` and `TauCeti.isUnit_unitClosedBall_of_norm_sub_one_lt` with their explicit hypotheses. Retain the arc-sheaf U¹ and its functoriality as this roadmap's construction, interpreting A_<1 through the existing ideal. Account separately for the zero ring, since the native theorem assumes NormOneClass. At ℚ₂ the native ideal is 2ℤ₂ and −1 belongs to 1+2ℤ₂; at ℚ₃, −1 does not belong to 1+3ℤ₃. Thus the native object gives exactly the intended discriminating examples without a second construction.

## R11 (P2) — The affinoid supplier gap requests a theorem already proved at the pin

**Location:** `packages/MotivesAndAlgebraicCyclesPartII/README.md:50` and `packages/MotivesAndAlgebraicCyclesPartII/design/plan.json`, gap `affinoid-line-bundles`: “the one-variable Tate algebra `K⟨T⟩` over a complete nonarchimedean field is a principal ideal domain”.

**Claim:** This PID theorem is missing and must be supplied by TropicalAndBerkovichArithmetic.

**Witness:** `TauCeti/RingTheory/PowerSeries/Weierstrass/Ideal.lean:115` proves `TauCeti.PowerSeries.isPrincipalIdealRing_isRestricted_subring` for every positive radius, with NormedField, IsUltrametricDist and CompleteSpace; radius 1 is K⟨T⟩.

**Repair:** Remove the PID assertion from this gap's needs sentence in both intake locations. Cite the pinned theorem in the Tau Ceti contract, retaining only effective descent of finite projective modules along finite affinoid covers, with its precise hypotheses, as the gap. Use the radius-one restricted-series carrier or a named supplier identification with it. At c=1 the theorem has no discrete-valuation or nontrivial-valuation restriction; the zero ideal has generator 0 and the unit ideal generator 1. The residual descent request is still needed to turn the algebraic Picard vanishing into analytic line-bundle triviality. Do not delete that part of the gap.

## Verified sound

### Coverage and principles

Read all 80 numbered targets in the 13 layers, including their definitions, APIs, proof routes, Checks and dependencies; repeated the six repair tests and searched for their patterns elsewhere. The computed per-target working ledger is retained as review scratch evidence; the table below gives the sampled targets, all headline families and every mathematical finding witness. A successful small-instance test is not presented as a proof of its general theorem.

The scope is an extension of MotivesAndAlgebraicCycles rather than a replacement. The Banach arc-site is different from ArcTopologyAndDescent's scheme arc-site. No route-specific good-prime restriction, computational algorithm, copied source passage, sorry'd data, set_option, arbitrary-data Lean theorem or circular cross-roadmap supply was found. Prime inversion in the actual theorems is mathematical (residue characteristic), not a shortcut. The general 2-primary objective is retained; R06 concerns its proof input.

README shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, 13 Examples sections, 13 Dependencies sections, downstream interface and references are present. The definitions carry API and Check lists. The defective Check and native ownership issues are listed above. The source-following sentence is R01. No machine paths, job identifiers, pull-request numbers, hand-off instructions, HTML anchors or executable algorithms were found in the roadmap text. Source edition dates in References and Corrections identify versions, rather than recording process history. Mathematical expressions in backticks are notation, not undeclared Lean identifiers; no new Lean identifier is promised by this roadmap.

### Seeded source checks

All 15 sampled targets were read at their locators, including hypotheses and internal printed page numbers. The only explicitly uncertified work remains BLR, settled as such in the manifest. No other target is flagged unverified in the package.

| Target | Source passage actually read | Result |
|---|---|---|
|3.1 One-units|Scholze lines 500–522, §2.3 pp.12–13; lines 1365–1372, p.32|Uniformity and strict norm threshold agree; native duplication is R10.|
|4.2 Shrinking and compactifying curves|Scholze lines 1556–1572, p.37; vanDerPut lines 57–58, printed p.156, and 165–166, printed p.159|Shrinking before the finite-disc compactification is retained. Theorem 1.1 and Corollary 1.3 have the stated affinoid/normal hypotheses.|
|4.5 Curve homotopies|Scholze lines 1549–1572, pp.36–37|Smooth connected curve, two C-points, prime arbitrary, boundary trivializations and one-unit interpolation agree.|
|4.6 Transfer sheafification|Scholze lines 1506–1547, pp.35–36|Inverted primes, finitarity and transfer hypotheses agree; rational scope narrowed, R04.|
|4.7 Explicit free motives|Scholze lines 1485–1499, p.35|Animated group completion and residue-prime inversion agree; arbitrary affine evaluation is omitted, R04.|
|4.8 Torsion and residue characteristic|Scholze lines 1649–1668, p.39|The two theorem clauses agree; the added equivalence between two hypotheses is false, R02.|
|4.10 Integral t-structure|Scholze lines 1684–1701, p.40|All small arc-stacks; the rational-to-torsion image step is explicitly retained.|
|6.2 Flag invariants|Scholze lines 1894–1942, pp.45–46; connectivity at 1864, p.44|Normalizer action and induction agree; repaired vanishing direction checked independently.|
|7.7 Integral E∞ structure|Scholze lines 1992–2002, p.47 continuing discussion p.48|Integral cofibre, p-completion, overlap rank and E∞ gluing agree, including p=2.|
|8.5 Six operations|Scholze lines 2109–2117, pp.50–51, and 2181–2202, p.52|Open, étale and boundaryless smooth clauses agree; the initial proper class has the proof-input issue R05.|
|9.1 Compact generators|Scholze lines 2215–2247, p.53|Compact/dualizable equality, equal-characteristic splitting and j≥0 generator range agree.|
|9.4 Proper pushforward|Scholze lines 2248–2258, pp.53–54|0-truncation, properness and locally finite cohomological dimension retained.|
|10.3 Discrete-field generators|Scholze lines 2395–2424, pp.57–58|The theorem, including all integer twists, agrees. The README's written adjunction route needs R09.|
|11.2 Descendability|Scholze lines 2467–2473, p.59|Augmentation-module structure, not merely underlying fibre, is used.|
|12.3 Overconvergent comparison|Scholze lines 2641–2652, p.63|Prime-to-p coefficients, fully faithful image, specialization criterion and all three compatibilities agree.|

The changed elliptic-curve Check additionally uses Vakil lines 24235–24244 (20.2.A, pp.580–581), 24274–24276 (20.2.4.1, p.581), and 24285–24290 (20.2.B(a), pp.581–582). The surface is smooth projective and the divisors have no common components, so these hypotheses hold. CD lines 1896–1911, 2048–2057, 2521–2529 and 2579–2615 were reread for the comparison and the newly detected R06. The five manifest keys are unique and account for all five directly cited works; no source entry was altered and no additional text was requested.

### Computed adversarial table

| Statement | Instances | Values on the two sides | Result / change |
|---|---|---|---|
|Summary organisation|Layer 7 versus Layer 8 dependencies|7 uses 6; 8 uses 1–5; neither needs the other|Independent branches exist; remove explicit source-following claim, R01.|
|§0.6 repaired definition|Discrete closed field identity; analytic A to a discrete field|Identity has S={∗}; analytic map would give Σaᵢ·0=1|Repaired definition accepts identity and excludes impossible base maps.|
|§3.1 one-units|−1 in ℚ₂ and ℚ₃|∥−2∥₂=1/2<1; ∥−2∥₃=1|Threshold correct; import native ideal, R10.|
|§3.1 inverse law|u=1+a, ∥a∥<1|∥u∥=1; ∥u⁻¹−1∥=∥a∥<1|Pinned Neumann estimate supplies it.|
|§4.2 curve shrinking|Open disc; open annulus|One complementary closed disc; two complementary closed discs|Nonempty finite boundary models work.|
|Source correction, Proposition 5.19|T²+T/2+4 over ℂ₂, r₁=1/4,r₂=4|Coefficient norm2 < max(4,1)=4, but 2 ≮ min(4,1)=1; root norms1/8 and2, first outside annulus|Minimum is required; README correction agrees.|
|§4.5 prime multiples|x=x′; boundary ratio 1+q, ∥q∥=1/2|n=0 gives equal cycles; ∥tq∥≤1/2 so ∥1+tq∥=1|Homotopy stays off boundary for every prime, including 2.|
|§4.6 rational comparison|Constant ℚ, closed unit disc|Value ℚ before and after sheafification; source admits affine disc, current quantified open-domain class does not|Restore full affine scope, R04.|
|§4.7 free formula|U=∅ and U=point|Group completions 0 and ℤ, then 0 and ℤ[1/S]|No π₀-only substitute; restore general rational evaluation, R04.|
|§4.8 hypothesis equivalence|Rounded 2-adic norm on ℤ₂|∥2∥=1; ρ(2)=2^(−1/2)<1|Equivalence false, R02.|
|§4.8 torsion category|C geometric residue p; ℓ≠p; ℂ|p-torsion=0; unit with ℤ/ℓ coefficients has ℤ/ℓ; complex integral unit ℤ|No rationalization of all coefficients.|
|§4.9 / §8.3 tilting|ℂ_p and its tilt|p-torsion zero on both; prime-to-p Tate line μₙ on both; reduced units preserve residue and value components|Effective and stable twist conventions agree.|
|§4.10 truncation|At ℂ, M=ℤ⊕ℤ[−1]; image ℚ→ℚ/ℤ|H⁰=ℤ,H¹=ℤ; image=ℚ/ℤ on base and extension|Image control is necessary and supplied in route.|
|§5.3 cancellation|ℂ; empty base; prime-to-p torsion|Tensor by ℤ(1)=ℤ is identity; empty category 0→0; torsion Tate line invertible|Headline passes these tests.|
|§5.4 direct sum|Complex point, degrees 0,−2,−4|Both sum and product have ℚ,ℚ,ℚ; all odd degrees 0|Alleged negative control fails, R07.|
|§6.1 motivic rank|ℂ₂, ℂ₃; complex point|π₀=ℤ[1/2],ℤ[1/3],ℤ respectively; 2m=1 or 3m=1 has no integer solution|Integral rank retraction false, R03.|
|§6.2 flag invariants|n=1, n=2, nonabelian Σ₃|Traces: (1); (2,0); (6,0,0) on identity/transposition/3-cycle classes; averaged dimension always 1|Normalizer action, rather than holomorphic flag automorphisms, used.|
|§6.2 repaired triangular direction|(i,j)=(1,0),(0,1) over ℙ¹|Hom(ℚ(1)[2],ℚ)=0; Hom(ℚ,ℚ(1)[2])=ℚ|Repaired direction correct; opposite not forced to vanish.|
|§6.3 Adams splitting|Eigenvalues 1,2,4|Denominators 3,−2,6 nonzero; three projectors evaluate to (1,0,0),(0,1,0),(0,0,1)|Splitting and normalization agree.|
|§7.1 Tor-unitality|ℚ_p versus algebraically closed valued field|pℤ_p/(pℤ_p)²=𝔽_p; divisible valuation ideal I satisfies I²=I|Root hypothesis distinguishes the nonexample.|
|§7.5 cofibre|A=C, algebraically closed nonarchimedean|π₀E_K(C)=ℤ; π₀fib(K(I)→K(C))=C×/(1+I)|Cofibre, not fibre.|
|§7.6 strict-base formula|Residue exponent 2,3,1|π₀E_K[1/p]=ℤ[1/2],ℤ[1/3],ℤ|Headline retains all residue characteristics.|
|§7.7 integral fracture|p=2, p=3|ℤ[1/p]×_{ℚ_p}ℤ_p=ℤ; p-complete cofibre=Hℤ_p|Uninverted E_K and inverted Kmot distinguished.|
|§8.2 projective duality|ℙ¹ over ℂ|f_*ℤ=ℤ⊕ℤ[−2]; tensor ℤ(1)[2] gives ℤ[2]⊕ℤ=f_♯ℤ|Twist and shift correct.|
|§8.5 initial P|Cont(βℕ,ℂ) over ℂ|d=0; finite-ball embedding impossible by nonmetrizability|General projection input absent at this stage, R05.|
|§9.1 geometric rigidity|Dmot(ℂ)=D(ℤ)|ℤ and zero compact dualizable; ⊕ₙℤ neither compact nor dualizable|Headline's distinction correct.|
|§9.4 proper pushforward|Two disjoint points; identity|f_*(M₁,M₂)=M₁⊕M₂; (M₁⊕M₂)⊗N=(M₁⊗N)⊕(M₂⊗N)|Base change and projection pass.|
|§9.5 repaired non-Tate example|E/𝔽̄_p, p=2 or3|Hypothetical End dimension 2; intersection matrix diagonal0/off-diagonal1, determinant2, rank3 over ℚ|Contradiction sound in both characteristics.|
|§9.6 relative rigidity|Two complex points; [0,1]|Unit (ℤ,ℤ) compact; RΓ([0,1],j_!ℤ)=0 while j_!ℤ≠0|Rigid does not mean compactly generated.|
|§10.2 transfer comparison|k=𝔽̄₃,R=ℤ/2|char-zero predicate false; “2 invertible in R” false; with-transfer rigidity available, transfer-free step not supplied|R06; general target retained.|
|§10.3 adjunction|Two-point model over a point|f^*M=(M,M), Hom(f_♯1,M)=M⊕M; f_* instead takes pairs as input|Replace wrong-domain functor, R09.|
|§§10.4–10.6 mapping/comparison|ℙ¹,j=1; Spec 𝔽̄_p|π₋₂=K₀^(1)(ℙ¹)_ℚ=ℚ, π₀=0; field rational weight0=ℚ, other weights0|Shift correction sound; integral comparison still needs R06.|
|§11.2 descendability|Rational augmented algebra|A=ℚ⊕ℚ(−1)[−1], odd generator square0; fibre action factors through ℚ|Two-step module filtration, not just two homotopy groups.|
|§11.3 Galois stack|Rational and ℓ≠p fibres|Coordinate ring ℚ[t±1] and 𝔽_ℓ; p-fibre zero|Fibre product, not product; finite Tor-amplitude argument valid.|
|§11.8 monodromy|A=ℚ⊕ℚ(1), two-step operator|N(first)=twisted second, N(second)=0, N²=0; scalar1 has all iterates1|Nontrivial nilpotent and excluded nonnilpotent model.|
|§12.3 overconvergence|Constant sheaf; extension by zero; n=1|id on ℤ/n; 0→ℤ/n not iso for n>1; 0→0 for n=1|Both directions distinguished.|
|gap affinoid-line-bundles|Radius1, zero/unit ideals|Pinned PID theorem gives generators0 and1; all ideals principal|Remove already supplied PID clause, R11.|

### Pinned-library and ownership audit

The four directly cited Mathlib carriers were opened at the pin:

- `Mathlib/CategoryTheory/Sites/Grothendieck.lean:72`: `CategoryTheory.GrothendieckTopology` contains covering sieves and the top, pullback and transitivity axioms; it does not construct an infinity-topos.
- `Mathlib/Analysis/Normed/Field/Basic.lean:155`: `NormedField` extends Norm, Field and MetricSpace, with multiplicative norm; it does not assert completeness, a nontrivial norm or ultrametricity.
- `Mathlib/Topology/MetricSpace/Ultra/Basic.lean:47`: `IsUltrametricDist` asserts the maximum triangle inequality for a Dist carrier; it supplies neither a field nor completeness.
- `Mathlib/AlgebraicTopology/Quasicategory/Basic.lean:41`: `SSet.Quasicategory` asserts inner-horn filling, not the category of motivic sheaves or its localization.

Object searches also opened the pinned Tau Ceti files in R08, R10 and R11, including their section variables. These results are genuinely present, not inferred from a newer library. The existing adic rank-one/disc carriers in `TauCeti/AlgebraicGeometry/AdicSpace/Spa/RankLeOne.lean` do not construct the general Banach arc-site or Dmot. Thus the absence of headline carriers is still correct; absence of all useful analytic input is not.

Ownership searches used `roadmaps grep` over main and open heads, by “Berkovich motive”, “small arc-stack”, “ball-invariant”, Kmot, integral étale motives, KH, valuation-ring K-theory, Breen–Deligne, arithmetic fracture, and one-units. The board package index was read before making absence claims. The three board-only packages indexed there do not add an overlapping motivic owner. The overlap report lists no dropped ids, revision-only ids or conflicting heads for this package.

The closest open scopes were read: ArcTopologyAndDescent (#1755, `TauCetiRoadmap/ArcTopologyAndDescent/README.md:8`) owns scheme arc-excision; AnalyticStacks (#1687, `TauCetiRoadmap/AnalyticStacks/README.md:1302`) explicitly leaves the MG monodromy-operator identification here; DiamondEtaleCohomology (#922, `TauCetiRoadmap/DiamondEtaleCohomology/README.md:10`) owns diamond étale coefficients and partial properness; EnhancedDerivedSheaves on main, §§E5:abstract and E5:presentability, owns the generic higher algebra. None is a second owner of this package's Banach-motivic comparison. Existing native one-unit algebra is the actual duplication found, R10.

### Supplier resolution and order

The new repair citations resolve to GeneralAlgebraicKTheoryPartII (#1742), `TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/README.md:336`, §1.2; RefinedTraceMethods (#1493), `TauCetiRoadmap/RefinedTraceMethods/README.md:1907`, §4.10; and SchemeKTheoryOperations (#1229), `TauCetiRoadmap/SchemeKTheoryOperations/README.md:744`, the negative-vanishing paragraph inside §2.6. RefinedTraceMethods §4.20's flat idempotent ideal hypothesis matches §7.1; the ring operations and the regular-scheme operations have distinct scopes.

The remaining contract sections and Needs citations were resolved against main for existing roadmaps, and the supplied open heads for new ones:

| Supplier | Sections resolved and content checked |
|---|---|
|TropicalAndBerkovichArithmetic #1494|§§0.1,0.7–0.8,0.12–0.17,0.20–0.22,0.24–0.28,0.30,0.32,1.1–1.3,1.6,3.7: norm-sensitive spectrum, colimits, analytic geometry, tree/slope inputs.|
|EnhancedDerivedSheaves, main|E0.4, E1.3, E2.1–E2.4,E2.6–E2.7,E3.2,E3.4; E5:abstract.1–5,presentability.2–4,descent,animation.1,spectra-comparison: the named generic carriers and comparison inputs exist.|
|AnalyticStacks #1687|§§0.4–0.6,0.9–0.10,1.1–1.5: formalism construction requires projection formulas for the selected P; comodules require flatness and finite Tor amplitude of the counit.|
|GeneralAlgebraicKTheory #1212|§§3.2,8.3,8.10,10.10,13.4–13.5,13.8c: connective/nonunital/Bass K, Tor-unital excision, continuity, finite fields.|
|SchemeKTheoryOperations #1229|§§2.6,3.1,3.3–3.4,3.8,6.4,6.8,6.11: negative vanishing, supports, completion and operations. General support excision is §3.4; §3.8 specializes to Witt support.|
|KTheoryFiniteLocalFields #1281|§§1.5–1.6,2.1,6.5: perfect-positive-degree divisibility, finite fields, completion and henselian rigidity. The two additional rigidity inputs remain explicitly declared gaps.|
|JacobianChallenge, main|Layers A,B,D,E: divisor/line-bundle comparison, Riemann–Roch, pointed Picard representability and multiplication isogenies.|
|AnabelianGeometryAndNonabelianChabauty #1021|Reduced-boundary generalized Jacobian target: characteristic-zero overlap; this package explicitly extends to arbitrary characteristic and only pointwise divisibility.|
|PerfectoidSpaces, main|P1.4,P1.19–P1.22,P1.27,P2.3,P2.7,P2.12,P3.20: tilts, untilts, rational localization, almost acyclicity and étale-site tilting.|
|DiamondsAndVStacks #820|D0.22–D0.23,D1.4,D2.7,D4.7,D4.9,D6.1,D6.3. `Perf.Spd` is explicitly defined as the Tate-pair restriction at README 260 and in D6.1, so the citation-tool warning is not a missing declaration.|
|DiamondEtaleCohomology #922|C0.19,C0.24,C2.2,C2.12,C4.5,C4.13–C4.14,C6.1,C9.8: named coefficient categories, compactification and finiteness inputs.|
|DiamondSixOperations #927|S2.4,S4.2–S4.3: exceptional pushforward, cohomological smoothness and dualizing complexes, with prime-to-p coefficients.|
|MotivesAndAlgebraicCycles #1313|§§4.1–4.6,4.9,4.11,4.15–4.18: finite correspondences, transfer sheaves, ambient motives, cancellation and higher Chow bridge. The étale topology and Banach geometry are new here.|
|MotivicEtaleKTheory #1470|§2.2: Adams-weight/higher-Chow comparison, used on smooth projective schemes.|
|AdicCoefficientsAndComparisons #965|L5 smooth alteration pairs, including retained finite field extension and smooth normal-crossing boundary.|
|ProfiniteCohomology, main|Layers10–11: continuous cohomology and dimension bounds; one old name needs R08, while the closed-subgroup alias has an explicit mapping.|
|SchemeAndStackFoundations, main|§2.16 Tsen input; the algebraically closed function-field hypothesis is retained.|
|RepresentationTheory/LieGroups, CharacteristicClasses, MorseNovikov, main|Layer8 flag/Bruhat theory; C5 Euler characteristic of G/T; Lefschetz fixed-point formula, respectively.|

No forbidden roadmap is used as a supplier. The dependency command specified in the brief was run without editing the merge order. Its complete output was:

```text
depcheck: 236 roadmaps, 2150 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This graph check does not detect the local proof-input overreach in R05.

All nine declared gap slugs occur in both plan.json and the README with named owners. They were compared with the present supplier sections and the pin: replete-postnikov, compact-hausdorff-dimension, animated-group-completion, einfty-fracture-square, kh-excision-cdh-descent, valuation-ring-k-regularity, suslin-rigidity, padic-k-integers-oc and affinoid-line-bundles. The first eight remain mathematical supplier contracts, rather than unowned prerequisites. The last is nonminimal by R11. Generic spectral arithmetic fracture is not by itself the stated E∞-algebra contract; the existing abelian-group Breen–Deligne resolution is not the animated commutative-monoid statement. No gap absence was treated as a defect merely because its supplier has not implemented it yet.

### Headline inventory, Lean elaboration and padding

The summary's headline families are cancellation (§5.3); finitary motivic K-theory and rational Adams decomposition (§§6.1,6.3); the strict-base K-cofibre (§7.6); torsion/effective and stable tilting (§§4.8–4.9,8.3); six operations and proper base change (§§8.5,9.4); geometric and relative rigidity (§§9.1,9.6); algebraic étale comparison (§10.6); nearby-cycle monodromy (§11.8); and overconvergent torsion comparison (§12.3).

Each family is named in the module docstring with its missing carrier. None can be stated on the pinned native carriers using only a few simple definitions: the missing constructions include the Banach arc-site, finitary/effective/stable motivic infinity-categories, motivic localization, and algebraic K-theory spectra. No statable headline was replaced with a stand-in. Elementary one-unit facts are not headlines.

The required `lake env lean` invocation, from the pinned content checkout and on the package's Suggested.lean, exited 0 with no output and no warnings. There is one `import Mathlib`, one module docstring and the required namespace. There are **zero declarations and zero sorries**. Therefore the exhaustive one-tactic padding probe and the `#check @name` binder comparison have empty domains: no theorem was skipped, no section hypothesis can disappear, and no Tau Ceti object-file build was needed. The acceptance file is appropriately short; the findings are in the prose and contracts.

## Not verifiable

- BLR §9.2, Proposition 3, Example 8 and Proposition 10 remain legally unread, recorded `uncertified` in the existing manifest. This settlement was respected and no duplicate request was made. Scholze's marked-Jacobian construction supplies the immediate statement used in §4.3.
- The promised transfer-free 2-primary rigidity proof in §10.2 is not available in its cited source at the stated hypotheses; this is R06, not a claim that the desired theorem is false. No new source was silently substituted.
- The eight remaining supplier gaps are contracts, not completed proofs audited here. Acceptance after repairs would remain conditional on those contracts and the residual descent-only affinoid gap.

## Source issues

- **Misprint** in Scholze at Proposition 2.21, p.13, line 521: the source says the spectral-radius construction gives a norm; it should be a seminorm before separated completion, since a nonzero nilpotent has spectral radius zero; affects nothing.
- **Misprint** in Scholze at Definition 6.2, p.35, lines 1500–1504: the source says a transfer presheaf is covariant in the displayed correspondence category; it should be contravariant, giving ordinary pullback on representables; affects a stated result.
- **Error** in Scholze at proof of Proposition 5.19, p.35, line 1471: the source says the coefficient bound is the maximum of the two radius bounds; it should be their minimum, as the root norms 1/8 and 2 in the computed example show; affects the proof.
- **Misprint** in Scholze at proof of Lemma 6.5, p.38, lines 1621–1624: the source says the outer threshold uses r₁>1 and the inner product is bounded by r₁ⁿ; it should be r₂ for the outer threshold and r₁ raised to the local multiplicity kᵢ for the inner bound; affects the proof.
- **Misprint** in Scholze at proof of Lemma 6.5, p.38, line 1631: the source says the numerator of the ratio-minus-one is T₂−T₁; it should be T₁−T₂; affects nothing.
- **Misprint** in Scholze at proof of Lemma 6.5, p.38, line 1633: the source says a garbled containment holds with an extra rational term; it should be an inclusion of the reduced-unit summand in the image of differences of point classes; affects nothing.
- **Misprint** in Scholze at proof of Lemma 6.5, p.38, lines 1601–1603: the source says each annular domain has e degree coordinates; it should be d coordinates per domain, hence de in total; affects nothing.
- **Gap** in Scholze at six-functor construction after Proposition 9.3, p.52, lines 2181–2186: the source says the initial class includes all finite-cohomological-dimension affine maps; it should be restricted to the bounded-embedding class of Theorem 9.2 until an enlargement argument is supplied; affects the proof.
- **Error** in Scholze at Theorem 11.1, p.57, lines 2398–2399: the source says the rational mapping spectrum is the unshifted weight-j K-spectrum; it should be corrected by including the cohomological shift [−2j]; affects a stated result.
