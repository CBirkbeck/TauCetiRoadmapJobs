# Review of OperatorAlgebraDynamics (pull request #1137 at e2d8e4d)

**Verdict:** needs changes

This is a full review of the folder at e2d8e4d (347 lines changed since f8ae283). There is one finding, a P3, and it lies outside the folder: the branch still deletes six files of other roadmaps, so the gate fails and the folder cannot be accepted. The six folder findings of the previous review are all repaired, and the full pass over `README.md` and `Suggested.lean` found nothing else to change.

## R01 (P3) — The branch still deletes six files of other roadmaps, so the gate fails

Re-raised: H04

**Location.** Six files outside the folder:
- `TauCetiRoadmap/FiniteGroupExtensionSplitting/PROGRESS.md` and `STATUS.md`
- `TauCetiRoadmap/LieGroupoidsPoisson/PROGRESS.md` and `STATUS.md`
- `TauCetiRoadmap/PrimitivePrimeDivisors/PROGRESS.md` and `STATUS.md`

**Claim.** Merging this branch deletes from main six files that belong to other roadmaps. While it does, the gate fails and no acceptance is possible.

**Why the reason fails.** The last repair report (H04) agrees that the defect is real and answers that a repair of this folder may write only the folder's two files. That says who can make the commit; it does not remove the deletion. The fix is one commit on the branch by someone who may write outside the folder (the author or an operator).

**Witness.**
- At e2d8e4d, `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/OperatorAlgebraDynamics'` gives `6 files changed, 159 deletions(-)`, for exactly these paths.
- My gate run: `outside-folder=6 … FAIL`, every other check 0.

**Repair.** In a new commit on the branch, run `git checkout origin/main -- <the six paths>`, then re-run the gate. Checked on this head: the merge base is 32a0bcc9; `git diff 32a0bcc9 origin/main -- <paths>` is empty, and `git diff --stat HEAD origin/main -- <paths>` is `6 files changed, 159 insertions(+)`, so the checkout restores exactly the dropped blobs and touches nothing else.

## Previous findings (review of f8ae283)

- **R01 (Mackey's theorem statable, absent) — repaired.** `Suggested.lean` lines 255–277 now declare `IsAnalyticBorelSpace` and `existsUnique_groupTopology_of_isAnalyticBorelSpace`, with uniqueness over group topologies. The docstring moves Mackey to "Stated here", and README lines 1277–1293 name both declarations. The README adds three Checks (lines 1345–1363).
- **R02 (extreme KMS states are factor states) — repaired.** `mem_extremePoints_kmsStates_iff` is at `Suggested.lean` lines 472–479 with the import of `TauCeti.Analysis.CStarAlgebra.Action.KMS.StateSpace`. README lines 3229–3245 name it and give a route. The docstring keeps only "the Choquet simplex property of `K_β`" as not statable.
- **R03 (Cuntz simplicity) — repaired.** `cuntz_isSimpleRing` is at lines 437–443, with `[Nontrivial H]` and `2 ≤ n`. README lines 3051–3061 name it with the route through the universal `O_n`, and a Check (lines 3074–3080) gives the n=1 and H=0 controls.
- **R04 (six deleted files) — not repaired.** Raised again as R01 above.
- **R05 (`exists_centralIntegratedOperator` independent of ω) — repaired.** It is replaced by `twistedConvolution` and `centralIntegrated_twistedConvolution` (lines 211–230). README lines 1006–1016 state the bound in prose and name the multiplicativity theorem; the Check at lines 1164–1175 separates the projective pair from the non-projective family.
- **R06 (crossed *Needs:* of the two D2 sequence subsections) — repaired.** The inclusion of `B=C₊⋊ℤ` in R now sits in D2.SequenceToeplitz (lines 2053–2059). D2.BoundedSequenceTranslation refers to no later subsection, and its *Needs:* line (1982–1990) names C1.7 and `NonUnitalStarAlgHom.multiplierExtension`. SequenceToeplitz's *Needs:* line (2079–2088) names the algebra R and the embedding `B→M(K(ℓ²(ℤ)))`.
- **R07 (Mathlib names without namespace) — repaired.** README lines 1264, 1366, 1457 and 2273 and `Suggested.lean` line 236 carry the `MeasureTheory.Measure.` prefix; all resolve at the pin.

## Verified sound

### Gate, dependency check, elaboration, signatures, padding

- **Gate** (my run at e2d8e4d): `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=6 source-material=0 FAIL`. It agrees with the worker's gate, which adds `build=0`.
- **Dependency check:** `depcheck: 235 roadmaps, 2268 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The roadmap is on main, so it may consume only Mathlib, Tau Ceti and roadmaps on main. Every *Needs:* line names only those; the roadmaps not on main (MetaplecticAutomorphicForms, NoncompactQuantumSymmetry, OperatorKTheory, CStarClassification, QuantumFoundations, CompactQuantumMetricSpaces, HeisenbergImprimitivity) appear only as deferrals or consumers.
- **Elaboration:** `lake env lean` of `Suggested.lean` exits 0; the only diagnostics are 18 `declaration uses sorry` warnings.
- **`#check @` of all 23 declarations** in a scratch file importing the built module: all elaborate. I compared each type with its README statement. No section binder is lost, and the README and Lean generalities agree:
  - `centralIntegrated_twistedConvolution` is on `C_c(G,A)` with `[μ.IsHaarMeasure]`, as README line 1011 says;
  - Mackey's theorem has `G : Type u` with the model space X in the same universe;
  - the KMS theorem has `[CStarAlgebra A]` (unital) and the hypothesis `α.IsKMSState β ω`.
- **One-tactic probe:** each `sorry` replaced by `first | rfl | infer_instance | trivial | decide | simp` in a scratch copy. All 18 theorems fail (errors at the 18 proof lines), so none is padding by that test. The five definitions and structures have real bodies; there is no sorry'd data, `set_option` or `example`.
- **Two scratch proofs with no `sorry`:**
  - `IsAnalyticBorelSpace G` holds for every `StandardBorelSpace G` (X=G, s=univ), so Mackey's hypothesis is satisfiable.
  - For a cocycle with every value 1, `twistedConvolution ω μ f g s = CStarAction.convolution α μ f g s` by `simp` with `convolution_apply`, as the docstring and README line 979 claim.
- **Headline audit.** The README's headlines are: the L¹ integrated form, recovery of the pair, ideal exactness (D1); twisted multiplicativity (D1.CentralTwists); automatic continuity and Mackey (D1.BorelPrefix); the amenable full/reduced comparison (D2); orbit irreducibility; Powers partition, simplicity and unique trace; the two Fourier isomorphisms; the LCA Weyl classification; Cuntz simplicity and the residue family; extreme KMS = factor; strong subadditivity. All are stated. The docstring's eight "not statable" items each name a missing carrier (reduced crossed product, C*-tensor product, twisted crossed product, imprimitivity bimodule, groupoid C*-algebra and universal `O_n`, Choquet simplex, modular operator, CAR/Weyl/quasi-local algebra), and I found none of those carriers at the pins.

### Seeded sample

- **"Worked example: the saddle flow"** (README lines 2099–2136) against `williams-cpcsa-draft31` lines 6178–6198. Example 3.32 starts on printed p. 96 (line 6145) and continues on p. 97 (line 6191). The action is `r·(x,y)=(rx,r⁻¹y)`; the orbits are the origin, the four half-axes and two per hyperbola `xy=b≠0` (line 6181); every neighbourhood of the origin contains the four `a_i` (line 6187); basis (c) (line 6194) is the README's basis at a half-axis point and basis (b) its basis at the origin. The README's orbits, closures, bases and T₀ / not T₁ / not Hausdorff conclusions agree (row 21).
- **"D5.Fields — the standard-fibre model as a measurable field"** (lines 2624–2714). Definition E.16 is at line 23770 and Theorem E.17 at line 23776, both on printed p. 405 (the next page marker, 406, is at line 23792). E.17 assumes H separable, X second-countable locally compact Hausdorff and μ a finite Borel measure: D5.Fields' standing hypotheses. Definition F.1 is at line 23897, p. 409, and the "(nonzero)" fibre assumption at line 23893, p. 409. The seven Checks recompute (row 22).
- **"Concrete Cuntz families on separable Hilbert space"** (lines 3103–3139): every formula recomputed (row 19). Cuntz 1977 is uncertified (see Not verifiable).
- The README flags no locator as unverified.

### Further locators read

`williams-cpcsa-draft31`: Theorem D.11, line 21995 (separable metric groups, G Polish: the Lean signature); Definition D.19, lines 22147–22149, p. 375; Definition D.21, lines 22176–22180, p. 376 (`(r,s)↦r⁻¹s` Borel for the product structure); Theorem D.23, lines 22193–22196, p. 376 (nonzero left-invariant σ-finite μ; μ a Haar measure; the proof cites Lemma D.40 at line 22199).

### Library declarations at the pins (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9)

- 24 names cited by the changed passages elaborate with `#check @`: `PositiveLinearMap.gnsStarAlgHom` (`Analysis/CStarAlgebra/GelfandNaimarkSegal.lean` line 246), `Set.extremePoints`, `Set.centralizer`, `MeasurableMul₂`, `MeasurableInv`, `MeasurableEquiv`, `MeasureTheory.AnalyticSet`, `StandardBorelSpace`, `MeasureTheory.Measure.IsHaarMeasure`, `IsSimpleRing`, `Units.oneSub`, `MonoidHom.isOpenMap_of_sigmaCompact`, `CharacterModule.exists_character_apply_ne_zero_of_ne_zero`, `MeasureTheory.Measure.ext_of_charFun`, `ProbabilityTheory.charFun_gaussianReal`, the three prefixed names of the previous R07, and Tau Ceti's `CStarAction.kmsStates`, `convex_kmsStates`, `isCompact_kmsStates`, `isKMSState_rotation_iff`, `isKMSState_zero_iff` and `convolution`.
- Tau Ceti declarations opened:
  - `IsKMSState` (`Action/KMS/Basic.lean` line 222) has the fields `norm_eq_one` and `exists_isKMSFunction`. So a KMS state is normalised, and the zero functional (whose GNS space is 0, making the right side of the iff true) is excluded.
  - `isKMSState_zero_iff` (line 237): the 0-KMS states are exactly the norm-one traces, with no invariance requirement. This is what makes the β=0 case of `mem_extremePoints_kmsStates_iff` true (row 20).
  - `kmsStates` (`KMS/StateSpace.lean` line 61) is the image of the KMS states in `WeakDual ℂ A`.
  - `IsKMSState.eq_zero_of_apply_toPreGNS_one_eq_zero` (`KMS/Separating.lean` line 114) holds for every β, as the README's route uses it.
  - `convolution_apply` (`Action/Convolution/Basic.lean` line 133): `∫ f r * α r (g (r⁻¹ * s))`.
- `scratch/library-matches.md`: no same-name hit and no candidate that states any of the 23 declarations. My own search of both libraries for Cuntz families, extreme points of `kmsStates`, analytic Borel groups, strong subadditivity and twisted convolution found none.

### Cross-roadmap citations, resolved on main (f8836c4)

- CStarAlgebras: C1.3 (line 305), C1.6 (435), C1.7 (468), C2.2 (568), C2.AnnHull (695), C5.4 (1203), C6.5 (1414), C7.1 (1455), C8.4 (1676).
- HilbertModules: H1 (126), H3 (262), H5 (356).
- VonNeumannAlgebras: V4.0.Fields, V4.0.Decomposition, V11.UnitizationCharacters and V11.FourierUniqueness (build order at lines 245–258).
- SelfAdjointSpectralTheory SA-B85 (132, 255); LieGroupoidsPoisson G0.0 (261); BanachAlgebras A7.CharactersAndUniqueness (1739); AmenableGroups Layer 5 (289) and Layer 7 (415); FreeProbability F3 (56); RepresentationTheory/CompactGroups and SpinRepresentations exist.
- `scratch/citations.md` lists nothing unresolved.

### Ownership and overlaps

- `roadmaps grep` over the 458 open heads and main: no other roadmap declares `IsAnalyticBorelSpace`, `cuntz_isSimpleRing`, `mem_extremePoints_kmsStates_iff`, `twistedConvolution` or a Mackey topology theorem, and none uses the namespace `TauCetiRoadmap.OperatorAlgebraDynamics`. The one hit for "analytic Borel space" is NoncompactQuantumSymmetry line 2032, a consumer. CStarAlgebras on main does not state Cuntz simplicity.
- `overlaps.md`: no dropped id, no id that only an open revision defines. Its one conflict is the pin-bump pull request #1187, and the description's merge-order block now states the order ("`OperatorAlgebraDynamics`: this pull request → #1187").
- Not raised: the description's prose describes earlier heads (ten admissions, companion Lean files that the head no longer has). Earlier repair reports settled description-only points as outside a folder repair, and the head's file list (README.md, Suggested.lean, PROGRESS.md, STATUS.md, metadata.toml) is what this review reads.

### Adversarial table

Rows 1–20 and 23 are the stated declarations; rows 19, 21 and 22 are the seeded sample; rows 24–30 are conventions recomputed in the README.

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | `exists_integratedOperator` | ℤ counting, `f=δ_0⊗a+δ_1⊗b`; `f(n)=2^(−\|n\|)a`; G trivial | `π(a)ξ+π(b)Uξ`; `‖f‖₁=‖a‖(1+2Σ_(n≥1)2^(−n))=3‖a‖`; `π(f(e))` | holds | none |
| 2 | `exists_covariantRepresentation_integratedFull` | G trivial, A=ℂ², `L(x,y)=x`; L=0 on ℂ | `L(1,0)=1`, π=L, U=1; for L=0 the span of `L(a)ξ` is 0, excluded by `hL` | holds | none |
| 3 | `fullCrossedProductMap_exact` | G trivial, A=ℂ², I=ℂ⊕0; I=A | `0→ℂ→ℂ²→ℂ→0`, ker of `(x,y)↦y` is I; I=A forces B=0, first map bijective | holds | none |
| 4 | `CentralCocycle` | ℤ/2 on ℂ, `ω(a,a)=−1`; trivial action on M₂, `ω(a,a)=diag(1,−1)` | Lean `cocycle` at r=s=t=a: left `α_a(ω(a,a)α_a⁻¹(ω(a,e)x))=−x`, right `ω(a,a)ω(e,a)x=−x`; on M₂ `diag(1,−1)E_12=E_12≠−E_12=E_12diag(1,−1)`, only `central` fails | discriminating | none |
| 5 | `CentralCovariantPair` | same ℤ/2, π=id on ℂ | `U_a=i`: `U_a²=−1=π̃(ω(a,a))U_e`; `U_a=1`: `1≠−1` | discriminating | none |
| 6 | `twistedConvolution` | ℤ/2, `ω(a,a)=−1`; (ℤ/2)², `ω=(−1)^(ba′)`, u=(1,0), v=(0,1); ω=1 | `δ_a*δ_a=ω(a,a)δ_e=−δ_e`; `ω(u,v)=1`, `ω(v,u)=−1`, `δ_u*δ_v=δ_(u+v)`, with `ω(r⁻¹s,r)` it is `−δ_(u+v)`; ω=1 equals Tau Ceti's convolution (Lean proof) | pins the argument order | none |
| 7 | `centralIntegrated_twistedConvolution` | ℤ/2, `U_a=i` and `U_a=1`; general | `T_(δ_a*δ_a)=−1`; `T_(δ_a)²=i²=−1` for the pair, `=1≠−1` for `U_a=1`; `π(f(r))U_rπ(g(t))U_t=π(f(r)α_r(g(t))ω(r,t))U_(rt)`, `s=rt`; associativity `U_r(U_sU_t)=α̃_r(ω(s,t))ω(r,st)U_(rst)=(U_rU_s)U_t` | holds; uses ω | none |
| 8 | `continuous_of_measurable_monoidHom` | Hamel ℚ-linear ℝ→ℝ; D.11 | discontinuous hence not Borel; hypotheses at line 21995 match | holds | none |
| 9 | `IsAnalyticBorelSpace` | standard Borel G; ℝ with countable–cocountable sets | holds (Lean proof, s=univ); fails: that σ-algebra is not countably generated, a relative Borel structure of a second-countable space is | discriminating | none |
| 10 | `existsUnique_groupTopology_of_isAnalyticBorelSpace` | ℝ, Lebesgue; φ swapping [0,1) and [1,2); counting measure; μ=0 on `ℝ^ℕ` | usual topology; `φ((−½,½))=(−½,0)∪[1,3/2)` is τ′-open, `U−1=(−3/2,−1)∪[0,½)`, `φ(U−1)=(−3/2,−1)∪[1,3/2)` not open, so τ′ is no group topology; counting measure is infinite on [0,1] and not σ-finite; an lcsc topology on `ℝ^ℕ` would equal the product topology, not locally compact; μ=cν with 0<c<∞ by σ-finiteness | holds; "group" and both measure hypotheses needed | none |
| 11 | `injective_integratedFull_regular_of_amenable` | ℤ, A=ℂ; F₂, `h=δ_a+δ_(a⁻¹)+δ_b+δ_(b⁻¹)` | `‖λ(f)‖=sup_𝕋\|f̂\|`; trivial character gives 4, `‖λ(h)‖=2√3<4` | holds; amenability needed | none |
| 12 | `transitive_commutant_scalar` | ℤ/2 swapping {p,q}; trivial action | `T=diag(d_p,d_q)`, swap forces `d_p=d_q`; under the trivial action `diag(1,0)` commutes and is not scalar | holds | none |
| 13 | `exists_powers_partition` | F={b}, L=2, `w=ab²`; ℤ, F={1}, N=3 | `wbw⁻¹=aba⁻¹`; `(aba⁻¹)·a=ab` starts with a; in ℤ, `(C+1)∩C=∅` gives D density ≥½, three disjoint translates need ≤⅓ | holds | none |
| 14 | `generatedCStarAlgebra` | λ on F₂ without closure; bilateral shift | augmentation ideal of ℂ[F₂] is proper; after closure `\|χ(h)\|=4>2√3`, the character is unbounded; shift gives C(𝕋) | discriminating | none |
| 15 | `reducedFreeGroup_isSimpleRing`, `reducedFreeGroup_trace_unique` | singleton basis; {a,b} | C(𝕋): ideal of functions vanishing at 1, `ev_z(λ(b))=z≠0=τ(λ(b))`; `⟨δ_1,λ(g)δ_1⟩=[g=1]` | hold; a≠b needed | none |
| 16 | `exists_fullGroupCStarAlgebra_equiv_zeroAtInfty_dual` | ℤ/2; S₃ | `f̂(1)=f₀+f₁`, `f̂(χ)=f₀−f₁`, `δ_a↦(1,−1)`; `C*(S₃)=ℂ²⊕M₂` not commutative | holds | none |
| 17 | `exists_fullGroupCStarAlgebra_dual_equiv_zeroAtInfty` | G=ℤ; ν↦cν | unitary at z ↦ `(n↦zⁿ)`; f with cν equals cf with ν | holds | none |
| 18 | `lcaWeyl_classification` | ℤ/2; ℤ/3 shift and `V_χ=diag(χ(t))`; E=0 | `U_aV_χU_a*=diag(−1,1)=conj(χ(a))V_χ`; `(UVU*ξ)(t)=χ(t−1)ξ(t)=conj(χ(1))χ(t)ξ(t)`, the phase `χ(s)` fails; ι=∅ | holds | none |
| 19 | `cuntz_isSimpleRing`, `exists_residue_family` (sampled) | n=1 bilateral shift; H=0; n=2 residue family; shift family; finite-dimensional H | `U*U=UU*=1`, `C*(U)=C(𝕋)` not simple; H=0 gives the zero ring; `S_0*b_3=0`, `S_1*b_3=b_1`, `(S_0S_0*+S_1S_1*)b_3=S_1b_1=b_3`; `S_jb_k=b_(k+j)` gives `S_1*S_0=S_1*≠0`; `n·dim H≤dim H` impossible | hold; `2≤n`, `Nontrivial H` needed | none |
| 20 | `mem_extremePoints_kmsStates_iff` | ℂ⊕ℂ trivial dynamics; M₂, K=diag(0,1); rotation of C(S¹), β≠0 and β=0; ω=0 | (1,0), (0,1): GNS dimension 1, factor and extreme; (½,½): `π(A)''=ℂ²`, centre ℂ², neither; M₂: unique Gibbs state, `π(A)''=M₂⊗1` a factor, commutant M₂ so not pure; β≠0: `ω(az^n)(e^(−nβ)−1)=0` forces `ω(1)=0`, K_β=∅, `ev_z` a factor state, so `hω` is needed; β=0: K_0 is all states, extreme = point evaluations = factor states; ω=0 excluded by `norm_eq_one` | holds | none |
| 21 | Saddle flow (sampled) | (1,1), (−1,−1), (1,−2) | orbits `{(u,1/u):u>0}`, `{(u,1/u):u<0}`, `{(u,−2/u):u>0}`; `{x>0,\|xy\|<ε}` saturated, open, misses 0; +x and +y neighbourhoods share first-quadrant branches `r<ε` | holds; locator correct | none |
| 22 | D5.Fields (sampled) | N={0} below ½, {0,1} from ½; non-measurable S; S=[0,½] | `1_(x≥½)E_01` maps fibres to fibres; constant `E_10` sends `e_0` to `e_1∉span e_0` below ½; `1_Se_0` not measurable; zero fibres give `L²(S)` | holds; locators correct | none |
| 23 | `vonNeumannEntropy_strong_subadditivity` | GHZ; 2·GHZ; `\|0⟩⟨0\|⊗Φ⁺` | `0+log2≤log2+log2`; `S(cσ)=cS(σ)−c·Trσ·log c` gives `−2log2+0≤0+0`; `log2≤log2`, and with `ρ_A` for `ρ_AB` it reads `log2≤0`, false | holds | none |
| 24 | D1 convolution direction | ℤ/3 shift on ℂ³ | `(f*g)(2)=e_0α_1(e_2)=e_0`; inverse convention gives `e_0e_1=0` | holds | none |
| 25 | `T_b` and `ψ_b` directions | ℤ/3, `b(1)=i`, `b(2)=1` | `ω^b(1,2)=i`; `(iδ_1)δ_2=iδ_0`; reversed `−δ_0` against `δ_0`; `(i,1)(1,2)=(i,0)` in `E_1` | holds | none |
| 26 | Right multiplier `fi_G(t)` | substitution `r=su⁻¹` | `∫f(su⁻¹)g(u)Δ(u⁻¹)du`, `Δ(t⁻¹)=c(t)`: `c(t)f(st⁻¹)ω(st⁻¹,t)` | holds | none |
| 27 | Sequence algebras | `E_ij=M_(1_{i})U^(i−j)`; p even projection; `p=1_[0,∞)` | `E_ijδ_n=[n=j]δ_i`; `UpU*=1−p`, so no character on R; `α_1(p)−p=−δ_0∈c₀`, so `C(𝕋)→Q` is defined and the characters `ev_z∘q` of B cannot extend to the unital R | holds | none |
| 28 | KMS sign and perturbation | K=diag(0,1), a=E_12, b=E_21; P=−diag(0,1) | `ω(aτ_(iβ)b)=e^(−β)/(1+e^(−β))=ω(E_22)`; K+P=0 gives the trace (½,½) | holds | none |
| 29 | CAR `√(n+1)`; `U_σ` left action | f⊥g; σ=(1 2), τ=(2 3) on ℂ³ | `bb†g+b†bg=‖f‖²g/2`; `U_σU_τe_123=e_312=U_(στ)e_123` | holds | none |
| 30 | D9 values | Ising chain, λ=1; on-site h | `M_λ=\|h\|+2\|J\|e`, `M_(λ,2)=\|h\|+8\|J\|e`, bound `(1/2)/(1+8e)=1/(2+16e)`; `p=log2cosh βh`, `s−βe=p` | holds | none |

## Not verifiable

Cited by locator only; the manifest records them as uncertified (paywalled) and I did not read them:

- **Cuntz 1977, §1** — the seeded "Concrete Cuntz families" target and `cuntz_isSimpleRing`. The relations, the residue family and the n=1 and H=0 controls are checked by computation (row 19), not against the text.
- **Bratteli–Robinson 2, Theorem 5.3.30** (and §§5.2–5.3, Theorems 5.2.8 and 5.4.4, §6.2). The extreme-point characterisation is checked on four instances (row 20), and the β=0 case against Tau Ceti's `isKMSState_zero_iff`; whether the source's theorem covers β=0 as printed I could not read. The README gives its own route for β=0.
- **Bratteli–Robinson 1**, **Renault 1980**, **Brown–Ozawa, Proposition 5.1.3**.

Rudin's *Fourier Analysis on Groups* has no manifest entry; it is cited only for statements consumed from VonNeumannAlgebras V11.

Ownership against open pull requests was checked with `roadmaps grep` over the indexed heads; I did not open every sibling README.

## Source issues

- **Misprint** in williams-cpcsa-draft31 at Example 3.32, p. 96 (lines 6184 and 6187–6188): the source opens an instruction with "Given" and writes "The a basis"; it should read "Give A and the Qi the relative topology" and "A basis"; affects nothing.
- **Misprint** in williams-cpcsa-draft31 at Theorem D.23, p. 376 (lines 22194–22195): the source says G has a unique second-countable locally compact topology compatible with its Borel structure; it should say a unique such topology making G a topological group, since a Borel automorphism of ℝ transports the usual topology to another; affects nothing.
