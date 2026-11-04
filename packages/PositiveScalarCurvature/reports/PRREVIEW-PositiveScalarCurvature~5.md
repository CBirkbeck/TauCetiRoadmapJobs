# Review of PositiveScalarCurvature (pull request #1766 at 2499932)

**Verdict:** accepted

Incremental re-review of the 90 lines changed since 8aa84aa (README only; `Suggested.lean` is byte-identical to the file the previous review elaborated). One finding, not blocking (P3). All four findings of the previous review are repaired (table under *Previous findings*). The gate passes at this head (every counter zero, `build=0 OK`), the dependency check reports no problem, and `Suggested.lean` elaborates with exactly the four `sorry` warnings (lines 75, 82, 95, 121). The changed passages were reviewed in full against their sources, suppliers and the rest of the roadmap; the adversarial table below carries the previous rows forward and adds computed rows for every changed statement.

## R01 (P3) — The finite-atlas seminorms of 1.1 are taken over whole chart images, where they can be infinite and the eigenvalue bound of the new Check fails

**Location:** `TauCetiRoadmap/PositiveScalarCurvature/README.md:279–281` ("define the C² topology by uniform coordinate derivatives of orders 0, 1 and 2 over a finite atlas") and the new Check at `:312–316` ("the smallest eigenvalue of g over a finite atlas has a positive lower bound λ").

**Claim:** on closed M, suprema of coordinate derivatives over a finite atlas define the C² and C^k topologies, and the smallest eigenvalue of g_ij over the atlas is bounded below by some λ>0.

**Witness:** round S² with the two stereographic charts, each with image all of ℝ²: g_ij=4δ_ij/(1+|x|²)², smallest eigenvalue 4/(1+|x|²)², infimum over the chart 0, so no λ>0 exists as the Check is worded. Worse, in the chart y=x/(1+|x|²)^{1/2} onto the unit disc the radial entry of the same metric is 4/(1−|y|²), unbounded, so the "uniform" seminorm over that chart of g itself is infinite and the topology is not defined by the words as they stand. With the standard definition (a finite atlas (U_i,φ_i) and compact K_i⊂U_i covering M, suprema over φ_i(K_i)) both the seminorms and the eigenvalue bound are fine, and the λ/n entry bound is exact: for g=δ on ℝ² (λ=1, n=2) the perturbation with entries ±1/2 of alternating sign is degenerate on (1,−1), while entries of absolute value <1/2 keep every direction positive.

**Repair:** in 1.1 write "over compact subsets K_i of the charts of a finite atlas that cover M" for the C² topology, the C^k topology on the half-space model and the Check's lower bound ("over the compact pieces of a finite atlas"); add "strictly within λ/n" in the Check. The openness statement itself, and everything downstream that uses the C² topology on closed M (1.2, 1.4, 3.3, 6.4), is unaffected.

## Previous findings

- R01 — repaired: README 270–278 and 294–295 state the cone as convex with openness "on closed M only"; the ℝ witness h_k=(1−2φ(x−k))dx² is the negative-control Check at 317–323; the Conventions (109–110) scope openness of the cone and of R⁺(M) to closed M; 1.2 (332–333) already stated R⁺(M) open on closed M. The repair's new eigenvalue Check is the subject of this report's R01.
- R02 — repaired: 2.3 has the Berger-sphere Check (587–592), 4.4 has the product-law and space-variable Checks (871–883), 6.1 has the dimension-7 Check (985–989); every definition and construction section now carries at least three Checks.
- R03 — repaired: the Mathlib pull-request sentence is gone (372–375 end at "using the real quaternionic trace"); the gate's `prnum` counter is 0.
- R04 — repaired: Conventions 146–149 say "σ=±J₇(b) for the generator J₇(b) fixed by HomotopySpheres §9A.1, and no statement here depends on the sign"; 6.2 step 4 (1049–1055) repeats it and says the witness is computed relative to σ itself; the only other use of the sign, e_C(120σ)=±1/2≡1/2 (1153), is sign-independent.

## Verified sound

**Gate, direction, policy.** Worker gate at 2499932: every counter 0, `build=0 OK`; my own rerun of the gate on this head gave the same result. Outside-folder diff against origin/main: empty; the pull request changes only README.md and Suggested.lean of this folder. The dependency command's complete output:

```text
depcheck: 204 roadmaps, 1660 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line; PositiveScalarCurvature is not in the merge order yet and is placed after its last supplier. No `set_option`, `lemma`, `#eval`, `#print`, sorry'd data, LaTeX delimiter, process word or pull-request number in either file. No fetched text contained an instruction.

**Lean.** `lake env lean` on `Suggested.lean`: four `sorry` warnings (75, 82, 95, 121), nothing else. The file is unchanged since 8aa84aa, so the previous review's `#check @name` comparison of all seven elaborated types with the README (1.2, 2.1, 6.2), its `pp.explicit` probe showing the Hitchin headline quantifies over its own atlas, and its one-tactic probes (all four theorems fail `simp`, `rfl`, `infer_instance`, `simp_all`) stand; the worker's signature extract at this head is identical to the previous one. The two "dropped" binders are the native carrier's (`SmoothMetric` needs neither `FiniteDimensional` nor `T2Space`; `compact_isometryEquiv_lieGroup` gets Hausdorffness from `EMetricSpace M`). Every README backticked name of this roadmap's own is declared; every Lean name appears in the README.

**Headline inventory** (unchanged): stated — scalar smoothness and uniform gap (1.2), Myers–Steenrod (2.1), Hitchin spheres (6.2); not statable and named in the docstring with the missing carrier — surgery theorem (3.2), bordism invariance and PSC bordism groups (4.3–4.4), α-vanishing and the classification (5.1–5.2), connection metric (2.2), the Moore/μ constructions (6.2), family invertibility (6.4). No padding.

**Supplier citations the changed passages make, resolved at the heads this brief supplies.**

| Citation | Resolved passage | Outcome |
|---|---|---|
| HomotopySpheres §9A.1 (head 1287) | README 2646–2688: `e_C(J_7(b))=±1/240` "with its generator sign specified by that construction"; π₇ˢ=ℤ/240 generated by J₇(b) | the "σ=±J₇(b)" wording is exactly what the supplier fixes |
| HomotopySpheres §9A.2 (head 1287) | README 2689–2712: A₇=coker J₇=0 from J₇ surjective, Θ₇=ℤ/28 via P₈→Θ₇→A₇ | the dimension-7 Check's "cokernel of J₇ is 0" and Θ₇=bP₈≃ℤ/28 are the supplier's statements |
| ComplexKahlerGeometry K5a (main) | README 718–726: seminorms over a countable exhaustion by compact sets | the 1.1 prose now describes K5a's topology correctly and confines openness to closed M |
| TangentialBordism §10.4 (head 942) | README 2420–2445: HP² invariant metric, value 128 in this roadmap's normalization | the HP²×K3 Check's 128/ε² agrees |
| SpinGeometry 696–697 (main) | periodic circle α=η, antiperiodic (bounding) circle α=0 | the space-variable Check's bounding circle maps to 0 in Ω₁^Spin |
| 1.3 scaling and product laws (this roadmap, 364–367) | Scal(cg)=c⁻¹Scal(g); product scalar curvature is the sum | both used by the HP²×K3 Check as stated |
| 2.2 O'Neill formula (this roadmap, 531–533, 549–552) | Scal(g_ε)=Scal(g_B)+ε⁻²Scal(g_F)−ε²|A|², Hopf |A|²=2 | the Berger Check is this formula at ε²=1/2 |

**Sources.** The changed lines cite no new external text. The seeded sample's sections (1.1, 2.1–2.3, 3.1–3.3, 4.1–4.3, 5.1, 6.1–6.4) were verified in full by the previous review at the locators in its table; at this head the only sampled passages that changed are 1.1 (K5a, Hamilton Example 1.1.5 at `hamilton line 158–165`, compact case only, as the prose still says), 2.3, 6.1 and 6.2 (no new locator), and those were re-read above.

**Adversarial mathematics table.** Rows for statements the diff leaves untouched are carried from the previous report (its table at 8aa84aa; values unchanged at this head); rows marked "new" are computed for this head.

| Statement (README location) | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Metric cone open on closed M, eigenvalue Check (312–316) — new | g=δ on ℝ², n=2, λ=1; perturbation e with entries ±1/2, alternating signs; entries of absolute value 0.49 | v=(1,−1)/√2: vᵗ(g+e)v = 1−1 = 0 (degenerate at the bound); with 0.49: 1−0.98=0.02>0; general: |vᵗev| ≤ max|e_ij|·(Σ|v_i|)² < (λ/n)·n|v|² = λ|v|² | true with strict inequality over compact pieces; bound λ/n sharp | R01 (wording) |
| Same Check over a whole chart image (312–316) — new | round S², stereographic chart; the disc chart y=x/(1+|x|²)^{1/2} | inf eigenvalue 4/(1+|x|²)² = 0; radial entry 4/(1−|y|²) → ∞ | λ>0 fails and the sup seminorm is infinite without compact pieces | R01 |
| Noncompact negative control (317–323) — new | M=ℝ, g=dx², h_k=(1−2φ(x−k))dx², K=[−R,R] | for k>R+supp radius, h_k−g=0 on K, every seminorm → 0; h_k(k)=1−2=−1 | cone not open in K5a's topology; the Check is correct | none |
| Cone convex, not closed (311–312) | tg+(1−t)h; diag(1,ε) | positive-definite for t∈[0,1]; limit diag(1,0) degenerate | carried from the previous report | none |
| Conventions scope (105–113) — new | 1.2 line 332–333, 1.4, 3.3, 6.4 | every openness statement in the roadmap is on closed M (grep: lines 281, 294, 312, 333, 346) | consistent | none |
| Berger sphere (587–592) — new | Hopf S³→S²(1/2), fibre ε²; ε²=1/2, 1, 4 | K_hor=4−3ε², K_mix=ε²; Ric = 4−2ε² (×2), 2ε²; Scal=8−2ε² = 7, 6, 0; reversed sign 8+2ε² = 9 at ε²=1/2 | agrees with the O'Neill formula and the 2.2 Hopf Check; positive iff ε<2 | none |
| HP²×K3 product law (871–876) — new | signatures; ε²g_HP²+g with min Scal(g)=−m | σ=1·(−16)=−16≠0; Scal=128/ε²+Scal(g) ≥ 128/ε²−m > 0 for ε²<128/m; α=α(HP²)α(K3)=0·a=0 | PSC class with a non-PSC factor; consistent with 5.1 | none |
| Space variable over S¹ (877–883) — new | bounding circle with id; periodic circle with id | Ω₁^Spin(S¹)=Ω₁^Spin⊕Ω̃₁^Spin(S¹)=ℤ/2⊕Ω₀^Spin=ℤ/2⊕ℤ; bounding: (0, ±1), periodic: (η, ±1); PSC closed 1-manifolds: only ∅ (Scal≡0), so Ω₁^(Spin,+)(S¹)=0 | the forgetful test would admit (0,±1); the Check discriminates | none |
| Dimension 7 (985–989) — new | π₇ˢ=ℤ/240=im J₇; KO₇, KO₉ | coker J₇=0, Θ₇=bP₈=ℤ/28; KO₇=0 so α(Σ⁷)=0 for all 28 classes; KO₉=ℤ/2 and the Hitchin 9-sphere has α=ηb≠0 | consistent with 6.2 and HomotopySpheres §9A.2 | none |
| σ sign independence (146–149, 1049–1055, 1153) — new | σ and −σ as generator | 225σ and 225(−σ) both have order 16; 120σ=120(−σ) in ℤ/240; e_C(120σ)=120·(±1/240)=±1/2≡1/2 | every stated value is invariant under σ↦−σ | none |
| Sym² projection, metric ↔ section, Fréchet/second countability, C² coarser than C∞ (258–302) | as in the previous report | (b+bᵗ)/2=[[0,½],[½,0]]; −δ, diag(1,0) excluded; ℝ^I vs ℝ^ℕ; k⁻³sin(kt) | carried from the previous report | none |
| Scalar curvature, scaling, products, unions, empty, noncompact gap, round models, H²×S²(ε), product domination (332–380) | as in the previous report | 2/r² at r=1,2; c=4; S²×T²=2; S²⊔T²; ε=1 gap on ∅; 2/r² on (0,∞)×S²; n(n−1)/r², 24, 128; −2+2/ε² | carried from the previous report | none |
| Concordance tails, non-collared restriction, slowed parameter, isotopy ⇒ concordance (384–432) | as in the previous report | 5/2, 9/8; O(L⁻²) | carried | none |
| Isometry groups, no small subgroups, frame injectivity, Myers–Steenrod Lean (476–496, Lean 95–112) | as in the previous report | O(2), O(3), S₃, O(3)≀C₂, E(n); rotations 2π/k | carried | none |
| O'Neill/Hopf, product bundle, T²×S², conjugation on CP² (517–567) | as in the previous report | 8−2=6, 8−1=7; 2/ε²; degree (−1)²=+1 | carried | none |
| Tube curvatures, bending term, model tube, surgery hypothesis, belt sphere, connected sums, disjoint surgeries (587–688) | as in the previous report | ordered-pair coefficient 2(n−1)k; (q−1)(q−2)/r²; K3×K3; T²#T² | carried | none |
| Normal bundles, nonspin detector, Hurewicz, cylinder control, Whitney dimensions, dual indices, empty incoming boundary (729–820) | as in the previous report | π₁SO(n)=ℤ/2; w₂(CP²)[CP¹]=3; (2,3) in V⁵; μ=n+1−λ | carried | none |
| PSC bordism groups over a point, Ω₅^(SO,+) (862–870) | as in the previous report | Â(K3)=2; P(1,2) | carried | none |
| α and Â, Spin circle, classification dimensions, bP spheres (880–943) | as in the previous report | a²=4b, Â=2r; η³=0; KO₅=KO₆=KO₇=0; c₁(CP³)=4 | carried | none |
| Moore carrier, a₁=Eσ‴, bracket representative, σ₂ normalization, unprojected relation, π₁₄(S⁶), indeterminacy, Adams bracket formula, e_C(ν), μ order, Arf, realization, J image, Hitchin headline (969–1132, Lean 121–132) | as in the previous report | 225σ, 210σ, 180σ, 120σ; order 120 vs 8; ℤ/8⊕ℤ/2⊕ℤ/3; −2·¼=½; 1/12 ⇒ ⅔; 4j+1∉{0,1,8j+1,8j+2}; d=9,10 | carried | none |
| HP^k Pontryagin, Dold scalar and w-classes, torus α and Gauss–Bonnet, bounded transform, uniform family gap (1125–1203) | as in the previous report | p₁=0; 4−14=−10; 24, 0, 2; w₂w₃=cd²; ∫K=0; x/(1+x) | carried | none |

**Ownership by object.** The changed passages add no construction: the new Checks exercise objects already owned here (the metric cone, the connection metric, geometric PSC bordism, α on homotopy spheres). The previous report's searches (`roadmaps grep` for scalar curvature, Myers–Steenrod, Gromov–Lawson/surgery, PSC bordism, Moore space/μ) stand; no second owner. Ownership against open pull requests whose files this brief does not supply was not checked.

**Declared gaps:** none declared; no undeclared gap found in the changed lines (every citation resolves above).

## Not verifiable

- Nothing new. The items of the previous report remain as stated there: Toda's *Composition Methods* (paywalled; relations corroborated at `adams line 1846–1848`, `kmnst line 469–471`, `cs13 line 317–319`), Lawson–Michelsohn (no legal copy), Stolz 1992 Theorem A (JSTOR landing page; read from `stolz22 line 155–157`), Kobayashi (settled uncertified), Adams Proposition 7.14/Example 7.17 (OCR-illegible page), Crowley–Schick journal pagination. The changed lines cite none of them anew.
- Neither the board manifest nor any pull-request file was changed; no source text was copied anywhere.

## Source issues

- none (the changed lines cite no new source passage; the three items of the previous report, gl80 formulas (1)/(1′) and the Dold-manifold paragraph, and cs13 Lemma 2.14, were recorded there).
