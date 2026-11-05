<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1304#issuecomment-6405299559 -->
Review (claude) of 6962204

Verdict: accepted
Conditional on the announced gaps: `pro-universe-extension`, `pro-cofinal-invariance`, `pro-cofinite-reindexing`, `pro-level-representations`, `pro-monomorphism-presentations`, `simplicial-postnikov`, `simplicial-local-whitehead`, `simplicial-moore-postnikov`, `simplicial-covering-classification`, `local-coefficient-representability`, `reedy-homotopy-limits`, `nonabelian-lim1`, `bk-homotopy-limit-spectral-sequence`, `bk-tower-convergence`, `multisimplicial-diagonal`, `kan-quillen-properness`, `surjective-nerve-fibration`, `coherent-pro-category`, `coherent-pro-mapping`, `coherent-pro-universes`, `topological-hypercover-realization`, `connected-etale-components`, `elementary-fibration-carrier`, `nonabelian-proper-base-change`, `nonabelian-local-acyclicity`, `constructible-set-subsheaves`

1. **F01** (P3) The universal-local-1-asphericity route ends in the base-change form, which the gap does not name

   **Location.** `packages/EtaleHomotopyTypes/README.md:615`, last sentence: "Proper descent of torsor stacks (gap:nonabelian-proper-base-change) then shows that the base-change functor on torsor stacks is an equivalence"; the target's statement at 615 and the gap at 135 define local 0-acyclicity and local 1-asphericity through Milnor fibres only.

   **Claim.** The route proves the Milnor-fibre statement of the target.

   **Witness.** SGA1 lines 12022–12024 and 12069–12076: the proof of 3.3 proves that `f′_*i_*Φ → j_*f″_*Φ` is an equivalence for étale `i`, using that smoothness gives this form (Giraud, VII 2.1.7) and that local 0-acyclicity gives full faithfulness; the passage between the two forms is nowhere stated here.

   **Repair.** In the gap's `needs` (README 135 and `design/plan.json`, same sentence), after "through the fibres of strict localizations" add "together with their characterization by the base-change functor `f′_*i_*Φ → j_*f″_*Φ` for étale `i` and ind-finite `Φ` (fully faithful for local 0-acyclicity, an equivalence for local 1-asphericity; SGA 4 XV §1, cited by locator without text)"; at 615 end with "which is universal local 1-asphericity through that characterization". Tested on the nodal cubic over `K`: the Milnor fibre at the node is the strictly local ring with two branches, connected with trivial finite torsors, and the base-change functor at that point is an equivalence; both readings agree, and nothing else in the package changes.

2. **F02** (P3) The constructibility hypothesis of the homotopy exact sequence is wider than the source's

   **Location.** `packages/EtaleHomotopyTypes/README.md:619`: "and f′_*E is constructible for every étale S′ → S and every finite étale E over X ×_S S′".

   **Claim.** The hypothesis is the one of SGA1 XIII Lemma 4.2.

   **Witness.** SGA1 lines 12165–12167 and 12124–12127: the hypothesis is required for every finite étale cover `S′` of `S` and every `E` that is a quotient of a Galois cover with `L`-group; the theorem as stated here is weaker than the source's.

   **Repair.** Write "for every finite étale cover S′ → S and every finite étale E over X ×_S S′" (on the connected `X ×_S S′` every finite étale `E` is a quotient of a Galois cover, and `L` is the set of all primes). Tested: both uses (the product formula at 619 and §3.9d at 695) verify the hypothesis for every étale `S′`, hence for finite étale covers; the proof route is unchanged, 1.16 being applied to `f′` over the finite étale `S′` exactly as at SGA1 line 12155.

3. **F03** (P3) The geometric product formula is stated for finite-type `Y` where the source allows any connected `Y`

   **Location.** `packages/EtaleHomotopyTypes/README.md:619`: "let X and Y be connected finite-type K-schemes".

   **Claim.** This is SGA1 XIII Proposition 4.6 under hypothesis a).

   **Witness.** SGA1 lines 12282–12287: hypothesis a) asks `X` of finite type and `Y` any connected `k`-scheme; the "Projections are 0-acyclic" target (617) already allows any `K`-scheme `Y`.

   **Repair.** State the product formula for a connected finite-type `X` and any connected `K`-scheme `Y`, and obtain the constructibility hypothesis of the homotopy exact sequence as SGA1 does (line 12303): since `(C,X)` is cohomologically proper in dimension ≤ 1 over `K`, `f′_*Φ` is the pullback of the constant stack `Tors(X,C)` along `Y′ → Spec K`, so every torsor `Q` on `X ×_K Y′` is étale-locally on `Y′` pulled back from `X`, and `f′_*(Q/G)` is locally constant with finite stalks. Tested on `Y = Spec K` (identity) and on `Y` the spectrum of a polynomial ring in infinitely many variables over `K` (connected, not of finite type): the repaired statement gives `π₁(X ×_K Y) ≅ π₁(X) × π₁(Y)` there, as SGA1 does; §3.9a, which needs only finite-type factors, is unchanged.

4. **F04** (P3) Scope should name the later roadmap that restates the raw étale type and the elementary-fibration sequence

   **Location.** `packages/EtaleHomotopyTypes/README.md:15`: "The finite-coefficient K(π,1) applications, smooth-curve examples and geometric existence of hyperbolic neighborhoods belong to AnabelianGeometryAndNonabelianChabauty Layer 1"; `:1038`.

   **Claim.** The division of ownership with that roadmap is stated.

   **Witness.** `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md` at its open head, §1.5 (raw étale homotopy type, classifying map, raw/profinite π₁, finite-coefficient Whitehead criterion) and §§1.10–1.11 (elementary-fibration homotopy fibre, K(π,1) preservation), after the same Schmidt–Stix passages as §§3.3–3.5, 1.9, 3.9b and 3.9d here; it cites this roadmap nowhere.

   **Repair.** Add to the Scope sentence: "its §1.5 raw étale homotopy type and §§1.10–1.11 elementary-fibration homotopy fibre are supplied by §§3.3–3.5, 3.9b and 3.9d here". This roadmap is the owner: it is earlier in the merge order (44 against 197), its design was accepted with the restructure proposal that points that roadmap's raw classifying and elementary-fibre prerequisites at EH.1 and EH.3 (`design/plan.json`, `restructure`), and the later roadmap's head predates this design. No mathematics changes; the intake can announce the overlap on the consumer.

5. **F05** (P3) Cohomological properness relative to `S` is defined only for morphisms to `S` but used for `S`-morphisms

   **Location.** `packages/EtaleHomotopyTypes/README.md:607`: "For a morphism f:Z → S, say that (F,f) is cohomologically proper in dimension ≤ 1 relative to S when, for every S-scheme S′, with f′:Z ×_S S′ → S′ the base change".

   **Claim.** Every use of "cohomologically proper relative to S" is covered by this definition.

   **Witness.** README 611 uses "(F,i) … relative to S" for the open immersion `i:U → P` and 613 the dévissage of 1.6(2) and 1.12(2) for `p:X₁ → X`; SGA1 line 10206 defines the notion for an `S`-morphism `f:X → Y`, with base change along `Y ×_S S′ → Y`.

   **Repair.** State the definition for an `S`-morphism `f:Z → Y` between `S`-schemes: for every `S`-scheme `S′`, with `Y′ = Y ×_S S′` and `f′:Z ×_S S′ → Y′`, the base-change functor `g^*f_*Φ → f′_*h^*Φ` is an equivalence (SGA1 XIII 1.0.1 and 1.1); the case `Y = S` is the one used for structure morphisms. Tested on `i:U → P` over `S = Spec K` with `U = 𝔾ₘ`, `P = ℙ¹`, `S′ = Spec A`: the base change is along `ℙ¹_A → ℙ¹`, and the Check at 626 is the stalk computation of that functor at `0`.

6. **F06** (P3) The sheaf-of-sets assertion of the finite-type target is narrower than SGA1 XIII 3.2(1)

   **Location.** `packages/EtaleHomotopyTypes/README.md:613`: "and that every finite étale X-scheme E, as a sheaf of sets, is cohomologically proper in dimension ≤ 0 over K".

   **Claim.** This is the sets statement of SGA1 XIII Corollary 3.2.

   **Witness.** SGA1 lines 11938–11941: for a coherent `f:X → Spec k`, `(F,f)` is cohomologically proper in dimension ≤ 0 for every sheaf of sets `F`, with no finiteness or resolution hypothesis.

   **Repair.** Either state the assertion for every sheaf of sets on a coherent `K`-scheme, with the route SGA1 XIII 3.1(1)(b) and passage to the limit over constructible subsheaves, or say in one clause that only the finite étale case is stated because it is all §§3.8a and 3.9d consume (the homotopy exact sequence derives its dimension-≤ 0 input from 1.13(3) at SGA1 line 10656). Tested on `X = ℙ¹ ⊔ ℙ¹` with `E` of degree 2 on one component and 1 on the other: both readings give bijective sections after base change to every strictly henselian `A`.

Head reviewed: the board checkout at the FIX-PKG-EtaleHomotopyTypes~7 commit (6962204), confirmed as the current head of the pull request before reading. Round 7 changed `packages/EtaleHomotopyTypes/README.md` in 52 lines (the gap `nonabelian-local-acyclicity`, the §3.8a definitions paragraph, the "Projections are 0-acyclic" and homotopy-exact-sequence targets, two new §3.8a Checks and one extended Check, the move of §3.8 to §3.9d with its three cross-references, and the §3.9a range), the `needs` of one gap in `design/plan.json`, and two `cited_for` strings in `sources.toml`. `Suggested.lean` and `metadata.toml` are unchanged. Both round-6 findings are repaired (table under Verified sound). The pass over the repaired text, over all of §3 against its sources, and over the sampled targets found no false statement, no unowned prerequisite and no overclaim; six non-blocking notes follow.

## Verified sound

### Round-6 findings, checked at the current head

| Round-6 finding | Status | Repaired passage and verification |
| --- | --- | --- |
| F01 (P2): the 0-acyclicity criterion was false as stated | Repaired, in a corrected form | README 135, 607, 617 and `design/plan.json`: 0-acyclic now means "the unit F → f_*f^*F is bijective for every étale sheaf of sets F on S", locally 0-acyclic is the Milnor-fibre condition, and the criterion reads "a coherent locally 0-acyclic morphism is 0-acyclic exactly when its geometric fibres are nonempty and connected". The repair report's objection to the suggested "universally open" hypothesis is right: at SGA1 line 12120–12122 "f localement 0-acyclique" is the standing hypothesis of the sentence whose parenthetical restates SGA 4 XV 1.16, so the source states the equivalence only for locally 0-acyclic coherent morphisms; the round-6 witness `Spec κ ⊔ Spec L → Spec R` is not locally 0-acyclic at `Spec κ` (its strict localization is `Spec κ^sep`, whose fibre over a geometric generic point of `R^sh` is empty), and the round-6 "Error" entry is withdrawn. Both directions of the repaired criterion were re-derived (table): (⇒) for every coherent `f` from the skyscraper sheaf of a two-element set on the reduced closure of a point, (⇐) on a strictly local base from constancy of a section on the connected closed fibre, openness of the agreement locus, local 0-acyclicity to reach every geometric fibre, and connectedness of that fibre. The two new Checks (633, 634) carry computed values (2 against 4 sections in each) and are correct. The surjectivity step (619) now applies the unit to `π_*C` with finite base change; recomputed on a connected double cover with `X = S`: 2 = 2. |
| F02 (P3): §3.8 built from later subsections | Repaired | §3.8 is now §3.9d (685–700) after §3.9c; its `*Needs:*` names §3.8a and "§3.9b (the detection lemma, for the fibre identification)"; the references at 89, 101 and 642 read §3.9d; no subsection of §§3.8a–3.9c cites §3.9d; `sources.toml`'s SGA1 `cited_for` reads "3.9d …". No mathematics changed (the degree-one bullet at 695 was compared word by word with the former 615). |

Pattern search for the repaired patterns: every "iff"/"exactly when" of §3 was tested in both directions this round (table); "0-acyclic" now occurs only with the all-sheaves definition (607, 617, 619, 632–634, 695); no "§3.8 " reference remains outside §3.8a; the phrase "with its closed point removed" is gone.

### §3 as a whole

Every subsection of Layer 3 was read against its sources at its locators this round, and §3 is sound as a whole: §3.0a (SS 369–374; the five Checks recomputed, including `∏_{ℓ≠2} ℤ_ℓ` and 3 = 3 maps to `C₃`), §3.1 (IEt 594–640: rigid covers, rigid pullback, Proposition 5.5), §3.2 (IEt 744–766), §3.3 (IEt 345–366), §3.4 (IEt 271, 331; SS 284–290), §3.5 (SS 228–229 and 369–374; SGA1 I 1208–1210 and 1310–1312), §3.6 (SS 237–241, 269–280), §3.7 (SS 288–290), §3.8a (SGA1 10206–10233, 10326–10385, 10386–10398, 10456–10461, 10656–10660, 10742–10806, 10879–10891, 11064–11070, 11089–11105, 11297–11319, 11364–11380, 11552–11575, 11582–11762, 11938–11941, 11983–12086, 12106–12174, 12282–12313, 12550–12630; StacksVarieties 372–390), §3.9a (SS 467–478; SGA1 12282), §3.9b (SS 412–428), §3.9c (SS 414–416), §3.9d (SS 436–448). The three blocking defects of rounds 4–6 do not recur: SGA1 XIII 4.6 is owned at 619 (product formula) with its inputs each a target of §3.8a or a declared gap; the gap `nonabelian-proper-base-change` covers `i_*Φ` (ind-finite, not a torsor stack: Check 627) and proper surjective descent; the local-acyclicity clause is now the one SGA1 states under its standing hypothesis. Two points of §3.8a's SGA1 route were examined beyond the previous rounds. First, SGA1 proves Theorem 3.1 for arbitrary `S`-morphisms and its reductions use that generality (3)2 at 11731, 3)3 at 11738–11742); the README states structure morphisms only. With base `Spec K` the strictly henselian reformulation at 607 (SGA1 1.5(b), 10347–10362) makes every dévissage a statement about sections over `Z ⊗_K A`: the proper-cover reduction needs `(p^*Φ,p)` for proper `p`, `q`, `r`, which is Example 1.4 (10326–10331), and the Zariski reduction runs as faithful, then fully faithful, then essentially surjective, each stage on all smooth schemes from the affine case and the preceding stage on the (smooth, possibly non-affine) intersections; so the sketched route proves the stated target. Second, the universal-local-1-asphericity route (R01) ends in SGA1's base-change form; the target is true and the input lies in the cited gap's range. The homotopy exact sequence (619) restates 4.1/4.2 step by step (12132–12160: surjectivity via a two-element set, 1.13(3), 1.14, 1.16, a section of `E = Q/G`), with the hypothesis note R02; the product formula follows 4.6 with the misprint at 12307 recorded; §3.9d's degree-one input (695) verifies every hypothesis of the sequence for an elementary fibration (smooth hence locally 0-acyclic by the gap; coherent as a morphism of Noetherian schemes; fibres smooth connected affine curves; `D` finite étale over `Y` hence a relative normal-crossings divisor with `r = 1`; constructibility from EtaleCohomologyFoundations §F.3 and the subsheaf gap).

### Principles, shape and policy

Read all 1058 README lines (59 numbered targets and the six bold sub-targets of §3.8a, 59 `*Needs:*` lines, 30 `**Checks.**` blocks, seven layers each ending in `### Examples` and `### Dependencies`), `Suggested.lean` (72 lines), `metadata.toml`, `sources.toml` (15 keys, no local path) and `design/plan.json` (26 gaps). No route-specific prime or coefficient exclusion (§3.8a includes all primes in characteristic zero), no computational algorithm, no copied passage (every round-7 sentence was compared with SGA1 lines 10206–10233, 10742–10806, 12106–12174 and 12282–12313: all are restatements in the roadmap's notation), no LaTeX delimiters, no process words, pull-request numbers, round labels or local paths (grep for `\(`, `$…$`, "so far", "round", "pull request", "removed", "optional", "deferred", "checkpoint", and the home- and temporary-directory prefixes), no `lemma`, `set_option`, `#eval`, `#print` or `#synth` in the Lean file. Later roadmaps (AnabelianGeometryAndNonabelianChabauty, InverseGaloisAndArithmeticFundamentalGroups, EllAdicHomotopyTypesAndWeights, MotivicEtaleKTheory, ArithmeticKTheoryPartII; merge order 197, 50, 198, 84, 222 against 44) appear only in Scope and Downstream consumers.

Dependency check, exact command of the brief, exit 0, complete output:

    depcheck: 56 roadmaps, 647 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. `ORDER.txt` places SchemeAndStackFoundations at 2, StableHomotopyKTheory 4, ResolutionOfSingularitiesCharacteristicZero 6, AdicSpacesPartII 8, PerfectoidSpaces 13, DiamondsAndVStacks 16, EnhancedDerivedSheaves 18, EtaleCohomologyFoundations 19, CrystallineCohomology 22, ComplexComparisonPartII 43 and this roadmap at 44; AlgebraicTopology, GeneralizedCohomology, BordismFormalGroups, Orbifolds, ProfiniteProPGroups and UniversalCovers are on main.

`roadmaps resolve` on the README (main 4a3adb6 and 367 open heads, index of 2026-10-25): no cross-roadmap citation and no Lean name found nowhere. The worker's six leads resolve: `IsGeometricallyUnibranch.of_etale` and `unibranch_finite_components` (`TauCetiRoadmap/SchemeAndStackFoundations/README.md` 887 and 889), `VanishingCycles.lisseDirectImageTransport` (`TauCetiRoadmap/EtaleCohomologyFoundations/README.md` 707 and its `Suggested.lean` 526), the three `complexSchemeAnalytification.*` names (ComplexComparisonPartII §C−1.1 at its head, lines 754–756), and `sources.toml`, a file name.

### Elaboration, binders and padding

`lake env lean` on `packages/EtaleHomotopyTypes/Suggested.lean` from the pinned content checkout: exit 0, no output (nothing is sorried; no `TauCeti.*` import, so nothing had to be built). The file declares no `def`, `abbrev`, `instance`, `opaque`, `theorem`, `structure`, `class` or `example`: the `#check @name` scratch file is empty, there is no binder to compare and no input for the one-tactic padding probe. The module docstring names every headline of the README by layer with its missing carrier. Its library claims were checked at the pins: Mathlib 6b7abb3c has `FiniteEtale` for rings only (`Mathlib/RingTheory/Etale/Finite.lean` 103), nothing finite-étale under `Mathlib/AlgebraicGeometry` beyond the site (`Sites/Etale.lean` 50), no Pro category under `Mathlib/CategoryTheory`; Tau Ceti a91d3aaf has no étale-homotopy module. All 36 `file, line` claims of the two supplier-contract sections were opened at the pins and name the declaration claimed (SSet 33; KanComplex 40, 45; ModelCategory 43; SingularSet 50, 56, 65, 73, 97; Etale 50; SheafCohomology 56; RightDerived 108; Resolution 70; HasLimits 555; AdditiveFunctor 231; ProfiniteGrp Completion 191, 205, 215 and Limits 48, 138; CofilteredSystem 79; Konig 126; LocalCoefficient 43, 75, 102, 136, 252; InverseSystem 78, 96; Twisted/Basic 79, 84; Profinite/Completion 179, 68; Generation 73; StructureTheorem 59). No stand-in, free predicate or admitted data; no headline is statable at the pins.

### Seeded source audit

All 15 sampled targets were opened at their locators (SS printed page = marker page + 816; SGA1 printed = marker − 16; I01 and IEt preprint pages). Uncertified keys stay so.

| Target | Text opened; theorem, page, hypotheses | Outcome |
| --- | --- | --- |
| 0.1 Homotopy pro-local systems | I01 §4 (281–294, p. 6), Definition 5.1 (340–342, p. 8), Corollary 7.5 (578–589, p. 13) | Matches README 163; pointed `π_n` is the levelwise system. |
| 1.2 Covering of a sub-pro-group | SS Proposition A.2 (1475–1481, p. 854): connected pointed, monomorphism of pro-groups, bijection with classes whose `π₁` factors through `U` | Matches README 255; no finite-index hypothesis in the source either. |
| 1.7 Full faithfulness of `B` | SS Lemma A.15 (1866–1873, p. 863): all maps in diagram (13) isomorphisms | Matches README 317. |
| 1.9 First classifying morphism | SS Definition A.17 and Corollary A.18 (1953–1962, p. 866); proof via I01 Cor. 7.5 | Matches README 333. |
| 2.10 Stabilizer quotient | SS Theorem A.13(b) (1743–1753, p. 860) | Matches README 466. |
| 3.4 Cohomology of the rigid type | IEt 271 (Friedlander 5.9 for `ℤ/p`), 331–333 (locally constant coefficients); SS Proposition 2.3 (288–290) | Matches README 563; the arbitrary-constant-group range rests on Fr 5.9, uncertified, and on Verdier descent (table). |
| 3.5 Raw and finite groups | SS 228–229 (profinite for noetherian geometrically unibranch, AM 11.1), 369–374 (completion); SGA1 I Cor. 10.10 (1208–1210) and §11 (1310–1312: unibranch base, connected étale dominating scheme irreducible) | Matches README 571–578; "dominating" holds since `P₀ → X` is open onto irreducible `X`. |
| 3.9d Elementary fibrations | SS Proposition 2.8 and proof (438–448, pp. 827–828); SGA1 4.1/4.2 (12120–12170) for the degree-one input | Matches README 687–698; Fr 11.5 uncertified. |
| 4.0a Center-free bases | SS 326–328 (strongly center-free), 369–374, Corollaries 2.5–2.6 (384–400, p. 826) | Matches README 714. |
| 4.0b Open arithmetic image | SS proof of 2.4(c) (361–366): `U` open, `g` central in `⟨U,g⟩` | Matches README 733; openness itself is a target here, as stated. |
| 4.3 Geometric monodromy quotient | SS Proposition 2.4(b) and proof (342–359) | Matches README 765. |
| 5.1 Algebraic evaluation | FGV Lemma A.7, Definition A.8, settled uncertified | Not text-verified; Checks recomputed (table). |
| 5.2 Betti realization | FGV Definition A.8, settled uncertified | Not text-verified; Checks recomputed (table). |
| 6.2 p-profinite completion | IC Theorem 2.2 (185–190), Theorem 3.3 (233–235); BHH Definition 7.3.1 (2427–2434), 7.3.2 (2437–2438), Proposition 7.3.6 (2480), Corollary 7.3.8 (2511) | Matches README 916–918. |
| 6.3 Model for p-profinite types | BHH Theorem 7.1.2 (2226–2227), Corollary 7.3.8 (2511); DAG13 Definition 3.3.2 (3708–3711), Proposition 3.3.8 (3736), Theorem 3.4.12 (4146–4150) | Matches README 935; DAG13 3.4.12's "field of characteristic p" is as printed. |

Also opened: IStr 505–512 (0.3), StacksVarieties 372–390 (0385, 0363), CrystallineCohomology CR.5:log-algebra.4 *The classical Abhyankar lemma* at its head (8107–8121), and the SGA1 ranges listed under §3.

### Computed adversarial table

Rows cover the sampled targets, every passage round 7 changed or added, the headline theorems of the module docstring and the targets of R01–R06. `C_n` is cyclic of order `n`; `A` is the strict henselization of `K[t]` at `0`; `R` a discrete valuation ring with residue field `κ` and fraction field `L`.

| Statement | Instances tried | Values computed on each side, or rejected model | Result / change |
| --- | --- | --- | --- |
| 0.1 pro-local systems | constant `S¹`; two points; sign system; tower `(ℤ,×2)` as a system on a point | `π₁ = ℤ`, `π_n = 0`; `π₀` two elements; `H⁰ = 0`, `H¹ = ℤ/2` against `H⁰ = ℤ`, `H¹ = ℤ`; `Hom_pro((ℤ,×2), ℤ/2) = colim(0) = 0`, `Hom_pro((ℤ,×2), ℤ/3) = ℤ/3` | Pro-level objects; Checks hold. |
| 1.2 sub-pro-group cover | `cS¹`, `U = 2ℤ`, `ℤ`, `0`; `X = (BC_{pʳ})`, `U = (pℤ/pʳ)` | degree 2 and `π₁ = 2ℤ`; identity; infinite fibre; identity of `π₁(X)` does not factor through `U` at level 1 (`ℤ/p → 0`), so `id` has no lift, while `×p` is compatible with image `pℤ/pʳ` and lifts | Universal property discriminates. |
| 1.7 full faithfulness | `G = H = C₂`; `G = S₃`, `H = C₂`; `G = C₂`, `H = S₃`; `G = (ℤ/pʳ)`, `H = C_p` | 2 homs = 2 strict pointed maps = 2 classes; 2 = 2; 4 pointed, 2 unpointed; `colim_r Hom(ℤ/pʳ,C_p) = C_p`, `p` pointed classes | Pointed bijection; unpointed differs. |
| 1.9 classifying morphism | `cS¹`; `cS²`; point; `BG`; `Et(ℙ¹)` over `K` | iso; `π₂ = ℤ ≠ 0`; iso; identity; `Bπ₁ = *` but `π₂ = ℤ̂(1)` and `H²(ℙ¹,C₂) = C₂ ≠ 0` | Both directions. |
| 2.10 stabilizer quotient | `X = BC₃ → BC₂` trivial, `Y = BS₃ → BC₂` sign; `B = *` | pointed relative maps `Hom(C₃,A₃) = 3`; `S_X = C₂`, `Δ_XY = S₃`, orbits 2 = unpointed 2; `A₃`-orbits 3 ≠ 2; `B = *` gives `S_X = 1`, the absolute theorem | Quotient by `Δ_XY`. |
| 3.4 coefficients | `𝔾ₘ` with `ℤ`, `ℚ/ℤ`; `ℙ¹` with `ℤ` | `0 = colim Hom(C_n,ℤ)`; `ℚ/ℤ = colim ℤ/n`; `H²_et(ℙ¹,ℤ) = H¹(ℙ¹,ℚ/ℤ) = 0 = Hom((ℤ/n(1)),ℤ)` | Agrees with étale cohomology. |
| 3.5 profiniteness | nodal cubic `N`; `𝔾ₘ`; `Spec k`; `ℙ¹` degree 3 | `ℤ`-torsor the infinite chain, raw `π₁ → ℤ` onto, completion `ℤ̂`; all torsors with finite components, `Hom(π₁,ℤ) = 0`; `G_k`; `H³(ℙ¹,ℤ) = ℚ/ℤ(−1)` survives every cover, `H₂ = (ℤ/n(1))`, `Hom` to `ℚ/ℤ` is `colim ℤ/n`, finite images | Hypothesis necessary; route sound. |
| 3.5 finite-image criterion | `G = (G_i)` with each projection of finite image | `im(G_{j(i)} → G_i)` finite for each `i`; the system of images is pro-isomorphic to `G` | As stated. |
| 3.9d sequence | `𝔾ₘ × Y → Y`; `𝔸² ∖ 0 → ℙ¹`; `Y ⊔ Y → Y` | split, kernel `ℤ̂(1)`; `ℤ̂(1) → 1 → 1 → 1`, boundary `ℤ̂(1) → ℤ̂(1)` an isomorphism since `π₂(𝔸²∖0) = 0`; disconnected fibres excluded by the carrier (`Γ = C²`) | Example at 704 correct. |
| 3.9d degree-one input (695) | `𝔾ₘ × Y → Y`; `𝔸² ∖ 0 → ℙ¹` | smooth, coherent, fibres `𝔾ₘ` nonempty connected: 0-acyclic by the criterion; `D` two sections, `r = 1`, relative normal crossings; direct images constructible (finite type) | All hypotheses of 619 verified. |
| 4.0a | `Q = 1`; `S₃`; `ℤ_p`; `Q = C₂`, `H = C₂²`; conjugation order | ordinary outer Hom; `A₃` has center `C₃`; `pℤ_p` open, `{0}` not; two relative maps, `t ↦ (t,0)` excluded; `(123)(12)(123)⁻¹ = (23)`, then by `(12)`: `(13)`; `(12)(123) = (23)` conjugates `(12)` to `(13)` | Definitions and convention agree. |
| 4.0b | `Spec k′`, `[k′:k] = d`; purely inseparable; `ℚ(i)/ℚ`; `𝔾ₘ/ℚ` | index `d`; index 1; index 2, not surjective; index 1 | Open, not surjective. |
| 4.3 | `BC₂ → BS₃` over `G_ℂ = 1`; relative model `BC₃/BS₃` over `BC₂` | 4 pointed, geometric kernel `S₃`, 2 orbits = 2 unpointed; `A₃`-orbits 3 → 2 surjective, not injective | Surjection; center hypothesis for bijection. |
| 5.1 | `T` point, `X = 𝔸¹`; `T = ∅`; `T = [0,1]`, `X = 𝔾ₘ`; `X = Spec ℂ[ε]/ε²` | `ℂ = ℂ`; `1 = 1`; `1+t` unit, `t` not; singletons | Checks consistent. |
| 5.2 | `𝔸¹`; `BC_p`; constant `X` | contractible; `pⁿ` simplices in degree `n`, diagonal `BC_p`; agrees with `Sing` | Checks consistent. |
| 6.2 | `BC_p`; `BC_q`, `q ≠ p`; infinite set; `K(C_p,N+1) → *` | unchanged; `H^*(BC_q,𝔽_p) = 𝔽_p` in degree 0, contractible; profinite-set completion; `H^{N+1} = 𝔽_p` against 0, undetected by degree ≤ N tests | Test set infinite. |
| 6.3 | `P = BC_p`, `K = S¹`; `P = (Bℤ/pʳ)` | `π₀Map(S¹,BC_p) = C_p` both sides; `Mat = Bℤ_p`, `ℤ_p = lim Hom(ℤ_p,ℤ/pʳ)` | Adjunction consistent. |
| 0-acyclic definition (607) | `id`; `∅ → S`; `S ⊔ S → S` | unit iso; `1 ≠ 2`; `2 ≠ 4` | Nonempty connected fibres forced. |
| Criterion (⇒) (135, 617) | `X′ = {xy = t} ∖ {0}` over `A`, skyscraper `i_*{a,b}` | smooth, coherent, integral, constant sheaf `2 = 2`, skyscraper `2 ≠ 4`; closed fibre two punctured lines | Not 0-acyclic, as the criterion predicts; Check 634 correct. |
| Criterion (⇐) | `𝔾ₘ × Y → Y`, `Y` strictly local; `Spec κ ⊔ Spec L → Spec R` | section constant `a` on the connected closed fibre, agreement open, every geometric fibre reached by local 0-acyclicity and connected: `Γ = C` both sides; not locally 0-acyclic at `Spec κ` (empty Milnor fibre), `2 ≠ 4` | Hypothesis necessary; Check 633 correct. |
| Local 0-acyclicity (631) | `x ↦ x²` at `0` | `K[x]^{sh}` free of rank 2 over `K[t]^{sh}`, two points over the geometric generic point | Not locally 0-acyclic; structure morphisms only. |
| Surjectivity via `π_*C` (619) | connected double cover, `X = S`; the `R` witness with the trivial cover | `Γ(S,π_*C) = 2 = Γ(X′,C)`; `Γ(Spec R,C) = 2`, `Γ(X,C) = 4`, pullback disconnected | Step sound; fails exactly without 0-acyclicity. |
| Homotopy exact sequence hypotheses (619) | `f = id`; `Spec ℂ → Spec ℝ`; `S′` étale non-finite (R02) | `1 → π₁S → π₁S → 1`; two-point fibre, `1 → 1 → C₂ → 1` false; SGA1 quantifies over finite étale covers only | Hypotheses necessary; R02. |
| Middle exactness route (619) | `Q` Galois with group `F`, `Q|X_s` induced from `G ⊊ F` | `E = Q/G` has a section on `X_s`; `(E,f′)` dimension ≤ 0 by 1.13(3); `f′_*E` locally constant by 1.14 and 1.16; constant after a finite cover, `E` acquires a section, `Q` disconnected | Matches SGA1 12150–12160. |
| Universal local 1-asphericity (615) | nodal cubic at the node; `X = ∅`; `X₂ = X₁ ×_X X₁` non-reduced | strictly local two-branch ring: connected, no finite torsors; vacuous; reduction changes no étale topology | Target true; route ends in base-change form (R01). |
| Finite-type target (613) | `N` with normalization `ℙ¹`; `X = ℙ¹ ⊔ ℙ¹` (R06); Zariski descent on `X` smooth non-affine | classes `F/conjugation` before and after base change; sections bijective for `E` of mixed degree; faithful → fully faithful → equivalence on `Z ⊗_K A` from affine pieces | Route proves the stated structure-morphism target; R05, R06 notes. |
| Product formula (619) | `𝔾ₘ²`; `Y = Spec K`; `Y` infinite-variable polynomial ring (R03); `𝔸²` in characteristic `p` | `ℤ̂(1)²`; identity; SGA1 4.6 a) applies, README excludes it; Artin–Schreier class `xz` not `f(x)+g(z)` | True; narrower than source (R03). |
| Normal crossings (611) and Checks 626–628 | `U = 𝔾ₘ`, `C₂`, over `A`; `D = ∅`; `D: z² = s` | classes `1, z` both sides (`A^×` 2-divisible, `Pic = 0`); trivial; stalks 2 then 1, base change fails | Target and Checks consistent. |
| `i_*Φ` (627) | `U = 𝔾ₘ ⊂ ℙ¹`, `C₂` at `0` | two classes with automorphisms `C₂` against one class on `U` | Not a torsor stack; gap wording needed. |
| Ownership of §§3.3–3.5, 3.9d (R04) | AnabelianGeometryAndNonabelianChabauty §1.5, §§1.10–1.11 at its head | same SS locators, merge order 197 against 44, no citation of this roadmap, plan `restructure` already repoints | Owner is this roadmap; Scope clause. |
| Headlines 3.7, 4.7, 6.8 | `𝔾ₘ/ℝ` with `C₃`; `z ↦ (z²,z³)`; `ℙ¹/ℂ`, `BC_p` | `H¹ = C₃` with conjugation `1 ↦ 2`; `(2,3) ∈ ℤ̂²`; dimensions `1,0,1`, comparison iso; `H¹(BC_p) = 𝔽_p ≠ 0` excluded | Unchanged since round 4; recomputed. |

### Declared gaps

The 26 slugs of `design/plan.json` are the 26 `What <Supplier> must provide (gap:…)` paragraphs of the README, each with the same supplier and `needs` sentence (checked mechanically: 0 mismatches), and every slug is consumed by at least one `*Needs:*` line. `nonabelian-local-acyclicity` is now precise and true as requested (the criterion was re-derived under the pinned definition); R01 asks for one more clause. The other 25 are unchanged since round 4; the three EtaleCohomologyFoundations gaps ask for nothing §§F.0.1, F.2.1 and F.2.3 on main provide (module-sheaf constructibility at 175, `D⁺` torsion base change at 508, constructible-complex local acyclicity at 542).

### Supplier resolution and ownership

Every supplier section cited was resolved this round: on main, EtaleCohomologyFoundations §§F.0.1 (175), F.0.2 (200), F.0.4 (248), F.0.A2 (368), F.2.1 (504), F.2.3 (540), F.2.6 (645), F.3 (676; `etaleFiniteness` at 692 retains "ordinary constructible direct-image … results for finite-type field schemes", `lisseDirectImageTransport` at 707 for smooth proper `f`), 0.10 (1145); SchemeAndStackFoundations §§0.9–0.12 (848–969), 2.10 (3631), 2.15 (3867); EnhancedDerivedSheaves §§E0.2–E0.5 (191–242), E0.8 (376), E2.6 (2293); AlgebraicTopology Stages 6 (946) and 8 (1602); GeneralizedCohomology G2.1 and G2.10; BordismFormalGroups §F6.5 (1526) and its coherent-model-diagram block (2005); Orbifolds O4-N (314); ProfiniteProPGroups Layers 0, 3, 4 (125, 306, 529); UniversalCovers Stages 2–4 (99, 127, 140); at open heads, StableHomotopyKTheory §§1.19, 1.23, 1.28, 1.34, 2.3–2.6, ResolutionOfSingularitiesCharacteristicZero §§5.1–5.5, 6.1–6.2, CrystallineCohomology CR.5:log-algebra.4 (*The classical Abhyankar lemma*: regular local, residue characteristic `p ≥ 0`, root covers, `∏_{ℓ≠p} ℤ_ℓ(1)^r` for strictly local `X`, as README 149 states), DiamondsAndVStacks §D0.13, AdicSpacesPartII §R0.19.9, PerfectoidSpaces §P6.10, ComplexComparisonPartII §§C−1.1, C5.1, C6.1–C6.3 with the five `complexSchemeAnalytification.*` names. Ownership by object through the service's index of main and all 367 open roadmap pull requests: "0-acyclic", "cohomologically proper", "rigid hypercover", "Isaksen" and "strongly center-free" occur in no other roadmap; "elementary fibration" occurs in ComplexComparisonPartII §C6.3 (a construction over `ℂ` inside the Artin-comparison route, not a carrier definition: the gap on SchemeAndStackFoundations is minimal) and in the later InverseGalois and Anabelian roadmaps (R04). The 16 board packages of the index concern none of these objects by title.

## Not verifiable

- FGV, BK, AM, Fr, SGA5 and SGA4 are settled uncertified: §§5.1, 5.2 of the sample, the FGV parts of §§3.3 and 6.2–6.3, AM 4.3 and 11.1 (§§3.5, 3.9b), Fr 5.9 and 11.5 (§§3.4, 3.9d), SGA5 I 3.1.5 (strong desingularizability) and the SGA 4 statements requested by the three gaps (XV 1.11, 1.16, 2.1, 4.1; IX 1.6(ii), 2.9, 2.11; XII 5.1; VIII 9.4) were checked only against SGA1's own citations of them (lines 10460, 10748, 10801–10806, 11596, 11998, 12070, 12121, 12298) and against the derivations in this report.
- Ownership against open pull requests was checked through the roadmap service's index, not through sibling checkouts; the 16 board packages were not compared by object.

No source was requested and the manifest was not changed.

## Source issues

- **Misprint** in SGA1 at XIII Theorem 3.3, proof, printed p. 303 (SGA1 line 11998): the source says flatness with geometrically separable fibres makes the morphism universally 0-acyclic; it should be universally locally 0-acyclic, the property the paragraph announces; affects nothing.
- **Misprint** in SGA1 at XIII Proposition 4.1, printed p. 306 (SGA1 line 12121–12122): the parenthetical says that for a coherent locally 0-acyclic morphism, 0-acyclicity amounts to connected geometric fibres; it should say nonempty and connected, the empty scheme over `S` being a coherent locally 0-acyclic morphism with (Bourbaki-)connected fibres that is not 0-acyclic; affects nothing. The round-6 entry calling this an error is withdrawn: the standing hypothesis of local 0-acyclicity covers the round-6 counterexample.
- **Misprint** in SGA1 at XIII Proposition 4.6, proof, printed p. 311 (SGA1 line 12307): the source says the composite ending in the fundamental group of `Y` is an isomorphism; it should be the composite ending in the fundamental group of `X`, the one written being trivial by 4.0; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6962204", "job": "REV-PKG-EtaleHomotopyTypes~7", "model": "fable", "worker": "fable-rev165"} -->
