# Review of OperatorAlgebraDynamics (pull request #1137 at 4133234)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` (4004 lines) and `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean` (417 lines) at the merge commit 4133234, which merges main (32a0bcc9) into the previous head a08e7b2 and adopts main's D5 and D8 text. The pins are unchanged (Mathlib 1b1ccf4b0, Tau Ceti 2fd255d99). Every passage was read; the change set (498 lines) was read against the whole.

## Repair status of the previous review (r26 at a08e7b2)

- **r26 R01 (P2), `C*(L,c)` built by two open roadmaps: repaired.** This README now owns `C*(G,ω)` for every locally compact Hausdorff group (lines 76–89 and the new paragraph at lines 1055–1087) and lists HilbertModules' child as a consumer (lines 3787–3818). HeisenbergImprimitivity's head has moved to 5333cb0c on #1149, whose `TauCetiRoadmap/HilbertModules/HeisenbergImprimitivity/README.md` lines 54–56 say "D1.CentralTwists and D2.CentralTwists own the scalar twisted group C*-algebras" and lines 501–503 say `C*(L,c)`, `C*_r(L,c)` and `ℓ¹(L,c)` "are OperatorAlgebraDynamics' … consumed". One owner remains. The description's merge-order line was not changed, but the two-owner defect is gone.
- **r26 R02 (P3), the `d=1` Check claims every interaction norm is 0: not repaired.** Lines 3736–3737 still read "every interaction norm is 0". Carried as R03.
- **r26 R03 (P3), the D6 topology Check misattributes the failure of étaleness: not repaired.** Lines 2904–2906 are unchanged. Carried as R04.
- **r26 R04 (P3), no merge order with #1187: not repaired.** The description's last line is unchanged and this job's `scratch/overlaps.md` still reports that #1137 and #1187 conflict in `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean`. Carried as R05.
- **r26 R05 (P3), `V11.FourierInversion` exists only in #1041: not repaired.** Main's `TauCetiRoadmap/VonNeumannAlgebras/README.md` (3f7196b) has no section of that name (its line 251 reads "then inversion, Plancherel and duality" after V11.FourierUniqueness); #1041 at its new head 9c3f8328 has it at line 3718. The description still does not name #1041. Carried as R06.

## R01 (P2) — FreeProbability and this roadmap supply each other

**Location.** README line 3547 (D8 *Needs:*): "FreeProbability F3 (the full Fock space and completed Hilbert tensor powers)"; also lines 3242–3243, 3389–3390 and the D8 Dependencies at line 3565.

**Claim.** D8 consumes FreeProbability F3 as a supplier. FreeProbability on main consumes this roadmap as a supplier, so the two roadmaps cite each other.

**Witness.** `TauCetiRoadmap/FreeProbability/README.md` on main (3f7196b), lines 77–80: "OperatorAlgebraDynamics D1–D2 supplies full/reduced group C*-algebras; F3 proves their free-group-product comparison … Dynamics D6 owns finite universal O_n"; line 305 uses `C*(F₂)` and `C*_r(F₂)` and proves the quotient not injective. This README's line 3845 records that consumption. The dependency check does not see FreeProbability's citation because it is not on a *Needs:* line. The text is inherited from main's D8 (main README line 703), so it is not this pull request's addition, but the folder under review carries it.

**Repair.** Take the completed Hilbert tensor products from a supplier already earlier in the order: VonNeumannAlgebras V2 constructs "completed Hilbert tensor products by completing native normed `TensorProduct ℂ H K`" with `mapL`, `commIsometry` and `assocIsometry` extended to the completions (main `TauCetiRoadmap/VonNeumannAlgebras/README.md` lines 625–632, the target preceding V2.RectangularL2). In lines 3241–3243 and 3387–3390 build `Λⁿ(h)` and `Symⁿ(h)` as closed subspaces of V2's `h^(⊗̂n)` and the Fock spaces as their Hilbert sums here; replace "FreeProbability F3" by "VonNeumannAlgebras V2 (completed Hilbert tensor products)" at lines 3547 and 3565. Keep line 2002 ("FreeProbability F3 is a comparison, not an input") and the Downstream consumers bullet at line 3845. Tested on the instance that shows the cycle: after the change, FreeProbability cites D1–D2 and D6 and nothing here cites FreeProbability.

## R02 (P3) — The merge commit deletes six files of other roadmaps

**Location.** Outside the folder: `TauCetiRoadmap/FiniteGroupExtensionSplitting/PROGRESS.md` and `STATUS.md`, `TauCetiRoadmap/LieGroupoidsPoisson/PROGRESS.md` and `STATUS.md`, `TauCetiRoadmap/PrimitivePrimeDivisors/PROGRESS.md` and `STATUS.md`.

**Claim.** The head removes files that main carries, and the gate fails on them.

**Witness.** 4133234 has parents a08e7b2 and 32a0bcc9. All six files exist at 32a0bcc9 and at origin/main and are absent at 4133234; `git diff --stat origin/main...HEAD` outside the folder shows exactly these six deletions (159 lines). My gate run: `outside-folder=6 … FAIL`, every other check 0.

**Repair.** Restore the six files from origin/main in a new commit (or redo the merge so that the only differences from main are inside `TauCetiRoadmap/OperatorAlgebraDynamics/`). No acceptance while the gate fails.

## R03 (P3) — The D9 Check for `d=1` claims that every interaction norm is 0

Carried from r26 R02. **Location.** README lines 3736–3737. **Claim.** False: an interaction at `d=1` assigns a real scalar to every finite region and need not vanish. **Witness.** `TauCeti.QuantumSpin.Interaction` (`Analysis/CStarAlgebra/QuantumSpin/Interaction.lean` line 70) requires only `IsHermitian` and `Φ ∅ = 0`. On `L=ℤ`, `|S|=1`, `Φ({x})=1`, `Φ(X)=0` otherwise: `M_λ(Φ)=1`, `‖Φ‖_B=1`, `H_Φ(Λ)=|Λ|`, `p(βΦ)=−β`. **Repair.** Replace the last clause by: "every `Φ(X)` is a real scalar, so every commutator vanishes, the dynamics is trivial and the unique state is β-KMS for every β; the interaction norms need not vanish: `Φ({x})=1` has `M_λ(Φ)=1`, `p(βΦ)=−β`, mean energy 1 and mean entropy 0, so `s−βe_Φ=p`." Checked: `0−β·1=−β`.

## R04 (P3) — The D6 topology Check attributes the failure of étaleness to the wrong cause

Carried from r26 R03. **Location.** README lines 2904–2906. **Claim.** When `shift` is not injective on U, `Z(U,1,0,V)` is not a bisection at all; in the subspace topology `Z(U,1,0,V)` fails to be open even when `shift` is injective on U; and non-openness of one set does not refute étaleness. **Witness.** n=2, `u=0^m10^∞`, `v=0^∞`: `shift^(m+1)u=0^∞=shift^m v`, so `(u,1,v)` is an arrow not in `Z([0],1,0,X)` although `shift` is injective on `[0]`, and these arrows converge to `(0^∞,1,0^∞)∈Z([0],1,0,X)`; likewise the non-unit arrows `(u,0,v)` converge to the unit `(0^∞,0,0^∞)`, so the unit space is not open. **Repair.** Replace the bullet with: "The subspace topology of `X×ℤ×X` is not the Deaconu–Renault topology. For n=2 the arrows `(0^m10^∞,0,0^∞)` are not units and converge to the unit `(0^∞,0,0^∞)`, so the unit space is not open and the groupoid is not étale. Likewise `Z([0],1,0,X)` is not open, although `shift` is injective on `[0]`."

## R05 (P3) — The description states no merge order with #1187, which rewrites this `Suggested.lean`

Carried from r26 R04. **Location.** The description's last line names #1097, #1771, #1015 and #863. **Witness.** `scratch/overlaps.md`: "#1137 and #1187 conflict in … `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean`". **Repair.** State which merges first: either #1187 first, with this branch rebased and re-elaborated at Tau Ceti ab00ba392, or this pull request first, with #1187 dropping its OperatorAlgebraDynamics hunk.

## R06 (P3) — `V11.FourierInversion` exists only in the VonNeumannAlgebras revision #1041, which the description does not name

Carried from r26 R05. **Location.** README lines 169, 173, 473, 490 and 2149; line 471 introduces them as "Further cited suppliers on main". **Witness.** Main's VonNeumannAlgebras README has `V11.UnitizationCharacters` (line 3185) and `V11.FourierUniqueness` (line 3203) and no `V11.FourierInversion`; #1041 at 9c3f8328 has it at line 3718. **Repair.** Add #1041 to the description's line of revisions that merge first (and drop #1097, which the open index of 2026-11-09 does not list; #1771, #1015 and #863 are new roadmaps, not revisions).

## R07 (P3) — D8 proves the vacuum cyclicity of `π_F` while assigning it to QuantumFoundations

**Location.** README lines 3394–3395 ("the span of the exponential vectors is dense in `F_s(h)`") against lines 3435–3438 ("the vacuum cyclicity and irreducibility of π_F are not targets here: QuantumFoundations §6.4 constructs and proves them") and line 161.

**Claim.** The two statements are the same theorem. `W_F(f)Ω=exp(−‖f‖²/4)e(if/√2)` (line 3412) and every `e(g)` is `e(if/√2)` at `f=−i√2 g`, so the closed span of `π_F(W(h))Ω` is the closed span of the exponential vectors: totality of the exponential vectors is exactly cyclicity of Ω for `π_F`. D8 needs it (line 3407–3408 uses totality for strong continuity), and QuantumFoundations at #1771 (824bab8b, `TauCetiRoadmap/QuantumFoundations/README.md` line 744) also "Prove[s] bosonic vacuum cyclicity".

**Witness.** Instance `h=ℂ`: `π_F(W(f))Ω` ranges over the multiples of `e(if/√2)`, `f∈ℂ`, which is every `e(g)`, `g∈ℂ`.

**Repair.** Own it here: after line 3395 add "that is, Ω is cyclic for the Fock Weyl operators"; at lines 3435–3438 and line 161 replace "the vacuum cyclicity and irreducibility of π_F" by "the irreducibility of π_F", and list vacuum cyclicity among what D8 supplies in the Downstream consumers bullet (line 3847–3851). QuantumFoundations §6.4 then cites it, which is that roadmap's edit.

## R08 (P3) — Three gap slugs label sections that exist on main

**Location.** README lines 464–465 (`gap:topological-groupoid-vocabulary`), 496 (`gap:measurable-hilbert-fields`), 513 (`gap:diagonal-reduction`) and their uses at lines 2412, 2467, 2576, 2594, 2707–2713.

**Claim.** A declared gap asks a supplier for what it does not yet state. These three label sections that already state the content: LieGroupoidsPoisson §G0.0 (main README lines 261–270, which name "OperatorAlgebraDynamics D5" as the consumer), VonNeumannAlgebras V4.0.Fields (line 1181) and V4.0.Decomposition (lines 1279 and 1305, naming D5 as consumer). The same sentences also say "supplies, as a roadmap on main cited by section", so each is at once a gap and a section citation. No `design/plan.json` declares any slug, so the intake cannot read them as gaps either.

**Witness.** Line 496: "VonNeumannAlgebras V4.0.Fields supplies (gap:measurable-hilbert-fields), as a roadmap on main cited by section".

**Repair.** Delete the three slug tags and cite the sections as the sentences already do (the D5 *Needs:* line 2467 then reads "LieGroupoidsPoisson G0.0 (the total-arrow and composable-arrow topologies)", and lines 2707–2713 "VonNeumannAlgebras V4.0.Fields" and "V4.0.Decomposition"). The six older slugs are unchanged by this head and were not re-examined.

## Verified sound

### Gate, dependency check, elaboration, probe, signatures

- **Gate.** My run at 4133234: every check 0 except `outside-folder=6`, `FAIL` (R02). The worker's run adds `build=0`.
- **Dependency check.** `depcheck: 237 roadmaps, 2309 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. OperatorAlgebraDynamics is not in `ORDER.txt`, so it is placed after its last supplier; its suppliers in the order are VonNeumannAlgebras (5), CStarAlgebras (7), HilbertModules (8) and LieGroupoidsPoisson (152).
- **Elaboration.** `lake env lean` on `Suggested.lean`: 15 `declaration uses sorry` warnings (lines 103, 116, 131, 203, 222, 237, 253, 274, 295, 306, 323, 339, 361, 385, 408), nothing else, 14 s.
- **One-tactic probe.** On a scratch copy with each `sorry` replaced by `first | rfl | simp | infer_instance | trivial | decide | aesop`, all 15 theorems fail (errors at lines 110, 124, 141, 212, 227, 244, 264, 281, 298, 315, 332, 349, 376, 397, 414). Nothing is padding.
- **Signatures.** `#check @name` for all 18 declarations in one scratch file elaborates with no error; each type was compared with its README statement and none lost a binder: `exists_integratedOperator` and `exists_centralIntegratedOperator` carry `InnerRegularCompactLTTop` (README 676–681, 965–966); `injective_integratedFull_regular_of_amenable` carries `Amenable`, `IsHaarMeasure`, `Regular`; `lcaWeyl_classification` carries both strong continuities and the `conj(χ(s))` covariance (2282–2290); `exists_residue_family` the ℕ-indexed `HilbertBasis` (2914–2934); `vonNeumannEntropy_strong_subadditivity` `PosSemidef` without trace normalization (3654–3662).
- **Form.** `import Mathlib` plus eight `TauCeti.*` modules present at the pin; no `set_option`, `lemma`, sorry'd data or `#eval`; `generatedCStarAlgebra` has a real body; the two structures have no `sorry`. The module docstring names every non-statable headline with its missing carrier, now including `C*(G,ω)` (no twisted crossed product at the pin).
- **Headlines.** The Summary's headlines (lines 3–17) are each stated or named as not statable; `C*(G,ω)` and its universal property are not statable (no twisted crossed product; `twistedMonoidAlgebra` is algebraic). Every backticked name of the roadmap's own in the README is declared in the Lean file (gate `readme-ids-missing=0`).

### Seeded sample

- **Worked example: the saddle flow (lines 1961–1993).** Recomputed, table rows 20–21: `xy` is invariant; for `xy=r>0` the orbit is the closed branch `{(u,r/u):u>0}`; `(x,0)`, `x>0`, has orbit the open half-axis with closure adding the origin. `{x>0,|xy|<ε}` is saturated and open, contains the `+x` point and the Q1 and Q4 branches with `r<ε`, not the origin and not the `+y` point. A ball around `(1,0)` contains `(1,±δ)`, so every saturated open neighbourhood of the `+x` point contains the Q1 and Q4 branches with small r: the basis is cofinal. At the origin `{|xy|<ε}` contains all four half-axis points. Hence T₀, not T₁, not Hausdorff. No locator needed.
- **D5.Fields (lines 2475–2565).** All seven Checks recomputed (rows 22–24). `williams-cpcsa-draft31` line 23770 (Definition E.16) and line 23776 (Theorem E.17), printed p. 405, assume separable H, second-countable X and finite μ, as D5.Fields does; Definition F.1 at line 23897 (p. 409) and the nonzero-fibre standing assumption at line 23893. V4.0.Fields on main (lines 1181–1257) is the measurable-field supplier and V4.0.Decomposition (line 1279) names D5 as consumer at line 1305.
- **Concrete Cuntz families (lines 2914–2953).** `S_j* b_m = b_(m/n)` when `m≡j (mod n)` and 0 otherwise, since `⟨b_m,S_jb_k⟩=[m=nk+j]`; `S_i*S_jb_k=δ_ij b_k`; `Σ_jS_jS_j*b_m=S_(m mod n)b_(m div n)=b_m`. Row 18. Cuntz §1 is uncertified (see Not verifiable).

### Locators read this round

- **Attal** (`attal-fock`; cache page = printed page): Definition 8.3 line 225 (p. 7); Definition 8.4 line 268 (p. 8), with `ε(u)=Σu^(⊗n)/n!` and `⟨ε(u),ε(v)⟩=e^⟨u,v⟩`, which is the n!-weighted sector norm the README states at line 3397; Proposition 8.5 line 279 (density and linear independence, p. 8); Corollary 8.6 line 317 (pp. 8–9), whose proof at line 322 gives the continuity of `u↦ε(u)` that line 3394 uses; Definitions 8.11–8.12 lines 435, 456 (p. 12); Proposition 8.13 line 475 (p. 13); Definition 8.19 line 639 (p. 17); Definition 8.20 with (8.16)–(8.17) line 654 (p. 18); Proposition 8.21 line 661 (p. 18); (8.18) line 695 (p. 19); Proposition 8.23 line 699 (p. 19). `W_u` at `u=if/√2` is the README's `W_F(f)` (row 11).
- **Williams**: Corollary 4.23 at line 8472, printed p. 133 (the `N⋊v` homomorphism, newly cited at line 3889–3890); Theorem 4.22 and Theorem 4.24 as in r26.
- **Mathlib at the pin**: `Measure.ext_of_charFun` (`MeasureTheory/Measure/CharacteristicFunction/Basic.lean` line 257) and `charFun_gaussianReal` (`Probability/Distributions/Gaussian/Real.lean` line 481, `exp(tμi − vt²/2)`), both newly cited at lines 3422–3423; the variance `v=‖f‖²/2` gives `exp(−t²‖f‖²/4)` (row 13).
- **Tau Ceti at the pin**: `TauCeti.QuantumSpin.Interaction` (line 70, for R03); `TauCeti.CStarAction.convolution`, `twistedInvolution`, `Amenable.of_commGroup` as in r26.

### Cross-roadmap citations resolved

- **On main (3f7196b):** VonNeumannAlgebras V1, V4.0.Fields (1181), V4.0.Decomposition (1279, 1305), V10.ModularTheory, V10.KMS, V11.UnitizationCharacters (3185), V11.FourierUniqueness (3203), V2's completed Hilbert tensor products (625–632); LieGroupoidsPoisson §G0.0 (261–270); SelfAdjointSpectralTheory SA-B79 (592), SA-B85 (676, naming D5 at 747); HilbertModules H2–H3 with the child HeisenbergImprimitivity named at line 119 as consuming H1–H3 ("independent of that example"); FreeProbability F3 (255, 328: the full Fock space; 77–80: its consumption of D1–D2 and D6, R01); CStarAlgebras, BanachAlgebras A7, AmenableGroups, OneParameterSemigroups, SpinRepresentations, CompactGroups present.
- **At the open heads:** #1149 5333cb0c (HeisenbergImprimitivity consumes D1.CentralTwists and D2.CentralTwists at lines 54–56, 191–197, 501–503, 529); #1771 824bab8b (QuantumFoundations §6.3 line 724–732 and §6.4 line 740–748 consume D8's carriers, build `Γ`, `dΓ`, `N`, `D_fin`, `a(f)`, `a†(f)`, the CCR, the Segal adapter and norm-continuity, and state "D8 constructs no bosonic creation or annihilation operators", matching README line 161; the vacuum-cyclicity overlap is R07); #1041 9c3f8328 (V11.FourierInversion at line 3718, R06).
- **Ownership by object.** `C*(G,ω)` for locally compact G: #1149 consumes it; OperatorKTheory and CompactQuantumMetricSpaces are not on main and were checked in r26 at #866 and #1155 as consumers. Fock Weyl representation, exponential vectors, CAR Fock operators: QuantumFoundations consumes (above). Strong subadditivity, Takai, Pettis, Powers property, Cuntz families, uniform Roe algebra: no other owner in the open index (r26 search, unchanged vocabulary).

### Adversarial table

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | `exists_integratedOperator` (Lean 103) | ℤ, `f=δ_0⊗a+δ_1⊗b`; `f(n)=2^(−|n|)a`; μ=0 | `T=π(a)+π(b)U`, `‖T‖≤‖a‖+‖b‖`; `‖f‖₁=3‖a‖`; T=0, bound 0 | holds | none |
| 2 | `exists_covariantRepresentation_integratedFull` (116) | G trivial, `A=ℂ²`, `L(x,y)=x`; `L=0` on ℂ | `π=L`, `U=1`, nondegenerate; `L=0` excluded by `hL` | holds | none |
| 3 | `fullCrossedProductMap_exact` (131) | G trivial, `I=ℂ⊕0⊂ℂ²`; `I=A` | `ker q=I=range incl`; quotient 0, first map onto | holds | none |
| 4 | `CentralCocycle` law (162) and `C*(G,ω)` paragraph (1055–1087) | ℤ/2, `ω(a,a)=−1`, `r=s=t=a`; `U_s*` | `−x=−x`; `U_sU_(s⁻¹)=ω(s,s⁻¹)`, so `U_s*=conj(ω(s,s⁻¹))U_(s⁻¹)`, and `ω(s,s⁻¹)=ω(s⁻¹,s)` from the identity at `(s,s⁻¹,s)` | holds; line 1071 agrees | none |
| 5 | Scalar star `c(s)conj(ω(s,s⁻¹))conj(f(s⁻¹))` (1065) | substitution `s↦s⁻¹` in `(∫fU)*=∫conj f(s)conj(ω(s,s⁻¹))U_(s⁻¹)` | `dμ(s⁻¹)=c(s)dμ(s)`, factor `conj(ω(s⁻¹,s))=conj(ω(s,s⁻¹))` | holds | none |
| 6 | Cochain direction `T_b:C*(G,ω^b)≅C*(G,ω)` (1072–1073) | U an ω-rep, `U'=bU` | `U'_sU'_t=b(s)b(t)ω(s,t)conj(b(st))U'_(st)=ω^b(s,t)U'_(st)`, so `f↦bf` carries ω^b to ω | holds | none |
| 7 | `λ^ω_s` projective law (1080, 1218–1220) | `(s,t,u=t⁻¹s⁻¹x)` | `ω(s,s⁻¹x)ω(t,t⁻¹s⁻¹x)=ω(s,t)ω(st,(st)⁻¹x)` by the cocycle identity | holds | none |
| 8 | `exists_centralIntegratedOperator` (203) | ℤ/2, H=ℂ, `U_a=i`; `f=xδ_e+yδ_a` | `U_a²=−1=ω(a,a)`; `T=x+iy`, `|x+iy|≤|x|+|y|` | holds | none |
| 9 | `continuous_of_measurable_monoidHom` (222) | `id:ℝ→ℝ`; Hamel ℚ-linear map | continuous; discontinuous hence not Borel | holds | none |
| 10 | `injective_integratedFull_regular_of_amenable` (237) | ℤ; F₂ with `h=Σδ_(a^±,b^±)` | `‖λ(f)‖=sup|f̂|`; trivial character 4, `‖λ(h)‖=2√3≈3.46<4` | holds; amenability needed | none |
| 11 | Fock Weyl `W_F(f)e(g)` (3400) vs Attal `W_u` | `u=if/√2` | `‖u‖²/2=‖f‖²/4`; `−⟨u,g⟩=i⟨f,g⟩/√2`; `Im⟨u,v⟩=Im⟨f,g⟩/2`, so `W_F(f)W_F(g)=exp(−iIm⟨f,g⟩/2)W_F(f+g)` | holds | none |
| 12 | `W_F(f)` isometric on exponential vectors (3401–3402) | `⟨W_F(f)e(g),W_F(f)e(h)⟩` | exponent `−‖f‖²/2−i⟨g,f⟩/√2+i⟨f,h⟩/√2+⟨g,h⟩+i⟨g,f⟩/√2−i⟨f,h⟩/√2+‖f‖²/2=⟨g,h⟩` | holds | none |
| 13 | Vacuum variance and `Ω∈D(Φ(f)²)` (3416–3423, 3450–3460) | `exp(−t²‖f‖²/4)`; `|ξ|²=c/(1+λ⁵)` | `−d²/dt²` at 0 is `‖f‖²/2`; Gaussian variance `‖f‖²/2`; fourth moment `3/4` at `‖f‖=1` equals `24/32`; `c=1/(2∫_0^∞dx/(1+x⁵))=1/2.138=0.468`, second moment `c·2·(π/5)/sin(3π/5)=0.618`, fourth moment diverges | holds | none |
| 14 | Exponential vectors total = vacuum cyclicity (3394, 3435) | h=ℂ | `π_F(W(f))Ω=e^(−|f|²/4)e(if/√2)`, every `e(g)` reached at `f=−i√2g` | same theorem in two owners | R07 |
| 15 | CAR Fock `a†(f)=√(n+1)P_a(f⊗·)` and the Check without the factor (3244, 3270–3272) | `g⊥f`, `ψ=g` | `‖P_a(f⊗g)‖²=‖f‖²‖g‖²/2`; `b(f)b†(f)g=‖f‖²g/2`, `b†(f)b(f)g=0`; with `√2` the sum is `‖f‖²g` | holds | none |
| 16 | Vacuum two-point functions (3266–3269) | `a(g)*Ω=g`, `a(f)g=⟨f,g⟩Ω` | `ω₀(a(f)a(g)*)=⟨f,g⟩`, `ω₀(a(f)*a(g))=0`; `S=1` gives `⟨g,f⟩` by `ω_S(a(f)*a(g))=⟨g,Sf⟩` (3324) | holds | none |
| 17 | Bogoliubov relations and Checks (3300–3319) | real adjoint of `T=U+V`; U=0, V=conj; U=1, V=conj; `cosθ,sinθ` | `T*T=U*U+V*V+(U*V+V*U)`; `{a(f̄)*,a(ḡ)}=g f̄=⟨f,g⟩`; `U*U+V*V=2`, `(a+a*)²=1` so `{b,b}=2`; `(ca+sa*)²=cs·1` | holds | none |
| 18 | `exists_residue_family` (385) | n=1; n=2 at `b_3`; shift family | `S_0=Id`; `S_0*b_3=0`, `S_1*b_3=b_1`, `S_1b_1=b_3`; `S_1*S_0=S_1*≠0` | holds | none |
| 19 | `λ(f)δ_v=exp(−iσ(f,v)/2)δ_(f+v)` (3359–3366) | product; star; `f≠0` | exponents `σ(g,v)+σ(f,g+v)` vs `σ(f,g)+σ(f+g,v)` equal; `⟨δ_w,λ(f)δ_v⟩=⟨λ(−f)δ_w,δ_v⟩` using `σ(f,f)=0`; `σ(f,v+nf)=σ(f,v)` | holds | none |
| 20 | Saddle flow orbits (1980–1982) | `xy=r>0`; `(x,0)` | branch closed; half-axis closure adds origin | holds | none |
| 21 | Saddle flow separation (1983–1993) | `{x>0,|xy|<ε}`; `{|xy|<ε}`; ball at `(1,0)` | T₀; not T₁; `+x`,`+y` neighbourhoods share Q1 branches `r<ε` | holds | none |
| 22 | D5.Fields varying dimension (2535–2540) | `N={0}` for `x<½`, `{0,1}` else | `E_10e_0=e_1∉H(x)`; `E_01e_0=0`, `E_01e_1=e_0` | holds | none |
| 23 | D5.Fields zero fibres (2550–2557) | `S=[0,½]` | direct integral `≅L²(S)`; `T_φ=T_ψ` iff `φ=ψ` a.e. on S | holds | none |
| 24 | D5.Fields non-measurable S, equal restrictions (2541–2549) | `1_S e_0`; `1` vs `E_00` | not measurable; equal on `span e_0` | holds | none |
| 25 | D5 new Checks (2608–2630) | empty G⁰; one-unit groupoid; pair groupoid; `T=I`, `λ=2μ` | H=0; `ρ_L(λ)=λI`, `h∘r∉C_c(G)` noncompact; `ρ_L(h)=M_h` since `(m(h)f)(x,y)=h(x)f(x,y)`; densities ½ | holds | none |
| 26 | `lcaWeyl_classification` (361) | ℤ/3, U shift, `V=diag(1,ω,ω²)` | `U_1VU_1*ξ(t)=ω^(t−1)ξ(t)=ω⁻¹Vξ(t)=conj(χ(1))V`; `VU_1V*=ωU_1` | holds | none |
| 27 | `vonNeumannEntropy_strong_subadditivity` (408) | GHZ; `2·GHZ`; `|0⟩⟨0|⊗Φ⁺` | `0+log2≤2log2`; `−2log2≤0`; `log2=log2`, with `ρ_A` instead `log2≤0` false | holds | none |
| 28 | D9 `d=1` Check (3736) | `Φ({x})=1` | `M_λ=1`, `p=−β` | false | R03 |
| 29 | D6 topology Check (2904) | n=2, `u=0^m10^∞`, `v=0^∞` | `(u,1,v)∉Z([0],1,0,X)` converges into it; `(u,0,v)` non-units converge to a unit | wrong cause | R04 |
| 30 | D2.CentralTwists trace on generators (1583) | `τ(u_su_t)`, `τ(u_tu_s)` | `[t=s⁻¹]ω(s,s⁻¹)` and `[t=s⁻¹]ω(s⁻¹,s)`, equal | holds | none |
| 31 | KMS sign of the Fermi occupation (3513–3517) | `h₀=ε`, `a=E_12` | `τ_t(a)=e^(−itε)a=Ad exp(itK)` for `K=diag(0,ε)`; `ω(E_22)=1/(e^(βε)+1)` | holds | none |
| 32 | `exists_powers_partition`, `reducedFreeGroup_isSimpleRing`, `reducedFreeGroup_trace_unique` (274–315) | `F={b}`, L=2, `w=ab²`; ℤ at N=3; rank 1 | `wbw⁻¹=aba⁻¹`; D has density ≥½, three disjoint translates impossible; `C(𝕋)` has the ideal `{f(1)=0}` and the evaluation traces | hold; rank ≥2 needed | none |
| 33 | Fourier theorems (323, 339) | ℤ/2; ℤ | `δ_a↦(1,−1)`, `‖δ_e+δ_a‖=2`; `δ_1↦z`, `ev(n)(z)=zⁿ` | hold | none |

## Not verifiable

Uncertified in the manifest, cited by locator only, not read: Bratteli–Robinson 2 (§5.2, Theorem 5.2.8, §5.2.1, §§5.2.4–5.2.5, §5.3, Theorems 5.3.30, 5.4.4, 6.2.4, 6.2.18, 6.2.40, 6.2.42, Definition 6.2.16, Proposition 6.2.45) and Volume 1 §4.1; Cuntz 1977 §1; Brown–Ozawa Proposition 5.1.3; Renault LNM 793; Rudin, Theorems 1.5.1, 1.6.1, 1.7.2 and §2.6. The claims resting on them that this review sampled were checked by computation (rows 11–19, 28, 31). Theorem 5.2.8's attribution (existence, uniqueness, simplicity and `‖W(f)−1‖=2` for nondegenerate σ) could not be checked against the text. Araki 1973, Takeishi, Sims–Williams, Muhly–Williams, Sims 2017 and Delfín–Farsi–Packer are cached, cited by text unchanged at this head, and were verified in earlier rounds.

## Source issues

- none
