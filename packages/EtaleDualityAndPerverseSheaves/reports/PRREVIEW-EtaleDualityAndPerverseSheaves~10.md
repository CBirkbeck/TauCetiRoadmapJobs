# Review of EtaleDualityAndPerverseSheaves (pull request #3027 at 477bb48)

**Verdict:** needs changes

**Summary.** A review of the change against `main`: 197 changed lines since `aecb53a`. I checked the new §7.6 (Lefschetz numbers of finite-order automorphisms) and the five passages that point to it, recomputing every Check and degenerate case and reading its locators in Dudas–Michel §13, Serre's Bourbaki exposé and Illusie–Zheng; the statements and Checks hold. Two findings need changes: the route of the torus fixed-point formula uses a stabilizer-finiteness lemma that its cited supplier, ReductiveGroups Layer 4, does not state, and the new consumer ReductiveGroups Layer 9F makes ReductiveGroups and this roadmap suppliers of each other. There are three small corrections and no format notes; the human reviewers are asked only about Deligne–Lusztig 1976, which has no legal open copy.

## R01 (P1) — The route of the torus fixed-point formula needs the finiteness of stabilizers of a diagonalizable group action, and no supplier states it

An implementer of lefschetzGroupActions (b) is sent to ReductiveGroups Layer 4 for its key step, and Layer 4 does not have it. The step is not routine. For a non-normal `X`, or a disconnected `D` that permutes components, it needs generic flatness of the stabilizer family and the rigidity of groups of multiplicative type.

The route of (b) (lines 7541–7542) says to apply "the finiteness of stabilizers: a diagonalizable group `D` acting on `X` has only finitely many distinct stabilizers". The route also uses the Zariski density of prime-to-`p` torsion. Its *Needs:* line (7563–7564) cites only "ReductiveGroups Layer 4 (tori and diagonalizable groups)". At this head, ReductiveGroups Layer 4 (its README, lines 2278–2433) treats the Jordan decomposition, diagonalizable groups and tori as group schemes and says nothing about actions or stabilizers. A search of every roadmap on main and at every open head finds this statement in only two places. One is this route. The other is FiniteReductiveGroups 3.4 (d) (line 1005 on main, line 1234 here), which proves it by Noetherian induction, generic flatness and SGA 3, Exp. IX–X. FiniteReductiveGroups is a consumer of §7.6 and cannot supply it. On main the route sat beside that clause (d); moving the route here kept the route and dropped the lemma.

The smallest repair is to state the lemma in §7.6, as a clause of lefschetzGroupActions or as a statement of its own. Its hypotheses would be a diagonalizable group `D` over `k` acting on a quasi-projective `X`, and its conclusion that the stabilizers `Stab_D(x)`, `x ∈ X(k)`, are finitely many. Give it the route that FiniteReductiveGroups 3.4 (d) has, with ReductiveGroups Layer 4 for diagonalizable groups; FiniteReductiveGroups 3.4 (d) can then cite it. The density statement needs one clause: over an algebraic closure of `𝔽_p`, every point of a torus has finite order prime to `p`.

## R02 (P2) — The pull request makes ReductiveGroups and this roadmap suppliers of each other

Each roadmap must have a single direction of supply. After this change neither of the two can come first, and a reader cannot tell which roadmap is upstream.

This roadmap consumes ReductiveGroups Layer 4 in §7.4 (lines 7262 and 7325, already on main) and now also in §7.6 (lines 7563–7564). The change adds "ReductiveGroups Layer 9F (Deligne–Lusztig induction) uses the Lefschetz numbers of finite-order automorphisms of §7.6" to Downstream consumers (line 7746). The ReductiveGroups README at this head confirms the reverse edge: its supplier contracts (lines 1267–1279) and the *Needs:* lines of Layer 9F (for example lines 6329, 6349, 6378 and 6414) cite this roadmap's §7.6. On main, ReductiveGroups cites this roadmap nowhere.

There is also a longer loop. §7.6 rests on InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3, and InverseGaloisAndArithmeticFundamentalGroups consumes ReductiveGroups Layers 0, 3 and 6 (its README line 1134; the ReductiveGroups README line 7502). So the chain runs ReductiveGroups, then InverseGaloisAndArithmeticFundamentalGroups, then this roadmap, then back to ReductiveGroups. The mechanical dependency check reports no problem only because it treats roadmaps on main as never upward, so it does not see this loop.

This side cannot break the loop alone. Moving §7.6 into ReductiveGroups or into EtaleCohomologyFoundations would make its use of §IG.0.T3 an upward citation there, because InverseGaloisAndArithmeticFundamentalGroups consumes both. The consumer has to move instead. Layer 9F is new in this pull request, and it (or at least its uses of §7.6) would belong in a roadmap after this one. That could be a later Part of ReductiveGroups, or FiniteReductiveGroups, which consumed these results on main. The sentence on line 7746 then names that roadmap.

## C01 — §7.6 states two results more narrowly than the sources it cites

First, the standing setting is quasi-projective schemes over an algebraic closure of a finite field. Yet the section itself says (lines 7397–7400) that Deligne and Lusztig state the integrality, the Jordan formula and the vanishing for free actions for separated schemes of finite type over any algebraically closed field of characteristic `p`. The reduction to the quasi-projective case over `𝔽̄_p` is short. Additivity over a stratification into group-stable affine pieces and spreading out to a finite field, as in the proof of Illusie–Zheng Theorem 3.2 (Illusie-Zheng-2013 lines 802–807), give the general statement.

Second, lefschetzGroupActions (a) is stated for a connected *linear* algebraic group. Deligne–Lusztig Proposition 6.4, as Serre summarises it (Serre-1977 line 163), covers every connected algebraic group, and the route on lines 7533–7539 never uses linearity. At this head, FiniteReductiveGroups 3.4 proves the non-linear case itself, so the general form sits in the later, special-purpose roadmap.

The repair would state (a) for every connected algebraic group, with the route unchanged. Optionally, the integrality, Jordan and free-action statements could be given in Deligne and Lusztig's generality; otherwise the text can keep the restriction, which it already declares.

## C02 — The torus fixed-point formula has no locator

lefschetzGroupActions (b) cites only "the formula is used in [Deligne-Lusztig-1976]" (lines 7560–7561), with no theorem, section or page, and Dudas–Michel §13 (Propositions 13.1–13.10) does not contain it. A reader cannot find the published statement. Give its theorem and page in a source, or say that (b) is this roadmap's own formulation, proved by the route given. (I could not open Deligne–Lusztig 1976 to supply the number.)

## C03 — The description does not name the supplier relation that §7.6 creates

The paragraph beginning "The additions create new supplier relations between general roadmaps" lists the new edges among general roadmaps. It omits the one behind R02: ReductiveGroups Layer 9F now cites EtaleDualityAndPerverseSheaves §7.6. One sentence would do, for example: "ReductiveGroups Layer 9F cites EtaleDualityAndPerverseSheaves §7.6 for the Lefschetz numbers of finite-order automorphisms, which FiniteReductiveGroups Layer 3 stated on main."

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| lefschetzIntegrality, `Lef = −R_g(∞)` | `𝔾_m`, `g = 1` | `R_1 = q′t/(1−q′t) − t/(1−t)`, `R_1(∞) = −1+1 = 0`; `Lef = −1+1 = 0` | holds | none |
| lefschetzIntegrality | `𝔾_m`, `g = x⁻¹`, all `p` | `#X^{gF^m} = q^m+1`; `R → −1−1 = −2`; `Lef = −(−1)+1 = 2`; one fixed point when `p = 2` | holds; Check true | none |
| `Lef(g) = Lef(g⁻¹)` | 3-cycle on 3 points; `x ↦ ζ₃x` on `𝔾_m` | traces on `ℚ̄_ℓ[C₃]`: 0 and 0; torus element acts trivially, both 0 | holds | none |
| lefschetzDevissage (a) | `ℙ¹ = 𝔸¹ ⊔ {∞}`, `g = 1`; 3-cycle on 3 points | `2 = 1+1`; `|X^g| = 0 =` permutation trace | holds | none |
| lefschetzDevissage (b) | `𝔾_m²`, (inversion, inversion) | `2·2 = 4`; direct `H²_c, H³_c, H⁴_c`: `1 + 2 + 1 = 4` | holds | none |
| lefschetzDevissage (c) | `μ₂` on `𝔾_m` by `−1`; `ℤ/2` by inversion | `½(0+0) = 0 = Lef(1,𝔾_m)`; `½(0+2) = 1 = Lef(1,𝔸¹)` | holds; Check true | none |
| lefschetzDevissage (d) | `μ_n` free on `𝔾_m`; `ℤ/p` on `𝔸¹`; `γ = 1` on `ℤ/2 × 𝔸¹` | `0` for `γ ≠ 1`; `1` (order `p`, excluded); `2` (order `p⁰`, excluded) | holds; order condition needed | none |
| lefschetzJordanFormula | inversion on `𝔾_m`, `p ≠ 2`; translation on `𝔸¹` | `2 = Lef(1,{±1}) = 2`; `Lef = 1` vs `Lef(1,(𝔸¹)^g) = 0` | holds; negative Check true | none |
| lefschetzGroupActions (a) | `𝔾_m` scaling `ℙ¹`, `t` of finite order | trivial on `H⁰, H²`: `Lef(t) = 2 = #{0,∞}` | holds (linear only: C01) | C01 |
| lefschetzGroupActions (b) | `𝔾_m` on `ℙ¹`; `𝔾_m` on `𝔸²` weights `(1,1)` with coordinate swap | `2 = 2`; `Lef(swap,𝔸²) = 1 = Lef(swap,{0})` | holds; route has gap | R01, C02 |
| lefschetzGroupActions (c) | `𝔸¹ × 𝔾_m → 𝔾_m`, `(id, inv)` over `inv`; `d = 0` | `2 = 2`; `f` an isomorphism | holds | none |
| Stabilizer finiteness (R01) | `𝔾_m` on `𝔸²` weights `(1,2)` | stabilizers `𝔾_m, μ₂, 1`: three, true; ReductiveGroups Layer 4 lines 2278–2433: no statement | true, unowned | R01 |
| Supply direction (R02) | edges at head and on main | this roadmap → ReductiveGroups L4 (7262, 7325, 7564); ReductiveGroups L9F → §7.6 (6329…6566); main: 0 reverse edges | loop | R02 |
| Layer 7 Examples addition | `𝔾_m`, `𝔸¹`, `ℙ¹` values | `0`, `2`, `1`, `2 = 2`, as in §7.6 | holds | none |
| Headline `uniformizerQuotient_selfInjective` (unchanged) | `O = ℤ₂`, `π = 2`, `m = 2` | `Hom(ℤ/2, ℤ/4) ≅ ℤ/2`, generator `1 ↦ 2` | holds | none |
| Headline `form_similitude_det_alt` (unchanged) | `F = ℚ`, standard symplectic `ℚ²`, `φ = diag(c,1)` | multiplier `c`; `det φ = c = c^{2/2}` | holds | none |

- Source locators checked against the text: 13. These are Dudas-Michel-2015 Propositions 13.1 (iii), 13.3, 13.5–13.10 and Corollaries 13.2 and 13.4 (lines 2569–2692); Serre-1977 Proposition 2 and its Corollaire 1 (lines 144–155); and Illusie-Zheng-2013 Theorem 3.2 (b), (c) (lines 796–822). The 5 Deligne–Lusztig locators are not verifiable.
- Cross-roadmap citations resolved at this head: 20. They are EtaleCohomologyFoundations §§0.8, 0.11, F.0.2, F.0.4, F.2.4, F.2.5, F.2.5a, F.2.7, F.3, F.4.4–F.4.6, F.10.1, F.10.2b, F.10.3, F.10.4a; §IG.0.T3; SchemeAndStackFoundations §1.24; ReductiveGroups Layers 4 and 9F. §§F.2.5a and F.10.4a are new in this pull request; the rest are on main.
- Library declarations opened at the pin: 1, Mathlib `AlgebraicGeometry.Scheme.EllAdicCohomology` (`Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:76`). It is pro-étale and has no compact supports, so §7.6 is not statable at the pins and is not a headline.
- Record audit: the 9 layers at the merge base are kept with the same ids and titles; each of the 6 deleted lines is replaced by an extended version of itself; no item is removed.
- Seeded sample: none of the 15 sampled targets lies in the changed or affected text.
- Dependency check: `depcheck: 132 roadmaps, 1477 edges, 0 problem(s)`. It does not examine edges between roadmaps on main (R02).
- Automatic checks: all passed. Elaboration of `Suggested.lean` (unchanged since the merge base) gives 7 `sorry` warnings and no errors.
- Overlap check: I read LefschetzPencilsAndVanishingCycles, EtaleCohomologyFoundations, ClassicalAdicEtaleCohomology, SheafTheoreticSmithTheory, GlobalShtukasAndFunctionFieldLanglands and DeligneWeightsAndPurity; none states Lefschetz numbers of finite-order automorphisms. The only other statement of §7.6's results is FiniteReductiveGroups Layer 3, which cites §7.6 at this head, so this roadmap is the owner, except for 3.4 (a) for non-linear groups and 3.4 (d), which the family keeps (C01, R01). Ownership against open pull requests was checked across all 456 open heads.

Source independence: changed passages only; 10 passages compared with 3 sources (Dudas-Michel-2015, Serre-1977, Illusie-Zheng-2013). The longest shared run is 4 words of forced terminology. The largest share of the changed passages' locators is Dudas-Michel-2015, 10 of 18. No layer was added, removed or reordered, so the contents were not compared.

Research link: §7.6 states the Lefschetz-number calculus of Deligne–Lusztig 1976 §3 (Serre 1977; Dudas–Michel 2015 §13), on which Deligne–Lusztig induction in ReductiveGroups Layer 9F rests. The roadmap's headlines (the decomposition theorem, and the Fujiwara–Varshavsky formula with local terms, from Varshavsky 2023 and Hansen–Kaletha–Weinstein 2022) serve geometric Satake and local Langlands. This rests on the README and Serre-1977.

## Not verifiable

- Deligne-Lusztig-1976, Proposition 3.3, Theorem 3.2, §3 and Proposition 6.4, together with the claim on lines 7397–7399 about their generality. The paper is only on JSTOR, and Lusztig's publication page lists it without a file. I checked these only against Serre-1977 lines 119, 144 and 163 and Illusie-Zheng-2013 line 802.
- Illusie-Zheng-2013: I read arXiv v3; whether its numbering matches the published version was not checked.

## Source issues

- **Misprint** in Dudas-Michel-2015 at Proposition 13.3 (i), p. 59: the long exact sequence runs from the closed piece to the whole space to the open piece; it should run from the open piece to the whole space to the closed piece; affects nothing.

## For the human reviewers

- Deligne-Lusztig-1976 (Ann. of Math. 103) has no legal open copy (it is on JSTOR; Lusztig's page has no file). Its locators in §7.6 (lines 7431, 7481, 7510, 7560) were checked only through Serre-1977 and Illusie-Zheng-2013.
