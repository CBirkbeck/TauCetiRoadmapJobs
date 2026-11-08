# Review of OperatorAlgebraDynamics (pull request #1137 at b15a0d4)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` (3628 lines) and `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean` (375 lines) at b15a0d4. The r21 review read the same head, so nothing in the folder has changed since then. The library pins are Mathlib 1b1ccf4b0 and Tau Ceti 2fd255d99, the same on this branch and on main (b3d628f).

Two of the findings are new because the surrounding state has moved:

- the open VonNeumannAlgebras revision now retires a section id that is cited here (R01);
- Tau Ceti's matrix-entropy file at the pin is neither cited nor stated against (R02, R03).

## R01 (P2) — `V11.FourierUniqueness` is retired by the open VonNeumannAlgebras revision, but four supplier citations here still locate their content by it

**Location.** `TauCetiRoadmap/OperatorAlgebraDynamics/README.md`, lines 177–178, 456–458, 473 and 2051–2052. For example, lines 456–458: "VonNeumannAlgebras V11 supplies, as a roadmap on main cited by section (the inversion, Plancherel and duality paragraph that follows V11.FourierUniqueness)".

**Claim.** D4.Harmonic consumes V11's Plancherel unitary, inversion, rescaling law, Pontryagin duality and `‖λ(f)‖=sup|f̂|`. Every one of these citations locates that content as "the paragraph that follows V11.FourierUniqueness".

**Witness.** At the head c0dc59f of the VonNeumannAlgebras revision (#1041), lines 312–316 of its README order V11 as "V11.DoubleDualEmbedding, then V11.UnitizationCharacters, then V11.FourierInversion". The uniqueness inputs, "cited elsewhere as V11.FourierUniqueness", move to BanachAlgebras A7.CharactersAndUniqueness. No `V11.FourierUniqueness` heading is left there; the content this roadmap consumes is now the section V11.FourierInversion (line 3482).

**Repair.**

- In each of the four places, replace "the paragraph that follows V11.FourierUniqueness" with "V11.FourierInversion (inversion, Plancherel and duality)". Keep V11.UnitizationCharacters, which exists at both heads.
- Name the VonNeumannAlgebras revision in the description's merge-order line, as merging first.

I checked this replacement at c0dc59f. V11.FourierInversion states:

- inversion with `conj(γ(x))`;
- `Fλ(f)F*=M_f̂` and `‖λ(f)‖=sup|f̂|`;
- surjectivity of `Ω→dual G`;
- the bidual isomorphism and the rescaling compatibilities.

That is every item lines 459–477 consume.

## R02 (P2) — Two deep results are statable at the pins but absent from `Suggested.lean`: strong subadditivity (D9) and automatic continuity (D1.BorelPrefix)

**Location.**

- README line 3331: "Prove strong subadditivity `S(ABC)+S(B)≤S(AB)+S(BC)`".
- Lines 1091–1094: "if G is a Polish group and K is a topological group whose topology is separable and metrizable, every Borel-measurable group homomorphism G→K is continuous".
- `Suggested.lean` states neither, and the list of unstatable headlines in its docstring (lines 45–71) names neither.

**Claim.** Both are deep results the roadmap is built to reach. Automatic continuity is in the single-owner list at line 81 and is consumed by NoncompactQuantumSymmetry P.2. Both need only carriers that exist at the pins. Line 3331 also gives no locator for strong subadditivity.

**Witness.** The two statements below elaborate with only `sorry` warnings, under `import Mathlib` and `import TauCeti.Analysis.Matrix.Entropy`, with `open scoped ComplexOrder` as `Suggested.lean` already has. They use Tau Ceti's `Matrix.vonNeumannEntropy` (`TauCeti/Analysis/Matrix/Entropy.lean:88`) and `Matrix.partialTraceRight`/`Matrix.partialTraceLeft` (`TauCeti/LinearAlgebra/Matrix/Trace/Partial.lean:51, 153`).

**Repair.** Add the two theorems, add the import, and name both in the README at their targets:

```lean
theorem strong_subadditivity {a b c : Type*} [Fintype a] [DecidableEq a]
    [Fintype b] [DecidableEq b] [Fintype c] [DecidableEq c]
    {ρ : Matrix (a × b × c) (a × b × c) ℂ} (hρ : ρ.PosSemidef) (htr : ρ.trace = 1) :
    ρ.vonNeumannEntropy + ρ.partialTraceLeft.partialTraceRight.vonNeumannEntropy ≤
      (ρ.reindex (Equiv.prodAssoc a b c).symm
        (Equiv.prodAssoc a b c).symm).partialTraceRight.vonNeumannEntropy +
        ρ.partialTraceLeft.vonNeumannEntropy := by
  sorry

theorem continuous_of_measurable_monoidHom {G K : Type*} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [PolishSpace G] [MeasurableSpace G] [BorelSpace G]
    [Group K] [TopologicalSpace K] [IsTopologicalGroup K]
    [TopologicalSpace.SeparableSpace K] [TopologicalSpace.MetrizableSpace K]
    [MeasurableSpace K] [BorelSpace K] (f : G →* K) (hf : Measurable f) : Continuous f := by
  sorry
```

How the strong-subadditivity statement reads the factors, for ρ on `a×(b×c)`:

- `partialTraceLeft ρ` is `ρ_BC`;
- its `partialTraceRight` is `ρ_B`;
- the reindexed `partialTraceRight` is `ρ_AB`.

On the three-qubit GHZ state the statement reads `0+log 2≤log 2+log 2`.

The second statement has the hypotheses of Williams, Theorem D.11 (p. 372): separable metric groups, the source Polish. Add a locator for strong subadditivity at line 3331.

## R03 (P3) — D9 plans matrix entropy, relative entropy, their positivity and ordinary subadditivity, all of which Tau Ceti already has at the pin

**Location.** README lines 3326–3330: "Develop finite-matrix entropy and relative entropy `D(ρ||σ)=Tr(ρ(logρ−logσ))`, with infinity when the support condition fails, and `0 log0=0` in entropy. Prove positivity for trace-one ρ,σ, ordinary subadditivity".

**Claim.** These are listed as targets of this roadmap. The "From Tau Ceti" contract (lines 256–430) does not list them, and lines 42–43 say that "nothing below restates them".

**Witness.** `TauCeti/Analysis/Matrix/Entropy.lean` at 2fd255d9 has:

- `Matrix.vonNeumannEntropy` (line 88), built on `negMulLog`, so `0 log 0=0` is built in;
- `Matrix.relativeEntropy` (line 134), equal to `⊤` unless `ker σ ⊆ ker ρ`;
- `Matrix.PosSemidef.relativeEntropy_nonneg` (line 239);
- `Matrix.PosSemidef.vonNeumannEntropy_le_partialTraceRight_add_partialTraceLeft` (line 303).

**Repair.**

- Cite these four, together with Klein's inequality `Matrix.PosSemidef.re_trace_sub_trace_le_relativeEntropy` (line 198) and `Matrix.partialTraceRight`/`Matrix.partialTraceLeft`, in the "From Tau Ceti" contract and in D9's *Needs:*.
- Keep as D9 targets only what is missing: the relative-entropy calculus beyond Klein's inequality, monotonicity under partial trace, and strong subadditivity.

As a check of the cited object, Tau Ceti's `relativeEntropy` of `diag(1,0)` against `diag(0,1)` is `⊤`, since `ker σ=span e₁` is not contained in `ker ρ=span e₂`. That is the `+∞` of the Check at line 3385.

## R04 (P3) — D2.BoundedSequenceTranslation plans the C*-structure of `ℓ∞(ℤ)`, which Mathlib already provides

**Location.** Lines 1693–1696: "Take the coefficient algebra exactly as `B=ℓ∞(ℤ,ℂ)`, using native `lp (fun _ : ℤ=>ℂ) ∞` … Construct its unital C*-structure and translation action with the supremum norm."

**Witness.** Mathlib's `Analysis/CStarAlgebra/lpSpace.lean`, line 35, has an instance `CommCStarAlgebra (lp A ∞)` for nontrivial commutative C*-algebras `A i`. It is built on `lp.inftyCStarRing` and `lp.inftyNormedAlgebra` (`Analysis/Normed/Lp/lpSpace.lean`, lines 892 and 996). In a scratch file, `example : CStarAlgebra (lp (fun _ : ℤ => ℂ) ∞) := inferInstance` finds the instance at the pin.

**Repair.** Write "Use Mathlib's `CommCStarAlgebra` instance on `lp (fun _ : ℤ => ℂ) ∞` (`Mathlib/Analysis/CStarAlgebra/lpSpace.lean`) and construct the translation action", and add that file to the "From Mathlib" contract.

## R05 (P3) — D2.SequenceToeplitz needs `C*(ℤ)≅C(𝕋)`, which only the later layer D4.Harmonic provides, and its *Needs:* line omits it

**Location.** Lines 1784–1793: "Use D1's full exactness and D2's amenable full/reduced comparison to construct `0→K(ℓ²(ℤ))→B→C(𝕋)→0` … prove its continuous extension, surjectivity and exact kernel". The *Needs:* line (1848–1854) lists only D1, D2, D2.BoundedSequenceTranslation, the gaps, Tau Ceti and `lp`.

**Claim.** Full exactness gives `0→c₀⋊ℤ→C₊⋊ℤ→ℂ⋊ℤ→0`. The stated sequence, and the exact kernel of q, need in addition `ℂ⋊ℤ=C*(ℤ)≅C(𝕋)` with `δ_1↦z`.

**Witness.** The README builds that isomorphism in D4.Harmonic (lines 2057–2065). Its Check at lines 2104–2106 states that `C*(ℤ)≅C(𝕋)` "sends the generator `δ_1` to the coordinate function z". Continuity of q does follow from the characters `(ℓ₊, n↦zⁿ)`, since `ℓ₊(α_k f)=ℓ₊(f)`. Injectivity of `C*(ℤ)→C(𝕋)` does not.

**Repair.** Either of two:

- add "D4.Harmonic (`C*(ℤ)≅C(𝕋)`, `δ_1↦z`)" to the *Needs:* line, and say in "How to read the build" that this target follows D4.Harmonic;
- or give the direct route inside D2 and cite its names: Mathlib's `gelfandStarTransform` on the commutative unital `C*(ℤ)`, whose characters are the maps `n↦zⁿ`, z∈𝕋, by the universal property.

## R06 (P3) — #1187 rewrites this `Suggested.lean`, and the description states no merge order

This is carried forward unrepaired from r21 R01, which was r20 R03 and r17 R08. The job directory holds no repair report.

**Location.** The pull-request description: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1097, #1771, #1015, #863".

**Witness.** `roadmaps show OperatorAlgebraDynamics --pr 1187 --file Suggested.lean` returns main's 128-line file, with `ContRepresentation.IsUnitary` at lines 47, 57 and 64 where main has `_root_.ContRepresentation.IsUnitary`. This branch replaces that file wholesale, and `scratch/overlaps.md` reports the conflict. #1187 also bumps Tau Ceti to ab00ba392.

**Repair.** State the order in the description. Either #1187 merges first and this branch is rebased onto it, with the `_root_.ContRepresentation.IsUnitary` binders at lines 341 and 344 re-elaborated at Tau Ceti ab00ba392; or this pull request merges first and #1187 drops its OperatorAlgebraDynamics hunk.

## R07 (P3) — `gap:cstar-representations` cites "C2.6", an id that CStarAlgebras does not have

**Location.** Lines 563–565: "the primitive ideal space `Prim(A)` with its hull–kernel topology, the lattice correspondence of closed ideals with open sets and `Prim(A/I)` as the closed hull of I (C2.6)."

**Witness.**

- CStarAlgebras on main, line 695: "### 2.6 Primitive ideals, hull–kernel topology, annihilators and open supports (C2.AnnHull)".
- Its line 35 says that `C2.AnnHull` keeps its name, and its line 1958 records NoncompactQuantumSymmetry as consuming `C2.AnnHull`.
- The string "C2.6" occurs nowhere in that README.

**Repair.** Write "(§2.6, C2.AnnHull)". The content cited is in the opening paragraph of §2.6 (lines 697–709): the lattice correspondence and `Prim(A/I)=hull(I)`, Blackadar II.6.5.4.

## R08 (P3) — The value `‖λ(h)‖=2√3` is attributed to de la Harpe p. 16, which states only a spectral gap

**Location.** Lines 1301–1302: "the trivial character gives 4 while `‖λ(h)‖=2√3<4` (Kesten's theorem, recalled in de la Harpe, p. 16)".

**Witness.** `delaharpe2007` lines 715–720 (p. 16): for a symmetric generating set S of size d, Kesten showed that `(1/d)Σ_(s∈S)λ(s)` has spectrum in `[−1,1−ε]`. That gives `4∉σ(λ(h))`. It gives neither the norm `2√3` (Kesten's `2√(2k−1)` at k=2) nor `‖λ(h)‖<4`, because −1 is not excluded.

**Repair.** Argue through the spectrum: "the trivial character would take the value 4 at h, and 4 is not in the spectrum of λ(h) by Kesten's theorem as recalled in de la Harpe, p. 16". The conclusion, that the trivial character does not factor through `C*_r(F₂)`, then follows from the cited text. Alternatively, cite Kesten's 1959 paper for the norm.

## R09 (P3) — The README's title and references heading are not in the house shape

**Location.** Line 1: "# Operator-algebra dynamics, crossed products, and equilibrium". Line 3499: "## Sources and API alignment".

**Witness.** The house shape is `# Roadmap: <lower-case title>` and `## References`. On main, 101 of 153 roadmap READMEs open with "# Roadmap:", and 123 have "## References".

**Repair.** Retitle the README "# Roadmap: operator-algebra dynamics, crossed products, and equilibrium" and rename line 3499 to "## References". Neither anchor is linked from main or from any open head.

Keep the headings `## D1.`–`## D9.`. Other roadmaps link their anchors: LocalVariationalFieldTheory on main (line 1167) links `#d8-car-weyl-algebras-and-free-equilibrium-states`, and NoncompactQuantumSymmetry at #1015 (lines 11 and 200) links `#d1-…`, `#d3-…` and `#d5-…`.

## Previous findings (r21, at this same head)

- **r21 R01 (P3), no merge order with #1187: not repaired.** The description still reads "which merge first: #1097, #1771, #1015, #863" and does not mention #1187. It is carried forward as R06.

## Verified sound

### Gate, dependency check and elaboration

- **Gate.** My run of the gate on this head reports every check at 0, then `OK`. The worker's gate also has `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check.** The output is `depcheck: 237 roadmaps, 2341 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` gives 13 `declaration uses sorry` warnings, at lines 94, 107, 122, 194, 213, 229, 250, 271, 282, 299, 315, 337 and 361, and nothing else (11.7 s).
- **One-tactic probe.** A scratch copy with each `sorry` replaced by `first | rfl | simp | infer_instance | trivial | decide` closes none of the 13 theorems.
- **Signature pass.** I appended `#check @name` for all 16 declarations to a scratch copy and elaborated it once. The 16 types are identical to `scratch/signatures.md`. No section binder is lost, and each type has the generality of its README statement. Two restrictions are deliberate, and the docstrings say so:
  - `H : Type (max u v)` in the recovery of the pair, because `integratedFull` is only defined there;
  - the shared universe of `A` and `B` in `fullCrossedProductMap_exact`.

### Seeded sample (all five targets)

- **D2.BoundedSequenceTranslation, lines 1693–1775.** I computed covariance, the matrix units, the band identity, the absence of characters, the hull–kernel topology and non-CCR (table rows 19–20). The one locator, Brown–Ozawa Proposition 5.1.3, is uncertified; see Not verifiable.
- **D2.SequenceToeplitz, lines 1777–1854.** The locator holds: `arici-mesland2019` p. 3 has §2.1, Definition 2.1 (line 114), relations (3) (line 117) and extension (4) (line 122). The symbol `T=T_z↦z` is from lines 126–127. Rows 21 and 37 hold the computations.
- **The saddle flow, lines 1865–1897.** It has no locator, and its only Mathlib inputs exist. Row 22.
- **D5.Fields, lines 2378–2457.** The locators hold:
  - Williams Definition E.16 and Theorem E.17 are on printed p. 405 (cache lines 23770–23786). Theorem E.17 assumes H separable, X second-countable LCH and μ a finite Borel measure, as D5.Fields does.
  - Definition F.1 is on p. 409 (line 23897).

  Row 23.
- **Concrete Cuntz families, lines 2779–2818.** `HilbertBasis` (with its `repr` field), `exists_hilbertBasis` and `Nat.divModEquiv` exist at the pin. Cuntz §1 is uncertified. Row 18.

### Locators of the headline theorems in the cached Williams draft 3.1

Printed page = PDF page − 12.

- Proposition 2.40, p. 59.
- Proposition 3.1, p. 82.
- Proposition 3.19, p. 93.
- Lemma 2.73, p. 76.
- Theorem 4.24, p. 133.
- Definition 4.26 and Example 4.27, p. 135: `S_γR_s=γ(s)R_sS_γ` with `(λ,V)` the Schrödinger pair.
- Lemma 4.28, p. 136.
- Theorem 4.29, p. 137.
- Theorem 7.13, p. 199.
- Theorem D.11, p. 372.

In de la Harpe:

- Definition 9, p. 7 (line 323).
- Corollary 12, p. 8 (line 367).
- Theorem 14 and its proof, pp. 10–11 (lines 423–494, including the `1/√N` estimate at line 488).
- The Dixmier-property remark, p. 19 (line 856).

### Library declarations opened at the pins

**Tau Ceti:**

- `IsKMSState.eq_zero_of_apply_toPreGNS_one_eq_zero` (`Action/KMS/Separating.lean:114`). It is stated for x in `VonNeumannAlgebra.adjoin (range π_ω)`, so the GNS vector separates M itself, as D7's faithfulness step at line 2897 needs.
- `Amenable.of_commGroup` (`GroupTheory/Amenable/Abelian.lean:47`).
- `Matrix.vonNeumannEntropy`, `Matrix.relativeEntropy` and subadditivity (`Analysis/Matrix/Entropy.lean`).
- `Matrix.partialTraceRight`/`partialTraceLeft` (`LinearAlgebra/Matrix/Trace/Partial.lean`).

**Mathlib:**

- `AddMonoidHom.continuous_of_measurable` (`MeasureTheory/Measure/Haar/NormedSpace.lean:79`): the source is a locally compact seminormed additive group and the target a real normed space, as line 1101 says.
- `CStarModule.star_inner` (a structure field), `HilbertBasis` (`l2Space.lean:376`), `exists_hilbertBasis` (`:593`), `Nat.divModEquiv` (`Logic/Equiv/Fin/Basic.lean:358`).
- The `lp ∞` C*-instances (R04).

A scripted pass resolved every other backticked Mathlib and Tau Ceti name in the README at the pins. The only unresolved strings were the non-names `A''`, `D_F`, `H_x`, `u_x` and `Suggested.lean`.

### Cross-roadmap citations resolved

**On main (b3d628f):**

- CStarAlgebras C1.3 (which includes quotients and the correspondence with surjections, line 322), C1.4, C1.6, C1.7, C2.1–C2.4, C5.1, C5.2, C5.4, C6.1, C6.2, C6.5, C7.1 and C8.4 (with `S↦z`, line 1681). "C2.6" does not resolve: R07.
- HilbertModules H2 (line 179) and H3 (line 262).
- BanachAlgebras A7.CharactersAndUniqueness (line 1739: positive characters, "with no conjugation").
- AmenableGroups Layers 5 and 7. They have no Reiter condition, so D2's P₁/P₂ construction is not a re-plan.
- SelfAdjointSpectralTheory SA-A21, SA-B14, SA-B44, SA-B50, SA-B59, SA-B67, SA-B79 and SA-B85. SA-B85's C₀(X) part (lines 727–745) gives active coordinates in ℓ², as D5.Fields assumes.
- LieGroupoidsPoisson G0.
- VonNeumannAlgebras V1 (Kaplansky in strong-star form, line 478), V4.0.Fields, V4.0.Decomposition, V8, V10.ModularTheory (line 2364), V10.KMS (line 2459: the strip `0≤Im z≤1`, `F(t)=φ(α_t(x)y)`), and V11.UnitizationCharacters with the paragraph after V11.FourierUniqueness (lines 3185–3245; R01 for the revision).
- FreeProbability F3.

**At the open heads:**

- NoncompactQuantumSymmetry #1015 (a304a46): M2.FixedTwistTypeI (line 1899), the all-weights criterion (line 1905), P.2 (line 354), and M1's Borel multipliers (line 1595).
- QuantumFoundations #1771 (824bab8): §6.3 (line 724) and §6.4 (line 740).
- CStarClassification #863 (db5a0c5): CL2–CL5, §5.7 (line 974), §5.8 (line 1004), and §4.6, which uses D6's `O_n`.
- MetaplecticAutomorphicForms #1063: §1.2 (line 357).
- OperatorKTheory #866, CompactQuantumMetricSpaces #1155 and HeisenbergImprimitivity #1149 are at the heads r21 checked: 1377338, 7db4c19 and a9eeb6e.

None of these is a supplier.

### Ownership by object

I ran `roadmaps grep` on the open heads and main for:

- Takai: OperatorKTheory consumes D4, at its lines 249 and 1943.
- the uniform Roe algebra, Powers groups, the quasi-local algebra and strong subadditivity: found only here.
- Green imprimitivity: NoncompactQuantumSymmetry consumes D3.
- Cuntz algebras: OperatorKTheory line 251, CategoricalOperatorAlgebras line 54 and CStarClassification §4.6 all name D6 as the owner of `O_n`.
- relative entropy: Subfactors §2.6 has only the inclusion entropy; the matrix entropy is Tau Ceti's (R03).

### Adversarial table

Rows 1–18 cover the headline theorems, rows 19–23 the seeded targets, rows 24–32 conventions across the layers, and rows 33–38 the targets touched by findings.

| # | Statement (README line / Lean) | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | `exists_integratedOperator` (Lean 94; 639–647) | G=ℤ, counting μ; `f=δ_0⊗a+δ_1⊗b`; `f(n)=2^(−|n|)a`; μ=0 | `T=π(a)+π(b)U`, `‖T‖≤‖a‖+‖b‖`; `Σ‖f(n)‖=3‖a‖`; μ=0 gives T=0 and bound 0 | holds | none |
| 2 | `exists_covariantRepresentation_integratedFull` (Lean 107; 666–672) | H=0; G trivial, `A=ℂ²`, `L(x,y)=x`; L=0 on ℂ | any pair on 0; `π=L`, `U=1`; L=0 is degenerate and excluded by hL | holds (Williams 2.40, p. 59) | none |
| 3 | `fullCrossedProductMap_exact` (Lean 122; 686–695) | G trivial, `A=ℂ²`, `I=ℂ⊕0`; I=A; I=0 | `0→ℂ→ℂ²→ℂ→0`; B=0, so the kernel is everything = range of an iso; q injective, first map from 0 | holds (Williams 3.19, p. 93) | none |
| 4 | `CentralCocycle.cocycle` (Lean 153; 878) | ℤ/2, `ω(a,a)=−1`, r=s=t=a; (s,s⁻¹,s) | `α̃(ω(a,a))ω(a,e)=−1=ω(a,a)ω(e,a)`; `α̃_s(ω(s⁻¹,s))=ω(s,s⁻¹)` | holds, with the inverse law of line 886 | none |
| 5 | Twisted star (898) and `i_G(t)*` (968) | from `U_s*=π̃(ω(s⁻¹,s)*)U_(s⁻¹)`; ℤ/2 | substituting s↦s⁻¹ gives `c(s)ω(s,s⁻¹)*α_s(f(s⁻¹)*)`; `(δ_a)*=−δ_a`, `u_au_a*=1` | holds | none |
| 6 | `exists_centralIntegratedOperator` (Lean 194; 927–930) | ω=1; ℤ/2, `ω(a,a)=−1`, `f=δ_a⊗1` | reduces to row 1; `T=U_a`, `T²=−1`, `‖T‖=1≤1` | holds | none |
| 7 | Regular `V^ω` projective law (943, 947) | general central ω | the cocycle at `(s,t,t⁻¹s⁻¹r)` gives `ω(s,s⁻¹r)α̃_s(ω(t,·))=ω(s,t)ω(st,(st)⁻¹r)`, so `V_sV_t=Π̃(ω(s,t))V_(st)` | holds | none |
| 8 | `injective_integratedFull_regular_of_amenable` (Lean 213; 1320–1327) | ℤ; F₂ with `h=Σ` of the generators and inverses; `ρ=id⊕0` | `‖λ(f)‖=sup|f̂|`; trivial character 4 ∉ `σ(λ(h))`; the zero summand leaves the kernel unchanged | holds; amenability needed | none |
| 9 | `transitive_commutant_scalar` (Lean 229) | I={p,q} swapped; I one point, F empty | `(f(p)−f(q))T_pq=0` kills off-diagonals, the swap forces `d_p=d_q`; 1×1 is scalar | holds | none |
| 10 | Irrational-rotation generators (1413; Check 1429) | `n·x=x−nθ` | `(uvξ)(n)=e^(2πi(x−(n−1)θ))ξ(n−1)`, `(vuξ)(n)=e^(2πi(x−nθ))ξ(n−1)`: ratio `e^(2πiθ)`; positive rotation `e^(−2πiθ)` | holds | none |
| 11 | `exists_powers_partition` (Lean 250; 1590–1596) | F={b}, L=2, `w=ab²`; ℤ with F={1}, N=3; N=0 | `wbw⁻¹=aba⁻¹`; `(aba⁻¹)c` starts with a; `b^jD` has exactly j leading b's; density ≥½ three times exceeds 1 | holds; N=0 vacuous | none |
| 12 | Powers estimate (1604) | general; N=1 | `‖ΣP_jT_j‖≤√N‖x‖` and `‖Σ(1−P_j)T_jP_j‖≤√N‖x‖` give `2‖x‖/√N`; N=1 gives 2‖x‖ | holds (de la Harpe line 488) | none |
| 13 | `reducedFreeGroup_isSimpleRing` (Lean 271) | `FreeGroup (Fin 1)` | `C*_r(ℤ)=C(𝕋)` has the proper ideal `{f:f(1)=0}`, so a≠b is needed | holds | none |
| 14 | `reducedFreeGroup_trace_unique` (Lean 282) | x=λ(g), g≠1; x=1; rank 1 | τ=`⟨δ_1,δ_g⟩=0`; τ(1)=1; `ev_z` are distinct traces on C(𝕋) | holds | none |
| 15 | `exists_fullGroupCStarAlgebra_equiv_zeroAtInfty_dual` (Lean 299; 2057–2065) | ℤ/2; ℤ; S₃ | `δ_a↦(1,−1)`, `‖δ_e+δ_a‖=2`; `(f*)^=conj f̂` by inversion invariance; `δ_1↦z`; `C*(S₃)` is not commutative | holds | none |
| 16 | `exists_fullGroupCStarAlgebra_dual_equiv_zeroAtInfty` (Lean 315; 2078–2088) | G=ℤ, Ĝ=𝕋, normalized ν; ν↦cν | `f(z)=z^(−m)` gives `t↦[t=m]`; with cν, f represents cf | holds | none |
| 17 | `lcaWeyl_classification` (Lean 337; 2184–2198) | ℤ/2; ℤ; ℤ/3; general Schrödinger; E=0 | `U_aV_χU_a*=diag(−1,1)`; `U_sV_zU_s*=z̄^sV_z`; `U_1V_χU_1*=ω⁻¹V_χ`; `χ(s⁻¹t)=conj χ(s)χ(t)`; ι=∅ | holds; equivalent to Williams Def. 4.26 | none |
| 18 | `exists_residue_family` (Lean 361; 2779–2799) | n=1; n=2, `b_3`; shift family | `S_0=Id`; `S_0*b_3=0`, `S_1*b_3=b_1`, sum `b_3`; `S_1*S_0=S_1*≠0` | holds | none |
| 19 | D2.BoundedSequenceTranslation (1697, 1716, 1756–1768) | `Uδ_n=δ_(n+1)`; p = `M_(1_(2ℤ))` | `UM_fU*δ_n=f(n−1)δ_n`; `E_ijδ_n=[n=j]δ_i`, opposite shift `δ_(2i−j)↦δ_i`; band sum `=⟨δ_i,Tδ_j⟩`; `UpU*=1−p`, `χ(p)=½`; `1∈R`, `1∉K(H)` | holds | none |
| 20 | `Prim(R)` (1739–1743) | closed ideals 0 and `q⁻¹(J')` | hulls: all, and `hull_Q(J')`; opens ∅ and `{η}∪O`; {η} open and dense | holds | none |
| 21 | D2.SequenceToeplitz (1777–1846) | `1`, `1_[0,∞)`, `eUe` | `lim_(−∞)1=1`, so `1∉C₊`; `ℓ₊(1_[0,∞))=1`; `eUeδ_n=δ_(n+1)`; `1−SS*` onto δ_0; `eKe≠0` makes e full; `ev_z∘q(E_nn)=0` | holds (Arici–Mesland p. 3) | none |
| 22 | Saddle flow (1865–1897) | branch xy=r; `{x>0,|xy|<ε}`; `{|xy|<ε}` | branch `{(u,r/u)}` closed; the first set is saturated, open and misses the origin; every neighbourhood of the origin holds all half-axes; +x and +y meet in Q1 | T₀, not T₁, not T₂ | none |
| 23 | D5.Fields (2424–2450) | point; N=ℕ; `N(x)` jumping at ½; non-Borel S; 1 vs `E_00` | `H(x_0)`; `L²(X;ℓ²)`; `E_10e_0=e_1∉span{e_0}`, `E_01e_0=0`; `1_Se_0` not measurable; equal on span{e_0} | holds (Williams pp. 405, 409) | none |
| 24 | ℤ/2 cochain and `E_ω` (1033–1039, 1125–1130) | `b(a)=i` | `ω^b(a,a)=i·i·(−1)=1`; `(iδ_a)²=δ_e`; `ψ_b` multiplicative; `(1,a)²=(−1,e)`; `(i,a)²=(1,e)` | holds | none |
| 25 | TwistedBorel weight (1194–1196, 1226) | `F_f=z̄f(s)` | `F_f*F_g=z̄f(r)g(r⁻¹s)ω(r,r⁻¹)ω̄(r⁻¹,s)=F_(f*_ωg)`; the z weight gives ω̄ | holds | none |
| 26 | D3 modular factor (1979–1983) | `ax+b`, dilation H | `⟨f,g⟩*=Δ_GΔ_H⁻¹γ_H⁻²⟨g,f⟩`, so `γ_H²=Δ_G/Δ_H` | holds | none |
| 27 | Group and transformation-groupoid dictionaries (2353–2358, 2526) | one unit; G acting on X | `(Δ^(1/2)f)*(Δ^(1/2)g)=Δ^(1/2)(f*g)`; both stars give `Δ^(−1/2)conj f(s⁻¹)`; the `(g,x)` convolution matches | holds | none |
| 28 | Strip compositions (2899, 2995–2998) | β>0 | `z↦−βz+iβ` gives `F(t)=ω̄(τ̄_(−βt)(y)x)`, `F(t+i)=ω̄(xτ̄_(−βt)(y))`; `w↦i−w/β` gives the boundary values `φ(yτ^P_s x)` and `φ(τ^P_s(x)y)` | holds | none |
| 29 | Araki in `M_2` (3022–3043) | `K=diag(0,1)`, `P=−K` | `Ω^Q=e^(−β(K+P)/2)/√Z_K`; `log Δ_(Ω^Q)=L−R` of `−β(K+P)`; `u_t=diag(1,e^(iβt))`; `Ad(u_t)∘τ_(−βt)=id` | holds | none |
| 30 | KMS sign (3003–3008) | `a=E_12`, `b=E_21` | `ω(aτ_(iβ)b)=e^(−β)/(1+e^(−β))=ω(ba)`; opposite sign gives `e^β/(1+e^(−β))` | holds | none |
| 31 | CAR and Weyl signs (3205–3234) | `a=E_12`; `h₀=ε`; `V=ℝ²` | `a*a+aa*=1`; `ω(a*a)=1/(e^(βε)+1)`; `W(se_1)W(te_2)=e^(−ist)W(te_2)W(se_1)`; Gram determinant `1−e^(−‖f‖²/2)>0` | holds | none |
| 32 | Ising, on-site, GHZ (3373–3388) | `hσ_3`, `Jσ_3⊗σ_3` | `M_λ=|h|+2|J|e^λ`, `M_(λ,2)=|h|+8|J|e^λ`, bound `1/(2+16e)`; `s−βe_Φ=log 2cosh βh=p`; `0+log 2≤2log 2` | holds | none |
| 33 | V11 citation at #1041 (R01) | c0dc59f lines 3461–3497; ℤ/3, `f=δ_1` | FourierInversion has `conj(γ(x))`: `(1/3)Σχ(1−x)=[x=1]`; `Fλ(f)F*=M_f̂` | same content, new id | R01 |
| 34 | Strong subadditivity and automatic continuity (R02) | GHZ; product state; Hamel map; `id:ℝ→ℝ_d` | `0+log 2≤log 2+log 2`; equality for product states; Hamel map is not Borel; `ℝ_d` is not separable | both probes elaborate | R02 |
| 35 | Tau Ceti entropy (R03) | `diag(1,0)` vs `diag(0,1)` and `diag(½,½)`; GHZ_AB | `⊤` (kernel not contained); `log 2`; `S(AB)=log 2≤S(A)+S(B)=2log 2` | the same object as Tau Ceti's | R03 |
| 36 | `ℓ∞(ℤ)` C*-structure (R04) | `inferInstance` | `CStarAlgebra (lp (fun _ : ℤ => ℂ) ∞)` is found; `‖f*f‖=‖f‖²` by `CStarRing` | Mathlib's | R04 |
| 37 | `q(U)=z` (R05) | z∈𝕋 | `(ℓ₊, n↦zⁿ)` is covariant since `ℓ₊(α_kf)=ℓ₊(f)`, so q is continuous; exactness needs `C*(ℤ)→C(𝕋)` injective (D4.Harmonic at ℤ) | dependency on a later layer | R05 |
| 38 | Kesten value (R08) | F₂, `|S|=4` | `‖λ(h)‖=2√3≈3.464`; p. 16 gives `σ(h/4)⊆[−1,1−ε]` only | the locator supports `4∉σ(λ(h))` | R08 |

### Remarks that need no change

- The six `gap:` slugs each name a section on main that already plans the content (CStarAlgebras C1–C8, HilbertModules H3), so they act as exact supplier citations. The board package has no `design/plan.json`, as in earlier rounds.
- CStarClassification #863, line 51, says that OperatorKTheory K7 "owns the Cuntz algebras `O_n`". Its own §4.6 and OperatorKTheory line 251 give D6 as the owner, which is consistent with this roadmap; the wording belongs to that pull request.

## Not verifiable

- **Brown–Ozawa, Proposition 5.1.3** (D2.BoundedSequenceTranslation), **Cuntz 1977, §1** (D6), **Bratteli–Robinson, vols. 1–2** and **Renault, LNM 793.** The manifest settles these as uncertified, cited by locator. The claims of the seeded targets that rest on them were checked by computation instead: rows 18–21.
- **Araki 1973.** The cache file is present, but its Propositions 4.1–4.12 were not in this round's sample. The finite-dimensional consequences are checked in row 29.
- **Takeishi, Sims–Williams, Muhly–Williams, Sims (2017), Delfín–Farsi–Packer.** These are cached but outside the seeded sample, and were not re-read this round.

## Source issues

- **Misprint** in williams-cpcsa-draft31 at the paragraph before Lemma 4.28 and in its proof, p. 136 (cache lines 8657–8724): the source defines `s·ϕ(γ)` as `γ(s)ϕ(γ)` and moves `R_s` past `S_γ` with the factor `γ(s)`; it should be `conj(γ(s))` (that is, `γ(s⁻¹)`), which (4.62) and Definition 4.26 require; affects the proof.
