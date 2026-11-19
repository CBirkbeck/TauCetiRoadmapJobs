# Review of AmenableGroups (pull request #2542 at 2183ddc)

**Verdict:** accepted

**Summary.** Accepted, with no findings. The head is the one the previous review read, so I recomputed every Check, convention and headline from scratch and reread every cited locator in Garrido, Bekka–de la Harpe–Valette, Ceccherini-Silberstein–Grigorchuk–de la Harpe and Fremlin; all hold, and the one open headline in `Suggested.lean` elaborates with the hypotheses of its README statement and is not provable from the pinned library in one step. There are two small corrections, both in Layer 7 and both still open from the previous review (a sentence that calls the `L∞` smoothing a Bochner integral of translates, and a *Needs:* line that omits the interchange of integrals its route uses), and three format notes; none blocks. Three facts are left for the human reviewers, one of them that the folder's `STATUS.md` reports Layer 7 as done in the library although the pinned Tau Ceti lacks its headline.

## C01 — §7.2 calls the `L∞` smoothing of §7.4 a Bochner integral of translates, and for `L∞` inputs it is not one

A reader who takes the sentence literally will look for an `L∞`-valued integral `∫ h(y) L_y φ dμ(y)` behind §7.4, and none exists. The sentence closes the σ-compact localization paragraph of §7.2 (line 929): "The convolutions of §7.3 and §7.4 are Bochner integrals of translates and need no σ-finiteness of G."

For §7.3 this is exact. For §7.4 take `G = ℝ` and `φ = 1_[0,∞)`: `L_y φ = 1_[y,∞)` and `‖L_y φ − L_y' φ‖∞ = 1` whenever `y ≠ y'`, so `y ↦ h(y) L_y φ` is not essentially separably valued and has no Bochner integral in `L∞`. §7.4 itself defines `C_h φ(x)` as a scalar integral at each point `x`, as does the module docstring of `TauCeti/MeasureTheory/Group/Convolution/UCB.lean`, and the orbit-integral form is asserted only on `UCB(G)` (last bullet of §7.4). What the sentence is there for, that neither convolution needs σ-finiteness, is true: for §7.4 because `y ↦ y⁻¹x` preserves null sets of a regular Haar measure.

Suggested wording: "The convolution of §7.3 is an `Lᵖ`-valued Bochner integral of left translates and that of §7.4 a scalar integral at each point; neither needs σ-finiteness of `G`."

## C02 — The approximate-identity route of §7.3 rests on an identity whose proof its *Needs:* line does not cover

An implementer reading the line would take the approximate identity to be independent of the pointwise-formula target just above it, and with the listed inputs alone it is not. The route (lines 999–1004) starts from `h ⋆ k = ∫ k(z) R_(z⁻¹) h dμ(z)`. The left side is by definition `∫ h(y) L_y k dμ(y)`, so this is an equality of two different `L¹`-valued Bochner integrals. Pointwise the two are `∫ h(y) k(y⁻¹x) dy` and `∫ k(z) c(z) h(xz⁻¹) dz`, which agree by `y = xz⁻¹` and the inversion formula (I checked the weight: `R_(z⁻¹) h(x) = c(z) h(xz⁻¹)`), but passing from the vector-valued integrals to their pointwise values is the interchange that the module docstring of `TauCeti/MeasureTheory/Function/Lp/GroupConvolution.lean` (line 28) says "needs a Fubini argument and is not done here". The *Needs:* line lists only `MeasureTheory.Lp.convolutionL`, `MeasureTheory.Lp.continuous_rightTranslation_apply` and the inversion formula.

The smallest repair is to add to that line either "the pointwise formula above" or `MeasureTheory.MemLp.exists_hasCompactSupport_eLpNorm_sub_le`, the density input the route already names as an alternative: both sides are continuous and bilinear in `(h, k)`, and for continuous compactly supported `h, k` they can be compared directly.

## N01 — The module docstring of `Suggested.lean` counts seven headlines; the README summary names four

Lines 10–28 of the docstring present as headlines the content characterization (§2.4), the paradox obstruction (§3.4) and the finite-test form of Følner sets (§5.1), which the summary does not list. "The headlines and the main results behind them" would make the two lists agree.

## N02 — Several statements carry no source locator

The remaining targets of §2.5 (line 424), §7.3 (lines 978 and 990) and §7.6 (line 1093), and the library-backed §§4.6 and 7.1, cite no source in place. For §2.5, Garrido, Example 2.1 (p. 5) defines exactly `|A|/|G|`; for the reverse implication recorded in §7.1, BDHV's proof of (v) ⇒ (i) in Theorem G.3.1 is the restriction along `UCB(G) → L∞`.

## N03 — §4.3 speaks of "a section `s` of `φ`" for a `φ` that need not be surjective

The general statement of §4.3 takes `φ : G →* Q` with `ker φ ≤ range ψ` and no surjectivity, and two sentences later the mean is built "along a section `s` of `φ`" (line 625), which exists only when `φ` is onto. The library reduces to that case by corestricting `φ` to its range, an amenable subgroup of `Q` (`TauCeti.Amenable.of_ker_le_range`, `Extension.lean` lines 166–172). Adding "after replacing `Q` by the range of `φ`" would say so.

## Questions for the author

- The folder's `STATUS.md` (line 30) says "Layer 7 is done: the `L∞` characterization, … the correspondence with invariant Borel contents and its completion", while at the pinned Tau Ceti `GroupTheory/Amenable/Linfty.lean` has only the reverse implication (line 159) and the discrete case (line 234), and no content on null-measurable sets. Does a later Tau Ceti prove `amenable_iff_exists_lpTop_invariant_of_isHaarMeasure` and the completion of §7.6? If so, after the next pin bump both become citations and the Lean file states nothing. I reviewed against the pins only, so I could not check.

## Earlier findings

The previous review read this same head and raised no finding. Its two small corrections and two format notes concern text that is unchanged; I rechecked each and they stand as C01, C02, N01 and N02 above.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conv. 2 / 1.1 UCB convention | affine group, `f=arctan(b/a)`, `u=(1,β)`, `x=(a,0)`; `xu=(aα,aβ+b)` | `f(ux)−f(x)=arctan(β/a)→π/2`; `|f(xu)−f(x)|≤|β|/α+|log α|/2` | Check true; pin: `|f (u * x) - f x| < ε`, uniformity `p.2 * p.1⁻¹` |
| 1.2 translations | `δ_1` on discrete `G` | `L_gδ_1=δ_g`, `L_gL_hδ_1=δ_gh`; variant gives `δ_((hg)⁻¹)` | true; pin `f (g⁻¹ * x)` |
| 1.3 means | `ZMod 2`, `m=2f(0)−f(1)` | `m(1)=1`, `m(1_{1})=−1`, norm `3` at `(1,−1)` | Check true |
| 1.5 transport | trivial `→ ℤ` | push-forward `ev_0`; `ev_0(1_{0})=1`, `ev_0(L_1 1_{0})=0` | surjectivity needed, present |
| Layer 1 examples | indiscrete `G`; non-indiscrete `G` | UCB = constants; `G/closure{1}` Hausdorff nontrivial gives nonconstant UCB function | "exactly when indiscrete" true |
| 2.2 contents | `ℤ`, singleton mass `c` | countable: `Σc∈{0,∞}`; finite: `nc≤1⇒c=0` | Check true |
| 2.3 means and contents (sample) | `ν(A)=m(1_A)`, simple `f` | `m(Σc_i1_(A_i))=Σc_iν(A_i)`, `|m(f)|≤ν(X)‖f‖` | Garrido Defs 1.12–1.13 (lines 147, 155) match in discrete scope |
| 2.4 discrete characterization (sample) | `ZMod 3`; `F₂` | counting content invariant; none exists | Garrido Thm 1.15 (line 201); pin has `[DiscreteTopology]` in scope |
| 2.5 finite groups (sample) | `ZMod 3`, `{0,1}`; `ev_0` | `2/3`; `ev_0({1})=0≠1=ev_0({0})` | true; uniqueness holds for any group topology (pin: `[Finite G]` only) |
| 3.1 equidecomposability (sample) | `2ℤ` vs `ℤ`, displacement `≤C` | evens in `[−N,N]`: `≤N+1`; needed `2N−2C+1`; fails for `N>2C` | Check true; Garrido Def 1.1 (line 29) |
| 3.2 Schröder–Bernstein (sample) | `A≼B`, `B≼A` | finite multiplier set kept through `C_n` iteration | Garrido Thm 1.2 (line 43) states it |
| 3.3 paradoxical | `∅`; trivial group on itself | `∅=∅∪∅`, excluded by nonemptiness; one point: `A∼S∼B` disjoint impossible | pin `paradoxical_iff` has `S.Nonempty` |
| 3.5 free group | `1=a·a⁻¹`, `b=a(a⁻¹b)`; `α=Unit` | both in `aW(a⁻¹)`; `FreeGroup Unit≅ℤ` not paradoxical | true; pin has `[Nontrivial α]` |
| 4.1 subgroups | `x=kt`, `r(x)=k` | `r(k'x)=k'r(x)`; `(L_kf)∘r=L_k(f∘r)` | true, discrete only; Garrido Prop 2.2(1) |
| 4.3 extensions | `x'=xψ(k₀)` | `n(k↦f(xψ(k₀k)))=n(L_(k₀⁻¹)F)=n(F)` | fiber average constant; BDHV G.2.2(ii) line 17212 |
| 4.6 colimits (sample) | filtered diagram, non-injective maps | images of stages: directed subgroups, each a quotient | reduces to §4.2, §4.5; pin `IsFiltered J`, discrete stages |
| 4.7 f.g. and free subgroups (sample) | `F₂` discrete; `F₂` indiscrete | not amenable; UCB constants, amenable | discreteness needed, present (`FreeGroup.lean` line 37) |
| 5.1 Følner sets (sample) | `ℤ`, `F_n`, `g=1`; `F=∅`; triangle | `△={0,n+1}`, ratio `2/(n+1)`; `0<ε·0` false; `ghF△F⊆g(hF△F)∪(gF△F)` | true; Garrido Def 3.1 uses `≤ε`, equivalent |
| 5.2 Reiter and level sets | `p=δ_x`; layer cake | `Λ((δ_gx−δ_x)_g)=Σ(f_g(gx)−f_g(x))≥s`, mean `0`; `∫|gF_t△F_t|dt=‖L_gp−p‖₁` | true |
| 5.3 averages | `m_F(L_gf)−m_F(f)` | `|F|⁻¹|Σ_(g⁻¹F)f−Σ_Ff|≤‖f‖|g⁻¹F△F|/|F|` | true |
| 6.1 integers (sample) | `k=3,n=1`; `I=∅` | `{3,4}△{0,1}`: `4=2·min(3,2)≤6`; `0≤2|k|` | true; Garrido Ex 3.5 and BDHV G.5.4 use `{−n..n}` |
| 6.2, 6.3 abelian (sample) | `ℤ^r→A`; `ℚ`; `ℝ` usual topology | image of amenable; directed union; coarser than discrete | Garrido Prop 2.3 (line 259), discrete; pin: any group topology |
| 7.1 comparison (sample) | Dirac at `0`, `min(|x|,1)` | sup `1`, ess sup `0` | Check true; BDHV line 17388 for (v)⇒(i) |
| 7.2 modular character | affine, `g=(2,0)`, `S=[1,2]×[0,1]`; inversion | `μ(Sg⁻¹)=1=2μ(S)`; `μ(Sg)=1/4`; `inv_*μ=a·μ` | `c(a,b)=a`, `Δ=c⁻¹` (BDHV line 12089) |
| 7.2 Baire representatives | σ-compact `H`, non-regular Haar measure | agrees with regular one on Baire sets, hence on Borel by the sandwich | true as stated; Fremlin 443M line 1507 |
| 7.3 approximate identity | `ℝ`, `h=1_[0,1]`, `δ≤1/2` | four ramps of `δ/4`: `‖h⋆k−h‖₁=δ`; unnormalized `≤2δ` | Check true |
| 7.4 smoothing | `C_h(L_gφ)`; `C_(L_gh)φ`; `u→1` | `=C_(R_(g⁻¹)h)φ`, `∫R_(g⁻¹)h=∫h`; `=L_gC_hφ`; `≤‖L_(u⁻¹)h−h‖₁‖φ‖∞` | true |
| 7.5 characterization (sample, headline) | trivial `G`; `ℝ`; `F₂` counting; non-σ-compact `G` | `M=id`; both sides true; both false; `C_hφ` independent of representative | true; BDHV G.3.1 (i),(v) lines 17294–17310, kernel step line 17328 |
| 8.1 expansion (sample) | `S={1}∪K` | `|SF|≥|F|+|gF\F|≥(1+ε/2)|F|`; `F=∅`: `0≥0` | true |
| 8.2 Hall (sample) | index set `A⊆G×Fin k`, projection `F` | `|A|≤k|F|≤|DF|=|⋃N(a)|` | true; Mathlib name present; CGH Thm 35 line 904 in §III.1 |
| headline Følner | trivial; `F₂`, `K={a,b}` | `F={1}`: `0<ε`; none | pin `amenable_iff_exists_finset`, discrete |
| headline Tarski | `ℤ`; `F₂` | amenable, not paradoxical; reverse | pin `amenable_iff_not_paradoxical_univ`, discrete; CGH Thm 7 line 189 |
| C01 sentence | `ℝ`, `φ=1_[0,∞)` | `‖L_yφ−L_y'φ‖∞=1` | not Bochner integrable in `L∞` |
| C02 route | pointwise both sides | `∫h(y)k(y⁻¹x)dy=∫k(z)c(z)h(xz⁻¹)dz` | true; needs interchange |

- Source locators read against the text: 30. Garrido 17 (Def 1.1, Thm 1.2, Cor 1.3, Def 1.4, Prop 1.5, Thm 1.11, Defs 1.12–1.13, Thm 1.15, Ex 2.1, Props 2.2–2.3, Defs 3.1 and 3.3, Lemma 3.4, Ex 3.5, Thm 3.6); BDHV 9 (Appendix A convention line 11655, A.3, C.5, G.1.4, G.2.2, G.3.1, G.5.1, G.5.2, G.5.4); CGH 3 (Theorems 7, 25, 35); Fremlin 1 (443M).
- README backticked names: 427 dotted names extracted; all found as declarations in the pinned Mathlib or Tau Ceti sources (`Finset.card_sdiff_comm` is an alias at `Mathlib/Data/Finset/Card.lean` line 649).
- Library declarations whose statement I opened and compared with the README prose: 24, among them `mem_ucb_iff`, `UCB.leftTranslation_apply`, `paradoxical_iff`, `FreeGroup.paradoxical_univ`, `Amenable.of_ker_le_range`, `Mean.extension`, `IsLeftInvariant.eq_uniform`, `Amenable.of_compactSpace`, `Amenable.of_commGroup`, `Amenable.of_forall_finset_subset_range`, `Amenable.of_lpTop`, `exists_lpTop_invariant_iff_of_regular`, `coeFn_rightTranslation`, `rightUniformSpace`, `modularCharacterFun`, `AddContent`.
- Remaining targets searched by object and absent at the pin: naturality of `addContentEquiv`, the counting content, the triangle bound and monotonicity, eventual-equality of Følner families, Baire representatives, the pointwise convolution formula, an `L¹` approximate identity for `convolutionL`, the forward `L∞` implication, contents on null-measurable sets.
- Cross-roadmap citations resolved: RepresentationTheory/CompactGroups §0.1 (on main, line 185) and OneParameterSemigroups Part C (Completed, line 204). The nine listed consumers are on main and are the nine roadmaps on main that cite this one; the three anchors into this README used on main are layer headings and still resolve.
- Dependency check: `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`; no UPWARD or CYCLE line. The automatic checks all passed; no file outside the folder changes.
- Elaboration of `Suggested.lean`: one message, the `sorry` warning at line 48. `#check` of the theorem shows every binder of the README statement (locally compact, Hausdorff, Borel, Haar, regular); nothing changed.
- One-tactic probe: `simp`, `exact TauCeti.amenable_iff_exists_lpTop_invariant μ` (fails: no `DiscreteTopology G`) and the reverse-only term all fail, so the statement is not padding.

Overlap check: read ClassicalErgodicTheory (open), BanachSpaceTheory, AmenableTracesOnCStarAlgebras, OperatorAlgebraDynamics and FactorRigidity (main); nothing shared. Each consumes `TauCeti.Amenable`, the Følner criterion or Layer 7 by citation; AmenableTracesOnCStarAlgebras owns Connes's Følner condition for traces, a different object.

Source independence: 36 passages compared with 4 sources (the 30 locators and 6 prose passages: Convention 2, §§3.5, 4.1, 5.2, 7.5 routes, §7.7, and the `Suggested.lean` docstring), none shared beyond forced formulas and attributed definitions (the three-line free-group decomposition at Garrido line 62; the local-`L∞` definitions at BDHV line 14611); largest share Garrido, 23 of 40 locators; contents compared with Garrido §§1–4: independent (Layers 1 and 7 have no counterpart, Layers 2 and 3 reverse its §1.2 and §1.1, abelian groups follow Følner sets here and precede them there, Tarski's alternative is unproved there).

Research link: Layer 7 is (i) ⇔ (v) of Theorem G.3.1 of Bekka–de la Harpe–Valette (2008), the input to their Hulanicki–Reiter Theorem G.3.2; Layer 8 is the Tarski alternative, Theorem 7 of Ceccherini-Silberstein–Grigorchuk–de la Harpe (1999). Rests on the README References and on both texts as read.

## Not verifiable

- BDHV at the README's author-page link: the host timed out. I read the published version from the Geneva institutional open archive; its theorem numbers are the README's.
- CGH: read as the author-page preprint; its theorem numbering was not compared with the Proceedings of the Steklov Institute printing, which is not openly available.
- The Zulip threads and Mathlib pull requests in the References support no statement and were not read.

## Source issues

- **Error** in Garrido at Theorem 1.15, p. 5: the source says amenability in the sense of its Definition 1.12 is equivalent to non-paradoxicality for any group; it should assume `G` discrete, since `SO(3)` is compact yet paradoxical by its Proposition 1.5 (2); affects a stated result.
- **Misprint** in Garrido at Theorem 1.2, proof, p. 2: the source takes the second bijection from `A₁` to `B₁`; it should be from `A₁ ⊆ A` onto all of `B`; affects nothing.
- **Misprint** in Garrido at Lemma 3.4, p. 9: the source says the Følner condition is equivalent to having a Følner sequence with no countability hypothesis; it should assume `G` countable, as its proof's exhaustion by finite sets does; affects nothing.
- **Gap** in Garrido at Theorem 3.6, proof, p. 9: the source treats the differences `f − af` as one convex set bounded away from zero although `a` depends on `f`; it should separate in a finite product of copies of `ℓ¹(G)` indexed by `A`; affects the proof.
- **Misprint** in Garrido at Theorem 3.6, proof, p. 9: the source lists `aB ∪ F` among the subsets of `F ∪ aF`; it should be `aB ∩ F`; affects nothing.
- **Misprint** in Garrido at Definition 3.1, p. 8: the source says the test set in the locally compact case is a compact subgroup; it should be a compact subset; affects nothing.
- **Misprint** in Garrido at Proposition 2.2, proof of (1), p. 6: the source defines the quotient measure by itself and gives the subgroup measure the domain of all subsets of `G`; it should use the measure of `G` on the preimage, and subsets of `H`; affects nothing.
- **Misprint** in BDHV at §G.1, p. 450: the source calls `ϕ ↦ (x ↦ ϕ(gx))` the action by left translations; that formula is a right action, and a left action needs `ϕ(g⁻¹x)`; affects nothing.

## For the human reviewers

- Not tested against a newer library: `TauCetiRoadmap/AmenableGroups/STATUS.md` line 30 reports Layer 7, including the `L∞` characterization, as done, while the pinned Tau Ceti lacks the forward implication that `Suggested.lean` states with `sorry`.
- Licence: the source with the largest share of locators, Garrido, is a set of unpublished lecture notes on an author's page; every statement taken from it is also in BDHV (published) or CGH (published).
- Licence: the References name two unmerged Mathlib pull requests and say their code needs the author's agreement to reuse (`TauCetiRoadmap/AmenableGroups/README.md`, lines 1438–1444); `Suggested.lean` states one theorem on Tau Ceti carriers and was not compared with them.
