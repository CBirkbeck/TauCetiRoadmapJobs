# Review of HeightsRationalPointsAndObstructionsPartII (pull request #1821 at e2a66fd)

**Verdict:** needs changes

Incremental re-review of the 14 README lines changed since ac9e370. Both previous findings are repaired and the gate passes; one new P3 remains in the repaired §7.1 sentence, where the point-height normalization is described as relative to K although the cited supplier and this roadmap's own Conventions make it absolute.

## R01 (P3) — §7.1 describes the adelic point height as normalized "over K", contradicting ArakelovGeometryAndAbelianHeightsPartII §4.6 and the Conventions; its first Check then fails by [K:ℚ]

**Location.** `TauCetiRoadmap/HeightsRationalPointsAndObstructionsPartII/README.md` line 1261: "`h_{L̄}(x)` = ĥ_L(x), the Néron–Tate height in the normalization of adelic heights (over K, residue degrees over k)", followed by the subvariety formula "/(a_K (d+1) deg_L X), with a_K = [K:ℚ]"; and the Check at line 1269: "For X a point the subvariety height is the point height."

**Claim.** The adelic point height of the supplier equals the Néron–Tate height in a normalization "over K", while the subvariety height needs the extra division by a_K = [K:ℚ] to equal ĥ_L(X); and the two agree at a point.

**Witness.** ArakelovGeometryAndAbelianHeightsPartII at its open head, `README.md` line 800 (§4.6): h_L̄(x) = deĝ(L̄|_x̃)/[K(x):ℚ] for k = ℤ, with the remark that Yuan–Zhang divide by the degree over K instead, so h_YZ = [K:ℚ]·h_L̄; line 846 (§4.8) uses the same a_K for h_L̄(X). This README's Conventions, line 23: "Number-field heights are absolute". yuan-2026 line 2408: the number-field classical height divides by [K′:ℚ]. Instance K = ℚ(i), x ∈ A(K) of absolute Néron–Tate height a: the subvariety formula gives (L̄|_{x̃})¹/(a_K·1·deg x̃) = (2a)/(2·1) = a; the point height read "over K" (Yuan–Zhang) is 2a, read absolutely (the supplier's §4.6) it is a. The Check at line 1269 holds only for the absolute reading, which the parenthetical "over K" denies.

**Repair.** Replace "(over K, residue degrees over k)" by "(the absolute normalization of ArakelovGeometryAndAbelianHeightsPartII §4.6: divide by [K(x):ℚ] for a number field, by [K(x):K] with residue degrees over k for a function field)", and make the Check at line 1269 compute the witness: "For X = {x} over ℚ(i) with ĥ_L(x) = a, h_{L̄}(x) = a and h_{L̄}({x}) = 2a/(2·1) = a; the Yuan–Zhang relative point height 2a would break the agreement." Tested on K = ℚ(i): both sides a; the subvariety formula is unchanged and the function-field Check at line 1271 is unaffected (a_K = 1).

## Previous findings

- R01 — repaired: line 107 now reads "§6.4(1), the Silverman–Tate comparison, holds for every nef polarization, and §6.4(2), the specialization limit, keeps bigness"; the contract paragraph is deleted; §8.5 cites "§6.4(1), stated for every nef polarization"; the Needs line (1445), Layer 8 Dependencies (1468) and §8.6 carry no contract parenthetical; `design/plan.json` lists seven gaps, `moriwaki-silverman-tate-nef` gone, matching the seven "must provide" paragraphs at README lines 48–139. The repair introduced no new problem: the §8.5 Check now says every Moriwaki height vanishes for the zero polarization over ℚ(t), as the supplier's own §6.3 Check 4 and §6.4 Check 3 state.
- R02 — repaired: line 1261 reads "a_K = [K:ℚ] for a number field"; the bytes are E2 84 9A and the file has no double-encoded residue (0 occurrences of C3 A2). The normalization phrase of this report's R01 predates the repair and is not something the repair introduced.

## Verified sound

**Gate and dependency check.** The worker's gate at e2a66fd passes every check (set_option=0, sorry-data=0, imports=0, depcheck=0, outside-folder=0, build=0). No file outside the folder changed. The dependency check run by me:

```
depcheck: 241 roadmaps, 2362 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line; the roadmap sits at line 325 of the merge order, directly after ArakelovGeometryAndAbelianHeightsPartII (324).

**Elaboration.** `lake env lean` on `TauCetiRoadmap/HeightsRationalPointsAndObstructionsPartII/Suggested.lean` at the pin exits 0 with exactly three "declaration uses `sorry`" warnings (lines 61, 79, 100) and nothing else. The file is byte-identical to the one reviewed at ac9e370 (`git diff ac9e3709..HEAD` on it is empty), so the three headlines, the binder check, the one-tactic probe and the docstring's list of non-statable headlines stand as verified in the previous report.

**Supplier citations resolved this round (at the open head of ArakelovGeometryAndAbelianHeightsPartII, commit 12ef4f6e).** §6.1 (line 983: Moriwaki polarization with nef H̄ᵢ, big when every H̄ᵢ is also big; Check: trivial H̄₁ gives h^B_L ≡ 0 up to O(1)); §6.2 (line 1009: the height machine, Northcott (4) needing bigness); §6.3 (line 1022: ĥ^B, torsion converse needing bigness; Check 4: zero polarization over ℚ(t) gives every polarized height and canonical limit 0); §6.4 (line 1044–1058: (1) |ĥ^B − h^B| ≤ c·max{1, h^B_S̄(π(P))} for an abelian scheme over a regular quasi-projective k₀-variety, "for every such polarization B, big or not"; (2) Silverman's limit assuming B big; Check 3: the zero polarization satisfies (1) with both sides 0 and makes (2) vacuous). The README's line 107 and §8.5 route, Check and Needs now say exactly this. §4.6 (line 798–800) and §4.8 (line 844–846) were opened for R01 above: the point height divides by [K(x):ℚ], h_L̄(X) uses a_K = [K:ℚ] or 1. The worker's citation resolution reports no cross-roadmap citation and no Lean name found nowhere.

**Declared gaps.** Seven slugs in `design/plan.json` (flat-nonproper-intersection, arithmetic-interpolation, controlled-polarization-embeddings, abelian-valuation-map, abelian-canonical-measure, strict-support-dimension, nonarchimedean-small-point-equidistribution), each stated in the README under its supplier as "What <Supplier> must provide (the … contract)" at lines 48, 65, 103, 133, 135, 137, 139. Their minimality was checked in the previous report and nothing in the diff touches them.

**Adversarial pass.** Rows for statements the diff leaves untouched are carried from the previous report (its table, 37 rows, verdicts unchanged since the text is unchanged); the rows below are the changed statements, with values computed on each side.

| Statement | Instances tried | Values | Result |
|---|---|---|---|
| Line 107: §6.4(1) for every nef B, §6.4(2) keeps bigness | zero polarization over ℚ(t) (H̄₁ = O, trivial metric); a big polarization | (1): both sides 0, c·max{1,0} = c ≥ 0; h^B_S̄ bounded so the limit of (2) has empty domain; big B: unbounded base height, (2) meaningful | matches supplier §6.4 line 1046 and its Check 3 |
| §7.1 a_K = [K:ℚ] | K = ℚ, K = ℚ(i), X = {x} with absolute ĥ_L(x) = a; X = A | ℚ: a_K = 1, both formulas a; ℚ(i): subvariety formula 2a/(2·1) = a, point height a (absolute, supplier §4.6) or 2a (relative, Yuan–Zhang); X = A: L̄^{g+1} = 0 so both sides 0 | a_K correct; the "over K" phrase and Check 1 are R01 |
| §7.1 function-field case a_K = 1 | [1:1/(t²+1)] over ℝ(t) and over ℂ(t) with k = ℝ fixed | place t²+1 of degree 2: height 2; over ℂ(t) with residue degrees still over ℝ: two places of degree 2, height 4 = [ℂ(t):ℝ(t)]·2 | agrees with Check 3 and the Conventions |
| §8.5 route: Silverman–Tate for non-big B | zero polarization over ℚ(t); number field (d = 0) | zero polarization: comparison 0 ≤ c·1, no Northcott used; d = 0: Moriwaki = [k₀:ℚ]·Weil, statement is the number-field height inequality | route needs only §6.2(1)–(3), as the supplier's route states |
| §8.5 Check 2 "every Moriwaki height vanishes, so 0 ≤ c" | the zero polarization, 𝒜 → S any abelian scheme, P ∈ X*(k̄₀) | ĉ₁(O, trivial metric) = 0 kills every arithmetic intersection: h^B_{S̄,M} = 0, ĥ^B = lim 4⁻ⁿ·0 = 0; inequality 0 ≤ c(1 + 0) | true; nef (semipositive trivial metric, degree 0 on curves) and vol = 0 so not big |
| §8.5 Needs / Layer 8 Dependencies / §8.6 route after deleting the contract | §8.6 needs Silverman's limit (2) | §8.6 chooses a big Moriwaki polarization explicitly (line 1453) before using the limit | bigness still enters only where the supplier keeps it |

**Shape of the changed passages.** Line 107 remains a prose supplier paragraph; §8.5 keeps its statement, route, two Checks, a Needs line; §7.1 keeps its API prose and three Checks; no process words, pull-request numbers or LaTeX were introduced (the gate's latex/prnum/round-labels counters are 0).

## Not verifiable

- Unchanged from the previous report: remond-2000-vojta Théorème 1.2's explicit constants (display formulas lost in the Numdam extraction) and the uncertified remond-2000-decompte and david-philippon-2007, none of which the diff touches.

## Source issues

- none
