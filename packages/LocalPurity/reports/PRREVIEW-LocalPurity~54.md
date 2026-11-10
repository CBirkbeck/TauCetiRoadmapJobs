# Review of LocalPurity (pull request #1807 at c271254)

**Verdict:** needs changes

The gate fails (`readme-ids-missing=4`), and four blocking findings stand. Two of them concern the lines this pull request changes (R01) or that `Suggested.lean` states (R02). The other two (R03, R04) were already on main: the README predates the current pins, and the pinned Tau Ceti now proves much of Layers 0–2. The other open pull requests that rewrite this folder against the pins (#1808, #1854) already carry most of the repairs below; see R10.

## R01 (P2) — The new 0AFS citation points at SchemeAndStackFoundations §4.13, which states none of it; the facts are pinned Tau Ceti declarations

**Location.** `TauCetiRoadmap/LocalPurity/README.md:37-40` ("Serre's theorem on regular local rings, the regularity of their localizations (Stacks 0AFS) and the conclusion that a regular local ring is a regular ring are SchemeAndStackFoundations §4.13 targets"). Also lines 34, 70-76, 270-271, 286-290 and 326-328.

**Claim.** §2.1 and §2.2 take three facts from SchemeAndStackFoundations §4.13: regular local ⇒ `IsRegularRing` (0AFS), "depth `d` of a regular local ring of dimension `d`", and normality.

**Witness.** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:5461-5463`: this theory is at the Tau Ceti pin, and §4.13 "restates none of it". Pinned: `TauCeti.isRegularRing_of_isRegularLocalRing` (`ProjectiveDimension.lean:441`), `TauCeti.IsRegularLocalRing.depth_eq_ringKrullDim` (`CohenMacaulay.lean:110`), `TauCeti.IsRegularRing.isIntegrallyClosed` (`Normal.lean:55`).

**Repair.** Cite these three Tau Ceti declarations, with their files, in the regular-local-rings bullet of the scope section and in the §2.1 and §2.2 *Needs:* lines. Replace the 0AFS sentence (lines 37-40) and the arrow on line 34 with that citation. Keep §4.13 only for `serre_normality_criterion`, which §4.13 does own (line 5493). Tested: `#check @TauCeti.isRegularRing_of_isRegularLocalRing` gives `[IsRegularLocalRing R] → IsRegularRing R`, and `#check @TauCeti.IsRegularLocalRing.depth_eq_ringKrullDim` gives `↑(depth ↧R) = ringKrullDim R`, both at the pin. The loop stays cut: `depcheck` reports 0 problems either way.

## R02 (P2) — `Suggested.lean` states its headlines on private stand-ins for pinned Tau Ceti carriers

**Location.** `TauCetiRoadmap/LocalPurity/Suggested.lean:65-96`, the declarations `finiteEtale`, `FEt`, `FEt.pullback`, `puncturedSpectrum` and `PurityHolds`. The headlines that use them are at lines 106 and 134.

**Claim.** The file defines its own carrier of finite étale schemes, its own punctured spectrum and its own purity predicate, and states 0BMA (1) and 0EY7 on them.

**Witness.** Pinned: `TauCeti.IsLocalRing.puncturedSpectrum` (`AlgebraicGeometry/PuncturedSpectrum.lean:52`; equal to the local copy by `rfl`) and `TauCeti.IsLocalRing.PurityHolds` (`FiniteEtale/PuncturedSpectrum.lean:63`). `FEt X = TauCeti.FiniteEtaleScheme X` fails `rfl`: a second carrier, against README line 59.

**Repair.** Delete the five definitions and import `TauCeti.AlgebraicGeometry.FiniteEtale.PuncturedSpectrum`. State `purityHolds_of_isRegularLocalRing … (hd : 2 ≤ ringKrullDim A) : TauCeti.IsLocalRing.PurityHolds A`. State `finiteEtale_extend_of_purity {X} [IsNoetherian X] (U : X.Opens) (h : ∀ x : X, x ∉ U → TauCeti.IsLocalRing.PurityHolds (X.presheaf.stalk x)) : (TauCeti.FiniteEtaleScheme.pullback U.ι).EssSurj`. Tested: both forms elaborate at the pins in a scratch copy, with only the `sorry` warning. Remove the unused `import TauCeti.RingTheory.RegularLocalRing.Basic`: the file elaborates without it.

## R03 (P2) — The README asks for, and says the libraries lack, what the pinned Tau Ceti already proves

**Location.** `README.md:14-18` ("Tau Ceti has finite étale schemes over a base and regular local rings as domains; … None of them has finite étale covers of punctured spectra or local purity"). Also `README.md:209-212` ("Tau Ceti's newer `FiniteEtaleScheme U` (not at this roadmap's pin)") and the targets of §§0.1, 0.2, 1.1, 1.2 and 2.2.

**Claim.** Layers 0–1 present these as open targets, and the summary says no library has them.

**Witness.** Pinned:
- 00R4: `TauCeti.Algebra.flat_of_isCohenMacaulay` (`MiracleFlatness.lean:72`).
- 0BJF: `TauCeti.Algebra.etale_iff_traceForm_nondegenerate`, `etale_iff_isUnit_discr`, `isUnit_discr_localization_iff` (`Etale/Discriminant.lean:66,122,144`).
- 0BLK: `extends_iff_sections_finiteEtale` (`Extension.lean:111`).
- 0BM9, full faithfulness: `restrictPuncturedSpec.fullyFaithful`.
- `FiniteEtaleScheme`.

**Repair.**
- Add a `From Tau Ceti` contract that lists, by name and file, the following.
  - The declarations above.
  - `free_of_normal_dim_two` and `flat_of_normal_dim_two`.
  - `puncturedSpectrum_eq_iSup_basicOpen`, `isCompact_puncturedSpectrum`, `restrictPunctured` and `restrictPunctured_faithful_of_one_le_depth`.
  - `TauCeti.AlgebraicGeometry.Spec.presheaf_map_leTop_bijective_of_isIntegral` (the affine form of 0BM8).
  - `FiniteNormalPuncturedEtaleAlg`.
  - `etale_of_finiteNormal_of_ringKrullDim_eq_two` (0BMA (2) for `d = 2`).
  - `TauCeti.FiniteEtaleScheme.fullyFaithfulPullbackιOfTwoLeDepth` (the affine form of `restrictOpen_fullyFaithful_of_depth`).
  - Mathlib's `IsLocalRing.depth` (`Mathlib/RingTheory/Depth/Basic.lean:78`).
  - Tau Ceti's `Module.IsCohenMacaulay`.
- Cite these at §§0.1, 0.2, 1.1, 1.2 and 2.2 instead of specifying them again. Keep as targets only what the pin lacks: 0BM8 for schemes, essential surjectivity in 0BM9, §§1.3–1.4, 0BMA for `d ≥ 3`, 0BQ5/0EY3, 0EY7 and the codimension-two corollary.
- Delete both quoted sentences. The second also violates timelessness ("prototype", "newer").
- Citing the pin for 00R4 also settles the second claim on miracle flatness. EnhancedDerivedSheaves on main (`README.md:714`, "this flatness criterion is part of the target") also claims it.

## R04 (P2) — The §1.3 routes rest on Stacks 05ER/05EU and 0EII/0EKP, which no target, supplier or pin provides

**Location.** `README.md:236-243` ("specialize formal module gluing along `A → Â` … (More on Algebra, Proposition 15.91.16 (05ER)) … The target here is the finite-morphism specialization, not a second general gluing theory"). The same holds for 0EII and 0EKP at lines 241-243.

**Claim.** `finite_extend_of_completion` (0BLH) and `completion_fullyFaithful_of_localCohomology` (0EKS) get their inputs from a "first" gluing theory and from formal-section comparisons.

**Witness.** On main and at this head, 05ER, 05EU, 0EII and 0EKP occur only in this README; SchemeAndStackFoundations never mentions them. Tau Ceti has only `FormalGlueing/Torsion.lean`, the torsion input to 05ER, not the equivalence.

**Repair.** In §1.3, make the following targets of this roadmap, each with its hypotheses and conclusion as in the source. Alternatively, cite an owner that states them.
- The formal-glueing equivalence: `R → S` flat, `I = (f_1, …, f_t)`, `R/I ≅ S/IS`; 05ER (stacks-09ZL line 11528).
- Its preservation of finiteness and of algebra structures; 05EU (line 11624).
- 0EII: `A` `f`-adically complete, `H¹_𝔞(M)` and `H²_𝔞(M)` killed by a power of `f` (stacks-0EKS line 1923).
- 0EKP, the implications (1)⇒(2)⇒(3)⇒(4) (line 2094).

Then add them to the §1.3 *Needs:* line, cite `TauCeti.tensorProduct_mk_bijective_of_primaryComponent_eq_top` for the torsion step, and delete "not a second general gluing theory".

## R05 (P3) — Padding: four declarations of `Suggested.lean` close with one `exact` of a pinned lemma

**Location.** `Suggested.lean:37` `flat_of_normal_dim_two`, `:46` `etale_iff_traceForm_nondegenerate`, `:54` `etale_iff_isUnit_discr` and `:126` `not_flat_prod_residueField`.

**Claim.** These are presented as targets.

**Witness.** In a scratch copy, the following tactics close each goal with no error.
- `exact TauCeti.Algebra.flat_of_normal_dim_two hinj hdim`.
- `exact TauCeti.Algebra.etale_iff_traceForm_nondegenerate K B`.
- `exact TauCeti.Algebra.etale_iff_isUnit_discr A B b`.
- `exact TauCeti.IsLocalRing.not_flat_prod_residueField A _`, which also mirrors the Check `test_closed_point_factor`.

**Repair.** Delete all four from `Suggested.lean`. The README cites the pinned declarations (R03).

## R06 (P3) — Gate `readme-ids-missing` (4), and the end-theorem names disagree between the README and the Lean file

**Location.** The names come from `README.md:187` (`puncturedSpectrum_eq_iSup_basicOpen`), `:251-252` (`finiteEtale_extend_of_hypersurface`, `finiteEtale_extend_of_localCohomology`) and `:322` (`finiteEtale_extend_of_regular_codimTwo`). `README.md:42-43` names `IsLocalRing.purityHolds_of_isRegularLocalRing` and `Algebra.etale_of_finiteNormal_of_isRegularLocalRing`.

**Claim.** These are presented as this roadmap's declarations.

**Witness.** The gate rerun at c271254 lists exactly these four names. `Suggested.lean` declares `TauCetiRoadmap.LocalPurity.purityHolds_of_isRegularLocalRing`, with no `IsLocalRing` or `Algebra` segment. The citations tool finds the README's two names nowhere.

**Repair.** For `puncturedSpectrum_eq_iSup_basicOpen`, cite `TauCeti.IsLocalRing.puncturedSpectrum_eq_iSup_basicOpen`. State the other three facts in prose without a backticked name, as the gate rule asks. Then either declare the end theorems as `IsLocalRing.purityHolds_of_isRegularLocalRing` and `Algebra.etale_of_finiteNormal_of_isRegularLocalRing` inside the namespace, or drop the prefixes in README lines 42-43 and 264-265.

## R07 (P3) — The module docstring claims that depth and Cohen–Macaulayness have no API at the pin

**Location.** `Suggested.lean:17-19` ("Conditions whose Mathlib API does not exist at the pinned version (depth, Cohen–Macaulay) are not stated here").

**Claim.** The docstring says these notions are absent at the pin.

**Witness.** The pin has `IsLocalRing.depth` (`Mathlib/RingTheory/Depth/Basic.lean:78`) and `Module.IsCohenMacaulay` (`TauCeti/RingTheory/CohenMacaulay/Basic.lean:67`). The pinned 0BLK and miracle-flatness statements use them.

**Repair.** Delete the sentence. Write the docstring in the target-signature form: "…: target signatures", saying that it states 0BMA (1), 0BMA (2) and 0EY7 against the pinned APIs. Also say that no headline is unstatable at the pins, or name the ones that are and what each lacks.

## R08 (P3) — README shape: missing sections, and definitions without Checks

**Location.** The README's headings: Summary, Scope and ownership, Conventions, Layers 0–2, Stacks alignment, Provenance, References. §1.1 (`README.md:180-192`) defines `puncturedSpectrum`, the restriction functor and `PurityHolds`, with no Checks and with its API inline.

**Claim.** The README omits several standard sections, and the §1.1 and §1.2 definitions lack discriminating Checks.

**Witness.**
- No `## Exact supplier contracts`, `## How to read the build` or `## Downstream consumers`.
- No layer ends with `### Examples` or `### Dependencies`.
- `FiniteNormalPuncturedEtaleAlg` has one Check (line 217); a definition needs three.

**Repair.** Add the missing sections. Give §1.1 at least three Checks, each computed:
- an Artinian local ring has `U = ∅`, so purity holds;
- for `ℤ_(3)`, `U = Spec ℚ` and `ℚ(√3)` does not extend (its integral closure `ℤ_(3)[√3]` has discriminant `12`), so purity fails in dimension one;
- for `k[x,y]_(x,y)`, `U = D(x) ∪ D(y)`.

Give `FiniteNormalPuncturedEtaleAlg` two more Checks:
- `A × A` lies in it;
- `k⟦x,y⟧[t]/(t² − x)` (characteristic `≠ 2`) is excluded, because it is not étale at `(t)`, which lies over `(x) ≠ 𝔪`.

Write the API as prose bullets.

## R09 (P3) — Locators: the codimension-two corollary has no source; the SGA 1 reference supports no target; 20.6 lacks its tag

**Location.** `README.md:322` (`finiteEtale_extend_of_regular_codimTwo` (*API*)), `:388` ("SGA 1, Exposé X, Théorème 3.1") and `:252` ("Lemma 58.20.6").

**Claim.** The corollary is marked *API*, with no source.

**Witness.**
- The corollary is SGA 2 X Proposition 3.3 with Théorème 3.4 (i) (sga2 lines 3386-3391).
- SGA 1 X Théorème 3.1 (sga1 line 8359) is branch-locus purity, PurityOfBranchLocus's subject.
- Lemma 20.6 is 0BLS (stacks-0BMA line 2449).

**Repair.** Cite SGA 2 X 3.3 with 3.4 (i) at the corollary. Change the SGA 1 reference to Corollaire 3.3, which is what the manifest records, or delete it. Write "Lemma 58.20.6 (0BLS)" and add a row for it to the Stacks-alignment table.

## R10 (P3) — No stated order against #1854, which also rewrites this folder

**Location.** The merge-order paragraph of the description ("No open pull request must merge before this one. The stacked ModularCurves and SchemeAndStackFoundations move follows #1101 and this pull request.").

**Claim.** This paragraph orders this pull request against #1808 only.

**Witness.** Per the overlap report, #1854 changes LocalPurity and its head conflicts with this one in eight other folders. `roadmaps show LocalPurity --pr 1854` shows it rewriting the passages edited here (`README.md:13-44, 70-76, 98-100, 264-292`) against the pin.

**Repair.** State in the merge-order paragraph whether #1854 merges after this pull request and is rebased on it, or the reverse. Since #1854's LocalPurity already makes most of the repairs in R01–R03 and R08–R09, consider carrying that text here instead of repairing this copy separately.

## Verified sound

**Gate and build.**
- The worker's gate, and my rerun at c271254, fail only on `readme-ids-missing=4`.
- My rerun also reports `outside-folder=25`. These are the sibling folders this pull request names; `git diff --stat` outside them is empty.
- `lake env lean TauCetiRoadmap/LocalPurity/Suggested.lean` gives 7 `sorry` warnings and nothing else.
- I compared `#check @` for all 12 declarations, taken from the signatures file and confirmed in my probe, with the README statements. No section binder is lost, and the generality matches the README for every theorem.

**Dependency check.** `depcheck: 236 roadmaps, 2265 edges, 0 problem(s)`. There is no UPWARD or CYCLE line. LocalPurity, SchemeAndStackFoundations, PurityOfBranchLocus and AbhyankarLemma are all on main.

**Seeded source sample.** I read 38 locators in the cached texts. All agree with the README, except the three source issues below.
- stacks-0BMA: 0BL6 (line 529), 0BN9 (550), 0EL8 (2028), 0BLF (2245), 0BLH (2266), 0BLI (2283), 0BM6 (2342), 0BLJ (2351), 0BM7 (2357), 0BM8 (2366), 0BLK (2380), 0BM9 (2391), 0BLL (2421), 0BLS (2449), 0BLM (2459), 0BMA (2503), 0EY7 (2604).
- stacks-0BQ5: 0BQ5 (2571), 0EY3 (2627).
- stacks-00R4: 00R4 (14937), 0AFS (12566), 00NP (11920), 00NQ (11925), 0567 (20195), 00GV (3976), 00H8 (4098), 00ON (12677).
- stacks-0BJF: 0BJF (269), including the field case in its proof.
- stacks-0EKS: 0EKS (2193), 0EII (1923), 0EKP (2094).
- stacks-09ZL: 05ER (11528), 05EU (11624), 09ZL (1758).
- sga2: Exposé X, Définition 3.2, Proposition 3.3 and Théorème 3.4 (i) (lines 3382-3391).
- sga1: Exposé X, Théorème 3.1 (8359) and Corollaire 3.3 (8394).

**Library declarations opened at the pins.**

Tau Ceti (paths under `TauCeti/AlgebraicGeometry/` or `TauCeti/RingTheory/`):
- `FiniteEtale/PuncturedSpectrum.lean:55,63,84,119`
- `AlgebraicGeometry/PuncturedSpectrum.lean:52,81,99`
- `FiniteEtale/Basic.lean:66`
- `FiniteEtale/Fiber.lean:51`
- `FiniteEtale/Extension.lean:111`
- `FiniteEtale/FiniteNormal.lean:88,204`
- `PuncturedSpectrum/Sections.lean:110`
- `FiniteEtale/FullyFaithful.lean:105`
- `Etale/Discriminant.lean:66,122,144`
- `Etale/ProdResidueField.lean:147`
- `RegularLocalRing/MiracleFlatness.lean:72,90,104`
- `RegularLocalRing/Purity.lean:75`
- `RegularLocalRing/ProjectiveDimension.lean:441`
- `RegularLocalRing/CohenMacaulay.lean:110,125`
- `RegularLocalRing/Normal.lean:55`
- `RegularLocalRing/Basic.lean:164,188`
- `CohenMacaulay/Basic.lean:67`
- `FormalGlueing/Torsion.lean`

Mathlib:
- `RingTheory/Depth/Basic.lean:78`
- `RegularLocalRing/Defs.lean:52` (extends `IsLocalRing` and `IsNoetherianRing`) and `:115`
- `Etale/Locus.lean:35` (`IsEtaleAt` is `FormallyEtale` of `A_q`, which is étale at `q` for finite `B` over Noetherian `A`)
- `Flat/Localization.lean:66` (localizes at the maximal ideals of `B`, the correct use in §2.1)
- `LocalRing/Module.lean:299`
- `Ideal/KrullsHeightTheorem.lean:483`
- `IntegralClosure/GoingDown.lean:48`
- `Trace/Basic.lean:507-508`
- `Localization/NormTrace.lean:83`
- `TensorProduct/Free.lean:65`
- `AdicCompletion/AsTensorProduct.lean:378`
- `Algebra/Homology/LocalCohomology.lean:173`

**Cross-roadmap citations resolved (13).**
- SchemeAndStackFoundations at this head: §0.6 `coherent_hartogs` (820), §0.9 `finite_presentation_limits` (968), §0.14 *henselian_finiteEtale_equivalence* (1155), §0.17 depth, Cohen–Macaulay and `(S_n)` (1213-1248), §2.7 (3399, 3412), §4.8 `CoherentFormalModule` (5210), §4.13 `serre_normality_criterion` (5493), `IsRegular.isNormal` (5456), and the 0AFS paragraph (5461-5475; see R01).
- ModularCurves §4D on main (1882, 1919).
- Consumers: PurityOfBranchLocus (lines 12, 55), AbhyankarLemma on main (28, 55), PurityForFlatCohomology at its head (594-598). This pull request drops no LocalPurity id.

**Ownership.**
- I searched for 0EKS, 0EL8, 0BLM, 0BMA, 0EY7, 0BQ5, 00R4, 0BJF, 05ER and 0BM9 on main and at 458 open heads. The other mentions are consumers or the sibling copies in #1808 and #1854; the exceptions are EnhancedDerivedSheaves on 00R4 (R03) and the unowned 05ER/0EII/0EKP (R04).
- The torsion-free correction in Convention 5 is right: a factor of a finite normal `B` that is étale over `U` has kernel `0` or `𝔪`, so torsion freeness removes exactly the factors over the closed point.

**Adversarial table.**

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 00R4 miracle flatness | `R = k⟦x,y⟧`, `S = R[z]/(z², xz, yz)`; `dim R = 0` | `dim S = 2 = 2 + dim(S/𝔪S) = 2 + 0`; `depth S = 0`, so not CM; `x·z = 0` with `z ≠ 0`, so not flat; a field base gives flat | CM hypothesis necessary; Check holds | at the pin (R03) |
| 0.1 `flat_of_normal_dim_two` | `B = k⟦s,t⟧ ⊇ A = k⟦s², t⟧`; non-normal `k⟦s⁴,s³t,st³,t⁴⟧` over `k⟦s⁴,t⁴⟧` | free of rank 2, so flat; the non-normal ring has depth 1 and dimension 2, so it is not CM and not free | normality needed; true as stated | delete from Lean (R05) |
| 0.2 trace-form criterion | `𝔽₂[x]/(x²)`; `𝔽₄/𝔽₂`; `K × K` | Gram `[[0,0],[0,0]]` is degenerate and the algebra is not étale; Gram `[[0,1],[1,1]]` has det `1` and the extension is étale; Gram `I₂`, étale | iff holds in characteristic 2 | delete from Lean (R05) |
| 0.2 `etale_iff_isUnit_discr` | `ℤ_(p)[x]/(x²−d)`, `p` odd, `d` a unit, and `d = p`; `p = 2, d = 3`; empty basis | disc `4d`, a unit, étale; disc `4p`, not a unit, ramified; disc `12 ∈ 2ℤ_(2)`, ramified at 2; `B = 0` has `det(0×0) = 1` and is étale | holds; both Checks right | delete from Lean (R05) |
| 1.1 `PurityHolds` | a field; `ℤ_(3)`; `k[x²,xy,y²]_0` | `U = ∅`, so it holds; `U = Spec ℚ` and `ℚ(√3)` has closure disc `12`, so it fails; the `μ₂` cover's closed fibre is `k[x,y]/(x²,xy,y²)` of length 3, non-reduced, so it fails | definition discriminates | Checks (R08); pinned carrier (R02) |
| 1.1 Lean carriers | `rfl` probes | `puncturedSpectrum A = TauCeti…puncturedSpectrum A` holds by `rfl`; `FEt X = FiniteEtaleScheme X` fails `rfl` | second carrier | R02 |
| 1.2 0BM8 | Artinian `A`, `Y ≠ ∅`; `Y = ∅` | closed points have depth `0 < 2`, so the hypothesis fails; `Γ(∅) = 0` and `Spec 0 = ∅` | holds | none |
| 1.2 0BM9 corrected | `A = k⟦x,y⟧`, `B = A × A/𝔪` | `Γ(Spec B ×_X U) = Γ(U,𝒪) = A ≠ B`; `x·(0,1) = 0` with `x ≠ 0`, so not torsion free | Stacks false; correction right | source issue |
| 1.3 0BLJ via 0BM6 | depth `A ≥ 3` | `H¹_𝔪 = H²_𝔪 = 0`, so killed by `f⁰` (stacks-0BMA 2354) | hypotheses as tagged | none |
| 1.3 0BLH, 0EKS routes | owners of 05ER, 05EU, 0EII, 0EKP | 0 targets, 0 supplier sections, 0 pinned declarations (only the torsion input) | unowned | R04 |
| 1.4 0BLM | regular `A`, `d = 3`, `f = x` | depth `3 ≥ 3`; `A/f` regular of dimension 2, so the induction applies; hypotheses match lines 2459-2462 | holds | locator 0BLS (R09) |
| 2.1 0BMA (1) | `d = 2`; `d = 1` (`ℤ_(3)`); `d = 0` | headline; `ℚ(√3)` does not extend, so it is false for `d = 1` and excluded by `hd`; `d = 0` excluded and trivially true | `hd` necessary | pinned carrier (R02) |
| 2.1 0BMA (2) | `A × A/𝔪`; `B = 0`; `A × A`; `k⟦x,y⟧[t]/(t²−x)` | not torsion free, so excluded; `B = 0` is étale; `A × A` is étale; at `q = (t)`, `q.under = (x) ≠ 𝔪` and the ring is not étale (disc `4x`), so `hpunct` fails | consistent | none |
| 2.1 route, 0AFS and depth | pinned `#check` | `IsRegularRing R`; `↑(depth ↧R) = ringKrullDim R` | at the pin, not in §4.13 | R01 |
| 2.2 0EY7 | `X = Spec k ⊔ Spec k` with one point in `U`; `X = Spec ℤ_(3)`, `U = {η}`; `U = X` | the Artinian stalk is pure, so it extends (empty on the other component); purity fails, `ℚ(√3)` does not extend, so the hypothesis is needed; pullback along the identity is essentially surjective | matches stacks-0BMA 2604-2607 | pinned carrier (R02) |
| 2.2 codimension-two corollary | `X = 𝔸²_k`, `U = 𝔸² ∖ 0` | `𝒪_{X,0}` regular of dimension 2 with depth 2, so the corollary gives `FÉt(U) = FÉt(X)` | holds | locator (R09) |
| 0BQ5 / 0EY3 | `U` retrocompact, `s ∉ U` | the README's statement matches lines 2571-2599 and 2627-2635: an equivalence on colimits, and separated, proper, finite and étale after shrinking | holds | none |

## Not verifiable

- Divisors, Lemma 31.5.11 (0E9I), and Algebraic and Formal Geometry 0EKT. This roadmap uses them only through SchemeAndStackFoundations §0.6. The Divisors chapter is not in this roadmap's source manifest, and I did not read it.
- #1808 and #1854. Their head commits are not in the local repository, so I could not decide by git whether their LocalPurity edits are stacked on this head. I read their LocalPurity text through `roadmaps show`.
- The Provenance repository (pcfawd-formalization) was not opened. It prescribes nothing.

## Source issues

- **Error** in stacks-0BMA at Lemma 58.20.3 (0BM9), p. 51: the source says global sections give an equivalence onto all finite normal `A`-algebras étale over the punctured spectrum; it should restrict to algebras torsion free over `A` (`A × A/𝔪` is outside the image); affects a stated result.
- **Error** in stacks-0BMA at Lemma 58.21.3 (0BMA), part (2), p. 53: the source says every finite normal `B` étale over the punctured spectrum is étale over `A`; it should assume `B` torsion free over `A`, since `A × A/𝔪` is finite, normal and not flat; affects a stated result.
- **Gap** in stacks-0BMA at the proof of Lemma 58.21.3, case `d = 2`, p. 54: the source applies going down to get `dim B_𝔪′ = 2` at every maximal ideal; this needs each factor of `B` to contain `A`, which fails for a factor `A/𝔪`; affects the proof.
