# Review of GeometricQuantization (pull request #1186 at be6ed5f)

**Verdict:** needs changes

This is a full review of the same head the previous review read. The previous R01 (stale Tau Ceti pin) is not repaired and is carried below as R03. There are two blocking findings, both new:

- **R01:** §3.1a re-plans compact-root and period material that LieGroups Layer 6 and ConvexityToric T1 on main already own.
- **R02:** §5.3's dimension-k theorem is statable at the pins but `Suggested.lean` says it is not.

## R01 (P2) — §3.1a, and the lattice passages of §3.2 and §6.3, re-plan LieGroups Layer 6 and ConvexityToric T1 (both on main)

**Location.** `TauCetiRoadmap/GeometricQuantization/README.md`, §3.1a lines 589–633: "Average an inner product over K, split off its center, and diagonalize the commuting skew-adjoint torus operators … put α∨=2α♯/‖α‖² … construct a Lie homomorphism su(2)→𝔨 sending H₀=diag(i,−i) to α∨". The same ownership claim appears in:
- Scope, lines 14–16;
- the Mathlib contract, line 111;
- the RepresentationTheory contract, lines 244–246;
- §3.2, lines 656–659 (the character/cocharacter maps and pairing);
- §6.3, lines 1221–1222 (the product-torus lattice);
- the *Needs* lines 690, 744 and 816;
- `Suggested.lean` lines 29–30.

**Claim.** LieGroups on main owns all of §3.1a's construction.
- Layer 5A owns the Haar-averaged Ad-invariant metric and the splitting 𝔤=z(𝔤)⊕[𝔤,𝔤].
- Layer 6 "Compact real roots and the Weyl comparison" owns:
  - simultaneous diagonalization of T on 𝔤_ℂ;
  - the match with LieHighestWeight Layer 0's sl₂ strings and the native root-space theorem;
  - the proof that t_ss,ℂ is a Cartan subalgebra of the complexified semisimple summand;
  - α∨=2α♯/‖α‖² and the reflections X↦X−α(X)α∨.
- Layer 6 "Rank-one representatives" owns:
  - the compact su(2) for each root, integrated by Layer 4 to SU(2)→G;
  - the normalization dφ(diag(i,−i))=α∨;
  - the normalizer element n_α inducing the reflection;
  - the compactness of the image.

ConvexityToric T1 on main owns the 2π period/weight dictionary:
- Λ_Z=(2π)⁻¹ker(exp), characters via (1/i)dχ, and the dual, restriction and quotient lattices;
- 2πα∨∈ker(exp), proved through the same rank-one subgroup.

§3.1a constructs all of this again, §3.2 rebuilds the pairing, and §6.3 rebuilds the product-torus lattice. Each object then has two owners. LieGroups' Downstream consumers paragraph (main, line 1453–1455) already lists HamiltonianReduction R2, ConvexityToric T1 and SchubertGeometry S2 as consumers of exactly these Layer 6 outputs.

**Witness.** `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md` on main, line 750: "put α∨=2α♯/‖α‖² and prove the root reflections act as X↦X−α(X)α∨". Line 751: "pin dφ(diag(i,−i))=α∨". `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md` line 43: "prove 2πα∨∈ker(exp) through its realized compact rank-one subgroup".

**Repair.**
1. **Delete §3.1a's construction.** That is the averaged metric, centre splitting, root diagonalization, α∨, su(2)→𝔨, φ_α, its kernel, n_α and the reflection. Under "From TauCetiRoadmap.RepresentationTheory", cite LieGroups Layer 5A (`B_G`, the splitting) and Layer 6 "Compact real roots and the Weyl comparison" and "Rank-one representatives", stating the normalization dφ_α(diag(i,−i))=α∨. Under "From TauCetiRoadmap.SymplecticGeometry", add to ConvexityToric T1: "Λ_Z=(2π)⁻¹ker(exp), its dual weight lattice, (1/i)dχ, and 2πα∨∈ker(exp)".
2. **Move what is genuinely this roadmap's into §3.2.** That is the coadjoint quotient-curve comparison: the SU(2)/Circle curve against SchubertGeometry S9.7's root-oriented curve, period μ(α∨)/ℏ, and a Levi root giving period zero. Move the H₀ versus H₀/2 Check with it, as a consumer-side calibration Check, as ConvexityToric T1 does.
3. **§3.2, lines 658–659:** replace "Construct these maps, their differential identities and the perfect character/cocharacter pairing" with "ConvexityToric T1 supplies these maps and the perfect pairing".
4. **§6.3:** delete "Assemble the product torus and prove that this period lattice is its character lattice". Keep the `TauCeti.fourierChar`/`TauCeti.fourierRep` comparison with T1's convention.
5. **Update the other references:**
   - line 14: "Layer 3 owns the coadjoint period application";
   - line 111: "LieGroups Layer 6 verifies those hypotheses";
   - lines 244–246;
   - the *Needs* lines 690/744/816: "§3.1a" becomes "LieGroups Layer 6, ConvexityToric T1";
   - delete the `Suggested.lean` bullet at lines 29–30.

The dependency direction is unchanged, because both suppliers are on main. Tested on the instance in §3.2's Checks: with LieGroups' dφ(H₀)=α∨, H₀ maps to 2Z in SO(3). At radius 1/2 and ℏ=1 this gives μ(2Z)=1 and central phase exp(iπ)=−1, the values §3.1a and §3.2 already state, so no Check changes value.

## R02 (P2) — §5.3's dimension-k theorem is statable at the pins; the docstring says it is not

**Location.** `TauCetiRoadmap/GeometricQuantization/Suggested.lean` lines 38–41: "theta/Bohr--Sommerfeld quantization need holomorphic sections … of the theta line … theta functions alone do not supply these geometric section spaces." The theorem it refers to is README §5.3, lines 1052–1069: "a k-element basis, hence dimension k".

**Claim.** README §5.3 itself pins the holomorphic sections of the theta line as entire functions s with `s(z+1)=exp(2πiα)s(z)` and `s(z+τ)=exp(2πiβ−πikτ−2πikz)s(z)`. It then proves dimension k by expanding `s(z)=Σ c_m exp(2πi(m+α)z)`. Everything this needs is in Mathlib at the pin: `Differentiable ℂ`, `cexp`, `Submodule ℂ (ℂ → ℂ)` and `Module.finrank`. The one definition needed has a real body of three lines, so it is the README's own statement, not a stand-in. The docstring itself counts it among the headline theorems. A statable headline that is absent is P2.

**Witness.** The file below elaborates at the pin (`lake env lean`) with the single warning "declaration uses `sorry`". Its proved example shows that `fun z => jacobiTheta₂ z τ ∈ thetaSections 1 τ 0 0`, by `jacobiTheta₂_add_left` and `jacobiTheta₂_add_left'`. So the README's factor agrees with Mathlib's convention and the space is nonzero.

Negative controls:
- k=0, α=β=0 gives the doubly periodic entire functions, which are the constants: finrank 1≠0. So `0 < k` is needed.
- With Im τ<0 the coefficient recursion grows, so `0 < τ.im` is needed.

**Repair.**
1. **Add to `Suggested.lean`**, under `/-! ## Layer 5: Quantization spaces and examples -/`, the following (tested as written; the `example` is optional and is the only proved declaration):

```lean
open Complex Real in
/-- Holomorphic sections of the level-`k` theta line with characteristics `(α, β)` on
`ℂ / (ℤ + τ ℤ)`, as entire functions with the automorphy law of README §5.3. -/
def thetaSections (k : ℕ) (τ : ℂ) (α β : ℝ) : Submodule ℂ (ℂ → ℂ) where
  carrier := {s | Differentiable ℂ s ∧ (∀ z, s (z + 1) = cexp (2 * π * I * α) * s z) ∧
    ∀ z, s (z + τ) = cexp (2 * π * I * β - π * I * k * τ - 2 * π * I * k * z) * s z}
  add_mem' := by
    rintro f g ⟨hf, hf1, hfτ⟩ ⟨hg, hg1, hgτ⟩
    exact ⟨hf.add hg, fun z => by simp [hf1, hg1, mul_add],
      fun z => by simp [hfτ, hgτ, mul_add]⟩
  zero_mem' := ⟨differentiable_const 0, fun z => by simp, fun z => by simp⟩
  smul_mem' := by
    rintro c f ⟨hf, hf1, hfτ⟩
    exact ⟨hf.const_smul c, fun z => by simp [hf1]; ring, fun z => by simp [hfτ]; ring⟩

/-- Kähler quantization of the degree-`k` torus: the theta line has exactly `k`
independent holomorphic sections (README §5.3). -/
theorem finrank_thetaSections (k : ℕ) (hk : 0 < k) (τ : ℂ) (hτ : 0 < τ.im) (α β : ℝ) :
    Module.finrank ℂ (thetaSections k τ α β) = k := by
  sorry
```

   The convention check, if kept:

```lean
example (τ : ℂ) (hτ : 0 < τ.im) : (fun z => jacobiTheta₂ z τ) ∈ thetaSections 1 τ 0 0 := by
  refine ⟨fun z => differentiableAt_jacobiTheta₂_fst z hτ, fun z => ?_, fun z => ?_⟩
  · simp [jacobiTheta₂_add_left]
  · beta_reduce
    rw [jacobiTheta₂_add_left']
    congr 1
    push_cast
    ring_nf
```

2. **Shorten the Layer 5 docstring bullet** to the parts that remain unstatable: "projective quantization needs holomorphic sections of O(k), and Bohr–Sommerfeld quantization needs parallel lines over the actual Bohr–Sommerfeld leaves".
3. **Name the two declarations in §5.3's first API bullet:** "`thetaSections k τ α β` is the space of entire functions with the two automorphy laws; `finrank_thetaSections`: its dimension is k for k>0 and Im τ>0".

Every lemma used also exists at main's Mathlib pin (`differentiableAt_jacobiTheta₂_fst` at `TwoVariable.lean`:327 there, :328 at the branch pin), so the repair survives R03's merge.

## R03 (P3) — The branch still pins Tau Ceti `a91d3aa`, where the cited Hamiltonian API does not exist

This is the previous review's R01. The head is unchanged, so it is not repaired.

**Location.** `lake-manifest.json` line 8, `"rev": "a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039"` (TauCeti), with Mathlib `6b7abb3c` at line 18. The affected passages are README lines 50–57 and 121–144, and *Needs* lines 380–382, 514–517 and 927.

**Claim.** At the branch pin `a91d3aa`, thirteen of the cited Tau Ceti names do not exist:
- there is no `TauCeti/Geometry/Symplectic/Hamiltonian/` directory, so `hamiltonianVectorField`, `IsHamiltonianVectorField`, `poissonBracket`, `IsNondegenerate.hamiltonianVectorField_poissonBracket`, `IsMomentMap`, `momentCocycle`, `momentCocycle_eq` and `momentCocycle_mem_twoCocycle` are all missing;
- there is no `TauCeti/Geometry/Manifold/VectorField/InfinitesimalAction.lean`;
- there is no `SmoothForm` and no `DifferentialForm/Smooth.lean`;
- `SmoothTwoForm` is a `structure` (`TwoForm/Basic.lean`:61), not the abbreviation line 57 describes.

At main's pin `2fd255d` every one of these exists at the cited file:
- `abbrev SmoothTwoForm` at `TwoForm/Basic.lean`:37;
- `abbrev SmoothForm` at `DifferentialForm/Smooth.lean`:479;
- `Hamiltonian/Manifold.lean`:124, 179, 338;
- `Hamiltonian/Bracket.lean`:182, inside `namespace IsNondegenerate` with `[FiniteDimensional ℝ E]`, a closed form and C² functions;
- `VectorField/InfinitesimalAction.lean`:83;
- `Hamiltonian/MomentMap.lean`:133, 388, 505 (with `[PreconnectedSpace M]`) and 542.

**Witness.** In the branch's dependency tree, `ls TauCeti/Geometry/Symplectic/Hamiltonian` fails, and a grep for `SmoothForm` declarations returns nothing.

**Repair.** No text change. Merge `origin/main` into the branch. The print-only `git merge-tree <base> HEAD origin/main` shows no conflict marker and no path changed on both sides; main changes nothing in the folder, and the branch changes nothing outside it. Then re-run the gate. `Suggested.lean` imports only `Mathlib`, and R02's code uses only lemmas that exist at both Mathlib pins.

## R04 (P3) — §6.6's torus complexification and §3.3's degree matrix re-derive LieGroups Layers 7 and 8

**Location.**
- README lines 1409–1418: "Construct here its explicit abelian adapter 𝔱_C/(2πΛ_Z)≃T_C … Prove the quotient's complex Lie-group structure, its universal extension property and the real polar diffeomorphism".
- Lines 703–704: "compute the transition of its jth line on the ith curve to have degree δᵢⱼ".

**Claim.**
- **§6.6.** LieGroups Layer 7 on main constructs the universal complexification as H/N, where H is the simply connected complex integration of 𝔤⊗ℂ and N is the smallest closed complex subgroup containing j(ker p). It proves the quotient's complex structure, its universal property and its uniqueness. For a torus, H=𝔱_ℂ and N=j(ker p)=2πΛ_Z, which is discrete and so closed. §6.6 proves the structure and the universal property of the same quotient a second time.
- **§3.3.** LieGroups Layer 8 owns the homogeneous lines E_χ and their restriction to the rank-one fibres of G/B⁺→G/P_α⁺, with degree m=⟨μ,α∨⟩. For α_i∉I, that fibre maps isomorphically onto S9.7's i-th root curve in K/H. So δᵢⱼ=⟨ϖ_j,α_i∨⟩ is a citation, not a new transition computation.

**Witness.** `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md` on main, lines 867–870: "Construct the smallest closed complex subgroup N containing j(ker p), prove it is central, construct the complex quotient H/N … Prove universality". Line 1157–1158: "equivariant restriction of Lμ of degree m=⟨μ,α∨⟩".

**Repair.**
- **§6.6:** replace "Prove the quotient's complex Lie-group structure, its universal extension property and" with "Identify LieGroups Layer 7's H/N for T with 𝔱_C/(2πΛ_Z) (H=𝔱_C, N=j(ker p)=2πΛ_Z, discrete hence closed) and prove". Keep the polar diffeomorphism and the circle formulas.
- **§3.3:** replace "compute the transition … to have degree δᵢⱼ" with "the degree is LieGroups Layer 8's ⟨ϖ_j,α_i∨⟩=δᵢⱼ on the minimal-parabolic fibre, which maps isomorphically onto the i-th root curve".

Tested on §6.6's Check, "[x+iy] has modulus exp(−y)", and on §3.3's ℂP¹ degree matrix (1)=⟨ϖ,α∨⟩: both are unchanged.

## R05 (P3) — Two supplier citations name a section that does not contain the cited result

**Location.**
- (a) Line 711–712: "Use ComplexComparisonPartII C0.3's bundle/sheaf dictionary to identify it with H¹(K/H,𝒪×) by transition cocycles."
- (b) Lines 199–201: "SelfAdjointSpectralTheory Part A supplies graph cores, the von Neumann criterion and the comparison to the native Stone theorem". Line 441 repeats it: "Part A's graph-core and Stone comparisons".

**Claim.**
- (a) ComplexComparisonPartII C0.3, at its open head lines 1316–1366, is the bundle/locally-free-module dictionary and says nothing about H¹(𝒪^×). The bijection from line-bundle classes onto H¹(M,𝒪_M^×) is proved in C5.4, which names "GeometricQuantization §3.3" as the consumer of exactly that bijection (line 5269).
- (b) SelfAdjointSpectralTheory Part A (main lines 149–251) consists of SA-A01–SA-A24: unitary groups, the von Neumann criterion SA-A21 and the Stone comparison SA-A22. Graph cores are Part C, SA-C39–SA-C42 (lines 888–894).

**Witness.** ComplexComparisonPartII C5.4: "Prove that `L ↦ [L]` is a bijection from isomorphism classes of holomorphic line bundles on `M` … onto `H¹(M, O_M^×)`". SelfAdjointSpectralTheory line 888: "SA-C39 — Graph core."

**Repair.**
- (a) Write "Use ComplexComparisonPartII C5.4's frame-torsor bijection (with C0.3's bundle dictionary) to identify it with H¹(K/H,𝒪×)".
- (b) Write "SelfAdjointSpectralTheory Part A supplies the von Neumann criterion (SA-A21) and the Stone comparison (SA-A22); Part C supplies graph cores (SA-C39–SA-C42)". Change line 441 to "Part A's Stone comparison and Part C's graph cores".

## R06 (P3) — §6.10 states its transport theorems with neither a locator nor a list of the inputs they are deduced from

**Location.** Lines 1763–1806. For example, "Construct an extension `β∈X*(T)` of `κ|_{K⁰}`: prove surjectivity of restriction `X*(T)→X*(K⁰)` … Prove the moment-map relation `μ=wt(β)+q^*μ′` and the actual section weight transport". The *Needs* line 1823–1824 lists only sections and Mathlib.

**Claim.** §6.10 is in this round's sample and asserts five results:
- surjectivity of X*(T)→X*(K⁰);
- descent of L⊗ℂ_{−β} to a T/K⁰-linearized line;
- the residual character δ;
- μ=wt(β)+q*μ′ and the weight transport;
- ν_n^T=(φ_β)_*ν_n^{T′}.

None of them carries a source locator, and there is no "deduction from …" clause of the kind §4.2 uses ("These are deductions, not supplier results"). The house rule requires a locator at every claim.

**Witness.** A grep of lines 1763–1824 finds no parenthesized source and no "deduction".

**Repair.** After line 1784 add: "These are deductions. Surjectivity follows by extending a basis of the primitive sublattice, with ConvexityToric T1's restriction formula. Descent is Mathlib `QuotientGroup.lift` applied to the K⁰-trivial action, smooth by LieGroups Layer 2. The moment and weight transports follow from §6.1's twist formula (Sjamaar, arXiv v1, §2.2, p. 24)."

Tested on §6.10's own T² Check: §6.1's rule λ↦λ+nκ gives (−j,nb) from both β=(0,b) and β=(1,b).

## R07 (P3) — A §6.6 Check misstates the support set

**Location.** Line 1529: "The support weights {−1,1} contain 0 in their interior, giving semistable locus ℂ×".

**Claim.** In the Check just before it (lines 1525–1527), E=L²⊗ℂ₁ with m=1. Its coordinates are x², √2·xy and y², with dual weights −1, 0 and 1. On ℂ× all three are nonzero, so the support is {−1,0,1}. These are exactly the three terms of the potential that Check uses, 2 log((eᵃ+e⁻ᵃ)/2)=log((e²ᵃ+2+e⁻²ᵃ)/4). The convex hull is the same, so the conclusion stands, but the stated set is wrong.

**Witness.** At [1:1], √2·xy=√2≠0. Its weight-0 coordinate gives the constant 2 in the potential.

**Repair.** Write "The support weights {−1,0,1} contain 0 in the interior of their hull [−1,1], giving semistable locus ℂ×; at [1:0] and [0:1] the supports are {−1} and {1}".

## Previous findings

- **R01 (previous) — not repaired.** The head is the one that review read. `lake-manifest.json` still pins `a91d3aa`. Carried as R03, with the merge re-checked as conflict-free.
- No repair report marks any finding "not actionable in this package", so nothing is re-raised.

## Verified sound

**Gate, dependencies and elaboration at be6ed5f.**
- **My gate run:** `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's gate (with `build=0`) agrees.
- **Dependency check, complete output:** `depcheck: 238 roadmaps, 2322 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line. GeometricQuantization is at merge-order line 153, after LieGroupoidsPoisson (152), IndexTheory (10), SmoothBundlesConnections (12), PseudodifferentialOperators (13) and ComplexComparisonPartII (39). The other suppliers are on main. R01, R04 and R05's repairs cite only roadmaps on main or earlier in the order.
- **Elaboration:** `lake env lean TauCetiRoadmap/GeometricQuantization/Suggested.lean` gives exit 0 and no output. The file is a docstring and an empty namespace, so there is nothing for the one-tactic padding probe and no `#check @` comparison inside it. For R02's proposed declarations I ran `#check @` in scratch:
  - `thetaSections : ℕ → ℂ → ℝ → ℝ → Submodule ℂ (ℂ → ℂ)`;
  - `finrank_thetaSections : ∀ (k : ℕ), 0 < k → ∀ (τ : ℂ), 0 < τ.im → ∀ (α β : ℝ), Module.finrank ℂ ↥(thetaSections k τ α β) = k`.

  Both have the README's generality (integer k>0, τ∈ℍ, real α, β).
- `git diff --stat origin/main...HEAD` outside the folder is empty. `roadmaps resolve` and `roadmaps overlaps` report nothing: no pull request changes this roadmap, and no cited id is dropped or revision-only.

**Library declarations opened at the pins.**
- **Mathlib `6b7abb3c` (branch), with the same names at main's `1b1ccf4`:**
  - `CovariantDerivative` (`VectorBundle/CovariantDerivative/Basic.lean`:365);
  - `jacobiTheta₂` (`JacobiTheta/TwoVariable.lean`:251; term at :45), `summable_jacobiTheta₂_term_iff` (:123, `↔ 0 < im τ`), `jacobiTheta₂_add_left` (:384), `jacobiTheta₂_add_left'` (:390, factor `cexp (-π * I * (τ + 2 * z))`);
  - `LieAlgebra.IsKilling.rootSystem` (`Weights/RootSystem.lean`:411), `exists_isSl2Triple_of_weight_isNonZero` (`Weights/Killing.lean`:555);
  - `ContinuousMonoidHom.comp` (:152), `QuotientGroup.lift_mk` (`QuotientGroup/Defs.lean`:253), `lift_comp_mk'` (:262), `continuous_quot_lift` (`Topology/Constructions.lean`:729);
  - `VectorField.leibniz_identity_mlieBracket` (`VectorField/LieBracket.lean`:1153, `[U,[V,W]]=[[U,V],W]+[V,[U,W]]`, the identity §4.2 rearranges) and `VectorField.mlieBracket_smul_left` (:505, `[f•V,W]=−df(W)•V+f•[V,W]`, the sign §4.2 uses).
- **Tau Ceti `a91d3aa` (branch):** `SmoothTwoForm` structure (`TwoForm/Basic.lean`:61), `SmoothTwoForm.IsSymplectic` (`Symplectic/Manifold/TwoForm.lean`:92), `ODE.exists_contDiffAt_picard_solution` (`Analysis/ODE/SmoothParameter.lean`:207), `fourierChar` (`RepresentationTheory/Compact/Circle.lean`:126), `fourierRep` (:142), `formalCharacter` (`Algebra/Lie/Weights/FormalCharacter.lean`:156), `formalCharacter_coeff_eq_finrank_weightSpace` (:485), `isIntegralWeight_of_formalCharacter_coeff_ne_zero` (:493, `[IsTriangularizable K H L]`). The thirteen names absent at this pin are in R03.
- **Tau Ceti `2fd255d` (main):** the R03 list, all present. There is no principal connection and no character-associated line under `Geometry/Manifold/FiberBundle/`; there is not even that directory at `a91d3aa`. So the docstring's §2.1–2.3 "not statable" claims hold at both pins.

**Cross-roadmap citations resolved this round.**
- **SmoothBundlesConnections (main):** B1.4 (line 421), B2.1 (559), B2.2 (605), B2.4 (776), B3.1 (871), B4.1 (979), B5.0 (1072), B5.2 (1209), B6.2 (1668), B6.3 (1716), B6.4 (1739), B6.5 (1780). Its line 151 fixes the dual-character prequantum convention the README uses.
- **DifferentialGeometry (main):** 0.4 (294), 1.4 (325), 3.1–3.4 (375–394), 4.3 (463), 5.4 (524), Layers 5–8 (503–816).
- **LieGroupoidsPoisson (main):** §G4.1 and §G4.2.
- **SymplecticGeometry (main):** HamiltonianReduction R1, R2, R2a, R3 (lines 33, 127, 157, 187); CotangentLagrangian C1 (25); ConvexityToric T1, T3, T4 (32, 106, 156).
- **Orbifolds (main):** O1–O5 with O4-S, O4-W, O4-T (87–715).
- **ComplexKahlerGeometry (main):** K3's locally bounded extension (437), K4 (444), K5a, K5b.1 (1208), K6.0 (1245), K6.1 (1274), K7.1 (1407), K7.2 (1444). K7.2 proves `binomial(n+k,n)` and names this roadmap as consumer of its k≥1 forms.
- **SchubertGeometry (main):** S9.1 and S9.7 (lines 109, 122). They are numbered items of §S9.
- **SelfAdjointSpectralTheory (main):** Part A (149–251); for Part C see R05.
- **LieGroups (main):** Layers 4, 5, 5A, 6, 7, 8.
- **IndexTheory at its open head:** I6 (1238), I7.3 (1392), I8.2 (1595), I8.3 (1614), I8.4 (1636).
- **ComplexComparisonPartII at its open head:** C0.3 (1316), C1.7 (1871), C1.8 (1915), C1.9 (1945), C5.1 (2954), C5.4 (3678). C5.4 lists this roadmap as consumer.
- No citation of a forbidden supplier. The prose's single mention of HeegaardFloer marks a subject this roadmap leaves out, not a supplier.

**Ownership against open work.** I grepped every open head and main for prequantum, Bohr–Sommerfeld, polarized section, half-density, quantization commutes with reduction, Palais integration, Kodaira embedding, Kawasaki, holomorphic Lefschetz and factor-of-automorphy theta dimension.
- The only second owners are the main-branch ones in R01 and R04.
- Palais' complete-infinitesimal-action theorem (§2.3) and the equivariant Kodaira embedding (§6.2) have no other owner, so this roadmap owning them is consistent.
- AbelianSchemesAndArithmeticModuli A2.4 owns the algebraic `h⁰(A,L)=χ(L)` but not §5.3's explicit theta basis, so §5.3 is not a duplicate.
- The closest open roadmaps by vocabulary (ConvexityToric, HamiltonianReduction, SymplecticGeometry revisions) own nothing this roadmap owns.

**Sources at the sampled locators** (fetched through the sources service; page numbers are printed pages).

| Target | Locator | Text read | Supports the statement as written? |
|---|---|---|---|
| 1.1 | Schottenloher v15.6, Ex. 7.3, Rem. 7.4, pp. 96–97 | schottenloher lines 3994–4012 | Yes. T*Q with ω=−dλ, trivial line, ∇=L_X+2πiA, A=−λ, curvature dA=ω; Rem. 7.4 covers exact ω. Conjugating i and replacing 2π by 1/ℏ gives ∇=d+iθ/ℏ. |
| 4.1 | Schottenloher Def. 9.8 p. 125; Def. 10.1 p. 141 | lines 5049–5069, 5732–5750 | Yes. A real polarization is an integrable maximally isotropic distribution; polarized sections have ∇_X s=0 for X∈Γ(P). |
| 4.1, 3.3 | Demailly V §11 p. 267, Defs. 11.3, 12.1 pp. 267–268 | demailly lines 13142–13223 | Yes. Pic = H¹(X,𝒪^×) (11.2); canonical (0,1)-connection (11.3); Chern connection (12.1). |
| 3.3, 3.4 | Demailly VI §9.1 (9.1) p. 314 | lines 15562–15573 | Yes, for compact connected Kähler X. The README proves H¹(𝒪)=H²(𝒪)=0, which the isomorphism needs. |
| 6.2 | Demailly VII Thm 13.1 pp. 358–359, Cor. 13.3, Thm 14.1 p. 359 | lines 17559–17639 | Yes. Jet surjectivity for k≥C(m+1), positive ⇔ ample, Kodaira's criterion. The README's peak-section route is a sketch, not the cited proof. |
| 6.1 | Sjamaar v1 §2.2 (2.3) p. 24 | sjamaar lines 1233–1254 | Yes. ξ_L=ξ_M,hor+2πΦ^ξν_L and ξ·s=−∇s+2πiΦ^ξ s; with μ=2πΦ this is the README's `a·s=−∇_(X_a)s+i(nμ_a−λ_a)s`. |
| 6.6 | Sjamaar Prop. 2.11 pp. 24–25 | lines 1259–1290 | Yes. Global G_ℂ-action assumed (line 1255), as the README says; invariant-section sheaf is a V-line bundle. |
| 6.7 | Sjamaar Thm 2.15 pp. 27–28 | lines 1439–1478 | Yes. Γ(M₀,L₀)≅Γ(M^ss,L)^G≅Γ(M,L)^G. His 8π‖Φ‖² becomes 4‖μ‖² under μ=2πΦ and time rescaled by 2π, so the README's 4n is right. |
| 6.3a | Meinrenken v2 (3)–(5) p. 2 | meinrenken lines 52–67 | Yes. χ(g)=∫_{M^g}Td·Ch_g/D_g, D_g=det(I−(g♯)⁻¹e^{−(i/2π)F}), all fixed components. |
| 6.5 | Meinrenken Thm 2.1 p. 5 | lines 181–199 | Yes. Regular µ, m≫0, and m=1 for abelian G; the README's large-n and vanishing hypotheses cover the virtual-to-H⁰ step. |
| 6.9 | Meinrenken (17)–(21) pp. 6–7 | lines 219–240 | Yes. Sector phases ρ_µ(g_j⁻¹)c_L(g_j), quasi-polynomial in m with period k. |
| 6.3a, 6.4 | Vergne v1 §3 p. 4, Thm 3.2 p. 5 | vergne lines 159–213 | Yes. Torus G, g^λ=e^{i⟨λ,X⟩}, delocalized RR, Θ_M(k)∼k^d Σ k^{−n}DH_n. |
| 4.2, 6.3, 6.11 | none (deductions, library names, K7.2 monomials) | — | Inputs checked at the pins; see the table below. |
| 6.10 | none | — | R06. |

**Adversarial table** (values I computed; ℏ=1 unless stated).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conventions `[X_f,X_g]=−X_{ {f,g} }` | ω=dq∧dp, f=q², g=p | X_f=−2q∂p, X_g=∂q, [X_f,X_g]=2∂p; {f,g}=df(X_g)=2q, X_{2q}=−2∂p | agrees |
| Conventions F_∇, c₁ | θ=p dq, ∇=d+iθ/ℏ | F=i dθ/ℏ=−iω/ℏ, F(∂q,∂p)=−i/ℏ; iF/2π=ω/(2πℏ) | agrees |
| Conventions π♯=−(ω♭)⁻¹ | f=q, g=p | X_q=−∂p, X_p=∂q; π(dq,dp)=−dp(X_q)=1=dq(X_p) | agrees |
| §1.1 holonomy | β=ℏ dq/2, q-period 1; bounding cycle | exp(−(i/ℏ)(ℏ/2))=exp(−i/2); period 2πℏ gives 1; ∮θ=−∫ω gives exp((i/ℏ)∫ω) | agrees |
| §1.1 integrality | sphere areas 2πℏk, πℏ | k; 1/2 (fails); dual −1 | agrees |
| §2.1 lift | a=dt−p dq | Y_q=∂p+q∂t, Y_p=−∂q, [Y_q,Y_p]=∂t=Y₁ | agrees |
| §2.1 opposite lift | same | F_q=−∂p+q∂t, F_p=∂q+2p∂t, [F_q,F_p]=−2∂t−∂t=−3∂t=F_{−1}−2V | agrees |
| §2.1 Cartan formula | F over H, a(F)=f/ℏ | L_F a=ι_F da+d(a(F))=(1/ℏ)π*(ι_Hω+df); H=+X_f gives 2df/ℏ | agrees |
| §2.2 commutator | polarized q | Q_q=−i∂p+q, Q_p=i∂q; Q_qQ_p(q)−Q_pQ_q(q)=iq−2iq=−iq=−iQ₁q | agrees |
| §2.2 deficiency, half-line | iℏu′=±iu | e^{q/ℏ}∉L²; e^{−q/ℏ}, ‖·‖²=ℏ/2; indices (0,1), then (0,∞) after ⊗L²(ℝ_p) | agrees |
| §2.2 Stone, constant f | f=c | flow of (c/ℏ)V gives U_t=e^{itc/ℏ}, (U_t−1)/(it)→c/ℏ=Q_c/ℏ | agrees |
| §2.3 descent | Circle on a point | μ≡ℏ: e^{−2πi}=1, descends; μ≡ℏ/2: e^{−πi}=−1, does not | agrees |
| §2.3 extension bracket | translations, c=1 | −[Y_{μξ},Y_{μη}]=−Y_{μ[ξ,η]}−(c/ℏ)V, so central term −1/ℏ | agrees |
| §2.3 Ĝ quotient | f∈F | (f,χ(f)⁻¹): p↦p·χ(f)·χ(f)⁻¹=p | agrees |
| §3.1a normalization (R01) | SU(2) | [H₀,A₀]=2B₀, [A₀,B₀]=2H₀, [B₀,H₀]=2A₀; exp(2πH₀)=I, exp(πH₀)=−I; equals LieGroups line 751 | correct but duplicated |
| §3.2 fixed-moment character | ξ∈Lie(H) at eH | −Y_{μ^ξ}=−(μ₀(ξ)/ℏ)V, principal character e^{−itμ₀/ℏ}=λ⁻¹, line fibre λ; SO(3), r=1/2: e^{iπ}=−1, no λ | agrees |
| §3.3 Picard | ℂP¹; elliptic curve | degree (1); h^{0,1}=1, so not injective (negative control) | agrees |
| §3.4 central phases | U(N) at [e_N], SO(3) | ζI gives ζ^{a(N−1)+b}; O(k): ζ^{−k}; U(3) O(1): e^{−2πi/3}; X*(T)→P is a↦2a, image 2ℤ = root lattice | agrees |
| §4.1 polarized sections | P=span ∂p | ∇_{∂p}q=0, ∇_{∂p}p=1 (θ(∂p)=0) | agrees |
| §4.2 observables | p, p², A_P Leibniz | [∂q,∂p]=0; [2p∂q,∂p]=−2∂q; Q_{p²}1=−2p²+p²=−p², ∂p(−p²)=−2p; [aX_f+fX_a,Y]=a[X_f,Y]−Y(a)X_f+f[X_a,Y]−Y(f)X_a | agrees |
| §5.1 half-densities | v=q∂q; v=∂q, u=0 | L_v^{1/2}φ=qφ′+φ/2; U_tφ=φ(q−t), d/dt=−φ′=(i/ℏ)(iℏφ′); group law of the phase integral checked | agrees |
| §5.2 dimensions | ℂP¹ k=1,2; ℂP² k=2 | 2, 3; binomial(4,2)=6 | agrees |
| §5.3 automorphy (R02) | general k; k=1, α=β=0 | c_{m+k}=exp(2πi(m+α)τ−2πiβ+πikτ)c_m; k=1 ratio exp(πiτ(2m+1)) = theta ratio; Lean: jacobiTheta₂ ∈ thetaSections 1 τ 0 0 | agrees; statable |
| §5.3 metric, curvature | τ=i, k=1 | metric ratio e^{−4πy−2π} × automorphy norm e^{4πy+2π} = 1; A=∂log h=2πik(Im z/Im τ)dz; F=∂̄A=−2πik dq∧dp=−(i/ℏ)ω | agrees |
| §5.3 holonomy, Bohr–Sommerfeld | k=2, α=0, 1/2; k=1/2 | q-loop: e^{−2πiα}e^{−2πikp}; p=0, 1/2 give 1, p=1/4 gives −1; α=1/2 gives 1/4, 3/4; cocycle e^{−2πik}=−1 at k=1/2 | agrees |
| §6.1 weights | ℂP¹ (0,2), twist 1 | x^{n−j}y^j has weight −2j; twisted n−2j; n=1: ±1 | agrees |
| §6.2 residues | m=3, k₀,k₁,k₂=2,4,1 | k≥4 covers 12, 13, 14, … | agrees |
| §6.3 frequency | P=2π, 1; frequency 1/2 | 1; 2π; e^{iπ}=−1 | agrees |
| §6.3a fixed points | O(1), u=e^{−2it} | 1/(1−u)+u/(1−u⁻¹)=1+u; t=π/2: 0; ∫(1+c)²=2; ABBV check Σ C_{O(1)}(p)/e_p=0+(−2iX)/(−2iX)=1=∫c | agrees |
| §6.3a rescaling | form/polynomial degree (a,b) | term ∝ n^{d−a−b}=n^{d−j}; j=0 term (2π)^{−d}∫e^{i⟨μ,X⟩}ω^d/d!; O(n): 1+1/n | agrees |
| §6.4 limit | ℂP¹ (0,2); ℂP² O(1); point | mass (n+1)/n→1, density 1/2 on [−2,0]; binomial(n+2,2)/n²→1/2=(2π)^{−2}∫ω²/2; δ_κ | agrees |
| §6.5 admissible coset | [pt/μ₂]; doubled ℂP¹ | (1±1)/2 = 1, 0; Ann(H_B) has index |H_B|=2 | agrees |
| §6.6 potential | ℂP¹ (0,1), n=2, λ=−1, [1:1] | 2 log cosh a: 0, 0, 2; formula 4(μ(e^{−2a})+1/2)=2 tanh a; Hess 2mn·dμ/da=4·½=2; support {−1,0,1} | agrees; Check wording R07 |
| §6.6 complex torus | circle, T² | [0],[2π]↦1, [i]↦e^{−1}; [(π,0)]↦(−1,1) | agrees |
| §6.7 Kostant | r=1/4, xy | ‖s‖²=4/25, η=3/10, g(X,X)=8/25, dμ/dt=−24/125, d‖s‖²/dμ=−3/5, product 72/625=4·2·(3/10)²·(4/25) | agrees |
| §6.8 positivity, normal factor | ε=½, C₀=3; μ₂ eigenvalue −1 | nε−C₀: 0 at n=6, ½ at n=7; 1−(−1)=2 | agrees |
| §6.9 quasi-polynomial | CP² (0,1,2), n=6 | C_n(j)=⌊j/2⌋+1: j=2,3 give 2,2; leading terms 1, 3/2; errors 1, ½; μ₂ stratum {y=0} has smaller reduced dimension | agrees |
| §6.10 transport | T² on ℂP¹ | β=(0,b): quotient weights −j; β=(1,b): −j−n; adding nβ gives (−j,nb) in both cases | agrees |
| §6.11 counts | (0,1,−2) n=2,3; densities | {0,1,−2,2,−1,−4}; degree 3: 0 twice plus 8 singles = 10; areas 1/3+1/6, 1/4+1/4 | agrees |
| Docstring "not statable" claims | both pins | no principal connection or associated line; theta refuted by the scratch file | R02 |

**Headline theorems (README) and their status in `Suggested.lean`.** Every headline except one is correctly named in the docstring as not statable, for the carrier stated:
- §2.1: Hamiltonian lift and commutator;
- §2.2: complete-flow unitary group and essential self-adjointness;
- §2.3: covering lift, descent and circle extension;
- §3.1: homogeneous line/character equivalence;
- §3.2: fixed-moment integrality;
- §3.3–3.4: Picard/Chern and forgetful maps;
- §4.2–4.3: polarization preservation;
- §5.1: cotangent half-densities;
- §5.2: projective quantization (also owned by ComplexKahlerGeometry K7.2);
- §6.2: positive line and index;
- §6.3a: equivariant Riemann–Roch;
- §6.4: distribution limit;
- §6.6–6.8: regular quantization commutes with reduction;
- §6.9: uniform quasi-polynomials.

The exception is §5.3's theta dimension (R02). The Layer 3 compact-root bullet goes with R01.

## Not verifiable

- **Graham–Vogan** (§3.1 Ex. 5.8 p. 25; §3.2 Def. 6.4 p. 37; §5.1 Def. 5.5 and (5.7) pp. 23–25). I fetched the author-page PDF through the sources service. Its text layer is glyph codes, and `pdftotext` on pp. 25–26 gives the same; OCR is not installed here. These locators were not re-read this round.
- **Not in this round's sample, not re-read:** Tuynman (§2.3), Ma–Marinescu (§6.8) and Schottenloher Thm 7.8, Props. 7.10, 7.15–7.16, 11.5 (§§2.1–2.2, 4.3, 5.3).
- **Elaboration and the gate at main's pins** are outside the Lean commands this review may run, because the worktree builds at `a91d3aa`. R02's code uses only lemmas I found at both Mathlib pins. R03's merge was checked by a print-only merge-tree.

## Source issues

- **Error** in sjamaar at Theorem 2.15 proof, printed p. 28 (sjamaar line 1487): the source says the gradient-flow limit F∞x lies in the complex orbit G_ℂx, so the invariant section keeps its value; it should say F∞x lies only in the orbit closure, with nonvanishing from the increasing norm and continuity; affects the proof.
- **Misprint** in demailly at VI §9.1, printed p. 314 (demailly line 15573): the source cites (V-11.6) for H¹(X,𝒪)≃H^{0,1}(X,ℂ); it should cite (V-11.5), the Dolbeault isomorphism, since (11.6) is a notation item; affects nothing.
- **Misprint** in demailly at proof of VII Theorem 13.1, printed p. 359 (demailly line 17604): the source calls the canonical section h with divisor E a section of 𝒪(E)⁻¹; it should be a section of 𝒪(E), as the following division by h^(m+1) requires; affects the proof.
