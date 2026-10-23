<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/241#issuecomment-6362917255 -->
Review (claude) of 84a41ac

Verdict: needs_changes

1. **F01** (P1) Both declared gaps are unowned, and the intake cannot read them

   - **Location.** README lines 1040–1050: "NoncommutativeAnalyticDistributions is a paper-route proposal, not an adopted roadmap/stage in this checkout" and "PadicEnvelopingAlgebras likewise has no adopted stage/node here". Plan lines 1862–1877: each `gaps` entry has only `title`, `neededBy` and `detail`.
   - **Claim.** WM.1/cyclic-torsion-bound, and through it every later layer, rests on contracts G1 and G2.
   - **Witness.** Neither name occurs on main, at any open head (`roadmaps grep`), in the board packages index or in the merge order. The gaps lack slug, supplier, section and `needs`; no target lists `gap:<slug>`.
   - **Repair.** Give each contract an owner. Recommended: own both here, in a new layer before WM.1 (completed enveloping algebras and microlocalisation), with three targets:
     1. Û, its central reductions and Fu's PBW growth estimate: fu24 Lemma 3.3, Proposition 3.4 and Theorem 3.2 (pp. 8–11), including the all-weight strip repair of E6.
     2. The flat microlocalisation A→Û and the comparison of W-quotients: fu24 (17)–(18) and Theorem 4.3 (pp. 14–15), aw13 §10.
     3. Injectivity of A→Û/(Δ_i−λ_i) for every λ∈ℤ_p^m: aw14 Theorem 4.6 (p. 11) and Theorem 5.4 (p. 16), after a finite coefficient extension.

     The alternative is to declare each contract as a gap with supplier NoncommutativeAndEquivariantIwasawa, section Layer 0 (after §0.15), and a slug. Put the slug in `gaps` and in cyclic-torsion-bound's prerequisites. In the README, state it as "What NoncommutativeAndEquivariantIwasawa must provide (gap:<slug>)". **Test:** the named supplier then resolves. NoncommutativeAndEquivariantIwasawa is line 24 of the merge order, before CompletedCohomologyPartII, so the gate still shows 0 problems.

2. **F02** (P1) Five "requests" are prerequisites that the cited sections do not supply, and none is a declared gap

   - **Location.** README lines 1056–1098; line 1060 itself says "Existing noetherianity/global-dimension nodes supply only part of this contract." Plan lines 1763–1817. The affected prerequisites are those of WM.1/torsion-filtration, WM.2/free-approximation, WM.2/canonical-dimension-zero, WM.5/finite-type-dimension and WM.5/base-change-linear-count.
   - **Claim.** Those targets cite NoncommutativeAndEquivariantIwasawa (NE.0, NE.1), ModularForms §10C and GL2AutomorphicRepresentationsAndTransfer (R16.2, R17.4) as supplying their inputs.
   - **Witness.** NE has canonical dimension only for O[[G]], k[[G]] (§F.1): no Ore division ring of A, skew rank or aw13 Lemma 10.13. ModularForms §10C: non-equivariant formulas. R16.2/R17.4: no SL₂ count, no S₃/S₄ traces.
   - **Repair.** For each item, either own it here or declare a gap (slug, supplier, section, one-sentence `needs`) in `gaps` and in the README:
     - (Request 1) Add a WM.2 target for skew rank over a two-sided noetherian domain (Ore localization, additivity, torsion detection, rank a on A^a), or declare a gap against NE §F.1.
     - (Request 2) State aw13 Lemma 10.13 (p. 77) as a target here, or declare a gap against NE §F.1.
     - (Request 5) Cite ModularSymbolsPadicLFunctions §0.7 (Eichler–Shimura) and ALS.5b.5. Then own the SL₂(ℤ/N)-equivariant refinement at Γ(N) inside WM.5/finite-type-dimension, or declare it as a gap.
     - (Requests 6 and 7) Move fgt10 Propositions 4.10–4.11 (pp. 22–23) and the Definition 4.3 and Lemma 4.19 type data (dimensions and S₃/S₄ traces, pp. 25–26) into WM.5 as targets: this roadmap already owns the FGT summation. Cite only general base change and type uniqueness from the supplier (R17.4.2–R17.4.6, R16.2.9).

     Requests 3 and 4 are supplied and stay: LieHighestWeight Layer 0 (V(n), irreducibility, dimension n+1; self-duality follows from the classification) and Chebotarev Layer 10 (split-completely primes). **Test:** every remaining supplier citation names a section that states the fact consumed.

3. **F03** (P2) The two gap `needs` are compound and not minimal

   - **Location.** README lines 1042 and 1048. G1 asks for a map construction, a natural comparison, an algebra isomorphism, injectivity for all λ, base change and descent. It also gives instructions ("Do not use an unknown stage id…", "Assign and design this supplier before packaging").
   - **Witness.** G1 bundles at least five theorems. One of them, A/Ann_A(W_k)≃End(W_k), follows here from WM.0's absolute irreducibility of W_k by Burnside's theorem: fu24 (32), p. 22, gets it by counting dimensions.
   - **Repair.** Write one gap per statement, each a single sentence with its hypotheses, for example:
     - flat A→Û with M/Ann_A(W)M ≅ (Û⊗_A M)/Ann_Û(W)(Û⊗_A M) for finitely generated M and algebraic W (fu24 Theorem 4.3);
     - A→Û/(Δ_i−λ_i)_i is injective for every λ∈ℤ_p^m (aw14 Theorems 4.6 and 5.4, after a finite extension);
     - for δ nonzero in every integral central reduction, dim Hom_Û(Û/Ûδ,W_k) ≤ 2Σ_iα_i∏_{j≠i}(k_j+1).

     Own the End(W_k) clause in WM.0 and delete every process sentence. If R01 is repaired by owning G1 and G2 here, this finding is moot.

4. **F04** (P2) WM.2/regular-acyclicity restates a supplier's target

   - **Location.** README lines 383–407: "A^ℓ⊗_{ℚ_p}W with diagonal G-action is A-linearly isomorphic to A^{ℓ·dim W} … H_i(G,A^ℓ⊗W)=0 for i>0."
   - **Witness.** NoncommutativeAndEquivariantIwasawa §0.15: `IwasawaHomology.freeTwist` makes diagonal A⊗W A-free of rank dim W (inverse-action formula); its fourth Check gives H₀ of dimension dim W, no positive homology. §0.14 has `twist_free`.
   - **Repair.** Delete the target. List NE §0.15 (`IwasawaHomology.freeTwist`, `IwasawaHomology.vanish_above_dim`) and §0.14 (`twist_free`) in the supplier contracts. Repoint rank-upper, rank-lower and homological-shifting to NE §0.15. Keep "ℓ=1, k=(1,2): H₀ has dimension 6" as a Check of rank-upper. **Test:** for M=A^ℓ the imported statement gives H₀ of dimension ℓD(k+1) and no positive homology, which is exactly what the three consumers use.

5. **F05** (P3) Supplier citations by slugs that do not resolve, and two AF citations at the wrong layer

   - **Location.** For example README lines 591, 637–642, 669–671, 755–759, 872–874 and 904–905, among them `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality` and `AutomorphicFormsOnReductiveGroups:AF.4/borel-wallach-tempered-range`.
   - **Witness.** The ArithmeticLocallySymmetricSpaces README at its head has no anchors and no Layer ALS.5, only ALS.5a and ALS.5b. AutomorphicFormsOnReductiveGroups has no Layer 1a, its Layer 4 is about constant terms, and the tempered range is its §5.3.
   - **Repair.** Cite sections. The mapping:

     | Cited slug | Section to cite |
     | --- | --- |
     | ALS.0/standard-level-subgroups | ALS.0.10 |
     | ALS.0/neat-level-manifold | ALS.0.9 |
     | ALS.1/arithmetic-local-system | ALS.1.1 |
     | ALS.1/finite-complex-model | ALS.1.6 |
     | ALS.1/coefficient-change | ALS.1.7 |
     | ALS.1/level-pullback | ALS.1.8 |
     | ALS.2/boundary-stratification | ALS.2.5 |
     | ALS.2/stratum-nilmanifold-fibration | ALS.2.8 |
     | ALS.3/level-trace | ALS.3.6 |
     | ALS.4/boundary-triangle | ALS.4.1 |
     | ALS.4/levi-hochschild-serre | ALS.4.7, plus ALS.4.5–4.6 for the Kostant computation behind WM.5/cusp-torus-koszul |
     | ALS.5:finite-level-duality/verdier-poincare-duality | ALS.5a.2 |
     | ALS.5/automorphic-comparison | ALS.5b.4 |
     | ALS.5/cuspidal-cohomology | ALS.5b.5 |
     | AF.1a/relative-lie-cochain-complex | AF §1.1 |
     | AF.4/borel-wallach-tempered-range | AF §5.3, with §5.2 for the degree-one multiplicity two of D_k |

     Write the NoncommutativeAndEquivariantIwasawa and CompletedCohomologyPartII citations as sections too: NE §§0.12, 0.15, 1.12 and CC-II §§3.1, 4.2, 5.1, 5.7, 6.3. Their anchors already resolve. **Test:** each mapped section states the object consumed. For example, ALS.5b.5 gives the injective map H_cusp→H with image in H_!.

6. **F06** (P3) The README is not in TauCetiRoadmap form

   - **Location.** Line 1, "# Arithmetic locally symmetric spaces, Part II: weight multiplicities". Thirty blocks of the form "Target: … Kind: …", "Proof route:", "Direct prerequisites:", "Required API:", "Discriminating tests:", the first at line 49.
   - **Witness.** Required: `# Roadmap: <lower-case title>`, `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## Layer k` with `### k.n` prose, `*Needs:*`, `**Checks.**`, per-layer `### Examples` and `### Dependencies`. Field lists are refused; Checks name no Lean counterparts (**weightProduct_two**).
   - **Repair.**
     - Rewrite WM.0–WM.5 as Layers 0–5. Each target becomes prose with its hypotheses, its locator and a `*Needs:*` line built from its prerequisite list.
     - Tests become unnamed `**Checks.**` bullets.
     - Move "Baseline declarations" under `### From Mathlib` and `### From Tau Ceti`, and put the requests and gaps in per-supplier subsections.
     - The Route coverage table is broken by a blank line after its header (line 1200). Fix it, or delete it under R07.

7. **F07** (P3) Process narrative and planning residue

   - **Location.** Lines 5, 29, 33, 743, 1042, 1102–1192, 1196, 1227–1244 and 1268–1270, for example "The packet records its target graph…", "Provenance: Already recorded in PAPER-FU-24/E1", "The published NSF PAR PDF timed out during this run", "Create separate design jobs for…".
   - **Witness.** The README uses "packet" 17 times and PAPER-… identifiers 15 times, along with "adopted", "stage id", "this run", "checkout" and "until an exact SL₂ supplier is adopted". "Separate continuations" and "Coverage and completion conditions" are job bookkeeping.
   - **Repair.** Delete these sentences and both sections; the proposals for Parts III–V belong in the plan's `restructure`. Keep E1–E9 as a timeless "Source corrections" section without provenance lines, and drop the access dates and the timeout note.

8. **F08** (P3) The pins the README states are not the pins

   - **Location.** Line 33, "The pinned baseline is Tau Ceti f790474… with Mathlib 082e2d3…". Plan lines 15–17.
   - **Witness.** The content repository's `lake-manifest.json` pins Tau Ceti a91d3aa and Mathlib 6b7abb3. The plan itself records those two as its "currentUpstream".
   - **Repair.** State the manifest pins. All seven baseline declarations were re-opened at them (Verified sound) and exist in the files the README names.

9. **F09** (P3) No sources manifest

   - **Location.** `packages/ArithmeticLocallySymmetricSpacesPartII/sources.toml` was absent at submission.
   - **Witness.** The README cites fu24, aw14, aw13, marshall12 and fgt10 with SHA-256 values, but no manifest records them.
   - **Repair.** This review's fetches recorded all five entries; their SHA-256 values match the README's. The author still needs to add `cited_for` for every citing target and reconcile marshall12's title. The README pairs the arXiv v1 title with the Annals citation, whose published title differs (fu24 reference list, line 1214). Add a `version_note` for that.

10. **F10** (P3) Wrong Marshall locator for the realization comparison

   - **Location.** Line 700: "marshall12, §2.1, pp. 3–4 (arXiv:1103.2472v1). Both realizations are attached to the same algebraic representation."
   - **Witness.** marshall12 §2.1 (lines 103–129) defines only complex W_d; the p-adic V_d and the dimension equality are §2.2 eq. (7), p. 4 (lines 171–174) and §5 eq. (29) with its lemma, pp. 15–16 (lines 607–658).
   - **Repair.** Cite "marshall12, §2.2, equation (7), p. 4; §5, equation (29) and the lemma after it, pp. 15–16".

11. **F11** (P3) CompletedCohomologyPartII §5.7 must be applied to Res_{F/ℚ}SL₂ at the rational prime

   - **Location.** Line 710: "Apply CC.5/semisimple-homology-torsion".
   - **Witness.** CompletedCohomologyPartII §§5.6–5.7 fix one prime ideal 𝔭 above p of the base field and take K_0 inside G(F_𝔭). For SL₂ over F this gives a 3-dimensional K_0, not the 3d-dimensional product G that WM.3 needs.
   - **Repair.** Say in WM.3/spectral-dimension-bound and in the Conventions that §5.7 is applied with base field ℚ, group Res_{F/ℚ}SL₂ and 𝔭=(p), so that K_0=∏_{v|p}G_v (p split). **Test:** for F imaginary quadratic, dim K_0 = 6 = 3d, which matches "local homology vanishes above 3d".

12. **F12** (P3) A vacuous Check

   - **Location.** Line 911: "For c=0 ordinary and compact-support cohomology agree."
   - **Witness.** Every finite-index subgroup of SL₂(O_F) contains nontrivial unipotents, so a Bianchi congruence quotient always has c≥1 cusps. fgt10 §1 (line 134) has an empty cusp set only for cocompact Γ.
   - **Repair.** Replace it with a discriminating Check: at a neat level, the degree-one restriction to the boundary has image of dimension exactly c, half of b₁=2c (fgt10 §1, lines 146–150). So dim H¹ − dim H¹_! = c, inside the stated bound 2c.

13. **F13** (P3) WM.5/bianchi-lower is narrower than its source

   - **Location.** Line 982: "Let Γ be a fixed neat congruence subgroup of finite index in SL₂(O_F)".
   - **Witness.** Γ=SL₂(O_F) is not neat, yet it already satisfies the bound by fgt10 Theorem 4.17 (pp. 24–25). The restriction/corestriction route stated in the target never uses neatness.
   - **Repair.** State bianchi-lower for every congruence subgroup of finite index in SL₂(O_F). Keep neatness only in bianchi-two-sided, where the boundary computation needs it.

14. **F14** (P3) WM.4/cuspidal-support-dictionary uses at arbitrary level a carrier the parent defines only at neat level

   - **Location.** Line 743: "giving dim H_cusp^q(Y(K_f),V_κ)=2^{r₁}dim S_κ(K_f)", for arbitrary K_f.
   - **Witness.** ALS.5b.5 defines cuspidal cohomology for neat K. marshall12 §2.1 (lines 108–109) shrinks K_f to torsion-free Γ_i before stating (4).
   - **Repair.** State the identity at neat K_f; every consumer uses it at the neat auxiliary level K′_f. Alternatively, define H_cusp at non-neat level as the K_f/K′_f-invariants of a neat normal refinement and add that step.

15. **F15** (P3) WM.0/weight-product restates Mathlib

   - **Location.** Lines 67–72: weightProduct, _reindex, _update, _one.
   - **Witness.** At the Mathlib pin:
     - `Fintype.prod_equiv` (Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean:741);
     - `Fintype.prod_empty` (same file, line 753);
     - `Finset.prod_const_one` (same file, line 391);
     - `Finset.prod_update_of_mem` (Mathlib/Algebra/BigOperators/Group/Finset/Piecewise.lean:247);
     - `Finset.prod_pos` (Mathlib/Algebra/Order/BigOperators/GroupWithZero/Finset.lean:157).
   - **Repair.** In the Conventions, write D(x) for Mathlib's `∏ i, x i` and cite these lemmas under From Mathlib. Delete the definition target and its API. Keep its three numerical Checks under the proper-face target.

16. **F16** (P3) The planned Lean file contradicts the acceptance-test rule

   - **Location.** Line 5: "The suggested Lean file contains light scalar definitions and milestones … Its numeric bounds and symmetric-power examples are suggested forms".
   - **Witness.** The rule requires every headline statable at the pins to be stated, with no examples that compute values. Mathlib's `groupCohomology` (Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean:184) makes the Bianchi bounds on dim H^i(Γ,E_n), i=1,2, statable.
   - **Repair.** Replace line 5 with the package's headline list.
     - **To state:** two-sided linear growth of dim H¹(Γ,E_n) and dim H²(Γ,E_n), as ordinary group cohomology, for neat Γ⊆SL₂(O_F) containing a principal congruence kernel, where E_n is `TauCeti.symPowerRep` over ℂ tensored with its conjugate.
     - **To name in the docstring as not statable at the pins:**
       - Fu's local theorem, which needs rational completed Tor;
       - the cusp-form bound, for which no S_κ(K_f) carrier exists;
       - the cuspidal and compact-support versions.
     - **To leave out:** the scalar inequality and the symmetric-power examples.

17. **F17** (P3) "Part II" collides with CompletedCohomologyPartII's description of itself

   - **Location.** Line 1, and lines 27–33, which do not say where the base roadmap stops relative to CompletedCohomologyPartII.
   - **Witness.** The first paragraph of CompletedCohomologyPartII's "Scope and ownership" calls that roadmap the Part II of ArithmeticLocallySymmetricSpaces, starting where ALS stops.
   - **Repair.** The introduction should say where ALS and CompletedCohomologyPartII stop, and that this roadmap is their weight-aspect application consuming CompletedCohomologyPartII Layers 3–6. Whether the name stays is the board's decision.

## Verified sound

Files reviewed: `packages/ArithmeticLocallySymmetricSpacesPartII/design/README.md` (cited in the findings as "README line N"), `packages/ArithmeticLocallySymmetricSpacesPartII/design/plan.json` ("plan line N") and `packages/ArithmeticLocallySymmetricSpacesPartII/sources.toml`, which did not exist at submission (R09). There is no previous review. Four findings block (R01–R04); the other thirteen are P3. The mathematics held up: the adversarial pass found no false statement. What blocks is ownership. Two contracts have no supplier, five prerequisites are cited as supplied by sections that do not state them, and one target restates a supplier's theorem.

**Dependency gate** (output, verbatim):

    candidate: ArithmeticLocallySymmetricSpacesPartII is not in the merge order yet; checked as if placed after CompletedCohomologyPartII (the intake inserts it when its design is accepted)
    depcheck: 26 roadmaps, 217 edges, 0 problem(s)

There is no UPWARD or CYCLE line. All suppliers precede CompletedCohomologyPartII in the merge order: NoncommutativeAndEquivariantIwasawa (line 24), ArithmeticLocallySymmetricSpaces (57), AutomorphicFormsOnReductiveGroups (58), GL2AutomorphicRepresentationsAndTransfer (78) and CompletedCohomologyPartII itself (131). Chebotarev, ModularForms and LieHighestWeight are on main. Each supplier read at an open head is a new-roadmap pull request.

**Ownership by object.** `roadmaps grep` over main and the 327 open heads (index of 2026-10-23T09:46:21Z) found no other owner of Fu's bounds, of the FGT base-change count or of Ardakov–Wadsley microlocalisation. The searches covered Bianchi, Grunewald, Tirao, weight aspect, Ardakov, Wadsley and microlocal. The same holds for the ten packages in the board checkout. Of the 38 indexed board packages, the names were screened and the four nearest candidates were grepped at their heads, with no hit on the object: CompletedCohomologyAndLocalGlobalCompatibilityPartII, ShimuraVarietiesPartII, HigherHidaAndColemanTheory and AutomorphicCongruences, whose only hits are a different Finis paper. CompletedCohomologyPartII's own downstream list leaves Fu's applications to consumers. This roadmap is therefore the right owner of WM.0–WM.5. Two duplicates were found (R04, R15). WM.5/cusp-torus-koszul is a computed specialization of ALS.4.5–4.6 rather than a duplicate, and should cite them.

**Seeded source sample.** Fifteen targets drawn with Python `random.Random(<job id>).sample` over the 30 plan nodes; 14 verified, 1 locator defect. No locator was flagged unverified by the author.

| Target | Locator checked | Result |
| --- | --- | --- |
| WM.0/weight-product | fu24 Thm 1.4, p. 3 (lines 130–136); §6, p. 21 | ok |
| WM.0/proper-face-majorant | fu24 Thm 1.4 and the multiplicity-free definition, p. 3 (lines 121–137); Thm 3.2, pp. 8–11 (lines 405–554); §6 | ok |
| WM.0/local-algebraic-family | fu24 §6, pp. 21–22 (lines 1046–1056: p odd, W_k irreducible and self-dual) | ok |
| WM.2/regular-acyclicity | fu24 §6, p. 23 (line 1143) | ok (but R04) |
| WM.2/rank-main-term | fu24 (33)–(34), pp. 22–23 (lines 1122–1142) | ok |
| WM.2/homological-shifting | fu24 (35)–(36), p. 23 (lines 1143–1149) | ok |
| WM.2/common-homology-bound | fu24 Thm 1.4, p. 3; §6, pp. 21–23, with p odd from line 1046 | ok |
| WM.3/global-local-weights | fu24 p. 1 (lines 33–46); marshall12 §2.1 (lines 119–121) | ok |
| WM.3/split-auxiliary-prime | fu24 §7, p. 23 (lines 1152–1169: K_f=GK^p only, so the refinement is needed) | ok |
| WM.3/realization-comparison | fu24 (37), p. 23 (line 1161) ok; marshall12 §2.1 wrong | R10 |
| WM.4/sharp-global-bound | fu24 Thm 1.2, pp. 2–3 (lines 89–90; min over r indices, E4) | ok |
| WM.4/parallel-bound | fu24 p. 3 (lines 93–94) | ok |
| WM.4/bianchi-upper | fu24 Cor 1.3, p. 3 (lines 95–98) | ok |
| WM.5/base-change-linear-count | fgt10 Thm 4.17, pp. 24–25 (lines 1288–1326); Prop 4.18, p. 25 (lines 1340–1345); Lemma 4.19, p. 26; Cor 4.20, p. 27 (line 1417) | ok |
| WM.5/bianchi-lower | fgt10 Thm 4.17, Cor 4.20, §1 pp. 3–4 (lines 120–168); fu24 Cor 1.3 | ok (but R13) |

**Further source checks:**
- aw14 §4.6, p. 11 (Theorem: annihilator generated by ker χ_λ), and §5.4, p. 16. The page image of p. 16 shows the index range n ⩾ 0, so the first congruence kernel is included.
- aw13 §§10.12–10.13, p. 77: the Lemma, with m ⩾ 0 on the page image.
- The text extraction renders ⩾ as ">", which is why the two page images were read.
- Source corrections verified: E1 (fu24 lines 80–87 against marshall12 lines 123–129), E2 (fu24 Thm 5.1 covers induced λ only, lines 782–785), E4, E6 (fu24 line 537 proves k≥α only), E7, E8 (fu24 (16), line 670), E9 (fu24 (17), line 690).

**Adversarial pass.** One row per statement, with the values computed on each side. No false statement was found.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| weight-product | x=(2,4); I=∅; k=(0,0) | 8 vs sum 6; empty product 1; D(k+1)=1 vs ∏k=0 | true (R15) |
| proper-face-majorant | m=3, c_∅=2, c_{0,2}=3, x=(2,5,4); m=1; m=2 on (t,t); c_{1}=7 at (1,t) | 2+3·2·4=26; constant; t² against ≤C(1+2t), which fails for t>3C; 7t | true |
| minimum-weight-saving | (1,t), c_{1}=7; (t,t) with c_∅=c_0=c_1=1; m=1, c_∅=5; m=0 | 7t≤7t; 1+2t≤3t for t≥1 (equality at t=1); 5≤5; empty sum 0 | true |
| local-algebraic-family | k=0; k=(1,2); torus on std; p=3, k=3 integral dual | dim 1; 6; t⊕t⁻¹ reducible; Sym³(ℤ₃²)* is divided powers, not Sym³, so only rational self-duality is claimed, correctly | true |
| hom-coinvariant-dual | M=A; M=0; W trivial | D=D; 0=0; (M_G)* | true |
| cyclic-torsion-bound | δ=1; δ=0; m=1; strip k=(1,t), α=(3,3) | 0; D(k+1), a full term, so excluded; ((x)²−(x−α)²)/x≤2α; D=2(t+1)≤3(t+1) | true |
| torsion-filtration | ℚ_p[X,Y]/(X,Y); T=0 | A/(X)↠T, not an isomorphism; empty filtration | true |
| torsion-bound | T=0; m=1 | c=0; constant | true |
| free-approximation | A^a; A/Aδ; (X,Y)⊂ℚ_p[X,Y] | T=N=0, ℓ=a; a=0, ℓ=1; rank 1, 2 generators, syzygy ≅A via (Y,−X) of rank 1=ℓ−a | true |
| regular-acyclicity | ℓ=1, k=(1,2); G=1 | H₀=6, higher homology 0; H₀=W | true (R04) |
| rank-upper / rank-lower / rank-main-term | M=A^a; M=A/Aδ; a=0 | error 0; H₀≤U_T; lower bound −U_N≤dim | true |
| homological-shifting | M=A/Aδ, N=Aδ≅A, ℓ=1; Γ=ℤ_p sanity model, M=ℚ_p | dim H₁=D−D+dim H₀(M⊗W)≤U_M; 1−1+1=1=dim H₁ | true |
| common-homology-bound | m=1; A^a; i>3m; p=2 | constant; exact; 0 because gldim=3m (NE §0.12); I+2M₂(ℤ₂) is not uniform, so excluded | true |
| canonical-dimension-zero | M=W_k; M=0; M=A | 1≤1≤D; 0; A is infinite-dimensional, so not covered | true |
| global-local-weights | (0,1), κ=6; (1,1), κ=(4,6); κ=(2,…,2); real κ=2; complex κ=3 | t=(2,2), 9, 36, min x=3≥3; t=(2,2,2), 27≤144, 3≥2; 1 and 2^d; x=1=κ/2; rejected | true |
| split-auxiliary-prime | p=3 neatness | trace −1 in I+3M₂(ℤ₃) forces det X=1/3, so no ζ₃ eigenvalue | true |
| realization-comparison | O--p→O; [L:ℚ_p]=2 | ℚ_p: 0, 𝔽_p: H₀=H₁=𝔽_p; ℚ_p-dimension 2 | true (R10) |
| spectral-dimension-bound | F=ℚ; F imaginary quadratic | discrete series, so excluded; local degrees ≤6=3d | true (R11) |
| cuspidal-support-dictionary | (0,1); F=ℚ; κ=2 | 2⁰=1; H¹_cusp=2 dim S_k; dim V=1, so excluded | true (R14) |
| sharp-global-bound | (0,1); (1,1), κ=(2,K) | Δ/min κ=κ; 2K²/2=K², with D(x)=(K/2)², so no saving claimed in that direction | true |
| parallel-bound | (1,1) | Δ/κ=κ²·κ/κ, exponent d−1=2 | true |
| bianchi-upper | κ=6 | n=2, dim E₂=9 | true |
| cusp-torus-koszul | n=0; n=2; generic n | (1,2,1); H¹=2 vs 18 for a trivial rank-9 system; χ(T²)=0 with h⁰=h²=1 gives h¹=2; det[[z₁,z̄₁],[z₂,z̄₂]]=2i·Im(z₁z̄₂)≠0 | true |
| bianchi-boundary | i=1; i=2; n=0 connected; c=0 | ≤max(2c,c)≤3c; ≤3c; H_c³=ℂ, cokernel 1 (fgt10 lines 151–152); no instance | true (R12) |
| finite-type-dimension | N=1, σ=1, k=12; k=2; odd k | 11/12−1/2+1/4+1/3=1=dim S₁₂; 1/12−1/2−1/4−1/3+1=0=dim S₂; −I acts by (−1)^k, so 0 | true |
| base-change-linear-count | ℚ(i); ℚ(√−3); ℚ(√−5) | A=5/24, B=1/8, A−B=1/12; A=1/6, B=0; A=5/4, B=1/4, A/B=5=(5/3)·3^{s−1} | true |
| bianchi-lower | Γ=SL₂(O_F) | bound holds without neatness | true (R13) |
| bianchi-two-sided | i=2 | lower bound via duality, E_n≅E_n* since Sym^n is self-dual | true |
| Casimir convention | [e,f]=h (fu24 (6)) | highest weight: ½k²−k+2(fe+h)v=½k(k+2) | true |
| E2 parameter | p=3, λ=1 | 2λ+1=3, not a square in ℚ₃; induced λ gives (μ+1)² | true |
| G2 bound | k≥α; k_i<α_i | ∏x²−∏(x−α)² ≤ Σ2α_ix_i∏_{j≠i}x_j², giving 2Σα_i∏_{j≠i}x_j; D≤α_i∏_{j≠i}x_j | true |

**Library declarations opened at the manifest pins** (Tau Ceti a91d3aa, Mathlib 6b7abb3):
- `TauCeti.symPowerRep` (TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean:59, a GL(Fin n) k representation for a commutative ring k);
- `SymmetricPower.finrank_eq` (TauCeti/LinearAlgebra/SymmetricPower/Basis.lean:203);
- `Finset.prod` (Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean:67);
- `Finset.powerset` (Mathlib/Data/Finset/Powerset.lean:31);
- `MvPolynomial` (Mathlib/Algebra/MvPolynomial/Basic.lean:79);
- `Module.finrank_tensorProduct` and `Module.finrank_baseChange` (Mathlib/LinearAlgebra/Dimension/Constructions.lean:373, :376);
- the Mathlib lemmas of R15 and `groupCohomology` (R16).

**Cross-roadmap citations resolved.** Read at the open heads unless marked as main:
- NoncommutativeAndEquivariantIwasawa: §§F.1, 0.12, 0.14, 0.15, 1.12, resolved by anchor.
- CompletedCohomologyPartII: §§3.1, 4.2, 5.1, 5.6, 5.7, 6.3, 6.4, resolved by anchor.
- ArithmeticLocallySymmetricSpaces: §§0.9, 0.10, 1.1, 1.6, 1.7, 1.8, 2.5, 2.8, 3.6, 4.1, 4.5, 4.6, 4.7, 5a.2, 5b.4, 5b.5. Their content matches the parent's ownership paragraph, but the README cites them by slugs (R05).
- AutomorphicFormsOnReductiveGroups: §§1.1, 5.2, 5.3.
- GL2AutomorphicRepresentationsAndTransfer: Layers R16.2 and R17.4.
- ModularSymbolsPadicLFunctions §0.7.
- On main: Chebotarev Layer 10, ModularForms §10C and LieHighestWeight Layer 0.

**Shape.** All six definitions or constructions have at least three Checks (3, 4, 4, 3, 4, 4), and every target has a locator. No LaTeX delimiters and no pull-request numbers appear.

## Not verifiable

- **Published journal paginations:** Annals 200 (fu24), Annals 175 (the README's "published p. 1632" for marshall12), Münster J. Math. 7 (aw14), Annals 178 (aw13), Exp. Math. 19 (fgt10). These texts are paywalled. Every locator was checked against the arXiv or author version the README names.
- **fgt10 Theorem 4.17.** fgt10 omits the summation that completes Theorem 4.17 (p. 26, which describes it as tedious but elementary). The closed formula and its positivity were checked; the summation route this roadmap owns has no written source to compare against.
- **E3 and E5.** These alleged gaps inside fu24's proof of Theorem 5.7 were not re-derived. They are not load-bearing, because the design routes around fu24 §5 through aw14.
- **Lean.** Elaboration is not available (this lane does not elaborate). No Suggested.lean exists at the design stage, so the `#check @name` signature comparison and the one-tactic padding probe were not run.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "84a41ac", "job": "REV-DESIGN-ArithmeticLocallySymmetricSpacesPartII", "model": "opus", "worker": "fable-rev6"} -->
