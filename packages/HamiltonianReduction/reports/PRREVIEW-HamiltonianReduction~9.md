# Review of HamiltonianReduction (pull request #2690 at b9dc79a)
Folder: `TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/`
**Verdict:** accepted

**Summary.** Accepted with no findings. This was an incremental re-review of the 35 lines changed since `34c2afa`: the Weyl-relatedness statement of §R2.4 without connectedness of the group was recomputed and holds for the library's notion of maximal torus, the exponent range added to the Coulomb-gauge theorem of §R5.3 agrees with the source, and the description was read against this head and states every change it has to. No small correction and one format note (the References list still omits some locators the layers cite), not blocking. The status of Meinrenken's lecture notes is left for a human, as before.

## N01 — The References list omits some locators that the layers cite

Meinrenken's Theorem 8.2 (§R3.0e), Cannas da Silva's §24.5 (§R3.0e), Huebschmann's §1.2 with (1.2.3), §2 and Theorem 2.33 (§§R5.2, R5.5–R5.7, R5.9, R5.10), the remark after Definition 4.28 of Alexandrino–Bettiol (§R2.4) and page 8 of Bates–Lerman (§R3.2) are cited in the text and absent from the per-source lists (README lines 2272–2299).

## Previous findings

The previous review, of `34c2afa`, had no findings. Its small corrections and format note at this head:

- C01 (Feehan's theorem restated with no range for `q`) — repaired: "a `W^(1,q)` connection, `1 < q < ∞`, on the unit disc whose curvature is small in `L^(s₀)`, `s₀ > 1`" (README line 1817); the source has `q ∈ [p, ∞)`, `1 < p < 2` in dimension two.
- C02 (description silent on supplier changes, main's two unnumbered sections and the thirteen removed declarations) — repaired: the description now lists each dropped and each new supplier, says where the two sections' content went, and names the thirteen declarations.
- C03 (connectedness of the group unused in `exists_mem_normalizer_Ad_eq`) — repaired: "for a compact Lie group `K`, connected or not" (README line 952); the `[ConnectedSpace G]` binder is gone from that theorem and the source is cited "for connected `K`".
- N01 (References list omits cited locators) — not repaired: the per-source lists are unchanged; carried as N01.

## Verified sound

| Statement | Instances tried | Values computed (README or Lean side / independent side) | Result |
|---|---|---|---|
| `exists_mem_normalizer_Ad_eq`, §R2.4, without `[ConnectedSpace G]` | finite `K`; `O(2)`; `T² ⋊ ℤ/2` (swap); `SU(2)`, `X = diag(i, −i)` | `𝔱 = 0`, `n = 1`; `Ad_g X = −X`, `n = g ∈ N(T) = O(2)`; `(a,b) ↦ (b,a)` by the swap, which normalizes `T²`; `n = [[0,1],[−1,0]]`, no `n ∈ T` | holds |
| The route of §R2.4 for disconnected `K` | each step | `T ⊆ Z_K(Y)` since `Y ∈ 𝔱`, `T` abelian; `Y = Ad_g X ∈ Ad_g 𝔱`, so `g T g⁻¹ ⊆ Z_K(Y)`; both connected, so in `Z_K(Y)⁰`; maximal in `K` gives maximal there; `Ad_(cg) X = Ad_c Y = Y` | connectedness of `K` not used |
| The carrier of the Lean statement | `Lie.IsMaximalTorus` at the pin | `Maximal IsTorus T`, a torus being a compact connected commutative subgroup (`Geometry/Lie/Subgroup/Torus.lean` 82–89): no connectedness of `G` in the definition | the intended object |
| `isConnected_stabilizer_coadjointRepresentation`, §R2.5 (docstring line changed only) | `O(2)`, `ν = 0` | stabilizer `O(2)`, disconnected: the `[ConnectedSpace G]` binder is needed and is present (line 77); module docstring now says "if `G` is connected" | holds |
| Gauge theorem cited in §R5.3 | Feehan Theorem 2.3 at `d = 2` | README: `1 < q < ∞`, `s₀ > 1`; source: `q ∈ [p, ∞)`, `1 ≤ p < 2` and `p > 1`, `s₀ > 1`; every `q > 1` is reached with `p = min(q, 3/2)` | agrees |
| Citation "for connected `K`" in §R2.4 | Alexandrino–Bettiol after Definition 4.28 | source defines `W = N_𝔱 / Z_𝔱` and says its orbits in `𝔱` are the traces of adjoint orbits, in its standing compact connected setting; `N_𝔱 = N_K(T)` since `T = exp 𝔱` | supports the statement as scoped |

The rows for the statements the change does not touch stand as in the previous review, of `34c2afa`.

- Source locators checked at the text: 2 (Feehan2020 lines 765–783; AlexandrinoBettiol2010 lines 3556–3563).
- Library declarations opened at the pin: `Geometry/Lie/Subgroup/Torus.lean` 82–89 (`IsTorus`, `IsMaximalTorus`), `Geometry/Lie/Subgroup/LieAlgebra.lean` 277 (`lieSubalgebraOfSubgroup`), `Geometry/Lie/Adjoint/Derivation.lean` 62 (`Ad`). No theorem of the pinned Tau Ceti states conjugacy under the normalizer; no other roadmap, open or on main, states it.
- Automatic checks: all passed when run again. Elaboration of `Suggested.lean`: two `sorry` warnings only. Elaborated type of `exists_mem_normalizer_Ad_eq` compared with §R2.4: compact, Hausdorff, finite-dimensional, no connectedness, in both. One-tactic probe on it (`rfl`, `simp`, `infer_instance`, `simp_all`, `aesop`): does not close.
- Dependency check: `depcheck: 133 roadmaps, 1479 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- The description against the head: layer ids and new subsection numbers match the headings (45 numbered subsections, 7 layers each ending with Examples and Dependencies); the suppliers it lists as dropped (IntegrableSystems I2.0, RootSystems, CompactGroups, SpinRepresentations, HamiltonianSystems, LieGroupoidsPoisson G0.1 and G4.2a, CotangentLagrangian C1–C2) are not consumed at the head, and MorseNovikov §6.4 and DeRhamCohomologyAndDuality are; the suppliers of analysis and topology were on main under abbreviations; CotangentLagrangian §§4.1, 4.3, 4.7 agree with the supplier contract; the open CotangentLagrangian revision is named in the merge-order paragraph.
- Changes outside the folder: none. The diff adds, removes and reorders no layer.
- Overlap check: read ConvexityToric, GeometricQuantization, SymplecticGeometry (main) and the open IntegrableSystems, HamiltonianSystems, CotangentLagrangian, ContactGeometry heads in the review of `34c2afa`; the change adds no object and the widened statement of §R2.4 was searched for in all open and main roadmaps; nothing shared.

Source independence: changed passages only; 2 passages compared with 2 sources, none shared beyond a twelve-word statement the mathematics forces (the Weyl orbits as traces of adjoint orbits); largest share CannasDaSilva2001, 12 of 46 citations; contents not compared again, the diff changes no layer.

Research link: R1a is the flux theorem of Banyaga (1978); R2a the Morse theory of adjoint orbits of Bott (1956); R3.1–R3.2 the normal form and singular reduction of Bates–Lerman (1997); R5 the local model of Huebschmann (1995, 1996) for Atiyah–Bott's moment map. Rests on the README's references and the texts read.

## Not verifiable

- Banyaga1978 is an OCR text: the heading of Lemme III.6.1 is not legible in it, so the end of the range "pp. 221–223" was not confirmed (as in the previous review).
- Huebschmann1995 §§2.18–2.32, cited in §R5.8 as the construction to follow, was located and not compared step by step (as in the previous review).

## Source issues

- none

## For the human reviewers

- Licence and status: Meinrenken2024 is unpublished lecture notes on the author's Toronto page (README References). It carries 10 of the 46 citations, including the general-group statements of regular reduction (Theorem 8.3) and of the Kirillov–Kostant–Souriau theorem (Theorem 7.25).
- Status: AlexandrinoBettiol2010, OrtegaRatiu2005 and Feehan2020 are cited in their arXiv versions, with that numbering (README References); the two `Suggested.lean` theorems rest on the first.
