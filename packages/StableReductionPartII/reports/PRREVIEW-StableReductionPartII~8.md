# Review of StableReductionPartII (pull request #1841 at 771fcf1)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: the `### From TauCetiRoadmap.AlgebraicCurves` contract is deleted; `AlgebraicCurves` now occurs only in Scope (line 20, a deferral). §1.12 (line 681) reads "Riemann–Roch on the smooth projective component C_v (JacobianChallenge Layer B)", with matching *Needs:* (line 687) and Layer 1 Dependencies (line 765).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §1.12 `h¹(T_{C_v}(−D_v))=3g_v−3+deg D_v` via Riemann–Roch (route citation changed) | General; g_v=1, d=2; g_v=0, d=3; g_v=0, d=0 (unstable P¹) | `χ=(2−2g_v−d)+1−g_v=3−3g_v−d`; with h⁰=0, h¹=3g_v−3+d. (1,2): 2. (0,3): 0. P¹: χ=3=h⁰, h¹=0, stable clause not applied | Holds; agrees with the section's examples |
| §1.12 `Σh¹+δ=3g−3` | Smooth g=2; one-nodal g=2; theta curve (V=2, δ=3) | `Σ(3g_v−3)+2δ+δ=3(g−δ−1)+3δ=3g−3`. Values: 3+0; 2+1; 0+0+3; each equals 3 | Holds |
| JacobianChallenge Layer B applies to C_v (new supplier citation) | k algebraically closed (§1.12 hypothesis); non-closed k as control | Layer B: X smooth, proper, geometrically connected over a field, `χ(L)=deg L+1−g`. C_v smooth proper connected over k=k̄, so geometrically connected. Non-closed k is outside §1.12 | Hypotheses match |
| JacobianChallenge contract sentence (line 206, changed) | Against JacobianChallenge on main | Standing hypotheses at its README lines 40–46; Layer B heading line 135 "genus, Riemann–Roch, Serre duality"; Riemann–Roch at line 139 | Resolves; states no more than the supplier does |

Rows for statements the diff does not touch stand as in the previous review, of 5396b97.

- **Gate:** re-run at 771fcf1: every check is 0, result OK, as in the worker's `gate.md` (which also records build=0). The folder diff since 5396b97 is `README.md` only (4+/8−); the outside-folder diff is empty.
- **Dependency check:** `depcheck: 206 roadmaps, 1914 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean` on `TauCetiRoadmap/StableReductionPartII/Suggested.lean` exits 0; the only warnings are five `declaration uses sorry` (lines 122, 139, 148, 155, 171). The file is unchanged, so the signature comparison and the padding probe stand.
- **Changed citations resolved:** 3 (contract line 206, §1.12 route and *Needs:*, Layer 1 Dependencies), all to JacobianChallenge Layer B, which is on main and first in the merge order. No supplier roadmap was added: JacobianChallenge was already cited (Layers A, D, A–F).
- **Coverage:** the §1.12 route names JacobianChallenge Layer B, its *Needs:* line lists it, and the Layer 1 Dependencies line contains it. No remaining target, *Needs:* or Dependencies line cites AlgebraicCurves.
- **Seeded sample:** none of the 15 seeded targets lies in the changed passages; no source locator changed.
- **Pull request text:** the title and description do not name AlgebraicCurves as a supplier, and no section, heading-level target or Lean declaration was added or removed; the description's validation line agrees with the head.
- **Overlaps and citations leads:** no open pull request changes this roadmap or drops an id it cites. The one unresolved-name lead (`ModuliDescent.polarizedDescentComparison`, README line 190) is untouched text, resolved in the previous review at the AlgebraicModuliForArithmeticGeometry open head.

## Not verifiable

- `blr-relative-picard-LwkQQl` and `mc6-fc1990`: settled as uncertified, and outside the changed passages.

## Source issues

- none
