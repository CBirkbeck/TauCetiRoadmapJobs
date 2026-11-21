# Review of MinimalSurfaces (pull request #2491 at 7583884)
Folder: `TauCetiRoadmap/RiemannianGeometry/MinimalSurfaces/`
**Verdict:** accepted

**Summary.** Accepted. This is an incremental re-review of the 41 lines of 7.8 changed since `cd32a39`: stability and strict stability are now defined without two-sidedness, and the change is mathematically sound (the forms do not see the sign of ν, the one-sided notion does imply the stability of 6.3, and `ℝP² ⊂ ℝP³` separates the two). There are no findings, two small corrections (the description still says "two-sided"; the Euclidean case is attributed to a source whose hypersurface is oriented) and two format notes. Four facts are left for the human reviewers, as before.

## C01 — The description still says the definitions are for a two-sided hypersurface

The description's first bullet reads "For a two-sided hypersurface without boundary in any Riemannian manifold, the stability form tested on ambient functions…". At this head 7.8 defines stability in U and strict stability for a hypersurface "not necessarily two-sided" (README line 1666), and two-sidedness is assumed only in the variational-meaning item (line 1691). A reader of the description would take the one-sided case to be excluded. Text that would be right: "For a hypersurface without boundary, two-sided or not, in any Riemannian manifold, … ; two-sidedness is assumed only where the form is identified with the second variation of area."

## C02 — The Euclidean case is attributed to Simon's 1.2, which is stated for an oriented hypersurface

After the definitions, line 1683 says "The Euclidean case, `Ric = 0` and μ the Hausdorff measure, is [Simon23, 1.2, pp. 3–4]". Now that the definitions admit one-sided Σ, the Euclidean case is wider than what the source states: Theorem 1.1 there takes a smooth oriented embedded hypersurface, and the note with 1.2 uses a smooth unit normal for it (Simon23 lines 91 and 113). One clause repairs it, for instance "for an oriented hypersurface, the Euclidean case … is [Simon23, 1.2, pp. 3–4]".

## N01 — The claim that the scalar notion is stronger on a one-sided Σ has no argument

Line 1688 says the definitions "are stronger than the stability of 6.3 (Checks)" on a one-sided Σ, but the Check only shows that the two differ. The implication is true and takes one line, which would be worth adding: for a τ-odd compactly supported φ̃ on the double cover, `|φ̃|` is τ-even and Lipschitz, descends to Σ, and `Q(φ̃) = Q(|φ̃|) ≥ 0`.

## N02 — The Lean statements of 4.2 and 5.1 do not assume the source surface Hausdorff

Carried from the previous review; `Suggested.lean` is unchanged. `range_eq_plane_of_minimal_of_nonneg` and `exists_sq_mul_hessianCoordNormSq_le_lintegral` (`Suggested.lean` lines 55 and 89) carry `[TopologicalSpace S]` with no `[T2Space S]`, while the README's surfaces are Hausdorff. Both statements stay true; adding `[T2Space S]` would make the Lean and the README agree.

## Previous findings

- The previous report, of `cd32a39`, raised no finding (no R01) and no small correction. Its one format note, on `[T2Space S]`, is not repaired (`Suggested.lean` is unchanged) and is carried as N02.

## Verified sound

| Statement | Instance | Roadmap side | Computed side | Result |
|---|---|---|---|---|
| 7.8 definitions without a global normal | ν ↦ −ν | forms independent of the sign of ν | `A ↦ −A`, so `|A|²` unchanged; `Ric(−ν,−ν) = Ric(ν,ν)`; agrees with 6.3 line 1264–1266 | holds |
| 7.8 "stronger than the stability of 6.3" on one-sided Σ | τ-odd φ̃ on the double cover Σ̃ | scalar stability implies 6.3 stability | `|φ̃|` τ-even, Lipschitz; `Q_Σ̃(φ̃) = Q_Σ̃(|φ̃|) = 2Q_Σ(|φ|) ≥ 0`; `C¹` tests admissible by the next item | holds; N01 |
| 7.8 Check, one-sided | `ℝP² ⊂ ℝP³`, `U = ℝP³`, ζ = 1 | `2·2π > 0`; stable in 6.3's sense | `|A|² = 0`, `Ric(ν,ν) = 2`, area `4π/2 = 2π`: `4π > 0 = ∫|∇1|²`; odd modes `j(j+1) − 2 ≥ 0`, j = 1 gives 0 | holds |
| 7.8 variational meaning, two-sided only | `ℝP²`, ζ = 1; `S²_eq ⊂ S³`, ζ = 1 | needs a global ν | on `ℝP²` ζν is not a global field (6.5); on `S²_eq`, `Q(1) = −2·4π = −8π`, the second variation | holds |
| 7.8 cone criterion under the wider definition | Γ closed embedded in Sⁿ; `C_(p,q)` | unchanged | each component of Γ separates Sⁿ, so C is two-sided; `λ₁ + ((n−2)/2)² = (n²−8n+8)/4`: n = 6 gives −1, n = 7 gives ¼ | holds |
| 7.8 Reduction under the wider definition | `λ = ¼`, `c₀ = 6` | `κ = ½min(λ,(1+c₀/λ)⁻¹)` | `½min(¼, 1/25) = 1/50`; the route uses only `|A|² + Ric(ν,ν)`, no normal | holds |

The rows for the untouched statements stand as in the previous review, of `cd32a39`.

- Source locators read against the text this round: 2, both in Simon23 (arXiv:2101.06401v2): Theorem 1.1 with the note 1.2 (lines 89–119) and 4.12 (lines 864–870). None of the 15 seeded sample targets falls in the changed passages.
- Changed passages read against the rest of the README: the MS7 scope bullet (line 51), the scope sentence on 7.8 (line 112), the convention on two-sidedness (line 123), the Layer 7 guide (line 388), 6.3 (lines 1260–1302), 6.5 (lines 1343–1358), and all of 7.8. None contradicts the change; no sentence still says the definitions assume two-sidedness.
- Cross-roadmap citations in the changed passages: none new. No roadmap on main or open cites 7.8; no other roadmap defines stability across a singular set or strict stability (Varifolds, line 1845 of its README, mentions Simon's strict stability and leaves it out).
- Automatic checks: all pass on this head. The dependency check prints `depcheck: 172 roadmaps, 2000 edges, 0 problem(s)`, with no UPWARD or CYCLE line. Nothing outside the folder changes, against the base or since `cd32a39`.
- Elaboration: `Suggested.lean` is byte-identical to the file the previous review probed; it gives five `sorry` warnings and nothing else. The elaborated types of its seven declarations were compared with the README statements again; no binder is lost.
- Description against the head: one sentence is out of date (C01); the others hold (one heading added, 7.8; `Suggested.lean` unchanged; no supplier added or dropped; no layer removed or renumbered against the merge base).

Overlap check: read GeometricCurrents, LorentzianGeometry, PDE, HeegaardFloer, ManifoldOptimization (open) and RiemannianGeometry, Surfaces, PositiveMass (main) as in the previous review, and searched every roadmap, on main and open, for the objects the change touches; nothing shared beyond what the previous review records (Simons' identity, the tangency principle and monotonicity are GeometricCurrents G6's; the linear elliptic theory is PDE's; Gauss–Bonnet is PositiveMass §3.1's; second variation and Schrödinger spectral theory are the parent's R5a–R5c). Stability across a singular set and strict stability are owned here alone.

Source independence: changed passages only; 4 passages compared with 1 source (Simon23), none shared beyond formulas and standard terms; largest share Chodosh, 59 of about 167 locators, as in the previous review; the diff adds, removes or reorders no layer, so the arrangement was not compared again.

Research link: Layers 8–12 reach the Choi–Schoen compactness theorem (1985); 7.4–7.5 give Schoen's curvature estimate (1983) by Lynch's route (2026 preprint); 7.8 is the strict stability of Simon (2021, 2023), used there for hypersurfaces with prescribed singular set. Rests on the README and on Simon21 and Simon23, which were read.

## Not verifiable

- [CM] (AMS GSM 121), [ChoiSchoen] and [SY] (Springer), [Simons] (JSTOR) and [Schoen] (Annals of Mathematics Studies 103): no legal copy, as in the previous review; none is cited in a changed passage.

## Source issues

- **Misprint** in Simon23 at the note after 1.2, p. 4: the source says the left side of 1.2 is the second variation of area; it should be the right side; affects nothing.

## For the human reviewers

- Licence: [Chodosh] is read from the author's Stanford page (web.stanford.edu/~ochodosh), a host the sources service does not classify; it was treated as an author page.
- Scope: the route of 7.4 follows [Lynch], an unrefereed preprint (arXiv:2611.12758v1, 2026; README lines 376 and 1527). The theorem it serves, 7.5, is Schoen's published estimate.
- Scope: no item of this roadmap consumes 7.8 (README lines 1746–1747 and 1764–1765); the uses its sources name are Simon's (Simon21, Simon23).
- Not tested: [CM] has the second-largest share of the locators (about 31 of 167) and no legal copy, so wording and arrangement were not compared with it.
