# Review of DGFloer (pull request #1798 at 62765e6)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 62765e6: the folder is unchanged, and this round reads the pull request's title and description against this head and against main (e84bfbe, whose `TauCetiRoadmap/DGFloer/README.md` is the merge base's). No finding.

## Previous findings

- R01 — repaired: "DGFloer no longer consumes TangentialBordism, HomotopySpheres, ImplicitAtlases, GeneralizedCohomology, ComplexKahlerGeometry, HamiltonianSystems or CotangentLagrangian. It newly consumes ContactGeometry CG4's Liouville collar of a hypersurface transverse to a Liouville field, for the contact-type step of Layer 6 item 4."

## Verified sound

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| Torus criterion, `isAspherical_iff_exists_continuousMulEquiv_torus` (Layer 11 item 3; cited by the description's **Shape** and **Suggested.lean** paragraphs) | `G = 1`; `S¹`; `SU(2)`; `SO(3)`; `U(2)`; outside the hypotheses: `O(2)`, `ℝ`, `ℕ → S¹` | `1`: all `π_k = 0`, `r = 0`, both sides hold. `S¹`: `π_{k≥2} = 0`, `r = 1`, both hold. `SU(2) = S³`, `SO(3)`, `U(2) ≅ (S¹ × S³)/±1`: `π₃ = ℤ`, non-abelian, both fail. `O(2)`, `ℝ`, `ℕ → S¹`: `π_{k≥2} = 0` and no finite torus; excluded by connected, compact, Lie respectively | holds; each of the three hypotheses is needed |

Rows for the untouched statements stand as in the previous review, of `62765e6`.

- Gate at 62765e6 (the worker's): every check 0, including `depcheck=0`, `outside-folder=0`, `stray-files=0` and `build=0`, `OK`.
- Dependency check, rerun: `depcheck: 262 roadmaps, 2545 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `TauCetiRoadmap/DGFloer/Suggested.lean`, rerun: seven `sorry` warnings (lines 83, 109, 142, 165, 195, 218, 244), nothing else. No Lean statement changed, so the `#check` comparison and the padding probe were not rerun.
- Outside the folder: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DGFloer'` is empty.
- Suppliers, main against head, by every roadmap name either README mentions (26 on main, 32 at the head). Dropped: TangentialBordism (main `:93`, `:183`), HomotopySpheres (`:94`), ImplicitAtlases, GeneralizedCohomology (`:155`, `:854`), ComplexKahlerGeometry (`:168`), HamiltonianSystems (`:173`, `:1174`; no mention at the head), CotangentLagrangian (`:90`; head `:217` "not consumed here"). Added: ContactGeometry CG4 (head `:221`, `:861`, `:2331`, `:2381`). UniversalCovers, LieGroups, CompactGroups, MorseNovikov, SymplecticGeometry and HamiltonianReduction are suppliers on both sides; the ten other names new at the head (`:4488–4513`, `:225`, `:3409`) are citers or non-consumed owners. The description's **Other suppliers** paragraph states exactly this.
- Description against the head, other sentences: title and summary block agree with the numbering note (`README.md:151–201`: Layer 1 items 2–4 to AlgebraicTopology §4.10 and Stages 5.0, 5.5, 8.8c, 8.8d; moved applications to DGFloerPartII §§1.3, 1.4, Layer 2, 3.2–3.3, 4.1–4.6); the twelve removed headings are covered by **Shape** and **What moves to DGFloerPartII**; the twenty removed declarations (cubical chains, Moore paths, twisting cocycles) by **What the pins already prove**; `Suggested.lean` has `import Mathlib`, four `TauCeti.*` imports, the seven declarations named, and a docstring naming Theorems J, K, L, M, the fibration theorem, the Arnold bound and the Floer–Novikov torsion as not statable; Layer 7.G is at `:3407`, Layer 11 (11.1–11.3) at `:4347–4451`.
- Cross-roadmap citations resolved again (13): AlgebraicTopology on main has §4.8 (`:1795`) and 5.5 (`:2027`), lacks 4.10, 5.0, 8.8c, 8.8d, and consumes DGFloer Layer 1 (`:143–152`); at #1807 it has §4.8 (`:1976`), §4.10 (`:2082`), 5.0 (`:2162`), 5.5 (`:2367`), 8.8c (`:4344`), 8.8d (`:4439`); DGFloerPartII at #1799 has §1.3 (`:803`), §1.4 (`:911`), Layer 2 (`:1022`), §§3.2–3.3 (`:1257`, `:1301`), §§4.1–4.6 (`:1343`–`:2108`); ContactGeometry CG4 on main (`TauCetiRoadmap/SymplecticGeometry/ContactGeometry/README.md:121`). The worker's citation resolver lists nothing found nowhere.
- Library declaration opened at the pinned Tau Ceti (1): `TauCeti.IsAspherical` (`TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean:59`): path-connected and `π_{n+2}` subsingleton for all `n`; it does not ask for a CW structure.
- Remark, no change requested: the generated `depends-on` and `merge-order` blocks name #1807 as "AdicSpacesPartIII (and 12 other roadmaps)", of which AlgebraicTopology is one; the prose **Merge order** paragraph names it correctly.

Overlap check: read AlgebraicTopology (main and #1807) and DGFloerPartII (#1799) where the description cites them; the folder adds no object since the previous review, so nothing new is shared. §4.10 is defined only by #1807, which the description's **Merge order** paragraph names. The scopes of FukayaTheory, HeegaardFloer and HamiltonianFloerOperations were not read again.

Source independence: changed passages only; the folder has no changed passage, so 0 passages compared with 0 sources; the arrangement was not compared again, since no layer is added, removed or reordered.

## Not verifiable

- Carried from the previous reports: Weibel 5.5.1(2) and 5.5.10 (1.3); Serre 1951 and 1953 (1.2, 1.4); the texts settled as uncertified (Palais 1960, Hofer–Zehnder, Struwe, Bröcker–tom Dieck, Massey, Whitehead, Hofer–Salamon).

## Source issues

- none

## For the human reviewers

- none
