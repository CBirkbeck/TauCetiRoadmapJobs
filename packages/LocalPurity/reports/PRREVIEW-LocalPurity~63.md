# Review of LocalPurity (pull request #1807 at 89357f3)

**Verdict:** needs changes

Pins: Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`. The previous review's findings (at `3adc047`) are repaired at this head: R01 (Layer 0 and the Tau Ceti-owned targets are gone; "Owned elsewhere and consumed here", `TauCetiRoadmap/LocalPurity/README.md` lines 61–87), R02 (`Suggested.lean` imports `TauCeti.AlgebraicGeometry.FiniteEtale.PuncturedSpectrum` and states the headlines on `TauCeti.IsLocalRing.PurityHolds` and `TauCeti.FiniteEtaleScheme.pullback`), R03 (the four one-`exact` declarations are deleted), R04 (gate `readme-ids-missing=0`; 0BLS has its hypotheses, line 640, and its table row, line 853), R05 (the regular-local-ring, depth and Serre-criterion inputs are cited from the pins, lines 227–242). Four P3 findings remain.

## R01 (P3) — Vanishing of cohomology on an affine scheme is cited from SchemeAndStackFoundations §2.6, but is at the pin

**Location.** `TauCetiRoadmap/LocalPurity/README.md` line 285 ("§2.6 `serre_affineness_criterion` (higher quasi-coherent cohomology vanishes on an affine scheme)"), lines 483–484, 622; also lines 23–24, 33, 86–87, 688–689.

**Claim.** The only fact taken from §2.6, `H^q(Spec R, M~) = 0` for `q > 0`, is a SchemeAndStackFoundations target.

**Witness.** `AlgebraicGeometry.Scheme.Modules.subsingleton_cohomology_succ_of_isAffine`, `TauCeti/AlgebraicGeometry/Cohomology/Affine.lean:256` (`#check`ed at the pin); `TauCetiRoadmap/SchemeAndStackFoundations/README.md` on main, lines 4374–4376, itself attributes this direction to that declaration.

**Repair.** Add to **From Tau Ceti**: "`AlgebraicGeometry.Scheme.Modules.subsingleton_cohomology_succ_of_isAffine` (a quasi-coherent module on an affine scheme has no cohomology in positive degrees, Stacks 01XB; `AlgebraicGeometry/Cohomology/Affine.lean`)". Cite it at line 484 and in the §1.3 *Needs* line in place of "§2.6 (`serre_affineness_criterion`)". Remove §2.6 from lines 23–24 ("the cohomology of affine schemes"), 33, 86–87, 285 and 688–689.

## R02 (P3) — The routes use that `Â` is a Noetherian local ring and `A → Â` is local; no input is named

**Location.** `TauCetiRoadmap/LocalPurity/README.md` lines 540–541 ("Let `Â` be the `𝔪`-adic completion, `X′ = Spec Â`"), 569–571, 602–610, 645–652; the contract at lines 166–173 and the *Needs* lines 614–636, 657–659.

**Claim.** 0BLL, 0BM6, 0BLS, 0EKS and §2.7 *localCohomology_flat_baseChange* (stated for Noetherian rings) are applied to `Â`, and `Module.FaithfullyFlat.of_flat_of_isLocalHom` to `A → Â`, with every input listed.

**Witness.** No listed declaration gives `IsNoetherianRing Â`, `IsLocalRing Â` or `IsLocalHom (algebraMap A Â)`. At the pins: `Ideal.isNoetherianRing_adicCompletion` (`TauCeti/RingTheory/AdicCompletion/Noetherian.lean:213`); Mathlib instances at `Mathlib/RingTheory/AdicCompletion/LocalRing.lean:85` and `:116`.

**Repair.** Add to **From Tau Ceti**: "the instance `Ideal.isNoetherianRing_adicCompletion` (the adic completion of a Noetherian ring along any ideal is Noetherian; `RingTheory/AdicCompletion/Noetherian.lean`)"; to **From Mathlib**: "`AdicCompletion.isLocalRing_of_fg` and `AdicCompletion.algebraMap_isLocalHom_of_fg` (`Mathlib/RingTheory/AdicCompletion/LocalRing.lean`: the completion of a local ring with finitely generated maximal ideal is local and the map to it is local)". Name the three in the *Needs* lines of §1.3 and §1.4.

## R03 (P3) — The README says five times that its route is the source's

**Location.** `TauCetiRoadmap/LocalPurity/README.md` line 10 ("The route is that of Stacks, Sections 58.19–58.21:"), lines 362–363 ("The route to essential surjectivity is that of Stacks:"), line 440 ("The route is that of Stacks."), line 561 ("The routes are those of Stacks."), line 714 ("by induction on `d`, as in Stacks").

**Claim.** The plan is presented as following a source's sequence.

**Witness.** The planning principle: a roadmap does not say it follows a source; results in a source are cited with locators. `stacks-0BMA` lines 26–28 list Sections 19–21 in the order named at line 10.

**Repair.** Line 10: "The proof goes through the anti-equivalence between finite étale covers of the punctured spectrum and finite normal algebras, … and an induction on the dimension starting from dimension two (Stacks, Sections 58.19–58.21)." Lines 362–363: "For essential surjectivity:". Delete the sentences at lines 440 and 561 (each step already carries its lemma). Line 714: "by induction on `d`."

## R04 (P3) — The description does not say which `Suggested.lean` declarations LocalPurity loses or renames

**Location.** Pull-request description, LocalPurity paragraph: "Its Suggested.lean states both clauses of 0BMA (clause (2) corrected by torsion-freeness), 0EY7 and extension across a complement with regular local rings of dimension at least two, on `TauCeti.FiniteEtaleScheme` and `TauCeti.IsLocalRing.PurityHolds`."

**Claim.** The paragraph describes the change to the file.

**Witness.** Against main the head removes nine of twelve declarations, renames two and adds one (`git diff origin/main...HEAD -- TauCetiRoadmap/LocalPurity/Suggested.lean`); the README also stops citing SchemeAndStackFoundations §§0.6, 0.17, 4.13.

**Repair.** Append: "It drops nine of main's twelve declarations, all pinned in Tau Ceti: `flat_of_normal_dim_two`, `etale_iff_traceForm_nondegenerate`, `etale_iff_isUnit_discr`, `not_flat_prod_residueField` and the carriers `finiteEtale`, `FEt`, `FEt.pullback`, `puncturedSpectrum`, `PurityHolds`; renames the clauses of 0BMA to `IsLocalRing.purityHolds_of_isRegularLocalRing` and `Algebra.etale_of_finiteNormal_of_isRegularLocalRing`; and adds `finiteEtale_extend_of_regular_codimTwo`. The README no longer consumes SchemeAndStackFoundations §§0.6, 0.17 and 4.13."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 punctured spectrum, purity (0BM7) | `A` a field; `ℤ_(p)`; `k⟦x,y⟧` | `U = ∅`, purity holds, two projections `A×A → A` agree on `U`: not faithful. `ℤ_(p)[√p]`: discriminant `4p`, nonunit. `Γ(U) = A`, `U` not affine | Checks correct; agrees with `restrictPunctured_faithful_iff` | none |
| §1.2 *restrictPuncturedSpec_essSurj* | `dim A = 0`; DVR; `B = A × A/𝔪`; `A[z]/(z²−x)` | `U = ∅`, `B = 0` lies in the source category (all conditions vacuous). DVR: `V = Spec ℚ(√p)` is `Spec ℤ_(p)[√p]` restricted, `Γ(V)` not finite. `x·(0,1) = 0`. `𝔪_{A_(x)}B_(z) = (z²)` | no dimension bound needed for this half; equivalence needs `dim ≥ 2` | none |
| §1.3 *FormalGlueData*, `H⁰` (05EL) | `S = 0, f = 1`; `ℤ_(p) → ℤ_p, f = p`; non-cocycle `α_21 = −1` | `H⁰(0, M_1) = M_1`; `ℤ_p ∩ ℚ = ℤ_(p)`; `m = −m` gives `H⁰ = 0`, `φ_2 = φ_1 = −φ_2` | Checks correct; cocycle law excludes the wrong model | none |
| §1.3 *formalGlueing_equiv* (05ER, 05EU) | `k[x] → k`; `ℤ → ℚ, f = p`; `M = k[x]/(x−1)` over `k[x] → k⟦x⟧`; `t = 0` | `H⁰(Can R) = k × k[x,x⁻¹] ≠ R`; `Can(𝔽_p) = (0,0)`; `M ⊗ S = 0` flat, `M_x ≅ k` torsion; `I = 0` forces `R ≅ S` | both hypotheses needed; property clause needs every component | none |
| §1.3 *formalSections_of_localCohomology* (0EII) | `k⟦x,y,z⟧, g = z`; `k⟦x,y⟧, g = x`; `k[x,y,z]_(x,y,z)` | both sides `R`; `xⁿ·x^(−n−1)y⁻¹ = x⁻¹y⁻¹ ≠ 0`, limit `k((y))⟦x⟧ ∋ y⁻¹`; `∑ z^(n²)` lacunary, not rational | hypotheses sharp; extension of a `g^c`-torsion module by a complete one is complete (`g^(n+c)E ⊆ gⁿN`) | R01 |
| §1.3 0BLH, 0BLL, 0BLI, 0BM6, 0BLJ, 0EL8, 0EKS | `A` a field; DVR with `f = ϖ`; `Y′ = X′ ⊔ Z′` | `U = U_0 = ∅`. DVR: `U_0 = ∅ ≠ U`, `H¹_𝔪 = K/A` not `ϖ`-power torsion, hypotheses fail. `(X′ ⊔ Z′) ×_{X′} U′ = U′ ⊔ W′ = V′` | statements match `stacks-0BMA` lines 2028, 2266, 2283, 2342, 2351, 2421 and `stacks-0EKS` line 2193 | R02 |
| §1.4 0BLS, 0BLM | `k⟦x,y⟧, f = x`; complete normal domain of dimension `≥ 3`, depth 2 | depth `2 < 3`, and `H²_𝔪` not `x`-torsion: both excluded (covers of `Spec k((y))` need not extend). `H¹_𝔪 = 0`, `H²_𝔪` of finite length: 0BLS applies | no henselian hypothesis, as `stacks-0BMA` lines 2449, 2459 | R02 |
| §2.1 `IsLocalRing.purityHolds_of_isRegularLocalRing` | `d = 0, 1, 2, 3`; `k[x²,xy,y²]_(0)` | `d = 0` true but excluded by `hd`; `d = 1` false (`4p`); `d = 2` from the pinned lemma via (2) ⇒ (1); `d = 3`: `A/(f)` regular of dimension 2, depth 3. `𝔪_A B` needs 3 generators, rank 2: not flat | `2 ≤ ringKrullDim A` needed; regular not weakenable to normal | none |
| §2.1 `Algebra.etale_of_finiteNormal_of_isRegularLocalRing` | `B = 0`; `A × A`; `A × A/𝔪`; `A[z]/(z²−x)`; `ℤ_(p)[√p]` | `0` étale; discriminant 1; not torsion free (excluded), not flat; not étale at `(z)` over `(x) ≠ 𝔪` (hypothesis fails); `d = 1` discriminant `4p` | torsion freeness and `d ≥ 2` both needed; elaborated type equals README clause (2) | none |
| §2.2 `finiteEtale_extend_of_purity` (0EY7) | `U = ⊤`; `U = ∅`; `Spec ℤ_(p)`, `U = Spec ℚ` | identity up to isomorphism; stalks at generic points Artinian, purity vacuous, target is the empty scheme; purity fails at `(p)`, `Spec ℚ(√p)` does not extend | `[IsNoetherian X]` as in `stacks-0BMA` line 2604 | none |
| §2.2 `finiteEtale_extend_of_regular_codimTwo` | `𝔸² ∖ {0}`; `𝔸³ ∖ L`; `𝔸² ∖ {x = 0}` with `t² = x` | stalk dimensions 2; 2 and 3; 1 (excluded, cover ramified along `x = 0`). Gluing uses depth `= d ≥ 2` on overlaps | hypothesis sharp; route's uniqueness input is *restrictOpen_fullyFaithful_of_depth* | none |
| §2.2 *spread_from_localScheme* (0BQ5, 0EY3) | `S = Spec ℤ`, `U = D(p)`, `s = (p)` | `V = Spec ℚ`; the four properties used (proper, finite, étale, closed immersion for the diagonal) are all clauses of SchemeAndStackFoundations §0.9 on main, lines 1273–1279 | matches `stacks-0BQ5` lines 2571, 2627 | none |

- Source locators checked against the cached texts: 60 (18 in `stacks-0BMA`, 13 in `stacks-09ZL`, 4 in `stacks-0EKS`, 3 in `stacks-0BQ5`, 9 in `stacks-00R4`, 7 in `stacks-01Q3`, `stacks-0882`, `stacks-05K0`, `stacks-01R8`, `stacks-0BJF`; 4 in `sga2` lines 3376–3391; 2 in `sga1` lines 8370, 8394); all agree with the README.
- Library declarations opened at the pins: all 98 backticked Tau Ceti and Mathlib names of the README resolve, with the stated hypotheses, e.g. `TauCeti/AlgebraicGeometry/FiniteEtale/FiniteNormal.lean:71,132,204`, `…/FiniteEtale/Extension.lean:111`, `…/FiniteEtale/FullyFaithful.lean:105`, `TauCeti/RingTheory/RegularLocalRing/Purity.lean:75`, `TauCeti/RingTheory/FormalGlueing/Torsion.lean:143,258`, `Mathlib/RingTheory/Depth/Basic.lean:78,337`, `Mathlib/AlgebraicGeometry/IdealSheaf/Basic.lean:815,844`.
- Not at the pins (grep by tag and by object): 09ZL, idempotent lifting for arbitrary finite algebras over a henselian pair (`TauCeti/RingTheory/Henselian/Idempotent.lean:314` covers cyclic summands only), 0BL7, 05K0 with a finite target, 05ER, 0EII, 0EKP, 0BQ5; purity for a regular local ring of dimension `≥ 3`.
- Cross-roadmap citations resolved: SchemeAndStackFoundations §§0.9, 0.14, 2.6, 2.7, 4.7–4.8 on main (lines 1262, 1562, 4357, 4433, 6609, 6658), every cited target name present; consumers PurityOfBranchLocus line 266, AbhyankarLemma lines 55–58, PurityForFlatCohomology lines 104–106 and 1243, EtaleHomotopyTypes line 159 cite sections and names that exist here.
- Dependency check: `depcheck: 244 roadmaps, 2237 edges, 0 problem(s)`; no UPWARD or CYCLE line. Outside-folder diff: empty apart from the folders named as the pull request's own.
- Gate at `89357f3`: every check 0, `OK`. `lake env lean TauCetiRoadmap/LocalPurity/Suggested.lean`: four `declaration uses sorry` warnings (lines 34, 45, 58, 69), nothing else. `#check @` types as in the worker's signature file; no binder lost; each equals its README statement.
- Padding probe: `simp`, `rfl`, `infer_instance`, `aesop` close none of the four; `exact TauCeti.Algebra.etale_of_finiteNormal_of_ringKrullDim_eq_two …` fails on clause (2) (`ringKrullDim A = 2` and `IsUnramifiedAt` not derivable in one step). Headlines per README lines 37–39: four, all stated.
- Overlap check: read PurityForFlatCohomology, PurityOfBranchLocus, SchemeAndStackFoundations, AbhyankarLemma, EtaleDualityAndPerverseSheavesPartII, DirectSummandsAndBigCohenMacaulay; nothing shared (AdicSpacesPartIII F0.8 states 0ALK and ArcTopologyAndDescent §8.6 arc-sheaf glueing, neither 05ER; #1808's conflict in this folder has its order in the merge-order block).
- Source independence: 11 passages compared with 6 sources, none shared beyond forced phrases (longest run 9 words, `stacks-0BMA` line 2610); largest share `stacks-0BMA`, 51 of 131 locators; contents compared with `stacks-0BMA` Sections 17, 19–21: independent (§§1.1–1.2 draw on Section 20, §1.3 on Sections 17, 19, 20 and three other chapters, forced by §1.4 *Needs:* §1.3 and §2.1 *Needs:* §§1.2, 1.4).

## Not verifiable

- CrystallineCohomology's citation of §§2.1–2.2: its head is not among the checkouts given; read only through `roadmaps grep` (its README lines 440–442).
- The Provenance table's declaration names and files in `tdupu/pcfawd-formalization`: the repository was not opened.

## Source issues

- **Error** in stacks-0BMA at Lemma 58.20.3 (0BM9), printed p. 51: the source says sections give an equivalence onto finite normal algebras étale over the punctured spectrum; it should require the algebra torsion free over `A`, as `A × A/𝔪` shows; affects a stated result.
- **Error** in stacks-0BMA at Lemma 58.21.3 (0BMA) (2), printed p. 53: the source says a finite normal algebra étale over the punctured spectrum is étale; it should add torsion freeness over `A`, as `A × A/𝔪` is not flat; affects a stated result.
- **Misprint** in stacks-09ZL at Remark 15.91.10 (05EL), condition (a), printed p. 249: the source says the compatibility of `α_ij` with `α_i` holds as maps into `(M_j)_{f_i}`; it should be `(α_ij ⊗ S) ∘ α_i = α_j` into `(M_j)_{f_i} ⊗_R S`; affects nothing.
- **Misprint** in stacks-0BQ5 at Lemma 32.20.4 (0EY3), printed p. 54: the source says the open `U′` lies in `X`; it should be in `S`, the base of Lemma 32.20.3, where `X` names the scheme over `U′`; affects nothing.

## For the human reviewers

- **Licence.** `TauCetiRoadmap/LocalPurity/README.md` lines 877–896 map §§1.2, 1.4, 2.1 to `tdupu/pcfawd-formalization` (stated there as Apache-2.0). The four `Suggested.lean` names differ from the names the table lists; the repository itself was not read.
- **Scope of a consumer's request.** EtaleHomotopyTypes (open, its README lines 161–163) declares two gaps naming LocalPurity §2.2 as supplier of relative purity statements (SGA 2, Exposé XIV, Corollaires 1.19–1.20); this README plans neither.
