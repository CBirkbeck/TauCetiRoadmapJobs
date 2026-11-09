# Review of LocalPurity (pull request #1808 at 4322423)

**Verdict:** needs changes

This is a full review. The folder changed by 392 lines since `43a6b84`, all in `README.md`; `Suggested.lean` is unchanged. The pins are unchanged.

## Previous findings (review of `43a6b84`)

- **R01 (P2), formal glueing, 0EII and 0EKP unowned: repaired.**
  - §1.3 now states *FormalGlueData* (05EL), *formalGlueing_equiv* (05ER with 05EU), *formalSections_of_localCohomology* (0EII) and *completion_fullyFaithful_of_sections* (0EKP), at README 309–395.
  - All four appear in Scope (45–50), in the alignment table (641–643) and among the downstream consumers (668–670).
  - "not a second general gluing theory" is gone (`grep -c` gives 0).
  - One clause of *formalGlueing_equiv* now rests on an input nothing provides: see R01 below.
- **R02 (P3), gate `outside-folder`: not repaired.** The two one-line edits to `Completed/ArithmeticDirichletSeries/README.md:331` and `TauCetiRoadmap/SymplecticGeometry/README.md:77` are still on the branch. Raised again as R02.
- **R03 (P3), no stated order against #1854: not repaired.** The merge-order paragraph still reads "#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**". Raised again as R03.
- **R04 (P3), gaps in the *Needs:* lines: repaired.**
  - §2.2 now cites `Scheme.GlueData` (566, 591, 595).
  - Separatedness now descends through Limits, Lemma 32.8.6 (01ZQ), applied to the diagonal (568–570).
  - §1.4's *Needs:* names §0.17 `depth_eq_iff_ext` (479–480).
  - §1.2's *Needs:* names both Tau Ceti lemmas (289–291).
  - The two unused Mathlib entries are deleted (`grep -c` gives 0).
- **R05 (P3), no `### Examples` or `### Dependencies`: repaired.** Both layers have both subsections (482–516, 607–629), and Layer 1 gives positive and negative instances.
- **R06 (P3), SGA 1 Corollaire 3.2: repaired.** README 682–684 now says 3.1 is "recalled there without proof" and that 3.2 is "proved there when `dim A = 2`: depth `≥ 2` makes `B` free over `A`, and the discriminant then cuts out the ramification locus". This matches sga1 lines 8358 and 8380–8388.

## R01 (P2) — The "projective" clause of *formalGlueing_equiv* rests on a theorem no target, supplier or pin provides

**Location.** `TauCetiRoadmap/LocalPurity/README.md`:
- 344–346: "an `R`-module `M` is finite, finitely presented, flat or projective iff `M ⊗_R S` has that property over `S` and every `M_{f_i}` has it over `R_{f_i}`".
- 357–359: "Algebra, Lemma 10.83.2 and Theorem 10.95.6 for the others".

**Claim.**
- For an arbitrary, possibly infinitely generated, `M`, the "if" direction for projectivity is faithfully flat descent of projectivity: Algebra, Theorem 10.95.6 (05A9), the Raynaud–Gruson theorem.
- Stacks proves 05A9 with Kaplansky's dévissage and Mittag-Leffler modules.
- Nothing here owns 05A9: no target, no supplier section and no pinned declaration. No consumer needs it either: 0BLH uses only the finite clause.

**Witness.**
- stacks-00R4 line 10467 states 05A9 for arbitrary `M`.
- The pins have only finitely presented forms: Mathlib `Module.Flat.projective_of_finitePresentation` (`EquationalCriterion.lean:287`) and Tau Ceti `TauCeti.CentralBaseChange.projective_of_faithfullyFlat` (`CentralBaseChange.lean:339`).
- `roadmaps grep '05A9|descent of projectivity'` finds no owner.

**Repair.**
1. State the projective clause for finitely presented `M`. There, projective is the same as flat (Mathlib `Module.Flat.projective_of_finitePresentation`), so the clause follows from the flat and finitely presented clauses.
2. In the route, replace "Algebra, Lemma 10.83.2 and Theorem 10.95.6 for the others" with:
   - Mathlib `Module.Flat.of_flat_tensorProduct` for flatness;
   - finite presentation descent (Algebra, Lemma 10.83.2 (03C4), part (2)) as a step of this target;
   - `Module.Flat.projective_of_finitePresentation` for projectivity.
3. Change the alignment row for 05EU (README 641) to *adapted*, and say at the target how it differs from the source.

Check the repair on `M = R^(ℕ)`, which is projective and infinitely generated. The narrowed clause does not apply to it, and every finitely presented `M` is covered by Mathlib. If the general clause is wanted instead, state 05A9 as a target of its own, with its locator and route; no roadmap owns it.

## R02 (P3) — Gate `outside-folder`: two edits outside the pull request's folders

Unrepaired R02 of the review of `43a6b84`; no repair report marked it not actionable.

**Location.**
- `Completed/ArithmeticDirichletSeries/README.md:331`: "`LFunctions` consumes this package and supplies its own character-specific continuation".
- `TauCetiRoadmap/SymplecticGeometry/README.md:77`: "adapters consumed by HeegaardFloer and consumed by DGFloer".

**Claim.** The pull request edits two roadmap folders that are neither in its title nor among the folders the brief names as its own.

**Witness.**
- `git diff --stat origin/main...HEAD`, with the 15 declared folders excluded, lists exactly these two files, at one line each.
- The worker's gate at `4322423` reports `outside-folder=2`. It is the only failing check.

**Repair.** Revert both lines on this branch, or name both folders in the description so that each gets its own review.

## R03 (P3) — No stated order against #1854, which carries a different LocalPurity

Unrepaired R03 of the review of `43a6b84`.

**Location.** The description's merge-order paragraph: "#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**".

**Claim.** Pull request #1854, by the same author, changes both files of this folder in a different direction:
- Its README keeps a §1.1 and a Provenance section.
- It has none of §1.3's formal-glueing, formal-section or completion targets.
- Its `Suggested.lean` differs in the module docstring.

Whichever of the two merges second overwrites the other, and neither description says which merges second.

**Witness.**
- `scratch/overlaps.md`: "#1808 and #1854 conflict in … `TauCetiRoadmap/LocalPurity/README.md`, `TauCetiRoadmap/LocalPurity/Suggested.lean`".
- `roadmaps show LocalPurity --pr 1854` has 594 lines; its `diff` against this head is 813 lines; `grep -c formalGlueing_equiv` on it gives 0.

**Repair.**
- Name #1854 in the merge-order paragraph and say which of the two is rebased on the other.
- Carry one LocalPurity: drop the folder from #1854, or make its copy equal to this head's.

## R04 (P3) — Nine Checks carry backticked Lean-style labels that `Suggested.lean` does not declare

**Location.** `TauCetiRoadmap/LocalPurity/README.md`, lines 295, 299, 302, 546, 549, 553, 598, 601 and 604. For example, line 295: "- `test_closed_point_factor`: for `A = k⟦x, y⟧`, the algebras `A` and `A × A/𝔪` are finite and normal".

**Claim.**
- A Check is prose and never names a Lean counterpart.
- A backticked name of this roadmap's own claims that `Suggested.lean` declares it.
- None of the nine `test_…` names is declared there.
- Line 400 also says "the punctured spectrum of `R/zⁿ` having depth `2`". Depth belongs to the ring `R/zⁿ`, not to the punctured spectrum.

**Witness.**
- `grep -n test_ README.md` lists the nine lines.
- `Suggested.lean` declares only the four headline theorems, at lines 34, 45, 58 and 69.

**Repair.**
- Delete the nine backticked labels and keep each Check's prose.
- Line 400: write "`R/zⁿ` having depth `2`".

## R05 (P3) — The routes use SchemeAndStackFoundations §2.6 and §2.7 `localCohomology_flat_baseChange`, which the *Needs:* lines or contracts omit

**Location.**
- README 365–368, route of *formalSections_of_localCohomology*: "`H¹(W, F) ≅ H²_𝔞(M)` and there is an exact sequence … (SchemeAndStackFoundations §2.7 … , `Spec R` being affine)".
- §1.3's *Needs:* (452–463).
- The SchemeAndStackFoundations contract (235–246).
- The diagram (lines 30–31).

**Claim.**
- Both identities come from the localization sequence for supports once `H¹` and `H²` of `M~` on the affine `Spec R` vanish. That vanishing is SchemeAndStackFoundations §2.6, which no *Needs:* line, contract or diagram row lists.
- The contract lists three §2.7 names but omits `localCohomology_flat_baseChange`, which the 0BM6 route uses (446) and §1.3's *Needs:* lists (459).
- Flat descent is cited as Stacks text, although Mathlib has it at the pin.

**Witness.**
- SchemeAndStackFoundations README at this head, line 3660: "`test_affine_vanishing`: on `Spec A` every quasi-coherent module is acyclic" (§2.6).
- Line 3693: `localCohomology_flat_baseChange` (§2.7).
- Mathlib `Module.Flat.of_flat_tensorProduct` (`RingTheory/Flat/FaithfullyFlat/Basic.lean:589`).

**Repair.**
- Add SchemeAndStackFoundations §2.6 (vanishing of higher quasi-coherent cohomology on affine schemes) to §1.3's *Needs:*, to the contract and to the diagram row into Layer 1.
- Add `localCohomology_flat_baseChange` to the contract's §2.7 list.
- Add `Module.Flat.of_flat_tensorProduct` to §1.3's *Needs:* and to the Mathlib contract.

## Verified sound

**Gate, build and dependencies, rerun at `4322423`.**
- `gate … LocalPurity --base origin/main`: every field is 0 except `outside-folder`, including `readme-ids-missing`, `sorry-data`, `set_option`, `imports`, `statement-hygiene`, `stray-files`, `layer-ids`, `target-ids` and `depcheck`.
  - The rerun lists 28 `outside-folder` paths. Twenty-six lie in the 15 folders the brief names as the pull request's own; the worker's gate counts the remaining 2, which are R02.
- Dependency check, verbatim: `depcheck: 238 roadmaps, 2312 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
  - LocalPurity and its only roadmap supplier, SchemeAndStackFoundations, are both on main.
- `lake env lean TauCetiRoadmap/LocalPurity/Suggested.lean` gives exactly four warnings, `declaration uses 'sorry'`, at lines 34, 45, 58 and 69.
- No id is dropped that another roadmap cites. This head drops main's §§0.1, 0.2 and 1.1, which moved to Tau Ceti. Other roadmaps cite only §1.3, §2.1 and §2.2 (`roadmaps grep 'LocalPurity (§|Layer )'`).

**Signatures and padding.**
- In a scratch copy I ran `#check @` on all four declarations. The results equal `scratch/signatures.md` and the README statements:
  - `[IsRegularLocalRing A]` with `2 ≤ ringKrullDim A`;
  - `[Module.Finite A B] [Module.IsTorsionFree A B]`, every localization a normal domain, and `IsEtaleAt` at primes not over `𝔪`;
  - `[IsNoetherian X]` with `PurityHolds` at every `x ∉ U`;
  - `[IsLocallyNoetherian X]` with regular stalks of dimension `≥ 2`.
- The file has no `variable` block, so no binder can be lost. Nothing changed.
- In the same copy I replaced each `sorry` by `first | simp | rfl | infer_instance | trivial | exact inferInstance | decide`. All four fail (errors at 36:72, 52:72, 61:72 and 74:72), so nothing is padding.
- The four end theorems the README names (34–36) are all stated, and the docstring correctly says none is unstatable.

**Library declarations opened at the pins (66).**
- 57 by `#check @` in one scratch file. All resolve; `MorphismProperty.Over.pullback` resolves under `CategoryTheory`. Among them:
  - Mathlib: `AdicCompletion.flat_of_isNoetherian`, `AdicCompletion.pow_smul_top_eq_ker_eval` (needs `I.FG`), `Ideal.depth_eq_sSup_length_isRegular`, `IsIntegralClosure.finite`, `Module.Finite.of_finite_tensorProduct_of_faithfullyFlat`, `Scheme.Cover.glueMorphisms`, `Scheme.GlueData`, `Scheme.IsQuasiAffine.of_isImmersion` (needs `CompactSpace X`).
  - Tau Ceti, every declaration of the contract, for example `TauCeti.IsLocalRing.extends_iff_sections_finiteEtale`, `TauCeti.FiniteEtaleScheme.fullyFaithfulPullbackιOfTwoLeDepth`, `TauCeti.Algebra.etale_of_finiteNormal_of_ringKrullDim_eq_two`, `TauCeti.AlgebraicGeometry.LineBundleClass.isAmple_one_iff` and `IsLocalRing.two_le_depth_of_isIntegrallyClosed`.
- 9 by reading the source:
  - Tau Ceti `RingTheory/FormalGlueing/Torsion.lean:143` (05E9) and `:258` (05EC). Both are under `[Module.Flat R S]` with `R/I → S/IS` bijective, as the contract says.
  - Tau Ceti `AlgebraicGeometry/LineBundle/Ample.lean:71`: `IsAmple` is Stacks' definition, quasi-compact with affine `X_s` for sections of positive powers.
  - Tau Ceti `RingTheory/TensorProduct/CentralBaseChange.lean:339`.
  - Mathlib `AlgebraicGeometry/Morphisms/Finite.lean:41` (`IsFinite` extends `IsAffineHom`).
  - Mathlib `AlgebraicGeometry/QuasiAffine.lean:34` (`CompactSpace` and `IsImmersion X.toSpecΓ`).
  - Mathlib `RingTheory/RegularLocalRing/Defs.lean:18–31`.
  - Mathlib `RingTheory/Flat/EquationalCriterion.lean:287`.
  - Mathlib `RingTheory/Flat/FaithfullyFlat/Basic.lean:589`.
- The Tau Ceti folder `RingTheory/FormalGlueing/` holds only `Torsion.lean`. No pinned declaration carries a Stacks attribute for a tag this roadmap owns; the one 0BMA hit is Tau Ceti's dimension-two case.

**Cross-roadmap citations resolved (24).**
- SchemeAndStackFoundations at this head:
  - §0.9 `finite_presentation_limits` (902, 913–918; it lists closed immersion, which the separatedness step needs);
  - §0.14 *henselian_finiteEtale_equivalence* (1205, 1217);
  - §0.17 `Module.depth` and `depth_eq_iff_ext` (1275, 1277, 1285);
  - §2.6 (3623, 3660);
  - §2.7 `supports_localization_triangle`, `localCohomology_module_comparison`, `localCohomology_flat_baseChange` and `depth_localCohomology_vanishing` (3668, 3676, 3685, 3693, 3698);
  - §4.7 (5532);
  - §4.8 `CoherentFormalModule` and `completionFunctor` (5576, 5586–5589, 5639).
- Consumers:
  - PurityOfBranchLocus at this head (33, 56–58);
  - AbhyankarLemma on main (28, 55–57, 265–268);
  - PurityForFlatCohomology at its open head (98–100, 564–567, 1195, 1233, 1246; the formal-section citation now has an owner in *formalSections_of_localCohomology*);
  - CrystallineCohomology at its open head (440–445);
  - EtaleHomotopyTypes at its open head (155–161, two declared gaps addressed to LocalPurity §2.2; they are that roadmap's contract, not a defect here).

**Ownership.**
- No roadmap on main or at the 460 open heads states 05ER, 05EL, 0H77, 0EII or 0EKP; `roadmaps grep` finds them only in LocalPurity's copies.
- AdicSpacesPartIII on main (3868) states 0ALK (More on Algebra, Lemma 15.91.17), a consequence of 05ER, not 05ER itself.
- ArcTopologyAndDescent §§8.1 and 8.6, at its open head, owns the arc-sheaf formal glueing square for a datum with `A/Iⁿ ≅ B/IⁿB`. That is a different object from module glueing.
- LocalPurity is therefore the first owner of 05ER, 0EII and 0EKP.
- No `Suggested.lean` declaration shares a fully qualified name with another roadmap's.
- Remark for SchemeAndStackFoundations' own review: its README at this head (5913–5914, 7694–7696) says that LocalPurity §2.1 consumes 0AFS and Cohen–Macaulayness from its §4.13. LocalPurity takes both from Tau Ceti (`TauCeti.isRegularRing_of_isRegularLocalRing`, `TauCeti.IsRegularLocalRing.depth_eq_ringKrullDim`).

**Sources: the seeded sample, read at the locators in the cache.** Every theorem number, page, hypothesis and conclusion matches the README unless listed under Source issues.
- 1.2 (stacks-0BMA): 0BM8 line 2366, 0BLK 2380, 0BM9 2391 (p. 51). Algebra 00GV and 00LI: stacks-00R4 lines 3976 and 8010.
- 1.3:
  - stacks-09ZL (the More on Algebra chapter): 05E9 11273, 05EC 11295, 05EG 11375, 05EK 11431, 05EL 11453 (p. 249), 0H77 11477, 05EN 11492, 05EP 11502, 05EQ 11511, 05ER 11528 (p. 251), 05EU 11624 (p. 253).
  - stacks-0EKS: 0BLD 153, 0EII 1923 (pp. 41–42), 0EKP 2094 (pp. 45–46), 0EKS 2193 (p. 48).
  - stacks-0BMA: 0BLF 2245, 0BLH 2266 (p. 48), 0BLI 2283 (p. 49), 0BM6 2342, 0BLJ 2351, 0BLL 2421 (p. 52), 0EL8 2028.
  - stacks-01Q3: 01Q3 1942, 01QE 2061. stacks-0882: 0882 2935 (p. 62). stacks-00R4: 00MA 10677, 0BNG 10578, 03C4 9297, 05A9 10467.
- 1.4: 0BLS 2449 and 0BLM 2459 (pp. 52–53) in stacks-0BMA; 09ZL in stacks-09ZL line 1758.
- 2.1: 0BMA in stacks-0BMA 2503 (pp. 53–54). In stacks-00R4: 00NP 11920, 00NQ 11925, 0AFS 12566, 00R4 14937, 0567 20195. 0BJF in stacks-0BJF line 269. sga2 Théorème 3.4 (i), line 3390 (p. 94). sga1 3.1–3.2, lines 8359–8388 (p. 212).
- 2.2: in stacks-0BQ5, 0BQ5 2571, 0EY3 2627 (p. 54), 01ZP 861 and 01ZQ 870; 0EY7 in stacks-0BMA 2604 (p. 56). sga2 Proposition 3.3, line 3386. sga1 Corollaire 3.3, line 8394 (p. 213).
- The README flags no locator as unverified.
- §1.3 states the 05EL compatibility condition correctly, as `(α_{ij} ⊗ S) ∘ α_i = α_j` into `(M_j)_{f_i} ⊗_R S`; the source has a misprint there (Source issues).

**Adversarial pass.** Values computed in this review. A row marked "r42" was computed there and re-checked here against the unchanged statement.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 0BMA (1) `IsLocalRing.purityHolds_of_isRegularLocalRing` | `d=3` `k⟦x,y,z⟧`; `d=2` `k⟦x,y⟧`; `d=1` `ℤ_(p)`; `k[x²,xy,y²]_(0)` | `d=3`: `f=z`, `A/z=k⟦x,y⟧` regular of dimension 2, depth 3, so 0BLM extends. `d=2`: Tau Ceti base case. `d=1`: `ℤ_(p)[√p]` has disc `4p`, a nonunit, so the cover does not extend; excluded by `hd`. Non-regular ring: fibre `dim_k k[x,y]/(x²,xy,y²) = 3 ≠ 2` | true; `hd` and regularity needed |
| 0BMA (2) `Algebra.etale_of_finiteNormal_of_isRegularLocalRing` | `B=0`; `A×κ`; `A[z]/(z²−x)`; `A[z]/(z²−u)`, `u` a unit | `B=0`: étale. `A×κ`: `x·(0,1)=0`, not torsion free, excluded, and not étale (`not_etale_prod_residueField`). `z²−x`: disc `4x`, a nonunit at the height-one prime `(x)`, so `hpunct` fails. `z²−u`: disc `4u`, a unit, étale | true; torsion freeness needed (r42) |
| §1.2 *restrictPuncturedSpec_essSurj*, *finiteNormalEquiv* | `V=U⊔U`; `V=∅`; `d=1` | `Γ=A×A`; `Γ=0`; `Γ(Spec ℚ(√p))=ℚ(√p)`, not finite over `ℤ_(p)` | true; `d ≥ 2` needed |
| *FormalGlueData* (05EL) and its 4 Checks | `S=0, f=1`; `ℤ_(p)→ℤ_p, f=p`; `k[x]→k, f=x`; `ℤ→ℚ, f=p` | `M′=0`, `α_11=id`, `H⁰=M_1`. `H⁰=ℤ_p∩ℚ=ℤ_(p)`. `(k)_x=0=k[x^±]/(x)`, so `H⁰(Can R)=k×k[x^±]`, which has torsion and is not `R`. `Can(𝔽_p)=(0,0)=Can(0)`, so `Can` is not faithful | all 4 Checks correct |
| *formalGlueing_equiv* (05ER, 05EU) | `M=ℤ_(p)`; `M=ℚ` over `ℤ_(p)→ℤ_p`; `M=R^(ℕ)` | `Can(ℤ_(p))=(ℤ_p,ℚ)`, `H⁰=ℤ_(p)`. `ℚ⊗ℤ_p=ℚ_p` is not finite and `ℚ` is not finite: both sides false. `R^(ℕ)`: the projective "if" needs 05A9, which is unowned | equivalence and finite clause true; **R01** |
| *formalSections_of_localCohomology* (0EII) | `k⟦x,y,z⟧, g=z`; `k[x,y,z]_(x,y,z), g=z`; `k⟦x,y⟧, g=x`; `𝔞=R`; `g=0` | Both sides `R`, since `R/zⁿ` has depth 2. `R → R̂_z` is injective, not onto. Limit `=` completion of `R[1/y]`, which contains `y⁻¹`, while `Γ(W)=R`. `W=∅`: `0=0`. `g=0`: `M=M` | true; completeness and the `H¹, H²` hypothesis needed |
| *completion_fullyFaithful_of_sections* (0EKP) | `Spec k[x]`, `V(x)`; `Spec k⟦x⟧`; (4) ⇒ (3) | `k[x]→k⟦x⟧` is not onto, so (1) fails; `1/(1−x)` is not in `k[x]`, so (4) fails. `k⟦x⟧`: (1) holds and `Hom(P,Q)` is complete. `Hom(𝒪^,E^)=lim Γ(Y_n,E)` | true; the README supplies the proof of (4) ⇒ (3) that Stacks omits |
| 0EKS *completion_fullyFaithful_of_localCohomology* | `k⟦x,y,z⟧, 𝔞=𝔪, g=z`; `k⟦x,y⟧, g=x` | `H¹=H²=0`, fully faithful. `End(𝒪_U)=R`, but the completions' endomorphisms contain `y⁻¹`: not full when the hypothesis fails | consistent |
| 0BLH *finite_extend_of_completion* | `A=k[x,y]_(x,y)`, `V=U`, generators `x,y` | `H⁰=Â∩A_x∩A_y=A` inside `Â_{xy}`, so `Y=X` | true |
| 0BLI, 0BM6, 0BLJ | `k⟦x,y,z⟧, f=z`; `k⟦x,y⟧, f=xy`; `k⟦x,y⟧, f=x` | Depth 3: fully faithful. `f=xy`: `(xy)ⁿx^{−n−1}y^{−n−1}=x^{−1}y^{−1}≠0`, and `|Hom_U(U,U⊔U)|=2` against `|Hom_{U_0}|=4`, so not full. `f=x`: the hypothesis fails but the conclusion holds, because `k` is algebraically closed in `k((y))` | true; hypotheses needed (Layer 1 Examples) |
| 0BLS, 0BLM | `k⟦x,y,z⟧, f=z` | Covers of `U_0 = punct(k⟦x,y⟧)` extend by 0BMA (`d=2`), so `V` extends | true |
| *spread_from_localScheme* (0BQ5, 0EY3) | `S=Spec ℤ`, `U=Spec ℤ[1/p]`, `s=(p)` | `V=Spec ℚ`; `U` and `Spec ℤ_(p)` glue to `S`; separatedness via 01ZQ on the diagonal | true |
| `finiteEtale_extend_of_purity` (0EY7) | `Spec ℤ_(p)`, `U={η}`; `𝔸²∖0`; `U=X`; `U=∅` | Purity fails and `ℚ(√p)` does not extend. Origin: extends. `U=X`: vacuous. `U=∅`: only `∅`, which extends | true |
| *restrictOpen_fullyFaithful_of_depth* | `𝔸²∖0`; `Spec k[x,y]/(xy)` minus the origin | Depth 2: `Γ(U)=k[x,y]`. Depth 1: `Γ=k[x^±]×k[y^±]`, with 4 idempotents against 2 | true; depth needed (r42) |
| `finiteEtale_extend_of_regular_codimTwo` | `𝔸³∖L`; `𝔸²`, `U=D(x)`, `t²=x` | Generic point of `L`: dimension 2; closed points: dimension 3; extends. Generic point of `x=0`: dimension 1, and `t²=x` is ramified there | true; SGA 2 X 3.3 with 3.4 (i) |
| Conventions 3–4 (normal, depth) | `k⟦x,y⟧` | Ext-depth 2, and `(x, y)` is a regular sequence of length 2 (§0.17 `depth_eq_iff_ext`) | consistent |
| Lean signatures against the README | `#check @`; one-tactic probe | Types equal `signatures.md`; the probe fails at all four | match; no padding |

## Not verifiable

- Everything in the seeded sample was read in the cache.
- Ownership against open pull requests was checked through the roadmap index (460 heads) and the sibling checkouts this job provides.

## Source issues

- **Error** in stacks-0BMA at Lemma 58.20.3 (0BM9), p. 51: the source says sections give an equivalence onto all finite normal `A`-algebras étale over `U`; it should require `B` torsion free, since `A × A/𝔪` is not in the essential image; affects a stated result.
- **Error** in stacks-0BMA at Lemma 58.21.3 (0BMA), part (2), p. 53: the source says every finite normal `B` étale over the punctured spectrum is étale; `A × A/𝔪` is a counterexample, so it should require `B` torsion free; affects a stated result.
- **Misprint** in stacks-0BQ5 at Lemma 32.20.4 (0EY3), p. 54: the source takes the open `U′` with `U ⊂ U′ ⊂ X`; it should be `U ⊂ U′ ⊂ S`, since `X` names the scheme over `U′`; affects nothing.
- **Misprint** in stacks-09ZL at Remark 15.91.10 (05EL), p. 249: condition (a) composes `α_ij` with `α_i` into `(M_j)_{f_i}`; it should compose `α_ij ⊗ 1_S` with `α_i` into `(M_j)_{f_i} ⊗_R S`; affects nothing.
