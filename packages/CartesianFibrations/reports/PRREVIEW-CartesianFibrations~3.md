# Review of CartesianFibrations (pull request #2270 at a6d7928)
Folder: `TauCetiRoadmap/InfinityCategoryTheory/CartesianFibrations/`
**Verdict:** needs changes

Previous review (at 7e04598), finding by finding: R01 not repaired (R01 below; `Suggested.lean` lines 9, 11, 12 are unchanged); R02 not repaired (R02; the README names no roadmap outside the two families); R03 partly repaired: Kerodon and Ayala–Francis locators were added, the layers are unchanged (R03); R04 repaired (`NOTES.md` is gone, `stray-files=0`); R05 repaired in §1.3.1, §2.3.2 and §5.3.2, not in the `*Needs:*` line of §5.3.1 (R06); R06 repaired (lines 511, 519, 528, 577, 1050 cite §2.1.7, §2.1.2, §5.6.1 and §5.6.2, which state what is cited); R07 repaired for §3.2 and §5.5.1, with stale references left by the renumbering (R04) and a repeated Check (R08); R08 repaired (`Suggested.lean` lines 48 and 390–392).

## R01 (P1) — The gate still fails: `Suggested.lean` does not build at the pinned Tau Ceti

**Location** `Suggested.lean` lines 9, 11, 12 (imports) and 95, 144, 248, 320, 328, 370; `README.md` lines 49, 181–195 (`### From Tau Ceti`).
**Claim** Every imported module and every cited Tau Ceti declaration exists at the pin (`lake-manifest.json`, Tau Ceti 2fd255d).
**Witness** Gate: `imports=3`, `build=7`. Absent at the pin: `SSet.Edge.opEquiv`, `SSet.RightFibration`, `SSet.LeftFibration`, `SSet.QCat.IsCategoricalEquivalence`, `TauCeti.MarkedSSet.ofEdges`, `markedAnodyneExtensions`, `SSet.Edge.isEquivalence_iff_hornFilling_zero`, `SSet.rightFibration_pullbackObjObjπ`, `SSet.CategoricalFibration`.
**Repair** Replace the imports of lines 9, 11, 12 by `public import TauCeti.AlgebraicTopology.SimplicialSet.Marked.Basic`. Delete `Edge.IsCocartesian`, `isCategoricalEquivalence_pullback_map_of_fiber`, `rightFibration_iff_cartesianFibration`, `isCategoricalEquivalence_iff_qcat`, `natural` and `cartesianFibration_iff_rlp_markedAnodyneExtensions`, and name each in the module docstring as not statable at the pin, with the missing carrier. In the README drop the backticked claims for these six, and in `### From Tau Ceti` and line 49 state the nine absent declarations as what the roadmap needs in prose, not as declarations at the pin. Tested on this head: the file so changed elaborates at the pin, 41 declarations, 27 theorems, `sorry` the only warning.

## R02 (P2) — Objects owned by BordismFormalGroups §F6.5 on main are planned again without a citation

**Location** `README.md` §1.1.1, §1.7.2, §2.5.1, §3.1.2, §5.2.1, §5.7.1–5.7.2, §5.8.1, §5.8.3, §5.8.5; `## Scope and ownership` (lines 37–64) names no roadmap outside the two families.
**Claim** This roadmap owns coCartesian edges and fibrations, the mapping-space and fiberwise criteria, the marked anodyne generators and the Cartesian and coCartesian marked model structures over S with their fibrant objects and simplicial enrichment.
**Witness** Main, `TauCetiRoadmap/BordismFormalGroups/README.md` lines 1905–1916 and 1944–1972 plan each of these; `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` line 362 consumes them from there.
**Repair** In `## Scope and ownership` name BordismFormalGroups §F6.5, headings "Unmarked straightening and the categorical model" and "Marked fibrations and Kan extensions", as the owner of the listed objects; delete the targets it states and cite them by that roadmap and heading, keeping a variant only with one clause saying how it differs. The transfer of ownership the pull request description proposes is under `## For the human reviewers`.

## R03 (P2) — The layers still follow the table of contents of HTT §2.4–§3.3.1

**Location** `README.md`, the seven `## Layer` headings and their `###` sections (headings unchanged since 04df60e, the former §3.2 apart).
**Claim** The organisation is the roadmap's own, worked back from its end theorems.
**Witness** Layer 1 ↔ §2.4.1; Layer 2 ↔ §2.4.2–2.4.4; Layer 3 ↔ §2.4.5–2.4.6; Layer 4 ↔ §2.4.7; Layer 5 ↔ §3.1 (5.2–5.3 ↔ 3.1.1, 5.4 ↔ 3.1.2, 5.5–5.7 ↔ 3.1.3, 5.8 ↔ 3.1.4, 5.9 ↔ 3.1.5); Layer 6 ↔ §3.2.2; Layer 7 ↔ §3.3.1.
**Repair** The `*Needs:*` lines force only: §2.2.1 after §1.2.1 and §1.4.1; Layer 5 after §1.2–1.4, §1.6, §2.2–2.3, §2.5 and §3.3; §6.2.1 after §5.3.1; §7.1.1 after §6.3.2. Nothing in Layers 5–7 needs Layer 4, §2.4, §2.6, §2.7 or §3.1. Reorganise by what the five headline theorems need: (a) edge and fibration criteria (§1.1–1.6, §2.1–2.3, §2.6); (b) mapping spaces and fiberwise equivalences (§1.7, §2.5, §2.7, §3.1); (c) the marked model structure, its sections cut by what Layers 6–7 consume; (d) mapping simplices and base change (Layer 6, §7.1–7.2); (e) categorical fibrations, fiberwise criteria and sections (§3.2–3.3, §7.3–7.5); (f) bifibrations, arrow ∞-categories and functor fibrations (Layer 4, §7.6). The second sources this needs are now cited (Kerodon §5.1; Ayala–Francis); keep them.

## R04 (P3) — References to sections that the renumbering removed

**Location** `README.md` line 83: "they agree with Tau Ceti's `SSet.QCat.IsCategoricalEquivalence` by §3.4"; line 90: "§3.3 for lifts with prescribed target"; line 130: "having a homotopy inverse (§3.4)"; `Suggested.lean` line 32: "the comparisons of §3.4".
**Claim** §3.4 compares the forms of categorical equivalence and §3.3 states the prescribed-target form.
**Witness** `README.md` line 70: "The former §3.3 is now §3.2 and the former §3.4 is now §3.3"; Layer 3 ends at §3.3, and the prescribed-target form is §3.2.1 (line 594).
**Repair** Line 83: "by §3.3.2". Line 90: "§3.2 for lifts with prescribed target". Line 130: "(§3.3.2)". `Suggested.lean` line 32: "the comparisons of §3.3". Shorten lines 70–71 to "The former §3.3 is now §3.2 and the former §3.4 is now §3.3."

## R05 (P3) — ModelCategories §3.5.1 cited for homotopy pullbacks, which it does not define

**Location** `README.md` line 397: "Part ModelCategories §3.5.1 (HTT, §A.2.4, homotopy pullbacks)"; lines 1336–1337: "Part ModelCategories §3.5.1 (HTT, §A.2.4, homotopy pullbacks)".
**Claim** ModelCategories §3.5.1 supplies homotopy pullback squares to §1.7.2 and §7.3.4.
**Witness** ModelCategories `README.md` at the head of its pull request, line 664: §3.5.1 defines cofibrant resolutions of spans and homotopy pushout squares; line 712: §3.5.3 "Define homotopy pullback squares dually".
**Repair** Lines 397 and 1337: "Part ModelCategories §3.5.3 (HTT, §A.2.4, homotopy pullbacks)". Lines 1121 and 1158, which cite §3.5.1 for homotopy pushouts, stay.

## R06 (P3) — Two `*Needs:*` lines disagree with the text they close

**Location** `README.md` lines 818–819 and 830: "Degenerate edges are p-Cartesian for a Cartesian fibration over any base (§2.3.2)" under "*Needs:* … `SSet.CartesianFibration`; §2.2.1."; line 619: "*Needs:* Part InfinityCategoryFoundations §9.7.1 (HTT, Prop. 2.2.5.7), §9.7.2 (HTT, Prop. 2.2.5.8)."
**Claim** §5.3.1 needs only §2.2.1 beyond the library; the opening paragraph of §3.3 is a target with dependencies.
**Witness** §5.3.1 uses §2.3.2 in its own text and does not list it. Line 619 follows a paragraph that states no target; §3.3.1 and §3.3.2 list §9.7.1 themselves (lines 630, 641).
**Repair** Line 830: "*Needs:* `TauCeti.MarkedSSet`, `TauCeti.MarkedSSet.toSharp`, `SSet.Edge.IsCartesian`, `SSet.CartesianFibration`; §2.2.1; §2.3.2 (degenerate edges are Cartesian)." Delete line 619.

## R07 (P3) — Three consumed library declarations are missing from the supplier contracts

**Location** `README.md` lines 285–286, 315, 858: "Tau Ceti `SSet.slice.homEquiv`, `SSet.coslice.homEquiv`"; lines 1457, 1526: "Mathlib `LeftHomotopyRel.iff_map_eq`"; `### From Mathlib` (lines 134–164) and `### From Tau Ceti` (lines 166–200).
**Claim** The supplier contracts list every declaration consumed.
**Witness** Neither list names them. They exist at the pins: `TauCeti/AlgebraicTopology/SimplicialSet/Slice.lean` (line 38), `Coslice.lean` (line 35); `Mathlib/AlgebraicTopology/ModelCategory/FundamentalLemma.lean` line 129, in namespace `HomotopicalAlgebra`.
**Repair** Add to `### From Tau Ceti`: "`SSet.slice.homEquiv`, `SSet.coslice.homEquiv` (`TauCeti/AlgebraicTopology/SimplicialSet/Slice.lean`, `Coslice.lean`): maps into a slice or coslice are maps out of a join (HTT, Prop. 1.2.9.2)." Add to `### From Mathlib`: "`HomotopicalAlgebra.LeftHomotopyRel.iff_map_eq` (`AlgebraicTopology/ModelCategory/FundamentalLemma.lean`): maps from a cofibrant to a fibrant object are left homotopic exactly when equal in the homotopy category."

## R08 (P3) — The fourth Check of §5.5.2 tests §5.5.1 and repeats its Checks

**Location** `README.md` lines 903–905: "Over S = Δ[1], `Δ[1]^♯` and `Δ[1]^♭`, each with the identity to S, are two different objects, and the vertex inclusions `{0}^♭` and `{1}^♭` are not isomorphic over S".
**Claim** Each Check under §5.5.2 tests the mapping objects `Map^♭_S` and `Map^♯_S`.
**Witness** The bullet computes no mapping object; its three assertions are the three Checks of §5.5.1 (lines 869–876).
**Repair** Delete lines 903–905; §5.5.2 keeps three Checks that compute mapping objects.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.4 (HTT, Prop. 2.4.1.7, Rem. 2.4.1.9, pp. 135, 137) | HTT lines 5747, 5867; C = Δ[1] over Δ[0], 2-simplex (𝟙₀, ι, ι) | g = ι not an equivalence, hypothesis fails; with g = 𝟙: f Cartesian ⇔ h Cartesian, both ⇔ equivalence | Agrees | none |
| §1.6 (HTT, Def. 2.4.1.11, Rem. 2.4.1.12, p. 138) | HTT lines 5917, 5921; degenerate edge; X = Δ[1] over Δ[0] | Degenerate: pullback `X_s × Δ[1]`, edge (𝟙, ι) Cartesian. `0 ⟶ 1` over a point: not an equivalence, not local | Agrees | none |
| §2.1 (HTT, Rem. 2.4.2.2, p. 139) | HTT line 5959; E = ∅; `{1} ⊆ [1]` | ∅: both sides hold. `{1} ⊆ [1]`: no lift of 0 → 1, not fibered, not Cartesian | Agrees | none |
| §2.2 (HTT, Prop. 2.4.2.4, Cor. 2.4.2.5, p. 140) | HTT lines 5975, 6002; `{0} ⊆ Δ[1]`; Δ[1] → Δ[0] | `{0}`: right fibration, Cartesian, fiber Kan. Δ[1] → Δ[0]: Cartesian, fiber not Kan, not right | Agrees; `SSet.RightFibration` absent at pin | R01 |
| §2.3 (HTT, Lemma 2.4.2.7, Prop. 2.4.2.8, Cor. 2.4.2.10, pp. 141–143) | HTT lines 6032, 6085, 6126; poset P over [2] | Local lifts x₁→x₂, y₀→x₂, x₀→x₁; composite x₀→x₂ not local; source bound n ≤ 2 as in Lean | Agrees | none |
| §3.3, headline 1 (HTT, Prop. 1.2.7.3, p. 57; Props. 2.2.5.7–8, pp. 111–112) | HTT lines 2290, 4679, 4735; `∂Δ[1] ⊆ Δ[1]`, C = Δ[0] ⊔ Δ[0] | 2 objects against 4. HTT proves 2.2.5.8 from 1.2.7.3; the supplier's §9.7.2 uses its §9.5.6 instead, no cycle | Agrees | R04 |
| §4.2, `IsBifibration` (HTT, Def. 2.4.7.2, Lemma 2.4.7.5) | HTT lines 6791, 6830; T = Δ[0]; `{1}` over Δ[1] × Δ[0] and Δ[0] × Δ[1] | T = Δ[0]: left fibration (Rem. 2.4.7.4). `{1}`: bifibration in the first product, not the second | Agrees; Lean has S where HTT misprints T | none |
| §4.3 (HTT, Prop. 2.4.7.6, p. 158) | HTT line 6851 | q, q∘p bifibrations, homotopy equivalence on fibers over vertices of S × T; conclusion categorical equivalence | Agrees | none |
| §4.4 (HTT, Prop. 2.4.7.10, Cors. 2.4.7.11–12, pp. 160–161) | HTT lines 6928, 6961, 6964; C = Δ[1]; `evalVertex` at j = 0, 1 | `δ 1` hits vertex 0: source. Target first: (0,0)→(1,0) lifts to 00→01. Source first: no lift | README order right | none |
| §5.2 (HTT, Def. 3.1.1.1, Rems. 3.1.1.3–4, Prop. 3.1.1.5, pp. 165–166) | HTT lines 7122, 7143, 7148, 7151; family (2), n = 1 | Four families as in README; n = 1 gives `{1}^♯ ⊆ Δ[1]^♯`; (2′), (2″) inside the class of (1), (2) | Agrees; `markedAnodyneExtensions` absent at pin | R01 |
| §5.3 (HTT, Prop. 3.1.1.6, Cor. 3.1.1.7, Def. 3.1.1.8, Rem. 3.1.1.10, pp. 167–169) | HTT lines 7214, 7256, 7265, 7273; Δ[1] over Δ[0] and over Δ[1] | `Δ[1]^♭` against `Δ[1]^♯`; conditions (A)–(C) as in README | Agrees | R06 |
| §5.5 (HTT, Notation 3.1.0.2, §3.1.3, Rem. 3.1.3.1, Prop. 3.1.2.1) | HTT lines 7091, 7408, 7424, 7312; `{0}^♭`, `Δ[1]^♯` over Δ[1]; `Δ[1]^♯ → Δ[1]^♭` | `Map^♭_S = Δ[0]` against absolute Δ[1]; 2 marked maps against 3 monotone maps | Agrees | R08 |
| §5.6 (HTT, Lemma 3.1.3.2, Props. 3.1.3.3, 3.1.3.5, Rem. 3.1.3.4, Lemma 3.1.3.6, pp. 172–175) | HTT lines 7427, 7447, 7473, 7489, 7555; `Δ[1]^♭ → Δ[1]^♯`; `{0}^♯`, `{1}^♯` in `Δ[1]^♯` | `Map^♯` into `Δ[1]^♭`: 3 points against 2. Sections of `{0} ⊆ Δ[1]`: ∅ against Δ[0] | Agrees | none |
| §5.8 (HTT, Props. 3.1.4.1–2, Cors. 3.1.4.3–4, pp. 178–180; Example A.3.2.22, p. 882) | HTT lines 7715, 7748, 7762, 7771, 40217; `{0}^♯` over Δ[1] | Fibrant for Cartesian (`{0} ⊆ Δ[1]` Cartesian), not coCartesian (no lift of 0 → 1 from 0) | Agrees | R02 |
| §7.1, headline 2 (inner anodyne half) | `{0 < 2} ⊔ {1}` over Δ[2] | Non-fibration: 3 points over `Λ[2, 1]`, 2 components over Δ[2] | Agrees | none |
| §7.2, headline 2 (HTT, Prop. 3.3.1.3, p. 223) | HTT lines 9725, 6451; T' = S | Source: any S. README, Lean: `[S.Quasicategory]`, used only to make T₁′ an ∞-category | Agrees | none |
| §7.3, headline 3 (HTT, Prop. 3.3.1.5, Cor. 3.3.1.6, pp. 225–226; Lemma F) | HTT lines 9798, 9855; Lemma F over arbitrary C | X, Y bifibrant over C, `X × J` a cylinder over C, J-homotopies over C restrict to fibers: no hypothesis on C | Agrees | R05 |
| §7.4, headline 4 (HTT, Props. 3.3.1.7–8, pp. 227–228; Rem. 3.1.4.6, p. 180) | HTT lines 9892, 9952, 7801; X = ∅; `{0}`, `{1}` in Δ[1] | ∅: all three hold. `{0}`: Cartesian, not coCartesian. `{1}`: categorical, not Cartesian | Agrees | none |
| §7.5, headline 5 | X = Δ[0]; step t for arbitrary N | X = Δ[0]: Prop. 1.2.7.3 (3). `Map_X(W × J, N) ≅ Fun(J, Map_X(W, N))`, so `t*` is a J-homotopy equivalence | Agrees | none |
| §7.6 (HTT, Cors. 3.2.2.12–13, pp. 203, 205) | HTT lines 8821, 8899; Z = S | Hypotheses and edge description as in README; clause (2) of 3.2.2.13 names Z for T | Agrees | none |
| §3.2.1, `categoricalFibration_iff_…_lift_target` (HTT, Cor. 2.4.6.5, p. 155) | HTT line 6693; C = ∅; `{1} ⊆ Δ[1]`; `{0} ⟶ J` | ∅: both sides hold. `{1}`: both hold. J: 1 → 0 has no lift ending at 0 | Agrees | R04 |
| `Suggested.lean` at the pin | Scratch copy as in R01's repair, each `sorry` preceded by `rfl`, `infer_instance`, `simp` | 41 `#check` signatures, 27 `sorry` warnings, exit 0; none closes. Head imports: 3 bad imports | Fails at head | R01 |

- Source locators checked against the text: 44 HTT statements opened at their lines and read for hypotheses, 40 checked against the cited page, all agreeing; Kerodon tags 01T5 and 01UA opened (Def. 5.1.1.1, Def. 5.1.4.1).
- Library declarations opened at the pin: `SSet.Edge.IsCartesian`, `SSet.CartesianFibration` (`TauCeti/AlgebraicTopology/Quasicategory/Cartesian.lean` lines 65, 110), `isCartesian_of_isIso`, `IsCartesian.of_isPullback`, `IsCartesian.comp` (lines 82, 88, 98), `TauCeti.MarkedSSet.forget`, `flat`, `sharp`, `toSharp` (`Marked/Basic.lean` lines 125, 136, 204, 218), `SSet.slice.homEquiv`, `SSet.coslice.homEquiv`, Mathlib `ModelCategory.over` (`ModelCategory/Over.lean` line 143), `LeftHomotopyRel.iff_map_eq`.
- Cross-roadmap citations resolved at their heads: 45 target ids of InfinityCategoryFoundations, 10 of ModelCategories, 3 of KanQuillen, 7 of SimplicialCategories exist; 2 lines cite the wrong id (R05). The 13 sibling Parts cite §3.3.1 and §3.1.2 in the new numbering; none cites a removed id.
- Gate: `imports=3`, `build=7`, every other check 0 (R01). No change outside `TauCetiRoadmap/InfinityCategoryTheory/`.
- Dependency check: `depcheck: 261 roadmaps, 2595 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- `#check @name` for the 41 declarations that elaborate: binders equal the README statements; the file has no section variable. The five headline theorems are stated; the model structures, mapping simplices and §7.6 are named in the docstring. No declaration has the fully qualified name of one in another roadmap.
- Pull request text against the head: 20.3k words (20,363 counted), a new family, no existing roadmap edited, suppliers ModelCategoryTheory and DGAInfinity, the pin statement: no sentence contradicted for this folder.
- Overlap check: read KanQuillen, SimplicialCategories, EnrichedLocalization, ModelCategories, ModelCategoryTheory, BordismFormalGroups, StableHomotopyKTheory, EnhancedDerivedSheaves; coCartesian fibrations, the mapping-space and fiberwise criteria, marked anodyne maps and the Cartesian and coCartesian marked structures are shared with BordismFormalGroups §F6.5, the owner on main (R02); nothing shared with the others.

Source independence: 44 passages compared with 1 source (HTT; Kerodon's wording was not compared), none shared, longest common run 6 words; largest share HTT, 407 of 430 locators; contents compared with HTT: the layers follow §2.4.1–§3.3.1 (R03).

Research link: Layers 5–7 are the Cartesian model structure and the base-change and fiberwise theorems of Lurie, *Higher Topos Theory* (2009), §3.1–§3.3, which marked straightening (Part Straightening) and every later Part of the family consume; rests on the README's summary and HTT lines 7122–7801, 9725–9952.

## Not verifiable

- `SSet.QCat.IsCategoricalEquivalence`, `SSet.RightFibration`, `TauCeti.MarkedSSet.ofEdges`, `markedAnodyneExtensions`, `SSet.Edge.opEquiv`: absent at the pin, so the six declarations that use them were read but not elaborated.
- The description's sentence that all files elaborate against Tau Ceti 8b9f13d993: that commit is not the pin and was not built.
- Kerodon locators other than tags 01T5 and 01UA (Props. 5.1.1.9, 5.1.1.14, 5.1.2.1, 5.1.4.15, 5.1.5.9, Cors. 5.1.1.10, 5.1.2.4, 5.1.2.6, 5.1.4.16, 5.1.5.10–11, Defs. 5.1.3.1, 5.1.5.1, 4.5.4.1, 4.4.1.4, 4.5.6.5, Props. 4.5.4.8, 4.5.6.1, Ex. 5.1.4.2): not opened.
- Ayala–Francis, arXiv:1702.02681 (§4.1.1): not opened; it is cited without a section or statement number.
- Ownership against the open revision of GeneralizedCohomology named in the pull request description: its head was not among the files given.

## Source issues

- **Misprint** in HTT at Def. 2.4.7.2, second condition, PDF p. 158: the source says the S-projection sends the last edge to a degenerate edge of T; it should be a degenerate edge of S; affects nothing.
- **Error** in HTT at Prop. 2.4.7.10 and Cor. 2.4.7.11, PDF pp. 160–161: the source says the sections form a bifibration over C × D, source fiber first; it should be D × C, target first, as the case C = Δ[1] shows; affects a stated result.
- **Misprint** in HTT at Cor. 3.2.2.13 (2), PDF p. 205: the source says an edge of Z is r-coCartesian; it should be an edge of T; affects nothing.
- **Misprint** in HTT at Cor. 3.1.4.3, PDF p. 179: the source says the pushout is over A × B′, the target A′ × B′, and triviality follows from f or g; it should be over A × A′, target B × B′, and f or f′; affects nothing.

## For the human reviewers

- **Scope.** The pull request description proposes that this family become the owner of material BordismFormalGroups §F6.5 and EnhancedDerivedSheaves (both on main) plan, and says an open revision of GeneralizedCohomology conflicts; R02 records the facts.
- **Licence.** HTT was read from the author's page at math.ias.edu (the cached copy's header names that URL); Kerodon was read at kerodon.net.
- **Not tested.** The description says the build needs the Tau Ceti pin moved to 8b9f13d993 or later (pin: 2fd255d); moving the pin is outside the folder, and R01's repair is the alternative inside it.
