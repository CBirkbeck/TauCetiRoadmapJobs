# Review of NoncommutativeFlatness (pull request #2618 at 2ec47ed)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 63 lines changed since `9775177`: the two small corrections and the missing reference entry of the previous review are repaired, and the rewritten argument for the Small–Fisher step in 4.3 (product-closed nil sets, one chain condition) was reworked line by line and holds, which answers the question the previous review left open. There are three format notes, none blocking, and four points for the human reviewers.

## N01 — `letI` in two theorem statements

`isMoritaEquivalent_tfae` (`Suggested.lean` lines 1144–1150) and `BalancedTor.outerSMulCommClass` (lines 1273–1274) bring module structures into scope with `letI` inside the statement; a named instance argument reads and applies more easily.

## N02 — "current Tau Ceti `main`" and "not yet at this roadmap's pin" date the Scope paragraph

README lines 1289–1290 (and "on Tau Ceti `main`", line 1221) describe the library on the day of writing. "(`IsFinitelyPresentedFunctor` in ArtinAlgebras' `Suggested.lean`)" alone is timeless; the remark about the pin already stands in the description.

## N03 — "not independently audited" in step 1 of 4.3 describes the state of the text, not the mathematics

README line 1066: "the extension to product-closed sets and the written Noetherian argument are this roadmap's, not independently audited". The first half tells a reader whose argument it is and should stay; the last three words will read oddly a year from now, and the argument does check (see the 4.3 rows of the table kept with this review: the selection, the strictly descending intersections, the independent images and the König step were each recomputed). Dropping "not independently audited" would do.

## Previous findings

The previous review, of `9775177`, had no finding; its other remarks are accounted for here.

- C01 (`LocallySmall` instance a `sorry`) — repaired: "`instance [EssentiallySmall.{w} C] : LocallySmall.{w} (ModCat.{w} C) := inferInstance`"; the file elaborates with 202 `sorry` warnings.
- C02 (`IsIndObject` bridge "for additive `C`") — repaired: "For essentially small additive `C`, `Flat F` agrees with `IsIndObject` on `F ⋙ forget`", matching the `[EssentiallySmall.{v} C]` binder of `ModCat.flat_iff_isIndObject`.
- N01 (`letI` in two statements) — not repaired: both statements unchanged (N01 above).
- N02 (dated wording in Scope) — not repaired: "implemented on current Tau Ceti `main` as … not yet at this roadmap's pin", now lines 1289–1290 (N02 above).
- N03 (Small's article not in the References) — repaired: "([Small, Thm., p. 1035])" in 3.5, with the entry "[Small] L. W. Small, *An example in Noetherian rings*, Proc. Nat. Acad. Sci. U.S.A. 54 (1965), 1035–1036" under References.
- Question on 4.3, step 1 — answered: the README now writes the argument out for product-closed sets under one chain condition, and says that this extension is its own. Each step was verified (table below); the repair introduced no false sentence.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 4.3 step 1, chain conditions on annihilators | `l(X) = {s : s·∑xM = 0}`; `r(X) = {s : sM ⊆ ⋂ ker x}` | ascending left annihilators ↔ descending `∑xM` over `r(l(X))`; `A = r(X)` equals maps into `∑_{a∈A} aM` | ACC from DCC (left), from ACC (right) | none |
| 4.3 step 1, the selection | `xᵢ` with `l(xᵢ)` maximal among `i`-th terms of non-vanishing sequences extending the prefix; `t = xᵢ⋯xₙ` | if `s t xᵢ ≠ 0` then `tᵏ` is again an admissible `i`-th term, `l(tᵏ) = l(xᵢ)`, so `s tᵏ ≠ 0` for all `k` | contradiction with `t` nilpotent; only products and nilpotency used | none |
| 4.3 step 1, Artinian case | `sᵢM = sᵢxᵢ₊₁M` for `i ≥ k`; `m₀` with `sⱼ₊₁m₀ ≠ 0` | peel `aᵢ₋₁ = aᵢ − xᵢb` from `i = j+1` down to `k+1`: `sᵢaᵢ₋₁ = 0` kept (`sₙxᵢ = 0`, `n ≥ i`), `sⱼ₊₁a_k ≠ 0` | `⋂_{i=k}^{j} ker sᵢ ⊋ ⋂_{i=k}^{j+1} ker sᵢ` | none |
| 4.3 step 1, Noetherian case | `ker pᵢ = ker pᵢ₊₁` for `i ≥ k`; `∑_{i=a}^{b} uᵢ = 0` | `xₐ₊₁` kills `uᵢ`, `i > a`, and is injective on `Uₐ`, so `uₐ = 0`; `Uᵢ = pᵢM ≠ 0` | infinite direct sum, contradicts ACC | none |
| 4.3 step 2, uniform exponent | finite `F ⊆ I`; sum of `m` members of `I` | tree of nonzero words is prefix-closed (suffix-closed on the left), `≤ |F|` children; `N`-th power is a sum of words of length `N` | span is a nil nonunital subring; nilpotent by the printed theorems | none |
| `Module.End.exists_prod_eq_zero_of_isNilpotent` | `M = 0`; `I = ∅`; `I = {0}`; `I = {E₁₂} ⊆ M₂(k)` | `n = 0` (`1 = 0`); `n = 1` vacuous; `n = 1`; `n = 2`, `E₁₂² = 0` | true; elaborated type has both closure hypotheses | none |
| 2.3 `IsIndObject` bridge | prose against `ModCat.flat_iff_isIndObject` | prose: essentially small additive; Lean: `[EssentiallySmall.{v} C] [HasFiniteBiproducts C]` | agree | none |
| 3.5 Small's triangular ring | `D = ℤ`, `n = 1` | `ℚ` is a `ℤ`-submodule of `ℚ` of projective dimension `1`, so left `2`, right `1 = wgldim` | consistent with 3.4; only the citation key changed | none |
| 0.1 `LocallySmall` instance | `inferInstance` | elaborates; 202 `sorry` warnings | follows from the Grothendieck instance | none |

The rows for untouched statements stand as in the previous review, of `9775177`.

- Source locators checked against the text: 0 new; Fisher's and Small's articles could not be read (below). The mathematics of the changed passages was verified by computation instead.
- Library at the pins: searched Mathlib and Tau Ceti for a nilpotence theorem for nil subsets of endomorphism rings and for T-nilpotence; none exists (`Mathlib/RingTheory/HopkinsLevitzki.lean` has only the Hopkins–Levitzki theorem). No other roadmap, open or on main, states the Small–Fisher theorem.
- Elaboration of `Suggested.lean` at the pins: exit 0, no error, 202 `sorry` warnings and nothing else; single `import Mathlib` plus `TauCeti.*` modules; no `set_option`; no definition whose data is `sorry`.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder; no private path in the folder.
- Title and description against the head: 2,254 lines and 202 `sorry` warnings agree with the head; layer ranges and suppliers unchanged; no sentence is contradicted.
- Headline theorems: unchanged by the diff; all stated, as in the previous review.

Overlap check: read the scope sections of QuiverRepresentations and PrestableInfinityCategories (open) again, ArtinAlgebras (main) as read in the previous review; neither open roadmap owns modules over preadditive categories, flatness, perfect rings or nil subsets of endomorphism rings; the owners stand as in the previous review (`mod C` and Krull–Schmidt categories — ArtinAlgebras §§1.1, 0.2, cited; `Tor ≅ Tor'` — SpectralSequencesAndConvergencePartII §4.1, cited); the changed passages share nothing with them, no other open pull request changes this roadmap, and no cited id is dropped.

Source independence: changed passages only; 2 changed passages (4.3 steps 1–2, the Check on Small's ring in 3.5), 0 compared, because neither Fisher's nor Small's article could be read; largest share Mitchell, 14 locators, as counted in the previous review; no layer added, removed or reordered, so the arrangement was not compared again.

Research link: The headline targets are Bass's Theorem P (Bass 1960) with its categorical form (Simson 1977, Harada 1973), Crawley-Boevey's representation theorem (1994) and Auslander's global-dimension theorems (1955); the README names flat-dominant dimension (Hoshino 1989, Xi 2021) as a user. Rests on the README and on Bass and Auslander read at their locators.

## Not verifiable

- [Fisher-Nil] (Lemmas 1.1, 1.3, Thms. 1.5, 2.1) and [Small] (Thm., p. 1035; p. 1036): the publishers' pages could not be fetched from a host the project accepts. Not checked: that Fisher's Lemma 1.3 makes its selection as step 1 describes it, and that Thms. 1.5 and 2.1 are stated for nil subrings of `End_R(M)` with `M` Artinian, respectively Noetherian (step 2 uses them in that form).
- The unread sources of the previous review remain unread; the diff does not touch their locators except the two above.
- The description's "`check_roadmap_topics.py` passes", its "separate local Lean probes" and its count of 307 declarations were not rerun.

Automatic checks set aside as false positives: four names reported as undeclared are two Tau Ceti declarations that exist at the pin, a lemma of Tau Ceti's balanced tensor product, and the notation `Tor_0`; eight reports of TeX syntax are inside code spans that wrap over a line break; the subsection "Layer 4 checks" is read as a layer heading; the Prop-valued instances and the `sorry` proof fields of definitions with real data are not `sorry` data; the reports that statements lost a smallness binder are instance binders that the elaborated statements do carry.

## Source issues

- none

## For the human reviewers

- **Scope.** Clause 4″ of the categorical Theorem P (right simple subobjects and orthogonal idempotents, README lines 1133–1134) is, in the README's words, this roadmap's own extension of Bass's clause (7); no refereed source states it.
- **Scope.** `Module.End.exists_prod_eq_zero_of_isNilpotent` (4.3) is stated for product-closed nil sets; the README (lines 1063–1066) says the sources print it for nil subrings and nil one-sided ideals and that the extension and the Noetherian argument are its own.
- **Scope.** The README plans changes to existing Tau Ceti declarations "without shims" (`IsSuperfluous`, `globalDimension`, `IsSemiperfectRing`, and ArtinAlgebras §1.1's `IsFinitelyPresentedFunctor`; lines 175, 732, 869, 1289–1300).
- **Not tested.** Mitchell, *Rings with several objects*, has the largest share of locators (14); neither its text nor its contents page could be read, so wording and arrangement were not compared with it.
