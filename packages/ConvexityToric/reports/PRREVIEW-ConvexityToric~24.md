# Review of ConvexityToric (pull request #1651 at 860e384)
Folder: `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/`

**Verdict:** needs changes

Incremental re-review of the 2 changed lines since c955776 (one docstring in `Suggested.lean`). The docstring repair is correct. One finding of the previous report is not repaired: the family index, which is this pull request's own file, is unchanged.

## R01 (P3) — The family index still routes this roadmap's chambers through RootSystems

Carried from R01 of the previous report; the head changes nothing in `TauCetiRoadmap/SymplecticGeometry/README.md`.

**Location:** `TauCetiRoadmap/SymplecticGeometry/README.md:66` ("RootSystems owns the abstract signed inversion/dual positivity and closed-wall chamber theorem") and `:80` ("T3/T4 consume RootSystems and HamiltonianReduction R2/R3").

**Claim:** The index describes this roadmap's suppliers. The folder cites RootSystems nowhere: its chambers are the pinned `RootPairing.dominantChamber`, `TauCeti.weylChamber` and `TauCeti.existsUnique_mem_orbit_inter_dominantChamber` (`ConvexityToric/README.md:136–152`), and Layer 4 consumes HamiltonianReduction R3 only.

**Witness:** at 860e384, `grep -c RootSystems TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md` prints 0; `grep -n RootSystems TauCetiRoadmap/SymplecticGeometry/README.md` prints `:66` and `:80`; `git diff origin/main...HEAD -- TauCetiRoadmap/SymplecticGeometry/README.md` is empty.

**Exact repair** (in `TauCetiRoadmap/SymplecticGeometry/README.md`, a file of this pull request's family):
- `:66`: replace "RootSystems owns the abstract signed inversion/dual positivity and closed-wall chamber theorem" with "RootSystems owns the abstract signed inversion/dual positivity; Tau Ceti's `RootPairing.dominantChamber`, `TauCeti.weylChamber` and `TauCeti.existsUnique_mem_orbit_inter_dominantChamber` supply the abstract chambers and the closed-wall fundamental domain".
- `:80`: replace "T3/T4 consume RootSystems and HamiltonianReduction R2/R3" with "T3 consumes Tau Ceti's Weyl chambers and HamiltonianReduction R2, T4 HamiltonianReduction R3".

Tested: the names resolve at the Tau Ceti pin 2fd255d9 (`LinearAlgebra/RootSystem/Chamber.lean:141`, `FundamentalDomain.lean:247`; `weylChamber` as in the previous report), and the dependency check has no RootSystems edge from this folder.

## Previous findings

- R01 — not repaired: `SymplecticGeometry/README.md:66` still reads "RootSystems owns the abstract signed inversion/dual positivity and closed-wall chamber theorem" and `:80` "T3/T4 consume RootSystems and HamiltonianReduction R2/R3". Written again as R01 above.
- R02 — repaired: `Suggested.lean:102` now reads "The moment values of the eight torus-fixed flags, in the order of the table of README §3.3." The repair introduces no new problem.

## Verified sound

**Pins and scope.** Head 860e384ff4b9fdbdde797d312ab93c41dc2dc5f8. `lake-manifest.json` pins Tau Ceti 2fd255d9 and Mathlib 1b1ccf4b; both package checkouts are at those commits (unchanged since the previous report). `git diff --stat c955776 HEAD` is the one line of `ConvexityToric/Suggested.lean`; the brief's excluding diff against main is empty.

**The changed passage.** The new docstring of `fixedMoment` was compared with the README: the table is under `### 3.3 The word121 Bott–Samelson moment polygon` (`README.md:620`, rows `:686–695`) and `README.md:697` defines `BottSamelson.fixedMoment` "by the eight rows of this table". The eight rows of the Lean body agree with the eight table rows in order: (a+b+c,b,0), (a+b,b+c,0), (a+b+c,0,b), (a+b,0,b+c), (b+c,a+b,0), (b,a+b+c,0), (0,a+b+c,b), (0,a+b,b+c). The docstring has no process word, path or pull-request number. No statement, signature, README sentence or supplier citation changed, so the seeded sample falls in no changed passage; sources were not re-read.

**Gate.** The worker's gate: every counter 0, `build=0`, OK. My rerun: every counter 0 except `outside-folder=4`, the `CotangentLagrangian` and `IntegrableSystems` files that are this pull request's own. Dependency check:

```text
depcheck: 234 roadmaps, 2273 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean` on `Suggested.lean` at this head: five `sorry` warnings (lines 74, 108, 116, 136, 186) and nothing else, as at c955776. The 16 elaborated signatures are those of the previous report (the diff touches a docstring only); the one-tactic probe of the previous report stands for the same reason.

**Overlaps and citations.** `overlaps.md`: no other open pull request changes this roadmap, no cited id is dropped; the anchor `#t1-compact-symplectic-actions-and-local-models` cited by IntegrableSystems on main is handled as in the previous report (this pull request's IntegrableSystems cites the Layer 1 anchor, and `ConvexityToric/README.md:197–198` maps T1–T5 to Layers 1–5). `citations.md`: no unresolved cross-roadmap citation; the seven Lean leads are this file's own declarations.

**Description.** The three ConvexityToric bullets are unchanged and agree with the head, as in the previous report.

**Adversarial table.** One changed declaration (docstring only); the other rows are carried from the previous report (PRREVIEW-ConvexityToric~23, at c955776), whose statements this diff leaves untouched.

| Statement | Instances tried | Values on both sides | Result |
| --- | --- | --- | --- |
| `fixedMoment` (docstring changed, body unchanged) | rows 1–8 against `README.md:686–695`; (a,b,c)=(1,1,1); (2,1,1) | Lean rows = table rows in order; at (1,1,1): (3,1,0),(2,2,0),(3,0,1),(2,0,2),(2,2,0),(1,3,0),(0,3,1),(0,2,2), each of sum 4 = a+2b+c; at (2,1,1) rows 2, 5 are (3,2,0), (2,3,0), sum 5 | ✓ |
| `fixedMoment_convexHull` | general a,b,c>0; (1,1,1) | carried from ~23: six vertices (3,1,0),(3,0,1),(2,0,2),(0,2,2),(0,3,1),(1,3,0); rows 2, 5 on the edge z=0 | ✓ (~23) |
| §3.3 rows 2, 5; projector diagonals; KKS sign | (2,1,1); (1,1,1); a=0 | carried from ~23: (3,2,0) at 1/3, (2,3,0) at 2/3 on (4,1,0)–(1,4,0); diagonals (1,1,0), (½,½,0); ratio −2π | ✓ (~23) |
| §1.1 moment sign, equivariance, periods, U(2) lattice | ℝ² rotation; translations; SU(2), SO(3) | carried from ~23: −(x²+y²)/2; defect −1; kernel {±I}; index 2 | ✓ (~23) |
| §1.2 polar J, weight model, shear and irrational rotation | Euclidean g; weights ±1, 0; S=((1,1),(0,1)) | carried from ~23: ω(e₁,Je₁)=1; Hessian −Id / +Id; Sⁿe₂ unbounded; fixed set of dimension 2 | ✓ (~23) |
| §2.1 Euler sign, Betti | weight-2 line; S²; T² | carried from ~23: 2u=−2h; (1,0,1); rank H¹=2 | ✓ (~23) |
| `torus_convexity`; §3.1 nonabelian and gradient | point; S² height; trivial circle; SU(2) orbit | carried from ~23: {0}; [−1,1] with preconnected fibers; {c}; chamber image {r} against [−r,r] | ✓ (~23) |
| §3.2 matrix corollary (pinned Schur–Horn) | spectrum (2,0); (1,1); n=0 | carried from ~23: segment (2,0)–(0,2); {(1,1)}; {()} | ✓ (~23) |
| `incidence_moment_range` | fixed flags | carried from ~23: every fixed value has sum a+2b+c and lies in the hull | ✓ (~23) |
| §4.1 DH; §4.2 variation | S² height; reversed circle on ℂ²; weight k=2 | carried from ~23: density 2π, mass 4π; derivative +2π; πc against πc/2 | ✓ (~23) |
| §5.1 `region`, `IsSmoothVertex`, `IsDelzant`; `toric_fibers`, `toricImage_delzant` | interval; normals ±2; rank 0; S² | carried from ~23: [0,1]; ±2 not a ℤ-basis; Delzant with d=0; image [−1,1], normals ±1 | ✓ (~23) |
| §5.1 volumes; §5.2 area and periods | [0,c]; simplex; (a,b)=(2,3), ε=1/2 | carried from ~23: 2πc; (2π)ⁿcⁿ/n!; π/6, periods π and 2π/3 | ✓ (~23) |
| Family index against the folder | `SymplecticGeometry/README.md:66, 80` at 860e384 | index names RootSystems twice; folder has 0 RootSystems citations | R01 |

## Not verifiable

- Unchanged from the previous report: Kirwan's 1984 book (Part I §§4–5), and Atiyah 1982, Guillemin–Sternberg 1982, Kirwan 1984, Duistermaat–Heckman 1982 and Delzant 1988 are paywalled and cited by locator; no source was re-read this round because no cited passage changed.
- Elaboration and the computed instances do not prove the five admitted headlines.

## Source issues

- none
