# Review of EndoscopicTransferAndUnitaryTraceComparison (pull request #3027 at e47c8ec)

**Verdict:** accepted

**Summary.** An incremental re-review of the 56 lines changed since `7c341e7`. Accepted, with two small corrections and one format note, none blocking. The change is a merge of `main`: 28 *Needs:* lines now cite sections instead of whole layers, exactly as `main` has them, and the *Needs:* line of §10.27 keeps this pull request's `§10.26a` beside them, which settles the earlier point about the order with #3036. Every section the 28 lines name exists under the cited title; no statement changed. The two small corrections and the format note are carried from the previous review and concern text this change does not touch. One licence question is left for the human reviewers.

## C01 — Untouched text: §10.1 (line 3482, *Needs:* line 3504) takes "the imported Deligne local constant" of a Weil–Deligne object from ArithmeticGaloisRepresentations §2.7, which constructs only the rank-one constant

§10.26a and the supplier contracts (line 5504) say that the constant in every dimension is ClassicalArithmeticCompletion §7.12b's and only the rank-one one is §2.7's, which leaves §10.1 as the one place that sends the higher-rank constant to §2.7. The merge refined this *Needs:* line (it now names AutomorphicLFunctionsAndLocalFactors §§AL.1.2.1, AL.1.2.3 and AL.1.3.1–AL.1.3.5, all rank one) and still has no owner for the constant of a Weil representation of dimension above one. Adding ClassicalArithmeticCompletion §7.12b to the *Needs:* line of §10.1 for the Weil part, and either defining the monodromy factor in §10.1 or naming its supplier, would close it.

## C02 — Untouched text: §7.10a (line 2861) calls `TauCeti.EtaleDuality.CohCorr` supplied API (and line 2949 `CohCorr.comp`), but `CohCorr` occurs nowhere in the pinned Tau Ceti

A search of the pinned Tau Ceti sources for `CohCorr` and `rgammac` finds no file, so a reader cannot tell a library declaration from a proposed name. Name the declaration that exists, or state the correspondence operator as a target in prose.

## N01 — In §10.26a (line 4037), "the constituents of `V−(dim V)·1`" has no constituents when `V` is a sum of trivial characters

Read as a virtual representation, `V−(dim V)·1` is then zero, so "the largest break" is a maximum over nothing; with `V=1` and `χ` unramified the conclusion `(V⊗χ)^{I_F}=0` would fail. The *Hypotheses* paragraph ("the hypothesis forces `a(χ)≥2`") and the first Check fix the intended reading. Wording such as "the largest break of the constituents of `V` and of the trivial character" would say it in the statement.

## Previous findings

The previous review (of `7c341e7`) had no finding; its three small corrections and its format note are accounted for here.

- C01 (merge order with #3036) — repaired: #3036 is on `main` and this head merges it; line 4075 reads "§10.24; §10.20; §10.26a; `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors` §§AL.1.3.1–AL.1.3.5 …", both changes kept.
- C02 (§10.1 cites only §2.7 for the Deligne local constant) — not repaired: line 3504 still reads "`TauCetiRoadmap.ArithmeticGaloisRepresentations` §2.7 (Local constants)" with no §7.12b; raised again as C01.
- C03 (§7.10a names `TauCeti.EtaleDuality.CohCorr`) — not repaired: line 2861 still reads "its `TauCeti.EtaleDuality.CohCorr` from §6.2"; raised again as C02.
- N01 (§10.26a, constituents of `V−(dim V)·1`) — not repaired: line 4037 unchanged; raised again as N01.

## Verified sound

| Statement | Instances tried | Values computed (roadmap / supplier or source) | Result | Change |
|---|---|---|---|---|
| The 28 changed *Needs:* lines against `main` | diff of the folder against `main` at this head | 23 insertions, 4 deletions, all of them §10.26a and its citations; the 28 lines are identical to `main`'s | merge loses nothing | none |
| §10.27 *Needs:* line after the merge | `main`'s line; this pull request's insertion | `main`: §§AL.1.3.1–AL.1.3.5, AL.1.6.1, AL.3.2.3, AL.3.3.2, AL.3.6.2, AL.3.7.1; head: the same with `§10.26a` after `§10.20` | both kept | none |
| §2.1 orbital integral, now from AutomorphicSpectralTheory §6.9 | `γ=diag(1,−1)` in `PGL₂`; central `γ` | `w γ w⁻¹=−γ≡γ` in `PGL₂`: index 2 on both sides (§2.1 factor `[G_γ:G_γ⁰]`; §6.9 Check halves `O_γ`). Central `γ`: `O_γ(f)=f(γ)` | same convention, connected centralizer | none |
| §3.15 purity, now from DeligneWeightsAndPurity §§8.9, 8.12 | `M^ani` smooth, `f^ani` proper | §8.9(c): `ℚ̄_ℓ` on smooth `X₀` pure of weight 0; §8.12: proper `Rf_*` of pure weight `w` is pure of weight `w`. So `K` pure of weight 0 | the two sections give (a); decomposition from §3.14a | none |
| §10.28 pair-factor compatibility (seeded; *Needs:* line changed) | Scholze Theorem 14.1 (i)–(v), footnote 9 | Source: duals (iii), `det σ(π)=ω_π` (iv), `L` and `ε` of pairs (v); footnote 9: the support-defined `L` differs from the usual one. Roadmap states the same four and the same caveat | locator holds, pp. 35–36 | none |
| §10.28 *Needs:* line | AutomorphicLFunctionsAndLocalFactors §§AL.3.2.3, AL.3.3.2; ArithmeticGaloisRepresentations §§1.1–1.3 | AL.3.2.3 defines `L(s,π×π′)`; AL.3.3.2 defines `γ` and `ε=c·q^{−fs}`; §1.2 has `det`, `dual`, `tensor`; §1.3 induction | each cited section states what is used | none |
| §10.1 local constant (untouched) | *Needs:* line 3504 | Cites §2.7 and rank-one Tate sections only; §7.12b not named | citation too narrow | C01 |

The rows of the previous review for untouched statements (§10.26a and its suppliers) stand as in that review, of `7c341e7`.

- Cross-roadmap citations resolved: every section named in the 28 changed lines (95 section ids in 12 roadmaps: ReductiveGroups §§9B, 9B.3; ReductiveGroupsPartII §RG2.3.7; AutomorphicSpectralTheory §§4.3–4.6, 6.9, 6.10, 6.15, 6.16; AlgebraicCurves §12E; SchemeAndStackFoundations §§1.1, 1.15, 1.16, 1.18–1.21, 2.3; AlgebraicModuliForArithmeticGeometry §§1.3, 7.1; DeligneWeightsAndPurity §§8.9, 8.12; AutomorphicLFunctionsAndLocalFactors, 20 sections; PELModuli §§M2.1, M2.3, M2.6, M2.8, M2.9, M4; AbelianSchemesAndArithmeticModuli, 30 sections; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.2, R07.1.4–R07.1.9, R07.1.12–R07.1.14; ArithmeticGaloisRepresentations §§1.1, 1.2, 1.3, 1.7, 1.12) exists at this head under the title or subject the line gives. Internal: §§1.4, 1.7, 1.12, 1.16, 2.1, 2.4–2.8, 2.11 exist.
- Supplier text read: AutomorphicSpectralTheory §6.9 (lines 2949–2969); DeligneWeightsAndPurity §§8.9, 8.12 (lines 2100–2134); AutomorphicLFunctionsAndLocalFactors §AL.3.3.2 (lines 1386–1392); ArithmeticGaloisRepresentations §1.2 (lines 296–367).
- Source locators checked against the text: 1 (Scholze, *The Local Langlands correspondence for GL_n over p-adic fields*, Theorem 14.1 and footnote 9, author's page, pp. 35–36), for the seeded target §10.28, the only one of the 15 seeded targets in a changed passage.
- Roadmap as record: against the merge base no heading is removed or retitled; the one added heading is §10.26a. `Suggested.lean` is unchanged.
- Changes outside the folder: all 126 files changed against `main` lie in the pull request's own roadmap folders or family index files.
- Overlap check: read AutomorphicSpectralTheory, IgusaVarietiesAndTorsionConcentration (and Part II), AutomorphicGaloisRepresentationsPartII, GlobalShtukasAndFunctionFieldLanglands, ModularityAndLanglandsExtensions; nothing shared by the change. No other open pull request changes this roadmap; it drops no id and cites none that an open pull request drops.
- Automatic checks: the worker's run passed every check. Dependency check output: `depcheck: 132 roadmaps, 1491 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/Suggested.lean` exits 0 with no output; the file declares nothing (its docstring names every headline as not statable), so there is nothing to `#check` or probe.
- Pull request text: the description's sentence on this folder (§10.27 cites the new §10.26a; ClassicalArithmeticCompletion §7.12b a new supplier) agrees with this head; the folder's change against `main` is still those 27 lines.

Source independence: changed passages only; the 28 changed lines are *Needs:* lines that cite roadmap sections and no source, so there is no prose to compare; 1 further passage compared with 1 source (the statement of §10.28 with Scholze's Theorem 14.1), none shared beyond the formulas. Largest share of the linked locators: Shin, *Galois representations arising from some compact Shimura varieties*, 29 of 455; contents not compared, since the change adds, removes and reorders no layer.

Research link: §10.26a is Deligne–Henniart's twist formula for local constants (1981). §10.27 uses it in Henniart's highly ramified argument, by which the trace-defined local Langlands correspondence for `GL_n` (Scholze, cited in §10.1) is shown to match pair `ε`-factors. Rests on README §§10.1 and 10.27 and on DeligneHenniart1981 lines 19–30.

## Not verifiable

- Jacquet–Shalika 1985, cited in an untouched paragraph of §10.27 (line 4065): the linked copy is on a personal web space whose owner the link does not establish as an author, so it was not opened.

## Source issues

- none

## For the human reviewers

- Licence: the README links Jacquet–Shalika, *A lemma on highly ramified ε-factors* (§10.27, line 4065; References), to a Columbia mathematics web space under `~hj`; whether that is an author's page was not settled, and the copy was not read.
