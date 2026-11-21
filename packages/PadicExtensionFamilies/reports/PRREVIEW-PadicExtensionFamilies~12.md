# Review of PadicExtensionFamilies (pull request #2944 at 3f4c3d2)

**Verdict:** needs changes

**Summary.** Needs changes: two targets of the new §4.3 are false as written, each because a hypothesis of Pagano's statement was dropped. The fibre of `filtOrd` over the empty jump set is the single point `0`, which is not open (4.3(b)), and the records of a path whose positions do not increase need not form a jump set (4.3(c)). Both are one-clause repairs; the main theorem, the `ℚ_2` check and the new Lean statement were recomputed and hold. There are three small corrections and two format notes, none blocking, and one fact for the human reviewers.

## R01 (P2) — The fibre of `filtOrd` over the empty jump set is `{0}`, so "each fibre is open in `pM`" is false

An implementer asked to prove the first bullet of 4.3(b) (`TauCetiRoadmap/PadicExtensionFamilies/README.md`, line 1173: "each fibre `filtOrd⁻¹(I,β)` is open in `pM`") cannot: it fails for `I = ∅`.

The empty set is an extended jump set under §4.2's definition (both conditions are vacuous), its vector `v_(∅)` has every coordinate zero, and a nonzero `v` has a nonempty set of pairs `(i, v_p(v_i))`, hence a nonempty set of minimal pairs. So `filtOrd⁻¹(∅) = {0}`, a closed point with empty interior in `pM ≅ ℤ_p^{ef+1}`. For `p = 2`, `e = 2`, `f = 1` every other fibre is cut out by conditions `v_2(x_i) = a` or `v_2(x_i) ≥ a` and is open; only this one is not. Pagano states openness for `I ≠ ∅` only (pagano line 302, p.8).

Smallest change: "each fibre `filtOrd⁻¹(I,β)` with `I ≠ ∅` is open in `pM`". Nothing downstream changes: admissible jump sets have `I ≠ ∅`, so `Adm` and `μ_Haar` are untouched. The fibre `{0}` would be a natural negative-control Check.

## R02 (P2) — "The records of every path give an extended `ρ`-jump set" fails for paths whose positions do not increase

In 4.3(c) (line 1198) the path space is all sequences in `S*`, which is what `ProbabilityTheory.Kernel.trajMeasure` produces, and `μ*` is a push-forward along a map defined on that whole space. The statement as written is false there, so the map to jump sets is not defined on every path.

Take `p = 2`, `e = 2` (`ρ(1) = 2`, `T = {1,3}`), and a path beginning `(2,1), (1,0)`. Both are states of the first kind (`v_ρ(2) = 1`, `v_ρ(1) = 0`). Index `0` is a record with shooting point `ρ^{−1}(2) = 1` and `β = 2`; index `1` is a record (`0 < 1`) with shooting point `ρ^{0}(1) = 1` and `β = 1`. The point `1` receives two values, so the records do not define a pair `(I,β)` at all. Pagano's Proposition 7.1 is for games, where the rabbit moves forward, and his formal map sets `I = ∅` on the measure-zero set of paths with non-increasing positions (pagano lines 2093–2099, p.47).

Smallest change: "Prove that the records of every path with strictly increasing positions give an extended `ρ`-jump set (Proposition 7.1, p.46); the other paths have measure zero and are sent to the empty jump set." With that the definition of `μ*` is total.

## C01 — Three locators of §4.3 point beside the passage they are cited for

In 4.3(f), line 1226, the conditioning statement is cited as "(Pagano, p.53, footnote)". It is in the main text of p.54 (pagano lines 2393–2398); the footnote on that page only fixes the notation for a conditional measure. The pull-request description repeats "the footnote on p.53".

In 4.3(g), line 1240, the units `u_1, u_2` with `u_1^p u_2 = ζ_{p^j}` are cited to "Corollary 5.7, p.38". That corollary states only the jump set `({1, p^{j+1}}, j+1, j)` of `K_j^{(i)}`; the units are obtained from it together with Corollary 3.41, in §9.2, p.55 (pagano lines 2451–2454). Cite "Corollary 5.7, p.38, with Corollary 3.41, p.30; §9.2, p.55".

In the opening of 4.3, "pagano line 219 onward" is the line of Theorem 1.4 (the locator of §4.2). Theorem 1.7 is at pagano line 313 and Theorem 9.1 at line 2267.

## C02 — The build-order commentary still describes Layer 4 without §4.3

A reader planning the build from the overview is told that Layer 4 does not need the mass formula. Line 46 says "Layers 5 and 6 rest on Tau Ceti's formalization of Serre's mass formula"; the paragraph under *Downstream consumers* (line 2140) says "Layer 4 needs Layers 1–2 (4.1) and only Local fields and ramification Layer 1 (4.2)"; and the diagram above it draws Tau Ceti's mass formula into Layer 5 only. The Dependencies paragraph of Layer 4 is already right. Add to the first "and §4.3", and to the second "and §4.2, Tau Ceti's mass formula and Mathlib's Ionescu-Tulcea trajectory measure (4.3)"; the diagram would take one more arrow.

## C03 — The description says this pull request and #2942 "merge cleanly in either order"; their heads conflict

The description's sentence "The References entry carries the corrected J. Algebra citation, an identical edit to #2942, so the two merge cleanly in either order" is not what the heads show. #2942 changes only the last line of the Pagano entry; this pull request rewrites the whole entry (it adds the §4.3 locators), so the two changes overlap with different text and the merge conflicts in `README.md`. The correct text: "#2942 changes the same References entry; whichever merges second is rebased and keeps this pull request's entry." The citation itself, J. Algebra 593 (2022), 398–476, is right.

## N01 — Eight names in code font in §4.3 are declared nowhere

`jumpSet_mass_eq_haar`, `jumpSet_admissible`, `card_rootsOfUnity_pPow`, `top_mem_jumpSet_iff`, `haar_eq_shootingGame`, `wildExponent_tower`, `mem_jumpSet_top_iff` and `jumpSet_realizable` are not in `Suggested.lean` (correctly: the jump-set statements are not statable). A reader cannot tell them from `measure_eisensteinSet_setOf_exists_rootCount_pos`, which is declared. Say once that they are proposed names, or write them in prose.

## N02 — In 4.3(h) the letter `f` is both the residue degree and the Eisenstein polynomial

`f∈Eis(e_j,K_{j+1})`, `F_f`, `f̃`, `f_m` stand beside `q=p^f` of the section's opening. Another letter for the polynomial would remove the clash.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.2 ramification polygon | `x⁴−2` over `ℚ_2` | `ρ=(x+1)⁴−1`; heights `8,4,8,0`; slopes `−4,−2,−2`; rams `(2,4)` | agrees; Greve–Pauli Lemma 4.1, Prop. 4.3 at p.5 | none |
| 2.6 dictionary | `ℚ_2(ζ_8)`, Swan `[1,2]` | `m=(1/2,5/4)`, `r=(1,3)`, `s_2=2·5/4−1/2=2`; knowl's four identities match | agrees | none |
| 2.7 top slope | wild, tame, unramified, `K/K` | `4`; `1`; `0`; `0`; knowl's three cases identical | agrees | none |
| 3.3 Galois mean slope | `[2,3,4]`; `[5/2]_2` over `ℚ_3` | `7/8+1/8+1/2+3/2=3=24/8`; `5/6+1=11/6`, `c=10+1=11` | agrees; equals Jones–Roberts (2.5) | none |
| 3.6 label prefix | `ℚ_2(∜2)`; `(f,e)=(3,2)` | `11=3+4·2`, bound `3+8=11`; `c=7` not divisible by `3` | agrees | none |
| 4.1 indices of inseparability | `x⁴−2` | auxiliary `∞,∞,0`; `i=(8,4,0)`; `i_0=11−3`; rams `(2,4)` | agrees; heiermann lines 423, 449, 460, 1261 | none |
| 4.3 main theorem, check `ℚ_2`, `n=2` | fields, Haar, game | masses `1/4,1/4,4·1/8`; Haar `1/4,1/4,1/2`; game `1/2` at 3, `1/2·1/2` at 4 | three sides agree | none |
| 4.3 conventions | `e=(p−1)n` | `#T=e*−e*/p=e`; `ρ(n)=pn=e*`; rank `(f−1)e+e+1=ef+1` | agrees | none |
| 4.3(b) fibres open | `I=∅` | fibre `{0}`, not open | false at `I=∅` | R01 |
| 4.3(c) kernel sums to 1 | walk with two coins | first kind `(q−1)q^{−(y−x)}p^{−N}`; second `(p−1)q^{−(y−x−1)}p^{−N}`; stops a.s. | agrees with source p.47–48 | none |
| 4.3(c) records give a jump set | path `(2,1),(1,0)`, `p=e=2` | point `1` gets `β=2` and `β=1` | false off increasing paths | R02 |
| 4.3(e) `measure_eisensteinSet_setOf_exists_rootCount_pos` | `S=∅`; `S=σ_K(n)`; `n=1`; one class | `0=0`; `μ(E)·n/n`; `μ(E)·1`; `(1/n)(n/#Aut)·#Aut·q^{−c}` roots | holds; all binders present | none |
| 4.3(f) tower | `d(L/K)=d(L/F)+(d/m)d(F/K)` | `c(L/K)=c(L/F)+(d/m)(d(F/K)−m+1)`; mass factor `(1/d)/(m/d)=1/m` | agrees | none |
| 4.3(g) `mem_jumpSet_top_iff` | `K=ℚ_2`, `j=1` | `K_1^{(1)}=ℚ_2(√3)`; `ℚ_2(√3,i)∋√−3` unramified; jump set `({1,4},2,1)` | agrees with Prop. 5.6 | none |
| 4.3 check `p∤n` | admissibility equation | `p^b i=pn`, `p∤n` forces `b=1`, `i=n` | unique jump set | none |
| 5.2 discriminant box | `ℚ_2`, `n=2`, `j=1,2`; `𝔽_2((t))` | `1/16`, `1/16`; `t_h>j` off `h=b`; `v(a_1)=m` | agrees | none |
| 5.3 Krasner's count | `ℚ_2` `n=2,4`; `ℚ_3` `n=3` | `2,4`; `4,8,16,16,16,32` (sum 92, mass 4); `6,6,9` | agrees; Pauli–Roblot Thm 6.1 | none |
| 6.2 compatibility | rams `(2,2)`, `(7/3,7/3)` over `ℚ_2` | `v(ρ_2)≤4` forces `r≤2`; `(2,2)` gives vertex `(2,2)`, rams `(1,4)` | excluded, as stated | none |
| 6.5 masses | `[1]`, `[2]` over `ℚ_2` | `1`, `2`; `1/2+2/4=1`; knowl: mass `= f·`absolute | agrees; Monge Lemma 3 p.6, Thm 1 p.11 | none |
| 6.6 packets | knowl's four conditions | group, `f`, `e`, hidden slopes | same four | none |
| 6.7 Monge's count | `ℚ_2`, `(e,f)=(2,1)` | summands `3,1,2` (`Σ_2(2,1)=3`, `Δ_2(1,1,1)=2`); total `6` | agrees; monge-count line 208 | none |
| 7.2 local mean slopes | `ℚ(√5)`, `ℚ(∜2)` | `1/2` at 5, `0` at 2; `24/8=3` | agrees | none |
| 7.3 product formula | `ℚ(∜2)`; `ℚ` | `2³=8<2⁴`; empty product `1` | agrees; Jones–Roberts (2.2) | none |
| `discriminantExponent_eq_integral`, `…_sum_artinSlopeList` | `ℚ_2(∜2)` | `3·3+2·1=11`; `3+4(2/4+3/2)=11` | hold | none |
| `one_add_card_filter_newtonSlopes_eq_relIndex` | `t=3,5,8` | `1+3=4/1`; `1+1=2/1`; `1=1/1` | holds | none |
| `den_dvd_ordCompl_count_newtonSlopes` | `x⁴+2x+2` | count `3`, `ordCompl[2] 3=3`, `3∣3` | holds | none |
| `residualPolynomial_additive` | `x⁴−2`, face `[2,4]` | `A=z²+1`; `x²A(x)` exponents `2,4` | holds | none |
| `miki_decomposition_exists_unique_levels` | `ℚ_2(√2)`, `a=−1` | `(3+2√2)(−3+2√2)=−1`; levels `1,3`; weighted `2<3` | holds | none |
| `conjugateBreaks_*`, `slopePolygon_*` | `ℚ_2(∜2)`; `ℚ_5(∛5)` | `{2,2,4}`; zero count `2=3−5⁰`; height `7` at `3` | hold | none |
| `ore_realizability`, `mass_completeness`, `monge_class_count` | `ℚ_2`, `n=2` | `j∈{1,2}`; `2/4+4/8=1`; `6` | hold | none |
| `galoisMeanSlopeAt_eq_zero_iff`, `rootDiscr_le_…` | `ℚ(∜2)` | `0` at odd `p`; `2^{11/4}<8` | hold | none |

- Source locators checked against the text: 47 (Pagano 21, Heiermann 4, Monge 6 over two papers, Greve–Pauli 4, Pauli–Roblot 2, Jones–Roberts 2, and 8 knowls).
- Library declarations opened at the pin: `ae_tsum_rootCount_eq` (`MassFormula/RootCount.lean:136`), `IntermediateField.lintegral_rootCount` (`MassFormula/Integral.lean:232`), `measure_eisensteinSet` (`Eisenstein/Region.lean:214`), `ncard_isomorphic_mul_natCard_algEquiv` (`MassFormula/Orbit.lean:65`), `tsum_one_div_natCard_residueField_pow_wildExponent` (`MassFormula/Main.lean:72`), `IntermediateField.rootCount` (`FieldTheory/IntermediateField/RootCount.lean:67`), `integerBox` (`MeasureTheory/Group/LocalFieldScaling.lean:87`), `differentExponent_tower` (`Different/Tower.lean:46`), `teichmullerLift` (`Teichmuller.lean:68`), `absoluteRamificationIndex` (`AbsoluteRamificationIndex.lean:111`), `ProbabilityTheory.Kernel.trajMeasure` (`Mathlib/Probability/Kernel/IonescuTulcea/Traj.lean:763`).
- Cross-roadmap citations: none found unresolved; the 20 unresolved code-font names are LMFDB knowl identifiers, not Lean names.
- Dependency check: `depcheck: 171 roadmaps, 1989 edges, 0 problem(s)`.
- Automatic checks on this head: all passed. `Suggested.lean` elaborates with 19 warnings, all `sorry`; no `set_option`, no sorry'd data.
- One-tactic probe (`rfl`, `simp`, `infer_instance`) on a copy: none of the 19 theorems closes.
- `#check` of the new theorem: its elaborated type carries `hn`, `hS`, `hiso`, the measurable and Borel instances, `IsAddHaarMeasure` and the normalization; the seven older definitions that drop section binders are the total definitions the Conventions describe, unchanged from the base.
- Revision audit: the base README has 8 layers; the head keeps all, removes no item and adds §4.3. No change outside the folder.

Overlap check: read MassFormula (main and its open revision), EtaleMassFormula, LocalFieldsRamification; nothing shared. MassFormula owns `σ_K(n)`, the wild exponent and Serre's formulas and names this roadmap for refinements; jump sets and Pagano's theorem occur in no other roadmap, open or on main.

Source independence: 12 passages compared with 6 sources (pagano, heiermann, greve-pauli, monge-count, monge-eisenstein, LMFDB knowls), none shared beyond formulas and forced lists; largest share pagano, about 23 of 60 page or knowl locators; contents compared with pagano §§1–12: independent (items (a)–(i) of 4.3 draw on §§3, 5, 7, 8, 9 and on Serre, not in the source's order).

Research link: §4.3 states the mass formula of C. Pagano, *Jump sets in local fields* (2018; J. Algebra 2022), refining Serre (1978); Layers 5–6 state Krasner (1966) and Monge (2011, 2014); Layers 3 and 7 follow Jones–Roberts (2006, 2007). Rests on the README's references and the texts read.

## Not verifiable

- Deligne's Appendix A.6, Serre's *Local Fields*, Krasner 1966, Ore 1928, Fried 1974, Serre 1978: not obtained from a legal source; none is cited by a sampled target except through the pinned library.
- Miki 1981 (§4.2) is outside the sample and was not re-read.
- Knowl `lf.means`: the page returned a browser check instead of the text.
- Pagano's published version (J. Algebra) is paywalled; the README cites the arXiv v1 numbering, which is what was read. Jones–Roberts 2007 and Greve–Pauli were read from the authors' own copies; published page numbers were not compared.

## Source issues

- **Misprint** in pagano at §9.2, p.55: the source says the units are guaranteed by "Proposition 5.7"; it should be Corollary 5.7; affects nothing.
- **Misprint** in pagano at §9.3, proof of (P.1) for `σ_{j_1,j_2}`, p.56: the source says the top element has `β = j_1` by Proposition 5.6; it should be `j_1 + 1`, as (P.1) itself states on p.53; affects nothing.
- **Misprint** in pagano at §9.1.2, p.54: the source says the Galois extension is `F/K` and then conditions on a subfield of `F/E`; it should be `F/E` throughout; affects nothing.

## For the human reviewers

- The description ends "Draft until I have read it through", and its AI-assistance note says a model drafted §4.3, the Lean signature and the `ℚ_2` check: the author had not yet read the text through at this head.
