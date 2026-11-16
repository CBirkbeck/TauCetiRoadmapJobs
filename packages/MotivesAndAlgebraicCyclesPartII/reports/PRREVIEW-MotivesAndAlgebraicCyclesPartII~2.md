# Review of MotivesAndAlgebraicCyclesPartII (pull request #2459 at 1fff774)

**Verdict:** accepted

No findings. This is an incremental re-review of the 25 lines that changed since c2ddf08, together with the pull request's title and description.

## Previous findings

- R01 — repaired: Summary: "the explicit description of motivic K-theory on nonarchimedean strictly totally disconnected rings, after inverting their residue characteristics, by the cofibre of the K-theory of the ideal of topologically nilpotent elements".
- R02 — repaired: §1.7, Checks: "For nonarchimedean `C` the effective projection formula fails for this map … At `C = ℂ` it holds: there `f_*` is `RΓ(S², −)` … of cohomological dimension `2`".
- R03 — repaired: §0.7 now reads "satisfies Tau Ceti's `TauCeti.IsReplete`" and cites "(Mondal–Reinecke, Theorem A, p. 1, … Definition 3.5, p. 8)". The *From Tau Ceti* bullet, the *Needs* line, the Layer 0 Dependencies, [MR] in References and `MR` in `sources.toml` are all in place.
- R04 — repaired: the elliptic-curve Check now sits under §11.4, Checks, and §11.4's *Needs* adds "for the Checks, §§2.7, 8.2, 8.5, 10.1, 10.6, 11.1, SchemeKTheoryOperations §2.6 and MotivicEtaleKTheory §2.2". §9.5 has a new Check that uses only Layers 0–8.
- R05 — repaired: the description lists the end theorems with their sections and says "`Suggested.lean` declares nothing." The sentences about real-bodied definitions and about `sorry` warnings are gone.
- R06 — repaired: the summary block now reads "The main source is Scholze's Berkovich motives."

## Verified sound

| Statement | Instances tried | README side | Computed / source side | Result |
|---|---|---|---|---|
| Summary clause and §7.6 (changed clause) | `C = ℂ₂`; `C = ℂ`; `A = ℂ₂ × ℂ₃`; residue characteristic 0 | nonarchimedean, after inverting the residue characteristics | `π₀ Kmot(ℂ₂) = ℤ[1/2] = π₀ cofib[1/2]`; on `ℂ`, `3 · (1/2)` has norm `> 1`, so no ideal; `S = {2, 3}`; `p = 1` | holds; Scholze Thm 8.9 line 1988 (p. 47), Thm 1.7(iii) line 191 (p. 5) |
| §0.7: the arc-topos is `TauCeti.IsReplete` | `Type` (`isReplete_type`); étale topos of `ℚ` with the tower `μ_{ℓⁿ}` and `ℓ`-th power maps | contract quotes the projection onto `F(0)`, then onto every `F(n)` | `Replete.lean:91` field `epi_π_app_zero`, `:107` `epi_π_app`; for `ℚ_ét`, `lim = 0 ↛ μ_ℓ ≠ 0`, so not replete | holds |
| §0.7 Postnikov consequence | hypercomplete versus plain `Shv∞` | hypercomplete ∞-topos Postnikov complete | MR Thm A line 38 (p. 1), Def 3.5 line 429 (p. 8), proof line 624 (p. 11); Rem 1.4 line 66: `Shv∞` need not be hypercomplete | holds; "hypercomplete" needed |
| §1.7 Check, `ℙ¹_C → Marc(C)` | `C` nonarchimedean; `C = ℂ`, `M = ℤ` | the formula fails nonarchimedean and holds at `ℂ` | `H¹(ℙ¹_C, Ḡ_m) ≠ 0` against `Ḡ_m(C)` in degree 0 (line 1101); `RΓ(S², −)` has dimension 2, both sides give `f_*N` at `ℤ` (line 2124, p. 50) | holds |
| §9.5 new Check, `X = Marc(Cont([0,1], ℂ))` | `j : (0,1] → [0,1]`; control `j′ : (0,1) → [0,1]` | `j_!ℤ ∈ DMT(X)` but not Tate-generated | stalks `0` at `0`, `ℤ` at `t > 0`; `H⁰([0,1]) → H⁰({0})` is `id_ℤ`, so `H^*_c((0,1]) = 0`; `H¹_c((0,1)) = ℤ ≠ 0` | holds; the left orthogonal is localizing and contains `ℤ(n) = ℤ` |
| §11.4 moved Check, `E × E` over `𝔽̄_p` | classes `E × {0}`, `{0} × E`, `Δ` | `dim End(ℚmot[E]) ≥ 3 > 2` | matrix rows `(0,1,1)`, `(1,0,1)`, `(1,1,0)`, determinant `2`; `Δ² = 2 − 2g = 0`; inputs §§2.7–11.1 precede §11.4; "first Check" is the orthogonality bullet | holds |
| `gap:replete-postnikov` | README against `plan.json`; supplier at main | same slug, supplier EnhancedDerivedSheaves §E2.7 | `plan.json` slug identical; ED line 2389 says repleteness "is not claimed to suffice"; no roadmap cites MR | holds; precise, minimal, still a gap |

The rows for untouched statements stand as in the previous review, of c2ddf08.

- Locators: MR Theorem A, its proof, Definition 3.5 and the v2 date (lines 38, 624, 429, 45), and Scholze lines 191, 1095–1101, 1988, 2124 and 2354 were read. Of the seeded sample only §7.6 falls in the changed text; the other 14 targets are unchanged.
- Library: `#check` elaborated `TauCeti.IsReplete`, `TauCeti.IsReplete.epi_π_app` and `TauCeti.isReplete_type`, and each matches the contract (`Replete.lean:91`, `:107`, `:97`). `TauCeti/CategoryTheory/Sites/Replete.lean:48` was read: the pin has no repleteness criterion for a general site, so §0.7 owns the proof for the arc-topos.
- Citations: EnhancedDerivedSheaves §§E2.1, E2.3, E2.7 (main, lines 2035–2389) resolve. So does SchemeAndStackFoundations §2.17, whose `IsReplete` is `TauCeti.IsReplete` (main, line 4979). SchemeKTheoryOperations §2.6 (main, line 719) and MotivicEtaleKTheory §2.2 (open head) also resolve. Layer 9 no longer cites either of the two moved suppliers.
- Gate at 1fff774: every check 0, OK (the worker's run and a rerun). Dependency check: `depcheck: 264 roadmaps, 2584 edges, 0 problem(s)`. The diff outside the roadmap folder is empty.
- Lean: `lake env lean Suggested.lean` exits 0 with no output. The file is unchanged and declares nothing, so there is nothing to probe for padding.
- Pull-request text: the title, the summary block and the prose agree with the head. The eight end-theorem bullets carry the nine docstring headlines (§§6.1/6.3 and §7.6 share one bullet), and "the repleteness predicate … taken from Tau Ceti" is now true.
- Overlap check: for the changed objects, read EnhancedDerivedSheaves (main and #1630), DiamondEtaleCohomology, ArcTopologyAndDescent, RationalAnalyticPrismatization, AnalyticStacks, SchemeKTheoryOperations and DiamondsAndVStacks. The repleteness predicate is owned by Tau Ceti `TauCeti.IsReplete`. Repleteness of the Banach arc-topos is owned here; DiamondEtaleCohomology §§C0.20–C0.21 cover the topoi of diamonds, which are other sites. The replete Postnikov theorem is the declared gap to EnhancedDerivedSheaves §E2.7.
- Source independence: changed passages only. Six passages (the Summary clause, the IsReplete bullet, the gap sentence, §0.7, the §1.7 Check and the §9.5 Check) were compared with 2 sources (Scholze, MR). The longest shared run is 5 words, "replete topos is Postnikov complete", which the statement forces (MR line 7). The largest share is Scholze, about 108 of 130 locator citations. The contents were not compared again because no layer was added, removed or reordered; they were independent at c2ddf08.
- Remark (moved, otherwise unchanged text): SchemeKTheoryOperations §2.6 states that `K → G` is an equivalence for regular noetherian `X`. The vanishing of `K_{−i}(E)` that the §11.4 Check uses also needs `G` to be connective, which §2.6 does not state.

## Not verifiable

- BLR §9.2 (cited in §4.3, unchanged): the manifest records it as uncertified (paywalled), so it is cited by locator and was not read.
- MR's journal pagination (Homology Homotopy Appl. 27 (2025), 179–196) could not be confirmed online. The README's locators use arXiv v2, which was read.

## Source issues

- none

## For the human reviewers

- none
