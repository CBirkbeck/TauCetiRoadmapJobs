# Mathematical repair report

The first eight finding sections refer to review pass a; the following four refer to review pass b. Repeated IDs keep their original spelling. Where the two passes overlap (a F04 with b F01, a F06 and a F08 with parts of b F02 and b F04), each matter is settled once, by the same edit, and each section says so. Only `packages/RefinedTraceMethods/README.md` and `packages/RefinedTraceMethods/sources.toml` changed; `Suggested.lean`, `metadata.toml` and the plan were not touched. No commit was made.

## F01 (P1) — applied

Layer 4 Examples: "1+aε maps under the relative Dennis trace to a dε" → d log(1+aε)=(1−aε)(a dε+ε da)=a dε+ε da in `Ω¹_{k[ε]/ℤ}`≅`HH_1(k[ε]/ℤ)`, image a dε in `Ω¹_{k[ε]/k}`. Added the witness k=ℚ(t), a=t, where ε dt≠0, and the control k=ℚ, where the term vanishes.

Evidence: §4.10 fixes the convention u ↦ [u⁻¹⊗u] = d log u in absolute `Ω¹_A`. ε dε=0 because 2ε dε=d(ε²)=0 and 2 is invertible. `Ω¹_{ℚ(t)[ε]/ℤ}` contains `ℚ(t)[ε]⊗Ω¹_{ℚ(t)/ℚ}` as a free summand, so ε⊗dt≠0. Searching the README for the same pattern found no other occurrence: line 1927, [t]↦t⁻¹dt over ℤ[t^{±1}], and the d log statement for `k[t]/(t^n)` are already absolute.

## F02 (P1) — applied

§6.2's construction target "Light condensed and solid spectra" is deleted. It is imported from SolidAnalyticRings §§1.1–1.5, 2.1–2.4 and 6.4 through a new supplier-contract bullet that replaces the VS2 bullet. §6.2 is retitled "Trace-class maps and nuclear solid modules". The Scope, proof-input, ordering and Layer 6 dependency paragraphs and five *Needs:* lines are repointed.

Evidence: SolidAnalyticRings README line 7 assigns exactly this block (discrete embedding, null-sequence definition, reflection, compact generator, bounded-below p-complete comparison with completed unit) to its §§1–2 and §6.4. Its line 823 records this roadmap as the consumer, and its §§1.1–1.4, 2.1–2.4 and 6.4 state every clause the deleted target had: δ fully faithful and symmetric monoidal (§1.2); solidity by 1−σ* (§1.4); limits, colimits, reflection and solid tensor (§2.2); `G≃∏_ℕδ𝕊` compact generator (§2.4); `e_p` fully faithful, `e_p(X)⊗^■e_p(Y)≃e_p((X⊗Y)^∧_p)`, unit `e_p(𝕊^∧_p)` and lax inclusion (§6.4). SolidAnalyticRings is line 148 of the merge order and this roadmap is line 218, so this is a downward edge.

The deleted target's Checks are covered by SolidAnalyticRings' own Checks (π₀=ℤ₂ against ℤ at p=2 in §6.4; N not solid in §1.4; δ𝕊 solid in §1.4). Its one perfect-even remark is already the third Check of §6.5's solid even filtration.

Light solid abelian groups are taken from SolidAnalyticRings §1.5, which owns the light theory; VS2.1 is compact-Hausdorff. With that, VStackSheavesAndLisseCategories is no longer cited. §6.5's solid even filtration and §6.7 now also name SolidAnalyticRings §6.4: Wagner Lemma 3.7 and the `ku^∧_p` Check use the p-complete comparison.

## F03 (P1) — applied

§6.10, framed trace pair, Check "for d = 0, `F_tr` is the h-adic filtration `h^{max(i,0)}qdR`" → completed filtration `h^{max(i,0)}S[[h]]` with F_tr its derived pullback. The Check now carries the witness A=ℚ, S=ℚ×ℚ, i=1: H⁰=hℚ[[h]], H¹=ℚ, against H¹(h·qdR)=0. In §6.14's route, "its filtration is the h-adic one" → completed h-adic, uncompleted pullback.

Evidence: the trace pair's own definition (F_tr is the pullback of F̂_tr along qdR→q-dR^∧). HabiroCohomologyFoundations §4.21 (README lines 1606–1617 at the supplied head) states the derived-pullback description and says that staticity concerns H, not the filtration steps. The rational pair Check of its §4.1 computes the same H⁰ and H¹. The same pattern also occurs in the supplier contract, which now records the §4.21 completed and pullback descriptions. The Habiro–Hodge conclusions H(S,F_tr)=H_{S/A} and π₀=H_{R/ℤ} are unchanged.

## F04 (P1) — applied

The stale HabiroRings labels and Lean names are replaced by prose contracts with section locators everywhere (README lines 15, 19, 62–64, the §6.1, §6.10, §6.13, §6.14 and §8.8 *Needs:* lines, the Layer 6 and 8 dependency paragraphs and Downstream consumers). The labels are HR.1, HR.2, HR.5, HR.6 and "§1.2". The names are `LambdaRing.IsPerfectlyCovered`, `habiroComplete.symmetricMonoidal`, `SpectralHabiroCompletion.tensor`, `SolidHabiroCompletion.*`, `HabiroRings.relativeHabiro.*`, `etale_localization_away_discr`, `QHodgeFiltration.ofUnderived` and `HabiroHodgeDescent.etale`.

The replacement owners are:
- QWittVectors §2.1 for the toric Λ-structure, and §2.4 for perfect coverage and torsion-freeness.
- HabiroCohomologyFoundations §0.1 for Habiro-complete modules and the completed tensor, §4.1 for the underived-to-derived pullback, §4.28 for the étale export and §5.15 for p-completely perfectly covered δ-bases.
- HabiroRings §§2.6–2.12, 5.1, 5.6, 5.8 and 5.9.

Evidence:
- At the supplied HabiroRings head, Layer 1 is §1.1 alone (README lines 349–380). Its line 1331 tells this roadmap to take perfect coverage from QWittVectors §§2.3–2.4 and the completed tensor from HabiroCohomologyFoundations §0.1.
- `roadmaps grep` finds none of the listed names at any open head or on main. The only HabiroRings Lean name nearby is `etale_localization_away_of_prime_dvd`, a radical variant this roadmap does not need.
- QWittVectors §2.4 (its line 445) gives the equivalent conditions, ℤ-torsion-freeness and toric stability.
- HabiroCohomologyFoundations §5.15 (its line 2010) defines p-completely perfectly covered δ-bases. These are the local base hypothesis of §6.1, which the old "HR.1 — perfectly covered" left unowned.

The HabiroRings §5.9 hypothesis "positive Δ" exposed a degenerate case in §6.14 and §8.8: Δ=0 is divisible by 6 and disc(F) but gives R=0. Both now require Δ>0.

## F05 (P3) — applied differently

Added three Checks to §2.5 (S=∗, BC₂, BT) and three to §2.13's Borel-complete genuine spectra (G=1; C₂ on Hℤ against the constant-Mackey Eilenberg–Mac Lane spectrum; the free object `Σ^∞_+C₂`). The §1.3 bullet that repeated the definition is replaced by the B=id versus B=0 mixed-complex Check, stated for every nonzero k.

Why differently: the proposed third Borel Check (C₃ on Hℚ versus Hℤ) does not test the definition, because both sides agree after rationalization. It is replaced by the free-object positive example, which tests the essential-image condition. Values are in the computed pass below. No Lean declaration was added. The other Check-less blocks found by the pattern search are theorem statements, not definitions.

## F06 (P3) — applied

§3.3: "supplied by tr-cartier-comparison" → "proved in §3.4 (TR as V-complete topological Cartier modules)". This is the same matter as the first slug in pass b F02 and is settled by this one edit. The target name is the bold target in §3.4. The predicate in §3.3 still assumes nothing from §3.4.

## F07 (P2) — applied

§2.5 (ii)–(iii): "such that `p_*`→`p^T_*` vanishes on compact objects; unique such that the fiber preserves colimits" → the functor `p^T_*` itself vanishes on compact objects, and among functors F under `p_*` that vanish on all compact objects it is the unique one whose fiber preserves colimits.

Evidence: ns lines 1218–1222 (Theorem I.4.1(ii)–(iii), Acta p. 235) require the functor, not the transformation, to vanish. Witness at S=∗: the zero transformation id→id vanishes on compact objects and has colimit-preserving fiber id⊕Ω id, but id(𝕊)=𝕊≠0. This witness is now the first §2.5 Check.

## F08 (P3) — applied

§2.6 edgewise subdivision: "Corollary B.5" → "Proposition B.5" (ns line 7077, Acta p. 384). This is the same matter as the first item of pass b F04. Pattern search found one more locator for this proposition: §1.8 cited it as "Acta pp. 383–384", now "Acta p. 384". The statement and proof lie between ns line 7077 (page header 384, line 7075) and the next page marker at ns line 7119.

## F01 (P2) — applied differently

This is the same matter as pass a F04 and is settled by that edit (the contracts, every listed *Needs:* line, line 3034, the Layer 6 and Layer 8 dependency paragraphs, line 19 and the consumers paragraph).

Why differently: the proposed text cites `ArithmeticLambdaRing.IsPerfectlyCovered` and `HabiroComplete.tensor`. Neither is declared, or even named, at the supplied heads of QWittVectors, HabiroCohomologyFoundations or HabiroRings, and `roadmaps grep` finds neither anywhere. The prose contract with section locators is used instead. HabiroCohomologyFoundations §5.15 is also added for the p-complete local base hypothesis that §6.1 states.

## F02 (P3) — applied differently

`Nuclear.not_all` → "the Check on `Null_R` above"; "square-zero-extensions" → "§4.14 (Connective bimodules and square-zero extensions)"; "Check the one-variable Check" (three places) → "the one-variable Check there"; the three "The input the … framed input" phrasings are fixed. `tr-cartier-comparison` is pass a F06.

Why differently: the four repeated "CompatibleSphericalLifts" sentences and the four repeated "CyclonicEvenHypotheses" sentences are each stated once, before their bullet lists. The second one names the §6.11 A₂ morphism, the §6.1 lifts and the Wagner 5.46 evenness hypotheses. It restricts "2 invertible" to the Theorem 5.63 comparison: w line 3557 assumes 2∈R× there, while Lemma 5.61 (w line 3541) does not.

## F03 (P3) — applied

"### 1.11 Derived HKR, circle tensors and a nonflat example" → "### 1.10 …". All seven "§1.11 (" cross-references → "§1.10 (". The two `cited_for` entries in `sources.toml` were changed to match. No other numbering gap remains in any layer (checked mechanically).

## F04 (P3) — applied differently

Applied:
- "Corollary B.5" → "Proposition B.5" (see pass a F08).
- Thesis PDF pages 234→242, 241→249 and 229→237. The printed numerals 220, 225 and 232 end PDF pages 237, 242 and 249 (d-thesis lines 9589, 9802, 10065). Theorem 1.2.2 at PDF p. 24 is correct (d-thesis line 886 shows printed 15 on PDF page 24).
- The garbled thesis locator in `sources.toml` is rewritten with the correct values.

Disputed: the BMS locator "Corollaries 6.9–6.10, pp. 253–254" is correct.
- Corollary 6.9 is at bms line 2127, after the page-55 marker whose running head (bms line 2121) is printed p. 253.
- Corollary 6.10 starts at bms line 2147 on the same page, and its proof ends on printed p. 254 (running head at bms line 2159).
- The review's own offset, printed = PDF + 198, also gives 55+198 = 253.
No change.

## Checks run

- Elaboration: `lake env lean packages/RefinedTraceMethods/Suggested.lean`, run from the content checkout, exited 0 with no output. The file is unchanged: it declares nothing, so there are no `sorry` warnings.
- `#check @name` audit: `Suggested.lean` has no declarations, so the scratch file of `#check` lines is empty. No section variable can be lost, and no Lean name changed.
- Dependency check (the command in the brief):

  ```text
  depcheck: 34 roadmaps, 328 edges, 0 problem(s)
  ```

  It printed no UPWARD, CYCLE or moved line. The new suppliers SolidAnalyticRings (merge-order line 148), QWittVectors (83) and HabiroCohomologyFoundations (209) all precede this roadmap (218).
- Citation resolver on the edited README: no cross-roadmap citation and no Lean name found nowhere.
- Full gate on a scratch copy in content-repository layout:
  - Every content counter is 0 (latex, tex, residue, readme-ids-missing, depcheck, round-labels and the rest).
  - One "tex" hit on a new §2.5 Check (`Σ(Hℤ_{hT})` outside a code span) was fixed by putting the expression in a code span.
  - The only remaining failure is "git", because the scratch copy is not a git repository; it does not apply to the package.
- `sources.toml` parses as TOML.

## Gate failures

None were listed for this round.

## Ownership and citations

- Ownership against the supplied open roadmap folders was checked by object for every construction changed here. Light solid spectra belong to SolidAnalyticRings and are now imported. Perfect coverage belongs to QWittVectors, the Habiro-complete tensor to HabiroCohomologyFoundations §0.1, and spherical and solid Habiro completion to HabiroRings §§2.6–2.12.
- No construction moved down from a later roadmap.
- Every cross-roadmap citation that changed was checked at the head this brief supplies. That covers SolidAnalyticRings §§1.1–1.5, 2.1–2.4, 6.4; QWittVectors §§2.1, 2.4; HabiroCohomologyFoundations §§0.1, 4.1, 4.21, 4.28, 5.15; and HabiroRings §§2.6–2.12, 5.1, 5.6, 5.8, 5.9.
- The AInfCohomology and PrismaticCohomologyPartIII Lean names that the earlier resolver run listed exist at those roadmaps' heads (AInfCohomology README lines 3831–3834; PrismaticCohomologyPartIII §7.0 API lines 878 and 918), so they were not changed.
- No new source was needed and `needs-references.toml` was not written.

## Computed adversarial pass

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Dennis image of 1+aε (Layer 4 Examples) | k=ℚ(t), a=t; k=ℚ; a=0; product (1+aε)(1+bε) | t dε+ε dt with ε dt≠0; a dε; 0; (a+b)dε+ε d(a+b), additive | old text false for transcendental a | restated; witness and control added |
| Light solid spectra (imported) | p=2 unit; N at the point | π₀ e₂(𝕊^∧₂)(∗)=ℤ₂ against ℤ; π₀ N(∗)=⊕_ℕℤ against π₀ G(∗)=∏_ℕℤ | supplier statements match the deleted target clause by clause | target deleted, contract added |
| d=0 trace pair | A=ℚ, S=ℚ×ℚ, i=0,1,2; S=A=ℚ | i=0: qdR; i=1: H⁰=hℚ[[h]], H¹=ℚ; i=2: H⁰=h²ℚ[[h]], H¹=ℚ²; S=A: pullback is h^iℚ[[h]] | h-adic only when qdR→qΩ is an equivalence | Check restated |
| §6.14 route | F=ℚ(i) or any F≠ℚ | `qdR_{R/ℤ}⊗ℚ` has dR_{F/ℚ}=ℚ while `qΩ⊗ℚ`=F[[h]] | uncompleted filtration not h-adic | route restated |
| Δ in §6.14 and §8.8 | Δ=0, 6, −6 | Δ=0: R=0; Δ=6, F=ℚ: R=ℤ[1/6]; −6 gives the same ring as 6 | Δ=0 admitted by "divisible by 6" | Δ>0 added |
| Tate uniqueness (ii)–(iii) | S=∗; BC₂; BT | S=∗: p^T=0, competitor id has id(𝕊)=𝕊≠0; BC₂: Tate kills induced C₂₊⊗X; BT: (Σ^∞_+T)^{tT}=0 | old (ii)–(iii) admit two answers at S=∗ | restated |
| §2.5 Check BC₂ | Hℤ trivial | π₀ norm ×2 on ℤ; π₀ Tate ℤ/2; π₋₁=Ĥ¹=0; π₋₂=Ĥ²=ℤ/2 | consistent with πᵢ=Ĥ⁻ⁱ and unshifted finite norms | added |
| §2.5 Check BT | Hℤ trivial | D=Σ𝕊; π_n ΣHℤ_{hT}=H_{n−1}(BT)=ℤ for n=1,3,5,…, 0 for n=0 | matches Conventions' circle norm | added |
| §2.13 Borel Checks | G=1; C₂ on Hℤ; C₂ on Σ^∞_+C₂ | id; π₀=ℤ, π₋₂=ℤ/2 against constant Mackey π₋₂=0; fixed points 𝕊=𝕊 (tom Dieck: only H=e contributes) | negative and positive examples separate | added |
| §1.3 Check | k≠0, B=id against B=0 | CN₁=M₁, CN₀=M₀→CN₋₁=M₁u iso: HC⁻₁=k, HC⁻₀=0; B=0: HC⁻₀=k | equal b-homology, different HC⁻ | replaced circular Check |
| §6.12 inputs | Lemma 5.61, Theorem 5.63 | w line 3541: no 2∈R×; w line 3557: 2∈R× | 2 needed only for the comparison | narrowed |
| QWittVectors §2.4 contract | zero ring; ℤ[T]; ℤ[ε]/ε² with ψ_n(ε)=nε | zero ring allowed, torsion free; ψ₂ finite free with basis 1,T; torsion free but ψ₂ not flat | one-way implication only, as stated | contract wording |
| HabiroRings §5.6 contract | A=R=ℤ, A′=ℤ[t] flat | Σ P_n(q)tⁿ lies in H_{A′/A′} but not in H[t] | completion kept for flat A′ | stated |
| Locators | NS B.5; d-thesis; BMS 6.9–6.10 | ns 7077 on p. 384; PDF 237/242/249 ↔ printed 220/225/232; bms 2127, 2147 on p. 253, proof to p. 254 | B.5 and thesis wrong; BMS right | B.5 and thesis fixed |
| Numbering | Layer 1 | 1.9→1.11 gap; seven references | gap removed | renumbered |

## Notes for the maintainer

- Section and target names changed in this roadmap: §6.2 is now "Trace-class maps and nuclear solid modules"; the target "Light condensed and solid spectra" is deleted; §1.11 is now §1.10. No other roadmap's README cites any of them (`roadmaps grep`).
- SolidAnalyticRings' consumer note (its line 823) already describes this import. The bounded-below comparison in its §6.4 passes to arbitrary coproducts only through that roadmap's cardinal-interchange gap. The contract records this as a condition inherited from the supplier, not as a gap of this roadmap.
- HabiroRings §5.9 states its ring equivalence for positive Δ, and §5.8 states étaleness for nonzero Δ. The contract keeps both as stated.
