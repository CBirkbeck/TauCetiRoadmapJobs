# Review of SpectralManifolds (pull request #1158 at b1e8fb7)

**Verdict:** needs changes

## R01 (P3) — Supplier heading fragment remains broken

**Location:** `TauCetiRoadmap/SpectralManifolds/README.md:33` and `:236`, `#q3-classical-metrics-probabilities-and-commutators`.
**Claim:** Both links select the cited supplier layer.
**Witness:** #1155, `TauCetiRoadmap/CompactQuantumMetricSpaces/README.md:823`, heads the layer “Layer 3: Classical metrics, probabilities and commutators (Q3)”; its anchor is `#layer-3-classical-metrics-probabilities-and-commutators-q3`. The linked anchor has no heading.
**Repair:** Replace `#q3-classical-metrics-probabilities-and-commutators` with `#layer-3-classical-metrics-probabilities-and-commutators-q3` in both links. Sections 3.1 and 3.6 remain the intended targets.

## R02 (P3) — Validation paragraph describes an older prototype

**Location:** PR description, Validation paragraph (`scratch/pull-request.md:28`): “the suggested Lean prototype and topic are unchanged” and “with all seven tested roadmap/topic/configuration inputs matching and five intended own admissions.”
**Claim:** The validation paragraph presents an older five-admission composition as validation of the submitted prototype, without identifying its replacement.
**Witness:** `TauCetiRoadmap/SpectralManifolds/Suggested.lean:5` imports only Mathlib; lines 54 and 69 declare the only two admitted theorems. Its targeted build and standalone elaboration emit exactly two sorry warnings, with no NCG prototype import.
**Repair:** Replace the Validation paragraph with: “This PR adds the new SpectralManifolds roadmap in three files. Suggested.lean states two admitted F-space theorems, open mapping and closed graph, using only import Mathlib; its docstring identifies the headlines not statable at the pins. At b1e8fb7 the gate, dependency check, targeted module build and standalone elaboration pass, with two expected sorry warnings. These checks validate interfaces, not proofs.” Remove the older composition's CI claim or explicitly label it as historical and inapplicable to this prototype.

## Previous findings

- R01 — not repaired: README lines 33 and 236 still use `#q3-classical-metrics-probabilities-and-commutators`; the supplier heading at #1155 yields `#layer-3-classical-metrics-probabilities-and-commutators-q3`.

## Verified sound

| Statement | Instance | Left side / observed value | Right side / claimed value | Result; change |
| --- | --- | --- | --- | --- |
| SM11 classical distance, supplier §3.1 | Two points a,b at distance 2; f(a)=0, f(b)=2 | d(a,b)=2 | Lip(f)=1; difference=2; every admissible difference ≤2 | Equality; R01 changes only the link |
| SM7 connected point metric, supplier §3.6 | Unit circle; antipodes 0,π; f(θ)=d(θ,0) in the closed Lipschitz domain | Geodesic distance=π | Lip(f)=1; difference=π; supremum ≤π | Equality; R01 changes only the link |
| `isOpenMap_of_surjective` | E=F=ℝ; f(x)=2x; U=(−1,1) | f(U)=(−2,2) | (−2,2) is open; preimage of y is y/2 | Hypotheses and conclusion hold; no signature change |
| `continuous_of_isClosed_graph` | E=F=ℝ; f(x)=3x | Graph=ker((x,y)↦y−3x), closed | f⁻¹((a,b))=(a/3,b/3), open | Hypotheses and conclusion hold; no signature change |
| Supplier fragment | Heading at #1155, README:823 | Old fragment: 0 matching headings | Replacement fragment: 1 matching heading | R01 persists |
| PR validation's own-admission count | Current Suggested.lean and build warnings | 2 admitted theorems; 0 roadmap imports | Description: 5 own admissions, imported NCG prototype | R02 updates the validation paragraph |

Other adversarial rows stand as in the previous review of b1e8fb7.

- Incremental scope: 0 changed folder lines; 1 previous finding checked; title, summary block and description compared with the head and the base diff.
- Base diff: 3 new files, 344 insertions, 0 deletions; 0 changes outside this roadmap; worktree clean.
- Source sample: 0 newly changed targets or locators; the previous source sample stands, with the limitations below.
- Pinned declaration opened: `Mathlib/LinearAlgebra/LinearPMap.lean:41`, a partial semilinear map on a submodule, confirming the summary's carrier attribution.
- Supplier targets reopened: CompactQuantumMetricSpaces §§3.1 and 3.6 at README:825 and :962; citation resolver reports 0 missing roadmap references, dependency check reports 0 problems.
- Signature probe: `#check @...` for both actual declarations elaborates; all completeness, countability and Hausdorff binders remain, matching README:83; no signature changed.
- Gate passes all reported checks; targeted build and standalone elaboration exit 0 with exactly 2 sorry warnings; prior one-tactic probes stand for the unchanged statements.

```text
gate SpectralManifolds: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 244 roadmaps, 2210 edges, 0 problem(s)
```

Overlap check: read CompactQuantumMetricSpaces, QuantumFoundations, NoncompactQuantumSymmetry, SmoothBanachRepresentations, RelativisticQuantumFieldTheory, NoncommutativeGeometry, IndexTheory and SpinGeometry; classical point metrics belong to CompactQuantumMetricSpaces, spectral-triple core and generic locally convex tensors to NoncommutativeGeometry, geometric index formulas to IndexTheory, and geometric Spin/Dirac constructions to SpinGeometry; common operator and Clifford foundations retain their named suppliers. No new ownership claim occurs in the zero-line diff.

Source independence: changed passages only; 0 roadmap passages compared with 0 sources because the folder diff is empty; no layer was added, removed or reordered. Largest-source locator counts and contents comparison were not repeated; the previous source-access limitations remain.

## Not verifiable

- Carried from the previous review: Rudin, Theorems 2.11 and 2.15; Trèves, Chapter 51; Loday, §4.2; Nestruev, Chapter 11: book texts unavailable in that review's sources cache, cited by locator alone.
- Carried from the previous review: Hörmander 1968 and Ando 1988 were paywalled; no legal text was found for Birman–Koplienko–Solomyak 1975. No changed passage requires another source fetch.
- The historical CI run and source-reading account in the PR description were not independently certified; R02 rests on the submitted file and this round's build.

## Source issues

- none

## For the human reviewers

- Source-access limits from the previous review remain for the books and operator-inequality papers cited at `TauCetiRoadmap/SpectralManifolds/README.md:255`–`:261`; the zero-line re-review supplies no additional verification of those texts.
