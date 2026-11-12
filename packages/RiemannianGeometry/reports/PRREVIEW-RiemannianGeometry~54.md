# Review of RiemannianGeometry (pull request #2223 at 0890c72)

**Verdict:** accepted

## Previous findings

- R01 — repaired: the description now reads "the separation of `ℝ` by a point and of `ℝⁿ` by the unit sphere, with defining functions `x−p` and `(|y|²−1)/2` (noncompact `M`: on `ℝ` neither closure is compact, on `ℝⁿ` the closure of the exterior is not)".

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| R7.9 opening, README 3844–3848: "these domains being compact when the ambient manifold is" | equator of Sⁿ; unit sphere in ℝⁿ; point p in ℝ | D± closed hemispheres, compact; D₋ closed ball compact, D₊={\|y\|≥1} unbounded; (−∞,p] and [p,∞) unbounded | holds; agrees with README 3953 and the Lean closures `A ∪ range f` |
| Reading of "domain" in that sentence | open hemisphere of Sⁿ; closed hemisphere D₋ | open, nonempty, ≠Sⁿ in connected Sⁿ, so not closed, not compact; D₋ compact | "domain" means D±, as README 4048 already uses it; consistent |
| "when a hypersurface bounds a domain on each side" against the hypotheses of (1) | point in S¹; latitudes x₃=±½ on S²; ℝP²⊂ℝP³ | complement connected, crossing class dθ/2π≠0; 3 components; complement an open ball, S(ν_f)=S² connected | excluded by `H¹_dR=0`, connected Σ, two-sidedness respectively |
| "when a hypersurface has a unit normal at all": `exists_unitNormal_of_simplyConnectedSpace` (Suggested 582) | line in ℝ²; ℝP²⊂ℝP³; open Möbius band in ℝ³ | ν=e₂; π₁=ℤ/2, one-sided; N(θ+2π)=−N(θ), range not closed | holds; simple connectivity and `IsClosed (range f)` needed |
| Previous R01: description against README 4085–4094 | ℝ⊃{p}, ν=∂ₓ; ℝⁿ⊃Sⁿ⁻¹, ν=y | ∂ₓ(x−p)=1=ν; grad (\|y\|²−1)/2=y=ν; neither closure compact on ℝ; D₊ not compact on ℝⁿ | description agrees with the head |
| Description opening, "a compact hypersurface bounds a domain on each side" | README 3882; Suggested 593–597 | `[CompactSpace S] [ConnectedSpace S]`, unit normal ν, `Subsingleton (deRhamCohomology I M 1)`, M connected, not compact | agrees |

The rows for the untouched statements stand as in the previous review, of `a3dee99`.

- Change since `a3dee99`: README lines 3844–3848 only (4 insertions, 4 deletions); `Suggested.lean` unchanged; nothing outside the folder against `origin/main`.
- Seeded sample (1.1–1.3, 2.1–2.3): none of it falls in the changed lines, and its text is unchanged since `a3dee99`, where its locators were checked. The README flags no locator as unverified.
- The other R7.9 summaries (README 31, 952, 3626, 4154) agree with the reworded sentence. MinimalSurfaces at its open head (README 247–251, 1251, 1913) consumes R7.9, including its compact-M special case, and the rewording leaves that citation intact.
- Gate rerun at `0890c72`: every check 0, OK. Dependency check: `depcheck: 206 roadmaps, 1913 edges, 0 problem(s)`.
- `lake env lean Suggested.lean`: exit 0, 25 `sorry` warnings and nothing else.
- Overlap and citation leads are those already handled at `a3dee99`, all in untouched text. G4.0b is defined on main, #1807 maps the dropped GeneralizedCohomology anchor, and AT4.6 at README 2506 resolves to AlgebraicTopology §4.6.
- Pull-request text: the title and description agree with this head. The reworded sentence changes nothing that they state.

Overlap check: read Surfaces, MinimalSurfaces, LorentzianGeometry, Yamabe, ManifoldOptimization, RicciFlow, DifferentialGeometry and GeometricTopology. Separation and two-sidedness of smooth hypersurfaces are owned only by R7.9, and MinimalSurfaces consumes it. Brown's converse (separating implies bicollared) belongs to GeometricTopology. De Rham periods and the divergence theorem belong to DifferentialGeometry 6.3 and 12.5 and are cited. Yamabe and the others share no object with R7.9.

## Not verifiable

- `milnor-morse-theory` §14, p. 77, and Lemma 14.4, pp. 80–81 (2.1): recorded as uncertified; text not read.
- `oneill-submersion` Theorem 2 and Corollary 1 (1.3): recorded as uncertified; text not read.
- Bott–Tu, Ch. I, §5; Lima, Amer. Math. Monthly 95 (1988); Hirsch, Ch. 4, §4 (R7.9): paywalled; untouched since `a3dee99` and not re-read.

## Source issues

- none
