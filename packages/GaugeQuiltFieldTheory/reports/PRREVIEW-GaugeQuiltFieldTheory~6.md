# Review of GaugeQuiltFieldTheory (pull request #1076 at df970ca)

**Verdict:** accepted

Incremental re-review of 0 changed lines since df970ca: the folder is unchanged, and this round reads the rewritten title and description against the head. No finding.

## Previous findings

- R01 — repaired: the description now reads "`Suggested.lean` states the headline theorems statable at the pinned Mathlib … `relationModuli_genus_one`, `relationSet_stabilizer_central` and `relationModuli_simplyConnected` … each admitted with `sorry`"; the "unchanged prototype" and "zero owner admissions" sentences are gone.
- R02 — repaired: the "Validation" paragraph (CI run 39598885877, "match publication", the Lean 4.35.0-rc3 remark) is gone; the description makes no claim about a CI run.

## Verified sound

| statement | instances tried | values on each side | result |
|---|---|---|---|
| title | README line 1; `Suggested.lean` line 6 | "Connected symplectic gauge field theory and quilted sewing" in all three | agrees |
| description: adds the folder with three files, "changes no other folder" | diff against `origin/main` outside the folder; folder listing | outside diff empty; `README.md`, `Suggested.lean`, `metadata.toml`; 364 insertions, 0 deletions | agrees |
| description: `relationModuli_genus_one` "for `r ≥ 1` and a primitive `r`-th root" | `r=3`, `ζ=ω`, clock `C=diag(1,ω,ω²)`, shift `S`; `r=1` | `det C=ω³=1`, `det S=+1`, `CSC⁻¹S⁻¹e_(i+1)=ω·e_(i+1)`; `r=1`: one tuple, one orbit | declared at Lean line 53; true on instances |
| description: `relationSet_stabilizer_central` | `r=2`, `ζ=−1`, `A=diag(i,−i)`, `B` quarter turn; control `ζ=1`, `(1,1)`; `g=0` | commutant of `A`: `diag(a,ā)`; with `B`: `a=ā=±1`, central. Control: stabilizer `SU(2)`. `g=0`,`r≥2`: `1≠ζ·1`, vacuous | declared at line 61; true on instances |
| description: `relationModuli_simplyConnected` | `r=1`; `g=1` | `SU(1)` trivial: one point for every `g`; `g=1`: point by the genus-one theorem; Lean carries `1 ≤ g` (line 73) | declared at line 72; agrees |
| description: "`B_g=0` in even genus and `B_g=E_g` in odd genus"; "`TL_g⊕p*B_g⊕q*B_(g+1)` is stably `p*(TN_g⊕E_g⊕E_g)`" | `g` even, `g` odd, `k=r²−1` | even: `TL⊕q*E_(g+1)≅TL⊕p*E_g`; odd: `TL⊕p*E_g`; ranks `(2g−1)k+k=(2g−2)k+2k` | README lines 111, 138; agrees |
| description: "middle summand `TM_1⊕B_1⊕B_1`"; order `det(coker D)*⊗det(ker D)` against F0.0 | README lines 162–164, 170; `D=diag(0,1,…,1)` | last summand `TM_1⊕B_1⊕B_1`; reorder sign `(−1)^(1·1)=−1`, `+1` at invertible `D` | agrees |
| description: "unweighted, same-weight Hilbert and opposite-weight dual adjoints" | `D=∂_s+A`, weight `e^φ` | `∫e^(2φ)⟨u′+Au,v⟩=∫e^(2φ)⟨u,−v′−2φ′v+Av⟩`: Hilbert adjoint `−∂_s+A−2φ′`; conjugate `∂_s+A−φ′`; dual-weight `−∂_s+A` | README line 234; agrees |
| description: target "modulo `[F]∼[F∘S_C^k]`"; scope list (coprime degrees, rank one, empty sphere, zero extensions) | README lines 248, 268, 218 | same relation with `k∈ℤ`; all four scope items at line 268 and the zero-extension section | agrees |
| description: the supplier list | README supplier headings, lines 9–43 | 10 suppliers on each side; FukayaTheory sections FK0, FK1.1, FK3, FK4.2, FK3.1, FK6.1 on both; HeegaardFloer F0–F3 on both | agrees; none added or dropped unstated |
| description: "whose comparison takes only GQ1's rank-two odd-degree surface moduli"; "no other consumer" | README lines 266, 278; InstantonFloerTheory at its open head, lines 20, 365, 383 | IF9 `*Needs:* GaugeQuiltFieldTheory GQ1`; "owned by GaugeQuiltFieldTheory GQ1; consume it"; GQ2–GQ5 uncited there | agrees |
| description: the not-statable headlines named by the module docstring | `Suggested.lean` lines 14–26 | three items on each side: GQ4–GQ5 field theory; GQ1 smooth symplectic structure, dimension, `c₁=2r[ω]`; GQ2–GQ3 correspondences, relative-spin identity, Cerf invariance | agrees |
| seeded sample: "Rank two, odd degree" (README line 84) | `dfl-atiyah-floer` lines 241–246, 257–260, 669–689 | Remark 2.2 (p. 8): sequence `ℤ/2⊕ℤ/2 → G → G_ex → H¹(Σ;ℤ/2)`; eq. (2.5): `−∫tr(c∧c′)`; proof of Lemma 2.43 (pp. 18–19): holonomy `(−1)^(l(γ))·hol_γ`, fixed determinant connection | supports the text as written |
| seeded sample: "InstantonFloerTheory" (README lines 3, 84, 86, 266, 274, 278) | InstantonFloerTheory at its open head: IF0 line 26, IF9 line 361, IF10 line 428 | IF9 consumes `M(P,δ)`, dimension `6g−6`, `c₁=4[Ω]`, genus-one fixed point `BAB⁻¹=−A`, and constructs the `SO(3)` adapter itself | both sides state the same division |

The rows of the earlier reviews for the statements of the folder stand as in the previous review, of df970ca.

- Gate, run again on this head: every check 0, `OK`; the worker's gate has `build=0`. Files changed outside the folder: none.
- Elaboration (`lake env lean` on `TauCetiRoadmap/GaugeQuiltFieldTheory/Suggested.lean`): three `declaration uses sorry` warnings (lines 53, 61, 72), nothing else; the five elaborated types in the worker's signature list match README lines 55–59, no binder lost.
- Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Merge order: SmoothBundlesConnections 13, FukayaTheory 230, GaugeQuiltFieldTheory 300, InstantonFloerTheory 301 (a consumer).
- Cross-roadmap citations re-resolved: InstantonFloerTheory at its open head (lines 20, 365, 383; IF0, IF9, IF10 headings); FukayaTheory at its open head (FK0 97, FK1.1 207, FK3 465, FK3.1 467, FK4.2 647, FK6.1 747; `ω(B)=2τc₁(B)`, `ω(β)=τμ(β)` at 469, 749); HeegaardFloer, DGAInfinity, SpinGeometry, SmoothBundlesConnections, DifferentialGeometry, AlgebraicTopology and SymplecticGeometry/HamiltonianReduction are folders on main (1a19c9f).
- Source locators checked against the text this round: 3 (`dfl-atiyah-floer` Remark 2.2, eq. (2.5), Lemma 2.43 and its proof).
- Overlap check: read InstantonFloerTheory, FukayaTheory, HeegaardFloer, DGFloer, HamiltonianReduction; the fixed-determinant surface moduli is owned by GQ1 and consumed by IF9, generalized quilts by GQ4; nothing else shared. The worker's overlap and citation scans list no dropped id, no second copy and no other pull request changing the folder.
- Headlines and padding: unchanged since the previous review (three statable relation-model theorems stated; the unstatable headlines named in the module docstring with their missing carriers); the one-tactic probe was not rerun on the unchanged file.
- Source independence: changed passages only; the diff of the folder is empty, so 0 passages compared with 0 sources for wording (the 3 locators above were read for content); largest share `ww-coprime`, as in the previous review; no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- Atiyah–Bott (1983) and Drezet–Narasimhan (1989): paywalled, as in the previous reviews; not reopened.

## Source issues

- none

## For the human reviewers

- none
