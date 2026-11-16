# Review of DGFloer (pull request #1798 at 62765e6)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 62765e6: the folder is unchanged, and this round reads the pull request's title and description against this head and against main. One finding, in the description.

## R01 (P3) — The description calls ImplicitAtlases an open pull request; it is on main

**Location:** pull request description, **Why.**, first sentence: "DGFloer on main consumes TangentialBordism and HomotopySpheres, both on main, and ImplicitAtlases, still an open pull request; TangentialBordism, HomotopySpheres and StringOrientation consume it".

**Claim:** ImplicitAtlases is not on main.

**Witness:** main (799d79c) has `TauCetiRoadmap/ImplicitAtlases/README.md`, `Suggested.lean` and `metadata.toml`, added by commit 9d0f6ec on 2026-11-16; this branch's merge base (eaf17b1) predates it. DGFloer on main cites it at `TauCetiRoadmap/DGFloer/README.md:176` and `:1339`.

**Repair:** replace the sentence's first clause with: "DGFloer on main consumes TangentialBordism, HomotopySpheres and ImplicitAtlases, all on main; TangentialBordism, HomotopySpheres and StringOrientation consume it, so these roadmaps form a dependency cycle on main." Nothing in the folder changes.

## Previous findings

- none: the previous review, of this same head, had no finding.

## Verified sound

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| Torus criterion, `isAspherical_iff_exists_continuousMulEquiv_torus` (Layer 11 item 3; the description's **Suggested.lean** paragraph cites it) | trivial group; `S¹`; `SU(2)`; `SO(3)`; `O(2)` | trivial: aspherical, `r = 0`; `S¹`: aspherical, `r = 1`; `SU(2) = S³`: `π₃ = ℤ`, no torus; `SO(3)`: `π₃ = ℤ`, no torus; `O(2)`: higher groups vanish, not a torus, excluded by `[ConnectedSpace G]` | holds |
| Mod-2 vanishing, `bijective_sq_homotopyGroup_of_mod_two_acyclic` (Layer 1 item 4; cited by the description) | a point; `S²`; `K(ℤ[1/2], 2)`; `K(ℤ/3, 2)` | point: `π_n = 0`, squaring bijective; `S²`: `H₂(S²; 𝔽₂) = 𝔽₂ ≠ 0`, hypothesis fails, and doubling on `π₂ = ℤ` is not onto; `ℤ[1/2]` and `ℤ/3`: doubling bijective, mod-2 homology zero | holds |

Rows for the untouched statements stand as in the previous review, of `62765e6`.

- Gate, rerun at 62765e6: `gate DGFloer: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate also records `build=0`.
- Dependency check: `depcheck: 261 roadmaps, 2526 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `TauCetiRoadmap/DGFloer/Suggested.lean`, rerun: seven `sorry` warnings (lines 83, 109, 142, 165, 195, 218, 244), nothing else. No Lean statement changed, so the `#check` comparison and the padding probe were not rerun.
- Outside the folder: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DGFloer'` is empty.
- Description against the head, sentences that hold: the numbering note (`README.md:151–201`) maps Layer 1 items 2–4 to AlgebraicTopology §4.10 and Stages 5.0, 5.5, 8.8c, 8.8d, and Layer 1 items 7–8, Layer 5 item 7, Layer 10 item 5 (Theorem B) and Layer 11 items 1–6 to DGFloerPartII; the head names none of TangentialBordism, HomotopySpheres, ImplicitAtlases as a supplier (the implicit-atlas comparison is out of scope at `:238–240`); `Suggested.lean` has `import Mathlib`, four `TauCeti.*` imports and the seven declarations listed, and its docstring names Theorems J, K, L, M, the fibration theorem, the Arnold bound and the Floer–Novikov torsion as not statable; the 20 removed declarations are the cubical, Moore-path and twisting-cocycle ones the description sends to the pinned library; Layer 7.G (`:3407`) and Layer 11 item 3 (`:199–201`) are as stated.
- Cross-roadmap citations resolved (8): AlgebraicTopology at #1807 has §4.8 compact generation (`:1976`), §4.10 (`:2082`), 5.0 (`:2162`), 5.5 (`:2367`), 8.8c (`:4344`), 8.8d (`:4439`); on main it has 4.8 (`:1795`) and 5.5 (`:2027`) only and consumes DGFloer Layer 1 items 2–3 (`:2029`), as the **Merge order** paragraph says; HamiltonianReduction R1a.2 is on main (`TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/README.md:97`); DGFloerPartII is added by #1799. TangentialBordism (`:463`), HomotopySpheres (`:186`) and StringOrientation (`:52`) on main cite DGFloer, as **Why.** says.
- Library declarations opened (2): `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv` (`TauCeti/AlgebraicTopology/Homotopy/Hurewicz/One/Basic.lean:705`), `TauCeti.IsAspherical` (`TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean:59`).
- Remarks, no change requested: the summary block's "ImplicitAtlases, which also consume it" holds through AlgebraicTopology (ImplicitAtlases on main consumes AlgebraicTopology, which consumes DGFloer Layer 1 items 2–4), not directly; the generated `depends-on` and `merge-order` blocks name #1807 as "AdicSpacesPartIII (and 12 other roadmaps)", of which AlgebraicTopology is one.

Overlap check: read AlgebraicTopology (main and #1807) and DGFloerPartII (#1799) where the description cites them; the folder adds no object since the previous review, so nothing new is shared. §4.10 is defined only by #1807, which the description's **Merge order** names. The scopes of FukayaTheory, HeegaardFloer and HamiltonianFloerOperations were not read again.

Source independence: changed passages only; the folder has no changed passage, so 0 passages compared with 0 sources; the arrangement was not compared again, since no layer is added, removed or reordered.

## Not verifiable

- Carried from the previous reports: Weibel 5.5.1(2) and 5.5.10 (1.3); Serre 1951 and 1953 (1.2, 1.4); the texts settled as uncertified (Palais 1960, Hofer–Zehnder, Struwe, Bröcker–tom Dieck, Massey, Whitehead, Hofer–Salamon).

## Source issues

- none

## For the human reviewers

- none
