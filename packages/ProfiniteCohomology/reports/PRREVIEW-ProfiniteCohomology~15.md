# Review of ProfiniteCohomology (pull request #616 at 4b49a9b)

**Verdict:** needs changes

This is a full review of the head the previous review (r14) read. The folder has 0 changed lines since then, and `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ProfiniteCohomology'` is empty. The previous review's one finding, the pin lag, is not repaired and is re-raised as R01; it is this review's only blocking finding. The full pass found two new P3 findings, R02 and R03. Both can be repaired by editing the folder.

## R01 (P2) — The folder cites Tau Ceti as at main's pin `2fd255d9`, but the branch pins `358314d4`

Re-raised: H01

**Location:**
- `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean:34`–`:36`: "the headline theorems of the roadmap that the pinned libraries do not yet prove, each with `sorry`".
- Also `Suggested.lean:38`–`:51`, `:58`–`:66` and `:76`–`:84`, and the `sorry`s at `:315` and `:574`.
- `README.md:37`–`:39` and `:50` ("which the pinned Tau Ceti does not implement").

**Claim.** The branch's `lake-manifest.json` pins Tau Ceti `358314d4` and Mathlib `f6090c70`. Main (`3090489`) pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`, and the branch is 256 commits behind it. The README and the docstrings describe Tau Ceti as it is at `2fd255d9`.

I recounted at this head, against declaration and file indexes built from both Tau Ceti commits:
- **Names.** The README has 677 distinct backticked qualified names. 64 Tau Ceti names among them have no declaration at `358314d4` and do have one at `2fd255d9`. They include:
  - the 13 `OpenSubgroup.evensNorm*` and `indexTwo*` names;
  - `TauCeti.abelianizationProPClass_generates` and `TauCeti.galoisEvens_galoisRes`;
  - `continuousCochainsShortExact_shortExact_moduleCat`;
  - the `*_of_conj` conjugation theorems and `TauCeti.ContinuousCohomology.res_comp_conjMap`;
  - the eight `TauCeti.zHat.*` names.
- **Paths.** 30 backticked Tau Ceti `.lean` paths exist only at `2fd255d9`, for example:
  - `Evens/Norm/Basic.lean`, `ExactCochains/Basic.lean` and `Cup/ConnectingMap/Basic.lean`;
  - `ContCohomology/Conjugation/Basic.lean` and `PowerClassGroup/Basic.lean`;
  - `CohomologicalDimension/ClassModule/Sylow.lean`.

  So do the modules `ClassModule/PGroup` and `ClassModule/CoprimeRestriction`.

The two theorems stated with `sorry` at `Suggested.lean:309` and `:568` are proved Tau Ceti theorems at `2fd255d9`. The folder is therefore wrong at either pin:
- at its own pin it cites declarations and files that do not exist;
- at main's pin it states two proved theorems with `sorry`, and "do not yet prove" is false for them.

**Why the reply does not settle it.** The reply to H01 ("answered") accepts the facts, and says the repair starts with a merge that only the author or an operator may make. That settles who acts, not whether the folder is correct. The merge is needed anyway: the branch is behind main and conflicts with #1187 in this folder. The build passes only because `Suggested.lean` imports none of the missing modules. The finding is held so that the roadmap goes to a human.

**Witness.** `git grep -w abelianizationProPClass_generates` at `358314d4` finds nothing, and `ContCohomology/CohomologicalDimension/ClassModule/` there holds only `Basic`, `ChangeOfGroup`, `Cyclic/`, `Inflation` and `Transfer/`. At `2fd255d9` the theorem is `ClassModule/Sylow.lean:156`, and `galoisEvens_galoisRes` is `FieldTheory/GaloisCohomology/EvensNorm.lean:143`.

**Repair.** The author or an operator does this, not the folder's repair worker:
1. Merge `origin/main` into the branch, keeping this branch's text in the two conflicting files.
2. Replace the `sorry` at `Suggested.lean:315` with `TauCeti.abelianizationProPClass_generates Fact.out hG hV`. Replace the one at `:574` with `TauCeti.galoisEvens_galoisRes K L σ hdeg y`. Adjust the explicit arguments to the merged signatures.
3. Rewrite `Suggested.lean:34`–`:36` and `:76`–`:84`, and `README.md:37`–`:39`, so that the two universe theorems (`:275`, `:283`) are the only `sorry`s. At the new pin `OpenSubgroup.evensNorm` exists, so re-read `:58`–`:66`. `README.md:58`–`:60` lists the `𝔽₂` laws as remaining targets in their own right, so either state the ones that become statable or say why they are not headlines.
4. Re-run the gate with the targeted build. Also elaborate `Completed/LocalGaloisGroups/Suggested.lean` and `Completed/ProfiniteProPGroups/Suggested.lean`, which import this module and are outside the targeted build.
5. Update the pull-request description. It still describes `CohomologyUniverseComparison.lean`, `DimensionNormalization.lean`, "19 admitted targets" and Tau Ceti `a91d3aaf`, none of which is at this head.

## R02 (P3) — The dropped-name list misses six names that three roadmaps on main cite unqualified as this roadmap's

**Location:** `README.md:4065`–`:4095`: "The following names are cited in roadmaps as `ProfiniteCohomology.<name>` but are not declared in `Suggested.lean`, because the Tau Ceti declaration on the right states them".

**Claim.** The list covers citations written as `ProfiniteCohomology.<name>`. Every such citation on main resolves; I checked all 34. The supplier sections of three roadmaps on main also cite names unqualified, as this roadmap's declarations. Six of those names are declared by main's `ProfiniteCohomology/Suggested.lean` and dropped by this head:

| Dropped name | Main's declaration |
|---|---|
| `cup_add_right` | `:3897` |
| `trivialF2_isSmoothDiscrete` | `:5106` |
| `explicitH2Obj` | `:749` |
| `evensConj_eq_conjMapOf` | `:5517` |
| `coindEmbedding` | `:2213` |
| `dimensionShiftQuotient` | `:2221` |

None of the six is declared under that name in Tau Ceti at either pin, so after the merge these citations point at nothing.

**Witness.**
- `QuadraticFormInvariants/README.md:2332`–`:2335` lists `cup_add_right` under "[Profinite Cohomology, Layer 12]" and `trivialF2_isSmoothDiscrete` under "Layer 13". The same file cites `evensConj_eq_conjMapOf` at `:742` and `explicitH2Obj` at `:745`.
- `Completed/LocalGaloisGroups/README.md:131` (under "From `TauCetiRoadmap.ProfiniteCohomology`") cites `cup_add_right`.
- `Completed/ProfiniteProPGroups/README.md:165` and `:1300`–`:1301` cite `coindEmbedding` and `dimensionShiftQuotient`.

**Repair.** Widen the sentence at `:4065` to "cited in roadmaps as this roadmap's declarations, qualified or not". Then add one line per name:
- `cup_add_right` → additivity of `TauCeti.TopPairing.cup P m n a`, which is linear (`map_add`). It is the second-argument companion of `cup_add_left`; alternatively restore it beside `cup_add_left` in `Suggested.lean`.
- `trivialF2_isSmoothDiscrete` → `TauCeti.isSmoothDiscrete_trivialF2` (`ContCohomology/TrivialF2.lean:201`).
- `explicitH2Obj` → `TopModuleCat.of ℤ (TauCeti.ContCohomology.DiscreteH2 G M)`, the source of `explicitH2IsoContinuousCohomology`.
- `evensConj_eq_conjMapOf` → `OpenSubgroup.evensConj_eq_trivialF2Map` (`Corestriction/IndexTwo/EvensConj.lean:210` at `2fd255d9`, after R01's merge). Cite it also at `:245`–`:249`, which identifies the conjugate `s · β` with `OpenSubgroup.evensConj`.
- `coindEmbedding` → `TauCeti.DiscreteCoind.unit` at the trivial subgroup (`Coinduced/Discrete.lean:448`).
- `dimensionShiftQuotient` → `TauCeti.ContCohomology.CoindQuotient G ⊥ M` (`Coinduced/Quotient.lean:71`).

I checked each replacement at the pin stated.

## R03 (P3) — 9.4's remaining target, "the cofinality statement", has no statement, no Check and no consumer

**Location:** `README.md:2382`–`:2387`: "what has to be added is the identification of the quotient as a **topological** group and the cofinality statement in the form Layer 4 consumes. … The cofinality statement is the target of this subsection." The target is also listed among the remaining targets at `:56`.

**Claim.**
- 9.4 never says which map is cofinal, into which index category, or what follows from it.
- Nothing consumes it:
  - Layer 4 does not mention fields.
  - 9.5's route cites "the named quotient and fixed-field equivalences".
  - Tau Ceti's Hilbert 90 is reduced over every open normal subgroup (`subsingleton_H1_of_forall_openNormalSubgroup`, `ContCohomology/FiniteQuotient/Colimit.lean:589`).
- "Cofinal" also understates what Mathlib already gives, which is a bijection with all open normal subgroups.

**Witness.** Mathlib's `InfiniteGalois.IntermediateFieldEquivClosedSubgroup` (`Mathlib/FieldTheory/Galois/Infinite.lean:196`) is an order isomorphism `IntermediateField k K ≃o (ClosedSubgroup Gal(K/k))ᵒᵈ`. Together with `isOpen_and_normal_iff_finite_and_isGalois` (`:288`), it gives a bijection between the finite Galois `L ⊆ Kˢ` and all open normal subgroups of `G_K`. For `K = 𝔽_p`, the bijection is `𝔽_{pⁿ} ↔ nẐ`.

**Repair.** Choose one:
- **State the target.** "`L ↦ L.fixingSubgroup` is an order isomorphism from `FiniteGaloisIntermediateField K (SeparableClosure K)` onto `(OpenNormalSubgroup (AbsoluteGaloisGroup K))ᵒᵈ`, so Layer 4's colimits at `G = G_K` may be indexed by the finite Galois subextensions (Mathlib `IntermediateFieldEquivClosedSubgroup`, `isOpen_and_normal_iff_finite_and_isGalois`)." Then name its consumer, and add the Check "for `K = 𝔽_p`, `𝔽_{p²} ⊆ 𝔽_{p⁴}` goes to `2Ẑ ⊇ 4Ẑ`; the covariant orientation would claim `2Ẑ ⊆ 4Ẑ`".
- **Delete it.** Remove the target from 9.4 and from the list at `:56`.

## Previous findings

- **R01 (r14): not repaired.** The head is unchanged. `lake-manifest.json` still pins `358314d4`, and `Suggested.lean:34`–`:36` still reads "the headline theorems of the roadmap that the pinned libraries do not yet prove". Re-raised above as R01, with the recount at this head.

## Verified sound

**Gate, build, dependency check.**
- My gate run (`gate … ProfiniteCohomology --base origin/main`): every check `0`, `OK`. The worker's gate, with the targeted build, passed too.
- `lake env lean` on `Suggested.lean`: exit 0 in 18 s, with exactly four `declaration uses sorry` warnings, at `:275`, `:283`, `:309` and `:568`.
- Dependency check:

```text
depcheck: 235 roadmaps, 2261 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The one supplier roadmap, `RepresentationTheory/InductionRestriction`, is on main.

**Signatures and the padding probe.**
- I put a `#check @` for each of the 56 declarations of `Suggested.lean` into one scratch copy, under `pp.universes`, and elaborated it once.
- The four `sorry`ed theorems carry the binders the README states:
  - `abelianizationProPClass_generates.{u_1}`: `[Fact (Nat.Prime p)] … [CompactSpace G] [TotallyDisconnectedSpace G] (scd_p p G ≤ 2) (V) [V.Normal] (hV : IsOpen ↑V)`.
  - `galoisEvens_galoisRes.{u_1}`: `[FiniteDimensional K L] (σ) (hdeg : finrank K L = 2)`.
  - The universe theorems: `cohomologicalDimensionAt.{u_1,u_1} p G = cohomologicalDimensionAt.{0,u_1} p G`, and likewise for the strict invariant.
- `continuousCohomology.{u_1,u_2,u_3}` takes a `TopRep.{max u_2 u_3}`, so both sides of 11.2 act on `TopRep.{u}`, through different constants.
- `TauCeti.ofDiscreteModule` carries `[Module R M] [SMulCommClass G R M] [ContinuousSMul R M]`, as 1.3 says.
- The abbreviations carry the compactness hypotheses that README `:4016`–`:4018` lists:
  - `[CompactSpace G]` alone on `explicitH2IsoContinuousCohomology`;
  - none on `explicitFiniteQuotientComparison2`;
  - both on `explicitFiniteQuotientColimit2`.
- Nothing changed from r13/r14.
- One-tactic probe on each `sorry` (`first | rfl | (simp; done) | infer_instance | decide | norm_num | exact rfl`): all four fail. The universe goals print as `cohomologicalDimensionAt p G = cohomologicalDimensionAt p G` and stay unsolved. None of the four is padding.
- The proved one-term names are the consumer interface that four importers read (settled in r6–r13). `wreathSection` agrees with Tau Ceti's `wreathSectionFun` (`GroupTheory/GroupExtension/DihedralSixteen.lean:294`–`:298`) at all 8 coordinate triples.

**Importers outside the targeted build.** Scratch copies of `Completed/LocalGaloisGroups/Suggested.lean` and `Completed/ProfiniteProPGroups/Suggested.lean` elaborate against this head's module with exit 0 and no error. They read `cd_p`, `scd_p`, `H2`, `abelianizationProP`, `abelianizationProPClass` and `abelianizationProPClass_generates`.

**Cross-roadmap citations, resolved on main.**
- InductionRestriction: "What Mathlib already has (consume)" (`:101`) and Layer 0 (`:213`).
- ClassFieldTheory: Layer 6 (`:1220`) and `scd_p_absoluteGaloisGroup_eq_two` (`:1295`).
- Completed/LocalGaloisGroups: "Exact supplier contracts" (`:97`) and Layer 7 Step 3 (`:723`).
- Completed/ProfiniteProPGroups: Layers 5–7 (`:885`, `:1246`, `:1440`).
- QuadraticFormInvariants: Layer 9 (`:2797`).
- All 34 distinct `ProfiniteCohomology.<name>` citations on main resolve, either to `Suggested.lean` or to the dropped-name list.

**Ownership and overlaps.**
- `roadmaps grep` for the multiplicative transfer and the Evens norm finds owners nowhere but here. QuadraticFormInvariants excludes "the Evens norm in every degree" from its own scope (`:189`–`:195`).
- The universe comparison and the degree-one conjugation/corestriction square have no second owner.
- ProfiniteCohomologyPartII (open, a consumer) imports Layers 0–3, 5, 6 and 8–12. It declares `gap:char-p-galois-h2-vanishing` on Layer 9 (its README `:227`); the intake routes that gap, and it is not a defect of this folder.
- `scratch/overlaps.md`: no cited id is dropped, none is defined only by an open revision, and #1187 is the known conflicting head (order stated in an earlier reply).

**Library declarations opened at the branch pin `358314d4`** (paths under `ContCohomology/` unless stated):
- Layer 0: `GroupAction/Discrete.lean:135`–`:190`. `isOpen_ker_toPermHom` needs only `[ContinuousSMul G M] [Finite M]`, and `exists_openNormalSubgroup_smul_eq_self` needs `[CompactSpace G]`.
- Degree zero, the dictionary and the comparisons:
  - `DegreeZero.lean:131`, `:154`, `:163`, `:182`, `:194`;
  - `CompactDiscrete.lean:54`–`:55`, `:195`;
  - `CohomologyComparison.lean:134`, `:232`, `:318`, `:327`, `:414`.
- Exact sequences: `ShortExact.lean:165`–`:185`, `:328`; `Transgression.lean:577`, `:610`, `:642`–`:656`, `:696`–`:702`, `:779`, `:823`.
- Coinduction and cups:
  - `Coinduced.lean:205`–`:421`, `Coinduced/Adjunction.lean:44`–`:46`, `:93`, `:157`, `:206`;
  - `Cup/Product.lean` (all 20 `explicitCup_assoc*`), `Cup/ConnectingMap.lean:137`–`:268`.
- Galois interface: `FieldTheory/GaloisCohomology/Hilbert90.lean:186`, `:245`; `Kummer.lean:679`, `:842`, `:902`.
- Cohomological dimension: `CohomologicalDimension/{BoundedExponent:62, SingleDegree:112, Simple:64–68, 136, ClosedSubgroup:63–64, 80, IndexNotDvd:163, Basic:131–157, 250, Strict:181}`.
- Mathlib at its pin:
  - `ClopenNhdofOne.lean:42`–`:47`, `CompactOpen.lean:430`, `:466`, `:556`;
  - `Galois/Infinite.lean:196`, `:228`, `:288`;
  - `TopRep.lean:213`, `:230`, `:234`, `ContCohomology/Basic.lean:113`, `:131`.

  All full `Mathlib/…` paths in the README resolve at the pin, and so do 25 more Mathlib names I spot-checked.

**Sources read.**
- `MilneADT` line 449–461: Remark 0.11 defines `M_*` by `a(hx) = h·a(x)`, `(ga)(x) = a(xg)`, right adjoint to restriction, as 7.1 says.
- `MilneADT` line 542–548: Prop. 0.15, inner conjugation acts trivially (2.4).
- `MilneADT` line 296–301: (0.1.1)–(0.1.6), for Tate cohomology of a finite group, cited as such at 8.4.

**Adversarial table** (seeded sample, headlines, and every target a finding touches; values computed here):

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1 Openness | sign `C₂` on `𝔽₃`; trivial `ℤ_p` on `𝔽_p` | `Stab(1) = {e}` (`s·1 = 2`); `M^{C₂} = {x : −x = x} = 0`; `⋃ M^U = M^{1} = 𝔽₃`; kernel `ℤ_p`, quotient order `1` | consistent with the Tau Ceti hypotheses | none |
| 1.3 dictionary | sign `𝔽₃`; identity sign → trivial | `s·1 = 2` before and after bundling; equivariance fails, `2 ≠ 1` | consistent; scalar binders explicit | none |
| 1.6 degree 0 | trivial `C₂`, `f = ·2` on `ℤ` | `map φ f 0 ≫ zeroIso Y = zeroIso X ≫ invariantsResMap φ f`; `1 ↦ 2` both ways | direction as stated | none |
| 3.3 category | `G = ∏ℕ C₂`, trivial `𝔽₂`; `G = 1` | the evaluations at `g₁…g_n` leave a nonzero kernel in `⊕ℕ𝔽₂`, so `0` is not isolated pointwise; `1 ↦ 1` excludes `−id` | consistent | none |
| 5.2 data | `×2`, `×4` into `ℤ` then mod `2` | `ker = 2ℤ = im(×2)`; `im(×4) = 4ℤ ≠ 2ℤ` | `Function.Exact` field excludes `×4` | none |
| 5.5 five-term | `C₃ ⊂ C₉`, `f(i) = ⌊i/3⌋`; `C₂ ⊂ C₄` | `d¹f(2,1) = f(1) − f(3) + f(2) = 0 − 1 + 0 = 2 = −carry(2,1)`; `transgressionCochain_apply` is `d¹` of the lift; `res(parity) = 0`, `tg ≠ 0` | sign pinned; profinite and closed `N` needed | none |
| 7.1 coinduced | `C₂ ⊇ 1`, `𝔽₃`; `S₃ ⊇ 1` | 9 functions, `s·(1,0) = (0,1)`; `(a·(b·f))(x) = f(xab)` vs left translation `f(bax)` | matches `MilneADT` Remark 0.11 | none |
| 8.2 associativity | all `(p,q,r)`, `p+q+r ≤ 2` | `1 + 3 + 6 = 10` tridegrees; `(1,1,0)` uses `(1,0)` on the right; 10 + 10 `_mul` theorems at the pin | complete | none |
| 8.5 connecting maps | `(p,q) = (1,0)` | `d¹(a⌣b)(g,h) = −(a⌣d⁰b)(g,h)`, sign `(−1)^p = −1` = `explicitDelta1_explicitCup10_right` at the pin | names right, path R01 | R01 |
| 9.5 Hilbert 90 | `ℂ/ℝ`, cocycle `z` with `z·z̄ = 1` | `w = 1 + z`: `w/w̄ = (1+z)/(1+z⁻¹) = z`, so `H¹ = 0`; `subsingleton_H1_additive_units` needs only `[IsGalois K L]` | consistent | none |
| 9.7 field functoriality | `𝔽₉/𝔽₃`, `n = 2` | `N(g) = g⁴ = −1`, a non-square in `𝔽₃`, so the norm on square classes is `ℤ/2 ≅ ℤ/2`; `cor ψ = ψ ∘ Ver`, `Ver(1) = 2`, nonzero | `kummerIso_norm` direction as stated | none |
| 11.4 dévissage | `𝔽_p²`, `ℤ/p²`; sign `𝔽₃` on `C₂` | line `(1,0)`; subgroup `pℤ/p²`; only `0, 𝔽₃`, inflated to `C₄` still 3 elements | hypotheses (`p ≠ 0`, compact, prime) match | none |
| 11.5 subgroups | `ℤ_p`; `C_p` | `cd = 1 ≤ scd = 2 ≤ cd + 1 = 2`; `⊤ ≤ ⊤ + 1 = ⊤`; `eq_of_not_dvd_index` concludes `cd_p G = cd_p U` (map says "sides exchanged") | consistent | none |
| 13.1 index-two form | `C₄ ⊇ C₂`, `s = σ`, `α ≠ 0` | `b₁ = (0,1,1,0)`, `b_s = (0,0,1,1)`; `ν` rows `0000/0100/0011/0010`; 9 cocycle triples hold; `Σ_τ ν(τ,σ) = 1`, so the class is `C₈`'s; `res N(x) = x ⌣ evensConj x = x²`; polarization at `α = β`: `0 = cor(x²) = cor(res u) = 2u = 0` | consistent | none |
| 13.3 field form | `ℂ/ℝ`; `𝔽₉/𝔽₃` | `res⁰ = id`, `cor⁰ = 2 = 0`; `N(res χ) = N(0) = 0 = χ² + χ²`; `H²(Ẑ, 𝔽₂) = 0` | consistent; four Evens names at main's pin only | R01 |
| 11.2 universe equality (headline) | `G = 1`; `C_p`; `u = 0` | `0 = 0`; `⊤ = ⊤`; at `u = 0` one term; at general `u`, `rfl` fails between `.{0,u,u}` and `.{0,u,0}` | true, not padding | none |
| 11.8 class module (headline) | `ℤ_p ⊇ pℤ_p`; `ℤ_p × ℤ/ℓ ⊇ ℤ_p`; `C_p ⊇ 1`; `ℤ_p² ⊇ pℤ_p²` | `#H² = #(pℤ_p/p²ℤ_p) = p`, generator `Σ_τ f(τ,1) = p`; `ℤ_p/ℓℤ_p = 0 = p⁰`; excluded (`scd = ⊤`); `p⁴ ≠ p²` at `scd = 3` | hypotheses exact | R01 |
| 13.3 identity 5 (headline) | `ℂ/ℝ`, `y ∈ {0, χ}`; `𝔽₉/𝔽₃` | `0 = 0`; `0 = χ² + χ²`; both sides in `H²(Ẑ,𝔽₂) = 0` | true | R01 |
| 13.2 general norm (not statable) | `C₃ × C₂ ⊇ C₃`, `𝔽₃` | `N(2) = 2·2 = 1`, so `N(2a) = N(a) ≠ 2N(a)`; `res(1 + cor a + N a) = 1 + 2a + a² = (1+a)²` | Checks consistent | none |
| R02 dropped names | `cup_add_right` at `m = n = 1`, `C₂`, `𝔽₂` | `x ⌣ (x + 0) = x² + 0` by `map_add`; `TauCeti.isSmoothDiscrete_trivialF2` at `TrivialF2.lean:201`; `evensConj_eq_trivialF2Map` at `2fd255d9` only | replacements resolve | R02 |
| R03 cofinality | `K = 𝔽_p` | finite Galois `𝔽_{pⁿ} ↔ nẐ`; every open normal subgroup is hit; `𝔽_{p²} ⊆ 𝔽_{p⁴} ↦ 2Ẑ ⊇ 4Ẑ` | target unstated | R03 |
| R01 pin | 677 names; all backticked paths | 64 names, 30 `.lean` paths only at `2fd255d9`; `_moduleCat` at `ExactCochains/Basic.lean:425` there | folder cites main's pin | R01 |

## Not verifiable

- **NSW and Serre, *Galois Cohomology*.** Both are settled as `uncertified` and cited by locator. The sampled locators unchecked against the text are:
  - NSW (1.6.4) with the p. 61 footnote, (1.6.7), (3.3.2), (3.3.3), (3.3.5) and (6.2.1);
  - the mathematics of each was checked on the instances in the table.
- **Brown, Ribes–Zalesskii, Koch, and Serre's *Local Fields*.** None is in the sources cache, and all are paywalled books. They are needed for 5.5, 7.1, 8.2 and 11.5 alongside NSW.
- **Evens 1963, Kozlowski 1984 and Kahn 1984.** None is in the manifest. 13.2 is not in the sample, and 13.1 cites Kahn only for QuadraticFormInvariants' ownership, so I did not fetch them this round.
- **Elaboration at main's pin.** The Lean commands of this review run only at `358314d4`. I read the `2fd255d9` statements cited above from the Tau Ceti git history.

## Source issues

- none
