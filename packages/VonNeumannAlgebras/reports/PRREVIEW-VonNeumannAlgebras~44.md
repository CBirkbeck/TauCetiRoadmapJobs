# Review of VonNeumannAlgebras (pull request #1041 at d0aeb0c)

**Verdict:** needs changes

The head is the merge of main into the branch. The pins are now main's, the merge with main is clean, the gate passes and the file elaborates. The merge resolved several conflicting passages to main's wording, and in doing so undid repairs this pull request had already made. Two findings, both P3, both reopened from earlier rounds; each repair is the text the branch already had at 779e1be.

## Previous findings

The previous review (779e1be) had no finding. Its one carried remark, the pin lag and the conflict with main, is resolved: `lake-manifest.json` pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`, equal to main's, and `git merge-tree --write-tree origin/main HEAD` returns a tree with no conflict.

## R01 (P3) — Layer 2 again needs Layer 4, and Layer 7 again needs Layer 8

**Location:**
- `TauCetiRoadmap/VonNeumannAlgebras/README.md:1071`: "**V2.AbelianClassification — after Fields and V4.0.Multiplication.**", with V2.AbelianLocalizable (`:1145`) and V2.AbelianRepresentationMultiplicity (`:1182`).
- `:2429`: "**V7.GroupApplications — after the V8 models.**"
- Layer 7's Dependencies, `:2471`: "Layers 2–6."
- `Suggested.lean:190–216` (`multiplicationAlgebra`, `exists_starAlgEquiv_multiplicationAlgebra` under the Layer 2 comment) and the docstring's Layer 2 entry (`:35–42`).

**Claim:** Four targets sit in a layer before their prerequisites, which makes two coarse cycles between layers. This is the earlier build-order finding; the branch had repaired it by moving the targets to V4.AbelianClassification, V4.AbelianLocalizable, V4.AbelianRepresentationMultiplicity and V8.GroupApplications, and the merge restored main's placement.

**Witness:**
- Layer 2 → Layer 4: the *Needs* lines at `:1121–1125`, `:1178–1180` and `:1204` name V4.0.Multiplication and V4.Normality. Layer 4 → Layer 2: V4.0.Fields uses "V2's completed tensors" (`:1669`) and `:1813` reads "V2.BorelCalculus and V4.0.Fields for V4.0.Multiplication".
- Layer 7 → Layer 8: V7.GroupApplications needs "V8.SubgroupCosets's coset unitary, V8's group factors" (`:2442`). Layer 8 → Layer 7: V8.SubgroupCosets needs "V7.AmplificationTrace and V7.Dimension" (`:2518`).
- Layer 7's Dependencies list omits Layer 8.

**Repair:** Restore the arrangement of 779e1be, which passed the gate:
1. Move the three abelian targets to the end of Layer 4 as V4.AbelianClassification, V4.AbelianLocalizable and V4.AbelianRepresentationMultiplicity, with their Checks, the Layer 2 example bullet (`:1233–1234`) and the three Dependencies bullets (`:1256–1261`).
2. Move V7.GroupApplications after V8.SubgroupCosets as V8.GroupApplications, with the ICC index example (`:2467`); Layer 7 then closes with the sentence on what Layer 7 and Subfactors own.
3. Put back the matching sentences of "How to read the build" (`:423–431`).
4. In `Suggested.lean`, move `multiplicationAlgebra` and `exists_starAlgEquiv_multiplicationAlgebra` back under Layer 4 and cite "V4.AbelianClassification" in their docstrings and in the module docstring.

No other roadmap cites the four ids (`roadmaps grep 'V2\.Abelian|V7\.GroupApplications'` over main and the open heads finds only this folder), so no old → new table is needed. The description's sentence "keeps … every `V…` label" then needs these four exceptions. V11.FourierUniqueness must stay as it is at this head, since OperatorAlgebraDynamics cites it.

## R02 (P3) — Bullets that are not references, with a wrong ownership statement, discussion links and an instruction

**Location:**
- `README.md:5270–5273`: "The pinned Mathlib has no density-matrix or finite Hilbert–Schmidt declarations; … and the Hilbert–Schmidt norm is the V4.Core target."
- `:5266–5268`: two bullets on Mathlib's files and the bicommutant wrapper.
- `:5298`: "Relevant Lean design discussions include … Supply the required missing results here or in their explicitly cited prerequisite owner."
- `:904`: the "finite-product design" discussion link.
- `:908`: "downstream UO tensor operators consume it without a reverse dependency".

**Claim:** These passages were removed by an earlier repair and came back with the merge.
- The References section says V4.Core owns the Hilbert–Schmidt norm. The Scope says OperatorTheory does.
- `:5298` is an instruction to the writer, and it and `:904` link to chat threads, which are not sources.
- "UO" is defined nowhere in the README.

**Witness:**
- Scope, `:30–31`: "the trace-class and Hilbert–Schmidt ideals (OperatorIdeals OI-B29–B41)". V4.Core, `:1359`: "the Hilbert–Schmidt class S₂(H,K) and norm ‖·‖₂ of OI-B32–B41".
- `grep -n 'UO '` matches only `:908`.

**Repair:** As at 779e1be:
1. Delete the bullets at `:5266–5273` and `:5298`. The trace-density convention is already in Conventions and V10.KMS.
2. Delete the parenthetical link at `:904`; the Mathlib file is named in the same sentence.
3. End `:908` with "It is part of V2's completed-tensor/L² theory."
4. Delete the two stray blank lines at `:5095–5096`.

## Verified sound

**What changed since 779e1be, and how it was read**
- The folder diff is 342 insertions and 311 deletions in `README.md` and `Suggested.lean` (plus main's `PROGRESS.md` and `STATUS.md`, identical to main). Every hunk was read. Of the 255 added README lines, all but the relocated passages and the BanachSpaceTheory, V7 and V11 wording are main's own lines.
- Everything outside these hunks is byte-identical to the text accepted at 779e1be.

**Gate, dependencies, build (run this round)**
- `tauceti-roadmap gate … VonNeumannAlgebras --base origin/main`: every counter 0, `OK`.
- Dependency check, no UPWARD, CYCLE or `moved:` line:

  ```text
  depcheck: 233 roadmaps, 2259 edges, 0 problem(s)
  ```

- `lake env lean` on `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean`: exit 0, 32 "declaration uses `sorry`" warnings, nothing else.
- One-tactic probe on a scratch copy (`first | simp | rfl | aesop | decide | infer_instance` for each of the 32 `sorry`s): 32 errors at 32 distinct places, so none closes. No padding found.
- 57 declarations: main's 20 plus 37, none removed. The worker's elaborated signatures show no lost binder; the three changed definitions keep their types.
- `git diff --stat origin/main...HEAD` outside the folder is empty.

**Library declarations opened at the pins (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b)**
- `VonNeumannAlgebra.adjoin`, `TauCeti/Analysis/VonNeumannAlgebra/Adjoin.lean:38`: the double centralizer of `s` as a `StarSubalgebra`. This is the body that `spatialTensor`, `multiplicationAlgebra` and `groupVonNeumannAlgebra` wrote out at 779e1be, so the three definitions denote the same algebras. It does not add the adjoints of `s`; the docstrings' "generators and their adjoints" holds because each generating set is self-adjoint.
- `NonUnitalStarAlgHom.IsNondegenerate`, `TauCeti/Analysis/CStarAlgebra/Representation/Nondegenerate.lean:62`: `Dense (span ℂ (⋃ a, Set.range (π a)))`. The Layer 0 clause `{ξ | ∃ a η, π a η = ξ}` is the same set.
- `MeasureTheory.FiniteMeasure.ext_of_forall_pontryaginMeasureTransform_eq_of_innerRegular`, `TauCeti/Analysis/Fourier/Pontryagin/Uniqueness.lean:262–263`.
- `TauCeti.MeasureTheory.ext_of_forall_mem_subalgebra_integral_eq_of_innerRegular`, `TauCeti/MeasureTheory/Measure/FiniteMeasureExt.lean:263`: locally compact, both measures inner regular, no metrizability. This matches V11.FourierUniqueness.
- `ContRepresentation.exists_pontryaginMeasureTransform_eq_inner`, `TauCeti/Analysis/Fourier/Pontryagin/StronglyContinuous.lean:283`.
- `LinearMap.existsUnique_trace_mul_eq`, `TauCeti/LinearAlgebra/Matrix/Trace/Duality.lean:31`.
- `MeasurableEquiv.piFinTwo`, `Mathlib/MeasureTheory/MeasurableSpace/Embedding.lean:552`; `MeasureTheory.measurePreserving_piFinTwo`, `Mathlib/MeasureTheory/Constructions/Pi.lean:850`.
- Library near-matches: the two same-name hits are `WStarAlgebra.exists_predual` (a class field about abstract W*-algebras, not the concrete statement here) and the group-theoretic `IsCyclic` (a different namespace).

**Cross-roadmap citations resolved**
- BanachSpaceTheory on main: `## B1. Duality and weak topologies` (line 54, Goldstine at line 80), `## B2. Weak compactness and reflexivity` (line 135, Eberlein–Šmulian line 140, Krein–Šmulian line 161), `## B4.` (line 239). The Scope bullet (`:52–61`) and the contract (`:340–356`) agree with it, and the three link fragments resolve.
- The overlap report lists these three fragments as dropped by the open BanachSpaceTheory revision. That revision's Scope maps each old anchor to its new heading (`#b1-duality-and-weak-topologies` → Layer 1 (B1), and likewise B2 and B4) and keeps the ids B1–B7, so the citations stay valid and need no change.
- V11.FourierUniqueness is cited by OperatorAlgebraDynamics at its open head (lines 172, 500, 2291). This head keeps the id, as a paragraph that consumes BanachAlgebras A7.CharactersAndUniqueness and the Tau Ceti theorem above and proves nothing itself. No second owner.
- No open pull request changes this folder; no id of this roadmap that another roadmap cites is dropped.
- Suppliers are all on main. Ownership against the open heads was checked with `roadmaps grep` for the ids above; the closest roadmaps by vocabulary (OperatorAlgebraDynamics, QuantumFoundations, UnboundedOperators) are consumers of this one.

**Seeded sample, read against the sources this round**
- 13.1: hiai-lectures line 2666 (p. 55): Theorem 6.5, a norm-one projection of a C*-algebra onto a C*-subalgebra has properties (ii) and (v) of Theorem 6.4 (line 2592). peterson-notes line 3948 (p. 98): Theorem 6.2.1, unital A and B, `E|B = id`, `‖E‖ ≤ 1`. anantharaman-popa lines 7191 and 7198 (PDF 167 = p. 161): Definition 10.2.1 and Proposition 10.2.2; line 13597 (PDF 320 = p. 314): Appendix A.4. All agree with `README.md:4512–4529`.
- 13.2: anantharaman-popa line 7269 (p. 163) Proposition 10.2.5; line 7325 (p. 164) Theorem 10.2.8, Powers–Størmer; line 7333 (p. 164) Theorem 10.2.9; line 7413 (p. 166) Theorem 10.3.1; line 7532 Theorem 10.3.4, Connes's trick; lines 7685 and 7697 (p. 173) Definitions 11.1.1–11.1.2; lines 8294–8302 (p. 186) Theorem 11.2.2 with item (3) the increasing sequence with `(∪Qₙ)'' = M`; line 8376 (p. 188) Corollary 11.2.4. peterson-notes line 4146 (p. 103) Theorem 6.3.8. jones-vna line 3380 (pp. 107–108) §16.2. All agree with `README.md:4614–4707`.

**Adversarial table**

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `tomiyama` (13.1) | E = diagonal compression on `M₂`; a=diag(2,3), b=diag(5,7), x=[[1,2],[3,4]]; `P(x)=e₁₁xe₁₁`; transpose; zero algebra | `axb=[[10,28],[45,84]]`, `E(axb)=diag(10,84)`; `aE(x)b=diag(2·1·5, 3·4·7)=diag(10,84)`; `P(1)=e₁₁≠1`, `‖P‖=1`, fixes `ℂe₁₁`; transpose sends `e₁₂` to `e₂₁`, fixing hypothesis fails; on 0 every map has norm 0≠1 | holds | none |
| `IsInjective` (13.1) | `B(H)`; `ℓ∞⊂B(ℓ²)`; `M=0` | identity, norm 1; `x↦diag(⟨eₙ,xeₙ⟩)`, norm 1, fixes diagonals; M=0: P=0, `‖P‖=0≤1`, which is why the clause is `≤1` | holds | none |
| `IsHyperfinite`, `isInjective_iff_isHyperfinite` (13.2) | `⊗M₂`; `B(ℓ²)`; `L(F₂)`; non-separable H | `M_(2ⁿ)` increasing, union generates; `Aₙ≅Mₙ⊕ℂ`, union weakly dense; `L(F₂)` not Γ, so not R, and no hypertrace, so not injective: both sides false; the Lean statement carries `[SeparableSpace H]` | holds | none |
| Uniqueness of the injective II₁ and II∞ factors (13.2) | `R` vs `R⊗̄M₂`; `R⊗̄B(ℓ²)` | both injective II₁, isomorphic (`M_(2ⁿ)⊗M₂=M_(2ⁿ⁺¹)`); II∞: source's Corollary 11.2.4 needs separability, present in the Lean statement | holds | none |
| Følner Checks (13.2) | `ℂ²`, `τ(a,b)=(a+2b)/3`, u=(1,−1), x=(1,0) | rank-one P on (α,β): `‖uP−Pu‖²=8‖α‖²‖β‖²`, `Tr(xP)=‖α‖²`; bound 1/100 forces `‖α‖²<0.0013` or `>0.9987`; P=1 gives 1/2; `τ(x)=1/3`; `T=diag(3^(−1/2),(2/3)^(1/2))`: `1/3+2/3=1`, `Tr(xT²)=1/3` | holds | none |
| `multiplicationAlgebra`, `exists_starAlgEquiv_multiplicationAlgebra` | two-point counting measure; μ=0; H=0; `ℓ∞(I)`, I uncountable | diagonal `ℂ²`, own commutant; `L²(0)=0`, algebra 0, so probability measures and `[Nontrivial H]`; uncountably many minimal projections vs countably many atoms, excluded by `[SeparableSpace H]` | holds | none |
| `spatialTensor` via `adjoin`, `commutant_spatialTensor` | `M_m⊗̄M_n`; `B(H)⊗̄ℂ1` | generated algebra `M_(mn)`, dim `m²n²`; commutant of `B(H)⊗1` is `1⊗B(K)` = `ℂ1⊗̄B(K)`, the product of the commutants | holds | none |
| `groupVonNeumannAlgebra`, `isFactor_groupVonNeumannAlgebra_iff` | `ℤ/2`; `S₃`; trivial group; `F₂` | circulants `[[a,b],[b,a]]`, centre of dim 2, class `{g}` finite: not a factor, both sides false; `S₃`: centre dim 3 (three classes), not a factor; trivial group: `ℂ`, a factor, no class other than `{1}`: both true; `F₂` ICC: both true | holds | none |
| V7.GroupApplications (R01) | `Γ₀=1` in finite Γ; `2ℤ⊂ℤ`; ICC pair of finite index | finite Γ is not ICC unless trivial, and `L(Γ)` is not a factor, so the example needs "infinite ICC", as stated at `:2467`; `dim=[Γ:Γ₀]` when finite, ∞ otherwise | statement holds; placement is R01 | move |
| V11.FourierUniqueness | G=ℝ, `f=1_[0,1]`; trivial group; non-regular finite measure | `‖f̂‖²` integrates to 1 against `dy/(2π)`, to 2π against dy; trivial group: one character, measure determined by its mass; regularity is in both hypotheses, matching the Tau Ceti theorem | holds | none |
| `double_commutant_iff_isClosed_image_ofCLM` | `M=ℂ1`; compacts plus scalars on `ℓ²` | `ℂ1''=ℂ1`, closed; `(K+ℂ1)''=B(ℓ²)≠K+ℂ1`, not WOT closed: both sides false | holds | none |
| `tracialState_unique`, `exists_faithful_tracialState` | `M₂`; `ℂ²` | `tr/2` unique on the factor `M₂`; `ℂ²` has the traces `(ta+(1−t)b)`, not unique, and is not a factor | holds | none |
| `existsUnique_isKMS_flow` | `M₂`, `φ=Tr(h·)`, h=diag(1/3,2/3) | `σ_t(e₁₂)=(1/3)^(it)(2/3)^(−it)e₁₂=2^(−it)e₁₂`; `φ(e₂₁e₁₂)=2/3`, `φ(e₁₂e₂₁)=1/3`, ratio 2 as the boundary values require | holds | none |
| `dye`, `HasTypeITwoSummand` | `M₂`; `M₃` | on `M₂` the projection lattice has non-linear automorphisms of the sphere of rank-one projections, excluded by the I₂ hypothesis; `M₃` has none | holds | none |
| References bullet on the Hilbert–Schmidt norm (R02) | Scope `:30–31`, V4.Core `:1359`, `:5273` | owner OperatorIdeals OI-B32–B41 at two places, "V4.Core target" at the third | contradiction | delete |

## Not verifiable

- Tomiyama 1957: the cached file for `tomiyama-1957` holds only the host's block page (line 5), so Theorem 1, pp. 608–609, was not read. The README uses it only for positivity and bimodularity, as attributed in anantharaman-popa line 13597 (A.4), which was read.
- Uncertified and settled, cited by locator: Arveson 1969 (Theorem 1.2.3), Haagerup 1985, Haagerup 1987, Connes–Størmer 1978.
- Takesaki I, Theorem IV.4.9, and Takesaki III, XV.3 (Theorem 3.1, Definition 3.5), cited in 13.2, are not in the cache and were not read.
- Jones, Definition 16.1.1: the cached extraction breaks off at jones-vna line 3367.

## Source issues

- none
