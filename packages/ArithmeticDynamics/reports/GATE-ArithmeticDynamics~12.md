# GATE-ArithmeticDynamics~12: answers to human review

One review (roed-math, 2026-11-06), two points. Head before: `40c5963`; after: `ae79f44` (README only; `Suggested.lean` unchanged).

## H01 (roed-math) — applied differently

ProbabilisticAndMetricNumberTheory §5.2 (head `e4c4e53`, README line 6579) defines only `finiteMutualInformation`, built on GeometryOfNumbersAndQuadraticArithmetic §4.2's `finitePartitionEntropy` (head `f5de135`, README line 1540). Its own scope (line 15) gives finite-label Shannon entropy, the chain rule and the alphabet bound to that roadmap. So `finiteEntropy` and the §2.6 comparison were citing something no roadmap provides. The fix differs from the suggestion in one respect: ArithmeticDynamics never uses mutual information (it appears nowhere in the README), so `finiteMutualInformation` is not consumed either. The ProbabilisticAndMetricNumberTheory contract is now §§4.1–4.3 only.

The changes:
- `TauCetiRoadmap/ArithmeticDynamics/README.md` line 71 (scope): "§§4.1–4.3 owns pointwise Birkhoff and §5.2 finite Shannon entropy" → "§§4.1–4.3 owns pointwise Birkhoff". GeometryOfNumbersAndQuadraticArithmetic §4.2 now owns finite-label entropy, the chain rule, independence and the alphabet bound.
- Line 286 (supplier contract): heading "§§4.1–4.3, 5.2" → "§§4.1–4.3". The sentence consuming `finiteEntropy`/`finiteMutualInformation` is deleted.
- Lines 303–312 (GeometryOfNumbersAndQuadraticArithmetic contract): it now spells out the finite-label statements consumed. These are −Σ pᵢ log pᵢ with 0 log 0 = 0, comparison with the countable entropy as a finite sum, the joint-label chain rule, additivity for independent labels and 0 ≤ H ≤ log(card alphabet). Each is checked against that roadmap's line 1540.
- Lines 2502–2513 (§2.6): "Prove that GeometryOfNumbersAndQuadraticArithmetic §4.2's finite partition entropy equals ProbabilisticAndMetricNumberTheory §5.2's finite Shannon entropy" is deleted. Two targets the supplier does not provide take its place. First, composing a finite label with an injection into ℕ leaves its entropy and its itinerary entropies unchanged; the supplier's `measureEntropy` ranges over ℕ-valued labels, so finite labels need this to enter it. Second, labels equal almost everywhere, together with their joins and itineraries, have the same entropy.
- Line 2529: a new Check, and line 2544: §2.6's *Needs:* "§§4.1–4.3, 5.2" → "§§4.1–4.3". The old "both entropy formulas" Check is rewritten to test the ℕ-embedding.
- Line 4156 (Layer 2 Dependencies): the same re-pointing.

## H02 (roed-math) — applied differently

Neither `ArithmeticDynamicsPartIIBifurcation` nor any renamed successor exists on main or in the 466 open roadmap pull requests at their heads. The material these lines pointed to is planned in this roadmap:
- PCF maps (§6.5);
- the critical height (§6.8) and zero critical height ⟺ PCF (§6.40);
- critically marked moduli (§0.34);
- bifurcation currents (§4.5);
- the critical-height adelic line bundle with PCF equidistribution (§4.49).

Renaming the successor to `ArithmeticDynamicsBifurcation` would leave a pointer to a roadmap that does not exist. Instead each pointer now names the section of this roadmap that does the work:
- Line 988: → "Postcritically finite rational maps (Layer 6; DeMarco–Mavraki–Ye §2.2)".
- Line 1023: "Layer 6 and ArithmeticDynamicsPartIIBifurcation" → §§6.5, 6.40 by title.
- Line 1374: → §0.29 and §4.5 by title.
- Lines 1711 and 1861: → §4.49 by title.
- Line 1776: → §§6.5, 4.5 by title.
- Lines 8686, 9425, 9570: "bifurcation Part II" / "the uniformity Part II" → "outside this roadmap".

A new scope bullet at line 89 says three things:
- PCF maps, the critical height, its adelic line bundle and bifurcation currents belong here.
- DeMarco–Mavraki–Ye's bounded-geometry and small-critical-height theorems on subvarieties of M_d, and DeMarco–Krieger–Ye's bielliptic genus-2 application, are outside this roadmap.
- ArithmeticDynamicsPartII is the Markoff-dynamics roadmap and does not continue this material.

ArithmeticDynamicsPartII is at line 207 of the merge order, before this roadmap (324). Mentioning it creates no upward edge.

## Pattern search

- **Supplier names.** Every backticked name in the 50 `From TauCetiRoadmap.X` contracts was checked mechanically against X's README and `Suggested.lean`, at main or at X's open head. `finiteEntropy` was the only name absent from its cited supplier. The other four hits are not defects:
  - `variableChange_Δ` is in Mathlib at `Mathlib/AlgebraicGeometry/EllipticCurve/VariableChange.lean:218`;
  - `tsum` and `PadicInt` are Mathlib names;
  - `legendreTorsionImages` is this roadmap's own definition in `Suggested.lean`.
- **Berkovich names.** The four `BerkovichAnalyticSpace.*` names the worker's resolver flagged are named targets of AlgebraicModuliForArithmeticGeometry §7.10.2 (head of its open roadmap pull request, README line 9815), so they are not defects.
- **Nonexistent roadmaps.** All CamelCase roadmap-like names in the README were checked against main and the open pull requests. `ArithmeticDynamicsPartIIBifurcation` was the only one that exists nowhere. After the edits, `roadmaps resolve` reports no cross-roadmap citations and no Lean names found nowhere.

## Ownership and overlaps

- No construction moved. Finite-label entropy is now cited to its owner, GeometryOfNumbersAndQuadraticArithmetic §4.2 (merge order 68). This matches what ProbabilisticAndMetricNumberTheory (261) says of its own §5.2.
- The two new §2.6 targets are not provided by GeometryOfNumbersAndQuadraticArithmetic: its §4.2 API lists invariance only under label isomorphisms, and nothing about almost-everywhere equality. These targets were already part of §2.6's transport statement, so this roadmap owns them.
- `overlaps.md` lists no open pull request that changes this roadmap, and no dropped ids.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Composing a finite label a:X→I with an injection e:I→ℕ preserves the countable entropy and each itinerary entropy | one-point space, I={0,1}, masses (1,0); fair bit; n=0 itinerary | (1,0): finite H=0, composite atoms (1,0,0,…) give 0. Fair bit: log 2 both sides. n=0: unique empty tuple, mass 1, H=0 both. Itinerary of e∘a is eⁿ∘(itinerary of a) with eⁿ injective, so unused atoms are empty | holds | new target and Check, line 2506 |
| a = b μ-a.e. ⇒ equal atom masses and entropy | [0,1] Lebesgue, a=1_[0,1/2), b=1_[0,1/2] | μ(a=1)=μ(b=1)=1/2; H(a)=H(b)=log 2 | holds | new Check, line 2529 |
| A.e. equality passes to joins | same a,b; join (a,b) | atom masses (1,1)↦1/2, (1,0)↦0 (empty), (0,1)↦0 ({1/2}), (0,0)↦1/2; H=log 2 = H(a joined with a) ≠ 2 log 2 | holds | Check, line 2529 |
| A.e. equality passes to itineraries for measure-preserving T | T=id on [0,1]; negative control: the constant map T≡1/2 (not measure preserving) | id: a∘Tᵏ=b∘Tᵏ off {1/2}, null. Constant map: a∘T≡0 and b∘T≡1 differ on all of [0,1], so the hypothesis is needed | holds with the stated hypothesis | wording "because preimages of null sets under the measure-preserving T are null" |
| Supplier alphabet bound 0≤H≤log(card I) | I of size 1; fair bit; masses (1,0) | 0≤0≤0; 0≤log 2≤log 2; 0≤0≤log 2 | holds; matches GeometryOfNumbersAndQuadraticArithmetic line 1540 | contract, line 309 |
| Revised Check: constant label with an added empty atom | one point, masses (1,0) | finite H = −1·log 1 − 0 = 0; composite with ℕ-injection 0; alphabet size would give log 2 | discriminates | line 2525 |
| Re-pointed application lines name existing targets | §§0.29, 4.5, 4.49, 6.5, 6.40 headings | each heading exists (README lines 1681, 5982, 6944, 8589, 9234); §4.49's *Needs:* lists §§0.29, 0.34 | consistent | lines 988–1861 |

## Suggested.lean

Not changed. The worker's `signatures.md` lists 15 declarations with 0 lost section binders. None of them mentions entropy or the successor roadmap, so no `#check` comparison was needed for this round. The module docstring's list of headlines that cannot be stated is unaffected.

## Sources

No new source was cited; `needs-references.toml` was not written. The DeMarco–Mavraki–Ye and DeMarco–Krieger–Ye locators in the re-pointed lines were already in the README and are unchanged. The new scope bullet restates them without theorem numbers.

## Build and gate

- `lake build TauCetiRoadmap.ArithmeticDynamics.Suggested`: `Build completed successfully (8976 jobs).` It reports 11 `declaration uses 'sorry'` warnings and nothing else.
- Gate at `ae79f44`: `gate ArithmeticDynamics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 239 roadmaps, 2360 edges, 0 problem(s)`. There are no UPWARD, CYCLE or moved lines.
