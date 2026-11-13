# Review of CartesianFibrations (pull request #2270 at 04df60e)
Folder: `TauCetiRoadmap/InfinityCategoryTheory/CartesianFibrations/`
**Verdict:** needs changes

## R01 (P1) — The gate fails: `Suggested.lean` does not build at the pinned Tau Ceti

**Location** `TauCetiRoadmap/InfinityCategoryTheory/CartesianFibrations/Suggested.lean` lines 9, 11, 12 (imports), 92, 147, 251, 323, 331; `README.md` lines 174–188 (`### From Tau Ceti`).
**Claim** Every imported module and every cited Tau Ceti declaration exists at the pin (`lake-manifest.json`, Tau Ceti 2fd255d); the README says "Nothing is assumed of these beyond their statements at the pin".
**Witness** Gate: `imports=3`, `build=7`. With the three imports removed, elaboration at the pin still fails on `SSet.Edge.opEquiv`, `RightFibration`, `SSet.QCat.IsCategoricalEquivalence`, `TauCeti.MarkedSSet.ofEdges`, `TauCeti.MarkedSSet.markedAnodyneExtensions`.
**Repair** State the file against the pin. Remove the imports of lines 9, 11, 12. Delete `Edge.IsCocartesian` (and `isCategoricalEquivalence_pullback_map_of_fiber`, which uses it), `rightFibration_iff_cartesianFibration`, `isCategoricalEquivalence_iff_qcat`, `natural` and `cartesianFibration_iff_rlp_markedAnodyneExtensions`, and name each in the module docstring as not statable at the pin with the missing carrier. In the README, drop the backticked claims for these five, and in `### From Tau Ceti` cite only what the pin has: `SSet.Edge.opEquiv`, `SSet.Edge.isEquivalence_iff_hornFilling_zero`, `SSet.QCat.IsCategoricalEquivalence`, `SSet.RightFibration`, `SSet.LeftFibration`, `SSet.rightFibration_pullbackObjObjπ`, `TauCeti.MarkedSSet.ofEdges` and `TauCeti.MarkedSSet.markedAnodyneExtensions` are absent there and become README targets or prose. Tested: the remaining declarations elaborate at the pin with `sorry` the only warning.

## R02 (P1) — `Edge.isCartesian_id` is false for inner fibrations of arbitrary simplicial sets

**Location** `Suggested.lean` lines 113–117; `README.md` lines 284–285: "every degenerate edge is p-Cartesian … and so for every inner fibration `p : X ⟶ S`"; `Suggested.lean` line 321: "which are `p`-Cartesian when `p` is an inner fibration".
**Claim** For every inner fibration `p : X ⟶ S` and vertex x, `Edge.id x` is p-Cartesian.
**Witness** S = Δ[2] with the edge 1→2 collapsed to a vertex s; X ⊆ S the image of the edge 0→2. Its pullback to Δ[2] is `Λ[2, 2] ⊆ Δ[2]`, where `Edge.id s` becomes 1→2; 0→2 does not factor through 1.
**Repair** Delete `Edge.isCartesian_id` from `Suggested.lean` (HTT, Cor. 2.4.1.6, HTT line 5743, is for ∞-categories, where it is one step from `Edge.isEquivalence_iff_isCartesian`). README §1.3.1: "In particular, for an inner fibration of ∞-categories every degenerate edge is p-Cartesian (HTT, Cor. 2.4.1.6, p. 135). For a Cartesian fibration over any base the same holds: a degenerate edge is locally Cartesian (§1.6, second Check) and locally Cartesian edges of a Cartesian fibration are Cartesian (§2.3.2)." Add the witness as a Check of §1.3; cite §2.3.2 instead of §1.3 at README line 802; drop the parenthesis in the docstring of `natural`.

## R03 (P2) — Objects already owned by BordismFormalGroups §F6.5 on main are planned again without a citation

**Location** `README.md` §1.1.1, §1.7.2, §2.5.1, §3.1.2, §5.2.1, §5.7.1–5.7.2, §5.8.1, §5.8.3, §5.8.5, §7.4.2; `## Scope and ownership` (lines 37–64) names no roadmap outside the family.
**Claim** This roadmap owns coCartesian edges and fibrations, the mapping-space and fiberwise criteria, slice invariance, marked anodyne generators and the Cartesian and coCartesian marked model structures over S.
**Witness** Main, `TauCetiRoadmap/BordismFormalGroups/README.md` lines 1905–1916 and 1944–1972 ("Unmarked straightening and the categorical model", "Marked fibrations and Kan extensions") plan each of these; `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` line 362 consumes them from there.
**Repair** In `## Scope and ownership` add BordismFormalGroups §F6.5, under those two headings, as the owner of the listed objects; delete the targets it states (the definition of §1.1.1, the criteria of §1.7.2 and §2.5.1, §3.1.2, the generators of §5.2, the structures of §5.7 with their fibrant objects and simplicial enrichment in §5.8, the Kan-base clause of §7.4.2) and cite them by that roadmap and heading, keeping a variant only with one clause saying how it differs. A roadmap on main is earlier than this one; the transfer of ownership proposed in the pull request description is under `## For the human reviewers`.

## R04 (P2) — The layers follow the table of contents of HTT §2.4–§3.3.1

**Location** `README.md`, the seven `## Layer` headings and their `###` sections.
**Claim** The organisation is the roadmap's own, worked back from its end theorems.
**Witness** Layer 1 ↔ §2.4.1; Layer 2 ↔ §2.4.2–2.4.4; Layer 3 ↔ §2.4.5–2.4.6; Layer 4 ↔ §2.4.7; Layer 5 ↔ §3.1 (5.2–5.3 ↔ 3.1.1, 5.4 ↔ 3.1.2, 5.5–5.7 ↔ 3.1.3, 5.8 ↔ 3.1.4, 5.9 ↔ 3.1.5); Layer 6 ↔ §3.2.2; Layer 7 ↔ §3.3.1. HTT: 393 of 395 locators.
**Repair** The `*Needs:*` lines force only: §2.2.1 after §1.2.1 and §1.4.1; Layer 5 after §1.2–1.4, §2.2 and §3.4; §6.2.1 after §5.3.1; §7.1.1 after §6.3.2. Nothing in Layers 5–7 needs Layer 4, §2.4, §2.6, §2.7, §3.1 or §3.2. Reorganise by what the five headline theorems need: (a) one layer of edge and fibration criteria (§1.1–1.6, §2.1–2.3, §2.6); (b) mapping spaces and fiberwise equivalences (§1.7, §2.5, §2.7, §3.1); (c) the marked model structure, with its sections cut by what §6–§7 consume, not by §3.1.1–3.1.5; (d) mapping simplices and base change (Layer 6, §7.1–7.2); (e) categorical fibrations, fiberwise criteria and sections (§3.3–3.4, §7.3–7.5); (f) a final layer of bifibrations, arrow ∞-categories and functor fibrations (Layer 4, §7.6). Cite further sources for the main results: Kerodon, Def. 5.1.4.1 (tag 01UA), Prop. 5.1.4.8 (tag 023J), Cor. 5.1.4.11 (tag 023K), Prop. 5.1.4.15 (tag 01UM), Thm. 5.2.1.1 (tag 01VG, for §5.5.3) and Prop. 4.5.4.8 (tag 01EF); and Ayala–Francis, *Fibrations of ∞-categories*, arXiv:1702.02681, for correspondences (§4.1).

## R05 (P3) — Lemma F carries a hypothesis its own route does not use

**Location** `README.md` line 1251: "Prove that for an ∞-category C and a map `f : X ⟶ Y` over C between categorical fibrations"; `Suggested.lean` line 396, `[C.Quasicategory]`.
**Claim** The base C must be an ∞-category.
**Witness** The route of §7.3.2 uses only that X and Y are fibrant in the Joyal structure over C and that `− × J` is a cylinder over C; both hold for every simplicial set C.
**Repair** State §7.3.2 for every simplicial set C and delete `[C.Quasicategory]` from `isCategoricalEquivalence_fiber_of_categoricalFibration`; §7.3.3 keeps its ∞-category hypothesis, which it uses to make p and q categorical fibrations.

## R06 (P3) — Supplier targets cited for statements they do not make

**Location** `README.md` lines 277, 303, 841: "Part InfinityCategoryFoundations … §4.1.1 (HTT, Prop. 1.2.9.2)"; lines 486, 495, 505: "§2.1.6 (HTT, Def. 1.1.5.14; Def. 1.2.10.1, full faithfulness)"; line 554: "§2.1.8 (… the opposite comparison)"; line 1199.
**Claim** InfinityCategoryFoundations §4.1.1 states the universal property of slices, §2.1.6 defines full faithfulness, and §2.1.8 and §2.1.6 state the opposite comparison.
**Witness** `TauCetiRoadmap/InfinityCategoryTheory/InfinityCategoryFoundations/README.md` line 1053: §4.1.1 is the pushout-join lemmas (HTT, Lemmas 2.1.2.3–2.1.2.4); line 723: full faithfulness is §2.1.8; line 633: the opposite comparison is §2.1.2; HTT, Prop. 1.2.9.2 is in the preamble of §4.1 (line 1049).
**Repair** Lines 277, 303, 841: "Tau Ceti `SSet.slice.homEquiv` (HTT, Prop. 1.2.9.2)" and, where the pushout-join is used, "§4.1.1 (HTT, Lemma 2.1.2.3)". Lines 486, 495, 505: "§2.1.6 (HTT, Def. 1.1.5.14) and §2.1.8 (HTT, Def. 1.2.10.1, full faithfulness)". Line 554: "§2.1.8 (HTT, Def. 1.2.10.1) and §2.1.2 (HTT, §5.1.3, the opposite comparison)". Line 1199: "§2.1.6 (HTT, Def. 1.1.5.14) and §2.1.2 (the opposite comparison)".

## R07 (P3) — A section without a target, and a process word

**Location** `README.md` §3.2 (lines 564–571): "this Part cites them there. No other section of this Part uses them."; line 623: "(manual, from HTT Prop. 2.2.5.7 via …"; `Suggested.lean` line 47: "statable but not stated here", inside the list "Not statable at the pins".
**Claim** Every section holds a target, and the text is timeless.
**Witness** §3.2 states nothing and has a `*Needs:*` line for no target; the lemmas are InfinityCategoryFoundations §9.5.2, already listed under `## Scope and ownership` (line 53). "manual" names no source.
**Repair** Delete §3.2 (the deferral at line 53 stays) and renumber §3.3–3.4 with an old → new sentence, since Part Straightening cites this roadmap's sections. Line 623: "(from HTT, Prop. 2.2.5.7, through Part InfinityCategoryFoundations §9.7, and HTT, §A.2.2, p. 830; …". In the docstring, move the bullet out of the "Not statable" list under its own lead "Statable, not headline statements:".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.3 (HTT, Prop. 2.4.1.5, Cor. 2.4.1.6) | HTT lines 5731, 5743; X = image of 0→2 in Δ[2]/Δ^{1,2} | Source: ∞-categories only. Horn (s₀s, 0→2) over the 2-simplex: no filler | False as extended | R02 |
| §1.5 (HTT, p. 136; Prop. 2.4.1.8) | HTT lines 5794–5796; poset a < b > a′ over [1] | a→b: unique target over 1, coCartesian; a′→b does not factor through a, not Cartesian | Agrees | none |
| §2.3 (Def. 2.4.2.6, Lemma 2.4.2.7, Prop. 2.4.2.8, Cor. 2.4.2.10) | HTT lines 6022, 6032, 6085, 6126; poset P over [2] | Local lifts x₁→x₂, y₀→x₂, x₀→x₁ exist; composite x₀→x₂ not local (y₀ ≰ x₀); n ≤ 2 in source | Agrees | none |
| §2.4 (Prop. 2.4.3.2) | HTT line 6286 | coCartesian p, any `q : K ⟶ C`; both clauses as in README | Agrees | none |
| §2.5 (Cors. 2.4.4.4–2.4.4.6) | HTT lines 6451, 6463, 6472 | Hypotheses equal README and Lean binders (three ∞-categories; q, p ≫ q locally Cartesian) | Agrees | none |
| §3.4, headline 1 (Prop. 1.2.7.3 (2), (3); 2.2.5.7; 2.2.5.8) | HTT lines 2290, 4679, 4735; `∂Δ[1] ⊆ Δ[1]`, C = Δ[0] ⊔ Δ[0] | `h Fun`: 2 objects against 4, both discrete: not an equivalence | Agrees | none |
| §4.2 (Def. 2.4.7.2, Lemma 2.4.7.5) | HTT lines 6791, 6830; T = Δ[0]; diagonal of J | Left fibration (Rem. 2.4.7.4); (0,0)→(1,0) has no lift from 0 | Agrees; README corrects a source misprint | none |
| §4.3 (Prop. 2.4.7.6) | HTT line 6851 | q and q∘p bifibrations, fiberwise homotopy equivalence; conclusion categorical equivalence | Agrees | none |
| §4.4 (Prop. 2.4.7.10, Cors. 2.4.7.11–12) | HTT lines 6928, 6961, 6964; C = Δ[1], n = 1 | Proof fills `Λ[n, 0]` with source component degenerate, so T = source: target first. (0,0)→(1,0) lifts to 00→01; (1,0)→(1,1) to 01→11 | README order right, source order wrong | none |
| §5.3 (Def. 3.1.1.8, Prop. 3.1.1.6, Rem. 3.1.1.10, Cor. 3.1.1.7) | HTT lines 7265, 7214, 7273, 7256; Δ[1] over Δ[0] and over itself | Marked edges: degenerate only (♭); all (♯). `natural` iff: (B) forces degenerate edges Cartesian | Agrees; one clause false | R02 |
| §5.4 (Prop. 3.1.2.3, Prop. 3.1.1.11) | HTT lines 7327, 7278 | Marked anodyne against cofibration; inner fibration p, q carries marked edges to Cartesian edges | Agrees | none |
| §5.7 (Prop. 3.1.3.7, Rems. 3.1.3.9, 3.1.4.6) | HTT lines 7572, 7698, 7801; S = Δ[1], Z = {0} | `{1}^♯ ⊆ Δ[1]^♯` is generator (2), n = 1; marked sections of Z over Δ[1]: ∅ against Δ[0] from `{0}^♯` | Agrees | none |
| §7.2, headline 2 (Prop. 3.3.1.3) | HTT line 9725; {0 < 2} ⊔ {1} over Δ[2] | Source: any S; README and Lean: ∞-category S, same binders. Non-fibration: 3 points against 2 components | Agrees | none |
| §7.3, headline 3 (Prop. 3.3.1.5, Cor. 3.3.1.6, Cor. 4.2.1.7) | HTT lines 9798, 9855, 11452; Lemma F over arbitrary C | Fibrant over C and cylinder `X × J` need no hypothesis on C | Agrees; hypothesis unused | R05 |
| §7.4, headline 4 (Props. 3.3.1.7, 3.3.1.8) | HTT lines 9892, 9952; X = ∅; {0}, {1} ⊆ Δ[1] | ∅: all three hold. {0}: Cartesian, not coCartesian. {1}: categorical, not Cartesian | Agrees | none |
| §7.5, headline 5 | X = Δ[0], N = C; step t | Reduces to Prop. 1.2.7.3 (3). (φ, j) ↦ φ ∘ (H(−, j), 𝟙) is over X since H is over B | Agrees | none |
| Conventions, Joyal against Kan–Quillen | `Λ[2, 0] ⊆ Δ[2]`, C = Δ[1] | Posets with 4 and 5 elements | Agrees | none |
| `Suggested.lean` at the pin | Scratch copy without lines 9, 11, 12 | 5 unknown constants; all other declarations elaborate | Fails | R01 |

- Source locators checked against the text: 97 paged HTT locators, all on the cited page; 31 statements read for hypotheses; Kerodon, Prop. 4.5.4.8 (tag 01EF) opened.
- Library declarations opened at the pin: `SSet.Edge.IsCartesian`, `IsCartesian.of_isPullback`, `IsCartesian.comp`, `SSet.CartesianFibration` (`TauCeti/AlgebraicTopology/Quasicategory/Cartesian.lean` lines 62–110), `SSet.Edge.IsEquivalence` (`Core.lean` line 71), `TauCeti.MarkedSSet.forget`, `toSharp`, Mathlib `SSet.Edge.CompStruct`, `stdSimplex.edge`, `Functor.IsFibered`.
- Cross-roadmap citations resolved: 43 target ids of InfinityCategoryFoundations, 12 of ModelCategories, 4 of KanQuillen, 6 of SimplicialCategories exist at their heads; 8 lines cite the wrong id (R06).
- Gate: `imports=3`, `build=7`, every other check 0 (R01). No change outside `TauCetiRoadmap/InfinityCategoryTheory/`.
- Dependency check: `depcheck: 223 roadmaps, 1972 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- One-tactic probe (`rfl`, `simp`, `infer_instance`) on the 32 sorried theorems: none closes. The five headline theorems of the README are stated; the model structures, mapping simplices and §7.6 are named in the docstring as not statable.
- Overlap check: read BordismFormalGroups, EnhancedDerivedSheaves, KanQuillen, SimplicialCategories, ModelCategories; coCartesian fibrations, the mapping-space and fiberwise criteria, marked anodyne maps and the Cartesian and coCartesian marked structures are shared with BordismFormalGroups §F6.5, the owner on main (R03); nothing shared with the others.
- Source independence: 32 passages compared with 2 sources, none shared; largest share HTT, 393 of 395 locators; contents compared with HTT: the layers follow §2.4.1–§3.3.1 (R04).

## Not verifiable

- Kerodon, Def. 4.5.4.1, Def. 4.4.1.4, Prop. 4.5.6.1, Def. 4.5.6.5 (References, line 1539): not opened; only Prop. 4.5.4.8 was read.
- `SSet.QCat.IsCategoricalEquivalence`, `SSet.RightFibration`, `TauCeti.MarkedSSet.ofEdges`, `markedAnodyneExtensions`, `SSet.Edge.opEquiv`: absent at the pin, so the five statements that use them were read but not elaborated.
- Ownership against the open revision of GeneralizedCohomology named in the pull request description: its head was not among the files given.

## Source issues

- **Misprint** in HTT at Def. 2.4.7.2, second condition, PDF p. 158: the source says the S-projection sends the last edge to a degenerate edge of T; it should be a degenerate edge of S; affects nothing.
- **Error** in HTT at Prop. 2.4.7.10 and Cor. 2.4.7.11, PDF pp. 160–161: the source says the sections form a bifibration over C × D, source fiber first; it should be D × C, since the proof fills `Λ[n, 0]` with the C-component degenerate; affects a stated result.
- **Misprint** in HTT at the proof of Cor. 2.4.4.5, PDF p. 150: the source says full faithfulness of q gives the object, and names T′ and S; it should be essential surjectivity, with D′ and C′; affects nothing.
- **Misprint** in HTT at Def. 3.2.2.6 (2), PDF p. 198: the source says q carries marked edges to p-Cartesian edges of S; it should be of X; affects nothing.

## For the human reviewers

- **Scope.** The pull request description proposes that this family become the owner of material BordismFormalGroups §F6.5 and EnhancedDerivedSheaves (both on main) plan, and says an open revision of GeneralizedCohomology conflicts; R03 records the facts.
- **Licence.** HTT was read from the author's page at math.ias.edu, a host in no licence class of the sources service; it was passed as `author-page`.
- **Not tested.** The build needs a Tau Ceti pin the pull request does not set (description: Tau Ceti 8b9f13d993); moving the pin is outside the folder.
