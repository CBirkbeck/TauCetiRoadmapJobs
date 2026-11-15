# Review of AnalyticStableMaps (pull request #987 at 41557ba)

**Verdict:** accepted

Incremental re-review: the folder has 0 changed lines since the previous review (also of 41557ba), and nothing outside it changed. This round read the rewritten title and description against the head. No finding.

## Previous findings

- R01 — repaired: the description now says "adds the roadmap folder `TauCetiRoadmap/AnalyticStableMaps/` (`README.md`, `Suggested.lean` and `metadata.toml`, topic math.SG)" and names the three stated theorems and `IsSomewhereInjective`; no head hash, no "README-only".
- R02 — repaired: the description cites "§0.4–§0.5", "§2.18–§2.22", "§2.23", "§3.8" and "Layers 3–13"; each is a heading of `README.md` (lines 170, 182, 482–530, 542, 663); no `M0.1`, `M2.5`, `M2.6`, `M3.1` remains.
- R03 — repaired: "Suppliers on main: ComplexCurveModuli … PseudoholomorphicCurveAnalysis (PH1, PH3–PH7) … FuchsianOrbifolds (Layer 5 items 1 and 3) … The one open supplier is ImplicitAtlases (#974), Layers 0–7; TopologicalSheafCohomology … only through it."

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `finite_isotropy_iff` (description, summary and "The acceptance test"; §1.2) | one nonconstant torus, no marks, no flags | left: `e` with `u∘e = u` permute fibres of the degree-d cover of §0.5 and are determined by one value, at most d; right: no constant component, vacuous | both sides true | none |
| same | one constant torus, no marks | left: all biholomorphisms, containing the translations, infinite; right: fixing subgroup of the empty set, infinite | both sides false | none |
| same | one constant torus, one mark | left: biholomorphisms fixing a point, order at most 6; right: the same group | both sides true | none |
| §0.5 genus identity (description, Layer 0 bullet) | `z ↦ z³` onto a line: d = 3, g₀ = 0, R = 4 | `2 − 2g = 3·2 − 4 = 2`, so g = 0 | matches the sphere source | none |
| §2.22 escape test (description, Layer 2 bullet) | `{a} × S²` in `ℝ² × S²`: m = 2, g = 0, `c₁ = 2` | `d_0 = (2 − 3)·2 + 2·2 = 2` = dimension of the `a`-plane `ℝ²` | description's "moduli space is `ℝ²`" agrees with `README.md` line 532 | none |
| §2.23 (description, Layer 2 bullet) | g = 2, `dim_ℂ F = 1` (n = 2); g = 0; n = 1 | expected `(2−3)(−2) + 2·(−2) = −2`, actual 2, cokernel `g(n−1) = 2` complex, `2 − (−2) = 4 = 2·2`; cokernel 0 when g = 0 or n = 1 | "regular in genus zero and when F is a point, nonregular otherwise" agrees | none |
| §3.7–§3.8 (description, Layer 3 bullet) | conic limit: g = 0, n = 0, a = 2, one edge | weighted degrees `−2 + 1 + 3 = 2` each, sum `4 = 2·0 − 2 + 0 + 3·2`; areas `L + L = 2L`; 0 ghosts | description's sentence agrees with lines 663–669 | none |

Rows for all other statements stand as in the previous review, of `41557ba`.

- Gate at this head: every check 0, "OK", exit 0. Dependency check output: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line; ImplicitAtlases at merge-order line 220, AnalyticStableMaps at 221.
- `lake env lean` on `TauCetiRoadmap/AnalyticStableMaps/Suggested.lean`: exit 0; only output three `sorry` warnings (lines 105, 128, 161). `git diff --stat origin/main...HEAD` outside the folder: empty.
- Description against the head, 31 claims checked and consistent: the title (the roadmap is not on main; 3 files, 1319 insertions); the summary block; the Layer 0–13 bullets against the 95 headings and `README.md` lines 172, 192, 239, 532, 544, 647, 665; "Mathlib and five Tau Ceti modules, and no roadmap" (`Suggested.lean` lines 3–8); the five not-statable headlines against the module docstring (lines 55–76); `AuxiliaryAut`, `FlagPairData`, `Marking` (lines 169–174).
- Suppliers named in the description: the 12 "on main" each have a folder on main (1a19c9f) and no open pull request adding them; ImplicitAtlases is absent from main and open; the set equals the supplier headings and bullets of `README.md` lines 20–30 and 75–112.
- Cross-roadmap citations: `citations.md` lists none unresolved. GromovWittenTheory's open head (c3c6033) cites 38 distinct section groups here, among them §3.7, §4.1, §4.3, §6.2–§6.3, §7.3, §9.2, all present.
- Remark (no change asked): GromovWittenTheory's head also cites §0.1 here (its lines 148–460, eight times) and no section of Layer 5; the description's "Layers 1–4 and 6–13" omits Layer 0.
- Seeded sample: no sampled target lies in a changed passage, as the folder did not change; none re-read this round.
- Overlap check: read GromovWittenTheory (open), ComplexCurveModuli and HeegaardFloer (main); nothing shared. `overlaps.md` lists no dropped id, no revision-only id, no other pull request changing this folder and no second copy.
- Source independence: changed passages only; 0 passages changed in the folder, so 0 compared; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- McDuff–Salamon, *J-holomorphic Curves and Symplectic Topology*, and Robbin–Ruan–Salamon (Math. Z. 2008): paywalled, settled as uncertified, cited by locator only; nothing this round depends on them.
- "Closes #983" and the generated `depends-on` and `merge-order` blocks of the description: outside this check; the issue was not opened.

## Source issues

- none

## For the human reviewers

- none
