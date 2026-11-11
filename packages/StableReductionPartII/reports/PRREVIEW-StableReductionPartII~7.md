# Review of StableReductionPartII (pull request #1841 at 5396b97)

**Verdict:** needs changes

## R01 (P3) — The AlgebraicCurves supplier contract no longer has a consumer

**Location:** `TauCetiRoadmap/StableReductionPartII/README.md` lines 272–274: "### From TauCetiRoadmap.AlgebraicCurves … Layers 0–12 supplies divisors, genus and Riemann–Roch with the function-field/scheme comparison."

**Claim:** The repair of the previous R02 took AlgebraicCurves out of the §1.3 route, which was the only target that cited it. The contract still says AlgebraicCurves supplies this roadmap, but no target or Dependencies line consumes it.

**Witness:** At c7fcbbe, `AlgebraicCurves` occurs on lines 20, 272 and 502. At this head it occurs only on line 20 (Scope, a deferral) and line 272 (the contract heading). Line 502 now reads "Riemann–Roch on the curve (StableReduction Layer 2)".

**Repair:** Delete lines 272–275, from the contract heading through the blank line after its sentence. Keep the Scope sentence on line 20. Alternatively, keep the contract and cite AlgebraicCurves where a route uses it. For example, §1.12 uses Riemann–Roch on the smooth components C_v; its *Needs:* and the Layer 1 Dependencies line would then name it. The deletion was tested on a scratch copy: the dependency check reports 0 problems (206 roadmaps, 1914 edges).

## Previous findings

- R01 — repaired: the Layer 4 Dependencies line (line 6350) now reads "…AbelianSchemesAndArithmeticModuliPartII §B4.1; PELModuli §§M6.9–M6.10; K3SurfacesAndSymplecticBoundedness §6.0b; ComplexComparisonPartII §§C3.2d.1–C3.2d.4." It also adds "StableReduction Layers 1–5 and 8", and every Layer 4 *Needs:* citation is now covered.
- R02 — repaired: the §1.3 route (line 502) now reads "Riemann–Roch on the curve (StableReduction Layer 2)". The §1.3 *Needs:* line (line 508) adds gap:cm-duality-arbitrary-base and StableReduction Layer 8, matching the route. The repair left the AlgebraicCurves contract without a consumer; that is R01 above.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §1.3 Hilbert polynomial (6t−1)(g−1), rank 5g−5, degree 6g−6 (route changed) | g=2,3; t=1,2; smooth vs one-nodal vs theta curve | Riemann–Roch `χ(ω^{3t})=6t(g−1)+1−g`. g=2,t=1: 5=(5)(1). g=3,t=1: 10=5·3−5. g=3,t=2: 22=(11)(2). Degree of ω³ for g=2: 6 | Holds |
| §1.3 nodal Riemann–Roch via StableReduction Layer 2 (new supplier) | Genus-2 theta curve (two P¹, three nodes); g=1 negative control | Theta curve: deg ω\|P¹ = −2+3 = 1 on each component, total 2=2g−2; χ(ω³)=6+(1−2)=5. g=1: deg ω=0, rank 0, excluded by g≥2 | J-A2 (`deg L=χ(L)−χ(O)`), used in SR Layer 2, gives it |
| §4.8 fine level scheme, notation `C_g[N]→M_g[N]` (changed; seeded) | g=2,3; N=2,3 | Relative dimension 3, 6. Level degree over the fixed-multiplier component: \|Sp₄(𝔽₃)\| = 81·8·80 = 51840. N=2: ι acts as −1≡1 on J[2], so inertia μ₂ and not a scheme; Conventions require N≥3 | Holds; dm line 1284–1286 (p. 108) supports "scheme for N≥3" |
| `C_g[N]` notation across layers | §4.8 line 6211; §6.3 line 6769; §6.12 line 6910; §7.1 line 7104 | Introduced at §4.8, before its first use at §6.3. The same `f:C_g[N]→M_g[N]` is used at all four places | Consistent; the earlier remark is resolved |
| §4.12 pairing-component connectedness (*Needs:* changed) | N=3,4,5 over ℂ, g=2 | Similitude components = φ(N) = 2, 2, 4. Fixed ζ_N: one, since `Sp_{2g}(ℤ)→Sp_{2g}(ℤ/N)` is onto | The fixed-multiplier qualification is needed and is stated |
| §1.6 frame torsor (seeded; cited by changed lines 606, 663, 705) | g=2 | r=5g−5=5; PGL₅ has relative dimension r²−1=24; frames of P^{5g−6}=P⁴ | Matches dm lines 1141–1144, Proposition 5.1, p. 104 |
| §0.5 descent comparison now cites AMAG §3.5 (changed) | Trivial cover S′=S | The descent datum is the identity cocycle and the comparison is the identity. AMAG §3.5 is "Geometric comparisons and polarized descent"; `ModuliDescent.polarizedDescentComparison` is at AMAG README line 1833 (head of #853) | Resolves |

Rows for statements the diff does not touch (the five Lean headlines, §5.15, §5.16 and the rest) stand as in the previous review, of c7fcbbe.

- **Gate:** re-run at 5396b97: every check is 0 and the result is OK, as in the worker's `gate.md`. The folder diff since c7fcbbe is `README.md` only (31+/31−). The outside-folder diff is empty.
- **Dependency check:** `depcheck: 206 roadmaps, 1914 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean` on `TauCetiRoadmap/StableReductionPartII/Suggested.lean` exits 0. The only warnings are five `declaration uses sorry` (lines 122, 139, 148, 155, 171). The file is unchanged since d9f5c36, so the signature comparison and the padding probe stand.
- **Changed citations resolved:** 31 changed lines, against main 0af4e55 and the open heads.
  - On main: SchemeAndStackFoundations §§0.3, 0.8–0.9, 0.11, 0.17–0.21, 1.18–1.23, 3.3–3.7, 4.1–4.10, 4.14–4.15; StableReduction Layers 3 and 8; AlgebraicVectorBundles L0A–L0C (label map, line 349).
  - At the open heads: JacobianChallengePartII §§0.1–0.4, 1.1–1.4 (#1225); NeronModelsAndSemistableAbelianVarieties §4.1 (#852); PELModuli §§M6.9–M6.10 (#966); K3SurfacesAndSymplecticBoundedness §6.0b (#1375); ComplexComparisonPartII §§C3.2d.1–C3.2d.4 (#848); AlgebraicModuliForArithmeticGeometry §3.5 (#853).
- **Coverage, scripted:**
  - Every *Needs:* citation of Layers 0–7 lies in its layer's Dependencies line.
  - Every supplier that a changed target's route names is in its *Needs:* line. The exception is §6.13: its source note names JacobianChallengePartII §§1.1–1.4 and PELModuli, which it reaches through §6.12.
  - No new supplier roadmap was added.
- **Source locators:** 3 checked in dm: (5.14) p. 108 (line 1284); Proposition 5.1 p. 104 (lines 1141–1144); (5.15) p. 108 (line 1296). The other 13 seeded targets lie outside the change.
- **Pull request text:** no supplier, section, heading or Lean declaration was added or removed by this change. The description's supplier lists and validation line agree with the head.
- **Remark on untouched text (no change asked):** §1.12 applies Riemann–Roch to the smooth normalization components without naming a supplier.

## Not verifiable

- `blr-relative-picard-LwkQQl` and `mc6-fc1990`: settled as uncertified, and outside the changed passages.

## Source issues

- none
