<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1129#issuecomment-6627435026 -->
Red team round 2 pass b (claude) of d5859f5

Verdict: accepted

Round 2. The head carries the round-1 repairs (FIX-RT round 1). I first verified every round-1 finding against the head, then ran the full pass again over the whole of `packages/HeightsRationalPointsAndObstructionsPartII/README.md` (2169 lines, 108 numbered targets) and `packages/HeightsRationalPointsAndObstructionsPartII/Suggested.lean` (111 lines, three `sorry`'d theorems). No new finding survived verification; the S-series is empty.

## Round-1 findings at this head

Pass a = codex (a-F01–a-F10), pass b = claude (b-F01–b-F03). Quotations are at most 40 words.

| Finding | Status | Repaired passage (file:line) and witness |
|---|---|---|
| a-F01 (P2) RREF uniqueness owner | repaired | README:1517 "Existence and uniqueness of reduced row echelon forms over an arbitrary field are ClassicalArithmeticCompletion §3.19". Contract README:143–145; Needs README:1525. `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:5886` "### 3.19 Change of basis and uniqueness of the reduced row echelon form" with `IsReducedRowEchelon.eq_of_mul` (:5898). Check README:1523 recomputed: span(2,2a) ↦ (1,a); 0 and I. |
| a-F02 (P3) translation and k_{A,X} | repaired (differently, correctly) | README:1568 "translation by (η, 0) lies in the stabilizer and leaves X and k_{A,X} = k unchanged, whereas translation by (0, η) gives E×{η} … its field is k_{A,X} = K". Recomputed: E×{η} special for k′ ∈ I(K/k) iff η ∈ E(k̄′)+tors iff η ∈ E(k̄′) iff K algebraic over k′ iff k′ = K. The reviewer's "acl(k(E)) in K̄" is not in I(K/k); the repair's K is. |
| a-F03 (P1) function-field constant 1 | repaired | README:2053 "ε_α = 1 for number fields and ε_α = 1/d_α for function fields, d_α = [K(α) : K]"; route README:2057; Check README:2064. Recomputed with Yuan's normalization (yuan-2026 lines 2403, 2417–2424: ĥ = ½ĥ_Θ, Θ = θ+[−1]^*θ, weights [k(v):k]/[K′:K]): ĥ(Q) = ½(θ·C + [−1]^*θ·C) = 2, ĥ(Q_N) = 2/N², ĥ(2Q_N) = 8/N²; d_α·ĥ(Q_N) = ½(a+b) with a, b ≥ 1 integers so d_α ≥ N²/2; corrected right side ≤ 10c₁/N² < 2/N² for c₁ < 1/5. Conversion factor [F:k(y)]/[F:K] ≥ 1/(M d_α), and h_Fal + 1/(M d_α) ≥ max{h_Fal, 1/d_α}/M: direction correct (smaller threshold, smaller set). |
| a-F04 (P2) total degree two-valued | repaired | README:159 "For an integral Z of dimension d put deg_L Z = … Thus the total degree of a closed subscheme is the total degree of its reduced support". Check README:182: Spec k[ε]/(ε²) in ℙ¹ gives 1 versus cycle degree 2. Route README:163 and API README:167 agree. |
| a-F05 (P2) level marking | repaired | README:272 "classify isomorphism classes of triples ((A, λ, η), X) with … η a full symplectic level-4 structure"; Check README:291: 48 symplectic bases, −1 acts as −I, 24 points. Recomputed: |SL₂(ℤ/4)| = 4³(1−1/4) = 48; 48/2 = 24. |
| a-F06 (P3) three locators | repaired | README:135 "yamaki-strict-support §§3.1–3.2, (3.0.13)–(3.0.14), pp. 12–15" (source lines 521, 581 confirm §3.1 p. 12, §3.2 p. 14); README:603 "ArakelovGeometryAndAbelianHeightsPartII §5.4, part (2)" (design README:1411 "5.4 Height inequality and equidistribution", part (2) is equidistribution); projection bullet settled under b-F01. |
| a-F07 (P3) constant curve may be a torsion subvariety | repaired | README:1341 "a smooth curve C₀ ⊆ A₀ of genus at least two, C₀ ⊗ K̄ is special though it is not a torsion subvariety … C₀ = E×{0} ⊆ E² … satisfies both predicates". |
| a-F08 (P2) §9.3 consumed later §9.4 | repaired | README:1511 "### 9.3 Fields of definition of subvarieties (XY Lemma 3.4)"; README:1527 "### 9.4 Isogeny classes defined over two subfields"; README:1540 "*Needs:* §9.3; §9.2; §9.1"; README:1533 uses "subvariety-field-descent" after it is stated. §9.5 Needs (README:1555) still valid. |
| a-F09 (P3) three Checks | repaired | README:315–316 (E×S dims 3 vs 4; 2x = s four components; two-point fibres), README:878–879 (scaling by 7; origin at [1:T:0:…]), README:1709 (X = t+B: X_m = mt+B, X₂ = X₁ iff t ∈ B). All recomputed true. |
| a-F10 (P1) bounded covers unowned | repaired | README:1378 "InverseGaloisAndArithmeticFundamentalGroups §IG.3.1, "Finitely many covers of bounded degree"…"; contract README:149; Needs README:1386; Layer 8 Dependencies README:1469. IG at #850 head: README:2555 "### IG.3.1 Riemann existence for curves and the topological input", :2585 "**Finitely many covers of bounded degree.** Let X be a connected smooth quasi-projective variety". 𝔾_m Check: D classes zⁿ, compositum k(z^{1/lcm(1..D)}). |
| b-F01 (P3) projection inequality misattributed | repaired | README:171 own proof "write L^{⊠M} = q^*L ⊗ N … the term binom(d, e)·(q^*L)^e N^{d−e} ∩ [Z] is at least deg_L q(Z)" and "GGK uses this inequality in the proof of its Lemma 2.4 (ggk-2026 lines 377–380, p. 197)". Source lines 377–380 confirm the step and its attribution to [13, Lem. 2.4]. Proof checked: scaling by L^n gives n^d on the left, n^e·n^{d−e} on the right; instance Z = {P}×X: 1 ≤ deg X. |
| b-F02 (P3) Yuan line/page pairs | repaired | README:662 "lines 110–118, §1.1, p. 4"; :811 "lines 110–116"; :968 "lines 121–135"; :1172 "lines 129–135"; :2034 "lines 2740–2830, §4.4.3, pp. 81–84". Page markers: p. 4 at line 103, p. 5 at 140; p. 82 at 2755, p. 84 at 2821; all consistent. |
| b-F03 (P2) compound tropical gap | repaired | README:135–141 four contracts gap:abelian-valuation-map, gap:abelian-canonical-measure, gap:strict-support-dimension, gap:nonarchimedean-small-point-equidistribution; `design/plan.json` `gaps` has the same four slugs and texts (diff against main touches only the gaps list); §9.12 Needs README:1671 and Layer 9 Dependencies README:1796 cite all four. |

No repair introduced a new error: the twelve changed passages were re-derived (table above and the adversarial table below).

## Findings

None. No S-series finding is raised. Three non-finding notes for the maintainer, none of which changes a statement: the §6.2 *Needs:* line (README:1092) cites InverseGaloisAndArithmeticFundamentalGroups IG.2 (Hilbert irreducibility), which the displayed Masser route does not use; the range "JacobianChallengePartII §§3.2–3.13" includes a §3.8 that the supplier's head skips (3.7 → 3.9); §5.6 states and proves deg X′ ≤ (deg_L X)^{2 dim X} where ggk-2026 line 1794 has a strict inequality (the README's own proof reaches equality at r = 2, i = 1, and every consumer uses ≤).

## Verified sound

Counts: 3 Lean declarations read with their binder context and compared with the pinned carriers; 108 README targets read; 124 source line anchors resolved in the numbered extractions (yuan-2026 22, ggk-2026 27, dgh-2021 24, xy-2022 19, gh-2019 6, kuhne-2021 4, dky-2020 5, remond-2000-vojta 2, yamaki-2018 1, masser-1989/1996 2, dmy-2026 1, david-philippon-2002 3, yamaki-strict-support 6, yuan-zhang-adelic 2); 47 Checks recomputed (listed in the adversarial table); 221 sibling section citations resolved at the heads named in the brief or on main (HeightsRationalPointsAndObstructions 58 headings at #1017, AbelianSchemesAndArithmeticModuli 8 at #849, AbelianSchemesAndArithmeticModuliPartII 20 at #1405, ArakelovGeometryAndAbelianHeights 9 at #1000, JacobianChallengePartII 30 at #1225, PELModuli 5 at #966, AlgebraicModuliForArithmeticGeometry 3 at #853, ComplexComparisonPartII 1 at #848, NeronModelsAndSemistableAbelianVarieties 16 at #852, TropicalAndBerkovichArithmetic 4 at #1494, ArithmeticDynamics 12 at #1335, InverseGaloisAndArithmeticFundamentalGroups 2 at #850, ClassicalArithmeticCompletion 1 on main, SchemeAndStackFoundations 12 on main, JacobianChallenge Layer F and AlgebraicCurves Layers 10–11 on main, ArakelovGeometryAndAbelianHeightsPartII 27 and StableReductionPartII 7 in the board design READMEs).

Dependency gate, run as instructed (read-only):

    depcheck: 204 roadmaps, 1754 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line for HeightsRationalPointsAndObstructionsPartII. The citation resolver's single lead ("ArakelovGeometryAndAbelianHeightsPartII §§3.1: no roadmap … on main or in an open pull request") is a false positive: that roadmap is the board design package `packages/ArakelovGeometryAndAbelianHeightsPartII/design/README.md`, whose §3.1 is at its line 881, and it precedes this roadmap in the merge order given by the brief.

Policy: `git diff --stat origin/main...HEAD` touches only the package folder (README, Suggested.lean, design/plan.json gaps list, metadata.toml, reports, sources.toml); no `lemma`, no `set_option`, no pull-request number or process narrative in README or docstrings; every target carries a locator; no computational algorithm; `sources.toml` has 17 keys, two settled `uncertified`, no machine path.

### Suggested.lean declarations

Context of all three: `F : Type u`; `X : Over (Spec (.of F))` with `[Smooth X.hom] [IsProper X.hom] [GeometricallyIntegral X.hom]` and `topologicalKrullDim X.left = 1`; `x₀ : 𝟙_ ⟶ X`; `J : AbelianVariety F`; `a : X ⟶ J.toOver`; `AbelianVariety.IsAlbanese x₀ a`; `J.dim = g`; `2 ≤ g`; the point group is `MonObj.Hom.group` on `𝟙_ ⟶ J.toOver` (its multiplication is the abelian-variety addition). Pinned carriers checked: `IsAlbanese` at TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.lean:84 (fields `comp_eq_one`, `existsUnique_fac`, a universal property, not a free predicate); `AbelianVariety` at Basic.lean:95 with `grpObj` as instance (:109) and `dim = topologicalKrullDim A.toScheme` (:117); `Smooth` at Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:59; `IsProper` at Morphisms/Proper.lean:41; `MonObj.Hom.group` at Mathlib/CategoryTheory/Monoidal/Cartesian/Grp.lean:58. The import `TauCeti.AlgebraicGeometry.AbelianVariety.Albanese` exists at the pin.

| Declaration (README §) | Instances tried, values | Result |
|---|---|---|
| `uniform_maninMumford_curves` (§3.6) | B quantified before F, X, J, c: depends on g only. c = [x₀]−D gives (x≫a)·c = [x]−D, so the set is ι_D(C) ∩ Jac_tors. D = [Q]: c = −a(Q), a(Q)+c = 0, Q counted; the sign error +a(Q) would give 2a(Q), infinite order for non-torsion a(Q). g = 1 excluded by 2 ≤ g (every point of E is [q]−D, torsion infinite). Stoll's curve forces B ≥ 34. | sound; matches kuhne-2021 line 242 (Theorem 2, over ℂ, D of degree 1) plus the specialization step of §3.6 for arbitrary F |
| `uniform_mordellLang_curves` (§6.8) | ρ = 0: s = ∅, closure = {1}, hypothesis p^n = 1 with n > 0 admits exactly torsion; bound B. n = 0 would admit every p (p⁰ = 1), excluded. Division hull of one non-torsion P: s = {P}, ρ = 1, bound B². Hypothesis ⇔ rk Γ ≤ ρ (a maximal independent subset has ≤ ρ elements; conversely ⟨s⟩ has rank ≤ ρ), and B^{1+rkΓ} ≤ B^{1+ρ} since B ≥ 1. | sound; matches kuhne-2021 lines 322–329 |
| `uniform_rationalPoints_curves` (§6.8 remark, §6.12) | F a number field; all of J(F) in the division hull of ⟨s⟩ ⇔ rk J(F) ≤ ρ (Mordell–Weil). ρ = 0: bound B; the rational base point contributes 1 ≤ B. X(F) = ∅ makes the statement vacuous (no x₀), consistent with count 0. [F:ℚ] never enters. | sound; matches kuhne-2021 lines 330–333; implies dgh-2021 line 38 Theorem 1.1 |

Headline inventory versus the file: statable headlines (§§3.6, 6.8, 6.12 curve bounds) are stated; the module docstring names the eleven non-statable headline groups with their missing carriers (polarization degrees, general canonical heights, adelic bundles, geometric trace, twice-theta heights, Ueno complements, diagonal-lift polarization), and I agree with each: none is statable at the pins without a stand-in. No padding, no sorry'd data, no `#check`, no `set_option`, one `import Mathlib` plus one existing `TauCeti.*` module, docstrings claim no more than the README. Every Lean name appears in the README (§§3.6, 6.8, 6.12) and no backticked own name of the README is undeclared. Ownership: `roadmaps grep` over main and the 441 open heads finds the three fully qualified names nowhere else and no other roadmap stating uniform Manin–Mumford, uniform Mordell–Lang, uniform Bogomolov, the new gap principle, geometric Bogomolov (Gao–Habegger or Xie–Yuan) or the bielliptic dynamics theorems; the hits in GrossZagierAndArithmeticHeights, TropicalAndBerkovichArithmetic, ShimuraCompactifications, ArithmeticDynamics, CanonicalModelsAndGonality and GroupActionsOnRiemannSurfaces are citations of Yuan or DeMarco–Krieger–Ye, or the word "bielliptic" in another sense.

### Adversarial pass, one row per statement

Section references are to `packages/HeightsRationalPointsAndObstructionsPartII/README.md`. Each row records the instances and the values computed on both sides.

| Statement | Instances, values | Result |
|---|---|---|
| Conventions: pairing | ĥ(P) = 1: ⟨P,P⟩ = (4−1−1)/2 = 1; parent's unhalved `self` = 2ĥ gives 2 | consistent, documented |
| Conventions: projective heights | [2:1]: log 2 over ℚ and ℚ(i), relative ℚ(i)-height 2 log 2; [1:1/(t²+1)] over ℝ(t): 2; over ℂ(t) with k = ℝ: 4/2 = 2 | consistent with parent §0.12 (h_K′ = [K′:K]h_K) |
| Conventions: 𝔏_g⁴ | c₁(𝔏_g) = 2c₁(L): deg_{𝔏⁴} X = 8^r deg_L X, ĥ_{𝔏⁴} = 8ĥ_L = 4ĥ_{L⁺}; genus-two Abel curve: 2 and 16 | matches ggk-2026 lines 890, 918 |
| Conventions: native elliptic height | Tau Ceti canonicalHeight = lim h(x(2ⁿP))/4ⁿ = ĥ_x = 2ĥ_{O(0)}; ArithmeticDynamics §6.64 (its line 9636) ĥ_f(x(P)) = canonicalHeight/[K:ℚ] and DKY (2.2) ĥ_E = ½ĥ_f∘x | h_E = ĥ_Lattès/2 is the degree-one height, as stated at README:149 |
| §0.1 degree | point k: 1; degree-2 point: 2; line/conic: 1/2; Abel curve: g; line + exterior point: 2 vs top part 1; doubled point: 1 vs cycle 2; line ∪ point on it: 1 < 2 | true |
| §0.1 projection bullet | Z = {P}×X: 1 ≤ deg X; scaling by L^n: n^d vs n^e·n^{d−e}; binomial terms nonnegative by nefness | true |
| §0.2 | ℙ¹, M = 2, Z = Δ, Σ = {a,b} with a ≠ b: (a,b) ∉ Δ; Σ = {a}: one point; GGK proof (lines 826–868) case (ii) uses X″×{x} = (X×{x})∩Z′ with deg X″ ≤ deg X·deg Z | true; route faithful |
| §0.3 | M = 1: Bézout count deg C·deg Z; B = c+1 | true |
| §0.4 | ρ = 0: 1 = (1+2R/r)⁰; S = [−r,r], R = r: 1 ≤ 3; S = ∅: 0; r → 0 excluded; maximal separated set is an r-cover, disjoint r/2-balls inside B(x₀,R+r/2): ((R+r/2)/(r/2))^ρ | true; Mathlib `coveringNumber` (CoveringNumbers.lean:74) is internal (C ⊆ A) as claimed |
| §1.1 | E, O(3·0): Hilbert polynomial 3n; r = dim A, d = deg A: one point; union of two fibres excluded; V ∩ H° nonempty open in irreducible V is dense | true |
| §1.2 | deg_{𝔏⁴}E = 8; genus-two C in H°_{1,16}; 48/2 = 24 marked points | true |
| §1.3 | E×S: dims 3 vs 4; {2x = s}: fibred square has four components x₂ = x₁+τ; two-point fibres: four-point squares | true; negative controls for geometric integrality |
| §1.4 | V a point: m₀ = 1; translates E×{b}: (0,b) pins b | true |
| §1.5 | S a point: isomorphism, m₀ = 1 | true |
| §1.6 | X_s = A_s: complex dim mg+dim S vs real torus 2mg, degenerate for every m when dim S > 0 | true |
| §1.7 | Abel curve g ≥ 2: in H°_gen; proper abelian B: Stab infinite; X = A: Stab = A | true |
| §1.8 (ii) | complement of the proper image is open, smooth structure map is open, so non-generation is open and generation closed | true |
| §2.1 | Legendre: level 2 only, [−1] fixes level-2 structure; level 3 after finite étale cover | true |
| §2.2 | constant family: θω = ϑ·ω; d(θω) = dθ∧ω; [2]^*: factor 4 | true |
| §2.3 | N = 1: diagonal, F = O(1,1); torsion constant section: X_N ⊆ {P₀}×{0}×S; dgh-2021 line 720: h([N]P) = h(P′_N)+h(π(P)) | true; h is DGH's total-space height |
| §2.4 | constant section: (θω)^d integral 0, no κ; exponent 2d | true |
| §2.5 | d = 1: (M) bounded independently of N | true |
| §2.6 | E of embedding degree 4, S a point, N = 2: deg F = 4·4 = 16, deg M = 0, vol(F−tM) ≥ 16−0 > 0; torsion section of non-isotrivial family: ĥ = 0, h(π) unbounded, degenerate | true |
| §2.7 | ĥ(P) ≥ (c₁−c₀/N²)h(π(P)) − (c₂(N)+c₀)/N²; N² ≥ 2c₀/c₁ keeps slope ≥ c₁/2; no division by ĥ | true |
| §2.8 | S a curve, X not generically special: GH Theorem 1.4; X open: smaller U | true; AGAHII §5.4 (design :1411) is the owner, as stated |
| §3.1 | S a point, X = A: Haar; torsion section: ω|_X = 0; μ_X vacuous-consistent when no small generic sequence exists | true |
| §3.2 | S a point: Szpiro–Ullmo–Zhang; compact support needed; torsion section excluded; uniform form by contradiction yields a generic small sequence | true |
| §3.3 | dim S = 0: Ullmo–Zhang; finite stabilizer handled by averaging | true per ggk-2026 line 1017 |
| §3.4 | principal case via H°_{r,8^r d}; general: ĥ_{L₀}(x₀) = ĥ_L(x)/n², threshold rescaled by n² = (l/g!)², degree by n^{2(r−1)} | true |
| §3.5 | ĥ(P−P₀) ≤ 2ĥ(P)+2ĥ(P₀) ≤ 4c₃; threshold ≤ c″₃/4; components of P₀+Y′ of bounded degree, smaller dimension; a point of X° in a component lies in that component's Ueno complement | true; ggk-2026 lines 1690–1700 |
| §3.6 | X = ι_D(C): deg_Θ = g, generates, X° = X; (g,d) = (g,g); torsion height 0 ≤ c₃ | true; Kühne Theorem 2 over ℂ, F-extension by specialization |
| §4.1 | translation preserves degree (algebraic equivalence); P_s from a quasi-section; arithmetic Bézout | true, dgh-2021 line 1243 |
| §4.2 | dim D_M(C^{M+1}) ≤ M+1, Z proper so dim ≤ M; (C−P)^M ⊆ Z forces equality and C−P₀ = C−P₁; count ≤ #Stab(C) ≤ 84(g−1); g = 1 control: image E₀^M, count 0 = 84·0 | true |
| §4.3 | c₃ = 2M/c: Mh/c₃ = ch/2 ≥ ch − c′ iff h ≤ 2c′/c, so threshold c₁ = 2c′/c | true |
| §4.4 | dim S = 0: constant minus c′₃ can be made empty; degree bound uniform in s | true, ggk-2026 line 718 |
| §4.5 | (4.11) at ggk-2026 line 911: max{1,h_Fal} ≤ c h_M + c′ log(h_M+2) | locator and direction correct |
| §4.6 | Lemma 2.2(iv) (line 312): u₀ of degree n = deg_L A/g!, L ≅ u₀^*L₀; quasi-inverse u with u∘u₀ = [n] exists since a group scheme of order n is killed by n; u^*L ≡ n²L₀; degree factor n^{2(r−1)}, n = 2, r−1 = 1: 4 | true |
| §4.7 | B = max{1, 2c′₃/c′₁}; H > B: c′₁H−c′₃ ≥ c′₁H/2; H ≤ B: c₁B ≤ c″₃; c₂ = max | true |
| §4.8 | deg_L A bounded via ⟨X−X⟩ = A and the sum-degree bound; min/max over finitely many (l,r,d′) | true |
| §4.9 | X = C−y: degree g, X° = X; ĥ_{L⊗[−1]^*L} = 2ĥ_L for symmetric principal L | true |
| §5.1 | Γ = A_tors: 0; E: y² = x³−2, (3,5): 25 = 27−2, rank 1; division hull of ℤP: dimension 1 | true |
| §5.2 | O(2·0): h⁰ = 2, not very ample; O(3·0): plane cubic; scaling by 7: h₁ unchanged; origin to [1:T:0:…]: c_NT ≥ log T | true |
| §5.3 | (8.4) and (8.7) at dgh-2021 lines 1536–1545; conversion to h_Fal by Faltings' two-sided comparison | true |
| §5.4 | n = deg_L A/g! − 1 = h⁰(L) − 1; cone condition necessary (orthogonal points) | true; remond-2000-vojta lines 187, 223 |
| §5.5 | dim X = 1: Mumford's gap; positive-dimensional fibre: no bound | true |
| §5.6 (own proof) | theta curve, L = 3Θ: D = 6, X∩(X−c) has Θ² = 2 points ≤ 36; X = [3]⁻¹Θ: stabilizer 81, D = 54, 81 > 54 but 81 ≤ 54²; r = 2: i = 0 gives D², i = 1 gives D⁴; r = 0, Ξ = ∅ cases | true; README proves ≤ where source line 1794 has < |
| §5.7 | [3:5:1]: coefficient log 5, Fubini–Study ½log 35, difference ½log(7/5) < ½log 3 | true |
| §5.8 | N′ ≥ bound for X′ of degree ≤ D^{2r} ≤ D^{2g}; non-strict cutoff after enlarging the constant | true; curve case dgh-2021 lines 1517–1525 |
| §5.9 | Γ = A_tors: uniform Manin–Mumford; X° = ∅: trivial; Weierstrass Abel curve: c₀ = 1 for Γ = {0}, fails (2 > 1) for Γ = {0,τ} | true |
| §5.10 | rank 0: uniform Manin–Mumford count; reduction to generating X raises rank by 1 and squares the constant | true, ggk-2026 lines 1460, 1834–1838 |
| §5.11 | (X†−Q)° ∩ Γ† with rk Γ† ≤ rk Γ+1: c^{rkΓ+2}; c₀ = max{c₁⁻¹, c₃} | true, line 1518 |
| §5.12 | g = 2, L = M¹⁶: D = 32, (4g²)¹ = 16, Q = (2³²·h₀·32)¹⁶ = 2⁵⁹²h₀¹⁶; six 2-torsion differences of height 0, 6 ≤ Q; (b) r = 0: Q; Théorème 1.3 at david-philippon-2002 line 122: q(X)(5aq(X))^{r/2}, monotone in q | true |
| §6.1 | Γ = A_tors: count ≤ c(g,d); X = A: X° = ∅ | true |
| §6.2 | Legendre at x = 2: μ² = 2(2−λ); μ = 0 ⇔ λ = 2, (2,0) of order 2; Masser 1989 Main Theorem w ≤ Ch^κ, Scholium 1 w ≥ exp(ch) (lines 45–56); Masser 1996 Theorem (line 127); shrinking to an open costs a bounded w by subadditivity | true |
| §6.3 | bounded coset directions are finite étale over a dense open (parent §5.13c, its line 2645): E×E_λ example: isogeny graphs of bounded degree occur at finitely many λ | plausible and consistent with parent |
| §6.4 | F = ℚ̄: identity; only finitely generated Γ | true |
| §6.5 | (1/n)Γ₀/Γ₀ ↪ A[n] finite, rank ρ; filtered union | true |
| §6.6 | X° = X: count itself; Γ_B ≠ Γ ∩ B^⊥ | true |
| §6.7 | curve: c(g)^{1+rk}; Γ = A_tors: ≤ c(g,d) torsion cosets | true, ggk-2026 line 69 |
| §6.8 | ρ = 0 and n > 0 as in the Lean row; Γ = Jac_tors recovers §3.6 | true |
| §6.9 | threshold c₁ on h(τ(s)); packing with R = (c₀h)^{1/2}, r = (h/c₃)^{1/2}: (1+2(c₀c₃)^{1/2})^{ρ+1} | true, dgh-2021 line 1473 |
| §6.10 | ρ = 0 is Corollary 1.3; ι-dependence | true, lines 95–105 |
| §6.11 | level over F′ of degree ≤ #GL_{2g}(ℤ/ℓ); Northcott needs bounded degree | true |
| §6.12 | polynomial growth in d: dgh-2021 lines 1648, 1662–1666 (D ≤ [F′:F]d) | true |
| §7.1 | point: both sides h(P); A or torsion coset: 0; reference-field change ×[E:K], coordinate-field change none | true; yuan-2026 lines 2417–2424 |
| §7.2 | e₁ ≥ h ≥ (Σe_i)/(d+1) ≥ e₁/(d+1); point: equality; yuan-zhang-adelic line 6219 Theorem 5.3.3 | true |
| §7.3 | torsion: dense; trace-free non-torsion: ĥ > 0; constant E₀ point of infinite order: ĥ = 0; quadratic twist: zero K/k-trace, constant over k(√t) | true |
| §7.4 | point special iff in tr(T(k̄))+tors; genus ≥ 2 constant curve: special, not torsion coset; E×{0}: both; non-torsion translate: not special | true |
| §7.5 | sums of height-zero points have height zero (kernel is a subgroup); dense product maps to dense sum | true |
| §8.1 | constant A: fails; D = 1: A(K)_tors finite; 𝔾_m: D classes, lcm(1..D) | true, gh-2019 line 2688 |
| §8.2 | V₀ a point: Manin–Mumford; constant A, diagonal: dense, not a product | true, gh-2019 line 512 |
| §8.3 | torsion multisection: ĥ = 0, h(π) unbounded; X = 𝒜: empty; vertical X: π(X) a point | true, gh-2019 line 151 |
| §8.4 | h_S ≤ c(1+ĥ(σ_x(t))) and ratio → ĥ_K(x) give ĥ_K(x) ≥ 1/c | true |
| §8.5 | number field: Weil heights; trivial nef non-big B: O(1) ≤ c(1+O(1)); gh-2019 line 2606 writes h^B_{S̄,M}(P) for π(P) | true; gap declared |
| §8.6 | Moriwaki heights, big polarization for the limit; constant-field extension preserves ĥ(X) (parent §0.33, its line 482) | true |
| §9.1 | every A over K; A₀⊗K; Legendre non-constant j | true |
| §9.2 | specialization at a k-point of a constant-abelian-scheme homomorphism with finite kernel | true, xy-2022 line 485 |
| §9.3 | span(2,2a) ↦ (1,a); zero/full ↦ 0/I; RREF of a k₁-form stays RREF over K and is row-equivalent to every basis matrix of W | true; CAC §3.19 states existence and uniqueness over any field |
| §9.4 | trdeg(b,τb,c/k) = 2e−d₁; δ′ = 2δ−d₁+a; a ≤ e−d₂ = d₁−δ ⇒ δ′ ≤ δ; k₁ = k: descent lemma; k₁ = k₂ ⊋ k: counterexample | arithmetic correct, xy-2022 line 478 |
| §9.5 | constant A: k_A = k; Legendre: acl(k(j)) = acl(k(t)) | true |
| §9.6 | F ⊆ k̄′ ⇔ F″ ⊆ k̄′ ⇔ F″∩K ⊆ k′ for k′ algebraically closed in K (k̄′ conjugation-stable; F″ algebraic over F″∩K); E×{η}: field K; (η,0): field k | true |
| §9.7 | ℙ², pencils through a point: k′ = k(y/x); normalization needed | true, xy-2022 line 626 |
| §9.8 | constant E: generic point has positive height over k, zero over k(E); ℙ¹×ℙ¹: (pr₁^*O(1)·F) = 0, (H·F) = 1 | true |
| §9.9 | k_{A,X} ⊆ k₁ ∩ k₂ = k | true, xy-2022 line 462 |
| §9.10 | zero section: order 1, degree 1; Legendre (0,0): order 2, degree 1 | true |
| §9.11 | [m]^*ℳ ≅ m^iℳ: m^{2g} vs m^{2g+i} forces ℳ·[ℒ]^g = 0; elliptic O(2·0): class 2[0] | true, xy-2022 line 787 |
| §9.12 | yamaki-2018 line 236 Theorem 1.5 (a)⇔(b)⇔(c) with (c) for 𝔪/t; quotient by the trace image is trace-free by Poincaré reducibility | true |
| §9.13 | (c) after finite extension; (d) via Yamaki; X over a finite extension | true |
| §9.14 | X₀ = {0}, X₁ = X; Abel curve: dims min(m,g); {x}: {mx}; t+B: mt+B, X₂ = X₁ iff t ∈ B | true |
| §9.15 | uniqueness of r: after X_r = a+B, X ⊆ a′+B so no later jump; B through 0: r = 1; genus-two C: r = 2; point: no jump | true; source lacks dim X ≥ 1 |
| §9.16 | dim f⁻¹(A′_{e+1}) ≤ dim(X_{r−1}×X) − 1 ⇒ dim A′_{e+1} ≤ dim A′ − 2 | true |
| §9.17 | [𝒯] ≡ a[ℒ_{𝒜′}]^{dim A′} with a = deg(𝒯/S)/deg ℒ_η > 0; E×E: H₁² = H₂² = 0, H₁H₂ = 1, M·L = 1 ≤ L² = 2, (M+½L)² = 3/2 | true |
| §9.18 | dim 0: kernel of ĥ is torsion when trace is 0; preimage of a dense set under surjective f is dense; A×A satisfies (a)–(d) | true |
| §9.19 | special ⇒ dense small points (easy direction); constant A: Y⊗K̄ special | true, xy-2022 line 101 |
| §10.1 | C², Z three fibres: codim 1, degree 3, Σ = {a,b,c}: 3 ≤ 3¹; exponent 1/m would give 3 ≤ √3; constant family not potentially big | true; yuan-2026 line 2175, Lemma 4.3 line 2235 |
| §10.2 | 𝔸¹, k(t): t non-isotrivial, constants isotrivial; k = ℝ, K = ℂ(t): i isotrivial | true |
| §10.3 | Theorem 4.10 at line 2745: K of one variable over any k, non-isotrivial y | true |
| §10.4 | Proposition 4.16 at line 3300: m ≥ dim S; dim S = 0 with m ≥ 1 | true |
| §10.5 | Theorem 4.17 at line 3335: thresholds dim S, dim S+1, dim S+g, dim S+1, dim S+g | true |
| §10.6 | torsion section: no property; zero section: never; genus-two curve over a number field: Bogomolov | true |
| §10.7 | m = 2, coordinates ≤ ε/4: sum ≤ ε/2 < ε; m = 0: empty sum 0 | true; Proposition 4.18 line 3406 |
| §10.8 | Theorem 4.19 at line 3417: thresholds +1; genus two: C−C = J has dense torsion at m = 1 | true |
| §11.1 | constant C₀, α = O(x) with x generic: C isotrivial, pair not | true, line 2462 |
| §11.2 | Lemma 4.8 at line 2495: (a)⇔(b)⇔(c); g = 2: shift 2α−ω; [2] finite in characteristic 2 | true |
| §11.3 | noetherian induction over J; vertical strata not flat over ℤ | consistent with lines 2568–2572, 2816–2830 |
| §11.4 | 2ĥ(y)+h_Fal+C+1 ≥ ĥ(y)+max{h_Fal,1} since h_Fal+C ≥ 0; y = ω−(2g−2)α: (2g−2)(x−α) | true |
| §11.5 | deĝ(M̄|_y) ≥ 2ĥ(y)+h_Fal(X_{s,k(y)})+1 at line 2706 | true |
| §11.6 | horizontal strata by Theorem 4.10; finitely many vertical characteristics by the geometric lemma from Theorem 4.2(2) | consistent with lines 2822–2830 |
| §11.7 | see a-F03 row: 2/N², 8/N², d_α ≥ N²/2, 10c₁/N² < 2/N² for c₁ < 1/5; torsion x−α: 0 ≤ right side | corrected statement true |
| §12.1 | three common branch values, kernel of Φ of order 4 | true, dky-2020 line 2009 |
| §12.2 | 4 lifts × 4 preimages = 16 per common coordinate; Stoll 34 ⇒ B ≥ 34 | true, lines 41, 53 |
| §12.3 | ĥ_{L_D} = ĥ_{O(O₁)}+ĥ_{O(O₂)} = ½ĥ_{t₁}∘x + ½ĥ_{t₂}∘x; 2-torsion translation preserves the quadratic height | true, line 192 |
| §12.4 | Proposition 9.2 at line 2079 | true |

### Supplier, gap and ownership audit

Every cross-roadmap citation was resolved at the head the brief names or on main (list above). Statements relied on were read: AbelianSchemesAndArithmeticModuliPartII B2.3 is the curve-field bounded-degree torsion assertion that §8.1 extends; B4.5 needs m ≥ dim S, generic finiteness and (a)–(c) as §1.6 says; B2.22 is curve degeneracy ⇒ generic specialness as §8.3 uses; ArakelovGeometryAndAbelianHeightsPartII design §0.5 includes the geometric nef Siu inequality, §4.8(1) is the big-bundle height inequality, §5.4(2) is the generic-sequence equidistribution, §6.4 is stated for big polarizations (so gap:moriwaki-silverman-tate-nef is exactly the missing nef comparison), §12.4 states the product-grid bound with exponent 1/d and finiteness of Σ, §12.5 is theta potential bigness, §12.6 the cross-characteristic restriction, §13.1 the function-field Faltings height with Yuan's normalization, §13.7 Bost's bound in Faltings' normalization; TropicalAndBerkovichArithmetic §7.0 constructs the rank-one Raynaud uniformization and a tropicalization of E^an but not the descended functorial, product-compatible val_A, so gap:abelian-valuation-map asks for something not yet provided; ArithmeticDynamics §6.64 gives ĥ_E = ½ĥ_Lattès∘x; the parent's §§0.12, 0.29, 0.33, 1.11, 5.7, 5.8, 5.9b, 5.13c, 5.15 state what §§2.7, 7.1, 7.5, 8.4, 8.6, 9.15, 9.18, 6.3, 3.3 consume; ClassicalArithmeticCompletion §3.19 states existence and uniqueness over any field; StableReductionPartII MC.7 carries the two export targets by the names cited. Internal build order: every *Needs:* edge points to an earlier section or to the simultaneous-induction pair §5.10/§5.11, which the Layer 5 Dependencies paragraph makes explicit.

The eight declared gaps have the same slug, supplier and `needs` in `design/plan.json` (whose diff against main is the gaps list only) and under the README contracts. Each is one claim with its hypotheses (the fourth tropical gap's second clause, α_*μ_Z = μ_Y, is the immediate consequence of the first on orbit measures, as yamaki-strict-support lines 1335–1338 show), none has supplier `none`, and none asks for what the pins, main or the cited heads already provide. They are conditional contracts, not findings.

## Not verifiable

- Elaboration of `Suggested.lean` and the `#check @name` comparison: the brief allows no Lean command here, and the worker's signatures file records a failed elaboration (missing TauCeti object file in that environment). The round-1 repair report records `lake env lean` exit 0 at this head with the three expected `sorry` warnings, and the file is unchanged since round 2 of the package. Everything above about the Lean statements is by reading against the pinned sources.
- remond-2000-decompte and david-philippon-2007 are settled uncertified: their statements were checked only through the restatements in ggk-2026 (lines 1755–1833, 1478–1514) and david-philippon-2002 (line 183).
- The formulas inside the four tropical gaps (yamaki-strict-support (3.0.13)–(3.0.14), the §5.3 simplex decomposition) were located, not re-derived.
- ArakelovGeometryAndAbelianHeightsPartII and StableReductionPartII are board design packages; their section numbers may still move at package stage.
- Ownership was checked against main and the 441 open roadmap pull requests of the 2026-11-04 index; nothing outside that index was searched.

## Source issues

- **Error** in yuan-2026 at Theorem 1.1, p. 5, and §4.4.2, pp. 80–81 (lines 141–150, 2716–2721, 2734–2735): the source keeps the additive constant 1 after allowing a degree-one class defined only over a finite extension while heights stay normalized over the original function field; it should be 1 divided by the degree of the field generated by the class (or the heights should be renormalized over that extension); affects a stated result.
- **Misprint** in ggk-2026 at Theorem 1.3, p. 192 (line 166): the two constants are both written c₃; it should be c₃ and c₄; affects nothing.
- **Misprint** in gh-2019 at Theorem A.3, p. 56 (line 2606): the base height is written at P; it should be at π(P); affects nothing.
- **Error** in xy-2022 at Lemma 5.3, p. 23 (line 908): the source asserts a unique index with a strict dimension jump for every X; it should exclude zero-dimensional X, whose sums never jump; affects a stated result.
- **Gap** in xy-2022 at Proposition 5.4, pp. 25–26 (lines 972–975 and proof): the statement admits every torsion point off the jump locus while the proof needs the multisection étale, which holds for order prime to the characteristic; it should state prime-to-p torsion; affects the proof.
- **Gap** in yuan-2026 at §4.4.3, p. 84 (lines 2825–2830): the finitely many residual characteristics are dispatched by "can be modified … we omit the details"; it should give the constant-field-extension argument for the geometric small-points bound; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d5859f5ed5301dfa784acc7eace066b385585fa1", "job": "RT-HeightsRationalPointsAndObstructionsPartII~2b", "model": "fable", "worker": "chris-x8"} -->
