# Review of SpectralManifolds (pull request #1158 at 5295e0e)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/SpectralManifolds/README.md:33` and `:236` now link `../CompactQuantumMetricSpaces/README.md#layer-3-classical-metrics-probabilities-and-commutators-q3`; the old fragment occurs 0 times in the folder.
- R02 — repaired: the Validation paragraph now reads “states two admitted F-space theorems, open mapping and closed graph, using only `import Mathlib` … with two expected `sorry` warnings”; no five-admission or prototype-import claim remains.

## Verified sound

| Statement | Instance | Left side / observed value | Right side / claimed value | Result; change |
| --- | --- | --- | --- | --- |
| Supplier fragment, README:33 and :236 | Heading “Layer 3: Classical metrics, probabilities and commutators (Q3)” at #1155, `TauCetiRoadmap/CompactQuantumMetricSpaces/README.md:823` | Slug of the heading: `layer-3-classical-metrics-probabilities-and-commutators-q3`; 1 matching heading | Linked fragment: the same string, in 2 links | Equal; R01 repaired |
| SM11 classical distance, supplier §3.1 (README:825 at #1155) | X=ℝ, x=0, y=3; f(z)=min(abs z, 3) | d(0,3)=3 | f bounded by 3, Lip(f)=1, f(3)−f(0)=3; every 1-Lipschitz difference ≤3 | Equality; unbounded z↦z excluded as §3.1 says; no change |
| SM7 connected point metric, supplier §3.6 (README:962 at #1155) | Circle of length 2π; points 0 and π/2; f(θ)=d(θ,0) | Geodesic distance=π/2 | Lip(f)=1, f(π/2)−f(0)=π/2; supremum ≤π/2 | Equality; two-component manifold: §3.6 applied per component, as README:174 says; no change |
| `isOpenMap_of_surjective` (cited by the description's Validation paragraph) | E=ℝ², F=ℝ, f(x,y)=x; U=open unit disc | f(U)=(−1,1) | (−1,1) open in ℝ | Holds; indiscrete F=ℝ control fails T2, excluded by the binder; no change |
| `continuous_of_isClosed_graph` (same paragraph) | E=F=ℝ, f(x)=−x | Graph={x+y=0}, closed | f⁻¹((a,b))=(−b,−a), open | Holds; no change |
| Description: “two admitted F-space theorems … two expected `sorry` warnings” | `Suggested.lean` at this head, elaborated | 2 theorems (lines 54, 69); 2 `sorry` warnings; 1 import (`Mathlib`) | Description: 2 theorems, 2 warnings, `import Mathlib` only | Equal; R02 repaired |
| Description: “adds the roadmap README, target signatures and topic metadata” | Diff against the base | 3 files added, 344 insertions, 0 deletions; 0 files changed outside the folder | 3 files named, all in `TauCetiRoadmap/SpectralManifolds/` | Equal |

The rows for the untouched statements stand as in the previous review, of `b1e8fb7`.

- Incremental scope: 4 changed folder lines (2 links, README:33 and :236); 2 previous findings checked, both repaired; no statement, layer, locator or supplier changed.
- Pull request text: title, summary block and 4 prose paragraphs read against the head; 0 sentences contradicted. Checked against README:71 (rows `𝒜^N e`, `f=eᵀ`), :70 (strong regularity), :131 (uniqueness up to diffeomorphism), :158 (smooth measure before heat expansion), :186 (even minimal multiplicity), :194 (duality axiom), :242 (torus, ℂP², Hodge–de Rham), :33 (§3.1 terminal, SM3–SM6 independent of Q0–Q6).
- Source sample: 0 of the seeded targets and 0 source locators fall in the changed lines; the previous sample stands with the limits below.
- Cross-roadmap citations resolved: CompactQuantumMetricSpaces §3.1 and §3.6 at #1155 (`README.md:825`, `:962`); the resolver reports 0 citations and 0 Lean names found nowhere.
- Pinned declarations opened: `Mathlib/Analysis/Normed/Operator/Banach.lean:229` (`ContinuousLinearMap.isOpenMap`, normed spaces only) and `Mathlib/Topology/Algebra/Group/OpenMapping.lean:114` (σ-compact groups); neither states the F-space targets.
- Signatures: both elaborated types keep `CompleteSpace`, countably generated uniformity and `T2Space` on E and F, matching the README statement; nothing changed since `b1e8fb7`.
- Gate passes every check; standalone elaboration exits 0 with exactly 2 `sorry` warnings (lines 54 and 69) and no other message.

```text
gate SpectralManifolds: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
depcheck: 246 roadmaps, 2235 edges, 0 problem(s)
```

Overlap check: read CompactQuantumMetricSpaces, QuantumFoundations, NoncompactQuantumSymmetry, SmoothBanachRepresentations, RelativisticQuantumFieldTheory, NoncommutativeGeometry, IndexTheory and SpinGeometry; the changed lines add no object. Classical point metrics and the spectral-triple metric criterion stay with CompactQuantumMetricSpaces §3.1 and §3.6, cited and not restated; the overlap tool lists no shared roadmap, dropped id or second copy.

Source independence: changed passages only; 2 changed passages (link targets) compared with 0 sources, since they carry no source wording; no layer added, removed or reordered, so the arrangement was not compared again; the previous review's source-access limits remain.

## Not verifiable

- Carried from the previous reviews: Rudin, Theorems 2.11 and 2.15; Trèves, Chapter 51; Loday, §4.2; Nestruev, Chapter 11: book texts not in the sources cache, cited by locator alone.
- Carried from the previous reviews: Hörmander 1968 and Ando 1988 are paywalled; no legal text was found for Birman–Koplienko–Solomyak 1975. No changed passage cites them.
- The description's line on AI assistance is the author's own account and was not checked.

## Source issues

- none

## For the human reviewers

- Source-access limits remain for the books and operator-inequality papers cited at `TauCetiRoadmap/SpectralManifolds/README.md:255`–`:261`: their texts were read in no review round, so those locators are cited unverified.
