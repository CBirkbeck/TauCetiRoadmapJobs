# Review of OperatorAlgebraDynamics (pull request #1137 at 8daff1a)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` (3722 lines) and `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean` (416 lines) at 8daff1a. The previous review read the same head, so the folder has not changed since then. The pull-request description has not changed either, so both of the previous review's findings are still open (R02 and R03 below). The other four findings are new. R01 is blocking: HeisenbergImprimitivity's open head now owns `C*(L,c)`, which this README claims to own alone. The pins are Mathlib 1b1ccf4b0 and Tau Ceti 2fd255d99.

## R01 (P2) — `C*(L,c)` of a discrete abelian group has two owners: this roadmap and HeisenbergImprimitivity

**Location.** README lines 75–81: "This roadmap is the single owner of … the scalar twisted group C*-algebras `C*(G,ω)` and `C*_r(G,ω)` … the canonical trace, the gauge action … and the amenable full=reduced theorem". Lines 1550–1568 build that trace and gauge action for scalar ω on discrete G. Lines 3546–3556 say that HeisenbergImprimitivity §3.1 "consumes it from here rather than building it".

**Claim.** HeisenbergImprimitivity's head says the opposite and builds the same object itself. The conventions are the same: its `(λ_c(x)h)(y)=c(x,y−x)h(y−x)` is this README's `V_sξ(r)=ω(s,s⁻¹r)ξ(s⁻¹r)` written additively. So two open roadmaps plan the same object.

**Witness.** HeisenbergImprimitivity at #1149, head a9eeb6e, `HilbertModules/HeisenbergImprimitivity/README.md`:
- lines 30–33 own "the twisted group C*-algebra `C*(L,c)` … universal and regular completions, canonical trace, gauge action, full = reduced theorem";
- lines 37–39 say that "OperatorAlgebraDynamics D1–D2 construct crossed products for an action, with no 2-cocycle twist";
- line 167 says "Only untwisted actions are assumed of it";
- §3.1 (lines 440–465) constructs `ℓ¹(L,c)`, `C*(L,c)`, `λ_c`, the trace, the gauge action and full=reduced through twisted Fell absorption.

CompactQuantumMetricSpaces §6.0 (#1155, line 109) takes these objects from that §3.1. This README's lines 3563–3566 nevertheless say that §3.1 "state[s] the instance owned here".

**Repair.** Keep the owner here: this roadmap is on main, ahead of HeisenbergImprimitivity. HeisenbergImprimitivity can cite D1.CentralTwists–D2.CentralTwists only after this revision merges, so state the order in this pull request's merge-order paragraph: "#1149 merges after this pull request and replaces its construction of `C*(L,c)` (its lines 30–40, 167–168 and §3.1) by a citation of D1.CentralTwists–D2.CentralTwists at A=ℂ, trivial action, counting measure."

The matching edit on #1149's branch is part of the settlement. Until it is made, README lines 3546–3556 and 3563–3566 describe a consumption that HeisenbergImprimitivity's head disclaims.

Test instance: `(ℤ/2)²` with `ω=(−1)^(ba′)`. This README's Check (lines 1608–1612) gives `uv=−vu`, `M_2(ℂ)` and `τ=Tr/2`. HeisenbergImprimitivity §3.1 builds the same algebra.

## R02 (P3) — The description still states no merge order with #1187, which rewrites this `Suggested.lean`

Carried forward unrepaired from r23 R01 (and r22 R06, r21 R01, r20 R03, r17 R08). There is no repair report that marks it not actionable.

**Location.** The description's last line, unchanged: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1097, #1771, #1015, #863".

**Witness.** `scratch/overlaps.md` reports that "#1137 and #1187 conflict in … `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean`". `roadmaps show OperatorAlgebraDynamics --pr 1187` gives main's 125-line file bumped to 128 lines, with `Mathlib.*` sub-imports. This branch replaces that file with 416 lines.

**Repair.** State the order in the description. One option: #1187 merges first, this branch is rebased onto it, and the `_root_.ContRepresentation.IsUnitary` binders at Lean lines 364 and 367 are re-elaborated at Tau Ceti ab00ba392. The other option: this pull request merges first and #1187 drops its OperatorAlgebraDynamics hunk.

## R03 (P3) — `V11.FourierInversion` exists only in the VonNeumannAlgebras revision #1041, which the description does not name

Carried forward unrepaired from r23 R02.

**Location.** README lines 181, 185, 482–483, 499 and 2114–2115. Example, line 482: "VonNeumannAlgebras V11 supplies, cited by section (V11.FourierInversion: inversion, Plancherel and duality)".

**Witness.**
- On main (f490cd27), VonNeumannAlgebras has `V11.FourierUniqueness` (line 3203) and no `V11.FourierInversion`.
- At #1041's head, which has moved to 296b9d1a, `V11.FourierInversion` is at line 3628 and `V11.UnitizationCharacters` at line 3607. I re-read both: they still say what lines 182–186 and 496–500 consume:
  - injective, continuous `φ↦γ_φ`;
  - the Gelfand transform of `λ(g)` is `ĝ∘γ`;
  - `‖a‖=sup|â|`;
  - `‖λ(f)‖=sup|f̂|`;
  - surjectivity, inversion with `conj(γ(x))`, Plancherel, the bidual isomorphism and rescaling.

**Repair.** Add #1041 to the description's line "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first". While editing that line: the open-PR index of 2026-11-09 has no #1097, and it lists #1771, #1015 and #863 as new roadmaps, not revisions.

## R04 (P3) — D8 gives no locator at any claim, and line 3171 relies on an unnamed "source"

**Location.** README line 3171: "State represented-family uniqueness for nonzero unital CAR families … Preserve the source's omitted zero-representation exception." In lines 3157–3322 (D8), `grep` finds no "Bratteli", no theorem number and no page. The only pointer is the References entry (line 3678), "§§5.2–5.3 for CAR/CCR, analytic elements, KMS and ground states".

**Claim.** The CAR universal property and simplicity, `CAR(ℂⁿ)≅M_(2ⁿ)`, the quasi-free states, the Fermi KMS state, the Weyl relations and the bosonic quasi-free and thermal states all lack a locator at the claim. The sentence about "the source's" exception cannot be traced to any text.

r8 declined to re-raise this (r5 R02) because the paragraph then carried "(Bratteli–Robinson 2, §5.2.1)". That locator is gone.

Separately, `sources.toml` records `attal-fock` as cited for D8, but the README never cites Attal.

**Witness.** The hypothesis "nonzero" is what the sentence protects. On the zero Hilbert space the zero family is a unital CAR family, since `{a(f),a(g)*}=⟨f,g⟩·1=0` when `1=0`, but `CAR(h)≠0`, so `CAR(h)→B(0)=0` is not injective.

**Repair.**
- Replace the sentence with: "The hypothesis nonzero is needed: on the zero Hilbert space the zero family is a unital CAR family and `CAR(h)→B(0)` is not injective."
- Put a Bratteli–Robinson 2 locator (§5.2 for CAR and CCR, §5.3 for the ideal-gas KMS states) at each D8 claim. Take the theorem numbers from the author's copy; the text is uncertified here.
- Either cite Attal for the symmetric Fock Weyl representation or drop him from `sources.toml`. If cited: Definition 8.20 and (8.16)–(8.18), pp. 18–19 (`attal-fock` lines 654–695). Attal's `W_u` at `u=f/√2` is this README's `W(f)`: the vacuum value `e^(−‖u‖²/2)=e^(−‖f‖²/4)` and the phase `e^(−i Im⟨u,v⟩)=e^(−iσ(f,g)/2)`.

## R05 (P3) — D5.Fields cites Williams Definition F.1 "for the general notion", but Williams excludes zero fibres

**Location.** README lines 2461–2463: "(Williams, Definition F.1, p. 409, for the general notion; …)". Zero fibres are part of the target:
- `N(x)=∅` in the Checks at lines 2504–2508 and 2513;
- the zero-extended λ-field at lines 2469–2471.

**Witness.** `williams-cpcsa-draft31` line 23893 (p. 409), which introduces Definition F.1 (line 23897), assumes a family of "separable (nonzero) complex Hilbert spaces". VonNeumannAlgebras V4.0.Fields on main (line 1199) allows zero fibres: "put the transported fibre equal to zero where dμ/dλ=0".

**Repair.** Cite VonNeumannAlgebras V4.0.Fields for the general notion, and Williams Definition F.1 only for fields whose fibres are all nonzero. Test instance: X=[0,1], `N(x)={0}` on a Borel S and `∅` off S. The fibres off S are 0, so this field falls under V4.0.Fields and outside Williams's definition.

## R06 (P3) — Two D2 targets are filed under the D2.FreeGroups heading

**Location.** README line 1743 ("**D2.BoundedSequenceTranslation.** Take the coefficient algebra …") and line 1831 ("**D2.SequenceToeplitz — an asymmetric sequence algebra …**"). Both are bold paragraphs inside `### D2.FreeGroups. Powers averaging, simplicity and the canonical trace` (line 1621), after that subsection's *Needs:* line (1737–1741).

**Witness.** `grep -n '^###'` lists no heading for either target, so a reader navigating D2 by its subsections finds the uniform Roe algebra and the sequence-Toeplitz algebra under "Free groups". By contrast, D5.Fields and the Cuntz families are bold paragraphs in layers that have no `###` subsections, so they are not misfiled.

**Repair.** Promote both to subsections, e.g. `### D2.BoundedSequenceTranslation. The uniform Roe algebra of ℤ` and `### D2.SequenceToeplitz. An asymmetric sequence algebra and its crossed product`. The text stays as it is.

## Previous findings (r23, at this same head)

- **R01 (P3), no merge order with #1187: not repaired.** The description's merge-order line is unchanged ("… which merge first: #1097, #1771, #1015, #863"). Carried forward as R02.
- **R02 (P3), #1041 not named: not repaired.** Same line. #1041's head has moved from 772fc38d to 296b9d1a; the content the README consumes is unchanged. Carried forward as R03.

## Verified sound

### Gate, dependency check, elaboration

- **Gate.** My run reports every check at 0 and `OK`: set_option, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib, lean-lines, statement-hygiene, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, depcheck, metadata, stray-files, dirty, outside-folder, source-material. The worker's gate adds `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check.** Output: `depcheck: 238 roadmaps, 2320 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean Suggested.lean` gives 15 `declaration uses sorry` warnings and nothing else, at lines 102, 115, 130, 202, 221, 236, 252, 273, 294, 305, 322, 338, 360, 384 and 407 (5.2 s).
- **One-tactic probe.** On a scratch copy, each `sorry` was replaced by `first | rfl | simp | infer_instance | trivial | decide | aesop`. Every one of the 15 theorems fails, with one error each at lines 109, 123, 140, 211, 226, 243, 263, 280, 297, 314, 331, 348, 375, 396 and 413. Nothing is padding.
- **Signatures.** A scratch copy with `#check @name` for all 18 declarations elaborated once. A scripted comparison found every elaborated type identical to `scratch/signatures.md`, with no section binder lost. I compared each with its README statement:
  - `exists_residue_family` takes an ℕ-indexed `HilbertBasis`, which is the README's "obtain a Hilbert basis b indexed by ℕ" step;
  - `continuous_of_measurable_monoidHom` carries Polish G and separable metrizable K (Williams D.11);
  - `vonNeumannEntropy_strong_subadditivity` carries `PosSemidef` and no trace hypothesis, as line 3412 argues.
- **Imports and form.** `import Mathlib` plus eight `TauCeti.*` modules, all at the pin. No `set_option`, no `lemma`, no sorry'd data.

### Seeded sample (table rows 18–22)

- **D2.BoundedSequenceTranslation (1743–1829).** The construction is correct (row 18). Mathlib `CommCStarAlgebra (lp A ∞)` is at `Mathlib/Analysis/CStarAlgebra/lpSpace.lean` line 35. Brown–Ozawa 5.1.3 is uncertified (Not verifiable).
- **D2.SequenceToeplitz (1831–1916).** Correct (row 19). Arici–Mesland p. 3: §2.1 heading at line 71, Definition 2.1 at line 114, relations (3) at line 117, extension (4) at line 122. Under the Fourier transform, `T_z` is the unilateral shift (lines 126–127), which supports the symbol `T↦z`.
- **Saddle flow (1927–1959).** Correct (row 20); no locator is needed.
- **D5.Fields (2441–2513).** Williams Definition E.16 (line 23770) and Theorem E.17 (line 23776, hypotheses: separable H, second-countable LCH X, finite Borel μ) are on cache page 417, printed p. 405. Definition F.1 is at line 23897, printed p. 409. The nonzero-fibre restriction is R05.
- **Concrete Cuntz families (2842–2881).** Correct (row 16). `HilbertBasis`, `HilbertBasis.repr`, `exists_hilbertBasis`, `Nat.divModEquiv` and `ContinuousLinearMap.adjoint` exist at the pin. Cuntz §1 is uncertified.

The README flags as cited by locator only Brown–Ozawa 5.1.3, Bratteli–Robinson 2 Theorem 5.4.4, Rudin §2.6 and Cuntz §1. All four are uncertified in the manifest (Not verifiable).

### Other locators re-read this round

- **Williams** (printed page = cache page − 12): Proposition 2.40 (p. 59), Proposition 3.1 (p. 82), Proposition 3.19 (p. 93), Theorem 4.24 (p. 133), Definition 4.26 (p. 135, `S_γR_s=γ(s)R_sS_γ`, which is D4.LCAWeyl's `U_sV_χU_s*=conj(χ(s))V_χ`), Theorem 4.29 (p. 137), Theorem 7.13 (p. 199) and Theorem D.11 (p. 372).
- **de la Harpe:** Definition 9 at line 323 (p. 7), Corollary 12(i) at line 367 (p. 8, free products with `(|Γ₁|−1)(|Γ₂|−1)≥2`), Theorem 14 at line 423 (pp. 10–11), Kesten at lines 712–720 (p. 16), the Dixmier remark at lines 860–878 (p. 19).

### Library declarations opened at the pins

- **Mathlib:** `AddMonoidHom.continuous_of_measurable` (`MeasureTheory/Measure/Haar/NormedSpace.lean` line 79; seminormed locally compact source, `NormedSpace ℝ` target, as the Lean docstring says); the `lp A ∞` C*-instances (lines 26 and 35); `div_mem_nhds_one_of_haar_pos`; `MonoidHom.isOpenMap_of_sigmaCompact`; `ContinuousLinearMap.toPointwiseConvergenceCLM`.
- **Tau Ceti:** `NonUnitalStarAlgHom.multiplierExtension` with `tendsto_`/`continuous_multiplierExtension_apply` (`Analysis/CStarAlgebra/Representation/Nondegenerate.lean`); `TauCeti.twistedMonoidAlgebra` and `TauCeti.TwistedMonoidAlgebra.equivOfCoboundary` (`Algebra/MonoidAlgebra/Twisted/Basic.lean`, namespace `TauCeti`, `equivOfCoboundary` at line 509).

### Cross-roadmap citations resolved

**On main (f490cd27):**
- CStarAlgebras C1.3 (305, including quotient C*-algebras), C1.4 (380), C1.6 (435), C1.7 (468, the extension `M(A)→M(B)`), C2.1–C2.4 (544–643), C2.AnnHull (695), C5.1 (1112), C5.2 (1143), C5.4 (1203), C6.1 (1272), C6.2 (1297), C6.5 (1414), C7.1 (1455) and C8.4 (1676, symbol `S↦z`);
- BanachAlgebras §3.1 (756), Layer 7 (1494) and A7.CharactersAndUniqueness (1739);
- AmenableGroups Layer 5 (289) and Layer 7 (415);
- HilbertModules H2 and H3;
- SelfAdjointSpectralTheory SA-A21, SA-B14, SA-B44, SA-B50, SA-B59, SA-B67, SA-B79 and SA-B85;
- LieGroupoidsPoisson G0; FreeProbability F3 (line 77 names this roadmap);
- VonNeumannAlgebras V4.0.Fields (1181, zero fibres allowed), V4.0.Decomposition (1279), V10.ModularTheory (2364), V10.KMS (2459) and Kaplansky in V1 (477);
- `RepresentationTheory/CompactGroups` and `Completed/OneParameterSemigroups`.

**At the open heads:**
- NoncompactQuantumSymmetry #1015 (4e793e8): consumes D1.BorelPrefix, D1.TwistedBorel and D4.Harmonic (lines 19 and 195); M2.FixedTwistTypeI at 1886.
- OperatorKTheory #866 (1377338): K7.5 consumes D1.CentralTwists–D2.CentralTwists (lines 173–176 and 236–244), consistent with this README.
- CStarClassification #863 (db5a0c5): CL2, CL3, CL5 and §§5.7–5.8; D6 named as owner of `O_n` (786–814).
- QuantumFoundations #1771 (824bab8): §6.3 and §6.4 consume D8 (732, 748).
- MetaplecticAutomorphicForms #1063: §1.2, unitary Stone–von Neumann (line 72).
- CompactQuantumMetricSpaces #1155: §6.0 (1440), Layer 6 (1438).
- CategoricalOperatorAlgebras #888: D6 as owner of `O_n`.
- HeisenbergImprimitivity #1149 (a9eeb6e): §1.1 (202), §3.1 (440), Layer 1 (200). This is the ownership conflict of R01.

### Ownership by object

I compared ownership for the five closest roadmaps in `overlaps.md` (#866, #1015, #1041, #1149 and #1771) and for #863, #888 and #1155. All record this roadmap as the owner of what they share with it, except HeisenbergImprimitivity (R01).

### Adversarial table

| # | Statement (README / Lean) | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | `exists_integratedOperator` (Lean 102; 676–689) | ℤ, `f=δ_0⊗a+δ_1⊗b`; `f(n)=2^(−|n|)a`; μ=0 | `T=π(a)+π(b)U`; `‖T‖≤Σ2^(−|n|)‖a‖=3‖a‖`; `T=0` | holds | none |
| 2 | `exists_covariantRepresentation_integratedFull` (Lean 115; 709–713) | G trivial, `A=ℂ²`, `L(x,y)=x`; `L=0` on ℂ | `π=L`, `U=1`, π nondegenerate; `L=0` forces π=0, degenerate, excluded by `hL` | holds | none |
| 3 | `fullCrossedProductMap_exact` (Lean 130; 728–737) | G trivial; `A=ℂ²`, `I=ℂ⊕0`; `I=A` | `0→I→A→A/I→0`; `0→C*(G)→C*(G)²→C*(G)→0`; quotient 0 | holds | none |
| 4 | `CentralCocycle.cocycle` (Lean 161; 918–920) | encoded form; ℤ/2, `ω(a,a)=−1` at `(a,a,a)` | `α_r(ω(s,t)α_r⁻¹(ω(r,st)a))=α̃_r(ω(s,t))ω(r,st)a`; `(−1)·1=(−1)·1` | holds | none |
| 5 | Projective regular family (985–989) | general `s,t,r` | `V_sV_tξ(r)=ρ̃(α̃_(r⁻¹)[ω(s,s⁻¹r)α̃_s(ω(t,x))])ξ(x')`, `x=t⁻¹s⁻¹r`; cocycle gives `ω(s,t)ω(st,x)` | holds | none |
| 6 | `exists_centralIntegratedOperator` (Lean 202) | ℤ/2, A=ℂ, `ω(a,a)=−1`, `U_a=i` | `U_a²=−1=ω(a,a)`; `f=δ_a` gives `T=i`, `‖T‖=1=‖f‖₁` | holds | none |
| 7 | `continuous_of_measurable_monoidHom` (Lean 221; 1133–1148) | `id:ℝ→ℝ`; Hamel ℚ-linear map | continuous; discontinuous, hence not Borel; D.11's Polish source and separable metric target carried | holds | none |
| 8 | `injective_integratedFull_regular_of_amenable` (Lean 236; 1344–1356) | ℤ; F₂ (not amenable); `ρ=id⊕0` | `‖λ(f)‖=sup|f̂|`; `4∈σ_(C*(F₂))(h)`, `4∉σ(λ(h))`; zero summand leaves kernel | holds, hypothesis needed | none |
| 9 | `transitive_commutant_scalar` (Lean 252) | `I={p,q}`, ℤ/2 swap, `value=(1,0)`; `F=∅` | `(1−0)T_pq=0`; swap gives `d_p=d_q`; without `hsep` the swap matrix commutes and is not scalar | holds, `hsep` needed | none |
| 10 | `exists_powers_partition` (Lean 273; 1640–1646) | `F={b}`, L=2, `w=ab²`; ℤ, `F={1}`, N=3 | `wbw⁻¹=aba⁻¹`, `(aba⁻¹)c` starts with a; `b^jD` has j leading b's; ℤ fails (D ≥ half, three translates ≤ third) | holds, rank ≥ 2 needed | none |
| 11 | `reducedFreeGroup_isSimpleRing` (Lean 294) | rank 1; full `C*(F₂)` | `C(𝕋)⊇{f(1)=0}`; `u−1∈ker(triv)`, `λ(u)δ_1−δ_1=δ_u−δ_1≠0` | holds | none |
| 12 | `reducedFreeGroup_trace_unique` (Lean 305) | `x=λ(g)`; rank 1 | `⟨δ_1,δ_g⟩=[g=1]`; `ev_z` are distinct traces of `C(𝕋)` | holds | none |
| 13 | `exists_fullGroupCStarAlgebra_equiv_zeroAtInfty_dual` (Lean 322) | ℤ/2; ℤ; involution | `δ_a↦(1,−1)`, `‖δ_e+δ_a‖=2`; `δ_1↦z`; `∫conj(f(x⁻¹))χ(x)=conj(f̂(χ))` | holds | none |
| 14 | `exists_fullGroupCStarAlgebra_dual_equiv_zeroAtInfty` (Lean 338) | G=ℤ, Ĝ=𝕋; G trivial | `f↦(n↦∫f(z)zⁿdν)`, unitary at z ↦ `n↦zⁿ`; ℂ=ℂ | holds | none |
| 15 | `lcaWeyl_classification` (Lean 360; 2247–2289) | ℤ/3, U shift, `V=diag(1,ω,ω²)`; E=0; `L²⊕L²` | `U_1VU_1*ξ(t)=χ(t−1)ξ(t)=ω⁻¹Vξ(t)`; `ι=∅`; `|ι|=2` | holds | none |
| 16 | `exists_residue_family` (Lean 384; 2842–2871) | n=1; n=2, `b_3`; shift family; basis change W | `S_0=Id`; `S_0*b_3=0`, `S_1*b_3=b_1`, sum `b_3`; `S_i*S_jb_k=[(nk+j)%n=i]b_k=δ_ij b_k`; `S_1*S_0≠0`; `WS_jW*b'_k=b'_(nk+j)` | holds | none |
| 17 | `vonNeumannEntropy_strong_subadditivity` (Lean 407; 3407–3415) | GHZ; `2·GHZ`; `|0⟩⟨0|⊗Φ⁺`; index order | `0+log2≤2log2`; `−2log2+0≤0`; `log2=log2`, with `ρ_A` instead `log2≤0` false; `prodAssoc.symm` regroups to `(a×b)×c` | holds | none |
| 18 | D2.BoundedSequenceTranslation (1743–1829) | `E_ij`; band T; `p=M_(1_2ℤ)`; ideals | `E_ijδ_n=[n=j]δ_i`; `Σ_kM_(f_k)U^kδ_j=Σ_k⟨δ_(j+k),Tδ_j⟩δ_(j+k)=Tδ_j`; `UpU*=1−p`, `χ(p)=½∉{0,1}`; opens ∅, `{η}∪O` | holds | none |
| 19 | D2.SequenceToeplitz (1831–1916) | `1`, `e=M_(1_[0,∞))`, `M_fU^k` | `lim_(−∞)1=1∉C₊`; `eUeδ_n=δ_(n+1)`; ideal of e ∋ `E_00`, maps onto `C(𝕋)` (full); `q(M_fU^k)=ℓ₊(f)z^k` | holds | none |
| 20 | Saddle flow (1927–1959) | `|xy|<ε`; `{x>0,|xy|<ε}`; ±x; +x,+y | origin nbhd ∋ all half-axes; +x nbhd excludes origin; `{x>0}`/`{x<0}` separate ±x; +x,+y meet in Q1 | T₀, not T₁, not T₂ | none |
| 21 | D5.Fields (2441–2513) | point; `N=ℕ`; jump at ½; non-Borel S; `1` vs `E_00`; empty X | `H(x_0)`; `L²(X;ℓ²)`; `E_10e_0=e_1∉span{e_0}`, `E_01e_0=0`; `1_Se_0` not measurable; equal on `span{e_0}`; 0. Williams F.1 needs nonzero fibres | maths holds; locator R05 | R05 |
| 22 | CAR uniqueness (3171) | zero Hilbert space; `CAR(ℂ)`, `a=E_12` | `{a,a*}=1=0` on 0, `CAR(h)≠0` not injective; `a²=0`, `a*a+aa*=E_22+E_11=1` | holds, "nonzero" needed | R04 |
| 23 | Scalar discrete twisted instance (1550–1568, 1602–1612) | ℤ/2, `ω(a,a)=−1`; `(ℤ/2)²`, `ω=(−1)^(ba′)` | `u_a*=−u_a`, `u_au_a*=1`, `γ(a)=−1` swaps summands; `uv=u_11`, `vu=−u_11`, `M_2(ℂ)`, `τ=Tr/2` | holds; same object as HeisenbergImprimitivity §3.1 | R01 |
| 24 | D1.CentralTwists cochain direction (1016–1025, 1079–1081) | ℤ/2, `b(a)=i` | `ω^b(a,a)=i·i·(−1)=1`; `T_bδ_a=iδ_a`, `(iδ_a)*_ω(iδ_a)=−ω(a,a)δ_e=δ_e` | holds | none |
| 25 | D1.BorelPrefix `E_ω` (1150–1177) | ℤ/2, `ω(a,a)=−1` | `(1,a)²=(−1,e)`, order 4; `ψ_b(1,a)=(i,a)`, `(i,a)²=(1,e)`; `(z,s)⁻¹` check gives `(1,e)` | holds | none |
| 26 | D3 modular factor (1999–2046) | general; ax+b with dilations | `⟨f,g⟩*(h)=Δ_H(h)⁻¹Δ_G(h)γ(h)⁻¹∫f(th)conj(g(t))`, equal to `⟨g,f⟩(h)` iff `γ²=Δ_G/Δ_H`; `Δ_H=1≠Δ_G` | holds | none |
| 27 | D7 KMS and Araki sign (3042–3106) | `K=diag(0,1)`, `a=E_12`, `b=E_21`, `P=−K` | `ω(aτ_(iβ)b)=e^(−β)/(1+e^(−β))=ω(ba)`; `u_t'=u_t·iσ_t(Q)`, `Γ_s'=Γ_s·iτ_s(P)`, so `u_t=Γ_(−βt)`; `τ^P=id`, trace | holds | none |
| 28 | D8 Weyl and Fermi signs (3191–3203, 3279–3287) | Schrödinger pair; `h₀=ε` | `W(se_1)W(te_2)=e^(−ist)W(te_2)W(se_1)`; `[x,−id/dx]=i`; `ω(a*a)=(1+e^(βε))⁻¹` | holds | none |
| 29 | D9 Ising and on-site (3457–3468) | `hσ_3`, `Jσ_3⊗σ_3`, λ=1, d=2 | `M_λ=|h|+2|J|e^λ`, `M_(λ,2)=|h|+8|J|e^λ`, `(½)/(1+8e)=1/(2+16e)`; `s−βe_Φ=log 2cosh βh=p` | holds | none |
| 30 | D5 one-unit groupoid (2416–2431) | group, `Δ^(1/2)` | `(Δ^(1/2)f)*(Δ^(1/2)g)=Δ^(1/2)(f*g)`; groupoid star of `Δ^(1/2)f` is `Δ^(−1/2)conj(f(s⁻¹))=Δ^(1/2)·Δ⁻¹conj(f(s⁻¹))`; I-norm `max(‖f‖₁,‖Δ⁻¹f‖₁)` | holds | none |

### Remarks that need no change

- `exists_centralIntegratedOperator` does not use the cocycle laws of ω. Unused hypotheses are a note only, and the statement is not padding: the probe fails.
- `transitive_commutant_scalar` states the operator-theoretic step of the orbit-representation irreducibility. The full statement would need a constructed `CStarAction` of G on `C₀(X)` and the orbit covariant pair, which is a long encoding the form rules discourage.

## Not verifiable

- **Brown–Ozawa Proposition 5.1.3** (D2.BoundedSequenceTranslation), **Cuntz 1977 §1** (D6), **Bratteli–Robinson vols. 1–2** (D7–D9, including Theorems 5.4.4, 6.2.18 and Proposition 6.2.45), **Renault LNM 793** and **Rudin, Theorems 1.5.1, 1.6.1, 1.7.2 and §2.6**: uncertified or not in the cache; cited by locator. The sampled claims that rest on them were checked by computation (rows 18, 19, 16, 27 and 29).
- **Araki 1973, Takeishi, Sims–Williams, Muhly–Williams, Sims (2017), Delfín–Farsi–Packer, Nielsen–Petz:** cached, outside this round's sample, not re-read.

## Source issues

- **Misprint** in williams-cpcsa-draft31 at the paragraph before Lemma 4.28, p. 136 (lines 8657–8677): the source says `s·ϕ(γ)` is `γ(s)ϕ(γ)` and derives (4.62) from that rule; it should be `conj(γ(s))ϕ(γ)`, since `γ(r⁻¹s)=conj(γ(r))γ(s)` in the computation of `lt_r(F(ϕ))`; affects the proof.
