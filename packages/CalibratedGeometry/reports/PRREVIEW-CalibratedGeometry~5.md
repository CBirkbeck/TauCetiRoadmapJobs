# Review of CalibratedGeometry (pull request #946 at 37684bb)
**Verdict:** needs changes

:robot: Independent AI review, an incremental re-review of the 6 lines changed since `ca66a5b` (the module-system header of `Suggested.lean`) together with the gate, the elaboration, the dependency check and the overlap facts. The header repair is correct and the gate now passes with the build. One finding remains, carried from the previous report: the DifferentialGeometry Layer 6, 8.3, 8.4 and 9.3 supplier citations are dropped at the head of the open DifferentialGeometry revision, and the pull request's merge-order paragraph still states no order against it. The worktree was not changed.

## R01 (P2) — DifferentialGeometry Layers 6, 8 and 9 are dropped at the open DifferentialGeometry head, with no stated order (carried: R02 of the previous report)

**Location.** `TauCetiRoadmap/CalibratedGeometry/README.md:521` (the `*Needs:*` line of 2.4), "DifferentialGeometry 5.1, 5.2, 8.3, 8.4, 9.3"; likewise `:43, :62, :100, :471, :489, :518, :543, :559, :563, :809, :1077` ("8.3", "8.4", "9.3", "Layers 6 and 8", "Layers 0–1, 5 and 8.3").

**Claim.** These are supplier citations of DifferentialGeometry as it is on main, where they resolve (`TauCetiRoadmap/DifferentialGeometry/README.md:782` "Layer 6: the de Rham complex and cohomology", `:816` "Layer 8: the de Rham theorem", `:836` "8.3 Smooth chains", `:862` "Layer 9: Poincaré duality"). The open revision of DifferentialGeometry (pull request #886, head `a565de62`, re-read this round) no longer defines them: its layer headings run Layer 0 (`README.md:288`), 1, 2, 3, 4, 5 (`:720`), 5.6 (`:940`) and then Layer 12 (`:1204`); the strings "8.3", "8.4" and "9.3" do not occur in it; its sibling paragraph (`:1378–1384`) hands de Rham cohomology, smooth singular chains, the de Rham theorem and Poincaré duality to DeRhamCohomologyAndDuality. That roadmap is `ORDER.txt:381`, later than CalibratedGeometry (`ORDER.txt:217`), so it cannot be cited here, and at its own head (#1768, `README.md:60–61, :78, :192–193, :367–368`) it still consumes 8.3, 8.4 and 9.3 from DifferentialGeometry. When #886 merges first, every citation listed above breaks. The overlap rule makes a dropped supplier id with no citation of its new location a P2; the pull request's merge-order paragraph (read at this head) says "No open pull request of ours must merge before this one" and names no order against #886.

**Witness.** `scratch` overlap facts of this round: "DifferentialGeometry Layer 6 (line 809): #886 changes DifferentialGeometry and no longer defines it at its head (main and its merge base do)"; the heading list of #886 at `a565de62` above (no Layer 6–11). This head's diff (`Suggested.lean:1–3, :32` only) touches none of the lines cited.

**Repair.** The README is correct against main and must not cite DeRhamCohomologyAndDuality (upward). State the order where the overlap rule asks for it: one sentence in the pull request's merge-order paragraph saying that #946 merges before #886, and that #886 repoints the DifferentialGeometry Layer 6, 8.3, 8.4 and 9.3 citations of CalibratedGeometry (the lines above) to their new owner at its merge, exactly as it must for the consumers already on main that cite the same ids (AlgebraicTopology 6.3, GeometricCurrents, HeegaardFloer). No edit of the folder is needed for that form. The alternative, #886 merging first, would require DeRhamCohomologyAndDuality to be placed below CalibratedGeometry in the merge order before these lines are repointed, and that placement is not this pull request's to make.

## Previous findings

- R01 — repaired: `Suggested.lean:1–3` now read `module`, blank, `public import Mathlib`, and `:32` is `@[expose] public section` before `noncomputable section` (`:34`); the worker's gate and my rerun with the build both report `build=0 OK`; `lake env lean` exits 0 with exactly the eight `sorry` warnings (lines 56, 63, 87, 93, 142, 150, 179, 188), the lines the previous report's scratch test predicted. Thirteen `Suggested.lean` files on main open with the same `module` line, so the form is the house one. No new problem introduced: the docstring, namespace, the sixteen declarations and the `end` line (`:196`) are byte-for-byte what the previous report read.
- R02 — not repaired: `README.md:521` still reads "DifferentialGeometry 5.1, 5.2, 8.3, 8.4, 9.3", the other eleven citations are unchanged, #886's head is still `a565de62` without Layers 6–11, and the pull request's merge-order paragraph still names no order against #886. Written again as R01 of this report.

## Verified sound

**The changed passages.** The diff is four added lines and one replaced line of `Suggested.lean` (the header, `:1–3` and `:32`) and nothing in the README; no sampled target of the seeded list (1.2–1.5, 2.2, 3.3, 4.2–4.3, 5.1, 5.3–5.4, 6.2–6.5) falls in it, and no Lean statement is touched. The header is checked by form (the main-branch files) and by effect (gate and elaboration, below). Files changed outside the folder: none (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/CalibratedGeometry'` is empty). The folder holds `README.md`, `Suggested.lean`, `metadata.toml`: no stray file.

**Gate.** The worker's gate at this head: every scanner 0, `build=0`, OK. Rerun independently with `--build --order`: identical line, `build=0 OK`, exit 0. The dependency check with `--movable`:

```text
depcheck: 239 roadmaps, 2360 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. CalibratedGeometry is `ORDER.txt:217`; its open supplier TangentialBordism (#942) is `ORDER.txt:10` and is named under "Depends on" in the pull request.

**Elaboration.** `lake env lean TauCetiRoadmap/CalibratedGeometry/Suggested.lean` at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, `lake-manifest.json` of this head): exit 0 in 8 s, eight `sorry` warnings (lines 56, 63, 87, 93, 142, 150, 179, 188), nothing else. The worker's elaborated signatures (16 declarations, 0 dropped binders) were produced at this head and re-read: `[FiniteDimensional ℝ E]` on `norm_eq_sSup_abs_orthonormal` and `abs_eval_le_norm_mul_frameVolume`, `1 ≤ n` on `norm_standardKahlerForm`, `norm_standardSpecialLagrangianForm` and `specialLagrangianFrame_iff`, `r ≤ n` on `norm_kahlerPowerForm`, `Orthonormal ℝ v` as a hypothesis of `specialLagrangianFrame_iff`, as the README states them. No `set_option`, `lemma`, `#eval` or `#print` in the file; the imports are the single `public import Mathlib`.

**Padding and headline coverage.** The declarations are unchanged from the file the previous two reports probed (one-tactic probe: none closes; the two Layer 1, two Layer 4 and two Layer 5 headlines are stated, and the fundamental theorem of calibrations, Kähler and special Lagrangian minimality, McLean's theorem and the second-variation identification are named in the docstring, `Suggested.lean:13–30`, with the carriers the pins lack). Carried, not redone: the pins and the carriers are those of the previous report.

**Overlaps and citations.** No other open pull request changes this roadmap. The one dropped-id lead (DifferentialGeometry Layer 6 at #886) is R01, widened to Layers 8 and 9 by reading #886's headings. The worker's citation check finds no cross-roadmap citation and no Lean name unresolved. The closest roadmaps in vocabulary (RiemannianGeometry #1327/#1683/#1187, ComplexKahlerGeometry #1398/#1234) are suppliers here (R1, R5a; K1–K6.1) and own no comass, calibration, Kähler-power, special Lagrangian or McLean object (previous report's ownership search, unchanged content).

**Adversarial table.** No statement changed this round, so no new row is computed; every row below is the previous report's (`PRREVIEW-CalibratedGeometry~4`, itself carrying `~3` where marked), for statements this diff leaves untouched.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 2.4 orientation signs and the shared facet (square Check) | `a=(0,0)<b=(1,0)<c=(0,1)<d=(1,1)`, triangles `[a,b,d]`, `[a,c,d]` | `det((1,0),(1,1)) = 1`, ε = +1; `det((0,1),(1,1)) = −1`, ε = −1; `[a,d]` is face 1 of both: coefficients `−1` and `+1`; `∂c = [a,b]+[b,d]−[c,d]−[a,c]` | pass (~4) |
| 2.4 necessity of the global order | same square, diagonal `[a,d]` in one triangle and `[d,a]` in the other | `−[a,d] + [d,a]` nonzero (two distinct generators) | pass (~4) |
| 2.4 interval through B1.5's double route | `N = [0,1]`, double `S¹` | `K = {[0,1]}`, `L = {0,1}`; `∂c = [1] − [0]` | pass (~4) |
| 2.4 closed case through GeometricTopology item 1 | `N = S¹`, vertices `0 < 1 < 2` | `c = [0,1] + [1,2] − [0,2]`; `∂c = 0 = c_∂N` | pass (~4) |
| 2.4 collar product subdivision | prism `[v_i,v_(i+1)] × [0,1]` cut in two with `(v,0) < (v,1)` | determinants `1`, `−1`; shared facet face 1 of both, coefficients `−1`, `+1` | pass (~4) |
| 2.4 degenerate sources | `N = ∅`; a point; `k = 0` | `c = 0`; `c = [v]`, `∂c = 0 = c_∅` | pass (~4) |
| Kähler sign, Ω normalization, Joyce phase | as in ~3 | `ω(1,i) = 1`; `(i/2)(−2i) = 1`; `(−1)(i/2)²·4 = 1`; `cos θ Re Ω + sin θ Im Ω = Re(e^(−iθ)Ω)` | pass (~3) |
| `norm_eq_sSup_abs_orthonormal`; 1.1 Checks | `3dx`, constant −3, k = 3 on ℝ²; `dx₁∧dx₂ + dx₃∧dx₄`; `dx₁∧dx₂` on `((2,0),(0,3))` | `3`, `3`, `sSup ∅ = 0`; comass 1, Hilbert `√2`; `6 > 1` | pass (~3) |
| `frameVolume`, `abs_eval_le_norm_mul_frameVolume`; 1.2 | `((2,0),(0,3))`, `(v,v)`, empty, `((1,0),(1,1))`; area form on `(2e₁,3e₂)` | `6`, `0`, `1`, Gram det 1 vs `√2`; `6 ≤ 6`, `0 ≤ 0`, `|c| ≤ |c|·1` | pass (~3) |
| 1.3, 1.4 | ω on ℝ⁴; degree 1; k = 2 in ℝ³, k = 1 in ℝ, k = 0, k = dim | `1 ≤ √2 ≤ √6`; equal; `6−3 = 3`, two points, two rays, two orientations | pass (~3) |
| `IsCalibratedFrame`; 1.5; 1.6 | `dx₁∧dx₂` on `(e₁,e₂)`, `(e₂,e₁)`, `(e₁,e₃)`; `dx∧dx`; `ω₁∧ω₂`; Züst | `1, −1, 0`; `binomial(2,1) = 2`; value 1, `binomial(4,2) = 6`; `294/256 > 1` | pass (~3) |
| 2.1, 2.2, 2.3 Checks | `dx₁∧dx₂`, `2dx₁∧dx₂`, `x₃dx₁∧dx₂`; planes `x₃ = 0`, `x₃ = x₁`; `t ↦ 2t`, `t ↦ |2t−1|` | comass `1, 2, |x₃|`; `f*φ = 1` vs `dvol = √2`; mass 2, 2 vs length 1 | pass (~3) |
| 3.1–3.3 | disk vs hemisphere; flat disk; equator `Sᵐ ⊂ S^(m+1)`; torus circles | `π ≤ 2π`; `H = 0`; `Vol″(0) = −m·Vol`; value 1 on unit tangents | pass (~3) |
| `standardKahlerForm`, `isCalibratedFrame_standardKahlerForm_iff`; 4.1 | n = 1 `(1,i)`, `(i,1)`, `(1,1)`; n = 2; n = 0 | `1, −1, 0`; `0, 1`; zero form (`hn` needed); `w = iv` from Cauchy–Schwarz equality | pass (~3) |
| `kahlerBivector`, `kahlerPowerForm`, `norm_kahlerPowerForm`, `isCalibratedFrame_kahlerPowerForm_iff`; 4.2–4.3 | n = r = 2 frames; real 4-plane; mixed frame; r = 0; r > n | `1, −1, −1, 0, cos t`; 1; 0; `ℂʳ×0`, `Π a_j b_j`, `ω|_T = 0` | pass (~3) |
| `standardComplexVolume`, `norm_standardSpecialLagrangianForm`, `specialLagrangianFrame_iff`; 5.1–5.4 | n = 1 `1, −1, i`; n = 2 four frames; `U/SO`, `SU/SO` dims; circle phase; gradient graphs | `1, −1, 0`, `Re(e^(−iπ/2)i) = 1`; `1, −1, i, det 0`; `1,3,6` / `0,2,5`; phase `s + π/2`, class 1, index 2; `arctan 2`, `det[[1,i],[i,1]] = 2` | pass (~3) |
| 6.1–6.5 | β and `ι_V Im Ω`; Hodge Checks; Campanato exponents; moduli; second-jet identity on six matrices | `β = (JV)♭`, `L_V Im Ω = (δβ)dvol`; `δGη = −cos x`; `κ₀ = 0.5, 1.2, 2.02`; `b₁(Tⁿ) = n`; `0.49, 0, 4, 4, 1, 6.3509` both sides | pass (~3) |

## Not verifiable

- Munkres1966EDT (Chapter II, §10; TangentialBordism cites Theorem 10.6, p. 104) is waived: cited by locator, not read.
- HarveyLawson1982 is uncertified; no locator into it is in the diff, so none was re-read this round.
- No source locator falls in this round's diff, so no text of the sources cache was opened this round; the locator checks of the previous reports stand.

## Source issues

- none (no new locator was checked against a text this round; the two misprints recorded by the earlier reports, Harvey–Lawson (2.19) p. 96 and McLean (3.5)–(3.7) p. 722, stand as registered).
