# Review of HamiltonianReduction (pull request #2690 at 4ddef36)
Folder: `TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/`
**Verdict:** accepted

**Summary.** Accepted with no findings. This was an incremental re-review of the 58 lines changed since `6d61ae8`: the new statements (singular reduction for proper actions at locally closed orbits, the normal-subgroup stages identification, `TauCeti.Nil` as a Lie group) were recomputed and the eight new locators were read at the text; all hold, and the description agrees with this head. Two small corrections and two format notes remain, none blocking: the Huebschmann page numbers are those of the arXiv version, four sections of Layer 5 still have no locator, and two lists are incomplete. The licence note on Meinrenken's lecture notes is left for a human.

## C01 — The new Huebschmann page numbers are those of the arXiv version, while the reference entry gives the journal's pages 595–609

A reader holding the Mathematische Zeitschrift article cannot find "p. 5", "p. 8" or "p. 13" in it. The four locators added in Layer 5 (lines 1711–1712, 1761, 1799 and 1821) give pages 5, 5, 13 and 8; these are the pages of arXiv dg-ga/9411006v1, where (1.2.3) is on page 5, the paragraph on based gauge transformations on page 8 and Theorem 2.33 on page 13 (Huebschmann1995 lines 180, 302–306, 518). The entry in References (line 2152) names only "Math. Z. 220 (1995), 595–609".

Add to that entry "numbering and pages of arXiv dg-ga/9411006v1", as the Bates–Lerman entry already does.

## C02 — §§5.2–5.4 and §5.6 still carry no source locator

A reader cannot check the hypotheses of the Sobolev completions and Coulomb slice, the regularity of weak flat connections, the flat quotients and the central-curvature level against the literature. Lines 1628–1750 contain no theorem or page reference; the description says so itself. The rest of the earlier point is repaired (§3.0e, the normal-subgroup stages statement and §§5.5, 5.7, 5.9, 5.10 now have locators that I read at the text). I opened no candidate source for these four sections.

## N01 — The table of former labels repeats only part of the map in "How to read the build"

The table ending "Scope and ownership" (lines 1956–1965) has rows for the block labels and R3.1 only; R1a.k, R2a.k, R3.2 and R3's text before R3.1 are mapped only in the paragraph at lines 66–69. Add the four rows, or a sentence pointing to the paragraph.

## N02 — The References list does not name the locators added in this change

Meinrenken's Theorem 8.2, Cannas da Silva's §24.5 and Huebschmann's §1.2, §2 and Theorem 2.33 are cited in the layers but absent from the per-source locator lists (lines 2133–2153).

## Previous findings

The previous review, of `6d61ae8`, had no findings. Its small corrections and its format note:

- C01 — repaired: "For a proper action of a Lie group `G` and a coadjoint orbit `O` that is locally closed in `𝔤*`, construct the orbit-type pieces of `μ⁻¹(O)`" (line 1478); compact `G` at zero is named as the special case.
- C02 — partly repaired: §3.0e cites Meinrenken, Theorem 8.2 and Cannas da Silva, §24.5; §3.0c states the normal-subgroup identification; §§5.5, 5.7, 5.9, 5.10 cite Huebschmann; §§5.2–5.4, 5.6 have none. Carried as C02.
- C03 — repaired: "Prove that Tau Ceti's `TauCeti.Nil` … is an analytic Lie group: its product and its inversion … are polynomial" (line 883); *Needs* names `TauCeti.Nil`, `TauCeti.Nil.toHeisenberg`.
- C04 — repaired: the description now says the two anchors "are kept" and that "a table ending "Scope and ownership" repeats it for the block labels".
- N01 — not repaired: the table has the same eight rows; carried as N01.

## Verified sound

| Statement | Instances tried | Values computed (README side / independent side) | Result |
|---|---|---|---|
| §2.6 `TauCeti.Nil` is a Lie group | product and inverse at the pin (`Nil/Basic.lean` 169, 173, 204); bracket | `(x,y,z)(−x,−y,−z+xy) = (0,0, z−z+xy−xy) = 1`; commutator z-part `ay − xb`, so `[X,Y] = Z`; no `LieGroup` instance at the pin | holds; target is new, not a duplicate |
| §3.0c stages for a closed normal `N` (sample) | `μ̄` on `μ_N⁻¹(0)/N`; `N`-invariance; `T*U(2)` | `μ(nx) − μ(x)` pairs `μ(x) ∈ 𝔫⁰` with `Ad_n⁻¹ξ − ξ ∈ 𝔫`: 0; `μ̄ = 0 ⇔ μ = 0`, so `μ̄⁻¹(0) = μ⁻¹(0)/N`; `8 − 6 = 2`, then a point | holds |
| §3.0e regular value and stabilizers | Meinrenken 8.2; weights `(k,1)` | `ran dμ_x = ann(𝔤_x)`, onto iff `𝔤_x = 0`; `𝔤_x ⊆ 𝔤_c`; stabilizer `ℤ/k` on `z₂ = 0`, trivial elsewhere | holds |
| §3.2 singular reduction, proper actions (sample) | Bates–Lerman Thm 7, Cor 14, Thm 15; weights `(1,−1)` at 0; non-embedded orbit | source: proper, equivariant, `O` locally closed, pieces symplectic, inclusions Poisson, local model `V` reduced at 0 by `G_x`; strata `{0}`, `ℂ∖{0}`; shift map `x ↦ (x, μ(x))` continuous only for embedded `O` | holds |
| §5.5 pairing and `H² ≃ (H⁰)*` | Huebschmann (1.2.3); `U(1)` | pairing `H^j ⊗ H^(2−j) → ℝ` nondegenerate, symplectic on `H¹`; `h¹ = (2g−2)·1 + 2 = 2g` | holds |
| §5.7 stabilizer Lie algebra | Huebschmann §1.2 | `ker d_A` on 0-forms is `Lie(Z_A) = H⁰_A` | holds |
| §5.9 trivial residual action gives a manifold chart | Huebschmann Thm 2.33 | stabilizer trivial on `H¹_A` ⇒ quadratic moment map `½[η,η]_A` zero ⇒ reduced model is `H¹_A` | holds |
| §5.10 based gauge group acts freely | Huebschmann p. 8 (arXiv) | evaluation at the base point: kernel the based group, stabilizer injects into `K` | holds; C01 for the page numbering |
| `exists_mem_normalizer_Ad_eq`, `isConnected_stabilizer_coadjointRepresentation` | elaborated types | unchanged; compact, connected, Hausdorff, finite-dimensional binders present | as in the previous review |

The rows for all other statements stand as in the previous review, of `6d61ae8`.

- Source locators read at the text: 8 — Meinrenken2024 Theorem 8.2 (lines 3673–3681); CannasDaSilva2001 §24.3 closing sentence and §24.5 (lines 5853–5855, 5877–5908); BatesLerman1997 Theorem 7 and the remark after it, Corollary 14, Theorem 15 and its sequel (lines 312–330, 601–604, 651–658, 684–725); Huebschmann1995 §1.2 with (1.2.3), p. 8, Theorem 2.33 (lines 160–185, 302–306, 515–520). Hypotheses agree with the README in each case.
- Library declarations opened at the pin: `TauCeti/Geometry/Manifold/Riemannian/Nil/Basic.lean` 92–111 (type, charts, `IsManifold`), 169–200 (product, inverse, group), 204 (`toHeisenberg`); no `LieGroup` instance in that folder or in `TauCeti/GroupTheory/SpecificGroups/Heisenberg.lean`.
- Cross-roadmap citations in the changed passages: SmoothBundlesConnections §B1.4, LieGroupoidsPoisson §§G0.0, G3.4, G3.5, Orbifolds O1.4, O2, AlgebraicTopology §6.4, all unchanged and resolved in the previous review. CotangentLagrangian §§4.1–4.3, 4.7 are defined only by its open revision, which the description names as merging first. No other open pull request changes this roadmap or drops an id it cites.
- Dependency check: `depcheck: 182 roadmaps, 2075 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: the two `sorry` warnings only; the file is unchanged since `6d61ae8`, so the padding probe and the headline list stand as before.
- Description against this head: Huebschmann in §§5.5 and 5.7–5.10 and none in §§5.2–5.4, 5.6 (confirmed); 68 Checks (counted); §3.2 at Bates–Lerman's generality; `Nil` in §2.6; both anchors present (lines 109, 689); `Mathlib` and four Tau Ceti imports; the supplier roadmaps are those the description lists. No sentence contradicted.
- Changes outside the folder: none.
- Overlap check: read ConvexityToric (main), GeometricQuantization (main), the SymplecticGeometry index (main), IntegrableSystems and CotangentLagrangian (main and open revisions); nothing shared. No roadmap on main or open plans a Lie group structure on `TauCeti.Nil` or on the real Heisenberg group.

Source independence: changed passages only; 8 passages compared with 4 sources, none shared beyond formulas and standard names; largest share CannasDaSilva2001, 10 of 40 locators; no layer added, removed or reordered, so the contents comparison stands as in the previous review: independent.

Research link: Layer 1a is Banyaga's flux theorem (1978); Layer 3's normal form and singular reduction are Bates–Lerman (1997); Layer 2a is Bott's Morse theory of orbits (1956); Layer 5's local model is Huebschmann (1995), after Atiyah–Bott. Rests on the README's references and the texts read.

## Not verifiable

- Nothing in the changed passages. Banyaga1978 and Bott1956 were outside this round and were not reread.

## Source issues

- none

## For the human reviewers

- Licence and status: Meinrenken2024 is unpublished lecture notes on the author's Toronto page (README References). It carries 9 of the 40 locators, including the general-group statements of regular reduction and of the Kirillov–Kostant–Souriau theorem.
