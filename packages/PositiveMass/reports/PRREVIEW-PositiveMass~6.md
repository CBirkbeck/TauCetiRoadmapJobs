# Review of PositiveMass (pull request #956 at 48920e3)

**Verdict:** needs changes

🤖 Independent AI re-review, incremental over the 67 lines changed since `697d04e`. Only `README.md` changed (41 insertions, 26 deletions). `Suggested.lean` and `metadata.toml` are byte-identical to the previous head, and no file outside the folder changed. All three previous findings are repaired. The repair of the cusp range leaves one P3 mismatch, in the scope paragraph. The gate, the dependency check and the Lean elaboration all pass.

## R01 (P3) — The scope paragraph still claims Gauss–Bonnet for cusp domains, which 3.1 now excludes

**Location:** `TauCetiRoadmap/PositiveMass/README.md:25`–`27`: "Gauss–Bonnet for compact domains with piecewise smooth boundary in an oriented surface, by triangulation and the Euler identification, with its naturality for exhaustions".

**Claim:** The roadmap owns Gauss–Bonnet for every compact domain with piecewise smooth boundary, and 3.1 is the target that states it.

**Witness:**

- The README itself qualifies "piecewise smooth boundary" with "cusps excluded" at `:46`–`47` and `:149`–`150`. So the unqualified phrase at `:26` includes cusps.
- The domain `0 ≤ x ≤ 1, |y| ≤ x²` has piecewise smooth boundary: two regular parabolic arcs and a segment. It is therefore in the class that `:26` claims.
- 3.1 at `:714`–`718` requires boundary curves "without cusps" and `αᵢ ∈ (−π, π)`, and its Check at `:748`–`755` says this domain is excluded. S3 excludes it too.

No target states the case that the scope paragraph claims. The mismatch was introduced by the repair of the previous R02, which narrowed 3.1 but left `:26` unchanged.

**Repair:** At `:25`–`27`, write "Gauss–Bonnet for compact domains in an oriented surface whose boundary is piecewise smooth without cusps, by triangulation and the Euler identification, with its naturality for exhaustions".

Retest against the edited text:

- The cusp domain is then outside both the scope and 3.1.
- The L-shaped hexagon (reflex corner, `α = −π/2 ∈ (−π, π)`), the unit disk and the annulus stay inside both.
- The consumers of 3.1 (3.3's exhaustion boundaries, and the closed surfaces cited by PositiveScalarCurvature `:93` on main) are unaffected.

## Previous findings

- R01 — repaired: `:46`–`49`, "Gauss–Bonnet for compact disks with piecewise smooth boundary, reflex corners included and cusps excluded, … : RiemannianGeometry/Surfaces S3"; `:154`–`155`, "S3 states disks only; annuli and every other Euler characteristic are 3.1's."
- R02 — repaired: `:713`–`719`, "whose boundary is a finite disjoint union of piecewise smooth simple closed curves without cusps … `αᵢ = π − βᵢ ∈ (−π, π)`, where βᵢ ∈ (0, 2π) is the interior angle". A negative-control Check is at `:748`–`755`. The repair left the scope line inconsistent; that is R01 above.
- R03 — repaired: `:237`–`238`, "stated wherever a mass is asserted (0.2, 0.4, 2.1–2.2, 3.3, 4.2, 5.2, 6.2, 7.1, 8.1–8.3)".

## Verified sound

**Mechanical checks.**

- Head `48920e3c05009c88ad4d13f5d36df0bfcc58d7a7`. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`. `git diff --stat origin/main...HEAD` outside the folder is empty.
- `git diff --quiet 697d04e HEAD` holds for `Suggested.lean` and `metadata.toml`.
- I re-ran the gate on this head (exit 0). Every check returned zero and `OK`: set_option, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib, lean-lines, statement-hygiene, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, depcheck, metadata, stray-files, dirty, outside-folder, source-material. The worker's gate also records `build=0`.
- The changed lines contain no process word, pull-request number, LaTeX delimiter, local path or new backticked name of the roadmap's own.

The dependency check returned exactly this, with no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 237 roadmaps, 2341 edges, 0 problem(s)
```

**Lean.**

- `lake env lean TauCetiRoadmap/PositiveMass/Suggested.lean` exits 0 with exactly two `sorry` warnings, at `:124` and `:150`.
- A scratch copy (identical to `Suggested.lean` for its 173 lines) with `#check @name` for all seven declarations exits 0 with the same two warnings.
- The elaborated types of `exists_tendsto_mass_nonneg` and `nonempty_isometryEquiv_of_mass_eq_zero` carry `3 ≤ n`, `n ≤ 7`, `(↑n − 2)/2 < t`, `FiniteEndedAE n M t`, `∀ x, 0 ≤ scalarCurvature x`, `Integrable scalarCurvature (TauCeti.riemannianVolume (𝓡 n) M)`, `[ConnectedSpace M]`, `[CompleteSpace M]`, `[SecondCountableTopology M]` and `[IsRiemannianManifold (𝓡 n) M]`. These are the same as at `697d04e` and as README 8.1 at `:1130`.
- Headline inventory: 8.1 is stated. 8.2 and 8.3 (spin structure), the torus obstruction (degree) and the weighted Fredholm theory are named as not statable in the docstring at `Suggested.lean:20`–`31`. Gauss–Bonnet is an input of 3.1, not a headline. The previous reports' one-tactic probes stand, because the file is unchanged.

**Seeded sample.**

- Of the sampled targets, only 3.1 is changed by the diff. Its Gauss–Bonnet statement, *Needs:* line and new Check are recomputed below; its locator, do Carmo §4-5, is under Not verifiable.
- 3.3 depends on 3.1: "combine 3.1's boundary Gauss–Bonnet" at `:817`. It uses exhaustion boundaries at regular values of ρ restricted to Σ (DifferentialGeometry 10.2 Sard). Those boundaries are smooth with no corners, so the narrowed 3.1 still covers them.
- The other sampled targets are untouched: 0.3, 0.4, 1.1, 1.2, 1.4, 2.2, 2.3, 3.0, 3.2, 6.1, 7.1, 8.1 and 8.4. Their source checks in the previous reports stand.

**Cross-roadmap citations resolved this round.**

- RiemannianGeometry/Surfaces at the head of #1974 (`2cd64ea`, unchanged since the previous review), read with `roadmaps show`:
  - S3 3.2 (Surfaces `:362`–`378`) has a domain "homeomorphic to a closed disk", "reflex corners included and cusps excluded", `k_g ds = dθ + ω`, and common-arc cancellation with its endpoint-angle terms.
  - The corner convention at `:74`–`77` is `αᵢ = π − βᵢ ∈ (−π, π)`, with `βᵢ ∈ {0, 2π}` excluded.
  - `:43`–`46` assigns annuli and every χ to PositiveMass §3.1.
  - These match PositiveMass `:46`–`49` and `:149`–`155` in content.
  - S3's *Needs* (`:380`) carries the Stokes inputs (DifferentialGeometry 5.3–5.5, 5.6.3, 12.4), which is what the new phrase at `:726` ("whose route carries the Stokes argument") says.
  - No Surfaces *Needs* line cites PositiveMass, so there is no cycle.
- On main (`b67091a`):
  - RiemannianGeometry R1 `:179`, R5a `:1044`, R5b `:1145`.
  - DifferentialGeometry Layer 2 `:341`, Layer 10 `:877` (10.2 Sard at `:884`), Layer 12 `:910` with items 12.2–12.5.
  - AlgebraicTopology Stage 7 `:1573`.
  - GeometricTopology smoothing-and-triangulation comparison, item 1, `:938`.
- The resolver's two leads, VariationalMethods "V2.3" and "V5.1", are in untouched text and were resolved as §2.3 and §5.1 at the head of #1028 in the previous report.

**Ownership.**

- `roadmaps grep -i 'gauss.bonnet'` returns 103 lines. No roadmap but PositiveMass §3.1 owns the compact-domain theorem with arbitrary χ.
- FuchsianOrbifolds `:419` (#1168) is the hyperbolic orbifold area formula with cusps of the group, which is a different object.
- The consumers of §3.1 on main use only the closed-surface case: PositiveScalarCurvature `:93`, `:239`, `:679`, `:1211`.
- `overlaps.md` lists no dropped id and no other pull request that changes this roadmap.

**Adversarial table.** Rows for the statements the diff leaves untouched are carried forward from the previous reports. Rows for the changed statements are recomputed here.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 3.1 GB (`:713`–`719`), unit disk | K=0, `k_g = 1`, no corners | `0 + 2π + 0 = 2π`; χ=1 gives `2π` | holds |
| 3.1 GB, annulus `1<r<2` | outer `k_g = 1/2`, length 4π; inner `k_g = −1`, length 2π | `2π − 2π = 0`; χ=0 | holds; owned here (Surfaces `:43`–`46` agrees) |
| 3.1 GB, pair of pants | flat disk of radius 3 minus two disjoint unit disks | outer `(1/3)(6π) = 2π`; inner `2·(−1)(2π) = −4π`; total `−2π`; χ=−1 gives `−2π` | holds |
| 3.1 GB, closed case ∂Σ=∅ | round S²; flat T² | `4π = 2π·2`; `0 = 2π·0` | holds |
| 3.1 GB, geodesic triangle | octant of the unit sphere, three β = π/2 | `π/2 + 0 + 3·π/2 = 2π`; χ=1 | holds |
| 3.1 angle range (`:718`) | β → 0⁺, β → 2π⁻ | `α = π − β` → π⁻, → −π⁺ | `β ∈ (0,2π)` ⇔ `α ∈ (−π,π)`, as S3 `:74`–`77` |
| 3.1 Check, L-hexagon (`:746`–`747`) | β = π/2 (×5), 3π/2 (×1) | `5·π/2 − π/2 = 6.2832 = 2π`; unsigned `3π = 9.4248` | Check correct and discriminating |
| 3.1 Check, cusp (`:748`–`755`) | `0≤x≤1, |y|≤x²`, domain on the left | arcs `2·(−arctan 2) = −2.2143`; corners `2·(π/2 + arctan 2) = 5.3559`; sum `3.1416 = π`; `π + α₀ = 2π` iff `α₀ = π`; `α₀ = −π` gives 0; β₀ = 0 ∉ (0,2π) | Check correct; domain excluded |
| Scope `:25`–`27` vs 3.1 `:714`–`718` | the cusp domain | in the scope's class (piecewise smooth boundary); outside 3.1 | mismatch: R01 |
| 3.1 orientation vs contract `:152`–`153` | unit disk at (1,0): outward n = e₁, outward-first `(e₁,T)` positive gives T = e₂ | counterclockwise with the domain on the left; `k_g = ⟨−x,−x⟩ = 1` | consistent |
| Scope `:46`–`49`, contract `:149`–`155` | what S3 states at #1974 `2cd64ea` | disk only, cusps excluded, connection-form boundary term, common-arc cancellation; annuli and every χ are PositiveMass's | match |
| 3.1 *Needs* split (`:729`–`733`) | Gauss–Bonnet part vs route `:719`–`726` | route: R1, R5a, S3, GeometricTopology item 1, AlgebraicTopology Stage 7; *Needs* lists those plus DifferentialGeometry 2, 12.2–12.5, and no GeometricCurrents; torus part cites GB one way only | no internal cycle; Layer 3 Dependencies `:841`–`845` cover both; depcheck 0 problems |
| 0.1 enumeration (`:238`) | targets carrying the integrability clause | 0.2 `:277`/`:288`, 0.4 `:339`, 2.1 `:581`/`:587`, 2.2 `:607`/`:611`, 3.3 `:813`, 4.2 `:874`, 5.2 `:953`, 6.2 `:1016`, 7.1 `:1052`, 8.1 `:1130`, 8.2 `:1140`, 8.3 `:1150`: 12 targets; listed: 12, the same set; 3.2, 7.2, 8.4 inherit from 2.1, 7.1, 8.1–8.3 | holds |
| 8.1 Lean headlines | ℝ³ flat; Schwarzschild m>0; ℝⁿ ⊔ Tⁿ | (Scal, m) = (0,0) with isometry; (0, 2) for c=1 with no equality (report at `68063cc`); disjoint union excluded by `ConnectedSpace` (report at `3d0220a`) | carried; binders re-checked this round |
| 0.3, 0.4, 1.1, 1.2, 1.4, 2.2, 2.3, 3.0, 3.2, 3.3, 6.1, 7.1, 8.4 (sampled, untouched) | unchanged by the diff | e.g. 0.3: n=3 tails `4π`, log-divergent, divergent; 1.2: `Δ⁺r² = −6` both ways, indicial values 0, 0, 2, multiplicities 1, 3, 5 (report at `ef9ad8b`); 0.4 flux shift `m + 2c` and 2.2 `Scal_(ĝ) = φ^(−4/(n−2)) Scal_g` (report at `3d0220a`); 6.1, 7.1 (report at `4753c24`) | carried forward |
| All other statements | unchanged by the diff | rows of the reports at `697d04e`, `3d0220a`, `4753c24`, `ef9ad8b` | carried forward |

## Not verifiable

- **do Carmo, *Differential Geometry of Curves and Surfaces*, §4-5, Global Gauss–Bonnet theorem.** This is the locator of 3.1's Gauss–Bonnet statement, unchanged by the diff. It is a commercial textbook (Prentice-Hall 1976, later reprinted) with no open-access copy that I know of. It is not in the roadmap's manifest, whose only entry is `Bartnik1986`, waived. I did not check whether do Carmo admits cusps under a sign rule. The statement was checked by computation instead (table above), and its cusp exclusion agrees with S3's convention.
- No manifest was edited, no paywall was circumvented, and no Lean job is left running.

## Source issues

- none
