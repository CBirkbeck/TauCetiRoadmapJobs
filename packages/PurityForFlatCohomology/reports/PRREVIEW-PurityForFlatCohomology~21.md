# Review of PurityForFlatCohomology (pull request #1840 at dcbce5f)

**Verdict:** needs changes

**Summary.** Changes are needed for one reason: §§1.4–1.5 state, as targets owned here, the local étale duality on excellent regular local rings and the local Lefschetz theorem that EtaleDualityAndPerverseSheavesPartII, which is on main, already owns (its §§5.7, 6.11, 6.12, 7.1–7.3) and says this roadmap does not own. No stated theorem was found false: every Check and worked example was recomputed, the sampled locators agree with the sources (including the README's corrections to them), and `Suggested.lean` elaborates with `sorry` as its only warning and none of its fifteen theorems closes in one tactic. There are four small corrections and three format notes, none blocking; two points on the merge order are left for the human reviewers.

## R01 (P2) — The local duality statements of §1.4 and the local Lefschetz theorem of §1.5 are owned by EtaleDualityAndPerverseSheavesPartII on main, so they have two owners.

An implementer finds the same four statements planned in two roadmaps, each of which says the other is to take them from it. The README says (Scope and ownership, line 225) "The local étale duality statements and the local Lefschetz theorem (§§1.4–1.5): to be imported by EtaleDualityAndPerverseSheavesPartII", and again under Downstream consumers (line 3323). That roadmap is on main, and its scope paragraph (`TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md`, line 23) says the opposite: it owns the affine Lefschetz case for principal punctured opens (§7.1, from §5.7), the normalised dualizing complex `Λ(d)[2d]` of a strictly henselian excellent regular local ring with `j^! = j^*` and `Rj_* D_U ≅ D j_!` (§6.11), local duality (§6.12) and the local Lefschetz theorem (§7.3), and that this roadmap "takes the local Lefschetz theorem from §7.3 … and owns none of these statements". I compared the statements: §1.4(a) here is its §7.1, §1.4(b) its §6.11 (there for every `n ≥ 2` invertible, here for a prime `ℓ`), §1.4(c) its §6.12, and §1.5 its §7.3 word for word in hypotheses and ranges (regular local `R`, `f ∈ 𝔪`, bijective for `i < dim R − 1`, injective for `i = dim R − 1`). A roadmap on main is earlier than every open one, whatever position the merge-order file gives it, and that roadmap states that nothing in it depends on this one, so no cycle arises.

The smallest change: remove §§1.4 and 1.5 as targets; in §1.6 replace "§1.5" by "EtaleDualityAndPerverseSheavesPartII §7.3" in the route and in the *Needs* line (line 1221); move the item from "This roadmap owns" and from "Owned here and to be imported by later roadmaps" to "Owned elsewhere and consumed here" with a `### From TauCetiRoadmap.EtaleDualityAndPerverseSheavesPartII` contract; and drop "local Lefschetz" from the Layer 1 row of the table, the Layer 1 dependencies and the Downstream consumers bullet. A copy of the README with that *Needs* line passes the dependency check with no upward edge. The Checks of §§1.4–1.5 that are not already in that roadmap (the `d = 1` computation of `H^i_𝔪(R, j_!ℤ/ℓ)`, the `𝔽_2` example showing strict henselianity is needed) are true and could be offered to it, but they do not belong to a target here.

## C01 — HeightsRationalPointsAndObstructions already plans the affine and quasi-projective Brauer comparison and the residue of a henselian discrete valuation ring; §7.10 and §§8.14–8.16 keep wider forms without saying so.

HeightsRationalPointsAndObstructions, an open new roadmap earlier in the merge order, states `Brauer.affine_comparison` (its §2.6c: `Br_Az(Spec R) ≅ H²_ét(Spec R, 𝔾_m)_tors` for every commutative `R`), `Brauer.quasiProjective_comparison` (§2.6d) and, in §2.16b, `smoothBrauer_residueExact` (the residue sequence of a smooth integral variety in characteristic zero, with removal of codimension `≥ 2`) and `brauerResidue_henselianFormula` (`∂(χ, t) = χ` for a henselian discrete valuation ring and `n` invertible). §7.10 here contains the first two as the cases `L = 𝒪` and `X` quasi-projective, §8.7 and §8.16 contain the third, and the third API bullet of §8.14 is the fourth in a wider setting; the README never names that roadmap, so a reader cannot tell which statement to build on. I checked that the normalisations agree: both give the crossed product with `uⁿ = π` and `χ(σ) = 1/n` the residue `χ`.

Add a bullet under "Owned elsewhere and consumed here" naming HeightsRationalPointsAndObstructions §§2.6c, 2.6d and 2.16b, and one clause in §7.10 and §8.14 saying how the forms kept here differ (any scheme with an ample invertible sheaf; any discrete valuation ring, including the `p`-primary part for a perfect residue field; any Noetherian integral regular scheme). A Check in §8.14 that Convention 8 agrees with `brauerResidue_henselianFormula` would pin the sign across the two roadmaps.

## C02 — The Downstream consumers bullet still says that §0.2 supplies fppf cohomology with supports.

Line 3318 says "SchemeAndStackFoundationsPartII is to import fppf cohomology with supports (§0.2)". Since the last change the construction, its long exact sequence, excision for an open containing the support and the triple sequence are SchemeAndStackFoundations §2.9a's (as §0.2 and the Scope section now say), and SchemeAndStackFoundationsPartII at its open head takes the construction for schemes from §2.9a and from here only étale excision, the comparison with étale supports and continuity. The bullet would read "étale excision, the comparisons and continuity for fppf cohomology with supports (§§0.2–0.3)".

## C03 — Two lemma names attributed to ModularCurves exist nowhere; the statements are Tau Ceti's.

The ModularCurves contract (line 573) cites `ringKrullDim_adicCompletion` and `isRegularLocalRing_adicCompletion_iff`. Neither name occurs in ModularCurves, in any roadmap on main or at the pins. ModularCurves itself says these facts are at the pin, and they are: `TauCeti.AdicCompletion.ringKrullDim_eq` and `TauCeti.AdicCompletion.isRegularLocalRing_iff` (`TauCeti/RingTheory/AdicCompletion/LocalRing.lean`, lines 52 and 58). Cite those two under "From Tau Ceti" and drop the two names from the ModularCurves contract.

## C04 — The description says EtaleDualityAndPerverseSheavesPartII takes the local duality and Lefschetz statements from this roadmap.

The summary block of the description has "EtaleDualityAndPerverseSheavesPartII takes the local duality and Lefschetz statements". Main shows the reverse (R01). After the repair the sentence would read "it takes the local Lefschetz theorem from EtaleDualityAndPerverseSheavesPartII §7.3", and the dependency paragraph ("Roadmaps on main are cited by name; everything else named in the README is a consumer") then holds as written.

## N01 — `Scheme.fppfCohomology` and `Scheme.fppfCohomologyWithSupport` (line 551) are in code font, but SchemeAndStackFoundations §2.9a writes them as proposed names in italics and declares neither; write them as that section does.

## N02 — ModularCurves is cited by its former labels "Layer 4D", "0B" and "0E"; its README maps them to Layer 0.9 and Layer 3.6, Layer 0.2 and Layer 0.5, so the citations resolve, and the current numbers would save the reader the table.

## N03 — Tau Ceti has relative cohomology at the pin (`CategoryTheory.Sheaf.relativeH'`, `TauCeti/CategoryTheory/Sites/SheafCohomology/Relative.lean`), which applies to the small étale site, so `etaleDepth_ge_virtualDimension` could be stated as the vanishing of `H^i_𝔪`. The restriction form in the file is equivalent (I checked both directions through the long exact sequence), so this is an option only; the Tau Ceti contract would then list the declaration, on which §2.9a also builds.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 0.1 punctured spectrum of a semilocal ring | field; DVR; `k × k`; zero ring; finite map | `U_K = ∅`; `Γ(U_R) = K ≠ R`; `U = ∅` for `k × k`; nonmaximal primes exactly; [C19] §1.5 p. 3 agrees | sound |
| 1.1 Cohen presentations, vdim | `k⟦x⟧` two presentations; `k⟦x,y⟧/(x,y)²`; `(x²,y²,xz−yt)`; non-complete regular `B`; non-Noetherian valuation ring | `1 = 2−1`; `2−3 = −1`; `4−3 = 1 < 2 = dim`; `μ(IB̂) = μ(I)`; `sInf {v} = v`, completion a field gives `0` | sound; [SGA2] XIV 5.2–5.4 pp. 198–200 |
| 1.4 local étale duality | `d = 0, 1`; `K = j_!ℤ/ℓ`; `𝔽_2`, `ℓ = 3` | `H^i_𝔪 = 0, ℤ/ℓ, ℤ/ℓ(−1)` both ways; `H^1(𝔽_2, ℤ/3) = ℤ/3` vs stalk `0` | true; owned on main (R01) |
| 1.5 local Lefschetz | DVR; `f = 0`; `k⟦x,y⟧`, `f = x` | `0 → ℤ/ℓ` injective; identity; degree 2: `0 → ℤ/ℓ(−1)` not onto | true; identical to main's §7.3 (R01) |
| 1.6 étale depth, invertible order | `n = 0, 1`; `k⟦x,y⟧/(xy)` | `vdim(R_*) ≥ vdim R + 1`; `H^0_𝔪 = 0`, `H^1_𝔪 ≠ 0` (two components) | sound once §1.5 is cited |
| 1.8 Zariski–Nagata, both headlines | `vdim = 1, 2, 3`; `dim 0`; `ℂ/ℝ` pullback | `xy = 0` disconnected; `A_1`: `π_1(U) = ℤ/2`; node extends; not faithful in `dim 0` | sound; [CS24] 3.3.1 pp. 34–35 |
| 3.3 nilpotent invariance | `𝔾_m`, `k[ε]`; `α_p`, `𝔽_p[ε]`; `μ_p`, `ℤ/p²`; `𝔽_p ⊕ 𝔽_p[1]` | kernel `1 + kε`; `H^0 = H^1 = 𝔽_pε → 0`; `μ_p(ℤ/p²) = ℤ/p → 1`; `H^0(A, μ_p) = 𝔽_p` | sound; [CS24] 5.2.9, 5.2.10 p. 57, same ranges |
| 5.1 Dieudonné side | perfect `A`, `ℤ/p`, `μ_p`; `Z = ∅` | `A^{φ=1}`, `A/(φ−1)`; `V−1` invertible gives `0`; `0` | sound; (6.1.1.1) p. 82, Example 4.2.2 p. 41 |
| 5.8 arc hyperdescent | `𝒪_C`, `μ_p`; `ℤ_p⟨t⟩` | `μ_p(𝒪_C/p) = 1 + p^{1/p}𝒪_C/p ≠ 1 = μ_p(k̄)`; `𝔽_p[t]` imperfect | sound; [CS24] 5.5.1 p. 68 |
| 6.2 purity for complete intersections | DVR; `𝔽_p⟦x,y⟧`, `α_p`; `A_1`, `μ_2` | `H^0_𝔪 = H^1_𝔪 = 0`; `H^2_𝔪(A_1, μ_2) ⊇ ℤ/2` at `i = dim` | sound; [CS24] 6.2.3 p. 83 |
| 6.3 `etaleDepth_ge_virtualDimension` | restriction form vs vanishing; `xy = 0`; field; `ℚ⟦x,y⟧`, `μ_3`; `𝔽_p⟦x⟧`, `μ_p` | equivalent both ways; diagonal `ℤ/n → (ℤ/n)²`; `ℚ^×/ℚ^{×3} ∋ 2`; étale `H¹ = 0 ≠` fppf | sound; signature equals README |
| 6.5 regular rings, degree `dim R` | DVR, `μ_p`; field; `𝔽_p⟦x,y⟧`, `α_p` | `H^2_𝔪 ⊇ ℤ/p` at `d + 1`; `H^0_𝔪(K, ℤ/n) = ℤ/n`; `ker φ = 0` on `H^2_𝔪` | sound; [CS24] 6.2.7 p. 85 |
| 7.1 global purity | `Spec k ⊔ Spec k`, `d = 1`; `𝔾_m ∖ {1}`, `μ_p` | `(ℤ/2)² → ℤ/2` not injective; `ℤ/p ↪ (ℤ/p)²` | sound with `max(d−1, 1)`; source needs the correction |
| 7.2 `free_of_endomorphisms_iso_pi` | `r = 0`; `M = 0`; second syzygy of `k` over `k⟦x,y,z⟧` | `M = 0` free; `0 → R → R³ → N → 0`, `N` not free | sound as [CS24] p. 88 uses it; [Aus62] not read |
| 7.4 factoriality | DVR; `k⟦x,y⟧`; `A_1` | factorial; factorial; `xz = y²` not regular | sound; [SGA2] XI 3.13(i) p. 105 |
| 7.6 both Picard headlines | node; field; DVR; `A_1`; cubic cone | `ℤ`; trivial; trivial; `ℤ/2` at `dim 2`; infinite torsion at `dim 2` | sound; [CS24] 7.2.1 p. 88 |
| 7.8 both headlines | `c = 0`, `n = 2, 3`; `f_1 = 1`; quadric surface; cuspidal cubic | trivial quotient; `ℤ`; excluded by positive degree; quotient `ℤ`; torsion `ℤ/3` | sound; [CS24] 7.2.3 p. 89, [SGA2] XII 3.7 p. 121 |
| 7.9 torsion of `𝔾_m`-cohomology | DVR; field; Leray edge map | `H^1(X, i_*ℤ) = 0`, `R^1g_*𝔾_m = 0` give injectivity under factoriality | sound; [Gro66] 1.4, 1.8 pp. 291, 293 |
| 7.10 Gabber–de Jong | affine; `U_R`; infinitely many variables | `L = 𝒪`; quasi-affine; `U_R` not quasi-compact, no claim | sound; [dJ02] Theorem 1.1; affine case owned elsewhere (C01) |
| 7.12 local Brauer conjecture | regular `dim 2, 3`; CI `dim 3, 4` | `H^2_𝔪 = H^3_𝔪 = 0` needs `dim ≥ 4` (CI), `≥ 3` (regular); `dim 3` CI: `Br(U_R)` infinite | sound; [CS24] 7.2.5, 7.2.6 p. 90 |
| 7.12c `IsTorus`, Cartier-dual criterion | `α_p`, `μ_p`; norm-one torus; empty family; `k × k` | dual `α_p` not étale; split over `ℂ` only; excluded by surjectivity; ranks `1, 0` | sound; agrees with GroupSchemesOverABase §§2.1–2.2 |
| 7.13 kernel-of-tori presentations | `μ_n`; `𝔾_m × μ_n`; torsion-free `M` (`n = 1`) | `S = D(0)`; `(t, ζ) ↦ t^n`, kernel `T[n]`; `L = X^* × ℤ`, `K = ℤ` | sound |
| 7.14 `etaleCohomology_two_gm_torsion_purity` | `U = X`; `U = ∅`; Segre example; cubic example | vacuous iso; excluded (`dim 0`); torsion `0 = 0`, `H² ≠ 0`; fails at `dim 3` | sound; [CS24] 1.1.4 p. 4, 7.2.8 p. 91 |
| 8.1 punctured Brauer vanishing | `dim 2`; `dim ≥ 3`; DVR `k⟦t⟧`, `k` imperfect | §7.11; `H²(R, μ_n) = 0 = H³_𝔪`; `Br(k((t)))[p] ≠ 0` | sound; [C19] 5.3 p. 12 |
| 8.2(d) `IsOfDimLEOne` | finite fields; `ℝ`; `𝔽_p((t))`; pro-`p` Sylow fixed field | cd 1, Br 0; `H²(ℝ, ℤ/2) = ℤ/2`; `Br = ℚ/ℤ`; cd `≤ 1` but `Br[p^∞] = ℚ_p/ℤ_p` | sound; [C19] Definition A.1 p. 15 |
| 8.3, 8.6, 8.7 torus and `𝔾_m` purity | `ℝ⟦x,y⟧`, norm-one torus; `V(x) ⊂ 𝔸²`; `q ≤ 3` on strictly henselian `R` | `H^1 = ℤ/2`; `H^1_Z = ℤ`; `H^q_𝔪(R, 𝔾_m) = 0` for `q ≤ 3` | sound; [C19] 1.1, 1.4, 6.1 pp. 1, 3, 13 |
| 5.6 `frobeniusSemilinear_exists_fixed_basis` | rank 0; `F = cφ`; `𝔽_3(t)^{perf}`, `F = tφ` | empty basis; root of `x^{p−1} = c^{-1}`; `x² = 1/t` has no solution | sound |
| 8.11–8.15 flasque tori, residues | `ℤ_sign`; `ℝ⟦t⟧`; `(L/K, σ^{-1}, π)` | `Ext¹(ℤ_sign, ℤ) = ℤ/2`, `Ext¹(ℤ_sign, ℤ[G]) = 0`; `ℤ/2 → (ℤ/2)² → ℤ/2`; class `−χ` | sound; sign agrees with the other owner (C01) |

- Source locators checked against the text: 49 (27 in [CS24], 10 in [C19], 7 in [SGA2] across Exposés X, XI, XII and XIV, 2 in [Gro66], 1 each in [dJ02], [Koh72] and [ILO14] XV 1.2.4).
- Library declarations opened at the pins: every backticked Mathlib and Tau Ceti name of the README was searched (339 names, none missing); 16 opened by file and line, among them `TauCeti/AlgebraicGeometry/FiniteEtale/PuncturedSpectrum.lean:92`, `TauCeti/RingTheory/RegularLocalRing/UniqueFactorization.lean:59`, `TauCeti/RingTheory/AdicCompletion/LocalRing.lean:52`, `Mathlib/RingTheory/RegularLocalRing/Defs.lean:93`.
- Cross-roadmap citations resolved: 23 suppliers, each on main with the cited section or name present (ModularCurves through its table of former labels; `localCI_parafactorial` resolves to `nonempty_localCI_parafactorial`); SchemeAndStackFoundations §2.9a read at the head of its open revision.
- Dependency check: `depcheck: 199 roadmaps, 2190 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/PurityForFlatCohomology/Suggested.lean` gives 15 `sorry` warnings and nothing else; `#check @name` types compared with the README for the 25 declarations, no binder lost.
- One-tactic probe on a copy (`simp`, `rfl`, `infer_instance`, `trivial`, `simp_all`): none of the 15 theorems closes. On the same copy `HasSheafify (Scheme.fppfTopology.over S) AddCommGrpCat.{u}` fails to synthesize and the instances at `u + 1` and on the small étale site succeed, as the module docstring says.
- Headlines: the 15 stated theorems are the statable ones; the docstring names the carrier each unstated headline lacks (fppf restriction maps, animated rings, Dieudonné modules, gerbes, Azumaya Brauer groups, pullback of small-étale cohomology).
- Automatic checks: all passed on this head; none set aside.

Overlap check: read LocalPurity, EtaleDualityAndPerverseSheavesPartII, PerfectoidQuotientsPartII (main), SchemeAndStackFoundationsPartII and both open revisions of SchemeAndStackFoundations; the scope of CrystallineCohomology and EnhancedDerivedSheaves at their open heads was not read. Local duality and local Lefschetz: owner EtaleDualityAndPerverseSheavesPartII (R01). fppf cohomology with supports: construction SchemeAndStackFoundations §2.9a, étale excision, spectral sequence, descent and continuity here. Animated supports, finite-ideal excision, fpqc hyperdescent and the ample Brauer comparison: here, cited by SchemeAndStackFoundationsPartII. Purity for regular local rings and completion: LocalPurity, cited. Outside the three lists, the affine Brauer comparison and henselian residue: HeightsRationalPointsAndObstructions (C01).

Source independence: 24 passages compared with 6 sources (CS24, C19, SGA2, Gro66, dJ02, Koh72), none shared; largest share CS24, 135 of 297 bracketed locators; contents compared with CS24: independent (Layer 3 ↔ §5 precedes Layer 4 ↔ part of §4.1, Layer 5 merges §§4.2, 5.5, 6.1, Layers 0 and 8 match no section; the order is forced by §4.4 needing §§2.1, 3.1–3.2 and §5.8 needing §§3.4–3.5).

Research link: The headlines are the theorems of Česnavičius–Scholze, *Purity for flat cohomology* (Ann. of Math. 2024), which prove Gabber's 2004 conjectures on local Picard and Brauer groups, and of Česnavičius, *Purity for the Brauer group* (Duke 2019), settling Grothendieck's purity conjecture; README Summary and References, statements read in CS24 and C19.

## Not verifiable

- Stacks tags 0DXR, 0DX9, 0EHC, 0EJP (§1.7): the cached Stacks text is the commutative algebra chapter only; not opened.
- [Aus62] Theorem 1.3, [Avr77] Proposition 3.6, [Gab04b], [MB85], [Bou78], [BH] Definition 2.3.1, [DF84], [Gro68], SGA 3, SGA 4, SGA 5: recorded as cited by locator without text; the uses of [Aus62], [Avr77] and [Bou78] were read where [CS24] invokes them (pp. 88, 32, 90).
- [ILO14] XVII Théorème 0.2 of the published version and XVIII-A Lemma 2.2, [Poo17], [CTS87], [Kat73], [ALB23], [Lau13], [EGA44]: outside the sample, not opened this round.
- The scope of CrystallineCohomology and EnhancedDerivedSheaves at their open heads: not read.

## Source issues

- **Error** in CS24 at Theorem 7.1.2, printed p. 87: the source says local rings regular of dimension at least d − 1 suffice; it should be at least max(d − 1, 1), since for d = 1 a field is admitted and two points give a counterexample; affects a stated result.
- **Gap** in CS24 at Lemma 4.1.12, printed p. 40: the source says the integer n is smaller than dim R; it should be any integer, since the proof of Theorem 6.2.7 (p. 85) applies the lemma with n = dim R and the proof never uses the bound; affects the proof.
- **Misprint** in CS24 at the proof of Theorem 7.2.5, printed p. 90: the source says the Kummer identification holds for n ≥ 0; it should be n ≥ 1; affects nothing.
- **Misprint** in CS24 at the proof of Theorem 6.2.7, printed p. 85: the source says f lies in the square of the ideal generated by p and x_1, …, x_n; it should be x_1, …, x_d; affects nothing.

## For the human reviewers

- Merge order: the merge-order file lists EtaleDualityAndPerverseSheavesPartII after this roadmap, although it is on main and owns §§1.4–1.5's statements (`TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md` line 23).
- Supplier still open: SchemeAndStackFoundations §2.9a exists only at the head of pull request 2531. The description's prose says so; its generated merge-order block says no pull request must merge first.
- Licence: [Aus62] Theorem 1.3 supports the stated headline `free_of_endomorphisms_iso_pi` and its text was not read; the statement follows the use in CS24 line 3684.
- Not tested: §1.7 against Stacks tags 0DXR, 0DX9, 0EHC, 0EJP, whose text is not in the cache.
