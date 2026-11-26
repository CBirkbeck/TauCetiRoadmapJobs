# Review of DeterminantsOfThetaLiftChains (pull request #3160 at 8c6c8b8)
Folder: `TauCetiRoadmap/ShortGRH/DeterminantsOfThetaLiftChains/`
**Verdict:** needs changes

**Summary.** Needs changes. The fifteen sampled sections and Theorem C agree with the formal proof at the cited commit, with one exception: the size bound of 5.11 (a) drops the bound on the path datum, without which it fails. The other findings are about supply and form: the 22 "ShortGRH background" prerequisites still have no owner, this roadmap and five sibling roadmaps supply each other, the layers and sections still follow the formal proof's table of contents, two method lines repeat its docstrings almost word for word, and the pull request still changes files outside its roadmap folders. Of the earlier findings, the missing supplier roadmap, the doubled power of the twist in 6.2, the second statement of Theorem C and the uncited complementary-space identity are repaired. There are three small corrections and two format notes; scope, licence and the umbrella are left to the human reviewers.

## R01 (P1) — The 22 prerequisites labelled "ShortGRH background" are needed by targets and owned by no roadmap section

An implementer of 2.2, 3.6, 3.9, 4.2, 5.10 or 5.11 has nothing in the library's plan to build on for these inputs: each is a theorem that no layer here, no supplier section and no pinned declaration provides. The Conventions (lines 34–36) define such an entry as a result "that no roadmap section states in the form used", and the family index says it is "a result still to be stated as a numbered target" that "creates no dependency in the umbrella until then". The entries now give the form used and the place in [ShortProof], which makes each precise; a pointer into the formal proof is a citation, not a supplier. Among the 22 are the Rallis inner product formula for sharp finite data (2.2, 4.2), the continuation and functional equation of `L^S(x, ν)` with the constant term as a Tate integral (3.6), the mixed Schrödinger–Fock model and strong approximation (3.5), the seesaw of periods (5.9), and the integral branching matrix with its norm bound (5.10).

Smallest change: state each entry as a numbered target, here or in a roadmap earlier in the order (the index names "a background roadmap of this family"), and replace the label by the section number. Until the owner exists, the targets that need these entries are unsupported.

## R02 (P2) — The size bound of 5.11 (a) is false for path data of arbitrary bound

In 5.11 (a), lines 1295–1296, the second sentence reads: "At the trivial twist, if the `σ`-conjugates of the values have squared norms at most `B_Y` and `B_Ỹ`, then `|σ(Ξ)| ≤ exp(x^200 b²)·√B_Y·√B_Ỹ`", for the "path datum `Ψ` on the last path" of the first sentence, whose bound `N` is arbitrary (5.3 (c)). `Ξ` is linear in `Ψ` (5.10 (b)), and if `Ψ` is a path datum with bound `N` then `k·Ψ` is one with bound `k·N` for every integer `k ≥ 1`: invariance and the vanishing condition are unchanged, and the values are sums of at most `k·N` roots of unity. So `|σ(Ξ)|` grows like `k` while the right-hand side does not move.

The formal proof assumes the bound: ShortProof `New/Determinant/AuxiliaryForms/SpanningForms.lean` lines 325–331 take `Ψ` a path datum with the bound `lastPathBound 1`, which lines 63–64 define as `vectorCountBound^{m²}·edgeMatrixCountBound^{2m}`. The first sentence of (a), on integrality, is stated there for every bound (lines 223–232) and is right as written.

Smallest change: in the second sentence, add "for a path datum with bound `#(O_E/𝔟)^{2n_m·m²}·(#(O_E/𝔟)^{(2n_m)²})^{2m}`", the bound that 5.6 and 5.9 (b) produce at the trivial twist.

## R03 (P2) — This roadmap and five sibling roadmaps supply each other

No order of the family places every supplier of this roadmap before it, so it cannot be merged or worked "suppliers first" as a unit. The pairs, with the sections on each side:

- NormsOfThetaLiftsAndExchangeIdentities: 1.3 and 6.2 here need its §1.3, §2.5 and §7.5; its §§1.5, 2.3–2.7, 3.1, 3.4, 4.1, 4.2, 6.2–6.6, 7.1–7.5 need 1.1, 1.3, 2.1, 2.2, 3.1 and 3.10 here.
- CongruencesOfTwistedThetaLifts: 6.2 here needs its §7.3; its §§2.2, 2.7, 7.1–7.3 need 1.1, 1.3, 2.1 and 4.4 (d) here.
- SecondMomentsOfPoincareSeries: 2.2 and 4.4 here need its §§2.1a, 2.3, 2.4; its §2.4 needs 2.2 (a) here (line 334 there) and its line 747 needs 5.4 (a).
- OneSidedPrimeSumBoundsAndAdmissibleData: most sections here need its §§1.2–1.4, 3.2–3.4, 5.1; its §5.1 needs 4.3 here (line 797 there) and its §6.1 needs 6.3.
- PairsOfFramesAtOnePlace: 5.4 and 5.5 here need its §8.1 and §8.6; SecondMomentsOfPoincareSeries, which this roadmap supplies, needs it in turn.

I checked that the sections themselves form no cycle (for example 2.2 → SecondMoments §2.4 → 4.4, and 1.3 → Norms §7.5 → 6.2), and the mechanical dependency check reports none; it does not treat the siblings as separate roadmaps. The second owner of Theorem C that the last review reported is gone: OneSided now cites 6.3.

Smallest change: give each pair one direction by moving the shared definitions down. Layer 1 (pairs, ratios, regular families, negligible numbers), 2.1, 2.2 (a) and 5.4 (a) are consumed by roadmaps that this one consumes; placed in the roadmap that owns the data or in a member before both, they leave this roadmap downstream of Norms, Congruences and SecondMoments. Theorem C (6.3) and 4.3 (d) would then stand after OneSided's Layers 1–5, with its §§5.1 and 6.1 as their consumers in a later member.

## R04 (P2) — The layers and sections still follow the table of contents of [ShortProof]

The principle that a roadmap's organisation is its own is not met, and only one sentence changed since the last review (the Conventions no longer say the family "follows" the proof; the family index, line 223, still does). The pairs, against ShortProof `CONTENTS.md` lines 269–317:

- Layer 2 ↔ "Norms of theta lifts"; Layer 3 ↔ "The exchange identity"; Layer 4 ↔ "The norm of a chain of lifts"; Layer 5 ↔ "Auxiliary forms": same order, same scope, three of the four titles unchanged.
- 5.1–5.11 ↔ the eleven files of that last group, one section per file (5.1 ↔ GridPaths, 5.2 ↔ RegularParameters, 5.3 ↔ PathData, 5.4 ↔ DeepLevelPoincarePeriod, 5.5 ↔ DeepLevelVanishing, 5.6 ↔ GridFirstColumns, 5.7 ↔ FirstPath, 5.8 ↔ Turns, 5.9 ↔ DiagonalTurns, 5.10 ↔ LastPath, 5.11 ↔ SpanningForms).
- 4.1–4.4 ↔ TriangleNorms, TriangleLifts, ChainNorms, NormOfChain; 3.2–3.10 ↔ the files of the exchange group, almost in order.
- Titles that are file titles: 3.12 (line 293), 5.7 (line 315), 5.10 (line 316), 6.3 (line 274).

The roadmap's own choices are Layer 1 (drawn from two groups), 3.11 (moved from the chain group) and Layer 6. The dependency lines force Layers 2 and 3 before 4, then 5, then 6 (4.3 needs 3.12; 5.7 needs 4.1–4.3; 6.1 and 6.2 need 5.11 and 4.4). They do not force the division of Layer 5: 5.2 is used only by 5.10, 5.4 only by 5.5, and 5.8–5.9 do not use 5.7. The description gives as the reason that section numbers are cited across the family; a regrouping made in the same pull request can update those citations.

Smallest change: keep the forced order of the layers; group Layer 5 by what 6.1 needs (paths and path data: 5.1 with 5.3; the deep-level criterion: 5.4 with 5.5; the transfer of periods: 5.6–5.9; the last path: 5.2 with 5.10 and 5.11); title the sections in the roadmap's own words. The published locators asked for last time are now in the *Origin* lines of 2.2, 3.9, 4.4 and 5.7.

## R05 (P2) — Two *Method* lines and one *Origin* line still repeat [ShortProof]'s docstrings

The two passages named last time (the *Method* lines of 3.7 and 3.9) are rewritten; the others were to receive the same treatment and did not.

- **5.9**, *Method* (lines 1224–1226) against ShortProof `New/Determinant/AuxiliaryForms/DiagonalTurns.lean` lines 7–9: 19 consecutive words around the formula ("a seesaw moves the period to the space … common to both paths, where the line contributes a theta kernel"), then the next two clauses in the same words and order.
- **5.6**, *Method* (lines 1149–1151) against `GridFirstColumns.lean` lines 12–15: 14 consecutive words ("the product of the point data of the edges computes the period of the"), then the second sentence clause by clause; the last sentence of the statement (lines 1157–1158) shares 17 words with line 19 there.
- **3.7**, *Origin* (lines 644–645) against `VanishingDescends.lean` lines 8–9: the same sentence with `H` replaced by `H^j`.

Rewritten, 5.9 would read: "A diagonal turn takes three steps. The seesaw of periods first rewrites the period as an integral over the group of `Ỹ^{j+1}_j = Y^{j+1}_j`, the one space the old and the new path share; the added line enters there through its own theta kernel. The flip of the pair of the line and the square law of 3.12 then interchange the lift and the transposed lift, and the seesaw, applied again, returns a period on the new path. For (b), compose along the turns of 5.1 starting from the last path; the constants multiply."

5.6: "For one tuple of matrices the two iterated transposed lifts are lifts with point data, so their diagonal period is the period attached to the indicator of that tuple. Summing the translates of this indicator by the admissible families, each against the edge characters, gives a function with the invariance of a path datum; the period is invariant too, so the sum multiplies it by the number of translates."

3.7, *Origin*: "particular to this proof: a descent of vanishing. If every integral `I_large` of the pair enlarged by `j` hyperbolic planes is zero, for all Schwartz vectors and standard row data, the same holds for the pair itself."

## R06 (P2) — The pull request changes files outside its roadmap folders

`umbrellas/GRH.toml` and `umbrellas/GRH-targets.md` are rewritten (the root of the umbrella GRH moves from RiemannHypothesisForDirichletLFunctions to ShortGRH), and a line for ShortGRH is added by hand to the roadmap list of the repository's top-level `README.md`. CONTRIBUTING.md (line 144) says a roadmap pull request touches only its own directory and that the list is regenerated after the merge. Smallest change: drop the line from `README.md`, and move the umbrella change to a pull request of its own.

## C01 — 3.10 does not say which characters the kernels of its first form carry

In the first form of 3.10 (lines 748–753) the class sum is "of `α(det h)` times the kernel of `(W, I_a)` with data `Φ`" and the integral is of "the kernel of `(V′, W)` with data `Ψ`"; a theta kernel is defined only with a character on each space (Conventions), and the normalised form that follows does name them. The formal statement fixes `υ₁^l` on `W` and on `V′` and the trivial character on `I_a` (ShortProof `New/Determinant/Exchange/ExplicitMatching.lean` lines 678–680, 714–720). Add these three characters.

## C02 — `n_m` and `K₀` are used and never defined

`n_m` occurs in the bounds of 5.6, 5.9 and 5.10 (lines 1156, 1229, 1232, 1263, 1267) and `K₀` in 4.3 (d) and 5.10 (a) (lines 934, 1260); neither is in the Conventions or the table of symbols. In the formal proof they are the rank of `Y_m` (`D.n D.m`; `2n_m` bounds the ranks of the nodes) and the group of integral points (`stdLevel`). Add both to the table.

## C03 — The square constant `β` may vanish, and 4.1 (b) and 4.3 (a) divide by it

4.1 (b) writes the commutation as `w_t(n)·a∘d = (w_t(n + 2)/β̄_t)·d∘a` and 4.3 (a) as `(β̄(ϑ))⁻¹·N_{n+2}(ϑ)·d∘a`, while "modulus up to a norm power" (1.1 (e)) allows `C = 0`, and the constant comes from the `κ` of 3.12, which "may be `0`". The formal proof reads the scalar as `0` where `β_t = 0` (ShortProof `New/Determinant/Chain/TriangleNorms.lean` lines 194–196). Say so in 4.1 (b), or state the relation as `β̄_t·w_t(n)·a∘d = w_t(n + 2)·d∘a` if that is what is meant.

## N01 — The letter `k`

`k` is the rank `r + 1 − m` (Conventions), a matrix in `GL_n` (matched functions; 3.3), and an integer exponent (1.1 (e), 1.2 (a)); 3.7 already changed its own `k` to `k₀`.

## N02 — Pointer lines

Every section ends with a line of [ShortProof] files and declaration names; the family index allows it, and the repository README's porting guidance would place such a file map in one provenance section.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.3 (a)–(d), negligible | `θ_ι = 1` | `Nm Q = 1`, ratios `1`, height `0 ≤ x₁`; clauses equal FitTwists 164–231 (`ClearsProjection`, `mainPair`, `sum_le`, `IsNegligible`) | holds | none |
| 1.1 (a) main pair | `z ≥ 10` | index type has `20 + (2z − 20) = 2z` elements iff `z ≥ 10`; `κ_j + r ≤ c + t` as FitTwists 124–136 | holds | none |
| 1.4 | `A = ∅`; `m = 1` | empty product, height `0`; `m(m−1)/2 ≤ m²` and exactly `m²` turn pairs, each `≤ t·x₁`; Moduli 227–231 | holds | none |
| 2.1 (d), 2.2 (e) | Satake parameters | extra roots `χ_W q^{r′/2+i}`, `0 ≤ i < t′`; factor `1 − q^{t−1}αX` vanishes at `X = (αq^{t−1})⁻¹` | holds | none |
| 2.2 `c_Q` | `ϑ = 1`; one place | `c_Q(1) = 1`; `#inj(k^r → k^{r+t})/q^{r²} = q^{rt}∏_{t<i≤t+r}(1 − q^{−i})` | holds | none |
| 3.1 (b), (d), (e) | — | characters `ν·υ₁^{n/2}`, `υ₁^{#b}` as EquivariantDifference 42–50; `C·|c|² = L_*·ℓ`, `L_*(−e) = L_*(e)⁻¹` as LargeTriple 436–447 | holds | none |
| 3.4 (a)–(c) | — | (c) = TheoremForPartners 234–250; (a) = EquivariantDifference 270–293; (b) = StableSpacesStandardData 754–779 (standard datum in `M` by 3.1 (c)) | holds | none |
| 3.7 | `j = 1`; `j ≥ 2` | hypotheses `j ≥ 1`, `rank W` even, `k₀ ≤ μ`, `−k₀ ≤ rank V − rank W/2` = VanishingDescends 145–162 | holds | wording (R05) |
| 3.10 | weights | first form: weight of `(α/υ₁^{s₀})⁻¹` is `#ι + s₀`; normalised: `#ι − l + b + d`; equal since `s₀ = b + d − l`; 3.9 needs `μ ≥ s₀` ✓ | holds | characters (C01) |
| 4.1 (a) | zero ring; `𝔽_q`, `N = T = j = 1` | `1 = 1`; `(q−1)²q`, `e = NTj + T²j(j−1)/2 = 1` | holds | none |
| 4.1 (b), (c) | `β_t = 0` | README divides by `β̄_t`; TriangleNorms 194–196 sets the scalar to `0` | ambiguous | C03 |
| 4.2 (a), (b) | — | = TriangleLifts 487–506; block length `t − 1` for `Ỹ` (line 335) | holds | none |
| 4.4 (a)–(d) (headline input) | `ϑ = 1`; `d = 0`; `m = 1` | ratio `1 = 1`; all determinants `1`; empty `R^quo` product; NormOfChain 303–310, 122–126, 419–427, 499–506 | holds | none |
| 5.1 | `m = 0`; `m = 1` | first = last; one diagonal turn, `m² = 1` square; GridPaths 175–185, 337–344 | holds | none |
| 5.3 | — | `𝔪 = π_M^b·Q`; edge characters as PathData 169–174; path datum = lines 533–543; transfer = Turns 797–804 | holds | none |
| 5.7 (a)–(c) | — | = FirstPath 228–232, 347–355, 435–455; bound `edgeMatrixCountBound^{2m}` | holds | none |
| 5.8 (a), (b) | — | = Turns 709–733, 938–951 (`R^turn_{ba}` for `Ỹ`, factor `1`) | holds | none |
| 5.9 (a), (b) | — | factors `#(O_E/𝔪)^{2n_m}` and its `m²`-th power = DiagonalTurns 622–629, 645–653 | holds | wording (R05) |
| 5.11 (a), size | `Ψ ↦ k·Ψ` | left side `k·|σ(Ξ)|`, right side unchanged; source assumes bound `lastPathBound 1` | fails | R02 |
| 5.11 (a) integrality, (b) | — | = SpanningForms 217–232 (any bound), 765–780 (`x^202`) | holds | none |
| 6.1 | — | `x^99 + x^202 b² ≤ 2x₁²b²`; `γ = c/c(1)`, `γ(1) = 1`; LongForms `exists_span_isAuxiliaryForm_eq_top` | holds | none |
| 6.2 (a)–(c) | `j ≥ 2` | `Z_j(θ) = vol` at `θ^j` (NormOfChain 73); `k·log b·β_tot = f·a·(log b)⁴/m`; `m` terms sum to `d(f a (log b)⁴ − h_main)`; scalar `≤ d·b` | holds | none (was R03) |
| 6.3 Theorem C (headline) | `n′ ≤ 4d/b²` | `n′(2x₁²b² + b) ≤ d·b`; `c + 2δ ≥ d(h_main − f a (log b)⁴ − 2b) ≥ d(h_main − 3 f a (log b)⁴)`; LongForms `integral_forms_long` | holds | none |
| `Suggested.lean` | elaboration | no declarations; no output; the four Mathlib names of the docstring exist at the pin | holds | none |

- Source locators checked against the text: 31 [ShortProof] statements in 17 files of `src/New/Determinant` at commit 72fead1, with `CONTENTS.md` and `README.md`; Gan–Qiu–Takeda Theorem 7.3 (GanQiuTakeda2014 line 1693) and Propositions 11.1, 11.2 (lines 2588, 2615; range `d(n) < m ≤ 2·d(n)`); Rallis Proposition 1.1 (Rallis1984 line 345).
- Library declarations opened at the pin: Mathlib `NumberTheory/NumberField/CMField.lean:22`, `NumberTheory/NumberField/AdeleRing.lean:56`, `RingTheory/DedekindDomain/FiniteAdeleRing.lean:95`, `LinearAlgebra/UnitaryGroup.lean:105`; Tau Ceti searched for Weil representations, theta kernels and theta lifts of unitary pairs: none.
- Cross-roadmap citations resolved: 34 section ids in eight sibling roadmaps at this head and 15 in six roadmaps on main (ThetaKernelsForUnitaryDualPairs §§3.45, 4.4a, 5.7c, 6.13a; ThetaLiftsForDefiniteUnitaryGroups §§1.2, 2.2, 6.11; DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a; IntegralWeylModulesOfGeneralLinearGroups §1.1; HermitianFormsAndLattices §1.1; RowTowerAndRallisIdentities §§5.5–5.8); all exist. Norms §7.5 (d), SecondMoments §§2.1a (c), 2.3 (b), 2.4 (c) and Congruences §7.3 (b) state what is taken from them.
- Earlier findings: the missing supplier roadmap, 6.2, the uncited §6.11 and the four small corrections are repaired; background ownership (R01), mutual supply (R03), arrangement (R04), wording (R05) and outside changes (R06) are partly or not repaired.
- Dependency check: `depcheck: 122 roadmaps, 1385 edges, 0 problem(s)`; it does not see the edges between members of the family (R03).
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output; with no declaration there was no signature to compare and no one-tactic probe to run.
- Headline theorems: Theorem C (6.3) and its inputs 2.2, 3.9, 4.4; none is statable at the pins, and the module docstring says so and names the missing carriers.

Overlap check: read ThetaLiftsForDefiniteUnitaryGroups, ThetaKernelsForUnitaryDualPairs, RowTowerAndRallisIdentities and SeesawForThetaChains (main; an open revision keeps the cited ids). The complementary-space identity is owned by ThetaLiftsForDefiniteUnitaryGroups §6.11 and 3.9 is stated as a variant with its differences; the Rallis formula for eigenforms is owned by ThetaKernelsForUnitaryDualPairs §6.13a and Layer 2 uses the sharp-data form (R01); RowTowerAndRallisIdentities Layer 5 treats another family's chain. Nothing else shared.

Source independence: 12 passages compared with 3 sources (ShortProof, GanQiuTakeda2014, Rallis1984); three share wording with ShortProof (R05). Largest share: ShortProof, 50 of 60 locators. Contents compared with ShortProof `CONTENTS.md`: Layers 2–5 and the sections of Layers 4 and 5 follow it (R04).

Research link: Theorem C is the lower bound in the route of an unpublished formal proof of GRH for Dirichlet L-functions ([ShortProof] README, crediting Levent Alpöge). Its inputs adapt the Rallis inner product formula (Rallis 1984; Gan–Qiu–Takeda 2014, Props. 11.1–11.2) and the first term identity (Kudla–Rallis 1994; Gan–Qiu–Takeda, Thm 7.3). Rests on the README and those texts.

## Not verifiable

- Goodman and Wallach (2009), Theorem 8.1.1, and Zhelobenko (1973), Chapter X (5.10): not opened; no text in the sources cache.
- J.-S. Li (1992), Kudla and Rallis (1994), Kudla (1984, 1986), Ichino (2004), Rallis (1982), Prasad and Schulze-Pillot (2008), Muić (2015): cited in *Origin* lines without a theorem number, so there was no locator to check.
- Sections outside the sample (2.1, 3.2, 3.3, 3.5, 3.6, 3.8, 3.9, 3.11, 3.12, 4.3, 5.2, 5.4, 5.5, 5.6, 5.10) were read and tested for consistency, not compared line by line with their Lean statements.

Automatic checks set aside as false positives: the report of TeX syntax in 2.1 (d) is a code span that runs over a line break (`H_w(X) = Σ_i (−X)^i q^{i(i−1)/2} T_{w,i}`); the formula is inside the span.

## Source issues

- none

## For the human reviewers

- **Scope.** The family's end theorem is GRH for Dirichlet L-functions. Most sections are "particular to this proof" and rest only on [ShortProof], an unpublished repository that calls itself a "research artifact"; no refereed source states Theorem C (6.3).
- **Licence.** [ShortProof] is under Apache 2.0 (its `README.md`); it says the Lean text and documents were written by an AI and parts were ported from an earlier proof. Whether the docstring wording of R05 may be reused is yours to decide.
- **Umbrella.** The pull request re-roots the umbrella GRH from RiemannHypothesisForDirichletLFunctions to ShortGRH (`umbrellas/GRH.toml`) while 152 background results of the new route are, by its own description, not yet targets.
- **Supply inside a family.** Whether members of one family opened in a single pull request may supply each other when their sections are acyclic (R03) is a rule to confirm; the description lists it under "Not done".
