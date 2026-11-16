# Review of PadicLocalLanglandsForGL2QpPartII (pull request #2455 at 449123d)

**Verdict:** needs changes

## R01 (P2) — The plan's gap still asks PadicHodgeTheory about this roadmap's Drinfeld spaces

**Location** `packages/PadicLocalLanglandsForGL2QpPartII/design/plan.json`, gap `continuous-galois-tensor-comparison`, `needs`: "proving H¹(X)⊗̂_L B ≅ H¹(X⊗̂_L B) for trivial Banach L-spaces B, compatible with d and the inverse limits defining the rational Drinfeld function and differential spaces without an extra derived-limit term."

**Claim** Only the README half of the previous R01 was repaired. The intake announces the plan's `needs` on the supplier's job. That sentence still asks PadicHodgeTheory about this roadmap's O[M]^(G_ℚ_p), Ω¹[M]^(G_ℚ_p) and d. It also covers Banach coefficients only, which contradicts README line 143.

**Witness** At its open head, PadicHodgeTheory names the Drinfeld tower only in one slope remark and in its references. It has no O[M], Ω¹[M], d or lim¹. README line 143 asks for Fréchet F instead: "H¹(G_ℚ_p,X)⊗_L F ≅ H¹(G_ℚ_p,X⊗̂_L F)".

**Repair** In `packages/PadicLocalLanglandsForGL2QpPartII/design/plan.json`, replace this gap's `needs` with: "In §4.4, for every finite L/ℚ_p and finite-dimensional continuous L-representation V of G_ℚ_p, with X = C⊗_ℚ_p V^∨: continuous H¹(G_ℚ_p,X) is Hausdorff and finite-dimensional over L, and a strict continuous-cochain model gives, for every Fréchet L-space F with trivial action, written as a countable inverse limit of Banach L-spaces, a topological isomorphism H¹(G_ℚ_p,X)⊗_L F ≅ H¹(G_ℚ_p,X⊗̂_L F) with no derived-limit term, natural in continuous linear maps F → F′." Tested on V = L, F = L^ℕ: both sides are L^ℕ·[logχ].

## Previous findings

- R01 — partly repaired: README line 143 now asks only for "H¹(G_ℚ_p,X)⊗_L F ≅ H¹(G_ℚ_p,X⊗̂_L F)" for Fréchet F, and line 718 applies it to B₀, B₁ and d. The `needs` in `design/plan.json` is unchanged (R01 above).
- R02 — repaired: line 401 "the duality formula makes i_(0,n)(ℓ) orthogonal to φ_v(1) for every v ∈ Π(V)_c^P-fin whose Kirillov function is supported on ℤ_p^×; these values run through all of D⁻_dif(V)".
- R03 — repaired: line 210 "let M be the type with LL(M) = π₀⊗χ∘det, that is M = M(π₀⊗χ∘det)[1] (§0.4(a))". Line 851 reads "let M be the type with LL(M) = π₀⊗χ∘det (§0.4(a))".
- R04 — repaired: the summary now reads "Kirillov duality holds for every absolutely irreducible two-dimensional V, and the compactly supported P-finite vectors are dense in Π(V)^an when such a V is not trianguline".

## Verified sound

| Target | Instance | Roadmap side | Computed side | Result |
|---|---|---|---|---|
| Gap contract, line 143 | V = L, F = L² | H¹(G_ℚ_p,X)⊗_L F ≅ H¹(G_ℚ_p,X⊗̂_L F) | H¹(G_ℚ_p,C) = L·logχ; left side L², right side H¹(G_ℚ_p,C)² = L² | holds |
| Gap contract, derived limit | V = L, F = L^ℕ = lim L^n | no derived-limit term | H⁰ tower L^(n+1) → L^n is surjective, so lim¹ = 0; both sides L^ℕ·logχ | holds |
| Gap contract, Sen test (line 727) | V = E^∨, the logχ extension | H¹ one-dimensional | coker N = L[e₂], dimension 1; with F = L², both sides L² | holds |
| plan.json `needs` (R01) | PadicHodgeTheory at its open head | asks for compatibility with d and the Drinfeld function and differential spaces; Banach B only | supplier has no O[M], Ω¹[M] or d; README asks for Fréchet F | finding R01 |
| §4.5 route, line 718 | V = L | id⊗d injective on H¹(X)⊗B₀ → H¹(X)⊗B₁ | dim H¹(X) = 1; kernel H¹(X)⊗ker d = 0, since constants carry no supercuspidal JL(M) | holds |
| §4.5 route | V = L(1) | connecting map zero | X = C(−1), H¹(G_ℚ_p,C(−1)) = 0, so the map is 0 → 0 | holds |
| §1.7 shell step, line 401 | φ_v supported on ℤ_p^× | {ℓ,v} = {i_(0,n)(ℓ), φ_v(1)}_dif | φ_v(p⁻ʲ) = 0 for j ≠ 0 removes every other term of DLB17 line 1586 | holds |
| §1.7 exhaustion (ψ step dropped) | U = ℤ_p, m(V) = 3 | vanishing on p⁻ⁿℤ_p for n ≥ m(V) covers all compact opens | ℤ_p ⊂ p⁻³ℤ_p; any compact U lies in p⁻ⁿℤ_p for n ≥ max(m(V), −min v(U)) | holds |
| §1.7 Weyl step | trianguline V̌ ⊃ R(δ₁)e₁ | the route must fail exactly here | t·e₁ = φⁿ(p⁻ⁿδ₁(p)⁻ⁿ·t·e₁) ∈ ∩φⁿ, nonzero; non-trianguline: COLMEZ14LA line 2032 gives 0 | holds |
| §0.1 Check (R03), line 210 | p = 2, 3 | p acts on JL(M) by (1+p)² | for the type: 9 and 16; for literal M(π₀⊗χ∘det): (1+p)²p^(±2), i.e. 36 or 9/4 at p = 2 | holds |
| §4.12 Check (R03), line 851 | same M, π₀ of level n | level ≤ n, M ∉ ΦNᵖ, Hom = 0 | Nrd(O_D^×) = ℤ_p^× and χ unramified, so χ∘Nrd is trivial on K_D(0); (1+p)² ≠ 1 | holds |
| PR summary (R04) | trianguline V | density only for non-trianguline V | line 401 "For every such V that is not trianguline"; the summary says the same | holds |

Rows for statements the diff leaves untouched stand as in the previous review, of 04fba00.

- Source locators checked against the cached texts this round: 7. They are DOSPINESCU12THESE lines 3344–3358, 3378–3385 and 3409–3410; COLMEZ14LA lines 2028–2032; CDN20 lines 822–853; DLB17 lines 1572–1586; and §0.4(a), cited by both changed Checks, which states LL(M) = LL_p(M[−1]) for every type.
- Cross-roadmap citations resolved: 3. PadicHodgeTheory §4.4 exists at its head and covers Sen and D_dif only. PadicPeriodRings §1.4 on main covers Tate's H⁰ and H¹ of C(i) only. VectorBundlesAndIsocrystalsPartII §§4.7–4.9 at its head treats Ext¹_TVS(B₁, W), not Galois cohomology. The gap therefore asks for nothing that is already provided.
- Gate at 449123d, run here: every check 0, OK. Dependency check: `depcheck: 260 roadmaps, 2511 edges, 0 problem(s)`. Diff outside the folder: empty.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no messages. The file is unchanged since 04fba00 and declares nothing, so the `#check @name` comparison is empty.
- Declared gaps: all four slugs are in the README and in `design/plan.json`. Three stand as in the previous review. continuous-galois-tensor-comparison is precise and minimal in the README but not in the plan (R01).
- PR text against this head: the summary's density sentence matches line 401, and "25 corrections" matches E1–E25. The diff changes no supplier, heading or declaration, so the description leaves no change unstated.
- Overlap check: I searched the closest roadmaps for the object the diff changes (Galois H¹ of C⊗V^∨ with Fréchet coefficients). Open: ProetaleCohomologyOfPAdicCurvesAndTowers, LocallyAnalyticRepresentationsOfLocalGroups, CompletedCohomologyAndLocalGlobalCompatibility, ScholzeFunctorAndModpCohomologyOfTheLubinTateTower, PadicHodgeParametersInLocallyAnalyticRepresentations. On main: PadicLocalLanglandsForGL2Qp, PhiGammaModulesAndIwasawaCohomology, LocallyAnalyticDistributions. None owns it; the gap's supplier, PadicHodgeTheory §4.4, is its only owner. The previous review's shared objects keep their owners.
- Source independence: changed passages only. 5 passages compared (lines 41, 143, 210/851, 401 and 718) with 3 sources (DOSPINESCU12THESE, COLMEZ14LA, CDN20); none shares a run of words or translates clause by clause. Largest share: DLB17, 122 of 266 source-id mentions. No layer was added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- none: every passage the diff changes cites a text in the sources cache. The previous review's CD14 item concerns §4.10, which this diff leaves untouched.

## Source issues

- none

## For the human reviewers

- §1.7's every-prime density and vanishing (README line 401) rest on DOSPINESCU12THESE, a doctoral thesis read from the author's page (Théorème 8.4.3, Remarque 8.4.4). The reply to the previous review reports that no refereed version was found.
