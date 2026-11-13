# Review of BochnerSpaces (pull request #2249 at 039c077)

**Verdict:** needs changes

Incremental re-review of the 79 lines changed since `94078e7`.

## R01 (P3) — The description does not state the roadmap suppliers
**Location:** pull request description: “The roadmap is organized by mathematical topic, with the book as its principal source, and builds on existing Mathlib and Tau Ceti material. It covers the chapter’s main text”.
**Claim:** Since `94078e7` the head takes the finite measure algebra and the classification of separable atomless probability measure algebras from VonNeumannAlgebras V2 instead of proving them, and it already consumed BanachSpaceTheory B1–B5. The description names neither supplier, and "covers the chapter's main text" no longer holds for the parts that are imported.
**Witness:** `TauCetiRoadmap/BochnerSpaces/README.md:188`: “**From [VonNeumannAlgebras]** … V2 supplies the finite measure algebra modulo null sets”; `:1041`: “Use VonNeumannAlgebras V2's measure-preserving Boolean isomorphism”; `:178`: “**From [BanachSpaceTheory]**”.
**Repair:** Replace the two sentences with: “The roadmap is organized by mathematical topic, with the book as its principal source. It builds on Mathlib and Tau Ceti and on two roadmaps on main: BanachSpaceTheory B1–B5 (duals and weak topologies, sequence spaces, finite-measure reflexive densities, the c₀ series criterion, scalar Lᵖ duality) and VonNeumannAlgebras V2 (finite measure algebras, their L² separability criterion and the classification of separable atomless probability measure algebras by `[0,1]`). The rest of the chapter’s main text, including definitions, unnamed statements and examples, is covered here, with the authors’ errata applied.”

## Previous findings

- R01 — repaired: `README.md:22`, `:188–194`, `:507–512`, `:543`, `:1041–1044`, `:1077` cite VonNeumannAlgebras V2 for the finite measure algebra, its L² comparison and the interval classification; §3.3 and §7.5 keep only the arbitrary-measure extension and the L¹ transport.
- R02 — repaired: `README.md:115–117` cites `Integrable.withDensityᵥ_eq_iff` with its file; `:892` reuses it “for uniqueness of integrable densities”; the §7.1 API bullet no longer lists uniqueness.
- R03 — repaired: `Suggested.lean:326` declares `exists_lpDualEquiv` with `1 ≤ p`, `1 ≤ q`, conjugate exponents, `p ≠ ∞` and the coordinate identity; `README.md:1163` names it.
- R04 — repaired: `README.md:86` `## Exact supplier contracts`, `:196` `## How to read the build`, `:1311` `## Downstream consumers`.

## Verified sound

| Statement | Instances tried | Left / input value | Right / output value | Result | Change |
| --- | --- | --- | --- | --- | --- |
| §8.3; `exists_lpDualEquiv`, endpoint | I={1,2}, X=ℝ, p=1, q=∞, Φ(a)=2a₁−3a₂ | ‖Φ‖=sup over ‖a‖₁=1 of the value: 3 | eΦ=(2,−3), ℓ∞ norm 3 | Isometry and coordinate formula agree | none |
| §8.3; `exists_lpDualEquiv`, interior | Same I, X, Φ; p=q=2 | ‖Φ‖=√(4+9)=√13 | ‖(2,−3)‖₂=√13 | Agree | none |
| §8.3; `exists_lpDualEquiv`, `hp` | I=ℕ, X=ℝ, p=∞, q=1; Φ a Banach limit | Φ(single i x)=0 for every i, so the coordinate family is 0 | ‖Φ‖=1≠0 | A coordinate map cannot be injective: `p ≠ ∞` is necessary | none |
| §8.3; `exists_lpDualEquiv`, degenerate and complex | I=∅; X=ℂ over ℂ, one index, Φ(a)=i·a | I=∅: both sides {0}. Complex: (eΦ)(1)=i | Conjugate-linear model would give −i and fail 𝕜-linearity of e | Bilinear convention pinned; e determined by the formula | none |
| §7.1: consumed density uniqueness | Unit atom, densities 2 and 3; infinite atom | Masses 2≠3, densities differ a.e.; infinite atom: only integrable density is 0 | `Integrable.withDensityᵥ_eq_iff`: integrable f, g, complete real target, any μ | Pinned statement covers the README's generality | none |
| §3.3: identification with V2's algebra | Counting {1,2,3}, A={1,2}, B={2,3}; counting ℕ | Finite case: all 8 sets have finite measure, d=2 | V2 metric μ(A△B)=2; on ℕ the complement of {1} has measure ∞ | Isometric for finite μ; complement only for finite μ, as the API bullet says | none |
| §7.5: L¹ transport along a Boolean isomorphism | [0,1], reflection x↦1−x; f=2·𝟙_[0,1/4]−3·𝟙_[1/2,1] | ∫f=1/2−3/2=−1; ‖f‖₁=2 | Image 2·𝟙_[3/4,1]−3·𝟙_[0,1/2]: integral −1, norm 2 | Integral and norm preserved; inverse transport is the same reflection | none |
| VonNeumannAlgebras V2 citation | Main and the open revision's head | Main `README.md:1026–1028` (finite measure algebra, L² separability) and `:1155–1158` (classification by the Lebesgue interval) | Open head `:1047`, `:1178`; heading anchor `layer-2-elementary-algebra-corners-and-tensors` exists at `:855` on main | Resolves in both; no dropped id | none |

The rows for untouched statements stand as in the previous review, of `94078e7`.

- Gate at `039c077`: every check passed (worker's `gate.md`, targeted build included). Elaboration of `Suggested.lean`: exit 0, 25 `sorry` warnings and nothing else (24 as before plus `exists_lpDualEquiv`).
- Dependency check: `depcheck: 240 roadmaps, 2175 edges, 0 problem(s)`; no UPWARD or CYCLE line. VonNeumannAlgebras is on main and at position 5 of the merge order, BochnerSpaces at 408.
- One-tactic probe on a scratch copy: `first | rfl | infer_instance | simp | exact ⟨_, fun _ _ _ => rfl⟩` leaves `exists_lpDualEquiv` unsolved; no padding. `#check @exists_lpDualEquiv` shows `[CompleteSpace X]`, `[DecidableEq I]`, both `Fact`s, the conjugacy instance and `p ≠ ∞`: no binder lost, and the type equals the README sentence at `:1163`.
- Pinned declarations opened: `Integrable.withDensityᵥ_eq_iff` (`Mathlib/MeasureTheory/VectorMeasure/WithDensity.lean:169`), `lp.single` (`Mathlib/Analysis/Normed/Lp/lpSpace.lean:1007`), `lp.dualPairing` (`Mathlib/Analysis/Normed/Lp/lpHolder.lean:264`), scalar `lp.dualEquiv` (`TauCeti/Analysis/Normed/Lp/Dual.lean:175`). No vector-valued dual equivalence exists at either pin. The pins of the two new link definitions match `lake-manifest.json`.
- Cross-roadmap citations resolved: 8 mentions of VonNeumannAlgebras V2, all to the two passages above. Overlap tooling: no conflicting head, no dropped or revision-only id. No file changed outside the folder; title “Add roadmap BochnerSpaces” is right.
- Remark (untouched text): pinned Mathlib has the sum pairing `lp (fun _ ↦ StrongDual 𝕜 E) p →L[𝕜] StrongDual 𝕜 (lp E q)` as `lp.dualPairing` with `lp.norm_dualPairing`; §8.3 does not name it.
- Remark: `[CompleteSpace X]` in `exists_lpDualEquiv` is not needed for its truth (the dual of `ℓᵖ(I;X)` is that of `ℓᵖ(I;X̂)` for p<∞); it matches the README's “complete X”.
- Sources: 0 locators certified against the text; the two sampled targets in changed passages (§7.5, §8.3) keep their locators unchanged.

Overlap check: read VonNeumannAlgebras (main and its open revision), BanachSpaceTheory (main), SobolevMapsBetweenManifolds; VonNeumannAlgebras V2 owns the finite measure algebra, its L² separability criterion and the interval classification, and BochnerSpaces cites it; BanachSpaceTheory B1–B5 owns the dual, sequence-space, reflexive-density and scalar-duality inputs; nothing else shared. StochasticCalculus and UnboundedOperators were read in the previous review and the change touches nothing of theirs.

Source independence: changed passages only; 6 passages compared with 2 readable sources (VonNeumannAlgebras V2 on main, pinned Mathlib docstrings), none shared beyond the formula `μ(A△B)`; largest share HvNVW, 47 of 49 citation groups, text not readable; no layer added, removed or reordered, so the contents comparison of `94078e7` stands.

## Not verifiable

- HvNVW §7.5: Theorem 1.3.21 and Example 1.3.23, pp. 53–54; Theorem 1.3.26 and Lemmas 1.3.28–1.3.29, pp. 55–59: the sources service reports the DOI as paywalled; no legal copy of the body found.
- HvNVW §8.3: Proposition 1.3.3, pp. 39–40: same.
- hvn-errata, entry for p. 39 (§8.3): the author-hosted PDF timed out again.
- The other HvNVW, Ryan and Diestel–Uhl locators listed in the previous review remain uncertified; none is in a changed passage.

## Source issues

- none

## For the human reviewers

- **Not tested.** HvNVW has 47 of 49 literary citation groups. Its public contents were readable in the previous review, its main text was not; wording and the seeded locators remain uncertified.
- **Licence.** The author-hosted hvn-errata PDF was unreachable again; its version and reuse status were not established.
