# Review of DGFloer (pull request #1798 at 62765e6)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 62765e6: the folder is unchanged, and this round reads the pull request's title and description against this head and against main (e0514d8). One finding, in the description.

## R01 (P3) — The description leaves out one supplier added and two dropped

**Location:** pull request description, **Other suppliers.**, first sentence: "DGFloer no longer consumes TangentialBordism, HomotopySpheres or ImplicitAtlases."

**Claim:** The paragraph accounts for the suppliers this revision adds and drops.

**Witness:** The head consumes ContactGeometry CG4 (`TauCetiRoadmap/DGFloer/README.md:221`, `:861`, `:2381`); main's DGFloer README never names ContactGeometry. Main's consumes GeneralizedCohomology (`:155`, `:854`) and ComplexKahlerGeometry K7.1–K7.2 (`:168`); the head names both only as citers (`:4508–4509`).

**Repair:** replace that sentence with: "DGFloer no longer consumes TangentialBordism, HomotopySpheres, ImplicitAtlases, GeneralizedCohomology or ComplexKahlerGeometry. It newly consumes ContactGeometry CG4's Liouville collar of a hypersurface transverse to a Liouville field, for the contact-type step of Layer 6 item 4." Nothing in the folder changes.

## Previous findings

- R01 — repaired: "DGFloer on main consumes TangentialBordism, HomotopySpheres and ImplicitAtlases, all on main; … ImplicitAtlases consumes AlgebraicTopology, which consumes DGFloer's Layer 1, so these roadmaps form dependency cycles on main."

## Verified sound

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| Theorem A, first case, `hasContractibleAlmostExistence_of_not_isAspherical` (Layer 10 item 5; cited by the description's **Suggested.lean** paragraph), as a case of Theorem 5.10 | `Q = Tⁿ`; `Q = S²`, `d = ±1`; `Q = S³`, `d = ±1`; first nonzero group `ℤ/2` in degree `k ≥ 3` with `d = 2` | `Tⁿ`: all `π_k = 0`, `k ≥ 2`, hypothesis fails. `S²`: `π₂ = ℤ ≠ 0`, first disjunct of 5.10. `S³`: `π₂ = 0`, `π₃ = ℤ`, `a^{±1} ≠ 1` for the generator, second disjunct. `ℤ/2`, `d = 2`: `a² = 1` for all `a`, second disjunct fails, and `IsUnit d` excludes `d = 2` | holds; `IsUnit d` is needed for the reduction |

Rows for the untouched statements stand as in the previous review, of `62765e6`.

- Gate at 62765e6 (the worker's): every check 0, including `depcheck=0`, `outside-folder=0` and `build=0`, `OK`.
- Dependency check, rerun: `depcheck: 262 roadmaps, 2545 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `TauCetiRoadmap/DGFloer/Suggested.lean`, rerun: seven `sorry` warnings (lines 83, 109, 142, 165, 195, 218, 244), nothing else. No Lean statement changed, so the `#check` comparison and the padding probe were not rerun.
- Outside the folder: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DGFloer'` is empty.
- Description against the head, sentences that hold: the numbering note (`README.md:151–201`) maps Layer 1 items 2–4 to AlgebraicTopology §4.10 and Stages 5.0, 5.5, 8.8c, 8.8d, and the moved applications to DGFloerPartII §§1.3, 1.4, Layer 2, 3.2–3.3, 4.1–4.6; Layer 1 item 5 is on `TauCeti.pontryaginThomCollapseMap` (`:1272`); the implicit-atlas comparison is out of scope (`:238–240`); TaubesGromov and HamiltonianReduction R1a.0–R1a.1, R1a.3–R1a.4 are not consumed (`:215–216`), R1a.2 and S0 are, in Layer 7.T; Layer 7.G is at `:3407`; the section list of **Shape** matches the headings; `Suggested.lean` has `import Mathlib`, four `TauCeti.*` imports, the seven declarations named, and a docstring naming Theorems J, K, L, M, the fibration theorem, the Arnold bound and the Floer–Novikov torsion as not statable.
- Cross-roadmap citations resolved (14): AlgebraicTopology on main has §4.8 (`:1795`) and 5.5 (`:2027`), lacks 4.10, 5.0, 8.8c, 8.8d, and consumes DGFloer Layer 1 items 1–4 (`:145–160`, `:2029`); at #1807 it has §4.8 (`:1976`), §4.10 (`:2082`), 5.0 (`:2162`), 5.5 (`:2367`), 8.8c (`:4344`), 8.8d (`:4439`); DGFloerPartII at #1799 has §1.3 (`:803`), §1.4 (`:911`), Layer 2 (`:1022`), §3.2–3.3 (`:1257`, `:1301`), §4.1–4.6 (4.4 at `:1956`); ImplicitAtlases on main consumes AlgebraicTopology (`:20`); TangentialBordism (`:463`), HomotopySpheres (`:549`) and StringOrientation (`:52`, `:233`) on main cite DGFloer; ContactGeometry CG4 on main states the Liouville collar (`TauCetiRoadmap/SymplecticGeometry/ContactGeometry/README.md:121–141`).
- Library declarations opened at the pinned Tau Ceti (4): `TauCeti.IsAspherical` (`TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean:59`), `TauCeti.TwistingCocycle` (`TauCeti/Algebra/Homology/DG/Twisted/Cocycle.lean:71`), `TauCeti.ParametrizedCocycle` (`TauCeti/Algebra/Homology/DG/Twisted/Homotopy.lean:264`), `TauCeti.pontryaginThomCollapseMap` (`TauCeti/Geometry/Manifold/PontryaginThom/Basic.lean`).
- Remarks, no change requested: the summary block's "ImplicitAtlases, which also consume it" holds through AlgebraicTopology, as **Why.** now says; the generated `depends-on` and `merge-order` blocks name #1807 as "AdicSpacesPartIII (and 12 other roadmaps)", of which AlgebraicTopology is one.

Overlap check: read AlgebraicTopology (main and #1807) and DGFloerPartII (#1799) where the description cites them; the folder adds no object since the previous review, so nothing new is shared. §4.10 is defined only by #1807, which the description's **Merge order** names. The scopes of FukayaTheory, HeegaardFloer and HamiltonianFloerOperations were not read again.

Source independence: changed passages only; the folder has no changed passage, so 0 passages compared with 0 sources; the arrangement was not compared again, since no layer is added, removed or reordered.

## Not verifiable

- Carried from the previous reports: Weibel 5.5.1(2) and 5.5.10 (1.3); Serre 1951 and 1953 (1.2, 1.4); the texts settled as uncertified (Palais 1960, Hofer–Zehnder, Struwe, Bröcker–tom Dieck, Massey, Whitehead, Hofer–Salamon).

## Source issues

- none

## For the human reviewers

- none
