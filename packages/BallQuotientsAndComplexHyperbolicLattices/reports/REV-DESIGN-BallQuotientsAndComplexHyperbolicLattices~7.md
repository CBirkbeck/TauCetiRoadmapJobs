<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/14748#issuecomment-6896918754 -->
Review (claude) of 5ecc999

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §11.2 cites the Godement criterion for a form the source does not state

   **Location.** `packages/BallQuotientsAndComplexHyperbolicLattices/design/README.md:831`: "is cocompact if and only if 𝐆 is ℚ-anisotropic (WitteMorris2015 Theorem 5.1.11, line 3676, for the lattice property of 𝐆(ℤ), and the Godement criterion, Proposition 5.3.1, line 3909 to line 3911"; `design/plan.json`, target 11.2, locator.

   **Claim.** The cited proposition states the criterion with ℚ-anisotropy.

   **Witness.** WitteMorris2015 line 3909 to line 3911 states: G/G_ℤ is compact exactly when G_ℤ has no nontrivial unipotent element. Anisotropy does not occur there. The form with the ℚ-rank is WitteMorris2015 Theorem 2.2.4, line 1217, with Definition 9.1.4, line 8344 to line 8347.

   **Repair.** Replace the parenthesis's second clause by: "and the Godement criterion, Proposition 5.3.1, line 3909 to line 3911, in its unipotent form (G/G_ℤ is compact exactly when G_ℤ has no nontrivial unipotent element); Theorem 2.2.4, line 1217, with Definition 9.1.4, line 8344 to line 8347, for the form with the ℚ-rank, which is 0 exactly when 𝐆 is ℚ-anisotropic". Give plan target 11.2 the same locator and add "Theorem 2.2.4; Definition 9.1.4" to WitteMorris2015's `locator` in `sources.toml` and to the README References. Tested on the first Check of §11.2: SL₂(ℤ) contains the unipotent [[1,1],[0,1]], SL₂ has ℚ-rank 1, and the quotient is noncompact, so the two forms agree there. The statement itself is unchanged; it rests on AdelicAlgebraicGroups §3.4, which states the anisotropic form (`TauCetiRoadmap/AdelicAlgebraicGroups/README.md:3336`).

2. **F02** (P3) the toroidal compactification of ShimuraCompactifications is not named in the scope, and the downstream bullet describes comparisons that roadmap does not contain

   **Location.** `design/README.md:941`: "**ShimuraCompactifications**: in the rank-one unitary case, the toroidal compactification of Layer 8 and the minimal compactification S*_Γ of Layer 9 are the targets of its boundary comparisons"; `design/README.md:17` (Scope, "The arithmetic theory").

   **Claim.** The scope names every roadmap that builds an object this one also builds, and the bullet describes ShimuraCompactifications as it is.

   **Witness.** ShimuraCompactifications (open, merge order line 163, after this roadmap's place) Layer 2, README:1143, builds Pink's toroidal compactification of every pure Shimura variety as a complex analytic space. For Γ = Γ_a^eff of §11.3 with neat K_f this is X^M of §8.2. Its README has no occurrence of "ball", "PU(" or "Picard modular": it states no comparison with Layer 8.

   **Repair.**

   - Scope, "The arithmetic theory", add: "Pink's toroidal compactification of a pure Shimura variety, with its map to the Baily–Borel compactification, is ShimuraCompactifications Layer 2; the toroidal compactification of Layer 8 differs in being built from the cusp charts of §8.1 for every neat lattice of PU(1,n), arithmetic or not, and this roadmap states no comparison of the two (§11.4 compares the minimal compactifications only)."
   - Downstream consumers, replace the bullet by: "**A later part of ShimuraCompactifications, for the rank-one unitary case**: for an arithmetic Γ_a^eff of §11.3 with neat K_f it can identify X^M of §8.2 with the corresponding component of Pink's toroidal compactification (ShimuraCompactifications Layer 2) and the contraction X^M → S*_Γ of §9.4 with its map to the Baily–Borel compactification, through §11.4; Mok2012 Theorem 1 (line 476) is the non-arithmetic toroidal model. ShimuraCompactifications itself does not consume this roadmap."

   Tested on the witness: with the clause the scope names both builders of the space and says how they differ, and the bullet no longer attributes a comparison to a README that lacks it. Ownership is unchanged: this roadmap is earlier in the merge order and owns X^M for lattices of PU(1,n); the comparison is the later roadmap's.

3. **F03** (P3) the Summary promises abelian varieties; §8.2 states complex tori

   **Location.** `design/README.md:3`: "the toroidal compactification of a neat quotient by abelian varieties"; `design/README.md:609` (§8.2): "whose connected components T_{b₁}, …, T_{b_m} are complex tori of dimension n − 1".

   **Claim.** What the Summary promises is a target.

   **Witness.** "abelian variet" occurs once in the README, in the Summary. §8.2 and plan target 8.2 state complex tori; projectivity appears only in a Check for n = 2, where T_b is an elliptic curve. Mok2012 line 548 to line 550 states abelian varieties.

   **Repair.** Either (a) in the Summary write "by complex tori with negative normal bundle", which is what §§8.1–8.2 state; or (b) add to §8.2: "each T_b is an abelian variety, because L_b⁻¹ carries a Hermitian metric of positive curvature (4π/τ)i∂∂̄|u|² (§8.1)", with a named supplier for the passage from a positive line bundle on a complex torus to a projective embedding in its *Needs:* line and the same sentence in plan target 8.2. Tested: under (a) the Summary and §8.2 agree for n = 3, where T_b = ℂ²/Λ_b is not automatically projective as a bare torus; under (b) the curvature sign is the one computed in §8.1 (μ has curvature −(4π/τ)i∂∂̄|u|², so the dual is positive).

4. **F04** (P3) §9.5 Check: "isolated fixed points" also describes points with smooth image

   **Location.** `design/README.md:708`: "A cocompact lattice with torsion gives a normal projective S*_Γ = S_Γ, singular at images of isolated fixed points when n ≥ 2."

   **Claim.** The image of an isolated fixed point is singular for n ≥ 2.

   **Witness.** n = 2, Γ_x = {1, r₁, r₂, r₁r₂} with r₁ = [diag(1, −1, 1)], r₂ = [diag(1, 1, −1)]: r₁r₂ acts by w ↦ −w and has 0 as its isolated fixed point, yet the quotient has coordinates (w₁², w₂²) and is smooth. For {1, w ↦ −w} alone the quotient is the quadric cone (§7.1 Checks).

   **Repair.** Write: "singular, when n ≥ 2, at the image of every point x with Γ_x ≠ 1 acting freely on a punctured neighbourhood of x (for Γ_x = {1, w ↦ −w} and n = 2 the quadric cone of §7.1); a point that is the isolated fixed point of one element only can have a smooth image: for the group generated by the reflections [diag(1, −1, 1)] and [diag(1, 1, −1)] the quotient near 0 has coordinates (w₁², w₂²)." Mirror it in the corresponding test of plan target 9.5. Tested on both groups of the witness: singular for the first, smooth for the second, as the new wording says.

5. **F05** (P3) §10.5 Check on ℂ* is outside the hypothesis of the theorem

   **Location.** `design/README.md:777`: "n = 1: ℙ¹ is the only compact Hausdorff normal compactification of ℂ* by finitely many points: each of the two ends of ℂ* receives exactly one point."

   **Claim.** The Check tests §10.5, a statement about X_Γ for a lattice Γ.

   **Witness.** ℂ* = ⟨T_1⟩\𝔖 for n = 1, and ⟨T_1⟩ is not a lattice (§5.1 Checks: its strip has ω-area (ε⁻¹ − 1)/2 → ∞). One of the two ends of ℂ* is a funnel, not a cusp, and S*_Γ is not defined for this group.

   **Repair.** Replace by: "n = 1, Γ = PSL(2,ℤ): X_Γ = ℂ has one end, the cusp, and ℙ¹ = (S*_Γ)^an is its only compact Hausdorff normal compactification by finitely many points; the end receives exactly one point." Mirror it in the test of plan target 10.5. Tested: PSL(2,ℤ) is a lattice with one cusp class (§6.1 Checks), S*_Γ = ℙ¹ with ∂ = {∞} (§9.5 Checks), so the instance satisfies the hypothesis and the conclusion.

Five findings, all P3, each with a repair to apply: one locator that supports a different formulation, one missing scope clause about an open roadmap, one Summary claim that no target states, and two Checks. No P1 or P2 finding. The verdict asks for changes because each finding carries a repair; nothing else stands in the way. The two declared supplier gaps `gap:normality-analytification` and `gap:normal-riemann-extension` (supplier ComplexComparisonPartII) are precise, minimal and declared in both files, and are not findings. The five findings of round 6 are repaired. No file of the design and no manifest entry was changed by this review.

Elaboration: not available (this lane does not elaborate). The package has no `Suggested.lean` at the design stage, so no Lean command was run and no build is claimed.

## Verified sound

### Round 6 findings, one by one

| Round 6 finding | Repaired passage | Status |
|---|---|---|
| F01 (P3), §5.2 locator | §5.2: "(WitteMorris2015 line 18549 to line 18561, Definitions B1.3, printed pp. 447–448, for the definitions of a free action, a properly discontinuous action and a stabiliser; the precisely invariant neighbourhoods and the description of the free locus are proved here from §3.4". Read: line 18549 (B1.3), 18550 (free), 18558–18559 (properly discontinuous), 18560–18561 (stabiliser); printed page 447 at line 18555. Plan 5.2 agrees. | Repaired |
| F02 (P3), §10.5 locator | §10.5: "This theorem is proved here from §§9.4–9.5. Mok2012 line 11 to line 16 recalls, for torsion-free arithmetic lattices, the minimality of the Satake–Baily–Borel compactification". Read: Mok2012 line 11 to line 16 says exactly that. Mok2012 `cited_for` has "10.5". | Repaired |
| F03 (P3), neat against §4.3 | Conventions: "neatness of Ad(γ) in that sense implies neatness of γ here and is strictly stronger"; §6.4 Check with γ = m·a₂; §11.3: "neat in the sense of the Conventions when K_f is neat in the sense of AdelicAlgebraicGroups §4.3 (`Neat.IsNeatLevel`)"; supplier contract and *Needs:* carry §4.3. Recomputed below. | Repaired |
| F04 (P3), §§7.3, 7.4, 9.6 locators | §7.3 "(Cartan1957 pp. 90–102, uncertified; ShimuraVarieties §P.6 …)"; §7.4 "Mok2012 line 21 to line 23 recalls the case n = 1"; §9.6 "(MilneSVI line 1690 to line 1694 …, for torsion-free arithmetic Γ)". Read: Mok lines 21–23 and Milne lines 1690–1694 say so. | Repaired |
| F05 (P3), symbol ν | §8.5: "ω_E′ + β with … β = i dwₙ∧dw̄ₙ/(\|wₙ\|² log²\|wₙ\|); since β∧β = 0"; §6.4: "γ = m·η". ν occurs only as the frame of §8.4 (§§8.4, 9.2). | Repaired |

No finding of the repair report was marked "not actionable in this package". No maintainer notes were supplied.

Repaired patterns searched in the rest of the design: every WitteMorris2015 line locator of the README was opened (R01 is what this found); every section whose plan locator names a source cites that source in the README (57 targets compared by script); ν, β, η each have one meaning.

### Coverage and shape

Read the 964-line README in full, the 57 plan targets (42 theorems, 10 definitions, 5 constructions) and the 17 manifest entries.

- Every plan target has at least three tests (3 to 7), every definition and construction an API, every `target:` prerequisite precedes its consumer; the four targets with `gap:` prerequisites (9.4, 9.5, 10.4, 10.5) match the `neededBy` lists.
- Twelve layers, each ending with Examples and Dependencies. The order is the roadmap's own and forced: §6.1 needs §§4.1–4.5 and 5.2–5.3, §8.1 needs §6.4, §9.2 needs §§8.2–8.4, §10.1 needs §§9.4–9.5, §11.4 needs §10.5, §12.3 needs §8.5.
- No LaTeX delimiters, machine paths, pull-request numbers, `set_option`, algorithms or process wording (the grep hits for "lemma" are the Margulis, Selberg and Schwarz lemmas as mathematics). The README attributes no backticked Lean name to this roadmap.
- Gaps: same slugs in `plan.json` and under "What ComplexComparisonPartII must provide"; supplier named; not provided today (ComplexComparisonPartII README:2928 says its route avoids both statements; `roadmaps grep` finds no other owner). The first gap's three clauses are one statement about completed local rings, as the contract says; the second names the classical theorem and the README contract carries its hypotheses. Neither is a finding.

### Adversarial table (computed values)

Conventions: ⟨a,u⟩ = Σ conj(aⱼ)uⱼ; curvature −2 normalisation.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conventions, N and A | general a, a′; a = 1, a′ = i; a_s | n_{(a,t)} preserves ρ: both Im v and \|u\|² gain 2Re⟨a,u⟩ + \|a\|². Composite vertical part t + t′ + 2i⟨a,a′⟩ − 2i Re⟨a,a′⟩ = t + t′ − 2Im⟨a,a′⟩. (1,0)(i,0) = (1+i, −2); commutator (0, −4). a_s n_{(a,t)} a_s⁻¹ = n_{(sa, s²t)} | Pass |
| §1.1 form (sample) | z = (1, i/2), w = (1, 1/2); 2·1; S | 1 + i/4 against 1 − i/4; ⟨z,z⟩ = 3/4; (2·1)ᴴJ(2·1) = 4J; SᴴJS = −J; (h_tᴴJh_t)₀₁ = i sinh t cosh t − i sinh t cosh t = 0 | Pass |
| §1.2 conjugation representation (sample) | diag(1, e^{iθ}, 1); h_t; i·1 | ratios: 1 five times, e^{iθ} twice, e^{−iθ} twice, total 9; e^{2t}, 1, 1, e^{−2t}; scalar ↦ identity. Limit of λ_k g_k has hᴴJh = cJ, c > 0 | Pass |
| §1.3–1.5 models | w = (0, 1/2); τ; n = 2 map to `TauCeti.HeisenbergGroup` | ρ∘C = (1−\|w\|²)/\|1−wₙ\|² = 3; C(tanh τ·eₙ) = (0, i e^{2τ}); image of the product has z + z′ + pq′ (Heisenberg.lean:95) | Pass |
| §1.4 KAK and unimodularity | u = e₁, v = ie₁; w = (1/2, 0) | [Y_u,Y_v] = diag(2i, −2i e₁e₁ᴴ); γ = 2/√3, g_w·0 = 1/2, \|t\| = artanh(1/2) = (log 3)/2; dim K·{g_t} = n² + 1 < n² + 2n; a_s scales Lie(N) by s^{2n} | Pass |
| §2.1 Aut(B) (headline) | tanh t = −1/2; w/2; z + z² | (w − 1/2)/(1 − w/2); h_t sends 0 to i/2; Df(0) = 1/2; unbounded domain | Pass |
| §2.2–2.3 metric and curvature | w = (1/2, 0), u = e₁; n = 1, 2 | h = 4/3 + 4/9 = 16/9, g = 32/9 on both sides; det h = (1−\|w\|²)^{−(n+1)}; Ric = −(n+1)ω; −½B with Killing = 2(n+1)g gives −(n+1)g; Killing curvatures −1/3, −1/12 times 6 = −2, −1/2; iΘ(K_B) = +2ω for n = 1 | Pass |
| §2.4 distance (sample) | 0 and tanh t·e₁; n = 1 Killing | \|⟨z,w⟩\|² = 1, ⟨w,w⟩ = 1/cosh² t, d = √2\|t\|; unit speed: √2·(1/√2) = 1; Killing distance 2√(n+1)\|t\|, ratio √(2(n+1)) = 2 for n = 1 | Pass |
| §2.5 Schwarz–Pick | (ζ,ζ)/√2; (ζ/2, ζ/2); 2ζ | norms 1, 1/√2; leaves the ball. Mathlib Schwarz.lean:189 has `DifferentiableOn` on a ball and `MapsTo` into a closed ball, as the contract says | Pass |
| §3.1 sub-balls (sample) | {w₁ = 1/2}, n = 2; m = 0; negative W | form (3/4)\|z₀\|² − \|z₂\|², signature (1,1); point with stabiliser a conjugate of K; empty. Kernel of r_W = image of U(1)·1_W × U(W^⊥), compact | Pass |
| §3.3 classification (headline) | two axes of B²; n = 1; geodesic segment | reducible; only B; real dimension 1 | Pass |
| §3.4 fixed sets (sample) | diag(1, e^{iθ}, 1); diag(1, ζ, ζ); diag(1, 1, −1); diag(1, −1, −1) | fixed sets {w₁ = 0}, {0}, {w₂ = 0}, {0}: one eigenspace of signature (1,·) each time, the others negative definite | Pass |
| §4.1 classification | a_s; T_t; Jordan block | √2\|log s\|; √2 arcsinh(\|t\|/(2ρ)) > 0, infimum 0; \|λ\|²⟨v,w⟩ + λ̄⟨v,v⟩ = ⟨v,w⟩ gives ⟨v,v⟩ = 0 | Pass |
| §4.2 displacement (sample) | T_t at ρ = \|t\|/2; n_{(a,0)} at (0, iy); screw m·T_t, m = e^{iθ} | √2 arcsinh(1); cosh(d/√2) = 1 + \|a\|²/(2y), d ≈ √2\|a\|/√y. Screw: polarised form F = ρ + \|u−mu\|²/2 − i(t/2 + Im⟨u,mu⟩); \|F\|/ρ → 1 with ρ ≤ N needs \|u−mu\| → 0 and Im⟨u,mu⟩ → −t/2, impossible since \|Im⟨u,mu⟩\| ≤ \|u_⊥\|\|mu−u\|. So the sublevel set lies in a horoball | Pass |
| §4.4 Margulis lemma | coset count; S₃ ⊂ U(2); C_m | F·C_j ⊂ C_{j+1}; C_j = C_{j+1} gives all of Λ/Λ₀; at most m cosets; A₃ of index 2; C_m abelian of index 1 | Pass |
| §4.5 parabolic groups | ⟨n_{(1,0)}, n_{(i,0)}⟩; {n_{(a,0)} : a ∈ ℤ} | contains T_{−4}, Λ = ℤ[i] of rank 2; isotropic subspaces have dimension ≤ n − 1 < 2n − 2; rank 1, not cocompact | Pass |
| §5.1 lattices | ⟨T_1⟩, n = 1 | ∫_ε^1 dy/(2y²) = (ε⁻¹ − 1)/2; ∫_Y^∞ = 1/(2Y); π/6 and 6·π/6 = π | Pass |
| §5.2 proper discontinuity (sample) | converse; w ↦ −w; irrational rotation | γ ∈ Γ ∩ U gives γ·0 ∈ γ(U·0) ∩ U·0; stabiliser of order 2; infinite stabiliser. Mathlib `finite_stabilizer'` (ConstMulAction.lean:566) | Pass |
| §6.1 cusp theorem (sample, headline) | H, R̃, T̃; y = 1000; PSL(2,ℤ) | zᴴHz = 2(Im v − \|u\|²); eigenvalues 1, −1, −2; (1+E₀₂)H(1+E₂₀) = H + iE₀₀ − iE₀₀; √2·arcsinh(0.0005) = 0.000707106752; Siegel set contains the standard domain | Pass |
| §6.3 Selberg (headline) | Γ(3), Γ(2) | traces −2, −1, 0, 1 are 1, 2, 0, 1 mod 3 against 2; only −1, of order 3, excluded by torsion-freeness; Γ(2) ∋ −1 | Pass |
| §6.4 neat (repaired) | γ = m·a₂; lift of m·η; n = 1 | lift diag(1/2, i, 2) preserves Im(ȳ₀y₂) − \|y₁\|²; ratios 2i, −2i, i/2, −i/2, 4, 1/4 and 1 three times; 2i·(i/2) = −1. Lift of m·η is block triangular with diagonal (a, D′, a), so its ratios are those of m. n = 1: ⟨λ²⟩ cyclic | Pass |
| §7.1, §7.3 (sample), §7.4 (sample) | w ↦ −w; [diag(1,1,−1)]; Γ(2)/{±1} ◁ PSL(2,ℤ); elliptic point of order m | cone (xy)² = x²·y²; coordinates (w₁, w₂²); F ≅ S₃ of order 6, quotient the j-line; coordinate w^m on both sides | Pass |
| §8.1 cusp charts (headline) | general a, a′; λ, iλ | \|q\|² = e^{−4π Im v/τ} < e^{−4π\|u\|²/τ}; μ = e^{−4πρ/τ}; ratio of the two sides of the cocycle identity e^{−4πi Im/τ}·e^{+4πi Im/τ} = 1; n_λ n_{iλ} = n_{((1+i)λ, −2λ²)}, τ = 4λ², χ = e^{−πi} = −1 | Pass |
| §8.3–8.4 asymptotics | n = 1; f = q^k, ℓ = 0, 1 | i∂∂̄(−log(−log\|q\|)) = i dq∧dq̄/(4\|q\|² log²\|q\|); metric \|dq\|²/(2\|q\|² log²\|q\|), circle length √2π/\|log r\|; exponent (ℓ−1)(n+1) ≥ −1 iff ℓ ≥ 1; dq/q ↦ dq/q − (4π/τ)⟨a,du⟩ | Pass |
| §8.5 finite volume (sample) | k = 2; n = 1; flat cylinder | (ω_E′ + β)² = ω_E′² + 2ω_E′∧β; ∫₀^δ dr/(r log² r) = 1/\|log δ\|; ∫ dr/r = ∞ | Pass |
| §9.1–9.3 Mok's theorem (headline) | genus 2 and 3; Γ(2)/{±1} | 6g − 6 ≥ 2g + 1 for g ≥ 2; 4g − 4 ≥ 2g + 1 iff g ≥ 3; deg K² = 4 at g = 2; E = O(−2 + 3) = O(1), h⁰(O(ℓ − 3)) = ℓ − 2 = dim S_{2ℓ}(Γ(2)) = −(2ℓ−1) + 3(ℓ−1) | Pass |
| §9.5 arbitrary lattice (sample) | PSL(2,ℤ); (ℤ/2)² of reflections | ℙ¹ with ∂ = {∞}; smooth image with coordinates (w₁², w₂²) | Statement passes; Check R04 |
| §9.6 n = 1 (sample) | Γ₀(11) | index 12, 2 cusps, no elliptic points, genus 1 + 12/12 − 2/2 = 1 | Pass |
| §10.2–10.3 extension, Borel (headline) | exp(1/z); exp; r = 0 | essential singularity, torsion in the target; not algebraic; nothing to extend. Kiernan1972 Theorems 1–2 use distance decrease from the disc and punctured disc and condition (i), all in §10.1 for d_Γ | Pass |
| §10.4 uniqueness (sample) | t ↦ (t², t³); (b) with F = Γ/Γ′ | bijective, not an isomorphism; S′ → S finite and F-invariant factors through S′/F → S, finite bijective onto a normal variety | Pass |
| §10.5 finite-point uniqueness (headline) | doubled ℙ¹; nodal cubic; cocompact; ℂ* | 6 against 3 points, not Hausdorff; two branches; Y = X_Γ; ⟨T_1⟩ is not a lattice. Injectivity: f⁻¹(V) ⊂ U ∪ U′ and both parts of V ∖ {p} nonempty | Statement passes; Check R05 |
| §10.6 functoriality | Γ(2), Γ(3) in PSL(2,ℤ) | degrees 6 and 12; 24 in SL(2,ℤ) | Pass |
| §11.1 arithmetic lattices | A⁻¹gA, A = diag(2,1); SL₂ → PGL₂ | [[a, b/2],[2c, d]]; integral group A·SL₂(ℤ)·A⁻¹ meets SL₂(ℤ) in Γ⁰(2), index 3; PSL₂(ℤ) of index 2 in PGL₂(ℤ) | Pass |
| §11.2 cocompactness (sample) | SL₂; Picard; compact ℚ-form | unipotent [[1,1],[0,1]], noncompact; isotropic (1,1,0,…); no surjection onto G. Fibres of Γ₀\𝐆(ℝ)⁰ → p(Γ₀)\G are orbits of ker p | Statement passes; locator R01 |
| §11.3 Shimura datum (headline, repaired) | z = i; n = 1, 2; K_f = PGL₂(Ẑ) | h₀(i) = [diag(1, −1, …, −1)]; tangent action z/z̄, type (−1,1); \|det g\|² = −1 impossible for n = 2, S realises c < 0 for n = 1; Γ_a = PSL₂(ℤ) | Pass |
| §12.2–12.4 (headline) | m = n; trivial stabiliser; Q = B × {s}, B × S_Γ, {x₀} × S_Γ | j the identity; not a lattice; (dim Q, dim U) = (n, 0), (2n, n), (n, 0). r_W injective on a torsion-free Γ_H: r_W(γ)^k = 1 puts γ^k in a compact discrete set | Pass |

### Seeded source sample

| Target | Locators read and result |
|---|---|
| 1.1 | BaldiUllmo2023 line 486 to line 496: form of signature (1,n) and the matrix condition. Supported; the comparison is the roadmap's. |
| 1.2 | BaldiUllmo2023 line 492 to line 496: classes of matrices. Supported for the quotient; the README says the three statements on Ad are its own. |
| 2.4 | Mok2012 line 319 to line 321: automorphisms are isometries of the Kähler–Einstein metric. Supported for the direction cited. Goldman1999 not read. |
| 3.1 | BaldiUllmo2023 line 496 to line 506: W_ℂ, its orthogonal complement, the stabiliser. Supported; the README corrects the product description by the compact kernel of r_W. |
| 3.4 | Goldman1999 Ch. 3 only: not read. The eigenspace argument is self-contained and recomputed above. |
| 4.2 | Mok2012 line 383 to line 403: the Siegel form of ω and small displacement of the vertical translation high in the horoball. BaldiUllmo2023 line 566 to line 581: D(N), A_b, E. Supported; the formulas are the roadmap's. |
| 5.2 | WitteMorris2015 line 18549 to line 18561: the three definitions. Supported as cited. |
| 6.1 | BaldiUllmo2023 Theorem 3.4.3, line 649 to line 661, with the two Garland–Raghunathan theorems at line 656 to line 658; Mok2012 line 336 to line 349 (torsion-free only, as the README says). Supported. |
| 7.3 | Cartan1957 not read; ShimuraVarieties §P.6 read at its head (Hausdorff space, universal property, normality). Supported by the supplier. |
| 7.4 | Mok2012 line 21 to line 23. Supported as a recollection, as the README says. |
| 8.5 | BaldiUllmo2023 line 586 to line 601 (Definition 3.3.4, Theorem 3.3.5); Mok2012 Proposition 1, line 295. Supported as inputs. |
| 9.5 | Mok2012 Main Theorem, line 546 to line 562; MilneSVI Remark 3.13(a), line 1722 to line 1724; BaldiUllmo2023 Theorem 3.1.12, line 455 to line 462. Supported with the stated restrictions. |
| 9.6 | MilneSVI line 1690 to line 1694. Supported for torsion-free arithmetic Γ, as written. |
| 10.4 | MilneSVI Corollary 3.16, line 1770 to line 1774; BaldiUllmo2023 line 455 to line 465, line 102 to line 104, line 431. Supported. |
| 11.2 | WitteMorris2015 line 3676 (Theorem 5.1.11); line 3909 to line 3911 (unipotent form: R01); BaldiUllmo2023 line 336 to line 339. |

Also read: WitteMorris2015 line 1940 to line 1944, line 2969 to line 2975, line 3002 to line 3005 ("net"), line 1217, line 8344 to line 8347; Mok2012 line 11 to line 27, line 121 to line 128, line 293 to line 297, line 307 to line 312, line 476 to line 484; MilneSVI line 1680 to line 1689; Kiernan1972 line 55 to line 76, line 111 to line 116, line 155 to line 160.

### Pinned declarations opened

Pins: Mathlib 1b1ccf4, Tau Ceti 2fd255d. All 37 file-and-line citations of the supplier contract hold the named declaration at the cited line.

- Mathlib: `Algebra/Lie/Classical.lean:175`, `LinearAlgebra/UnitaryGroup.lean:105`, `Logic/Equiv/Fin/Basic.lean:224`, `LinearAlgebra/Projectivization/Basic.lean:48`, `Topology/Algebra/Projectivization.lean:44`, `Analysis/Complex/UnitDisc/Basic.lean:30`, `Analysis/Complex/Schwarz.lean:189`, `Topology/Algebra/ConstMulAction.lean:534, :566, :601`, `Topology/Algebra/Group/DiscontinuousSubgroup.lean:28`, `Topology/Algebra/Group/Subgroup.lean:155`, `Topology/Algebra/ProperAction/CompactlyGenerated.lean:95`, `MeasureTheory/Group/FundamentalDomain.lean:69, :679, :695`, `GroupTheory/Commensurable.lean:58, :141`, `AlgebraicGeometry/Normalization.lean:122`, `RingTheory/Jacobson/Ring.lean:60, :681, :691`, `RingTheory/Ideal/KrullsHeightTheorem.lean:282`, `GroupTheory/GroupAction/Defs.lean:349`, `Analysis/InnerProductSpace/PiL2.lean:296`, `LinearAlgebra/Matrix/ProjectiveSpecialLinearGroup.lean:36`.
- Tau Ceti: `Topology/Algebra/UnitaryGroup.lean:104`, `Topology/Algebra/Projectivization.lean:188, :215, :311`, `Geometry/Manifold/Instances/Projectivization.lean:54, :82, :96`, `Analysis/Complex/CauchyIntegralPolydisc.lean:351`, `Geometry/Manifold/Instances/Quotient.lean:253`, `MeasureTheory/Group/ProperlyDiscontinuous.lean:100`, `Topology/Algebra/GroupAction/FreeLocus.lean:36`, `GroupTheory/SpecificGroups/Heisenberg.lean:58`, `Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:82`; both cited directories exist.

Read for what they say: `covolume` is the measure of a fundamental domain, or 0 when none exists; §5.3 produces one before using it. `exists_isFundamentalDomain_of_properlyDiscontinuousSMul` assumes a countable group, a second-countable locally compact Hausdorff space and a measure for which the complement of `freeLocus` is null, as the contract says. Tau Ceti's `Subgroup.conj_eq_or_conj_eq_inv_of_dist_le` (Fuchsian/Margulis.lean) is a pairwise statement for PSL(2,ℝ), not §4.4.

### Supplier and ownership audit

Each citation was resolved now, on main or at the open head:

- RealSemisimpleLieGroups (open, new roadmap): §3.1 (README:805), §5.2 (:1105), §5.3, §5.4, §5.6 (:1254, with the Haar and finite-covolume statements), §5.7 (:1286: form linear in the first slot, Y_v ↦ Y_{āAv}, g_𝔹, Killing = 2(n+1)·g_𝔹, sub-balls for 1 ≤ m ≤ n). Its scope (:140–142) leaves Selberg's lemma, finite generation, non-arithmetic ball quotients and Cartan's uniqueness theorem outside itself.
- ComplexComparisonPartII (open): §§C-1.1, C-1.2, C0.6, C1.4, C1.6, C1.9, C4.1, C4.2, C4.4 and the nine declaration names.
- ShimuraVarieties (open): §§P.1, P.2, P.6, 0.1, 0.4, 0.5, 1.2, 2.1, 2.2, 2.5, 2.7, 3.1–3.3, 3.4a, 3.5 and all thirteen `TauCeti.Shimura.*` names.
- AdelicAlgebraicGroups (main): §1.1 (:1003), §3.4 (:3112; `Reduction.IsSArithmetic` :3184, `Reduction.arithmetic_finite_volume_iff` :3228, the anisotropic criterion :3336, "Arithmetic lattices in a real Lie group" :3384), §4.3 (:4609; `Neat.IsNeatAut` :4619, `Neat.IsNeatLevel` :4674). Its lattice (a discrete subgroup with a fundamental domain of finite Haar measure) and VonNeumannAlgebras Layer 9's (finite covolume, README:2861) agree for the second-countable groups used here.
- Main: FuchsianOrbifolds Layers 0–4 and L2.1 (:407), ComplexManifolds Milestones 4–7, RiemannianGeometry R4.7 and R5a, ComplexKahlerGeometry K1–K4 and K6.0, SchemeAndStackFoundations §1.17 (`finiteGroupQuotient_projective`, :3450), RepresentationTheory/LieGroups (`kakDecomposition` :1362, `iwasawaDecomposition`, `IwasawaData`), Completed/ConformalMapping Layer 2, Completed/HopfRinow.
- Open heads: AlgebraicModuliForArithmeticGeometry §§5.4, 9.5; ResolutionOfSingularitiesCharacteristicZero §6.2; PELModuli §M5.5 (three names); ShimuraData §3.8; ArithmeticLocallySymmetricSpaces §ALS.0.5.

The resolver's eighteen "Lean names found nowhere" are the suppliers' own names; each occurs in its roadmap as listed. `scratch/overlaps.md` reports no competing pull request, no dropped id, no revision-only id and no second copy; main has no folder of this name.

Searched by object with `roadmaps grep` (main and open heads): Selberg's lemma, ball quotient, complex hyperbolic, PU(1,n), Margulis lemma, Zassenhaus neighbourhood, Cartan's uniqueness theorem, hyperbolically embedded, toroidal compactification, neat lattice, Siu–Yau, Riemann extension on normal spaces, Kodaira embedding. PU(1,n) and complex hyperbolic space occur only in RealSemisimpleLieGroups, which is cited. GeometricTopology's Margulis lemma is for real hyperbolic space. ShimuraCompactifications builds Pink's toroidal compactification (R02). Nothing else states the cusp theorem, Selberg's lemma for linear groups, the ball's biholomorphism group, Mok's theorem or the extension theorem for non-arithmetic quotients.

Overlap check: read RealSemisimpleLieGroups, ArithmeticFuchsianGroups, ShimuraVarieties, KleinianGroups, ComplexComparisonPartII, FuchsianOrbifolds, ConformalMappingPartII, AdelicAlgebraicGroups, and ShimuraCompactifications; form, groups, ball, metric, sub-balls → RealSemisimpleLieGroups §5.7; MAN → RealSemisimpleLieGroups §3.1; KAK → LieGroups Layer 9; arithmetic-lattice predicate and neat levels → AdelicAlgebraicGroups §§3.4, 4.3; arithmetic quotients and Baily–Borel → ShimuraVarieties; n = 1 quotient and cusps → FuchsianOrbifolds; toroidal compactification of arithmetic Shimura varieties → ShimuraCompactifications Layer 2, X^M for lattices of PU(1,n) → this roadmap (R02); nothing else shared.

Dependency check, run on the unchanged design:

```text
candidate: BallQuotientsAndComplexHyperbolicLattices is not in the merge order yet; checked as if placed after ShimuraData (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2240 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. ShimuraCompactifications, named as a consumer, is at line 163 of the merge order, after ShimuraData at line 116.

### Headline theorems

From the Summary: Aut(B) = PU(1,n) (§2.1); totally geodesic subvarieties are sub-balls (§3.3); the cusp structure theorem (§6.1); finite generation and Selberg's lemma (§§6.2–6.3); the normal analytic quotient (§7.1); the toroidal compactification (§8.2); L² jets and projectivity of S*_Γ (§§9.1–9.5); the extension theorem and Borel algebraicity (§§10.2–10.3); uniqueness of the model and of the finite-point compactification (§§10.4–10.5); the Shimura datum and the Baily–Borel comparison (§§11.3–11.4); Γ-special equals totally geodesic (§§12.2–12.3); the intersection setting (§12.4). Each is a named target with hypotheses; the one Summary clause without a target is R03. The padding probe, the binder check and the statable-headline check apply to `Suggested.lean`, which does not exist at this stage.

### Copyright, wording, arrangement, reuse

- **Wording.** The 30 passages listed in the sample and under "Also read" were set beside the README text at their locators, among them §6.3 against WitteMorris2015 line 2969 to line 2975, §8.1 against Mok2012 line 152 to line 178, §9.3 against Mok2012 line 546 to line 562, §10.1 against Kiernan1972 line 57 to line 75 and §6.1 (2) against BaldiUllmo2023 line 649 to line 658. The longest shared run is about eleven words, the eigenvalue property of WitteMorris2015 line 2972 to line 2973, which the statement forces. Notation (Φ_ℓ, Ξ, Σ, E = K ⊗ [D]) is shared; no sentence, list or proof plan is.
- **Arrangement.** BaldiUllmo2023 has the largest share. Its contents (line 15 to line 23: introduction, notation, real Shimura data, ℤ-Hodge theory, comparison, finiteness, special points) do not map onto the twelve layers; its §3 is spread over Layers 1, 3, 6, 8, 10, 11 and 12, and its §§4–7 are outside the scope. Mok2012 (§§1.1–1.3, 2.1–2.3) is nearest to Layers 8–9, but its §1.3 is Layers 4–6, placed before its §§1.1–1.2 (Layer 8) because §8.1 needs §6.4, and §§8.5, 9.5, 9.6 are not in it.
- **Reuse.** No table, figure, exercise list or data set is taken over.

Source independence: 30 passages compared with 5 sources (BaldiUllmo2023, Mok2012, WitteMorris2015, MilneSVI, Kiernan1972), none shared beyond forced statements; largest share BaldiUllmo2023, 35 of 120 locators in the layers; contents compared with BaldiUllmo2023 and Mok2012: independent. Goldman1999 and the other settled unread works could not be compared.

## Not verifiable

- Goldman1999 Ch. 3 (the only locator of sampled §3.4, and a locator of sampled §2.4): settled uncertified, text not read.
- Cartan1957 (sampled §7.3), Raghunathan1972, Borel1969, Alperin1987, Borel1972, BailyBorel1966, SiuYau1982: settled uncertified, not read. GarlandRaghunathan1970: waived, not read; §6.1 (2) rests on BaldiUllmo2023's quotation of it.
- Lean elaboration, the one-tactic probe and the `#check` comparison: no Lean file exists at this stage.
- Ownership against open pull requests was checked through the tools' index of open heads; the brief's list of 239 names does not include RealSemisimpleLieGroups, whose head the tools did provide.

## Source issues

- **Misprint** in Mok2012 at §1.3, equation (5), printed p. 9 (line 391 to line 396): the source says the restriction of ω to a vertical half-plane is i dzₙ∧dz̄ₙ over ρ²; it should carry the factor 1/4; affects nothing.
- **Error** in BaldiUllmo2023 at §3.2, printed p. 12 (line 500 to line 502): the source says the stabiliser of a subspace is a product of PU(1,m) and a compact group; it should be an extension of PU(1,m) by a compact kernel; affects a stated result.
- **Misprint** in BaldiUllmo2023 at §3.2, printed p. 12 (line 501): the source says m is the rank of the subspace; it should be its dimension minus one; affects nothing.

## For the human reviewers

- **Ordering.** RealSemisimpleLieGroups, supplier of §§3.1 and 5.2–5.7, is an open new-roadmap pull request by another author and is absent from `merge-order/ORDER.txt`; the gate placed this roadmap after ShimuraData without testing that edge.
- **Licence.** Mok2012 was read as the HKU IMR preprint IMR2009-4 (`sources.toml`, licence class author-page), not as the published chapter; its numbering was not compared with the printed volume.
- **Not tested.** Goldman1999 and eight other uncertified or waived works were not compared for wording; BaldiUllmo2023, the largest-share source, was read and compared.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5ecc999785e3bec07d3065094a65c5aea5f4c964", "job": "REV-DESIGN-BallQuotientsAndComplexHyperbolicLattices~7", "model": "fable", "worker": "chris-x52"} -->
