# Review of QuaternionArithmetic (pull request #1722 at 0b75fee)

**Verdict:** accepted

Incremental re-review of 14 changed lines since 17a00a0 (three passages of `TauCetiRoadmap/QuaternionArithmetic/README.md`: the Tau Ceti supplier contract at lines 231–233, the first step of §0.6 at lines 613–617, and the *Needs:* line of §0.6 at lines 631–632), together with the pull request's title and description read against this head. No finding.

## Previous findings

- The previous report, of `17a00a0`, had no finding (its two bullets recorded repairs of an earlier round, and both passages are unchanged at this head).

## Verified sound

| Statement | Instances | Values computed (both sides) | Result |
| --- | --- | --- | --- |
| §0.6, first step (`README.md:613–617`): for `char E ≠ 2` and `L/E` a quadratic field extension, `L ↪ B` iff `L` splits `B` | `M₂(E)`, any `L`; `ℍ[ℝ,−1,−1]`, `ℂ`; `ℍ[ℚ,−1,−1]` with `ℚ(i)`, `ℚ(√2)`, `ℚ(√−7)` | `M₂(E)`: regular representation embeds, `M₂(L)` split. `ℂ`: embeds, `ℍ ⊗ ℂ ≅ M₂(ℂ)`. `ℚ(i)`: embeds, `−1 = i²` splits. `ℚ(√2)`: neither (real place stays definite). `ℚ(√−7)`: neither (2 splits, `K_w = ℚ₂`) | holds, both directions |
| "That an embedded `L` splits it is Tau Ceti's `TauCeti.Algebra.isSplittingField_of_finrank_eq_deg`, for a subfield whose degree `2` is the degree of the algebra" | the pinned statement, on `A = ℍ[E,a,b]`, `finrank E L = 2` | pin: `(f : L →ₐ[K] A) (h : finrank K L = deg K A) : IsSplittingField K A L`; `deg = Nat.sqrt (finrank K A) = √4 = 2`; conclusion `∃ n, L ⊗ A ≃ₐ[L] M_n(L)`, dimension `4 = n²` gives `n = 2` | holds; the lemma gives exactly the forward half |
| "For a field `E` of characteristic not `2`" (the hypothesis the diff adds) | the lemma's instance arguments on `ℍ[E,a,b]`; the source's standing hypothesis | `IsCentral`, `IsSimpleRing` on `ℍ[K,a,b]` need `[Invertible (2 : K)]` (`Algebra/Quaternion/CentralSimple.lean:66–69, 151`); voight line 3059 assumes `char F ≠ 2` through Chapter 5 | holds; the hypothesis is the one both the pin and the source need |
| "the converse, that a splitting `L` embeds, is proved here" | search of the pin for a statement producing `L →ₐ[K] A` from `IsSplittingField` | none: the consumers of an `IsSplittingField` hypothesis at the pin are in `Splitting.lean`, `SplittingDescent.lean:260`, `CrossedProduct/Splitting/Class.lean:208`; none concludes an embedding | holds; not a duplicate |

The rows for the roadmap's other statements stand as in the previous review, of `17a00a0`: the diff changes no theorem statement, only the route and supplier text of §0.6.

- **Library declarations opened at the pin (Tau Ceti `2fd255d`):** 6: `TauCeti.Algebra.isSplittingField_of_finrank_eq_deg` (`Algebra/CentralSimple/Subfield.lean:339`, in `namespace TauCeti` / `namespace Algebra`, variables `[Field K] [Field L] [Algebra K L] [Ring A] [Algebra K A] [Algebra.IsCentral K A] [IsSimpleRing A] [FiniteDimensional K A]`), `Algebra.deg` (`Algebra/CentralSimple/Degree.lean:159`), `deg_sq` (`Degree.lean:235`), `Algebra.IsSplittingField` (`Algebra/CentralSimple/Splitting.lean:113`), `isSplittingField_iff_deg` (`Splitting.lean:213`), and the quaternion instances of `Algebra/Quaternion/CentralSimple.lean:69, 151`. The file path and the qualified name cited at `README.md:232–233, 615, 632` are exact.
- **Source locators checked against the text:** 1: `[V, 5.4.7]`, p. 73 — voight lines 3517–3518 (Lemma 5.4.7, the iff for a quadratic extension), on the page whose running head is 73 (voight line 3472); the standing `char F ≠ 2` is at voight line 3059.
- **Seeded sample:** none of the fifteen sampled sections is touched by the diff; §0.6, which is, was read in full.
- **Description against the head:** the change adds one pinned Tau Ceti declaration to the supplier contract and no roadmap supplier, section, headline or `Suggested.lean` declaration; title, summary block, prose paragraph and file bullets (11 layers, 87 milestones, 30 headline theorems) still agree with the head.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits with 30 `declaration uses sorry` warnings and no other message. The diff does not touch `Suggested.lean`.
- **Worker's gate:** every counter 0, `build=0`, OK. **My rerun:** every counter 0, OK.
- **Dependency check** (the brief's command, `--movable`): `depcheck: 250 roadmaps, 2380 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- **Outside the folder:** `git diff --stat origin/main...HEAD` outside the folder is empty. **Overlaps:** no other pull request changes this roadmap; no dropped or revision-only id; the resolver lists no unresolved cross-roadmap citation, and the changed passages add none.

Overlap check: read ArithmeticFuchsianGroups, HilbertModularVarietiesAndShimuraCurves and AdelicAlgebraicGroups as in the previous reviews (their handoffs in *Scope and ownership* are unchanged by this diff); nothing shared. The object the diff newly cites, the splitting of a central simple algebra by a subfield of full degree, is owned by Tau Ceti at the pin and is cited, not restated.

Source independence: 3 passages compared (changed passages only) with 1 source, none shared: the statement at `README.md:613–614` is a one-clause iff the mathematics forces (voight lines 3517–3518), the other two are supplier citations with no source behind them; largest share voight, about 190 of about 234 locators; contents not compared again, since the diff adds, removes or reorders no layer.

## Not verifiable

- "One of 23 roadmaps for the mathematics behind the LMFDB, opened as drafts": a statement about other pull requests, not about this folder; not checked.
- The description's generated blocks (`depends-on`, `merge-order`): outside this check.
- `pizer1976`, `eichler1955`, the LMFDB knowls, and the uncertified `ogg1983`, `vigneras1980`, `pizer1980`, `shimizu1965`, `alsina_bayer2004`: as in the earlier reports; none is cited by a changed passage.

## Source issues

- none

## For the human reviewers

- Voight's book carries about 190 of about 234 locators (`README.md:17` cites it without saying the roadmap follows it); the arrangement was compared with its contents in earlier rounds and not again in this one.
