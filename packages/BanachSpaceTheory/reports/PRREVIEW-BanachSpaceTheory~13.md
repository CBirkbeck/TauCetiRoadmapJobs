# Review of BanachSpaceTheory (pull request #1854 at 7d06cba)

**Verdict:** needs changes

## R01 (P2) — §7.2's resolution of the identity and contact functionals are wrong over `ℂ`

**Location:** `README.md:1838`: "a resolution of the identity: `Σ c_i ⟨x, u_i⟩² = ‖x‖²`"; `README.md:1825–1826`: "extend the contact functionals `⟨·, u_i⟩` from `F` by Hahn–Banach".

**Claim:** §7.2 states John's decomposition over `𝕜`, and SNumbers consumes it over `𝕜`. Over `ℂ` the identity is false. With `u_i ⊗ u_i` defined as `x ↦ ⟨u_i, x⟩ u_i` (line 1811), the map `⟨·, u_i⟩` is conjugate-linear, so `P x = Σ c_i φ̃_i(x) u_i` in Kadec–Snobar is not `ℂ`-linear.

**Witness:** Take `𝕜 = ℂ`, `n = 1`, `K` the unit disc, `u₁ = i`, `c₁ = 1`. Then `⟨i, x⟩ i = x` and `Σ c_i = 1`, but `c₁ ⟨1, i⟩² = (±i)² = −1 ≠ 1 = ‖1‖²`.

**Repair:**
- At line 1838, write "`Σ c_i |⟨u_i, x⟩|² = ‖x‖²`".
- At lines 1825–1826, write "extend the contact functionals `⟨u_i, ·⟩` from `F`".
- Tested at `u₁ = i`: `|⟨i, 1⟩|² = 1 = ‖1‖²`, and `x ↦ ⟨i, x⟩ = −i x` is `ℂ`-linear.

## R02 (P3) — The push gate fails on two files outside the pull request's folders

**Location:** The gate at `7d06cba` reports `outside-folder`: `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`.

**Claim:** The pull request edits two roadmap folders that are not among its own (BanachSpaceTheory, MorseNovikov, OperatorTheory/SelfAdjointSpectralTheory). No acceptance is possible while the gate fails. This is unchanged since the previous review's R03.

**Witness:** `git diff --stat origin/main...HEAD`, excluding the three folders, lists only `Completed/ArithmeticDirichletSeries/README.md | 2 +-` and `TauCetiRoadmap/SymplecticGeometry/README.md | 6 +++---`.

**Repair:** Revert both sentences here. Move them into a pull request whose folders include ArithmeticDirichletSeries and SymplecticGeometry, or have both folders recorded as this pull request's own.

## R03 (P3) — §6.2 restates the pinned Grothendieck inequality on `C(K) × C(L)`

**Location:**
- `README.md:1735`: "Construct the compact-space bilinear-form version by finite partitions of unity and passage to the limit".
- Scope (`README.md:90–92`) and the Layer 6 contract name only the matrix inequalities.

**Claim:** The pinned Tau Ceti already carries out this construction, for compact normal `K, L` and with the constants `8` and `16`, in square-function form. Only the probability-measure form `|B(f, g)| ≤ κ_𝕜 ‖B‖ ‖f‖_{L²(μ)} ‖g‖_{L²(ν)}` is new here.

**Witness:** `LinearMap.norm_sum_apply_apply_le_sixteen_mul` and `LinearMap.abs_sum_apply_apply_le_eight_mul` (`TauCeti/Topology/ContinuousMap/Grothendieck.lean:157,169`). The module docstring proves them by finite partitions of unity from the matrix inequality.

**Repair:**
- Add both names, with their file, to the Layer 6 contract, to Scope's "From B6", and to §6.2's *Needs:*.
- Replace the sentence at line 1735 with: "From the pinned square-function form `LinearMap.norm_sum_apply_apply_le_sixteen_mul` (over `ℝ`, `LinearMap.abs_sum_apply_apply_le_eight_mul`), derive by the Hahn–Banach separation argument probability measures `μ, ν` with …".
- Tested at `K = L` a point, `B(f, g) = f g`, `f = g = 1`: the pinned bound gives `1 ≤ 16`, and `μ = ν = δ` gives `|fg| ≤ 16 |f||g|`.

## R04 (P3) — §4.4 depends on §5.4, a later layer

**Location:** `README.md:791`: "use scalar weak-star-dual-ball factorization, the Riesz representation of §5.4 and the reflexive-target density theorem". The same dependency is at `:901`, `:1162` and `:377–378`.

**Claim:**
- A Layer 4 target uses a Layer 5 target. The repository README's "No gaps" rule calls such a forward reference a leap.
- The only use is the scalar Riesz representation, and the pin already supplies that over `ℝ`.

**Witness:** The pinned `TauCeti.RealRMK.integral_rieszMeasure_posPart_sub_integral_rieszMeasure_negPart` (`MeasureTheory/Integral/RieszMarkovKakutani/Signed.lean:262`) represents an order-bounded real functional on `C(K, ℝ)`, for compact `K`, by two finite regular measures.

**Repair:**
- In §4.4, replace "the Riesz representation of §5.4" with that pinned theorem and run the integral/nuclear route over `ℝ`.
- Pass from a complex `X` to its underlying real space by `T ↦ (T − iTi)/2`, which keeps finite rank and has norm `≤ ‖T‖`.
- Delete §5.4 from `:901`, `:1162` and `:377–378`.
- Tested at `X = ℂ`, `T = Re`: `(T − iTi)/2` is `z ↦ z/2`, which is `ℂ`-linear with norm `½ ≤ 1`.

## R05 (P3) — Two locators do not match the texts read

**Location:**
- `README.md:1008`, `:1150` and `:1976`: "Dilworth–Odell–Schlumprecht–Zsák, *Partial Unconditionality*, Theorems 2.1–2.2".
- `README.md:520`: "*Weakly compact sets*, Theorems 4–5 (p. 138)".

**Claim:**
- The manifest's DOSZ text, arXiv math/0510609v1, numbers its results consecutively and has no Theorem 2.1 or 2.2.
- James's Theorem 5 is on p. 139, not p. 138.

**Witness:**
- `dosz09`: line 339 (Theorem 6, `C ≤ 8d`, p. 7), line 377 (Theorem 7, Matching Lemma), line 503 (Corollary 9), lines 557 and 580 (Lemmas 10–11).
- `james64`: line 374 (Theorem 5), on p. 139 (line 359).

**Repair:**
- At all three places, write "DOSZ, Theorem 6 and Theorem 7 (Matching Lemma), p. 7, Corollary 9, p. 10, and Lemmas 10–11, pp. 11–12 (arXiv math/0510609v1)".
- At line 520, write "Theorems 4–5 (pp. 138–139)".

## R06 (P3) — Sampled targets lack an exact locator

**Location:**
- §1.4 (`README.md:486–499`), §4.1 (`:646–657`) and §4.3 (`:707–730`) cite nothing.
- §4.2 cites "Ryan, Chapter 4" (`:664`) and gives no locator for the Schmidt series.
- §7.2 cites "(Garling–Gordon 1971)" (`:1830`).

**Claim:**
- Every theorem needs a theorem-and-page locator at the claim.
- §4.3 is the unrepaired remainder of the previous review's R06.
- The text on main located Garling–Gordon more exactly.

**Witness:**
- `daws04` Proposition 2.3.4(3) (lines 1565–1582, pp. 39–40) is the tensor characterization.
- `daws04` lines 1583–1586 (p. 40) state the metric approximation property of `Lᵖ(μ)`.
- `vanneerven22` Theorem 14.15 (line 25732, p. 567) is the singular-value decomposition.

**Repair:**
- §4.1: add "(Daws, remark after Proposition 2.3.4, p. 40)".
- §4.2: write "(Daws, Proposition 2.3.4(3), pp. 39–40; Ryan, Proposition 4.6)". For the Schmidt series add "(van Neerven, pp. 566–567, Theorem 14.15)".
- §7.2: write "(Garling–Gordon 1971; Pietsch, *Eigenvalues and s-Numbers*, 1.7.17)", as SNumbers cites it.
- §1.4 and §4.3: add a theorem-and-page locator in a recorded text. For §4.3, Muñoz–Sarantopoulos–Tonge, Studia Math. 134 (1999), is the source of the pinned complexification.

## R07 (P3) — Downstream consumers misstates what SelfAdjointSpectralTheory consumes

**Location:** `README.md:1941`: "SelfAdjointSpectralTheory consumes Layer 1's Goldstine comparison and §5.4's `M(K)`".

**Claim:** Layer 1 of this roadmap states no Goldstine comparison. SelfAdjointSpectralTheory proves its own Goldstine limit comparison and takes Goldstine's theorem from Tau Ceti.

**Witness:** `OperatorTheory/SelfAdjointSpectralTheory/README.md` at this head:
- `:87–88`: it consumes §5.4 only.
- `:182–184`: Goldstine is taken from `TauCeti/.../Goldstine.lean`.
- `:390`: it states its own Goldstine limit comparison.

**Repair:** Write: "SelfAdjointSpectralTheory consumes §5.4's `M(K)` and its Riesz isometry with `C(K)*`; the Goldstine theorem and the scalar-measure layer it also uses are Tau Ceti's."

## R08 (P3) — The description contradicts the head and omits the rewrite

**Location:**
- Summary block: "BanachSpaceTheory takes ownership of the scalar-measure integration layer … SelfAdjointSpectralTheory consumes those items from BanachSpaceTheory".
- First bullet: "Both Suggested.lean files move the corresponding statements and elaborate."

**Claim:**
- At the head, both roadmaps consume this layer from the pinned Tau Ceti, and this folder's `Suggested.lean` states none of it.
- The text does not say that the README is rewritten (`B1`–`B7` become Layers 1–7; 17 declarations removed, 10 added).
- It omits the supplier changes: SelfAdjointSpectralTheory dropped, PseudodifferentialOperators added.

**Witness:**
- `README.md:71–72`: "Its five items … are Tau Ceti's at the pin, and this roadmap and SelfAdjointSpectralTheory both consume them there".
- `Suggested.lean:21–25`.
- The worker's diff summary: 13 headings removed, 17 declarations removed.

**Repair:** Replace the BanachSpaceTheory sentences of the summary, and the first bullet, with:

> BanachSpaceTheory is revised in full into the house shape. The headings `## B1.`–`## B7.` become Layers 1–7, each heading keeping its id (B1)–(B7), and an old → new anchor list sits under Scope and ownership. The scalar-measure integration layer (formerly SelfAdjointSpectralTheory SA-B81–84, cited as B5.ScalarIntegral, B5.ScalarDensity, B5.AbsContRegular, B5.ScalarUniqueness and B5.BoundedApprox) is the pinned Tau Ceti's. Both roadmaps consume it there, which cuts the loop. SelfAdjointSpectralTheory is no longer a supplier; PseudodifferentialOperators Layer 5 is added as one. `Suggested.lean` drops the 17 declarations that the pinned Tau Ceti now proves or defines, among them Eberlein–Šmulian, Milman–Pettis, Krein–Šmulian, Bishop–Phelps, Pietsch domination, Grothendieck's matrix inequality and local reflexivity. It adds 10 headlines, among them the convex-set James theorem, Grothendieck's tensor characterization, the Riesz representation of `C(K, 𝕜)*`, the Dunford–Pettis property of `C(K)` and `L¹`, Grothendieck's theorem for `L¹`, and Garling–Gordon.

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| `james` | `A = ∅`; closed ball of `ℓ¹`, `f = Σ(1−1/n)xₙ`; `c₀` box `[0,1]^ℕ`, `(2⁻ⁿ)`; Hilbert ball | `∅`: true / false, excluded by `hne`. `ℓ¹`: false / false. Box: sup `1` only at `1 ∉ c₀`, false / false. Hilbert: true / true | holds | R05 (page) |
| `surjective_inclusionInDoubleDual_iff_forall_exists_norm_apply_eq` | `E = 0`; `ℓ¹`; `c₀` | `0`: true / true, with `x = 0`. `ℓ¹`: `‖f‖ = 1`, `|f x| < 1`, false / false. `c₀` with `(2⁻ⁿ)`: false / false | holds | none |
| `hasApproximationProperty_iff_injective_toCompletedInjectiveTensor` (§4.2) | `E = 𝕜`; `E = 0` | `𝕜`: `F⊗̂π𝕜 ≅ F ≅ F⊗̂ε𝕜`, the map is the identity, injective, true / true. `0`: true / true | holds | R06 (locator) |
| `hasMetricApproximationProperty_of_surjective_inclusionInDoubleDual` (§4.4) | `E = 0`; `ℓ²`; complex-to-real reduction | `‖0‖ = 0 ≤ 1`. `‖Pₙ‖ = 1`, `Pₙx → x`. `X = ℂ`, `T = Re`: `(T−iTi)/2 = z/2`, norm `½` | holds | R04 |
| §4.4 metric criterion | `X = 𝕜`; `ℓ²ₙ`, `u = Σeᵢ*⊗eᵢ`; transposed pairing | `𝕜`: `S = c·`, no loss. `‖Θu‖ = Σδᵢⱼ = n = ‖u‖π`. `f(y)g(x) = 1` against `f(x)g(y) = 0` | holds | none |
| `exists_reflexive_not_hasApproximationProperty` | Krawtchouk at `n = 3, 4`; integral route | `|K₂(j)| = 5, 1, 3 ≤ 5`; `|K₃(j)| = 14, 4, 6, 0 ≤ 14`; `256/(4π) ≈ 20.4 > 14` | holds | none |
| `exists_scalarPlusCompact` (§4.5) | base pairs `j = 1, 2`; contradiction constant | `n₂ = 2³² = 2⁸·2²⁴`; `2¹⁰²⁴ ≥ 2²⁸⁸`; `δ/(4m) ≥ δm‖z‖/(192C)` and `256/192 > 1` | holds | R05 (DOSZ) |
| `exists_complexificationStrongDualEquiv` | `E = ℝ`, `(g,h) = (id,0)`; `i·⟨g,h⟩ = ⟨−h,g⟩` | `φ(x+iy) = x+iy`; `e⟨−h,g⟩(x,y) = −h x − g y + i(g x − h y) = i·φ(x,y)` | holds | none |
| `hilbertBasis_lift_mk_eq` (§5.2) | `H = 0`; `ℓ²(ℕ)`, `ℓ²(ℤ)` | empty indices give `0 = 0`; `ℵ₀ = ℵ₀`, while the Hamel rank is `𝔠` | holds | none |
| `nonempty_linearIsometryEquiv_iff_lift_mk_eq` | `ℝ` against `ℝ²`; `ℓ²(ℕ)` against `ℓ²(ℤ)` | `1 ≠ 2` and no isometry: false / false. `ℵ₀ = ℵ₀` through `ℕ ≃ ℤ`: true / true | holds | none |
| `exists_linearIsometryEquiv_hilbertBasis` | `ℂ²` standard bases, `e` = swap; empty `ι` | `U` = coordinate swap, `U b₀ = b₁ = c(e 0)`; `H = 0`, `U = 0` | holds; no one-tactic proof (Mathlib has no `HilbertBasis.reindex`) | none |
| `exists_unique_vectorMeasure_regular` (§5.4) | `K` a point; `[0,1]`, `φ = ev₀ − ev₁`; `K = ∅` | `‖cδ‖ = |c|`; `‖φ‖ = 2` at `1−2t`, `|δ₀−δ₁|([0,1]) = 2`; `φ = 0` with unique `μ = 0` | holds | none |
| `exists_lpInftyDualEquiv` | `μ = ∞·δ_a`; `μ = 0` | `L¹ = 0`, `L∞ = 𝕜`, excluded by `SigmaFinite`; `0 ≅ 0` | holds | none |
| `exists_lpDualEquiv` | counting measure on `{1,2}`, `p = 3`, `g = (1,1)`; `ℂ`, `p = 2` | `sup|f₁+f₂| = 2^(2/3) ≈ 1.587 = ‖g‖_(3/2)`; `∫fg` is `ℂ`-linear, `∫f ḡ` is not | holds | none |
| `isCompact_closure_toWeakSpace_lp_one_iff` | `fₙ = n1_[0,1/n]`; `δ_a`, `S = {n·1}`; `μ = 0` | integral `1` on measure `1/n`: false / false; unbounded: false / false; true / true | holds | none |
| `hasDunfordPettisProperty_continuousMap` | `K = ∅`; `K` a point; route | `C = 0`; `C = 𝕜`, finite-dimensional; `ν = Σ2^(−n−1)|νₙ|` finite, `νₙ = ν.withDensityᵥ hₙ` | holds | none |
| `hasDunfordPettisProperty_lp_one` | counting measure on `ℕ`; `μ = 0`; σ-finite reduction | `ℓ¹`, with the pinned instance; `0`; restriction is an adjoint, so it keeps weak nullity | holds | none |
| `banach_stone` (§5.5) | `𝕜²`, `(a,b) ↦ (b,−a)`; `((a+b)/2, (a−b)/2)`; `K = ∅ ≠ L` | `φ` = swap, `h = (1,−1)`; `(1,0) ↦ (½,½)`, not isometric; no `T` exists | holds | none |
| `rademacherSecondMoment`, `HasCotype` (§6.1) | `n = 0`; `c₀`, `e₁…eₙ`; `(y,y)`; `p = 4`, `n = 16` | `0 ≤ C·0`; `n^(1/q)` against `C`, fails; `R₂ = √2‖y‖`; `4‖y‖` against `2.38‖y‖`, fails | discriminates | none |
| `cotype2_summing_bound` | `Y = ℝ`, `C = 1`; `t(1)`; `C < 1`, `Y ≠ 0` | `π₂ = |a| = R₂`, so `K ≥ 1`; `E[g²1_{|g|>2.05}] = 0.2404 ≤ ¼`; cotype fails at `n = 1` (vacuous) | holds | none |
| `summingENorm_one_le_of_lp_one` | `Tf = ∫f` on `L¹[0,1]`; `id` on `ℓ²ₙ` | `π₁ = ‖T‖ = 1 ≤ 16`; weak-`ℓ¹` norm `√n` against `Σ‖eᵢ‖ = n`, so the domain must be `L¹` | holds | none |
| §6.2 compact-space form | `K = L` a point, `B = fg` | pinned square-function bound `1 ≤ 16`; measure form with `μ = ν = δ` | holds | R03 |
| `banachMazurDist_euclideanSpace_le_sqrt` (§7.2) | `n = 0`; `n = 1` over `ℂ`; `ℓ₁ⁿ` | junk infimum `0 ≤ 0`; `1 ≤ 1`; `d(ℓ₁ⁿ, ℓ₂ⁿ) = √n`, attained | holds | none |
| §7.2 resolution of the identity | `𝕜 = ℂ`, `n = 1`, `u = i`, `c = 1` | `⟨i,x⟩i = x`, `Σc = 1`; `c⟨1,i⟩² = −1` against `‖1‖² = 1`; `|⟨i,1⟩|² = 1` | false over `ℂ` | R01 |
| `kadec_snobar` | `F = ⊥`; `dim F = 1` over `ℂ` | `P = 0`, `0 ≤ 0`; `P x = φ(x)x₀`, `‖P‖ = 1 = √1` | holds | R01 (functionals) |
| `garling_gordon` | `M = E`; `M = ker f`, `‖f‖ = 1`; dense `ker` | `n = 0`, `‖0‖ ≤ ε`; `‖P‖ = ‖x₀‖ < 1+ε`; no continuous `P`, so `IsClosed` is needed | holds | R06 (locator) |
| `dvoretzky_finite` | `k = 0`; `k = 1`; `ε ≥ 1` | `T = 0`; `t ↦ te`, `N = 1`; `T = 0` meets both bounds | holds | none |
| `dvoretzky` | `E = ℓ²`; `n = 0` | the inclusion meets `(1±ε)`; `T = 0` | holds | none |
| §1.2 | `T = diag(2⁻ⁿ)` on `c₀`; `e₁*` at `e₂` in `ℓ²`; `E = 𝕜` | `T**1 = (2⁻ⁿ) ∈ J(c₀)`; `0` against `sup = 1`; `J = id` | holds | none |
| §1.4 | `(t,t²)`; the line `y = mx`; bound | `f = ½`; `mx/(x²+m²) → 0`; `2|x²y| ≤ x⁴+y²`, so `|f| ≤ ½` | holds | R06 |
| §3.2 | level `j`; `P₂(t)`; `p = 2, 3, 3/2` | `‖h‖_p = 2^(−j/p)`; averages `¼, ¾`; constants `1, 2, 2` | holds | none |
| §4.1 | `P_n 1`; `1_[0,1/3)` in `L¹` | `‖P_n‖ = 1`; `‖P_n f − f‖₁ ≤ 2⁻ⁿ` | holds | R06 |
| §4.2 Schmidt and nuclear | `id` on `ℓ²ₙ`; `diag(1/j)`; `diag(1/j²)` | `ν = n`, `‖·‖ = 1`; `Σ1/j = ∞`; `π²/6 ≈ 1.645` | holds | R06 |
| §5.1 | `(2^(−n−1))` in `ℓ²(ℕ)`; uncountable `S` | `‖·‖² = 1/3`, infinite support; `‖e_s − e_t‖ = √2` | holds | none |
| §5.3 | `√2cos 2πt`, `√2sin 2πt`; `t^α` | norm² `1`, inner product `∫sin 4πt = 0`; Hölder quotient `1`, so `t^α ∉ h^(0,α)` | holds | none |
| §5.8 | `ℝ_d × ℝ`, `1_{ℝ_d×{0}}`; discrete `G` | global norm `1`, locally null, so not injective; local quotient `ℓ∞(G) = ℓ¹(G)*` | holds | none |
| §7.1 | `E = 𝕜`; `f⊗x`; reflexive `E` | `|u| = |u|`; `‖f‖‖x‖` on both sides; `S = J⁻¹T` attains | holds | none |

- Previous review (`473bbf7`): R01 repaired (`Suggested.lean:61` convex `james`, `:266` `garling_gordon`); R02 repaired (`README.md:746–755` direct MAP route; `:1776` "that is reflexive or has the metric approximation property"); R03 not repaired (now R02); R04 repaired (density construction at `:1330–1342`; §5.9 *Needs:* "§§1.3, 5.4, 5.6"); R05 repaired (old → new anchor list at `:27–43`); R06 partly repaired (remainder in R06); R07 repaired (`:308`, `:333–344`, `:1868–1877`, `:1892`); R08 repaired (`:884–892`, `:1132–1146`, `:1265–1272`).
- Gate re-run: every check is 0 except `outside-folder` (5 files, 2 of them outside the pull request's three folders, R02); dependency check: `depcheck: 206 roadmaps, 1903 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Lean: `lake env lean` exits 0 with 24 `declaration uses 'sorry'` warnings and nothing else; `#check @` of all 26 declarations shows every binder (the signature report's 2 leads are binders inside `∃`); padding probe (`simp`, `rfl`, `infer_instance`, `trivial`, `aesop`) closes 0 of 24.
- 40 locators read against the cached texts (van Neerven 14, Daws 3, Yosida–Hewitt 3, Argyros–Haydon 7, AOST 2, James 2, Garrido–Jaramillo 2, one each of BdlHV, Pisier, Ball, AFJS, Heil, DOSZ, Emmanuele); all match except those in R05.
- Library at the pins: 28 declarations opened (among them `Grothendieck.lean:157,169`, `Signed.lean:160,262`, `Burkholder.lean:59`, `Sphere/Basic.lean:77,138,237,251,277`, `Rademacher/Norm.lean:98`, `HilbertBasis/Map.lean:32`, `Regular.lean:234`, `WithDensity.lean:155`, `Uniqueness.lean:122`); neither pin has cotype, and Mathlib has no Hilbert-basis cardinality theorem.
- Cross-roadmap citations, 9 resolved: OperatorIdeals OI-A01 (`:125`), OI-A25 (`:172`), OI-A28 (`:179`); AmenableGroups Layer 7 (`:415`), item 1 (`:438`); PDE §1.1 (A1) (`:677`); PseudodifferentialOperators Layer 5 (`:927`); SelfAdjointSpectralTheory at this head cites §5.4 (`:87`, `:215`).
- Overlap check: read LocallyConvexDuality, CompactQuantumMetricSpaces, QuantumFoundations, MathematicalStatisticsFoundations (open) and SNumbers, VonNeumannAlgebras, NoncommutativeIntegration (main), the results/headings list being empty; LocallyConvexDuality (B4), CompactQuantumMetricSpaces (B1, B5), SNumbers (B1, B4, B6, B7), VonNeumannAlgebras (B1, B2, B4) and NoncommutativeIntegration (B1, B2) consume from this roadmap, owner BanachSpaceTheory; nothing is owned twice.

## Not verifiable

- `megginson98` 2.9.3–2.9.4 (§2.1): uncertified, no text in the sources cache.
- `albiackalton06` 6.1.3–6.1.7 (§3.2), §§5.2/5.4, 8.1.3, 12.3.13, 13.1.5, 13.1.7, 13.3.2–13.3.7: uncertified, no text in the cache.
- `ryan02` Chapters 2–4 (§4.2) and `enflo73` §§1–4 (§4.4): uncertified, no text in the cache.
- `hewittross63` 12.18 (§5.8): uncertified; its content agrees with `bdlhv08` C.5, which was read.
- `garlinggordon71` (§7.2), `conway90` I.4.14 (§5.2) and `runde02` B.2: uncertified, no text in the cache.
- Pisier, *Factorization of Linear Operators*, CBMS 60, §3 (§6.1): no manifest key and no legal open copy known; the absorption route was checked by computation instead.
- §1.4 and §4.3: no locator, so nothing to check (R06).

## Source issues

- **Misprint** in argyroshaydon11 at the proof of Proposition 7.3, printed p. 29: the source bounds `‖Tz‖` below by `m⁻¹/4` without `δ`, then claims it exceeds `C⁻¹δm‖z‖/144`; it should be `δm⁻¹/4 ≥ C⁻¹δm‖z‖/192`, from `‖z‖ ≤ 48Cm⁻²`; affects nothing.
- **Misprint** in argyroshaydon11 at Lemma 2.4, printed pp. 4–5: both case splits are written in an index `i` that does not occur in the statement; they should be in the weight index `h`; affects nothing.
