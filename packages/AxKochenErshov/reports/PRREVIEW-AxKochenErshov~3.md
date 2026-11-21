# Review of AxKochenErshov (pull request #2868 at dfd0d50)

**Verdict:** needs changes

**Summary.** Changes are needed, for one finding: the definition of a Hensel configuration in 3.1 states only the inequality `|f(a)| < |f'(a)|²`, which does not give a root when `f` has coefficients outside the valuation ring, and leaves the rest of the condition and the ball of Lem. 4.20 to the source. The five findings of the previous review are all repaired. There are three small corrections and two format notes, none blocking. The main source (van den Dries's lectures, about 71 of 86 locators) could again not be read legally, so its locators, wording and table of contents remain unchecked; that is left to the human reviewers.

## R01 (P2) — The definition of a Hensel configuration in 3.1 is not stated: the displayed inequality is insufficient for `f ∈ K[X]`, and the remaining condition and the ball of the root are left to the source

An implementer cannot state 3.1, and 3.2 applies the notion to arbitrary polynomials over `K` evaluated along a pseudo-Cauchy sequence. Section 3.1 (README lines 239–241) says that `f, a` is in Hensel configuration when `f'(a) ≠ 0` and "either `f(a) = 0` or `|f(a)| < |f'(a)|²` with the root bound of van den Dries Def. 4.19", and that `f` then has "a unique root in the corresponding ball". Neither the root bound nor the ball is given, and the section does not say where `f` and `a` live. The inequality alone suffices only for `f ∈ V[X]`, `a ∈ V`. Over `ℚ_p` take `f = p⁻²X² + X + p` and `a = 0`: `|f(0)| = |p| < 1 = |f'(0)|²`, but the Newton polygon of `f` has the single slope through `(0, 1)` and `(2, −2)`, so both roots have valuation `3/2` and `f` has no root in `ℚ_p`.

Smallest change: state the condition and the conclusion. For `f ∈ K[X]`, `a ∈ K` with `f'(a) ≠ 0` and `f(a) ≠ 0`, put `γ = |f(a)/f'(a)|` and write `f(a + X) = f(a) + f'(a)X + ∑_{i ≥ 2} f_i(a)Xⁱ`; require `|f_i(a)|·γⁱ < |f(a)|` for all `i ≥ 2`. Then in a henselian field `f` has a unique root `b` with `|b − a| ≤ γ`, and `|b − a| = γ`. (Substituting `X = (f(a)/f'(a))·Y` and dividing by `f(a)` gives `1 + Y + ∑ cᵢYⁱ` with `cᵢ ∈ 𝔪`, which has the simple residue root `−1`.) For `f ∈ V[X]`, `a ∈ V` this condition is exactly `|f(a)| < |f'(a)|²`, which could be kept as a Check, with the example above as its negative control. If the source's definition differs, state the source's, in full.

## C01 — The two statements of Layer 1 on one-variable definable sets need points and `K` to count as balls

"Every subset of `K` definable with parameters … is a finite Boolean combination of balls" and the Swiss-cheese form (README lines 156–158) use "ball" without a definition. If a ball has a radius in `Γ`, the definable set `{0}` is a counterexample: every nonempty ball minus finitely many proper subballs is infinite, because the residue field is infinite. One clause fixes it: "balls, among which we count points and `K` itself".

## C02 — Section 5.2 does not say which structure `K` and `K'` carry, nor in which language a good map is elementary

Section 5.1 defines good substructures and good maps "for valued fields `K`, `K'` with cross-sections and liftings", and in a second form with partial elementary maps on `k` and `Γ`; 5.2 then says only "Let `K`, `K'` be henselian of equicharacteristic `0`. Then every good map is a partial elementary map between `K` and `K'`" (README lines 334–335). A reader cannot tell whether `K`, `K'` come with a cross-section and a lifting (or an angular component map), which of the two forms of good map is meant, and whether "elementary" is in `valLang` or in the language expanded by that structure. In the first form of 5.1, moreover, a good substructure contains the whole lifted residue field, so a residue map that is only partial elementary has no room to be partial. Say in 5.2 what data `K` and `K'` carry, the language of the conclusion, and which form of 5.1 is used.

## C03 — Two hypotheses are implied by the others

In 2.2, a pseudo-Cauchy sequence of transcendental type never has a pseudolimit `a ∈ K` (then `|aᵢ − a|` is eventually strictly decreasing and `X − a` makes it of algebraic type), so "without pseudolimit in `K`" in the first bullet adds nothing. In 3.5, "`Γ` divisible" is not needed beside "`k×` divisible": with a lifting, `O× ≅ k× × (1 + 𝔪)`, and `1 + 𝔪` is divisible in a henselian field of equicharacteristic `0`, so `1 → O× → K× → Γ → 1` splits for every `Γ`. Either drop them or say they are kept to match the source.

## N01 — The module docstring of `Suggested.lean` lists what is "stated in `README.md` only" but not the two `≼` theorems (5.4 and the second bullet of 5.7), which the Summary gives as part of the principle; a clause naming them and what they lack (the induced maps of residue fields and value groups along an extension) would complete it. Likewise 0.2 says the interpretation of formulas with free variables "are" `exists_residueSentence` and `exists_valueGroupSentence`, which state the case of sentences.

## N02 — RandomGraphs is cited in 0.2 for `boundedCode` but has no entry under Exact supplier contracts (citing SaturationAndQuantifierElimination 4.1, which imports it, would do). "Ershov 1965b" (6.3) is a label the References do not define; there are two 1965 entries.

## Questions for the author

- Kuhlmann 2010 is still cited as Example 4.16. In the arXiv version (1003.5639v1) the example with these data is Example 4.17 (its text, lines 1633–1651) and 4.16 is a lemma (line 1569). Is 4.16 the number in the *Illinois J. Math.* version? I could not read the published version.
- The Check of Layer 6 that `ℂ[[t₁, t₂]]` and `ℚᵃˡᵍ[[t₁, t₂]]` are not elementarily equivalent cites van den Dries's Introduction. Does the Introduction state this for these two rings, and with which proof or reference? I could not read it and did not find an independent argument.

## Verified sound

Previous findings at this head: R01 (ACVF owned twice) repaired, Layer 1 and the supplier contracts now cite RigidAnalyticGeometry §8.2 and Scope hands it the theory, the conjugacy and the elimination; R02 repaired ("`y` is one exactly when `|x − y| < |x − a_i|` for all large `i`"); R03 repaired ("when `K` is unramified (or finitely ramified) and `ℵ₁`-saturated"); R04 repaired (`elementarilyEquivalent_iff_of_finitelyRamified`, with the ACVF and model-completeness statements); R05 repaired ("for a nonconstant polynomial `f`"). C01–C09 and N01–N04 are all taken up. The question on 3.2–3.4 is settled (equicharacteristic `0` only); the Kuhlmann numbering is not.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1 language, bridge, embeddings | `V = K`; `x = 0`; embedding `f` | `1 ∣ x ⇔ x ∈ V`; `0 ∣ y ⇔ y = 0`; `x ∣ y ⇔ |y| ≤ |x|`, same reading as RigidAnalyticGeometry §8.2 | true; source unread | none |
| 0.1 Check, `ℤ_(p)` | odd `p`, `a = 1 + p` | `X² − a` has simple root `1` mod `p`; `1 + p` not a rational square | true | none |
| 0.2 interpretations, both Lean theorems | `V = ⊤`; `ℚ₅`, `ℚ₃`; Puiseux | residue field `K`, `𝔪 = 0`; `−1` square mod 5 not mod 3; divisible group has no least element `> 1` | true | N01 |
| Layer 1 completions / `elementarilyEquivalent_of_isAlgClosed` | `(a, b)` = `(0,0)`, `(0,p)`, `(p,p)`; `V = ⊤` excluded | only these pairs occur; `ℚ_pᵃˡᵍ ≡ ℂ_p`, not isomorphic | true | none |
| Layer 1 definable sets | `{0}` | nonempty Swiss cheese with radii in `Γ` is infinite; `{0}` is definable and finite | needs points as balls | C01 |
| 2.1 definitions and `isPseudoLimit_iff` | both directions; empty and one-point index; `∑ pⁿ` | `|x − aᵢ| = |y − aᵢ| = |a_j − aᵢ|`, `|x − y| ≤ |x − a_j| < |x − aᵢ|`; empty index: both sides false | true | none |
| 2.1 API | constant `f`; `|aᵢ|` increasing | constant `f` excluded; `|aᵢ| < |a_j|` forces `|a_j − aᵢ| = |a_j|` constant in `j`, contradiction | true | none |
| 2.2 Kaplansky | pseudolimit `a ∈ K` | `X − a` has `|aᵢ − a|` strictly decreasing: algebraic type | true; one hypothesis redundant | C03 |
| 2.3 maximal fields, Checks | `ℚ_p`; Puiseux; `ℂ((t^ℚ))` | values in `p^ℤ` strictly decreasing tend to `0`; pseudolimit of `∑ t^{1−1/m}` contains every `t^{1−1/m}` | true | none |
| 3.1 Hensel configuration | `f = p⁻²X² + X + p`, `a = 0` over `ℚ_p` | `|f(0)| = |p| < 1 = |f'(0)|²`; roots of valuation `3/2`, none in `ℚ_p` | displayed condition insufficient | R01 |
| 3.2 henselian ⇔ algebraically maximal | perfect hull of `k(t)`, `Xᵖ − X − 1/t` | Kuhlmann lines 1633–1651: degree `p`, immediate, unique prolongation; compositum with `Kʰ` immediate | true; negative control true | question |
| 3.3 henselization | immediate henselian algebraic `L/K` | `Kʰ ⊆ L`, `L/Kʰ` immediate algebraic, `Kʰ` algebraically maximal, so `L = Kʰ` | true | none |
| 3.4 uniqueness, embedding | trivial valuation; type of a pseudolimit | `Γ` trivial: `K` is maximal; type uses `≤ |Γ|` parameters, realised under `|Γ|⁺`-saturation | consistent; source unread | none |
| 3.5 Hahn fields | `k×` divisible; `Γ` free | `O× ≅ k× × (1 + 𝔪)` divisible, sequence splits; free `Γ` splits; then 3.4 | true; `Γ` divisible redundant | C03 |
| 5.1, 5.2 good maps, Equivalence Theorem | reading of the two forms | first form: residue map total on `k`; structure and language of 5.2 not stated | underdetermined | C02 |
| 5.3 / `elementarilyEquivalent_iff_of_charZero` | `V = ⊤`, `V' = ⊤`; `ℂ((t))`, `ℚᵃˡᵍ((t))` | trivial case: both sides are `K ≡ K'` as rings; `Γ = ℤ` both | true | none |
| 5.5 Witt vectors | `k = 𝔽_p`; map `𝕎 k → A` | `𝕎 𝔽_p = ℤ_p`; any ring map sends `pⁿ𝕎` into `pⁿA`, Teichmüller points forced, so unique | true | none |
| 5.6 coarsening | finitely ramified `K` | greatest value `π < 1`, `|p| = πᵉ`, `Δ = π^ℤ`; `p` a unit of the coarsening | true | none |
| 5.7 / `elementarilyEquivalent_iff_of_unramified` | `x = 0`; `[Γ : Γⁿ] = n` | `v 0 = 0 ≤ v p`; residue `CharP` gives `|p| < 1`; least element and index `n` give a `ℤ`-group | true | none |
| 5.8 / `elementarilyEquivalent_iff_of_finitelyRamified` | `n = 0`; `ℚ₂(√−2)`, `ℚ₂(i)`; `O/pⁿ` versus `O/𝔪ⁿ` | `n = 0`: zero rings; both `O/𝔪³ ≅ (ℤ/4)[x]/(x² − 2, 2x)`; mod 4, `y² = −2` forces `b(a − b)` even and odd; `𝔪ᵉⁿ = pⁿO` | true | none |
| 6.1 / `elementarilyEquivalent_padic_iff`, model completeness | both directions; `p = 2`; `x = p⁻¹` | residue `≅ 𝔽_p` gives `|p| < 1`; `v(1 + p·p⁻²) = −1` odd; `ℤ` order-reversal isomorphism | true | none |
| 6.2 / `elementarilyEquivalent_powerSeries_iff` | both directions | `k = k[[t]]/𝔪` interpretable; converse from 5.3 with `Γ = ℤ` | true | none |
| `mem_iff_dvd_one` | one-tactic probe | `simp [ValuationSubring.Dvd]` closes it; docstring marks it a sanity check | kept as marked | none |
| other ten sorried theorems | `simp`, `rfl`, `infer_instance` | none closes | not padding | none |

- Source locators checked against the text: 1 (Kuhlmann 2010, arXiv numbering 4.17, lines 1633–1651). Three van den Dries locators are corroborated by a second text, Anscombe–Jahnke, *The model theory of Cohen rings* (its text, lines 169–171, 808–809, 1198–1201): the definition of a local `p`-ring, Thm. 5.1 and Thm. 7.3. About 82 not readable.
- Library declarations opened at the pin: `FirstOrder.Language.Theory.field` (`Mathlib/ModelTheory/Algebra/Field/Basic.lean:80`), `Theory.ACF` (`…/Field/IsAlgClosed.lean:83`), `compatibleRingOfRing` (`Mathlib/ModelTheory/Algebra/Ring/Basic.lean:223`), `ValuationSubring.ValueGroup`, `.valuation`, `.mapOfLE` (`Mathlib/RingTheory/Valuation/ValuationSubring.lean:161, 166, 265`), `WittVector.isDiscreteValuationRing` (`…/WittVector/DiscreteValuationRing.lean:148`), `WittVector.teichmuller`, `Padic.mulValuation` (`…/Padics/PadicNumbers.lean:1194`), `LaurentSeries`, `ValuativeRel`, `HahnSeries.addVal`, `TauCeti.IsAdicComplete.henselianLocalRing` (`TauCeti/RingTheory/Henselian/Basic.lean:89`), `TauCeti.teichmuller` (`…/Henselian/Teichmuller.lean:94`), `HahnSeries.valuation` (`TauCeti/RingTheory/HahnSeries/Valuation.lean:54`), `Language.group`, `TauCeti.Group.structureOfGroup`. No pseudo-Cauchy sequence or immediate extension at either pin.
- Cross-roadmap citations resolved: SaturationAndQuantifierElimination 0.3, 0.4, 1.1–1.2, 2.3–2.5, 3.1, 3.3, 4.1, 4.3 and twelve declaration names at its open head; RigidAnalyticGeometry §8.2 on main (lines 1787–1850); LocalFieldsRamificationPartII §§1.3, 5.1, 5.3 on main; LogicAndDefinabilityInNumberTheory §§1.1–1.5, 2.2 at its open head; RandomGraphs `boundedCode` at its open head.
- Dependency check: `depcheck: 171 roadmaps, 1989 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: `sorry` the only warning (11); no `set_option`, no sorry'd data; nothing changed outside the folder.
- Elaborated types of the 21 declarations compared with the README statements: no binder lost; the only difference is the sentence case of 0.2 (N01).
- Pull request text read against the head: it states that the roadmap is new, the supplier from RigidAnalyticGeometry, the index type of the pseudo-Cauchy predicates and what `Suggested.lean` holds; nothing to correct.
- Overlap check: read SaturationAndQuantifierElimination, LogicAndDefinabilityInNumberTheory, LogicAndDefinabilityInNumberTheoryPartII, LocalFieldsRamificationPartII, QuadraticFormInvariantsPartII, RigidAnalyticGeometry; ACVF and its quantifier elimination: owner RigidAnalyticGeometry §8.2, cited here; henselization and coarsening: owner LocalFieldsRamificationPartII, cited here; the ordered-group language: owner SaturationAndQuantifierElimination 3.1, copied here and said so; AKE in the Denef–Pas language (LogicAndDefinabilityInNumberTheory §1.4) is a different statement in a different language. DeformationAndDerivedPatchingAlgebra on main plans strict Cohen rings and coefficient lifting, not the Witt-vector universal property of 5.5.

Source independence: 1 passage compared with 1 source (Kuhlmann 2010), none shared; largest share van den Dries 2014, about 71 of 86 locators; its text and table of contents could not be read, so wording and contents were not compared with it.

Research link: The headline targets are the theorems of Ax–Kochen (1965–66) and Ershov (1965) on henselian valued fields and `ℚ_p`, and of Basarab (1978) for finite ramification; Anscombe–Jahnke (2022), which I read, extends the unramified case to imperfect residue fields from the same statements. Rests on the README's references and that text.

## Not verifiable

- van den Dries 2014 (every sampled target except 5.8): the publisher's page is paywalled and the author's page timed out three times; no locator, hypothesis or wording was checked against the text, including the labels (VD1)–(VD5), the definitions of 5.1 and the "corrected form" of Thm. 7.18.
- Basarab 1978 (§1, Thm. 2.3.1, Lemmas 2.4.2–2.4.3, Thm. 3.1, Cor. 3.2): paywalled; the statement of 5.8 was checked as mathematics only (the equivalence of the families `O/𝔪ⁿ` and `O/pⁿ`, and the Checks).
- Ax–Kochen II and III, Ershov 1965 (both papers): no legal copy found.
- Robinson 1956, Kaplansky 1942, Serre (*Corps locaux* II §1): not fetched.
- The published numbering of Kuhlmann 2010, and the Check on `ℂ[[t₁, t₂]]` (see the questions).

## Source issues

- none

## For the human reviewers

- **Not tested.** van den Dries 2014 carries about 71 of 86 locators and could not be read. By the README's own locators, Layers 1, 2–3 and 5.1–5.7 draw on its Chapters 3, 4 and 5–7 in that order; Layers 0, 4, 6 and 5.8 do not map to one chapter.
- **Scope.** The description places the roadmap in a series planned in an issue on the author's fork; two roadmaps of that series named in the README (PadicallyClosedFields, CiFieldsAndArtinsConjecture) are proposed nowhere yet.
