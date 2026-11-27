# Review of MetrizationTheorems (pull request #3217 at 6be41f6)

**Verdict:** needs changes

**Summary.** Changes are needed, for one sentence only: the scope section says Mathlib proves metrizability of uniform spaces with countably generated uniformity, and drops the T₀ hypothesis that the cited declaration carries and that the statement needs. No stated theorem, route or Check was found false: all nine theorems were recomputed, `Suggested.lean` elaborates with `sorry` as its only warning, and every cited Mathlib name exists at the pin. There are two small corrections (2.2 assumes more than its route uses; a strict inequality in the route of 1.2) and no format notes. Four of the six sources (Stone, Michael, Bing, Rudin) and Munkres could not be read legally, so their locators are unverified; the humans who approve have three points to decide.

## R01 (P2) — The scope section credits Mathlib with metrizability of every uniform space with countably generated uniformity; that is false without T₀, and the cited declaration assumes T₀

In "Scope and ownership" (README line 439–440) the list of what is already in the library includes "metrizability of uniform spaces with countably generated uniformity (`UniformSpace.metrizableSpace`)". A reader takes this as the library's statement, in a roadmap whose conventions turn on exactly where T₀ is and is not assumed. The two-point indiscrete space, which the README uses throughout as its non-T₀ control, has the trivial uniformity (countably generated) and is not metrizable. At the pin the declaration reads `theorem UniformSpace.metrizableSpace [UniformSpace X] [IsCountablyGenerated (𝓤 X)] [T0Space X] : TopologicalSpace.MetrizableSpace X` (`Mathlib/Topology/Metrizable/Uniformity.lean`, line 258); the T₀-free statement is the instance `UniformSpace.pseudoMetrizableSpace` (`Mathlib/Topology/Metrizable/Basic.lean`, line 47).

Smallest change: "metrizability of T₀ uniform spaces with countably generated uniformity (`UniformSpace.metrizableSpace`)", or cite the pseudometrizable instance for the statement as written.

## C01 — Theorem 2.2 assumes σ-discrete refinements, but its route uses only that each stage is locally finite

In the route of 2.2 (README lines 201–213) the discreteness of a stage `𝓗 n` enters once, to say that `Q n i` has closure equal to the union of the closures of its members; that is `LocallyFinite.closure_iUnion`, which the *Needs:* line already names, and it holds for any locally finite stage. Every other step (the cover `𝒦`, `F i ⊆ U i`, the disjointness for `n ≤ k`) uses the stages only as sets of open sets. So the same argument proves the conclusion from σ-locally finite open refinements, which by 2.1 is `ParacompactSpace X` for regular `X`: paracompact regular spaces are collectionwise normal. As stated, a user with a paracompact regular space cannot apply 2.2 without first producing σ-discrete refinements, which no target here supplies outside the pseudometrizable case.

The statement as it stands is true and is Bing's; this does not block. The author would either add the σ-locally finite (or `[ParacompactSpace X]`) form as the statement of 2.2 with Bing's form as its corollary, or say in one sentence after the route that the argument uses only local finiteness of the stages.

## C02 — In the route of 1.2, a ball of radius `2⁻ⁿ⁻¹` need not have diameter less than `2⁻ⁿ`

README line 109: "any set of diameter less than `2⁻ⁿ`, in particular a ball of radius `2⁻ⁿ⁻¹` about any point". In `ℝ` the open ball of radius `r` has diameter exactly `2r`, so the ball is not an instance of the first clause. The conclusion is unaffected, since points of different members are *more* than `2⁻ⁿ` apart (line 105): "any set of diameter at most `2⁻ⁿ`" makes the sentence true.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `IsDiscreteFamily`, `IsSigmaLocallyFinite`, `IsSigmaDiscrete` | intervals `(1/(n+1),1/n)`; a nonempty set at two indices; empty members; topologies on ≤4 points | every nbhd of 0 meets infinitely many indices: not discrete; index set `{i,j}` not subsingleton; empty members harmless; 1+1+4+29+355 = 390 | definition is the intended one; Bing's form equivalent for injective indexing (both directions checked) | none |
| 1.2 Stone refinement | separation of a stage; `X = ∅`; indiscrete two-point space | centres ≥ `3·2⁻ⁿ` apart, minus `2·2⁻ⁿ`: points > `2⁻ⁿ` apart; `𝒱 = ∅` works; `𝒱 = {univ}` works | true; construction matches Mathlib's `D n i` (`Mathlib/Topology/EMetricSpace/Paracompact.lean`, lines 71–76) | C02 |
| 1.3 σ-discrete base | `x ∈ O`, `B(x, 2⁻ᵏ⁺¹) ⊆ O`, `x ∈ V ⊆ B(y, 2⁻ᵏ)` | `d(x, v) < 2⁻ᵏ + 2⁻ᵏ = 2⁻ᵏ⁺¹`, so `V ⊆ O`; `ℕ × ℕ` reindexing keeps stages discrete | true | none |
| 2.1 Michael | indiscrete two-point space; K-topology; the three moves of the converse | both sides hold; right side holds (Lindelöf), left fails, regularity fails; `Â` = complement of the union of members of `𝒲` missing `A`, closed union | true, both directions; forward needs no regularity | none |
| 2.2 Bing, collectionwise normality | `ι = ∅`; two members; K-topology `{0}`, `{1/n}`; `i ≠ j`, `n ≤ k` | trivial; normality; discrete pair without disjoint nbhds; point in `P n i ⊆ Q n j` and outside `closure (Q n j)`: contradiction | true; discreteness of stages used only through local finiteness | C01 |
| 2.3 perfect normality | `Iic ω₁`; K-topology; indiscrete two-point space | `{ω₁}` not Gδ; countable base, not normal; perfectly normal, not T₀; `O = ⋃ n, F n O` by regularity | true as a route step; conclusion `PerfectlyNormalSpace` (Mathlib: normal + closed sets Gδ, no T₀) | none |
| 2.4 pseudometrizability | continuity tail; inducing threshold; `J = ∅`; `Iic ω₁` | coordinates `n > N` lie in `[0, 1/(N+2)]`; `dist < f_D(x₀)/(n+1)` forces `f_D(x) > 0`; constant map; not first countable | true; no T₀ used | none |
| 3.1 Nagata–Smirnov and Bing | indiscrete two-point space; uncountable discrete space; `X = ∅`; Sorgenfrey line | regular, base `{univ}`, not T₀, not metrizable: both sides false; singletons one discrete stage; both sides true; T₃, not metrizable | true; Lean is the conjunction of both equivalences, as README | none |
| 3.2 Smirnov, `IsLocallyMetrizable` | `U = univ`; `Iio ω₁`; doubled origin; `Iic ω₁`; local finiteness of `𝓑 n` | forward holds; locally metrizable Hausdorff, not paracompact; compact, not Hausdorff; no metrizable nbhd of `ω₁`; finitely many `s`, each case gives a nbhd | true; each hypothesis needed | none |
| 3.3 `ι → ℕ` not normal | `A ∩ C`; point `b`; glued point; countable `ι`; finite `Y` | injection `ι → ℕ` impossible; `b ∈ C` (value 0 never, `k ≥ 2` once); labels in `G` ≤ `m(n)` so glued point agrees with `b` on `G`; metrizable; compact Hausdorff | true; uncountability used only for `A ∩ C = ∅` | none |
| Scope sentence on `UniformSpace.metrizableSpace` | indiscrete two-point uniform space | uniformity `{univ}` countably generated; not T₀, not metrizable; declaration assumes `[T0Space X]` | sentence false as written | R01 |

- Source locators checked against the text: 3 of Dydak (Corollary 3.11 at Dydak line 808, Corollary 5.5 at Dydak line 1084, Corollary 5.6 at Dydak line 1094); 0 of the other five sources.
- Library declarations opened at the pin: 29 cited Mathlib names elaborated with `#check`, all present, in the files the supplier contracts give; `Counterexample.Omega1Space.not_normalSpace_Iio_prod_Iic_omega_one` at `Counterexamples/Omega1Space.lean` line 57; `not_metrizableSpace`, `OrderClosedTopology`, `CompletelyNormalSpace` for the Sorgenfrey line at `Counterexamples/SorgenfreyLine.lean` lines 315, 136, 166.
- Duplication by object: no σ-locally finite or σ-discrete family, collectionwise normality, locally metrizable space, Nagata–Smirnov, Bing or Smirnov theorem, or non-normal power of `ℕ` in the pinned Mathlib (including `Counterexamples` and `Archive`) or Tau Ceti; `PseudoMetrizableSpace → ParacompactSpace` is not an instance at the pin.
- Cross-roadmap citations: the README makes none. Dependency check output: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates, `sorry` the only warning (8 theorems); the 12 elaborated types were compared with the README statements, none lost a binder, nothing changed. One-tactic probe (`infer_instance`, `rfl`, `simp`, `simp_all`, `tauto`, `aesop`): closes none of the 8.
- Headline theorems (Stone 1.2 and 1.3, Michael 2.1, Bing 2.2, 2.4, Nagata–Smirnov and Bing 3.1, Smirnov 3.2, Stone 3.3): all eight stated in `Suggested.lean`; 2.3 is a route step and follows from 2.4 with Mathlib's instance. No `set_option`, no sorry'd data, single `import Mathlib`. No change outside the folder.
- Pull-request text read against the head: title and description agree with it (new roadmap, 8 theorems, 4 definitions, Mathlib the only supplier).
- Overlap check: read SorgenfreyLineAndClassicalCounterexamples, PeanoContinuaAndHahnMazurkiewicz, CantorSetAndCompactMetricSpaces; nothing shared (the first owns paracompactness and perfect normality of the Sorgenfrey line, which this roadmap's scope excludes; none owns a metrization criterion or a family notion of 1.1). Ownership was searched by object in the roadmaps on main and at the open heads.

Source independence: 5 passages compared with 1 source (Dydak: the statement and the two proof steps of Corollary 3.11, Corollaries 5.5 and 5.6), none shared beyond formulas the mathematics forces; largest share Munkres and Dydak, 6 of 19 locators each; contents compared with Dydak (sections 1–9): independent; Munkres's text and table of contents could not be read, and by the section numbers the README cites its layers run §41, §41, §40, §40, §42, not in the book's order.

Research link: The headline targets are the theorems of Stone (1948), Michael (1953), Bing (1951) and Nagata–Smirnov; Dydak (2003) derives them (Corollaries 3.11, 5.5, 5.6) inside a calculus of partitions of unity used for dimension theory. Rests on the README's references and on Dydak §§3, 5, 6.

## Not verifiable

- Stone 1948 (Corollary 1 and Remark, p. 979; Theorem 3, pp. 980–981; Theorem 4): the AMS archive and Project Euclid refused automated access; the sources service found no copy it could classify. Requested.
- Michael 1953 (Theorem 1, p. 831; Lemmas 1–2; p. 833): same, AMS archive. Requested.
- Bing 1951 (definitions p. 176; Theorem 2, p. 177; Theorem 3, pp. 178–179): Cambridge Core host not classified by the sources service. Requested.
- Rudin 1969 (p. 603): same, AMS archive; the construction was checked against Mathlib's proof instead, which cites it. Requested.
- Munkres (Lemma 40.1, Theorems 40.3, 41.5, 42.1, Lemma 41.3): a textbook in copyright, no legal copy; the README itself takes the numbering from a third party's lecture notes. Requested.
- The Conventions' sentence on which separation axioms Munkres, Michael and Stone build into "regular" and "paracompact" rests on these unread texts.
- The exhaustive enumeration over the 390 topologies (Check of 1.1) was not rerun; the count 390 and the equivalence it tests were verified by argument.
- `packages/MetrizationTheorems/sources.toml`: the sources service recorded Dydak; it also recorded Stone 1948 from a response that was an access-denied page, and that entry was removed.

Automatic checks set aside as false positives: none failed; one lead, that the Mathlib counterexample name cited in the Check of 2.2 occurs nowhere, is wrong: the name is declared in Mathlib's `Counterexamples` folder, which the search did not cover.

## Source issues

- none

## For the human reviewers

- **Scope.** The headline theorems date from 1948–1953 and are textbook general topology (Munkres ch. 6); the only later source is Dydak's 2003 arXiv paper. Whether this is within "mainstream research mathematics" is yours to decide.
- **Licence.** README line 512–513 takes Munkres's theorem numbers from R. Gardner's lecture notes on Munkres (a third party's notes on a book in copyright), not from the book.
- **Not tested.** Munkres shares the largest number of locators (6 of 19, with Dydak); its text and table of contents were not read, so wording and arrangement were compared with Dydak only.
