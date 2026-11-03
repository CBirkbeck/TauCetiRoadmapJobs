# Review of DeligneWeightsAndPurityPartII (pull request #1760 at 5cc7ce5)

**Verdict:** needs changes

Incremental re-review of the 61 lines changed since 954152b: the restored ClassicalAdicEtaleCohomology contracts and their applications in §§3.4 and 4.2, the new AnalyticToricGeometryPartII contract and its use in §4.7, the scope and dependency sentences that mention them, and the docstring of `Suggested.lean`. Everything the diff leaves untouched carries the verdict of the previous report.

## R01 (P2) — Register `gap:projective-space-fan-realization` in the plan's gap list

**Location:** `TauCetiRoadmap/DeligneWeightsAndPurityPartII/README.md:97`, “What AnalyticToricGeometryPartII must provide (gap:projective-space-fan-realization), extending §§0.5, 1.1–1.2”; consumed at :947 and :960.

**Claim and defect:** The README now states the arbitrary-field projective-space realization as a supplier contract, which is the right shape. But a contract counts as declared only when `packages/DeligneWeightsAndPurityPartII/design/plan.json` carries the same slug in its top-level `gaps`, since that list is what the intake announces on the supplier's job. The plan still lists exactly the four ClassicalAdicEtaleCohomology slugs. AnalyticToricGeometryPartII is therefore never told that §4.7 needs the identification of the standard simplex fan schemes with `ℙⁿ_k` and their products, O(1,…,1) and its very ampleness, and §4.7 rests on an unregistered prerequisite. No open supplier states it: AnalyticToricGeometryPartII §1.2 is the complete-fan analytification comparison, ShimuraCompactifications §0.16 builds the fan scheme over every ring with `ℙ¹` only as a Check, and the pinned Tau Ceti fan scheme is complex.

**Witness:** `packages/DeligneWeightsAndPurityPartII/design/plan.json`, `gaps`: four entries (slugs `huber-compact-support-nearby-cycles`, `analytic-comparison-automorphisms`, `adapted-plurinodal-alteration`, `huber-smooth-relative-duality`); README gap slugs: five. The board commit that answered the previous review changed only the two report files.

**Exact repair:** Add to the plan's top-level `gaps` the entry with `slug` `projective-space-fan-realization`, `supplier` `AnalyticToricGeometryPartII`, `section` `0.5, 1.1–1.2`, and a one-sentence `needs`: for every field k and n ≥ 0 the standard simplex fan scheme over k is `ℙⁿ_k` by the standard charts, finite products of these fans realize products of projective spaces (empty product `Spec k`), compatibly with field extension, and the invariant divisor bundles give O(1) and the very ample O(1,…,1). Nothing else in `plan.json` changes. The README contract already matches this sentence.

**Repair check:** Slug agreement goes from 4 of 5 to 5 of 5. On the instance that refuted the original: for k = ℚ₂ and n = 1, charts k[T] and k[T⁻¹] glue over k[T,T⁻¹] to `ℙ¹_k`, O(1) has degree 1, O(1,1) on `ℙ¹×ℙ¹` has degree 1 on each ruling and gives the Segre quadric z₀₀z₁₁ = z₀₁z₁₀ in `ℙ³`; the contract delivers projectivity for exactly these fans, and the Fujino–Sato complete regular nonprojective fan is not a simplex product.

## R02 (P3) — Name the carrier of the fan scheme in the new contract

**Location:** `TauCetiRoadmap/DeligneWeightsAndPurityPartII/README.md:97`, “Use the integral fan model of §0.5 and its field fibres in §1.1”.

**Claim and defect:** AnalyticToricGeometryPartII §0.5 constructs the integral line bundles O(D) and §1.1 the unit toric adic space; the k-scheme `X_{Σ,k}` that the contract asks to identify with `ℙⁿ_k` is ShimuraCompactifications §0.16 (`TauCeti.Toric.finiteFanScheme`, the fan scheme over every commutative ring), which AnalyticToricGeometryPartII consumes under its own ShimuraCompactifications contract. A supplier reading the contract cannot tell which scheme is meant.

**Witness:** AnalyticToricGeometryPartII “From TauCetiRoadmap.ShimuraCompactifications”: C0.16 supplies the finite-fan scheme over every commutative ring; ShimuraCompactifications §0.16 lists the ℙ¹ fan only in the §0.17 Check.

**Exact repair:** Replace the clause by “the fan scheme `X_{Σ,k}` of ShimuraCompactifications §0.16, as used in §1.1, with the line bundles of §0.5”. No mathematics changes.

## Previous findings

- R01 — partly repaired: “Use gap:projective-space-fan-realization from AnalyticToricGeometryPartII §§0.5, 1.1–1.2 to identify the standard fan schemes over k with projective space and its finite products.” The README contract, its four Checks and the §4.7 consumption are in place; the plan's `gaps` list still lacks the slug (R01 above).
- R02 — repaired: “What ClassicalAdicEtaleCohomology must provide (gap:huber-compact-support-nearby-cycles), extending §§4.5, 5.2, 8.3–8.4 …” and the three sibling contracts at :87, :89, :91 carry the plan's four slugs, suppliers and sections; §§3.4 and 4.2 now apply them (:635, :649, :683, :715, :732, :742, :792, :844, :876) instead of constructing them, and the scope paragraph at :17 names the owner.

## Verified sound

**Changed passages.** The scope paragraph (:17), the ClassicalAdicEtaleCohomology contract block (:83–:91), the toric contract block (:95–:97), the §3.4 application paragraphs (:635, :649, :659, :683, :715, :732, :742), the Layer 3 dependencies (:792), the §4.2 application (:844, :876), §4.7 (:947–:960), the Layer 4 dependencies (:968), the HUB96 reference (:985) and the `Suggested.lean` docstring were read in full with everything that cites them.

**Contracts against the suppliers at their heads.** ClassicalAdicEtaleCohomology was read through the roadmap service at its indexed head: §§1.4, 3.2, 4.5, 5.2, 5.4, 8.2–8.5, 9.6, 9.7, 10.5 and 11.1 all exist. The text contains no adapted nodal-curve notion, no continuous-automorphism naturality of the algebraic–adic comparison, and no compact-support stalk comparison with sliced nearby cycles; §9.6 states curve duality and effacement over the point base `Spa(C,C⁺)` and cites Huber Corollary 7.5.5 there, and §9.7 states proper pairings, so the relative smooth duality over an annulus base with locally constant `R^i g_! ℤ/n` is a genuine extension. The four restored contracts are precise (one statement each, hypotheses carried), minimal (none is supplied by Mathlib, Tau Ceti, a roadmap on main or the supplier head), and declared with the plan's slugs, suppliers and sections. The new toric contract is precise and minimal: AnalyticToricGeometryPartII §0.5 (integral line bundles), §1.1 (unit toric adic spaces, consuming ShimuraCompactifications C0.9, C0.16) and §1.2 (complete-fan analytification comparison, explicitly without projectivity) do not identify `X_{Σ_n,k}` with `ℙⁿ_k`; ShimuraCompactifications §0.16 builds `finiteFanScheme` over any ring with `ℙ¹` as a §0.17 Check only; AnalyticToricGeometry (Completed) Layer 0 item 9 and its “Acceptance checks” identify the standard complete fan with complex projective space only. Its registration is R01.

**Pinned libraries.** Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`, Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a` (the worktree manifest). `Fan.algebraicRealization` at `TauCeti/Geometry/Toric/Algebraic/Fan/Scheme.lean:138` is the colimit of the affine toric diagram whose coordinate rings are `MonoidAlgebra ℂ …` (`AffineScheme.lean:61`); no `finiteFanScheme`, projective-space or Segre declaration exists under `TauCeti/Geometry/Toric` at the pin. The file declares nothing, so the `#check @name` comparison, the section-variable audit and the one-tactic padding probe have empty inventories; the docstring names every unstatable headline and the missing carriers, now including the three ClassicalAdicEtaleCohomology extensions and the toric realization as supplied objects.

**Sources at the cited lines.** SCH12 line 2381 (Definition/Proposition 8.4, invariant divisors and sections, printed p. 304) and line 2395 (the adic space of a fan and the proper case) support the toric contract's locator; line 2604 (Theorem 9.7, Huber 3.8.1) and line 2612 (the topos diagram with the Galois action) support the automorphism-naturality contract. ITO20 line 381 (adapted nodal curve) and line 412 (Theorem 3.3, de Jong 5.9 with adapted opens) support the adapted-alteration contract; line 1198 (Theorem 5.3, Huber 5.7.8, Galois-compatible stalk isomorphism) and line 1299 (Proposition 5.5, specialization compatibility) the compact-support contract; line 2009 and line 2038 (Corollary 7.5.5 for g and for its pseudo-adic base change g′, twist on the ordinary side) the duality contract. The seeded sample falls in the diff only at §4.2, whose changed paragraph cites exactly these SCH12 lines; the other fourteen sampled targets are untouched and keep the r1 verification.

**Dependency check**, rerun for this head:

```text
depcheck: 204 roadmaps, 1642 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. AnalyticToricGeometryPartII (ORDER line 146), ShimuraCompactifications and ClassicalAdicEtaleCohomology all precede this roadmap. Both new citations are of earlier roadmaps; nothing moved down.

**Gate and elaboration.** The worker's gate at 5cc7ce5 is all zeros and OK. `lake env lean` on `TauCetiRoadmap/DeligneWeightsAndPurityPartII/Suggested.lean` from the worktree exited 0 with no output. The diff outside the folder is empty. The file keeps one `import Mathlib`, one docstring, the namespace, no declarations, no `set_option`.

**Adversarial table.** Rows for the changed statements carry computed values; rows for untouched statements carry the r1 report's row by name with its values unchanged.

| Statement | Instances and computed values on both sides | Result/change |
|---|---|---|
| Toric contract, n = 1 charts | Σ₁ rays ±1, cones σ₀ = ℝ≥0, σ₁ = ℝ≤0: σ₀^∨∩M = ℕ·1 gives k[T], σ₁^∨∩M = ℕ·(−1) gives k[T⁻¹], overlap k[T,T⁻¹]; gluing by S = T⁻¹ is ℙ¹_k; gluing by S = T gives the line with doubled origin (non-separated) | Chart description and wrong-gluing control correct |
| Toric contract, chart indexed by i | Σ_n with rays e₁,…,e_n, e₀ = −Σe_j; cone omitting e_i has dual semigroup generated by the n characters x_j/x_i, j ≠ i: for n = 2, i = 0 the chart is k[x₁/x₀, x₂/x₀] | Matches the standard chart of ℙⁿ |
| Toric contract, O(1) | D = D_ρ for one ray on Σ₁: section weights W(D) = {0,1}, two sections 1, T, degree 1; n = 0: no rays, D = 0, O with one section | Hyperplane bundle and rank-zero case correct |
| Toric contract, Segre | O(1,1) on ℙ¹×ℙ¹: sections x_iy_j, i,j ∈ {0,1}, four of them; image in ℙ³ cut out by z₀₀z₁₁ − z₀₁z₁₀ (rank-one 2×2 matrices); restriction to {pt}×ℙ¹ has degree 1; O(1,0) restricted there has degree 0 | Very ampleness and the negative control hold |
| Toric contract, empty product | Product over the empty family: lattice 0, fan {0}, coordinate ring k[0] = k, realization Spec k = ℙ⁰_k; empty fan has no cones and empty realization | Rank-zero versus empty fan distinguished |
| Toric contract, nonprojective control | Fujino–Sato complete regular fan (AnalyticToricGeometryPartII §1.2 Check): complete and regular, not a product of simplex fans; §4.6 asks projectivity, so it is excluded | Projectivity is a hypothesis of §4.6, not inferred |
| Toric contract, registration | README slugs 5, plan slugs 4 | Finding R01 |
| gap:huber-compact-support contract | Identity f on Spec R, F = Λ: stalk Λ in degree 0; H⁰_c of the closed point with nearby cycles Λ is Λ; specialization map identity | Statement consistent; owner now the supplier |
| gap:analytic-comparison-automorphisms contract | V = ℙ¹, q = 2, n = 9: the top generator transforms by 2 on both sides; the inverse-only convention would give 5 mod 9 | Contract as stated in r1 row “4.2 continuous-automorphism naturality” |
| gap:adapted-plurinodal-alteration contract | Smooth affine-line family with marking x = 0: D étale of degree 1, f⁻¹(S°)∖D = X°; x² = s marking fails étaleness at s = 0 (derivative 2x = 0) | Definition discriminates; r1 row “3.4 adapted nodal-curve definition” |
| gap:huber-smooth-relative-duality contract | g = ℙ¹×B(a,b) → B(a,b), N = 1: R⁰g_*Λ(1) = Λ(1) dual to R²g_!Λ = Λ(−1); R²g_*Λ(1) = Λ dual to R⁰g_!Λ = Λ | Twist on the ordinary side; r1 row “3.4 nonproper smooth duality” |
| §3.4 applications of the three contracts | Each application names the supplier section and slug and keeps the ITO20 locator; the uniform annular theorem supplies the locally constant `R^i g_! ℤ/n` the duality contract demands (ranks 1, 3, 2 in the r1 row “3.4 uniform annular direct images”) | Inputs of each contract are produced before use |
| §4.2 application of the automorphism contract | f*_m on ℙ¹: composite of comparisons sends 1 ↦ 1 in degree 0; equivariance 2q = q·2 on the degree-2 elliptic approximation | r1 rows “4.2 actual comparison”, “4.2 equivariance” |
| §4.7 Fermat / cubic threefold Checks | p ∤ e: partials e x_j^(e−1) have no common projective zero; cubic threefold: no reduction hypothesis | r1 row “4.7 Fermat and arbitrary reduction” |
| Conventions, 0.1–0.10, 1.1–1.2, 2.1–2.5 | Untouched by the diff | r1 rows “Conventions: Frobenius sign” through “2.5 transfer”, values unchanged |
| 3.1–3.3, 3.5–3.6 and the untouched 3.4 targets | Untouched by the diff | r1 rows “3.1 tube definition/generator API” through “3.6 all-power comparison”, values unchanged |
| 4.1, 4.3–4.6 | Untouched by the diff | r1 rows “4.1 approximation definition/existence” through “4.6 set-theoretic scope”, values unchanged |

**Ownership.** Checked by object (fan scheme over a field, projective-space identification, Segre embedding, adapted nodal curves, compact-support nearby cycles, relative smooth duality, automorphism naturality) against Mathlib and Tau Ceti at the pins, the roadmaps on main, the board packages, the sibling checkouts named in the brief, and ClassicalAdicEtaleCohomology and ShimuraCompactifications through the roadmap service. No second owner was found; `Suggested.lean` declares no name.

## Not verifiable

- **LUT93**, **HUB96** (Theorem 5.7.8, Corollary 7.5.5) and **HUB98**: settled as uncertified; the contracts cite them through ITO20 lines 1198, 2009 and 2038 and SCH12 line 2604, which were read. No new request is opened.
- The repair report that answered the previous review was not among the files given to this review; the previous findings were verified against the head's text instead.

## Source issues

- none (the ITO20 discriminant-bound error recorded in the previous report stands; no new source passage was found faulty)
