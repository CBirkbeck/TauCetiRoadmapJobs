# Review of SmoothBanachRepresentations (pull request #1145 at 3313062)
Folder: `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/`
**Verdict:** needs changes

This is an incremental re-review of the 119 lines changed since 2b062ae. Two findings remain:
- **R01 (P2)** carries the previous R02. The repair did not give the Fréchet open mapping theorem a single owner. §7.0 now owns it outright, and LocallyAnalyticDistributions §0.2, which comes earlier in the merge order, still owns the same theorem.
- **R02 (P3)** carries the previous R05 (the family index).

The previous R01, R03 and R04 are repaired, and those repairs introduced no new defect.

## R01 (P2) — The Fréchet open mapping theorem still has two owners: §7.0 and LocallyAnalyticDistributions §0.2

**Location.** `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/README.md`:
- :9: “§7.0 proves the pinned summation step without that one hypothesis, the only part of the theorem missing at the pins, and derives the Fréchet open mapping theorem over every nontrivially normed field; §7.2 applies it at ℝ and ℂ.”
- :452: “Derive the Fréchet open mapping theorem.”
- :473: “§7.0 (Fréchet open mapping), at 𝕜=ℝ and ℂ.”

The same ownership is restated at :56, :82–84, :88, :444, :519, :523 and :572.

**Claim.**
- LocallyAnalyticDistributions §0.2 (“Strict sequences and three-space properties”) is an open pull request that adds a new roadmap, by another author. It owns this theorem: a continuous surjective K-linear map between Fréchet spaces over a complete nontrivially valued field is open. It states this with no ultrametric hypothesis, so it covers ℝ and ℂ.
- The candidate merge order puts it at line 44, before this roadmap at line 60. That makes it the earlier owner.
- §7.0's Fréchet form (:452) contains that theorem. This README never mentions LocallyAnalyticDistributions, so the object has two owners. That is the previous R02, unrepaired: this head removed the citation of LocallyAnalyticDistributions §0.2 and made §7.0 an owner.
- The rest of §7.0 is also owned elsewhere. Its first paragraph (:448) proves the summation step and the Henkel module form without `NonarchimedeanAddGroup`. By this README's own account (:9, :84), that is the theorem Completed AdicSpaces §0.6 states “under Henkel's hypotheses”. Formalising it at full generality would extend AdicSpaces; it is not a target of this roadmap.
- §7.0 has exactly one consumer here: §7.2's quotient-topology comparison for E∞→(E/M)∞, at ℝ and ℂ. §7.2a no longer uses it (:483). Both spaces are complete and metrizable, with their topology given by the word seminorms of Layer 2. So LocallyAnalyticDistributions' statement covers this consumer exactly.

**Witness.**
- LocallyAnalyticDistributions `README.md:1107` at head 473fb50: “**Fréchet open mapping** (theorem; `naFrechet_openMapping` …) … carries no ultrametric hypothesis on K”.
- Its `Suggested.lean:73` binds `[NontriviallyNormedField K] [CompleteSpace K]`, metrizable complete V and W, and `WithSeminorms` families.
- Candidate merge order: line 44 (LocallyAnalyticDistributions) versus line 60 (this roadmap).

**Repair.**
1. In §7.2, at :471 and :473, cite “LocallyAnalyticDistributions §0.2, **Fréchet open mapping**, at K=ℝ and ℂ” for the open quotient map E∞→(E/M)∞.
2. Add a contract heading “From TauCetiRoadmap.LocallyAnalyticDistributions” that names only that theorem.
3. Delete §7.0 (:446–461). Delete the open-mapping paragraph of the Tau Ceti contract (:56), the AdicSpaces contract (:82–84), and the AdicSpaces/§7.0 sentences at :9, :88, :444, :519 and :523.
4. Delete the Baire-theorem Mathlib items in :44, which only §7.0 uses, and the Henkel reference (:572).
5. Keep `QuotientAddGroup.completeSpace_right` for §7.2a.

I tested this on a scratch copy of the README with step 1 and the contract heading applied. `gate --depcheck --movable` with the candidate order printed “depcheck: 236 roadmaps, 2420 edges, 0 problem(s)”. That is one more edge than the head, from the new LocallyAnalyticDistributions edge, and no UPWARD, CYCLE or moved line.

## R02 (P3) — The family index still omits this roadmap, and its scope paragraph contradicts it

This carries the previous R05 and earlier rounds' R01. No repair report marks it not actionable.

**Location.** `TauCetiRoadmap/RepresentationTheory/README.md`:
- :11, “## The roadmaps”: 14 distinct links, none of them to `SmoothBanachRepresentations/README.md`.
- :129–131: “The analytic representation theory stops at compact groups … no infinite-dimensional unitary representations of noncompact groups”.

**Claim.**
- The index presents itself as the family's map, but it omits this folder.
- Its scope boundary excludes what Layers 0–4 here cover: strongly continuous, and in particular unitary, representations of arbitrary Lie groups.
- The pull request description does not name the companion pull request that adds the entry, or the order in which the two merge.

**Witness.** The grep `](<Dir>/README.md)` on the index at this head gives 14 distinct folders out of the 15 subfolders; `SmoothBanachRepresentations` is the one missing. The pull request's diff outside the roadmap folder is empty. Pull request #1146 (head e5e8364) carries the bullet at :56 and a rewritten scope bullet at :119–123.

**Repair.** Do one of the following:
- Move #1146's bullet at :56 and its scope bullet at :119–123 into this pull request's family `README.md`, replacing :129–134. The grep then gives 15 of 15.
- Or add to the description: “#1146 adds the family-index entry and scope change for this roadmap and merges right after this pull request.”

## Previous findings

- R01 — repaired: §0.2 (:102) now defines “A_X as the `generator` of `ContRepresentation.toStronglyContinuousGroup` applied to π_X”. Its only targets are the scaling and 𝕜-linearity laws. The semigroup adapter paragraph and the :48 sentence are gone, and the `Suggested.lean` docstring (:25–27) is updated.
- R02 — not repaired: :9 “§7.0 … derives the Fréchet open mapping theorem over every nontrivially normed field”. LocallyAnalyticDistributions §0.2 still owns it and is earlier in the merge order. Carried as R01.
- R03 — repaired: §6.1 (:400–404) states the exponential-product chart as a target, proved via `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq`. An affine-group Check covers both orders and a rank-1 non-basis Check is added. The LieGroups contract (:64) and §4.1 automatic smoothness are corrected.
- R04 — repaired: §1.3 (:160) uses native `Continuous.integrable_of_hasCompactSupport` “with no separability hypothesis on E”. §7.1 and §7.2 use the pinned `ContRepresentation.subrepresentation` and `ContRepresentation.quotient`, proving only orbit continuity.
- R05 — not repaired: the family `README.md` still has 14 of 15 links and the scope bullet :129–131 is unchanged. Carried as R02.

## Verified sound

**Head and diff.**
- Head `3313062aaa00449511659b7d64824637357314e7`; the worktree is clean.
- Since 2b062ae: `README.md` +82/−37 and `Suggested.lean` +3/−2 (module docstring only, :25–27). Nothing changed outside the folder; the family files are untouched.
- This review changed no file in the worktree or the manifest.

**Gate.** Rerun with the candidate merge order and `--build`:

```text
gate SmoothBanachRepresentations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

**Dependency check** (`gate --depcheck … --movable`, candidate order, content main 1d4e7ce):

```text
depcheck: 236 roadmaps, 2419 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

**Elaboration.** `lake env lean Suggested.lean` gives exactly 7 warnings, all “declaration uses `sorry`”, at :95, :104, :116, :135, :148, :165 and :183. The shift of one line from the previous round comes from the docstring.

**Signatures.**
- I elaborated a scratch copy of the file with `#check @name` for all 12 declarations. All 12 types match `signatures.md` up to universe names.
- Every declaration's body is unchanged since the previous round. That round compared each type with its README statement, and the six “looks dropped” binders are the ones each type does not mention.
- The one-tactic padding probe was not rerun, because no statement changed. The previous round's probe failed on all 7 theorems.

**Library declarations opened at the pins** (Tau Ceti 2fd255d, Mathlib 1b1ccf4).

Tau Ceti:
- `ContRepresentation.toStronglyContinuousGroup` (`RepresentationTheory/Continuous/OneParameter.lean:32`). It takes `RCLike 𝕜`, `IsScalarTower ℝ 𝕜 V` and orbit continuity, and returns t↦(π(ofAdd t)).restrictScalars ℝ.
- `StronglyContinuousGroup` (`Analysis/Semigroups/Group/Basic.lean:74`), with `reflect` (:184) and `toSemigroup` (:202).
- In `Group/Generator.lean`:
  - `domain` (:76) and `generator` (:81);
  - `generator_commute_of_commute` (:125), `map_mem_domain` (:146), `generator_map` (:152);
  - `mem_domain_of_hasDerivAt_zero` (:170) and `generator_eq_of_hasDerivAt_zero` (:175);
  - from :181 on, under `[CompleteSpace X]`: `reflect_generator` (:218), `hasDerivAt_zero` (:248) and `hasDerivAt` (:261). This matches the README's “on a complete space”.
- `StronglyContinuousSemigroup.dense_domain` (`Generator/Basic.lean:351`) and `isClosed_generator` (`Generator/Closed.lean:91`).
- `IsComplexLinear` (`Generator/ComplexLinear.lean:77`; X carries `NormedSpace ℂ`, and the real structure is obtained by restriction), `complexDomain` (:149) and `complexGenerator` (:170).
- `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq` (`Geometry/Manifold/LocalDiffeomorph/Basic.lean:358`): `RCLike`, a complete model, an interior point and 1≤n.
- `TauCeti.Lie.contMDiff_of_continuous_monoidHom` (`Geometry/Lie/AutomaticSmoothness.lean:129`): finite-dimensional models, with `LieGroup I ∞` on both sides. It applies to GL(W) through Mathlib's `LieGroup 𝓘(𝕜,R) n Rˣ` (`Geometry/Manifold/Instances/UnitsOfNormedAlgebra.lean:64`).
- `ContRepresentation.subrepresentation` and `quotient` (`RepresentationTheory/Continuous/Subrepresentation.lean:56` and `:141`). Neither assumes orbit continuity.
- Open mapping (`Topology/Algebra/OpenMapping/`):
  - `HasZeroSequenceOfUnits.closure_image_mem_nhds_zero` (`Basic.lean:178`) and `exists_seq_mem_and_sub_sum_mem` (`Sequence.lean:53`): no nonarchimedean hypothesis.
  - `mem_image_of_mem_closure_image` (`Complete.lean:69`) and `isOpenMap_of_closure_image_mem_nhds` (`Complete.lean:116`): these assume `NonarchimedeanAddGroup M`.
  - `HasZeroSequenceOfUnits.isOpenMap` and `isQuotientMap` (`Henkel.lean:79` and `:96`).
  - `LinearMap.surjective_of_isOpenMap` and `completeSpace_of_isOpenMap` (`Converse.lean:52` and `:62`).
  - `IsTate.hasZeroSequenceOfUnits` and `IsTate.of_nontriviallyNormedField` (`Analysis/Normed/Ring/PseudoUniformizer.lean:307` and `:326`), with no ultrametric hypothesis.
  - The README's account of these declarations is accurate.

Mathlib:
- `ContRepresentation.restrict` (`RepresentationTheory/Continuous/Basic.lean:446`).
- `QuotientAddGroup.completeSpace_right`, the additive form of `IsUniformGroup/Basic.lean:700`: a complete first-countable uniform group.
- `BaireSpace.of_completelyPseudoMetrizable` (`Baire/CompleteMetrizable.lean:27`).
- `TopologicalSpace.IsCompletelyPseudoMetrizableSpace.of_completeSpace_pseudometrizable` (`Metrizable/CompletelyMetrizable.lean:75`).
- `IsUniformAddGroup.uniformity_countably_generated` (`IsUniformGroup/Defs.lean:428`).
- `ContinuousLinearMap.isOpenMap` (`Normed/Operator/Banach.lean:229`).
- `MonoidHom.isOpenMap_of_sigmaCompact` (`Group/OpenMapping.lean:114`, `to_additive`).
- `ContinuousLinearMap.isOpenMap_of_ne_zero` (`ContinuousLinearMap/Basic.lean:918`).
- `Continuous.integrable_of_hasCompactSupport` (`LocallyIntegrable.lean:617`; only `OpensMeasurableSpace` and `IsFiniteMeasureOnCompacts`).
- A search for every `IsOpenMap` theorem in Mathlib also found `isOpenMap_of_finiteDimensional` (finite-dimensional target) and the module-topology ones, but no Fréchet open mapping theorem. That confirms R01's premise that the theorem is not at the pin.

**Cross-roadmap citations resolved.**
- Completed AdicSpaces §0.6 is on main at :253–258. It states Henkel's hypotheses with no ultrametric condition, the link anchor resolves, and its STATUS records the nonarchimedean form.
- LieGroups Layer 0 (main :264–280) supplies the Lie algebra ≅ `GroupLieAlgebra` at 1 and the exponential chart, and states no product chart. The contract at :64 is now accurate.
- LocallyAnalyticDistributions §0.2 is at #854 head 473fb50: the heading at :1081 and the theorem at :1107. It does not mention this roadmap or Henkel.
- NoncommutativeGeometry #1143 :22 cites §7.2a, which still exists.
- No roadmap cites the renamed §0.2 heading. `roadmaps overlaps` reports no other pull request changing this roadmap and no dropped ids. `roadmaps resolve` reports no unresolved name.

**Seeded sample, where it falls in the changed passages.**
- **0.2 and 0.3.** Casselman p.1 fixes the orbit convention: `casselman2016` lines 11–16 define V^(1) by d/dt π(exp tx)v at 0. Supported.
- **4.1.** Norm density via a Dirac sequence is at `casselman2016` line 36. The new smoothness of G-finite vectors cites a pinned theorem whose hypotheses hold, as above.
- **7.2.**
  - Casselman Proposition 6.1, p.13, is at `casselman2016` lines 645–682. The product step “smooth on the two-dimensional image of exp(ℝx₁)exp(ℝx₂)” at lines 675–676 supports §6.1's citation.
  - Henkel, Theorem 1.6, p.4 is at `henkel2014` lines 131–141. Proposition 1.9, p.5 (lines 162–193) is the Baire step: the closure of u(V) is a neighbourhood of 0 when u(M) is not meagre.
  - Proposition 1.12, p.6 (lines 207–220) is the summation step for Hausdorff groups with countable bases at 0 on both sides. Its proof uses right-invariant metrics (line 212) and Proposition 1.10 (lines 197–203). So “proves this when N also has a countable basis” is accurate.
  - No ultrametric hypothesis appears in any of these. The locators are correct; R01 concerns ownership, not sources.
- **7.2a.** This carries no external locator. The new completed-quotient argument is checked in row N9.
- 1.1, 1.2, 1.5, 2.1, 3.1–3.4, 5.1 and 8.1 are unchanged; the previous review verified them.

**Remark on untouched text.** None.

### Adversarial table

New rows, for the statements this diff adds or changes:

| # | Statement | Instances and values computed | Result |
|---|---|---|---|
| N1 | 0.2 scaling law A_sX=s·A_X, D(A_sX)=D(A_X) for s≠0; A_0=0 | For π(t)x=e^t x on ℝ: s=2 gives group e^{2t} and A₂x=2x; s=−1 gives e^{−t} and A₋₁x=−x, which is pinned `reflect_generator`; s=0 gives the identity, A=0 and D=E. The wrong laws give A₂x=x (A_sX=A_X) and A₋₁x=x (\|s\|·A_X). | True |
| N2 | 0.2 𝕜-linearity and the complex identification | For e^{it}z on ℂ: A1=i and A(i)=i·i=−1=i·A1. A conjugate-linear map would give A(i)=−i·i=1. `IsComplexLinear` holds since each e^{it} commutes with complex scalars. | True |
| N3 | 0.2 no additivity in X | In L²(ℝ²), with u=x−y and w=x+y, take f=1_[0,1](u)φ(w). Along (1,1) the orbit is 1_[0,1](u)φ(w+2t), with derivative 2·1_[0,1]φ′ ∈ L². Along (1,0), ‖τ_tf−f‖²≈\|t\|‖φ‖² (Jacobian ½, strip width 2\|t\|), so the squared quotient is ‖φ‖²/\|t\|→∞. So f ∈ D(A_(1,1)) but f ∉ D(A_(1,0)). | True |
| N4 | 0.3 Check on the e^t group | U(0)x=x and U(s+t)x=e^{s+t}x. sup_{[−1,1]}‖π‖=e≈2.718, while the global sup is ∞. | True |
| N5 | 1.3 integrability, no separability | Trivial action of ℝ on ℓ^∞ (nonseparable), with f the tent of integral 1 on [−1,1]: g↦f(g)v is continuous with compact support, so the lemma applies and π(f)v=v. Hence ‖π(f)v‖=‖v‖ ≤ 1·‖f‖₁‖v‖. | True |
| N6 | 4.1 G-finite vectors are smooth (automatic smoothness) | Rotation on C(S¹,ℝ) with v=cos: W=span{cos,sin} (dimension 2), ρ(θ)=[[cosθ,−sinθ],[sinθ,cosθ]] ∈ GL₂(ℝ), which is continuous and hence smooth. The orbit θ↦cos(x−θ) is C^∞ into W. | True |
| N7 | 6.1 exponential-product chart | Affine group, order (H,N): Φ=(e^{t₁},e^{t₁}t₂) with Jacobian matrix [[e^{t₁},0],[e^{t₁}t₂,e^{t₁}]], determinant e^{2t₁} (=1 at 0), and da db/a² pulls back to dt₁dt₂, so J≡1. Order (N,H): Φ=(e^{s₂},s₁), \|det\|=e^{s₂}, J=e^{−s₂}. Non-basis X₁=X₂=e₁ on ℝ²: derivative (t₁,t₂)↦(t₁+t₂,0), rank 1. d=1: Φ=exp. | True; the chart is now owned here |
| N8 | 7.0 summation step (no ultrametric hypothesis) | Projection ℝ²→ℝ sends the unit disc to (−1,1), which is open; the pinned form is excluded because an open subgroup of ℝ² contains nv for all n. Inclusion ℚ→ℝ (incomplete source): the closure of the image of (−ε,ε)∩ℚ is [−ε,ε], but (−1,1)∩ℚ is not open in ℝ. Route: W_{n+2}+⋯+W_{m+1}⊆W_{n+1} by induction from the right, and closure(W₀)⊆W₀−W₀⊆U. | True, but owned elsewhere (R01) |
| N9 | 7.2a completed quotient replaces open mapping | X=ℂ_ℝ⊗ℂ_ℝ (dimension 4) and N=span{i⊗1−1⊗i, 1⊗1+i⊗i} (dimension 2), so X/N has dimension 2 and equals ℂ⊗_ℂℂ. The quotient norm of 1⊗1 is ≤π_ℝ(1⊗1)=1. The contraction x⊗y↦xy vanishes on N and gives ≥\|1·1\|=1. That matches π_ℂ(1⊗1)=1. For metrizable X, X̂/N̄ is complete by `completeSpace_right` and has the same quotient seminorms. | True; no open mapping needed |
| N10 | 7.0 Fréchet form, field hypothesis | ℝ with the trivial absolute value: the identity ℝ_discrete→ℝ_usual is linear, continuous and surjective, both spaces are complete metrizable and scalar multiplication is continuous, but the image of {0} is {0}, which is not open. Nontriviality is needed. For (ℓ¹,‖·‖₁)→(ℓ¹,‖·‖₂) with r=0.5 and n=17: coefficient 0.5/(2√17)≈0.0606, ℓ²-norm 0.25, ℓ¹-norm ≈1.03>1. Not open, so the target is not Baire. | True, but owned elsewhere (R01) |
| N11 | 7.1 and 7.2 orbit continuity on M and E/M | C(S¹) under rotation, with M the mean-zero functions: the orbit of m stays in M with the subspace topology. E/M≅ℂ via the mean, the quotient action is trivial, and the orbit of [f] is constant. E∞→(E/M)∞ is f↦mean f, which is open onto ℂ. | True |
| N12 | `Suggested.lean` docstring (:25–27) | No declaration changed; 12/12 signatures are identical to the previous round's. | No defect |

Rows carried from the previous report (`PRREVIEW-SmoothBanachRepresentations_r12`, adversarial table) for untouched statements, with that report's values:

| r12 row | Statement | Values (from r12) | Result |
|---|---|---|---|
| 1 | 0.1 compact operator bounds | e^t on [−1,1]: e≈2.718, global sup ∞. L∞ translation: difference norm 1. L²: √(2\|t\|). | True |
| 3 | 1.1 fixed-support spaces | K=∅ gives D_K={0}; for G=ℤ, dim D_K=\|K\| | True |
| 4 | 1.3 bound ‖π(f)v‖≤C_K‖f‖₁‖v‖ | Trivial group of mass 2 gives equality; for e^t, e−1≈1.718 ≤ e | True |
| 5 | 1.4 order and modular factor | S₃: δ_(12)*δ_(23)=δ_(123); affine group c(a₀,0)=a₀ | True |
| 6 | 3.1 dπ is a Lie map | [H,N]v=(1,0)=Nv | True |
| 7 | 3.2 Ad covariance | g=diag(2,1): gNg⁻¹=2N | True |
| 8 | 3.3 dπ(X)π(f)v=π(−R_Xf)v | For e^t: −∫f′e^t=∫fe^t | True |
| 9 | 3.4 modular integration by parts | q_H=1=tr ad H, q_N=0 | True |
| 10 | 4.1 real comparison | cos: real span dimension 2; e^{ix}: complex span dimension 1 | True |
| 11 | `dense_smoothLieVectors` | L²(ℝ): the smooth vectors are H^∞, which is dense | True |
| 12 | `isSmoothLieVector_smear` | e^t, v=1: the orbit e^s∫fe^t is smooth | True |
| 13 | `scalarParametrix` | ε=0 forces limit 0≠δ₀; ̂δ^{(2n)}=(−1)^n(2πy)^{2n} | True |
| 14 | `dixmierMalliavin` | Trivial group of mass 2: f(1)=1/2; constant J=2 | True |
| 15 | `dixmierMalliavin_function` | S₃, U={e}: δ_e*δ_(12)=δ_(12) | True |
| 16 | 7.1 M∞=M∩E∞ | Projection ℝ²→ℝ; mean-zero C(S¹) | True |
| 17 | `smooth_lift` | f̂(1): w=1 lifts to e^{ix}; T=0 has no lift | True |
| 18 | 7.2a seminorm and complexification | π(e₁⊗e₁)=1 versus √2+1≈2.414; ℂ_ℝ⊗ℂ_ℝ (dimension 4) → ℂ | True (balancing route re-checked in N9) |
| 19 | 7.3 diagonal derivatives | e^t⊗e^{2t}: 3 and 9 | True |
| 20 | 7.4 contragredient | ‖δ_z−δ₁‖=2; for e^t the contragredient is e^{−t} | True |
| 21 | `smooth_inverse` | diag(e^t,1): (I+E₁₂)⁻¹ orbit I−e^tE₁₂ | True |
| 22 | 8.1 star law | Df(0)=−i and D(f*)(0)=i; (dαE₁₂)*=E₂₁≠−E₂₁ | True; hypothesis present |

## Not verifiable

- **Dixmier–Malliavin, Bull. Sci. Math. 102 (1978).** No legal open copy was found in earlier rounds, and it was not fetched this round. The README labels its locators uncertified and relies on Casselman's stated results, which are verified.
- **Ownership against the three unrelated board packages** (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory): their READMEs were not read.

## Source issues

- **Misprint** in casselman2016 at the proof of Proposition 6.1, p.13 (lines 652–658): the source says the series has coefficients α_n with no alternating sign; it should carry (−1)^n α_n, as in Lemma 5.1 at line 613; affects the proof.
- **Misprint** in casselman2016 at the proof of Proposition 6.1, p.13 (lines 670–672): the source says that π(µ₀)α₀=v+π(µ₁)v with α₁=v gives v=π(µ₀)α₀+π(µ₁)α₁; it should give v=π(µ₀)α₀−π(µ₁)α₁; affects nothing.
