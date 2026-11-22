# Review of PadicExtensionFamilies (pull request #2944 at e17c8f8)

**Verdict:** accepted

**Summary.** Accepted: both findings of the previous review are repaired, and the repaired statements were recomputed and hold. The fibres of `filtOrd` are now claimed open only for `I ≠ ∅` (4.3(b)), and the records are claimed to form a jump set only for paths with strictly increasing positions, the remaining measure-zero paths going to the empty jump set (4.3(c)). The three small corrections and two format notes are also repaired; this round has no finding, no small correction and no format note. One fact is left for the human reviewers: the description still calls the text a draft the author has not read through.

## Previous findings

- R01 — repaired: "each fibre `filtOrd⁻¹(I,β)` with `I≠∅` is open in `pM` (Pagano, p.8); the fibre over `∅` is `{0}`, which is not" (pagano line 302).
- R02 — repaired: "the records of every path with strictly increasing positions give an extended `ρ`-jump set … The other paths form a set of measure zero and are sent to the empty jump set (p.47)" (pagano lines 2093–2099).
- C01 — repaired: 4.3(f) cites "Pagano, p.54"; 4.3(g) cites "Corollary 5.7, p.38, with Corollary 3.41, p.30; §9.2, p.55"; the opening cites "pagano lines 313 and 2267". The description now says "(p.54)".
- C02 — repaired: the overview says "§4.3 and Layers 5 and 6 rest on" the mass formula; the build-order paragraph and the diagram name the mass formula and the trajectory measure for 4.3.
- C03 — repaired: the description says "#2942 changes the same References entry; whichever merges second is rebased and keeps this pull request's entry".
- N01 — repaired: one sentence after the opening of §4.3 says which name `Suggested.lean` declares and that the other eight are proposed names.
- N02 — repaired: the Eisenstein polynomial of 4.3(h) is `g` (`g̃`, `g_m`, `F_g`, `σ_j(g)`); no `f` for a polynomial remains in the section.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 4.3(b) fibres open for `I≠∅` | `p=2,e=2,f=1`: the three admissible sets; `I=∅` | fibres cut out by `v_2(x_i)=a` or `≥a`, open; fibre over `∅` is `{0}`, closed point | holds as now stated | none |
| 4.3(c) records of an increasing path form a jump set | general increasing path; `p=e=2` paths `(2,1),(3,0)`; `(2,1),(4,0)` second kind | records `k<k'`: `ℓ` falls, `s_{k'}>ρ^{ℓ_k−ℓ_{k'}}(s_k)>s_k`, `ρ^β(s)=ρ(x)` rises; at most one second-kind record, none of first kind after it; `({1,3},2,1)`: `4<5`; `({1,4},2,1)`: `4<6` | holds | none |
| 4.3(c) non-increasing paths have measure zero | kernel support | transitions only to `y>x`; previous counterexample `(2,1),(1,0)` now excluded | holds | none |
| 4.3(c) `μ*` total on path space, check `ℚ_2`, `n=2` | game from `(2,1)` | `3` first kind: `1/2`; `4` second kind: `1/2·1/2`; neither: `1/4`; sum `1` | agrees with masses `1/2,1/4,1/4` | none |
| 4.3 conventions used by the repair | `T` for `ρ_{e,p}` | non-image of `ρ` is `{i<e*, p∤i}`, so `ρ^{−v_ρ(x)}(x)∈T`; `#T=e` | agrees | none |

The rows for the untouched statements stand as in the previous review, of `3f4c3d2`. The diff changes no Lean statement.

- Source locators checked against the text: 7, all in pagano (line 302, p.8; lines 2093–2099, p.47; line 313, Theorem 1.7; line 2267, Theorem 9.1, p.51; lines 2393–2398, p.54; line 1301, Corollary 3.41, p.30; lines 2451–2454, §9.2, p.55).
- Seeded sample: none of its fifteen targets lies in a changed passage; §4.2, which the changed text cites, was read for the definition of an extended jump set (README line 1085) and the repair checked against it.
- Library declarations: none added or changed by the diff; `ProbabilityTheory.Kernel.trajMeasure` stands as opened in the previous review.
- Cross-roadmap citations: none added; none found unresolved (the 20 unresolved code-font names are LMFDB knowl identifiers).
- Dependency check: `depcheck: 168 roadmaps, 1959 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks on this head: all passed. `Suggested.lean` is unchanged since `3f4c3d2` and elaborates with 19 warnings, all `sorry`; no `set_option`, no sorry'd data.
- Revision audit: the diff adds, removes and reorders no layer or item; no change outside the folder against the merge base.
- Pull request text read against the head: title and description agree with it (§4.3 added to a roadmap on main, one Lean statement added, locators as in the README).

Overlap check: read MassFormula (main and its open revision), EtaleMassFormula, LocalFieldsRamification; nothing shared. The other open pull request on this roadmap, #2942, conflicts in the References entry; the description states the order (the second to merge is rebased and keeps this entry).

Source independence: changed passages only: 5 passages compared with 1 source (pagano), none shared; largest share pagano, about 23 of 60 page or knowl locators, as in the previous review; contents not compared again (the diff adds, removes and reorders no layer).

Research link: §4.3 states the mass formula of C. Pagano, *Jump sets in local fields* (2018; J. Algebra 2022), refining Serre (1978); Layers 5–6 state Krasner (1966) and Monge (2011, 2014); Layers 3 and 7 follow Jones–Roberts (2006, 2007). Rests on the README's references and the texts read.

## Not verifiable

- Deligne's Appendix A.6, Serre's *Local Fields*, Krasner 1966, Ore 1928, Fried 1974, Serre 1978: not obtained from a legal source; no changed passage cites them except through the pinned library.
- Pagano's published version (J. Algebra) is paywalled; the README cites the arXiv v1 numbering, which is what was read.

## Source issues

- **Misprint** in pagano at §9.2, p.55: the source says the units are guaranteed by "Proposition 5.7"; it should be Corollary 5.7; affects nothing.
- **Misprint** in pagano at §9.1.2, p.54: the source says the Galois extension is `F/K` and then conditions on a subfield of `F/E`; it should be `F/E` throughout; affects nothing.

## For the human reviewers

- The description ends "Draft until I have read it through", and its AI-assistance note says a model drafted §4.3, the Lean signature and the `ℚ_2` check: the author had not yet read the text through at this head.
