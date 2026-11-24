# Review of MinimalSurfaces (pull request #2491 at f414bf7)
Folder: `TauCetiRoadmap/RiemannianGeometry/MinimalSurfaces/`
**Verdict:** accepted

**Summary.** Accepted. This is an incremental re-review of the 7 lines added to 7.8 since `6b081a3`: a new item proving that stability in U implies the stability of 6.3 on a hypersurface that need not be two-sided. The argument is correct, and it supplies the one-line justification the previous review's first format note asked for. There are no findings; two small corrections (the symbol used for the test sections, and the description not mentioning the new item) and one carried format note, none blocking. Four facts are left for the human reviewers, as before.

## C01 — The comparison with 6.3 quantifies over `Γ₀(ν_f)`, which 6.1 defines only for a compact Σ with boundary

In the new item of 7.8, line 1697 reads "`Q(V) ≥ 0` for every `V ∈ Γ₀(ν_f)`". Item 6.1 (line 1192) introduces `Γ₀(ν_f)` as the sections vanishing on `∂Σ` of a compact Σ with nonempty boundary, while the Σ of 7.8 has no boundary and need not be compact; a reader who looks the symbol up finds a space that does not apply. The next sentence ("`|V|` is Lipschitz with compact support in Σ") shows what is meant, and it is the test space of 6.2 (line 1237). Writing "for every compactly supported smooth section V of `ν_f`", or `V ∈ C^∞_c(Σ;ν_f)`, would say it; the statement and its proof are otherwise unchanged.

## C02 — The description's list of what 7.8 proves omits the comparison with 6.3

The description's "Basic facts" item lists strict stability implying stability, C¹ test functions, comparable weights, dilation and the reduction, and its sentence "Two-sidedness is assumed only where the form is identified with the second variation of area" is still true; but the head now also proves, for a minimal Σ that need not be two-sided, that stability in U implies the stability of 6.3, with the converse failing on a one-sided Σ. One clause added to "Basic facts" would state it, for example: "for a minimal hypersurface, two-sided or not, stability in U implies the stability of 6.3, and not conversely on a one-sided one".

## N01 — The Lean statements of 4.2 and 5.1 do not assume the source surface Hausdorff

Carried; `Suggested.lean` is unchanged. `range_eq_plane_of_minimal_of_nonneg` and `exists_sq_mul_hessianCoordNormSq_le_lintegral` (`Suggested.lean` lines 55 and 89) carry `[TopologicalSpace S]` with no `[T2Space S]`, while the README's surfaces are Hausdorff. Both statements stay true; adding `[T2Space S]` would make the Lean and the README agree.

## Previous findings

- The previous report, of `6b081a3`, raised no finding (no R01) and no small correction.
- N01 (the claim that the scalar notion is stronger on a one-sided Σ had no argument) — repaired: lines 1696–1702 now prove "If Σ is stable in U then `Q(V) ≥ 0` for every `V ∈ Γ₀(ν_f)`", through `|V|` and approximation; see C01 for the symbol.
- N02 — not repaired: `Suggested.lean` is unchanged; carried as N01.

## Verified sound

| Statement | Instance | Roadmap side | Computed side | Result |
|---|---|---|---|---|
| 7.8 comparison: stable in U ⇒ `Q(V) ≥ 0` for compactly supported V | `ℝP² ⊂ ℝP³`, `U = ℝP³` (one-sided) | implication, converse fails | 6.3: τ-odd eigenvalues `j(j+1) − 2 ≥ 0`, j odd, so stable; ζ = 1: `2·2π = 4π > 0 = ∫|∇1|²`, not stable in U | holds; converse fails as stated |
| the same, contrapositive on a two-sided Σ | `S²_eq ⊂ S³`, `U = S³` | 6.3-unstable ⇒ not stable in U | `μ₁(−J) = −2 < 0`; ζ = 1: `2·4π = 8π > 0` | holds |
| step `Q(V)` = scalar form at `|V|` | `V = uν` locally, `u = x` near a zero | `|∇|V|| = |∇^⊥V|` a.e. | `∇^⊥V = (du)ν` as ν is parallel (6.3); `|∇|x|| = 1 = |∇x|` off `x = 0`; both gradients vanish a.e. on `{u = 0}` | holds |
| step: each smooth φ with support in compact `K ⊂ Σ` is a restriction of some `ζ ∈ C^∞_c(U)` | half-plane `{x₃ = 0, x₂ > 0} ⊂ ℝ³`; open Möbius band | Σ closed in an open neighbourhood of K | Σ embedded, so `Σ = Σ̄ ∩ W`, W open; half-plane: `W = {x₂ > 0}`; extend on W, multiply by a cutoff in `C^∞_c(W)` equal to 1 on K | holds |
| step: passage to the limit | `φ_k → |V|` in `W^(1,2)`, supports in one compact K′ | `Q(φ_k) → Q(|V|)` | `|A|² + Ric(ν,ν)` bounded on K′, so the form is `W^(1,2)`-continuous there; `Q(φ_k) ≥ 0` gives `Q(|V|) ≥ 0` | holds |
| 6.3 form cited by the new item (seeded sample target) | hypersurface, `V = φν` | `Q(V) = ∫(|∇^⊥V|² − (|A|² + Ric(ν,ν))|V|²)` | Chodosh, Theorem 23.4, p. 60: `∫|∇φ|² − |A|²φ² − Ric(ν,ν)φ²`, φ compactly supported; §24, p. 61, defines two-sided | holds |

The diff changes no other statement; the rows for the untouched statements stand as in the previous review, of `6b081a3`.

- Source locators read against the text this round: 2, [Chodosh, §24] with Theorem 23.4 (Chodosh lines 2673–2691) for 6.3, and [Chodosh, Proposition 26.1, p. 64] (Chodosh lines 2840–2843). Of the 15 seeded sample targets only 6.3 is cited by the changed passage; the new item itself carries no locator and needs none (it is proved in place).
- Changed passage read against what cites it or is cited by it: 6.1 (lines 1190–1197), 6.2 (lines 1224–1241), 6.3 (lines 1260–1302), the paragraph before the items of 7.8 (lines 1683–1689), the one-sided Check (lines 1750–1751), the *Needs:* line and the Layer 7 dependencies. None is made wrong; the new item uses only 6.3, already in the *Needs:* line.
- Cross-roadmap citations in the changed passage: none. No open pull request changes this roadmap, drops an id it cites, or cites an id it drops.
- Automatic checks: all pass on this head. The dependency check prints `depcheck: 132 roadmaps, 1466 edges, 0 problem(s)`, with no UPWARD or CYCLE line. Nothing outside the folder changes, against the base or since `6b081a3`.
- Elaboration: `Suggested.lean` is unchanged since `6b081a3`; elaborated again, it gives five `sorry` warnings (lines 55, 89, 116, 138, 158) and nothing else.
- Title and description against the head: every sentence holds; one change is unstated (C02). One heading added (7.8), none removed or renumbered; `Suggested.lean` unchanged; no supplier added or dropped.

Overlap check: read GeometricCurrents, LorentzianGeometry, PDE, HeegaardFloer, ManifoldOptimization (open) and RiemannianGeometry, Surfaces, PositiveMass (main) as in the previous review; the change touches no owned object, and nothing is shared beyond what that review records (Simons' identity, the tangency principle and monotonicity are GeometricCurrents G6's; the linear elliptic theory is PDE's; Gauss–Bonnet is PositiveMass §3.1's; second variation and Schrödinger spectral theory are the parent's R5a–R5c). Stability across a singular set and strict stability are owned here alone.

Source independence: changed passages only; 1 passage compared with 2 sources (Chodosh §§23–24, Simon23 §1), none shared: the new item is an argument neither source gives; largest share Chodosh, 59 of about 167 locators, as in the previous review; the diff adds, removes or reorders no layer, so the arrangement was not compared again.

Research link: Layers 8–12 reach the Choi–Schoen compactness theorem (1985); 7.4–7.5 give Schoen's curvature estimate (1983) by Lynch's route (2026 preprint); 7.8 is the strict stability of Simon (2021, 2023), used there for hypersurfaces with prescribed singular set. Rests on the README and on Simon21 and Simon23, which were read.

## Not verifiable

- [CM] (AMS GSM 121), [ChoiSchoen] and [SY] (Springer), [Simons] (JSTOR), [Schoen] (Annals of Mathematics Studies 103) and [FCS]: no legal copy read, as in the previous review; the changed passage cites none of them directly ([FCS] and [CM, §1.8] stand among the sources of 6.3).

## Source issues

- **Misprint** in Simon23 at the note after 1.2, p. 4: the source says the left side of 1.2 is the second variation of area; it should be the right side; affects nothing.

## For the human reviewers

- Licence: [Chodosh] is read from the author's Stanford page (web.stanford.edu/~ochodosh), a host the sources service does not classify; it was treated as an author page.
- Scope: the route of 7.4 follows [Lynch], an unrefereed preprint (arXiv:2611.12758v1, 2026; README lines 376 and 1527). The theorem it serves, 7.5, is Schoen's published estimate.
- Scope: no item of this roadmap consumes 7.8 (README lines 1753–1754 and 1771–1772); the uses its sources name are Simon's (Simon21, Simon23).
- Not tested: [CM] has the second-largest share of the locators (about 31 of 167) and no legal copy, so wording and arrangement were not compared with it.
