# Review of AmenableGroups (pull request #2542 at 2183ddc)

**Verdict:** accepted

**Summary.** Accepted, with no findings. Every statement, Check and convention computes correctly, every sampled source locator says what the README claims, and the one open headline in `Suggested.lean` has the same hypotheses as its README statement. All eight remarks of the previous review are repaired. There are two small corrections, both in Layer 7: a sentence that calls the `L∞` smoothing a Bochner integral of translates, and a *Needs:* line that omits the interchange of integrals its route uses. There are also two format notes, none blocking. Two licence facts are left for the human reviewers.

## C01 — §7.2 calls the `L∞` smoothing of §7.4 a Bochner integral of translates, and it is not one

A reader who takes the sentence literally will look for an `L∞`-valued integral `∫ h(y) L_y φ dμ(y)`, and none exists. The sentence is in the σ-compact localization paragraph of §7.2, line 929: "The convolutions of §7.3 and §7.4 are Bochner integrals of translates and need no σ-finiteness of G."

That is true of §7.3, but not of §7.4. Take `G = ℝ` and `φ = 1_[0,∞)`. Then `L_y φ = 1_[y,∞)`, and `‖L_y φ − L_y' φ‖∞ = 1` whenever `y ≠ y'`. So `y ↦ L_y φ` is not essentially separably valued, and it has no Bochner integral in `L∞`; Mathlib's integral would return `0`. §7.4 itself defines `C_h φ` pointwise, as a scalar integral at each `x`, and so does Tau Ceti's `MeasureTheory.Lp.convolutionUCB` (module docstring of `TauCeti/MeasureTheory/Group/Convolution/UCB.lean`). The orbit-integral form holds only on `UCB(G)`, as the last bullet of §7.4 says.

Suggested wording: "The convolution of §7.3 is an `Lᵖ`-valued Bochner integral of left translates, and that of §7.4 a scalar integral at each point; neither needs σ-finiteness of `G`."

## C02 — The approximate-identity route of §7.3 needs an interchange of integrals that its *Needs:* line does not list

An implementer reading the line would take the approximate identity to be independent of the Fubini target just above it, and it is not. The route (lines 999–1004) starts from `h ⋆ k = ∫ k(z) R_(z⁻¹) h dμ(z)`, an equality between two `L¹`-valued Bochner integrals, `∫ h(y) L_y k dμ(y)` and `∫ k(z) R_(z⁻¹) h dμ(z)`. At a point `x` these are `∫ h(y) k(y⁻¹x) dy` and `∫ k(z) c(z) h(xz⁻¹) dz`, which agree by `y = xz⁻¹`. But they can only be compared after each `L¹`-valued integral has been evaluated pointwise, and that is an interchange of integrals. The module docstring of Tau Ceti's `MeasureTheory/Function/Lp/GroupConvolution.lean` says this identification "needs a Fubini argument and is not done here". The *Needs:* line lists only `MeasureTheory.Lp.convolutionL`, `MeasureTheory.Lp.continuous_rightTranslation_apply` and the inversion formula.

The smallest repair is to add to that line either "the pointwise formula above" or `MeasureTheory.MemLp.exists_hasCompactSupport_eLpNorm_sub_le`. The latter is the compact-support reduction the route already names as an alternative: for continuous compactly supported `h, k` both sides can be evaluated directly.

## N01 — The module docstring of `Suggested.lean` counts seven headlines; the README summary names four

At lines 10–28, the docstring presents as "headlines" the content characterization (§2.4), the paradox obstruction (§3.4) and the finite-test form of Følner sets (§5.1). The summary names only Følner's theorem, Tarski's alternative, `F₂` and the `L∞` characterization. Saying "the headlines and the main results behind them" would make the two lists agree.

## N02 — Four remaining targets carry no source locator

The four targets are the counting content of §2.5 (line 424), the pointwise formula and the approximate identity of §7.3 (lines 978 and 990), and the completion statement of §7.6 (line 1093). For §2.5, Garrido, Example 2.1 (p. 5), defines exactly `μ(A) = |A|/|G|`.

## Earlier findings

- R01 (affine product): repaired. Line 146 now gives "`xu = (aα, aβ + b)` for `u = (α, β)`" with the bound `|β|/α + |α − 1|/(2 min(α, 1))`. I recomputed it from the Lipschitz bound for `arctan` and from `|log α| ≤ |α − 1|/min(α, 1)`.
- R02 (evaluation means): repaired. Lines 301–303 read "left invariant exactly when `UCB(G)` consists of the constants, which happens exactly when the topology of `G` is indiscrete; for a Hausdorff group, exactly when `G` is trivial". This is true. If the topology is not indiscrete, then `N = closure{1} ≠ G`, the quotient `G/N` is a nontrivial Hausdorff group, and pulling back a nonconstant bounded right-uniformly continuous function from `G/N` gives a nonconstant element of `UCB(G)`.
- R03 (targets already in Tau Ceti): repaired, with each citation now in place:
  - §5.1 cites `Finset.card_smul_finset_symmDiff` (lines 719–721);
  - §6.1 states the estimate for every interval `Icc a b` with `Int.card_image_add_left_Icc_symmDiff_le` (lines 846–848);
  - §7.7 cites the four `Localization.lean` lemmas (lines 1107–1113);
  - the scope paragraph (lines 1242–1253) matches.
- C01 (Layer 7 renumbering): repaired. Lines 890–892 map items 1–5 to §§7.2–7.5. The localized Fubini content returns as the pointwise-formula target of §7.3. Both BanachSpaceTheory's "Layer 7, item 1" and BanachAlgebras' "7.1–2" can be followed.
- C02 (headline list): repaired. Line 23 now names only `F₂`, and lines 29–32 move the further results out of the headline list.
- C03 (duplicate names): repaired. `Suggested.lean` states only the open `L∞` headline and cites the Tau Ceti theorems for the others.
- C04 (AnalyticNumberTheoryPartII): repaired at lines 1224–1225.
- C05 (description): repaired. The description now matches the head on every point checked under Verified sound.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.2 translations | discrete `G`, `δ_1` | `L_gδ_1=δ_g`, `L_gL_hδ_1=δ_gh`; variant `f(g·)`: `δ_(g⁻¹)`, composite `δ_((hg)⁻¹)` | Check true; `leftTranslation_apply` is `f(g⁻¹x)` |
| 1.2 preservation | `(L_gf)(ux)−(L_gf)(x)` | `=f((g⁻¹ug)g⁻¹x)−f(g⁻¹x)`, `g⁻¹ug→1` | conjugation argument correct |
| 1.4 weak-* compactness | trivial `G`; `F₂` discrete | means `={ev}`; invariant set closed, empty | statements match `WeakStar.lean` names |
| 1.5 transport | trivial `→ ℤ` | push-forward `ev_0`; `ev_0(1_{0})=1`, `ev_0(L_1 1_{0})=ev_0(1_{1})=0` | Check true; `of_le`: `t₁≤t₂` finer→coarser (Basic.lean:148) |
| 2.1 discrete UCB | `ℤ`, nbhd `{1}` | `f(1·x)−f(x)=0` for all bounded `f` | `ucb_eq_top` matches |
| 2.2 contents | `ℤ`, singleton mass `c` | countable: `Σc∈{0,∞}≠1`; finite: `nc≤1⇒c=0` | Check true |
| 3.5 free group | `1=a·a⁻¹`, `b=a(a⁻¹b)`; `α=Unit` | both in `aW(a⁻¹)`; `FreeGroup Unit≅ℤ` amenable | true; `[Nontrivial α]` needed and present |
| 4.1 subgroups | `x=kt_c`, `r(k'x)=k'k` | `m(L_k(f∘r))=m(f∘r)` | true; Garrido Prop 2.2(1) line 228; discrete hypothesis present |
| 4.2 quotients | `G→G/N` surjective; trivial→`ℤ` non-surjective | invariant; not invariant (§1.5) | `of_surjective` needs surjective `G →ₜ* H` |
| 4.3 extensions | `x'=xψ(k₀)` | `n(F(k₀·))=n(F)` by left invariance | fiber average constant; BDHV G.2.2(ii) line 17212 |
| 4.7 free subgroups | `F₂` indiscrete; discrete | UCB constants, amenable; not amenable | discreteness needed and present (FreeGroup.lean:40) |
| 5.1 Følner sets | `ℤ`, `F_n`, `g=1`; `F=∅`; triangle | `△={0,n+1}`, ratio `2/(n+1)`; `0<ε·0` false; `ghF△F⊆g(hF△F)∪(gF△F)` | true; `card_smul_finset_symmDiff` (Pointwise/Finset.lean:35) |
| 5.3 averages | `m_F(L_gf)−m_F(f)` | `|F|⁻¹|Σ_(g⁻¹F)f−Σ_F f| ≤ ‖f‖|g⁻¹F△F|/|F|` | matches `abs_average_leftTranslation_sub_le` |
| 7.1 comparison | `δ_0` on `ℝ`, `min(|x|,1)` | sup `1`, ess sup `0` | Check true; `norm_toLpTop` needs `IsOpenPosMeasure` |
| 7.4 smoothing | `C_h(L_gφ)`; `∫R_(g⁻¹)h` | `=C_(R_(g⁻¹)h)φ`, weight `c(g)`; `c(g)c(g⁻¹)∫h=∫h` | true; `R_g` weight `c(g⁻¹)` (RightTranslation.lean:241) |
| 7.4 mixed associativity | `C_(h⋆k)φ(x)` | `=∫h(z)C_kφ(z⁻¹x)dz` by `y=zw` | true |
| 7.7 local conventions | σ-finite; `ℝ_d×ℝ`, `A=ℝ×{0}` | `μ(A)≤Σμ(A∩B_n)=0`; locally null, `μ(A)=∞` | hypothesis needed and present (Localization.lean:60, 91) |
| 7.2 modular character | affine, `g=(2,0)`, `S=[1,2]×[0,1]` | `μ(Sg⁻¹)=1=2μ(S)`; BDHV `μ(Sg)=1/4`, `Δ=1/2` | true; BDHV line 12089: `μ(Bg)=Δ(g)μ(B)` |
| 7.2 Baire representatives | σ-compact `H` | zero sets inside `E` and `Eᶜ`, σ-finite; Borel Haar = regular via Baire uniqueness | true; Fremlin 443M line 1507 |
| 7.3 approximate identity | `ℝ`, `h=1_[0,1]`, `δ≤1/2` | ramps `δ/4` ×4: `‖h⋆k−h‖₁=δ`; unnormalized `≤2δ→0` | Check true |
| 7.3 route (C02) | pointwise both sides | `∫h(y)k(y⁻¹x)dy=∫k(z)c(z)h(xz⁻¹)dz` by `y=xz⁻¹` | true, but needs interchange |
| 7.2 sentence (C01) | `ℝ`, `φ=1_[0,∞)` | `‖L_yφ−L_y'φ‖∞=1`, not separably valued | §7.4 is pointwise, not Bochner of translates |
| 7.5 kernel independence | `∫h=1` | `m(C_(h⋆h_U)φ)=m(C_(h_U)φ)`, `h⋆h_U→h` | true; BDHV G.3.1 proof line 17327 |
| 7.6 completion | `E` null-measurable, `A,A'` Borel | `μ(A△A')=0⇒ν(A)=ν(A')` | well defined |
| headline Følner | trivial; `F₂`, `K={a,b}` | `F={1}`: `0<ε`; no `F` | `amenable_iff_exists_finset`, discrete present |
| headline Tarski | `ℤ`; `F₂` | amenable, not paradoxical; paradoxical, not amenable | `amenable_iff_not_paradoxical_univ`, discrete present |
| headline `F₂` | `α=Fin 2`; `α=Unit` | paradoxical; `ℤ` not | `FreeGroup.paradoxical_univ [Nontrivial α]` |
| headline `L∞` (Suggested) | trivial; `ℝ`; `F₂` counting; `ℝ_d×ℝ` | `M=id`; both true; both false; forward via `C_(h₀)`, inversion preserves null sets | true; forward absent at pin (Linfty.lean only discrete, reverse) |
| R02 recheck | non-indiscrete `G` | `G/closure{1}` Hausdorff nontrivial ⇒ nonconstant UCB pull-back | new text true |

- Source locators checked against the text: 31 in total. Garrido 16: Def 1.1, Thm 1.2, Cor 1.3, Def 1.4, Prop 1.5(1), Thm 1.11, Defs 1.12–1.13, Thm 1.15, Ex 2.1, Props 2.2–2.3, Defs 3.1 and 3.3, Lemma 3.4, Ex 3.5, Thm 3.6. BDHV 11: the start of Appendix A, A.3, G.1.3, G.1.4, G.1.5, G.2.2, G.3.1, G.5.1, G.5.2, G.5.4, C.5. CGH 3: Theorems 7, 25 and 35 (§III.1). Fremlin 1: §443M on p. 29.
- README backticked names: 465 extracted, of which 431 are declarations; the rest are file names and prose symbols. 342 were confirmed by `#check` on the compiled modules, and 82 by namespace-aware search of the 15 Tau Ceti modules that have no object file. The remaining 7 are `c.pt` and short `TauCeti.UCB` lemma names that the README also gives in full.
- Library declarations whose elaborated signature was compared with the README prose: 55. They include `TauCeti.Amenable.of_le`, `Amenable.of_commGroup`, `amenable_iSup_of_directed`, `not_amenable_freeGroup`, `addContentLpTopEquiv`, `exists_lpTop_invariant_iff_of_regular`, `inv_eq_withDensity_modularCharacter_of_regular` and `coeFn_rightTranslation`.
- Remaining targets confirmed absent at the pin: §2.3 naturality, §2.5 counting content, §5.1 monotonicity and triangle bound, §5.3 eventual equality, the forward `L∞` implication, and the pointwise formula (stated as missing in the `GroupConvolution.lean` docstring). The Tau Ceti approximate units (`ApproximateIdentity.lean` for finite-dimensional spaces, and the C⋆ convolution `ApproximateUnit.lean` on `C_c(G, A)`) are different carriers.
- Cross-roadmap citations resolved: outgoing, RepresentationTheory/CompactGroups §0.1 and the anchor of OneParameterSemigroups Part C. Incoming: 9 consumers on main, all listed. The two anchor links into this README still resolve. BanachSpaceTheory (#1854 head) and ClassicalErgodicTheory (#2231 head) cite "Layer 7, item 1" and Layer 5, and both remain valid. No roadmap references a removed `TauCetiRoadmap.AmenableGroups` declaration.
- Dependency check: `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The full gate passed (`OK`), and no file outside the folder changed.
- Elaboration of `Suggested.lean`: a single message, the `sorry` warning at line 48. `#check @amenable_iff_exists_lpTop_invariant_of_isHaarMeasure` matches the README statement with no binder lost, so nothing changed.
- One-tactic probe: the only declaration needs the forward implication, which the pin lacks (`Amenable.of_lpTop` is the reverse only), so it is not padding.

Overlap check: I read the scope of ClassicalErgodicTheory (#2231), BanachSpaceTheory (#1854), AmenableTracesOnCStarAlgebras, OperatorAlgebraDynamics and CompactQuantumMetricSpaces. Nothing is shared: each consumes `TauCeti.Amenable` or this roadmap's Layers 5–7. CompactQuantumMetricSpaces owns the `ℤᵈ` boxes and cites §6.1 for `d = 1`. BanachAlgebras A7.ChosenApproximateIdentity (on main) builds continuous two-sided kernels on complex `L¹` and cites this roadmap's Layer 7 for its inputs; that makes it a consumer, not a second owner.

Source independence: 37 passages compared with 4 sources (the 31 locators and 6 prose passages: §§3.5, 4.1, 5.2, 7.5 and 7.7, Convention 2, and the Suggested docstring); none shared beyond forced formulas and attributed definitions (the decomposition at Garrido line 62, the definitions at BDHV line 14611). Largest share: Garrido, 24 of 43 locators. Contents compared with Garrido §§1–4: independent. Layers 1 and 7 have no counterpart there, Layers 2 and 3 reverse Garrido's §1.2/§1.1 order, and abelian groups (Garrido §2) come after Følner sets (Garrido §3.1).

Research link: Layer 7 is Theorem G.3.1 of Bekka–de la Harpe–Valette (2008), the amenability characterization behind their Hulanicki–Reiter Theorem G.3.2 in the Property (T) theory. Layer 8 is Tarski's alternative, Theorem 7 of Ceccherini-Silberstein–Grigorchuk–de la Harpe (1999). VonNeumannAlgebras, BanachAlgebras and FactorRigidity on main consume Layers 1–7. This rests on the README References and on the BDHV and CGH texts.

## Not verifiable

- BDHV at the README's author-page link (perso.univ-rennes1.fr) could not be fetched; the host timed out. I read the same manuscript from the Geneva institutional archive instead.
- CGH: I read the author-page preprint dated 9.3.1998. I did not compare its theorem numbering with the published Proc. Steklov Inst. 224 (1999), which is not openly available.
- The Zulip threads and the Mathlib pull requests in the References support no statement, and I did not read them.

## Source issues

- **Misprint** in Garrido at Lemma 3.4, p. 9: the source says the Følner condition is equivalent to having a Følner sequence, with no countability hypothesis; it should assume `G` countable, as Definition 3.3 and the proof's enumeration of `G` do; affects nothing.
- **Gap** in Garrido at Theorem 3.6, proof, p. 9: the source treats `{f − af}` as one convex set bounded away from `0`, but `a` depends on `f`; it should separate in a finite product of copies of `ℓ¹(G)` indexed by `A`; affects the proof.
- **Misprint** in Garrido at Theorem 3.6, proof, p. 9: the source lists `aB ∪ F` among the subsets of `F ∪ aF`; it should be `aB ∩ F`; affects nothing.
- **Misprint** in Garrido at Definition 3.1, p. 8: the source says that in the locally compact case `A` is a compact subgroup; it should be a compact subset; affects nothing.
- **Misprint** in Garrido at Proposition 2.2, proof of (1), p. 6: the source defines the quotient measure by `λ(A) := λ(AN)`; it should be `μ(AN)`, the measure on `G` of the preimage; affects nothing.
- **Misprint** in Garrido at Proposition 2.2, proof of (1), p. 6: the source gives the subgroup measure `ν` the domain `P(G)`; it should be `P(H)`, the subsets of the subgroup; affects nothing.
- **Misprint** in BDHV at §G.1, p. 450: the source calls `ϕ ↦ gϕ` with `gϕ(x) = ϕ(gx)` the action by left translations; this formula gives a right action, and a left action needs `ϕ(g⁻¹x)`; affects nothing, since invariance under all `g` is the same.

## For the human reviewers

- Licence: the References name two unmerged Mathlib pull requests by one author and state that their code may be reused only with that author's agreement or a permitting licence (`TauCetiRoadmap/AmenableGroups/README.md`, lines 1438–1444). `Suggested.lean` states one theorem on Tau Ceti carriers; I did not compare it with those pull requests.
- Licence: the BDHV text I read is the Geneva archive's open-access copy of the 2007 manuscript. The README links a different copy, on an author page.
