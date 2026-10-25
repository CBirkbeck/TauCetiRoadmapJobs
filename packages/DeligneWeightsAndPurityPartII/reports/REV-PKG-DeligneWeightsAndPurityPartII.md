<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1502#issuecomment-6396092825 -->
Review (codex) of 4c08cd9

Verdict: needs_changes

1. **F01** (P1) Two ownerless gaps remain outside the README contracts

   **Location.** `packages/DeligneWeightsAndPurityPartII/design/plan.json:2333` and `:2343`; `packages/DeligneWeightsAndPurityPartII/README.md:35`. The plan retains “huber-lutkebohmert-original-sources” and “neighbourhood-derived-proof-inputs”.

   **Claim.** These are declared prerequisite gaps. Neither entry has a supplier, section or `needs` field, and neither slug occurs under the README's exact contracts.

   **Witness.** The two plan entries have only `slug`, `title`, `neededBy` and `detail`. README:589 instead assigns the four derived inputs to §3.4 itself. The source-access entries are already settled as uncertified in `sources.toml`.

   **Exact repair.** Reconcile the top-level gap list with the package's actual ownership: retire the source-access entry in favour of the existing uncertified manifest records, and retire the derived-input entry because §3.4 explicitly owns its four targets. Retain their mathematical statements and hypotheses. Any genuinely external residual prerequisite must instead have a named supplier, exact section and atomic `needs`, with the same slug under that supplier in the README. This requires reconciliation of the gap records, not another request for the three settled texts.

   **Repair check.** For the identity disc map the boundedness target has b=0, and restriction on every smaller disc has H⁰=ℤ/n and Hⁱ=0 for i>0. For Z=X, the blow-up alone is empty, whereas Bl_Z(X) ⊔ Z→X includes the identity and supplies descent. Both necessary targets remain explicitly owned in §3.4 after the obsolete gaps are retired. There must be zero ownerless gaps afterwards.

2. **F02** (P2) Geometric Galois restriction is already supplied

   **Location.** `packages/DeligneWeightsAndPurityPartII/README.md:69`: “What EtaleCohomologyFoundations must provide (gap:geometric-galois-restriction)”; matching plan entry at `design/plan.json:2352`.

   **Claim.** Continuous geometric cohomology, equivariant field restriction and closure comparison are a missing export of EtaleCohomologyFoundations.

   **Witness.** `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:1089`, §F.4.6, states `VanishingCycles.adicFunctoriality`: continuous geometric Galois actions, restriction along field extensions and closure conjugacy. Its §F.2.2, line 523, supplies separably closed field extension invariance.

   **Exact repair.** Remove this redundant gap from the gap list and README. Import §§F.2.2, F.4.3–F.4.6, especially `VanishingCycles.adicFunctoriality`, by name in the exact contract and all affected Needs lines. Keep the suppliers' coefficient descent, finiteness and realization hypotheses.

   **Repair check.** For ℙ¹ and residue degree f, H⁰ has Frobenius 1 and H² has qᶠ after restriction; the comparison takes 1↦1 in both degrees. For a purely inseparable extension, étale invariance preserves both dimensions (1,1). These are the required restrictions of the existing action, not a new action construction.

3. **F03** (P2) Ample intersection positivity has an earlier owner

   **Location.** `packages/DeligneWeightsAndPurityPartII/README.md:99`: “What SchemeAndStackFoundations must provide (gap:ample-top-intersection)”; matching plan entry at `design/plan.json:2364`.

   **Claim.** Positive top self-intersection of an ample line bundle on an integral projective variety is missing.

   **Witness.** `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:1228`, §A2.7, states `ampleIntersectionPositive` for proper schemes over any field and arbitrary ample line bundles. Its statement starts at line 1230 (the service's leading provenance line is excluded).

   **Exact repair.** Remove the redundant gap and import AbelianSchemesAndArithmeticModuli §A2.7 `ampleIntersectionPositive` in Scope and ownership, its exact supplier subsection, §§4.1/4.3 Needs and Layer 4 dependencies. Keep SchemeAndStackFoundations §§5.2–5.3 for pushforward, degree and the Chern projection formula. Specialize all d ample bundles to H. For d=0 use the supplied degree of a closed point.

   **Repair check.** On ℙ¹, deg c₁(O(1))=1; a degree-two elliptic cover gives 2·1=2. For Spec L over k the zero-dimensional degree is [L:k]>0, including inseparable degree p; for a rational point it is 1. The proposed import covers these cases and is earlier in the merge order.

4. **F04** (P2) Layer 2 reassigns existing tilting constructions

   **Location.** `packages/DeligneWeightsAndPurityPartII/README.md:453`: “identify their composite β with the componentwise tilted action”; also the residue-field construction at line 465 and the ownership claim at line 15.

   **Claim.** Componentwise Galois action, the degree-preserving finite-extension equivalence and the residue-field isomorphism are new identifications owned here.

   **Witness.** `TauCetiRoadmap/PerfectoidSpaces/README.md:8483`–8499 specifies the componentwise Fontaine–Wintenberger action; §P3.7 at 8426 preserves degrees. §P1.15 at 4456–4472 constructs `tiltField.residueFieldEquiv`; §P1.6 at 4042 gives sharp naturality.

   **Exact repair.** Delete these already-owned assertions as new targets. Cite PerfectoidSpaces §§P1.6, P1.15, P3.7–P3.8 and AdicEtaleGeometry §A1.0.5 for them. Keep β as the named composite of those supplied equivalences, and keep the genuinely additional prime-to-p Tate-coordinate and marked inertia/Frobenius/tame comparison in §§2.3–2.4. Adjust the scope sentence accordingly. The general finite-k coordinate calculation in §2.1 remains distinct from the supplier's ℚ_p example.

   **Repair check.** On t=(ϖ,ϖ₁,…) the supplied componentwise action gives (β(σ)t)♯=σ(ϖ)=ϖ; a finite extension of degree r stays degree r. With k″=𝔽_q((t^(1/p))), the new marked comparison still computes e=p and scalar p⁻¹. Importing the old constructions preserves this new calculation.

5. **F05** (P2) The neighbourhood endpoint is narrower than the read source

   **Location.** `packages/DeligneWeightsAndPurityPartII/README.md:587`: “For K algebraically closed complete of characteristic zero”; “The radius depends on n.” Also lines 603 and 805.

   **Claim.** The library endpoint is restricted to characteristic zero and separately chosen invertible coefficient orders; §3.5 upgrades only the powers of a fixed ℓ.

   **Witness.** ITO20 line 1003, Theorem 4.9, printed p. 22, has the same separated finite-type model and finite-presentation immersion hypotheses, no characteristic-zero assumption, and one radius for every positive n invertible in O.

   **Exact repair.** State the full constant-coefficient theorem of ITO20 Theorem 4.9 in Layer 3: one ε₀ works for all ε≤ε₀, all i and all invertible n, in either characteristic. Keep the characteristic-zero Huber/locally-constant-sheaf theorem as its separately scoped target; it must not be presented as the full constant-coefficient endpoint. Name the inputs of Ito's uniform proof as owned targets or exact earlier contracts. Propagate the stronger statement through the neighbourhood contract and docstring; keep the ℓ-power case as an application. Do not broaden Lütkebohmert's characteristic-zero theorem to positive characteristic.

   **Repair check.** Over the completed algebraic closure of 𝔽₂((t)), X=Spec O[T], Z=V(T), ε₀=1 gives H⁰=ℤ/n and Hⁱ=0 for i>0 simultaneously for every odd n. This valid source instance is excluded by the package's characteristic-zero statement. In mixed characteristic, n=p still remains excluded, and the source gives dim H¹(B(1),ℤ/p)=∞ versus 0 at the origin.

6. **F06** (P1) A source sentence is copied into a Check

   **Location.** `packages/DeligneWeightsAndPurityPartII/README.md:485`, after “the precise form of”; a shorter quotation also occurs at line 459.

   **Claim.** The package says every mathematical statement is authorial, but the Check reproduces Scholze's sentence describing compatibility of weights and N.

   **Witness.** The quoted sentence at README:485 matches SCH12 lines 2599–2600, printed p. 309, word for word. The phrase at README:459 matches SCH12 line 2598.

   **Exact repair.** Replace both quotations by an authorial computed Check, for example: for L=K and k″=𝔽_q((t)), β preserves the inertia kernel and geometric Frobenius coset, Q=q, and t_k=t_k″∘β, so the scalar is 1. Retain the precise source locator. This is blocking under the brief's explicit no-copied-passages principle, independently of quotation length.

   **Repair check.** Taking q=2 and the two-term string gives eigenvalues (1,2), N(e₁)=e₀ and unchanged weights (0,2) on both sides. The replacement tests the marking and contains no source sentence.

7. **F07** (P3) Two secondary supplier locators are stale

   **Location.** `packages/DeligneWeightsAndPurityPartII/README.md:9`: “7.16”; line 325: “§§0.7, 0.11 (direct sums)”.

   **Claim.** These are the parent's proper-smooth purity and direct-sum sections.

   **Witness.** `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:2678` begins §7.15; Layer 7 ends without §7.16. Direct-sum purity is §0.9 at line 928; §0.11 at 952 concerns spectra of powers. The exact contract at package line 63 already uses §7.15.

   **Exact repair.** Change 7.16 to 7.15 in Scope and ownership, and cite §0.9 for direct sums. Retain §0.7 for the scalar endomorphism predicate and §0.11 only where powers are used. This is a locator correction: the required theorems do exist in the named supplier, and the principal proper-smooth contract already points to them.

   **Repair check.** For F=diag(1,q), §0.9 gives the union {0,2} of the two line weights; for a proper smooth ℙ¹, §7.15 gives weight 2 in H². Both intended inputs remain supplied.

8. **F08** (P3) Tower and composite-map definitions lack their complete APIs and Checks

   **Location.** `packages/DeligneWeightsAndPurityPartII/README.md:439` and `:453`. The tower/coordinate construction has two Check bullets; the Galois-composite construction has one, which merely identifies a source sentence. Neither has a prose API list.

   **Claim.** These definitions/constructions satisfy the package's definition completeness contract.

   **Witness.** The complete Check lists are at lines 445–447 and 459. By contrast, §§0.1–0.4, 0.8, 3.1, 4.1 and 4.2 have explicit API lists and at least three Check bullets.

   **Exact repair.** After R04 removes duplicate constructions, give the retained tower/coordinate definitions and composite β their API lists and at least three discriminating Checks each. Include the ramified-base coordinate quotient, p=2 sign, identity action, and a nontrivial prime-to-p root action; keep the finite-stage nonperfectoid counterexample. Do not add these as Lean padding.

   **Repair check.** For k=ℚ₂(√2), ϖ=√2, the first tower stage has degree 2 over k and valuation denominator 2; modulo ϖ, T^(1/2) is nonzero with square 0. The norm of a square root is −ϖ but t♯=ϖ. For a primitive third root at p=2, σ(ζ₃)=ζ₃² is carried to the same exponent by β; the identity has exponent 1. These distinguish the intended coordinates and action from zero, identity-only or unsigned norm models.

9. **F09** (P3) Cup compatibility is used before its target

   **Location.** `packages/DeligneWeightsAndPurityPartII/README.md:613`: “§§3.1, 3.4, 3.6 (only for cup compatibility)”.

   **Claim.** The target subsections are in build order, but §3.5 promises multiplicativity before §3.6 supplies it.

   **Witness.** Section 3.6 depends only on native Ext and earlier suppliers (line 625), while §3.5 explicitly depends on it. This is a forward edge, though not a cycle.

   **Exact repair.** Move the cup-product target immediately before the Galois-stable neighbourhood target, renumber those two subsections and update their references, including the module docstring. No mathematical hypothesis needs to change.

   **Repair check.** For the identity disc restriction and a,b∈ℤ/n, both sides of the product identity are ab and the unit is 1. The same comparison is then available before §3.5 asserts that its inverse is multiplicative.

Independent review of the four package files, with the design's gap list checked as required. No earlier package review exists. The authored files were not changed. Nine findings follow: two P1, four P2 and three P3. The mathematical examples below did not refute the principal weight–monodromy or splitting conclusions; the blocking defects concern ownership, scope, gap contracts and copied source wording.

## Verified sound

### Coverage and principles

Read all 817 README lines, all 70 Lean lines, metadata, all seven source records and the five top-level gap entries. The README has 30 target subsections and 89 Check bullets. All 30 Needs lines and all five layer dependency paragraphs were read. The primary definition/API sections have seven, five, six, seven, six, five, four and six Checks respectively; R08 concerns two further constructions. The main-branch shapes compared were AnalyticToricGeometry, LocalFieldsRamification and PerfectoidSpaces.

The package extends the parent curve/finite-field theory. Its final theorem includes bad reduction, p=2 and p=3, all ℓ≠p, set-theoretic rather than scheme-theoretic complete intersections, the rank-zero fan and c=0. No computational algorithm target, sorried data, forbidden import, `set_option`, admitted example, vacuous Prop field or whole-roadmap re-plan was found. R04 is localized duplicate ownership, not grounds for rejecting the whole roadmap. Source wording fails the authorial-statement principle at R06. All authored files remain unchanged.

The two citation-resolver leads at README:55 are false positives as library lookups: `WeilDeligneRep.IsWeilNumber` and `WeilDeligneRep.IsPureEnd` are explicitly planned in ArithmeticGaloisRepresentations §2.6, at its README lines 1980–1991, not claimed as pinned declarations here.

### Source sample: all fifteen targets

All source readings used the existing legal, line-numbered cache. Published Scholze numbering is distinguished from arXiv numbering; Ito is v1. No additional work needed fetching and no manifest entry was rewritten. A source-derived extension is distinguished below from a theorem literally stated in the source.

| Target | Source read, printed page | Hypotheses, locator and result |
| --- | --- | --- |
| 0.6 | SCH12 line 2527, p. 307; line 2598, p. 309 | Scalar change leaves the filtration unchanged. The general marked-profinite transport is an authorial algebraic extension: t′∘α=ct gives N_pullback=cN′. Both implications follow using α⁻¹. |
| 0.7 | SCH12 line 2652, p. 311; Definition/Proposition 9.2 at line 2532 | The source uses a direct summand. Projectors commute with log and N; the package correctly excludes arbitrary subobjects. |
| 0.9 | SCH12 line 2547, p. 308 | Finite extension reduction is stated. The package correctly supplies both directions, e-scaling, q↦qᶠ and purely inseparable étale invariance through named suppliers. |
| 0.10 | SCH12 line 2564, p. 308 | Good-reduction weights are recalled. Unramifiedness/N=0 uses smooth proper base change; proper-smooth finite-field purity is in the cited parent §7.15. Projectivity is not silently imposed. |
| 1.1 | SCH12 Theorem 9.4, line 2571, pp. 308–309; DEL80 Theorem 1.8.4, line 1528, pp. 175–176 | Scholze states a rational point; Deligne uses the local residue cardinality at a missing closed point. Constant extension/component reduction supplies the package's closed-point version. The sheaf is lisse, proper-smooth cohomological and pure for every embedding. |
| 1.2 | SCH12 line 2571 and line 2652, pp. 308, 311 | Derived application: spread to a proper smooth family on U; at a missing v apply the curve theorem on U∪{v}. All places, including bad ones, are retained. |
| 2.1 | SCH12 line 2592, p. 309; introductory Theorem 1.1 | The completed p-root tower and completed perfection are supported. General finite-k coordinates use Eisenstein, Teichmüller and the supplied perfectoid criterion, not a Galois assertion about the tower. |
| 2.5 | SCH12 lines 2592–2600 and 2652–2654, pp. 309, 311 | The argument restricts to the p-power tower, transports marked monodromy and uses a stable summand. The package retains all three hypotheses. |
| 3.2 | ITO20 lines 99–106, §1.2, pp. 2–3 | Huber's oc-quasi-constructibility and degreewise locally constant conclusion are recalled. The package correctly lets ε depend on j and n. HUB98's original definition and theorem remain uncertified. |
| 3.6 | SCH12 Lemma 9.8, line 2622, p. 310; lines 2630–2632 | Pullback preserves the product; the inverse of the restriction isomorphism also does. Exact fixed-coefficient inverse image is used, not arbitrary ringed tensor pullback. |
| 4.1 | SCH12 Corollary 8.8, line 2496, p. 307; line 2607, p. 309; DJ96 Theorem 4.1/Remark 4.2, lines 597–606, p. 66 | Approximation gives dimension/containment, not smoothness. The finite-extension alteration step provides a smooth geometrically irreducible Z′. No equality of all cohomology groups is claimed. |
| 4.3 | SCH12 Lemma 9.9, line 2636, pp. 310–311; proof lines 2644–2651 | The ambient square and nonzero ample class support top-degree invertibility over characteristic-zero coefficients. The package supplies geometric connectedness of the target and the d=0 unit argument missing from an abbreviated reading. |
| 4.5 | SCH12 lines 2652–2654, p. 311 | Poincaré duality gives the stable summand via the actual multiplicative equivariant comparison. The package includes the nontrivial top Tate character. |
| 4.6 | SCH12 Theorem 9.6, lines 2589–2591, pp. 309–311 | Geometrically connected proper smooth Y, projective smooth fan toric ambient and set-theoretic complete intersection agree. The fan convention is split; a nonsplit form can also be handled by finite splitting extension and §0.9. |
| 4.7 | SCH12 Theorem 1.15, lines 239–241, p. 251, and Theorem 9.6 | Projective-space and product fans supply the application, with geometric connectedness, smoothness and closedness retained. The source theorem covers bad reduction. |

Also read ITO20 Proposition 4.1/Lemma 4.3 (lines 866–931), Theorem 4.5(2) (974–981), Remark 4.7 (987–990), and Theorem 4.9 (1003–1009). These verify tube gluing, cofinality, the stated characteristic-zero comparison and its necessary coefficient restriction; the last theorem produces R05. LUT93 Theorem 2.2 is recalled at ITO20 lines 103–106; the full original statement was not represented as read.

### Computed adversarial pass

Each row records actual values for a statement, construction or additional API assertion. Repeated assertions and repeated Checks use the same row. These finite tests supplement the proof-route/source audit; they are not claimed to prove a general theorem. Write T(q) for the two-dimensional representation with N(e₁)=e₀, N(e₀)=0 and Φ=diag(1,q). Its grades −1,1 have eigenvalues 1,q. Λ=ℤ/n below, with n positive and invertible in the valuation ring unless a negative control explicitly says otherwise.

| Statement | Instances tried | Values computed on the two sides | Result; change |
| --- | --- | --- | --- |
| Conventions: geometric Frobenius/N | T(2), T(3), vector e₁ | NΦ(e₁)=2e₀,3e₀=qΦN(e₁); ΦNΦ⁻¹(e₁)=e₀/2,e₀/3 | Correct; reversed sign gives 2e₀,3e₀ and fails. |
| Conventions: grades, central weight and twists | T(2) and T(2)(1) | Grades (−1,1), eigenvalues (1,2), weights (0,2)=1+(−1,1); twist gives (1/2,1), weights (−2,0)=−1+(−1,1) | Correct. |
| Conventions: coefficient/topology boundary | q=1, q=2, zero space, zero ring | At q=1, 1=1^(w/2) for all w; at q=2, 1 has only w=0; dim0 has empty spectrum; zero ring cannot satisfy Field/nonzero c | Exclusions and zero-object convention correct. |
| Conventions: positive radii and empty products | ε=0; rank-zero projective product | 0∉\|Kˣ\|; empty product=Spec k, H⁰=E, other Hⁱ=0 | No zero denominator/radius or empty-index ambiguity. |
| 0.1 datum definition | H=ℤ_ℓ⋊ℤ̂ with action q⁻ⁿ; finite H=S₃ | t((0,1)(x,0)(0,1)⁻¹)=q⁻¹x; H/I=ℤ̂. A quotient of S₃ has at most 6 elements, not ℤ̂ | Intended model accepted; finite wrong carrier excluded. |
| 0.1 inertia-coset/lift independence | Φ′=Φτ; also product with nonabelian S₃ in inertia | Φ⁻¹Φ′=τ∈I; t(τστ⁻¹)=t(σ); t on S₃ commutators=0 | Both coset implications and independence hold. |
| 0.1 exclusion of identity and arithmetic coset | q=2, t(σ)=1 | Identity gives 1 on left versus 1/2 on right; arithmetic lift gives 2 versus 1/2 | Wrong markings rejected. |
| 0.1 isomorphism constants | c=2,c′=3; inverse; identity | Composite t″α′α=6t; inverse constant 1/2; identity constant 1; D→2D→D has 2·(1/2)=1 | Composition/inverse/rescaling directions correct. |
| 0.1 open tame image | t(ℤ_ℓ)=ℤ_ℓ, subgroup ℓ²ℤ_ℓ; discrete countermodel | Restricted image=ℓ²ℤ_ℓ≠0; discrete open {0} has image 0 | Compact profinite hypothesis excludes the bad uniqueness model. |
| 0.2 standard Kummer coordinate | σ(ϖ^(1/ℓⁿ))=ζ_(ℓⁿ)ϖ^(1/ℓⁿ) | Kummer ratio=ζ_(ℓⁿ); compatible coordinate=1∈ℤ_ℓ; full tame image=ℤ_ℓ | Positive normalization correct. |
| 0.2 inertia and Frobenius convention | k=ℚ₂,ℚ₃ | Residue-action kernel=I_k; arithmetic exponents 2,3 invert to geometric 1/2,1/3 | Matches pinned Tau Ceti after inversion. |
| 0.2 uniformizer independence | ϖ=uϖ′, unit u; inertia σ | σ(u^(1/ℓⁿ))/u^(1/ℓⁿ)=1, so new ratio=old ratio | Units do not introduce a new tame coordinate. |
| 0.2 finite extension formula | unramified f=3; ramified e=2; inseparable e=p | Q′=q³, character unchanged in first case; t_old=2t_new and scalar 1/2 in second; p·p⁻¹=1 in E in third | Includes ℓ=2 for e=2 and inseparable p. |
| 0.3 restricted datum | residue image 3ℤ̂ and tame image ℓ²ℤ_ℓ | Q′=q³, new Frobenius image=3, twist=q⁻³; tame image≠0 | Correct quotient generator and index. |
| 0.3 transitivity/identity | indices 2 then 3; H′=H | (q²)³=q⁶; coset exponent 2·3=6; identity index=1, Q′=q | Both restriction constructions agree. |
| 0.3 transport/rescaling of restriction | α of scalar 2, t-image ℓℤ_ℓ | Restricted t′α=2t on the same subgroup; scaling before/after gives 2ℓℤ_ℓ | Commuting constructions verified. |
| 0.3 inadmissible subgroups | H′=I_k; ℓ-root tower; p-root tower | Residue image 0 for I_k; tame image 0 for ℓ-root tower; p-root tower has f=1 and image ℤ_ℓ | Two failed hypotheses and one permitted infinite subgroup separated. |
| 0.4 purity definition | T(2), trivial line, zero space, split diag(1,2) with N=0 | T(2): grade weights 0,2 and w=1; line: w=0; zero: every w; split: one grade contains weights 0 and 2 | The definition distinguishes monodromy from semisimplification. |
| 0.4 operator uniqueness | N²=0, a≠0 | exp(aN)=1+aN; log(1+aN)=aN; a⁻¹log(exp(aN))=N | Nonzero tame value fixes N; a=0 would yield 0 for all N. |
| 0.4 filtration preservation | T(3), cN with c=2 | M_−2=0, M_−1=M_0=Ee₀, M_1=E² for both N and 2N; Φ(Ee₀)=Ee₀ | Rescaling and Frobenius preserve the same filtration. |
| 0.4 one/all Frobenius lifts | finite inertia C₃ with inversion by A (S₃ model), r=2 | A²=1 and (Aτ)²=1, hence (Aτ)^6=A^6=1; sixth-power eigenvalues coincide | Nonabelian lift test validates the finite-power argument. |
| 0.4 scalar extension | T(2) over E and E′; nonsplit polynomial X²+2 | Grade eigenvalues stay 1,2; roots ±i√2 both have modulus √2 before/after splitting | Purity preserved and reflected. |
| 0.4 rescaled datum | replace t by 2t on T(2) | exp((2a)(N/2))=1+aN=exp(aN) | Operator changes by inverse scalar; purity unchanged. |
| 0.4 finite inertia | finite sign character, N=0 | Eigenvalue ±1 has modulus 1, only grade0, weight0; log after open kernel=0 | Correct finite-inertia specialization. |
| 0.4 dual | T(q) dual | Operator −Nᵗ; grade−1 eigenvalue q⁻¹, grade1 eigenvalue1; weights −2,0=−1+(−1,1) | Dual central weight −1. |
| 0.4 tensor | T(2)⊗T(2) | N_total has ranks (2,1,0) for powers1,2,3; grades −2,0,2 have eigenvalues 1,(2,2),4 and weights 0,2,4 | Central weight 2=1+1; uses characteristic-zero tensor filtration. |
| 0.4 arbitrary-datum twist | character χ with χ(I)=1, χ(Φ)=q⁻¹ | Eigenvalue qʳ becomes q^(r−1); weight 2r becomes 2r−2 | Explicit character condition rules out an arbitrary wrongly normalized twist. |
| 0.5 detection, both directions | T(2), residue index3; same N on a p-root tower | Eigenvalues (1,8), base Q′=8 give grades of weights (0,2), as (1,2), Q=2 do; tower f=1 keeps (1,2) | Forward and converse agree. |
| 0.5 failure without tame image | ℓ-root tower | t=0; exp(tN)=1 for N=0 and N≠0; choosing N=0 puts (1,q) in grade0 | Nonzero-image requirement is substantive. |
| 0.6 transport, both directions | scalar2 data map and inverse | Pullback of N′=N/2 is 2N′=N; inverse recovers N/2; grade eigenvalues (1,q) on both sides | Correct. R06 affects wording only. |
| 0.7 direct sum equivalence | T(2)⊕T(2); T(2)⊕E | First: grade−1=(1,1), grade1=(2,2), central1 on both summands. Second: added grade0 eigenvalue1 has weight0≠1 | Both directions tested. |
| 0.7 subspace negative control | ker N⊂T(2) | ker N=Ee₀, eigenvalue1, N=0, weight0 versus ambient central1 | Stable subspace is not a weight-1 stable summand. |
| 0.8 WMC definition/range | ∅, Spec k, ℙ², degrees −1 and5 | Empty groups all0; point H⁰=E; ℙ² has (H⁰,H²,H⁴)=(E,E(−1),E(−2)), Φ=(1,q,q²); H⁻¹=H⁵=0 | Integer range and empty case correct. |
| 0.8 H⁰ and disjoint unions | two geometric points permuted by Frobenius; ℙ¹⊔point | H⁰ characteristic polynomial X²−1, eigenvalues ±1 of weight0; union H⁰=E², H²=E(−1) | No connectedness accidentally imposed on general WMC. |
| 0.8 local factor consequence | T(q) at i=1; E(−1) at i=2 | T(q)^I=Ee₀ gives pole Re(s)=0≤1/2; E(−1) gives Re(s)=1=2/2 | Bound direction and q⁻ˢ normalization correct. |
| 0.9 finite extension iff | e=2,f=3 on T(q); purely inseparable e=p,f=1 | New eigenvalues (1,q³), new monodromy 2N, central weight1; inseparable case has pN and same eigenvalues | Ramification does not change filtration; both implications survive. |
| 0.10 good reduction | ℙ¹; Tate elliptic curve | ℙ¹: inertia1, N0, H⁰ eigenvalue1, H² eigenvalueq. Tate curve: rank N=1 | Positive case works; bad-reduction non-example correctly excluded. |
| 1.1 curve theorem | Legendre at λ=0, p odd; degree-a closed point | Grade eigenvalues ±1,±qᵃ have absolute values1,qᵃ and weights0,2 for Q=qᵃ | Split and nonsplit multiplicative cases both work. |
| 1.2 all global places | ℙ¹_F at degree-a place; a bad Legendre place | ℙ¹ H² eigenvalue qᵃ, weight2; bad H¹ has grade weights0,2, central1 | No good-place restriction. |
| 2.1 tower and valuation | n=0,1,2, p=2,3 | Stage degrees 1,p,p²; v(ϖ_n)=p⁻ⁿ; union value group ℤ[1/p], finite-stage group p⁻ⁿℤ | Finite stages discrete; union completion nondiscrete. |
| 2.1 quotient and perfectoid criterion | k ramified, p=uϖᵉ; y=T^(1/p) mod T | y≠0 and yᵖ=0 on both quotient presentations; Frobenius preimage of aT^(j/pⁿ) is a^(1/p)T^(j/p^(n+1)) | Retains nilpotents in O_K/(ϖ); no reduction to residue field alone. R08. |
| 2.1 tilt coordinate/density | t=(ϖ_n); truncation after t^m | t♯=ϖ, norm equality \|t\|=\|ϖ\|; omitted tail has norm≤\|t\|^m→0 | Coordinate/dense perfect subfield correct; no norm-compatibility assumption. |
| 2.2 completed/tilted Galois composite | finite extension degree r; identity action | Degree r=r after tilting; β(1)x=x and (β(1)x)♯=x♯ | Correct mathematics, but supplied constructions must be imported (R04). |
| 2.2 non-Galois tower control | ℚ₃(3^(1/3))/ℚ₃ | Degree3, other roots require ζ₃; this stage is not Galois | Completion equivalence does not assert the Kummer tower is Galois. |
| 2.3 residue comparison | t and a residue unit in C♭ | Residue(t)=0 maps to residue(ϖ)=0; residue(1)=1 on both sides | Correct but already supplied (R04). |
| 2.3 prime-to-p roots and transitions | p=2,ℓ=3,n=1,2 | Torsion sizes3,9 on each side; an element killed by 3ⁿ and2ʳ has order gcd(3ⁿ,2ʳ)=1; transition ζ₉³=ζ₃ | Injective, surjective and transition compatible. |
| 2.3 p-primary negative control | mixed characteristic, p=2,n=1 | μ₂(C♭) has size1, μ₂(C) size2; ε♯=1 but ε≠1 and ε has infinite order | Correctly separates full-group noninjectivity from torsion mismatch. |
| 2.3 automorphism/cyclotomic compatibility | σζ₃=ζ₃² at p=2 | (σ♭ζ♭₃)♯=ζ₃²=σ((ζ♭₃)♯) | Same character exponent2. |
| 2.4 marked inertia/residue/Frobenius | L/K residue degree a | Q_left=qᵃ=Q_right; residue kernel left maps to residue kernel right; geometric Tate scalar q⁻ᵃ on both sides | Marked compatibility tested. |
| 2.4 tame scalar and sign | k″=𝔽_q((t^(1/p))), p=2,3 | e=2,3; t_k=e t_k″β; map constant1/2,1/3; N_k″=eN_k | Correct inverse scalar, including inseparable local coordinates. |
| 2.5 transfer through stable summand | W=T(q)⊕T(q), V=T(q); negative V=ker N⊂T(q) | First central weights1=1; negative has 0≠1 and no stable complement | Exactly the stated summand hypothesis is needed. |
| 3.1 tube definition/generator independence | ideal(T) versus (T,2T); ε=\|ϖ\|² | Both inequalities reduce to \|T\|≤\|ϖ\|² since \|2\|≤1; (T,2T) includes generator T | Integral generators, not generic-fibre equations, determine the tube. |
| 3.1 zero/unit ideals and empty space | I=0, I=(1), ε<1; X=∅ | T(0,ε)=X; T((1),ε)=∅ because1≤ε is false; empty X gives∅ | All degeneracies match. |
| 3.1 monotonicity/intersection/cofinality | ε=\|ϖ\|²<\|ϖ\|; K-point T=ϖ | Point is in larger tube and not smaller; intersection over all radii forces T=0; for W=T(Z,\|ϖ\|), the smaller tube lies in W | Direction and cofinality agree with Ito; higher-rank points use continuous valuations, not real-point truncation. |
| 3.1 inverse image | map T=S² | Pullback of \|T\|≤ε is \|S\|²≤ε on both constructions | Correct scheme-theoretic pullback. |
| 3.1 field extension/automorphism | K⊂K′ isometric, σ over K | \|σ(g(x))\|=\|g(x)\| and \|σ(ϖ)\|=\|ϖ\| | Tube preimage and stability agree. |
| 3.1 proper comparison | X=ℙ¹_O; nonproper X=𝔸¹_O | Proper generic fibre gives all ℙ¹_ad; affine formal fibre is unit disc, omitting K-point T=ϖ⁻¹ with norm>1 | Properness is essential for the asserted full analytification. |
| 3.1 model/thickening controls | V(T), V(ϖT), V(T²), ε=\|ϖ\|² | Radii respectively \|ϖ\|²,\|ϖ\|,\|ϖ\|; T=ϖ separates first from other two; all reduced zero loci have point cohomology | Fixed-radius model dependence correctly retained. |
| 3.2 oc/direct-image consequence | identity disc map, n=1 and n>1 | R⁰=Λ, Rʲ=0 for j>0; at n=1 every group0; any small radius works | Degreewise quantifiers sound; original oc definition remains unread. |
| 3.3 Kummer trivialization | T=Sᵐ, m=1,2,p in characteristic0 | Pullback fibre equation Uᵐ=Sᵐ splits as m graphs U=ζS; derivative mS^(m−1)≠0 off0 | Allows p-divisible m without claiming tame prime-to-p degree. |
| 3.3 positive-characteristic counterexample | yᵖ−y=T⁻¹ after T=Sᵐ | Pole order m; remove p-powers to leave positive pole order m/p^v_p(m), not divisible by p | Artin–Schreier class remains nonzero; no Kummer trivialization. |
| 3.4 neighbourhood comparison | disc/origin; Z=X; Z=∅ | Disc and point: (H⁰,H⁺)=(Λ,0); Z=X gives identity; empty gives0=0 | Stated characteristic-zero theorem is sound, scope insufficient (R05). |
| 3.4 blow-up descent/gluing subtarget | Z=X; two identical opens covering X | Bl_X(X)=∅; disjoint cover contains X→X; Čech augmentation contracts. Duplicate-open Čech H⁰=Λ, positive Čech groups0 | Added Z is essential, and finite gluing is not inferred just from point sets. |
| 3.4 bounded amplitude subtarget | identity disc; constant f on ℙ¹ | Identity b=0; constant proper map has R⁰=Λ,R²=Λ(−1), others0, so b=2 | Distinguishes degreewise radii from a common derived bound. |
| 3.4 disc stabilization subtarget | identity disc complex; constant ℙ¹ pushforward | Restriction gives (Λ,0)→(Λ,0), or (Λ,Λ(−1)[−2])→same, identity in each surviving degree | Values consistent; general route remains a target, not an assertion of an already-proved input. |
| 3.4 closed-support continuity subtarget | shrinking discs; V(T²) | colim H⁰=colim(Λ,id)=Λ=H⁰(point), colim Hⁱ=0 for i>0 | Nilpotent closed support has same étale groups; site continuity is still explicitly required. |
| 3.4 forbidden coefficient | n=p over mixed-characteristic algebraically closed K | dim H¹(disc,ℤ/p)=∞ versus dim H¹(point,ℤ/p)=0 | Invertibility cannot be dropped. |
| 3.5 simultaneous ℓ-powers | disc/origin at m=1,2; full ambient of plane cubic | H⁰ groups ℤ/ℓ,ℤ/ℓ² and restriction identities; ambient H¹=0 versus cubic H¹ dimension2 | Five-lemma induction works; arbitrary neighbourhood counterexample valid. R09 orders cup input first. |
| 3.5 rings/unit/reductions | a,b∈ℤ/ℓ², reduction to ℤ/ℓ | Restriction(a b)=a b, restriction(1)=1; reduction(a b)=ā b̄ | Multiplicative coefficient compatibility retained. |
| 3.6 site pullback and inverse | identity site; degree0 scalars2,3 | f*(2·3)=6=f*(2)f*(3); identity Ext map preserves composition αβ=αβ | Imported algebra plus geometric comparison, not a second Ext theorem. |
| 4.1 approximation definition/existence boundary | c=0,Y=ℙ¹; d=0; finite extension of constants | Identity approximation dimensions1=1; point approximation dimensions0=0, H⁰ rank1; finite constant extension leaves geometric dimension unchanged | Empty equation set/rank-zero fan handled. |
| 4.1 geometric irreducibility requirement | Spec F′→Spec F with [F′:F]=2 | Over F̄ the source has2 points, H⁰ rank2; over F′ it is one geometric point, H⁰ rank1 | Explains why arbitrary integral alteration is insufficient. |
| 4.1 proper generically finite degree | elliptic y²=x³−x in characteristic3 →ℙ¹ by x | Discriminant64=1 mod3≠0; function-field degree2; dimensions1=1; H¹ dimensions2 versus0 | Valid non-isomorphic approximation, including small p. |
| 4.1 ample degree formula | same elliptic cover; inseparable degree-p map ℙ¹→ℙ¹ | deg g*c₁(O(1))=2=2·1; inseparable example gives p=p·1 | Positivity true in rational cohomology; existing owner R03. |
| 4.1 local field/compositum | k₁=𝔽_q(t^(1/p)), L♭=K♭ | k″=𝔽_q((t^(1/p))); v_k″(t)=p; purely inseparable compositum degree over perfect K♭ is1 | No false equality of inseparable and tilted extension degrees. |
| 4.2 constructed arrow directions | identity approximation; bad choice U=ℙ² for cubic Y | Actual f*:E→E is identity in H⁰; H¹(U)=0→E² cannot be inverted | Correct inverse restriction must use the cohomological tube. |
| 4.2 ambient square/product/unit | ℙ¹ and elliptic degree2 approximation | On hyperplane class, f*r_Y(h)=2h′=g*π*(h); on H⁰,1↦1; products h²=0↦0 | Correct square and ring normalization. |
| 4.2 Galois/Tate compatibility | top degree2d, residue size Q | Both top characters have geometric value Qᵈ; after twist(d), value1=1 | Nontrivial top character is carried, not replaced by an invariant scalar pairing. |
| 4.2 limits/rationalization | degree2 map, ℓ=2 | Maps mod2ᵐ are multiplication2; limit on ℤ₂ is2; rationalized map on ℚ₂ is2 and invertible | Finite coefficients need not give isomorphisms; rational statement correct. |
| 4.3 top isomorphism | d=0; degree2 map; disconnected source alteration | d=0 scalar1; d=1 scalar2≠0 in ℚ₂; disconnected target top rank2 allows1↦(1,1), nonzero but not onto | Both one-dimensional hypotheses and rational coefficients necessary. |
| 4.4/Lean injectivity | E=𝔽₂, p=q=xy,a=b=id,c=1; c=0 control | Pair equation xy=1·xy and kernels0; with a=b=0,c=0, equation0=0 but kernels=E | hc excludes false zero-map theorem. |
| 4.4/Lean complement | E=ℚ,G=S₃,a=b=diagonal E→E³,c=3 | q(a x,b y)=3xy; annihilator x₁+x₂+x₃=0; dimensions1+2=3; intersection0 since3x=0⇒x=0 | Nonabelian group test gives the asserted direct sum. |
| 4.4/Lean characteristic3 control | same diagonal model over 𝔽₃ | q(diag1,diag1)=3=0; diagonal lies in plane; intersection dimension1 | hc fails, so the false modular splitting is excluded. |
| 4.4/Lean stable annihilator | S₃ permutation; cyclic C₂ sign on first factor | Permutation preserves coordinate sum0; sign example q(g1,g1)=−1=χ(g)·1 | Stability holds with nontrivial top character. |
| 4.4/Lean zero ranks | U=U′=0,V=V′=E,c=1 | Both zero-domain maps injective; range0, annihilator V, dimensions0+1=1 | Zero module is correctly covered. |
| 4.4 graded application | H*(ℙ¹)→H*(elliptic curve) | A¹=0,B¹=E²; complement equation E²=0⊕E²; top scalar2 | Pairwise native signature genuinely gives the stated graded conclusion. |
| 4.5 geometric stable summand | same approximation, i=0,1,2,3 | Image dimensions1,0,1,0; complement dimensions0,2,0,0 | Claims all degrees without asserting a total cohomology isomorphism. |
| 4.6 toric WMC endpoint | Y=ℙ⁰,ℙ¹,ℙ²; Tate plane cubic | Weights respectively0; (0,2); (0,2,4); Tate H¹ grade weights0,2 with N rank1 | Degenerate and bad-reduction cases agree with the general theorem. |
| 4.7 product/projective examples | empty product; ℙ¹×ℙ¹; Fermat degree e prime to p | Point H⁰=E; product Betti ranks1,2,1 with eigenvalues1,(q,q),q²; Fermat derivatives e x_j^(e−1) have no common projective zero | Correct fan/product and good-reduction applications; p=2,3 retained when p∤e. |

All finite denominators in these tests are justified: Q≥2, c≠0, nonzero tame a, positive ramification/residue indices, and characteristic-zero E for logarithms, factorials and positive intersection degree. The only arbitrary-field theorem is §4.4, where c≠0 is explicit and no factorial occurs. Cohomological indices are integers in the prose; the pairwise Lean theorem avoids truncated natural subtraction. No polynomial-degree or out-of-range sequence lookup is used as a total-function shortcut.

### Library audit at the pins

The content checkout matches main `6ef1bbddc593bfbbf46976c005c598e0535c9426`. Its manifest and the actual library checkouts agree: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The paths below are relative to the corresponding pinned library root. These declarations were opened, not inferred from search names.

| Pinned file and line | Declaration or native body | Consequence for this review |
| --- | --- | --- |
| `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42`, `:59` | `Field.absoluteGaloisGroup` is `AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K`; `mapOfAlgebra` is a continuous homomorphism with scalar-tower assumptions | Supplies the topological group and restriction, not an automatic equivalence or injectivity. |
| `Mathlib/RepresentationTheory/Basic.lean:48` | `Representation` is `G →* V →ₗ[k] V` | Contains no continuity. Layer 0 adds it explicitly; §4.4 legitimately needs only algebraic actions. |
| `Mathlib/NumberTheory/Padics/PadicNumbers.lean:531`; `Mathlib/NumberTheory/Padics/PadicIntegers.lean:71` | `Padic`, `PadicInt`, with prime hypothesis | Native coefficients exist; residue characteristic and coefficient prime must remain distinct. |
| `Mathlib/RingTheory/Nilpotent/Exp.lean:50` | `IsNilpotent.exp`, the finite sum in a ℚ-algebra | Correct only with nilpotence; no replacement for Grothendieck's existence theorem. |
| `Mathlib/LinearAlgebra/PerfectPairing/Basic.lean:39` | `LinearMap.IsPerfPair` has bijectivity of the left and right adjoints | No Galois or top-character field is hidden in the native predicate. The theorem explicitly supplies them. |
| `Mathlib/LinearAlgebra/PerfectPairing/Basic.lean:163` | `LinearMap.IsPerfectCompl` bundles already-established complementary subspaces | Does not establish the nonzero-scalar, four-space splitting statement. |
| `Mathlib/LinearAlgebra/BilinearForm/Orthogonal.lean:309` | `LinearMap.BilinForm.isCompl_orthogonal_of_restrict_nondegenerate` | Requires a reflexive single-space form and a nondegenerate restriction. It is not the four-space theorem with equivariant maps. |
| `Mathlib/LinearAlgebra/Eigenspace/Basic.lean:442` | `Module.End.HasEigenvalue` means a nonzero eigenspace | Weights still require scalar extension and the separately supplied algebraic-number predicate. |
| `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:128` | `CategoryTheory.Abelian.Ext.comp` | Yoneda composition is native and correctly imported. |
| `Mathlib/Algebra/Homology/DerivedCategory/Ext/Map.lean:129`, `:223` | `CategoryTheory.Abelian.Ext.mapExactFunctor`, `mapExactFunctor_comp` | Exact additive functors preserve composition, with the stated Ext universes. §3.6's geometric/module-sheaf identification is the remaining application. |
| `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:56` | `CategoryTheory.Sheaf.H`, Ext from the constant integer sheaf | Abelian-group sheaves alone do not identify cup products in the fixed coefficient-module category. |
| `Mathlib/RingTheory/Perfection.lean:633`, `:789`, `:825` | `PreTilt`, `PreTilt.val`, `Tilt` as a fraction ring | A raw tilt carrier exists. It does not supply the perfectoid-field equivalence, analytic sites or functorial Galois comparison needed here. |
| `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:63`, `:75` | `Scheme.ellAdicSheaf`, `Scheme.EllAdicCohomology` | Native integral pro-étale cohomology is present; the normalized finite-dimensional geometric Galois/weight interface used by the headlines is not supplied by these definitions. |
| `TauCeti/NumberTheory/LocalField/Unramified/Inertia/Basic.lean:99`, `:146`, `:310` | `inertiaSubgroup`, `isClosed_inertiaSubgroup`, `IsArithFrobeniusLift` | Requires the nonarchimedean-local-field structure; the Frobenius convention is arithmetic. |
| `TauCeti/NumberTheory/LocalField/Tame/Character.lean:388`, `:401`, `:413` | Uniformizer independence, `inertiaTameCharacter` and its level formula | Positive Kummer ratio agrees with §0.2. |
| `TauCeti/NumberTheory/LocalField/Tame/Quotient.lean:387` | `TauCeti.IsArithFrobeniusLift.smul_eq_pow` | Arithmetic action is q, so the geometric inverse acts by q⁻¹; the T(2) and T(3) tests above use this inversion. |
| `TauCeti/NumberTheory/LocalField/Teichmuller.lean:63` | `teichmullerLift` is a zero-preserving multiplicative section | Appropriate for the finite uniformizer expansions; not a claim of an additive coefficient-field section in mixed characteristic. |
| `TauCeti/Geometry/Toric/Algebraic/AffineScheme.lean:128` | `affineToricScheme` is the spectrum of a complex monoid algebra | This complex affine-cone construction is not the arbitrary-local-field fan model and completed toric tower in §4. |

Object searches covered tame characters, monodromy operators/filtrations, scalar Weil weights, perfect pairings and orthogonal complements, Ext functoriality, tilts and perfectoid fields, geometric cohomology, tubes and toric models. There is no pinned implementation of the roadmap's relative marked-monodromy/purity interface in these libraries. No fully qualified collision with `TauCetiRoadmap.DeligneWeightsAndPurityPartII.duality_splitting` was found. The distinction between existing raw carriers and missing structured interfaces is essential; the docstring is not justified by saying that schemes, Galois groups or tilts do not exist.

### Supplier resolution and ownership

The supplied board-package index was read before any missing-object conclusion. Main roadmaps were read from the main checkout; new open-roadmap suppliers were read through the roadmap service at their heads. The service's leading provenance line is not included in the repository line numbers below. All section ranges in the package contracts were inspected. The table records the consumed object, not merely the roadmap name.

| Supplier and resolved repository locator | What is supplied; audit result |
| --- | --- |
| `TauCetiRoadmap/LocalFieldsRamification/README.md`, Layers 0, 1, 2, 4 | Finite local extensions, e/f, Eisenstein, Teichmüller, inertia, tame quotient and arithmetic Frobenius. The package inverts the convention consistently and never assumes the whole Kummer tower Galois. |
| `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:978`, `:1547`, `:1739`, `:1938`, §§1.5, 2.1a, 2.4, 2.6 | Field of definition, trait/local character, continuous local monodromy and centered filtration/purity. The Grothendieck input is imported there from SmoothRepresentationsOfLocalGroups §SR5.2; §2.4 specializes it to the required continuous representations. |
| `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:329`, `:929`, `:1015`, `:1058`, `:1111`, `:1173` | §§0.1, 1.1–1.5 provide the trait bridge, quasi-unipotent nearby cycles, twist, filtration and functoriality. Its scope imports the vector-space filtration from ArithmeticGaloisRepresentations, consistent with this package. |
| `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:752`, `:806`, `:878`, `:928`, `:952`, `:962`, `:1073`, `:2049`, `:2678` | §§0.1–0.19, 5.11, 7.15 contain scalar arithmetic, direct sums, powers, field comparison, curve purity and proper-smooth finite-field purity. The two incorrect secondary section numbers are R07. No curve tensor-power proof is planned anew. |
| `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:504`, `:522`, `:540`, `:629`, `:776`, `:854`, `:1089`, `:1120`, `:1200` | F.2.1–F.2.3, F.3/F.3a, F.4, 0.9, F.6 supply base change, finiteness, tame bridge, normalized realizations, Chern classes and smooth duality. F.4.6 explicitly supplies the action/restriction asked for in R02. F.10.2 and F.10.2b distinguish finite and adic Frobenius conventions. |
| `TauCetiRoadmap/PerfectoidSpaces/README.md:4042`, `:4292`, `:4355`, `:4453`, `:5713`, `:8424`, `:8478` | P1.6, P1.10–P1.15, P1.32a, P3.7–P3.8 contain functorial sharp, field criterion, tilt/residue, the ℚ_p tower example, finite-extension degrees and componentwise Galois action. R04 imports already-owned constructions; the finite-k coordinates and tame marking remain additions. |
| `TauCetiRoadmap/AdicEtaleGeometry/README.md:2142`, §A1.0.5 | Finite-étale invariance for henselian completion includes the topologically henselian Tate-ring form. Used with compatible closures, not as an unsupported assertion that every completion preserves Galois groups. |
| `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:5474`, §§R07.4.1–R07.4.3 | Kummer field of norms and Galois equivalence, including the p=2 sign. Norm(√ϖ)=−ϖ, while sharp(t)=ϖ; their reductions in characteristic 2 agree. |
| `TauCetiRoadmap/AdicSpacesPartII/README.md:7466`, `:7522`, `:8968`, `:9228`, `:9575`, `:9660` | R0.19.1–R0.19.2 and R1.3–R1.6 supply constructible/proconstructible topology and analytification/base-change/properness. No discretely-valued assumption is silently added to the coefficient field. |
| `TauCetiRoadmap/AdicSpacesPartIII/README.md:4615`, `:4986`, `:7480`, `:8158` | R2.3–R2.4, R2.8, R2.10 supply formal generic fibres, equation-defined rational tubes, proper comparison and valuation section domains. The package's generator-independent finite-ideal identification is a further target. |
| `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:91`, `:188`, `:278`, `:373`, `:490`, `:3548`, `:4780`, `:4842`, `:4898`, `:4941`, `:5099` | §§1.1–1.5, 8.2, 10.1–10.4, 11.1 contain module sheaves/Ext, pseudo-adic supports, limits, algebraic comparison and tame disc covers. Prime-to-p covers do not provide the p-divisible Kummer input in §3.3. The all-continuous-automorphism comparison is not stated explicitly; its named gap remains legitimate. |
| `TauCetiRoadmap/AnalyticToricGeometry/README.md`, Layer 0 | Complete regular projective fans for projective spaces and products. General-field toric models are supplied by the extension below, rather than inferred from the native complex affine model. |
| `packages/AnalyticToricGeometryPartII/design/README.md:468`, `:487`, `:504`, `:520`, `:560`, `:576`, `:598`, `:614`, `:630`, `:700`, `:716` | NT.0–NT.1 and NT.3–NT.6 were resolved against the available design: invariant models, complete-fan comparison, projection/open topoi, field naturality, cohomology and approximation. The projection and ambient cohomology targets explicitly carry field-automorphism compatibility. No package README was available; see Not verifiable. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md:755`, `:798`, `:848`, `:1508`, `:5528`, `:6038`, `:6372`, `:6653`, `:6701` | §§0.7–0.9, 0.23a, 4.11, 4.16, 4.19, 5.2–5.3 supply components/spreading, inseparable invariance, blow-ups, alterations and Chow/c₁ formulas. Alterations retain the finite constant-field extension; inseparable degrees are included. |
| `TauCetiRoadmap/StableReduction/README.md:468`, Layer 4 | The blow-up construction consumed through SchemeAndStackFoundations §4.11 is owned here, for finite-type ideals. The new tube/cohomological descent comparison remains §3.4's work. |
| `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:665`, `:818`, `:1155`, `:3259`, `:3312`, `:3380`, `:3534` | §§0.5–0.6, 1.3, 3.4–3.7 contain finite/rational perfect pairings, trace/degree, orientations and coefficient compatibility. Top character is E(−d), not the trivial representation; trace on ℙ¹ is +1. |
| `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:1228`, §A2.7 | General ample intersection positivity is already owned here, despite the broader roadmap title. This object-based search produces R03. |

The roadmap-service ownership searches included main and the exposed new-roadmap heads, searching objects such as weight–monodromy, nilpotent monodromy, Kummer/tilt Galois actions, direct summands/perfect pairings, cohomological neighbourhoods, ample intersection and toric approximation. The board packages were also searched. The readable indexed package heads AnalyticNumberTheory, ArithmeticStatistics, AutomorphicCongruences, KatoEulerSystems and LogicAndDefinabilityInNumberTheory added no competing owner for the retained constructions. The supplied named open-roadmap index was used; unrelated revisions of an existing main roadmap were not treated as suppliers. The inaccessible package-head paths are explicitly listed below, so this is not a claim to have excluded every possible conflict in unread files.

The retained relative monodromy datum, closed-subgroup purity detection, marked tame comparison, finite-ideal tube identification, strengthened neighbourhood interface and actual geometric comparison are distinct from the generic carriers above. This package can own those extensions. The earlier owners of unmarked tilting and ample positivity are R04 and R03. No duplicate fully qualified Lean declaration was found. No notion needed moving from a later supplier into this roadmap.

### Gap and dependency results

| Gap slug | Location and disposition |
| --- | --- |
| `huber-lutkebohmert-original-sources` | Plan only; no supplier and no matching exact-contract entry. R01. The three original texts remain settled uncertified, not newly requested. |
| `neighbourhood-derived-proof-inputs` | Plan only; no supplier. The README itself owns four explicit inputs at §3.4. R01 reconciles the obsolete gap with that ownership. |
| `geometric-galois-restriction` | Same slug in plan and README, named supplier, precise hypotheses; redundant with F.4.6. R02. |
| `analytic-comparison-automorphisms` | Same slug in plan and README: proper K-variety, completed algebraic closure C, every continuous K-automorphism, products and reductions. This is one naturality contract, with product/coefficient compatibility, not unrelated compound demands. No duplicate explicit contract was located in the cited sections. |
| `ample-top-intersection` | Same slug in plan and README, precise hypotheses; earlier owner found in A2.7. R03. |

The prescribed dependency command completed successfully. Its complete output was:

```text
depcheck: 50 roadmaps, 588 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Relevant merge-order positions are EtaleCohomologyFoundations 19, PerfectoidSpaces 13, AbelianSchemesAndArithmeticModuli 47, ArithmeticGaloisRepresentations 48, DeligneWeightsAndPurity 92, AnalyticToricGeometryPartII 178, and this roadmap 180. The repairs above introduce no upward supplier. This order check does not excuse the internal forward edge in R09. All 30 individual Needs lists and five layer dependency lists were checked against the supplier ledger; no additional unowned prerequisite was identified beyond R01.

### Headline signatures and padding probes

| README headline | Lean treatment and assessment |
| --- | --- |
| §§0.5–0.10: closed-subgroup detection, transport, stable summands, finite-extension invariance, good reduction | Named in the docstring. The marked monodromy datum and monodromy-grade weight interface are missing; building them is substantial work, not a simple native predicate omitted for convenience. |
| §§1.1–1.2: Deligne over curve local fields, and all places of global function fields | Named in the docstring; needs normalized lisse geometric cohomology with monodromy and weights. |
| §§2.1–2.5: coordinate tilt, marked Galois equivalence and transfer of purity | Named in the docstring; raw `Tilt` does not provide these completed-tower, perfectoid and marked interfaces. R04 reduces duplicate ownership, not the need for the missing formal interface. |
| §§3.2–3.5: local constancy, punctured-disc Riemann existence, neighbourhood theorem and Galois-stable all-power form | Named in the docstring; analytic/pseudo-adic sites, supports and derived direct images are missing. R05 requires the uniform endpoint also to be named after repair. |
| §3.6: cup compatibility for the actual site pullback | The algebraic Ext-composition assertion is already native; its geometric application needs the module-sheaf/site realization supplied in the README. It is not a separate missing native headline or a substitute theorem. |
| §§4.1–4.3: approximation, multiplicative equivariant map and top-degree isomorphism | Named in the docstring; the actual toric, tube and algebraic–adic comparison objects are missing. |
| §4.4: equivariant Poincaré splitting | Stated as `duality_splitting` on native finite-dimensional modules and perfect pairings. Degreewise specialization gives exactly the graded result, including a nontrivial top character. It is not a weakened scalar identity. |
| §§4.5–4.7: geometric stable summand, Scholze's toric theorem and projective-space/product applications | Named in the docstring; needs the actual comparison, general-field fan toric model and geometric weight–monodromy predicate. |

`lake env lean` on the authored absolute filename, run from the content checkout as prescribed, exited 0. Its only warning was the `sorry` at `Suggested.lean:47:8`. The file has one theorem, zero definitions/instances/opaques, one `import Mathlib`, no Tau Ceti imports, no `set_option`, and no admitted examples. Thus no targeted Tau Ceti build was necessary.

A separate scratch copy appended `#check @TauCetiRoadmap.DeligneWeightsAndPurityPartII.duality_splitting` and elaborated successfully. Every field/group/module, finite-dimensionality, perfect-pairing, c≠0, intertwining and top-character hypothesis occurs in the resulting signature. There are no section binders to lose, and no signature change was needed. The first annihilator is correctly `ker ((q.flip.comp b).flip)`, a subspace of V, not of V′.

Separate scratch copies replaced the only `sorry` by `simp`, `rfl` and `infer_instance`. All three failed to close the theorem. The first left goals, the second found no reflexive relation, and the third found no class goal. The native perfect-complement structure and orthogonal-complement theorem opened above are not single-lemma proofs of this statement. There is no padding finding. All Lean commands completed; none was left running.

## Not verifiable

- HUB98, Theorems 2.1 and 3.6(a), and Definition 1.4, could not be checked in the original. The manifest settles this work as uncertified. ITO20 §1.2 and Theorem 4.5 were read for the recalled consequences; this does not certify the original oc-quasi-constructibility definition or omitted hypotheses.
- LUT93, Theorem 2.2, could not be checked in the original. It remains settled uncertified; ITO20 lines 103–106 were read for the Kummer-trivialization form used here. No new access request was made.
- HUB96, Theorems 3.7.2 and 3.8.1, could not be checked in the original. They remain settled uncertified. The supplier statements and SCH12 Theorem 9.7 were checked; they do not amount to reading the book.
- AnalyticToricGeometryPartII's cited NT targets were readable in `packages/AnalyticToricGeometryPartII/design/README.md`. A package README/main-or-open-head roadmap copy was not available through the supplied index/service. The field-naturality clauses are present in the design; their retention in a later package cannot be certified here. This is not reported as a nonexistent roadmap or an unowned target.
- Fifteen indexed board-head README requests returned HTTP 404: ArithmeticLocallySymmetricSpacesPartII; CompletedCohomologyAndLocalGlobalCompatibilityPartII; CrystallineCohomologyPartII; EndoscopicTransferAndUnitaryTraceComparisonPartII; HigherHidaAndColemanTheory; LawrenceVenkateshMethod; OrdinaryAutomorphicFormsAndModularityLiftingPartII; PELModuliPartII; PadicHodgeTheoryPartII; PadicLocalLanglandsForGL2QpPartII; RealSurfacePeriodIndex; SchemeAndStackFoundationsPartII; ShimuraVarietiesPartII; VStackSheavesAndLisseCategoriesPartII; VectorBundlesAndIsocrystalsPartII. Ownership against those unread package-head files was not verified. No missing-owner finding relies on those failures.

## Source issues

- **Misprint** in SCH12 at Proposition 9.1, printed p. 307 (line 2524): the source says the exponential uses a tame character evaluated at an unbound g; it should be evaluated at the quantified σ; affects nothing.
- **Gap** in SCH12 at the proof of Theorem 9.6, printed p. 309, and Lemma 9.9, printed p. 311 (lines 2609, 2647): the source says a smooth projective alteration has a one-dimensional geometric top group; it should be chosen geometrically connected after a finite extension, since an integral alteration can acquire several geometric components; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "4c08cd9bafebba08ecd2b1beaaf7f21cf68927cb", "job": "REV-PKG-DeligneWeightsAndPurityPartII", "model": "gpt-6-astra", "worker": "chris-7"} -->
