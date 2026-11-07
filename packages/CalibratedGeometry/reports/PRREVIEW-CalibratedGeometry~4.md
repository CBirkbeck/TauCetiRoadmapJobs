# Review of CalibratedGeometry (pull request #946 at ca66a5b)
**Verdict:** needs changes

:robot: Independent AI review, an incremental re-review of the 47 lines changed since `103e2a8` (the 2.4 relative-triangulation route moved onto TangentialBordism B1.5, the matching scope, contract and Dependencies sentences) together with the gate, the elaboration and the overlap facts. Two findings: the gate's build step fails on Lake's module-system warning (the merge of main at `0550a2cd` moved the pins to Mathlib `1b1ccf4b` / Tau Ceti `2fd255d9`), and the DifferentialGeometry Layer 6/8/9 supplier citations are dropped at the head of the open DifferentialGeometry revision with no stated merge order. The B1.5 change itself is sound. The worktree was not changed.

## R01 (P3) — `Suggested.lean` needs the module-system header (gate `build=2`)

**Location.** `TauCetiRoadmap/CalibratedGeometry/Suggested.lean:1`, "import Mathlib".

**Claim.** The worker's gate at this head reports `build=2 FAIL`; both lines are Lake's warning "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`", and both name this folder's `Suggested.lean` (not a consumer outside the folder). The gate counts every non-`sorry` warning as a failure, and no acceptance is possible while it fails. The elaboration itself is clean (`lake env lean`: exit 0, exactly eight `sorry` warnings at lines 52, 59, 83, 89, 138, 146, 175, 184).

**Witness.** `lake-manifest.json` at this head pins Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9` (the same as main); the previous head `103e2a8` pinned `6b7abb3c` / `a91d3aaf`, where the warning did not exist. Main-branch files with the header, for the form: `TauCetiRoadmap/TypeAHeckeAlgebras/Suggested.lean` (`module`, `public import`, `public section`).

**Repair.** Replace the first line by `module`, a blank line and `public import Mathlib`; keep the docstring; insert `@[expose] public section` on its own line before `noncomputable section`. Nothing else changes. Tested: a scratch copy with exactly that header elaborates with exit 0 and the same eight `sorry` warnings (now at lines 56, 63, 87, 93, 142, 150, 179, 188) and no other output.

## R02 (P2) — DifferentialGeometry Layers 6, 8 and 9 are dropped at the open DifferentialGeometry head, with no stated order

**Location.** `TauCetiRoadmap/CalibratedGeometry/README.md:520–522` (the changed `*Needs:*` line of 2.4), "DifferentialGeometry 5.1, 5.2, 8.3, 8.4, 9.3"; likewise `:43, :62, :100, :471, :489, :518, :543, :559, :563, :809, :1077` ("8.3", "8.4", "9.3", "Layers 6 and 8", "Layers 0–1, 5 and 8").

**Claim.** These are supplier citations of DifferentialGeometry as it is on main (`TauCetiRoadmap/DifferentialGeometry/README.md:782` Layer 6, `:836` 8.3, `:845` 8.4, `:872` 9.3, all present). The open revision of DifferentialGeometry (pull request #886, head `a565de6`) no longer defines them: its layer headings go from "Layer 5.6" (`README.md:940`) straight to "Layer 12" (`:1204`), and its sibling paragraph (`:1378–1384`) hands de Rham cohomology, smooth singular chains, the de Rham theorem and Poincaré duality to DeRhamCohomologyAndDuality. That roadmap is `ORDER.txt:381`, later than CalibratedGeometry (`:217`), so it cannot be cited here, and at its own head (#1768, `d5b0c05`, `README.md:71, :163–167, :677`) it still imports 8.3, 8.4 and 9.3 from DifferentialGeometry. When #886 merges first, every one of the citations above breaks, including the one in the passage this head changed. The overlap rule makes a dropped supplier id with no citation of its new location a P2; the pull request's merge-order paragraph says "No open pull request of ours must merge before this one" and names no order against #886.

**Witness.** `git diff --stat` of #886 against main touches only `TauCetiRoadmap/DifferentialGeometry/README.md` and `Suggested.lean`; the ids 0.3, 1.2, 5.1, 5.2, 5.4, 12.1, 12.4 and 12.5 this README also cites survive at that head (`:304, :395, :85, :736, :749, :1209, :1240, :1250`), only Layers 6–11 are gone.

**Repair.** The README is correct against main and must not cite DeRhamCohomologyAndDuality (upward). State the order where the overlap rule asks for it: one sentence in the pull request's merge-order paragraph saying that #946 merges before #886, and that #886 repoints the DifferentialGeometry Layer 6, 8.3, 8.4 and 9.3 citations of CalibratedGeometry (the lines above) to their new owner at its merge, exactly as it must for the consumers already on main (AlgebraicTopology 6.3, GeometricCurrents, HeegaardFloer cite the same ids). Alternatively, if #886 is to merge first, the lines above are repointed in this pull request after DeRhamCohomologyAndDuality is placed below CalibratedGeometry in the merge order; that placement is not this pull request's to make, so the first form is the one that needs no edit here.

## Previous findings

- The previous report (`PRREVIEW-CalibratedGeometry~3`, at `103e2a8`) listed no findings; it recorded the five findings of the report before it as repaired. None of the five passages (`README.md:31, :81–88, :160–163, :398–401, :623, :666, :779–800, :892, :974, :1056–1061` at that head) is inside a hunk of this diff, so those repairs stand: carried, not re-verified.

## Verified sound

**The changed passages.** All 47 changed lines were read against their sources: `README.md:43–46` (scope), `:67–71` (owned elsewhere), `:198–211` (the GeometricTopology and new TangentialBordism contracts), `:503–522` (2.4), `:543–545` (Layer 2 Dependencies).

- TangentialBordism B1.5 at the head of #942 (`TauCetiRoadmap/TangentialBordism/README.md:439–466`, "2.3 Quotient and bundle adapters (B1.5)") owns exactly what the contract says: for every compact smooth manifold N with boundary, a finite simplicial complex K, a subcomplex L and a homeomorphism `h : |K| → N` that is a smooth embedding with injective derivative on each closed simplex and carries |L| onto ∂N, cited to Munkres Theorem 10.6, p. 104, built by triangulating the boundary first and extending over the collar by product subdivision or by triangulating the double compatibly with its reflection, and consuming Whitehead's triangulation from GeometricTopology item 1. It names "CalibratedGeometry 2.4 consumes this theorem" (`:464`). No vertex order or simplex parametrization is stated there, as this README says. TangentialBordism is a new roadmap folder (`roadmaps list`: "#942 TangentialBordism (new)"), at `ORDER.txt:10`, before CalibratedGeometry (`:217`); the pull request's description names #942 under "Depends on". The double it uses is TangentialBordism B1.6 (`:327–336`, "the double of [0,1] is S¹" Check at `:350`).
- GeometricTopology on main: Layer 1 "Collar neighbourhoods" (`TauCetiRoadmap/GeometricTopology/README.md:205–209`, a boundary component has a neighbourhood diffeomorphic to `∂M × [0,1)`, Hirsch Theorem 6.1, Lee Theorem 9.25); smoothing-and-triangulation comparison item 1 (`:938–943`, Whitehead's smooth triangulation, Munkres Annals 54). The README's restriction of item 1 to closed sources is conservative and consistent with TangentialBordism's own reading of it.
- Munkres1966EDT is waived (cited by locator; TangentialBordism cites the same Chapter II, Theorem 10.6).
- The Layer 2 Dependencies sentence and the 2.4 `*Needs:*` line agree with each other and with the contracts (TangentialBordism B1.5; GeometricTopology Layer 1 and item 1; DifferentialGeometry 5.1, 5.2, 8.3, 8.4, 9.3; AlgebraicTopology 6.3; 2.3).

**Gate and mechanics.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/CalibratedGeometry'` is empty (the long file list in the change set is the merge of main at `0550a2cd`, not the pull request's own edits). The folder holds `README.md`, `Suggested.lean`, `metadata.toml`. Every scanner of the worker's gate is 0 except `build=2` (R01). The dependency check, run independently with `--movable`:

```text
depcheck: 239 roadmaps, 2349 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean TauCetiRoadmap/CalibratedGeometry/Suggested.lean` at the new pins: exit 0, eight `sorry` warnings (lines 52, 59, 83, 89, 138, 146, 175, 184), nothing else. The Lean file is byte-identical to the one the previous report read; the worker's elaborated signatures (16 declarations, 0 dropped binders) were re-read: `[FiniteDimensional ℝ E]` on `norm_eq_sSup_abs_orthonormal` and `abs_eval_le_norm_mul_frameVolume`, `1 ≤ n` on `norm_standardKahlerForm`, `norm_standardSpecialLagrangianForm`, `specialLagrangianFrame_iff`, `r ≤ n` on `norm_kahlerPowerForm`, as the README states them. The padding probe and the headline-coverage check of the previous report apply unchanged (same file, same pins' carriers).

**Library names at the bumped pins** (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`; paths relative to the library repositories). Every backticked library name of the README and the Lean file was re-located: `ContinuousAlternatingMap.norm_def`, `norm_constOfIsEmpty`, `norm_compContinuousLinearMap_le` (`Mathlib/Analysis/Normed/Module/Alternating/Basic.lean:194, 310, 432`); `ContinuousAlternatingMap.restrictScalars` (`Mathlib/Topology/Algebra/Module/Alternating/Basic.lean:448`); `ContinuousMultilinearMap.norm_compContinuous_linearIsometryEquiv` (`Multilinear/Basic.lean`); `LinearMap.normDet`, `normDet_sq_eq_det_gram` (`Mathlib/Analysis/InnerProductSpace/NormDet.lean`); `Matrix.gram`, `det_gram_ne_zero_iff_linearIndependent` (`GramMatrix.lean`); `exteriorPower.alternatingMapLinearEquiv`; `ImplicitFunctionData.contDiffAt_implicitFunction`; `IsCoercive.continuousLinearEquivOfBilin`; `Matrix.detRowAlternating`; `Submodule.pow_mem_pow`; `LinearMap.continuous_of_finiteDimensional` (now in `TauCeti/Topology/Algebra/Module/FiniteDimension.lean`); `TauCeti.stdSymplecticForm` (`TauCeti/Geometry/Symplectic/StandardCompatible.lean`); `SymplecticForm.transport` (`SymplecticTransport.lean:61`); `AlmostComplexStructure.transport` (`Transport.lean:58`); `SymplecticForm.IsLagrangian` (`Lagrangian/Basic.lean:115`); `complexAssociatedForm`, `Compatible.hermitianCore` (`Hermitian.lean`); `AlmostComplexStructure.complexModule`; `ContinuousAlternatingMap.alternatizeBilinCLM` (`TauCeti/Analysis/Normed/Module/Alternating/Bilinear.lean`); `TauCeti.TotallyRealLoop.maslovIndex`, `maslovPhase_map_lsmul` (`Maslov/Phase.lean:221`), `maslovIndex_map` (`Map.lean:61`), `maslovIndex_prod` (`Prod.lean:246`). The worker's citation check (`citations.md`) likewise finds no Lean name and no cross-roadmap citation unresolved.

**Overlaps.** No other open pull request changes this roadmap. The one dropped-id lead (DifferentialGeometry Layer 6 at #886) is R02, widened to Layers 8 and 9 by reading #886's headings. The closest roadmaps in vocabulary (RiemannianGeometry #1327/#1683/#1187, ComplexKahlerGeometry #1398/#1234) are suppliers here (R1, R5a; K1–K6.1) and own no comass, calibration, Kähler-power, special Lagrangian or McLean object; the previous report's ownership search (main, the board packages, the open pull requests) stands for the untouched content, and the changed content owns only the vertex order, ordered parametrizations and fundamental chains, which TangentialBordism explicitly leaves to 2.4.

**Adversarial table.** Rows for the changed target (2.4) are new and computed here; the remaining rows are the previous report's, whose statements this diff leaves untouched (values as recorded in `PRREVIEW-CalibratedGeometry~3`).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 2.4 orientation signs and the shared facet (square Check) | `a=(0,0)<b=(1,0)<c=(0,1)<d=(1,1)`, triangles `[a,b,d]`, `[a,c,d]` | `det((b−a),(d−a)) = det((1,0),(1,1)) = 1`, ε = +1; `det((c−a),(d−a)) = det((0,1),(1,1)) = −1`, ε = −1; `[a,d]` is face 1 of both: coefficients `(−1)¹·(+1) = −1` and `(−1)¹·(−1) = +1`; `∂c = ([b,d]−[a,d]+[a,b]) − ([c,d]−[a,d]+[a,c]) = [a,b]+[b,d]−[c,d]−[a,c]` | pass |
| 2.4 necessity of the global order | same square, diagonal parametrized `[a,d]` by one triangle and `[d,a]` by the other | `−[a,d] + [d,a]` is a nonzero element of the free module on parametrized simplices (two distinct generators) | pass |
| 2.4 interval through B1.5's double route | `N = [0,1]`, double `S¹` (TangentialBordism B1.6 Check), reflection-compatible triangulation with `0, 1` as vertices | restricted to N: `K = {[0,1]}`, `L = {0,1}` = ∂N; `c = [0,1]`, `∂c = [1] − [0]`: outward-first | pass |
| 2.4 closed case through GeometricTopology item 1 | `N = S¹`, vertices `0 < 1 < 2` cyclically | `c = [0,1] + [1,2] − [0,2]` (the edge `[0,2]` is traversed against its vertex order, ε = −1); `∂c = ([1]−[0]) + ([2]−[1]) − ([2]−[0]) = 0 = c_∂N` | pass |
| 2.4 collar product subdivision (B1.5's first route) | prism `[v_i,v_(i+1)] × [0,1]` cut into `[(v_i,0),(v_(i+1),0),(v_(i+1),1)]` and `[(v_i,0),(v_i,1),(v_(i+1),1)]` with `(v,0) < (v,1)` | the two determinants are `1` and `−1`, the shared facet `[(v_i,0),(v_(i+1),1)]` is face 1 of both, coefficients `−1`, `+1` | pass |
| 2.4 degenerate sources | `N = ∅`; `N` a point; `k = 0` top simplices | `K = ∅`, `c = 0`; `K = {v}`, `L = ∅`, `c = [v]`, `∂c = 0 = c_∅` | pass |
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

**Headline coverage.** Unchanged from the previous report: the two Layer 1 headlines, the two Layer 4 and the two Layer 5 headlines are stated; the fundamental theorem of calibrations, the Kähler and special Lagrangian minimality, McLean's theorem and the second-variation identification are named in the docstring with their missing carriers (`Suggested.lean:11–27`).

## Not verifiable

- Munkres1966EDT (Chapter II, §10; TangentialBordism cites Theorem 10.6, p. 104) is waived: cited by locator, not read.
- Harvey–Lawson 1982 is uncertified; no locator into it is in the diff, so none was re-read this round.
- The elaboration and the probe use `lake env lean`, which does not emit Lake's module-system warning; the `build=2` of R01 is the worker's `lake build` of the module and was taken from the gate record, not reproduced.

## Source issues

- none (no new locator was checked against a text this round; the two misprints recorded by the previous report, Harvey–Lawson (2.19) p. 96 and McLean (3.5)–(3.7) p. 722, stand as registered).
