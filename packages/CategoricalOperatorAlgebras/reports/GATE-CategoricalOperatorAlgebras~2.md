# GATE-CategoricalOperatorAlgebras~2: answers to the review of 84eff3a

Commits `3f8904c` and `c443e68` on the pull-request branch (not pushed); the second repairs the merge-order direction (see Gate). Files changed:
`TauCetiRoadmap/CategoricalOperatorAlgebras/README.md`, `TauCetiRoadmap/CategoricalOperatorAlgebras/Suggested.lean`.

## H01 (CBirkbeck) — applied

The TemperleyLiebOperatorAlgebras supplier bullet (old README lines 71–73) is deleted, and the scope section now says TemperleyLiebOperatorAlgebras consumes CA1a/CA2a. The new section "Downstream consumers" lists it as a consumer. In CA8, "from TemperleyLiebOperatorAlgebras A3–A6's dagger trace quotient/category" (old lines 688–691) becomes a target owned here: the unshaded positive TL factor planar algebra TL(δ) at each permitted modulus. Its P[n] is the span of planar matchings modulo the negligible ideal, so P[odd]=0. Its even restriction is identified with Subfactors S6's shaded TL example (`TauCetiRoadmap/Subfactors/README.md` line 455), the shading switch is the identity on matchings, and positivity comes from S6. Old line 770 now cites "the Temperley–Lieb examples TL(δ) constructed above", and CA8's `*Needs:*` line names Subfactors S6 with no TemperleyLiebOperatorAlgebras edge.

## H02 (CBirkbeck) — applied

- **`*Needs:*` lines.** Every layer block (CA1a, CA1b, CA2a, CA2b, CA3–CA10) now ends with a `*Needs:*` line naming the earlier layers, the Mathlib/Tau Ceti declarations and the supplier sections it uses. For example, CA3 needs CA1a, CA1b, CA2a and Subfactors S2 and S5, and CA8 needs CA1b, CA2a, CA2b, CA7, Subfactors S2/S6/S7/S8, FreeProbability F4 and OperatorKTheory K1–K2.
- **Supplier contracts.** A new `## Exact supplier contracts` section has From Mathlib and From Tau Ceti bullets and one bullet per supplier, stating the sections consumed. VonNeumannAlgebras is widened to the V4–V6 and V11–V13 the body actually uses, and OperatorAlgebraDynamics D6 is added for `O_n`.
- **Reading guide.** A `## How to read the build` paragraph is added.
- **Checks.** Every layer gets a `**Checks.**` list of 3–4 computed bullets. These include:
  - the requested Q-system rescaling on `M_n(ℂ)`: `mm†=n²`, then `m′m′†=1` and `i′†i′=n²`;
  - the balanced projector: the identity for `Q=1`, and a rank-1 range inside the n²-dimensional `X⊗Y` for `M_n` with row and column vectors;
  - the two-dimensional symplectic sign `J(a,b)=(−b̄,ā)`, `J²=−1`;
  - the one-edge regression (16, 1);
  - the II∞ amplification with n=2;
  - the `N(δ²)` values.
- **Not done.** This is one Checks list per layer, not three Checks for every individual definition of the 10-layer README.

## H03 (CBirkbeck) — applied differently

`Suggested.lean` now has the module docstring "Categorical operator algebras: target signatures" and namespace `TauCetiRoadmap.CategoricalOperatorAlgebras`. The docstring states that the README is the roadmap and lists the headline theorems of CA2a–CA10, each with the carrier that is missing at the pin (no dagger/C*/W*-category, planar or anchored operad, operator K-theory, Jones/Watatani index, II₁ or hyperfinite factor, normal correspondence or Connes fusion).

The file now declares nothing: no headline is statable at the pins, and none of the old 17 declarations (`Dagger`, `QSystem`, `QSystemBimodule`, `balancedProjector`, the rescaling maps, `UnitarySplitting`, `RealStructure`, …) is needed to state a headline. Adding their names to the README, as suggested, would have kept an API catalogue in the acceptance test. With the declarations gone, the README/Lean agreement holds vacuously and the unused-binder point is moot.

The binder claim itself is correct. The theorems sat after `variable [MonoidalDagger (C := C)]`. For `d₂ ≤ 0`, `Real.sqrt d₂ = 0` and `Real.sqrt (d₂/d₁) = 0`, so both sides of each equation are 0. `_mul` also holds for `d₁ ≤ 0`, because Lean's `d₂/0 = 0`. `_unit` needs `0 < d₁`: with `d₁=0, d₂=1` it reads `0 = MonObj.one`.

The `TauCeti.CategoryTheory.Monoidal.Rigid.Basic` import is dropped because nothing uses it; it stays in the README's supplier contracts for CA2a.

## H04 (CBirkbeck) — applied

All four sorried theorems are deleted (see H03). Their mathematics stays in the README: CA3's balanced projector paragraph and the rescaling paragraph, plus the new CA3 Checks.

The computation behind the projector theorems was redone and is correct. Right Frobenius `(ρ⊗1)(1⊗m†)=ρ†ρ` and `ρ(1⊗i)=1` give `p=(1⊗λ)(ρ†⊗1)`, and symmetrically `p=(ρ⊗1)(1⊗λ†)`. Hence `p†=p`, and `p²=(1⊗λλ†λ)(ρ†⊗1)=p`. These are API lemmas, not headlines.

## H05 (CBirkbeck) — applied (shaded correspondence); disputed (free-graph kernel criterion)

**Shaded correspondence: applied.** The old CA2b text "connected zero boxes `P_(0,±)=ℂ` … `1=1_+⊕1_-` with simple summands" becomes "shaded … planar C*-algebras with finite-dimensional boxes ↔ triples with an orthogonal decomposition `1=1_+⊕1_-`; 1_± need not be simple; `P_(0,±)≅End(1_±)` are finite-dimensional commutative C*-algebras". The connected case `P_(0,±)=ℂ` ↔ simple 1_± is kept as a sentence and a Check: the path graph `u₁—w—u₂` gives `P_(0,+)=ℂ²`. Evidence: Penneys-UDF line 165–187 (Theorem C, p. 4) has no simplicity, and the p. 23 dictionary (line 1063–1065) pairs "connected" with simple 1_±.

**Kernel criterion: disputed.** The CA7 statement "For a connected graph prove `A(Λ,μ)=∅` implies `S(Λ,μ)∩K(F(X))=0`" already has the source's generality. Hartglass–Penneys §5 fixes the standing hypothesis "a connected undirected graph Λ" at HP-CstarPlanarI line 1520 (p. 34). Theorem 5.23 (line 1732–1733, p. 39) is stated under it, and its proof uses that `S(Λ,μ)` completes to a II₁ or II∞ factor (Lemma 5.21), which requires connectedness.

## H06 (CBirkbeck) — applied

CA3's "For the standard solution prove `d_Q=d(X)²=Ind(E₀)≤[M:N]`, with equality exactly in the extremal case" becomes "prove `d_Q=d(X)²`; then Subfactors S2 gives `d(X)²=Ind(E₀)≤[M:N]` and Subfactors S5 gives equality exactly in the extremal case". The citations were checked in `TauCetiRoadmap/Subfactors/README.md`:
- S2, lines 184–186, states `Ind(E_0)=d(X)^2≤[M:N]`.
- S5, lines 397–403, proves that E_N is minimal iff the inclusion is extremal, equivalently `d(X)^2=[M:N]`.

The suggested repair cited only S2. S2 alone does not state the equality case, so S5 is cited for it.

## Build

`lake build TauCetiRoadmap.CategoricalOperatorAlgebras.Suggested`: `Build completed successfully (8976 jobs)`, no warnings (the file has no `sorry`).

**Signature check.** The file has no declarations, so a `#check @name` scratch file has nothing to elaborate and no signature is compared. The old file's binder defect (the `[MonoidalDagger]` instance carried by the rescaling theorems) disappeared with the declarations.

## Gate

```
gate CategoricalOperatorAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

**Direction repair.** The earlier gate run reported `depcheck: UPWARD: CategoricalOperatorAlgebras (#236) -> HilbertModules (#239) at README lines [197, 237, 520, 838, 987]`. HilbertModules comes later in the merge order, so the notions this roadmap takes from it move down and are stated here as targets. Only the parts actually used moved:
- **CA1a.** Right Hilbert B-modules as Mathlib `CStarModule` over `Bᵐᵒᵖ`. The pinned axiom `inner_op_smul_right`, `⟪x,a•y⟫=a⟪x,y⟫` (`Mathlib/Analysis/CStarAlgebra/Module/Defs.lean:78`), is a left-module convention. Also moved: adjointable maps with automatic linearity and boundedness, the C*-category `L_B(E,F)`, rank-one operators θ, the ideal `K_B`, `K_B(B)≅B`, and the linking algebra `K_B(E⊕B)`.
- **CA1b.** The interior tensor product with its balancing, the adjointability of `T⊗1` and `1⊗S`, and the associator and unitors (the `B⊗_B F` unitor only for nondegenerate φ). Also: imprimitivity bimodules, strong Morita equivalence as an equivalence relation, full corners, the Rieffel correspondence and the Morita invariance of simplicity.

All HilbertModules supplier citations are removed: the supplier bullet and the CA1a, CA1b, CA3, CA7 and CA8 `*Needs:*` lines and texts now cite CA1a/CA1b. HilbertModules is listed under "Downstream consumers" as consuming CA1a–CA1b. The new statements cite Lance (Ch. 1, Ch. 4) and Raeburn–Williams (Ch. 3) by chapter. Both are paywalled books, so they are cited by locator only and are uncertified. `sources.toml` is not in this job's editable set, so they are not recorded there. Ownership consequence: HilbertModules' open pull request plans the same objects in H1–H3. It should consume these CA1a–CA1b targets instead of planning them again; the rest of HilbertModules (stabilization, continuous trace, regularity, localization) is untouched.

Depcheck after the repair, plain and with `--movable`:

```
depcheck: 162 roadmaps, 1151 edges, 0 problem(s)
```

There are no UPWARD, CYCLE or `moved:` lines, so the earlier note about moving this roadmap and TemperleyLiebOperatorAlgebras below HilbertModules no longer applies.

## Ownership and citations

- **TL(δ).** The unshaded TL planar algebra is owned here. TemperleyLiebOperatorAlgebras A3–A6 builds the positive quotients and the unitary TL category but no unshaded planar algebra. Subfactors S6 builds only the shaded example, which CA8 consumes.
- **Citations resolved at the given heads.** Subfactors S2/S5/S6 (`TauCetiRoadmap/Subfactors/README.md`); TemperleyLiebOperatorAlgebras lines 92 and 386 (it consumes CA1a/CA2a); VonNeumannAlgebras V5–V13, which exist only in the fuller of its two open checkouts (the other stops at V4); CStarAlgebras C1–C5; OperatorKTheory K1–K8.
- **Main.** FreeProbability F2–F4, OperatorAlgebraDynamics D6 (`O_n`, line 457) and PivotalSpherical Layers 0–4 and 9 are on main.
- **Pinned declarations** checked in Mathlib at the pin: `HasRightDual` (`Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean:236`), `CStarModule` (`Mathlib/Analysis/CStarAlgebra/Module/Defs.lean:72`), `VonNeumannAlgebra` (`Mathlib/Analysis/VonNeumannAlgebra/Basic.lean:67`) and `Mathlib/CategoryTheory/Monoidal/DayConvolution.lean`. No dagger category exists in Mathlib or Tau Ceti at the pins.
- **Sources.** Penneys-UDF (arXiv 1808.00323v1) and HP-CstarPlanarI (arXiv 1401.2485v1) were fetched through the sources service from arXiv. `sources.toml` is not among the files this job may edit, so they are not recorded there. No text was missing, so there is no `needs-references.toml` entry.
- **Untrusted text.** Nothing in the review was suspicious.

## Adversarial pass (statements added or changed)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| CA2b correspondence without connectedness | path graph u₁—w—u₂ (Penneys Ex. 4.7, line 1246) | `1₊=E_{u₁u₁}⊕E_{u₂u₂}` ⇒ `P_(0,+)=ℂ²`, `P_(0,−)=ℂ` | satisfies the new hypotheses, excluded by the old | Check added |
| CA2b closures faithful positive | unitary dual functor, f∈End(X) | `tr_L(f†f)=((1⊗f)coev)†((1⊗f)coev)≥0`; zero ⇒ `(1⊗f)coev=0` ⇒ f=0 by the zigzag | holds | none |
| CA8 TL(δ) | δ=√2, δ=2 | P[1]=P[3]=0; dim P[2]=1; P[4] Gram `[[δ²,δ],[δ,δ²]]`, det `δ²(δ²−1)` = 2 at δ=√2 and 12 at δ=2; one-click rotation fixes the P[2] cup ⇒ ε=+1 | positive, symmetric self-dual | target added |
| CA8 TL(√2) principal graph | A₃ | dims (1,√2,1); `δ·1=√2`, `δ·√2=2=1+1`; K₀=ℤ³ | eigenvector relation holds | Check added |
| CA8 `N(δ²)` | δ²=2, (3+√5)/2≈2.618, 3, 4 | 3, 3, 4, 5 | 4 excluded at δ²=4 as the theorem says | Check added |
| CA3 `d_Q=d(X)²` then S2/S5 | `M_n(ℂ)`, ⟨x,y⟩=n⁻¹Tr(x*y) | `i†i=1`, `mm†=n²`; after rescaling `m′m′†=1`, `i′†i′=n²`; wrong rescaling `d_Q⁻¹m` gives `n⁻²` | consistent | Check added |
| CA3 morphism rescaling | f:ℂ→M_n, d₁=1, d₂=n² | `f′(i₁′1)=n·1=i₂′(1)`; unscaled gives `1≠n·1` (n≥2) | factor `√(d₂/d₁)` needed | Check added |
| CA3 balanced projector | Q=1; Q=M_n with row and column vectors | p=id; rank of p = `dim(ℂ^n⊗_{M_n}ℂ^n)` = 1 inside n² | consistent with the coequalizer | Check added |
| CA2a signed self-duality | ℂ², J(a,b)=(−b̄,ā) vs (b̄,ā); ℂ | J²=−1 vs +1; on ℂ `J²=|c|²=1` | ε=−1 only in even dimension | Check added |
| CA2a sign law | flip braiding, ℂ²⊗ℂ² | `(J⊗J)²=(−1)(−1)=+1` | matches `ε(r⊗r)=ε(r)²` | Check added |
| CA2a characters | Hilb(ℤ/2); `End†(Hilb_fd⊕Hilb_fd)` | `χ(g)²=1, χ>0 ⇒ χ=1` (ℂ× would give ±1); pair groupoid ⇒ one parameter t>0 | ℝ>0 target discriminates | Check added |
| CA1a C*-identity | diag(2,1), operator vs Hilbert–Schmidt norm | 4=2²; HS: √17 ≠ 5 | HS excluded | Check added |
| CA1a unitary splitting | e=[[1,1],[0,0]] | ‖e‖=√2; retract (x,y)↦x+y has norm √2 ≠ i†=(x,y)↦x | only diag(1,0) splits unitarily | Check added |
| CA1b nondegeneracy | A=ℂ² on X=ℂ, zero action | `⟨a⊗x,a′⊗x′⟩=0` ⇒ A⊗_A X=0 ≠ ℂ | unitor fails | Check added |
| CA4 CP | transpose on M₂ | `(id⊗T)(Σe_ij⊗e_ij)` = flip, eigenvalue −1 | excluded by CP | Check added |
| CA5 discreteness ≠ compactness | N⊆N⋊ℤ/2, N⊆N⋊ℤ (outer) | d_Q=2; ℤ: infinitely many invertible summands | compact vs not | Check added |
| CA6 representability | V=Hilb(ℤ) → Hilb_fd; V=Hilb(ℤ/2) | coefficients ℂ at every n (infinite support); Tr_V(ℂ)=ℂ₀⊕ℂ₁ | criterion discriminates | Check added |
| CA7 one-edge, loop, rescaling | μ=(16,1); one loop μ=1; c=3 | a=2: 4=4; a=1/2: 1/4 vs 64; `a_μ(v)=1<16`, `a_μ(w)=16>1` ⇒ A={v}; loop `a_μ=1` ⇒ A=∅, S=C[−2,2], K₀=ℤ, K₁=0; `τ_{3μ}(p_v)=48` | consistent with Thms 5.23, 5.25 | Checks added |
| CA9 End_rev | u=diag(1,i), v=[[0,1],[1,0]] | uv=[[0,1],[i,0]], vu=[[0,i],[1,0]], not proportional | `σ∘ρ≠ρ∘σ` | Check added |
| CA9 ultrapower, amenability, II∞ | M=M_n; K=Irr(C); n=2 | M^ω=M, M_ω=ℂ; F·K=Irr(C) ⇒ `|(F·K)△K|_σ=0`; cocycle 2^(−it), ρ̃(u_t)=u_t | consistent | Checks added |
| CA10 tube algebra | Hilb_fd; Hilb(ℤ/2) | dim 1; `Σ dim Hom(i⊗k,k⊗j)=2·2=4`, commutative ⇒ 4 simples | consistent | Checks added |
| CA1a adjointable maps | inclusion J={f:f(0)=0}⊆C([0,1]) | adjoint S forces `j̄(b−Sb)=0` ∀j ⇒ (j(t)=t) `b=Sb` on (0,1] ⇒ S=id, `S1=1∉J` | bounded B-linear but not adjointable; bounded-module-map model excluded | Check added |
| CA1a θ and `K_B(B)≅B` | B=M₂(ℂ) | `θ_(e₁₁,e₂₁)z=e₁₁e₂₁*z=e₁₂z`; `θ_(x,y)†`: `⟨x⟨y,z⟩,w⟩=⟨z,y⟩⟨x,w⟩=⟨z,θ_(y,x)w⟩`; adjoint left mult. by e₂₁; span of `ab*` = M₂ | holds | Check added |
| CA1a `Tθ_(x,y)S=θ_(Tx,S†y)` | general | `T(x⟨y,Sz⟩)=Tx⟨S†y,z⟩` | holds | none |
| CA1a `L_B(0)` | E=0 | zero algebra, unit 0 (norm-one condition only for nonzero algebras, as in the CA1a Check) | consistent | none |
| CA1b imprimitivity / Rieffel | ℂ² as M₂–ℂ; E=ℂ⊕0 over ℂ² | `_A⟨x,y⟩z=xy*z=x(y*z)`; ideal lattices `{0,whole}` both; E: `K(E)≅ℂ`, `⟨E,E⟩=ℂ⊕0≠ℂ²` | fullness needed, else simple ℂ ~ non-simple ℂ² | Check added |
| CA1b full corner | p∈M(A), closure span ApA=A | Ap: `⟨x,y⟩=x*y∈pAp`, full; `K_{pAp}(Ap)=closure span ApA=A` | A–pAp imprimitivity bimodule | none |
| CA1b simplicity transfer | lattice iso, A=0 | 0↦0, B↦closure span `_A⟨E,E⟩`=A (A≅K_B(E)); A=0 ⇔ E=0 ⇔ B=0 | simplicity (nonzero, two ideals) transfers | none |
| CA1b `B⊗_B F≅F` | zero φ on ℂ over ℂ² | form vanishes, tensor 0 ≠ ℂ | nondegeneracy kept as hypothesis | existing Check |
