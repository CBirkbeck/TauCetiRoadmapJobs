# Review of SchattenClassesAndSchurMultipliers (pull request #2421 at 1bd5565)

**Verdict:** accepted

**Summary.** Accepted: no finding. The 43 changed lines replace the citation of BochnerSpaces §7.5 for Sierpiński's theorem by a proof route in §7.1; the change is right, since BochnerSpaces §7.5 on main is the universality of `[0,1]` for the Radon–Nikodým property and states no divisibility of atomless measures, and the new route was checked step by step and is sound. One small correction (the pull request's description still names BochnerSpaces as open and §7.5 as consumed) and one format note carried from the previous review, neither blocking. Three points are left for the human reviewers, as before.

## C01 — The description still says BochnerSpaces is open and that §7.5 is consumed

The description's dependency paragraph says "From BochnerSpaces, still open, it consumes §4.2, §7.4 and §7.5." Both halves are now untrue: BochnerSpaces is on main, and at this head the README cites only its §4.2 and §7.4 (no mention of §7.5 remains; §7.1 proves Sierpiński's theorem itself and the scope section lists it as owned by Layer 7). A reader of the description would look for a divisibility statement in BochnerSpaces §7.5, which on main is "Universality of the unit interval [0,1]".

Text that would be right: add "BochnerSpaces (§4.2, §7.4)" to the list of roadmaps consumed on main, delete the sentence quoted above, and add one sentence such as "Sierpiński's theorem for atomless measures on an arbitrary measurable space is proved in §7.1."

## N01 — The Check of §7.3 still states Conjecture 1.8 of the source more weakly than the source does

Lines 1380–1382 say the source "conjectures that one exists" (a multiplier whose norm and completely bounded norm differ) on `S_p(ℓ²)`; lafforgue-delasalle-2011 lines 281–282 conjecture multipliers that are bounded and not completely bounded. "conjectures that bounded, not completely bounded ones exist" would match.

## Previous findings

The previous report (at 5e643e9) had no finding; its one format note is accounted for here.

- N01 — not repaired: "conjectures that one exists on `S_p(ℓ²)`" stands at lines 1380–1382; written again as N01 above.

## Verified sound

| Target | Instance | Left side | Right side | Result |
|---|---|---|---|---|
| §7.1 Sierpiński, first step (changed): small subsets | Lebesgue on `[0,1]`, `E = [0,1]`; `IsAtom` at the pin: `μ B = 0 ∨ μ B = μ A` | not an atom and `μ(E) < ∞` give `0 < μ(F) < μ(E)`; min of `μ(F)`, `μ(E∖F)` is `≤ 1/2`; after `k` steps `≤ 2^{−k}` | counting measure on `{1,2}`: `{1}` is an atom, halving stops at `1` | sound; finiteness of `μ(E)` comes from `E ⊆ A`, `μ(A) < ∞` |
| §7.1 Sierpiński, greedy step (changed) | Lebesgue, `A = [0,1]`, `t = 1/3`, worst choice `μ(F_k) = s_k/2` | `s_k = (1/3)2^{−k}`, `μ(B_k) = (1/3)(1 − 2^{−k}) → 1/3`; `Σ μ(F_k) = 1/3 < ∞` | if `μ(B) < t`: `μ(A∖B) = μ(A) − μ(B) ≥ t − μ(B)`, and `G` has `μ(B_k) + μ(G) ≤ μ(B) + μ(G) ≤ t`, so `s_k ≥ μ(G)` | sound; uses `t ≤ μ(A) < ∞` exactly where stated |
| §7.1 Sierpiński, boundary cases | `t = 0`; `t = μ(A)`; `μ(A) = 0`; `μ = 0` | `t = 0`: `s_k = 0`, `B = ∅`; `t = μ(A)`: `s_0 = μ(A)`, `F = A` admissible | `μ(A) = 0`: `t = 0`, `B = ∅`; zero measure: no atom (`0 < μ A` fails), `n` null pieces | sound; agrees with the last Check |
| §7.1 `n` equal pieces | `A = [0,1]`, `n = 3`; `n = 1` | remainders `1, 2/3, 1/3`; each step asks `1/3 ≤` remainder | `n = 1`: no step, the piece is `A` | sound |
| §7.1 negative controls (Checks) against the theorem | countable–cocountable measure; `∞ ·` Lebesgue | values `{0, 1}` only, no set of measure `1/2`; whole space is an `IsAtom` (`0 < 1`, subsets `0` or `1`) | `∞ ·` Lebesgue: every non-null set is an `IsAtom` (subsets `0` or `∞`), so not atomless; no clash | theorem and Checks agree; null singletons alone do not suffice |
| §7.3 consumer of §7.1 (cited by the changed text) | probability `μ`, minimal set `A` of `𝒜`, `n` | §7.1 gives `n` pieces of measure `μ(A)/n` with `μ(A) ≤ 1 < ∞` | lafforgue-delasalle-2011 lines 513–515: each atom of `𝒜` split into `n` sets of measure `μ(A)/n` | source supports the use; hypothesis `μ(A) < ∞` is met |

The rows for the untouched statements stand as in the previous review, of `5e643e9`; `Suggested.lean` is unchanged since that head.

- Source locators checked against the text: 2 in the changed passages (lafforgue-delasalle-2011 lines 513–515, the splitting in the proof of Theorem 1.18; lines 487–488, the meaning of atom). The seeded sample falls in no changed passage.
- Library declarations opened at the pin: 4. `MeasureTheory.Measure.IsAtom` (`TauCeti/MeasureTheory/Measure/Atom.lean` line 57), `MeasureTheory.Measure.exists_subset_measure_eq_of_nullSingleton` (`TauCeti/MeasureTheory/Measure/AtomlessStandardBorel/Transport.lean` line 115), `MeasureTheory.measure_iUnion` (`Mathlib/MeasureTheory/Measure/NullMeasurable.lean` line 241), `MeasureTheory.tendsto_measure_iUnion_atTop` (`Mathlib/MeasureTheory/Measure/Continuity.lean` line 201). No declaration of the pinned Mathlib or Tau Ceti states Sierpiński's theorem under the `IsAtom` hypothesis on an arbitrary measurable space.
- Cross-roadmap citations resolved against main: BochnerSpaces §4.2 (Fubini isometry for σ-finite measures, `1 ≤ p < ∞`, with section formulas) and §7.4 (the `L¹` projection, its positivity, idempotence, tower law, agreement with native conditional expectation, and the `L^∞` adjoint under a σ-finite trim) say what the supplier contract assumes; §7.5 there is the universality of `[0,1]` and is no longer cited anywhere in the README.
- Dependency check: `depcheck: 104 roadmaps, 1197 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changes outside the folder; since 5e643e9 only the README changed (21 insertions, 22 deletions).
- Automatic checks: all pass at this head. Lean: `lake env lean` on `Suggested.lean` gives 11 `sorry` warnings and nothing else. The elaborated types and the one-tactic probe stand as in the previous review, the file being unchanged.
- Overlap check: read BochnerSpaces on main (scope, §4.2, §7.4, §7.5) this round; NoncommutativeIntegration, OperatorIdeals, VonNeumannAlgebras, SchrodingerOperatorsAndSpectralTypes, BanachSpaceTheory, PDE stand as read before (the change adds no object they treat). Shared objects: the `L^∞` conditional expectation and the Fubini isometry (owner BochnerSpaces §7.4, §4.2, cited); Sierpiński's theorem for atomless measures on an arbitrary measurable space has no other owner (searched every roadmap on main and every open head for it; VonNeumannAlgebras V2 classifies separable nonatomic measure algebras and states no such splitting), so §7.1 owns it and the scope section says so.
- Source independence: changed passages only; 1 passage compared with 1 source (the route of §7.1 against lafforgue-delasalle-2011 lines 487–488 and 513–515, which assert the splitting without proof), none shared (longest common run 3 words); no layer added, removed or reordered, so the arrangement stands as compared before: largest share lafforgue-delasalle-2011, 43 of the 120 source mentions counted at 4faf86f; contents compared with lafforgue-delasalle-2011: independent.
- Research link: Layers 6–8 are Theorems 1.7, 1.18 and 1.19 of Lafforgue–de la Salle (2011); Layer 9 the transference of Caspers–de la Salle (2015) and Neuwirth–Ricard (2011); Layers 10–11 Theorem A of Conde-Alonso, González-Pérez, Parcet and Tablate (2023), which leads to Arazy's conjecture and Potapov–Sukochev (2011). Rests on the README's sources, read.

## Not verifiable

- Nothing new: the changed passages cite no text that could not be read.
- The locator-only texts (reed-simon-1-1980, jrwz-2020 and the others) and the uniformity of the constant in the Hardy-space interpolation of §10.4 stand as listed in the earlier reviews.

## Source issues

- **Gap** in cgpt-2023 at the proof of Lemma 1.4, p. 10 (lines 480–481): the source says the Hardy-space inclusions hold with absolute constants by Section 3 of the Randrianantoanina paper; it should give the argument, since Proposition 3.18 there states equivalent quasi-norms with no constant tracked; affects the proof.

## For the human reviewers

- The `gaps` list of the board package's `design/plan.json` is empty, but two of its prose entries still name the gaps `sigma-finite-hilbert-schmidt-kernels` and `semifinite-martingale-bmo-interpolation`; the README declares neither and builds both (§2.1, §10.4).
- §10.4 asks for two estimates with a constant independent of the exponent. For the first, randrianantoanina-2021 Proposition 3.18 (line 1440) tracks no constant; uniformity rests on cgpt-2023 line 481. jrwz-2020 was not read.
- §2.1 builds the kernel of a Hilbert–Schmidt operator on arbitrary σ-finite spaces, while AutomorphicSpectralTheory §0.8 on main owns it on standard Borel spaces with separable `L²` (`TauCetiRoadmap/AutomorphicSpectralTheory/README.md` lines 239–248). The scope section states the difference.
