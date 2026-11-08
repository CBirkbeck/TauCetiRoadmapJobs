# Review of PositiveMass (pull request #956 at 697d04e)

**Verdict:** needs changes

🤖 Independent AI re-review, incremental over the 52 lines changed since `3d0220a`. Only `README.md` changed (36 insertions, 16 deletions). `Suggested.lean` and `metadata.toml` are byte-identical to the previous head. The change moves the local Gauss–Bonnet inputs of 3.1 to the new sub-roadmap RiemannianGeometry/Surfaces, Layer 3 (S3). That roadmap is a new folder in open pull request #1974, read at its head `2cd64ea`. This review raises three findings: one P2 and two P3. The push gate, the dependency check and the Lean elaboration all pass. No pull-request file was changed.

## R01 (P2) — S3 is cited for annuli and for the signed turning theorem, but S3 disclaims both

**Location:** `TauCetiRoadmap/PositiveMass/README.md:46`–`48`, "Gauss–Bonnet for disks and annuli with piecewise smooth boundary, reflex corners included, the signed turning theorem, … : RiemannianGeometry/Surfaces S3". The same claim appears in the supplier contract at `:148`, "S3: Gauss–Bonnet for disks and annuli with piecewise smooth boundary".

**Claim:** S3 supplies Gauss–Bonnet for annuli and owns the signed turning theorem.

**Witness:** At the head of #1974, the Surfaces README says the following:

- `TauCetiRoadmap/RiemannianGeometry/Surfaces/README.md:46`: "Annuli are the case `χ = 0` of [PositiveMass §3.1] and are not restated here".
- `:364`: S3's domain is "homeomorphic to a closed disk".
- `:41`: "Layer 3 consumes the smooth turning theorem and owns only its extension to corners".

The smooth signed turning theorem belongs to RiemannianGeometry R4.9.6a on main (`TauCetiRoadmap/RiemannianGeometry/README.md:868`). PositiveMass therefore hands annulus Gauss–Bonnet to S3, and S3 hands it back to PositiveMass §3.1. PositiveMass's own scope (`:25`–`27`) and 3.1 (`:710`–`712`, general χ) already prove the annulus case, so the hand-off line also contradicts this README.

**Repair:**
- At `:46`–`48`, write "Gauss–Bonnet for disks with piecewise smooth boundary, reflex corners included, the turning theorem with corners, and their boundary, corner and common-arc interfaces: RiemannianGeometry/Surfaces S3". Optionally add "the smooth signed turning theorem: RiemannianGeometry R4.9.6a".
- At `:148`, write "S3: Gauss–Bonnet for compact disks with piecewise smooth boundary, reflex corners included; …".

Retest: the annulus Check at `:736` stays with 3.1 (`2π − 2π = 0 = 2πχ`). This matches Surfaces `:46` and its example at `:394`, which calls the annulus "a Check of PositiveMass §3.1".

## R02 (P3) — 3.1 does not fix the range of the signed exterior angles, and S3 excludes cusps

**Location:** `TauCetiRoadmap/PositiveMass/README.md:710`–`713`, "For a compact domain Σ with piecewise smooth boundary … and signed exterior corner angles αᵢ". The contract at `:150`–`152` says "Its conventions are those of 3.1: … signed exterior angles".

**Claim:** "Signed exterior corner angle" fixes each αᵢ, and the S3 route covers every domain the statement admits.

**Witness:** Take the planar domain `0 ≤ x ≤ 1, |y| ≤ x²`, which has a cusp at the origin.

- Each parabolic arc contributes `−arctan 2`.
- Each corner at `(1, ±1)` contributes `π/2 + arctan 2`.
- The segment contributes 0.
- The left side is therefore `π + α₀`.

The formula `= 2π` holds only for `α₀ = +π`. With the other choice, `α₀ = −π`, the left side is `0`. S3 excludes cusps (Surfaces `:77`, `:367`: "αᵢ ∈ (−π, π)", "cusps excluded"), so the cusp case has no supply.

**Repair:** In 3.1, write "whose boundary is a finite disjoint union of piecewise smooth simple closed curves without cusps, with signed exterior corner angles αᵢ = π − βᵢ ∈ (−π, π), βᵢ the interior angle of Σ". Add the domain above as a negative-control Check: it is excluded, and it would need `α₀ = +π`. No consumer needs cusps, because the exhaustion boundaries are regular level sets.

## R03 (P3) — 0.1's enumeration of the places that state integrability still omits 2.1 and 3.3

**Location:** `TauCetiRoadmap/PositiveMass/README.md:234`–`235`, "stated wherever a mass is asserted (0.2, 0.4, 2.2, 4.2, 5.2, 6.2, 7.1, 8.1–8.3)".

**Claim:** The parenthesis lists every target that asserts a mass under the integrability hypothesis.

**Witness:** Two targets carry the clause and assert a mass but are not listed:

- 2.1 at `:578`–`584`: "of order t>(n−2)/2 with integrable scalar curvature", with `|m(E,g_j) − m(E,g)| → 0`.
- 3.3 at `:798`–`799`: "AE of order n−2 with integrable scalar curvature and mass 0".

The diff did not touch this line.

**Repair:** Write "(0.2, 0.4, 2.1–2.2, 3.3, 4.2, 5.2, 6.2, 7.1, 8.1–8.3)".

## Previous findings

- R01 — not repaired: `README.md:234`–`235`, "here it is a separate hypothesis, stated wherever a mass is asserted (0.2, 0.4, 2.2, 4.2, 5.2, 6.2, 7.1, 8.1–8.3)". Carried forward as R03.

## Verified sound

**Scope and mechanical checks.**

- Head `697d04e77ef34bd682eaba172e170d17951d0560`. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The long list of outside-folder files in the change summary comes from the merge of main, not from this pull request.
- `git diff --quiet 3d0220a HEAD` holds for `Suggested.lean` and `metadata.toml`.
- I re-ran the gate on this head (exit 0). Every check returned zero and `OK`: set_option, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib, lean-lines, statement-hygiene, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, depcheck, metadata, stray-files, dirty, outside-folder, source-material. The worker's gate also records `build=0`.
- The changed lines contain no process word, pull-request number, LaTeX delimiter, local path or new backticked name of the roadmap's own.

The dependency check returned exactly the following line, with no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 237 roadmaps, 2341 edges, 0 problem(s)
```

**Lean.**

- `lake env lean TauCetiRoadmap/PositiveMass/Suggested.lean` exits 0 with exactly two `sorry` warnings, at lines 124 and 150.
- A scratch copy with `#check @name` for all seven declarations also exits 0, with the same two warnings.
- The elaborated types of `exists_tendsto_mass_nonneg` and `nonempty_isometryEquiv_of_mass_eq_zero` still carry `3 ≤ n`, `n ≤ 7`, `(↑n − 2)/2 < t`, `FiniteEndedAE n M t`, `0 ≤ scalarCurvature`, `Integrable scalarCurvature (riemannianVolume)`, `[ConnectedSpace M]`, `[CompleteSpace M]`, `[SecondCountableTopology M]` and `[IsRiemannianManifold (𝓡 n) M]`. No binder was lost, and nothing changed.
- The file is unchanged, so the previous reports' one-tactic probes, headline inventory and "not statable" list stand. Gauss–Bonnet is an input of 3.1, not a headline, and is correctly absent from the Lean file.

**Seeded sample.** None of the sampled targets (0.1–0.3, 1.1, 1.3, 1.4, 2.1–2.3, 3.0, 3.2, 4.2, 5.2, 6.1, 6.2) is touched by the diff. Their source checks in the previous reports stand. The changed target, 3.1, cites do Carmo §4-5 (see Not verifiable).

**Cross-roadmap citations resolved this round.**

- RiemannianGeometry/Surfaces S3 at the head of #1974 (`2cd64ea`). Its heading "Layer 3 (S3)" is at Surfaces `:341`. Section 3.2 (`:362`–`378`) supplies the disk formula, the boundary term `k_g ds = dθ + ω` (`:375`) and the common-arc cancellation with its endpoint-angle terms (`:376`). It also covers reflex corners, domain-on-left orientation and the inward conormal, as PositiveMass's contract at `:148`–`152` says, apart from R01 and R02.
- No Surfaces *Needs:* line cites PositiveMass. Its 3.1 needs R4.9.6a, `windingNumber` and ConformalMapping L5; its 3.2 needs DifferentialGeometry 5.3–5.5, 5.6.3, 12.4 and R1. So there is no cycle.
- #1974 is a new folder by another author and is named in this pull request's depends-on and merge-order paragraphs.
- RiemannianGeometry R4.9.6a is on main at `:856`/`:868`. GeometricTopology's smoothing-and-triangulation comparison, item 1, is on main at `:938`.
- The resolver's two leads, "VariationalMethods V2.3" and "V5.1", are false positives. They are §2.3 "Energy space and forcing maps" and §5.1 "The compact-pair specialization" at the head of #1028 (`7ea28a3`), and both match the contract at `:168`–`173`. This text is untouched.

**Ownership.**

- I searched all roadmaps for `gauss.bonnet` (102 hits on main and at the open heads). On main, PositiveScalarCurvature `:93` cites "the closed-surface Gauss–Bonnet theorem (PositiveMass §3.1)", which agrees with the new scope at `:25`–`27`.
- RiemannianGeometry R4.9.6a owns only the round-sphere disk and annulus identities. FuchsianOrbifoldsPartII §0.5 is a hyperbolic area formula for polygons, a different object. EtaleCohomologyFoundations has the étale version, also a different object.
- No second owner of the general compact-domain theorem exists. The board's package index lists no PositiveMass sibling.

**Adversarial table.** Rows for the statements the diff leaves untouched are carried forward from the previous report (review at `3d0220a`) and from the rows it carried (`4753c24`, `ef9ad8b`). The rows below cover the changed statements, recomputed here.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 3.1 GB (`:710`–`713`), unit disk | K=0, `k_g = 1`, no corners | `0 + 2π + 0 = 2π`; χ=1 gives `2π` | holds |
| 3.1 GB, annulus `1<r<2` | outer `k_g = 1/2`, length 4π; inner `k_g = −1` (inward conormal points away from the hole), length 2π | `2π − 2π = 0`; χ=0 | holds; owned here, not by S3 (R01) |
| 3.1 GB, hemisphere | K=1, area 2π, geodesic boundary | `2π + 0 = 2π`; χ=1 | holds |
| 3.1 GB, closed case ∂Σ=∅ | round S²; flat T² | `4π = 2π·2`; `0 = 2π·0` | holds |
| 3.1 GB, empty domain | Σ = ∅ | `0 = 2π·0` | holds |
| 3.1 orientation convention | unit disk at (1,0): outward n = e₁, "outward-first" gives `(e₁,T)` positive, so T = e₂ | counterclockwise with the domain on the left, equal to S3's convention; `k_g = ⟨−x, −x⟩ = 1` | consistent; with the outward conormal, `−2π ≠ 2π` (the Check at `:738`) |
| 3.1 Check, L-shaped hexagon (`:739`–`740`) | 5 convex corners with β=π/2, 1 reflex corner with β=3π/2; αᵢ = π−βᵢ | `5·π/2 − π/2 = 2π = 2π·1`; unsigned `5·π/2 + π/2 = 3π` | Check correct and discriminating |
| 3.1 GB, cusp | `0≤x≤1, |y|≤x²` | arcs `2·(−arctan 2) = −2.214`; corners `2·(π/2+arctan 2) = 5.356`; total `π + α₀`; equals 2π only if α₀ = +π; α₀ = −π gives 0 | convention unpinned, and S3 excludes cusps: R02 |
| Scope `:46`–`48`, contract `:148` | what S3 states at #1974 `2cd64ea` | S3: disk only (`:364`), annuli "not restated" (`:46`), corners-only turning (`:41`); PositiveMass: "disks and annuli", "the signed turning theorem" | mismatch: R01 |
| Contract `:149`–`152` (boundary term, common arc, conventions) | S3 3.2 `:367`, `:375`–`376`; conventions `:77` | connection-form comparison, common-arc cancellation with endpoint angles, domain on the left, inward conormal: all present | holds, apart from the cusp range (R02) |
| Scope `:25`–`27` ownership | Surfaces `:43`–`46`; PositiveScalarCurvature `:93` | both name PositiveMass §3.1 as owner of the compact-surface theorem | single owner |
| 3.1 *Needs* and Layer 3 Dependencies (`:724`–`726`, `:826`–`830`) | depcheck; Surfaces' own *Needs* | adds S3; 0 problems; S3 needs nothing from PositiveMass | no cycle, no upward edge |
| 0.1 enumeration (`:234`–`235`) | targets that assert a mass | clause present at `:578`/`:584` (2.1) and `:799` (3.3), neither listed | R03 (carried) |
| 0.1–0.4, 1.1–1.4, 2.1–2.3, 3.0, 3.2, 3.3, 4.2, 5.2, 6.1–6.2, 7.1–7.2, 8.1–8.4 | unchanged by the diff | rows of the previous report (`3d0220a`) and of `4753c24`, `ef9ad8b` | carried forward |

**Remarks on untouched text (no change requested).**

- 3.1's single *Needs:* line covers both the torus obstruction and Gauss–Bonnet, so the Gauss–Bonnet target is listed behind GeometricCurrents G1–G7.
- The route's "DifferentialGeometry's Stokes theorem" is DifferentialGeometry Layer 5 (main `:503`). That layer is not among the listed sections 2, 10 and 12.2–12.5; with S3 supplying the local formula it may no longer be a direct need.

## Not verifiable

- **do Carmo, *Differential Geometry of Curves and Surfaces*, §4-5, Global Gauss–Bonnet theorem** (the locator of the changed 3.1). This is a commercial textbook with no legal open copy, and it is not in the manifest. The statement was checked by computation instead (table above). The locator is unchanged from the previous heads.
- No manifest was edited, no paywall was circumvented, and no Lean job is left running.

## Source issues

- none
