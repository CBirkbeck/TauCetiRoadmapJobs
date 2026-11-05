<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1129#issuecomment-6415214305 -->
Red team round 1 pass b (claude) of 6536723

Verdict: needs changes

1. **F01** (P3) Image-degree inequality misattributed to a Betti-form lemma

   Location: `README.md:159` (§0.1 API): "For a projection q : X^M → X and closed Z ⊆ X^M, deg_L q(Z) ≤ deg_{L^{⊠M}} Z (GGK Lemma 2.4 via DGH Lemma 2.4)".

   Claim: the projection-degree inequality is GGK Lemma 2.4, itself resting on DGH Lemma 2.4.

   Witness: ggk-2026 line 337 (Lemma 2.4, p. 195) is the sum bound deg(Y+Y′) ≤ 4^{dim Y+dim Y′}deg Y·deg Y′; its proof takes the image-degree step at line 380 from "[13, Lem. 2.4]", and line 2032 identifies [13] as G. A. Dill, Compos. Math. 158 (2022). dgh-2021 line 450 (Lemma 2.4, p. 11) is the identity ω̂_univ = 2(da)^⊺∧db for the Betti form, which says nothing about degrees. The inequality itself is true (instance: Z = {P}×X ⊆ X², deg q(Z) = 1 ≤ deg_{L⊠L} Z = deg_L X; in general cut an irreducible Z by dim q(Z) general sections of q^*L and use ampleness of L^{⊠M} on each nonempty fibre, then sum over components with the subadditivity bullet of §0.1).

   Repair: replace "(GGK Lemma 2.4 via DGH Lemma 2.4)" by "(ggk-2026 line 377–380, proof of Lemma 2.4, p. 197, where this step is taken from Dill, Compos. Math. 158 (2022), Lemma 2.4; proved here by cutting an irreducible Z with dim q(Z) general sections of q^*L and using ampleness of L^{⊠M} on each nonempty fibre, then summing over components)". Dill's paper is not in the manifest; either add it under its published locator or keep the own proof as the justification.

2. **F02** (P3) Two Yuan locators pair a line with the wrong page

   Location: `README.md:646` (§3.6), `:795` (§4.9), `:950` (§5.8), `:1154` (§6.8): "yuan-2026 line 99, §1.1, p. 4"; and `README.md:2014` (§11.6): "yuan-2026 line 2740, §4.4.3, pp. 83–84".

   Claim: line 99 is on p. 4; line 2740 is on pp. 83–84.

   Witness: yuan-2026 line 99 is the heading "1.1 Uniform Bogomolov-type result"; line 102 prints the page number 3 and line 103 is the page-4 marker, so line 99 sits on p. 3, while the recalled statements of DGH, Kühne Theorem 3 and Kühne Theorem 4 that these four targets cite occupy lines 104–135 on p. 4. Line 2740 is the heading of §4.4.3 on p. 81 (line 2754 prints 81); the uniformity-of-constants deduction and the residual-characteristic step are lines 2816–2830 on pp. 83–84 (line 2820 prints 83, line 2821 is the page-84 marker).

   Repair: in the four §1.1 citations write "yuan-2026 lines 110–135, §1.1, p. 4"; in §11.6 write "yuan-2026 lines 2816–2830, §4.4.3, pp. 83–84" (the Theorem 4.10 citation in §10.3, "line 2745, pp. 81–83", is already consistent).

3. **F03** (P2) `gap:abelian-tropical-measures` is a compound contract

   Location: `README.md:133` (TropicalAndBerkovichArithmetic contract) and `design/plan.json` `gaps[3]`.

   Claim: one declared gap with a single `needs` sentence.

   Witness: the `needs` text asks the supplier for four independent theorems, each with its own locator: (i) the valuation map val_A on the Raynaud uniformization (yamaki-strict-support §3.1, pp. 13–15); (ii) the canonical measure μ_X and its simplex decomposition under a semistable alteration (§5.3, pp. 25–27); (iii) the strict-support dimension statement (line 1236, Proposition 5.12, p. 29); (iv) nonarchimedean equidistribution of small Galois orbits with α_*μ_Z = μ_Y (lines 1327–1338, proof of Theorem 6.2, p. 31). The brief's rule for declared gaps makes a compound `needs` a finding; a supplier cannot discharge or refuse the four parts separately, and §9.12 only uses (i)–(ii) for the nowhere-degenerate part and (iii)–(iv) for Theorem E.

   Repair: split into four gaps with the same supplier and sections, each carrying exactly one of the four sentences: `gap:abelian-valuation-map` (i), `gap:abelian-canonical-measure` (ii), `gap:strict-support-dimension` (iii), `gap:nonarchimedean-small-point-equidistribution` (iv); record the four slugs in `plan.json` `gaps` and under the TropicalAndBerkovichArithmetic contract, and cite the four slugs in §9.12's *Needs:* line and the Layer 9 Dependencies in place of the single slug. If the intake has already announced the four-part text on the supplier's job, the split changes only the bookkeeping, not the contract.

Scope of this pass: the whole of `packages/HeightsRationalPointsAndObstructionsPartII/README.md` (2148 lines, 108 target subsections in Layers 0–12) and the whole of `Suggested.lean` (111 lines, three `sorry`'d theorems), read line by line; every supplier citation resolved against main, the open heads named in the brief, or the board design packages; every source locator resolved in the numbered legal extractions (plus two page images for formulas the OCR dropped); the dependency gate run. No pass-a report exists: the pull request carries only the five review rounds and their repair receipts, and `reports/` holds no `RT-…~1a` file, so there is nothing to confirm or deny from pass a.

Head reviewed: `6536723` (checkout verified at that commit before reading; `git diff --stat origin/main...HEAD` touches only the package folder: README, Suggested.lean, design/plan.json gaps, metadata, reports, sources.toml).

Dependency gate output (run as instructed, read-only):

    depcheck: 56 roadmaps, 652 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line for HeightsRationalPointsAndObstructionsPartII.

## Verified sound

Counts: 3 Lean declarations read with their binder contexts; 108 README targets read; 143 source line locators resolved (GGK 36, DGH 28, Kühne 7, GH 10, XY 25, Yuan 19, DKY 7, Rémond 3, Masser 1989/1996 4, David–Philippon 2002 8, Yamaki 2016/2018 6, DMY 1, Yuan–Zhang 2) plus 31 printed-page checks against page headers; 47 Checks recomputed; 203 sibling section citations resolved (HeightsRationalPointsAndObstructions 41, AbelianSchemesAndArithmeticModuli 12, ArakelovGeometryAndAbelianHeights 9, JacobianChallengePartII 31, PELModuli 5, AlgebraicModuliForArithmeticGeometry 3, ComplexComparisonPartII 2, NeronModelsAndSemistableAbelianVarieties 17, InverseGaloisAndArithmeticFundamentalGroups 1, SchemeAndStackFoundations 12, JacobianChallenge Layer F, AlgebraicCurves Layers 10–11, ArakelovGeometryAndAbelianHeightsPartII 24, AbelianSchemesAndArithmeticModuliPartII 20, StableReductionPartII 8, TropicalAndBerkovichArithmetic 4, ArithmeticDynamics 12).

Lean versus README, per declaration (context: `F : Type u`, `X : Over (Spec (.of F))` with `Smooth`, `IsProper`, `GeometricallyIntegral` instances and `topologicalKrullDim X.left = 1`, `x₀` a rational point, `J : AbelianVariety F`, `a : X ⟶ J.toOver` with `IsAlbanese x₀ a`, `J.dim = g`, `g ≥ 2`; the point group is `MonObj.Hom.group` on `𝟙_ ⟶ J.toOver`, whose multiplication is the abelian-variety addition):

| Declaration | README target | Instances tried, values | Result |
|---|---|---|---|
| `uniform_maninMumford_curves` | §3.6 (Kühne Theorem 2 over every algebraically closed F of characteristic 0) | c = [x₀]−D gives (x≫a)·c = [x]−D, so the counted set is ι_D(C)∩Jac_tors; D=[Q]: c = −a(Q), Q counted; D=[x₀]: c = 0; g=1 excluded by `2 ≤ g` (every point of E is [q]−D and torsion is infinite); B before F, so B depends on g only | matches; kuhne-2021 line 242 states it over ℂ with D of degree 1, the F-extension is §3.6's specialization step |
| `uniform_mordellLang_curves` | §6.8 (Kühne Theorem 4) | hypothesis "∀p∈Γ ∃n>0, pⁿ∈⟨s⟩, #s ≤ ρ" ⇔ rk Γ ≤ ρ (a maximal independent set has size rk Γ; conversely ⟨s⟩ has rank ≤ ρ); ρ=0 ⇒ Γ ⊆ torsion, bound B = B^{1+0}; n>0 excludes p⁰=1; B ≥ 1 makes B^{1+rk} ≤ B^{1+ρ} | matches kuhne-2021 lines 322–329 |
| `uniform_rationalPoints_curves` | §6.8 remark / §6.12 (degree-free bound) | all of J(F) in the division hull of ⟨s⟩ ⇔ rk J(F) ≤ ρ (Mordell–Weil); X(F)=∅ makes the statement vacuous (no x₀), consistent with count 0; conclusion `Set.univ.encard ≤ B^(1+ρ)` is #X(F) | matches kuhne-2021 lines 330–333 (#C(K) ≤ c₁₀(g)^{1+ρ}), and implies dgh-2021 line 38 Theorem 1.1 |

The Albanese of a smooth proper geometrically integral curve with a rational point is its Jacobian, of dimension the genus, so `J.dim = g` pins the genus; `AbelianVariety.dim` is `topologicalKrullDim` (TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:118 at the pin), the same carrier as the curve-dimension hypothesis. No sorry'd data, no `set_option`, no `lemma`, imports are `Mathlib` plus the one `TauCeti.*` module used, section comments follow README layer order, every Lean name appears once in the README (§§3.6, 6.8, 6.12) and nothing in the README's own backticks is undeclared. No padding: the file states exactly the three curve headlines statable at the pins; the headline inventory in the module docstring names the eleven non-statable headlines with the missing carriers, and I agree with each (polarization degrees, canonical heights on general abelian varieties, adelic bundles, geometric trace, Weierstrass points are all absent at the pins; DKY Proposition 9.2 without "bielliptic" and "Weierstrass" would be a weakened substitute, so its absence is correct). Ownership: `roadmaps grep` over main and the 367 indexed open heads finds no other declaration of these names and no other uniform Manin–Mumford or Mordell–Lang statement on `IsAlbanese` carriers (JacobianChallenge, JacobianChallengePartII and ColemanIntegrationPartII use `IsAlbanese` for the Abel–Jacobi map only).

Adversarial pass, recorded values (one row per statement checked beyond the Lean table):

| Statement | Instances, values | Result |
|---|---|---|
| Conventions: pairing ⟨P,Q⟩ = (ĥ(P+Q)−ĥ(P)−ĥ(Q))/2 | ĥ(P)=1: ⟨P,P⟩=(4−1−1)/2=1; parent's unhalved form (HRPO §0.21, self = 2ĥ) gives 2 | consistent with parent |
| Conventions: projective heights | [1:1/(t²+1)] over ℝ(t): pole place t²+1 of degree 2, order −1: 2; over ℂ(t) with k=ℝ fixed: two poles, each residue degree 2: 4, divided by [ℂ(t):ℝ(t)]=2: 2 | consistent |
| Conventions: 𝔏_g⁴ normalizations | c₁(𝔏_g)=2c₁(L): deg_{𝔏_g⁴}X = 8^r deg_L X, ĥ_{𝔏_g⁴} = 8ĥ_L = 4ĥ_{L⁺}; genus-two Abel curve: 2 and 16 | matches ggk-2026 lines 890, 918 |
| §0.4 packing | r-separated S₀ ⊆ B(x₀,R): disjoint r/2-balls inside B(x₀,R+r/2), #S₀ ≤ ((R+r/2)/(r/2))^ρ = (1+2R/r)^ρ; ρ=0 gives 1; S=[−r,r], R=r: one ball, 1 ≤ 3; S=∅: 0; `IsCover` uses edist ≤ ε (Mathlib Cover.lean:47), i.e. closed balls | true as stated |
| §1.1 Checks | E with O(3·0): Hilbert polynomial 3n; E×E with O(3·0)⊠O(3·0): diagonal degree 3+3=6, translates Δ+(a,b)=Δ+(0,b−a) form a 1-parameter family | true |
| §1.6 Check | X_S^{[m]} = A_S^{[m]}: dimension mg+dim S vs torus 2mg; degenerate for every m | true |
| §2.6 Check | E of embedding degree 4, S a point, N=2: deg F = [2]^*O(1) on E = 4·4 = 16, deg M = 0, vol(F−tM)=16 ≥ 16 > 0 | true |
| §2.7 division by N² | ĥ(NP)=N²ĥ(P) ≥ c₁N²h(π)−c₂(N)−c₀(1+h(π)) ⇒ ĥ(P) ≥ (c₁−c₀/N²)h(π) − (c₂(N)+c₀)/N²; N² ≥ 2c₀/c₁ keeps the slope ≥ c₁/2 | true, no 0/0 |
| §3.5 non-generating extension | P₀ small, Y = X−P₀ ⊆ B=⟨X−X⟩, ĥ(P−P₀) ≤ 2ĥ(P)+2ĥ(P₀) ≤ 4c₃ (parallelogram, ĥ ≥ 0), threshold c₃ ≤ c″₃/4; components of P₀+Y′ have bounded degree and smaller dimension; a point of X° in a component Z ⊆ X is in Z° | sound; ggk-2026 line 1690–1700 runs the same reduction |
| §4.6 degree rescaling | u^*L ≡ [n]^*L₀ ≡ n²L₀: deg_{u^*L}X′₀ = n^{2dim X′₀}deg_{L₀}X′₀ ≤ n^{2(r−1)}c′₂; n=2, dim 1: factor 4 | README's rescaling is right; the source omits it (Source issues) |
| §4.7 two ranges | H > B = max{1,2c′₃/c′₁}: c′₁H−c′₃ ≥ c′₁H/2; H ≤ B: c₁H ≤ c″₃ for c₁ ≤ c″₃/B; c₂ = max | true |
| §5.1 Check | y² = x³−2: 27−2 = 25, (3,5) ∈ E(ℚ), E(ℚ) ≅ ℤ·(3,5) | true |
| §5.6 Checks | genus-two theta curve, L=3Θ: D = 3Θ·Θ = 6, X∩(X−c₁) has Θ² = 2 points ≤ 36; X=[3]⁻¹Θ: Stab = [3]⁻¹(0) = J[3], 81 points; D = 3Θ·9Θ = 54; 81 > 54 but 81 ≤ 54² | Checks true; the own proof of Proposition A.3 verified step by step (hyperplane case, padding to r points, s ≤ D^{i+1}, D^{i+3} ≤ D^{2r} for r ≥ 2, D² for r=1) |
| §5.7 Check | [3:5:1]: coefficient height log 5, Fubini–Study ½log 35, difference ½log(7/5) < ½log 3 | true (HRPO §5.9b: [1:2] has ½log 5) |
| §5.8 cone count | u,v unit with |u−v| ≤ (2/c₄)^{1/2} give ⟨u,v⟩ ≥ 1−1/c₄; balls of half that radius on the unit sphere: (1+(8c₄)^{1/2})^{rkΓ} | matches ggk-2026 line 1863 |
| §5.10 Steps 2–4 | c₇, N″, (A.10), alternative N″(8c₈+1)^{rkΓ} + c₁₀^{rkΓ+1}, ball count 1+2R/r with R=(2c₉H)^{1/2}, r=(H/c₀)^{1/2}: (1+2(2c₉c₀)^{1/2})^{rkΓ} | matches ggk-2026 lines 1921–1992 |
| §5.12 constants | DP Théorème 1.4: Q = (2^{16g}h₀^{2/g}D)^{(4g²)^{dim X}}; g=2, X=C−w, L=M¹⁶: D = 16·2 = 32, exponent 16, Q = 2^{592}h₀^{16}; six 2-torsion differences w_i−w of height 0, 6 ≤ Q; Théorème 1.3: Q(5aQ)^{r/2}, r=0: Q; Rémond's exponent (r+1)g^{5(dim X+1)²} read on the page image of p. 643 | all true; the image confirms the exponent 5(dim X+1)² sits entirely on g |
| §5.4 Rémond constants | page images of pp. 105–106: c₁ = c₂ = max(deg X,(6m)^{2m})^{m^{3m²}}, c₃ = c₁(n+1)^{(dim X)³}max(h(X),h₁,c_NT,n log(n+1)); setting p. 104: L symmetric, Γ(O(d)) → Γ(L^d) surjective for all d ≥ 1, X geometrically integral | matches §5.4 |
| §6.2 Check | Legendre at x=2: 2·1·(2−λ) = μ²; μ=0 ⇔ λ=2 where (2,0) has order 2; generically not 2-torsion; order constant on connected V in characteristic 0 | true; Masser 1989 Main Theorem w ≤ Ch^κ and Scholium 1 w ≥ exp(ch) at d = deg V, Masser 1996 Theorem w ≤ C max{d,h}^Λ, as cited |
| §9.3 defect induction | trdeg(b,τb,c/k) = d₁ + (e−d₁) + (e−d₁) = 2e−d₁; δ′ = 2d₂ − (2e−d₁−a) = 2δ−d₁+a; a ≤ e−d₂ = d₁−δ ⇒ δ′ ≤ δ | arithmetic correct |
| §9.11 numerical class | [m]^*ℳ ≡ m^iℳ, i∈{1,2}: m^{2g}(ℳ·ℒ^g) = m^{2g+i}(ℳ·ℒ^g) ⇒ ℳ·ℒ^g = 0; π^*N·ℒ^g = deg N·deg ℒ_η, π^*N·[𝒯] = deg N·deg(𝒯/S) | matches xy-2022 line 792 |
| §9.15 Checks | abelian X through 0: r=1; genus-two C through 0: dim X₁=1 < dim X₂=2, X₂=J, r=2; point: no jump | true |
| §9.16 codimension | dim f⁻¹(A′_{e+1}) ≤ dim A′+e−1 (irreducible source, generic fibre e) ⇒ dim A′_{e+1} ≤ dim A′−2 | true |
| §9.17 Check | E×E, H₁²=H₂²=0, H₁H₂=1: L²=2, M·L=1, (M+½L)² = 2·½·3/2 = 3/2, M²=0 | true |
| §10.1 Check | Z = {a,b,c}×C ⊆ C²: deg_{N⊠N} = 3, codim 1, Σ={a,b,c}: 3 ≤ 3^{1/1}; exponent 1/m would give 3 ≤ √3 | true; AGAHII §12.4 states the 1/d exponent |
| §10.7 Check | m=2, coordinates ≤ ε/4: sum ≤ ε/2 < ε | true |
| §11.4 c₃ = 1 | 2ĥ(y)+h_Fal+C+1 ≥ ĥ(y)+max{h_Fal,1} since h_Fal+C ≥ 0 | true; yuan-2026 lines 2642–2653 |
| §11.5 | deĝ(Θ̄|_y) = 2ĥ(y), deĝ(λ̄|_y) = h_Fal(X_{s,k(y)}) (0 for s closed), deĝ(N|_y) ≥ 1 | matches yuan-2026 lines 2695–2706 |
| §12.1–12.3 | kernel of Φ: three 2-torsion differences of Weierstrass points over common branch values; 4 lifts × 4 preimages = 16; ĥ_{L_X} = ½(ĥ_{t₁}∘π∘Φ₁ + ĥ_{t₂}∘π∘Φ₂); Stoll's example: 34 | matches dky-2020 lines 2037–2074, 53–54 |

Supplier citations: every section named in the contracts and *Needs:* lines exists at the cited location (HeightsRationalPointsAndObstructions §§0.10–0.35, 1.7–1.11, 5.1–5.20 incl. 5.4a–c, 5.9a–f, 5.13a–c, 5.17a–g at the head of its open pull request; JacobianChallengePartII §§0.2–0.4, 1.1–1.4, 2.1–2.7, 3.2–3.13, 5.1–5.6, 7.1–7.2; AbelianSchemesAndArithmeticModuli A1–A3, A6 incl. A2.3, A2.7–A2.10; ArakelovGeometryAndAbelianHeights §§2.7, 3.4, 4.2–4.4, 5.5–5.8, 6.3; PELModuli M5.1–M5.3, M6.9–M6.10; AlgebraicModuliForArithmeticGeometry §§1.5–1.6, 2.1; ComplexComparisonPartII C5.4; NeronModelsAndSemistableAbelianVarieties §§1.1–1.10, 3.10–3.14, 5.1–5.2; InverseGaloisAndArithmeticFundamentalGroups IG.2; SchemeAndStackFoundations §§0.3, 0.8, 4.11, 4.13, 4.14, 5.1–5.6, 5.12 on main; JacobianChallenge Layer F and AlgebraicCurves Layers 10–11 on main; ArakelovGeometryAndAbelianHeightsPartII §§0.5, 3.1–3.3, 4.7–4.9, 5.1–5.5, 6.1–6.4, 8.4, 9.1–9.2, 12.1–12.6, 13.1, 13.7 and StableReductionPartII MC.4, MC.6, MC.7 with the five named targets in the board design READMEs; AbelianSchemesAndArithmeticModuliPartII B0.1–B0.2, B1.1–B1.5, B2.3, B2.13, B2.21–B2.23, B3.7–B3.9, B4.2–B4.6; TropicalAndBerkovichArithmetic §§6.2–6.4, 7.0; ArithmeticDynamics §§6.57–6.64, 6.93, 6.110–6.112 at the open heads). Their content supports the use made of them: B4.5's criterion needs m ≥ dim S, generic finiteness and (a)–(c) as §1.6 says; B2.3 carries the curve-field bounded-degree torsion assertion that §8.1 extends; AGAHII §6.4 is stated for big polarizations, which is exactly what `gap:moriwaki-silverman-tate-nef` fills; AGAHII §12.4 states the product-grid bound with exponent 1/d; AGAHII §0.5 states the two-nef Siu inequality with the geometric case in its hypotheses; ArithmeticDynamics §6.64 identifies the Lattès canonical height with the x-coordinate height, i.e. twice the O(0) height, as the contract says; the parent's §5.9b defines the Fubini–Study cycle height with the [1:2] ↦ ½log 5 Check the Conventions reuse. The citation resolver's one lead ("ArakelovGeometryAndAbelianHeightsPartII §§3.1 not found") is a false positive: that roadmap is a board design package whose §3.1 exists.

Pinned libraries: all fourteen Mathlib locators and the five Tau Ceti locators in the contracts resolve at the pinned commits to the named declarations at the stated lines (`Metric.coveringNumber`:74, `maximalSeparatedSet`:288, `coveringNumber_le_packingNumber`:351, `IsSeparated`:43, `EuclideanSpace`:111, `closedBall`:418, `addHaar_closedBall`:500 with `0 ≤ r`, `finrank`:61, `IntermediateField`:52, `Algebra.trdeg`:45, `Submodule.span`:46, `IsReducedRowEchelon`:87, `Projectivization.logHeight`:51, `MonObj.Hom.group`:58; `AbelianVariety`:95, `baseChange`:281, `IsIsogeny`:61 = finite and surjective, `IsAlbanese`:84 with the two fields the contract describes, elliptic `canonicalHeight` = lim naiveHeight(2ⁿP)/4ⁿ with naiveHeight the x-coordinate height). The claim in §9.4 that Mathlib has `IsReducedRowEchelon` but not uniqueness of the reduced echelon form holds at the pin (the file proves only `IsLeadingEntry.unique`).

Policy: no `lemma`, no `set_option`, no pull-request numbers or process narrative in README or docstrings; every target has a locator; no computational algorithm; `sources.toml` has 17 keys, no machine path; the five gap slugs in `plan.json` are the five the README states, each under its supplier's subsection. The merge order lists every supplier before this roadmap (ArithmeticDynamics 268, ArakelovGeometryAndAbelianHeightsPartII 269, HeightsRationalPointsAndObstructionsPartII 291).

Gaps: `flat-nonproper-intersection` restates xy-2022 line 268 Proposition 2.1 exactly; `arithmetic-interpolation` restates ggk-2026 line 1823 Lemma A.4 with the nonempty-S and dim X ≥ 1 provisos; `controlled-polarization-embeddings` is GGK (A.1) (line 1750) for every polarization type; `moriwaki-silverman-tate-nef` matches gh-2019 lines 2596–2606, where B is an arbitrary polarization. All four are precise and ask for nothing the pins or earlier roadmaps provide.

## Not verifiable

- Elaboration of `Suggested.lean` and the `#check @name` comparison: the brief permits no Lean command here, so I did not run one; the round-5 repair report records `lake env lean` exit 0 at this head with the three expected `sorry` warnings, and the file is unchanged since round 2. Everything above about the Lean statements is by reading.
- remond-2000-decompte (Lemma 3.1, Propositions 3.3, 3.4, 3.6, 3.7, Lemma 4.6, Lemma 6.1) and david-philippon-2007 (Theorem 6.8, (6.41)) are settled uncertified: their statements were checked only through GGK's restatements (lines 1755–1833, 1478–1514).
- yamaki-strict-support (3.0.13)–(3.0.14) and the §5.3 measure decomposition inside the tropical gap: the locators resolve (lines 104, 1236, 1327–1338, 1836) but the formulas were not re-derived.
- ArakelovGeometryAndAbelianHeightsPartII and StableReductionPartII are board design packages (neither on main nor in an open pull request); their section numbers may still move at package stage.
- The normalization of `Projectivization.logHeight` relative to [K:ℚ] (contract line 35) was not re-derived from Mathlib's admissible absolute values.
- Ownership was checked against main and the 367 open roadmap pull requests in the index of 2026-10-26; nothing outside that index was searched.

## Source issues

- **Error** in ggk-2026 at §4.3, proof of Proposition 4.1, printed p. 211 (line 972): the source bounds the degree of X′ = u(X′₀) by deg_{u^*L}X′₀ ≤ c′₂, but u^*L is numerically (l/g!)²L₀, so deg_{u^*L}X′₀ = (l/g!)^{2dim X′₀}deg_{L₀}X′₀; it should be ≤ (l/g!)^{2(r−1)}c′₂ with c′₂ rescaled (instance l/g! = 2, dim X′₀ = 1: factor 4); affects the proof (the statement survives since c′₂ may depend on l); the README §4.6 already carries the rescaling.
- **Misprint** in ggk-2026 at Theorem 1.3, printed p. 192 (line 166): the two constants are both named c₃ although (1.4) uses c₃ and c₄; it should read c₃ = c₃(g,d) and c₄ = c₄(g,d); affects nothing.
- **Misprint** in ggk-2026 at Proposition 5.2, printed p. 212 (line 1021): the second constant is written c′₃ = c″₃(r,d,S); it should be c″₃ throughout; affects nothing.
- **Gap** in xy-2022 at Proposition 5.4, printed p. 25 (line 972) and its proof p. 26 (line 996): the statement admits every torsion point t off A′_{e+1}, but the proof takes the multi-section of order prime to char K so that it is étale over S and smooth (as Proposition 2.1's V^sm hypothesis needs); p-power torsion is not treated; it should state t of order prime to the characteristic, which is all §5.3 uses since such torsion is dense; affects the proof; the README §9.17 states the prime-to-p form.
- **Misprint** in xy-2022 at the proof of Lemma 3.7, printed p. 18 (lines 703–705): nonnegativity of the residual intersection is justified by "L and M ample", but π^*M is only nef on the model; it should say ample L and nef π^*M (and no π^*M factor remains when dim S = 2); affects nothing (the step holds with nefness); the README §9.8 Check records it.
- **Gap** in xy-2022 at Lemma 3.7, printed pp. 16–17 (lines 626–645): the pair (H, M_{k′}|_H) is called a polarization of K/k′ although k′ is not algebraically closed and H need not be normal, whereas §1.1 defines polarizations over algebraically closed constants on normal models; it should pass to the algebraic closure of k′ in K̄ and normalize H; affects the proof; the README §9.7 does both.
- **Gap** in yuan-2026 at §4.4.3, printed p. 84 (lines 2825–2830): the finitely many characteristics dividing N′ are dispatched with "Theorem 4.10 can be modified … we omit the details", while uniformity over every constant field of that characteristic needs a separate constant-field-extension argument; it should be proved from Theorem 4.2(2) with flat extension of a fixed section and degree bounds; affects the proof; the README §11.6 supplies that lemma.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6536723", "job": "RT-HeightsRationalPointsAndObstructionsPartII~1b", "model": "fable", "worker": "fable-rt228"} -->
