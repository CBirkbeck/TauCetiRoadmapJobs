# Review of BaseChangeAndGaloisRepresentationsForUnitaryGroups (pull request #3027 at 71bbefa)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BaseChangeAndGaloisRepresentationsForUnitaryGroups/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 486 changed lines since `aecb53a`. Three statements change, and all three are sound. 10.27 now states the rank-one, conductor-2 case of the Deligne–Henniart formula, and its general form moves to EndoscopicTransferAndUnitaryTraceComparison §10.26a. 10.29a and 16.1 now state the forms the formal proof has, and their former statements stay in full as remarks in the same sections. The 15 sampled Origin locators hold where the text could be read, and every new supplier citation resolves at this head. There is no finding. There are four small corrections (one Corollary-of line is missing, one Method label is too broad, one comparison sentence is out of date, one sentence of the description is inaccurate) and one format note. One question goes to the author. For the human reviewers: whether statements particular to the formal proof belong in the plan, and the fact that the formal proof was not read.

## C01 — The statement of 10.29a follows from its own remark, but no Corollary-of line says so, and the route asks for the construction by cases

The statement asks for a family of maps `r_n` with properties 1, 2 and 4, the `ν^s` twists, `|det r_n(π)| = |r_1(ω_π)|`, and laws on the class of characters and (over `ℚ_p`) twisted depth-zero supercuspidals (line 215). The trace-defined `rec_n` of the remark (line 229) has all of these:
- properties 1–5, the twist rule and duals, from EndoscopicTransferAndUnitaryTraceComparison §§10.20–10.30;
- bijectivity, hence injectivity;
- tameness at depth zero, from 10.35 (d);
- the inertial formula `θ^{p^j}∘t_n` over `ℚ_p`, from 10.34 (iii) with `q = p`.

Neither 10.34 nor 10.35 needs 10.29a, so taking `r_n = rec_n` proves the statement without a cycle. Yet the route still asks for "the definition by cases of the method above, with its laws checked" (line 255), and there is no *Corollary of:* line. Under the convention of lines 37–44, the formal proof's construction would then never be replaced by the deduction.

The smallest repair is a line *Corollary of:* the remark (EndoscopicTransferAndUnitaryTraceComparison §§10.20–10.30), with 10.34 (iii) and 10.35 (d), for `r_n = rec_n`.

## C02 — The Method label of 10.35 says that (c) and "depth zero ⇒ tame" hold by construction, which is true only over `ℚ_p`

The label says the formal proof's map sends depth-zero supercuspidals to tame parameters only "over a field isomorphic to `ℚ_p`". Every other supercuspidal it sends to a value "not a twist of a tame representation" (lines 662–665). 10.29a's Method says the same: an unramified twist of one fixed parameter.

Take `F ≠ ℚ_p` and a depth-zero supercuspidal `π_θ̃` of `GL_2(F)`. The map's value is then not tame, so clause (c) and the direction "depth zero ⇒ tame" of (d) fail for that map. Yet line 666 says these "hold by construction". A reader of the label overestimates what the formal proof has, while the route (line 692) correctly restricts the converse to `ℚ_p`.

Repair: "(a), (b) and, over a field isomorphic to `ℚ_p`, (c) and the direction 'depth zero ⇒ tame' of (d) hold by construction".

## C03 — The comparison of 16.1 with AG2.7 still credits 16.1 with the de Rham comparison at every block, which is now only in the remark

Line 1279 says that here "the comparison at `ℓ` (de Rham with the labelled weights, … AG2.6 …) holds for every block". After the narrowing, the statement of 16.1 asserts only crystallinity, and only when `Π` is unramified at every place above `ℓ`. De Rham at every `w ∣ ℓ` is the remark (line 1312). The sentence is true of the remark but now describes it as the statement.

Repair: insert "(in the remark; in the statement, crystalline when `Π` is unramified above `ℓ`)".

## C04 — One sentence of the description does not hold for this roadmap, and the description does not say that two headline statements became remarks

The description says that where the proof has only a special case, "the section now states the form the proof has, and the general theorem is the one in the general roadmap". For 16.1 no general roadmap states the general form. It stays in this roadmap as a remark, as "this roadmap's own formulation" (line 1312), and headline (4) is that remark. Headline (1) is likewise now the remark of 10.29a (line 5).

Suggested text: "… and the general theorem is the one in the general roadmap or, where no general roadmap states it, a remark in the same section (BaseChangeAndGaloisRepresentationsForUnitaryGroups 16.1; its headlines (1) and (4) are now remarks beside the formal proof's forms)."

## N01 — The formal-proof citation in 10.27 has no file path

In 10.27, line 177, `GlobalTheory.T.tateLocalEpsilonFactor_mul_tameChar` is the only citation of [FormalProof] without a file path. The reference entry says that paths are given relative to `src/`.

## Questions for the author

- The Origin of 13.8a (line 741) credits the comparison of simple trace formulas for inner forms of unitary groups to "Kottwitz, Clozel, Harris and Taylor, Labesse" with no works or locators. The References list Harris–Taylor (2001) and Labesse (2011) only for other purposes, and Kottwitz only for his 1986 paper (10.33c). Which works and statements are meant? Without a locator I had nothing to open.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 10.27 (new) | `E_w = ℚ_3`, `ψ` of level 0, `a(χ)=2`, `ξ` unramified with `ξ(3) = −1`; `p = 2` | Tate: `ξ(ϖ)^{a+n(ψ)} = (−1)² = 1`; 10.27: `ξ(y) = ξ(c)`, `v(c)=2`, gives 1. `p=2`: `x↦χ(1+x)` additive on `2ℤ_2` | holds | none |
| 10.27 Checks (on the `c_χ` of ETUTC §10.26a) | `ℚ_3`, `a(χ)=1` with `c=1,3`; `a(χ)=2` with `c=1,9` | `χ(1+x)=1=ψ(c⁻¹x)` since `v(c⁻¹x)≥0`; on `9ℤ_3` both trivial; `det|·|(c)=1` vs `1/9` | true | none |
| 10.29a statement (new) | `n=1`; `r_n = rec_n`; `St_2`; depth-zero `π_θ̃` of `GL_2(ℚ_p)` | `r_1` = Artin; `|det rec(St_2)| = 1 = |ω_St|`; inertia `θ⊕θ^p` = 10.34 (iii) with `q=p` | true, implied by its remark | C01 |
| 10.29a remark (former statement) | `n=1`; supercuspidals of unequal ranks | `rec_1(χ)=χ∘Art_geo⁻¹` on both sides; `L(s,π×π′)=1` on both sides | kept unchanged | none |
| 10.35 Method label | `F=ℚ_p` vs `F` unramified quadratic over `ℚ_p`, depth-zero `π_θ̃` of `GL_2(F)` | over `ℚ_p`: tame by definition; over `F`: twist of a fixed non-tame parameter, so not tame | "by construction" holds only over `ℚ_p` | C02 |
| 16.1 (narrowed) | `n=2`, `Π` trivial of weight 0, standard `V` | split `w`: `P_w=(X−q)(X−1)`, `r=1⊕ε_ℓ^{−1}`, crystalline, HT `{0,1}`; `1⊕ε_ℓ` gives `(X−1)(X−q⁻¹)` | true | none |
| 16.1 (narrowed), `n=1` | norm-one torus, `Π_v=τ^m` | `a_τ=−m`: `HT_τ={−m}`, `HT_{τ∘c}={m}`; reading `a=λ` gives the dual weights | true | none |
| 16.1 remark | the statement on main, clause by clause | every definite `V`; all unramified `w∤ℓ`; de Rham at `w∣ℓ`; crystalline where unramified: all retained | kept | C03 (line 1279) |
| 10.0a | `G=S_3`, `ρ` standard | `ρ−2 = (Ind_{C_3}ω − Ind_{C_3}1)+(Ind_{C_2}ε − Ind_{C_2}1)`: −3 = −3 at a 3-cycle, −2 = −2 at a transposition | true; Del73 Prop. 1.5, p. 510 | none |
| 10.30 | `n=1` | `LLC_WD(χ)=χ∘Art_geo⁻¹`; `(rec⁻¹χ)^∨=(χ∘Art_arith⁻¹)⁻¹=χ∘Art_geo⁻¹` | equal; Sch13 Thm 1.2 (d), Hen02 Thm 1.8 | none |
| 10.33b | `n=1`; `n=2` with `ū` of eigenvalue `z̄∈k_2∖k` | `Θ=c(ϖ^a u)`; `Θ=c(ϖ)^a·(−θ(z̄)−θ(z̄^q))` (Green) | consistent | none |
| 10.33c | `f=1`; `d=1` | `1_K` and `1_{K_d}`: Kottwitz's unit-element matching; `d=1` is a tautology | true; Kot86 pp. 237–243 | none |
| 10.34 | `n=1`, `θ̃=1`; `n=2`, unitary `θ̃` | the formula would give `−q^{−s}` against `ε=1` (hence excluded); `|ε(1/2)|=q^{−1}|G_2(θ⁻¹)|=1` | consistent | none |
| 13.0a | alphabet `{a}`, characteristic 0 and 2 | `a⧢a=2·aa`: polynomial in characteristic 0, zero (nilpotent) in characteristic 2 | hypothesis needed; Hof99 Thm 2.2 | none |
| 14.0a | `n=1` | `φ=cχ`, `φ(g⁻¹)=cχ⁻¹(g)`: contragredient `χ⁻¹`, central character `ω⁻¹` | true; Cog04 pp. 38–39 | none |
| 14.1 | `n=1` | `WD(r_{ℓ,ι}(χ)|_{G_w}) = χ_w∘Art⁻¹ = rec^T(χ_w)`, the twist `(1−n)/2` being 0 | true | none |
| 15.2 | `n=2`, `a_τ=(k−2,0)`, `w=k−2` | `HT_τ={k−1,0}`; directly `HT_{τ∘c}={k−1,0}`; by the formula `{w+1−h}={0,k−1}`; BLGGT's integer is `k−1` | true; BLGGT14 Thm 2.1.1 (3) | none |
| 6.3a | `F=ℚ`, `κ=1`, `m=1`; `κ=2`, `m=0` | `χ_∞|_{ℝ^×}=sgn=η_∞`; `χ=1` restricts to `η²=1` | true | none |
| 14.2 Corollary-of line | `n_i=1`, `π_w=χ_1×⋯×χ_n` unlinked and tame | 14.1 gives `⊕χ_i∘Art⁻¹`; 10.35 (c) gives inertia `⊕χ_i|_I`: they agree | consistent | none |

- **Source locators checked against the text: 11.** Del73 Prop. 1.5; Hof99 Thm 2.2; Cog04 Prop. 5.3 (iii) and the remark after Prop. 5.1; Sch13 Thm 1.2; Hen02 Thm 1.8; Kot86 (main theorem, pp. 237–243); BLGGT14 Thm 2.1.1; Gue11 Thms 2.2 and 2.3, §§2.3–2.5; DH81 Thm 4.6 and Lemma 4.7, pp. 110–111 (the IAS copy); Yan19 Props. 4.3 and 5.1.
- **Cross-roadmap citations resolved at this head: about 35.**
  - ETUTC §§10.20, 10.21, 10.26a, 10.28.
  - CharacterTheory §§9a.6 (d), 9a.9; Anabelian §2.0a; InductionRestriction Layer 6.1; AL.3.7.1a.
  - AG2PartII: the HT multiset item (AG2.0), Caraiani's full away-prime compatibility (AG2.5), full polarized compatibility at `ℓ` (AG2.6).
  - Supplier sections compared base against head for changed statements:
    - ETUTC: only §10.27 changed, and this README no longer cites it.
    - FRG §1.1 is narrowed to `GL_n(𝔽_q)`, and the contract line was updated. §5.4 is narrowed to `p ≥ 5` and squarefree labels, and the citation moved to CharacterTheory §9a.6 (d). §§5.2, 5.10, 6.1, 6.2, 6.4 are unchanged; §5.11 changes only a citation.
    - LocalFactorsOfTwistsAndTypes §6.5 lists the same laws as the new 10.29a.
    - AutomorphicSpectralTheory and AutomorphicFormsOnReductiveGroups: unchanged.
- **Record at the merge base against the head:** the same 19 section ids and the same layers. Statements change in 10.27, 10.29a and 16.1; the general 10.27 is verbatim in ETUTC §10.26a, and the former 10.29a and 16.1 are kept as remarks.
- **Consumers:** the citations of 16.1 in CongruenceModulesOfThetaLifts, HeckeIdealsAndTaylorWilesRelations and UniformWildKernelBounds were moved to the narrowed form in this pull request.
- **Automatic checks:** all passed. Dependency check: `depcheck: 132 roadmaps, 1481 edges, 0 problem(s)`.
- **Elaboration:** `lake env lean Suggested.lean` exits 0 with no messages. The file has no declarations, only the module docstring, which was revised and checked against README lines 5–13, 215, 1254 and 1312.
- **Overlap check:** read FiniteReductiveGroups, LocalFactorsOfTwistsAndTypes, EndoscopicTransferAndUnitaryTraceComparison and CongruenceModulesOfThetaLifts at this head, plus the scope lines of ThetaLiftsForDefiniteUnitaryGroups, ThetaKernelsForUnitaryDualPairs and UniformWildKernelBounds, which only consume. Owners:
  - the trace-defined correspondence and the explicit threshold: ETUTC (§§10.20–10.30, §10.26a);
  - labels of depth-zero representations: FRG §6.3;
  - the characterisation of local Langlands correspondences: LocalFactors §6.5;
  - Galois representations of definite unitary groups: this roadmap (16.1), compared with PotentialAutomorphyInfrastructurePartII §3.6;
  - Brauer in degree zero, Radford's theorem and the contragredient: InductionRestriction 6.1, Anabelian §2.0a and AL.3.7.1a, cited through Corollary-of lines.
- Source independence: 15 passages compared with 10 sources (the 10 sampled Origin labels, plus the Method labels of 10.0a, 10.27, 10.33c, 13.0a and 14.0a), none shared. Largest share: [FormalProof], 32 file-path locators. Contents not compared: the change adds, removes and reorders no layer.
- Research link: Layers 10 and 14–16 state the explicit depth-zero local Langlands correspondence (Henniart 1992; Bushnell–Henniart 2005) and the properties of Galois representations of polarized cuspidal representations and of definite unitary groups (Shin 2011; Chenevier–Harris 2013; Caraiani 2012; BLGGT 2014; Guerberoff 2011). This rests on the README's Summary and References, BLGGT14 Thm 2.1.1 and Gue11 §2.5.

## Not verifiable

- DeBacker–Reeder 2009, Lemmas 9.3.1, 10.0.4 and Prop. 10.1.1 (10.33b): the sources service found only the Annals landing page.
- Harris–Kudla–Sweet 1996 §1 (6.3a): the AMS landing page is on a host the service does not classify.
- Kudla 1994 §1 (6.3a): paywalled, recorded as uncertified.
- Silberger–Zink 2008, Henniart 1992, Bushnell–Henniart 2005, Adler–Lansky 2005, Shin 2011, Chenevier–Harris 2013, Caraiani 2012 and 2014: cited without theorem numbers in Origin labels only; not fetched.
- Radford 1979: settled as uncertified.
- [FormalProof]: no copy was read. Its declaration names and file paths, and every *Method of the formal proof* label, were not checked.
- Ownership against other open pull requests: the closest open heads (pull request 3036, which revises several suppliers but not this roadmap) were not among the sibling checkouts. Only the overlaps report was used, and it shows no dropped id.

## Source issues

- none

## For the human reviewers

- Scope: the statements of 10.27, 10.29a and 16.1 (README lines 171, 215, 1254) are now forms particular to [FormalProof], an announced Lean formalization (References, last entries), with the general or published forms as remarks (lines 229, 1312) or in ETUTC §10.26a.
- Not tested: [FormalProof], the source with the largest share of locators, was not read, so parts 1 and 2 of the source check were not run against it.
