# Review of PositiveMass (pull request #956 at 3de256b)

**Verdict:** accepted

🤖 Independent AI re-review, incremental over the 5 lines changed since `48920e3`. Only `README.md` changed, in the scope paragraph at `:25`–`28` (3 insertions, 2 deletions). `Suggested.lean` and `metadata.toml` are byte-identical to `48920e3`, and no file outside the folder changed.

No findings. The one previous finding is repaired, the repair introduces no new defect, and the gate, the dependency check and the Lean elaboration pass.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/PositiveMass/README.md:25`–`28`, "Gauss–Bonnet for compact domains with piecewise smooth boundary, reflex corners included and cusps excluded, in an oriented surface, by triangulation and the Euler identification, with its naturality for exhaustions".

## Verified sound

**Mechanical checks.**

- Head `3de256b9a83303cc5d83c984d5f55625e61c9fc5`; the worktree is clean. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/PositiveMass'` is empty.
- `git diff --quiet 48920e3 HEAD` holds for `Suggested.lean` and `metadata.toml`.
- I re-ran the gate on this head (exit 0). It printed `OK`, and every check returned 0: set_option, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib, lean-lines, statement-hygiene, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, depcheck, metadata, stray-files, dirty, outside-folder, source-material. The worker's gate on this head also records `build=0`.
- The changed lines contain no process word, pull-request number, LaTeX delimiter, local path or backticked name of the roadmap's own.

The dependency check returned exactly this, with no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 237 roadmaps, 2341 edges, 0 problem(s)
```

**Lean.**

- `lake env lean TauCetiRoadmap/PositiveMass/Suggested.lean` exits 0. Its only output is two `sorry` warnings, at `:124` and `:150`.
- A scratch copy of the 173-line file with `#check @name` appended for all seven declarations also exits 0, with the same two warnings. The elaborated types are unchanged from `48920e3`:
  - `exists_tendsto_mass_nonneg` and `nonempty_isometryEquiv_of_mass_eq_zero` carry `3 ≤ n`, `n ≤ 7`, `(↑n − 2)/2 < t` and `A : FiniteEndedAE n M t`. They also carry `∀ x, 0 ≤ scalarCurvature x`, `Integrable scalarCurvature (TauCeti.riemannianVolume (𝓡 n) M)`, `[ConnectedSpace M]`, `[CompleteSpace M]`, `[SecondCountableTopology M]` and `[IsRiemannianManifold (𝓡 n) M]`, which matches README 8.1.
  - `pullbackMetricCoeff`, `AsymptoticallyEuclideanEnd` and `FiniteEndedAE` keep `[ChartedSpace (EuclideanSpace ℝ (Fin n)) M]` and the `RiemannianBundle` instance.
  - No declaration lost a binder. Nothing in the file changed, so I did not edit it.
- The headline inventory and the one-tactic probes of the previous reports stand, because the file is unchanged:
  - 8.1 is stated.
  - 8.2 and 8.3 (they need a spin structure), the torus obstruction (it needs degree) and the weighted Fredholm theory are named as not statable in the docstring at `Suggested.lean:20`–`31`.

**The repaired scope line against the text it must agree with.**

- **3.1 at `:715`–`719`:** "boundary is a finite disjoint union of piecewise smooth simple closed curves without cusps"; "`αᵢ = π − βᵢ ∈ (−π, π)`, where βᵢ ∈ (0, 2π)". The scope's "reflex corners included and cusps excluded" is the same class: β ∈ (π, 2π) is allowed, and β ∈ {0, 2π} is excluded.
- **The S3 deferral and contract at `:47`–`49` and `:150`–`156`:** they use the same phrase, restricted to disks. Annuli and every other χ stay with 3.1, so the owned and deferred classes do not overlap.
- **RiemannianGeometry/Surfaces at the head of the open pull request (`2cd64ea`, unchanged since the previous review):**
  - Scope `:43`–`46` gives PositiveMass §3.1 "compact surfaces with boundary and arbitrary Euler characteristic".
  - Conventions `:65`–`66` allow reflex corners, and `:74`–`77` exclude cusps, `βᵢ ∈ {0, 2π}`.
  - S3 3.2 at `:362`–`368` is for disks only, "reflex corners included and cusps excluded".
  - Downstream consumers at `:508`–`510` name PositiveMass §3.1 as the consumer of Layer 3.
  - No Surfaces *Needs* line cites PositiveMass, so there is no cycle.
- **3.3 at `:818`**, "combine 3.1's boundary Gauss–Bonnet", uses exhaustion boundaries that are regular level sets (`:162`, DifferentialGeometry 10 Sard; `:755`). These are smooth curves with no corners, so they lie in the scope's class.

**Ownership.**

- `roadmaps grep -i 'gauss.bonnet'` returns 106 lines over main and the open heads. Apart from PositiveMass §3.1, no roadmap owns Gauss–Bonnet for compact domains with arbitrary χ in a general oriented Riemannian surface. The roadmaps that come closest state different objects:
  - FuchsianOrbifoldsPartII §0.5 at `:221`–`233` (open head) is the area of the core of a hyperbolic orbifold from its signature.
  - FuchsianOrbifolds `:419` is the cofinite-area formula with cusps of the group.
  - RiemannianGeometry `:900` (in the same open pull request as Surfaces) is the moving-disk formula.
- `overlaps.md` lists no other pull request that changes this roadmap, and no dropped id.
- The resolver's two leads, VariationalMethods "V2.3" and "V5.1", are in untouched text. They resolve at the VariationalMethods head `7ea28a3` as `### 2.3 Energy space and forcing maps` (`:495`) and `### 5.1 The compact-pair specialization` (`:840`).

**Seeded sample.**

- Of the sampled targets, only 3.3 depends on the changed passage, through 3.1's boundary Gauss–Bonnet and the exhaustion naturality the scope line names. That dependency is checked above. Its sources (Schoen–Yau 1979 §3–§4) are marked uncertified in the README and were not re-read.
- The diff does not touch the other sampled targets: 0.1, 0.2, 1.1, 1.2, 1.3, 1.4, 2.1, 2.3, 4.1, 6.1, 6.2, 7.1, 8.2 and 8.3. Their source checks in the previous reports stand.

**Adversarial table.**

- Rows for the changed statement (the scope line, `:25`–`28`) are computed here.
- Rows for the untouched statements are carried forward from the report at `48920e3` and the earlier reports it cites.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| Scope `:25`–`28` vs 3.1, inward cusp | `C = {0 ≤ x ≤ 1, |y| ≤ x²}`, β₀ = 0 at the origin | arcs `2·(−arctan 2) = −2.2143`; corners `2·(π/2 + arctan 2) = 5.3559`; left side `π + α₀`; equals `2π = 2πχ` only for `α₀ = π`, i.e. β₀ = 0 | excluded by the scope ("cusps excluded") and by 3.1 (β ∈ (0, 2π)); consistent |
| Scope vs 3.1, outward cusp | `D = B(0,3) ∖ int C`, χ = 0, β₀ = 2π | outer circle `(1/3)(6π) = 2π`; inner arcs (reversed) `+2 arctan 2`; inner corners `2·(−π/2 − arctan 2)`; inner total `−π + α₀`; sum `π + α₀ = 0` only for `α₀ = −π`, i.e. β₀ = 2π | excluded by both, as Surfaces `:74`–`77` (`βᵢ ∈ {0, 2π}`) |
| Scope vs 3.1, reflex corner on a disk | L-shaped hexagon, β = π/2 (×5), 3π/2 (×1) | `5·π/2 − π/2 = 2π`; χ = 1; unsigned angles would give `3π = 9.4248` | in both; holds |
| Scope vs 3.1, reflex corners with χ = 0 | square `[−3,3]²` minus the open L-hexagon | outer: four `α = π/2` gives `2π`; hole (reversed, α ↦ −α): `5·(−π/2) + π/2 = −2π`; total `0 = 2π·0` | in both; holds; not an S3 disk, so 3.1 owns it, as `:155`–`156` say |
| Scope vs 3.1, pinched boundary | two closed flat triangles sharing one vertex (bowtie), χ = 1 | counting the shared vertex as two corners: `2·(3π − π) = 4π ≠ 2π` | the boundary is not a 1-manifold at the vertex, so this is not a domain with piecewise smooth boundary in the usual sense; 3.1's "disjoint union of simple closed curves" excludes it explicitly; not a finding |
| Scope vs 3.1, smooth boundary | unit disk; annulus `1 < r < 2`; pair of pants (radius-3 disk minus two unit disks) | `2π` (χ = 1); `2π − 2π = 0` (χ = 0); `2π − 4π = −2π` (χ = −1) | in both; holds |
| Scope vs 3.3's use (`:818`, `:755`) | regular level set of the exhaustion function on Σ | smooth closed curves, no corners, no α terms | in the scope's class |
| Scope vs ownership `:47`–`49`, `:150`–`156`, Surfaces `:43`–`46`, `:362`–`368` | who owns what | S3: disks, reflex in, cusps out; PositiveMass 3.1: arbitrary χ, the same corner class | single owner each, no handback |
| 3.1 GB, angle range, orientation, cusp Check, *Needs* split | unchanged by this diff | rows of the report at `48920e3`: disk `2π`; annulus `0`; octant triangle `π/2 + 3·π/2 = 2π`; `β → 0⁺, 2π⁻` gives `α → π⁻, −π⁺`; outward-first orientation gives `k_g = 1` on the unit circle | carried forward |
| 0.1 enumeration (`:238`) | the 12 targets that carry the integrability clause | listed set = computed set (report at `48920e3`) | carried forward |
| 8.1 Lean headlines | ℝ³ flat; Schwarzschild m > 0; ℝⁿ ⊔ Tⁿ | (Scal, m) = (0, 0) with an isometry; (0, 2) for c = 1 with no equality; the disjoint union is excluded by `ConnectedSpace` (reports at `68063cc`, `3d0220a`) | carried forward; binders re-checked this round |
| 0.3, 0.4, 1.2, 2.2, 6.1, 7.1 and the other sampled statements | unchanged by the diff | e.g. 1.2: `Δ⁺r² = −6`, indicial values 0, 0, 2 with multiplicities 1, 3, 5 (report at `ef9ad8b`); 0.4 flux shift `m + 2c`, 2.2 `Scal_(ĝ) = φ^(−4/(n−2)) Scal_g` (report at `3d0220a`) | carried forward |
| All other statements | unchanged by the diff | rows of the reports at `48920e3`, `697d04e`, `3d0220a`, `4753c24`, `ef9ad8b` | carried forward |

## Not verifiable

- **do Carmo, *Differential Geometry of Curves and Surfaces*, §4-5, Global Gauss–Bonnet theorem.** This is the locator of 3.1, which is unchanged by the diff.
  - It is a commercial textbook (Prentice-Hall 1976), and I know of no open-access copy. It is not in the roadmap's manifest, whose only entry, `Bartnik1986`, is waived.
  - The scope and 3.1 exclude cusps. I did not check whether do Carmo's own regular-region hypothesis also excludes cusps. The statement was checked by computation instead (table above).
- **Schoen–Yau 1979, §3–§4.** These are 3.3's sources, marked uncertified in the README, and were not re-read this round.
- No manifest was edited, no paywall was circumvented, and no Lean job is left running.

## Source issues

- none
