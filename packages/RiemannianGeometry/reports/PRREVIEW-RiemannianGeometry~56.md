# Review of RiemannianGeometry (pull request #2226 at 80b72e1)

**Verdict:** accepted

No finding. Incremental re-review of the 9 lines changed since `7fce733` (two sentences of `TauCetiRoadmap/RiemannianGeometry/README.md`, lines 2426–2429 and 3877–3879; `Suggested.lean` unchanged).

## Previous findings

- R01 — repaired: README lines 2426–2429, "The Lean statement carries no dimension hypothesis: for n=1 the bound is 0 and the arclength coordinate along γ, continued past p̄, is such a function, with Laplacian 0; for n=0 no unit-speed geodesic exists."
- R02 — repaired: README lines 3877–3879, "The Lean statement carries no dimension hypothesis: for m=0 a closed connected M is a point, Δ⁺=0, μ₁ is the value of q there and φ₁=1."

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| R4.1 sentence on `exists_upper_barrier_laplaceBeltrami_le`, n=1 | M=ℝ, γ(t)=t, ℓ=2; circle of length L, ℓ=L/2 (cut point) | bound (1−1)·s_κ′/s_κ=0 (also when the quotient is junk); f(γ(t))=t: f(p̄)=ℓ, Δf=0≤0; dist=L−t≤t for t≥L/2, dist=t for t≤L/2; `hRic` reads 0≤0 | holds |
| same sentence, n=0 | `finrank ℝ E = 0` in `Suggested.lean` line 320 | velocity lies in the zero tangent space, norm 0≠1, so `hunit` fails at t=0∈[0,ℓ]; the statement is vacuous | holds |
| R5c sentence on `exists_pos_eigenfunction_neg_laplaceBeltrami_add`, m=0 | M a point, q=3; q=−2 | φ=1, μ=q: −0+3·1=3·1; every u is u(pt)·φ; μ∫u²=3∫u²=∫(0+3u²), equality; −2 likewise, φ=1>0 | holds |
| the R5c sentence against item 4's headline | `exists_pos_laplaceBeltrami_eigenvalue_isLeast`, `Suggested.lean` line 534 | carries `[Nontrivial E]`; on a point no λ>0 has an eigenfunction f≠0 (Δf=0), so the hypothesis is needed there and not in item 1 | consistent |
| Description, "Edits to the parent README" | `git diff origin/main...HEAD` on the parent README | 8 hunks: sub-roadmap paragraph, two R1 locators, the R4.1 and R5c sentences, the consumers sentence, two References entries; 38 lines, as stated | agrees with the head |

Rows for the untouched statements stand as in the previous review, of `7fce733`.

- Gate at `80b72e1`: every check 0, OK; the worker's targeted build 0. `depcheck: 223 roadmaps, 1989 edges, 0 problem(s)`, no UPWARD or CYCLE line. Nothing changed outside the roadmap folders.
- Elaboration: `lake env lean` on `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` gives 30 `sorry` warnings and nothing else; the file is unchanged since `7fce733`, so signatures and the padding result stand.
- Library declarations opened at the pin: `TauCeti/Geometry/Manifold/Riemannian/Laplacian.lean:238` (`laplaceBeltrami` is `divergence (mgradient f)`) and `:420` (`laplaceBeltrami_const`: zero on constants, which gives Δ⁺φ₁=0 on a point).
- Source locators: the changed sentences cite none, and the seeded sample (§§1.1–2.3) does not fall in them; the README flags no locator as unverified.
- Cross-roadmap citations: the changed sentences add none. Overlap leads rechecked: GeneralizedCohomology G4.0b and the G4 heading are on main (its README lines 936, 1082); #1807 maps the heading in its "Former heading and numbering" table; #1808 keeps both. No citation needs a change.
- Description: its sentence on the two dimension sentences ("assert in dimensions 1 and 0") and its "Suppliers" paragraph agree with the head; no layer, heading or declaration of the parent is removed.
- Overlap check: the three closest-roadmap lists name LorentzianGeometry, ManifoldOptimization, DGFloerPartII, SmoothBundlesConnections, DGFloer, Surfaces, RicciFlow, Yamabe; their scope was read in the previous review and not again, since the diff changes no object or ownership; nothing shared.

Source independence: changed passages only; the 2 added sentences carry no source locator and were compared with 0 sources (they repeat the repair text of the previous review), none shared; largest share milnor-morse-theory, 12 of 64 page locators, uncertified and not read; the diff adds, removes or reorders no layer, so the arrangement was not compared again.

## Not verifiable

- milnor-morse-theory, oneill-submersion, lee-irm, fulton-harris: uncertified, text not read (as in the previous review; outside the changed passages).
- Lynch, arXiv:2611.12758v1, cited for the R4.1 barrier whose paragraph the first sentence extends: not in the sources cache, not read.

## Source issues

- none

## For the human reviewers

- **Licence.** Lynch, arXiv:2611.12758v1, cited in R4.1 and at README lines 5184–5185 for the barrier comparison, is an unpublished preprint absent from the roadmap's source manifest.
- **Licence.** spacetime-guided-tour (arXiv:2606.02616, an unpublished expository text) is the cited source for Killing–Hopf (README line 2736) and for flatness (line 1105, which also names Lee, Theorem 7.10).
- **Scope.** `paraboloid_geodesic_crossings` is sourced to an examples sheet (wilson-dg-examples-3, Problem 14, README line 3478); the README states which parts the headline adds.
- **Not tested.** milnor-morse-theory has the largest share of locators (12 of 64) and is uncertified: its wording was not compared; only its published table of contents was, in the previous review.
