# Review of TaylorBoundsAndDepthsOnHeightTwoFormalGroups (pull request #3027 at 3f8c596)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/TaylorBoundsAndDepthsOnHeightTwoFormalGroups/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 27 lines changed since `7b5fe43`; the verdict is accepted, with no findings. The three small corrections of the previous review are repaired: the README now states the rule by which a declaration counts as a statement of [FormalProof] and applies it in 4.6, 4.8a and 4.19, 4.8a has its references, and the description names the new supplier. The new attribution of (J3) of 4.8 to `GaussBK`, with the explicit loss, agrees with the formal proof's source and implies the README's loss term. Two format notes are carried over, none blocking; the scope and licence facts about the unrefereed main source remain for the human reviewers.

## N01 — The paragraph "Corollaries of general theorems" (lines 47–54) explains a `*Corollary of:*` label that no section of this roadmap carries

A clause saying that no section here carries it would save the reader a search.

## N02 — The `*Sources:*` lines name results, not works

"(Legendre)" in 4.1, "(LP duality, complementary slackness)" in 4.6, "(Wick's theorem)" in 4.8a (line 646, although the Origin label two paragraphs above now cites Isserlis 1918 and Wick 1950), and the like in 4.4, 4.19a, 4.19b, 4.19e: a label such as "Classical ingredients:" or the cited text with a locator would match the content.

## Questions for the author

- The Origin label of 4.1 attributes "the change of radii and contractive substitution" to Bosch–Güntzer–Remmert §5.1. Does that section treat polyradii other than 1, or only the Tate algebra on the unit polydisc, the change of radii coming from RestrictedPowerSeries §1.2 alone? I could not open a legal copy of the book.

## Previous findings

- none: the previous review (at `7b5fe43`) had no findings. Its other remarks at this head:
- C01 — repaired: "A declaration counts as a statement of [FormalProof] when the proof of its main theorems uses it, that is, when the kernel export of those theorems has it by exact name"; 4.6, 4.8a and 4.19 carry the qualification.
- C02 — repaired: the Origin label of 4.8a cites "(Isserlis 1918; Wick 1950)" and the References give Biometrika 12 (1918), 134–139 and Phys. Rev. 80 (1950), 268–272.
- C03 — repaired: the description says "RestrictedPowerSeries §§1.1, 1.2, 2.2 is a new supplier" in its entry for this roadmap.
- N01, N02 — not repaired: unchanged text; written again above as format notes.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| 4.8 `*In [FormalProof]*`: (J3) is `GaussBK`, from `EntryB` with `J = {b < i}` | source of `GaussBK` (`StatementGK.lean`:47), `GaussBK_of` (`EGaussK.lean`:166); `i = 1` | weight exponent: `s` even `min(ht, i) − #(I ∩ {b<i})`, `s` odd `#(I ∩ {b<i})`, `2 < p`, `1 ≤ i`; `i = 1`, column 0 chosen: even `1 − 1 = 0`, odd `1`; `GaussBK_of` applies `EntryB` to `univ.filter (b.val < i)` | agrees with (J3) |
| 4.8: `EntryB` has an arbitrary column set | `EntryB` (`StatementE.lean`:211) | binder `J : Finset (Fin r1)`; weight `Σ e x` over (even, `x ∉ J`) or (odd, `x ∈ J`) plus `#(I ∩ J)` at odd letters | as the README says |
| 4.8: explicit loss | `deLoss`, `lgN` (`StatementAB.lean`:100, 95); `p = 3` | `deLoss = Σ_s(r1·lgN(al) + r0·r1·lgN(ls)) + Σ_{TT} lgN(al)²`, `r0 = N`, `r1 = N′`; `lgN(0) = 0`; `lgN(8) = 2 = ⌈log_3 9⌉`, `lgN(9) = 3 = ⌈log_3 10⌉`, `lgN(1) = 1` | formula as written |
| 4.8: the explicit loss against the README's `lg` | `deg_s = α_s + d_s`, `lg_p(y) = log_p max(y,1) + 1` | `⌈log_p(x+1)⌉ ≤ lg_p(2 + x)`; `N′·lgN(α_s) + NN′·lgN(d_s) ≤ 2NN′·lg_p(2 + deg_s)`; square term `≤ lg_p(2 + α_s)²`: `deLoss ≤ lg` with `C = 2` | the proof's form implies the stated one |
| 4.8: names used by the main theorems | kernel export | `GaussBK`, `GaussBK_of`, `EntryB`, `EntryStar`, `EntryExcessBound`, `EntryCappedBound`, `deLoss`, `lgN` (all `Formalism.InvariantFactorPaths.G7`): each present once | no qualification needed |
| 4.6 Origin and `*In [FormalProof]*`: three clauses stated but unused | `LemmaFb`, `LemmaFd`, `TopRadius` (`IncomingBound.lean`:63, 75, 93); `lemmaFb`, `lemmaFd`, `topRadius` (`WeightIdentities.lean`:18, 20, 23) | `LemmaFb` has homogeneity, `ConvexOn`, `rho·ΣD ≤ Fnum` and no upper bound; `LemmaFd` has `D s ≤ Σ D(s−i)/l^i`; `TopRadius` is (e); all six absent from the export (0 hits each) | as the README now says |
| 4.6 (b), upper bound is the roadmap's own | `n′ = 2`, `p = 3`, `D = (1, 0)` | zero flow is the only one (`3x_{0,1} + x_{1,1} ≤ 1`, `3x_{1,1} + x_{0,1} ≤ 0`): `𝔉 = γ·1 = 3/8`, upper bound attained; not in `LemmaFb` | consistent |
| 4.8a: `ThmB`, `thmB` unused | `StatementN.lean`:59, `FinalB.lean`:101; export | five `ThmB` and five `thmB` in the export, all in other namespaces; none in `Formalism.DworkPowerSeriesWeights` | as the README now says |
| 4.19: `Plan.Ok` unused | `ValuationChoiceHypothesis.lean`:44 (namespace `Formalism.L2.FormalSeriesBounds`); export | `Plan.Ok`: 0 hits; `RowData`, `Plan.bound`, `Windows` present in that namespace | as the README now says |
| Rule in "Statements of the formal proof" | the three sections it lists | the nine qualified names (4.6: six; 4.8a: two; 4.19: one) are exactly those outside the export; the description's "nine marked as such" agrees | holds |

The rows for the statements the change does not touch stand as in the previous review, of `7b5fe43`.

- Formal-proof declarations opened at the cited commit: 14 (`GaussBK`, `GaussBK_of`, `EntryB`, `EntryStar`, `EntryExcessBound`, `EntryCappedBound`, `EntryHyp`, `deLoss`, `lgN`, `lsN`, `LemmaFb`, `LemmaFd`, `TopRadius`, `Plan.Ok`); the five file paths the change adds exist there.
- Kernel-export lookups: 22 names; results in the table.
- Seeded sample: of its targets the change touches 4.6, 4.8 (through 4.7–4.8a) and 4.19; each is in the table. The others are unchanged since `7b5fe43`.
- Cross-roadmap citations: the change adds none. Files of the family's index changed since `7b5fe43` do not touch this roadmap's rows.
- README on `main` against the head: no layer, section or statement removed or renumbered (0 headings removed, 1 added, 0 Lean declarations changed).
- Description against the head: its entry for this roadmap (names removed, nine marked, the new supplier) and its entry for 4.6 (f) agree with the head.
- Automatic checks: all passed. Dependency check: `depcheck: 124 roadmaps, 1411 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean`: three `declaration uses 'sorry'` warnings, nothing else; the change does not touch the file, so the binders stand as checked at `7b5fe43`.

Overlap check: read HodgeTateLatticesAndLubinTateLogarithms, LocalGainOfThetaChains, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (the open-roadmap and results-and-headings lists are empty); shared: the letter logarithms, Dwork's lemma, quasi-logarithms and the colength bound §0.5d, owned by HodgeTateLatticesAndLubinTateLogarithms and cited here; the Gauss norm of restricted series, owned by RestrictedPowerSeries and cited here; 4.1–4.19f owned here and consumed by the other two; no open pull request changes this roadmap.

Source independence: changed passages only; 7 passages compared (the rule sentence, the Origin and `*In [FormalProof]*` lines of 4.6, the `*In [FormalProof]*` lines of 4.8, 4.8a and 4.19, the Method label of 4.8a) with 1 source ([FormalProof], whose opened files carry no prose), none shared; largest share [FormalProof], all 23 formal-proof locator lines; contents not compared: no layer added, removed or reordered.

Research link: The headline bounds (4.5, 4.6, 4.19f) are steps of the announced proof of GRH for Dirichlet L-functions (Alpöge, 2026: [Announcement], [FormalProof]), used by LocalGainOfThetaChains; they build on Lubin–Tate (1965), Mumford's biextensions of formal groups (1969) and Mazur–Messing (1974). Rests on the README's summary and References.

## Not verifiable

- Isserlis (1918) and Wick (1950), the new references of 4.8a: no open copy opened; cited for the name of the classical formula only, with no locator into the text.
- Bosch–Güntzer–Remmert, *Non-Archimedean Analysis* (1984), §5.1 (Origin label of 4.1): a Springer volume, no open copy.
- Mumford, *Bi-extensions of formal groups* (1969), and Hazewinkel, *Formal groups and applications* (1978), chapter II (labels of 4.4 and 4.8b′): no open copy.
- Katz (1981) and Mazur–Messing (1974) on the `*Sources:*` lines of 4.19a and 4.19e: no locator given, no open copy found.

Automatic checks set aside as false positives: the citation resolver lists `Formalism.L2.FormalSeriesBounds.RawChart.AxesSt` (4.19e) as found nowhere; it is a declaration of the formal proof, present in its kernel export, and the resolver does not search that repository.

## Source issues

- none

## For the human reviewers

- Scope: every formal-proof locator of the README points into [FormalProof], an unrefereed Lean proof announced on 2026-11-20 ([Announcement]); the classical inputs (Lubin–Tate, Mumford, Mazur–Messing, Cartier, Isserlis, Wick) are cited without locators.
- Licence: [FormalProof] was read from a local copy of the public repository; the README does not record that repository's licence. The roadmap reuses file paths and declaration names only.
- Not tested: Bosch–Güntzer–Remmert, Mumford (1969) and Hazewinkel (1978) could not be read, so the Origin labels citing them were checked against [FormalProof] only.
- Neither recorded decision bears on this folder: it removes no section and moves nothing to another roadmap.
