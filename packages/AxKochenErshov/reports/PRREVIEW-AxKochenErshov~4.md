# Review of AxKochenErshov (pull request #2868 at 95fc24d)

**Verdict:** needs changes

**Summary.** Changes are still needed, for the one finding of the previous review: the definition of a Hensel configuration in 3.1 is unchanged, and its displayed inequality does not give a root for a polynomial with coefficients outside the valuation ring. The 18 lines changed since `dfd0d50` only update how PadicallyClosedFields is described (it is now an open roadmap); they agree with that roadmap at its head and introduce no defect. There are four small corrections (three carried, one new) and two format notes, none blocking. The main source (van den Dries's lectures) could again not be read legally; that is left to the human reviewers.

## R01 (P2) — The definition of a Hensel configuration in 3.1 is not stated: the displayed inequality is insufficient for `f ∈ K[X]`, and the remaining condition and the ball of the root are left to the source

Unchanged since the previous review. An implementer cannot state 3.1, and 3.2 applies the notion to arbitrary polynomials over `K` evaluated along a pseudo-Cauchy sequence. Section 3.1 (README lines 239–241) says that `f, a` is in Hensel configuration when `f'(a) ≠ 0` and "either `f(a) = 0` or `|f(a)| < |f'(a)|²` with the root bound of van den Dries Def. 4.19", and that `f` then has "a unique root in the corresponding ball". Neither the root bound nor the ball is given, and the section does not say where `f` and `a` live. The inequality alone suffices only for `f ∈ V[X]`, `a ∈ V`. Over `ℚ_p` take `f = p⁻²X² + X + p` and `a = 0`: `|f(0)| = |p| < 1 = |f'(0)|²`, but the Newton polygon of `f` is the single segment from `(0, 1)` to `(2, −2)` (at `1` it passes through `−1/2 < 0`), so both roots have valuation `3/2` and `f` has no root in `ℚ_p`.

Smallest change: state the condition and the conclusion. For `f ∈ K[X]`, `a ∈ K` with `f'(a) ≠ 0` and `f(a) ≠ 0`, put `γ = |f(a)/f'(a)|` and write `f(a + X) = f(a) + f'(a)X + ∑_{i ≥ 2} f_i(a)Xⁱ`; require `|f_i(a)|·γⁱ < |f(a)|` for all `i ≥ 2`. Then in a henselian field `f` has a unique root `b` with `|b − a| ≤ γ`, and `|b − a| = γ`. (Substituting `X = (f(a)/f'(a))·Y` and dividing by `f(a)` gives `1 + Y + ∑ cᵢYⁱ` with `cᵢ ∈ 𝔪`, which has the simple residue root `−1`.) For `f ∈ V[X]`, `a ∈ V` this condition is exactly `|f(a)| < |f'(a)|²`, which could be kept as a Check, with the example above as its negative control. If the source's definition differs, state the source's, in full.

## C01 — The two statements of Layer 1 on one-variable definable sets need points and `K` to count as balls

Unchanged. "Every subset of `K` definable with parameters … is a finite Boolean combination of balls" and the Swiss-cheese form (README lines 156–158) use "ball" without a definition. If a ball has a radius in `Γ`, the definable set `{0}` is a counterexample: every nonempty ball minus finitely many proper subballs is infinite, because the residue field is infinite. One clause fixes it: "balls, among which we count points and `K` itself".

## C02 — Section 5.2 does not say which structure `K` and `K'` carry, nor in which language a good map is elementary

Unchanged. Section 5.1 defines good maps "for valued fields `K`, `K'` with cross-sections and liftings", and in a second form with partial elementary maps on `k` and `Γ`; 5.2 says only "Let `K`, `K'` be henselian of equicharacteristic `0`. Then every good map is a partial elementary map between `K` and `K'`" (README lines 334–335). Say in 5.2 what data `K` and `K'` carry, the language of the conclusion, and which form of 5.1 is used.

## C03 — Two hypotheses are implied by the others

Unchanged. In 2.2, a pseudo-Cauchy sequence of transcendental type never has a pseudolimit `a ∈ K` (then `X − a` makes it of algebraic type), so "without pseudolimit in `K`" in the first bullet adds nothing. In 3.5, "`Γ` divisible" is not needed beside "`k×` divisible": with a lifting, `O× ≅ k× × (1 + 𝔪)` is divisible, so `1 → O× → K× → Γ → 1` splits for every `Γ`. Either drop them or say they are kept to match the source.

## C04 — The Boundaries list now names two owners of Macintyre's theorem without saying how the two statements differ

New with this head. The list gives LogicAndDefinabilityInNumberTheory "Macintyre's elimination over a fixed finite extension of `ℚ_p` (§2.2)" and, in the changed bullet (README lines 534–535), gives PadicallyClosedFields "the quantifier elimination for `p`-adically closed fields of `p`-rank `d`, Macintyre's theorem included". Since `ℚ_p` is a finite extension of itself, a reader sees one theorem with two owners. The two roadmaps do state different things: LogicAndDefinabilityInNumberTheory §2.2 (README lines 270–272 at the head of pull request #2276) works in one field `F`, in the ring language with coefficients from `F` and the power predicates; PadicallyClosedFields Layer 4 (README lines 334–340 at the head of pull request #2905) eliminates quantifiers for the theory, in `valLang` with constants for a basis of `O/pO` and the power predicates, and says the two are stated independently. One clause in the changed bullet would say so, for example "…of `p`-rank `d` as a theory, in its language with the power predicates (for `d = 1`, Macintyre's theorem in parameter-free form)".

## N01 — The module docstring of `Suggested.lean` lists what is "stated in `README.md` only" but not the two `≼` theorems (5.4 and the second bullet of 5.7), which the Summary gives as part of the principle; a clause naming them and what they lack would complete it. Likewise 0.2 says the interpretation of formulas with free variables "are" `exists_residueSentence` and `exists_valueGroupSentence`, which state the case of sentences. (Unchanged.)

## N02 — RandomGraphs is cited in 0.2 for `boundedCode` but has no entry under Exact supplier contracts. "Ershov 1965b" (6.3) is a label the References do not define; there are two 1965 entries. (Unchanged.)

## Questions for the author

- Kuhlmann 2010 is still cited as Example 4.16. In the arXiv version (1003.5639v1) the example with these data is Example 4.17 and 4.16 is a lemma. Is 4.16 the number in the *Illinois J. Math.* version? I could not read the published version.
- The Check of Layer 6 that `ℂ[[t₁, t₂]]` and `ℚᵃˡᵍ[[t₁, t₂]]` are not elementarily equivalent cites van den Dries's Introduction. Does the Introduction state this for these two rings, and with which proof or reference? I could not read it.

## Previous findings

- R01 — not repaired: "either `f(a) = 0` or `|f(a)| < |f'(a)|²` with the root bound of van den Dries Def. 4.19" (3.1, lines 239–241), word for word as before. Raised again as R01.

(The previous small corrections C01–C03, the format notes N01–N02 and the two questions are likewise unchanged at this head and are written again above.)

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 3.1 Hensel configuration | `f = p⁻²X² + X + p`, `a = 0` over `ℚ_p` | `|f(0)| = |p| < 1 = |f'(0)|²`; Newton points `(0,1), (1,0), (2,−2)`, one slope, roots of valuation `3/2`, none in `ℚ_p` | displayed condition insufficient | R01 |
| 5.8 as cited by the changed Downstream bullet (completions of `p`-rank `d` by residue rings) | `d = 1`; `p = 2`, `d = 2` | `p`-rank `d`: `O/p` of order `p^d`, so `e·f = d`, finitely ramified, `O/𝔪ⁿ` finite so `≡` is `≅`; `d = 1`: `O/𝔪ⁿ = ℤ/pⁿ`; `ℚ₂(√−2)`, `ℚ₂(i)` agree to `n = 3`, differ at `n = 4` | hypotheses of 5.8 hold; bullet true | none |
| 6.1 as cited for `d = 1` | `p`-rank `1` | `O/pO ≅ 𝔽_p` gives `e = f = 1`: residue field `𝔽_p`, `|p|` the greatest value `< 1`; matches the axioms of 6.1 | true | none |
| 5.6 as cited for the coarse valuation | finitely ramified `K` | `Δ` = convex hull of `|p|^ℤ`; coarsening is `V[1/p]`, `p` a unit; same object as PadicallyClosedFields 0.2 | consistent | none |
| Boundaries: Macintyre's theorem | `F = ℚ_p`, `d = 1` | both descriptions cover `ℚ_p`; the statements differ (one field with coefficients; the theory, parameter-free) | two owners named, difference unstated | C04 |

The rows for the untouched statements stand as in the previous review, of `dfd0d50`.

- Source locators checked against the text: 0 new (the changed passages cite no source). van den Dries 2014 tried again: the DOI resolves to a paywalled page and the author's page timed out.
- Library declarations opened at the pin: none new; the diff changes no Lean statement and no library name.
- Cross-roadmap citations resolved: PadicallyClosedFields at the head of pull request #2905 (`c07ebef`): its Layer dependencies and supplier contract cite this roadmap's §§0.1–0.2, 5.6, 5.8 and 6.1, as the changed Downstream bullet says; its Scope claims `p`-valuations, `p`-adic closures and the elimination in `pcLang d`, as the changed Boundaries bullet says. LogicAndDefinabilityInNumberTheory §2.2 at the head of pull request #2276 (lines 270–272, 1835). CiFieldsAndArtinsConjecture is on main, in the merge order and among the open pull requests nowhere, and the README calls it planned.
- Dependency check: `depcheck: 171 roadmaps, 1989 edges, 0 problem(s)`; no UPWARD or CYCLE line. PadicallyClosedFields is named as a consumer and in Scope only, not as a supplier.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: `sorry` the only warning (11); no `set_option`; nothing changed outside the folder; `Suggested.lean` unchanged since `dfd0d50`.
- Pull request text read against the head: nothing contradicted; the description's one mention of PadicallyClosedFields (5.8 states only `≡`) agrees with that roadmap's use of 5.8.
- Overlap check: read PadicallyClosedFields, SaturationAndQuantifierElimination, LogicAndDefinabilityInNumberTheory, LogicAndDefinabilityInNumberTheoryPartII, LocalFieldsRamificationPartII, QuadraticFormInvariantsPartII; `valLang`, the interpretations, the coarsening by the convex subgroup of `|p|` and the AKE theorems: owner AxKochenErshov, cited by PadicallyClosedFields; `p`-valuations, `p`-adic closures and the elimination for `p`-rank `d`: owner PadicallyClosedFields, not stated here; the other shared objects as in the previous review.

Source independence: changed passages only: 4 passages compared with 0 sources (none cites or paraphrases a source; they describe another roadmap), none shared; largest share van den Dries 2014, about 71 of 86 locators; its text and table of contents could not be read, and no layer was added, removed or reordered.

Research link: The headline targets are the theorems of Ax–Kochen (1965–66) and Ershov (1965) on henselian valued fields and `ℚ_p`, and of Basarab (1978) for finite ramification; Anscombe–Jahnke (2022), which I read, extends the unramified case to imperfect residue fields from the same statements. Rests on the README's references and that text.

## Not verifiable

- van den Dries 2014 (every sampled target except 5.8, and Def. 4.19 of R01): the publisher's page is paywalled and the author's page timed out again; no locator, hypothesis or wording was checked against the text.
- Basarab 1978, Ax–Kochen II and III, Ershov 1965 (both papers), Robinson 1956, Kaplansky 1942, Serre: not readable legally or not fetched, as in the previous review.
- The published numbering of Kuhlmann 2010, and the Check on `ℂ[[t₁, t₂]]` (see the questions).

## Source issues

- none

## For the human reviewers

- **Not tested.** van den Dries 2014 carries about 71 of 86 locators and could not be read. By the README's own locators, Layers 1, 2–3 and 5.1–5.7 draw on its Chapters 3, 4 and 5–7 in that order; Layers 0, 4, 6 and 5.8 do not map to one chapter.
- **Scope.** The description places the roadmap in a series planned in an issue on the author's fork. Of the two series roadmaps the README names, PadicallyClosedFields is now open as pull request #2905; CiFieldsAndArtinsConjecture is proposed nowhere yet.
