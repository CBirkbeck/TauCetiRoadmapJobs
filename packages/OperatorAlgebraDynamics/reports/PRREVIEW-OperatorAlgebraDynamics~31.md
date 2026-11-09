# Review of OperatorAlgebraDynamics (pull request #1137 at df96497)

**Verdict:** needs changes

This is a full review of head df96497, the same head the previous review read: nothing in the folder changed. I read all 4079 lines of `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` and all 417 lines of `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean`, and recomputed every Check. I reran the gate, the dependency check, the elaboration, `#check @name` on all 18 declarations and the one-tactic probe.

The mathematics holds up: no statement is false, every Check I recomputed is correct, and the sampled locators resolve. There are five findings:

- **R01 (P2).** Open pull requests #1015 and #1771 also claim three Fock-space objects that D8 owns: the permutation unitaries, the projections onto `Symⁿ`/`Λⁿ`, and the cyclicity of the Fock vacuum.
- **R02 and R03 (P3).** Carried from the previous review: the branch deletes six files of other roadmaps, so the gate fails, and the description states no merge order with #1187.
- **R04 and R05 (P3).** New: a phase-convention Check that cannot tell the conventions apart, and one Attal page locator.

No acceptance is possible while the gate fails.

## Previous findings (review of df96497)

- **R01 (six files outside the folder deleted): not repaired.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/OperatorAlgebraDynamics'` still lists the six deletions (159 lines). The merge commit 4133234f dropped them. Carried as R02.
- **R02 (no stated order with #1187): not repaired.** The description's last line is unchanged: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1097, #1771, #1015, #863". Carried as R03.

The package's `reports/` directory holds review and gate reports only, with no repair report. So no finding was marked `not actionable in this package`.

## R01 (P2) — D8's permutation unitaries, `Symⁿ`/`Λⁿ` projections and vacuum cyclicity have second owners in open roadmaps

**Location.** README lines 3292–3297: "whose `commIsometry` gives, for each permutation σ of n letters, the permutation unitary `U_σ` … `Λⁿ(h)` is the range of the antisymmetrizing projection `P_a=(1/n!)Σ_σ sgn(σ)U_σ`". Lines 3445–3446 do the same for `P_s`. Line 163: "D8 is the single owner of … the cyclicity of its vacuum". Lines 3469–3472 prove that cyclicity.

**Claim.** Two open roadmaps own the same objects: one builds the same operators on the same carrier, the other proves the same theorem.

- **NoncompactQuantumSymmetry (#1015).** P.6 builds the permutation unitaries and both symmetrizing projections on VonNeumannAlgebras V2's completed tensor powers. QuantumFoundations §6.2–§6.3 (#1771) consumes NoncompactQuantumSymmetry's operators, not D8's.
- **QuantumFoundations (#1771).** §6.4 proves the Fock vacuum cyclicity itself. The previous review recorded this half only as a remark. It is raised here because the brief makes any object owned by this roadmap and an open roadmap a P2 finding.

**Witness.**

- #1015, `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md` line 657 (`### P.6`), lines 660–664: "define `U_σ(⊗_i v_i)=⊗_i v_(σ⁻¹i)` … `P₊=(1/n!)Σ_σU_σ` and `P₋=(1/n!)Σ_σ sgn(σ)U_σ` … define `Symⁿ(H)` and `Λⁿ(H)` as their ranges".
- #1771, `TauCetiRoadmap/QuantumFoundations/README.md` line 742: "Prove bosonic vacuum cyclicity". The same file lists it as its own at lines 15 and 745, and line 711 consumes NoncompactQuantumSymmetry P.6.

**Repair.** This roadmap is on main and both open roadmaps already consume it. So it is the owner, and it may not cite either of them (on main it consumes only main, and the citation would also close a cycle). Every edit except the last belongs to the other two pull requests, which have the same author:

- In #1015, P.6 cites OperatorAlgebraDynamics D8 for `U_σ`, `P_±`, `Symⁿ(h)` and `Λⁿ(h)` instead of constructing them.
- In #1771, §6.2–§6.3 take those operators from D8. At line 742 "Prove bosonic vacuum cyclicity" becomes a citation of D8, and lines 15 and 745 drop "vacuum cyclicity".
- In this folder, the NoncompactQuantumSymmetry consumer bullet (lines 3843–3853) adds that P.6 takes D8's `U_σ` and the projections onto `Symⁿ(h)` and `Λⁿ(h)`. The QuantumFoundations bullet (lines 3919–3930) adds §6.2 for the same operators.

After these edits only D8 constructs `U_σ` (the left-action law `U_σU_τ=U_(στ)` recomputed in row 22) and proves cyclicity (row 21).

## R02 (P3) — The branch deletes six files of other roadmaps, so the gate fails

**Location.** Outside the folder:

- `TauCetiRoadmap/FiniteGroupExtensionSplitting/PROGRESS.md` and `STATUS.md`
- `TauCetiRoadmap/LieGroupoidsPoisson/PROGRESS.md` and `STATUS.md`
- `TauCetiRoadmap/PrimitivePrimeDivisors/PROGRESS.md` and `STATUS.md`

Carried from the previous review's R01.

**Claim.** The pull request removes files that main carries and that belong to other roadmaps. Merging it would delete them from main.

**Witness.** `git cat-file -t origin/main:TauCetiRoadmap/FiniteGroupExtensionSplitting/PROGRESS.md` gives `blob`. At 4133234f (the merge of main) and later the path does not exist. My gate run at this head: `outside-folder=6 … FAIL`, every other check 0.

**Repair.** In a new commit, run `git checkout origin/main -- <the six paths>`. The diff against main is then confined to `TauCetiRoadmap/OperatorAlgebraDynamics/`, and the gate's outside-folder check passes.

## R03 (P3) — The description states no merge order with #1187, which changes this `Suggested.lean`

**Location.** The last line of the pull-request description: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1097, #1771, #1015, #863". Carried from the previous review's R02.

**Claim.** #1187 changes this roadmap's `Suggested.lean`, the two heads conflict, and neither description says which merges first. The line also has two other problems:

- It names #1097, which is not in the open index.
- It calls #1771, #1015 and #863 revisions of roadmaps on main. They are new roadmaps, and this README cites them only as deferrals and consumers, so none is a dependency.

**Witness.**

- `scratch/overlaps.md`: "#1137 and #1187 conflict in … `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean`".
- `roadmaps show OperatorAlgebraDynamics --pr 1187 --file Suggested.lean` still prints an old file with `Mathlib.*` sub-imports.
- `roadmaps list` has no #1097.

**Repair.** State the order in the description. Either #1187 merges first and this branch is rebased and re-elaborated at its Tau Ceti pin, or this pull request merges first and #1187 drops its OperatorAlgebraDynamics hunk. Remove the revision-dependency line, or reduce it to the dependencies that actually exist (none, per the overlap data).

## R04 (P3) — The bicharacter phase Check cannot tell `ω(x,x)` from its inverse, and the prose around it misstates the adjoint phase

**Location.**

- Lines 1108–1110: "so the scalar star can also be written `f*(x)=overline(f(−x))ω(x,x)`; the adjoint of Π_x instead has the factor `overline(ω(x,−x))`".
- Check at lines 1145–1149: "for `M=ℤ/2` the values are `±1` … differs from the adjoint phase `overline(ω(x,−x))` only by the stated inverse".

**Claim.** The Check is meant to fix the phase conventions of the Schrödinger family, which HilbertModules' HeisenbergImprimitivity consumes (line 3873, "adjoint phase"). It fails in two ways:

- At `M=ℤ/2` every value is ±1, so `ω(x,x)`, `ω(x,x)⁻¹`, `conj(ω(x,x))` and `ω(x,−x)` coincide. A wrong convention passes it.
- In general the two phases are equal, `overline(ω(x,−x))=ω(x,x)`. So "instead" and "differs … by the stated inverse" are wrong.

**Witness.** Take `M=ℤ/3`, `x=(1,ψ)`, `ψ(1)=ζ=e^(2πi/3)`.

- The phases: `ω(x,x)=ζ` and `ω(x,−x)=ω(−x,x)=ζ²`.
- The adjoint on `L²(ℤ/3)`: `(Π_x*η)(s)=ζ^(1−s)η(s−1)=ζ(Π_(−x)η)(s)`.
- The star at line 1079: `δ_x*=conj(ω(−x,x))δ_(−x)=ζδ_(−x)`.

Both phases are ζ. The convention `ω(x,−x)` would give ζ², and the ℤ/2 Check cannot see the difference.

**Repair.**

- At lines 1108–1110 write "the adjoint of Π_x has the same phase, `overline(ω(x,−x))=ω(x,x)`".
- Replace the Check at lines 1145–1149 with the ℤ/3 computation above: `Π_x*=ζΠ_(−x)` and `δ_x*=ζδ_(−x)` with `ζ=ω(x,x)=conj(ω(x,−x))`, while the phase `ω(x,−x)=ζ²` is excluded.

Recomputed in row 20.

## R05 (P3) — An Attal locator starts one page late

**Location.** References, lines 4037–4040: "Definitions 8.19–8.20 with (8.16)–(8.18), Proposition 8.21 and Proposition 8.23 (pp. 18–19)".

**Claim.** Definition 8.19, the Euclidean group of H, begins on p. 17.

**Witness.** `attal-fock` line 639 has Definition 8.19 under the page header "8 FOCK SPACES 17" (line 616). Definition 8.20 is at line 654, on p. 18.

**Repair.** Write "(pp. 17–19)". The in-text locators at lines 3459–3460 (Definition 8.20 and Proposition 8.21, p. 18; (8.18), p. 19) are correct and stay.

## Verified sound

### Gate, dependency check, elaboration, signatures and probe

- **Gate**, run at df96497: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=6 source-material=0 FAIL` (R02). The worker's run adds `build=0`.
- **Dependency check.** Output `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Suppliers.** Every *Needs:* line and Dependencies list names only roadmaps on main: BanachAlgebras, CStarAlgebras, HilbertModules, VonNeumannAlgebras, AmenableGroups, LieGroupoidsPoisson, OperatorTheory/SelfAdjointSpectralTheory, RepresentationTheory/CompactGroups, RepresentationTheory/SpinRepresentations and Completed/OneParameterSemigroups.
- **Deferrals and consumers only.** These roadmaps are not on main and are never named as suppliers: MetaplecticAutomorphicForms #1063, NoncompactQuantumSymmetry #1015, OperatorKTheory #866, CStarClassification #863, QuantumFoundations #1771, HeisenbergImprimitivity #1149, CompactQuantumMetricSpaces #1155, RelativisticQuantumFieldTheory #1772 and CategoricalOperatorAlgebras #888.
- **Fine build order.** D2.SequenceToeplitz needs D4.Harmonic, and D4.Harmonic needs only D2's `injective_integratedFull_regular_of_amenable`. The target graph is acyclic, and "How to read the build" (lines 651–654) states this order, the form an earlier review accepted.
- **Elaboration.** `lake env lean` on a scratch copy, 11.7 s, exit 0, 15 `declaration uses sorry` warnings (lines 103, 116, 131, 203, 222, 237, 253, 274, 295, 306, 323, 339, 361, 385, 408) and nothing else.
- **Signatures.** I ran `#check @name` on all 18 declarations in one scratch file and compared each with the README. No binder is lost:
  - both integrated-operator theorems carry `μ.InnerRegularCompactLTTop`;
  - `exists_covariantRepresentation_integratedFull` has `H : Type (max u v)` and `IsHaarMeasure`;
  - `fullCrossedProductMap_exact` has `IsClosed ↑I`, invariance, surjective q and `ker q = I`;
  - `injective_integratedFull_regular_of_amenable` has `Amenable G`, `IsHaarMeasure`, `Regular` and an injective ρ;
  - `lcaWeyl_classification` has both strong continuities and the phase `starRingEnd ℂ ↑(χ s)`;
  - `exists_residue_family` has `HilbertBasis ℕ ℂ H` and `0 < n`;
  - `vonNeumannEntropy_strong_subadditivity` has `ρ.PosSemidef` and no trace normalisation.
- **One-tactic probe.** Each `sorry` replaced by `first | rfl | simp | infer_instance | trivial | decide | aesop`: all 15 fail (errors at lines 110, 124, 141, 212, 227, 244, 264, 281, 298, 315, 332, 349, 376, 397, 414).
- **File form.** `generatedCStarAlgebra` has a real body, and the two structures contain no `sorry`. The imports are `import Mathlib` plus eight `TauCeti.*` modules that exist at the pin. There is no `set_option`, `lemma`, `#eval` or process comment.

### Headline theorems

**Stated** in `Suggested.lean`:

- the L¹ integrated form and its twisted analogue;
- recovery of the covariant pair;
- full ideal exactness;
- automatic continuity;
- amenable faithfulness of the regular representation;
- the orbit commutant;
- the Powers partition, simplicity and unique trace of the reduced C*-algebra of a free group;
- `C*(G)≅C₀(Ĝ)` and `C*(Ĝ)≅C₀(G)`;
- the LCA Weyl classification;
- the residue Cuntz family;
- strong subadditivity.

**Named in the module docstring as not statable** (lines 49–80), each with its missing carrier:

- the reduced crossed product and the multiplier universal property;
- `A⋊_idG≅A⊗_maxC*(G)` and Takai duality;
- `A⋊_(α,ω)G` and `C*(G,ω)`;
- Mackey's topology;
- Green and symmetric imprimitivity;
- groupoid algebras and universal `O_n`;
- the KMS simplex and Araki's `Ω^Q`;
- CAR/Weyl, quasi-free states and the thermodynamic limit.

I found no statable headline missing and none forced through a stand-in.

### Seeded sample

- **Worked example: the saddle flow (lines 1987–2022).** Under `t·(x,y)=(e^t x,e^(−t)y)` the product `xy` is invariant.
  - **Orbits.** The orbits are the origin, the four open half-axes and the branches `{(u,xy/u):ux>0}`. `(1,1)` gives `{(u,1/u):u>0}`, `(−1,−1)` gives `{(u,1/u):u<0}` and `(1,−2)` gives `{(u,−2/u):u>0}`. Each branch is closed, and each half-axis has closure itself plus the origin.
  - **Neighbourhoods of a half-axis point.** A saturated open set containing `(1,0)` contains a ball, hence the points `(1,y)` with `|y|<δ`, hence the Q1/Q4 branches with `r<δ`. `{x>0,|xy|<ε}` is saturated, open and misses the origin.
  - **Neighbourhoods of the origin.** At the origin `{|xy|<ε}` contains all four half-axes.
  - **Separation.** The quotient is T₀ but not T₁ (every neighbourhood of the origin contains the half-axis points). It is not Hausdorff: the +x and +y neighbourhoods share the Q1 branches with `r<ε`.
  - **Topology on branches.** `(x,y)↦xy` is open on each open quadrant.
  - **Source.** No locator is needed (Mathlib only). All four Checks are correct.
- **D5.Fields (lines 2505–2588).**
  - **Locators.** Williams, Definition E.16 and Theorem E.17, are at `williams-cpcsa-draft31` lines 23770 and 23776 (PDF p. 417, printed p. 405). E.17's hypotheses are separable H, second-countable LCH X and finite μ, the same as D5.Fields'. Definition F.1 is at line 23897, printed p. 409. The nonzero-fibre assumption opens §F.1 at line 23893, and line 23881 states the separability standing assumption of Appendix F.
  - **The seven Checks**, recomputed:
    1. A point gives `H(x_0)`.
    2. `N=ℕ` gives `L²(X;ℓ²)`, and `N={0}` gives `L²` and `L∞`.
    3. With the jump at ½: `E_10e_0=e_1∉span e_0` excludes the constant `E_10`, while `E_01e_0=0` admits `E_01`.
    4. A non-measurable S gives the non-measurable section `1_Se_0`.
    5. `1` and `E_00` agree on `span e_0`.
    6. `S=[0,½]` gives `≅L²(S)`, with φ and ψ equal as operators iff φ=ψ a.e. on S.
    7. Empty X gives 0.
- **Concrete Cuntz families (lines 2965–3001).** `⟨b_m,S_jb_k⟩=[m=nk+j]` gives `S_j*b_m=[m mod n=j]b_(m div n)`.
  - `S_i*S_jb_k=S_i*b_(nk+j)=δ_ijb_k`, and `Σ_jS_jS_j*b_m=S_(m mod n)b_(m div n)=b_m`.
  - n=2 at `b_3`: `S_0*b_3=0`, `S_1*b_3=b_1`, and the sum is `b_3`.
  - n=1: `S_0=Id`.
  - The shift family has `S_1*S_0=S_1*≠0`.
  - `WS_jW*b'_k=b'_(nk+j)`.
  - In finite dimension, n≥2 orthogonal copies of H≠0 cannot fit.
  - The Lean statement is true and has the README's generality: an ℕ-indexed Hilbert basis is the same as separable and infinite-dimensional. The *Needs:* line is Mathlib only.
  - Cuntz §1 is uncertified (Not verifiable).

### Sources read this round

- **`williams-cpcsa-draft31`.**
  - Proposition 2.40 (line 3988; requires nondegenerate pairs, as the Lean does).
  - Proposition 3.1 (line 5398).
  - Proposition 3.19 (line 6050; invariant ideal, full exact sequence).
  - Theorem 4.24 (line 8504, printed p. 133).
  - Definition 4.26 (line 8646, p. 135): `S_γR_s=γ(s)R_sS_γ`, which with `s↦s⁻¹` is the README's `U_sV_χU_s*=conj(χ(s))V_χ`.
  - Lemma 4.28 (line 8678).
  - Theorem 4.29 (line 8788, p. 137).
  - Theorem 7.13 (line 12297; amenable G, π faithful ⇒ `π̃⋊λ` faithful).
  - Theorem D.11 (line 21995; G and H separable metric groups, G Polish, the Lean classes).
  - E.16, E.17 and F.1 as above.
- **`delaharpe2007`.**
  - Definition 9 (line 323, p. 7): word for word the partition condition of `exists_powers_partition`, with N≥1 (the Lean's N=0 is vacuous).
  - Corollary 12(i) (line 368, p. 8).
  - Theorem 14's proof (lines 424–497, pp. 10–11): the invertible element within distance 1 of the unit, the projections `P_j` onto `ℓ²(γ_jD)` and the bound `2‖X′‖/√N` at line 494.
  - Kesten (lines 712–725, p. 16): the spectrum of `(1/d)Σ_sλ(s)` lies in `[−1,1−ε]`.
  - The Dixmier property remark (lines 856–878, p. 19).
- **`arici-mesland2019`.** Definition 2.1 (line 114) and extension (4) (line 122), both on p. 3.
- **`attal-fock`.**
  - Definition 8.3 and the dimension `2ⁿ` (lines 225 and 259, p. 7).
  - Definition 8.4, Proposition 8.5 and Corollary 8.6 (lines 268, 279 and 317, p. 8).
  - Definitions 8.11–8.12 (p. 12).
  - Proposition 8.13 (line 475, p. 13): `‖b(u)‖=‖b*(u)‖=‖u‖`.
  - Definitions 8.19–8.20 and (8.16)–(8.18) (pp. 17–19; R05).
  - Proposition 8.23 (line 699, p. 19).
  - At `u=if/√2`, Attal's `W_αε(v)=e^(−‖u‖²/2−⟨u,v⟩)ε(v+u)` gives `−⟨u,v⟩=i⟨f,v⟩/√2`, which is D8's formula.
- **`nielsen-petz2005`.** Inequality (1) at line 28, p. 1.
- **`araki1973`.** Located Proposition 4.1 (line 236), 4.3 (323), Corollary 4.4 (385), 4.5 (419), 4.6 (446), 4.8 (467) and 4.12 (578).

### Adversarial table

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | `exists_integratedOperator` (689–697) | ℤ counting; G trivial | `δ_0⊗a+δ_1⊗b↦π(a)+π(b)U`; `f(n)=2^(−|n|)a`: `‖f‖₁=3‖a‖`; trivial G gives `π(f(e))` | holds | none |
| 2 | `exists_covariantRepresentation_integratedFull` (716–727) | G trivial, A=ℂ²; L=0 on H≠0 | `(x,y)↦x` recovered with π=L, U=1; L=0 is excluded by `hL` | holds | none |
| 3 | `fullCrossedProductMap_exact` (736–745) | G trivial; A=ℂ², I=ℂ⊕0; I=A | `0→I→A→A/I→0`; `C*(G)→C*(G)²→C*(G)`; B=0 and the first map onto | holds | none |
| 4 | `CentralCocycle` (924–931; Lean 151–170) | ℤ/2, A=ℂ, `ω(a,a)=−1`; trivial action on `M_2` with `ω(a,a)=diag(1,−1)`; A=0 | at r=s=t=a both sides −1; the `M_2` case passes every field but `central` (`diag(1,−1)E_12=E_12`, `E_12diag(1,−1)=−E_12`); on `M(0)=0` every field holds | holds | none |
| 5 | Busby–Smith exclusion (1136–1144) | `α_a=Ad(diag(1,i))` | `α_a²=Ad(diag(1,−1))`, `E_12↦−E_12`: not an action of ℤ/2 | holds | none |
| 6 | `exists_centralIntegratedOperator` (978–981) | ω=1, ℤ counting | reduces to row 1 | holds | none |
| 7 | `continuous_of_measurable_monoidHom` (1190–1205) | Williams D.11; Hamel map | source: G Polish, H separable metric, the same classes; a ℚ-linear non-ℝ-linear map is discontinuous, hence not Borel | holds | none |
| 8 | `injective_integratedFull_regular_of_amenable` (1427–1434) | ℤ; F₂, `h=Σδ_(s^±)`; `ρ=z⊕0` | `‖λ(f)‖=sup|f̂|`; `χ_triv(h)=4`, `σ(λ(h)/4)⊆[−1,1−ε]` (de la Harpe p. 16); same kernel as the essential part | holds | none |
| 9 | `transitive_commutant_scalar` (1489–1499) | ℤ/2 on {p,q}; singleton I | `(f(x)−f(y))T_xy=0` kills the off-diagonal entries; `T U_g δ_y=d(gy)δ_(gy)` against `d(y)δ_(gy)`; for a singleton, F may be empty and T is scalar | holds | none |
| 10 | `exists_powers_partition` (1690–1703) | F=∅, N=2; F={b}, L=2; ℤ, N=3 | `w=ab²`: `wbw⁻¹=aba⁻¹`; `f′C` starts with a, so lies in D; `b^jD` has exactly j leading b's; for ℤ, D has density ≥½ and 3 disjoint translates are impossible | holds | none |
| 11 | `reducedFreeGroup_isSimpleRing` (1730–1744) | singleton basis; full `C*(F₂)` | `C(𝕋)` not simple (excluded by a≠b); `u−1∈ker χ_triv` with `λ(u)δ_1−δ_1≠0` | holds | none |
| 12 | `reducedFreeGroup_trace_unique` | `τ(λ(g))` | `⟨δ_1,δ_g⟩=[g=1]`; on `C(𝕋)` every point evaluation is a trace (excluded by a≠b) | holds | none |
| 13 | `exists_fullGroupCStarAlgebra_equiv_zeroAtInfty_dual` (2183–2191) | ℤ/2; ℤ; S₃ | `f̂(χ)=f_0−f_1`, `‖δ_e+δ_a‖=2`; `δ_1↦z`; `∫(f*g)χ=∫fχ∫gχ` with no conjugate; `C*(S₃)=ℂ²⊕M₂` | holds | none |
| 14 | `exists_fullGroupCStarAlgebra_dual_equiv_zeroAtInfty` (2204–2214) | ℤ; ν↦cν | `C*(𝕋)≅c₀(ℤ)`, unitary at z ↦ `n↦zⁿ`; f with respect to cν is cf with respect to ν | holds | none |
| 15 | `lcaWeyl_classification` (2310–2324) | Schrödinger pair; ℤ/3; E=0 | `U_sV_χU_s*ξ(t)=χ(s⁻¹t)ξ(t)=conj(χ(s))χ(t)ξ(t)`; ℤ/3: `U_1V_χU_1*=ω⁻¹V_χ` but `V_χU_1V_χ*=ωU_1`; ι=∅ | holds | none |
| 16 | `exists_residue_family` (2965–2983) | n=1, 2; shift family | see Seeded sample | holds | none |
| 17 | `vonNeumannEntropy_strong_subadditivity` (3722–3730) | GHZ; 2·GHZ; `|0⟩⟨0|⊗Φ⁺` | `0+log2≤2log2`; `−2log2≤0`; `log2=log2`, and `ρ_A` in place of `ρ_AB` gives `log2≤0` | holds | none |
| 18 | Saddle-flow worked example (1987–2022) | (1,1), (−1,−1), (1,−2); `{x>0,|xy|<ε}` | see Seeded sample | holds | none |
| 19 | D5.Fields Checks (2554–2588) | point; constant; jump at ½; non-measurable S; zero fibres; empty X | see Seeded sample | holds | none |
| 20 | Bicharacter phase (1108–1110, 1145–1149) | M=ℤ/2; M=ℤ/3, x=(1,ψ), ψ(1)=ζ | ℤ/2: all phases ±1 and indistinguishable; ℤ/3: `ω(x,x)=ζ`, `ω(x,−x)=ζ²`, `Π_x*=ζΠ_(−x)`, `δ_x*=ζδ_(−x)` | the star and adjoint phases are equal; the Check cannot discriminate | R04 |
| 21 | Vacuum cyclicity (3469–3472, 3520–3526) | h=ℂ; h=ℂ², f=(1,0) | `e(g)=e(if/√2)` at `f=−i√2g`; `Σconj(c_n)gⁿ/√(n!)≡0` forces c=0; a line spans only `F_s(ℂ×0)` | holds; owned twice | R01 |
| 22 | `U_σ`, `P_a`, `P_s` (3292–3297, 3443–3446) | composition; n=2 | `(U_σU_τξ)_i=ξ_((στ)⁻¹i)`; n=2 gives `P_±=(1±flip)/2` | holds; owned twice | R01 |
| 23 | Schrödinger relation (1103–1107) | x=(m,χ), y=(n,ψ) | `Π_xΠ_yξ(t)=χ(t)ψ(t+m)ξ(t+m+n)=ψ(m)Π_(x+y)ξ(t)` | holds | none |
| 24 | Cochain direction (1027–1034, 1120–1126) | ℤ/2, `b(a)=i` | `ω^b(a,a)=i·i·(−1)=1`; `(iδ_a)*_ω(iδ_a)=−ω(a,a)δ_e=δ_e` | holds | none |
| 25 | `E_ω` (1207–1234) | ℤ/2, `ω(a,a)=−1` | `(1,a)²=(−1,e)`, order 4; `ψ_b(1,a)=(i,a)`, `(i,a)²=(1,e)` | holds | none |
| 26 | Weight projection (1295–1332) | `(z,e)` acting by `z^k` | `∫z̄z^k dz=δ_(k1)`; the z weight selects `V_sV_t=ω̄(s,t)V_(st)`, that is `C*(G,ω⁻¹)` | holds | none |
| 27 | D2.CentralTwists Checks (1642–1669) | ℤ/2; (ℤ/2)², `(−1)^(ba′)` | `u_a*=−u_a`, `u_au_a*=1`; `u²=v²=1`, `uv=u_(1,1)`, `vu=−u_(1,1)`; `τ=Tr/2` | holds | none |
| 28 | Trace property (1608–1610) | cocycle at (s,s⁻¹,s) | `ω(s⁻¹,s)ω(s,e)=ω(s,s⁻¹)ω(e,s)` | holds | none |
| 29 | D2.BoundedSequenceTranslation (1866–1880) | `E_ij`; even p | `E_ijδ_n=[n=j]δ_i`; `Uδ_n=δ_(n−1)` gives `δ_(2i−j)↦δ_i`; `UpU*δ_n=[n odd]δ_n` | holds | none |
| 30 | D2.SequenceToeplitz (1951–1967) | `e=M_(1_[0,∞))` | `1_[0,∞)∈C₊`, `ℓ₊=1`; `eUeδ_n=δ_(n+1)`; `E_nn↦0` in `ev_z∘q`; Prim = `{η}∪𝕋` | holds | none |
| 31 | D4 conventions (2226–2273) | ℤ/3 inversion; ℝ; ℤ | `(1/3)Σχ(1−x)=[x=1]`; `Real.fourierIntegral` is the transform at `χ_(−2πw)`; `ev(n)(z)=zⁿ` | holds | none |
| 32 | Dual-measure normalisation (2255–2262) | order-n group; ℝ | `Σ|δ_e^|²=n` against `‖δ_e‖²=1`; `∫|f̂|²dξ=2π∫|f|²` | holds | none |
| 33 | One-unit groupoid (2480–2495) | group G | `(Δ^½f)*(Δ^½g)=Δ^½(f*g)`; groupoid star of `Δ^½f` is `Δ^½·Δ⁻¹conj(f(s⁻¹))`; `dν⁻¹/dν=Δ⁻¹`, so D=Δ | holds | none |
| 34 | Full-shift topology (2950–2957) | n=2 | `shift^(m+1)(0^m10^∞)=0^∞`; `(0^m10^∞,0,0^∞)→` unit; `shift(0^m10^∞)≠0^∞` | holds | none |
| 35 | D7 KMS sign and Araki (3185–3225) | K=diag(0,1), `a=E_12`, `b=E_21`, P=−K | `ω(aτ_(iβ)b)=e^(−β)/(1+e^(−β))=ω(ba)`; `Ω^Q=e^(−β(K+P)/2)/√Z_K`; `u_t=diag(1,e^(iβt))`, `Ad(u_t)τ_(−βt)=id` | holds | none |
| 36 | D8 Fock Checks (3314–3329, 3499–3530) | h=ℂ; f=1, g=i; second-moment example | `‖P_a(f⊗g)‖²=‖f‖²‖g‖²/2`; `W_F(1)W_F(i)=e^(−i/2)W_F(1+i)`; fourth moment `24/32=3/4`; c≈0.4677, second moment ≈0.618, fourth moment diverges | holds | none |
| 37 | CAR automorphisms (3359–3373) | U=0, V=conj; U=1, V=conj; rotation by θ | `{a(f̄)*,a(ḡ)}=⟨f,g⟩`; `{b,b}=2`; `b²=sinθcosθ` | holds | none |
| 38 | D9 Checks (3772–3809) | Ising; on-site; d=1 | `Mλ,2=|h|+8|J|e^λ`, bound `1/(2+16e)`; `s−βe=log(2coshβh)=p`; `p=−β` | holds | none |
| 39 | Weyl `ℓ²(V)` and core argument (3407–3439) | f, g, v; signs ± | `λ(f)λ(g)δ_v=e^(−iσ(f,g)/2)λ(f+g)δ_v`; `u′=±u` with u bounded forces u=0; `e^(isx)e^(itp)=e^(i(sx+tp)−ist/2)` | holds | none |
| 40 | Attal locator (4037–4040) | Definition 8.19 | `attal-fock` line 639, page header "17" at line 616 | locator starts one page late | R05 |

### Library declarations opened at the pins (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b)

- **Mathlib.**
  - `MeasureTheory/Measure/Haar/NormedSpace.lean` line 79, `AddMonoidHom.continuous_of_measurable`: a seminormed locally compact source and a real normed target, additive only, as lines 1201–1203 and the Lean docstring say.
  - `Analysis/CStarAlgebra/Module/Defs.lean` line 81 (`star_inner`).
- **Tau Ceti.**
  - `Analysis/Matrix/Entropy.lean`: lines 88 (`vonNeumannEntropy`), 134 (`relativeEntropy`), 198, 239 and 303 (Klein's inequality, positivity, subadditivity).
  - `Analysis/CStarAlgebra/Action/Gibbs.lean` line 61 (`gibbsState`).
  - `QuantumSpin/Interaction.lean` line 261 (`gibbsExtension`).
  - `GroupTheory/Amenable/Basic.lean` line 130 (`class Amenable`) and `Abelian.lean` line 47 (`Amenable.of_commGroup`).
  - `Algebra/MonoidAlgebra/Twisted/Basic.lean` lines 288 (`twistedMonoidAlgebra`) and 498 (`equivOfCoboundary`).
  - The CAR files under `Algebra/Lie/GeneralLinear/CAR/` concern the Lie-algebraic Clifford setting, as the module docstring says.
- **Name resolution.** All 143 qualified Lean names in the README resolve at the pins, checked by a script over both trees (`CStarModule.star_inner` is a structure field).
- **Absent at the pin.** Strong subadditivity, Powers, Cuntz, reduced crossed products, Pettis-style automatic continuity for groups, and permutation unitaries on Hilbert tensor powers are absent (`PiTensorProduct.reindexRepresentation` is algebraic only).

### Cross-roadmap citations resolved

- **On main (3090489).**
  - CStarAlgebras C1.3 (305), C1.4 (380), C1.6 (435), C1.7 (468), C2.1 (544), C2.2 (568), C2.3 (616), C2.4 (643), C2.AnnHull/§2.6 (695), C5.1 (1112; `⊗min` through V13b.SpatialNorm), C5.2 (1143), C5.4 (1203), C6.1 (1272), C6.2 (1297), C6.5 (1414), C7.1 (1455), C8.4 (1676; `S↦z`).
  - HilbertModules H1 (126), H2 (179), H3 (262).
  - VonNeumannAlgebras V4.0.Fields (1181), V4.0.Decomposition (1279), V10.ModularTheory (2364), V10.KMS (2459), V11.UnitizationCharacters (3185) and V11.FourierUniqueness (3203). The inversion, Plancherel and duality target follows at 3233ff, with `Fλ(f)F*=M_f̂` and `‖λ(f)‖=sup|f̂|`, as lines 476–498 state.
  - BanachAlgebras A7.CharactersAndUniqueness (1739); AmenableGroups Layers 5 (289) and 7 (415); LieGroupoidsPoisson G0.0 (261), naming D5 as consumer (270).
  - SelfAdjointSpectralTheory SA-A21, SA-B14, SA-B44, SA-B50, SA-B59, SA-B67, SA-B79 and SA-B85, all present; D5 is named as consumer at lines 747 and 1407.
  - FreeProbability F3 (255; D1–D2 named at line 77); RepresentationTheory/CompactGroups (Peter–Weyl) and /SpinRepresentations (exterior algebra); Completed/OneParameterSemigroups.
- **Deferrals and consumers at their open heads.**
  - MetaplecticAutomorphicForms §1.2 (#1063, line 357).
  - NoncompactQuantumSymmetry P.2 (355), M1 (1281), the Borel-multiplier subsection (1620), M2 (1885) and M2.FixedTwistTypeI (1905) (#1015).
  - OperatorKTheory K7 (1497) and 7.5 (1829) (#866).
  - CStarClassification CL2–CL5 and §§5.7–5.8 (#863, lines 350–1005).
  - QuantumFoundations Layer 6, §6.3 and §6.4 (#1771, 692, 725, 741).
  - HeisenbergImprimitivity Layer 1, §1.1 and §3.1 (#1149, 242, 244, 504); its adjoint phase `conj(β(x,−x))` agrees with row 20.
  - CompactQuantumMetricSpaces Layer 6 and §6.0 (#1155, 1439, 1441).

### Ownership and overlaps

- **Search.** I ran `roadmaps grep` over main and the open heads for "reduced crossed product", "Takai", Green and symmetric imprimitivity, "disintegration", "KMS simplex", "quasi-local", the Powers property, "uniform Roe", "strong subadditivity", "twisted group C*-algebra", "permutation unitar", the universal Weyl algebra and the CAR algebra.
- **Hits outside this roadmap.** Most are consumers: AnalyticNumberTheoryPartII #1167, OperatorKTheory #866, CStarClassification #863, HeisenbergImprimitivity #1149, CompactQuantumMetricSpaces #1155, NoncommutativeGeometry #1143 and RelativisticQuantumFieldTheory #1772. The other hits are #1187's stale copy of this README and the second owners in R01.
- **Overlap data.** No dropped id, no id defined only by an open revision, and no id this pull request drops. The one listed item is the #1187 conflict (R03).

## Not verifiable

- **Uncertified in the manifest**, cited by locator and not read:
  - Bratteli–Robinson 2: §§5.2–5.3; Theorems 5.2.8, 5.3.30, 5.4.4, 6.2.4, 6.2.18, 6.2.40 and 6.2.42; Definition 6.2.16; Proposition 6.2.45, including the high-temperature constant at line 3763.
  - Bratteli–Robinson 1: Lemma 4.1.19 through Theorem 4.1.25.
  - Cuntz §1, the locator of the sampled concrete Cuntz families: the relations themselves are recomputed above.
  - Renault: Chapter I §§2–3, Chapter II §§1–2, Chapter III Proposition 2.7.
  - Brown–Ozawa Proposition 5.1.3.
- **Rudin**, *Fourier Analysis on Groups*, Theorems 1.5.1, 1.6.1 and 1.7.2 and §2.6: paywalled and not in the manifest, cited only for statements consumed from VonNeumannAlgebras V11.
- **Not re-read this round.** Locators unchanged since earlier rounds that read them: Sims (Theorem 4.1.5, Lemma 4.2.3, Propositions 4.2.6, 4.3.2, 4.3.7 and 5.1.14, Theorems 4.2.7, 4.3.3 and 4.3.6), Muhly–Williams (Theorems 5.5 and 7.8), Sims–Williams (Theorems 13 and 17), Takeishi (Theorem 5.4) and Delfín–Farsi–Packer.

## Source issues

- **Misprint** in williams-cpcsa-draft31 at Theorem E.17, printed p. 405: the source says the image of `C₀(X)` is dense in the diagonal algebra "is" the strong operator topology; it should be "in the strong operator topology"; affects nothing.
- **Misprint** in arici-mesland2019 at §2.1, p. 3: the source says the generator T is unitary "module" compact operators; it should be "modulo compact operators"; affects nothing.
