# Review of MinimalSurfaces (pull request #2491 at 18e5a16)
Folder: `TauCetiRoadmap/RiemannianGeometry/MinimalSurfaces/`
**Verdict:** accepted

**Summary.** Accepted. This is an incremental re-review of the 8 lines changed in 7.8 since `f414bf7`, together with a check of the pull request's title and description against this head. The comparison with 6.3 now quantifies over the compactly supported smooth normal sections, which is the right test space for a Σ without boundary, and the description now states that comparison and its failing converse; both small corrections of the previous review are repaired, and every sentence of the title and description holds at this head. There are no findings and no small corrections; one format note is carried, not blocking. Four facts are left for the human reviewers, as before.

## N01 — The Lean statements of 4.2 and 5.1 do not assume the source surface Hausdorff

Carried; `Suggested.lean` is unchanged. `range_eq_plane_of_minimal_of_nonneg` and `exists_sq_mul_hessianCoordNormSq_le_lintegral` (`Suggested.lean` lines 55 and 89) carry `[TopologicalSpace S]` with no `[T2Space S]`, while the README's surfaces are Hausdorff. Both statements stay true; adding `[T2Space S]` would make the Lean and the README agree.

## Previous findings

- The previous report, of `f414bf7`, raised no finding (no R01).
- C01 (the comparison quantified over `Γ₀(ν_f)`, defined in 6.1 only for a compact Σ with boundary) — repaired: line 1697 now reads "`Q(V) ≥ 0` for every `V ∈ C^∞_c(Σ;ν_f)`, which is the stability of 6.3"; `Γ₀(ν_f)` remains only in 6.1 and 6.3 (lines 1192, 1196, 1217, 1273), where it applies.
- C02 (the description omitted the comparison with 6.3) — repaired: "Basic facts" now says that, for a minimal hypersurface, two-sided or not, stability across the singular set implies the stability of 6.3, and that the converse fails for the one-sided `ℝP² ⊂ ℝP³`.
- N01 — not repaired: `Suggested.lean` is unchanged; carried as N01.

## Verified sound

| Statement | Instance | Roadmap side | Computed side | Result |
|---|---|---|---|---|
| 7.8 comparison: the test space `C^∞_c(Σ;ν_f)` is that of 6.2 and 6.3 | Σ without boundary (7.8's standing hypothesis) | "the stability of 6.3" | 6.2 (line 1237) tests on `C^∞_c(Σ ∖ ∂Σ;ν_f)`; with `∂Σ = ∅` this is `C^∞_c(Σ;ν_f)`; index 0 iff stable (line 1239) | agrees |
| 7.8 comparison: stable in U ⇒ `Q(V) ≥ 0`; converse fails | `ℝP² ⊂ ℝP³`, `U = ℝP³` | implication holds, converse fails | 6.3: deck-odd eigenvalues `j(j+1) − 2`, j odd, minimum `2 − 2 = 0 ≥ 0`; ζ = 1: `(0 + 2)·2π = 4π > 0 = ∫|∇1|²` | holds; converse fails |
| the same, contrapositive, two-sided | `S²_eq ⊂ S³`, `V = ν` | 6.3-unstable ⇒ not stable in U | `Q(ν) = −2·4π = −8π < 0`; ζ = 1: `8π > 0 = ∫|∇1|²` | holds |
| step `Q(V)` = scalar form at `|V|`, with V compactly supported | `V = uν` locally, `u = x` near a zero | `|∇|V|| = |∇^⊥V|` a.e. | `|∇|x|| = 1 = |∇x|` off `x = 0`; both vanish a.e. on `{u = 0}`; `supp |V| = supp V` compact in Σ | holds |
| 6.3 form cited by the changed line (seeded sample target) | hypersurface, `V = φν` | `Q(V) = ∫(|∇^⊥V|² − (|A|² + Ric(ν,ν))|V|²)` | Chodosh line 2673–2679 (Theorem 23.4, p. 60): `∫|∇φ|² − |A|²φ² − Ric(ν,ν)φ²`, `φ ∈ C^∞_c(Σ)`; two-sided defined at line 2684 (§24, p. 61) | holds |
| Description: 6.1 locator "Theorem 23.2, … arbitrary codimension" | README line 1188 | [Chodosh, Theorem 23.2, p. 60] | Chodosh line 2663–2668: minimal `Σ^k`, normal field X, on the page headed 60 (line 2612) | holds |
| Description: cones over products of spheres "not stable for n ≤ 6 and strictly stable for n ≥ 7" | n = 3, 6, 7, 8 | `λ₁ + ((n−2)/2)² = (n² − 8n + 8)/4` | `−(n−1) + (n−2)²/4`: −7/4, −1, 1/4, 2 | holds |
| Description: cone criterion "exceeds / at least `−((n−2)/2)²`" | README lines 1723–1724 | strict iff `λ₁ + ((n−2)/2)² > 0`, stable iff `≥ 0` | Chodosh line 2840–2841 (Proposition 26.1, p. 64): stable iff `λ₀ ≥ −(n−2)²/4` | holds |

The diff changes no other statement; the rows for the untouched statements stand as in the previous review, of `f414bf7`.

- Source locators read against the text this round: 4, all in Chodosh (Theorem 23.2 and Theorem 23.4, p. 60; §24, p. 61; Proposition 26.1, p. 64). Of the 15 seeded sample targets only 6.3 is cited by the changed passage.
- Changed passage read against what cites it or is cited by it: 6.1 (lines 1190–1197), 6.2 (lines 1232–1241), 6.3 (lines 1262–1273), the paragraph before the items of 7.8, the one-sided Check (lines 1750–1751) and the *Needs:* line. None is made wrong.
- Cross-roadmap citations in the changed passage: none. No open pull request changes this roadmap, drops an id it cites, or cites an id it drops.
- Automatic checks: all pass on this head. The dependency check prints `depcheck: 132 roadmaps, 1466 edges, 0 problem(s)`, with no UPWARD or CYCLE line. Nothing outside the folder changes.
- Elaboration: `Suggested.lean` is unchanged; elaborated again, it gives five `sorry` warnings (lines 55, 89, 116, 138, 158) and nothing else; a single `import Mathlib`, two `TauCeti.*` imports, no `set_option`.
- Title and description against the head and against the change from the base (one heading added, 7.8; none removed or renumbered; no Lean declaration changed; no supplier added or dropped; two references added, [Simon21] and [Simon23], both named as "the sources" of 7.8): every sentence holds, and no change a reader must know of is unstated.

Overlap check: read GeometricCurrents, LorentzianGeometry, PDE, HeegaardFloer, ManifoldOptimization (open) and RiemannianGeometry, Surfaces, PositiveMass (main) as in the previous review; the change touches no owned object, and nothing is shared beyond what that review records (Simons' identity, the tangency principle and monotonicity are GeometricCurrents G6's; the linear elliptic theory is PDE's; Gauss–Bonnet is PositiveMass §3.1's; second variation and Schrödinger spectral theory are the parent's R5a–R5c). Stability across a singular set and strict stability are owned here alone.

Source independence: changed passages only; 1 passage compared with 1 source (Chodosh §§23–24), none shared: the changed sentence is part of an argument the source does not give; largest share Chodosh, 59 of about 167 locators, as in the previous review; the diff adds, removes or reorders no layer, so the arrangement was not compared again.

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
