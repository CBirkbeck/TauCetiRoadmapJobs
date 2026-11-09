# Review of OperatorAlgebraDynamics (pull request #1137 at a08e7b2)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` (3797 lines) and `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean` (416 lines). The previous review read the same head; the folder is unchanged, and so is the description. The pins are Mathlib 1b1ccf4b0 and Tau Ceti 2fd255d99. Because nothing changed, this round re-reads the whole README rather than a diff. It found two Check defects that earlier rounds missed: R02 and R03 below.

## Repair status of the previous review (r25, same head)

- **r25 R01 (P2), `C*(L,c)` has two owners: not repaired.** HeisenbergImprimitivity is still at head a9eeb6e on #1149, and its lines 37–40 still say that no roadmap owns the twisted group C*-algebra. The description has no merge-order sentence for #1149. Carried forward as R01.
- **r25 R02 (P3), no merge order with #1187: not repaired.** #1187 is still at 66ed0d4 and still conflicts in this `Suggested.lean`, and the description's last line is unchanged. Carried forward as R04.
- **r25 R03 (P3), #1041 not named: not repaired.** `V11.FourierInversion` is still only at #1041's head 296b9d1 (line 3628). Main (34f48ff1) has `V11.DoubleDualEmbedding`, `V11.UnitizationCharacters` and `V11.FourierUniqueness`, and no `V11.FourierInversion`. Carried forward as R05.

## R01 (P2) — `C*(L,c)` of a discrete abelian group is still built by two open roadmaps

**Location.** README lines 75–81, which make this roadmap "the single owner of … the scalar twisted group C*-algebras `C*(G,ω)` and `C*_r(G,ω)`". Also lines 3600–3619: HeisenbergImprimitivity "takes from here, in its §1.1 and §3.1, … the scalar twisted group C*-algebras `C*(L,c)`".

**Claim.** This README says HeisenbergImprimitivity consumes the object. HeisenbergImprimitivity's open head says the opposite and builds the same object, so two open roadmaps own it.

**Witness.** In #1149 at head a9eeb6e, `HilbertModules/HeisenbergImprimitivity/README.md`:
- lines 30–33 claim the ℓ¹ algebra, the completions, the trace, the gauge action and full = reduced for `C*(L,c)`;
- lines 37–40 say "No roadmap on main owns the twisted group C*-algebra of a general 2-cocycle";
- line 167 says "Only untwisted actions are assumed of it";
- lines 441–460 build `ℓ¹(L,c)`, `C*(L,c)`, `λ_c`, the trace and the gauge action.

The test instance `L=(ℤ/2)²`, `c=(−1)^(ba′)` computes the same `M_2(ℂ)` with `τ=Tr/2` from this README's Check (lines 1611–1615) and from HeisenbergImprimitivity §3.1.

**Repair.** Keep the owner here. HeisenbergImprimitivity consumes this roadmap's D1–D2, so it comes later in the order, and this roadmap cannot cite it.
1. Add to the description's merge-order paragraph: "#1149 merges after this pull request and replaces its construction of `C*(L,c)` (its lines 30–40, 167 and §3.1) by a citation of D1.CentralTwists–D2.CentralTwists at `A=ℂ`, trivial action, scalar cocycle and counting measure."
2. Make the matching edit on #1149.

The README needs no edit.

## R02 (P3) — The D9 Check for `d=1` claims that every interaction norm is 0

**Location.** README lines 3543–3544: "`d=1`: every `A_Λ=ℂ`, the quasi-local algebra is ℂ, its unique state is KMS for every β, and every interaction norm is 0."

**Claim.** This is false. An interaction at `d=1` assigns a real 1×1 matrix to every finite region, and it need not be 0.

**Witness.** Tau Ceti's `TauCeti.QuantumSpin.Interaction` (`Analysis/CStarAlgebra/QuantumSpin/Interaction.lean` line 70) requires only `IsHermitian` and `Φ ∅ = 0`. Take `L=ℤ`, `|S|=1`, `Φ({x})=1` and `Φ(X)=0` otherwise. Then:
- `M_λ(Φ)=1` and `‖Φ‖_B=1`;
- `H_Φ(Λ)=|Λ|`, so `p(βΦ)=−β`.

**Repair.** Replace the last clause with: "every `Φ(X)` is a real scalar, so every commutator vanishes, the dynamics is trivial and the unique state is β-KMS for every β; the interaction norms need not vanish: `Φ({x})=1` has `M_λ(Φ)=1`, `p(βΦ)=−β`, mean energy 1 and mean entropy 0, so `s−βe_Φ=p`." This is checked on the instance above: `0−β·1=−β`.

## R03 (P3) — The D6 topology Check attributes the failure of étaleness to the wrong cause

**Location.** README lines 2849–2851: "the subspace topology makes the bisection `Z(U,1,0,V)` fail to be open in the groupoid when `shift` is not injective on U, so étaleness fails."

**Claim.** The stated condition does not discriminate.
- When `shift` is not injective on U, `Z(U,1,0,V)` is not a bisection at all.
- In the subspace topology, `Z(U,1,0,V)` fails to be open even when `shift` is injective on U.
- Non-openness of one set does not by itself refute étaleness. The witness that does is that the unit space is not open. The "finer" alternative is never addressed.

**Witness.** Take the full shift with n=2 and m≥1, and put `u=0^m10^∞` and `v=0^∞`.
- `shift^(m+1)u=0^∞=shift^m v`, so `(u,1,v)` is an arrow of the groupoid. It is not in `Z([0],1,0,X)`, because `shift(u)≠v`, although `shift` is injective on `[0]`. These arrows converge to `(0^∞,1,0^∞)∈Z([0],1,0,X)`.
- Likewise `(u,0,v)` is an arrow that is not a unit, and these arrows converge to the unit `(0^∞,0,0^∞)`.

**Repair.** Replace the bullet with: "The subspace topology of `X×ℤ×X` is not the Deaconu–Renault topology. For n=2 the arrows `(0^m10^∞,0,0^∞)` are not units and converge to the unit `(0^∞,0,0^∞)`, so the unit space is not open and the groupoid is not étale. Likewise `Z([0],1,0,X)` is not open, although `shift` is injective on `[0]`."

## R04 (P3) — The description states no merge order with #1187, which rewrites this `Suggested.lean`

Carried forward from r25 R02 and earlier rounds. No repair report marks it not actionable.

**Location.** The description's last line: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1097, #1771, #1015, #863".

**Witness.** This job's `scratch/overlaps.md` says: "#1137 and #1187 conflict in … `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean`". #1187 (head 66ed0d4, "bump TauCeti to ab00ba392") carries main's version of the file, while this branch replaces it with the 416-line file.

**Repair.** State the order in the description. Either:
- #1187 merges first, and this branch is rebased on it and re-elaborated at Tau Ceti ab00ba392 (in particular the `_root_.ContRepresentation.IsUnitary` binders at Lean lines 364 and 367); or
- this pull request merges first, and #1187 drops its OperatorAlgebraDynamics hunk.

## R05 (P3) — `V11.FourierInversion` exists only in the VonNeumannAlgebras revision #1041, which the description does not name

Carried forward from r25 R03.

**Location.** README lines 181, 185, 482, 499 and 2121. For example, line 480 introduces "Further cited suppliers on main", and line 482 then cites "(V11.FourierInversion: inversion, Plancherel and duality)".

**Witness.** Main has no `V11.FourierInversion`; #1041 at 296b9d1 has it at line 3628. `scratch/overlaps.md` reports "None" here, which is a miss by the tool.

**Repair.** Add #1041 to the description's line "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first". While editing that line, two corrections:
- the open index of 2026-11-09 has no #1097;
- it lists #1771, #1015 and #863 as new roadmaps, not revisions.

## Verified sound

### Gate, dependency check, elaboration, probe, signatures

- **Gate.** My run at a08e7b2 reports every check at 0 and `OK`, including `stray-files=0`, `outside-folder=0` and `depcheck=0`; the worker's run also has `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check.** `depcheck: 238 roadmaps, 2320 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. OperatorAlgebraDynamics is not in `ORDER.txt`, so it is placed after its last supplier (VonNeumannAlgebras is at line 5, CStarAlgebras at 7, HilbertModules at 8).
- **Elaboration.** `lake env lean` on `Suggested.lean`: 15 `declaration uses sorry` warnings, at lines 102, 115, 130, 202, 221, 236, 252, 273, 294, 305, 322, 338, 360, 384 and 407. Nothing else; 14 s.
- **One-tactic probe.** On a scratch copy, each `sorry` was replaced by `first | rfl | simp | infer_instance | trivial | decide | aesop`. All 15 theorems fail, at lines 109, 123, 140, 211, 226, 243, 263, 280, 297, 314, 331, 348, 375, 396 and 413. Nothing is padding.
- **Signatures.** I elaborated `#check @name` for all 18 declarations in one scratch file, with no errors, and compared each with its README statement. None has lost a binder, and nothing changed.
  - `exists_integratedOperator` and `exists_centralIntegratedOperator` carry `InnerRegularCompactLTTop` (README 686–689).
  - `injective_integratedFull_regular_of_amenable` puts H in the universe of A, which is enough because A has a faithful representation in its own universe.
  - `lcaWeyl_classification` carries `IsHaarMeasure`, `Regular`, both strong continuities and the `conj(χ(s))` covariance (2254–2260).
  - `exists_residue_family` carries the ℕ-indexed `HilbertBasis` (2862–2867).
  - `vonNeumannEntropy_strong_subadditivity` carries `PosSemidef` with no trace normalization (3461–3469).
- **Form.** `import Mathlib` plus eight `TauCeti.*` modules at the pin; no `set_option`, `lemma` or sorry'd data. `generatedCStarAlgebra` has a real body, and the two structures have no `sorry`.
- **Headlines.** Every headline in the Summary (lines 9–16) is either stated or named as not statable in the module docstring, with the missing carrier. I confirmed that the following are absent at the pins:
  - strong subadditivity, Pettis automatic continuity and a Choquet simplex: no hit in Mathlib or Tau Ceti;
  - a CAR C*-algebra: none in Tau Ceti;
  - a modular operator: Mathlib's `Analysis/InnerProductSpace/StandardSubspace.lean` has no Tomita conjugation.

### Seeded sample

- **Worked example: the saddle flow (lines 1933–1965).** All values recomputed; table row 19. The orbits are the branches `{(u,r/u)}` (closed), the four half-axes and the origin. The neighbourhood basis at a half-axis comes from the saturated open set `{x>0,|xy|<ε}`, and the one at the origin from `{|xy|<ε}`. I checked that the basis at a half-axis is cofinal: a ball of radius δ around `(1,0)` contains the branches with `r<δ` in both adjacent quadrants. The quotient is T₀, not T₁ and not Hausdorff. No locator is needed.
- **D5.Fields (lines 2447–2537).** All seven Checks recomputed; rows 20–21.
  - Williams Definition E.16 is at `williams-cpcsa-draft31` line 23770 and Theorem E.17 at line 23776. Theorem E.17 assumes a separable H, a second-countable LCH X and a finite Borel μ, the same hypotheses as D5.Fields. Both are on cache page 417, printed p. 405.
  - Definition F.1 is at line 23897, printed p. 409 (line 23900). Line 23893 says "separable (nonzero) complex Hilbert spaces", which matches the README's statement that Appendix F assumes nonzero fibres.
  - VonNeumannAlgebras V4.0.Fields on main (lines 1181–1200) sets the transported fibre to zero where `dμ/dλ=0`, which is what the zero-fibre Check uses.
- **Concrete Cuntz families (lines 2859–2898).** `S_j*b_m=Σ_k[m=nk+j]b_k=b_(m/n)` when `m≡j`, so `S_i*S_jb_k=δ_ij b_k` and `ΣS_jS_j*b_m=S_(m%n)b_(m/n)=b_m`. The n=1, n=2, shift-family, basis-change and finite-dimension Checks hold; row 16. Cuntz §1 is uncertified (see Not verifiable).

### Locators read this round

- **Williams** (`williams-cpcsa-draft31`; cache page = printed page + 12). Each was checked against the page marker following its line:

  | Locator | Line | Printed page |
  |---|---|---|
  | Proposition 2.40 | 3988 | 59 |
  | Lemma 2.73 | 5134 | 76 |
  | Proposition 3.1 | 5398 | 82 |
  | Proposition 3.19 | 6050 | 93 |
  | Theorem 4.22 | 8422 | 132 |
  | Theorem 4.24 | 8504 | 133 |
  | Definition 4.26 | 8646 | 135 |
  | Lemma 4.28 | 8678 | 136 |
  | Theorem 4.29 | 8788 | 137 |
  | Theorem 5.9 / Lemma 5.10 | 10032 / 10051 | 157 / 158 (the README gives no page) |
  | Theorem 7.13 | 12297 | 199 |
  | Theorem D.3 | 21913 | 370 |
  | Theorem D.11 | 21995 | 372 |
  | Theorem D.23 | 22193 | 376 |
  | Proposition D.28 | 22546 | 383 |
  | Lemma D.37 | 23101 | 391 |
  | Lemmas D.42 and D.43 | 23289, 23304 | 395 |
  | Proposition I.1 | 27398 | 479 |
  | Proposition I.21 | 28406 | 494 |

  Content checks:
  - Definition 4.26's relation `S_γR_s=γ(s)R_sS_γ` is equivalent to the README's `U_sV_χU_s*=conj(χ(s))V_χ`.
  - Example 4.27's Schrödinger pair is the Lean statement's pair.
  - Theorem 4.29 assumes only a locally compact abelian G, with arbitrary multiplicity.
- **de la Harpe** (`delaharpe2007`):
  - Definition 9 at line 323 (p. 7) matches the README's partition condition.
  - Corollary 12(i) is at line 367 (p. 8).
  - Theorem 14 is at line 423 (p. 10), with the `2/√N` estimate at lines 486–496 (pp. 10–11).
  - Kesten's `[−1,1−ε]` is at lines 712–725 (p. 16).
  - The Dixmier property is at line 856 (p. 19).
- **Arici–Mesland** (`arici-mesland2019`): §2.1 at line 71 (p. 2); Definition 2.1 at line 114 and extension (4) at line 122 (p. 3).
- **Nielsen–Petz** (`nielsen-petz2005`): (1) at line 28 (p. 1); (6) at line 86 (p. 2); Lemmas 1–2 at lines 123–124 (p. 3). The isometry `U(X)=(Xρ_A^(−1/2)⊗I)ρ_AB^(1/2)` at line 188 agrees with the README's `V(xρ_A^(1/2))=(x⊗1)ρ_AB^(1/2)`.
- **Attal** (`attal-fock`): (8.16) at line 656 and Proposition 8.21 at line 661 (p. 18); (8.18) at line 695 and Proposition 8.23 at line 700 (p. 19). `W_(tu)=e^(t(a*(u)−a(u)))` at `u=if/√2` is `exp(it(a+a*)(f)/√2)`.

### Library declarations opened at the pins

- **Mathlib:**
  - `CStarModule` (`Analysis/CStarAlgebra/Module/Defs.lean` line 73, `inner_op_smul_right` at line 79);
  - the self-module `inner x y := y * star x` (`Module/Constructions.lean` lines 79–80), which gives `⟨x,y⟩_B=x*y` on `Bᵐᵒᵖ`, as the D1.Modules Check says;
  - `AddMonoidHom.continuous_of_measurable` (`MeasureTheory/Measure/Haar/NormedSpace.lean` line 79: seminormed source and real normed target, as the README says);
  - `CharacterModule.exists_character_apply_ne_zero_of_ne_zero`, `div_mem_nhds_one_of_haar_pos`, `MonoidHom.isOpenMap_of_sigmaCompact`, `toPointwiseConvergenceCLM`, `isMulLeftInvariant_eq_smul_of_regular`, `Nat.divModEquiv`, `exists_hilbertBasis` and `Units.oneSub` (all present).
- **Tau Ceti:**
  - `TauCeti.CStarAction.convolution`, `∫ f r * α r (g (r⁻¹ * s))` (`Action/Convolution/Basic.lean` line 113);
  - `twistedInvolution`, `modularCharacter s • α s (star (f s⁻¹))` (`Action/Involution.lean` lines 44–72), matching README 669–672;
  - `TauCeti.QuantumSpin.Interaction` (line 70);
  - `TauCeti.Amenable.of_commGroup` (`GroupTheory/Amenable/Abelian.lean` line 47);
  - `Matrix.cfc_one_kronecker`, `TauCeti.circleEquivPontryaginDualInt`, `twistedMonoidAlgebra`, `equivOfCoboundary`, `integratedOperatorL1`, `isKMSState_perturbed_iff_eq_gibbsState`, `perturbationCocycle_add`, `vonNeumannAction`, `gnsCovariantRepresentation`, `eq_zero_of_apply_toPreGNS_one_eq_zero` and `gibbsExtension` (all present).

### Cross-roadmap citations resolved

- **On main (34f48ff1):**
  - CStarAlgebras C1.3, C1.4, C1.6, C1.7, C2.AnnHull, C5.4, C6.5, C7.1 and C8.4;
  - HilbertModules H2–H3;
  - BanachAlgebras A7 and A7.CharactersAndUniqueness;
  - LieGroupoidsPoisson G0;
  - AmenableGroups Layers 5 and 7;
  - SelfAdjointSpectralTheory SA-A21, B14, B44, B50, B59, B67, B79 and B85;
  - VonNeumannAlgebras V4.0.Fields (1181), V4.0.Decomposition (1279), V10.ModularTheory, V10.KMS, V11.UnitizationCharacters and V11.FourierUniqueness;
  - Completed/OneParameterSemigroups, RepresentationTheory/CompactGroups and SpinRepresentations.
- **At the open heads:**
  - #1041 296b9d1 (V11.FourierInversion, line 3628);
  - #1149 a9eeb6e (above);
  - #1015 4e793e8: NoncompactQuantumSymmetry lines 19 and 355–366 consume D1.BorelPrefix's `U(H)_s` and Pettis's theorem, and its `Suggested.lean` lines 17–20 do not restate them;
  - #866 1377338: K7.5 cites D1.CentralTwists–D2.CentralTwists at lines 50, 175, 236 and 1830–1843;
  - #1155 7db4c19: it reaches the twisted algebra through HeisenbergImprimitivity §3.1 and K7.5 (lines 109, 1454 and 1509), as README lines 3620–3629 say.
- **Ownership by object.** I searched the open index for strong subadditivity, Takai, Pettis and automatic continuity, the Powers property, Cuntz families and the uniform Roe algebra. Only #1137 owns them, except Pettis's theorem, which NoncompactQuantumSymmetry consumes from here.

### Adversarial table

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | `exists_integratedOperator` (Lean 102) | ℤ with `f=δ_0⊗a+δ_1⊗b`; `f(n)=2^(−|n|)a`; μ=0 | `T=π(a)+π(b)U`, `‖T‖≤‖a‖+‖b‖`; `‖f‖₁=(1+2·1)‖a‖=3‖a‖`; T=0 with bound 0 | holds | none |
| 2 | `exists_covariantRepresentation_integratedFull` (Lean 115) | G trivial, `A=ℂ²`, `L(x,y)=x` on ℂ; `L=0` on ℂ | `π=L`, `U=1`, π nondegenerate; `L=0` is excluded by `hL` | holds | none |
| 3 | `fullCrossedProductMap_exact` (Lean 130) | G trivial, `I=ℂ⊕0⊂ℂ²`, q the second projection; `I=A`, `B=0` | `ker q=I=range(incl)`; q onto 0, `ker=A=range(id)` | holds | none |
| 4 | `CentralCocycle.cocycle` (Lean 161) | ℤ/2, A=ℂ, α trivial, `ω(a,a)=−1`, `r=s=t=a` | the field reads `ω(a,a)ω(a,e)x=ω(a,a)ω(e,a)x`, i.e. `−x=−x` | holds | none |
| 5 | Cochain direction (1019–1028) | ℤ/2, `b(a)=i` | `ω^b(a,a)=i·i·(−1)·1=1`; `(iδ_a)*_ω(iδ_a)=(−1)(−1)δ_e=δ_e=T_b(δ_aδ_a)` | holds | none |
| 6 | `exists_centralIntegratedOperator` (Lean 202) | ℤ/2, `ω(a,a)=−1`, H=ℂ, π=id, `U_a=i`; `f=xδ_e+yδ_a` | `U_a²=−1=ω(a,a)`; `T=x+iy`, `|x+iy|≤|x|+|y|` | holds | none |
| 7 | `continuous_of_measurable_monoidHom` (Lean 221) | `id:ℝ→ℝ`; a Hamel ℚ-linear map | continuous; discontinuous, hence not Borel | holds; measurability needed | none |
| 8 | `injective_integratedFull_regular_of_amenable` (Lean 236) | ℤ; F₂ with `h=Σδ_(a^±,b^±)` | `‖λ(f)‖=sup|f̂|`; trivial character gives 4, `‖λ(h)‖=2√3≈3.46<4` | holds; amenability needed | none |
| 9 | `transitive_commutant_scalar` (Lean 252) | `I={p,q}` with the swap and `value=(1,0)`; G trivial (not transitive); constant `value` | `T=diag(d,d)`; `diag(1,2)` commutes, so transitivity is needed; the swap matrix commutes with everything, so separation is needed | holds | none |
| 10 | `exists_powers_partition` (Lean 273) | `F={b}`, L=2, `w=ab²`; `f=b^k`, `|k|<L`; ℤ with `F={1}`, N=3 | `wbw⁻¹=aba⁻¹`; `ab^ka⁻¹`; `b^jD` has exactly j leading b's; for ℤ, D has density ≥½, so three disjoint translates are impossible | holds; rank ≥2 needed | none |
| 11 | `reducedFreeGroup_isSimpleRing` (Lean 294) | rank 1; full `C*(F₂)` | `C(𝕋)` has the ideal `{f(1)=0}`; `u−1∈ker(triv)` with `λ(u)δ_1−δ_1≠0` | holds; reduced and rank ≥2 needed | none |
| 12 | `reducedFreeGroup_trace_unique` (Lean 305) | `x=λ(g)`; rank 1 | `⟨δ_1,δ_g⟩=[g=1]`; on `C(𝕋)`, `ev_z(λ(g))=z^g≠[g=1]` | holds | none |
| 13 | `exists_fullGroupCStarAlgebra_equiv_zeroAtInfty_dual` (Lean 322) | ℤ/2; ℤ | `δ_a↦(1,−1)`, `‖δ_e+δ_a‖=2`; `δ_1↦z` | holds | none |
| 14 | `exists_fullGroupCStarAlgebra_dual_equiv_zeroAtInfty` (Lean 338) | G=ℤ | f on 𝕋 ↦ `n↦∫f(z)zⁿdz`; `ev(s⁻¹)` would give `z^(−n)` | holds | none |
| 15 | `lcaWeyl_classification` (Lean 360) | ℤ/3 with U the shift and `V=diag(1,ω,ω²)`; E=0; `L²⊕L²` | `U_1VU_1*ξ(t)=ω^(t−1)ξ(t)`, i.e. `ω⁻¹V=conj(χ(1))V`; `VU_1V*=ωU_1`; ι=∅; `|ι|=2` | holds | none |
| 16 | `exists_residue_family` (Lean 384) | n=1; n=2 at `b_3`; shift family; basis change W | `S_0=Id`; `S_0*b_3=0`, `S_1*b_3=b_1`, `S_1b_1=b_3`; `S_1*S_0=S_1*≠0`; `WS_jW*b'_k=b'_(nk+j)` | holds | none |
| 17 | `vonNeumannEntropy_strong_subadditivity` (Lean 407) | GHZ; `2·GHZ`; `|0⟩⟨0|⊗Φ⁺` | `0+log2≤2log2`; `−2log2+0≤0+0`; `log2=log2`, and `ρ_A` instead would give `log2≤0`, which is false | holds | none |
| 18 | `generatedCStarAlgebra` (Lean 286) | `T=λ` on `ℓ²(ℤ)`; T empty | `C(𝕋)`; `ℂ1`, the closure of `adjoin ∅` | as stated | none |
| 19 | Saddle flow (1933–1965) | `xy=r>0`; `(x,0)`; ball at `(1,0)`; `{|xy|<ε}`; `+x` and `+y` | branch closed; half-axis closure adds origin; ball ⊇ branches `r<δ` in Q1 and Q4; contains origin and all 4 half-axes; Q1 branches with `r<ε` meet both | T₀, not T₁, not T₂ | none |
| 20 | D5.Fields zero fibres (2522–2529) | `[0,1]`, `S=[0,½]`, `N={0}` on S | section `1_Se_0` is Borel; the direct integral is `≅L²(S)`; `T_φ=T_ψ` iff `φ=ψ` a.e. on S | holds | none |
| 21 | D5.Fields varying dimension (2507–2512); non-measurable S (2513–2517) | `N={0}` for `x<½`, `{0,1}` for `x≥½`; a non-measurable S | `E_10e_0=e_1∉H(x)`; `E_01e_0=0`, `E_01e_1=e_0`; `1_Se_0` is not measurable and the dimension function `1_S` is not measurable | holds | none |
| 22 | D9 Check `d=1` (3543–3544) | `Φ({x})=1` on ℤ, `|S|=1` | `M_λ(Φ)=1`, `‖Φ‖_B=1`, `p=−β`, `s−βe=0−β` | **false** | R02 |
| 23 | D6 topology Check (2849–2851) | n=2, `u=0^m10^∞`, `v=0^∞` | `shift^(m+1)u=shift^m v`, so `(u,1,v)∈G∖Z([0],1,0,X)` and converges into Z; `(u,0,v)` converges to a unit | Check misattributes the cause | R03 |
| 24 | HeisenbergImprimitivity dictionary (3607–3619) | `(x,−x,x)`; `(ℤ/2)²`, `c=(−1)^(ba′)` | `conj(ω(x,−x))=conj(c(−x,x))`; `u²=v²=1`, `uv=−vu`, `M_2`, `τ=Tr/2` on both sides | same object as HI §3.1 | R01 |
| 25 | D9 Ising and on-site model (3511–3522) | `Φ({x})=hσ_3`, `Φ({x,x+1})=Jσ_3⊗σ_3` | `M_λ=|h|+2|J|e^λ`, `M_(λ,2)=|h|+8|J|e^λ`, `(½)/(1+8e)`; `Z=2cosh βh`, `e=−h tanh βh`, `s−βe=log(2cosh βh)` | holds | none |
| 26 | D7 Gibbs sign and perturbed vector (3083–3123) | `K=diag(0,1)`, `a=E_12`, `b=E_21`, `P=−K` | `τ_(iβ)(b)=e^(−β)b`, both sides `e^(−β)/(1+e^(−β))`; `Ω^Q=e^(−β(K+P)/2)/√Z_K`; `u_t=diag(1,e^(iβt))`; `Ad(u_t)τ_(−βt)=id` | holds | none |
| 27 | D7 strip transfer (2977–2982, 3074–3079) | `z↦−βz+iβ`; `w↦i−w/β` | `0≤Im z≤1` maps onto `[0,β]`; boundary values `ω(τ_(−βt)(x)y)` and `ω(yτ_(−βt)(x))`; `F(i−s/β)=φ(yσ'_(−s/β)x)=ω^Q(yτ̄^P_s x)` | holds | none |
| 28 | D8 CAR, KMS sign, Fock sign (3309–3340) | `a=E_12`; Jordan–Wigner; `h₀=ε`; h=ℂ | `a*a+aa*=1`; `E_12σ_3+σ_3E_12=0`; `ω(E_22)=(1+e^(βε))⁻¹`; derivative `i(v+w̄)/√2·e^(w̄v)` | holds | none |
| 29 | D8 Weyl relations and core argument (3226–3231) | Schrödinger pair; `η⊥(Φ±i)D_F` | `W(se_1)W(te_2)=e^(−ist)W(te_2)W(se_1)`; `[x,−id/dx]=i`; `u′=±u` with u bounded gives u=0 | holds | none |
| 30 | D8 Bogoliubov relations (3196–3198) | `{γa(f),γa(g)*}` | `⟨Uf,Ug⟩+⟨Vg,Vf⟩=⟨f,(U*U+V*V)g⟩` | holds | none |
| 31 | D4.Harmonic conventions (2169–2216) | ℤ/3 inversion; finite dual measure; ℝ | `(1/3)Σχ(1−x)=[x=1]`; `μ̂=(1/n)`·counting; `fourierIntegral` at `χ_(−2πw)` | holds | none |
| 32 | D3 modular factor (2048–2052) | substitution `s=th` | `⟨f,g⟩*(h)=Δ_H(h)⁻¹γ_H(h)⁻¹Δ_G(h)∫…`, which equals `⟨g,f⟩(h)` iff `γ_H²=Δ_G/Δ_H` | holds | none |
| 33 | D5 group and transformation groupoid (2422–2437, 2600–2631) | one-unit groupoid; `G⋉X` | `(Δ^½f)*(Δ^½g)=Δ^½(f*g)`; star `Δ^(−½)conj(f(s⁻¹))`; the integrand equals `Δ(s)^½F(r)(y)K(r⁻¹s)(r⁻¹y)` | holds | none |
| 34 | D1.Modules Checks (859–897) | `B=M_2`, `E_11`, `E_12`; the induced form | Gram matrix `δ_ikδ_jl=ww*`, the flip has eigenvalue −1; `Σ⟨x_jξ_i,x_iξ_j⟩=−2` | holds | none |
| 35 | D6 strong effectiveness (2782–2788) | ℤ on `ℤ⊔{+∞}` | `(n,+∞)=lim(n,k)`, so `int(Iso)=G⁰`; invariant opens ∅, ℤ, all; `C₊⋊ℤ` has more than 3 ideals | holds | none |
| 36 | D2.CentralTwists trace (1611–1615) | `(ℤ/2)²`, `(−1)^(ba′)` | `u²=(−1)^0=1`, `v²=1`, `uv=u_(1,1)`, `vu=−u_(1,1)` | holds | none |

## Not verifiable

These texts are uncertified in the manifest and are cited by locator only; I did not read them:
- Brown–Ozawa Proposition 5.1.3 (D2.BoundedSequenceTranslation);
- Cuntz 1977 §1 (D6);
- Bratteli–Robinson volumes 1–2 (D7–D9: §§5.2–5.3, Theorems 5.3.30, 5.4.4, 6.2.4, 6.2.18, 6.2.40 and 6.2.42, Definition 6.2.16, Proposition 6.2.45, Volume 1 §4.1);
- Renault, LNM 793;
- Rudin, Theorems 1.5.1, 1.6.1 and 1.7.2 and §2.6.

The claims resting on them that this review sampled were checked by computation (rows 16, 25–30). The constant `(λ/2)/(1+e^λ d³/(d−1))` attributed to Bratteli–Robinson Proposition 6.2.45 could not be checked against the text.

These cached texts were outside this round's sample and are cited by unchanged text; earlier rounds verified their locators: Araki 1973, Takeishi, Sims–Williams, Muhly–Williams, Sims (2017) and Delfín–Farsi–Packer.

## Source issues

- **Misprint** in williams-cpcsa-draft31 at the paragraph before Lemma 4.28, p. 136 (lines 8657–8677): the source defines `s·φ(γ)` as `γ(s)φ(γ)` and derives (4.62) from it; it should be `conj(γ(s))φ(γ)`, since `γ(r⁻¹s)=conj(γ(r))γ(s)`; affects the proof.
