# Review of OperatorAlgebraDynamics (pull request #1137 at a08e7b2)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` (3797 lines) and `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean` (416 lines, unchanged since 8daff1a) at a08e7b2. The folder changed by 157 README lines since the head the previous review read; the pull-request description did not change. The pins are Mathlib 1b1ccf4b0 and Tau Ceti 2fd255d99.

## Repair status of the previous review (r24, at 8daff1a)

- **R01 (P2), `C*(L,c)` has two owners: partly repaired.** The README's Downstream-consumers entry for HeisenbergImprimitivity (lines 3594–3619) now says that roadmap "takes from here, in its §1.1 and §3.1, the Schrödinger family … and the scalar twisted group C*-algebras `C*(L,c)`", and it checks the two roadmaps' conventions against each other (lines 3607–3615; the check is correct, table row 23). But the settlement the repair asked for, the merge-order sentence in the description and the matching edit on #1149, was not made: HeisenbergImprimitivity's head is still a9eeb6e and still builds the object. Carried forward as R01.
- **R02 (P3), no merge order with #1187: not repaired.** The description's last line is unchanged. Carried forward as R02.
- **R03 (P3), #1041 not named in the description: not repaired.** Same line. Carried forward as R03.
- **R04 (P3), D8 locators: repaired.** Lines 3180–3183, 3186–3187, 3194, 3198, 3206–3207, 3212–3213, 3223–3224, 3258–3270, 3274, 3280–3281 and 3290 now carry Bratteli–Robinson 2 §5.2, §5.2.4, §5.2.5 and §5.3 and Attal locators; the sentence about "the source's omitted zero-representation exception" is replaced by the zero-Hilbert-space argument (line 3194) with its Check (lines 3341–3345); Attal is cited in D8 and in References (lines 3753–3760). Every Attal locator was verified against the cache (below).
- **R05 (P3), Williams Definition F.1 cited for zero fibres: repaired.** Lines 516–520, 2467–2472 and 3680–3683 now cite VonNeumannAlgebras V4.0.Fields for the general notion and Williams F.1 for nonzero fibres, with the new zero-fibre Check at lines 2522–2529 (table row 21).
- **R06 (P3), two D2 targets under the D2.FreeGroups heading: repaired.** Lines 1746 and 1836 are `###` subsections.

## R01 (P2) — `C*(L,c)` of a discrete abelian group is still built by two open roadmaps

**Location.** README lines 75–81 ("This roadmap is the single owner of … the scalar twisted group C*-algebras `C*(G,ω)` and `C*_r(G,ω)` …") and lines 3600–3619 ("It takes from here, in its §1.1 and §3.1, … the scalar twisted group C*-algebras `C*(L,c)` …").

**Claim.** The README now states consistently that HeisenbergImprimitivity consumes the object. HeisenbergImprimitivity's open head says the opposite and plans the same object, in the same conventions, so two open roadmaps own it. Nothing in this pull request records the order in which the two are to be reconciled.

**Witness.** HeisenbergImprimitivity at #1149, head a9eeb6e, `HilbertModules/HeisenbergImprimitivity/README.md`:
- lines 31–33 own "the twisted group C*-algebra `C*(L,c)` … universal and regular completions, canonical trace, gauge action, full = reduced theorem";
- lines 38–40: "No roadmap on main owns the twisted group C*-algebra of a general 2-cocycle: OperatorAlgebraDynamics D1–D2 construct crossed products for an action, with no 2-cocycle twist";
- line 167: "Only untwisted actions are assumed of it";
- §3.1 (lines 441–484) constructs `ℓ¹(L,c)`, `C*(L,c)`, `λ_c`, the trace, the gauge action, full=reduced by twisted Fell absorption and the coboundary isomorphism.

Test instance: `L=(ℤ/2)²`, `c=(−1)^(ba′)`. This README's Check (lines 1611–1615) gives `uv=−vu`, `M_2(ℂ)`, `τ=Tr/2`; HeisenbergImprimitivity's Check (its lines 490–491) computes the same algebra from its own §3.1.

**Repair.** Keep the owner here (HeisenbergImprimitivity is a new roadmap not yet in the merge order, placed after its last supplier, which includes this roadmap, so its citing D1.CentralTwists–D2.CentralTwists is downward). Add to the description's merge-order paragraph: "#1149 merges after this pull request and replaces its construction of `C*(L,c)` (its lines 31–40 and 167 and §3.1) by a citation of D1.CentralTwists–D2.CentralTwists at `A=ℂ`, trivial action, scalar cocycle and counting measure, and its §1.1 Schrödinger family by a citation of D1.CentralTwists." The matching edit on #1149's branch is part of the settlement; until it is made, README lines 3600–3606 describe a consumption that the other head disclaims. The README itself needs no further edit.

## R02 (P3) — The description states no merge order with #1187, which rewrites this `Suggested.lean`

Carried forward unrepaired from r24 R02 (and r23 R01, r22 R06, r21 R01, r20 R03, r17 R08). No repair report marks it not actionable.

**Location.** The description's last line, unchanged: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1097, #1771, #1015, #863".

**Witness.** `scratch/overlaps.md` of this job: "#1137 and #1187 conflict in … `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean`". #1187 (head 66ed0d4, "bump TauCeti to ab00ba392") carries main's short file with sub-imports; this branch replaces it with the 416-line file.

**Repair.** State the order in the description: either #1187 merges first and this branch is rebased on it, re-elaborating the `_root_.ContRepresentation.IsUnitary` binders at Lean lines 364 and 367 at Tau Ceti ab00ba392, or this pull request merges first and #1187 drops its OperatorAlgebraDynamics hunk.

## R03 (P3) — `V11.FourierInversion` exists only in the VonNeumannAlgebras revision #1041, which the description does not name

Carried forward unrepaired from r24 R03 (r23 R02).

**Location.** README lines 181, 185, 482–483, 499 and 2120–2121, for example line 482: "VonNeumannAlgebras V11 supplies, cited by section (V11.FourierInversion: inversion, Plancherel and duality)".

**Witness.** On main (91ba40ae), `TauCetiRoadmap/VonNeumannAlgebras/README.md` has `V11.UnitizationCharacters` (line 3185) and `V11.FourierUniqueness` (line 3203) and no `V11.FourierInversion`. At #1041's head 296b9d1, `V11.FourierInversion` is at line 3629 and `V11.UnitizationCharacters` at line 3608; I re-read both, and they supply what lines 482–503 consume (inversion with `conj(γ(x))` and the dual measure normalized by it, Plancherel with `Fλ(f)F*=M_f̂`, `‖λ(f)‖=sup|f̂|`, the homeomorphism onto the dual, Pontryagin duality, rescaling).

**Repair.** Add #1041 to the description's line "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first". While editing it: the open index of 2026-11-09 has no #1097, and it lists #1771, #1015 and #863 as new roadmaps, not revisions.

## Verified sound

### Gate, dependency check, elaboration, probe, signatures

- **Gate.** The worker's run at a08e7b2 reports every check at 0 and `OK`, including `build=0`, `stray-files=0`, `outside-folder=0`. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check.** My run: `depcheck: 238 roadmaps, 2320 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line. OperatorAlgebraDynamics and HeisenbergImprimitivity are both absent from the merge order, so each is placed after its last supplier.
- **Elaboration.** `lake env lean` on `Suggested.lean`: 15 `declaration uses sorry` warnings at lines 102, 115, 130, 202, 221, 236, 252, 273, 294, 305, 322, 338, 360, 384, 407, nothing else, exit 0 (5.4 s).
- **One-tactic probe.** On a scratch copy with each `sorry` replaced by `first | rfl | simp | infer_instance | trivial | decide | aesop`, all 15 theorems fail (one error each, at lines 109, 123, 140, 211, 226, 243, 263, 280, 297, 314, 331, 348, 375, 396, 413). Nothing is padding.
- **Signatures.** The file is byte-identical to the head the previous review elaborated with `#check @name` for all 18 declarations; `scratch/signatures.md` of this job lists the same elaborated types, none with a dropped section binder. I compared each with its README statement: `exists_residue_family` carries the ℕ-indexed `HilbertBasis` of lines 2863–2867; `continuous_of_measurable_monoidHom` carries Polish source and separable metrizable target (lines 1136–1139); `lcaWeyl_classification` carries `IsHaarMeasure`, `Regular`, both strong continuities and the `conj(χ(s))` covariance (lines 2254–2260); `vonNeumannEntropy_strong_subadditivity` carries `PosSemidef` without trace normalization (lines 3461–3469).
- **Form.** `import Mathlib` plus eight `TauCeti.*` modules at the pin; no `set_option`, no `lemma`, no sorry'd data.
- **Headlines absent or forced.** None found. `C₀(G)⋊G≅K(L²G)` (D3) is not statable: Tau Ceti's `TauCeti.CStarAction.ofMulAction` (`Analysis/CStarAlgebra/Action/ContinuousMap.lean` line 45) acts only on `C(X,ℂ)` for compact X, and Mathlib's `compactOperator` (`Analysis/Normed/Operator/Compact/Basic.lean` line 256) is a submodule with no C*-algebra structure.

### Seeded sample

- **Worked example: the saddle flow (lines 1933–1965).** Orbits, closures, both neighbourhood bases, T₀, non-T₁, non-Hausdorff and the quadrant topology recomputed (table row 20). No locator is needed; only `Real.exp`, quotient topologies and `IsOpenMap` are used.
- **D5.Fields (lines 2447–2537).** All seven Checks recomputed (rows 21–22). Williams Definition E.16 (`williams-cpcsa-draft31` line 23770) and Theorem E.17 (line 23776: separable H, second-countable LCH X, finite Borel μ) are on cache page 417, printed p. 405; Definition F.1 is at line 23897, printed p. 409, and line 23893 reads "separable (nonzero) complex Hilbert spaces", which is what the repaired text says. VonNeumannAlgebras V4.0.Fields on main (lines 1198–1200) puts "the transported fibre equal to zero where dμ/dλ=0", as the Check at lines 2522–2529 uses.
- **Concrete Cuntz families (lines 2859–2898).** Isometry, adjoint, `S_i*S_j=δ_ij`, `ΣS_jS_j*=1`, the n=1, n=2, shift-family, basis-change and finite-dimension Checks recomputed (row 16). Cuntz §1 is uncertified (Not verifiable).

The README flags as cited by locator only Brown–Ozawa 5.1.3 (line 1771), Bratteli–Robinson 2 Theorem 5.4.4 (line 3070), Rudin (line 3713) and Cuntz §1 (line 3775); all four are uncertified in the manifest.

### Locators read this round

- **Attal** (`attal-fock`): Definition 8.3 and the dimension `2ⁿ` at lines 225–260 (p. 7); Definition 8.4, `⟨ε(u),ε(v)⟩=e^⟨u,v⟩` and Proposition 8.5 at lines 268–281 (p. 8); Definitions 8.11–8.12 and the CAR on the finite-particle space at lines 435–474 (pp. 12–13); Proposition 8.13 with `b*(u)b(u)b*(u)b(u)=‖u‖²b*(u)b(u)` and `‖b(u)‖=‖u‖` at lines 475–490 (p. 13); Definition 8.20 with (8.16) at lines 654–656, (8.17) at 658, Proposition 8.21 at 661 (p. 18); (8.18) at line 695, strong continuity at 697–698 and Proposition 8.23 `W_(tu)=exp(it·(1/i)(a*(u)−a(u)))` at 699–700 (p. 19). Every claim the README attaches to them is supported (rows 24–26).
- **Williams**: E.16, E.17, F.1 as above; the statement on printed p. 409 that Appendix F takes nonzero fibres (line 23893).
- **VonNeumannAlgebras** main 91ba40ae: V4.0.Fields (1181), V4.0.Decomposition (1279, which names D5 at 1305), V11.UnitizationCharacters (3185), V11.FourierUniqueness (3203); #1041 head 296b9d1: V11.FourierInversion (3629), V11.UnitizationCharacters (3608).
- **HeisenbergImprimitivity** #1149 a9eeb6e: Conventions line 102 (`f*(x)=conj(c(−x,x))conj(f(−x))`), line 105 (`δ_xδ_y=c(x,y)δ_(x+y)`), §1.1 at 203, §3.1 at 441–484 (`λ_c` at 452, coboundary isomorphism `δ_x↦u(x)δ_x` from the `c·δu` algebra to the c algebra at 479–484), Checks at 488–495.

### Library declarations opened at the pins

- Mathlib `MeasureTheory.Measure.modularCharacter` (`MeasureTheory/Group/ModularCharacter.lean` lines 45–48, 130): `haarScalarFactor (map (·*g) haar) haar`, so `∫f(xg)dμ=c(g)∫f dμ`, the convention of README lines 243–246, with `Δ=c⁻¹`.
- Mathlib `compactOperator` (submodule, no algebra), `lp`, `lp.single`, `HilbertBasis`, `PontryaginDual`, `Matrix.partialTraceLeft/Right`.
- Tau Ceti `TauCeti.CStarAction.ofMulAction` and `rotation` (`Action/ContinuousMap.lean` lines 45, 72); the eight imported modules.

### Cross-roadmap citations resolved

On main (91ba40ae): VonNeumannAlgebras V1, V4.0.Fields, V4.0.Decomposition, V10.ModularTheory, V10.KMS, V11.UnitizationCharacters; the other suppliers (CStarAlgebras C1.3–C8.4, BanachAlgebras A7, AmenableGroups Layers 5 and 7, HilbertModules H2–H3, SelfAdjointSpectralTheory SA-A21/B14/B44/B50/B59/B67/B79/B85, LieGroupoidsPoisson G0, CompactGroups, SpinRepresentations, OneParameterSemigroups) are unchanged since the previous review resolved them and were not re-opened. At the open heads: #1041 (above), #1149 (above), #1015 (4e793e8), #866 (1377338), #863 (db5a0c5), #1155 (7db4c19), #1771 (824bab8) unchanged since the previous review.

### Adversarial table

| # | Statement (README / Lean) | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | `exists_integratedOperator` (Lean 102; 679–692) | ℤ, `f=δ_0⊗a+δ_1⊗b`; `f(n)=2^(−|n|)a` | `T=π(a)+π(b)U`, `‖T‖≤‖a‖+‖b‖`; `‖f‖₁=3‖a‖`, no finite truncation equals T | holds | none |
| 2 | `exists_covariantRepresentation_integratedFull` (Lean 115) | G trivial, `A=ℂ²`, `L(x,y)=x`; `L=0` on `H=ℂ` | `π=L`, `U=1`, nondegenerate; `L=0` is integrated only from `π=0`, degenerate, excluded by `hL` | holds | none |
| 3 | `fullCrossedProductMap_exact` (Lean 130) | G trivial; `I=ℂ⊕0⊂ℂ²`; `I=A` | `0→I→A→A/I→0`; kernel of second projection = first summand; quotient 0, first map onto | holds | none |
| 4 | `CentralCocycle.cocycle` (Lean 161; 923) | ℤ/2, `ω(a,a)=−1` at `(a,a,a)` | `ω(a,a)ω(a,e)=−1=ω(a,a)ω(e,a)` | holds | none |
| 5 | Cochain direction (1022–1028, 1082–1084) | ℤ/2, `b(a)=i` | `ω^b(a,a)=i·i·(−1)=1`; `(iδ_a)*_ω(iδ_a)=(−1)(−1)δ_e=δ_e`, so `T_b` is multiplicative ω^b→ω | holds | none |
| 6 | `E_ω` (1153–1180) | ℤ/2, `ω(a,a)=−1` | `(1,a)²=(−1,e)`, order 4; `ψ_b(1,a)=(i,a)`, `(i,a)²=(i·i·(−1),e)=(1,e)` | holds | none |
| 7 | `continuous_of_measurable_monoidHom` (Lean 221) | `id:ℝ→ℝ`; Hamel ℚ-linear map | continuous; discontinuous hence not Borel by the theorem | holds | none |
| 8 | `injective_integratedFull_regular_of_amenable` (Lean 236; 1347–1359) | ℤ; F₂ with `h=Σδ_(a^±1,b^±1)` | `‖λ(f)‖=sup|f̂|`; `4∈σ(h)` via the trivial character, `‖λ(h)‖=2√3<4` (Kesten) | holds, amenability needed | none |
| 9 | `transitive_commutant_scalar` (Lean 252) | `I={p,q}`, swap, `value=(1,0)`; I a point, `F=∅` | `(1−0)T_pq=0`, swap gives `d_p=d_q`; on ℂ every T is scalar, `hsep` vacuous | holds | none |
| 10 | `exists_powers_partition` (Lean 273; 1636–1649) | `F={b}`, L=2, `w=ab²`; `f=b⁻¹ab`, L=3; ℤ, `F={1}`, N=3 | `wbw⁻¹=aba⁻¹`; `b³(b⁻¹ab)b⁻³=b²ab⁻²`, conjugate `ab²ab⁻²a⁻¹` starts with a, ends with a⁻¹; ℤ: D has density ≥½, three disjoint translates need ≤⅓ | holds, rank ≥2 needed | none |
| 11 | `reducedFreeGroup_isSimpleRing` (Lean 294) | rank 1; full `C*(F₂)` | `C(𝕋)` has `{f(1)=0}`; `u−1∈ker(triv)`, `λ(u)δ_1−δ_1=δ_u−δ_1≠0` | holds | none |
| 12 | `reducedFreeGroup_trace_unique` (Lean 305) | `x=λ(g)`; rank 1 | `⟨δ_1,δ_g⟩=[g=1]`; `C(𝕋)` has the evaluation traces | holds | none |
| 13 | `exists_fullGroupCStarAlgebra_equiv_zeroAtInfty_dual` (Lean 322; 2169–2172) | ℤ/2; ℤ/3 inversion | `δ_a↦(1,−1)`, `‖δ_e+δ_a‖=2`; `(1/3)Σ_χχ(1)conj(χ(x))=[x=1]`, with `χ(x)` instead `[x=−1]` | holds | none |
| 14 | `exists_fullGroupCStarAlgebra_dual_equiv_zeroAtInfty` (Lean 338; 2211–2216) | G=ℤ | `ev(n)(z)=zⁿ`, unitary at z ↦ `n↦zⁿ`; `s↦ev(s⁻¹)` would give `n↦z^(−n)` | holds | none |
| 15 | `lcaWeyl_classification` (Lean 360; 2290–2295) | ℤ/3, U shift, `V=diag(1,ω,ω²)`; E=0 | `(U_1VU_1*ξ)(t)=ω^(t−1)ξ(t)=ω⁻¹(Vξ)(t)=conj(χ(1))V`; `VU_1V*=ωU_1`; `ι=∅` | holds | none |
| 16 | `exists_residue_family` (Lean 384; 2883–2894) | n=1; n=2, `b_3`; shift family; basis change W | `S_0=Id`; `S_0*b_3=0`, `S_1*b_3=b_1`, `S_1b_1=b_3`; `S_i*S_jb_k=[(nk+j)%n=i]b_k=δ_ij b_k`; `S_1*S_0b_1=b_0≠0`; `WS_jW*b'_k=b'_(nk+j)` | holds | none |
| 17 | `vonNeumannEntropy_strong_subadditivity` (Lean 407; 3529–3539) | GHZ; `2·GHZ`; `|0⟩⟨0|⊗Φ⁺` | `0+log2≤2log2`; `S(2σ)=2S(σ)−2Trσ·log2` gives `−2log2≤0`; `log2=log2`, with `ρ_A` instead `log2≤0` false | holds | none |
| 18 | D2.BoundedSequenceTranslation (1762–1820) | band T; `E_ij`; `p=M_(1_(2ℤ))` | `Σ_kM_(f_k)U^kδ_j=Σ_k⟨δ_(j+k),Tδ_j⟩δ_(j+k)=Tδ_j`; `E_ijδ_n=[n=j]δ_i`; `UpU*δ_n=[n−1 even]δ_n=(1−p)δ_n`, `χ(p)=½∉{0,1}` | holds | none |
| 19 | D2.SequenceToeplitz corner (1879–1889, 1901–1904) | `e=M_(1_[0,∞))` | `eUeδ_n=δ_(n+1)`, `eU^(−k)e=S*^k`; `eM_fe=M_(f|ℕ)`, `f|ℕ∈c(ℕ)=ℂ1+c₀`, in T; `E_00=eM_(δ_0)∈BeB`, `q(e)=1`, so e is full | holds | none |
| 20 | Saddle flow (1933–1965) | `xy=r>0`; `(x,0)`; `{x>0,|xy|<ε}`; `{|xy|<ε}`; ±x; +x,+y | branch `{(u,r/u)}` closed; +x ray, closure adds origin; saturated open, contains +x, no origin, no `r≥ε`; contains origin and all four rays; `{x>0}`/`{x<0}` separate; Q1 branches `0<r<ε` in both, not Hausdorff; `xy` open on Q1 | T₀, not T₁, not T₂ | none |
| 21 | D5.Fields zero fibres (2522–2529) | `X=[0,1]`, `S=[0,½]`, `N={0}` on S, ∅ off S | section `1_Se_0` Borel; direct integral `{ge_0: g=0 a.e. off S}≅L²(S)`; `T_φ=T_ψ` iff `φ=ψ` a.e. on S; density `1_S` of `μ=1_Sλ`; excluded by Williams line 23893 | holds | none |
| 22 | D5.Fields varying dimension (2507–2512) | `N={0}` for `x<½`, `{0,1}` for `x≥½` | `E_10e_0=e_1∉span{e_0}` for `x<½`; `E_01e_0=0`, `E_01e_1=e_0∈H(x)` for `x≥½` | holds | none |
| 23 | HeisenbergImprimitivity dictionary (3607–3615) | general x; `(ℤ/2)²`, `c=(−1)^(ba′)` | cocycle at `(x,−x,x)`: `ω(x,−x)ω(0,x)=ω(−x,x)ω(x,0)`, so `conj(ω(x,−x))=conj(c(−x,x))`; `ω^b=ω·δb`, `T_b:δ_x↦b(x)δ_x` from `ω·δb` to ω, HI's `δ_x↦u(x)δ_x` from `c·δu` to c; `uv=−vu`, `M_2`, `τ=Tr/2` on both sides | holds; same object as HI §3.1 | R01 |
| 24 | CAR norm identity (3180–3183) | relations only | `a*aa*a=a*(‖f‖²−a*a)a=‖f‖²a*a−a*a*aa=‖f‖²a*a` since `a*a*=(aa)*=0`; `‖a*a‖²=‖f‖²‖a*a‖` | holds | none |
| 25 | Fock Weyl operator (3258–3266) | `u=if/√2`, `u′=ig/√2` | `−‖u‖²/2=−‖f‖²/4`; `−⟨u,v⟩=i⟨f,v⟩/√2`; `Im⟨u,u′⟩=Im⟨f,g⟩/2`; `⟨ε(0),W_uε(0)⟩=e^(−‖u‖²/2)` | holds | none |
| 26 | Fock sign (3333–3340) | `h=ℂ`, real t | `d/dt|₀⟨ε(w),π_F(W(t))ε(v)⟩=i(v+w̄)/√2·e^(w̄v)`, `⟨ε(w),aε(v)⟩=ve^(w̄v)`, `⟨ε(w),a*ε(v)⟩=w̄e^(w̄v)`; Attal's `W_(t/√2)`: `(w̄−v)/√2·e^(w̄v)`, generator `i(a−a*)/√2=Φ(−i)` | holds | none |
| 27 | CAR zero family (3194, 3341–3345) | h=0; `h=ℂ`, `a=E_12` | `{a,a*}=⟨f,g⟩·0=0` on 0; `CAR(ℂ)=M_2≠0`, `a²=0`, `a*a+aa*=E_22+E_11=1` | holds, "nonzero" needed | none |
| 28 | Fermi KMS sign (3208–3212, 3320–3324) | `h₀=ε`, `K=diag(0,ε)` | `τ_t(a)=e^(−itε)a=Ad e^(itK)(E_12)`; `ω(E_22)=e^(−βε)/(1+e^(−βε))=(1+e^(βε))⁻¹=S`; the other sign `(1+e^(−βε))⁻¹>½` | holds | none |
| 29 | Thermal covariance (3277–3281, 3346–3348) | `h₀=ε>0` | `coth(βε/2)=(e^(βε)+1)/(e^(βε)−1)=1+2/(e^(βε)−1)`, `T=(e^(βε)−1)⁻¹`, limits 1 and ∞ | holds | none |
| 30 | D7 perturbed vector (3108–3123) | `K=diag(0,1)`, `P=−K`, `Q=−βP` | `Ω^Q=e^(−β(K+P)/2)/√Z_K=1/√Z_K`, weights `(1,1)`, trace; `‖Ω^Q‖²=Z_(K+P)/Z_K=2/(1+e^(−β))≤e^(|β|)` (Golden–Thompson); `u_t=diag(1,e^(iβt))`, `Ad(u_t)τ_(−βt)=id` | holds | none |
| 31 | D6 strong effectiveness (2782–2788) | ℤ on `ℤ⊔{+∞}` | `Iso={(0,x)}∪{(n,+∞)}`, `(n,+∞)=lim(n,k)` not interior, so `int(Iso)=G⁰`; reduction to `{+∞}` is ℤ; invariant opens ∅, ℤ, all (`{+∞}` not open); `C₊⋊ℤ` has one ideal per closed subset of 𝕋 | holds | none |
| 32 | D9 interaction norms and on-site model (3511–3522) | Ising on ℤ; `Φ({x})=hσ_3` | `M_λ=|h|+2|J|e^λ`, `M_(λ,2)=|h|+8|J|e^λ`, bound `(½)/(1+8e)=1/(2+16e)`; `Z=2cosh βh`, `e_Φ=−h tanh βh`, `s=log Z+βe_Φ`, `s−βe_Φ=p` | holds | none |
| 33 | Conventions, modular character (243–246) | Mathlib pin | `modularCharacterFun g=haarScalarFactor(map(·*g)haar)haar`, so `∫f(xg)dμ=c(g)∫f`; Williams `μ(Eg)=Δ(g)μ(E)` gives `Δ=c⁻¹` | holds | none |

## Not verifiable

- **Brown–Ozawa Proposition 5.1.3** (D2.BoundedSequenceTranslation), **Cuntz 1977 §1** (D6), **Bratteli–Robinson vols. 1–2** (D7–D9, including §§5.2–5.3, Theorems 5.3.30, 5.4.4, 6.2.18, 6.2.40, 6.2.42 and Proposition 6.2.45), **Renault LNM 793** and **Rudin, Theorems 1.5.1, 1.6.1, 1.7.2 and §2.6**: uncertified in the manifest, cited by locator. The claims resting on them that this review sampled were checked by computation (rows 18, 19, 16, 24–30, 32).
- **Araki 1973, Takeishi, Sims–Williams, Muhly–Williams, Sims (2017), Delfín–Farsi–Packer, de la Harpe, Nielsen–Petz, Arici–Mesland:** cached, outside this round's sample and the changed passages, not re-read; their locators were verified in earlier rounds and the citing text is unchanged.

## Source issues

- **Misprint** in williams-cpcsa-draft31 at the paragraph before Lemma 4.28, p. 136 (lines 8657–8677): the source says `s·φ(γ)` is `γ(s)φ(γ)` and derives (4.62) from it; it should be `conj(γ(s))φ(γ)`, since `γ(r⁻¹s)=conj(γ(r))γ(s)`; affects the proof.
