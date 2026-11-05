# Review of ComplexMultiplicationAndExplicitReciprocityPartII (pull request #1695 at 6cc3139)

**Verdict:** needs changes

Incremental re-review of the 52 lines changed since 7c2bbf0 (README only; `Suggested.lean` and `metadata.toml` are byte-identical to the head the previous review read). The three previous findings were checked for repair, every changed passage and every line that cites it was re-read, the gate and the elaboration were rerun, and the adversarial table carries forward the untouched rows and recomputes the changed ones.

## R01 (P2) — The Lubin–Tate contract re-plans a supplier's accepted design and is not a declared gap

**Location:** `TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocityPartII/README.md:97`, “What LubinTateFormalModulesAndQuasiCanonicalLifts must provide (gap:lubin-tate-character-realizations): For every prime p, finite extension K/ℚ_p and uniformizer π of O_K, construct the one-dimensional Lubin–Tate formal O_K-module G_π …”, consumed at lines 392, 466, 486, 879 and 915.

**Claim:** The rank-one Lubin–Tate character, its torsion restrictions, the arithmetic reciprocity identity and its crystalline and Breuil–Kisin realizations are supplied by no earlier roadmap and must be requested from the supplier as a gap.

**Witness:** LubinTateFormalModulesAndQuasiCanonicalLifts is in the merge order (`ORDER.txt` line 321, before this roadmap at line 343), and its accepted design (board package `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/design/README.md`, plan status complete, review accepted 2026-10-18) already plans, in Layer LT.2, “Finite-height torsion comparison” (line 356: finite locally free πᵐ-torsion group schemes, identified with the π-power torsion of an R07.1 p-divisible group), “Formal-module Tate module” (line 374: T_πG free of rank h over O_K, T_πG/πᵐ ≅ G[πᵐ](L̄), continuous O_K-linear Galois action, identification with the R07.1 Tate module), “Lubin–Tate character” (line 410: continuous χ_π:G_K→O_K× with σ(t)=[χ_π(σ)]t at every torsion level and base change by restriction) and “Comparison with local reciprocity” (line 447: χ_π(Art_K(πʳu))=u⁻¹ for the arithmetic Artin map, Art_K(π) fixing the torsion tower). Its conventions cover every finite K/ℚ_p with no ramification bound, so p=2 is included. The remaining clauses, crystallinity of the rational Tate module and the Breuil–Kisin/Dieudonné module of G_π with Frobenius, filtration and duality in Kisin's contravariant normalization, are stated for every p-divisible group over O_K and every p by FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.19 (`BarsottiTate.isCrystalline`, line 6309 at its open head), §R07.4.18 (the Dieudonné crystal on S, line 6266) and §R07.4.21 (Kisin's classification, line 6408), which this README already consumes as Layer R07.4; the O_K-action follows by functoriality from LT.2. So every clause of the gap asks for what an earlier roadmap already plans. Independently, the package's `design/plan.json` lists nine gap slugs and not this one, so the intake would never announce it to the supplier: the contract is not declared where the intake reads it.

**Repair:** Delete the gap. Replace the contract at line 97 by a consumption: cite LubinTateFormalModulesAndQuasiCanonicalLifts LT.2, “Finite-height torsion comparison”, “Formal-module Tate module”, “Lubin–Tate character” and “Comparison with local reciprocity”, for G_π, its finite flat torsion, the rank-one integral Tate module, the character with its torsion reductions and the identity χ_π(rec_K(πʳu))=u⁻¹; cite FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.4.18–R07.4.21 for crystallinity of T_π[1/p] and for the Breuil–Kisin and Dieudonné realizations of G_π, naming the contravariant convention (the module attached to Hom_ℤp(T_π,ℤ_p)) and the p=2 isogeny caveat of §R07.4.18. Keep the three Checks. Repoint the `*Needs:*` lines at 392, 466 and 879 and the Dependencies at 486 and 915 to “LubinTateFormalModulesAndQuasiCanonicalLifts LT.2, ‘Lubin–Tate character’ and ‘Comparison with local reciprocity’” (the citation the earlier head carried). Only if some clause remains that neither LT.2 nor R07.4 plans, declare that remainder alone as a gap and add the same slug to the plan's `gaps` list.

**Repair test:** Under LT.2's character, over ℚ₅ with π=5 the unit 2 acts by 2⁻¹≡3 on G_π[5] and by 13 on G_π[25], 13≡3 mod 5, and Art(5) acts trivially; the geometric convention gives 2 and fails. Applying §R07.4.21 to the p-divisible group of LT.2's finite-height torsion returns the Breuil–Kisin module of T_π^∨, which is what the deleted gap demanded, with Frobenius multiplier 2 on the cohomological side for Ĝ_m over ℤ₂. The previous review's R01 witness (“no roadmap … on main or in an open roadmap pull request”) did not search the board's packages, where the supplier's design lives; since the supplier is in the merge order, the earlier citation of LT.2 by section title was permitted, and the P1 of that round was not a missing owner.

## R02 (P3) — The plan's section label for the absolute-Hodge gap no longer exists

**Location:** package `design/plan.json`, gaps entry `absolute-hodge-padic-comparison`, `section: "§B1.3"`; `README.md:89` now says “(gap:absolute-hodge-padic-comparison), extending §1.3”.

**Claim:** The intake announces the gap on AutomorphicBundles §B1.3.

**Witness:** AutomorphicBundles at its open head has “### 1.3 Descended Hodge-tensor realizations” (line 876) and no heading labelled B1.3.

**Repair:** Set the plan entry's `section` to §1.3; the gaps list is the one part of the plan that the package stage may edit.

## R03 (P3) — §11.10 is cited in the AutomorphicBundles contract but consumed by no target

**Location:** `README.md:87`, “and §11.10 only for the classical GL₂ Hodge-line specialization”.

**Claim:** A target of this roadmap uses the GL₂ Hodge-line specialization.

**Witness:** “11.10” occurs only at line 87; the AutomorphicBundles citations at lines 412, 422, 432, 486, 591, 619, 732 and 778 name §§1.1–1.3 and §§3.1, 3.4–3.8 only, and §§7.2–7.3 (lines 955, 963) take the Hodge line and the Petersson norm from HilbertModularVarietiesAndShimuraCurves §§R18.2.12–R18.2.18.

**Repair:** Delete the clause, or add §11.10 to the `*Needs:*` line of the one target that actually uses it.

## Previous findings

- R01 — partly repaired: “What LubinTateFormalModulesAndQuasiCanonicalLifts must provide (gap:lubin-tate-character-realizations): … construct the one-dimensional Lubin–Tate formal O_K-module G_π …” names an owner and an exact statement, but as a gap re-planning LT.2 and R07.4, absent from `plan.json` (R01 above).
- R02 — repaired: “Consume §§1.1–1.3 for defining tensors … §§3.1, 3.4–3.8 for associated bundles … §11.10 only for the classical GL₂ Hodge-line specialization … (§3.7 excludes them explicitly)”; all seven uses re-pointed; §§7.2–7.3 no longer cite AutomorphicBundles (one leftover, R03).
- R03 — repaired: “Consume §5.5, ‘Geometric isogeny estimate’: for geometrically isogenous dimension-g A,B over a common number field k …” at line 125, and §5.5 at lines 11, 1093, 1103 and 1121.

## Verified sound

**Gate and direction.** The worker's gate at this head passes every check (`gate.md`: set_option 0, blob 0, latex 0, prnum 0, sorry-data 0, imports 0, depcheck 0, stray-files 0, outside-folder 0, build 0). The dependency check rerun from the worktree printed exactly

```text
depcheck: 204 roadmaps, 1544 edges, 0 problem(s)
```

with no UPWARD or CYCLE line. `git diff --stat origin/main...HEAD` outside the roadmap folder is empty.

**Elaboration and padding.** `lake env lean` on `TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocityPartII/Suggested.lean` produced only the two `sorry` warnings (lines 53 and 75). The file is unchanged since 7c2bbf0 (`git diff 7c2bbf0 HEAD -- Suggested.lean` empty). A scratch copy with `#check @relative_class_number_growth` and `#check @distant_cm_isogenies` elaborated to the types in the worker's `signatures.md`: `0 < g`, `0 < ε`, `Field`, `NumberField`, `IsCMField`, `Module.finrank ℚ E = 2 * g`, and for the second theorem `A.dim = g` and `ι : 𝓞 E ≃+* A.End` are all retained; the constants `C`, `c` are chosen before the field and the variety. The one-tactic probe (`first | simp | rfl | infer_instance` in place of each `sorry`) left both goals unsolved, so neither theorem is padding. No sorry'd data, `set_option`, admitted `example` or stand-in predicate.

**Changed passages.** Read in full with what cites them: lines 11, 87–105, 392, 412, 422, 432, 466, 486, 591, 619, 732, 778, 879, 915, 955, 963, 981, 1093, 1103, 1121 (every line the diff touches) and the statements of §§2.1, 2.3–2.5, 2.7, 3.6, 4.2d, 6.2, 7.2–7.3, 11.1–11.2 whose `*Needs:*` lines changed. Only locators changed in those targets; their statements, hypotheses and Checks are as the previous review verified.

**Citations resolved this round** (each at the copy named):

- AutomorphicBundles, open head of #1069 via `roadmaps show`: §1.1 line 814, §1.2 844, §1.3 876, §3.1 1337, §3.4 1424, §3.5 1464, §3.6 1507, §3.7 1551 (its text: the comparison “does not add crystalline or `B_dR` assertions”), §3.8 1575, §11.10 4082 (“The GL₂ Hodge-line specialization”, ω and ω^k on the modular-curve model). The contract's descriptions match these sections.
- FaltingsFinitenessAndIsogenyTheoremsPartII at the #1738 head: `README.md:926` “### 5.5 Geometric isogeny estimate”, degree ≤ C_g max(1,h_F(A),[k:ℚ])^κ_g for a k̄-isogeny, not necessarily k-defined or polarization-preserving: the README's restatement at line 125 is exact.
- LubinTateFormalModulesAndQuasiCanonicalLifts, board design: LT.2 sections at lines 356, 374, 410, 447; `plan.json` status complete, review accepted 2026-10-18; merge order line 321.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory at the #879 head: §R07.4.18 line 6266, §R07.4.19 line 6309, §R07.4.21 line 6408.
- Gaps: the nine plan slugs equal the nine README slugs at lines 71, 89, 117, 131, 141, 151, 153, 161, 163; the tenth README slug (line 97) has no plan entry (R01); the plan's §B1.3 label is stale (R02).

**Source locators of the new contract** (A, the Annals paper): §2.2 begins at A line 429 (page marker at line 406 is printed p. 401, at 443 p. 402); T_π(G) crystalline, rank one over O_E, and M(G)=M(T_π(G)^∨) at A lines 446–450; Proposition 3.5.2 at A line 1310 (p. 422) with the Lubin–Tate step at lines 1352–1355 (p. 423); §3.6 heading at A line 1553 (p. 428, marker at 1520), the Dieudonné F-crystal of G_q at lines 1569–1574 (p. 429, marker at 1558). All three locators are correct. §2.1's “A line 1277” is the page-32 marker where Proposition 3.5.2's page begins, consistent with its printed pages 422–424.

**Seeded sample within the changed passages.** 2.1 (A Proposition 3.5.2 and Remark 3.5.3, pp. 422–424, lines 1310–1358: crystallinity of K_p-stable lattices through the reciprocity character and the Lubin–Tate factor, factoring through the image torus) and 11.1 (supplier citation now §5.5, verified above; its statement and T Lemma 4.1 locator unchanged since the previous verification). The other thirteen sampled targets are untouched by the diff; the previous review's verification of them stands.

### Computed adversarial pass

Rows marked “carried” are the previous report's rows for statements the diff leaves untouched (review of 7c2bbf0, same table layout), with their values; new rows are recomputed here.

| Statement | Instances tried | Values on the two sides / negative control | Result and change |
|---|---|---|---|
| LT contract, Check 1 (ℚ₅, π=5, n=1) | u=2, u=1, π | 2⁻¹ mod 5: 2·3=6≡1, so scalar 3; 1⁻¹=1; Art(5) acts by 1. Geometric convention 2≠3; trivial character 1≠3. | Values correct; arithmetic normalization pinned. |
| LT contract, Check 2 (n=2) | u=2 modulo 25 | 2·13=26≡1 mod 25, scalar 13; 13 mod 5 = 3 = level-one scalar. A level-independent choice (say 8≡3 mod 5 but 2·8=16≢1) fails. | Levels come from one character; correct. |
| LT contract, Check 3 (ℚ₂, π=2) | n=1, n=2; Ĝ_m | #G[2]=q=2, (ℤ/2)×={1} so trivial; #G[4]=4, 3·3=9≡1 mod 4 so u=3 acts by 3. e(X)=(1+X)²−1=X²+2X ≡2X mod X², ≡X² mod 2, so Ĝ_m is Lubin–Tate for π=2 and T_π=ℤ₂(1). Hom(T_π,ℤ₂)=ℤ₂(−1): φ=2, jump in degree 1 (Fil¹ everything, Fil²=0); ℤ₂(1): φ=1/2, jump in degree −1. | Values agree with R07.4.17's Checks (D of ℚ_p(1) has weight 1 on the contravariant side). |
| LT contract as a gap | Each clause against LT.2 and R07.4 | Torsion, Tate module, character, torsion reduction, reciprocity identity, base change: LT.2 lines 356–465. Crystallinity, BK/Dieudonné module, duality, all p: R07.4.18–R07.4.21. Clauses not planned anywhere: none. | Re-plans suppliers; not in plan.json. R01. |
| AutomorphicBundles contract | Tensor unit; polarization; crystalline claim | §3.7 preserves defining tensors, duals, Tate twists, Hecke pullbacks, so 1↦1 and a polarization stays in its Tate line (GSp, not Sp); §3.7 states no `B_dR` assertion, so the absolute-Hodge gap survives. §11.10: weight-k coefficient ω^k with negative k as duals, k=0 gives the trivial line. | Locators correct; §11.10 unconsumed (R03). |
| FaltingsFinitenessAndIsogenyTheoremsPartII §5.5 | Non-CM E/ℚ and its nonsquare quadratic twist | Rational Hom = 0, geometric isomorphism of degree 1 ≤ C_g·max(1,…)^κ_g requires only C_g ≥ 1; a rational-isogeny version would exclude the pair. §11.2's budget with κ=2, δ=1/16, a=3/16, ε=1/32: δκ=1/8<3/16<1/4 and εκ=1/16<3/16. | §5.5 supplies exactly the geometric form used; R03 repaired. |
| 2.1 Crystallinity | ℚ₅ character; unit representation | Arithmetic unit action 2↦3 mod 5; uniformizer↦1; unit representation rank 1, filtration weight 0; geometric 2↦2 fails. | Statement unchanged; supplier now LT.2 + R07.4 (R01). |
| 2.7 Tautological crystal | Split p=5 for ℚ(i) | Two rank-one factors, Lubin–Tate factor and Fr⊗1 factor of slope 0, ranks 1+1=2; Fr(1)=1 on the unit. A lines 1569–1586 match. | Statement unchanged; R01 locator. |
| 6.2 Torsion comparison | ℤ₃[√3]/(2√3), ℤ₂[√2]/(2√2) | √3=−√3 and √2=−√2 in the quotients, different lengths 1 and 3, no division by 2. | Statement unchanged; R01 locator. |
| Conventions: metric | carried | Square elliptic torus: squared volume 2; Fal metric 1; YZ metric 1/π; shifts −log(2)/2 and +log(2π)/2. | carried, unchanged. |
| Conventions: stack degree | carried | Gaussian stack degree 1/4; absolute count 1/2; (2h/4)/(1/4)=2h. | carried, unchanged. |
| Conventions: excluded inputs | carried | g=0, zero ring, equal-characteristic DVR each contradict a standing hypothesis. | carried, unchanged. |
| 0.1 CM functions | carried | C₂ overlap (1+χ)/2; C₂×S₃ overlaps 6,2,2 → 10/3, complements 0,4,4 → 8/3, sum 6; C₆ f(r)=1≠f(r⁻¹). | carried, unchanged. |
| 0.2 Height linearity | carried | a+a=2a, h+h=2h; t·ev_c changes the value at c by t and no overlap. | carried, unchanged. |
| 0.3 Average character | carried | d=1,2,3 at 1: 1,2,4; at c: 0; d=1 gives (1+χ)/2. | carried, unchanged. |
| 0.4 Conjecture predicate | carried | f=x, g=y agree at (1,1), differ at (1,0); C₆ function outside H_CM. | carried, unchanged. |
| 1.1 Height torus | carried | dimensions d+1=2,3; kernels of order 1,2; pair sums 1,0 vs 1,1. | carried, unchanged. |
| 1.2 Integral level | carried | ℚ₃(√3): π=√3(1+√3) class 1, π² class 0; ℚ(√17,i) at 2: valuations (1,−1), norm cokernel order 2 not 4. | carried, unchanged. |
| 1.3 Étale CM model | carried | inertia 1 in the K₀ level; at full 5-torsion level 2 acts as 3≠1. | carried, unchanged. |
| 1.4 Integral polarized family | carried | rank 2 ↦ dimension 1; scaling by 2 sends determinant 1 to 4. | carried, unchanged. |
| 1.5 Total reflex pair | carried | degrees/dimensions 2/1, 4/2, 8/4; ℚ(i,√2) gives ℚ(i)×ℚ(√−2); −ξ reverses signs. | carried, unchanged. |
| 1.6 Total reflex height | carried | 24/6=4 vs 24/8=3. | carried, unchanged. |
| 2.2 Kisin realization | carried | φ*M=S gives W at u=0 and O_y at E_y(u)=0; E_y(0)=−3 for π²=3. | carried, unchanged. |
| 2.3 Tensor torsor | carried | 1↦1, I↦I; scalar 2 multiplies an alternating form by 4. | carried; locators now §§1.1–1.3 (R02 repaired). |
| 2.4 Bundles/crystals | carried | unit rank 1 filtration 0; H₁/H¹ Hodge indices opposite; W(𝔽̄₃)≠W(𝔽₃). | carried; locators §§3.1, 3.4–3.8. |
| 2.5 Torus action | carried | Norm(3+2√2)=1 but not identity; t/t̄=1; 1/2 not integral on ℤ[i]. | carried; locators §§3.1, 3.4–3.8. |
| 2.6 Quadratic line | carried | f₁²=f_i²=1 vs i²=−1; B((1,i),(1,−i))=4 vs −4. | carried, unchanged. |
| 2.8 Supersingularity | carried | split slopes (0,1), inert (1/2,1/2); endomorphism slopes (1,−1) vs (0,0). | carried, unchanged. |
| 3.1 Determinant | carried | ranks 1,4; diag(π,1,1,1) length 1; ε≠0, ε²=0. | carried, unchanged. |
| 3.2 Partition quotient | carried | empty/full give 0; C/(2√3) length 1. | carried, unchanged. |
| 3.3 Partition length | carried | 1=1−0−0; reversed sign −1; cokernels 1+1−1=1. | carried, unchanged. |
| 3.4 Conductor functional | carried | μ(1)=0, μ(χ_tame)=1, μ((1+χ)/2)=1/2; digit sequence ↦ (2p)^(−n−1). | carried, unchanged. |
| 3.5 Positive lengths | carried | at 3: (2/2)(1/2+1/2)=1; at 2: (2/2)(3/2+3/2)=3; split 0. | carried, unchanged. |
| 3.6 Metrized determinant | carried | r=1 absolute period 2π; d=1 degree 2log(2π)=2^d d log(2π). | carried; locators §§3.1, 3.4–3.8. |
| 3.7 Local reflex comparison | carried | fibers 2^(3−1)=4; F=ℚ: v_q(d_F)=0, Δ length 0. | carried, unchanged. |
| 3.8 Reflex height | carried | Ω/CM=2h; Δ=log1=0; h=ω/(4CM)−log(2π)/2. | carried, unchanged. |
| 4.1 Auxiliary data | carried | ξ=−1 signature (0,2), ξ=1 (2,0); a↦ab adds v(Nm b), ξ/Nm b subtracts it. | carried, unchanged. |
| 4.2 GSpin divisors | carried | B(z,z̄)=−4, norm² 4; no vector of norm −1; f=0 ↦ 0. | carried, unchanged. |
| 4.2a Borcherds support | carried | v_p(D)=1 error 0, v_p(D)=2 excluded; c₀=2 gives 2log(4πe^γ). | carried, unchanged. |
| 4.2b Big-CM degree | carried | 0/Λ(0)=0; 2a/(2d)=a/d. | carried, unchanged. |
| 4.2c Hodge-height identity | carried | 2E/(2c₀d)=E/(c₀d); (1/2)ℤ norms 1/4, 1 ⇒ coefficients 0; −2ℓ(0)−log(D_E/D_F), gamma 0. | carried, unchanged. |
| 4.2d Filtered Hodge adapter | carried | p⁻¹O_E norm valuation 0 vs p²O_E minimum 6; D_F=1 correction 0. | carried; locators §§3.1, 3.4–3.8. |
| 4.3 Average error | carried | 0/(4c₀d)=0; 2E/(8c₀d)=E/(4c₀d). | carried, unchanged. |
| 4.4 Avoiding primes | carried | F=ℚ narrow group 1; (−1)^(d/2)=−1,+1 for d=2,4. | carried, unchanged. |
| 4.5 Error elimination | carried | 2^m3^n=1 ⇒ m=n=0; empty support 0. | carried, unchanged. |
| 4.6 Quadratic average | carried | ℓ(0)=−log4+2logR_Γ ⇒ −logR_Γ−logπ/2 both sides. | carried, unchanged. |
| 5.1 Component invariance | carried | identity: lengths 0; O_L/(2√p) length 1 for odd p. | carried, unchanged. |
| 5.2 Height decomposition | carried | g=1 correction −log1/8=0; 𝔽₂⁴ has 4 idempotents, one element takes ≤2 values. | carried, unchanged. |
| 5.3 Nearby types | carried | (2,1),(4,4),(8,12); opposite square vertices differ in 4 embeddings. | carried, unchanged. |
| 5.4 Nearby average | carried | g2^(g−1)a·2^(1−g)=ga; g=1 correction 0. | carried, unchanged. |
| 6.1 Graph datum | carried | ℚ(√−3): 3 points, graph 3, product 9; graphs of ±1 meet in 0. | carried, unchanged. |
| 6.3 Integral graph | carried | graph order 3, projection kernels 1, Cartier dual 3; product would give kernels 3. | carried, unchanged. |
| 6.4 Nearby identity | carried | (a+b)/2; a=b gives a not 2a; unit different: kernel 0, degree 1. | carried, unchanged. |
| 6.5 Quaternionic graph | carried | δ=2√3 quotient length 1, graph 3; δ=1 gives 0. | carried, unchanged. |
| 7.1 Quaternion datum | carried | inert counts 2,1,0 ⇒ totals 3,3,3; flip ⇒ 2,2,2; 3,7 inert in ℚ(i). | carried, unchanged. |
| 7.2 Point height | carried | 6log2/3=2log2=12log2/6; absolute denominator gives log2; norm(dz)=2 at i, 1+i. | carried; AutomorphicBundles citation removed (R02). |
| 7.3 Hodge-line bridge | carried | degree 2a−b; norm 2→4; tangent rank 1 vs 2. | carried; AutomorphicBundles citation removed. |
| 7.4 Quaternionic average | carried | −ℓ/2−log(d_rel D_F)/4; coefficient of log d_B is 0. | carried, unchanged. |
| 8.1 Self-intersection | carried | i₀=2t, i₀/e=t; multiplicity 2 vs 1. | carried, unchanged. |
| 8.2 Quaternionic height | carried | h_L=−t; ratio reversal flips log(d_rel/d_B)/2. | carried, unchanged. |
| 9.1 Averaged Colmez | carried | d_rel D_F=D_E/D_F; subtract g log(2π)/2 ⇒ orthogonal mean. | carried, unchanged. |
| 10.1 / `relative_class_number_growth` | carried | ratios 1,1; ε=1/8, C=4^(−1/8): lower sides 1 and (3/4)^(1/8)=0.96467863; g=3 regulator ratios 4 or 2. | carried; elaboration and probe rerun above. |
| 10.2 / `distant_cm_isogenies` | carried | degrees 2,4,1 for (1+i),[2],id; B=A minimum 1 ≥ 1, 0.96467863. | carried; elaboration and probe rerun above. |
| 10.3 Individual height | carried | mean 1; 2·1−(2−1)(−1)=3. | carried, unchanged. |
| 11.1 Common polarized field | carried | level group order 48; shear [[1,3],[0,1]] trivial mod 3, fails polarization. | carried; §5.5 locator (R03 repaired). |
| 11.2 Exponent budget | recomputed | δκ=1/8<a=3/16<1/4; εκ=1/16<a. | §5.5 locator; unchanged. |
| 11.3 Primitive orbit | carried | orbits 1,1 at D=4,3; c=4^(−δ) gives 1,(3/4)^δ. | carried, unchanged. |
| 12.1 Center order | carried | D_x=16,36 for conductors 2,3; degree 2 vs 2n. | carried, unchanged. |
| 12.2 Reciprocity image | carried | C₄ doubling: image 2, cokernel 2; ≤2 markings. | carried, unchanged. |
| 12.3 Compact index | carried | J=3, I=4, D=36 vs I²·4=64; exp(2) valuations 1,1,1, exp(4) 3,5,9. | carried, unchanged. |
| 12.4 General reduction | carried | B^s I·3=12 not 48; Bp^η≥√5/2>1. | carried, unchanged. |
| 12.5 General orbit | carried | D≤c^(−1/δ)orbit^(1/δ); conductor 2 gives 16 not 4. | carried, unchanged. |
| 13.1 Coordinate degree | carried | 2·2!=4, 2·4!=48; Z=i degree 2, real/imaginary 1. | carried, unchanged. |
| 13.2 Lattice basis | carried | Gram diag(2,2), diag(2,8): det 4,16; covolumes 1,2. | carried, unchanged. |
| 13.3 Period reduction | carried | det 4m²; L=2ℤ[i] det 64 index 1 vs 4; ζ=i det 1; M+i↦i entry M. | carried, unchanged. |
| 13.4 Lift height | carried | H(i)=1 vs height 1 of X²+1; H(2i)=2 vs 4 of X²+4. | carried, unchanged. |
| 13.5 Bounded-degree finiteness | carried | D_x≤CN^b, height ≤C′(CN^b)^a, degree ≤2(2g)!; j=1728 degrees 1 vs 2. | carried, unchanged. |

### Ownership and shape

The LT.2 search above is the one ownership change this round: the Lubin–Tate character and reciprocity comparison are owned by LubinTateFormalModulesAndQuasiCanonicalLifts (accepted design, merge order line 321), and the crystalline and Breuil–Kisin realizations of p-divisible groups by FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.4.18–R07.4.21; this roadmap keeps the CM multipliers and their comparison modulo the different (§6.2), which neither supplier states. The previous review's ownership table for the other objects is unaffected by the diff. The README's shape is unchanged: 14 layers each with Examples and Dependencies, the new contract paragraph carries three Checks with computed values, no process words, pull-request numbers or LaTeX were introduced (the gate's scanners agree), and the nine original gaps are declared identically in plan and README.

## Not verifiable

- The supplier's LT.2 targets and FiniteFlatGroups R07.4 targets are accepted plans, not implemented results; the report verifies that they state what this roadmap consumes, not that they are proved.
- Journal pagination of the published versions of T12 and PT and the 2023 journal erratum corresponding to YE were not collated this round either; the cited arXiv and author versions are the ones certified.
- Ownership against open pull requests was checked through `roadmaps show` at the indexed heads of #1069 and #879 and the board's packages; open pull requests not in the index were not searched.

## Source issues

- none
