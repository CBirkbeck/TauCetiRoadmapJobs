# Review of DGFloer (pull request #1798 at 4144d77)

**Verdict:** accepted

**Summary.** Accepted: no finding. The folder is unchanged since the head the previous review accepted, so this round read the pull request's title and description against the head and against the change from main: every sentence checked holds (the suppliers dropped and added, the moved items and their numbering note, the sections of AlgebraicTopology on main, the imports and headline statements of `Suggested.lean`), and the earlier small correction to the **Shape** paragraph is made. Two format notes remain, neither blocking; three points are left to the human reviewers, as before.

## N01 — Five layer headings lack a preceding blank line, and one line of the guide is unwrapped

`## Layer 0`, `## Layer 4`, `## Layer 7`, `## Layer 9` and `## Layer 10` (`README.md` lines 234, 904, 1752, 3157, 3321) follow the last line of the previous section directly, and line 75 of "How to read the build" runs to about 160 characters where the rest is wrapped near 100. Both render correctly; a blank line before each heading and a rewrap would restore the file's own style.

## N02 — The description's generated `depends-on` block names AdicSpacesPartIII as a supplier, which the README never cites

The block lists "#1807 AdicSpacesPartIII" (ticked) under "Depends on", while the README names no AdicSpaces roadmap anywhere and the prose beside it says, correctly, "This pull request waits for nothing". The entry is harmless (that roadmap is on main) but a reader takes it for a supplier; regenerating the block would drop it.

## Previous findings

- The previous report had no finding (no R-numbered point).
- C01 (small correction) — repaired: the **Shape** paragraph now reads "an opening overview with the headline theorems, how to read the build, conventions, layers … scope and ownership with the numbering note, exact supplier contracts, and references", the order of the head.
- N01 (format note) — not repaired: the folder is unchanged; written again above as N01.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 11.3 torus criterion (cited by the description's **Shape** and **Suggested.lean** paragraphs) | `G = 1`; `T²`; `SU(2)`; `SO(3)` | `r = 0`: aspherical and torus; `π_n(T²) = 0`, `n ≥ 2`, and `r = 2`; `π₃ = ℤ ≠ 0` and nonabelian, both sides fail, twice | holds in both directions | none |
| 1.4 mod-2 vanishing (cited by the description's summary as a headline) | `S²`; Moore space `M(ℤ/3, 2)`; point | `H₂(S²; ℤ/2) = ℤ/2 ≠ 0`, hypothesis fails, doubling on `π₂ = ℤ` not onto; `H̃_*(−; ℤ/2) = 0`, doubling on `π₂ = ℤ/3` bijective; trivial | holds; hypothesis fails where the conclusion fails | none |

The rows for all other statements stand as in the previous review, of `4144d77`; the folder has not changed since.

- Change since the head the previous review read: 0 lines in the folder; nothing changed outside it (the pull request's diff against main outside `TauCetiRoadmap/DGFloer/` is empty).
- Description checked against the head and main, sentence by sentence: TangentialBordism, HomotopySpheres, ImplicitAtlases and HamiltonianSystems occur 2, 7, 3 and 4 times in main's README and 0 times at the head; GeneralizedCohomology, ComplexKahlerGeometry and CotangentLagrangian occur at the head once each, as a consumer (line 3787–3788) or as "not consumed here" (line 4127); ContactGeometry occurs 0 times on main and 5 at the head, each time as CG4. The other roadmap names new at the head (StringOrientation, StableHomotopyKTheory, GeometricCurrents, HamiltonianFloerOperations, FukayaTheory, TopologicalKTheory, SeibergWittenTheory, ReductiveGroups, BordismFormalGroups) are consumers or "not consumed" rows, so no new supplier is left unstated.
- Cross-roadmap citations resolved on main for the description: AlgebraicTopology §4.8 (compact generation, line 1114), §4.10 (line 1220), §5.0 (line 1300), §5.5 (line 1505), §8.8c (line 3482), §8.8d (line 3577); StringOrientation cites DGFloer Layer 11 item 3 (its `README.md` lines 52, 340, 521), which the numbering note (head `README.md` lines 4107–4109) keeps; on main the finite cover is Layer 11 item 3, as the description's "keeps" says. DGFloerPartII is an open new roadmap, as stated.
- Numbering note (`README.md` lines 4061–4109) read against the description's lists of moved ids: Layer 1 items 2–4, 7, 8; Layer 5 item 7; Layer 10 item 5; Layer 11 items 1–6; G0–G7; Layer 0 items 1–3, Layer 3 items 2–4, Layer 4 items 1–4: all present with the targets the description gives.
- `Suggested.lean`: `import Mathlib` and four `TauCeti.*` modules (lines 3–7), seven theorems, docstring names Theorems L, M, J, K, the fibration theorem, the Arnold bound and the Floer–Novikov torsion as not statable (lines 45–63): as the description says. The twenty declarations removed against main are the cubical-chain, Moore-path and twisting-cocycle items the description says became supplier contracts.
- Elaboration of `TauCetiRoadmap/DGFloer/Suggested.lean`, rerun: seven `sorry` warnings (lines 83, 109, 142, 165, 195, 218, 244), nothing else.
- Dependency check, rerun: `depcheck: 199 roadmaps, 2190 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The automatic checks, rerun, all pass.
- Overlap facts at this round: no other open pull request changes this roadmap, no cited id is dropped by an open pull request, and this pull request drops no id that other roadmaps cite without a mapping.

Overlap check: read DGFloerPartII, HeegaardFloer, HamiltonianSystems, AnalyticStableMaps and MorseNovikov (open) and FukayaTheory, HamiltonianFloerOperations and HeegaardFloer (main), as in the previous review; the folder is unchanged and the owners stand. Moved applications: DGFloerPartII, by the numbering note. Lagrangian polygon operations: FukayaTheory. Capped branch 7.C: here, consumed by HamiltonianFloerOperations. Stable-map compactness: AnalyticStableMaps. Hamiltonian vector fields of weak forms, Poisson bracket and symplectic flows beyond the pins (6.0): here; the open HamiltonianSystems plans the same objects (reported to the human reviewers).

Source independence: changed passages only: no passage of the folder changed, so 0 passages were compared with 0 sources this round; the previous review's comparison stands (18 passages with 4 sources, none reproduced; largest share `bdho-cotangent`, 28 of 53 line-cited locators; contents compared with `bdho-cotangent`: independent).

Research link: The headline targets are Theorems A, C, J, K, L and M of Barraud–Damian–Humilière–Oancea (2024), built on their DG Morse homology (2023, Birkhäuser 2025), on Barraud–Cornea (2007) and on Abouzaid's Viterbo theorem (2015); DGFloerPartII continues to their Theorems B, G, H, I. Rests on the README's references and the texts read.

## Not verifiable

- Nothing new this round: no source locator was opened, since no passage changed. The items of the previous review stand (Weibel Theorems 5.5.1(2) and 5.5.10; Serre 1951 and 1953; the texts cited by locator alone; McDuff–Salamon §3.1, Abraham–Marsden, Chernoff–Marsden, Hartman, Floer–Hofer–Salamon, Piunikhin–Salamon–Schwarz).
- The description as quoted to this review may be cut after its generated blocks; nothing beyond the quoted text was checked.

## Source issues

- **Error** in bdho-cotangent at the proof of Theorem 5.15, printed page 99 (lines 4322–4324): the source says the abelian groups `G` with `G ⊗ ℤ/2 = 0` form a class in Serre's sense; it should be noted that `ℚ` belongs and its subgroup `ℤ` does not, so another argument is needed; affects the proof.
- **Gap** in bdho-cotangent at Lemma 4.5(1), printed pages 71–72 (lines 3137–3166): the source says unit-speed Moore loops of length at most `L` are a strong deformation retract, with no topology fixed; it should be restricted to compact families, since unit-speed loops are not closed in the compact-open topology; affects the proof.
- **Gap** in bdho-cotangent at Corollary 4.17, printed page 87 (line 3772): the source says the corollary holds for every DG local system and deduces it from Theorem K; it should carry Theorem K's bounded-below hypothesis or an extension argument; affects a stated result.
- **Misprint** in bdho-cotangent at Theorem 3.49(ii), printed page 67 (line 2967): the source says the spectral sequence converges to the symplectic homology of `W` without coefficients; it should be `SH_*(W; 𝓕)`; affects nothing.
- **Misprint** in bdho-cotangent at the proof of Theorem A, printed page 98 (lines 4261–4262): the source says that for `d = ±1` non-asphericity is equivalent to condition 1 of Theorem 5.10; it should be equivalent to `π₂(Q) ≠ 0` or condition 1; affects nothing.

## For the human reviewers

- Scope: the source with the largest share of the locators is cited as an arXiv preprint only (`README.md` References, first entry, arXiv:2404.07953 version 3); no journal reference is given. Its companion is published (Progress in Mathematics 360, 2025).
- Ownership: Layer 6 item 0 owns Hamiltonian vector fields of weakly nondegenerate forms, the Poisson bracket and symplectic flows; the open new-roadmap pull request HamiltonianSystems, Layers 1–2, plans the same objects and may not be cited as a supplier.
- Licence: `README.md` "Provenance: prior formalization" proposes porting from the public repository `t4v1/damian_formalizare`; its licence was not read. No declaration of `Suggested.lean` is taken from it.
