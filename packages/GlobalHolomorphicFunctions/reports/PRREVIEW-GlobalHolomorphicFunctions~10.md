# Review of GlobalHolomorphicFunctions (pull request #992 at f34a288)

**Verdict:** needs changes

This is an incremental re-review of the 136 lines changed since `af99bc5`. The head repairs three of the previous report's four findings (R01, R02 and R04). R03, about the pull-request description, is not repaired and is carried forward as R01 below. It is P3, so nothing here blocks. The changed passages introduce no new defect.

- **Gate:** passes.
- **Dependency check:** reports 0 problems.
- **Build:** `Suggested.lean` elaborates with exactly 22 `sorry` warnings and nothing else.
- **One-tactic probe:** closes none of the 22.

## R01 (P3) — The pull-request description still names DifferentialGeometry as a supplier and describes files and counts the folder lacks

**Location.** The description of #992 contains the following passages:

- "- [ ] depends on: #886"
- "DifferentialGeometry #886 supplies generic forms and finite-cycle Green"
- "General primary factors and products belong here"
- "GH4 adds an independent paired-cotangent proof"
- "`ProductCotangentTargets.lean` supplies eight actual formula definitions"
- "twenty-eight intentional proof-target admissions"

The generated chain reads "#886 (DifferentialGeometry) → #1126 (AnalyticNumberTheoryPartI) → this pull request".

**Claim.** According to the description, DifferentialGeometry is a supplier, the primary factors belong to this roadmap, the folder carries a cotangent proof and a companion Lean file, and #992 must wait for #886 and #1126.

**Witness.**

- `README.md:26` says "DifferentialGeometry is not a supplier".
- AnalyticNumberTheoryPartI is on main as `63d18d7b`, "Analytic number theory, Part I (#1126)".
- The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.
- The build gives 22 `sorry` warnings, not 28.

**Repair.**

1. Delete the line `- [ ] depends on: #886`.
2. Delete these passages:
   - the DifferentialGeometry passage;
   - "General primary factors and products belong here", together with the #253 coordination paragraph;
   - the GH4 paired-cotangent passage;
   - the `ProductCotangentTargets.lean` passage;
   - the 28-admission and 18-admission validation passages.
3. State the suppliers as `README.md:10`–64 and the supplier contracts do: ZerosOfLFunctions, ConformalMapping and AnalyticNumberTheoryPartI. All three are now on main. The depends-on block and the merge-order chain then list no open pull request.

**Tested on the instance.** Every supplier named in the README's `*Needs:*` lines is either on main (including `Completed/ConformalMapping`) or at the pins. With #886 dropped, the dependency check prints `depcheck: 237 roadmaps, 2309 edges, 0 problem(s)`.

## Previous findings

- R01 — repaired: `README.md:299`–301 now consume "its reindexing and fibre-grouping law". `:713` reads "Consume §0.15's fibre-grouping law for the finite fibres `{ρ} × Fin (m ρ)`", and the 1.2 `*Needs:*` at `:748`–750 names that law.
- R02 — repaired: `:1252`–1253 read "Two routes prove the theorem; neither is an input of the other". The first route is Rainer's proof of Proposition 15.2 (`:1255`–1278). `:1292` reads "This route establishes …", and the `*Needs:*` at `:1382`–1394 is split by route.
- R03 — not repaired: the description still reads "- [ ] depends on: #886" and "`ProductCotangentTargets.lean` supplies eight actual formula definitions". It is carried forward as R01 above.
- R04 — repaired: `:944`–947 now read "agrees at n=0 (K_0={0}) but empties every stage with n≥1, since a thickening of radius n+1≥2 of {|z|≥1} is all of ℂ; the union is then {0}".

## Verified sound

**Gate, build and Lean form.**

- **Gate.** I re-ran `gate … --base origin/main` on `f34a288`. Every check is 0 (set_option, sorry-data, imports, statement-hygiene, dropped, depcheck, stray-files, outside-folder and the rest), followed by `OK`, exit 0. The worker's gate also shows `build=0`.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GlobalHolomorphicFunctions'` is empty.
- **Build.** `lake env lean TauCetiRoadmap/GlobalHolomorphicFunctions/Suggested.lean` exits 0. It gives 22 `declaration uses 'sorry'` warnings, at lines 51, 72, 91, 107, 126, 138, 151, 169, 179, 188, 196, 210, 222, 235, 247, 264, 273, 284, 301, 309, 317 and 324, and no other diagnostic. These are the previous review's lines, shifted by one after the docstring at `:67`–71 grew by one line.
- **Lean diff since `af99bc5`.** `git diff af99bc5 f34a288 -- …/Suggested.lean` changes only the docstring of `exists_entire_genusOne_product`. No type changes.
- **Signatures.** `signatures.md` lists 24 declarations and none has a dropped binder. The file has no `variable` block. The `Σ ρ, Fin (m ρ)` index and the two `HasProdLocallyUniformlyOn` conclusions match the rewritten 1.2 prose.
- **One-tactic probe.** On a scratch copy I replaced every `sorry` with `first | rfl | infer_instance | simp | norm_num | trivial | positivity`. This gave 22 errors, one at each target (lines 57 … 331 of the copy), so nothing closes and there is no padding.
- **Headlines.** The module docstring's list and the 22 theorems are unchanged. `IsRungeCompactPair` and `holomorphicHull` keep real bodies on native carriers.

**Dependency check.** The brief's command printed exactly:

```text
depcheck: 237 roadmaps, 2309 edges, 0 problem(s)
```

The merge order has ZerosOfLFunctions at 48, AnalyticNumberTheoryPartI at 50 and this roadmap at 97.

**Library declarations newly cited (5), opened at the pins.**

- `IsOpen.isConnected_iff_isPathConnected` (`Mathlib/Topology/Connected/LocallyPathConnected.lean:190`): `IsConnected U ↔ IsPathConnected U` for open `U` in a locally path-connected space, as the README's `:155`–157 says.
- `Complex.differentiableAt_log` (`Mathlib/Analysis/SpecialFunctions/Complex/LogDeriv.lean:41`, `namespace Complex`): hypothesis `z ∈ slitPlane`.
- `Complex.exp_log` (`…/Complex/Log.lean:41`): hypothesis `x ≠ 0`.
- `TauCeti.IsPiecewiseC1On.windingNumber_eq_of_mem_connectedComponentIn` (`TauCeti/Analysis/Contour/Winding/LocallyConstant.lean:138`). It assumes `IsPiecewiseC1On γ a b`, `γ a = γ b` and `w₁ ∈ connectedComponentIn ((γ '' uIcc a b)ᶜ) w₀`, and concludes that the two winding numbers are equal.
- `TauCeti.Contour.windingNumber_eq_integral_of_avoidance` (`…/Winding/Number/Basic.lean:170`). It assumes `ContinuousOn γ (uIcc a b)`, avoidance of `z₀`, and interval integrability of `(γ t − z₀)⁻¹ * deriv γ t`. It concludes that the winding number equals `(2πi)⁻¹ ∫`.

Both winding lemmas are stated for the same `TauCeti.Contour.windingNumber` (`Number/Basic.lean:76`), so they compose as the route uses them.

**Supporting Tau Ceti declarations the new route uses, re-read at the pin.**

- `TauCeti.Contour.isExactOn_of_forall_closed_integral_eq_zero` (`Primitive.lean:183`). It needs an open `U`, `ContinuousOn f U` and vanishing integrals over closed piecewise-`C¹` curves in `U`. It needs no connectedness: the proof picks a base point per path component. So `W = ℂ∖P` may be disconnected.
- `exists_differentiableOn_eqOn_exp_comp_of_isExactOn` (`Primitive.lean:263`) takes `IsExactOn (logDeriv g) U`. For `g = (z−b)/(z−a)`, `logDeriv g = 1/(z−b) − 1/(z−a)`, the integrand of the route.
- `TauCeti.IsFilledIn` (`Topology/FilledIn.lean:61`) says that no `x ∈ Ω∖K` has `closure (connectedComponentIn (Ω∖K) x)` compact and contained in Ω. This is exactly what the route's "bounded component B ⊆ Ω" argument contradicts. A bounded component of `ℂ∖K` inside Ω is a component of `Ω∖K`, and its closure lies in `B ∪ K ⊆ Ω`.

**The new zero-free route (3.1), step by step.**

The README route follows Rainer's proof (rainer lines 1956–1993) step by step:

- the components and the choice `a_j ∈ V_j∖U` (lines 1956–1958);
- `a₀ = R` (line 1959);
- the rational approximant by Theorem 11.7 (lines 1960–1966);
- the regrouping into `H` (lines 1967–1983);
- logarithms by Lemma 15.1 (lines 1984–1985);
- the logarithm of `z−R` on the disc by Theorem 4.8 (lines 1985–1986);
- Runge 11.1 and `G = cHe^L` (lines 1989–1993).

It improves on the source in five places:

- **Explicit logarithm domain.** The logarithm is taken on the explicit `W = ℂ∖P`, a neighbourhood of K that keeps a and b in one complementary component. This closes the source gap listed under Source issues.
- **Non-vanishing of r.** The extra `η` makes r non-vanishing on K.
- **Error bookkeeping.** The `ε/2` bookkeeping gives `< ε`.
- **Filledness hypothesis.** The hypothesis `IsFilledIn` replaces `K = K̂_U`.
- **Disconnected Ω.** Ω need not be connected.

Each step was checked: the minimum `η > 0`, `|r| > η/2` on K, the factorization with `m_i ∈ ℤ∖{0}`, `R ∉ K` in the unbounded component, the identity `z−R = exp(log R + iπ + log(1−z/R))` on `ball 0 R`, holomorphy and non-vanishing of `H·exp(L)` on Ω, and `|G−r| ≤ sup_K|r|(e^δ−1)`. 2.5 (`README.md:1147`–1148) supplies the rational variant the route invokes.

The second route's prose is unchanged apart from "establishes" for "must establish" and the closing comparison. The Layer 3 `### Dependencies` line ("Tau Ceti period/logarithm and winding contracts") covers both routes.

**AnalyticNumberTheoryPartI §0.15, now on main.**

- `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:530`: the product is `HasProdLocallyUniformlyOn` with `analyticOrderAt F z = #{i : a_i = z}`.
- `:537`: "Reindexing by an equivalence and grouping finite multiplicity fibres preserve the product".

This roadmap's contract at `:299`–301 restates that bullet in the locally uniform sense of the surrounding statement. 1.2 applies it to the fibres `{ρ} × Fin (m ρ)` of `a(ρ,j) = ρ`, and handles empty fibres (`m ρ = 0`) by its own "insertion of zero multiplicities" API at `:737`.

The supplier's `Suggested.lean` on main declares:

- `elementaryFactor` (`:346`);
- `exists_entire_primary_product_exact` (`:351`);
- `exists_entire_exp_mul_of_divisor_eq` (`:363`).

These are the names this roadmap's comment at `Suggested.lean:62`–64 and its contract cite.

**Overlaps and ownership.**

- `overlaps.md` lists no pull request that changes this roadmap and no dropped or revision-only id. The diff renames no heading, and the gate reports `dropped=0`.
- Of the closest open roadmaps, ComplexKahlerGeometry at #1807 (`README.md:85`), #1808 (`:89`) and #1854 (`:85`) all read "GlobalHolomorphicFunctions owns Runge approximation, the global scalar `∂̄` solver …". ComplexComparisonPartII #848 (`:762`, `:1581`) only consumes the finite-rank Runge operator.
- `roadmaps grep` finds no second owner of `IsRungeCompactPair`, `holomorphicHull`, the fibre-grouping law or zero-free Runge approximation.
- The change moves ownership of the grouping law to §0.15, which removes the previous report's only overlap.

**Sources: the sampled targets the diff touches.**

Rainer's printed page is the PDF page minus 6.

- **0.1 (and 7.3).** Line 1211 carries equation (10.1), on PDF page 29 (marker at line 1187), so printed p. 23. The expansion `dg = g_ζ dζ + g_ζ̄ dζ̄` is at line 1206.
- **README locator range.** The README's rainer locators now range from line 1211 to line 2116, inside the References range "rainer lines 1211–2136".
- **1.2.** Theorem 14.3 at line 1868 is on PDF page 41, so printed p. 35, unchanged.
- **3.1.** On PDF page 42, so printed p. 36: Lemma 15.1 at line 1934 and Proposition 15.2 at line 1950. Its proof at lines 1956–1993 and Theorem 15.3 at line 1997 are on printed p. 37.

**Remark on unchanged text (no finding).** In the new route the K=∅ approximant is called `g` (the Lean name) and the general one `G` (Rainer's). The meaning is unambiguous.

**Adversarial pass.** S = `Suggested.lean`, R = `README.md`. Rows marked (r9) are carried forward from the previous report for statements this diff leaves untouched. The other rows were computed this round with a pure-Python script (truncated products, midpoint quadrature with 20 000 nodes, 1800 sample points on K).

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| S `exists_entire_genusOne_product` (1.2, docstring and route changed) | S={1}, m=2 at z=1/2; S=ℕ₊, m≡2 at z=1/2; order at 1 | grouped 0.6795705 = repeated 0.6795705 = (1−z)²e^{2z}. Grouped ∏E₁(z/n)² gives 0.5669337, and the repeated index in a two-pass order also gives 0.5669337, against the closed form (e^{γz}/(−zΓ(−z)))² = 0.5669330 (N=2·10⁵). P(1+h)/h² = 3.17381 at h=10⁻⁴ and 2·10⁻⁴: finite and nonzero, so order 2 = `Nat.card` of the fibre | Pass |
| R §0.15 grouping contract (`:299`–301) | fibre {1}×Fin 2; empty fibre m(2)=0 | E₁(z)·E₁(z) = E₁(z)²; the empty fibre gives factor 1 = E₁^0, covered by 1.2's zero-multiplicity API | Pass |
| S `exists_zero_free_holomorphic_approximation`, route 1 | K={1≤\|z\|≤2}, Ω=ℂ∖{0}, u=z−1/2; K=∅ | sup_K\|u−G_N\| = 0.1487, 0.01690, 4.57·10⁻⁵, 1.5·10⁻¹¹ for N = 1, 3, 10, 30. u(1/2)=0 while \|G₃(1/2)\| = 0.0799, and G_N=z·e^{L_N} has no zero on Ω. K=∅: g=1 | Pass |
| R route 1, mixed pairing | r=(z−1/2)/(z−5/2): b₁=1/2 bounded, paired with a=0; b₂=5/2 unbounded, paired with R=3 | H=z, ℓ = log(1−1/(2z)) − log((z−5/2)/(z−3)) − (log 3+iπ+log(1−z/3)); max over K samples of \|H e^ℓ − r\| = 1.1·10⁻¹⁵ | Pass |
| R W=ℂ∖P logarithm (Lemma 15.1 form) | γ=\|z\|=3/2; pair (1/2, 0); pair (1/2, 3) | (2πi)⁻¹∮(1/(z−b)−1/(z−a)) = 1.3·10⁻¹⁶ (zero), so a log exists; 1.0000000, so none. The second Check is right | Pass |
| R z−R = exp(log R+iπ+log(1−z/R)), R=3 | z = 1.5+0.7i, −2.9+0.1i, 2.99i, 0 | −1.5+0.7i, −5.9+0.1i, −3+2.99i and −3 on both sides | Pass |
| R 3.1 Check values | z=1 | G₁(1)=e^{−1/2}=0.606531, G₃(1)=e^{−2/3}=0.513417, u(1)=0.5 | Pass |
| R 2.1 exhaustion Check (repaired) | Ω=D; n=0, 1, 2 | right radius: {0}, {\|z\|≤1/2}, {\|z\|≤2/3}; wrong radius n+1: {0}, ∅, ∅ (thickening of radius ≥2 is ℂ); union {0} | Pass |
| R "bounded component meets ℂ∖Ω" | K=unit circle, Ω=ℂ; same K, Ω=ℂ∖{0} | B=D has closure the closed disk, compact and ⊆ ℂ, so `IsFilledIn` fails (no Runge pair); B∋0∉Ω, a_B=0 | Pass |
| S Looman–Menchoff 0.2 (r9) | f=z; z̄; exp(−z⁻⁴); Ω=∅ | f_I=i·f₁; −i≠i; \|f(re^{iπ/4})\| = exp(r⁻⁴)→∞, excluded by continuity; vacuous | Pass |
| R 0.2 Gray–Morris estimate (r9) | [0,3]×[0,1], N=1 | LHS 20.405 > 15 = 5N·m; side-ratio bound holds | Pass (source issue, r9) |
| R 0.1 Wirtinger (r9) | z; z̄; \|z\|² at i | (1,0); (0,1); (−i,i) | Pass |
| R 0.3 kernel (r9) | radial φ; disk radius r | ∫(πζ)⁻¹∂̄φ = −φ(0) = −1; ∫\|ζ\|⁻¹ = 2πr | Pass |
| R 1.1 (r9) | E₂′(−1); E₁′(1); 60×360 log grid | −0.606531; −2.718282; max(log\|E₁\|−\|w\|²) = −0.000139 | Pass |
| S `…_of_divisor` (r9) | D=0; 2[1]; [1]−[2] | F=1; divisor 2[1]; excluded by 0≤D | Pass |
| S sharp bound 1.4 (r9) | (1,1); (1,−1); ∅; 20 000 random families | 3≤3 (Mathlib bound 6.389); 1≤3; 0≤0; max(LHS−RHS) = 2.2·10⁻¹⁶ | Pass |
| R 1.3, 1.5 (r9) | aₙ=n; 2ⁿ; uₙ=[x=n]/(n+1) | genus 1; genus 0; tail 1/(N+1) with Σ sup = ∞ | Pass |
| S `IsRungeCompactPair` (r9) | (∅,∅); circle in ℂ; {2≤\|z\|≤3} in D₄; same K in {1<\|z\|<4} | true; false; false; true | Pass |
| S `holomorphicHull`, `holomorphicHull_eq_fill` (r9) | ∅; circle in ℂ; annulus in {1<\|z\|<4} | ∅; closed disk; K on both sides | Pass |
| R 2.1 distance and convex hull (r9) | K={2≤\|z\|≤3}, Ω=D₄ | both distances 1; K̂ = conv K = closed 3-disk | Pass |
| R 2.2 metric (r9) | constants differing by 1; zⁿ/n | 1/2; sup norms 1/n and 1 | Pass |
| R 2.3 O(K) (r9) | {0,1}; {0}; εz̄ | a+(b−a)z; O=ℂ with infinite-dimensional germs; ∂̄=ε≠0 | Pass |
| S Runge equivalence (r9) | annulus in D₄ with 1/z; closed disk in D₂; (∅,∅) | the integral over \|z\|=5/2 is 2πi vs 0, so both sides false; both true; both true | Pass |
| S finite-rank operator (r9) | K={0}, f=c; K=∅; B=0 | N=1, error 0; N=0; 0≤0 | Pass |
| S zero orders, divisor (r9) | m=0; 2[2]; 2[0]−[1] | 1; (z−2)²; z²/(z−1) | Pass |
| S boundary germ 3.2 (r9) | ℂ∖{0} at 0; ℂ∖ℝ at 0 | contradiction from zⁿF≡0; both half-discs have 0 in their closure | Pass |
| S Mittag–Leffler, singularities, quotient (r9) | 1/z²+z; exp(1/z); 1/z on a component; F≡0 | f=1/z², g=−z; f=P, g=0; f=1, g=z; f=0, g=1 | Pass |
| R 6.1 products and cotangent (r9) | 1/Γ(1/2); cos(π/4); z=i | 0.5641899 vs 0.5641896; 0.7071070 vs 0.7071068; −3.153348i vs −3.153347i | Pass |
| R 6.2 theta, lattice (r9) | r=1/2, z=0.3+0.1i; shell N=1 | ratio 1.474234−0.147917i = r⁻¹e^{−z}; Σ\|λ\|⁻³ = 4 ≤ 11.31 | Pass |
| R 6.3 crescent (r9) | z=−1/2; z=0 | \|z\|=1/2, \|2z−1\|=2; 0∉Ω | Pass |
| S `cauchyPompeiu` (r9) | f=\|z\|², ξ=0.3 | 1 − 0.909998 = 0.090002 vs 0.09 | Pass |
| R 6.4, 6.5 (r9) | z=1; π cot πz at 0 | 1.718282 = e−1; residue 1 | Pass |
| S ∂̄ solver 7.1 (r9) | f=z̄; z; ze^{−\|z\|²} | u=z̄²/2; \|z\|²; −e^{−\|z\|²} | Pass |
| S closed completion (r9) | f=z, g=z̄; f=z̄, g=0 | 2 = 2; 0 = 1−i(−i) | Pass |
| S two-form exactness, `H²` 7.2 (r9) | dz∧dz̄; dx∧dy; U=∅, ℂ | d(−z̄dz) = dz∧dz̄; dβ(1,i) = 1; zero form; [dx∧dy] = 0 | Pass |
| R 7.2, 7.3 conventions (r9) | dz∧dz̄ on (1,i); moments | −2i; π, 0, π/2 vs 3.141593, 0, 1.570791 | Pass |
| S Cousin I 7.4 (r9) | c₁₂=1; empty cover | b=(1,0); vacuous | Pass |
| R consumed factorization (r9) | z; (z−1)²; e^z | m=1, g=0; P=(1−z)²; g=z | Pass |

The table has 38 rows, nine of them computed this round. It covers:

- every changed statement (1.2, its §0.15 contract, 3.1's route and Checks, the 2.1 Check);
- the sampled targets the diff touches (0.1, 1.2, 3.1);
- all 22 headline theorems and both definitions.

## Not verifiable

- None this round. AnalyticNumberTheoryPartI is now read on main. The ComplexKahlerGeometry revisions #1807, #1808 and #1854 and ComplexComparisonPartII #848 were read through `roadmaps show` and `roadmaps grep` only.

## Source issues

- **Gap** in rainer at proof of Proposition 15.2, p. 37: the source invokes Lemma 15.1, stated for a domain whose complement joins a and b, on an unnamed neighbourhood of K; it should take ℂ∖P for a path P from b to a in V_j, and note the lemma needs only an open set; affects the proof.
- **Misprint** in rainer at proof of Proposition 15.2, p. 37: the source ends with an error bound 2ε while the proposition asserts ε; it should run the construction with ε/2; affects nothing.
