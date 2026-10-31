# Review of TemperleyLiebOperatorAlgebras (pull request #867 at 44be852)

**Verdict:** needs changes

Full review. The previous review (r3, at 07aa343) was accepted with no findings, so there is nothing to re-check finding by finding. The change since that head is purely additive: the README gains six ownership lines and the three sections 1.5–1.7 (514 lines), and the folder gains three companion Lean files. Every passage of the README was reviewed; the unchanged Layers 1–4 were re-read against their sources at the locators listed under *Verified sound*. The mathematics of 1.5–1.7 is correct wherever it could be computed (table below). The findings are one blocking defect in a companion Lean file, two gate failures, and shape, source, label and padding defects in the new sections.

## R01 (P2) — `CliffordJonesTargets.lean` defines its carriers through admitted theorems

Location: `TauCetiRoadmap/TemperleyLiebOperatorAlgebras/CliffordJonesTargets.lean:53` (`evenProjection`), `:75` (`model`), `:104` (`coordinateInclusion`).

Claim: the file "uses native constructors" for the TL map and the coordinate extension (pull request description) and states target signatures against the pins.

Witness: `evenProjection m j := ⟨projection m j, projection_mem_even m j⟩` where `projection_mem_even` (line 49) is `sorry`; `model m := TemperleyLieb.lift (evenGenerator m) (generator_square m) …` where `generator_square`, `generator_adjacent`, `generator_distant` (lines 59–72) are `sorry`; `coordinateInclusion` is `CliffordAlgebra.map` of a `QuadraticMap.Isometry` whose `map_app'` field is the admitted `coordinateVector_isometry` (line 100). These are data, and they exist only if the admitted propositions hold: a `#print axioms model` would list `sorryAx`. Every substantive theorem of the file (`model_surjective`, `native_trace`, `kernel_trace_radical`, `trace_markov`, `trace_inclusion`) is about these admitted carriers, which is the situation the no-sorry'd-data rule excludes (a carrier whose existence is admitted, and statements that mention it).

Repair (tested): the five propositions are finite computations in `CliffordAlgebra (form m)` and should be proved, not admitted. `coordinateVector_isometry` closes with `simp [form, coordinateVector, Fin.sum_univ_castSucc]` (elaborated on a scratch copy at the pins). `projection_mem_even` follows from `CliffordAlgebra.ι_mul_ι_mem_evenOdd_zero` and the subalgebra closure laws; `generator_square`, `generator_adjacent`, `generator_distant` follow from `CliffordAlgebra.ι_sq_scalar` and `CliffordAlgebra.ι_mul_ι_add_swap` (both at `Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean`) by the computation in the table below (`d_j² = −1`, `p_j p_(j±1) p_j = p_j/2`). If they are not proved now, delete `evenProjection`, `evenGenerator`, `model`, `coordinateInclusion` and the theorems about them, and state the comparison as an existence statement (there is an algebra map `TL_m(√2) → Cl_m⁰` with `e_j ↦ √2 p_j`, surjective, with kernel the trace radical) whose proof carries the relations.

## R02 (P3) — Gate failure `blob`: two links pinned to a commit

Location: `TauCetiRoadmap/TemperleyLiebOperatorAlgebras/README.md:568` and `:946`.

Claim: the README consumes GraphConnectivityAndFlows 1.1 and SpinGeometry G1.1/G1.3.

Witness: both are `github.com/…/blob/<sha>/…` links; the gate reports `blob=2 … FAIL`. The gate fails, so the folder cannot be accepted.

Repair: write "GraphConnectivityAndFlows 1.1" and "SpinGeometry G1.1/G1.3" as plain roadmap-and-section citations (both roadmaps are on main), and add them to `## Exact supplier contracts` (see R06).

## R03 (P3) — Gate failure `prnum`: Mathlib pull-request numbers, and chat links, in the README

Location: `README.md:767–770` (two Mathlib pull requests and a Zulip thread), `:957–958` (a Zulip thread).

Witness: the gate reports `prnum=2`; lines 767–770 read "Follow the native set-based graph design and the component direction of [Mathlib PR37861] … and endpoint API of [PR38325] …", and line 958 links a "Clifford universal-property discussion".

Repair: delete the four links. State what is consumed as a supplier contract: Mathlib's `Graph V E` (`Mathlib/Combinatorics/Graph/Basic.lean:90`), `Graph.restrict` (`Delete.lean:38`, keeps every vertex), `Graph.map` (`Maps.lean:39`, loops arise), `Graph.toSimpleGraph : SimpleGraph V(G)` (`Simple.lean:100`) and `SimpleGraph.ConnectedComponent`, all at the pin, and the universal property `CliffordAlgebra.lift`.

## R04 (P3) — The source of 1.5–1.7 is not identified

Location: `README.md:557–558` ("The source passage is the embedded Jones article in Knot Theory physical p91"), `:564`, `:784` ("Knot Theory physical p92"), and the `## References` list (1597–1630), which has no entry for it.

Claim: 1.5, 1.6 and 1.7 specify what that source asserts.

Witness: no author, title, year or publisher is given; "physical p91" is a page of a scan ("the course scan's literal", line 539; the pull request says the source "images were consumed through existing Luna Markdown only"). The sources cache (8280 texts) and the operator's local sources directory contain no text with these words (searched by title lines and by "Potts", "ice", "Powers"), and the roadmap records no `sources.toml`. A reader cannot open the locator. The only other sources named for these sections are Temperley–Lieb 1971 and Baxter–Kelland–Wu 1976 by DOI (line 776–778, both paywalled, not in the cache) and Iohara–Lehrer–Zhang §§5.3–5.4 (verified, see below).

Repair: add a References entry with author, title, year and publisher for the book and the article, with printed page numbers, and record it as `uncertified` if no legal text is available; cite Temperley–Lieb 1971 and Baxter–Kelland–Wu 1976 there as uncertified too. Then delete every sentence that reasons about the scan (R05).

## R05 (P3) — Process narrative, source commentary and lost spaces in 1.5–1.7

Location: `README.md:537–541` ("These dimensions are distinct from the course scan's literal `ℂ^(2n+2)`; retain the scan reading and its intended-model comparison as source qualifications. The formulas here specify this tensor model without authenticating that printed exponent."), `:556` ("gives suggested finite-matrix and native trace interfaces"), `:771–774` ("Build required missing pieces in Tau Ceti and adopt Mathlib's API as it lands. `PottsIceTargets.lean` prototypes …; the full construction above remains definitive"), `:775` ("Historical sources are"), `:951–953` ("prototypes … the full comparisons above are required"), `:645`, `:708–711`, `:742` ("genus-zero ribbon certificate", "A checked finite slicing presentation records …", "planar quotient certificate").

Witness: these are process and tooling narrative (what a scan prints, what a Lean file prototypes, what to adopt when Mathlib lands it) and algorithmic vocabulary ("certificate", "checked presentation"); the README is timeless prose for mathematicians. A reader a year from now cannot tell what "the scan reading" was. Separately, the text has lost spaces at `GraphConnectivityAndFlows1.1` (568, 762), `Layers1–4` (760), `Layer2` (763), `contributes1`, `contributes0` (596–597), `degree2` (625), `genus0` (642), `circle1` (660), `Theorem5.4`, `Proposition5.5` (955), `Layers0–1` (945), `GeometricTopology4.5/4.7` (935), `dimension1` (863), `labels0,2`, `label1` (881–882), `p91`, `p92`; several of these are supplier citations that the dependency check then cannot read.

Repair: delete the scan commentary and state the dimensions once (`2^(n+1)` physical, `4^m` full GNS); replace "certificate" by the mathematical witness (a genus-zero ribbon structure; a noncrossing exterior forest); delete the "prototypes"/"adopt as it lands"/"Historical sources" sentences; restore the spaces.

## R06 (P3) — 1.5–1.7 are not in house shape, and the contract sections were not updated

Location: `README.md:452–958` (the three sections), `:145–257` (`## Exact supplier contracts`), `:960–971` (Layer 1 `### Examples`, `### Dependencies`), `:61–101` (the deferral list), `:3–20` (Summary).

Witness: 1.5–1.7 define `D_t`, `p_t`, `φ_m`, `Z_FK`, `Z_Potts`, `ell(A)`, the medial network, `L(a,b)`, `Rot`, `W_r`, `F_m`, `s_m`, `J_m`, `P_m`, `a_j`, `g_j`, with no API bullet list and no `**Checks.**` list for any of them (the checks are prose paragraphs: "Index and parameter checks", "Boundary conditions and checks", "Check m=0,…,5 explicitly"), and the `*Needs:*` lines are paragraphs mixing needs with ownership remarks and links. `## Exact supplier contracts` has no subsection for VonNeumannAlgebras, TypeAHeckeAlgebras, GraphConnectivityAndFlows, BelyiMaps, SpinGeometry, SpinRepresentations or GeometricTopology, and the `From Tau Ceti` contract (162–175) does not list `spinRep`, `spinCup`, `spinCap`, `spinWeight`, `spinGenerator`, `Matrix.extendLast` (`TauCeti/Algebra/TemperleyLieb/MarkovTrace.lean:87–320`), `BipartiteRibbonGraph`, `facePerm`, `IsConnected.two_sub_two_mul_genus` (`TauCeti/Combinatorics/RibbonGraph/Basic.lean:49,119`, `Genus.lean:59`) or `CliffordAlgebra.basis` (`TauCeti/LinearAlgebra/CliffordAlgebra/Dimension.lean:118`), all of which 1.5–1.7 consume. Layer 1's Dependencies (970–971) still name only Subfactors, TemperleyLieb and four Tau Ceti declarations; the Summary does not mention 1.5–1.7.

Repair: give each definition its API bullets and at least three discriminating Checks (the computed values in the table below are ready-made: the two slices, the `L(a,b)` entries, `Rot⁴ = Ad(W_r ⊗ W_r)`, the one-edge/loop/bridge values, `q = 0`, the braid-image orders `8, 48, 384`, the eigenvalues `−u, iu`); write each `*Needs:*` as an item list; add the seven supplier subsections and the Tau Ceti names; update Layer 1's Examples and Dependencies and the Summary.

## R07 (P3) — Supplier labels that do not resolve where cited

Location: `README.md:935` ("belong to GeometricTopology4.5/4.7"), `:550` ("VonNeumannAlgebras V1/V2's GNS, normal closures"), `:946–947` ("SpinGeometry G1.1/G1.3 for the positive-form, Pauli, complexification, analytic adjoint and faithful scalar trace"), `:554–555` ("signed/countable Hecke models remain with TypeAHeckeAlgebras H3").

Witness: GeometricTopology on main (`TauCetiRoadmap/GeometricTopology/README.md:409–519`) has a Layer 4 with no numbered subsections; the labels 4.5 and 4.7 exist only in the open revision pull request of that roadmap, which is not a citable head. At VonNeumannAlgebras' open head the GNS construction is Layer 0 (`README.md:275–390`), not V1. SpinGeometry G1 (`README.md:136–293`) owns the scalar trace, `κ_tens`, the reverse-based adjoint and the ordered-product basis, but mentions no Pauli matrices. TypeAHeckeAlgebras' signed Schur path law is under H4a (`README.md:492`), its atomic tensor models under H3 (`:342`).

Repair: cite "GeometricTopology Layer 4 (knot polynomials; the Jones polynomial from the Kauffman bracket and the Temperley–Lieb representation)" as on main; "V0's GNS, V1's weak closures"; drop "Pauli" from the SpinGeometry contract (1.7 owns the Pauli realisation); "TypeAHeckeAlgebras H3 and H4a".

## R08 (P3) — Companion files import Mathlib submodules

Location: `CliffordJonesTargets.lean:1–5`, `PottsIceTargets.lean:1–7`, `PowersTensorTargets.lean:1–5`.

Witness: each file imports `Mathlib.<submodule>` lines and none imports `Mathlib`; the Lean form rules admit only `import Mathlib` followed by the `TauCeti.*` modules used (the gate's import scanners cover `Suggested.lean` only, which is why they report 0). All three files elaborate at the pins (10, 8 and 12 `sorry` warnings and no error, checked on scratch copies).

Repair: replace the import blocks by `import Mathlib` plus `TauCeti.Algebra.TemperleyLieb.MarkovTrace` (and `TauCeti.LinearAlgebra.CliffordAlgebra.Dimension` in the Clifford file).

## R09 (P3) — Padding and API catalogue in the companion files

Location: the three companion files (43 declarations in total; the README names none of them).

Witness, by the one-tactic probe on scratch copies at the pins and by reading the pinned definitions:

- `PottsIceTargets.lean:106` `cup_cap_circle` closes with one `simp [spinCap, spinCup, negativeRoot, loop, add_comm]`; `:99` `cup_cap_snakes` closes with `cases u <;> cases v <;> simp [...]` (the pinned module already proves these contractions as `zigzag_left`/`zigzag_right`, `MarkovTrace.lean:132–141`).
- `CliffordJonesTargets.lean:100` `coordinateVector_isometry` closes with one `simp [form, coordinateVector, Fin.sum_univ_castSucc]`.
- `PottsIceTargets.lean:124` `transfer_word_closure` is the definition `markovTrace := trace ∘ mulLeft (diagonal (spinWeight q)) ∘ spinRep` (`MarkovTrace.lean:452`) applied to a product; `simp [markovTrace, spinModel, map_list_prod]` leaves only a `List.map_map` rewrite.
- `PowersTensorTargets.lean:109` `density_commutes` is the pinned `commute_diagonal_spinWeight_spinRep` (`MarkovTrace.lean:352`) once `density n r` is rewritten as `(loop r)⁻ⁿ • diagonal (spinWeight (negativeRoot r hr))` (entrywise: `markovWeight b = δ · densityWeight b`, i.e. `r = δ·t/(1+t)`, `r⁻¹ = δ/(1+t)`).
- Small values and Checks: `componentCount_empty` (boundary case), `projection_trace` (`s_m(p_j) = 1/2`), `braid_phase` (mirrors README 911–914), `local_six_vertex_matrix`, `local_projection_rank_one`, `last_slice_projection`, `first_slice_projection`, `rotation_exchanges_resolutions` (2×2 and 4×4 matrix computations mirroring README 461, 484, 488, 674–679, 698), `projection_laws` and `adjacent_projection_law` (the native relations `e² = δe`, `e e' e = e` rescaled by `δ⁻¹`).
- Theorems about free data only: `parameter_dictionary` (`2 ≤ r + r⁻¹` and `(r+r⁻¹)⁻² = r²/(1+r²)²` for a real `r > 0`, no roadmap object), `loop_specialization_of_euler` (its only hypothesis `hEuler` is the identity that makes the conclusion pure exponent algebra: `δ^(|V|+ell−|A|) = δ^(2k)`; the function `ell` is arbitrary), `productState_positive`, `productState_faithful` (facts about a positive diagonal density on `Matrix (Fin n → Bool) …`, mentioning no Temperley–Lieb object).

Statements that are not padding: `potts_eq_fk`, `native_trace_product_state`, and, subject to R01, `model_surjective`, `native_trace`, `kernel_trace_radical`, `trace_markov`.

Repair: delete the padding listed (the README keeps every statement as a Check or API bullet); keep the six substantive statements, name each surviving Lean declaration in the README at its target (README/Lean agreement), and keep only the definitions those six need.

## Verified sound

**Scope and counts.** 1630 README lines read in full; 3 companion Lean files (395 lines) and `Suggested.lean` read and elaborated; 25 fresh adversarial rows with computed values on the new sections and 9 re-computed rows on the unchanged seeded targets; 15 seeded targets, of which 1.6, 1.7 are new and checked here against Iohara–Lehrer–Zhang and by computation, and 1.1, 1.3, 1.4, 2.2, 3.2–3.4, 4.1–4.3, 4.5–4.7 are unchanged and re-checked at the cache lines below. The 1 citation lead (`IsMarkovTrace.apply_jonesWenzl`, README 200) resolves to a TemperleyLieb Layer 6 target on main (`TauCetiRoadmap/TemperleyLieb/README.md:242, 708`), not a claimed pinned declaration.

**Gate, build and dependency check.** The worker's gate at this head: `blob=2 prnum=2`, everything else `0`, `build=0`, verdict `FAIL` (R02, R03). The dependency check, rerun as prescribed:

```text
depcheck: 204 roadmaps, 1394 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The outside-folder diff `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/TemperleyLiebOperatorAlgebras'` is empty; the worktree is clean at 44be852. `lake env lean` on scratch copies: `Suggested.lean` one `sorry` warning at line 56 and nothing else; `PowersTensorTargets.lean` 10, `PottsIceTargets.lean` 8, `CliffordJonesTargets.lean` 12 `sorry` warnings and no error. A scratch `#check @markovTrace_neg_one_pow_nonneg_iff` (the worker's `signatures.md`) shows every binder of the README statement (`δ < 0`, the unit `q` with `δ = −(q+q⁻¹)`, `StarRing`/`StarModule` at every level, generator fixation) in the elaborated type; nothing dropped.

**Headlines.** README 20–29 lists four end theorems. The negative-parameter positivity theorem is stated at `Suggested.lean:56`; the unitary category, the affine classification and the affine Gram determinant are named in the module docstring as not statable (no diagram category, quotient category, C*-category or affine algebra at the pins), which is correct: `TauCeti/Algebra/TemperleyLieb/` has only `Basic.lean` and `MarkovTrace.lean`. 1.5–1.7 add no end theorem to that list; their statable comparisons (`T_m = δ^m φ_m ∘ spinRep`, `Z_Potts = Z_FK`) are in the companion files (R09). One-tactic probes on `Suggested.lean`'s theorem: `simp`, `rfl`, `infer_instance` fail (r3); the pinned library has no positivity classification.

**Suppliers resolved this round.** VonNeumannAlgebras at the open head of #889: Layer 2 (`README.md:523–893`) constructs the incomplete Hilbert tensor product `ITP(H,ξ)` with reference vectors, prefix/tail splitting, site permutations and vector-functional slice maps (lines 673–717); Layer 10 (`:2247–2776`) is Tomita–Takesaki theory with `V10.ModularTheory` and product-state modular computations (`:2449–2456`); GNS is Layer 0 (`:294–355`). TypeAHeckeAlgebras on main: H3 `:193–399` with the atomic tensor models `:342`, the Powers range `τ = t/(1+t)²` `:245–250`; H4a `:452–` with the signed/countable colour law `:492`. GraphConnectivityAndFlows 1.1 on main `:224–266`: `Graph.componentCount G = Nat.card G.toSimpleGraph.ConnectedComponent` for finite `V(G)`, no ambient finiteness, isolated vertices count. BelyiMaps Layer 2 on main `:892–1120`: `BipartiteRibbonGraph`, `facePerm := (rotW * rotB)⁻¹`, genus. SpinGeometry G1 on main `:136–293`: item 3 owns `κ_tens`, `κ_base`, the positive-form adjoint `κ_tens∘(id⊗reverse_ℝ)`, `cliffordScalarTrace` with `2^(−dim V)·trace(L_a)`, the ordered-product basis compared with `CliffordAlgebra.basis` under `equivExterior`, and `τ_ℂ(a*a) = Σ_I |a_I|² Π b(e_i,e_i)`; it does not install a global star. SpinRepresentations on main at `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md`: Layer 0 (`:317`) the Clifford algebra and gradings, Layer 1 (`:354`) the structure theorem via `TauCeti.SpinPolarizationData`. GeometricTopology on main: Layer 4 `:409–519` owns knot polynomials including Jones via Kauffman bracket and Temperley–Lieb (`:63–68`), without 4.5/4.7 labels (R07). Subfactors 3.1–3.3, TemperleyLieb Layers 0–7, CategoricalOperatorAlgebras CA1a/CA2a, CStarAlgebras C1–C5, CStarClassification CL2, PivotalSpherical 0–4, GrothendieckEulerForms Layer 2: unchanged citations, resolved in r2/r3 and not re-litigated; the PR's merge-order comment names #889 as the one open-PR supplier, and the other open suppliers are the author's own new-folder pull requests.

**Ownership.** `roadmaps grep` over main and the 426 open heads: "Potts|Fortuin|random-cluster|Tutte polynomial" occurs only in this roadmap, so 1.6's partition functions have no other owner; "ribbon graph" belongs to BelyiMaps (cited); "even Clifford|Ising algebra" to SpinRepresentations and OrthogonalSpinGroups (the structure theorem is cited from SpinRepresentations, the TL instance is owned here); "Powers state|product state" to TypeAHeckeAlgebras H3/H4a and VonNeumannAlgebras (cited; 1.5 owns only the TL spin instance); "Jordan–Wigner|Majorana" to RelativisticQuantumFieldTheory (#1772, unrelated carrier) and CompactGroups (reality types). The board package index lists no competing package. Ownership against open pull requests whose files the brief did not give was not checked beyond `roadmaps grep`.

**Pinned declarations opened** (Tau Ceti a91d3aaf, Mathlib 6b7abb3c): `spinCup` (`TauCeti/Algebra/TemperleyLieb/MarkovTrace.lean:87`: `(true,false) ↦ −q`, `(false,true) ↦ 1`), `spinCap` (`:95`: `(true,false) ↦ 1`, `(false,true) ↦ −q⁻¹`), `markovWeight` (`:103`: `true ↦ −q`, `false ↦ −q⁻¹`), `spinGenerator` (`:150`: entry `cup(s_j,s_k)·cap(t_j,t_k)` when `s,t` agree off `j,k`), `spinRep` (`:296`), `spinRep_e` (`:312`), `spinWeight` (`:320`), `commute_diagonal_spinWeight_spinRep` (`:352`), `spinWeight_snoc` (`:370`), `markovTrace` (`:452`, the weighted trace of `spinRep`); `Graph` (`Mathlib/Combinatorics/Graph/Basic.lean:90`), `Graph.restrict` (`Delete.lean:38`, `vertexSet := V(G)`), `Graph.map` (`Maps.lean:39`, `edgeSet := E(G)`, loops arise), `Graph.toSimpleGraph : SimpleGraph V(G)` (`Simple.lean:100`, so `componentCount` counts components of the actual vertex set, not of the ambient type); `QuadraticMap.weightedSumSquares` (`Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1410`); `CliffordAlgebra.even` (`Even.lean:53`), `equivExterior` (`Contraction.lean:351`, needs `Invertible 2`), `equivEven` (`EvenEquiv.lean:204`), `star x = reverse (involute x)` with `star_ι : star (ι m) = −ι m` and `R`-linear `star_smul` (`Star.lean:37,50,56`: the native star negates generators and fixes scalars, as README 802–805 says); `CliffordAlgebra.basis` and `equivExterior_basis` (`TauCeti/LinearAlgebra/CliffordAlgebra/Dimension.lean:118,132`); `BipartiteRibbonGraph` (`TauCeti/Combinatorics/RibbonGraph/Basic.lean:49`), `facePerm` (`:119`), `genus` (`Genus.lean:41`, a truncated Euler quotient, as README 643 says) and `IsConnected.two_sub_two_mul_genus` (`:59`); `Module.Basis.SmithNormalForm` (`Mathlib/LinearAlgebra/FreeModule/PID.lean:407`).

**Sources checked at their locators** (cache ids given by their first eight characters; the roadmap has no `sources.toml`, so no manifest key exists):

- Iohara–Lehrer–Zhang, *The Jones quotients of the Temperley–Lieb algebras* (arXiv 1702.08128v1, cache 8ec89b73): (5.18) `γ_iγ_j + γ_jγ_i = δ_ij` at line 561 (so `γ_j² = 1/2` and `c_j = √2 γ_j` has `c_j² = 1`); Proposition 5.3, `dim C_n⁰ = 2^(n−1)`, line 567; Theorem 5.4, `ℓ = 4`, `q = −exp(πi/4)`, surjections `φ_n : TL_n → C_n⁰` inducing `Q_n ≅ C_n⁰` for `n ≥ 3`, with `φ_n(f_j) = (1/√2)(1 + 2iγ_jγ_(j+1))`, lines 571–579: in the README's letters `(1 + i c_j c_(j+1))/√2 = √2 p_j = E_j`, as stated; Proposition 5.5, the constant-term trace equals the Jones trace, line 590–595. The README's extension to `m = 0, 1, 2` and the `†`-structure are the roadmap's own, as it says.
- Chen, *The Temperley–Lieb categories and skein modules* (arXiv 1502.06845v1, cache fe11792b): Theorem 5.4.4 (truncated tensor product, `0 ≤ a,b ≤ n−2`) line 1723–1735; Theorem 5.4.5 line 1940–1941. Supports 3.4.
- Morin-Duchesne–Saint-Aubin (arXiv 1203.4996v3, cache d6f3a06c): Proposition 4.3, equation (29), lines 1275–1296, with `α = v^N + v^(−N)` for `d > 0`. Supports 4.6; the r3 misprint note stands.
- Ridout–Saint-Aubin (arXiv 1204.4505v4, cache 126aa444): Theorem 4.7, (4.20), lines 1120–1129, exponent `d_(n,p−j)`. Supports 1.2.
- Erdmann–Green (arXiv math/9811017, cache 6f192e41): Proposition 2.2.4 lines 164–171 (page 5 marker at line 154), 2.5.5–2.5.6 lines 338–352 (page 9 marker at line 311). Supports 4.1, 4.3, 4.4.
- Graham–Lehrer 2003 (Numdam, cache 49bac728): §4, Definition (4.1), the relations (TL) with `δ_x = −(x + x⁻¹)`, and the diagram description, lines 346–372. Supports 4.1.
- Penneys, *Unitary Quantum Symmetries Lite*, Chapter 4 (author's page, cache a5da4024): Facts 4.4.14 line 557, (TB4) 589, (TB5) 597, (TB6) 600, (TB7) 607, Proposition 4.5.3 line 745, Exercise 4.5.4 line 747. Supports 1.1, 1.3, 1.4, 2.1.
- Iohara–Lehrer–Zhang, roots of unity (author's page, cache 3a990ff3): the invariant form and `L_t = W_t/Rad_t`, lines 120–130. Supports 1.3.
- Chen–Przytycki (arXiv 0802.1083v2, cache ec149273): present; §2 as cited in r2.

**Adversarial table, new sections (1.5–1.7).** Computed with exact rationals or complex floating point at `r = 1.7` (`t = 2.89`, `δ = 2.2882`, `τ = 0.19097`), Pauli matrices for the Clifford checks; the script is in the reviewer's scratch directory.

| Statement | Instances tried | Values on both sides | Result | Change |
|---|---|---|---|---|
| `τ = δ⁻² = t/(1+t)²` (454–455) | `r = 1.7` | `(r+r⁻¹)⁻² = 0.190972 = 2.89/3.89²` | holds | none |
| native generator block (470–471) vs `δ p_t` | `q = −r`, `spinGenerator` entries from the pin | block on `01,10`: `[[0.5882, 1], [1, 1.7]] = [[r⁻¹,1],[1,r]]`; `E² = δE` | holds; `p = w w*/(1+t)`, `w = (0,1,r,0)`, Hermitian idempotent | none |
| last-site slice (484) | `p_t`, `D_t = diag(1,t)/(1+t)` | `(id⊗φ_1)(p) = τ·I₂` exactly; off-diagonal `0` | holds | none |
| first-site slice (488) | same | `(φ_1⊗id)(p) = diag(t², 1)/(1+t)² = diag(0.5520, 0.0661)`; not scalar | holds; the two slices differ as stated | none |
| adjacent relation (468) | three sites | `p_1p_2p_1 = τ p_1`, `p_2p_1p_2 = τ p_2` (entrywise `< 1e−9`) | holds | none |
| `D^(⊗3)` commutes with generators (478–479); `φ_1` tracial iff `t = 1` (480) | `t = 2.89` | commutators `0`; `Tr(D[e_12, e_21]) = (1−t)/(1+t) ≠ 0` | holds | none |
| `W_r = δ D_t`, `Z_closed = Tr(W^(⊗m) ρ(X))` (722–728) | `m = 2, X = e`; `m = 3`, `X = p_1p_2 + 3p_1 + i p_2p_1p_2` | `Tr((W⊗W)E) = δ`; `Tr(W^(⊗3)X) = δ³ Tr(D^(⊗3)X)` | holds; equals the pinned `markovTrace` by `MarkovTrace.lean:452` | none |
| cup/cap matrices (693–695) | pin at `q = −r` | `C = [[0,1],[r,0]]`, `A = [[0,r⁻¹],[1,0]]`, `CA = AC = I`, `Σ A_ab C_ab = r + r⁻¹ = δ` | holds | none |
| `L(a,b)` matrix (674–679) | `a = 0.7, b = 1.3` | diagonal `0.7, 1.4647, 2.91, 0.7`; off-diagonal `1.3`; `a + b/r = 1.4647`, `a + br = 2.91` | holds | none |
| `Rot(I) = E`, `Rot(E) = I`, chart change (697–698) | the entry formula | both exact; `Rot(aI + bE) = bI + aE` | holds | none |
| fourth rotation (699–701) | random complex `4×4` `T` | `Rot⁴(T) = (W⊗W) T (W⊗W)⁻¹`; `≠ T`; `≠ (W⊗W)⁻¹ T (W⊗W)` | holds, with the conjugation on that side | none |
| Hilbert-adjoint rescaling (702–704) | `r > 0` | `r^(−1/2)C = [[0,r^(−1/2)],[r^(1/2),0]] = r^(1/2)A` entrywise and real, so cap = cup†; products unchanged | holds | none |
| spin flip (543–545) | both sites | `F p_t F = p_(1/t)`, `S D_t S = D_(1/t)` | holds | none |
| `Z_Potts = Z_FK` (594) | edge, loop, parallel pair, triangle, plaquette, three isolated vertices, path plus isolated vertex, empty graph; random rational weights; `q = 0,1,2,3` | equal in all 32 cases; `q = 0`: `0` for nonempty `V`, `1` for the empty graph; `v = 0`: `Q^|V|` | holds | none |
| deletion–contraction, loop, bridge (600–603) | triangle edge; loop on an edge; path `0–1–2` bridge | `Z = Z_(G∖e) + v Z_(G/e)`; `Z = (1+v) Z_(G∖e)`; `Z = (Q+v) Z_(G/e)`, exact | holds | none |
| one edge, one loop, wiring (751–753) | `Q = 7, v = 2` | `Q² + Qv = 63`; `Q(1+v) = 21`; wiring the edge's ends gives the loop value `21` | holds | none |
| Euler and planar loop identity (636, 656) | plaquette, all 16 `A` | `ell = 2k + |A| − 4`: `4` (empty), `1` (3-path), `2` (cycle); `Z_FK(δ²) = δ⁴ Σ δ^ell Π v/δ` to `1e−9` | holds | none |
| Clifford relations (820–827) | `m = 2,3,4,5` via Jordan–Wigner | `c_ic_j + c_jc_i = 2δ_ij`; `d_j² = −1`; `p_j` Hermitian idempotent; `p_jp_(j±1)p_j = p_j/2`; distant commute | holds; algebraically `(1+d_j)(1+d_(j+1))(1+d_j) = 2(1 + d_j) + 2i·0` as computed in R01 | none |
| braid units (913–914) | same | `g_j = −(1+d_j)/√2 = u((1+i)p_j − 1)`; `g² = d`, `g⁴ = −1`, `g⁸ = 1`; `g c_j g⁻¹ = −c_(j+1)`, `g c_(j+1) g⁻¹ = c_j` | holds | none |
| one-generator eigenvalues (940) | `m = 2` | `−0.7071 ∓ 0.7071i = −u, iu` | holds | none |
| `P_m` (865–866) | `m = 2, 4` | Hermitian, `P² = 1`, anticommutes with every `c_j` (hence central in the even algebra) | holds | none |
| braid image order (922–926) | `m = 2, 3, 4` by closure | `8, 48, 384 = 2^m m!`; not `2^(m−1) m! = 4, 24, 192` | holds (the conjugation image has half the order, as stated) | none |
| scalar trace values (809, 837, 842) | `m = 2..5` | normalised `Tr(p_0) = 1/2`, `Tr(d_0) = 0`; `s_(m+1)(J(x)p_(m−1)) = s_m(x)/2` since `x c_(m−1) c_m` has no scalar term; `T_m(1) = (√2)^m`, `T_(m+1)(ιx·e_m) = (√2)^(m+2)·s_m(Fx)/2 = T_m(x)` | holds | none |
| ILZ dictionary (954–956) | `c_j = √2γ_j` | `(1/√2)(1 + 2iγ_jγ_(j+1)) = (1 + i c_jc_(j+1))/√2 = √2 p_j` | matches Theorem 5.4 | none |
| block sizes (859–863, 886–888) | `m = 0..5` | `dim Cl_m⁰ = 1,1,2,4,8,16`; blocks `ℂ, ℂ, ℂ⊕ℂ, M_2, M_2⊕M_2, M_4`; equal to 2.2's Bratteli sizes `(1),(1),(1,1),(2),(2,2),(4)` at `δ = √2` | agrees with Layer 2 | none |
| Jones normalisation at `t = i` (931–932) | `u = e^(πi/4)` | `−(√t + 1/√t) = −(u + u⁻¹) = −√2`; `τ = i/(1+i)² = 1/2` | holds | none |
| `componentCount` on the ambient type (PottsIce 31) | `G.toSimpleGraph : SimpleGraph V(G)` at the pin | components of the vertex subtype; an infinite ambient `V` does not enter | sound | none |

**Adversarial table, unchanged seeded targets (recomputed).**

| Statement | Instances | Values | Result |
|---|---|---|---|
| headline `markovTrace_neg_one_pow_nonneg_iff` | `n = 1`, `δ = −2`; `δ = −1/2`; `δ = 0` | `−T_1(1) = 2`; `T_2(f_2) = δ² + 2δ = −3/4 < 0` with `f_2 = 1 + 2e`; at `δ = 0` all `T_n = 0` yet `0 ∉ J`, excluded by `δ < 0` | holds |
| sign relation 2.1 | `n = 1, x = 1`; `n = 2, x = e` | `(−1)·T^(−δ)_1(1) = δ`; `(+1)·T^(−δ)_2(−e) = δ` | holds |
| 1.2 anchors | `δ = 7/3`: `det G_(3,1)` | `[3] = δ² − 1 = 40/9` | holds |
| 1.4 weights | `n = 2` | `[1] + [3] = 1 + (δ² − 1) = δ²`; unit weights give `2` | holds |
| 2.2 sizes at `m = 4` | `n = 0..5` | `(1),(1),(1,1),(2),(2,2),(4)`, `dim Q_n = 2^(n−1)` | holds |
| 3.1 dagger | `f = i·cup`, `δ = 2` | `f ≫ f† = 2·𝟙_0`; linear dagger would give `−2` | holds |
| 3.4 `m = 3` | `δ = 1` | `min(2, 2m−4−2) = 0`, `X_1 ⊗ X_1 ≅ X_0`, `Hom(0,1) = 0` | holds |
| 4.1 two-strand law | `δ = 2, z = 2`, `a = 5/2` | `e_1e_2e_1 b_1 = δa² b_1 = 25/2 · b_1`, not `δ b_1` | holds |
| 4.3 / 4.6 | `n = 3, t = 1` | `det[[X,Z,1],[Z⁻¹,X,Z],[1,Z⁻¹,X]] = X³ − 3X + Z² + Z⁻²`; `n = 2, t = 0`: `d² − a²` | holds |

The r3 table's remaining rows (Gram formula with exponent `d_(n,p−j)`, `6×6` affine Gram at `n = 4`, telescoping identities, `T_r(−v−v⁻¹) = (−1)^r(v^r + v^(−r))`, valuation and successor Checks) concern unchanged text and are carried from that review.

## Not verifiable

- The "Knot Theory" source of 1.5–1.7 (R04): no author, title or year is given; nothing matching it is in the sources cache (searched by title lines and the words Potts, ice, Powers, Temperley, Jones) or in the operator's local sources directory. The sections' formulas were verified by computation and against Iohara–Lehrer–Zhang instead. The README's statement (line 539) that the scan prints `ℂ^(2n+2)` for a space of dimension `2^(n+1)` could not be checked and is not recorded as a source erratum.
- Temperley–Lieb 1971 (doi 10.1098/rspa.1971.0067) and Baxter–Kelland–Wu 1976 (doi 10.1088/0305-4470/9/3/009), linked at README 776–778: paywalled journals, not in the cache; cited by locator only.
- Graham–Lehrer 1998 (doi 10.5169/seals-63902): uncertified and settled since r2; not reopened.
- Penneys, Examples 4.6.12 and 4.6.14 (2.2): the cache text's OCR spacing defeated a direct search this round; the r2 reading at cache a5da4024 lines 941–1009 is carried.

## Source issues

- **Misprint** in Morin-Duchesne–Saint-Aubin (arXiv 1203.4996) at Proposition 4.3, equation (29), printed p. 24: the source gives an unsigned product, which at `N = 2`, `d = 0` yields `α² − β²`; it should carry the leading-term sign, yielding `β² − α²` there; affects nothing (the roadmap supplies the sign `σ_(n,t)`; carried from r2).
