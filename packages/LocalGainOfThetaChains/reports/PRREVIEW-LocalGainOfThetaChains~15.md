# Review of LocalGainOfThetaChains (pull request #3027 at 3f8c596)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/LocalGainOfThetaChains/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 44 lines changed since `3bddf73`. Accepted, with no finding. The change adds locators and formal-proof citations in 4.9a, 4.9 (b), 4.10, 4.10a, 4.12 and 4.15a and alters no statement, heading, Check or Lean declaration; I opened each of the thirteen newly cited declarations of [FormalProof] and the Mínguez locator, and each says what the text claims. There are two small corrections (one sentence of 4.12 that matches two formal statements to (c1) and (c2) more closely than they match; two Origin labels still without a theorem number) and two format notes; none blocks. Nothing new is left for a human to decide beyond the standing scope and licence facts.

## C01 — In 4.12, the formal statements cited for (c1) and (c2) differ from them in more than the stabiliser term

The changed sentence (line 861) says that (c1) and (c2) "with `−δ_j` in place of `𝔟_j`" are `MassRatio₂` and `PointsLemma`. A reader who opens them finds other exponents as well: `MassRatio₂` has `gv − alEven + Σ_{v′≠v} g0v − dG` and `PointsLemma` has `gv + Σ_{v′≠v} g0v − dG` (`Formalism/SharpRestriction/GrowthBounds/FormalGroupSystem.lean`, lines 661–669), where `gv` and `g0v` are the numbers of the diagram data: `gv` is `γ_LT(p)Σα_s` less the `min` sum, less the loss of the second engine `de` in place of `dl_v`, and `g0v` is the ramp sum with the terms of `Dist_v(s)` omitted, less `de`, not floored at `0` (lines 46–68, 323–325). These are the numbers the note of 4.10 describes for `Conclusion2`, not `r^H_j(v)` and `r⁰_j(v)` in the data `(α̂, ĉ)`.

One clause would make the sentence exact: "with `−δ_j` in place of `𝔟_j` and the numbers of the diagram data of the note in 4.10 in place of `r^H_j` and `r⁰_j`".

## C02 — Two Origin labels still name a published result by author and year only

The labels of 4.9b (Mumford 1969) and 4.12 (Rallis 1982, line 754) give no theorem or section, so the result that "adapted from" compares with cannot be opened. The other three labels of this remark now have locators: Bannai–Kobayashi, Corollary 2.16 (4.9a), Finis, Lemmas 3.8 and 3.9 (4.10a), Mínguez, Théorème 1 (4.12).

The label of 4.9a gives the numbering of arXiv:math/0610163v4; if the published article numbers the corollary differently, that number would serve the reader of the journal.

## N01 — The six `*Sources:*` lines keep the parentheses of the tags they replace, and the Labels paragraph does not explain the label

For example "*Sources:* (Mahler; Amice) for (1)." in 4.14a and the line of 4.12 (line 852); the others are in 4.9a, 4.10a, 4.14c and 4.14f. Dropping the parentheses and adding a clause to the Labels paragraph would read more cleanly.

## N02 — In 4.9 (b) the comparison with the formal proof's price holds at `C_P = 1`

With the constant `C_P ≥ 0` now written into the `r_H = 1` price (line 400), "at a served place `P_j(v)` is at most these" reads as a claim for every `C_P`; at `C_P = 0` the term that absorbs the non-top odd positions is gone. "is at most these at `C_P = 1`" would say what is meant.

## Previous findings

The previous review had no finding. Of its remarks: its first small correction (4.15a named no declaration of [FormalProof]) is repaired: the section now cites the statements of (a), (b) and (c), and each matches (table below). Its second (four Origin labels without locators) is partly repaired and is C02 above. Its format note is unchanged and is N01 above.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 4.15a (a) vs `length_quot_le_of_pow_smul` | `R = ℤ_p`, `N = ℤ_p²`, `T = pℤ_p ⊕ ℤ_p`, `e = 1` | formal: `N` free finite, `ϖ^e·x ∈ T`, `length(N/T) ≤ e·finrank`; `1 ≤ 2`; README (a) the same | agree | none |
| 4.15a (b) vs `LemmaC_twist_ram` | the Check: `S = ℤ_p`, `B = p^{−1}ℤ_p`, `P = M`, `U = p`, `D = 1`, `b = e = 1` | formal hypotheses: `ϖ^bS ≤ B`, `U(B) ≤ S`, `D(S) ≤ B`, `U(P), D(P) ≤ P`, `P` saturated, `UD = ϖ^e` on `S ⊓ P`, `S` free finite; left 2, right `2 + 1 = 3` | agree | none |
| 4.15a (b), proof and application | names | `lemma_c_twist_ramified : LemmaC_twist_ram` in the cited file; `LemmaC_core` at the level prime with `UD = T^{N_0−1}` on `MramI` | as cited | none |
| 4.15a (c) vs `len_comp_le`, `len_list_le`, `len_pow_le` | `A = ℤ_p`, `g = p`, `h = p²`; `m = 0` | any commutative ring; `length(A/gh(A)) = 3 ≤ 1 + 2`; list form: sum over the list; power: `0 ≤ 0` at `m = 0`, `≤ m·length` | agree | none |
| 4.9 (b) price vs `G.Pr` | one odd top with `w̃ − a⁻ = 2`, `n′ = 2`, `w″ + ϑ + c_G + N_m = 10`, `Pr1 = 1` | formal, `p ≥ p0`: `Σ(fillG − b_s) + Pr1·nP·(…) = 2 + 20 = 22`; README `r_H = 1`: 22; other branch `rG·(Nv(2b′ + cG) + nP(…))` as README | agree | N02 |
| 4.9 (b) `C_P = 1` vs `FamP.fixed` | first conjunct | `GK.Pr1 = 1`; `Consts.Nonneg` has `0 ≤ K.Pr1` | agree | none |
| 4.10 note: `0` in place of `lg_p(0) = 1` | `p = 5`; `x = 0, 1, 25` | formal `lgp`: `0, 1, 3`; README `⌊log_p max(x, 1)⌋ + 1`: `1, 1, 3` | differ at 0 only, as the note says | none |
| 4.12 (b) for `∇` vs `lb_pos` | rank 2, `λ = (3, 1)`, `r = 1, 2` | formal exponent `Σ_{i<r} λ_i = 3, 4` for any `r`, on `H0` of one factor; README `h_i(λ)`: sum of the `i` largest entries: `3, 4` | agree | none |
| 4.12 (b) tuple and `y_v` vs `steps_gen`, `operators_preserve_lattices` | statement | `steps_gen`: tensor lattice along an edge of type `G.P.r`, factor `p^{ArV}`; `adm12`: `y_v` preserves `Mna` and `M`; proved with `lb_pos` and `dl_pos`; `adm12` is a conjunct of `Adm6` | agree | none |
| 4.12 (c1), (c2) vs `MassRatio₂`, `PointsLemma` | exponents | formal `gv − alEven + Σ g0v − dG` and `gv + Σ g0v − dG`, `i ∈ [1, r]`; `dG ≥ v_p` of stabiliser orders; `gv`, `g0v` diagram numbers | stabiliser clause true; sentence incomplete | C01 |
| 4.12 Origin vs Mínguez | Théorème 1, Corollaire 6.3 | Minguez2008 lines 85–100: uniqueness and multiplicity one, the Langlands quotient of the lift for `n ≤ m`, its Galois parameters; line 742: the corollary restating it | supports | none |
| 4.9a Origin vs Bannai–Kobayashi | Corollary 2.16 | BannaiKobayashi2010 line 1331: `p ≥ 5` split, torsion translates, integral series | supports | none |

The rows for untouched statements stand as in the previous review, of `3bddf73`.

- Source locators checked against the text: 17 declarations of [FormalProof] opened (the 13 newly cited and 4 they rest on) in the cited files (`G.Pr`, `FamP.fixed`, `lgp`, `MassRatio₂`, `PointsLemma`, `dG_spec`, `lb_pos`, `steps_gen`, `operators_preserve_lattices`, `adm12`, `length_quot_le_of_pow_smul`, `LemmaC_twist_ram`, `lemma_c_twist_ramified`, `LemmaC_core`, and the three `len_*` statements); Mínguez Théorème 1 and Corollaire 6.3; Bannai–Kobayashi Corollary 2.16.
- All eight file paths of the new citations exist and each name is declared in the namespace the README gives.
- Seeded sample: none of its fifteen targets lies in a changed passage.
- Cross-roadmap citations: the change adds none.
- Record against the merge base: no layer, heading, statement, Check or worked example removed or renumbered; the description's computed summary (0 headings removed, 0 declarations changed) agrees.
- Dependency check: `depcheck: 122 roadmaps, 1409 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Lean: `lake env lean` on `Suggested.lean` exits 0 with no message; the file is unchanged and declares nothing, so there is no signature to compare and no one-tactic probe to run.
- Automatic checks: all pass on the worker's run; my rerun differs only in counting the pull request's other roadmap folders (below).

Overlap check: read ThetaChainsAndFrobeniusPrimeSums, ThetaChainsOnDefiniteUnitaryGroups and GluedTargetAndDivisionInequality; nothing shared. The change adds no object.

Source independence: changed passages only; 7 passages compared with 3 sources (Minguez2008, BannaiKobayashi2010, and [FormalProof], which has Lean statements and no prose), none shared; largest share [FormalProof], all but a handful of the locators; the change adds, removes and reorders no layer, so the arrangement was not compared.

Research link: Layer 4 is the gain at inert primes of the chains of theta lifts in Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions (announced 2026); its Origin labels set it beside Rallis (1982), Mínguez (2008), Finis (2006), Bannai–Kobayashi (2010) and Tange (2012). Basis: the README's References and labels; Tange, Mínguez and Bannai–Kobayashi read.

## Not verifiable

- Finis (2006), Lemmas 3.8 and 3.9 (the new locator of 4.10a): the article's landing page is on a host the sources service does not class as open and no other legal copy was found, so the locator is unchecked.
- Rallis (1982), Mumford (1969) and Knapp (2002): not read, as in the previous review.
- The published numbering of Bannai–Kobayashi's Corollary 2.16 was not compared with the arXiv version the label cites.
- [FormalProof] was read in the operator's copy of the public repository, which is at a later commit than the one the References cite.
- That the constants `GK` of `FamP` are the ones passed to `G.Pr` in the main theorems was read from the field's type, not traced through the proof.

Automatic checks set aside as false positives: a rerun of the checks counts the files of the pull request's other roadmap folders as edits outside this folder, and every one lies in a folder the pull request owns. The citation finder lists the formal-proof declaration names as Lean names found nowhere; they are locators into [FormalProof]. The signature listing reads the word "sets" of the module docstring as a declaration; the file declares nothing and elaborates cleanly.

## Source issues

- none

## For the human reviewers

- Scope: the roadmap rests on [FormalProof], a Lean development announced on 20 November 2026 with no refereed paper; its labels mark 31 of its 35 non-definition sections "particular to this proof" and 4 "adapted from" published work.
- Licence: the README cites file paths and declaration names of [FormalProof] and no text of it; the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, line 20) says the proof belongs to its author and was published without a licence.
- The two recorded decisions of the human reviewers do not apply to this folder: it loses no section and none moves to another roadmap.
