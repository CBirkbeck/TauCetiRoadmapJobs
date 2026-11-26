# Review of SpecialFunctionsSU2MatrixElements (pull request #2692 at 7818df4)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 87 lines changed since `f3b29fe`; the previous review had no finding, and its three small corrections and its format note are all repaired correctly: the Plancherel route of §3.4 now carries the conjugation and the transposition, the functional-equation form of the zonal classification drops the implied bi-`T`-invariance, the consumer list names §§2.2 and 2.7, and the Jacobi orthogonality of §3.3 states its value, which was recomputed exactly. There are no small corrections and no format notes. As before, six of the seven cited works could not be read legally, so their locators, wording and arrangement are left to the human reviewers.

## Previous findings

The previous review (of `f3b29fe`) had no finding (R); its other remarks are accounted for here.

- C01 — repaired: §3.4 now reads "The Peter–Weyl basis vector at `(a, b)` is `√(d+1)` times the coefficient `g ↦ ⟪π g e_a, e_b⟫`, which is `√(d+1) conj D_{ba}`", then Parseval for `conj f` and the transposition of the index set.
- C02 — repaired: `eq_matrixElement_zonal_iff_integral_mul_torusExp_mul` has no hypothesis `hT`, and §6.4 says "A continuous `φ` with `φ(1) = 1`, bi-`T`-invariant or not, satisfies the functional equation … if and only if `φ = D^l_{00}`".
- C03 — repaired: "Downstream consumers" adds "their group law and unitarity (§2.2), the conversion from the Vilenkin–Klimyk convention (§2.7)"; the description's merge-order paragraph lists §§2.1–2.3 and §2.7.
- N01 — repaired: §3.3 states the value `2^{a+b+1}/(2r+a+b+1) · (r+a)!(r+b)!/(r!(r+a+b)!) · δ_{rr'}` with a route and a Check at `(a, b, r) = (1, 0, 1)`.

## Verified sound

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| §3.3 Jacobi orthogonality for integral parameters (new value; sample target 3.3) | `(a, b) = (1,0), (2,1), (0,3), (0,0)`, `r = 0, 1`, cross term `r = 0, r' = 1`; exact rationals | `r = 1`: `1, 4/3, 8/3, 2/3` both sides; `r = 0`: `2, 4/3, 4, 2` both sides; cross terms `0` | holds; equals LaguerreJacobi §4.3's norm at integers |
| §3.3 route constants | `d = 2r + a + b`, `z = cos β` | `r!(d−r)!/((r+a)!(r+b)!) · 2^{−a−b} · ∫P²w = 2/(d+1)` gives the stated value; Check: `∫((3z+1)/2)²(1−z) = 4/4 = 1` | holds |
| §3.3 `integral_wignerSmallD_mul_wignerSmallD` (cast made explicit) | `d = d' = 2`, `i = k = 1`; `(d, d') = (2, 4)` | `∫cos²β sin β = 2/3 = 2/(2+1)`; `0`; before the change the `ℕ` leaves were already cast to `ℝ` by the expected type | holds, same statement |
| §3.4 Plancherel route | pairing of the basis vector `√(d+1) conj D_{ba}` with `conj f` and with `f` | `⟨·, conj f⟩ = √(d+1) · conj ∫ f conj D_{ba}`; `⟨·, f⟩ = √(d+1) ∫ f D_{ba} = ±√(d+1) ∫ f conj D_{−b,−a}`; moduli agree after reindexing | holds; uses `d_{m'm} = (−1)^{m'−m} d_{−m',−m}` of §2.5 |
| §6.4 `eq_matrixElement_zonal_iff_integral_mul_torusExp_mul` without `hT` | `g = 1`, then `h = 1`; `φ = D^1_{00} + D^1_{10}` (not left invariant, `φ(1) = 1`) at `g = 1`, `h = eulerMiddle (π/2)`; `φ = D^1_{00}` at `g = h = eulerMiddle (π/2)` | equation at `g = 1`: `φ(h)` = mean over the full period of `torusExp`, left invariant; mixture: mean `0`, product `1/√2`, excluded; `D^1_{00}`: mean of `−cos 2t` is `0 = 0 · 0` | holds in both directions |
| Downstream consumers (§§2.2, 2.7) | SpecialFunctionsGroupModels at its open head, supplier contracts | it cites "§§1.1, 1.3, 1.4, 2.1–2.3, 2.7, 4.2 and 6.4"; the README and the description now list the same sections | agrees |

The rows of the previous review for the untouched statements stand as in that review, of `f3b29fe`.

- Source locators checked against the text: 0 new; the one locator in a changed passage, [E, (4.1.22), p. 58], is in a text that could not be read (below).
- Library declarations opened at the pin: none new; `coe_torusExp` (`torusExp t = diag(e^{it}, e^{−it})`, so `[0, 2π]` is one full period) as recorded in Conventions and in the previous review.
- Cross-roadmap citations resolved: LaguerreJacobi §4.3 (main; the norm sequence, which at integers is the value of §3.3), §§3.2–3.4, 6.1–6.2 (main); SpecialFunctionsLegendre §§2.5, 3.1–3.3 (now on main, headings present); RiemannianGeometry R8.2 (main); the three new relative links point at folders that exist on main; SpecialFunctionsGroupModels (open head) cites this roadmap's §§2.2 and 2.7.
- Dependency check output: `depcheck: 106 roadmaps, 1216 edges, 0 problem(s)`; no upward or cyclic line. Nothing is changed outside the roadmap folder.
- Elaboration of `Suggested.lean` at the pins: no error, 71 `sorry` warnings and nothing else; 77 theorems; no `set_option`, no `variable` line, a single `import Mathlib`.
- One-tactic probe of the two changed theorems (`first | rfl | simp | infer_instance` on a copy): neither closes.
- Automatic checks: one form check fired (set aside below); the targeted build and the text scanners passed.
- The pull request's title and description were read against this head: the counts (77 statements, 71 with `sorry`), the suppliers "on main" and the consumed sections agree with it.

Overlap check: read SpecialFunctionsGroupModels, SpecialFunctionsLegendre, CompactGroups, LaguerreJacobi; nothing shared beyond what the previous review records (spherical harmonics owned by SpecialFunctionsLegendre and cited; Jacobi polynomials and their norm owned by LaguerreJacobi and cited, §3.3 rederiving the integral case as a consistency check; the `SU(2)` matrix elements and the pair `(SU(2), T)` owned here and cited by SpecialFunctionsGroupModels). The files of the other open sibling roadmaps of the series were not reread this round.

Source independence: changed passages only; 4 passages compared (the Jacobi bullet and Check of §3.3, the Plancherel route, the sentence of §6.4, the changed docstring), with 0 readable sources: their only source locator is into E, whose text could not be read; largest share E, about 75 of 188 locators, text and contents not readable, as in the previous review; the change adds, removes or reorders no layer, so the arrangement was not compared again.

Research link: none found. The README cites monographs, a survey and the DLMF (Edmonds 1957; Vilenkin–Klimyk 1991; Klimyk–Vilenkin 1995) and names as consumers SpecialFunctionsGroupModels and a roadmap on Clebsch–Gordan coefficients; it names no research result. Rests on the README.

## Not verifiable

- [E, (4.1.22), p. 58], cited in the rewritten Jacobi bullet of §3.3: the previous review's request to the sources service found only the publisher's page; the value was checked by computation and against LaguerreJacobi §4.3 instead.
- Every other locator into [E], [VK], [KV], [W], [D] and [M], as in the previous review: no legal copy, or paywalled.
- The double cover `SU(2) → SO(3)` is not in the pinned Tau Ceti, so the pin cannot check its cited declarations.

Automatic checks set aside as false positives: the rule that a section comment in the Lean file must head a declaration fired on the closing block of `#check` lines, which pin the consumed library declarations and are allowed.

## Source issues

- none

## For the human reviewers

- Not tested: Edmonds [E] has the largest share of locators (about 75 of 188) and Vilenkin–Klimyk [VK] the next (54); neither text nor table of contents could be read, so wording and arrangement were not compared with them.
- Licence: the README's section "Prior formalization" says the roadmap reuses names and conventions of the public repository bjbraams/lean-SFVK (Apache-2.0, owned by the pull request's author; modules under `SFVK/SU2/`); its statements were not compared with `Suggested.lean`.
- Scope: all seven references are monographs, a survey or the DLMF (1957–1995); the README names no research article and no research result its headlines serve (`Research link: none found`).
- Sources: six of the seven cited works ([E], [VK], [KV], [W], [D], [M]) could not be read legally; only the DLMF locators were verified, in the previous review.
- Pin: the double cover `SU(2) → SO(3)` cited as a Tau Ceti supplier is on the library's main branch but not at the pinned commit; `Suggested.lean` carries a local copy of its matrix.
