<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1067#issuecomment-6398680045 -->
Red team round 1 pass b (claude) of 7e4f54f

Verdict: needs changes

1. **F01** (P2) gap:toric-field-fibres asks ShimuraCompactifications for regular-fan smoothness it already provides, inside a compound contract

   Location: `README.md:55` ("What ShimuraCompactifications must provide (gap:toric-field-fibres): Export normal geometrically integral field fibres ..., their distinct codimension-one ray orbit closures, and regular-fan smoothness over every coefficient ring"); same text in `design/plan.json` gaps[0].

   Claim: the three clauses are missing from the supplier.

   Witness: ShimuraCompactifications C0.10 (`regularCoordinateIso`, open head 63e3f03) gives, for every regular cone and every commutative ring `R`, the chart algebra iso `A_σ ≅ R[x_1,…,x_r, y_1^{±1},…,y_{n−r}^{±1}]`, and C0.16 glues these charts; smoothness of a polynomial–Laurent algebra over `R` is library-level at the pin (`Mathlib/RingTheory/Smooth/Basic.lean`, `instFormallySmoothMvPolynomial` and `FormallySmooth.of_isLocalization`). So "regular-fan smoothness over every coefficient ring" is a one-line consequence of C0.10 + C0.16, not a gap. The remaining two clauses (normality and geometric integrality of field fibres for arbitrary fans; distinctness and codimension one of the ray orbit closures) are genuinely absent from C0 and are two unrelated statements bundled in one `needs`.

   Repair (README line 55 and plan.json gaps[0].needs, same words): "What ShimuraCompactifications must provide (gap:toric-field-fibres): For every field k and finite rational fan Σ, export that X_{Σ,k} is normal and geometrically integral, and that the closures of the codimension-one ray orbits are pairwise distinct codimension-one points, compatibly with the C0.16 chart gluing and coefficient change." Then in `README.md:53` add after "C0.18 supplies the regular boundary's integral chart description.": "C0.10 supplies the regular chart coordinates R[x_1,…,x_r,y^{±1}], hence smoothness of X_{Σ,R} over every ring R for regular Σ." Tested on the instance: positive ray over R = ℤ/4 — C0.10 gives (ℤ/4)[x], smooth over ℤ/4; nothing is asked of the supplier for it.

2. **F02** (P3) §0.1 cites C0.6–C0.7 for the face projections and off-face ideals; those are C0.1 and C0.4–C0.5

   Location: `README.md:53` ("C0.6–C0.7 supply face projections and off-face ideals for closed strata, with their coefficient change") and `README.md:117`, `README.md:135`, `README.md:248`.

   Claim: C0.6–C0.7 supply the face projection and the off-face ideal.

   Witness: at head 63e3f03, C0.6 is "Coefficient change commutes with face restriction" and C0.7 is "The face ideal commutes with coefficient change" (both are compatibility statements); the face projection is C0.1 ("The integral face projection"), the off-face ideal is C0.4 ("The monomial ideal of the face complement"), the stratum quotient is C0.5.

   Repair: in line 53 write "C0.1 and C0.4–C0.5 supply face projections, off-face ideals and stratum quotients for closed strata; C0.6–C0.7 supply their coefficient change;" and in the `*Needs:*` lines of §0.1 and the Layer 0 Dependencies replace "C0.6–C0.7" by "C0.1, C0.4–C0.7".

3. **F03** (P3) the ℙ¹ instance of the perfectoid toric tower is already constructed by PerfectoidTowers P8.19 and is not cited

   Location: `README.md:327` (§2.1, TΣ,K and pr_n), `README.md:452` (§3.2), ℙ¹ Checks at `README.md:269`, `README.md:340`, `README.md:458`.

   Claim: TΣ,K with the φ_p-tower is built here for every fan; the ℙ¹ fan is used only as a Check.

   Witness: PerfectoidTowers (merge order position 18, an allowed supplier) P8.19 "good towers" states `PerfectoidSpace.goodTower_frobenius_P1` (the tower ℙ¹ ← ℙ¹ ← ⋯ with T ↦ T^p and its perfectoid limit) and P8.15 states `PerfectoidSpace.projectiveLine_perfectoid_charts` (two perfected-disc charts glued along the perfected Laurent chart), both citing SCH12 Theorem 8.5(ii); that is TΣ,K for the ℙ¹ fan and the §3.2 tilde-limit for it, built by an earlier roadmap without being named here.

   Repair: add to "Exact supplier contracts" a subsection "### From TauCetiRoadmap.PerfectoidTowers — P8.15 and P8.19 construct the ℙ¹ Frobenius tower `goodTower_frobenius_P1` and its perfectoid projective line with charts `projectiveLine_perfectoid_charts`; §2.1 and §3.2 specialise to it on the ℙ¹ fan and state the agreement; they do not rebuild it." Add to §2.1 API: "For the ℙ¹ fan, TΣ,K is the PerfectoidTowers P8.15 perfectoid projective line, chart by chart." Add "PerfectoidTowers P8.15, P8.19" to the `*Needs:*` lines of §2.1 and §3.2. Tested on the instance: the two P8.15 charts are K⟨t^{1/p^∞}⟩ and K⟨t^{−1/p^∞}⟩ glued along K⟨t^{±1/p^∞}⟩, which are exactly §2.1's charts for the rays +1, −1 and the zero cone.

4. **F04** (P3) the hypothesis "degree-zero piece K" in gap:homogeneous-cone-approximation is unused

   Location: `README.md:71` and `README.md:400` ("with a linear Z[1/p]-grading and degree-zero piece K"), plan.json gaps[2].

   Claim: the homogeneous sharp estimate needs the degree-zero piece to be K.

   Witness: SCH12's proof (SCH12 line 1763–1812) uses only the grading (homogeneous components of degree d − di), the identification R°/ϖ ≅ R♭°/ϖ♭ compatible with the grading, and the rational-subset lemma; nothing about degree zero. Instance where the hypothesis fails but the estimate holds: the positive-ray fan with D = 0 gives R_D = K⟨t^{1/p^∞}, z^{±1/p^∞}⟩ graded by the z-exponent, degree-zero piece K⟨t^{1/p^∞}⟩ ≠ K; this is the Laurent variant of P1.30, where the same proof applies verbatim.

   Repair: delete "and degree-zero piece K" from both README lines and from plan.json gaps[2].needs; in §2.4 (line 400) replace "When Σ is complete R_D has degree-zero part K and satisfies the exact hypotheses of the PerfectoidSpaces P2.1 homogeneous-cone contract" by "R_D satisfies the hypotheses of the PerfectoidSpaces P2.1 homogeneous-cone contract for every Σ; when Σ is complete its degree-zero part is K." Keep the complete-fan Check at line 410.

5. **F05** (P3) the cited transport of linear equivalence to sheaf isomorphisms carries an unstated Noetherian hypothesis

   Location: `README.md:43` ("The native `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.nonempty_iso_sheaf_of_linearlyEquivalent` in the same sheaf module transports linear equivalence to an isomorphism of divisor sheaves").

   Claim: the declaration applies under the hypotheses just listed for `sheaf` (integral, locally Noetherian, DVR stalks).

   Witness: at Tau Ceti pin a91d3aa, `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Sheaf.lean` line 565 opens `variable [IsNoetherian X]` before the theorem at line 642; `WeilDivisor.OrderSystem.ofScheme` (`Principal.lean` line 126) also requires `[IsIntegral X] [IsNoetherian X]`.

   Repair: in line 43 write "... transports linear equivalence to an isomorphism of divisor sheaves; it additionally requires `IsNoetherian X`, which the finite-type field fibres satisfy." Tested on the instance: X_{Σ,k} for a finite fan is of finite type over k, hence Noetherian.

Scope of this pass: the whole `packages/AnalyticToricGeometryPartII/README.md` (759 lines, 29 targets), the whole `Suggested.lean` (48 lines, zero declarations), `sources.toml`, `metadata.toml`, the `gaps` list of `design/plan.json`; every supplier citation resolved on main or at the open head the brief gives; every cited Tau Ceti and Mathlib declaration read at the pinned commits; every SCH12, FS94, FS25 and STACKS locator opened. No Lean was run (the file declares nothing). Pass a was not read.

## Verified sound

Counts: Suggested.lean declarations read 0 (the file declares nothing; its docstring names the eight headline groups and the missing carriers, all confirmed absent at the pins below); README targets read 29 of 29 (plus Conventions, Scope, both Examples blocks, Worked examples); locators opened 29 (SCH12 17, FS94 9, FS25 2, STACKS 3 — all at the stated printed pages; `uncertified` none); Checks tested 102 (every Check bullet in the file, each recomputed; none false, vacuous or a restatement); sibling citations checked 74 section headers resolved, 31 of them read in full (ShimuraCompactifications C0.1–C0.18 at head 63e3f03; WeilConjectures WC.6 at d90e186; AbelianSchemesAndArithmeticModuli A2.7 at 71ecc01; ClassicalAdicEtaleCohomology 1.1, 6.2, 8.2 at dfcb6b7; on main: PerfectoidSpaces P1.30, P2.1 (homogeneous approximation lives inside P2.1), P2.2–P2.3, P2.9–P2.12, P3.18, P3.20, P7.1–P7.4, P7.11–P7.15; AdicSpacesPartII R0.19.1–R0.19.3, R0.20.1, R1; AdicSpacesPartIII R2.2–R2.4, R2.8, R2.10; AdicEtaleGeometry A1.6; SchemeAndStackFoundations 0.7, 0.17–0.18, 0.23a, 0.29, 2.1–2.2, 3.4, 4.13, 5.1–5.6, `Chow.gysin`, `excess_intersection`; EtaleCohomologyFoundations F.2.3; AnalyticToricGeometry Layer 0 and Layer 5 item 3; AdicSpaces §§2–5 is on main). Every cited section exists and states what the README attributes to it, with R02 and R05 the only mismatches. Pinned declarations: all 12 Tau Ceti names exist at a91d3aa in the files named (hypotheses of `SchemeWeilDivisor.sheaf`: `IsIntegral`, `IsLocallyNoetherian`, DVR stalks — as the README says; see R05 for the extra binder); all 5 Mathlib names exist at 6b7abb3 in the files named (`PointedCone` is in `Mathlib/Geometry/Convex/Cone/Pointed.lean`, `Salient` in `.../Cone/Basic.lean`). Consumers DeligneWeightsAndPurityPartII and MotivesAndAlgebraicCyclesPartII exist as board packages (merge order 182, 222, both later than this roadmap at 180). Gaps: the seven slugs in README match plan.json `gaps` one for one; suppliers `none`: none; each supplier is earlier in the order. Policy: no `lemma`, no `set_option`, no pull-request numbers or process words in README or docstring; `#check` none; the only backticked names are supplier or library names; the pull request changes only the package folder plus its reports. No earlier repair report marks anything `not actionable`.

Dependency gate output (run on the head, no edits made):

    depcheck: 52 roadmaps, 592 edges, 0 problem(s)

"Not statable" audit of the headline list: at Tau Ceti pin a91d3aa there is no perfectoid ring or field, no tilt, no formal scheme or admissible formal model, no analytification, no adic étale site (grep over `TauCeti/` for Perfectoid, Tilt, FormalScheme, Analytification, smallEtale: 0 files each); the only toric scheme is `Fan.algebraicRealization` over ℂ, and the only adic carriers are `AdicSpace`, `Spa` polydiscs and Laurent covers. So Theorems 1.5, 8.5(i)–(v), 8.6, 8.7 and 8.8 are not statable, and the integral/field-fibre Layer 0 statements are statable only over ℂ, which would narrow the README's generality (a stand-in). The empty file is correct.

Adversarial table (one row per statement; instance → values on each side → result):

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conventions, signs | ℙ¹, rays +1 (zero), −1 (∞), D = dD₋ | div(t) = ⟨1,1⟩D₊ + ⟨1,−1⟩D₋ = D₊ − D₋; W(dD₋) = {u ≥ 0, −u ≥ −d} = [0,d]; m₊ = 0, m₋ = d; frame ratio 1/t^d = t^{−d} | consistent with 0.2, 0.5, 2.3, 6.1 |
| Conventions, ℤ[1/p] | p = 2 | 1/2 ∈ ℤ[1/2], 1/3 ∉ | ok |
| Conventions, sharp | p = 2 mixed char | 1+1 = 0 in K♭, 1♯+1♯ = 2 ≠ 0 in K | ok; §3.4 Check 3 agrees |
| 0.1 invariant divisors | ℙ¹; zero cone; 2D₊ vs D₊ | coefficients (1,−1); no rays, group 0; 2 ≠ 1 | ok |
| 0.2 W_σ(D) = m_σ + P_σ | ℙ¹ σ₋, D = dD₋; D = −D₋ | m₋ = d, P = ℤ≤0, W_σ = (−∞, d]; global W = ∅ | ok |
| 0.3 S_A(D) | A = k[ε]/ε², D = 0 on ℙ¹; A = 0 | W(0) = {0}, S = A ∋ ε; module 0 | ok; S(D)⊗S(E) → S(D+E) is 4 → 3 for D = E = D₋, so not iso as stated |
| 0.4 invariant representatives | x² on A¹; t on G_m; t − a on ℙ¹ | order 2 kept; div = 0; [a] − D₋ | ok; needs Cl(T) = 0 (gap:split-torus-divisors) |
| 0.5 O(D) frames | O(dD₋) on ℙ¹; D = 0; f ↦ cf | weights 0, d; transition t^{−d}; trivial; locus unchanged iff |c| = 1 | ok |
| 0.6 presentation | ℙ¹; rank-one zero cone; rays (1,0),(1,2) | u ↦ (u,−u), Cl = ℤ; ℤ → 0, Cl = 0; image {(x,y): y ≡ x (2)}, index 2, Cl = Pic = ℤ/2 | ok; torsion needs incompleteness, as stated |
| 1.1 unit model | positive ray; zero cone; ℙ¹; (1+ϖt)(1−ϖt) | closed disc; unit torus |t| = 1; two discs glued on |t| = 1; Gauss norm 1 = 1·1 | ok |
| 1.2 comparison | t = ϖ⁻¹ on A¹; complete ℙ¹; WC.6 fan | |t| > 1 in A^an, not in unit model; charts cover; proper, nonprojective (three primitive relations, FS25 line 319) | ok |
| 1.3 φ_q | q = 1; q = 0; p = 2, 𝔽₄ | identity; t ↦ 1, stratum not preserved; a ↦ a vs a ↦ a+1 | ok; φ_q^*D_i = qD_i checked on the ray chart |
| 2.1 TΣ,K | positive ray; zero cone; rank 0 | K⟨t^{1/p^∞}⟩; Laurent perfected; Spa(K,K°), pr_n = id; (φ∘pr_{n+1})^*χ^u = χ^{pu/p^{n+1}} = pr_n^*χ^u | ok |
| 2.2 Ŝ(D) | ℙ¹, D = D₋; complete fan D = 0; p = 2, D = (1/4)D₋ | index ℤ[1/p]∩[0,1]; weight 0 only, module K; squaring (1/4)→(1/2)→1 | ok |
| 2.3 Q_D | ℙ¹, D = D₋; complete D = 0; positive ray D = 0 | 0 ≤ u ≤ j; {0}×ℤ[1/p]; degree 0 = ℤ[1/p]≥0 | ok |
| 2.4 R_D | ℙ¹, D = D₋; complete D = 0 | (u,j) ↦ (u,j−u) sends generators (0,1),(1,1) to (0,1),(1,0): perfected quadrant graded by total degree; Laurent algebra with degree-zero K | ok; see R04 |
| 3.1 tilt | positive ray; zero cone; rank 0 char p | K♭⟨t^{1/p^∞}⟩; Laurent; identity | ok (SCH12 line 2415) |
| 3.2 tilde-limit | disc tower | level n monomial t ↦ t^{1/p^n}; transition multiplies exponent by p | ok; P7.15 hypotheses (qcqs locally noetherian levels) hold for K⟨P_σ⟩ |
| 3.3 homeomorphism | ℙ¹: x = 0, ∞; char p | constant towers; (x^{1/p^n})_n unique | ok; char-p φ_p = absolute Frobenius ∘ (coefficient Frobenius)⁻¹, a homeomorphism |
| 3.4 π | [λx] ; line x₀+x₁+x₂ = 0, p = 2 | λ♯ cancels; [1:1:0]: 1+1 = 0 in K♭, 1♯+1♯ = 2 in K | ok |
| 3.5 topoi | rank 0; char-p torus t^{1/p}; ℙⁿ | finite étale = products of K; purely inseparable, no new covers; Theorem 1.13 | ok |
| 3.6 restrictions | U = ∅, U = all; U = {|t−ϖ| ≤ |ϖ|²}; ℙ¹ ∖ ∞ | empty topos; t = ϖ ∈ U, |ϖ^p − ϖ| = |ϖ| > |ϖ|²; φ⁻¹(∞) = {∞} | ok |
| 3.7 affine line | t = ϖ⁻¹; x = 0, 1 | retained; constant towers | ok |
| 4.1 φ_p* automorphism | ℙ¹, p = 2, ℓ = 3, m = 1; ℓ = p; rank 0 | on (Λ,0,Λ): 1, 0, ×2 (2 ∈ (ℤ/3)^×); ×p = 0 on ℤ/p; H⁰ = Λ | ok; smoothness used for RΨΛ ≅ Λ, as SCH12 line 2446 assumes |
| 4.2 π* iso | ℙ¹, p = 2, Λ = ℤ/3 | transitions 1 ↦ 2 ↦ 1 ↦ 2, colimit Λ, level-zero map iso | ok |
| 5.1 tubes | f = t, c = 1; f = t²; ϖf; s = 0 | |t| ≤ |ϖ|; exponent 2c keeps radius; c ↦ c−1; whole space | ok; ∩_c N_c = Y^an because |ϖ(x)| is cofinal at analytic points |
| 5.2 approximation | f = χ^u; p = 2, f = ϖ²χ^u, c = 0, ε = 1/2; a + b t^{1/p} | g = χ^u, error 0; g = 0 allowed since |ϖ|² ≤ |ϖ|^{1/2}, excluded at c′ > 2 where |ϖ|^{5/2} < |ϖ|²; (a + b t^{1/p})^p = a^p + b^p t ∈ O(pD₋) | ok; equality of maxima from |ϖ|^{1−ε} < 1 |
| 5.3 hypersurface | line in ℙ², class O(p^N); f²; WC.6 divisor; rank 0 | O(p^N) ≠ O; class and exponent double; nonzero class survives ×p^N; no input | ok; nonemptiness needs only O(p^N D) ≇ O, which holds for any nonzero effective D on a proper integral X |
| 6.1 MW^j | ℙ¹ codim 0; ℙ¹×ℙ¹ codim 1; (1,0,0,0); O(D₋); Spec ℂ/ℝ | row [1,−1]; rows [1,0,−1,0],[0,1,0,−1]; balance (1,0) ≠ 0; m₋ − m₊ = 1 = c·b₊, degree +1; D_X(1) has image 2ℤ | ok |
| 6.2 displacement | ℙ¹×ℙ¹; rays (1,0),(1,2); rank 0 | O(a,b)·O(c,d) = ad + bc, O(2,0)·O(1,1) = 2, O(1,0)² = 0; index 2; empty product 1 | ok |
| 6.3 δ > 0 | two fibres on ℙ¹×ℙ¹; (ℓ,ℓ) on ℙ²; c = 0; x^p − t over 𝔽_p(t) | class (2,0), degree 2 against O(1,1); excess bundle O(1)|_L, degree 1; deg H^n > 0 (1 in rank 0); degree p | ok |
| 6.4 approximation | two fibres; c = 0; two equal lines; 𝔽_p(t) | dim 1 output, disconnected allowed; Z₀ = X; excluded (c ≠ codim); length 1 vs p after t^{1/p} | ok |

Sources against the text: SCH12 Theorem 8.5 is for every fan (line 2414) and the roadmap's Layers 1–3 keep that generality; Proposition 8.6 and 8.7 assume proper smooth (lines 2446, 2458) and Corollary 8.8 projective smooth (line 2496) — Layers 4–6 carry exactly these hypotheses; Lemma 6.5 allows rational c ≥ 0 and any ε > 0 (line 1755), so the gap's "rational c" is Scholze's generality while P2.1 on main restricts to c ∈ ℤ[1/p]; FS94's m_{ρ,σ} is the generator of M(σ) nonnegative on ρ (line 205) and the roadmap's b_{ρ,σ} agrees; FS25 Example 4.1 gives the seven rays and ten maximal cones that WC.6 uses, and the three primitive relations at line 319 are the ones quoted in WC.6.

## Not verifiable

- The section numbers under which DeligneWeightsAndPurityPartII and MotivesAndAlgebraicCyclesPartII cite this roadmap: their board packages exist but only their `design/` folders are in this checkout, so the consumer side of "Downstream consumers" was not checked.
- gap:operational-chow-finite-orbits over an arbitrary field with split orbit strata (Totaro-style Kronecker duality): no Tau Ceti, Mathlib or roadmap text states it, and the cited FS94 Proposition 1.4 is over ℂ; the gap is declared, so this is recorded, not raised.
- Ownership against open pull requests other than the 52 sibling checkouts the brief lists and the `roadmaps grep` index of 2026-10-25: the index was searched for Minkowski weights, fan displacement, perfectoid toric spaces and Theorem 8.5; only PerfectoidTowers (R03) overlaps; the TropicalAndBerkovichArithmetic head (§4.0) builds Berkovich analytifications of small-fan schemes, a different carrier, and consumes ShimuraCompactifications C0.16 like this roadmap.
- No Lean was elaborated: `Suggested.lean` has no declarations, so the `#check` sweep is vacuous ("not built").

## Source issues

- **Misprint** in FS94 at equation (2.3), p. 7 (FS94 line 235): the source says u(ρ) − u(ρ′) = c(σ)·m_{ρ,σ} with c(σ) the degree of L on V(σ), while pointing to Fulton §3.4 for the u(ρ); with Fulton's convention ⟨u(ρ),v_i⟩ = −a_i this gives c = −deg on ℙ¹ (L = O(D₋): u(ρ₊) − u(ρ₋) = 0 − 1 = −1 = c·1); it should be u(ρ′) − u(ρ) = c(σ)·m_{ρ,σ}, or the u(ρ) read as local-equation weights; affects nothing (README §6.1 already uses the degree-consistent reading and pins it by the ℙ¹ value +1).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "7e4f54f", "job": "RT-AnalyticToricGeometryPartII~1b", "model": "fable", "worker": "fable-rt35"} -->
