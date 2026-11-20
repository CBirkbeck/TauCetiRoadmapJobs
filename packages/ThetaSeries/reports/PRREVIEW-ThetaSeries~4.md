# Review of ThetaSeries (pull request #2725 at 047e91a)

**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of the 125 lines changed since `c969dbd` finds no finding. The one earlier finding is repaired: the partial Fourier transforms of former §1.2 are no longer a target and are handed to AnalyticNumberTheoryPartII §5.3g, with a normalisation comparison that I recomputed and found correct; the new non-coprime Checks of §6.2 are correct. There are no small corrections and one format note (coarse locators, carried over), which does not block. For the humans: no cited source could be read legally, so wording and arrangement were compared with no source.

## N01 — Locators are coarse or missing

§§2.9, 7.1 and 7.6 name no source, and apart from Turaev §1.3, Miyake §4.9, Serre Ch. VII §6 and Conway–Sloane Ch. 2 §2.3 every locator is a whole chapter or appendix (Ebeling Ch. 2 and Ch. 3, Schoeneberg Ch. IX, Ogg Ch. VI, Iwaniec Ch. 10, Milnor–Husemoller App. 4). A theorem or page number at each claim would let a reader check the hypotheses.

## Previous findings

- R01 — repaired: Layer 1 has no sections; *Owned elsewhere* (lines 953–962) gives the partial transforms to AnalyticNumberTheoryPartII §5.3g; row 1.2 of the table points there; the *owns* sentence no longer lists §1.2.
- C01 — repaired: the sentence "No other roadmap states a theta series … or a modularity theorem for one" is gone from *Scope and ownership*; nothing replaces it.
- N01 — not repaired: locators as before (format note N01 above); the former §1.2, one of the four sections without a source, is no longer a section.
- N02 — repaired: §6.2 has a Check at `√2 ℤ²`, `a = c = 2`, and at `A₂`, `a = c = 3` (lines 402–409), both recomputed below.

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| §6.2 new Check, `√2 ℤ²`, `a = c = 2` | Gram `diag(2,2)`; `L/2L` (4 classes), `L^∨/2L` (16 classes) | `G_L(2,2) = 4`; `∑_{u mod 4} e(-u²/4) = 2 - 2i`, square `-8i`; right side `1·½·i·(-8i) = 4` | true | none |
| §6.2 new Check, `A₂`, `a = c = 3` | Gram `[[2,1],[1,2]]`; `L/3L` (9), `L^∨/3L` (27) | `G_L(3,3) = 9 = 3²·G_L(1,1)`; dual sum `-15.588i = -9i√3`; right side `9`; over `L^∨/L` only: `-i√3`, giving `1 ≠ 9` | true; the control separates | none |
| §6.2 `gaussSum_eq_mul_dualGaussSum` (cited by the Check) | `(ma, mc)` scaling at `m = 3`, `A₂`; `√2 ℤ²` at `(3,1)` | both sides scale by `m^{2k} = 9`: `1 → 9`; `(3,1)`: `1 = (1/3)·½·i·(-6i)` | true | none |
| *Owned elsewhere*, partial Fourier transforms | AnalyticNumberTheoryPartII §5.3g on main, lines 681–686; real place, `B = ⟪·,·⟫`, `ψ_ℝ(x) = exp(2πix)` | `f̂(y) = ∫ f(x) e(⟪x,y⟫) dx = 𝓕f(-y)`; self-dual measure on `ℝ` is `dx`, product measure on `ℝⁿ`; `exp(-πx²)` self-dual both ways; the four listed properties are in line 686 | true | none |
| *Owned elsewhere*, "No layer here uses them" | search of the head for the partial transforms, `integral_prod`, the slice lemmas | only row 1.2 of the table and the *Owned elsewhere* bullet mention them; no *Needs:* line does | true | none |
| *How to read the build*, unnumbered sections resolve through the table | rows 1.1–1.6, 4.1–4.4 of the table | each of the six Layer 1 numbers and four Layer 4 numbers has a row; row 1.2 names the Tau Ceti declarations and §5.3g | true | none |
| *Downstream consumers*, LatticePackingsAndPerfectForms "former Layer 1" | rows 1.1, 1.4 | Poisson summation and dual covolume rows name Tau Ceti declarations | true | none |

The rows for the untouched statements stand as in the previous review, of `c969dbd`.

- Source locators checked against the text: 0; the diff adds no locator, and no cited work has a legal copy (as in the previous review).
- Cross-roadmap citations resolved: AnalyticNumberTheoryPartII §5.3g on main (`TauCetiRoadmap/AnalyticNumberTheoryPartII/README.md` lines 681–688; line 7 names that roadmap the single owner of §§5.3f–5.3n). No roadmap on main or at an open head cites this roadmap's 1B, §1.2 or its partial Fourier transforms, so the removed section breaks no citation.
- Library declarations: the diff removes three Tau Ceti names and `MeasureTheory.integral_prod` from the contracts together with their only use; the names kept in row 1.2 are unchanged from the head the previous review opened.
- Automatic checks: all passed on this head. Dependency check output: `depcheck: 182 roadmaps, 2074 edges, 0 problem(s)`. Nothing changes outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives only the 10 `sorry` warnings; the file is unchanged since `c969dbd`, so its signatures, the padding probe and the headline list stand as in the previous review.
- The pull request's description against the head: 39 Checks (counted: 39), reciprocity "at coprime and at non-coprime pairs", the paragraph on the partial Fourier transforms (old 1B on main, lines 452–457, stated exactly the Schwartz property and the `n`-fold composite), Layer 1 without sections, and the list of remaining targets (§2.9, §3.4, §5.3, §§6.2, 6.3, 6.5, 6.6, §§7.1, 7.3–7.6, §8.6) all agree with the head.

Overlap check: read AnalyticNumberTheoryPartII (main) for the changed passages; HalfIntegralWeightModularForms, SiegelModularForms, LatticePackingsAndPerfectForms, OrthogonalTamagawaAndLatticeMass, IntegralLattices as in the previous review. Partial Fourier transforms of Schwartz functions: owner AnalyticNumberTheoryPartII §5.3g, cited here, no longer a target here. Nothing else shared has changed. IntegralLattices and Rank24LatticeConstructions at their open heads were not read, so ownership against them was not checked.

Source independence: changed passages only; 0 passages compared with 0 sources, because no cited source has a legal copy the sources service could read; largest share Ebeling, *Lattices and Codes*, 6 of 18 locators; its table of contents could not be read. The diff removes Layer 1's only section and adds or reorders no layer; the removed section cited no source.

Research link: Layers 6–7 are the Hecke–Schoeneberg theorem and its Gauss-sum arithmetic (Schoeneberg 1974, Ch. IX; Ebeling 2013, Ch. 3; Milnor–Husemoller 1973, App. 4; Turaev 1998). On main, LatticePackingsAndPerfectForms and QuaternionArithmetic §7.7 consume Layer 7. Rests on the README's references and those roadmaps' READMEs.

## Not verifiable

- Seeded sample, source side: none of the sampled sections' locators falls in a changed passage except §6.2's Checks, which cite no source; the cited works (Turaev 1998; Milnor–Husemoller, Serre, Ebeling, Schoeneberg, Miyake, Conway–Sloane, Springer; Iwaniec; Ogg) have no legal copy the sources service could read, as in the previous review.

## Source issues

- none

## For the human reviewers

- Not tested: Ebeling, *Lattices and Codes*, has the largest share of the locators (6 of 18). Neither its text nor its table of contents could be read, nor any other cited source, so wording and arrangement were compared with no source.
