# Review of EtaleDualityAndPerverseSheaves (pull request #1040 at ceff72f)

**Verdict:** accepted

Incremental re-review of the 108 lines changed since `40031fa` (README only). No finding. The gate passes.

## Previous findings

- R01 — repaired: line 1079 "Let `X` be a quasi-compact quasi-separated scheme and `Λ` a finite ring annihilated by an integer `n` invertible on `X`"; line 1097 "It is a unit: a finite trivializing cover bounds the nilpotence"; the two non-quasi-compact sentences are gone.
- R02 — repaired: both sentences deleted; the only "Part II" left is line 4155, a part of Katz's article.
- R03 — repaired: line 66 "Layers A, D and F supply"; 274 "Weil I 2.12"; 385–386 "(Var 1) `Tr_f`", "rank `r`"; 5141 "finite length"; a search for spans opening with rank, length, Layer, Weil or Part finds none.
- R04 — repaired: line 921 computes `H⁰(ℙ¹, j_!Λ) = 0` against `H²_c(𝔾_m, Λ(1)) = Λ`; line 5609 is one Check giving `π_*ℚ̄_ℓ[d] = IC_μ ⊕ C` for Zhu's resolution; the two use-only bullets are gone.
- R05 — repaired: §7.5 has parts (a), (b) finite order, (c) semisimple; the smooth-point part, its proof step and "Only (b) requires smoothness" are deleted; lines 7418, 7434–7436, 7443, 7449 and the Check at 7462 use the new letters.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §1.2 Chern classes (changed) | rank one; `O ⊕ O(1)` on `P^m`; `X` not quasi-compact; supplier range | `ξ + c₁(L) = 0`; `1 + h`; now excluded by the hypothesis; EtaleCohomologyFoundations §0.9 states qcqs, main line 1122, open head line 1123 | holds; generality equals the supplier's and line 4284's |
| §0.7 Check on `j_*` against `j_!` (changed) | `j : 𝔾_m → ℙ¹`, `F = Λ`, `Λ = ℚ_ℓ` and `O/πᵐ` | `j_*Λ = Λ_{ℙ¹}`: `H⁰ = Λ`, `H²(Λ(1)) = Λ`; `j_!`: `H⁰_c(𝔾_m) = 0`, `H²_c(𝔾_m, Λ(1)) = Λ`; ranks 0 and 1 | holds; `j_!` pairing not perfect |
| §5.6 Check on Zhu's resolution (changed) | `μ` quasi-minuscule not minuscule; `SL₂`, `μ = α^∨` | `Gr_{≤μ} = Gr_μ ⊔ Gr_0`, `π` an isomorphism over `Gr_μ`; quadric cone, fibre `ℙ¹`, `d = 2`, `C = H²(ℙ¹) ≠ 0` at the base point | holds; Zhu-2017 lines 1222, 1239–1258 (Lemma 2.12(ii), p. 25), 1289–1293 (p. 26), 979 (§2.1.1, p. 20) |
| §7.5 isolated local terms (changed; sample) | (a) against the source; (b) on `x³+yz`, `g = (x,−y,−z)`; (c) `g = (x, ty, t⁻¹z)`; translation on `ℙ¹`, characteristic `p` | (a) is Corollary 4.11; `Fix(g) = k[x]/(x³)`, conormal weight `−1`; weights `t, t⁻¹ ≠ 1`; local term 2 against stalk trace 1, `g` unipotent, excluded | holds; Varshavsky-LocalTerms-2023 lines 407–420, 474–477 |
| §§0.6, 4.5 (sample; spans only) | lines 850, 856, 4485, 4530 | word taken out of the span, formula unchanged: "rank `2g`", "Weil I (2.10)", "rank `s ≥ 2`", "rank 2" | statements unchanged |

The rows for the untouched statements stand as in the previous review, of `40031fa`.

- Gate at ceff72f: every scanner 0, `depcheck=0`, `build=0`, `OK` (the worker's run and mine). Dependency check: `depcheck: 245 roadmaps, 2242 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. No file changed outside the folder.
- `lake env lean` on `Suggested.lean`: seven `sorry` warnings only. The file is unchanged since `40031fa`, so the one-tactic probe and the signature comparison of that review stand.
- Source locators checked against the text this round: 9 (Zhu-2017 Lemma 2.11, Lemma 2.12(ii), §2.1.1 and pages 20, 25–27; Varshavsky-LocalTerms-2023 Theorem 4.10, Corollary 4.11, Lemma 5.1, Corollaries 5.4, 5.6 in arXiv v3; Hansen-Kaletha-Weinstein-2022 Proposition 5.6.2, line 2500); none wrong.
- Cross-roadmap citations resolved for the changed passages: EtaleCohomologyFoundations §§0.9, F.7 on main and at its open head; no other roadmap cites §7.5 of this one by part letter (search of main and the open heads: no match), so the relabelling breaks nothing.
- Pull-request text against this head: the description names no hypothesis, section letter or Check that the change touches; Downstream consumers (line 7640) still names GeometricSatakeAndFusion and EndoscopicTransferAndUnitaryTraceComparison as the description does. Nothing to correct.
- Overlap check: read LefschetzPencilsAndVanishingCycles, EtaleCohomologyFoundations (main and open revision), DeligneWeightsAndPurity, FourierDeligneTransform, EtaleDualityAndPerverseSheavesPartII, SchemeAndStackFoundations; the change moves no ownership. Projective-bundle formula and Kummer class: EtaleCohomologyFoundations §0.9; higher étale Chern classes: §1.2 here, no other roadmap states them; the other shared objects are owned as the previous review lists.
- Source independence: changed passages only; 3 passages compared with 2 sources (Zhu-2017, Varshavsky-LocalTerms-2023), none shared (longest common run three words; the shared formula `π_*ℚ̄_ℓ[d] = IC_μ ⊕ C` is forced); largest share BBD-1982, 78 of about 230 locators, as before; the diff adds, removes and reorders no layer, so the contents were not compared again.
- Remark: Hansen-Kaletha-Weinstein-2022 Proposition 5.6.2 is stated on p. 61 and its proof is on p. 62 (lines 2500, 2507); line 7450 gives p. 61 for both.

## Not verifiable

- Varshavsky-LocalTerms-2023: statement numbers read in arXiv v3 (pp. 10–11); the journal pages 995–997 that line 7449 cites were not read, the service returns the preprint.
- Milne-LEC §23 and Deligne-WeilI-1974 (2.12), (2.14): not reopened this round; the previous review read them and the change alters no locator into them.
- Huber-1996, Fulton-1998, Serre-AlgLoc, Jantzen-2003 and the other texts of the previous review's list: as there.

## Source issues

- **Error** in Varshavsky-LocalTerms-2023 at Lemma 5.1 (arXiv v3, p. 10): the source says that for a diagonalizable group and any invariant closed subscheme the normal cone of the fixed loci maps isomorphically onto the fixed points of the normal cone; it should be restricted, for instance to the full fixed subscheme: for `μ₂` on `x³+yz=0` and the reduced origin the source is `Spec k[x]/(x³)`, the target a line; affects a stated result.

## For the human reviewers

- Scope: FourierDeligneTransform (open, its README line 76) declares `gap:perverse-exactness-affine-smooth` asking EtaleCohomologyFoundations §F.8 for smooth and affine perverse `t`-exactness; §2.7 of this README states those theorems; §F.8 does not, on main or in its open revision.
- Scope: `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4091` on main names this roadmap as owner of étale supports, `f^!`, absolute purity and Brauer-group purity; this README (line 13) assigns them to EtaleCohomologyFoundations, LefschetzPencilsAndVanishingCycles §0.10 and PurityForFlatCohomology Layer 8.
- Scope: §§7.3–7.5 rest on the README's own correction of a published lemma (Varshavsky-LocalTerms-2023 Lemma 5.1, see Source issues); the corrected route uses the full fixed subscheme and Theorem 4.10(b).
- Licence: ECD-2026 is an author manuscript dated 14 April 2026 on the author's page, cited by manuscript pagination (`README.md`, References).
- Licence: SGA4-XIV, SGA4-XVII and SGA4-XVIII are cited from a retyped edition on a personal page (`README.md`, References); the previous review read them as an author page.
- Licence: Milne-AG-2017 is cited from the author's copy of a Cambridge University Press book (`README.md`, References).
