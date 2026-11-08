# Review of HeightsRationalPointsAndObstructionsPartII (pull request #1821 at 73d7cae)

**Verdict:** accepted

Incremental re-review of the 4 README lines changed since e2a66fd (both in §7.1). The previous finding is repaired, the repair introduced no new problem, the gate passes, the dependency check is clean and `Suggested.lean` is unchanged and elaborates. No finding remains, new or carried.

## Previous findings

- R01 — repaired: line 1261 now reads "the Néron–Tate height in the absolute normalization of ArakelovGeometryAndAbelianHeightsPartII §4.6 (divide by [K(x):ℚ] for a number field, and by [K(x):K] with residue degrees over the fixed k for a function field; the Yuan–Zhang relative normalization … is [K:ℚ] times this one)", and the Check at line 1269 computes the ℚ(i) witness "2a/(2·1) = a; the Yuan–Zhang relative point height 2a would break the agreement". Both match the supplier and the Conventions (checked below); the subvariety formula, the proof route, the other two Checks and the Needs line are untouched.

## Verified sound

**The changed passage against its supplier.** ArakelovGeometryAndAbelianHeightsPartII at its open head (commit 12ef4f6e, unchanged since the previous review), `README.md` lines 798–800 (§4.6): h_L̄(x) = deĝ(L̄|_x̃)/[K(x):ℚ] for k = ℤ and deĝ(L̄|_x̃)/[K(x):K] for k a field, residue degrees over the fixed k; "Yuan–Zhang §5.3 divide by the degree over K instead, so h_YZ = [K:ℚ]·h_L̄; in the geometric case the two agree". Its API bullet "Over a number field K, the height of Yuan–Zhang §5.3 is [K:ℚ]·h_L̄" and its Check "Dividing by [K(x):K] instead of [K(x):ℚ] over a number field gives a height that is not invariant under extension of K" say the same. Lines 844–846 (§4.8): a_K = [K:ℚ] or 1, h_L̄(X) = L̄ⁿ⁺¹/(a_K·(n+1)·deg L̃) "with the absolute arithmetic normalization of §4.6", with the Check "X = Spec K, [K:ℚ] = 2 and O(1), raw intersection 2 divided by 2·1·1 gives h(X) = 1 = e₁; omitting the factor gives 2 ≤ 1, false". The README's new clause and Check restate exactly these four facts; the sentence's citation of §4.6 resolves, and §§4.6–4.8 are already on the §7.1 Needs line (line 1273).

**The changed passage against this README's Conventions.** Line 23: "Number-field heights are absolute: [2:1] has height log 2 over both ℚ and ℚ(i), although its relative ℚ(i)-height is 2 log 2 … Over function fields, keep k fixed, weight v by [k(v):k], and divide heights over K′ by [K′:K]." The new clause is the same normalization applied to Néron–Tate heights; the function-field Check at line 1271 ([1:1/(t²+1)]: 2 over ℝ(t), 4 with reference field ℂ(t)) and the Conventions' example agree.

**The changed passage against the sources it cites.** yuan-2026 lines 2164–2170 (§4.1.2, p. 64): for k = ℤ, h_L(x) = deĝ(L|_x̃)/deg(x̃/ℚ), "the degree of x̃ over ℚ (instead of K), which is different from [YZ2, §5.3]"; for k a field, divide by deg(x̃/K), which agrees with Yuan–Zhang; line 2161 and lines 2189–2190: degrees in the geometric case are taken over k. Lines 2407–2424 (§4.3.1, pp. 71–72): the classical height divides by [K′:ℚ] over a number field and by [K′:K] over a function field with ‖·‖_v = e^(−[k(v):k] ord_v), the factor staying [k(v):k] even when K′ has a larger constant field. xy-2022 line 46 (§1.1, (1.1), p. 2): the geometric subvariety height L^{dim X+1}·(π*M)^{dim S−1}·X/((1+dim X) deg_L X), i.e. a_K = 1; lines 53 and 65 ((1.2), (1.3)): the canonical limit n^{−2}h([n]X) and its independence of the model. All as the README states; the locators are unchanged by the diff and remain correct.

**Gate and dependency check.** The gate run by me at 73d7cae: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 … readme-ids-missing=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate adds `build=0`. The dependency check run by me:

```
depcheck: 241 roadmaps, 2362 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line; the roadmap is line 325 of the merge order, directly after ArakelovGeometryAndAbelianHeightsPartII (324). `git diff --stat origin/main...HEAD` outside the folder is empty.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/HeightsRationalPointsAndObstructionsPartII/Suggested.lean` at the pin exits 0 with exactly three "declaration uses `sorry`" warnings (lines 61, 79, 100) and nothing else. `git diff e2a66fd..HEAD` on the file is empty, and it was already byte-identical to ac9e370, so the three headlines, the binder check, the one-tactic probe and the docstring's list of non-statable headlines stand as verified in the first report.

**Sampled targets.** None of the fifteen seeded targets (0.2, 1.4, 4.5, 4.7, 5.7, 6.3, 6.8, 6.12, 8.3, 9.3, 9.5, 10.8, 11.3, 11.4, 11.6) lies in the changed passage, and nothing in §7.1's change touches their statements; they stand as verified in the first report's sample table (4.5, 11.3, 11.6 there with line locators) and in its adversarial rows.

**Declared gaps.** Unchanged by the diff: seven slugs in `design/plan.json`, each stated under its supplier in the README (lines 48–139), checked in the previous two reports.

**Ownership.** The change is a normalization convention and a Check, not a construction; nothing new to own. Ownership of the roadmap's objects against the open pull requests listed in the brief was checked in the first report and is not affected.

**Adversarial pass.** The 37 rows of the first report and the 6 rows of the second report are carried unchanged, since the statements they test are untouched. Rows for the changed statement:

| Statement | Instances tried | Values | Result |
|---|---|---|---|
| §7.1 line 1261: `h_{L̄}(x)` = ĥ_L(x) in the absolute normalization; h_YZ = [K:ℚ]·h_L̄ | K = ℚ(i), x ∈ A(K), absolute ĥ_L(x) = a; x of degree 2 over ℚ(i); K = ℚ; function field K = ℝ(t), x ∈ A(ℂ(t)) | deĝ(L̄|_x̃) = [K(x):ℚ]·a = 2a, absolute 2a/2 = a, Yuan–Zhang 2a/[K(x):K] = 2a = 2·a; degree 2: deĝ = 4a, absolute 4a/4 = a, Yuan–Zhang 4a/2 = 2a = 2·a; K = ℚ: both a; function field: both divide by [K(x):K] = 2 with residue degrees over ℝ, equal | h_YZ = [K:ℚ]·h_L̄ holds for every x, "agree in the geometric case" holds; matches supplier §4.6 lines 798–800 |
| §7.1 Check 1 (line 1269): `h_{L̄}({x})` = 2a/(2·1) = a over ℚ(i) | x ∈ A(ℚ(i)) (deg x̃ = 1); x of degree e over ℚ(i); K = ℚ; X = A | (L̄|_{x̃})¹ = 2a, a_K = 2, d+1 = 1, deg x̃ = 1: 2a/(2·1·1) = a = h_L̄(x); relative point height 2a ≠ a; degree e: 2ea/(2·1·e) = a, still equal; K = ℚ: a/(1·1·1) = a under both normalizations; X = A: L̄^{g+1} = 0, both sides 0 | Check true and discriminating (it fails for the relative normalization); same computation as supplier §4.8 Check 3 (2/(2·1·1) = 1) |
| §7.1 Check 3 (unchanged, same object) | [1:1/(t²+1)] over ℝ(t) and ℂ(t), k = ℝ fixed | place t²+1 of degree 2: height 2; over ℂ(t) two places of residue degree 2 over ℝ: 4 = [ℂ(t):ℝ(t)]·2 | agrees with the new clause's "[K(x):K] with residue degrees over the fixed k" and the Conventions line 23 |

**Shape of the changed passage.** §7.1 remains a prose statement with its route, three Checks (the first now computes a value and names the wrong normalization it excludes) and a Needs line; the Check names no Lean counterpart; no process words, pull-request numbers or LaTeX (the gate's latex, tex, prnum and round-labels counters are 0).

## Not verifiable

- Unchanged from the previous reports: remond-2000-vojta Théorème 1.2's explicit constants (display formulas lost in the Numdam extraction) and the uncertified remond-2000-decompte and david-philippon-2007, none of which the diff touches.

## Source issues

- none
