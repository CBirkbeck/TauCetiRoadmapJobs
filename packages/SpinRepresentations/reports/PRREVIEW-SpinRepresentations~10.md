# Review of SpinRepresentations (pull request #1207 at c87113d)
Folder: `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/`
**Verdict:** accepted

Incremental re-review of the 60 lines changed since `3a07d42` (README only), and of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: `README.md:1440–1458` “The topology and the kernel of the ambient action are native … `isClosed_lipschitzGroup` … `continuous_cliffordNorm` … `continuous_lipschitzToOrthogonal` … `mem_ker_lipschitzToOrthogonal_iff` … Consume these.”; the six names are in the *Needs* at 1492.
- R02 — repaired: `README.md:1033–1036` “native `CliffordAlgebra.complexConj_reverse_eq_coe_inv` gives `g†=(conj g)⁻¹`”; 1135–1142 “restriction to the closed Spin subgroup of native `AlgHom.unitsSmoothHom`”; line 249 and the §9.2 *Needs* (2078) name the four Kostant declarations.
- R03 — repaired: the `roadmap-summary` block of the description now names all ten theorems, including `simplyConnectedSpace_spinGroup_of_three_le_finrank` and `cliffordFullCoverToOrthogonal_surjective_and_card_ker`.

## Verified sound

| Statement / target | Instances tried | Left side computed | Right side / control | Result |
|---|---|---|---|---|
| §7.2 `cliffordFullCoverToOrthogonal_surjective_and_card_ker`, rescaling route | lift x with reverse norm c=−4; `Cliff(0,1)`; dim 0 | r=\|c\|^(−1/2)=½; norm of rx is r²c=−1; rx acts as x | scalars in cover: r²=±1 gives r=±1; −1=(−v)v⁻¹ needs an anisotropic v; dim 0 Lipschitz group trivial, excluded by `hV` | True; surjectivity from `CartanDieudonne.lean:54`, kernel from `Kernel.lean:74` |
| §7.2 closedness and continuity | `Cliff(0,1)`: Lipschitz group `ℝˣ ∪ ℝˣe` | norms a², −b²; preimage of ±1 is {±1,±e} | closed in `ℂˣ`; `OpenMap.lean:60` (nondegenerate, finite-dimensional), `Norm.lean:34` (complete normed field) | Agrees; hypotheses hold over ℝ |
| §7.2 openness on the cover | U open in cover, ρ(x)=\|N x\|^(−1/2)·x | π∘ρ=π, ρ restricted to cover is id, so π(U)=π(ρ⁻¹U) | ρ⁻¹U open in the Lipschitz group; `OpenMap.lean:88` needs locally compact σ-compact K: ℝ | Open; finite kernel {±1} gives a covering map |
| §2.3 unitarity criterion | `Spin₂(ℂ)≅ℂˣ`, z=2 and z=exp(iθ) | `g†↦z̄`; `(conj g)⁻¹↦z̄`; `g†g=1` iff \|z\|=1 | `conj g=g` iff `z̄⁻¹=z` iff \|z\|=1 | Agrees with `Spin/Complexification.lean:48` |
| §3.2 smooth Fock representation | f = `spinAction` over ℝ; rank 1 | differential in algebra coordinates is f itself (`AlgebraHom.lean:61`); rank 1 Lie algebra 0 | −1 acts by −1 on the group, not seen by the differential | Consistent with the section's Checks; compact case `Spin/Representation.lean:67,95` on `realCliffordForm n 0` |
| §9.2 Kostant coordinate formulas | sl₂ with basis e,f,h | coefficient ¼ over a basis and its Killing dual; pairing α with −α doubles to ½ over positive roots | `Coordinates.lean:175` (¼), `RootWeights.lean:146` (½, `CharZero`, triangularizable Cartan), `RootWeights.lean:232` (weight χ+μ) | README wording equals the pinned statements |

The rows for all untouched statements stand as in the previous review, of `3a07d42`.

- Library (pins unchanged): 17 declarations named by the changed passages opened at the pin; all exist with the namespaces and hypotheses the README gives (`Lipschitz/OpenMap.lean:60,88`, `Lipschitz/Norm.lean:34`, `Lipschitz/Action.lean:145`, `Lipschitz/Kernel.lean:74`, `CartanDieudonne.lean:54`, `Lipschitz/FullCover.lean:45,58`, `Spin/Complexification.lean:48`, `Topology/Algebra/CliffordAlgebra/Complexification.lean:33`, `Spin/BaseChange.lean:233`, `Geometry/Lie/AlgebraHom.lean:44,61`, `Geometry/Lie/CliffordAlgebra/Spin/Representation.lean:67,95`, `Quadratic/Lie/Coordinates.lean:175`, `RootWeights.lean:146,232`, `LeftRegular.lean:139`).
- Sources: 3 locators in the changed passages read again: `gallier2008 line 934` (Definition 1.6, p. 31), `line 1203` (Proposition 1.21, p. 39), `line 1322` (Theorem 1.24, p. 43); each supports the statement as written.
- Cross-roadmap citations: the diff adds none; LieGroups Layers 0–3 in the two changed *Needs* lines resolve on main as before.
- Gate at `c87113d`: every check passed (all counters 0, build included). Dependency check: `depcheck: 246 roadmaps, 2235 edges, 0 problem(s)`; no UPWARD or CYCLE line. The pull request changes no file outside this folder.
- Elaboration: `Suggested.lean` (unchanged since `3a07d42`) elaborates with 10 `sorry` warnings and nothing else; ten theorems and the one definition `kostantSpinRep`, as the description says.
- Description against the head: revision of a roadmap on main; Layers 0–9 kept; the mappings “L0.Bogoliubov is §0.1” (`README.md:828`) and 8A–8D ↦ §§8.1–8.4 (1601, 1679, 1834, 1929) are in the README; DGFloer and UniversalCovers occur nowhere in it; Layer 2 is §§2.1–2.3; the four not-statable headlines match the module docstring. No sentence contradicted, no removal or supplier change left unstated.
- Duplication: the change replaces planned proofs by citations of pinned declarations and adds no object; no new owner question.

Overlap check: read OrthogonalSpinGroups, LieHighestWeight, SpinGeometry (the closest-roadmap lists as in the previous review; the diff adds no object); nothing newly shared. Owners unchanged: general-field spinor norm, OrthogonalSpinGroups; generic highest weights, LieHighestWeight; the negative-form group comparison, native.

Source independence: changed passages only; 4 passages compared with 1 source (gallier2008), none shared; largest share gallier2008, 4 of 21 locator sites; no layer added, removed or reordered, so the contents comparison stands as before: independent. The contents of Lawson–Michelsohn and Fulton–Harris could not be read.

## Not verifiable

- Lawson–Michelsohn, Theorems I.2.10 and I.4.3, Tables I–II, §I.2: not in the manifest or the sources cache.
- fultonharris1991, Lectures 19–20: settled uncertified.
- kostant1997, Proposition 28 and Theorems B, 35, 40: settled uncertified; read only as reported in `bazlov2008`.

## Source issues

- none

## For the human reviewers

- Not tested: Lawson–Michelsohn (3 of 21 locator sites) and Fulton–Harris Lectures 19–20 could not be read; wording and arrangement were compared only with the seven readable texts.
- Licence: `shlyakhtenko2026` is an unrefereed 2026 preprint (arXiv:2606.28648v1), cited for the motivating CAR instance of §9.3, whose statements are native Tau Ceti theorems.
