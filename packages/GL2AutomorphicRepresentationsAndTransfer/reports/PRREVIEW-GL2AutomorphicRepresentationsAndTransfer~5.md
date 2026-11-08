# Review of GL2AutomorphicRepresentationsAndTransfer (pull request #931 at 8d94672)
**Verdict:** needs changes

**Previous findings (round 4 at 385d7a8), checked passage by passage.**

- **R01 (R17.3.8a–d re-planned QuaternionicModularForms): mostly repaired.**
  - The README now consumes QuaternionicModularForms. `README.md:77–81` reads "QuaternionicModularForms §1.3 (algebraic weights …), §2.1 …, §§2.2–2.3 … and §3.1 (Hecke operators …) owns the classical quaternionic coefficient modules, form spaces and Hecke operators". The contract at `:347–360` and the *Needs:* line at `:1802` say the same.
  - The 15 declarations and the three imports are gone. `Suggested.lean` has 10 theorems and imports only Newform, Frobenius and RayClass.Modulus. `[gross99]`, `[loeffler11]` and `[shimura71]` are deleted (0 hits).
  - The Hurwitz Check moved to R17.3.9 (`:1793–1800`). The pull request description lists QuaternionicModularForms under depends-on and in the merge-order chain.
  - Two remnants stay: R17.3.9 still re-derives two results that QuaternionicModularForms now states and owns, and the README assigns them to R17.3.9. That is R01 below. The id map at `:83–92` is R02.
- **R02 (module header): repaired.** `Suggested.lean:1–3, 54, 275` read `module`, `public import Mathlib`, `public section … end`. The gate reports `build=0`.
- **R03 (statement hygiene): repaired.** The theorem is now `nonempty_quaternionAlgEquiv_of_localSplitting` (`Suggested.lean:154`). The alias sentence is at `README.md:1476`. There is no `letI` or `haveI` (0 hits), and the gate reports `statement-hygiene=0`.
- **R04 (R17.2.5 condition): repaired.** `:1578–1593` now states JL's K-averaged constant-term condition and its three consequences. `:1599–1605` keeps the all-x,y condition as a "Stronger variant" with its own proof. I checked both against the source (table, "Stronger variant" and "Quaternion proof").
- **R05 (stale pins): repaired.** `:123` reads "At Mathlib `1b1ccf4b`" and `:161` reads "At Tau Ceti `2fd255d9`". `lake-manifest.json` pins mathlib `1b1ccf4b08` and TauCeti `2fd255d997`.
- **R06 (garbled API sentence): repaired.** `:2720` reads "The API consists of ramified Frobenius-semisimple compatibility with N; equality of the characteristic-zero conductor and the primitive level away from ℓ; …".

## R01 (P2) — R17.3.9 restates two results that QuaternionicModularForms states and owns, and the README assigns both to R17.3.9

**Location:** `README.md:86–87` "the comparison of `L_{n,v}` with symmetric powers is in R17.3.9". `:91–92` "the inverse-coset identity `[Uη_v⁻¹U]=S_v⁻¹T_v` is in R17.3.9". The derivations are at `:1746–1750` and `:1768–1771`, and `:81–82` claims "the inverse-coset comparison".

**Claim:** This roadmap owns the identification `L_{n,v} ≅ Sym^n(std)⊗det^{−n−v}` and the inversion formulas `[Uη_v⁻¹U]=S_v⁻¹T_v`, `[Uϖ_v⁻¹U]=S_v⁻¹`.

**Witness:** QuaternionicModularForms is merge-order 70; this roadmap is 94. At its head f7ed2fe:
- README:42 claims ownership of the Hecke operators and "their inversion formulas".
- §1.3 (README:526–531) proves the identification via `γᵀ=det(γ)·wγ⁻¹w⁻¹`.
- §3.1 (README:1015–1017) proves both inversion formulas.

**Repair:**
- Delete the two clauses at `:86–87` and `:91–92`, together with the rest of `:83–92` (see R02).
- At `:1746–1750`, replace the derivation with one sentence: "By QuaternionicModularForms §1.3 at `n=k`, `v=−k`, §1.3's `L_{k,−k}` is τ, since `−n−v=0`."
- At `:1768–1771`, replace the derivation with: "QuaternionicModularForms §3.1 gives `[Uη_v⁻¹U]=S_v⁻¹T_v` and `[Uϖ_v⁻¹U]=S_v⁻¹`."
- Change `:82` to "the comparison of §3.1's left action with Pan's `T_ℓ, S_ℓ`".
- Keep in R17.3.9 everything else: the division-place action `w|u=τ(u_p)⁻¹w`, the identification of the colimit with Pan's `A_{(k,0)}^{K^p}`, the corrected `D_p×` action and central relation, the Pan normalization, the Checks and the Hurwitz example.

Last round asked to keep "the inverse-coset comparison" here. At the supplier's current head, §3.1 proves the identities themselves, so only the comparison with Pan's operators stays here.

**Tested:** after the repair, QuaternionicModularForms §1.3 at `n=k, v=−k` gives scalar `u` acting by `u^{n+2v}=u^{−k}=τ(u)⁻¹`, which is this README's Check at `:1790–1792`. §3.1's `[Uϖ_ℓ⁻¹U]=S_ℓ⁻¹` gives Pan's `S_ℓ` acting by `ℓ^{k}` where the supplied `S_ℓ` acts by `ℓ^{−k}` (table).

## R02 (P3) — The id map for R17.3.8a–R17.3.8d describes earlier revisions of this pull request

**Location:** `README.md:83–92` "The identifiers R17.3.8a–R17.3.8d name no target of this roadmap; citations of them resolve as follows."

**Claim:** Other roadmaps cite R17.3.8a–d, so they need an old → new map.

**Witness:** `roadmaps grep 'R17\.3\.8[a-d]'` over main and 472 open heads returns only this README (lines 83, 86, 88, 90, 91). The roadmap is not on main, so these ids never existed outside this pull request. The paragraph is revision narrative, which the timeless rule forbids.

**Repair:** Delete `:83` from "The identifiers" through `:92`. The ownership sentence at `:77–83` already routes every reader to QuaternionicModularForms.

## R03 (P3) — Six Lean-style names of this roadmap's own are backticked but not declared, and a consumer cites one of them, plus a lemma name the README no longer contains

**Location:**
- `README.md:1464` "Define `RamifiedExactlyAt D S`" and `:1469–1470` "`definiteRamifiedExactlyAt D q` … `indefiniteRamifiedExactlyAt D q q′`".
- `:561`, `:579` and `:753` "`heckeGen v`"; `:600` "`CentralCharacterL2(F, ω, dg, dz)`"; `:1008` "`tamelyDihedral (F, ℓ)`".

**Claim:** These are names declared by the roadmap.

**Witness:**
- None of the six is among the 10 declarations of `Suggested.lean`. A backticked name of this roadmap's own is a claim that `Suggested.lean` declares it. The gate's identifier check misses these because they contain spaces.
- QuaternionArithmetic (open head, README:224–227 and :391) imports "`RamifiedExactlyAt D S` …, `ramifiedExactlyAt_iff_nonsplit`" from R17.1.5. The second name occurs nowhere in this README.

**Repair:**
- Write the six names as prose targets without code spans, for example "the predicate *ramified exactly at S*", "the Hecke element at v", "the central-character L² space", "the set of tamely dihedral classes of order ℓ".
- In R17.1.5, after the existing alias sentence at `:1476`, add: "Citations of the names RamifiedExactlyAt and ramifiedExactlyAt_iff_nonsplit refer to the predicate and the equivalence of the two local division tests defined in this subsection."
- None of these predicates is needed to state a headline, so none is added to `Suggested.lean`. The README-only change needs no elaboration.

## R04 (P3) — Four supplier locators no longer exist under the cited name

**Location:**
- `README.md:211–213` "Representation prerequisites `archimedean-smooth-representations`, `archimedean-gln-parameters` and `restricted-tensor-realizations`", and `:2041` "AutomorphicLFunctionsAndLocalFactors's `archimedean-gln-parameters`".
- `:1334` "AlgebraicModularFormsAndSerreWeights R15.5A.2/classical-higher-weight-attachment".
- `:654` and `:664` "HeightsAndUnits §4.2 `Set.unit_fg`".

**Claim:** These sections and declarations are where cited.

**Witness:**
- At AutomorphicLFunctionsAndLocalFactors' head, README:237 says the prerequisites are "`AL.R.1`–`AL.R.5`; a target is cited by its number". The three slugs occur nowhere; the matching sections are AL.R.1, AL.R.2 and AL.R.3 (its lines 243, 253, 263).
- AlgebraicModularFormsAndSerreWeights' README:17 aliases R15.5A.2 to §6.2 (line 1418). The slug does not occur there.
- `Set.unit_fg` and the number-field instance `Set.unit_fg_of_units` are pinned Tau Ceti declarations at `TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean:149, 223`. The "From Tau Ceti" contract does not list them.

**Repair:**
- Replace the three AL slugs by "AL.R.1 (Archimedean Whittaker comparisons)", "AL.R.2 (Archimedean `GLₙ` parameters)" and "AL.R.3 (Restricted tensor realizations)".
- Replace the AMFSW slug by "R15.5A.2 (§6.2)".
- Add a bullet to "From Tau Ceti": "`TauCeti.RingTheory.DedekindDomain.SInteger.Unit`: `Set.unit_fg` and the instance `Set.unit_fg_of_units` give finite generation of the S-units for finite S." Cite it at `:654` and `:664` in place of the HeightsAndUnits section.

## R05 (P3) — `Suggested.lean` has no layer section comments, and one theorem is out of README order

**Location:** `Suggested.lean:60`, `:89` and `:131` (`section ArithmeticCharacterPrescription`, …). `:212` `solvable_characteristicTwo_projective_dihedral` (R17.6.6) comes before `:227` `odd_solvable_artin_weight_one` (R17.5.9).

**Claim:** The file follows the Lean form.

**Witness:** The file states targets of five layers (R16.1, R16.2, R17.1, R17.5, R17.6). The form requires `/-! ## Layer k: <title> -/` comments in README order. The README places R17.5.9 before R17.6.6.

**Repair:**
- Insert `/-! ## Layer R16.1: Local and adelic groups -/` before line 60.
- Insert the R16.2, R17.1, R17.5 and R17.6 comments, with their README titles, before lines 89, 131, 181 and the dihedral theorem.
- Move lines 210–222 after `odd_solvable_artin_weight_one`.

**Tested:** a scratch copy with exactly these changes elaborates with 10 `declaration uses sorry` warnings and nothing else.

## R06 (P3) — Small text defects in four *Needs:* lines and one formula

**Location and repair:**
- `README.md:825–826` reads "*Needs:* R16.2/henniart-unicity; SmoothRepresentationsOfLocalGroups SmoothRepresentationsOfLocalGroups SR.0". Delete the doubled name. Also delete `R16.2/henniart-unicity`: neither the statement nor the SR.3.2 route at `:823` uses type unicity. An implementer of projectivity should not be blocked behind R16.2.9, which needs PadicLocalLanglandsForGL2Qp §4.4.
- `:2019` reads "`ε(s,Ξ_v⊗χ_v,ψ_v)=ε(s,χ₀,vχ_v,ψ_v)³`". It should read `ε(s,χ_{0,v}χ_v,ψ_v)³`; the filled factor `I(1,1,1)` contributes three equal GL₁ constants.
- `:1725` and `:1733` each list "R16.4/cohomological-rationality" twice. Delete one occurrence in each.

## R07 (P3) — Three references are never cited

**Location:** `README.md:2995` `[aky22]`, `:3026` `[jy96]`, `:3027` `[ag11]`.

**Witness:** Comparing the keys used in lines 1–2981 with the keys defined in the References gives these three, and `[pan26]`, as defined but never cited. `[pan26]` serves as the published record behind `[pan26-global]`, so it can stay.

**Repair:** Delete the three entries.

## Verified sound

**Scope and gate.**
- I read both files at 8d94672 in full: README 3043 lines, `Suggested.lean` 275 lines. `metadata.toml` is the one line `topic = "math.NT"`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The worker's gate passes every check (set_option, sorry-data, latex, imports, readme-ids-missing, statement-hygiene, depcheck, stray-files, build and the rest all 0).
- A grep for process words finds only `:83` (R02). There is no `lemma`, `set_option`, `#eval`, `#print` or `True` placeholder.

**Dependency check (run this round):**

```text
depcheck: 240 roadmaps, 2453 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Every supplier is on main or earlier in the merge order:
- On main: ReductiveGroupsPartII, ProfiniteCohomology, ClassFieldTheory, GlobalQuadraticForms, QuadraticFormInvariants, RepresentationTheory/InductionRestriction and /SemisimpleAlgebras, EtaleCohomologyFoundations, ModularForms, ModularCurves, SchemeAndStackFoundations, LFunctions.
- Completed on main: GlobalNumberFields, NumberFieldArithmetic, Chebotarev, LocalFieldsRamification, HeightsAndUnits.
- Earlier in the merge order: SmoothRepresentationsOfLocalGroups 26, PadicLocalLanglandsForGL2Qp 33, AdelicAlgebraicGroups 35, ComplexComparisonPartII 43, ArithmeticGaloisRepresentations 46, LefschetzPencilsAndVanishingCycles 56, ClassicalAdicEtaleCohomology 59, ArithmeticLocallySymmetricSpaces 68, AutomorphicFormsOnReductiveGroups 69, QuaternionicModularForms 70, AutomorphicLFunctionsAndLocalFactors 86, AutomorphicSpectralTheory 88, AlgebraicModularFormsAndSerreWeights 93.

The consumers that cite this roadmap are all later, so these edges point downward: ModularCharactersAndBlocks 95, ShimuraVarieties 100, EtaleDualityAndPerverseSheaves 102, EndoscopicTransferAndUnitaryTraceComparison 145, AutomorphicGaloisRepresentationsPartII 161, ModularityAndLanglandsExtensions 191.

**Elaboration.**
- `lake env lean` on `Suggested.lean` gives exactly 10 `declaration uses sorry` warnings.
- I ran `#check @name` for all 10 declarations in one scratch file. Every elaborated type keeps its binders, for example:
  - `[IsNonarchimedeanLocalField F]` and all six smoothness and central-character hypotheses of `supercuspidalProjective`;
  - `[Group.FG ↥E]` and `0 < n` in `chevalley_power_congruence`;
  - `[Finite Γ]`, `[CharP k p]` and `[IsAlgClosed k]` in the Fong–Swan statement;
  - `[IsGalois ℚ E]`, `Algebra.IsUnramifiedAt ℤ Q` and `IsArithFrobAt ℤ σ Q` in both newform statements.
- Each type matches its README statement in generality. Nothing changed.

**One-tactic probe.** I replaced each `sorry` with `first | rfl | simp | infer_instance | trivial | decide` in a scratch copy. All 10 fail, with unsolved goals or `decide` rejecting free variables. No declaration is padding.

**Headline inventory.** The README headlines are:
- the finite-place correspondence with its conductor and factor comparisons;
- Chevalley congruence and full-local prescription;
- supercuspidal projectivity and Henniart unicity;
- the classical and Hilbert dictionaries;
- quaternion ramification and the local–global isomorphism;
- local and global Jacquet–Langlands;
- cyclic, solvable and cubic base change;
- solvable Artin automorphy;
- Fong–Swan;
- the characteristic-two classification and residual modularity.

The 10 statements are those statable at the pins. The docstring (`:28–51`) names what the others lack: the WD/admissible classification, cuspidal adelic classes, Whittaker models, quaternionic spectra, modular-curve cohomology, Katz forms and Artin conductors.

I also considered odd-characteristic residual modularity over ℚ (R17.5.13–R17.5.14, R17.5.17). It follows from `solvable_finite_image_integral_lift`, the README's oddness lemma and `odd_solvable_artin_weight_one`, so it is a corollary rather than a missing headline. No stand-in was found.

**Pinned definitions read to check the statements (at the pins).**
- `Representation.IsIrreducible := IsSimpleOrder (Subrepresentation ρ)` (`Mathlib/RepresentationTheory/Irreducible.lean:29`), which excludes the zero module, so n=0 is excluded.
- `IsCongrOne` (`TauCeti/…/RayClass/Modulus.lean:316`) is valuation of `x−1` at most `exp(−e_v)` plus real positivity.
- `Newform` (`…/Newforms/Newform.lean:104`), with `isNorm` coefficient 1. `dirichletLift = MulChar.ofUnitHom f.χ` (`:134`).
- `cuspFormCharSpace` (`TauCeti/NumberTheory/ModularForms/DiamondOperators.lean:291`) is the χ(d)-eigenspace of the diamond operators, with d the lower-right entry (`:160`). This is the standard nebentypus, so `det ρ(Frob_p)=χ(p)` is the right convention.
- `IsArithFrobAt` for `E ≃ₐ[ℚ] E` on `𝓞 E` (`TauCeti/NumberTheory/NumberField/Frobenius.lean:76–83`).
- Also resolved at the pins:
  - Mathlib: `MonoidHom.domRestrict_surjective` (`Mathlib/GroupTheory/FiniteAbelian/Duality.lean:107`), `NumberField.Units.mem_torsion` (`…/Units/Basic.lean:151`), `Zsqrtd.lift` (`…/Zsqrtd/Basic.lean:862`), `Matrix.det_smul` (`…/Determinant/Basic.lean:275`), `Representation.ind` (`Mathlib/RepresentationTheory/Induced.lean:77`), `Complex.Gammaℝ_def` and `Complex.Gammaℂ_def` (`…/Gamma/Deligne.lean:48, 56`), `Gammaℝ_mul_Gammaℝ_add_one` (`:155`), `Matrix.charpoly_fin_two`, `GeneralLinearGroup.map_det`, `haarMeasure_self`, `IdeleClassGroup.ofAdicCompletion` and `ofCompletion`, `Matrix.ProjGenLinGroup`.
  - Tau Ceti: `Representation.charTwist` (`CharacterTwist.lean:86`), `simple_indFDRep_ofLinearCharacter_iff` (`…/Mackey/LinearCharacter.lean:115`), `not_isSolvable_fin_two` (`…/GeneralLinearGroup/Solvable.lean:36`), `HeckeCharacter` (`…/HeckeCharacter/Basic.lean:70`), `QuaternionAlgebra.oneEquivMatrix` (`…/Quaternion/Split.lean:121`), `CuspForm.LSeries_qExpansion_coeff_eq` (`…/LFunction/Basic.lean:177`), `eq_of_forall_notMem_eigenvalue_eq` (`…/StrongMultiplicityOne.lean`), `satakeParameters_eq_pair_iff` (`…/Newforms/Satake.lean`), `skolemNoether` (`…/SkolemNoether.lean:107`).

**Cross-roadmap citations resolved this round, at the heads.**
- AutomorphicLFunctionsAndLocalFactors: every numbered id cited resolves, from AL.0.3.1 through AL.4.2.1 and AL.R.1–R.5. This includes AL.2.2.1–2.2.5 under the four quoted titles (its lines 1641–1699) and AL.3.9.5–3.9.6 (2284, 2296).
- AutomorphicSpectralTheory: §§0.9, 0.48–0.50 (with the three slugs), 1.15c, 3.6a, 6.9, 6.17, 6.19, 7.0a–7.0c and 7.1 (its lines 251–3753).
- ArithmeticGaloisRepresentations: §§1.6, 2.1–2.5 and 2.7 (Local-constant Gauss sum 2186, Standard-test-function evaluations 2273, Root-number product formula 2334), Layers 3–5, and §7.6 with its three named items (4824, 4850, 4868).
- SmoothRepresentationsOfLocalGroups: SR.0–SR.4, SR.2.3 *whittaker-functionals* (2250) and the GL₂ multiplicity one (2273), SR.3a.1, SR.3.2, and SR.5.2 *classical-llc-normalization* (4743, arithmetic Frobenius).
- PadicLocalLanglandsForGL2Qp: §4.4 (1472) and §6.9 (2311). Its table at 2435 names `DivisionAlgebraTypes.jacquetLanglands` for R17.1.1.
- ArithmeticLocallySymmetricSpaces: ALS.F.6 with `.cuspForm` and `.cuspidalRepresentation` (994, 1039), ALS.F.7, ALS.5b.4 and 5b.5.
- AutomorphicFormsOnReductiveGroups: §0.5, §2.6 `archimedeanUnitaryDual`, §5.8, §§7.2–7.6 and `inverseActionHeckeEquiv` (its line 1225).
- AdelicAlgebraicGroups: *restricted-haar-product*, §§1.1, 1.2, 1.5, 2.2, 2.3, 3.4, 4.4 and 5.2 (AA.5.2).
- AlgebraicModularFormsAndSerreWeights: §§1.1–7.7 as cited, and R15.5A.1–A.3 = §§6.1, 6.2, 6.4 (its line 17).
- QuaternionicModularForms: §§0.4, 1.3, 2.1–2.3 and 3.1 support every description at `:347–360`. §2.1 allows open non-compact U and every number field; §1.3 allows splittings at ramified places for K containing a quadratic extension. Its Downstream consumers list names R17.3.9.
- EtaleCohomologyFoundations (main): §F.4.0 `ContinuousRep.exists_stable_lattice_iff` (its line 874), §§0.6 and 0.8.
- On main: GlobalQuadraticForms §4.4 (`Suggested.lean:350`), ClassFieldTheory Layers 7, 9, 10 (`eq_zero_of_localInv_eq_zero`, `Suggested.lean:3116`), 11, 13 and 14, QuadraticFormInvariants Layers 2 and 6D, SemisimpleAlgebras Layer 6, HeightsAndUnits §4.2 (its line 439).
- Consumers' citations of this roadmap all resolve: R16.1.3, R16.1.7, R17.3.1, R17.3.10, R17.4.1, R17.4.10, R17.5.0, R17.5.11–12, R17.6.3a, R17.6.4 and R17.6.17–19. The exceptions are QuaternionArithmetic's two names (R03).
- The citation resolver's leads are false positives:
  - R15.2 and R15.3 at `:2849` and `:2874` are aliases (AMFSW line 17).
  - `jacquetLanglands`, `localJacquetLanglands` and `AutomorphicForm` are planned names of PadicLocalLanglandsForGL2Qp and ArithmeticLocallySymmetricSpaces.

**Supplier gaps.**
- `design/plan.json` is not readable, so the brief's gap register is empty. The two contracts at `:248–271` (`gap:weil-local-constants`, `gap:artin-functional-equation`) name ArithmeticGaloisRepresentations and are precise and minimal.
- That roadmap's head (README:149–159) assigns both items to an "ArithmeticGaloisRepresentations Part II" that no open pull request carries. The worker should still post them on its job; this is not a defect of the folder.

**Ownership by object.**
- The global Weil group (R17.5.0) belongs here: ClassFieldTheory on main lists global Weil groups as explicitly outside its scope (its lines 231 and 1546).
- Brauer characters and Fong–Swan belong here: ModularCharactersAndBlocks (open head, README:80, 89, 185) cites R17.5.11–12.
- The general Lefschetz–Verdier and contracting interfaces belong here: EtaleDualityAndPerverseSheaves (README:72, 6562–6715) consumes R17.6.3a. AutomorphicGaloisRepresentationsPartII uses that roadmap's adapter.
- Chevalley's theorem belongs here: ShimuraVarieties (README:61) imports it.
- No `Suggested.lean` name collides with a declaration of a roadmap I could read; QuaternionicModularForms' and QuaternionArithmetic's files declare none of them.
- `overlaps.md` lists no open pull request that changes this roadmap and no dropped id. The closest roadmaps in vocabulary (AutomorphicLFunctionsAndLocalFactors, AutomorphicSpectralTheory, EndoscopicTransfer, ModularityAndLanglandsExtensions, AL Part II) state these objects as suppliers or consumers, not as owners.

**Seeded sample** (texts read from the sources cache at the lines given).

| Target | Text and locator | Outcome |
|---|---|---|
| Fixed-space comparison (R16.2.7) | cg20 lines 182–191 (§1.3, pp.805–806); casselman73 (OCR) lines 261–263 (Corollary to the Proof, p.306) | dim π^Iw = 2 = 2·dim π^Sph, and in characteristic 0 the spherical vector spans π^Iw under U_p. Level `c·p^i` has dimension i+1. The README's K₀ = K₁·Z(O) step is its own deduction (table). The "not trivial" slip is under Source issues. |
| Ramification realization (R17.1.5) | cdn23 lines 1610–1618 (§4.1.2 and (4.6), p.38); prr23 not readable | The swap of invariants at {𝔭,∞₀} for a definite D₀ split at finite places matches. Realization inputs exist on main (above). |
| Stronger variant (R17.2.5) | proved in the README from the definitions | Correct (table). It implies the averaged condition; ζ_χ separates them. |
| Quaternion proof (R17.2.6) and R17.2.5 | jl70-ubc lines 16816–16824 ((16.1.7), printed p.275), 16132–16222 (conditions (i)–(iv), H_v, ζ = ζ″ − ζ′ and the averaged-constant-term deduction, pp.266–267), 15824 (Theorem 16.1, p.260) | (16.1.7) is the K-averaged condition, and at two places (iv)–(viii) vanish. The README now matches. |
| Pan adapter (R17.3.9) | pan26-global lines 2967–2970 (§5.4.1), 3075–3086 (Definition 5.4.11, p.71), 3231–3288 (§5.5.5, pp.75–76) | The source gives `f(dh^ph_p)=h_p⁻¹·f(d)`, `(h_p·f)(d)=h_p·f(dh_p)`, `W(−n₁,−n₂)` dual to highest weight (n₂,n₁), `S_l` = action of diag(l,l), `T_S=ℤ_p[T_l,S_l]`, k≥1 spectrum in σ_{k+2,1} with π_p special or supercuspidal, and k=0 spectrum σ_{2,1}∪σ₀. The README matches. Duplication is R01. |
| Whittaker-type bridge (R17.4.13b) | gj78 lines 2056–2071 ((9.1.2)–(9.1.3), pp.531–532), 2151–2158 (Theorem 9.3(1)–(4), p.534), 2209–2224 ((9.5.1)–(9.5.5), T=S or a singleton, p.536) | Matches as stated. |
| Cubic monomial input (R17.4.17) | jpss79 (OCR) lines 1519–1531 (Theorem 14.2, pp.253–254), 1587–1595 (p.255) | Unique generic π_v with all GL₁-twisted factors; π is cuspidal. In the non-normal case the induction is irreducible, or a character plus a degree-two monomial. As stated. |
| All-place comparison (R17.4.17) | henniart02 lines 126–131 (théorème of §1.5, p.590); deligne73 lines 901 (Théorème 4.1, p.535), 1287 ((5.6.2), p.549), 1335–1341 (5.11, p.551), 1972–1977 ((8.12.1), p.572) | Locators correct. The (8.12.1) conductor equals R16.0.1's `a(r)+dim V^I−dim(ker N)^I`. |
| Oddness API (R17.5.13) | bcgp21 lines 12593–12624 (Proposition 10.1.3 and the solvable case of its proof, pp.473–474) | The source lifts via Tate's theorem. The README's Fong–Swan route plus the determinant lemma also proves the stated existence (table), so the citation supports the statement. |
| Domain test, Order test (R17.5.15) | tunnell78 (OCR) lines 193–215 (Theorem 1.3 and proof, pp.182–183) | Global F, a place with F_v≅K, ρ_v≅σ, type preserved; for S₄ over ℚ₂, F=ℚ with det ρ(c)=−1. Both tests computed in the table. |
| Construction and local finiteness (R17.5.16) | patrikis lines 1374–1386 (Lemma 2.3.1 and its CM consequence, printed p.28); carayol86 lines 1558–1575 (§11.2, (a)–(c), p.450) | As stated. Carayol calls the existence of (L,ξ) standard; the README supplies the argument. |
| Parabolic comparison (R17.6.4, R17.6.3a–b) | varshavsky05 lines 629–636 (Definition 2.1.1, p.17), 646–652 (Theorem 2.1.3, p.17), 360 and 371 (Proposition 1.2.5, Corollary 1.2.6, p.10), 605 (§1.5.7, p.16); carayol86 lines 86 and 121 (Théorèmes (A)–(B)); ddt lines 3164–3181 (Theorem 3.1(d)–(e), p.86) | Stabilize and contract match R17.6.3b exactly; branch values are in the table. |

**Adversarial pass.** The numerical values were computed this round by a script; the others are hand computations recorded here.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `chevalley_power_congruence` | E=⟨2⟩⊂ℚ×, n=2, T={2}; n=3; E={±1}; E trivial | 2^j mod 3 = 1,2,1,2 (≡1 iff 2∣j), m=(3) avoids T; 2^j mod 7 = 1,2,4 (≡1 iff 3∣j); −1≢1 mod 3, so m=(3) works for {±1}; trivial E takes the unit modulus | True |
| `finite_hecke_full_local_prescription` | ℚ, S={2}, χ₂=(−1)^{v₂}; S=∅ | Ψ = character of ℚ(√5)/ℚ: Ψ₂(2)=−1 (5≡5 mod 8, so 2 is inert), Ψ₂ trivial on ℤ₂× (unramified), real quadratic so trivial at ∞; S=∅ gives Ψ=1 | True |
| `supercuspidalProjective` | 𝔽_q((t)); ℝ; trivial character; π⊗ρ, ρ(g)=(1 v(det g);0 1) | The field instance holds for 𝔽_q((t)) and fails for ℝ. The trivial character has constant coefficients and noncompact support mod Z, and is the nonsplit quotient of I(ν^{1/2},ν^{−1/2}). ϖI acts by ω(ϖ)(1 2;0 1), not scalar, so that module is excluded by `hσcent` | True |
| `existsQuaternionRamification_iff` | ℚ: (∅,∅); ({2},{∞}); ({2},∅); a complex place in Si | (1,1)≅M₂(ℚ), Even 0. (−1,−1): −1 at 2 and ∞, +1 at odd p, Even 2. {2} is odd and fails Hilbert reciprocity. At a complex place every (a,b) splits, so both sides are false | True |
| `nonempty_quaternionAlgEquiv_of_localSplitting` | (−1,−1) against (−1,−3) | (−1,−3)₂ = (−1)^{((−1)−1)/2·((−3)−1)/2} = +1, so they split differently at 2. `hf` fails and the algebras are not isomorphic | Consistent |
| `finite_projective_lift` | r trivial; r(c) a nontrivial involution | The lift is trivial. ρ(c)²=1 and non-scalar give eigenvalues ±1 and det −1; scalar ±I has det +1 | True |
| `solvable_finite_image_integral_lift` | S₃, p=2, n=2; n=0; C₃, p=3, trivial | The reflection lattice over ℤ reduces to GL₂(𝔽₂). The zero module is not `IsSimpleOrder`. The trivial character lifts | True |
| `solvable_characteristicTwo_projective_dihedral` | GL₂(𝔽₂); A₄; S₄ | GL₂(𝔽₂)≅D₃, n=3. A₄'s normal V₄ is unipotent and fixes a line, so it is reducible. S₄ would need S₄/V₄≅S₃ inside the abelian Borel/U quotient | True |
| `odd_solvable_artin_weight_one` | Std(S₃) of ℚ(∛2,ζ₃); p=5, 7, 31 | 3³≡2 mod 5, a transposition: trace 0, det −1, (−3/5)=−1. 2 is not a cube mod 7, a 3-cycle: trace −1, det 1, (−3/7)=1. At 31 the roots of x³−2 are 4, 7, 20: trace 2, det 1, (−3/31)=1 | True |
| `characteristicTwo_solvable_weight_one` | same field, mod 2 | traces 0, 1, 0 and det 1 at 5, 7, 31; the lift's a_p = 0, −1, 2 reduce to these | True |
| R16.2.7 Iwahori (Fixed-space comparison) | basis (v, π(s)v); g∈K₀(pⁿ); (2 1;−1 0); (5 6;−1 0); 𝔽₂ | Matrix [[λ,qc],[−1,0]] gives X²−λX+qc. g·diag(g₂₂⁻¹,g₂₂⁻¹) has (2,2)=1 and (2,1)=g₂₁/g₂₂∈pⁿ. (U−1)²=0 with U−1≠0. Char poly X²−5X+6. Over 𝔽₂, K₀(p)=K₁(p) | Retain |
| R17.2.5 Stronger variant | ζ_χ on an unramified unitary principal series; x=k⁻¹a, y=k | Trace 1−1=0, but the operator is the difference of projections onto the χ∘det-line for K and the ξ∘det-line for H. ⟨K,w⟩=GL₂(F), so the lines differ and ρ(ζ_χ)≠0. Strong cuspidality gives `∫_N f(k⁻¹ank)dn=0`, which is the averaged condition | Retain |
| Quaternion proof | (16.1.7) at two places; two Steinberg factors | (iv)–(viii) vanish; norm-character traces (−1)(−1)=+1 | Retain |
| R17.3.9 adapter (R01) | scalar u on L_{k,−k} and L_{k,0}; S_ℓ via f(qgu)=τ(u_p)⁻¹f(g) | u^{n+2v} = u^{−k} = τ(u)⁻¹, against u^{k} for L_{k,0}. Pan's S_ℓ: f(gz_ℓ)=f(g·ℓ⁻¹ away from ℓ) = τ(ℓ⁻¹)⁻¹f = ℓ^{k}f. The supplied S_ℓ gives ℓ^{−k}, its inverse. `γᵀ=det(γ)wγ⁻¹w⁻¹` checked entrywise | Math true; R01 |
| R17.3.9 Hurwitz Check | 2T/±1=A₄ on dim 2ℓ+1, ℓ=0..3; S_k(Γ₀(2)) | (χ(1)+3χ(π)+8χ(2π/3))/12 = 1, 0, 0, 1; dims at k=4, 6, 8 are 0, 0, 1 | Retain |
| R17.1.5 names (R03) | M₂(F_v); Hamilton at ∞; ℂ | a singular nonzero matrix fails both division tests; Hamilton passes both; ℂ is split | Math retained; R03 |
| R16.1.3 Hecke element (R03) | q_v=2 | right cosets of diag(ϖ,1) away from the level: q+1=3 | Retain |
| R16.1.5 central-character L² (R03) | ω=−1; Haar scaled by 2 | a constant fails f(zg)=ω(z)f(g) though |f|² descends; the squared norm doubles | Retain |
| R16.3.7 tamely dihedral (R03) | q=2, ℓ=3; ℓ=2 | θ^q=θ²=θ⁻¹≠θ; for order 2, θ⁻¹=θ | Retain |
| R16.2.10 *Needs:* (R06) | SR.3.2 route | the block projector uses supercuspidal support only; R16.2.9 is not invoked | R06 |
| R17.4.12 filling (R06) | I(1,1,1)⊗χ_{0,v}χ_v at v∈T | L=1 (ramified), ε = ε(s,χ_{0,v}χ_v,ψ_v)³ | R06 |
| R16.1.7 S-units (R04) | Tau Ceti `Set.unit_fg_of_units` | requires [Finite S] [Monoid.FG Rˣ], which holds for 𝓞_K (Mathlib instance) | R04 |
| R16.2.12 Iwahori centre | q=4, roots (2,3); roots (1,1); q=2 | z₁ = 4+24/4 = 6+24/6 = 10 = 2·5, without q: 5.5 and 7; repeated roots give 2+4/2 = 4; [K:I]=3 is not a unit in ℤ[1/2] | Retain |
| R16.3.9 vexing Check | θ₀ of order 8 on 𝔽₂₅× | Σ θ₀⁻¹χ_π over 𝔽₂₅× = 16 − 20 + 4 = 0 (script: 0.0) | Retain |
| R16.3.6 gamma | Γℂ(1), Γℝ(1)Γℝ(2), Γℂ(2) | 0.318310, 0.318310, 0.050661 = 1/(2π²) | Retain |
| R16.6.1, R17.6.1 Δ | p=2, k=12 | raw −24; unitary −24·2⁻⁵ = −0.75; central 2¹⁰ against 1 | Retain |
| R17.4.17 norm phase | identities on [−3,3]³ | N=a³+2b³+4c³−6abc, Q=3a²−6bc and the C=±1 identity all hold; Gram det −27; M(0,1,0)³=2I | Retain |
| R17.4.17 λ-constants | ℝ³, ℝ×ℂ | (d,−1)_∞ = +1, −1 | Retain |
| R17.4.13b bridge | q=4, s=2, χ=1 | extra factor L(s−1/2,1) = (1−4^{−3/2})⁻¹ = 8/7 | Retain |
| R17.5.5 Check | x³−2 mod 31; χ mod 7 with χ(3)=ζ₃ | roots 4, 7, 20; 31≡3 mod 7, so χ(31)=ζ₃ arithmetic and ζ₃⁻¹ geometric | Retain |
| R17.5.7 exclusion | A=diag(e^{iπ/6},e^{−iπ/6}), B=−A | traces 1.732051 / −1.732051, squares 1/1, cubes 0/0; projective order of A is 6 | Retain |
| R17.5.13 Oddness API | diag(1,−1) at 3 and 2; −I | det −1 and −1≠1 mod 3; at 2 the identity has residual det 1=−1 but integral det +1 (the 2≠0 hypothesis fails); det(−I)=+1 | Retain |
| R17.5.15 tests | (−1)^{v₂} at 2, units, −1; i^a | −1, 1, 1; i, −1, −i, with χ(1)²=χ(2)=−1 | Retain |
| R17.5.16 CM | L=ℚ(i), a=1+i | (a)=𝔓, a/σa = i (torsion), phase e^{iπ/4} of order 8 with square i | Retain |
| R17.5.17 mod-3 section | the two generators over ℤ[√−2] | the group has order 48; reductions under √−2↦−1 are (1 1;0 1) and (0 1;1 0) | Retain |
| Parabolic comparison | (a,d)=(2,3), (1,p^m), (3,2); ℙ¹×ℙ¹, c₁=(t²,s) | 3·2≥2·3 gives contraction with n=2 and fixed ideal (t²); p^m>1 uses the ordinary stalk; (3,2) uses the dual stalk; trace 1+3+2=6 equals 3 components times χ(ℙ¹)=2 | Retain |

## Not verifiable

- **prr23**, Theorem 1.33, pp.42–43: a Cambridge book with no legal copy. The realization inputs were checked through GlobalQuadraticForms §4.4 and ClassFieldTheory Layer 10 on main.
- **jl70** (IAS retypeset) and **jl70-global** (IAS author scan) paginations: only the UBC retypeset (jl70-ubc) is in the cache. Its pages are Theorem 16.1 on p.260 and (16.1.7) on p.275. The README's IAS pages (Theorem 16.1 on pp.269–270 and on p.261) were not checked; the content was.
- **bh06**, **webb16**, **artin-tate**, **tate-global**, **clozel90**: books, not read. Also not read this round: langlands80, ac89, langlands73, nt26, dlb17, bz76, bm02, cdt99, cg18, hkp10, isaacs74, wiese04 (beyond its title page), getz15, br10, mw26, flm11 and chevalley51. Their locators are cited by number only.

## Source issues

- **Error** in cg20 at §1.3, printed p.805: the source says a smooth irreducible unramified representation that is not trivial has a two-dimensional Iwahori-fixed space; it should say infinite-dimensional, since a nontrivial unramified character of det has a one-dimensional one; affects nothing (an introductory remark).
- **Gap** in jl70 at §16, introduction (jl70-ubc lines 67–69) and the proof of Theorem 16.1, printed p.260 in the UBC retypeset: the source says the arguments of §16 are only sketched and not all details were verified; it should supply the analytic convergence and trace identities; affects the proof.
- **Misprint** in rt97 at §2, the list of dyadic cases, case (ii), p.306: the source says D ≡ ±5 (mod 8); it should say D ≡ 5 (mod 8), since an odd fundamental discriminant is 1 mod 4 and −5 ≡ 3; affects nothing.
