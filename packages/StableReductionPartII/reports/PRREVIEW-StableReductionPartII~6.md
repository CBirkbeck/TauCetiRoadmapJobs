# Review of StableReductionPartII (pull request #1841 at c7fcbbe)

**Verdict:** needs changes

## R01 (P3) — The rewritten Layer 4 Dependencies line omits two suppliers that its targets cite

**Location:** `TauCetiRoadmap/StableReductionPartII/README.md` line 6350: "…JacobianChallengePartII §§1.1–1.4; AbelianSchemesAndArithmeticModuli §§A3.1–A3.8, A6.18; AbelianSchemesAndArithmeticModuliPartII §B4.1; ComplexComparisonPartII §§C3.2d.1–C3.2d.4."

**Claim:** The line was rewritten to list the layer's dependencies in full, but it names neither PELModuli nor K3SurfacesAndSymplecticBoundedness. Layer 4 targets cite both in their *Needs:* lines.

**Witness:** The §4.2 *Needs:* (line 6139) and §4.4 *Needs:* (line 6163) both cite "PELModuli §§M6.9–M6.10". The §4.6 *Needs:* (line 6195) cites "K3SurfacesAndSymplecticBoundedness §6.0b". All three sections exist at those roadmaps' heads.

**Repair:** In line 6350, replace "AbelianSchemesAndArithmeticModuliPartII §B4.1; ComplexComparisonPartII" with "AbelianSchemesAndArithmeticModuliPartII §B4.1; PELModuli §§M6.9–M6.10; K3SurfacesAndSymplecticBoundedness §6.0b; ComplexComparisonPartII". Tested on a scratch copy: no Layer 4 *Needs:* citation is then missing, and depcheck reports 0 problems.

## R02 (P3) — The rewritten Layer 1 Dependencies line omits AlgebraicCurves, which the §1.3 route uses

**Location:** `TauCetiRoadmap/StableReductionPartII/README.md` line 769: "…AlgebraicModuliForArithmeticGeometry §§1.1–1.7, 2.1–2.2, 3.1–3.5, 7.2–7.3, 7.6, 8.1–8.3; EnhancedDerivedSheaves §E1.9."

**Claim:** The §1.3 route computes the degree, rank and Hilbert polynomial "by Riemann–Roch on the curve (AlgebraicCurves, StableReduction Layer 2)" (line 502). AlgebraicCurves appears neither in the §1.3 *Needs:* line (line 508) nor in the rewritten Layer 1 Dependencies line.

**Witness:** Line 508 lists only gap:stable-tricanonical-embedding, AlgebraicModuliForArithmeticGeometry §§1.1–1.7, StableReduction Layers 2–3 and §1.2. On main, AlgebraicCurves Layer 4 is Riemann–Roch and Layer 12 is the function-field ↔ curve dictionary.

**Repair:** In line 508, insert "AlgebraicCurves Layers 4 and 12, " before "[arbitrary-base tricanonical comparison]". In line 769, replace "EnhancedDerivedSheaves §E1.9." with "EnhancedDerivedSheaves §E1.9; AlgebraicCurves Layers 4 and 12.". Tested on a scratch copy: Layer 1 then cites no supplier that is missing from its Dependencies line, and depcheck reports 0 problems.

## Previous findings

- R01 — repaired: §5.15 (line 6590) now reads "flat pullback along the smooth morphisms `X×^G U→[X/G]` from the mixed spaces of EquivariantIntersectionTheory §2.1 gives, for every i, an isomorphism `A_{i−d}([X/G])_ℚ→A^G_i(X)⊗Q` from the rational Chow groups of VirtualFundamentalClass §2.1". No new defect was introduced.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §5.15 Edidin–Graham map `A_{i−d}([X/G])_ℚ→A^G_i(X)⊗Q` (changed) | G trivial; μ₂ on a point; 𝔾_m on 𝔸²∖0 with weights (1,2) | Trivial G: identity. μ₂, i=0: ℚ→ℚ, `[Bμ₂]↦[U/μ₂]`; i=−1: 0→(ℤ/2)⊗Q=0. ℙ(1,2), `A*_G=ℤ[t]/(2t²)`, i=2,1,0: ℚ→ℚ, ℚ→ℚt, 0→0 | Holds; the direction matches mc5-edidingraham1997 line 1075 |
| §5.15 index bookkeeping | Pullback of relative dimension l=dim U | `A_{i−d}([X/G])→A_{i−d+l}(X×^G U)`; EIT §2.1 defines `A^G_i(X)=A_{i+l−g}(X×^G U)` with g=d | Indices agree |
| §5.15 negative control (DM hypothesis) | 𝔾_m acting on a point | `A^{𝔾_m}_{−1}(pt)⊗Q=ℚt≠0`, but a DM stack has no dimension −1 classes; B𝔾_m is not DM, so it is excluded | The hypothesis is needed and is stated |
| §5.15 for M̄_g, c=1 | g=2, g=3 | g=2: dim U₂=3+24=27, i=26, i−d=2=dim M̄₂−1. g=3: dim U₃=6+99=105, i=104, i−d=5=6−1 | Codimension c matches |
| §6.3 `Jac(C_g[N]/M_g[N])` (changed notation) | g=2,3,4; N=2 | Relative dimension g on both sides. dim M_g[N] against dim A_g[N]: 3/3, 6/6, 9/10. N=2 excluded (N≥3). Agrees with §6.12, `f:C_g[N]→M_g[N]` (line 6910) | Consistent; C_g now names only the curve over M̄_g/C |
| §7.1 `P_g,N^d=Pic^d_{C_g[N]/M_g[N]}` (changed notation) | d=0; d=2g−2; T=Spec k̄ | d=0: trivial torsor (zero section). d=2g−2: section [ω_f]. k̄: H²(k̄,G_m)=0 and Pic(k̄)=0, so each sheaf point has exactly one lift | Matches the stated torsor and lift statements |
| §4.4 rigidity (cites PELModuli, R01) | Hyperelliptic ι with N=2,3,4 | ι acts as −1. N=2: −1≡1, trivial on J[2], a counterexample, excluded. N=3,4: −1≢1, nontrivial | N≥3 is needed and suffices here |
| §4.6 Checks (cite K3 §6.0b, R01) | S=ℙ¹×ℙ¹, m=a₁=a₂=2; constant genus-zero family | `ω²(2D₁+2D₂)=O(−4+2+2,2)=O(0,2)`, f_* degree 2. After blowup the coefficient is 2−4=−2 and f_*=O_B, degree 0. Genus 0: fibre degree Σa_i−2m gives rank 0, 1, 2 | Checks hold |
| §2.234 flat Hom/Ext exchange (seeded; cites DDPA §3.3, newly listed) | R=ℤ→T=ℤ[x], L=ℤ/2, V=𝔽₂[x]; non-flat ℤ→ℤ/2 | Flat: Hom 𝔽₂[x]=𝔽₂[x] and Ext¹ 𝔽₂[x]=𝔽₂[x]. Non-flat: `Ext¹_{𝔽₂}(𝔽₂,𝔽₂)=0` against `Ext¹_ℤ(ℤ/2,ℤ/2)=ℤ/2` | Holds; flatness is needed (ile line 181) |
| §2.254 rigid triangle locus (seeded; cites SSF §4.15, AMAG §§7.3, 8.1–8.3) | F smooth; F one-nodal | Smooth: 4 nodes, 4 components, b₁=1, genus 1+1=2. Nodal: 5, 4, b₁=2, genus 2. Codimension 5−1=4 = four branches | Matches knudsen2 lines 596–611, p. 179 |

Rows for statements the diff does not touch (the five Lean headlines, §5.16 GRR, §5.18 and the rest) stand as they were in the previous review, of d9f5c36.

- **Gate:** re-run at c7fcbbe. Every check is 0 and the result is OK. The worker's `gate.md` agrees, with build=0. The outside-folder diff is empty, and the folder diff since d9f5c36 is `README.md` only (11+/11−).
- **Dependency check:** `depcheck: 209 roadmaps, 1921 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. It also reports 0 on a scratch copy with the R01 and R02 repairs applied.
- **Elaboration:** `lake env lean` on `TauCetiRoadmap/StableReductionPartII/Suggested.lean` exits 0. The only warnings are five `declaration uses sorry` (lines 122, 139, 148, 155, 171). The file is unchanged since d9f5c36, so the signature comparison and the padding probe stand.
- **Dependencies lines:**
  - All 55 section ids newly listed in the eight changed lines resolve, at main 6e537b1 or at the open heads. Examples: EnhancedDerivedSheaves §E1.9; SchemeAndStackFoundations §§0.17–0.21, 0.30, 4.18, 5.9–5.10; MordellLawrenceVenkatesh §§5.9, 5.11–5.12; ShimuraCompactifications §2.8; AbelianSchemesAndArithmeticModuliPartII §B4.1; JacobianChallenge Layer D.
  - Every *Needs:* citation in Layers 0, 2, 3, 5, 6 and 7 appears in its layer's line. Internal layer references match all eight lines.
- **Source locators:** 6 checked. mc5-edidingraham1997: Proposition 14 (line 1059) and the proof of Proposition 15 (line 1075). knudsen2: Theorem 2.7, its proof and Figure 4 (lines 596–611, p. 179). ile: Example 2.6 (line 174, p. 4), Corollary 2.7 (line 191, p. 4) and Remark 3.6 (line 340, p. 7).
- **Cross-roadmap citations of §5.15:** VirtualFundamentalClass §2.1 (head of #1996) and EquivariantIntersectionTheory §2.1 on main both resolve. EIT §2.1 defines the mixed space `X×^G U`. The resolver's lead `ModuliDescent.polarizedDescentComparison` is a target of AlgebraicModuliForArithmeticGeometry §3.5 (its README line 1833).
- **Pull request text:** the description's supplier lists cover every roadmap the new lines name: 13 open suppliers, the rest on main. Its Edidin–Graham sentence does not state a direction, so the head does not contradict it. No supplier, section or Lean declaration was added or removed.
- **Remarks on untouched text (no change asked):** the Layer 1 line keeps "StableReduction Layers … 8–9", but Layer 1 cites no StableReduction Layer 9. `C_g[N]` is first used in §6.3, but §6.12 is where it is introduced.

## Not verifiable

- `blr-relative-picard-LwkQQl` and `mc6-fc1990`: settled as uncertified, and outside the changed passages.

## Source issues

- none
