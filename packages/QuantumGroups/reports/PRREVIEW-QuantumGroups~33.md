# Review of QuantumGroups (pull request #1705 at f4ad8e4)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/QuantumGroups/` at `f4ad8e4`. The previous review read the same commit; the folder has 0 changed lines since then and nothing outside it changed. Unless stated otherwise, line numbers refer to `TauCetiRoadmap/QuantumGroups/README.md`.

There is one finding, R01. It is the previous review's R01 and re-raises H01 of the last repair report. The README's mathematics passed every check this round: the gate, the dependency check, elaboration, the source sample, and an adversarial table of 48 rows with computed values (below).

## R01 (P2) — The branch pins a Tau Ceti that lacks almost every Tau Ceti name the folder cites, and `Suggested.lean`'s docstring is false at either pin

Re-raised: H01.

**Why H01's reason fails.** The reason is "not actionable in this package; the folder needs no change now". The folder does need changes, at whichever pin is used:

- **At the branch pin**, `Suggested.lean:24` and `:26`–`:34` and README `:1517`–`:1522` assert declarations "in the pinned Tau Ceti" that do not exist there.
- **At main's pin**, `Suggested.lean:70`–`:77` is false, and a headline that is statable there is missing.
- **At every pin**, `:26`–`:34` contradicts `:76`.

The one step outside the folder is the worker merging `origin/main`. `git merge-tree --write-tree HEAD origin/main` is clean, and the branch touches neither `lake-manifest.json` nor `lean-toolchain`. Once the merge is done, the rest of the repair is an ordinary folder edit inside this package.

**Location.** `lake-manifest.json` pins Tau Ceti `358314d4`; main pins `2fd255d9`. The affected text:

- `Suggested.lean:24`: "the defining field `comul_star` of Tau Ceti's `TauCeti.StarCoalgebra ℂ A`".
- `Suggested.lean:26`–`:34`: "Proved in the pinned Tau Ceti … `TauCeti.UqSl2` … `TauCeti.FiniteHopfModuleCat`".
- `Suggested.lean:76`: "the pinned Tau Ceti has none of these modules".
- README `:1517`: "already in the pinned libraries".
- The `From Tau Ceti` contract at `:155`–`:192`, and all of Layer 8.

**Claim.** The Tau Ceti declarations the folder cites exist at its pins, and the docstring's "not statable" list is correct.

**Witness.**

- **Branch pin `358314d4`.** It has no `QuantumGroups/`, `Coalgebra/Star.lean`, `OreExtension/`, `FiniteHopfModuleCat/` or `Monoidal/Pivotal/`. Only 2 of the 139 cited names resolve: `HopfAlgebra.antipode_antipode` and `Sl2Std`.
- **Main's pin `2fd255d9`.** All 139 resolve; `Pivotal/Spherical.lean:69` declares `SphericalCategory : Prop`.

**Repair.** The carriers below were opened at `2fd255d9`.

1. **The worker merges `origin/main` and re-runs the gate with its build.** The two modules `Suggested.lean` imports (`Comodule/MatrixCoefficient/Matrix.lean`, `Subcomodule/Basic.lean`) both exist at `2fd255d9`.
2. **In `Suggested.lean`, add the §8.5 headline,** with real-bodied local instances.
   - **Rigid structure:** `TauCeti.FiniteHopfModuleCat.rigidCategory (TauCeti.UqSl2.antipode_bijective q)` (`FiniteHopfModuleCat/Rigid.lean:146`).
   - **Pivotal structure:** `pivotalIso := TauCeti.FiniteHopfModuleCat.unitEvalNatIso (TauCeti.UqSl2.kUnit q)⁻¹ hg` (`Pivotal.lean:119`), and `pivotalIso_isMonoidal := TauCeti.FiniteHopfModuleCat.unitEvalNatIso_isMonoidal _ _ hg₁` (`Pivotal.lean:221`).
   - **The hypotheses:** `hg` is `TauCeti.UqSl2.antipode_antipode` (`UqSl2/Antipode.lean:59`, `S²x = K⁻¹xK = g x g⁻¹` for `g = K⁻¹`). `hg₁` is group-likeness of `K⁻¹`, from `comul_kInv` (`Hopf.lean:192`) and `counit_kInv` (`Hopf.lean:208`).
   - **The statement:** `theorem uqSl2_sphericalCategory (q : ℂ) [Fact (q ≠ 0)] (hq : q - q⁻¹ ≠ 0) : TauCeti.SphericalCategory (TauCeti.FiniteHopfModuleCat ℂ (TauCeti.UqSl2 q))`, with the `TauCeti.*` imports of those modules.
3. **Fix the docstring and README.** Delete `Suggested.lean:70`–`:77`, list `uqSl2_sphericalCategory` under "Stated here", and name it in §8.5 at `:1684`–`:1687`.
4. **Use the native star-coalgebra class.** In the four existing headlines, replace the hypothesis `hΔ` by the instance argument `[TauCeti.StarCoalgebra ℂ A]` (`Algebra/Coalgebra/Star.lean:46`–`:49`, a `Prop` class whose only field is `comul_star`), and reword `:21`–`:24`. At the new pin, the class is the native carrier that `hΔ` restates.

**Tested on the refuting instance.** After step 1:

- `:26`–`:34`, `:24` and `:1517` are true as written.
- The headline holds on the instance that showed it missing: on `L₁⁺` at q=1/2, `tr K⁻¹ = 2+1/2 = 5/2 = tr K`.
- The hypothesis `hq` is needed: at q=±1, the one-dimensional module with K=2 gives `rightTrace = 1/2 ≠ 2 = leftTrace` (README Check `:1704`).

## Previous findings

- **R01** (re-raising H01): not repaired. The head is unchanged, `lake-manifest.json` still pins `358314d4`, and `Suggested.lean:76` still reads "the pinned Tau Ceti has none of these modules". Carried as R01 above.
- **Settled (H02): ownership of §§0.2–0.3.** Not repaired, and the reason holds. Two open pull requests still claim the same objects:
  - CategoricalOperatorAlgebras (#888, `b9c0a6f`) `:40`–`:46` still says CA1a/CA2a "have their single home here".
  - TemperleyLiebOperatorAlgebras (#867, `ba43cc7`) `:72`–`:76` and `:106` still claims the unitary Temperley–Lieb category.

  QuantumGroups is on main, so it is the earlier owner. On main it cited both roadmaps as suppliers, although neither is on main. This pull request moved those objects down into §§0.2–0.3, as a roadmap on main must. The narrowing is due in #888 and #867, not in this folder.
- **Settled (H03): the pull-request text.** The title and description still describe a "Q9 RepUqg" that this folder does not contain. The description's merge-order paragraph now states "#1649 → this pull request", so the conflict with #1649 (`5155098`; both files conflict under `git merge-tree`) has a stated order. The description is outside the folder; the reason holds.

## Verified sound

**Head, gate, order.**

- **Gate**, re-run on `f4ad8e4`: every scanner 0, `… dropped=0 readme-ids-missing=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate records `build=0`.
- **`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'`** is empty.
- **Dependency check** (the required command), with no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 235 roadmaps, 2268 edges, 0 problem(s)
```

- **Suppliers.** QuantumGroups is on main, so it may consume only main and the pins. Every roadmap it cites is on main: TemperleyLieb, Subfactors, VonNeumannAlgebras, HilbertModules, CStarAlgebras, RepresentationTheory/{CompactGroups, LieHighestWeight}, OperatorAlgebraDynamics, FreeProbability, AmenableGroups and PivotalSpherical.

**Elaboration, signatures, padding.**

- **Elaboration:** `lake env lean TauCetiRoadmap/QuantumGroups/Suggested.lean` exits 0 with exactly four `declaration uses sorry` warnings, at `:121`, `:153`, `:164` and `:174`.
- **Signatures:** a scratch copy with `#check @` on all six declarations gives exactly the types in `scratch/signatures.md`.
  - `AlgebraicHaar` does not carry `[StarModule ℂ A]`. Its fields (normalisation, both invariances, `0 ≤ h(a*a)`) do not use it, and every headline that mentions it carries the binder.
  - The other five types match the README statements: hypotheses, quantifiers, and NT's `ρ_U = F̃ᵗ` index convention.
- **Padding:** `simp`, `aesop`, `rfl`, `infer_instance`, `decide` and `exact?` were each tried as the sole tactic on all four headlines. Every one failed ("made no progress", "unsolved goals", "could not close the goal"). Nothing is padding, and the two definitions are needed by the headlines.
- **Not-statable list at `2fd255d9`:**
  - Neither pin has a minimal C*-tensor product, adjointable Hilbert-module operators or a dagger/C*-category (`grep` over both Mathlib and Tau Ceti). Every item at `:38`–`:69` and `:78`–`:80` therefore holds at both pins.
  - Recoupling exists only for triple products (`UqSl2/ClebschGordan/Recoupling.lean:135`), so the pentagon is correctly unstated.
  - The only exception is `:70`–`:77` (R01).

**Library declarations opened.**

- **Mathlib `f6090c70`**, by `#check` in one scratch file. All of these exist:
  - `CStarModule`, `WithCStarModule`;
  - `PositiveLinearMap.{GNS, gnsStarAlgHom, norm_map_star_mul_le, norm_map_mul_star_le}`;
  - `WeakDual.isCompact_closedBall`;
  - `ContinuousLinearMap.{orthogonalComplement_iSup_eigenspaces_eq_bot, finite_dimensional_eigenspace}`;
  - `VonNeumannAlgebra`, `DoubleCentralizer`, `CStarMatrix`;
  - `NonUnitalStarAlgHomClass.instCompletelyPositiveMapClass`;
  - `gelfandStarTransform{,_naturality}`, `WeakDual.CharacterSpace.{compContinuousMap, homeoEval}`;
  - `WithConv`, `CategoryTheory.Idempotents.Karoubi`;
  - `ZeroAtInftyContinuousMap`, `BoundedContinuousFunction`;
  - `HopfAlgebra.antipode_mul_antidistrib`;
  - `IsSemisimpleModule.{extension_property, lifting_property, exists_end_algEquiv_pi_matrix_end}`;
  - `SkewPolynomial`, `IsGroupLikeElem`;
  - `Rep.equivalenceModuleMonoidAlgebra`, `CategoryTheory.ObjectProperty.FullSubcategory`;
  - `ContinuousLinearMapWOT`, `CategoryTheory.{LeftRigidCategory, ExactPairing, Linear}`, `IsSl2Triple`.

  `RingHom.powersMulSemiringAction` (`:1403`) is Tau Ceti's: it is in `Algebra/OreExtension/SkewPolynomial.lean:61` at `2fd255d9` and absent at `358314d4` (R01).
- **Tau Ceti `358314d4`:** `Comodule/MatrixCoefficient/Matrix.lean:68` (`coefficientMatrix`) and `:173` (`map_antipode_mul_coefficientMatrix`); `HopfAlgebra/Antipode.lean:88`, `:97`.
- **Tau Ceti `2fd255d9`**, the 139 names by a namespace-aware sweep, plus:
  - `Coalgebra/Star.lean:46`–`:49`, `:91`;
  - `Pivotal/Basic.lean:76` and `:187` (`pivotalExactPairing`);
  - `Pivotal/Trace.lean:88` and `:93`. With these definitions, `rightTrace f = tr(gf)` (the chosen coevaluation `Σ eᵢ⊗eⁱ`, then the pivotal evaluation `v⊗φ↦φ(gv)`) and `leftTrace f = tr(g⁻¹f)` (the pivotal coevaluation `Σ eⁱ⊗g⁻¹eᵢ`), exactly as `:1677`–`:1682` say;
  - `Pivotal/Spherical.lean:69`; `FiniteHopfModuleCat/Pivotal.lean:78`, `:119`, `:221`; `Rigid.lean:146`;
  - `UqSl2/Basic.lean:163`; `UqSl2/Antipode.lean:59`; `UqSl2/Hopf.lean:192`, `:208`;
  - `Topology/ContinuousMap/ZeroAtInfty/Discrete.lean:654`. This `curryEquiv` covers discrete I, J only, so it is a special case of §1.1's locally compact identification and not a duplicate of it.

**Cross-roadmap citations resolved on main (`f8836c4`).**

- TemperleyLieb Layers 4, 6, 7.
- Subfactors §§3.1–3.3 and `markovTrace_nonneg_iff`.
- VonNeumannAlgebras Layers 0, 1, 3, 4, 10, 11, 13, with `V13b.SpatialNorm`, `V4.Core`, `V4.PositivePredual`, `V4.Normality`, `V10.ModularTheory` and `V10.KMS` all present.
- HilbertModules H1–H3.
- CStarAlgebras §1.7, §1.8 (`C1.CommutativeMultiplierMorphisms`) and §§5.1–5.2.
- OperatorAlgebraDynamics D1–D2; FreeProbability F1, F3, F6; AmenableGroups Layers 1, 5, 7.
- PivotalSpherical Layers 0–2 and 7. Layer 7 registers `RigidCategory (FDRep k G)` through `LeftRigidCategory (FGModuleCat K)`, as `:1630`–`:1632` say.
- RepresentationTheory/CompactGroups (`su2Irrep`) and LieHighestWeight Layer 0.
- **Downstream:** QuantumEnvelopingAlgebras cites "Q8 item 1" and HopfologicalAlgebra cites "Q8 item 5". Both resolve through `:206`–`:215`.
- **Overlaps:** `scratch/overlaps.md` lists no dropped id, no revision-only id and no id dropped by this pull request.

**Ownership.** `roadmaps grep` for SUq(2), Woronowicz characters, Tannaka–Krein, O_F^+ and the Haar state finds owners only in QuantumGroups (main, #1705, #1649) and one consumer line in #888 (`:2630`). The only conflicts are the settled §§0.2–0.3 ones.

**Seeded sample.** Every sampled locator was read at the cited page; NT page numbers are those of the cited author's copy.

| Target | Locator | Read at | Result |
| --- | --- | --- | --- |
| 0.1 | KV Notations and conventions p.840; Def. 2.1 p.853 | `kustermansvaes` 162–200 (strict extension 174–178, leg `x₁₃` 193–200); 739–746 | Correct |
| 0.2 | LR §2 pp.4–5, Lemma 3.3, Thms 3.8, 3.11, Appendix pp.48–49 | `longoroberts` 121–175; 389–398 (p.10); 621–631 (p.15); 681–699 (p.17); 1998–2050 | Correct. Thm 3.11 is `‖R‖²‖R̄‖² ≥ d²`, with equality iff a multiple of R is standard |
| 0.2 | NT Defs 2.2.10, 2.2.12; Prop 2.2.13; Thms 2.2.14, 2.2.16 proof, 2.2.17, 2.2.19; Rem. 2.2.20(ii); §2.5 p.52; Def 2.7.1 p.70 | `nt` 1427, 1446 (p.32); 1458, 1501 (p.33); 1571–1593 (pp.34–35); 1596 (p.35); 1633–1654 (p.36); 1661–1663 (p.37); 2431–2438; 3236–3241 | Correct. `(ι⊗R_U⊗ι)R_V` is standard in the proof of 2.2.16; d ≥ 1 is in the remark after 2.7.1 |
| 2.2 | Timmermann Thm 5.3.3 | — | Not verifiable (uncertified) |
| 3.1 | NT Thm 1.4.2 p.9 | `nt` 447–452 | Correct: `h(u_ij*u_kl)=δ_jl(ρ⁻¹)_ki/dim_q`, so `(F̃⁻¹)_ik` with `F̃=ρᵗ` |
| 3.3 | Timmermann §3.2, §5.4 | `nt` 431–435, 1432–1438 (cross-check) | Locator not verifiable. The maths `d=Tr ρ`, `d≥dim` agrees with NT |
| 3.4 | Timmermann Thms 3.2.19, 5.4.5 | `nt` 941–978, 1030–1034 (cross-check) | Locator not verifiable. `σ_z=f_iz*·*f_iz`, `τ_z`, `S²=τ_−i`, `h(ab)=h(bσ_−i(a))` agree with NT |
| 4.2 | BMT §§2–3, Thm 3.6 pp.18–19 | `bmt` 678 (p.15), 858–872 | Correct |
| 4.3 | BMT Thms 2.2, 2.8, 3.6, Cor 2.9 | `bmt` 257–258 (p.6), 461–464 (p.10), 478–483 (p.11) | Correct. 2.2 requires faithful Haar and a bounded counit, as §4.3 says |
| 5.1 | BMT §2 pp.13–14 | `bmt` 586–646 | Correct: `U=[[α,−qγ*],[γ,α*]]`, `0<|q|<1`. Timmermann Ch.6 is not verifiable |
| 5.2 | Banica Prop 1, Lemma 1; Malacarne §2, Lemma 2.1 | `banica` 54–57, 65 (p.2); `malacarne` 169–183 (p.3) | Correct: `E(1)=Σ F_ji e_i⊗e_j`; `R=(ι⊗F)r`, `FF̄=±1` |
| 6.2 | Malacarne Lemmas 1.2, 2.1, 2.2, 3.1; Thm 4.1 proof | `malacarne` 63–127 (p.2), 183, 202 (p.4), 235, 307–312 (p.6) | Correct |
| 6.3 | Malacarne Thm 4.1 | `malacarne` 285–289 (p.5) | Correct (existence and uniqueness of `(C[G],Δ)`) |
| 7.2 | Banica Thm 1, Prop 2, pp.1–4 | `banica` 9, 42–46, 72–75 | Correct, with `β=c⁻²‖E(1)‖⁴`. The README's n ≥ 2 caveat is needed (Source issues) |
| 8.2 | Virelizier Ex. 3.3, Prop 3.7, Cor 3.8, pp.11–12 | `virelizier` 552–555, 585–594 | Correct |
| 8.5 | Virelizier Lemma 2.3, Prop 4.1, pp.6–7, 13–14 | `virelizier` 265–300, 644–651 | Correct |

Also read: Virelizier §2.3 and Prop 2.4 at `virelizier` 348–359 (p.8, the same Hopf convention as §8.1); Thm 3.13 and Cor 3.14 at 625–636 (p.13); §4.1 at 638–642 (p.13); Penneys Prop 4.5.3, Facts 4.5.5 and Exs 4.6.12, 4.6.14 at `penneys` 745–790 and 941–1016 (pp.158–159, 163–164). The README flags no locator as unverified.

**Adversarial table.** q=1/2 unless stated.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `AlgebraicHaar` | ℂ[C₂], `h(u_g)=δ_g,e`; zero functional | `(id⊗h)Δu=u·h(u)=0=h(u)1`; `h((1+u)*(1+u))=2≥0`; zero: `h(1)=0≠1` | ok | none |
| `AlgebraicHaar`, wrong star | ℂ[ℤ], `u*=u` | `h((u−u⁻¹)*(u−u⁻¹))=h(u²−2+u⁻²)=−2<0`: excluded | ok | none |
| `schur_orthogonality`, form 1 | SU_q(2), `F̃=diag(2,1/2)`, a=u₁₁, c=u₂₁ | `h(a*a)=1/5=(1/2)/(5/2)`; `h(c*c)=4/5=2/(5/2)`; `h(a*c)=(F̃⁻¹)₁₂=0` | ok | none |
| `schur_orthogonality`, form 2 | `aa*` | `1−q²·4/5=4/5=F̃₁₁/TrF̃`; NT `h(u_kl u_ij*)=δ_ki ρ_jl/d` gives `ρ_lj=(ρᵗ)_jl` | ok | none |
| `schur_orthogonality`, degenerate | A=ℂ, H=ℂ; H=0; `I₂` on ℂ² | `Ft=[1]`, `1=1/1`; H=0 has ⊥=⊤, so not simple; `I₂`: LHS `h(u₁₁*u₂₂)=1`, RHS `δ₁₂=0`, so simplicity is needed | ok | none |
| `unitaryCoefficientSet` | n=1 trivial; n=0; ℂ[C₂] | `[1]` unitary, so 1 is in the set; n=0 adds nothing; `u*u=u²=1`, so u is in the set | ok | none |
| `compactType_iff` | ℂ; ℂ[C₂]; zero ring; ℂ[x] with x primitive | both true; `|a|²+|b|²>0` and span{1,u}=A; zero ring: span=⊤ but `h(1)=h(0)=0≠1`, so `[Nontrivial A]` is needed; `x+h(x)≠h(x)1`, both false | ok | none |
| `compactType_iff`, other star | ℂ[ℤ], `u*=u` | `u*u=u²≠1`, so only 1 is unitary and the span is ℂ≠A; Haar positivity gives −2: both false | ok | none |
| `haar_modular_automorphism` | SU_q(2); θ⁻¹; ℂ[S₃] | `θ(a)=ρ₁₁aρ₁₁=4a`: `h(aa*)=4/5=4·h(a*a)`; θ⁻¹ gives `1/20`; ℂ[S₃]: `h(u_g u_k)=δ_gk,e`, θ=id | ok | none |
| `haar_trace_iff_antipode_involutive` | ℂ[S₃]; SU_q(2) | trace and `S²=id`; `4/5≠1/5` and `S²c=c/4≠c` | ok | none |
| §8.5 sphericity (absent, R01) | L₁⁺; L₀⁻; q=±1 with K=2; q=i | `trK⁻¹=5/2=trK`; `−1=−1`; `1/2≠2`; `K−K⁻¹=(q−q⁻¹)[E,F]` and `tr([E,F]φ)=0`, with `2i≠0` | true; statable at `2fd255d9` | R01 |
| §8.5 trace sides | g=K⁻¹, Trace.lean:88/93 | rightTrace `Σeⁱ(gfeᵢ)=tr(gf)`; leftTrace `Σeⁱ(fg⁻¹eᵢ)=tr(g⁻¹f)` | ok | none |
| §8.5 CG vector | m=n=j=1 | `α₁=−q[1]/[1]=−1/2`; `ΔE(v₀⊗v₁−½v₁⊗v₀)=(½−½)v₀⊗v₀` | ok | none |
| §8.5 Δ(E²), Δ(F²) | r=2 | `EK⊗E+KE⊗E=(1+q²)EK⊗E=5/4=q[2]`; `F⊗(K⁻¹F+FK⁻¹)=(1+q²)F⊗FK⁻¹` | ok | none |
| §8.1 antipode | generators | `S(E)+K⁻¹E=0`; `S(F)K⁻¹+F=0`; `S²E=K⁻¹EK=q⁻²E` (Virelizier Prop 2.4) | ok | none |
| §8.1 Ore twist | q≠0; q=i | `δ_E(FK)=(K²−1)/(q−q⁻¹)=q²q⁻²K δ_E(F)`; at q=i: `(−1)(−K)(K−K⁻¹)/(2i)` | ok | none |
| §8.1 quantum integers | q=1/2; q=1 | `[−2]=(4−1/4)/(−3/2)=−5/2`; totalized `0` vs Laurent `2` | ok | none |
| §8.2 L₂⁺, L₁⁻ | ladders | weights `1/4,1,4`; `[E,F]=diag(5/2,0,−5/2)`; L₁⁻: `diag(3/2,−3/2)/(−3/2)=diag(−1,1)` | ok | none |
| §8.2 source formula | Virelizier Ex. 3.3 | `(q^(n−2i+2)−q^(−n))(q^(2i)−1)/((q−q⁻¹)(q²−1))=[i][n−i+1]`; n=2: `[2],[2]` | ok | none |
| §8.3 Casimir | L₀⁺, L₁⁺, L₂⁺ | `(5/2)(4/9)=10/9`, `17/9`, `65/18`; `diag(0,1)+diag(17/9,8/9)=17/9·I`; mixed ordering gives `diag(8/9,26/9)` | ok | none |
| §8.3 q=1 | `K=[[1,1],[0,1]]`, E=F=0 | `(q−q⁻¹)⁻¹=0`, so [E,F]=0 holds; `(K−I)²=0≠K−I`; ℂe₁ has no complement | ok | none |
| §8.4 type 1 | L₀⁻; Verma M(1) | `−1∉{2^(−k)}`; weights `4^j` with F never nilpotent | ok | none |
| §8.6 real form | relations; L₁⁺ | `(KE)*=KFK=q²K²F=(q²EK)*`; `Δ(E)*=KF⊗1+K⊗KF=Δ(KF)`; `h₁=q=1/2`; `E*=KF=2F`; `[E,F]=diag(1,−1)` | ok | none |
| §8.7 bases | `v_i=q^(i(i−1)/2)u_i` | F: `q^(−i)(i+1)_q=[i+1]`; E: `q^(i−1+1−m+m−i)=1`; `(2)_q=5/4≠5/2` | ok | none |
| 0.1 legs | C₂ sign u; ε; flip W | `U₁₂U₁₃=u⊗u=Δu`; ι₂ twice gives `1≠u⊗u`; `ε(1[s])=0`; `W((1⊗1)(u⊗1))=1⊗u≠u⊗1` | ok | none |
| 0.2 norms, standardness | `diag(2,1)`; cups ×2, ×½ | `4=4`, HS `√17≠5`; squared norms `8, ½≠2`, so not standard, though the product is 2=d (LR 3.11) | ok | none |
| 0.2 sign | SU(2), `R=e₁⊗e₂−e₂⊗e₁` | `(R*⊗ι)(ι⊗R)e₁=−e₁`, so τ=1 and ε=−1=−τ | ok | none |
| 0.3 TL | d=5/2; d=√2; m=3 | `tr₂p=(1/d)/d=4/25`, `21/25`; `[4]=2√2−2√2=0`; `min(2,2−2)=0` | ok | none |
| 1.1 | S₃; ℤ | `(12)(23)=(123)`, `(23)(12)=(132)`; `Δ1[0](N,−N)=1`, not C₀ | ok | none |
| 1.2 | monoid {1,0}; ℤ Fell | `F(0,1)=F(0,0)` on the span, dim ≤ 3; `W*(δ₁⊗δ₂)=δ₁⊗δ₁→δ₂⊗δ₁→δ₂⊗δ₃` | ok | none |
| 2.2 | `U(s)=[[1,2],[0,−1]]`; U=0 | `U²=I`; `T=[[1,1],[1,3]]`, det 2, `U*TU=T`; U=0 gives T=0 | ok | none |
| 3.2 | f_z; Vandermonde; a+c | `2·2=4=f₂(a)`; det 3; `1/5+4/5+0=1` | ok | none |
| 3.3 | F | `TrF=TrF⁻¹=5/2>2`; `F*GF=I`, so G=F⁻² | ok | none |
| 3.4 | c | `σ_t(c)=(½)^(it)2^(it)c=c`; `τ_−i(c)=ρ₂₂cρ₁₁⁻¹=c/4=S²c` | ok | none |
| 4.2 | ℤ pentagon; C₂ | both words send `(δ₁,δ₂,δ₃)` to `(δ₁,δ₃,δ₆)`; `‖1+u‖=2`, L² `√2` | ok | none |
| 4.3 | F₂; ℤ | `2√3<4=ε`; `2/(2N+1)→0` | ok | none |
| 5.1 | `u*u`, `uu*` | entries give the five relations, with `a*a+c*c=1=a*a+cc*`, so c is normal; `S²c=q²c=c/4` | ok | none |
| 5.2 | `F=[[0,1],[−2,0]]`; invariance | `FF̄=−2I`; cup `−2e₀⊗e₁+e₁⊗e₀`, `‖E‖²=5`; `Σ_j u_ij(Fū)_kj=Σ_l F_kl(uu*)_il=F_ki` | ok | none |
| 5.2 AM–GM | general F; SU_q(2) | `Tr(F*F)≥n|c|` since `|detF|²=|c|ⁿ`; `(1+q⁻²)/q⁻¹=q+q⁻¹` | ok | none |
| 6.1–6.3 | Rep(S₃); I_n; {e}→C₂ | `1+1+4=6`; `ε(a)=a(1)=0` since 1∈B_n; `(a,b)↦a` | ok | none |
| 7.1 Haar | `c*c`, `(c*c)²`; q=−1 model | `(3/4)/(15/16)=4/5`; `(3/4)/(63/64)=16/21`; `σ₃σ₁=−σ₁σ₃` gives ac=−ca; `∫t=1/2`, `∫t²=1/3` | ok | none |
| 7.1 character | ξ₂, ξ₃ | `½√(3/4)=√3/4`; `(√3/2+√15/4)/3`; `⟨e_k0,ae_k0⟩=0` | ok | none |
| 7.2 | `F=[[0,1],[−2,0]]`; n=1; moments | c<0 gives q=1/2, `δ=−5/2`, `β=25/4=d²`; dims `1,2,3,4` vs `1,5/2,21/4,85/8`; n=1: `u⊗u=1`; `m₂,m₄=1,2` vs `1,1` | ok | none |
| 7.2 normal form | `F=I₂` | `V=(1/√2)[[1,i],[1,−i]]`: `VVᵗ=[[0,1],[1,0]]`, the q=−1 form | ok | none |

## Not verifiable

- **Timmermann**, *An Invitation to Quantum Groups and Duality* (EMS 2008), is settled in the manifest as `uncertified` (paywalled). These locators were not read: §§1.2, 2.1, 2.2 (Thm 5.3.3), 2.3, 3.1 (Props 3.2.9, 3.2.17, Thm 5.4.1), 3.2, 3.3, 3.4, 4.1 (Prop 2.2.4, Rem. 2.2.2(iv)(c), Thm 3.2.12), 5.1 (Ch.6 §2), 7.1 and 8.6. Where NT states the same mathematics, it was checked there (see the sample table).
- **Elaboration at main's pins.** This review may run Lean only at the branch pins. R01's repair was checked by reading the declarations at `2fd255d9`, not by elaborating them.
- **Ownership against open pull requests** was checked against the sibling checkouts (#888, #867) and #1649 (via `roadmaps list` and `git merge-tree`), and by `roadmaps grep` over all open heads for the compact-quantum-group objects. Other objects were not searched pull request by pull request.

## Source issues

- **Misprint** in bmt at Theorem 2.12, proof, p.13: the source gives the Haar state as (1−q²) times the plain sum over n of the diagonal coefficients at e_n0; it should weight the n-th term by q^(2n), since the plain sum diverges at a=1; affects the proof.
- **Error** in banica at Theorem 1, p.2: the source states SU(2)-type fusion for every n ∈ ℕ; it should require n ≥ 2, as its abstract says, since at n=1 the algebra is C*(ℤ/2) with u⊗u trivial; affects a stated result.
