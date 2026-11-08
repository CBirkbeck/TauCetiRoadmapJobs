# FIX-RT-ArakelovGeometryAndAbelianHeightsPartII~2: red-team round 2 repaired

Reviews settled: `RT-ArakelovGeometryAndAbelianHeightsPartII~2a` (four findings) and `RT-ArakelovGeometryAndAbelianHeightsPartII~2b` (four findings). Files changed: `packages/ArakelovGeometryAndAbelianHeightsPartII/README.md`, `design/plan.json` (top-level `gaps` only), `sources.toml`. `Suggested.lean` is unchanged (it declares nothing; the docstring's list of unstatable headlines remains accurate, since §10.9a is a construction feeding the Layer 10 headline, not a new headline).

## RT-ArakelovGeometryAndAbelianHeightsPartII~2a/F01, RT-ArakelovGeometryAndAbelianHeightsPartII~2b/F01 (P1) — applied

Verified: SchemeAndStackFoundations §4.13 on main states only `bertini_smoothness` for smooth X; LefschetzPencilsAndVanishingCycles §5.1 (merge order 64, this roadmap 269) owns Bertini irreducibility for the generic linear section; no roadmap owns normality of general sections. §8.8's route now cites §5.1 (generic hyperplane), the constructibility of geometrically irreducible fibres (stacks-irreducible-fibres, Tag 0559) for a dense open with F-points, and gap:bertini-normal-sections (SchemeAndStackFoundations §4.13, Seidenberg Theorem 7) for normality; it names the Deligne-pairing recursion along the section as the restriction input. Added the quadric-cone and nodal-cubic-cone Checks, the supplier subsection for LefschetzPencilsAndVanishingCycles, the gap paragraph, the plan.json gap, and the Needs and Layer 8 Dependencies entries. Generality of §8.8 unchanged.

## RT-ArakelovGeometryAndAbelianHeightsPartII~2a/F02 (P2) — applied

Verified at yuan-zhang-2025 line 7304: Theorem 6.1.2 takes X and S flat essentially quasi-projective integral. §5.1 statement: "Let S be … integral over k, π : X → S …" → "Let S and X be flat essentially quasi-projective integral schemes over k, …", with the remark that P̂ic(X/k) of §§1.3 and 1.6 needs X integral, the definition of a polarized dynamical system on that data (so §§5.2–5.3 inherit it), the square-zero Check (ℙ¹ over ℚ[ε]/(ε²): f^*O(1) = 2·O(1), ε ≠ 0, ε² = 0, excluded; ℙ¹_ℚ gives log 2), the locator line 7304 and §1.6 in Needs. Pattern search: §3.4 and §12.1 already carry integrality; §§8.1, 8.3 have smooth X over integral S with geometrically connected fibres, hence integral.

## RT-ArakelovGeometryAndAbelianHeightsPartII~2a/F03 (P1) — applied

Verified: zhang-2010 line 233 weights the unit-length graph invariant by log N(v); yuan-2026 line 2884 defines the global φ as Σ φ_v(C)deg(v); the conventions normalize |ϖ_v|_v = e^(−deg v), under which §10.3(4) makes the local analytic invariant deg(v)·φ_v. §10.10's identity and API bullet now read Σ_v φ_v(C)deg(v) = φ(C) of §13.2, with φ_v the invariant for |ϖ_v| = e⁻¹ (graph invariant over a split extension divided by the ramification index), and state that the normalized analytic invariant is summed without a further weight. Added the degree-two place Check (contribution 1/6, double weighting 1/3) and the 𝔽₄ value (1/12) log 4.

## RT-ArakelovGeometryAndAbelianHeightsPartII~2a/F04 (P2) — applied differently

Verified: gross-schoen-1995 line 657 (Proposition 7.2) assumes the residue field finitely generated over the prime field, and zhang-2010 lines 120–131 define the height through such an extension. The repair uses Zhang's own construction instead of the proposed descent: zhang-2010 Lemma 2.3.3 (line 1047) builds the extension (δ̂³)_*Δ̄₁₂₃ on the Gross–Schoen good model and proves numerical triviality on the special fibre from the theorem of the cube and the curvature-zero property of the admissible correspondence; nothing in it depends on the residue field. New target §10.9a states this with hypotheses (split good semistable model over an arbitrary DVR), route, API and three Checks (signs 1 − 1 − 0 − 1 + 1 + 0 + 0 = 0 at good reduction; closure intersection [k(x) : k₀] ≠ 0 on a reducible fibre; correction (p̄ − ē + A)·A = 0 = (p̄ − ē + A)·B). Its cube input is gap:cube-for-products (JacobianChallenge Layer E, which states only the abelian-variety case), with Milne Theorem I.5.1 as the source and the derivation of the pairwise-pullback consequence in the contract. §10.10's route now cites §10.9a and Zhang Theorems 2.3.5 and 2.5.1, with the ℂ(t) Check. The descent route of the finding was not taken because it would import Tate's theorem over finitely generated fields in every characteristic and Deligne's weights, which Zhang's construction avoids; the final height theorem is not narrowed.

## RT-ArakelovGeometryAndAbelianHeightsPartII~2b/F02 (P2) — applied

Verified: yuan-2026 lines 1652–1661 give the graph expression only for discrete valuations, and §10.3(1) is stated for split semistable reduction over a discretely valued K. §10.3(3) now claims φ(C) ≥ 0 for trivially valued (φ = 0) and discretely valued non-archimedean K, with the route through a split finite extension and (4) (φ(C) = φ(Γ′)/e(K′/K) ≥ 0), the API bullet narrowed likewise, a Check recording the scope (1/12 before and after an unramified quadratic extension, 0 at good reduction and at the trivial valuation, nothing asserted at a dense-value-group point), and §11.3's route reading "at the discrete points of the test set".

## RT-ArakelovGeometryAndAbelianHeightsPartII~2b/F03 (P3) — applied

Verified against the cached texts: yuan-2026 line 1995 is Remark 3.11 and §4.1 begins at line 2010; line 1004 opens p. 30 and Definition 2.5 is at line 1031; cinkir-2015 line 30 concerns Faber's genus-two bound, item (iii) is at line 41, the tetrahedron attainment at line 50, type XIV at line 780. §12.1 → line 2010; §8.1 → line 1031; §13.4 → line 41; §13.8 → lines 780 and 50.

## RT-ArakelovGeometryAndAbelianHeightsPartII~2b/F04 (P3) — applied

Verified: §7.2a's route factors f through the skeleton retraction (TropicalAndBerkovichArithmetic §2.7, present at the open head) and uses the curvature identity of §6.7; §8.8's archimedean step is the current calculus of ComplexComparisonPartII §C5.4. §7.2a Needs → "§2.6; TropicalAndBerkovichArithmetic §§2.7, 3.3 and 6.7"; §8.8 Needs and the Layer 8 Dependencies block now list ComplexComparisonPartII §C5.4 (and HeightsRationalPointsAndObstructions §5.17a for the recursion named in the repaired route). Both suppliers are earlier in the merge order.

## Checks

**Elaboration.** `lake env lean packages/ArakelovGeometryAndAbelianHeightsPartII/Suggested.lean` from the content checkout: exit code 0, no diagnostics. The file declares no named declaration, so the `#check @name` comparison has no rows and nothing changed.

**Worker repair (module-system warning).** The worker's build warned that the file imports `Mathlib`, a package designed for the module system, without declaring itself a module. Repair: the line `module` now opens `packages/ArakelovGeometryAndAbelianHeightsPartII/Suggested.lean`, before the single `import Mathlib`, following the form of CoboundaryExpansion's Suggested.lean on main. Nothing else in the file changed; it still declares no named declaration. Re-elaboration with `lake env lean` after the change: exit code 0, no diagnostics.

**Dependency gate.**

```text
depcheck: 236 roadmaps, 2155 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The new citations (LefschetzPencilsAndVanishingCycles §5.1 at order 64, SchemeAndStackFoundations at 2, ComplexComparisonPartII at 45, TropicalAndBerkovichArithmetic at 205, JacobianChallenge and HeightsRationalPointsAndObstructions on main) are all suppliers.

**Citation resolution.** `roadmaps resolve` on the README lists one lead, StableReductionPartII §MC.4, which is the declared gap:curve-moduli-noether-positivity; no Lean name is unresolved.

**Manifest and plan.** `sources.toml` parses (23 entries, every entry with id, authors, title, year, locator_scheme, locator and cited_for); `design/plan.json` parses and its `gaps` list now carries four slugs: singular-pluripotential-products, curve-moduli-noether-positivity, bertini-normal-sections (SchemeAndStackFoundations, 4.13), cube-for-products (JacobianChallenge, Layer E), each with the same slug, supplier and section in the README's supplier contracts. No `needs-references.toml` remains: the one entry the service wrote (Seidenberg) was resolved by fetching the AMS open back-issue PDF, and the file was removed.

**Sources added** (all fetched through the service, status certified): `stacks-irreducible-fibres` (Tag 0559, Lemma 37.27.5, line 3776), `seidenberg-1950` (Theorem 7, line 483; §4, line 761), `milne-av` (Theorem I.5.1, line 947). Locators of `zhang-2010` and `gross-schoen-1995` extended to the passages now cited.

**Ownership.** `roadmaps grep` over main and the open heads for "theorem of the cube", "Seidenberg" and "Bertini": the cube theorem is stated for abelian varieties by JacobianChallenge Layer E (main) and AbelianSchemesAndArithmeticModuli §A1.5 (open head), never for products of complete varieties; Bertini irreducibility only in LefschetzPencilsAndVanishingCycles §5.1; no owner of hyperplane-section normality. The extension of §10.9a has no other owner by object (Zhang's construction appears nowhere else). Ownership against open pull requests without files in the brief was not checked beyond the grep service.

## Adversarial pass on the changed statements

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| §5.1 integrality of X | ℙ¹ over ℚ[ε]/(ε²), f: z ↦ z²; ℙ¹_ℚ | f^*O(1) = O(2) = 2·O(1) on both; ε ≠ 0, ε² = 0 so the thickening is not integral; on ℙ¹_ℚ, max(1,\|z²\|) = max(1,\|z\|)², h(2) = log 2 | hypothesis added |
| §8.8 Bertini input | quadric cone xy = z²; cone over a nodal cubic; ℙ²; conic in ℙ² | cone: S₂ (hypersurface), singular locus = vertex of codimension 2, so normal; tangent dimension 3 > 2; general plane section a smooth conic. Nodal cone: singular along a line (codimension 1), not normal; section a nodal cubic. §5.1: dim g(X) = 2 > 1 for ℙ², 1 ≯ 1 for the conic | route and Checks consistent |
| §8.8 degree on the section | Y a member of \|mLₙ₋₁\| | M·L₁···Lₙ₋₂ on Y = m·M·L₁···Lₙ₋₁ = m·0 = 0 | hypothesis descends |
| §10.3(3) scope | unit loop g = 2; unramified and ramified quadratic extensions; good reduction; trivial valuation | 1/12; 1/12 (extended value) and (1/6)/2 = 1/12 (renormalized then divided by e = 2); 0; 0 | nonnegativity holds where claimed |
| §10.10 place weights | degree-two place of ℚ(t), type-0 node of thickness one, g = 2 | φ_v = (2−1)/(6·2) = 1/12; contribution φ_v·deg(v) = 1/6; normalized local invariant = 2·(1/12) = 1/6; double weighting 1/3 | corrected formula |
| §10.10 node data | y² = (x² − t² − 1)(x−1)(x−2)(x+1/2) at t² + 1 | unit factor at x = 0: (−1)(−2)(1/2) = 1, so y² = x², split; x² − (t²+1) has uniformizer order 1, thickness 1; partial normalization y² = x(x−1)(x−2)(x+1/2) of genus 1, connected, type 0 | example valid |
| §10.10 hyperelliptic Check | g = 2, W = 2, φ = 5 | (5/2)·2 − 5 = 0 | unchanged, consistent with the global φ |
| §10.9a good reduction | W = {x} × 𝒳₀ × 𝒳₀, x ≠ e₀ | 1 − 1 − 0 − 1 + 1 + 0 + 0 = 0 | numerically trivial |
| §10.9a reducible fibre | A ∪ B, x ∈ A ∖ B, e₀ ∈ B ∖ A, V = {x} × A × A | only Δ̄₁₂₃ meets V, at (x,x,x), with ideals (u₁−u₂, u₁−u₃) + (ϖ, u₁−c) = maximal ideal: multiplicity 1, intersection [k(x):k₀] ≠ 0 | correction necessary |
| §10.9a fibre correction | p̄ ∈ A, ē ∈ B, one node | (p̄−ē)·A = 1, (p̄−ē)·B = −1, A² = −1, A·B = 1; (p̄−ē+A)·A = 0, (p̄−ē+A)·B = 0 | admissible correction verified |
| gap:cube-for-products consequence | L on U×V×W; genus-zero triple; E×E×E | twist by face and coordinate restrictions is trivial on U×V×{w₀}: L₁₂ ⊗ L₁₂⁻¹ ⊗ p₁^*L₁⁻¹ ⊗ p₂^*L₂⁻¹ ⊗ p₁^*L₁ ⊗ p₂^*L₂ = O; genus zero gives O(d₁,d₂,d₃); p₁₂^*O(Δ) restricted to {e}×E×E is O({e}×E) | derivation correct |
| Locators | yuan-2026 2010, 1031; cinkir-2015 41, 50, 780; seidenberg-1950 483, 761; milne-av 947; stacks-irreducible-fibres 3776 | each line carries the cited heading, theorem or statement | verified in the cached texts |

## For the maintainer

- Two new supplier gaps: `bertini-normal-sections` (SchemeAndStackFoundations §4.13: Seidenberg's hyperplane-section theorem for geometrically normal varieties) and `cube-for-products` (JacobianChallenge Layer E: the theorem of the cube for products of complete varieties). Both are declared in `design/plan.json` and under "Exact supplier contracts".
- New supplier citation: LefschetzPencilsAndVanishingCycles §5.1 (Bertini irreducibility), a roadmap still in a pull request but earlier in the merge order; cited by name and section.
- No Lean name exists or changed; no other roadmap cites a name of this one.
- The finding 2a/F04's own repair route (descent through Gross–Schoen Proposition 7.2) was not adopted; the reviewer should check §10.9a against zhang-2010 Lemma 2.3.3 rather than against the descent sketch.
- No fetched text contained instructions; nothing suspicious to report.
