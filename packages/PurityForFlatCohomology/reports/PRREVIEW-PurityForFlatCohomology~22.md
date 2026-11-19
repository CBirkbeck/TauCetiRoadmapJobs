# Review of PurityForFlatCohomology (pull request #1840 at 06dec78)

**Verdict:** accepted

**Summary.** Accepted: this head repairs the one finding of the previous review (the local duality statements and the local Lefschetz theorem are no longer planned here; §1.6 takes local Lefschetz from EtaleDualityAndPerverseSheavesPartII §7.3, which states it with the same hypotheses and ranges), and the full re-read found no false statement: the Checks and worked examples were recomputed, the fifteen sampled targets agree with their sources at the stated locators, every supplier citation resolves, and `Suggested.lean` elaborates with `sorry` as its only warning, none of its fifteen theorems closing in one tactic. There is one small correction and one format note, neither blocking. Three facts on the merge order and on a source not read are left for the human reviewers.

## C01 — The bullet on HeightsRationalPointsAndObstructions stands under "Owned elsewhere and consumed here", but nothing here consumes those statements.

A reader of Scope and ownership (line 221) concludes that §§7.10, 8.7, 8.14 and 8.16 depend on HeightsRationalPointsAndObstructions §§2.6c, 2.6d and 2.16b, a roadmap that is still an open pull request. They do not: none of the four *Needs* lines names that roadmap, the route of §7.10 is de Jong's twisted sheaves on a scheme with an ample invertible sheaf, and §§8.14–8.16 build the residue from §8.13 and Convention 8. The bullet says only that "the forms kept here are wider". One clause would settle it, for instance "no route here uses them; they are named so that the affine and characteristic-zero cases have one owner".

## N01 — "later in the merge order" (Scope and ownership, line 232) is process vocabulary in a text meant to be timeless; "SchemeAndStackFoundationsPartII takes statements of this roadmap" says the same.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 Cohen presentations, `virtualDimension` | `k⟦x⟧` two ways; `k⟦x,y⟧/(x,y)²`; `(x²,y²,xz−yt)`; non-complete regular `B`; valuation ring with `𝔪 = 𝔪²` | `1 = 2−1`; `2−3 = −1`; `4−3 = 1 < 2`; `μ(IB̂) = μ(I)`, `dim B̂ = dim B`; completion a field, value `0` | sound; SGA2 lines 7398, 7453, 7458 (printed pp. 198, 200); CS24 line 1328 |
| 1.3 depth against vdim | `(x²,xy,xz) ⊂ k⟦x,y,z⟧`; `(x²,xy,y²)`; field | `x` killed by `𝔪`, `3−3 = 0`; `2−3 = −1`; `pd = 0` | sound |
| 1.6 étale depth, invertible order | `n = 0, 1`; `k⟦x,y⟧/(xy)`; supplier's ranges | `i < 2 dim` to `i < dim R̃ − 1 = vdim`; `ℤ/ℓ → (ℤ/ℓ)²` cokernel `≠ 0`; same ranges as main's §7.3 | sound; CS24 lines 1381–1392, 1318 |
| 1.7 algebraization | `I = 𝔪`; `dim A = 4, 3`, `d = 1`; `Σ y^{−n²}xⁿ` | both sides `0`; `4 > 3`, `3 > 3` false; pole order `n²` against a linear bound on `A[1/g]` | sound; Stacks 0DXR, 0EHC, 0EJP, 0DX9 read in the cached chapters |
| 1.8 both Zariski–Nagata headlines | `vdim 1, 2, 3`; `dim 0`; `ℂ/ℝ` | two components; `π_1(U) = ℤ/2` at `A_1`; not faithful; `ℂ ⊗ ℂ = ℂ × ℂ` | sound; CS24 lines 1418–1424 |
| 3.2 animated supports | `k ⊕ k[1]`, `𝔾_a`, `Z = ∅`; `𝔽_p ⊕ 𝔽_p[1]`, `μ_p` | `fib(id) = 0` against `H^{−1} = k`; `Hom(𝔽_p[1], 𝔽_p[1]) = 𝔽_p ≠ μ_p(𝔽_p)` | sound; CS24 lines 2256, 2279–2296, 2318–2326 |
| 3.3–3.5 Checks | `α_p`, `𝔽_p[ε]`; `ℤ → ℤ_p`, odd `p`; `ℤ_(p)`, `μ_p` | `R/R^p = 𝔽_pε → 0`; `{±1}/{±1} = 1` against `ℤ/p`; `H²_𝔪 = ℚ^×/(ℤ_(p)^×ℚ^{×p}) = ℤ/p` | sound |
| 4.1, 6.4 `xy` in `H^0_𝔪(α_p)` | four products with generators | `x²y`, `xy²`, `y²t`, `x²z ∈ I`; `xy ∉` span of the quadrics | sound |
| 5.1 Dieudonné side | perfect `A`, `ℤ/p`, `μ_p`; `Z = ∅` | `A^{φ=1}`, `A/(φ−1)`; `V = 0`, `V − 1` invertible; `0` | sound; CS24 lines 3432, 1680, 1759 |
| 5.3 arc hyperdescent of the Dieudonné side | third functor; `𝕄(ℤ/p)` over a ring with `p`-torsion | fibre of `V − 1` commutes with limits; `×p` resolution not exact | sound; CS24 lines 1717–1745 |
| 5.6 `frobeniusSemilinear_exists_fixed_basis` | rank 0; `F = cφ`; `𝔽_3(t)^{perf}`, `F = tφ` | empty basis; `x^{p−1} = c^{-1}`; `−1/2 ∉ ℤ[1/3]` | sound; Kat73 line 2310 (printed p. 142), CS24 line 1837 |
| 6.3 `etaleDepth_ge_virtualDimension` | `xy = 0`; field; `ℚ⟦x,y⟧`, `μ_3`; `𝔽_p⟦x⟧`, `μ_p` | diagonal injective, not onto; nothing claimed; class of `2`; étale `H¹ = 0 ≠` fppf | sound; signature equals README |
| 6.5 degree `dim R` | DVR, `μ_p`; `𝔽_p⟦x,y⟧`, `α_p` | `ℤ/p ⊂ H²_𝔪` at `d + 1`; `ker φ = 0` on `H²_𝔪` | sound |
| 7.1 global purity | two points, `d = 1`; `𝔾_m ∖ {1}` | `(ℤ/2)² → ℤ/2`; `ℤ/p ↪ (ℤ/p)²` | sound with `max(d−1, 1)` |
| 7.2 `free_of_endomorphisms_iso_pi` | `r = 0`; second syzygy of `k`, `dim 3`; `A_1`, `(x,y)` | `M = 0`; `0 → R → R³ → N → 0`, not free; `End = R` | sound as CS24 uses it; Aus62 not read |
| 7.3 torsors and gerbes | `(ℤ/2)_k` trivial torsor | dimensions `4, 4, 8` | sound; CS24 lines 3661–3668 |
| 7.4 factoriality | DVR; `k⟦x,y⟧`; `A_1` | factorial; factorial; `xz = y²` | sound; SGA2 line 3755 (printed p. 105) |
| 7.6 both Picard headlines | node; field; DVR; `A_1` | `ℤ`; empty; `Spec K`; `ℤ/2` at `dim 2` | sound; CS24 lines 3706–3710 |
| 7.7 Cohen–Macaulay counterexample | `n = 2, 3` | `A_1` allowed; `R^×/2 = 0`, torsor class into `H²_𝔪(μ_2)`, `2 < 3` | sound; CS24 lines 3727–3736, where `n ≥ 2` |
| 7.8 both headlines | `c = 0`, `n = 2, 3`; `f_1 = 1`; quadric; cuspidal cubic | trivial quotient; `ℤ`; excluded; `ℤ`; torsion `{(n, na/3)} = ℤ/3` | sound; SGA2 line 4319 (printed p. 121) |
| 7.12 local Brauer conjecture | regular `dim 2, 3`; CI `dim 3, 4`; Segre cone | §7.11; `H²_𝔪 = H³_𝔪 = 0`; `Br(U_R)` infinite; torsion `0 = 0`, `H²(U_R) ≠ 0` | sound; CS24 lines 3765–3793, 91–92 |
| 7.13 kernel-of-tori presentations | `μ_n`; `𝔾_m × μ_n`; torsion-free `M` | `S = D(0)`; `(t,ζ) ↦ tⁿ`; `n = 1`, `L = X^* × ℤ` | sound |
| 7.14 `etaleCohomology_two_gm_torsion_purity` | `U = X`; `U = ∅`; Segre and cubic examples | identity; excluded (`dim 0`); `0 = 0` with `H² ≠ 0`; fails at `dim 3` | sound |
| 8.1 punctured Brauer vanishing | `dim 2`; `dim ≥ 3`; `k⟦t⟧`, `k` imperfect | §7.11; `H²(R, μ_n) = 0 = H³_𝔪`; `Br(k((t)))[p] ≠ 0` | sound |
| 8.2(d) `IsOfDimLEOne` | finite fields; `ℝ`; `𝔽_p((t))`; fixed field of a pro-`p` Sylow | both clauses; `ℤ/2`; `ℚ/ℤ`; cd `≤ 1` with `Br[p^∞] = ℚ_p/ℤ_p` | sound; C19 lines 568–570 |
| 8.3 tori on punctured spectra | `ℝ⟦x,y⟧`, norm-one torus; `ℤ_p⟦x⟧` | `H¹ = ℤ/2`; `0` | sound; C19 lines 87–89, 484–489 |
| 8.5, 8.6, 8.7 supports and purity | `V(x) ⊂ 𝔸²`; `q ≤ 3` strictly local; `q = 0` | `H¹_Z = ℤ`; `H⁰` bijective, `H^{>0}(R) = 0`, `H^{1,2}(U_R) = 0`; `H⁰_Z = H¹_Z = 0` | sound; C19 lines 493–518 |
| 8.9, 8.10 intersection over codimension one | `Spec ℤ`; field; `ℙ¹_ℝ` | `inv_p = 0` for all `p` gives `0`; whole group; fails without (6.2.1) | sound; C19 lines 520–535 |
| 8.11 flasque tori | `ℤ_sign`; `ℤ[G]` | `Ext¹(ℤ_sign, ℤ) = ℤ/2`; `Ext¹(ℤ_sign, ℤ[G]) = 0` | sound |
| 8.15, 8.16 residue sequences | `ℝ⟦t⟧`; `Spec ℤ`; quaternions | `ℤ/2 → (ℤ/2)² → ℤ/2`; injective; residue `1/2` at `2` only | sound |
| 8.17 imperfect height-one residue fields | `ℤ_p⟦x⟧`; equal characteristic; `dim 1` | `(p)`, `𝔽_p((x))`; every height-one prime contains `p = 0`; vacuous | sound; C19 lines 560–562 |
| C01 (Heights bullet) | *Needs* lines of §§7.10, 8.7, 8.14, 8.16 | the roadmap is named once, at line 225 | small correction |

- Source locators checked against the text: 41 (22 in CS24, 9 in C19, 5 in SGA2, 4 Stacks tags, 1 in Kat73). The page markers of the SGA2 text are those of the file, 8 more than the printed pages the README cites.
- Library declarations opened at the pins: `TauCeti/RingTheory/AdicCompletion/LocalRing.lean:52` and `:58`; the other names are unchanged since the head the previous review searched (339 names, none missing), and the Lean file is byte-identical to that head.
- Cross-roadmap citations resolved: EtaleDualityAndPerverseSheavesPartII §§6.11, 6.12, 7.1, 7.3 (main, lines 1402, 1422, 1452, 1484); ModularCurves Layers 0.2, 0.5, 0.9 (main); GroupSchemesOverABase §§0.1, 1.1–1.5, 2.1–2.3, 2.7 (main); ReductiveGroups Layer 9D (main); SchemeAndStackFoundations §2.9a at the head of its open revision; HeightsRationalPointsAndObstructions §§2.6c, 2.6d, 2.16b at its open head.
- Elaboration: `lake env lean` on `TauCetiRoadmap/PurityForFlatCohomology/Suggested.lean` gives 15 `sorry` warnings and nothing else. The file has no `variable` line, so no binder can be lost; the 25 elaborated types were compared with the README statements, none differs.
- One-tactic probe on a copy (`rfl`, `trivial`, `infer_instance`, `simp`, `simp_all`, `decide`): 15 errors, one at each theorem; none closes.
- Headlines: the 15 stated theorems are the statable ones; the module docstring names the carrier each unstated headline lacks (restriction maps on fppf cohomology, animated rings, Dieudonné modules, gerbes, Azumaya Brauer groups, pullback of small-étale cohomology).
- Automatic checks: all passed on this head; none set aside.

Overlap check: read LocalPurity, PerfectoidQuotientsPartII and SchemeAndStackFoundations (main), SchemeAndStackFoundationsPartII and the open revision of SchemeAndStackFoundations that adds §2.9a; the scope of CrystallineCohomology and EnhancedDerivedSheaves at their open heads was not read. fppf cohomology with supports: construction SchemeAndStackFoundations §2.9a, étale excision, spectral sequence, descent and continuity here (§2.9a at its head says so). Animated supports, finite-ideal excision, fpqc hyperdescent and the ample Brauer comparison: here, cited by SchemeAndStackFoundationsPartII as a consumer. Purity for regular local rings and completion: LocalPurity, cited. Local Lefschetz: EtaleDualityAndPerverseSheavesPartII, cited. Affine Brauer comparison and henselian residue: HeightsRationalPointsAndObstructions, named with the wider forms kept here.

Source independence: 16 passages compared with 5 sources (CS24, C19, SGA2, Stacks, Kat73), none shared (longest common run 6 words, a standard phrase, in §7.7 against CS24 line 3732); largest share CS24, 127 of 213 bracketed locators; contents compared with CS24: independent (Layer 3 ↔ §§5.2–5.5 precedes Layer 4 ↔ the end of §4.1, Layer 5 merges §§4.2, 5.5, 6.1, Layers 0 and 8 match no section; Layers 6 ↔ §6.2 and 7 ↔ §7 are last because §6.2 needs §§1.6, 3.4–3.6, 4.2–4.3, 5.10 and §7.1 needs §§6.2, 6.5).

Research link: The headlines are the theorems of Česnavičius–Scholze, *Purity for flat cohomology* (Ann. of Math. 2024), which settle Gabber's 2004 conjectures on local Picard and Brauer groups, and of Česnavičius, *Purity for the Brauer group* (Duke 2019); README Summary and References, statements read in CS24 and C19.

**Previous review, finding by finding.**

- R01 (local duality and local Lefschetz owned twice): repaired. §§1.4–1.5 are gone; Scope now reads "EtaleDualityAndPerverseSheavesPartII §§7.1, 6.11, 6.12, 7.3. §1.6 here uses §7.3"; a contract `### From TauCetiRoadmap.EtaleDualityAndPerverseSheavesPartII` is added; the *Needs* line of §1.6 and the Layer 1 dependencies name §7.3. That section on main (`TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md`, line 1484) states: regular local `R`, `f ∈ 𝔪`, `ℓ` invertible, bijective for `i < dim R − 1`, injective for `i = dim R − 1`, no excellence; the contract here says the same.
- C01 (wider Brauer forms not said to be wider): repaired, up to the clause asked for in C01 above.
- C02 (Downstream consumers still naming §0.2 for supports): repaired; the bullet now reads "étale excision, the comparison with étale supports and continuity for fppf cohomology with supports (§§0.2–0.3)".
- C03 (two names attributed to ModularCurves): repaired; the contract cites `TauCeti.AdicCompletion.ringKrullDim_eq` and `TauCeti.AdicCompletion.isRegularLocalRing_iff`, which are at the pin (`TauCeti/RingTheory/AdicCompletion/LocalRing.lean`, lines 52 and 58).
- C04 (description said the reverse of main): repaired; the description now says the local Lefschetz theorem "comes from EtaleDualityAndPerverseSheavesPartII".
- N01, N02: repaired (proposed names of §2.9a in italics; ModularCurves cited as Layers 0.2, 0.5, 0.9, which are its headings at lines 821, 994, 1231). N03 was an option and was not taken.

The pull request's text was read against the head: the title, the summary block and the prose (a new roadmap; Layer 1 numbered 1.1–1.3 and 1.6–1.8; fifteen stated headlines; §2.9a only at the head of the open revision of SchemeAndStackFoundations) agree with the folder. No change outside the folder.

The automatic checks all passed on this head; the dependency check gives `depcheck: 199 roadmaps, 2191 edges, 0 problem(s)`, with no UPWARD or CYCLE line.

## Not verifiable

- [Aus62] Theorem 1.3, [Avr77] Proposition 3.6, [Gab04b], [MB85], [Bou78], [BH] Definition 2.3.1, [DF84], [Gro68], SGA 3, SGA 4: cited by locator without text; the uses of [Aus62], [MB85], [Gab04b] and [Bou78] were read where CS24 invokes them (lines 3661, 91, 3785).
- [Poo17], [CTS87], [ILO14], [Gro66], [dJ02], [Koh72], [ALB23], [Lau13], [EGA44]: outside this round's sample, not reopened.
- The scope of CrystallineCohomology and EnhancedDerivedSheaves at their open heads: not read.

## Source issues

- **Error** in CS24 at Theorem 7.1.2, printed p. 87: the source says local rings regular of dimension at least d − 1 suffice; it should be at least max(d − 1, 1), since d = 1 admits a field and two points give a counterexample; affects a stated result.
- **Gap** in CS24 at Lemma 4.1.12, printed p. 40: the source says the integer n is smaller than dim R; it should be any integer, since the proof of Theorem 6.2.7 applies the lemma with n = dim R; affects the proof.
- **Misprint** in CS24 at the proof of Theorem 7.2.5, printed p. 90: the source says the Kummer identification holds for n ≥ 0; it should be n ≥ 1; affects nothing.

## For the human reviewers

- Supplier still open: SchemeAndStackFoundations §2.9a, on which Layer 0 is built, exists only at the head of pull request 2531; the description says that pull request has to merge first.
- Merge order: the merge-order file lists EtaleDualityAndPerverseSheavesPartII (line 423) after this roadmap (line 235), although it is on main and supplies §1.6 here.
- Not read: [Aus62] Theorem 1.3 supports the stated headline `free_of_endomorphisms_iso_pi`; the statement follows its use in CS24 (proof of Theorem 7.1.3, p. 88).
