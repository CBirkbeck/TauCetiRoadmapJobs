# Review of OperatorAlgebraDynamics (pull request #1137 at 895d9b8)

**Verdict:** needs changes

This is a full review of head 895d9b8, the head the previous review read. I read all 4049 lines of `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` and all 417 lines of `Suggested.lean`. There are seven findings, all P3; none is blocking. The two findings carried over from the previous review are not repaired, because the head has not changed, and one of them still makes the gate fail. The other five are new: two Checks that are false as written, gap slugs that label sections already on main, the D5–D6 theorems having no locators at the claim, and a target-level cycle in D6.

## Previous findings (review of 895d9b8)

- **R01 (outside-folder deletions): not repaired.** `git diff --stat origin/main...HEAD` outside the folder still shows the same six deletions (159 lines). This is R01 below.
- **R02 (no stated order with #1187): not repaired.** The description's last line still reads "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1097, #1771, #1015, #863". This is R07 below.

## R01 (P3) — The branch deletes six files of other roadmaps, so the gate fails

**Location.** The following files are outside the folder: `TauCetiRoadmap/FiniteGroupExtensionSplitting/PROGRESS.md` and `STATUS.md`, `TauCetiRoadmap/LieGroupoidsPoisson/PROGRESS.md` and `STATUS.md`, and `TauCetiRoadmap/PrimitivePrimeDivisors/PROGRESS.md` and `STATUS.md`. This finding is carried over from the previous review's R01.

**Claim.** The pull request removes files that main carries and that belong to other roadmaps.

**Witness.** All six files exist at origin/main (11b9f2ea) and none exists at 895d9b8. My gate run at this head reports `outside-folder=6 … FAIL`; every other check is 0.

**Repair.** Restore the six files in a new commit with `git checkout origin/main -- <the six paths>`. After that, the only difference from main is inside `TauCetiRoadmap/OperatorAlgebraDynamics/`. Acceptance is not possible while the gate fails.

## R02 (P3) — The noncentral Busby–Smith Check gives an example that is central

**Location.** `README.md` lines 1128–1131 (D1.CentralTwists, Checks): "A noncentral Busby–Smith pair … ω not central, for example the inner action of a nonabelian finite group on `M_n(ℂ)` with its Schur multiplier, does not satisfy the `central` law".

**Claim.** The example is not noncentral, so the Check does not test the `central` field of `CentralCocycle`.

**Witness.** A Schur multiplier σ is scalar-valued. Take a projective representation u with `u_su_t=σ(s,t)u_(st)`. Then `α_s=Ad(u_s)` satisfies `α_sα_t=α_(st)`, and `ω(s,t)=u_su_tu_(st)*=σ(s,t)·1` is central. So `central` holds and the example is not excluded.

**Repair.** Replace the example with the following, which I checked. Let `G=ℤ/2={e,a}` act trivially on `M_2(ℂ)`, with `ω(a,a)=diag(1,−1)` and every other value 1.
- This ω is normalized, unitary and strictly continuous.
- It satisfies the cocycle identity: at `r=s=t=a` both sides equal `diag(1,−1)`, and every other triple reduces by normalization.
- It fails `central`, because `diag(1,−1)E_12=E_12≠−E_12=E_12diag(1,−1)`.

So `central` is the only field that excludes it. Add one more sentence: a genuine noncentral Busby–Smith pair, `α_a=Ad(diag(1,i))` with `ω(a,a)=diag(1,−1)`, is excluded earlier, because `α_a²=Ad(diag(1,−1))≠id` is not a `TauCeti.CStarAction`.

## R03 (P3) — The saddle-flow Check gives the wrong orbit for third-quadrant points

**Location.** `README.md` lines 1993–1994 (D2, the worked example on the saddle flow, which is in the seeded sample): "the orbit of (x,y) with `xy=r>0` is the branch `{(u,r/u):u>0}` of its quadrant, closed in ℝ²".

**Claim.** The displayed set is the first-quadrant branch. It is not the orbit of a point with `x,y<0`, which also has `xy>0`.

**Witness.** Take `(x,y)=(−1,−1)`. Then `xy=1`, and the orbit is `{(−e^t,−e^(−t))}={(u,1/u):u<0}`. This set is disjoint from the stated `{(u,1/u):u>0}`.

**Repair.** Write: "the orbit of (x,y) with `xy≠0` is the branch `{(u,xy/u): ux>0}` of its quadrant, closed in ℝ²". I checked it on three points:
- `(−1,−1)` gives `{(u,1/u):u<0}`.
- `(1,−2)` gives `{(e^t,−2e^(−t))}={(u,−2/u):u>0}`.
- `(1,1)` gives the original first-quadrant branch.

The rest of the worked example is correct; the full computation is in the adversarial table, row 25.

## R04 (P3) — Six gap slugs label sections that already exist on main

**Location.** `README.md` lines 18–19 ("consumed as declared gaps") and 226–231. The paragraph at lines 557–617 opens "What HilbertModules must provide (gap:hilbert-module-induction)" and "What CStarAlgebras must provide (gap:cstar-ideals-multipliers): closed two-sided ideals and their quotient C*-algebras … (CStarAlgebras C1.3)". The slugs are then used on every *Needs:* line and Dependencies list that cites them.

**Claim.** A declared gap asks a supplier for something it does not yet state. All six slugs (`cstar-ideals-multipliers`, `cstar-representations`, `cstar-tensor-limits`, `cstar-nuclear-exact`, `toeplitz-extension`, `hilbert-module-induction`) instead label sections on main that already state the content. No `design/plan.json` declares any of these slugs, so the intake cannot read them as gaps either. The previous review left these six slugs unexamined; it raised the same defect for three other slugs, which the author then repaired.

**Witness.** Main's `TauCetiRoadmap/CStarAlgebras/README.md` has every cited section:
- C1.3 at line 305, whose lines 322–325 cover quotient C*-algebras and the correspondence with surjective homomorphisms;
- C1.4 at line 380, with the quasicentral approximate unit at line 385;
- C1.6 at line 435;
- C1.7 at line 468, with the extension `M(A)→M(B)` at line 475;
- C2.1–C2.4 at lines 544, 568, 616 and 643, and C2.AnnHull at line 695;
- C5.1, C5.2 and C5.4 at lines 1112, 1143 and 1203;
- C6.1, C6.2 and C6.5 at lines 1272, 1297 and 1414;
- C7.1 at line 1455 and C8.4 at line 1676.

HilbertModules H3 is at line 262 of `TauCetiRoadmap/HilbertModules/README.md`. It covers the induced space `E⊗_B H_π` and induction in stages (lines 287–289), and imprimitivity bimodules with `{}_A⟨x,y⟩z=x⟨y,z⟩_B` (line 297).

**Repair.**
- Delete the six slug tags.
- Turn the "Declared gaps" paragraph into "From TauCetiRoadmap.CStarAlgebras" and "From TauCetiRoadmap.HilbertModules" supplier contracts with the same content and section ids.
- On each *Needs:* line and in each Dependencies list, cite the section instead of the slug. For example, D1 would read "CStarAlgebras C1.7 (extensions into `M(B)`, the strict topology); CStarAlgebras C5.1–C5.2 and C5.4 (the maximal tensor product, the universal algebra on unitaries)".
- Update lines 18–19 and 636–650 to match.

Both suppliers are on main and earlier in the order (positions 7 and 8), so this adds no upward edge.

## R05 (P3) — D5–D6 state their main theorems with no locator at the claim

**Location.** `README.md` lines 2423–2990. Specifically:
- disintegration and its pre-representation form, lines 2655–2662: "use the general Muhly–Williams disintegration theorem's hypotheses";
- the full and reduced equivalence theorems, lines 2742–2756;
- étale uniqueness and the ideal theory, lines 2797–2837;
- amenability ⇔ nuclearity, lines 2808–2826: "the trivial-line-bundle case of Takeishi's construction";
- the Cuntz groupoid identification, lines 2891–2900.

**Claim.** House style puts each locator in parentheses at its claim. In these two layers the only locators are Williams' Appendix E/F comparisons in D5.Fields (lines 2512–2514 and 2546) and Cuntz §1 (line 2953). The theorem numbers for the headline groupoid theorems appear only in the References (lines 3959–3986).

**Witness.** The cached texts give the locators directly:
- `muhly-williams2008` line 2410: Theorem 7.8 (Renault's Proposition 4.2), p. 35, which is exactly the pre-representation form at lines 2656–2660.
- `muhly-williams2008` line 1174: Theorem 5.5, p. 20.
- `sims-williams2012` lines 552 and 733: Theorems 13 and 17, pp. 10 and 12.
- `takeishi2014` line 496: Theorem 5.4, p. 11.

**Repair.** Add the locators at the claims:
- "(Muhly–Williams, Theorem 7.8, p. 35)" at line 2655.
- "(Muhly–Williams, Theorem 5.5, p. 20, scalar case)" for the full equivalence theorem at line 2747.
- "(Sims–Williams, Theorem 13, p. 10)" for `Cr*(G)∼M Cr*(H)`.
- "(Sims–Williams, Theorem 17, p. 12)" for the quotient by `X·J_H`.
- "(Takeishi, Theorem 5.4, p. 11; Sims, §4.1)" at line 2813.
- "(Sims, §4.2)" for effectiveness and uniqueness, "(Sims, §4.3)" for the ideal lattice and simplicity, and "(Sims, §5.1)" for the Cartan structure.
- "(Renault, Chapter I §§2–3 and Chapter II §§1–2)" for Haar systems, convolution and regular representations.
- "(Renault, Chapter III, Proposition 2.7)" for the Cuntz identification.

## R06 (P3) — The universal `O_n` and the concrete Cuntz families need each other

**Location.** `README.md` lines 2927–2931, the *Needs:* line of the `O_n` target: "the concrete Cuntz families below, which make the universal norm of `O_n` finite and definite". Also lines 2970–2972, the *Needs:* line of "Concrete Cuntz families on separable Hilbert space": "D6 (universal O_n and its gauge-invariant uniqueness)".

**Claim.** These two targets form a cycle. An implementer of `exists_residue_family` is blocked behind `O_n`, which is itself blocked behind `exists_residue_family`. Only one sentence of the concrete-families target uses `O_n`: the representation `O_n→B(H)` and its change-of-basis comparison at lines 2948–2951. The family and its four identities use only Mathlib. Gauge-invariant uniqueness is used by neither.

**Witness.** Line 2929 lists the concrete families as a need of `O_n`, and line 2970 lists `O_n` as a need of the concrete families. The Lean statement `exists_residue_family` mentions only `HilbertBasis`, `ContinuousLinearMap.adjoint` and `Fin n`.

**Repair.**
- Reduce the *Needs:* line at line 2970 to "Mathlib `HilbertBasis`, `HilbertBasis.repr`, `exists_hilbertBasis`, `Nat.divModEquiv`, `ContinuousLinearMap.adjoint`".
- Move the sentence "For n≥2 use D6's existing universal property to construct the unital representation O_n→B(H) … by its actual unitary map" into the `O_n` paragraph, after "construct its universal norm/completion and generator maps".

The `O_n` target then needs the families, and the families need nothing from D6.

## R07 (P3) — The description states no merge order with #1187, which changes this `Suggested.lean`

**Location.** The last line of the pull-request description: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1097, #1771, #1015, #863". This finding is carried over from the previous review's R02.

**Claim.** Another open pull request changes this roadmap's `Suggested.lean`, and the two heads conflict. Neither description says which merges first.

**Witness.** This job's overlap data (index of 2026-11-09) says "#1137 and #1187 conflict in … `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean`". `roadmaps list` shows #1187 open and no longer lists #1097.

**Repair.** State the order in the description. Either #1187 merges first, and this branch is rebased and re-elaborated at its Tau Ceti pin; or this pull request merges first, and #1187 drops its OperatorAlgebraDynamics hunk. Remove #1097 from that line.

## Verified sound

### Gate, dependency check, elaboration, signatures and probe

- **Gate.** I ran it at 895d9b8. Result: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=6 source-material=0 FAIL` (R01). The worker's run adds `build=0`.
- **Dependency check.** Output: `depcheck: 235 roadmaps, 2259 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. OperatorAlgebraDynamics is on main, and every supplier named on a *Needs:* line or in a Dependencies list is on main. FreeProbability F3 is named only as "a comparison, not an input" (line 2015). QuantumFoundations, NoncompactQuantumSymmetry, OperatorKTheory, CStarClassification, MetaplecticAutomorphicForms, HeisenbergImprimitivity and CompactQuantumMetricSpaces appear only as deferrals or consumers; I checked every *Needs:* line and Dependencies list.
- **Elaboration.** I ran `lake env lean` on a scratch copy of `Suggested.lean`. It produced 15 `declaration uses sorry` warnings (lines 103, 116, 131, 203, 222, 237, 253, 274, 295, 306, 323, 339, 361, 385 and 408) and nothing else, in 17.6 s.
- **Signatures.** I ran `#check @name` on all 18 declarations in one scratch file, which elaborated with no error. I compared each type with its README statement and found no lost binders:
  - both integrated-operator theorems carry `μ.InnerRegularCompactLTTop` (README 691–694, 979);
  - `exists_covariantRepresentation_integratedFull` carries `H : Type (max u v)` and `IsHaarMeasure` (README 717–721);
  - `fullCrossedProductMap_exact` puts A and B in one universe, with `I` closed and invariant, `q` surjective and `ker q = I` (README 736–745);
  - `injective_integratedFull_regular_of_amenable` carries `Amenable G`, `IsHaarMeasure`, `Regular` and an injective but possibly degenerate ρ (README 1414–1421);
  - `lcaWeyl_classification` carries both strong continuities, the phase `conj(χ(s))`, and `ι : Type u` for `E : Type u` (README 2296–2309);
  - `exists_residue_family` carries the ℕ-indexed `HilbertBasis` and `0<n` (README 2933–2953);
  - `vonNeumannEntropy_strong_subadditivity` carries `PosSemidef` with no trace normalization (README 3694–3702).
  Nothing changed.
- **One-tactic probe.** I replaced each `sorry` with `first | rfl | simp | infer_instance | trivial | decide | aesop`. All 15 theorems fail, with errors at lines 110, 124, 141, 212, 227, 244, 264, 281, 298, 315, 332, 349, 376, 397 and 414. No declaration restates a definition, mirrors a Check or computes a small value, so none is padding.
- **Form.** The file has the single line `import Mathlib` plus eight `TauCeti.*` modules that exist at the pin. It has no `set_option`, `lemma`, sorry'd data or `#eval`. `generatedCStarAlgebra` has a real body, and the two structures contain no `sorry`. The module docstring names each headline that is not statable, with the carrier it lacks.

### Headline theorems

The Summary (lines 3–17) and the docstring list these headlines.
- **Stated in `Suggested.lean`:**
  - the L¹ integrated form and its twisted analogue;
  - recovery of the covariant pair;
  - full ideal exactness;
  - automatic continuity;
  - amenable full = reduced;
  - irreducibility of the orbit representations;
  - the Powers partition, simplicity and the unique trace of `Cr*(F_ι)`;
  - `C*(G)≅C₀(Ĝ)` and `C*(Ĝ)≅C₀(G)`;
  - the LCA Weyl classification;
  - the residue Cuntz family;
  - strong subadditivity.
- **Named in the docstring as not statable, with the missing carrier:**
  - the reduced crossed product: no reduced carrier;
  - `A⋊_idG≅A⊗_maxC*(G)` and Takai: no C*-tensor product or dual action;
  - `C*(G,ω)`: no twisted crossed product, and `twistedMonoidAlgebra` is algebraic;
  - Mackey's topology: no analytic Borel spaces;
  - Green and symmetric imprimitivity: no imprimitivity-bimodule carrier;
  - disintegration, equivalence and universal `O_n`: no groupoid C*-algebra or universal Cuntz algebra;
  - the KMS simplex: no Choquet simplex;
  - Araki's `Ω^Q`: no modular operator;
  - CAR/Weyl quasi-free states and the thermodynamic limit: no CAR or Weyl C*-algebra and no quasi-local algebra.
- I found no statable headline missing and none forced through a stand-in.

### Seeded sample

- **Worked example: the saddle flow (lines 1974–2006).** No locator is needed. For the action `(e^t x,e^(−t)y)`, `xy` is invariant. The orbits are the origin, four open half-axes, and the closed hyperbola branches `{(u,xy/u):ux>0}`. The Check's formula holds only in the first quadrant (R03).
  - `{x>0,|xy|<ε}` is saturated and open. It contains the +x orbit and the Q1/Q4 branches with `r<ε`, but not the origin.
  - A ball around `(1,0)` contains `(1,±δ)`, so this basis is cofinal.
  - `{|xy|<ε}` is a neighbourhood of the origin containing all four half-axis points, so T₁ fails.
  - The +x and +y neighbourhoods share the Q1 branches with `r<ε`, so the space is not Hausdorff.
  - The space is T₀.
  - `xy` is a submersion on each open quadrant.
- **D5.Fields (lines 2489–2572).** I recomputed all seven Checks:
  - a single point gives `H(x_0)`;
  - `N=ℕ` gives `L²(X;ℓ²)`, and `N={0}` gives `L²` and `L∞`;
  - for the varying field on `[0,1]`, `E_10e_0=e_1∉H(x)` for `x<½`, `E_01e_0=0`, and `1_(x≥½)E_01` maps `span{e_0,e_1}` into `span{e_0}`;
  - a non-measurable S gives a non-measurable section;
  - `1` and `E_00` agree on `span e_0`;
  - zero fibres give `≅L²(S)`;
  - empty X gives 0.

  The source locators check out:
  - Williams Definition E.16 and Theorem E.17 are at `williams-cpcsa-draft31` lines 23770 and 23776, printed p. 405. Their hypotheses (separable H, second-countable LCH X, finite μ) are the ones D5.Fields uses.
  - Definition F.1 is at line 23897, printed p. 409, and the nonzero fibres are assumed at line 23893.
  - VonNeumannAlgebras V4.0.Fields is on main at line 1181, and V4.0.Decomposition at line 1279.
- **Concrete Cuntz families on separable Hilbert space (lines 2933–2972).**
  - `⟨b_m,S_jb_k⟩=[m=nk+j]`, so `S_j*b_m=b_(m/n)` when `m mod n=j` and is 0 otherwise.
  - `S_i*S_jb_k=δ_ijb_k`, and `Σ_jS_jS_j*b_m=S_(m mod n)b_(m div n)=b_m`.
  - For n=2 at `b_3`: `S_0*b_3=0`, `S_1*b_3=b_1`, and the sum gives `b_3`.
  - For n=1, `S_0=Id`.
  - For the shift family, `S_1*S_0=S_1*≠0`.
  - Under a change of basis, `WS_jW*b′_k=Wb_(nk+j)=b′_(nk+j)`.
  - In finite dimension, isometries are unitaries, so n≥2 is impossible.

  Cuntz §1 is uncertified (Not verifiable). The *Needs:* cycle is R06.

### Adversarial table

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | `exists_integratedOperator` (691–697) | ℤ counting; G trivial | `δ_0⊗a+δ_1⊗b ↦ π(a)+π(b)U`; `f(n)=2^(−|n|)a`: bound `3‖a‖` (Σ2^(−|n|)=3); G trivial: `π(f(e))` | holds | none |
| 2 | `exists_covariantRepresentation_integratedFull` (716–721) | G trivial, A=ℂ²; L=0 on H≠0; H=0 | `(x,y)↦x` recovered as π=L, U=1; L=0 degenerate, excluded by `hL`; on H=0 the zero pair | holds | none |
| 3 | `fullCrossedProductMap_exact` (736–745) | G trivial; A=ℂ², I=ℂ⊕0; I=A | `0→I→A→A/I→0`; `C*(G)→C*(G)²→C*(G)`; B=0, first map onto | holds | none |
| 4 | `CentralCocycle` law (923–929; Lean 162–164) | ℤ/2, `ω(a,a)=−1`; A=0; trivial α on M₂ with `ω(a,a)=diag(1,−1)` | `(−1)(1)=(−1)(1)`; all fields hold on `M(0)=0`; last satisfies every field but `central` | holds | R02 Check repaired by this witness |
| 5 | Twisted star (948) | derived from `T_f*` | `U_s*=π̃(α̃_(s⁻¹)(ω(s,s⁻¹)*))U_(s⁻¹)`, substitution `s↦s⁻¹` gives `c(s)ω(s,s⁻¹)*α_s(f(s⁻¹)*)` via `ω(s,s⁻¹)=α̃_s(ω(s⁻¹,s))` | holds | none |
| 6 | `V^ω_sV^ω_t=Π̃(ω(s,t))V^ω_(st)` (993–997) | cocycle at `(s,t,t⁻¹s⁻¹r)` | `α̃_s(ω(t,t⁻¹s⁻¹r))ω(s,s⁻¹r)=ω(s,t)ω(st,t⁻¹s⁻¹r)` | holds | none |
| 7 | Multiplier formulas (1011–1013) | `U_tT_f`, `T_fU_t` | substitution `s=tr` gives `α_t(f(t⁻¹s))ω(t,t⁻¹s)`; `∫H(rt)dr=c(t)∫H` gives `c(t)f(st⁻¹)ω(st⁻¹,t)` | holds | none |
| 8 | Cochain direction `T_b` (1027–1033) | ℤ/2, `b(a)=i` | `ω^b(a,a)=i·i·(−1)=1`; `(iδ_a)²=−ω(a,a)δ_e=δ_e` in the ω-algebra | holds | none |
| 9 | Schrödinger family (1102–1109) | `x=(m,χ)`, `y=(n,ψ)` | `Π_xΠ_y=ψ(m)Π_(x+y)`; `ω(x,−x)=ω(−x,x)=χ(m)⁻¹`; star factor `ω(x,x)=χ(m)` | holds | none |
| 10 | `exists_centralIntegratedOperator` (976–980) | ω=1, ℤ counting | reduces to row 1: `π(a)+π(b)U_1` | holds | none |
| 11 | `continuous_of_measurable_monoidHom` (1177–1192) | Williams D.11 (line 21995, p. 372); Hamel map | source: G, H separable metric, G Polish = Lean's classes; ℚ-linear non-ℝ-linear map is discontinuous, hence not Borel | holds | none |
| 12 | `E_ω` inverse, `ψ_b` (1194–1221) | ℤ/2, `ω(a,a)=−1`, `b(a)=i` | `(z,s)(z̄·conj(ω(s,s⁻¹)),s⁻¹)=(1,e)`; `(1,a)²=(−1,e)`; `(i,a)²=(i²ω(a,a),e)=(1,e)` | holds | none |
| 13 | Weight projection `p_1` (1285–1299) | reps with `(z,e)↦z^k` | `∫z̄z^kdz=δ_(k1)`; z-weight picks `ω⁻¹` | holds | none |
| 14 | `injective_integratedFull_regular_of_amenable` (1414–1421) | ℤ; F₂ with `h=Σδ_(s^±)`; ρ=z⊕0 | `‖λ(f)‖=sup|f̂|`; `‖λ(h)‖=2√3≈3.46<4=χ_triv(h)` (de la Harpe p. 16); same kernel as ρ_ess | holds | none |
| 15 | `transitive_commutant_scalar` (1476–1486) | ℤ/2 on {p,q}; F=∅ | `(f(j)−f(i))T_ij=0`, `U_gδ_j=δ_(gj)` gives `t_(gj)=t_j`; commutant of `diag(f(p),f(q))` and swap is ℂ; F=∅ forces `|I|=1` | holds | none |
| 16 | Orbit generators (1504–1510) | θ∉ℚ, `n·x=x−nθ` | `(uvξ)(n)=e^(2πi(x−(n−1)θ))ξ(n−1)`, `(vuξ)(n)=e^(2πi(x−nθ))ξ(n−1)`: `uv=e^(2πiθ)vu`; positive rotation gives `e^(−2πiθ)` | holds | none |
| 17 | `exists_powers_partition` (1677–1690) | F={b}, L=2; F={b⁻¹}; F=∅, N=2; ℤ, N=3 | `wbw⁻¹=aba⁻¹`, `wb⁻¹w⁻¹=ab⁻¹a⁻¹`; `b^jD` disjoint (j leading b's); ℤ: D ≥½ density, 3 disjoint translates impossible | holds | none |
| 18 | `reducedFreeGroup_isSimpleRing` (1717–1731) | singleton basis; full `C*(F₂)`; algebraic ideal | `C(𝕋)` not simple (excluded by a≠b); `u−1∈ker χ_triv`, `λ(u)δ_1−δ_1≠0`; dense ideal meets `B(1,1)`, hence contains an invertible | holds | none |
| 19 | `reducedFreeGroup_trace_unique` (1717–1731) | `τ(λ(g))` | `⟨δ_1,δ_g⟩=[g=1]`; Fin 1: evaluation traces at each z∈𝕋 (excluded) | holds | none |
| 20 | `exists_fullGroupCStarAlgebra_equiv_zeroAtInfty_dual` (2168–2176) | ℤ/2; ℤ; S₃ | `f̂(χ)=f_0−f_1`, `‖δ_e+δ_a‖=2`; `δ_1↦z`; `C*(S₃)=ℂ²⊕M₂` non-commutative | holds | none |
| 21 | `exists_fullGroupCStarAlgebra_dual_equiv_zeroAtInfty` (2189–2199) | ℤ; ν↦cν | `C*(𝕋)≅c₀(ℤ)`, unitary at z ↦ `n↦zⁿ`; f w.r.t. `cν` = `cf` w.r.t. ν | holds | none |
| 22 | `lcaWeyl_classification` (2295–2309) | Schrödinger; ℤ/3; E=0 | `U_sV_χU_s*ξ(t)=χ(s⁻¹t)ξ(t)=conj(χ(s))χ(t)ξ(t)`; `U_1V_χU_1*=ω⁻¹V_χ` vs `V_χU_1V_χ*=ωU_1`; ι=∅ | holds | none |
| 23 | `exists_residue_family` (2933–2953) | n=1, 2; shift family | see Seeded sample | holds | R06 (*Needs:*) |
| 24 | `vonNeumannEntropy_strong_subadditivity` (3694–3702) | GHZ; 2·GHZ; `|0⟩⟨0|⊗Φ⁺` | `0+log2≤2log2`; `−2log2≤0`; `log2=log2`, while `ρ_A` for `ρ_AB` gives `log2≤0` (false); Lean `partialTraceLeft` traces a | holds | none |
| 25 | Saddle-flow Check (1993–1994) | (1,1), (−1,−1), (1,−2) | orbits `{(u,1/u):u>0}`, `{(u,1/u):u<0}`, `{(u,−2/u):u>0}`; stated formula fails for (−1,−1) | fails | R03 |
| 26 | D1 convolution direction (759–767) | ℤ/3 shift on ℂ³ | `e_0·α_1(e_2)=e_0` vs `e_0·α_(−1)(e_2)=e_0e_1=0` | holds | none |
| 27 | D2 regular unitary (1384–1387) | ℤ/2 swap on ℂ² | `⟨ξ,ξ⟩=α_a(e_1)=e_2`; displayed map gives `η_2e_2`, wrong map `η_1e_1` | holds | none |
| 28 | `E_ij`, even projection (1855–1861) | ℓ²(ℤ) | `E_ijδ_n=[n=j]δ_i`; opposite shift gives `δ_(2i−j)↦δ_i`; `UpU*=1−p` | holds | none |
| 29 | D3 modular factor (2089–2093) | ax+b, H dilations | star law requires `Δ_G(h)/(Δ_H(h)γ(h))=γ(h)`, i.e. `γ²=Δ_G/Δ_H` | holds | none |
| 30 | D5 one-unit groupoid and transformation dictionary (2464–2479, 2673–2699) | group G; G⋉X | `(Δ^½f)*(Δ^½g)=Δ^½(f*g)`, star `Δ^(−½)conj(f(s⁻¹))`; I-norm `max(‖f‖₁,‖Δ⁻¹f‖₁)`; `D=Δ`; dictionary convolution: both `Δ(g)^½∫F(h)(gx)G(h⁻¹g)(h⁻¹gx)dh` | holds | none |
| 31 | D6 strong effectiveness (2851–2857) | ℤ on `ℤ⊔{+∞}` | `(n,+∞)=lim(n,k)`: effective; reduction to {+∞} is ℤ; 3 invariant opens vs ideals indexed by closed subsets of 𝕋 | holds | none |
| 32 | D7 KMS sign and Araki (3157–3197) | K=diag(0,1), `a=E_12`, `b=E_21`, `P=−K` | both sides `e^(−β)/(1+e^(−β))`; `Ω^Q=e^(−β(K+P)/2)/√Z_K`; `u_t=diag(1,e^(iβt))`, `Ad(u_t)∘τ_(−βt)=id` | holds | none |
| 33 | D8 CAR/Fermi (3286–3301, 3551–3555) | h=ℂ; `h₀=ε` | `‖P_a(f⊗g)‖²=‖f‖²‖g‖²/2`; `e^(−βε)(1−n)=n` gives `n=(1+e^(βε))⁻¹` | holds | none |
| 34 | D8 Fock Weyl (3426–3502) | h=ℂ, f=1, g=i | `W_F(1)W_F(i)=e^(−i/2)W_F(1+i)`; 4th moment `3/4`; c≈0.4677, 2nd moment ≈0.618 | holds | none |
| 35 | D9 Ising, on-site, d=1 (3744–3781) | J, h; λ=1 | `Mλ=|h|+2|J|e^λ`, `Mλ,2=|h|+8|J|e^λ`, bound `1/(2+16e)`; `s−βe=log2cosh(βh)`; d=1: `p=−β=s−βe` | holds | none |
| 36 | Busby–Smith Check (1128–1131) | projective u with multiplier σ | `ω(s,t)=σ(s,t)·1` central | fails | R02 |
| 37 | `O_n` ↔ concrete families (2927–2931, 2970) | *Needs:* graph | O_n → families → O_n | fails | R06 |
| 38 | Modular convention (213–215) | Mathlib `map_right_mul_eq_modularCharacterFun_smul` | `map(·*g)μ=c(g)•μ`, hence `∫f(xg)dμ=c(g)∫f`, `Δ=c⁻¹` | holds | none |

### Library declarations opened at the pins

- I indexed 427,714 declaration names from the pinned Mathlib and Tau Ceti and checked all 177 backticked names in the README. Every library name resolves. The only names absent from the pins are the roadmap's own (declared in `Suggested.lean`) and three mathematical strings.
- **Mathlib:**
  - `MeasureTheory/Group/ModularCharacter.lean`, lines 93 (`map_right_mul_eq_modularCharacterFun_smul`) and 130 (`modularCharacter`);
  - `Analysis/CStarAlgebra/Module/Defs.lean`, line 81 (the field `star_inner`);
  - `MeasureTheory/Measure/Haar/NormedSpace.lean`, line 79 (`AddMonoidHom.continuous_of_measurable`, additive only, as line 1188 says);
  - `Analysis/Fourier/FourierTransform.lean`, line 81 (integrand `e (-L v w) • f v`, the sign used at line 2222).
- **Tau Ceti:**
  - `CrossedProduct/Full.lean`, lines 266 (`FullCrossedProduct`) and 417 (`integratedFull`);
  - `Covariant/Regular.lean`, line 127;
  - `CrossedProduct/Functoriality.lean`, line 66;
  - `Action/Hom.lean`, line 293 (`subtypeHom`);
  - `Action/Covariant/Basic.lean`, line 33;
  - `Action/Basic.lean`, line 41;
  - `Representation/Nondegenerate.lean`, line 204;
  - `Matrix/Entropy.lean`, line 88;
  - `Matrix/Trace/Partial.lean`, line 153;
  - `GroupTheory/Amenable/Basic.lean`, line 130;
  - `RepresentationTheory/Continuous/Unitary/Basic.lean`, line 49;
  - `QuantumSpin/Interaction.lean`, line 70.
- **Duplication by object.** The pins have no reduced or twisted crossed product, no strong subadditivity, no Powers or Cuntz object and no Takai statement. Tau Ceti's `centralCocyclePseudofunctor` is a bicategorical object, unrelated to `CentralCocycle`.

### Cross-roadmap citations resolved on main (11b9f2ea)

- **VonNeumannAlgebras:** V1 (Layer 1, Kaplansky at line 477); V2's completed Hilbert tensor products at lines 626–632, before V2.RectangularL2 at line 634; V4.0.Fields at 1181; V4.0.Decomposition at 1279; V10.ModularTheory at 2364; V10.KMS at 2459; V11.UnitizationCharacters at 3185; V11.FourierUniqueness at 3203.
- **SelfAdjointSpectralTheory:** SA-B14 at 320, SA-B44 at 420, SA-B50 at 441, SA-B67 at 538, SA-B59 at 477, SA-B79 at 592, SA-B85 at 676 (named as D5's supplier at lines 132 and 255), SA-A21 at 225.
- **Others on main:**
  - BanachAlgebras A7.CharactersAndUniqueness at line 1739;
  - AmenableGroups Layer 5 at 289 and Layer 7 at 415;
  - LieGroupoidsPoisson G0.0 at line 261;
  - HilbertModules H3 at 262;
  - CStarAlgebras sections as listed in R04;
  - RepresentationTheory/CompactGroups, RepresentationTheory/SpinRepresentations and `Completed/OneParameterSemigroups` are present;
  - FreeProbability F3 (lines 56 and 78–80, naming D6 as owner of finite `O_n`).

### Ownership and overlaps

- I searched the open heads with `roadmaps grep` for Takai, the twisted group C*-algebra, `O_n`/Cuntz algebra, strong subadditivity, Powers, uniform Roe and the KMS simplex. The following are consumers only:
  - #866 OperatorKTheory (lines 48, 249, 1831–1839, 1943–1970);
  - #863 CStarClassification (line 166);
  - #1041 VonNeumannAlgebras (line 3762);
  - #1149 HeisenbergImprimitivity;
  - #1155 CompactQuantumMetricSpaces (lines 89 and 1440–1444);
  - #1143 NoncommutativeGeometry (lines 57 and 1611).

  I found no second owner. The vocabulary-closest roadmaps (#866, #1015, #1041, #1149, #1771) were checked the same way.
- The overlap data shows no dropped id, no id defined only by an open revision, and no id dropped by this pull request. The one item is the #1187 conflict (R07).

## Not verifiable

- **Uncertified in the manifest, cited by locator, not read:**
  - Bratteli–Robinson 2: §§5.2–5.3; Theorems 5.2.8, 5.3.30, 5.4.4, 6.2.4, 6.2.18, 6.2.40 and 6.2.42; Definition 6.2.16; Proposition 6.2.45. This includes the high-temperature bound at line 3735, whose constant I could not check.
  - Bratteli–Robinson 1: Lemma 4.1.19 through Theorem 4.1.25.
  - Cuntz §1.
  - Renault, LNM 793.
  - Brown–Ozawa, Proposition 5.1.3.
- **Rudin, *Fourier Analysis on Groups*, Theorems 1.5.1, 1.6.1 and 1.7.2 (lines 485 and 2184).** This is a paywalled book. It is not in the roadmap's `sources.toml` and is cited only to support statements consumed from VonNeumannAlgebras V11. Not read.
- **Read this round, in the cache:**
  - Williams Theorem D.11 (line 21995, p. 372), Theorem 7.13 (line 12297), Propositions 2.40, 3.1 and 3.19 and Theorem 4.24 (located at lines 3988, 5398, 6050 and 8504), E.16/E.17 and F.1;
  - de la Harpe Definition 9 (line 323, p. 7), Corollary 12 (line 367, p. 8), Theorem 14 (line 423, p. 10), Kesten (line 712, p. 16) and Dixmier (line 862, p. 19);
  - Muhly–Williams Theorems 5.5 and 7.8;
  - Sims–Williams Theorems 13 and 17;
  - Takeishi Theorem 5.4;
  - Sims §§4.1–4.3 and 5.1 headings.
- **Not re-read this round:** Araki, Attal, Nielsen–Petz, Arici–Mesland and Delfín–Farsi–Packer are cited at unchanged locators that earlier rounds read.

## Source issues

- none
