# Review of GromovWittenTheory (pull request #990 at e18b995)

**Verdict:** needs changes

:robot: Independent AI review, incremental re-review of the 96 lines changed since `0194363`. Three of the five previous findings are repaired by this head (the Čech cup product now has an owner in §0.4, the §3.2 elliptic floor cites PseudoholomorphicCurveAnalysis and PDE §1.6 as they are on main, and §7.1 reads Kontsevich–Manin Definition 6.1 over the ring `Λ_ω`). The two findings that remain change no line of the folder: the branch still builds against Tau Ceti `a91d3aa` while the README and the docstring read `2fd255d`, and no order is stated between this pull request and #1998, which writes the same folder. The gate passes on an independent rerun, the dependency check reports no problem, and `lake env lean` on Suggested.lean exits 0 with no output.

## R01 (P3) — The README and docstring read Tau Ceti at 2fd255d, but the branch still pins a91d3aa

This is the previous R02, not repaired.

**Location:** `TauCetiRoadmap/GromovWittenTheory/README.md:66` (“### From Tau Ceti (commit 2fd255d)”); the contract at lines 68–76, now also citing `TauCeti.Topology.cechCohomologyZeroIso` and `TopCat.singularCup`; `Suggested.lean:32–40` (“the gluing quotient `GluedCurve`”, “the pinned Tau Ceti has the Čech groups and the pullback maps of fixed-family Čech complexes but no product on them”); `lake-manifest.json:8`.

**Claim:** The branch manifest pins Tau Ceti `a91d3aa`, Mathlib `6b7abb3c` and toolchain `v4.35.0-rc3`; main pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`. At `a91d3aa` the `Cech/`, `SmoothSingular/`, `NovikovSeries/` and `NovikovModule/` directories do not exist (19 of the 23 cited files, as the previous report listed), so `TauCeti.Topology.cechCohomology`, the carrier of the new §0.4, is absent at the pin the branch builds against, and the docstring sentence “the pinned Tau Ceti has the Čech groups” is true only of `2fd255d`.

**Witness:** `git merge-base --is-ancestor origin/main HEAD` fails at `e18b995`; `lake-manifest.json:8` reads `a91d3aa…`; `origin/main:lake-manifest.json` reads `2fd255d9…`. The checkout of Tau Ceti `2fd255d` has `Topology/Sheaves/Cech/Colimit.lean:70` (`cechCohomology`), `:84` (`cechCohomologyZeroIso`), `Cech/Pullback.lean:53` (`cechComplexPullback`) and `AlgebraicTopology/Cohomology/Cup.lean:203` (`singularCup`), so every Tau Ceti name the change adds resolves at the pin the README names.

**Repair:** The branch takes origin/main by a merge or a rebase; no line of the folder changes. The worker's rebase step. Tested: the four Tau Ceti declarations added by this change, and the 57 the previous report listed, resolve at `2fd255d`.

## R02 (P3) — Pull request #1998 writes the same folder, and no order between the two is stated

This is the previous R05, not repaired.

**Location:** the folder `TauCetiRoadmap/GromovWittenTheory/` (all three files); the pull request description, which does not mention #1998.

**Claim:** #1998 (algebraic Gromov–Witten theory and quantum cohomology of smooth projective varieties) adds a different roadmap under the same folder name. The two heads conflict in `README.md`, `Suggested.lean` and `metadata.toml`. Neither description says which one moves. The objects are distinct (algebraic stacks and Chow groups there, analytic stable maps and rational Čech cohomology here), so this is a naming and order conflict, not a double owner.

**Witness:** `scratch/overlaps.md` (index of 2026-11-09): “#990 and #1998 conflict in `README.md`, `Suggested.lean`, `metadata.toml`”. HamiltonianFloerOperations on main, README line 17, cites “GromovWittenTheory G0/G5–G7” for this roadmap. The description quoted in `scratch/pull-request.md` contains no reference to #1998 or to an order.

**Repair:** State in this pull request's description that this roadmap keeps the folder `GromovWittenTheory`, the name HamiltonianFloerOperations already cites, and that #1998 takes another folder name before either merges. No folder line changes.

## Previous findings

- R01 (Čech cup product unowned) — **repaired**: §0.4 “The Čech cup product” (`README.md:203–223`) defines `(a ⌣ b)_(i₀…i_(p+q)) = a_(i₀…i_p) · b_(i_p…i_(p+q))` on the TS1.1 tuple complexes, proves Leibniz, associativity, unit, refinement compatibility, passage to the colimit, graded commutativity via the reversal operator, multiplicativity of `f^*`, the identity `a ⊠ b = pr₁^* a ⌣ pr₂^* b` with `(f₁ × f₂)^*` naturality and `a ⌣ b = Δ^*(a ⊠ b)`, and the multiplicativity of the C1.2b comparison; cited at §2.1, §2.2, §4.2, §6.5, §8.2 and §8.3, with the test instance `X = pt`, `(0, 5)`, `k = (1, 1, 0, 0, 0)` as a Check of §8.3. The repair introduced no new problem (table below).
- R02 (branch pin) — **not repaired**: `lake-manifest.json:8` still `a91d3aa`. It is R01 above.
- R03 (PDE lane label; HeegaardFloer F1 items) — **repaired**: “PseudoholomorphicCurveAnalysis PH1.1–PH1.2 … PH3.2 … PH6.1 … PH6.3; PDE §1.6 (A6)” at `README.md:35`, `132–137`, `354`, `367` and `408`; HeegaardFloer no longer appears anywhere in the README, and line 134 now says the suppliers treat totally real boundary conditions only.
- R04 (Definition 6.1 with `K = Λ_ω`) — **repaired**: `README.md:627` reads the data and axioms “over the commutative ring `Λ_ω`”, with the finite free module `H^*(X; ℚ) ⊗̂ Λ_ω ≅ H^*(X; ℚ) ⊗ Λ_ω`, the perfect extended pairing in place of non-degeneracy and values in `H^*(M̄_(g,n); ℚ) ⊗ Λ_ω`; the API bullet at `:632` and the new Check at `:639` (Enriques zero divisors, `T² × T²` non-unit) carry the witnesses.
- R05 (#1998 order) — **not repaired**: the description is unchanged. It is R02 above.

## Verified sound

**Gate, dependency check and build.**
- Independent rerun of the full gate at `e18b995527b9ea21d6eacdfc0838ae3b6447f18d`: every check 0, `OK`, exit 0 (the rerun line has no `build` field; the worker's gate at this head has `build=0`).
- Dependency check with `--movable` against the board's merge order and main content: `depcheck: 238 roadmaps, 2323 edges, 0 problem(s)`, no UPWARD or CYCLE line. GromovWittenTheory is at merge-order line 307, after ImplicitAtlases (214), AnalyticStableMaps (215) and TopologicalSheafCohomology (306); PseudoholomorphicCurveAnalysis, PDE, CharacteristicClasses and AlgebraicTopology are on main.
- `lake env lean TauCetiRoadmap/GromovWittenTheory/Suggested.lean` in the branch worktree: exit 0, 8 s, no output. The file has `import Mathlib`, the module docstring (now 4 lines longer), the namespace and no declaration; no `set_option`, no sorry'd data. The `#check` signature comparison and the one-tactic padding probe therefore have no subjects.
- `git diff --stat origin/main...HEAD` outside the folder: empty.

**Headline theorems.** Unchanged: the docstring lists the four headlines (the eight Kontsevich–Manin properties, `I_(1,1,0)(1) = χ(X)·1`, the unital CohFT with the associative quantum product, string/dilaton/divisor/TRR). None is statable at either pin; the new docstring paragraph names a fifth missing carrier, the Čech cup product, correctly: `grep -ril cup` over `TauCeti/Topology/Sheaves/` and `TauCeti/CategoryTheory/Sites/SheafCohomology/` at `2fd255d` finds nothing.

**Source locators of the changed passages** (`stacks-cohomology`, the chapter PDF whose page numbers the README uses).
- Section 25 “Čech cohomology of complexes”, Tag 01FP, begins at line 2102 on p. 46, with the cup-product aim stated at lines 2103–2109.
- The product (25.3.2), Tag 07MB, lines 2361–2370 on p. 50: `(α ∪ β)_(i₀…i_p) = Σ_r ε(n,m,p,r) α_(i₀…i_r) ⊗ β_(i_r…i_p)` with `ε(n,m,p,r) = (−1)^((p+r)n + rp + r)`. Line 2373–2375 on p. 51: `ε(n,m,p,n) = 1`, so no sign for a single sheaf in degree 0. This is the README's front-face/back-face formula without sign.
- Leibniz rule, lines 2377–2438 on p. 51; associativity, lines 2441–2473 on p. 52.
- The reversal operator `τ(α)_(i₀…i_p) = (−1)^(p(p+1)/2) α_(i_p…i₀)`, lines 2264–2291 on p. 49 (a cochain map), its compatibility with refinements at line 2296, the homotopy to the identity at lines 2299–2348 on pp. 49–50, and graded commutativity on cohomology at lines 2474–2514 on pp. 52–53. The README's “pp. 49–50 and 52–53” and “pp. 51–52” match.
- Refinement maps `T_t(α)_(j₀…j_p) = α_(t(j₀)…t(j_p))|V` and the homotopy between two index functions, lines 2137–2192 on pp. 46–47: the README's raw-refinement formula.

**Library declarations opened** (Tau Ceti `2fd255d`, the pin the README names).

| File | Declaration and line | What it says |
|---|---|---|
| `Topology/Sheaves/Cech/Colimit.lean` | `cechCohomology` 70 | colimit over `PointOpenCover X` of the cohomology of the tuple Čech complexes; transition maps independent of the refinement map (header, lines 14–22); no hypothesis on `X`; vanishes on the empty space |
| same | `cechCohomologyZeroIso` 84, `_hom` 91, `_hom_naturality` 105 | for a sheaf `F`, `F(⊤) ≅ Ȟ⁰`, natural in `F` |
| `Topology/Sheaves/Cech/Pullback.lean` | `TopCat.Hom.cechComplexPullback` 53 | for `α : P ⟶ f_* Q`, the map `Č(U; P) ⟶ Č(f⁻¹U; Q)` of tuple complexes with the same index type |
| `AlgebraicTopology/Cohomology/Cup.lean` | `TopCat.singularCup` 203; `_homologyπ` 211; `_naturality` 223; `_assoc` 241; `_constSingularCocycle_left/right` 264, 281 | the Alexander–Whitney cup product: `φ ⌣ ψ` on a `(p+q)`-simplex is `φ` of the front `p`-face times `ψ` of the back `q`-face (header lines 20–36); natural, associative, unital |

**Cross-roadmap citations of the changed passages, resolved.**
- TopologicalSheafCohomology on main: TS1.1 is §1.1 (line 106), tuple complexes with all `(p+1)`-tuples and raw refinements as index functions with identity and composition laws; TS1.2 is §1.2 (line 126), point-neighbourhood covers and the colimit whose transition maps are independent of the index function.
- ImplicitAtlases at its open head `81fc759`: §0.7 (line 199) with the Checks `Ȟ¹(S¹; ℤ) = ℤ` (two-arc cover) and `Ȟ¹(W; ℤ) = ℤ` against singular `0` for the Warsaw circle; §6.5 (line 756): finite rectangular covers cofinal, the rational Künneth quasi-isomorphism “by shuffle and Alexander–Whitney” on finite models, the Check that the factor swap acts by `−1` on a `(1, 1)` class, and no cup product and no naturality under `f₁ × f₂`, as the README now says.
- CharacteristicClasses on main, C1.2b (lines 599–660): `cechSingularCWTypeComparison` (line 640) on paracompact Hausdorff spaces of CW type, built on a Hausdorff CW representative from the locally acyclic singular-cochain sheaf resolution, transported through a CW homotopy equivalence, natural; it asserts “coefficient/cup naturality” but defines no Čech cup product, so §0.4 is the owner of the product and of the comparison's multiplicativity.
- AlgebraicTopology on main, Stage 6 item 2: Alexander–Whitney cup product pairing the front-face value with the back-face value, Leibniz rule, units, associativity, graded commutativity.
- PseudoholomorphicCurveAnalysis on main: PH1.1 (line 213, vector-valued local `W^(k,p)` classes), PH1.2 (279, embeddings, products and composition), PH3.2 (581, the estimate `‖ξ‖_(W^(k+1,q)(K)) ≤ C(‖∂̄ξ‖_(W^(k,q)(Ω′)) + ‖ξ‖_(L^q(Ω′)))`, weak regularity and Weyl's lemma, exactly as the README quotes), PH6.1 (1045, Sobolev sections over compact surfaces with boundary: chart independence, completeness, Rellich, Morrey), PH6.3 (1128, Fredholm property, kernel and cokernel under a totally real `F`).
- PDE on main, §1.6 (A6) at line 905: Lipschitz domains in `ℝ^(n+1)`, the bounded trace for `1 ≤ p < ∞`, the bounded extension `W^(1,p)(Ω) → W^(1,p)(ℝ^(n+1))`, Rellich. The old “Lane A” label occurs 0 times in the PDE README.
- §0.2 of this README (line 164) states the canonical isomorphism `V ⊗ Λ_ω → V ⊗̂ Λ_ω` for finite-dimensional `V` and the perfect extension of a perfect pairing with the rational Gram matrix, which §7.1 now cites.

**Ownership.** `roadmaps grep` over the open heads and main for a Čech cup product finds, besides this roadmap, only CrystallineCohomology (#857, README line 324), where the product is on the sheaf cohomology of a crystalline site; it is not a product on `TauCeti.Topology.cechCohomology` of a topological space. StableReductionPartII (open head) and the AlgebraicTopology revisions own singular, not Čech, products. §0.4 has no other owner.

**Adversarial pass.** Rows for statements the diff leaves untouched carry the previous report's values (marked “r11”). Coefficients ℚ unless stated.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §0.4 cochain product, Leibniz, unit | two-point discrete `{u, v}`, `U₀ = U₁ = {u, v}`, `f₀ = 1_u`, `f₁ = 1_v`, `c₀₁ = 1`; unit on any `b` | `(f ⌣ c)₀₁ = 1_u · 1 = 1_u`; `(c ⌣ f)₀₁ = 1 · 1_v = 1_v`; reversed rule `(f ⌣′ c)₀₁ = c₀₁ f₁ = 1_v`; `(1 ⌣ b)_(i₀…i_q) = 1 · b_(i₀…i_q) = b`. Leibniz is Stacks line 2377 with `ε ≡ 1` | Correct |
| §0.4 reversal operator and graded commutativity | general `p, q`; `p = q = 1` | `τ` is a cochain map: `ε_(p+1)/ε_p = (−1)^(p+1)` and `(−1)^(p+1)(−1)^(p+1−k) = (−1)^k`. Sign of `τ(τ(b) ⌣ τ(a))`: exponent `[(p+q)(p+q+1) + q(q+1) + p(p+1)]/2 = p² + q² + pq + p + q ≡ pq (mod 2)`; at `(1, 1)` it is `−1` | Correct |
| §0.4 “sign trivial on the Čech complex of `R_Y` and in Čech degree 0” | Stacks `ε(n,m,p,r) = (−1)^((p+r)n + rp + r)` at `r = n` and at `p = r = 0`; the mixed case `r = 0, p > 0` | `ε(n,m,p,n) = (−1)^(pn + n² + np + n) = (−1)^(n² + n) = 1`; `ε(n,m,0,0) = 1`; `ε(n,m,p,0) = (−1)^(pn)`, not claimed and not needed: both edge maps land in `r = n` or `p = 0` | Correct |
| §0.4 refinement and pullback multiplicativity | index function `α`, `a` degree `p`, `b` degree `q` | `(α^*(a ⌣ b))_(j₀…j_(p+q)) = a_(α(j₀)…α(j_p)) b_(α(j_p)…α(j_(p+q))) = (α^* a ⌣ α^* b)_(j₀…j_(p+q))`; composing locally constant functions with `f` is a ring map, so `cechComplexPullback` preserves products | Correct |
| §0.4 external product identity | `T² = S¹ × S¹`, rectangular cover, `θ_k = pr_k^* θ` | `pr₁^* a ⌣ pr₂^* b` at `((i₀,j₀),…,(i_(p+q),j_(p+q)))` is `a_(i₀…i_p) b_(j_p…j_(p+q))`, the Alexander–Whitney cochain of `a ⊗ b`; `θ₁ ⌣ θ₂ = θ ⊠ θ ≠ 0` (the `(1,1)` Künneth summand, §6.5 Check `Ȟ¹(T²) = ℚ²`); `θ₂ ⌣ θ₁ = σ^*(θ ⊠ θ) = −θ ⊠ θ` (§6.5 swap Check); `θ₁ ⌣ θ₁ = pr₁^*(θ ⌣ θ)`, `θ ⌣ θ = −θ ⌣ θ ⇒ 0` over ℚ (and `Ȟ²(S¹) = 0`) | Correct |
| §0.4 Check: strictly commutative product | hypothetical `⌣′` commutative, natural, with `a ⊠ b = pr₁^* a ⌣′ pr₂^* b` | `θ ⊠ θ = θ₁ ⌣′ θ₂ = θ₂ ⌣′ θ₁ = σ^*(θ₁ ⌣′ θ₂) = σ^*(θ ⊠ θ) = −θ ⊠ θ`, so `2 θ ⊠ θ = 0`, contradiction over ℚ. The step uses §6.5's swap Check, which the Check does not name (remark) | Correct |
| §0.4 Check: truncated product | degrees `(0, q, r)`, `(p, q, 0)`, all positive | associativity: `(a·b) ⌣ c = 0 = a·(b ⌣ c)` for `q, r > 0`; `0 ⌣ c = 0 = a ⌣ (b·c)` for `p, q > 0`; all positive `0 = 0`; unital and natural trivially. Excluded by `θ ⊠ θ ≠ 0` on `T²` and by `x ⌣ x ≠ 0` in `H⁴(ℂP²)` | Correct |
| §0.4 Check: Warsaw circle | `W` compact metrizable, not of CW type | `Ȟ¹(W; ℚ) = ℚ` (rational form of §0.7's `ℤ`), singular `H¹(W; ℚ) = 0`; `1 ⌣ η = η ≠ 0`; `η ⌣ η = −η ⌣ η ⇒ 0`. A singular-transported product has no `η` | Correct |
| §0.4 API: algebra for every space and ring | `Y = ∅`; `Y = pt`; `R = ℤ/2` | `∅`: Tau Ceti's `isZero_cechCohomology_obj_of_isEmpty` gives the zero ring, a unital algebra; `pt`: `Ȟ⁰ = R`, higher `0`; `ℤ/2`: the sign is trivial and the statement is strict commutativity | Correct |
| §0.4 degree-0 identification | constant sheaf, `cechCohomologyZeroIso` | `Ȟ⁰(Y; R) ≅ R_Y(Y)` = locally constant functions; `(a ⌣ b)_i = a_i · b_i` is the pointwise product | Correct |
| §7.1 CohFT over the ring `Λ_ω` (headline 3; previous R04) | `T² × T²`, areas `1`, `√2`, `h ≠ 0` in `ker ω`; Enriques surface, torsion `τ`; Gram matrix | `ker ω` has rank `6 − 2 = 4`. If `(q^h − 1)x = 1` then `x_(g−h) − x_g = δ_(g,0)`, so `x_(kh) = x_0` for `k ≥ 1` and `x_(−kh) = x_0 + 1` for `k ≥ 1`, infinitely many coefficients at area `0` unless `x_0 = 0 = x_0 + 1`: no inverse. Enriques: `2τ = 0`, `(q^τ − 1)(q^τ + 1) = q^0 − 1 = 0`, both factors nonzero. `T² × T²`: Poincaré Gram matrix invertible over ℚ, so the extended pairing is perfect (§0.2) | Correct |
| §7.1 state module and values | `H^*(X; ℚ)` finite-dimensional; `H^*(M̄_(g,n); ℚ)` finite-dimensional | `V ⊗ Λ_ω → V ⊗̂ Λ_ω` is an isomorphism for finite-dimensional `V` (§0.2, line 164, basis `Algebra.TensorProduct.basis` to `NovikovModule.basis`), so correlators take values in `H^*(M̄_(g,n); ℚ) ⊗ Λ_ω` | Correct |
| §3.2 elliptic floor (previous R03) | the cited statements | PH3.2's estimate is `‖ξ‖_(W^(k+1,q)(K)) ≤ C(‖∂̄ξ‖_(W^(k,q)(Ω′)) + ‖ξ‖_(L^q(Ω′)))` for `K ⊆ Ω′ ⋐ Ω`, as quoted; PDE §1.6's trace is for `1 ≤ p < ∞` and the extension lands in `W^(1,p)(ℝ^(n+1))`, as quoted; PH6.3 requires a totally real `F`, so the Hardy matching at node circles is this roadmap's, as line 134 says | Correct |
| §8.3 new Check (R01's test instance) | `X = pt`, `(0, 5)`, `k = (1, 1, 0, 0, 0)` | `st = id`; ancestor bracket `Φ(C(ψ̄₁) ⌣ C(ψ̄₂))`; §8.1 gives `∫ ψ̄₁ ψ̄₂ = 2!/(1!1!) = 2`; equality needs the C1.2b comparison multiplicative (§0.4's last API bullet); the truncated product gives `Φ(0) = 0 ≠ 2` | Correct |
| §2.1, §2.2, §4.2, §6.5, §8.2 (citation edits only) | the object each now takes from §0.4 | §2.1: multiplicativity of the comparison; §2.2: the product on the coarse map space; §4.2: graded commutativity of `ev_i^* γ_i`, sign `(−1)^(deg γ_i deg γ_j)`; §6.5: `ev^* ⌣ st^* τ_D`; §8.2: `ψ_i^k` cup insertions. Each is an API bullet of §0.4; ImplicitAtlases §6.5 is no longer cited for a product it does not state | Correct |
| §1.1, §1.2, §2.2 degree, §3.1, §3.3, §3.4, §5.1–§5.3, §6.1, §6.3, §6.4, §6.6, §7.2, §8.1, §8.4–§8.6 | as in r11 | r11's rows: `d_(0,0,ℓ) = 0`, weights `1/2 · 1/2`, `Σ g_v + |E| − |V| + 1`, `χ(ℂP¹) = 2` against KM94's `1`, `g^(αβ) = −1`, transfer degrees `2, 2, 2, 1`, `x ⋆ x = q`, `∫ ψ̄₁ ψ̄₂ = 2`, `⟨τ₁²τ₀³⟩ = 2`, `−1/24 ⌣ pt`, all unchanged at this head | Correct (r11) |

## Not verifiable

- The multiplicativity route of §0.4's last paragraph (the Čech double complex with values in the singular-cochain sheaf resolution, two multiplicative edge maps) is a construction of this roadmap on C1.2b's comparison; the sign check above tests Stacks's formula, not the route. CharacteristicClasses C1.2b, as it stands on main, states “cup naturality” without a Čech product, so its multiplicativity is proved here, not consumed.
- Kontsevich–Manin, Kock, Pardon and Deligne–Mumford were not re-read this round; the changed passages cite only the Stacks chapter, which was read at every locator.
- The pull request #1998 head was not read beyond `scratch/overlaps.md`; the objects compared are those of its title and of the previous report.

## Source issues

- none (this round's locator checks were the Stacks chapter *Cohomology of Sheaves*, Section 25; the KM94 and KM97 errata of the previous report stand and are not repeated here).
