<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1119#issuecomment-6394373522 -->
Review (claude) of 58ffa23

Verdict: needs changes

1. **F01** (P2) Suggested.lean states two input lemmas and a definition already in Mathlib, and no headline

   **Location.** Suggested.lean lines 65–98 (`freeRankOnSupport_of_extension`, `modulePullback_freeRankOnSupport_iff`) and lines 45–59 (`FreeRankOnSupport`, `modulePullback`). README line 132 says: "Suggested.lean contains only the two statable algebraic headlines, `freeRankOnSupport_of_extension` and `modulePullback_freeRankOnSupport_iff`". The same names also appear at README lines 30, 589, 597, 618 and 626.

   **Claim.** The two theorems are headline theorems of the roadmap.

   **Witness.** Both are BHHMS23 Lemmas 8.2.1 and 8.3.8 (lines 4566, 5054) over an arbitrary ring, inputs to Proposition 8.2.3. In Lean, `modulePullback f g = LinearMap.eqLocus (f ∘ₗ fst) (g ∘ₗ snd)` by `LinearMap.eqLocus_eq_ker_sub` (Mathlib/Algebra/Module/Submodule/EqLocus.lean:102).

   **Repair.** Delete all four declarations and the `Layer 2` section comment from Suggested.lean, keeping `import Mathlib`, the module docstring and the namespace. In the docstring, replace "It states the roadmap's headline theorems that can be expressed against the pinned APIs" by a sentence saying that none of the end theorems of §§5.1–5.5 and 5.7 can be stated at the pins, and keep the list of missing carriers. In the README:
   - remove the backticks from the four names at lines 30, 589 and 618;
   - delete the two `*Lean:*` sentences at lines 597 and 626;
   - at line 132, replace the final sentence by "Suggested.lean states no theorem: no end theorem is statable at the pins."

   The statements of §§2.2–2.3 stay in the README as targets. Tested: the reduced file (import, docstring, empty namespace) was elaborated with `lake env lean` from the content checkout and exits 0 with no output. After the edit no backticked name of this roadmap's own is left for the gate to check. The one-tactic probe does not close either theorem (9 tactics each; `exact?` returns only the theorem itself), so the deletion rests on the headline rule, not on the probe.

2. **F02** (P2) The scope cites two roadmaps that exist nowhere

   **Location.** README line 18: "The quaternionic varieties with an arbitrary real split set belong to HilbertModularVarietiesAndShimuraCurvesPartIIQuaternionic; the Hilbert–Siegel moduli direction belongs to HilbertSiegelModularVarieties."

   **Claim.** These two roadmaps own the excluded directions.

   **Witness.** `roadmaps grep` finds neither on main (bfaaff1) or in the 352 open roadmap pull requests. Neither is in the board-packages index, the board's `origin/main` packages or the merge order. Only `plan.json` `restructure` proposes them.

   **Repair.** Replace line 18 by: "Quaternionic Shimura varieties with more than one split real place, and Hilbert–Siegel moduli, are outside this roadmap; no target here uses them." Tested: the sentence then names no roadmap, `roadmaps resolve` has nothing to resolve there, and the depcheck graph is unchanged because the line was never an edge.

3. **F03** (P2) gap:single-type-rings asks for ideals §3.2 already defines and omits the two ideal identities §3.2 uses

   **Location.** README line 68 (and the identical `needs` in `design/plan.json`): "together with intersections of component ideals cutting out any selected union of weights and their formal-power-series base changes I_𝒥 (EGS15 §10.1, pp. 59–61)". Line 730: "let I_𝒥 be the inverse image in R∞ of the intersection of their prime ideals". Line 736: "After the formal-power-series base change supplied by gap:single-type-rings".

   **Claim.** The ring supplier must supply I_𝒥, and this is what §3.2 needs from it.

   **Witness.** §3.2 also defines I_𝒥. Its route (line 740) applies §2.2(iii) and §2.3(ii), which need I_{𝒥∖{𝒥₀}}/I_𝒥 ≅ R/I_{𝒥₀} (EGS15 Lemma 10.1.6, line 3246) and I_{𝒥₁}+I_{𝒥₂}=I_{𝒥₁∩𝒥₂} (Lemma 10.1.8, line 3282). Nothing owns either.

   **Repair.** In line 68 and `plan.json`, replace the quoted clause by: "together with, for the component ideals I_𝒥 of the reduced special fibre of a single-type ring, the cyclic-quotient identity I_{F(J₁,J₂)^×}/I_{F(J₁,J₂)} ≅ R̄/I_{{J₁}} and, for capped intervals sharing a cap, I_{𝒥₁}+I_{𝒥₂} = I_{𝒥₁∩𝒥₂} (EGS15 Lemmas 10.1.6 and 10.1.8, pp. 60–61)". At line 736, replace "After the formal-power-series base change supplied by gap:single-type-rings" by "Because the special fibre of `R∞^{(1,0),τ}` is a power-series ring over the local one (§1.3), the two identities of gap:single-type-rings hold for the I_𝒥 of R∞". In the route at line 740, cite Lemma 10.1.6 at the §2.2 step and Lemma 10.1.8 at the §2.3 step.

   Tested on EGS15 Example 10.1.3 (f=2):
   - For the capped intervals {J′max, J′max∖{j₂}} and {J′max, J′max∖{j₁}}, the sum (X′_{j₁})+(X′_{j₂}) equals I_{{J′max}} = (X′_{j₁}, X′_{j₂}).
   - For the non-interval pair of Example 10.1.3(3), the sum (X′_{j₁}, X′_{j₂}Y′_{j₁}) is not equal to (X′_{j₁}, X′_{j₂}), so the cap hypothesis is necessary.
   - For f=1, (X′) ≅ R̄/(Y′).

4. **F04** (P2) Two gap contracts are stated in terms of this roadmap's own §0.2, which the earlier supplier cannot consume

   **Location.** README line 66 (gap:tame-types): "each σ∈W(r̄) has a non-scalar tame τ with JH(σ̄(τ))∩W(r̄)={σ}; … with W(r̄) and duality as in §0.2." Line 70 (gap:breuil-mezard-pbt): "μ_σ(r̄)≠0 exactly for the predicted weights, equal to BDJ's W(r̄) when K is unramified". The same text is in `plan.json`.

   **Claim.** LocalGaloisDeformationRingsPartII (order 307) can state these contracts.

   **Witness.** For generic, possibly nonsplit r̄, W(r̄) is defined only in §0.2 here (order 308; line 112: "Layer 0 supplies their BDJ extension-class recipe"). The supplier's design (README line 17) takes W(ρ̄) only from MP.3, which covers tame 1-deep parameters.

   **Repair.**
   - In line 66 and `plan.json`, delete the three clauses that mention W(r̄): the weight-isolating τ, the τ₀ clause, and the two-weight extension types of Proposition 10.1.11. Also delete "with W(r̄) and duality as in §0.2". Keep the correspondence image, the Diamond-box constituents, the cosocle lattices and the capped-interval subquotients.
   - Add those three statements to §0.2 as targets (EGS15 Propositions 3.5.1, 3.5.2, 10.1.11, pp. 14–15, 61–62), proved from the supplied JH sets.
   - In line 70 and `plan.json`, replace the support clause by "with μ_σ(r̄)≠0 exactly when r̄ has a crystalline lift of Hodge type σ (GK14 Theorem A(1) and Definition 2.2.6, pp. 3, 8)".
   - Add to §0.2 the target that, for unramified K, W(ρ) is exactly the set of σ for which ρ has a crystalline lift of Hodge type σ (GK14 §2.2, p. 8, which cites Gee–Liu–Savitt).
   - In line 301, replace "it is the Breuil–Mézard supplier contract" by "the supplier gives the crystalline description and §0.2 the comparison".

   Tested on the très ramifiée extension ρ of 1 by ω over ℚ_p (§0.2 Check, line 201). There W(ρ)={Sym^{p−1}}, and ρ has no crystalline lift of Hodge type the trivial weight, since it has no finite flat model. So the two sets agree, and the supplier statement no longer refers to §0.2. For a nonsplit generic r̄_w, a type isolating σ inside W(r̄_w^ss) also isolates σ inside W(r̄_w), because W(r̄_w) ⊆ W(r̄_w^ss) (§0.2 API).

5. **F05** (P3) Layer 1 starts at §1.2

   **Location.** README line 347: "### 1.2 The patched local deformation ring R∞" directly follows the line 345 heading "## Layer 1: Patching functors and the big patched module".

   **Claim.** The numbering is timeless.

   **Witness.** No §1.1 exists. The gap is left over from deleting the old cancellation target, which the house style forbids ("removed" residue, a reader can see what was contentious).

   **Repair.** Renumber §§1.2–1.7 as §§1.1–1.6. Update every reference to this roadmap's §1.n: the plain "§1.n" in prose and *Needs:* lines, about 72 occurrences, excluding citations prefixed by another roadmap's name. Tested: after renumbering, `grep -n '^### 1\.'` lists 1.1–1.6 consecutively.

6. **F06** (P3) The scope lists the cancellation gap as already stated

   **Location.** README line 14, under "The following objects are stated elsewhere": "Local power-series cancellation (HAM75 Theorem 4), general module and complex patching, commutative depth and support: DeformationAndDerivedPatchingAlgebra §§3.1–3.4, 5.6, 6.1–6.2, 8.1–8.5."

   **Claim.** DeformationAndDerivedPatchingAlgebra §§3.1–3.4 state Hamann's theorem.

   **Witness.** At its head a3b5dea, §§3.1–3.4 ("Finite resolutions and depth" to "Regular-sequence ideals and complete intersections") do not state it. It is the declared gap:power-series-cancellation (line 86).

   **Repair.** Delete "Local power-series cancellation (HAM75 Theorem 4)," from line 14. Add the sentence "Local power-series cancellation is the declared gap:power-series-cancellation on DeformationAndDerivedPatchingAlgebra." Tested: line 14 then lists only sections that exist at a3b5dea.

7. **F07** (P3) Locator slips

   **Location.** sources.toml lines 183–184: `locator = "05G8"` and `url = "https://stacks.math.columbia.edu/tag/090V"`. README line 159: "sufficiently small as specified in EGS15 §6.2, p. 34 (EGS15 line 1695) (EGS15 §6.2)".

   **Claim.** The entries point at the cited statement.

   **Witness.** Tag 090V is the Auslander–Buchsbaum formula (STACKS line 12602). The only cited tag is 05G8, the surjective-endomorphism lemma (STACKS line 1544). Line 159 repeats its locator.

   **Repair.** The fix worker sets the STACKS `url` to `https://stacks.math.columbia.edu/tag/05G8` (this review does not rewrite author entries). At line 159, delete the trailing "(EGS15 §6.2)". Tested: Tag 05G8 is at STACKS line 1544, which the README cites at line 587.

8. **F08** (P3) A convention Check in §0.5 gives no residual datum

   **Location.** README line 287: "At f=1,p=29 the modular socle has the two weights Sym¹² and det¹³ Sym¹⁴, each r times."

   **Claim.** This pins the dual-weight convention.

   **Witness.** The modular weights are W(r̄_v^∨). For the running example r̄_v|I ≅ ω¹³⊕1 (§0.2, line 203), W(r̄_v^∨) = W(ω¹³⊕1)⊗ω^{−13}∘det = {det¹⁵Sym¹², Sym¹⁴} (exponents mod 28). The quoted set holds only for r̄_v|I ≅ ω¹⁵⊕1.

   **Repair.** Change the line to: "At f=1, p=29 and r̄_v|I ≅ ω¹⁵⊕1 (r₀=14, inside the box), r̄_v^∨|I ≅ ω¹³⊕1 and the modular socle has the two weights Sym¹² and det¹³ Sym¹⁴, each r times; for r̄_v|I ≅ ω¹³⊕1 it is {det¹⁵Sym¹², Sym¹⁴}." Tested: −15 ≡ 13 (mod 28), and W(ω¹³⊕1) = {Sym¹², det¹³Sym^{29−3−12}} (§0.2 Check, line 199).

Files are cited as `packages/HilbertModularVarietiesAndShimuraCurvesPartII/README.md` (README below), `packages/HilbertModularVarietiesAndShimuraCurvesPartII/Suggested.lean` (Suggested.lean below) and `packages/HilbertModularVarietiesAndShimuraCurvesPartII/sources.toml` (sources.toml below). Four findings are blocking (R01–R04) and four are notes (R05–R08). R01 is blocking under this review's binding rule: padding in Suggested.lean, input lemmas of a headline included, is blocking. R03 and R04 are defects that the round-1 repairs F06 and F05 introduced. None of the findings re-plans another roadmap or puts the scope in doubt, so the package can be repaired. No finding re-raises a settled item: the repair report marks no finding as not actionable.

## Repair check (round-1 findings F01–F10)

| Round-1 finding | Repaired passage (quoted) | Status |
|---|---|---|
| F01 Hecke ideal convention | README line 225: "it is the ideal that HilbertModularVarietiesAndShimuraCurves §R18.3.15, with its arithmetic Frobenius and evaluation T_w ↦ tr, S_w ↦ `q_w^{−1}det`, attaches to r̄ ⊗ ω." The pattern is repaired at lines 56, 231, 238, 1088, 1092 and 1097. | repaired (values in rows A1–A4) |
| F02 Hamann cancellation owner | README line 86: "What DeformationAndDerivedPatchingAlgebra must provide (gap:power-series-cancellation): For commutative local rings A and B, an abstract ring isomorphism A⟦x⟧ ≅ B⟦x⟧ implies A ≅ B". The old §1.1 and `powerSeries_cancellation` are gone, and the slug is in `design/plan.json`. | repaired (scope wording: R06) |
| F03 new-at-w₁ citations | README line 324: "after global Jacquet–Langlands (GL2AutomorphicRepresentationsAndTransfer §§R17.3.1, R17.3.10), by local–global compatibility away from p (AutomorphicGaloisRepresentations §4.4)". | repaired (row A6) |
| F04 false reverse depth inequality | README line 663: "Equality holds when M is finitely generated over B and also over A (GN22 §A.20, p. 47; GN22 line 2171); for an arbitrary B-module only the displayed inequality is asserted." | repaired (row A10) |
| F05 compound Breuil–Mézard gap | README line 70: "supply the unique integers μ_σ(r̄)≥0 satisfying … for every inertial type τ, with μ_σ(r̄)≠0 exactly for the predicted weights, equal to BDJ's W(r̄) when K is unramified". | compound request split; the new support clause depends on this roadmap's §0.2 (R04) |
| F06 vague tame-type gap | README line 66, ending "…and the two-weight extension types of EGS15 Proposition 10.1.11, with W(r̄) and duality as in §0.2." The ideals were moved to gap:single-type-rings (line 68) and are also defined in §3.2 (line 730). | partly repaired: new defects R03 and R04 |
| F07 GK.n identifiers | `GK\.[0-9]` has 0 matches in the README. | repaired |
| F08 locator slips | Line 587 "p. 90"; line 777 "BHHMS23 line 5044"; line 807 "BHHMS23 line 354"; line 964 "BHHMS23 line 288". No "00MK" is left. Kisin smallness is cited as "EGS15 §6.2, p. 34 (EGS15 line 1695)" at lines 157, 214 and 247. | repaired (a duplicate parenthesis at line 159: R07) |
| F09 ambiguous §5.6, freeness at w₁ | Lines 80 and 100: "this roadmap's §5.6". Line 231: "the finite group acts freely by §0.1 (BHHMS23 Remark 8.1.3(iii), p. 89; BHHMS23 line 4452)". | repaired |
| F10 vacuous Checks | Lines 90–92 have the dimension and Witt Checks. Line 374 uses S={p,ℓ}, q=1, counts 10 and 8. "max(f" has 0 matches. | repaired (rows A8, A9, A16) |

## Verified sound

**Elaboration.** `lake env lean` on Suggested.lean, run from the content checkout at the pins (Mathlib 6b7abb3c, Tau Ceti a91d3aaf), exits 0 in 3.8 s. The only output is two `declaration uses 'sorry'` warnings, at 65:8 and 83:8. A scratch copy with `#check @name` for all four declarations prints types identical to the source signatures: every ring, module, nontriviality, rank and surjectivity binder is kept, and nothing changed. The file has a single `import Mathlib`, no `set_option`, no sorry'd data, `theorem` only and no `lemma`. Padding probe: `simp`, `rfl`, `infer_instance`, `aesop`, `exact?`, `trivial`, `tauto`, `decide` and `constructor <;> simp`, run on scratch copies of both theorems (18 probes), all fail. `exact?` suggests only the sorried theorem itself. R01 rests on the headline rule instead. A further scratch check proves `modulePullback f g = LinearMap.eqLocus …` with one library lemma.

**Headlines.** The end theorems are §5.1 (GK dimension f), §5.2 (π[𝔪²_{K₁}]), §5.3 (faithful flatness), §5.4 (Banach lifts), §5.5 (GK dimension of mod p cohomology) and §5.7 (big R = big T, complete intersection). None is statable at the pins: there is no quaternionic Shimura-curve cohomology, no patched module and no uniform analytic-group dimension interface. The module docstring already names each of them with the carrier it lacks.

**Dependency check.** Run exactly as the brief gives it, the output is:

```text
depcheck: 48 roadmaps, 551 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Every supplier is earlier in the merge order: this roadmap is 308, LocalGaloisDeformationRingsPartII 307, ModpRepresentationsOfGL2OverLocalFields 306, LocallyAnalyticDistributionsPartII 300, CompletedCohomologyPartII 207, AutomorphicGaloisRepresentations 185, HilbertModularVarietiesAndShimuraCurves 177, GL2AutomorphicRepresentationsAndTransfer 106, GlobalGaloisDeformations 91, PotentialAutomorphyInfrastructurePartII 90, LocalGaloisDeformationRings 89, DeformationAndDerivedPatchingAlgebra 73, FiniteFlatGroupsAndIntegralPadicHodgeTheory 56, NoncommutativeAndEquivariantIwasawa 32 and SmoothRepresentationsOfLocalGroups 27. PadicMeasuresIwasawaAlgebras and Chebotarev are on main.

**Declared gaps.** The four slugs (tame-types, single-type-rings, breuil-mezard-pbt, power-series-cancellation) appear identically, in the required form, in README lines 66–70 and 86 and in the `plan.json` top-level `gaps`. Each supplier is earlier in the order. The supplier sections exist:
- LocalGaloisDeformationRingsPartII design nodes T.0/tame-type, T.0/type-jordan-holder, T.4/weight-shape-bijection, T.6/single-presentation, single-components and special-fibres, and T.7/common-charts through p-membership. The design is accepted.
- DeformationAndDerivedPatchingAlgebra Layer 3. The supplier design's own request uses the label "R03.3".

The power-series-cancellation gap is precise and true. In HAM75 Theorem 4 (HAM75 line 101) R need only be quasi-local. The relative form follows because the proof's substitutions and quotient maps fix shared constants (HAM75 lines 103–117). The Witt correction is valid: the residue automorphism lifts coefficientwise, and Teichmüller lifts are unique. No roadmap on main, in an open pull request or among the board packages owns Hamann's theorem or GK14 Theorem A for general finite K. GL2ModularityLifting LL1, PadicLocalLanglandsForGL2Qp §5.10 and CompletedCohomologyAndLocalGlobalCompatibility Layer 5 treat only ℚ_p. So no gap asks for something already provided. R03 and R04 are the gap findings.

**Sources: the seeded sample.** All 15 sampled targets were checked at their locators in the cached texts. The README flags no locator as unverified.

| Target | Locators checked (cached text) | Outcome |
|---|---|---|
| 0.5 infinite level at v | BHHMS23 lines 4528–4549 ((66)–(68), p. 90), 5345–5388 ((83), proof of Cor. 8.4.6(i), pp. 106–107); DL21 lines 3065–3112 (§6.1, Thm 6.2, pp. 53–54) | supported. The graded pieces of (83) embed, since Hom_{G_F}(r̄,−) is only left exact. One Check is under-specified: R08 |
| 0.6 Gee–Kisin weight theorem | GK14 lines 105–115 (Thm A), 125–130 (Thm B), 1300–1304 (§5.3.1: definite or indefinite), 1573–1580 (Cor. 5.4.5, p. 33), 1605–1611 (Cor. 5.5.4, p. 34), 1673–1674 (Cor. 5.5.7, p. 35); BHHMS23 lines 4355–4361 ((61)); EGS15 lines 1832–1835 | supported |
| 0.7 doubling at w₁ | BHHMS23 lines 5389–5397 (Cor. 8.4.6(ii)), 5332 (definite "similar"); EGS15 lines 1686–1695 | supported |
| 1.2 R∞ | BHHMS23 lines 4422–4438 ((63), pp. 88–89); GK14 line 1220 (Rk 5.2.2) | supported |
| 1.4 patching functors | EGS15 lines 1583–1646 (Defs 6.1.1, 6.1.3, Lemma 6.1.4, minimality, pp. 32–34) | supported |
| 1.7 big patched module | BHHMS23 lines 5213–5223 (p. 104), 5251–5253 (p. 105), 5435–5444 ((84), p. 108); DL21 line 3111; CEGGPS16 line 1369 (p. 34) | supported |
| 2.1 grade, CM | GN22 lines 1955–2033 (Def. A.2 p. 42, Prop. A.4 and Def. A.5 p. 43, Rk A.6, Lemmas A.7–A.8 p. 44) | supported |
| 3.1 MCM | BHHMS23 lines 4587–4600 (Lemma 8.2.2, p. 91) | supported |
| 3.3 locally algebraic types | BHHMS23 lines 4662–4713 (Cor. 8.2.4, Rk 8.2.5, pp. 92–93); CEGGPS16 line 2533 (Lemma 4.17, p. 62) and Lemma 4.18 (pp. 63–64) | supported |
| 4.1 L_j, N_j | BHHMS23 lines 4797–4811 ((75), p. 95), 4938–4977 ((76), p. 99), 5066–5069 (τ₀, p. 101), 345–357 ((7)) | supported |
| 4.3 generation of M∞(R′_{2,j}) | BHHMS23 lines 4814–4842 (Lemma 8.3.2, p. 96) | supported (route matches: Prop. 7.4.3 = MP.9, Le19 Lemma 4.5, Lemma 8.3.1, Prop. 8.2.6) |
| 5.2 π[𝔪²_{K₁}] | BHHMS23 lines 5246–5282 (Thm 8.4.2, p. 105) | supported |
| 5.3 faithful flatness | BHHMS23 lines 5283–5291 (Thm 8.4.3, pp. 105–106); GN22 lines 2235–2245 | supported |
| 5.5 GK dimension of mod p cohomology | BHHMS23 lines 5311–5402 (Cor. 8.4.6, pp. 106–107), 5405–5408 (Rk 8.4.7, p. 108) | supported |
| 5.6 completed cohomology, big Hecke algebra | BHHMS23 lines 5409–5444 (§8.5, pp. 108–109) | supported |

I also re-read the repaired locators: GN22 lines 2160–2241 (A.19–A.29); HAM75 lines 85–125; EGS15 lines 680–688 (Prop. 3.5.1), 3175–3345 (§10.1 through Prop. 10.1.11); BHHMS23 lines 4404–4405, 4439–4461, 4560–4661, 5060–5080; STACKS lines 1544, 12602. The round-1 source issues I came across again stand: the support profiles of BHHMS23 Theorem 8.3.9 (BHHMS23 lines 5070–5073), Theorem 1.8 labelled "Corollary 8.3.9" (line 363), and EGS15's ψ versus ψ⁻¹ (BHHMS23 line 4445).

**Cross-roadmap citations resolved** (at the heads named in the brief; `roadmaps resolve` lists none missing):
- HilbertModularVarietiesAndShimuraCurves (893083d): §R18.3.15 read (arithmetic Frobenius, T ↦ tr, S ↦ q⁻¹det) and §R18.4.27 read (geometric Frobenius, X²−T_vX+q_vS_v, det ψε⁻¹).
- GL2AutomorphicRepresentationsAndTransfer (69bcab7): §§R17.3.1 and R17.3.10 read. No degree condition, d=1 allowed, parity retained.
- AutomorphicGaloisRepresentations (81e9d0f): §4.3 and §4.4 read (every π of type (k,w), every v∤ℓ, monodromy kept).
- DeformationAndDerivedPatchingAlgebra (a3b5dea): §§7.2–7.3 and 8.1–8.5 headings.
- CompletedCohomologyPartII (92dc4a1): §§F.1, 1.1–1.3, 2.4, 3.1, 3.2, 3.7, 5.5 (read), 8.4, 8.8, 8.10, 8.12–8.15.
- NoncommutativeAndEquivariantIwasawa (3ec4ff3): §§0.1–0.4, F.1 (line 396), 0.10, 0.11.
- Board designs: ModpRepresentationsOfGL2OverLocalFields, 19 MP nodes, all present. PotentialAutomorphyInfrastructurePartII PL.1/potentially-barsotti-tate-diagonalizable. LocallyAnalyticDistributionsPartII ND.6.

The heads of the remaining suppliers have not moved since round 1, so its resolution of 129 citations still holds.

**Library declarations at the pins** (re-opened): `IsLocalRing` RingTheory/LocalRing/Defs.lean:30 (extends `Nontrivial`); `IsRegularLocalRing` RingTheory/RegularLocalRing/Defs.lean:51; `Module.FaithfullyFlat` RingTheory/Flat/FaithfullyFlat/Basic.lean:63; `Module.support` RingTheory/Support.lean:47; `Module.annihilator` RingTheory/Ideal/Maps.lean:868; `Submodule.spanFinrank` Algebra/Module/SpanRank.lean:66; `LinearMap.eqLocus` Algebra/Module/Submodule/EqLocus.lean:45 and `LinearMap.eqLocus_eq_ker_sub` :102; `TauCeti.completedGroupAlgebra` TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145.

**Duplication and ownership by object.** I searched main and all 352 open heads (`roadmaps grep`), plus the board packages and designs. The objects searched were: power invariance; Breuil–Mézard multiplicities; BDJ and Serre-weight sets; the weight part of Serre's conjecture; Gee–Newton depth, CM and miracle flatness; quaternionic completed cohomology; patched modules; module fibre products. Findings:
- SerreWeightAndLevelOptimisation, AlgebraicModularFormsAndSerreWeights and CompletedCohomologyAndLocalGlobalCompatibility §§2.3–2.4 work over ℚ only.
- CompletedCohomologyAndLocalGlobalCompatibility §1.5 has D ramified at 𝔭 with a D_𝔭^× action. Its §1.6 assumes p splits completely, with levels at every place above p. This roadmap's §5.6 has p inert, a GL₂(F_v) action and the level varying at v. Neither statement contains the other, so §5.6 owns its specialisation.
- §2.6 is noncommutative; DeformationAndDerivedPatchingAlgebra §3.3's miracle flatness is commutative.
- The only Mathlib restatement found is `modulePullback` (R01).

**Adversarial pass.** One row for each repaired or sampled statement, each new finding and each Lean declaration. Rows for untouched text rely on round 1's table, all of whose rows carry computed values. Arithmetic is in 𝔽₂₉.

| # | Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|---|
| A1 | Conventions Hecke polynomial (l. 34, 240) | q=5, geometric eigenvalues 2,3 | S=5·6⁻¹=25, T=25·5=9; S⁻¹T=7·9=5=2+3, qS⁻¹=35≡6=2·3; inverted roots 15,10 | holds | none |
| A2 | §0.3 parent ideal on r̄⊗ω (l. 225, 238) | same | arithmetic eigenvalues 5·15=17, 5·10=21: T=38≡9, S=6·357≡25 = BDJ (9,25); r̄^∨⊗ω⁻¹: 12,18 ⇒ (1,20) | holds | none |
| A3 | §R18.4.27 geometric realization (l. 56, 231) | same; ψ_parent | parent geometric eigenvalues 17,21 (sum 9, product 9 = qS); dual⊗ε⁻¹: 5·17⁻¹=5·12≡2, 5·21⁻¹=5·18≡3; ψ_parent=(ω det r̄)⁻¹=ψ⁻¹, det ψ_parent⁻¹ε·ε⁻²=ψε⁻¹ | holds | none |
| A4 | §5.6 Galois–Hecke map (l. 1088, 1097) | T=9, S=25 | S⁻¹=7 (25·7=175≡1); trace 5, det 6 | holds | none |
| A5 | §0.7 Gram determinant (l. 328) | q=2, α/β=3, 2 | (2−3)(2−10)=8; via (q+1)²−S⁻¹T² with α=3, β=1: 9−32/3=−5/3≡−50≡8; ratio 2 gives 0 | holds | none |
| A6 | §0.7 transfer and parity (l. 324, 329) | cubic F, indefinite D | 2 ramified real places ⇒ even finite count; ratios q^{±1}=2,15 excluded, 3 allowed; R17.3.10 allows any d; AGR §4.4 covers every v∤ℓ | holds | none |
| A7 | §0.7 torus quotient | q=2; q≡1 | (q−1)²=1 prime to 29; q≡1 excluded by datum | holds | none |
| A8 | gap:power-series-cancellation (l. 86, 90–91) | ℤ_p⟦t⟧⟦x⟧ vs ℤ_p⟦x⟧; A⟦x⟧≅W⟦X₁,X₂⟧ | Krull dimensions 3 vs 2; 3 before, 2 after; HAM75 l. 117 maps are quotient/substitution | true, relative form true | R06 (wording) |
| A9 | Witt correction (l. 92) | 𝔽₉=𝔽₃[a]/(a²+1) | a³=a·a²=−a; [−a]=−[a] (p odd) | holds | none |
| A10 | §2.5 depth comparison (l. 661–672) | A=O⟦T⟧, B=O⟦T,y⟧; M=B, B/(y) | Ext^i_A(k,∏A) first ≠0 at i=2 ⇒ 2<3; B/(y): 2=2; GN22 A.28 for every B-module (l. 2230) | holds | none |
| A11 | §0.6 global nonvanishing (l. 303, 312) | μ tuples (1,1),(1,0) | product 1, 0 (GK14 l. 1568 μ′=∏μ_{σ_v}); Cor. 5.4.5 in both quaternionic cases (l. 1300) | holds | none |
| A12 | gap:breuil-mezard-pbt support clause (l. 70) | très ramifiée ρ/ℚ_p | W(ρ)={Sym^{p−1}} via §0.2 only; no crystalline lift of trivial Hodge type (no finite flat model) | not statable by supplier | R04 |
| A13 | gap:tame-types (l. 66) | GL₂(𝔽₂₉) irreducibles; nonsplit r̄_w | dims 1, 30, 28 in image, 29 (Steinberg) excluded; W(r̄_w)⊆W(r̄_w^ss) ⇒ isolation passes down; supplier imports W only from MP.3 (1-deep tame) | image clause true; W clauses not statable by supplier | R04 |
| A14 | gap:single-type-rings vs §3.2 (l. 68, 730–740) | EGS15 Ex. 10.1.3, f=2; f=1 | capped pair: (X′₁)+(X′₂)=I_{{J′max}}; non-interval pair: (X′₁,X′₂Y′₁)≠(X′₁,X′₂); f=1: (X′)≅R̄/(Y′) | identities needed, unowned; I_𝒥 defined twice | R03 |
| A15 | §3.2 I_𝒥 Checks (l. 745–747) | k⟦x,y⟧/(xy) | V(x): (x), quotient k⟦y⟧; union: (x)∩(y)=0; sum (x,y) gives k; empty: A, quotient 0 | holds | none |
| A16 | §1.2 counts (l. 374–378) | (f,\|S\|,q)=(1,2,1),(2,1,2) | 10/8, dims 11/9; 9/5, dims 10/6; (6)+(4)=10, (9)+(0)=9; parities: {ℓ,∞} and two real places even | holds | none |
| A17 | §1.3 type dimension (l. 408) | f=1, \|S\|=2, q=1 | 1+4+4+1−1=9=4·2+1 | holds | none |
| A18 | §1.5 scheme-theoretic support (l. 467, 476) | A=𝔽[ε]/ε² | ε·1=ε≠0 on A, 0 on A/(ε); one field point each; EGS15 l. 1832 | holds | none |
| A19 | §0.5 sample (l. 265–290) | χ(z)=2; r̄_v\|I=ω¹³⊕1, ω¹⁵⊕1 | χ⁻²=22, χ²=4; W(r̄_v^∨)={det¹⁵Sym¹², Sym¹⁴} resp. {Sym¹², det¹³Sym¹⁴} | statement holds; Check under-specified | R08 |
| A20 | §0.6 sample (l. 297) | f=1, two weights; p=5 | nonzero for 2 weights, 0 for a third; A₅ exception kept | holds | none |
| A21 | §0.7 sample (l. 318) | indefinite proved, definite "similar" | BHHMS23 l. 5332, 5389–5397 | holds | none |
| A22 | §1.2 sample (l. 349) | f=2 at v | 3+3f=9 variables; (63) total 4\|S\|+q−1+2f | holds | none |
| A23 | §1.4 sample (l. 417, 440) | A=O⟦X₁⟧, A⊕A/(X₁) | depth 1 < dim 2; zero functor rank 0 fails minimality | holds | none |
| A24 | §1.7 sample (l. 504) | f=1 | dim K₁/Z₁=3; π^∨ fibre; projective over S∞⟦K⟧_Z | holds | none |
| A25 | §2.1 sample (l. 551, 570–576) | Λ=O⟦ℤ_p⟧ | (j,δ): Λ (0,2), Λ/ϖ (1,1), Λ/T (1,1); Λ⊕Λ/ϖ Ext⁰,Ext¹≠0 | holds | none |
| A26 | §3.1 sample (l. 708, 718) | k⟦x,y⟧/(x) | depth 1 = support dimension 1 | holds | none |
| A27 | §3.3 sample (l. 753, 763) | multiplicities 1,2, r=2 | factor ranks 2, 4 | holds | none |
| A28 | §4.1 sample (l. 801, 825–829) | f=1,2; d=dim P | ranks d,4d; d,4d,7d=(1+3f)d at f=2; R′/pR dim d, R′/pR′ dim 3d | holds | none |
| A29 | §4.3 sample (l. 852, 862) | r=2 | residual fibre 2 ⇒ ≥2 generators; route gives ≤2 | holds | none |
| A30 | §5.2 sample (l. 1010) | r=2 | every constituent multiplicity 2 | holds | none |
| A31 | §5.3 sample (l. 1028, 1038) | f=1,2 | j_B=2f=3f−f: 2=2, 4=4; Frac(O)/ϖ=0 | holds | none |
| A32 | §5.5 sample (l. 1060, 1072) | regular C₂₉ | invariants dimension 1 of 29 | holds | none |
| A33 | §5.6 sample (l. 1078) | p inert | S_p={v}; definitions match BHHMS23 l. 5413–5436 | holds | none |
| A34 | §0.1 box (l. 163–168) | p=23, 29 | p−15=8<12; {12,13,14}, {13,14,15} | holds | none |
| A35 | §2.2 statement (l. 583, 603) | 𝔽₂[ε]/ε², N=(ε) | Ann(M/N)=(ε), Ann M=0, (ε)≅𝔽₂ ⇒ M≅A | true | R01 (Lean only) |
| A36 | §2.3 statement (l. 612, 632) | k⟦x,y⟧/(xy); k⟦t⟧ | (x)+(y)=Ann k, pullback A; 0+0≠(t), pullback A² | iff holds both ways | R01 (Lean only) |
| A37 | `FreeRankOnSupport` | M=0; k², r=1,2 | 0≅(A/⊤)^r every r; k²≇k, k²≅k² | discriminates | R01 (delete) |
| A38 | `modulePullback` | any f,g | equals `LinearMap.eqLocus (f∘fst) (g∘snd)`, checked in Lean | restates Mathlib | R01 |
| A39 | the two theorems | 18 one-tactic probes | all fail; `exact?` finds only the theorem itself | input lemmas, not headlines | R01 |
| A40 | Scope line 18 | two named roadmaps | 0 hits on main, 352 heads, board index, board main, merge order | cited roadmaps absent | R02 |

**Shape and house style.** The headings are upstream's, in order, and every layer ends with Examples and Dependencies. Every definition has an API list and at least three Checks: §§0.1–0.3, 0.5, 1.2–1.5, 1.7, 2.1–2.3 and 4.1, §3.2's new I_𝒥 (three Checks) and §5.6. There are no LaTeX delimiters and no process words (the scan's only hits were "pR" inside formulas), no pull-request numbers and no `GK.n` identifiers. Apart from R05, the numbering is consistent.

## Not verifiable

- The published versions (Invent. Math. 234 and 200, J. Inst. Math. Jussieu 21, Forum Math. Pi 2, Compos. Math. 157, Algebra Number Theory 13, Duke 155, Camb. J. Math. 4) are paywalled and were not fetched. Every locator was checked against the arXiv or author version recorded in sources.toml.
- Some works are cited only through the primary sources and are not in the manifest; they were not read: Kisin's condition (2.1.2), Darmon–Diamond–Taylor Lemma 4.11, Breuil–Diamond, Carayol Théorème 4, Hu–Wang Lemma 8.11, Breuil–Paškūnas Lemma 14.1, Gee–Liu–Savitt, BLGG13b §4, Breuil–Mézard Théorème 2.1.1.4 and Emerton–Gee–Herzig Proposition 2.4.1. R04's repair cites the Gee–Liu–Savitt comparison through GK14 §2.2 (p. 8); a fix that wants the primary statement must fetch it.
- ModpRepresentationsOfGL2OverLocalFields, LocalGaloisDeformationRingsPartII, PotentialAutomorphyInfrastructurePartII and LocallyAnalyticDistributionsPartII are board designs, not packages. I checked that the cited nodes exist and read T.0 and the supplier interfaces, but not their routes.
- No new source was fetched, so `needs-references.toml` was not written.

## Source issues

- **Misprint** in GK14 at Introduction, Theorem B, printed p. 3: the source says Theorem B is proved as Corollary 5.5.4; it should be Corollary 5.5.7, which is labelled Theorem B on p. 35 (5.5.4 is the version for a fixed D); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "58ffa23", "job": "REV-PKG-HilbertModularVarietiesAndShimuraCurvesPartII~2", "model": "opus", "worker": "fable-rev95"} -->
