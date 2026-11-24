# Review of GeneralizedRiemannHypothesisFromWindowBounds (pull request #3027 at 71bbefa)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/GeneralizedRiemannHypothesisFromWindowBounds/`
**Verdict:** needs changes

**Summary.** A review of the change against `main`: 2288 changed lines since `aecb53a`. I checked every added or changed passage (the origin, method and corollary labels, the restricted 2.3, Layers 1 and 5, the scope, contracts and references) and the seeded sample. I resolved each new supplier citation at this head and recomputed the 0.6 transform quotient, the 3.5 functional equation, the 3.3 exponent choice and the 2.3 contrapositive, all sound. One finding blocks: the revision deletes Layer 6 (§§6.1–6.32) and §§5.4–5.6 of the README on `main`, with their four Lean statements, and renumbers them in a new roadmap instead of keeping them under their ids. There are two small corrections and no format notes. The human reviewers decide whether the split may override the record rule, the family's `*Corollary of:*` convention, and the scope and licence of the formal proof.

## R01 (P1) — The revision removes Layer 6 and §§5.4–5.6 of the README on `main` instead of keeping them under their ids

The project's progress record (`STATUS.md` and the structure page) is keyed by this README's layer ids. After the merge, "Layer 6" and items 5.4–5.6 of this roadmap no longer exist, and their content reappears in ConsequencesOfTheRiemannHypothesisForDirichletLFunctions under other numbers. The roadmap as a record loses 35 items, and the new numbers cannot be mapped back to the old ones. At the merge base the README has 5.4 (completed L-functions, line 891), 5.5 (Dedekind zeta functions of abelian fields, line 908), 5.6 (Hecke characters of abelian extensions of `ℚ`, line 935) and Layer 6 with §§6.1–6.32, Examples and Dependencies (lines 1024–2365). The head's Layer 5 stops at 5.3 (line 1082), and `Suggested.lean` drops `re_eq_half_of_meromorphicOrderAt_completedLFunction_pos`, `meromorphicOrderAt_dedekindZeta_nonpos_of_isAbelianGalois`, `meromorphicOrderAt_heckeLFunctionC_nonpos_of_isAbelianGalois` and `psiAP_isBigO`. The new roadmap gives the same statements new ids (5.4 → §0.1, 5.5 → §0.2, 5.6 → §0.3, 6.5 → §3.1, 6.23 → §3.3, and so on) with no table of the former numbering. No roadmap on `main`, and none at the heads of open pull requests, cites §§5.4–5.6 or Layer 6 of this roadmap by number, so no citation breaks. The loss is to this roadmap's record only.

The smallest repair is to restore Layer 6 and §§5.4–5.6 here under their ids and with their statements. The conventions they use come back with them (the characters of a Galois group through the ray-class Artin map, `NumberField.ExtendedRiemannHypothesis`, the predicate of a record), and so do their supplier contracts and their four declarations. ConsequencesOfTheRiemannHypothesisForDirichletLFunctions then cites them by these ids instead of restating them. Whether the family's owner may instead move a layer of a roadmap on `main` into a new roadmap under new numbers is a question for the human reviewers (below). This review cannot waive the rule.

## C01 — The parenthesis on the weights in 4.2's `*Method of the formal proof:*` reads as a false statement about cyclic families

In the method line of 4.2 (line 967), "`1` on at most one distinguished real odd member; a cyclic family has none" most naturally says that a cyclic family has no real odd member. That is false: 0.2's own Check gives `𝒦(χ₋₄) = {1, χ₋₄}`, and `χ₋₄` is real with `χ₋₄(−1) = −1`. More generally `ψ^{o/2}` is real and odd whenever `ψ` is odd and `o/2` is odd. If the intended meaning is that no member is distinguished when the theorem is applied to a cyclic family, then "applied to a cyclic family, no member is distinguished" would say exactly that.

## C02 — The description leaves out that §§5.4–5.6 also leave this roadmap, and that the moved sections are renumbered

Part 2 of the description says "Section numbers are unchanged", and part 3 says only that "the family's last roadmap ended with a long layer of consequences" that now has a roadmap of its own. At this head the folder also loses §§5.4–5.6, which were not part of that layer: they are §§0.1–0.3 of the new roadmap, and three of the "four Lean statements" that move belong to them. Every moved section takes a new number there. Text that would be right: "GeneralizedRiemannHypothesisFromWindowBounds loses its Layer 6 (§§6.1–6.32) and its §§5.4–5.6. They become Layers 0–4 of ConsequencesOfTheRiemannHypothesisForDirichletLFunctions, renumbered (§§5.4–5.6 are its §§0.1–0.3), and the declarations of 5.4, 5.5, 5.6 and 6.5 move with them unchanged." The declarations are indeed unchanged: I compared all four with their originals.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1 weighted families (sample) | `single ψ 2`; `single ψ 1 + single ψ (−1)`; `0 • w` | inverse: `single ψ⁻¹ 2`; weight-inverse would give `single ψ (1/2)`, member `ψ`; sum `0`, support `∅`; `0 • w = 0` | Checks true | none |
| 0.3 remainder (sample) | `K = ℚ`, `w = single 1 1`, `y = 1, 2` | `G(1) = 1 + γ = 1.5772157`; `G(2) = 2(1 + γ − log 2) = 1.7681370`; with `+ y log y`: `4.5407257` | Checks true | none |
| 0.4 Origin (changed) | 8.6a step formula, `y ≥ 1` | `‖G_ψ(y)‖ ≤ y Σ m_ρ/‖ρ(1−ρ)‖ + O(log y) ≤ C′y`; termwise `Λ(n)(y/n−1) ≤ y/e`, so `≤ C y²` | supported | none |
| 0.6 Method quotient (changed) | trivial character of `ℚ`, `s = 3`; nontrivial `ψ` | numeric Mellin of `G` at 3: `0.566078279477`; `−(F′/F(3) − 3γ + (1−3))/6 = 0.566078279475` (`k = 1`); nontrivial: `−(L′/L(s) − sL′/L(1))/(s(s−1))`, `k = 0` | true | none |
| 0.6 residue Check (sample) | first zero `1/2 + 14.134725i` | `1/(1/4 + t²) = 0.00499899` | true | none |
| 0.6 `*Corollary of:*` ZerosOfLFunctions §8.6a | single character, `Re s > 0` | `Σ m_ρ/‖ρ(1−ρ)‖ < ∞` gives `Σ c_ρ/(s−ρ)` locally uniform off zeros; residue `m_ρ/(ρ(1−ρ))` | follows | none |
| 1.1 (sample; route reworded) | ArithmeticDirichletSeriesPartII §0.1b at head; real zero `β = 0.9` | contract (`A′ < A`, `H` analytic on a disc) equals §0.1b; contribution `y^β/(β(1−β)) = 11.1 y^{0.9} > 0` | true | none |
| 1.2 (sample) | `K = ℚ`, `w = 0`, `θ = 0`, `C = 1` | `0 ≥ −1` holds; `ζ(1/2 + 14.1347i) = 0`; `ζ < 0` on `(0,1)` | Check true | none |
| 2.1 Origin (sample) | Pintz 1980 I, Thm 1, pp. 344–345 | one-sided large values in `[H, H^{c log|ρ₀|}]` | nearest-result claim supported | none |
| 2.2 Origin (sample) | Kaczorowski 1984 §§3–5, pp. 368–371 | iterated averages `δ_n`, `x ∈ (T^{3/4−ε}, T)`, `n ≍ log T/log(10|ρ₀|)`, lowest zero dominant | supported | none |
| 2.3 restricted (changed) | negation of the conclusion, `Y₀′ = max(Y₀,1)`; `w = single 1 1`, `θ = 1/4` | negation gives `HasWindows {G_w ≤ C y^θ} λ`; 2.1 then contradicts zero `1/2 + 14.13i` | contrapositive valid | none |
| 2.4 (sample) | `K = ℚ`, `w = single 1 1` | no real zero in `(0,1)`, so first alternative; PositivityOfDirichletSeriesWithKernels §6.4(c)–(d) read | true | none |
| 2.5 (sample) | first statement, `θ ∈ (0,1)` | `|G| ≤ (C_K+1)y ≤ (C_K+1)y²` on `y ≥ 1`; residue `m/β > 0` | true | none |
| 3.1 Method (sample) | `S′ ⊇ S ∩ [x₀,∞)` | window beyond `max(Y₀,x₀)` lies in `S′` | true | none |
| 3.2 Origin (sample) | zero-free right of `σ = 1/2`, `y ≥ 2` | `‖G_ψ‖ ≤ y^σ Σ m_ρ/‖ρ(1−ρ)‖ + O(log y)`; `log 2 = 0.69 ≤ 2^{1/2}` | true | none |
| 3.3 Method (sample) | `Re s = 0.51, 0.6, 0.9, 2` | `θ = 0.505, 0.55, 0.70, 0.75`; each `< Re s`, `< 1` | true | none |
| 3.4 `*Corollary of:*` | AnalyticNumberTheoryPartI §1.6 at head; Euler factor | primitive induction stated for `DirichletGRH`; `|χ*(p)p^{−s}| = p^{−σ} < 1` for `σ > 0` | follows | none |
| 3.5 Method (changed) | Mathlib `riemannZeta_one_sub` with `s ↦ 1−s` | `ζ(s) = 2(2π)^{s−1}Γ(1−s)cos(π(1−s)/2)ζ(1−s)`; cos zero iff `s = −2k`; `ζ(0) = −1/2` | true | none |
| 3.5 Lean (headline) | `Finset.Iic ⌊y⌋₊` vs `Icc 1` | `Λ(0) = 0`; `G(1) = 1.5772` | consistent | none |
| 4.1 (sample) | `ε ∈ (0,1/2)` | `θ = 1/2 + ε ∈ (1/2,1)`, inside 2.1's range | true | none |
| 4.2 Method (C01) | `ψ = χ₋₄` | `𝒦(χ₋₄) = {1, χ₋₄}`, `χ₋₄(−1) = −1`, real | literal reading false | C01 |
| 4.2 Lean (headline) | `ψ = 1` | `orderOf 1 = 1`, family `{trivial}`, remainder at level 1 is `G` | matches Check | none |
| 5.1 route (changed) | via 3.4 | RiemannHypothesisStatementsAndConsequences §9.4 `generalizedRiemannHypothesis_primitiveCharacter_iff` present | true | none |
| 5.2 (sample) | Announcement lines 9–13, 53 | announcement of RH and GRH formalised in Lean; 14 archive parts | locator true; theorem not verifiable | none |
| 5.3 Checks | principal character mod 2; `ζ(−2)` | zeros `2πik/log 2`, `Re = 0`; `riemannZeta_neg_two_mul_nat_add_one` | true | none |
| R01 removed items | base lines 891–2365 vs head 1082 | 35 sections and 4 declarations absent; new ids `0.1–4.7` elsewhere; no old-id table | record broken | R01 |

- Source locators checked against the text: 3 (Announcement p. 1 and footnote 1; Pintz 1980 I, Theorem 1; Kaczorowski 1984 §§3–7).
- Library declarations opened at the pin: `riemannZeta_one_sub` (Mathlib/NumberTheory/LSeries/RiemannZeta.lean:178), `riemannZeta_zero` (:151), `riemannZeta_neg_two_mul_nat_add_one` (:173), `DirichletCharacter.LFunction_modOne_eq` (Mathlib/NumberTheory/LSeries/DirichletContinuation.lean:66), `riemannZeta_one_ne_zero` (Mathlib/NumberTheory/Harmonic/ZetaAsymp.lean:443).
- Cross-roadmap citations resolved at this head: 24 (ZerosOfLFunctions §§6.5, 7.5, 7.6, 8.6a, 9.1; ArithmeticDirichletSeriesPartII §§0.1, 0.1b, 4.1; AnalyticNumberTheoryPartI §§1.6, 2.42; QuasiRiemannHypothesis §§1.1, 5.4, 5.4a; ExplicitNumberFields §0.5; ExplicitZetaBounds §0.3; PositivityOfDirichletSeriesWithKernels §6.4; RiemannHypothesisStatementsAndConsequences §§8.4a, 9.3, 9.4, 9.6(c); ConsequencesOfTheRiemannHypothesisForDirichletLFunctions §§0.1–0.3).
- Moved declarations: all four identical to their merge-base text, in the new namespace.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1470 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 7 `sorry` warnings only. `#check @name` for the 9 declarations, elaborated together in one probe file: each type matches its README statement, nothing changed.
- Headline theorems: 5.1, 5.2, 5.3 (value and strip forms), 3.5 and 4.2 are stated. 2.1 and 3.3 are named in the docstring as not statable (they lack the ray-class Riesz remainder). None closes by one tactic: each is RH-strength or deeper.
- Overlap check: read RiemannHypothesisStatementsAndConsequences, PositivityOfDirichletSeriesWithKernels and RieszSumsOverPrimesAndExceptionalZeros (on `main`), ZerosOfLFunctions, LFunctions and AnalyticNumberTheoryPartI (open revisions, through the roadmap tools), and ConsequencesOfTheRiemannHypothesisForDirichletLFunctions (this pull request). Each shared object has one owner and is cited here: Landau's theorem (ArithmeticDirichletSeriesPartII §0.1b, with PositivityOfDirichletSeriesWithKernels Layer 6 for its one-sided and windowed forms), the explicit formula (ZerosOfLFunctions §8.6a), the one-character remainder and the predicates (RiemannHypothesisStatementsAndConsequences §§8.4a, 9.2–9.5), primitive induction (AnalyticNumberTheoryPartI §1.6), and the former §§5.4–5.6 and Layer 6 (ConsequencesOfTheRiemannHypothesisForDirichletLFunctions at this head; see R01). "Weighted family" elsewhere (SieveMethodsAndPrimePatterns, AutomorphicSpectralTheory) means sieve and spectral weights, which are different objects.

Source independence: changed passages only; 7 passages compared with 3 sources (Announcement, Pintz 1980, Kaczorowski 1984), none shared. The further passages cite FormalProof, Ingham, Davenport and Ihara–Murty–Shimura, none readable here. The largest share of locators is FormalProof's, 31 of about 55; contents compared with FormalProof: not readable. The layer order 0 → 5 is forced by the *Needs:* chain 0.6 → 2.1 → 3.3 → 4.1/4.2 → 5.1, and removing Layer 6 leaves no layer that follows any source's chapters.

Research link: The headlines are the Riemann hypothesis and GRH for Dirichlet L-functions, announced as proved and formalised in Lean by Alpöge (2026) (README Summary; Announcement lines 9–13). Layers 1–3 restate the Landau–Ingham equivalences (Landau 1905; Ingham 1932) in windowed form, whose nearest published relatives are Pintz (1980) and Kaczorowski (1984), both read here.

## Not verifiable

- FormalProof: its 31 file and declaration locators and every `*Method of the formal proof:*` label. The archive parts and the repository could not be read through the sources service.
- Ihara–Murty–Shimura (2009), §2.2, Theorem 1, (2.2.1), p. 257: the publisher's page answered with an error (HTTP 502), and no open copy was found.
- Ihara (2006), (1.2.1) and (1.4.1): no open copy fetched.
- Landau (1905): the sources service reported network trouble.
- Ingham (1932), chapters III–V; Davenport (2000), chapters 5 and 9; Montgomery–Vaughan (2007), Lemma 15.1: books with no legal open copy.
- Knapowski–Turán (1962), I–III: publisher paywall.

## Source issues

- none

## For the human reviewers

- Record rule (R01): description part 3 presents moving Layer 6 and §§5.4–5.6 into ConsequencesOfTheRiemannHypothesisForDirichletLFunctions as deliberate. Whether a roadmap on `main` may hand items to a new roadmap under new numbers is for you to decide. If you allow it, R01 lapses.
- README lines 152–160 (`*Corollary of:*`): an interim proof follows the formal proof and is replaced "once the general theorem is in the library". The description calls this a family-wide decision. The repository README's "Be definite about scope" and "Roadmaps are timeless" rules bear on it.
- Scope: the headline is the Riemann hypothesis. It rests on ThetaChainsAndFrobeniusPrimeSums §10.11 and on an unrefereed announcement (Announcement lines 9–13, 45–49). No refereed source states it, and this review did not read the formal proof.
- Licence: the README cites 31 file and declaration locators of an external Lean formalisation (FormalProof: archives on the author's site and a GitHub repository). `Suggested.lean` says three declarations match it binder for binder. Its licence was not read.
- Not tested: FormalProof, the source with the largest share of locators, could not be read. Wording and arrangement were not checked against it.
