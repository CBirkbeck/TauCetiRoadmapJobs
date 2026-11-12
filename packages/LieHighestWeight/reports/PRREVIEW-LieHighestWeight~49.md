# Review of LieHighestWeight (pull request #1220 at 81a68b8)
Folder: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/`
**Verdict:** needs changes

This is the same head the previous review read. Both of that review's findings (the family index and the generated summary) are still open: R07 and R08 below. This full pass finds six more:

- one P2: a headline the module docstring calls not statable can be stated;
- five P3: two targets restate pinned theorems; one docstring headline has no README target; two References entries are cited nowhere; Lean-style names name nothing; seven spacing slips.

The gate passes apart from the family index, which this pull request owns.

`README.md` and `Suggested.lean` are the folder's two files; the family index is `TauCetiRoadmap/RepresentationTheory/README.md`. `Mathlib/…` and `TauCeti/…` paths are at the manifest pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`). Main was read at `c110735`.

## R01 (P2) — The zero-fibre derivative identity is statable, but the docstring says it is not

**Location:** `Suggested.lean:48–51`: “The polynomial derivative comparison of the zero-fibre bracket with the linear Poisson formula needs that bracket as a constructed map; the pin has the zero-fibre specialization but no bracket, so only its existence and defining equation are stated.” The identity is a target at `README.md:1216–1225` and is exported to LieGroupoidsPoisson G4.6A at `README.md:3136–3137`.

**Claim:** The identity `E({p,q})(ξ)=ξ([dE(p)_ξ,dE(q)_ξ])` cannot be stated at the pins.

**Witness:** No constructed bracket is needed. The defining equation of `exists_reesZeroFiberBracket` determines the bracket uniquely, because `reesSpecializationZero` is onto, so the statement can quantify over it. The statement below elaborates with `lake env lean`; its only warning is the `sorry`.

**Repair:** Add the following to the Layer 3 section of `Suggested.lean`. It was tested at the pins as written.

```lean
/-- The gradient at `ξ ∈ L*` of a symmetric tensor read as a polynomial function on `L*`:
the vector `Σᵢ (∂ᵢ p)(ξ) • bᵢ` of `L`, in a basis `b`. -/
noncomputable def symmetricGradient {L : Type*} [AddCommGroup L] [Module ℝ L] {ι : Type*}
    [Fintype ι] (b : Module.Basis ι ℝ L) (p : SymmetricAlgebra ℝ L) (ξ : Module.Dual ℝ L) : L :=
  ∑ i, MvPolynomial.eval (fun j => ξ (b j))
      (MvPolynomial.pderiv i (SymmetricAlgebra.equivMvPolynomial b p)) • b i

/-- Every bracket with the defining equation of the zero-fibre bracket evaluates at `ξ` to the
linear Poisson formula `ξ([dp_ξ, dq_ξ])`. -/
theorem lift_reesZeroFiberBracket_eq_lie_symmetricGradient (L : Type*) [LieRing L]
    [LieAlgebra ℝ L] {ι : Type*} [Fintype ι] (b : Module.Basis ι ℝ L)
    (B : SymmetricAlgebra ℝ L →ₗ[ℝ] SymmetricAlgebra ℝ L →ₗ[ℝ] SymmetricAlgebra ℝ L)
    (hB : ∀ a c d : TauCeti.UniversalEnvelopingAlgebra.reesAlgebra ℝ L,
      a * c - c * a = TauCeti.UniversalEnvelopingAlgebra.reesParameter ℝ L * d →
      B (TauCeti.UniversalEnvelopingAlgebra.reesSpecializationZero ℝ L a)
          (TauCeti.UniversalEnvelopingAlgebra.reesSpecializationZero ℝ L c) =
        TauCeti.UniversalEnvelopingAlgebra.reesSpecializationZero ℝ L d)
    (p q : SymmetricAlgebra ℝ L) (ξ : Module.Dual ℝ L) :
    SymmetricAlgebra.lift ξ (B p q) = ξ ⁅symmetricGradient b p ξ, symmetricGradient b q ξ⁆ :=
  sorry
```

Then make three matching edits:

- **Docstring.** Delete the quoted sentence from the module docstring.
- **README §3.1 statement.** Name both declarations in §3.1. Read `E` there as `SymmetricAlgebra.lift ξ`, and `dE(p)_ξ` as `symmetricGradient b p ξ`.
- **README §3.1 API and Checks.** Give `symmetricGradient` its API and Checks:
  - the gradient of a generator `x` is `x`, which excludes the zero map;
  - the gradient of `1` is `0`;
  - for `[x,y]=y` and `ξ=(2,3)`, the gradient of `x²` is `4x`;
  - two bases give the same vector.

**Tested instance:** `[x,y]=y`, `b=(x,y)`, `ξ(x)=2`, `ξ(y)=3`. Both sides of the identity then agree:

| `p`, `q` | Left side | Right side |
| --- | --- | --- |
| `x`, `y` | 3 | 3 |
| `x²`, `y` | `{x²,y}=2xy`, value 12 | `ξ([4x,y])=12` |
| `y`, `x²` | −12 | −12 |

## R02 (P3) — Two targets restate pinned theorems, and one "the pin lacks" claim is false

**Location:**

- `README.md:2994–2998`: “A special node is one with coefficient `1` in the affine null-root relation … For surjectivity, prove every affine-diagram automorphism sends special nodes to special nodes”.
- `README.md:780–782`: “The pin does not prove … anything about point stabilizers, quotient topology, intermediate lattices or diagram automorphisms”.
- `README.md:1828`: “Export cartanEquivDual_weylGroup from native `rootInvariantForm.isOrthogonal_reflection`”.

**Claim:** Special-node preservation by affine-diagram automorphisms, and the Weyl-equivariance of the Killing duality, are new targets. The pin says nothing about diagram automorphisms.

**Witness:**

- `TauCeti/LinearAlgebra/RootSystem/AffineCartanMatrix.lean:349` has `RootPairing.Base.apply_mem_specialNodes_iff`: every symmetry of `b.affineCartanMatrix` permutes `b.specialNodes`. Its carriers are in the same file: `affineCartanMatrix` (:199), `affineMarks` (:103) and `specialNodes` (:150).
- `TauCeti/Algebra/Lie/Weights/InvariantForm.lean:293` has `TauCeti.weylGroupCorootRep_cartanEquivDual_symm`.

**Repair:**

- **Layer 10 supplier contract.** Add the following pinned declarations:
  - `RootPairing.Base.affineCartanMatrix`, `RootPairing.Base.affineMarks`, `RootPairing.Base.specialNodes` and `RootPairing.Base.apply_mem_specialNodes_iff` (`AffineCartanMatrix.lean`);
  - `TauCeti.matrixSymmetryGroup` (`TauCeti/LinearAlgebra/Matrix/Submatrix.lean:64`);
  - `RootPairing.Base.coweightLatticeBasis` and `RootPairing.Base.relIndex_corootSpan_coweightLattice` (`RootSystem/CoweightLattice/Basis.lean:113`, `:144`). These supply the identification of `P∨` with `Hom_ℤ(Q,ℤ)` and the orders of `P∨/Q∨` used in the Layer 10 Checks.
- **The isomorphism target.** Define `Aut(affine Cartan matrix)` as `TauCeti.matrixSymmetryGroup b.affineCartanMatrix`, and the special nodes as `b.specialNodes`. Replace “prove every affine-diagram automorphism sends special nodes to special nodes” by “by `RootPairing.Base.apply_mem_specialNodes_iff` it sends `0` to a special node”.
- **The absence claim.** At `:780–782` replace “or diagram automorphisms” with: “the pin has the Ω-action on nodes by affine Cartan symmetries and special-node preservation, but not the simply transitive action of Ω on special nodes or `Ω ⋊ Γ_root ≃ Aut`”.
- **§7.1.** Replace the export by consumption of `TauCeti.weylGroupCorootRep_cartanEquivDual_symm`.

**Tested on A₁:** the affine Cartan matrix is `[[2,−2],[−2,2]]` and the marks are `(1,1)`. Both nodes are special, and the swap is a symmetry, as the pinned theorem requires.

## R03 (P3) — The docstring lists category-O linkage as a headline that the README does not target

**Location:** `Suggested.lean:51`: “Category-O linkage lacks its category and integral block carriers.” `README.md:1851–1855`: the linkage principle “is strictly stronger and is a separate development, not identified with this orbit statement.”

**Claim:** Linkage is a headline of this roadmap.

**Witness:** No layer of the README states linkage as a target. `roadmaps grep -i 'linkage principle'` finds no owner on main or at any open head. So the README and the Lean file disagree, and the README leaves the item without an owner.

**Repair:** Delete the docstring sentence. Add one sentence to Scope and ownership: “The linkage principle of category `O` is not a target of this roadmap.” At `:1853–1854` replace “and is a separate development” with “and is excluded in Scope and ownership”.

**Check:** after the edit, the docstring names three unstatable headline families, each a README target.

## R04 (P3) — The References carry locators that no target uses

**Location:** `README.md:3173–3177`: De Concini–Procesi–Vergne, “§1, pp. 6–7; Definitions 2.5–2.9, pp. 8–10; Theorems 2.15 and 2.29, pp. 11 and 15; §3.1, Propositions 3.2 and 3.4 and Theorem 3.3”. Also `README.md:3221–3222` (Landsberg–Manivel).

**Claim:** These works support statements of this roadmap.

**Witness:** A grep of the README for each author name finds only these two entries. Their box-spline and cone-series content belongs to TensorProductCombinatorics §§1.5–1.6, as the former-numbering row at `README.md:73` says. The magic-square background is cited to Baez at `README.md:2482–2486`. The De Concini–Procesi–Vergne entry is new in this pull request; main's README has neither it nor any citation of it.

**Repair:** Delete both entries, or cite each one at the statement it supports. Test: afterwards, every References entry is cited in the body.

## R05 (P3) — Lean-style names that name nothing, and a docstring that misstates a hypothesis

**Location:**

- `README.md:1780`: “including pbwSymmetrization_symm_mem_degreeLE”;
- `README.md:1792–1793`: “centerPBWGradedMul”;
- `README.md:1743–1744`: “coadjointRepresentation … coadjointDerivation”;
- `README.md:2122`: “(imaginaryOctonion)”;
- `README.md:3054`: “slTwoPositiveBase”;
- `Suggested.lean:159`: “the PBW Rees algebra of a free Lie algebra over a commutative ring”.

**Claim:** These name declarations, and the theorem concerns free Lie algebras.

**Witness:**

- None of the six README names is declared at the pins or in `Suggested.lean`.
- The pinned `TauCeti.Lie.coadjointRepresentation` (`TauCeti/Geometry/Lie/Adjoint/Representation/Coadjoint/Basic.lean:80`) is a different object: a Lie-group representation.
- The pinned 7-dimensional module is `TauCeti.Octonion.imaginaryLieSubmodule`.
- The theorem assumes `[Module.Free R L]`.

**Repair:**

- **Names that name nothing.** Replace each with words:
  - “the inverse-filtration statement”;
  - “the normalized multiplication of degreewise centre symbols”;
  - “the coadjoint module `Module.Dual K L` and its derivation of `S(L*)`”;
  - “the positive base selecting `E₀₁`”.
- **The imaginary octonions.** Replace `(imaginaryOctonion)` with `TauCeti.Octonion.imaginaryLieSubmodule`.
- **The docstring.** Change “of a free Lie algebra” to “of a Lie algebra that is free as an R-module”. Check: `[x,y]=y` on `ℤx⊕ℤy` is free as a module but is not a free Lie algebra.

## R06 (P3) — Words run into digits

**Location:** `README.md:965` “item4”; `:1305` “characteristic2”; `:1312` “Lecture1”; `:2289` “summing to1”; `:2823` “and1”; `:2825` “degrees1,…,n”; `:2826` “degrees2,…,n”.

**Claim:** n/a (typography).

**Witness:** the seven spans above.

**Repair:** Insert the missing space in each. Test: `grep -nP '(?<![A-Za-z_\x60/.%-])(to|and|item|degrees|characteristic|Lecture)[0-9]\b'` then returns nothing.

## R07 (P3) — The family index still states the supply in the wrong direction

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:82–84`: “The highest-weight roadmap owns the concrete PBW project; Ado–Iwasawa consumes its injectivity, ordered-monomial, filtration, domain, and Noetherian consequences”. Also `:89–92`: “the smooth-group ↔ Lie-algebra correspondence that the highest-weight and compact-group roadmaps presuppose”.

**Claim:** Ado–Iwasawa takes PBW from this roadmap, and this roadmap presupposes LieGroups.

**Witness:** `README.md:76–77`: “AdoIwasawa consumes native ordered PBW … directly”. `README.md:139`: “LieGroups Layer 7 consumes the split Serre presentation of §7.1”. The description's own “Review considerations” say the same. The previous review raised this, and the head is unchanged.

**Repair:** The index belongs to this pull request, and a repair job edits only the folder's files, so the author must make this edit. Replace the two bullets with:

- “**PBW feeds both Ado–Iwasawa and Lie highest weight.** Both consume Tau Ceti's PBW theorems directly; the highest-weight roadmap adds normalized symmetrization and the first-order bracket on the Rees zero fibre.”
- “**Lie highest weight feeds Lie groups; Lie groups feed compact groups.** The highest-weight roadmap supplies the split Serre presentation that the Lie-group complexification layer consumes; the Lie-group roadmap builds the smooth correspondence the compact-group roadmap presupposes.”

**Test:** the new bullets agree with `README.md:76–79` and `:137–140`.

## R08 (P3) — The generated `roadmap-summary` block describes an earlier head

**Location:** description, generated block `roadmap-summary`: “while the type-A tensor decomposition weakens the highest-weight gap bound from strict to weak inequality”, and “applications to compact group centers as targets”.

**Claim:** This head changes a type-A gap bound, and compact-group centres are targets.

**Witness:**

- Neither file has a gap-bound target.
- `README.md:132–137` puts “the centre `P∨/Y` of a compact semisimple group” among the applications that “are not targets of this roadmap”.
- The author's prose below the block says the block is stale.

**Repair:** Regenerate the block from this head. It should name the Layer 0 basis headline, the reductive centre comparison and the affine lattice quotients, and drop both quoted clauses. Check on A₁: Layer 10 compares the lattice quotients `Y/Q∨` and `P∨/Y` (orders 1 and 2 for `Y=Q∨`), and no compact group is constructed.

## Verified sound

### Previous findings

| Previous finding | Passage at this head | Result |
| --- | --- | --- |
| R01 (P3), family index | index `:82–84`, `:89–92` unchanged | Not repaired: R07 |
| R02 (P3), generated summary | both clauses still in the block | Not repaired: R08 |

### Gate, build, signatures, padding

- **The worker's gate.** At this head every rule passes, with `build=0 OK`.
- **My rerun of the gate.** `outside-folder=1` for the family index, which is the pull request's own file. Every other rule is 0. The outside-folder diff command of the brief returns nothing.
- **Dependency check.** Output: `depcheck: 235 roadmaps, 2135 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 7.5 s, with 14 `sorry` warnings and nothing else. The file has 14 theorems and 9 definitions with real bodies. There is no `set_option`, no sorried data and no admitted example.
- **Signatures.** I ran `#check @name` on all 23 declarations in one scratch file. The two flagged as having lost a binder keep `[IsTriangularizable K H L]` as `inst_7`, and the invariant-form theorem keeps `IsAlgClosed K`. `TauCeti.coweightPairing` is ℤ-valued (`TauCeti/Algebra/Lie/Weights/WeightLattice.lean:100`). Each type matches its README statement.
- **One-tactic probe.** On a scratch copy, each `sorry` became `first | rfl | (simp; done) | infer_instance | decide | exact?`. All 14 fail, so I found no padding.
- **Layer 0 headline, recomputed independently.** In exact rational arithmetic I checked every clause for 0≤m,n≤4: each string lies in `P_m⊗P_n`, the strings have full rank `(m+1)(n+1)`, every Gram entry equals its formula, and the `det^r`-twisted intertwining holds for two random invertible rational `g` per `(m,n)`. That is 3,725 equalities and 0 failures. Sample Gram diagonals:
  - (1,1): 1, 1/2, 1, 2;
  - (2,2): 1, 1/4, 1/6, 1/4, 1; 1, 1/2, 1; 3.

### Adversarial table

| Statement | Instance | Values on each side | Result |
| --- | --- | --- | --- |
| `polynomialMonomial` | (0,0), (2,1), (1,2) | 1; xy with coefficient 1; 0 (truncated subtraction would give y²) | Keep |
| `polynomialAction` | `[[1,1],[0,1]]`; diag(2,3) | x↦x, y↦x+y; xy↦6xy (contragredient: xy/6) | Keep |
| `tensorPolynomialOperator` | x⊗x, y⊗y, y⊗x | y⊗x+x⊗y; 0; y⊗y | Keep |
| `polynomialTensorHighest` | m=n=1, r=1; swap g | x⊗y−y⊗x, killed by E_tot; image −(x⊗y−y⊗x), det −1 | Keep |
| headline Gram | (1,1), (2,2) at r=2 | formula 2 and 3; computed 2 and 3 | Keep |
| headline, all clauses | 0≤m,n≤4 | 3,725 equalities, 0 failures | Keep |
| §0.1 item 5 cross products | general n | 2+2(n−2)−2(n−1)=0; 2−4+2=0; 1−(n−2)/n−2/n=0 | Keep |
| `exists_reesZeroFiberBracket` | abelian; `[x,y]=y`; lift a+ħj(z) | B=0; B(x,y)=y; commutator shift ħ²j([z,y]) ↦ class 0 | Keep |
| derivative identity (R01) | `[x,y]=y`, ξ=(2,3) | (x,y): 3=3; (x²,y): 12=12; (y,x²): −12=−12 | Statable: R01 |
| §3.2 ordered product | a=0,b=1,c=1,d=0 | x⋆y=yx+ħy; B_ord(x,y)=y, B_ord(y,x)=0 | Keep |
| §3.2 symmetrized | p=x, q=y | D(xy)=y/2; B_sym(x,y)=y−y/2=y/2 | Keep |
| `exists_pbwSymmetrization` | l=[]; [x,y], `[x,y]=y`; n=0 | 1; (XY+YX)/2=YX+Y/2; K↔F₀=K | Keep |
| `invariantForm_isSymm_iff_tits_sign` | sl₂ V(1), V(2), λ=0 | exponent 1, 2, 0: signs −1, +1, +1; forms: skew `[[0,1],[−1,0]]`, Killing symmetric, symmetric on K | Keep |
| same, sl₃ adjoint | ω₁+ω₂ | coroot sum 2α₁∨+2α₂∨; exponent 4; Killing symmetric | Keep |
| §5.1 opposition | A₂; D₄ | ω₁↔ω₂; w₀=−1 while the diagram group is S₃ | Keep |
| §6.1 inverse reading | V(2)⊕2V(0) | orbit coefficients (1,3) → multiplicities (1,2) | Keep |
| §6.1 representation ring | [V(1)]²; [V(2)]−[V(0)] | z²+2+z⁻² both; z²+z⁻², augmentation 2 | Keep |
| §6.2 fixed-point sum | GL₂, λ=(1,0), t=(2,3) | −4+9=5=2+3; δ−ρ=(1/2,1/2) | Keep |
| §6.2 Fourier sign | A₁, n=1; z alone | coefficients 1,1; 1,0 | Keep |
| §6.2 Kostant | A₂ | P(0,0)=1, P(1,0)=1, P(1,1)=2; dim 8 | Keep |
| §7.1 translation | A₁, ρ(h)=1 | τ₋ρ(h²+2h)=h²−1; τρ gives h²+4h+3 | Keep |
| §7.1 inner action | exp(ad e) | h↦h−2e, f↦f+h−e; κ(h−2e,f)=−8=κ(h,f−h−e); transpose +8 | Keep |
| §7.1 trace powers | standard sl₂ at h; th | 2,0,2,0; h²/32 gives (8t)²/32=2t² | Keep |
| §7.1 Casimir | sl₂ | Ω=h²+2h+4fe=8C; χ_n(Ω)=n(n+2); symbol h²+4ef | Keep |
| §7.1 dot orbits | ((h+1)²−1)/3 | at 0, −2: 0, 0; at 1, −3: 1, 1; wrong shift at −2: 8/3 | Keep |
| §7.1 separation | A₁×A₁, (2,0), (0,2) | equal total Casimir; first-factor Casimir 8 vs 0 | Keep |
| `serreLift_injective_of_base` | A₁; A₁×A₁ | 3=3; 6=6 | Keep |
| height reduction | A₂ | (1,1)→(−1,2) a column; (3,0)→(−3,3) mixed sign; 2+6=8 | Keep |
| transpose convention | B₂, α₁ long | (0,2)→(2,−2); (3,−2)→(−3,4)=−α₁+α₂; untransposed: (−2,3)→(4,−3); 2+8=10 | Keep |
| octonion product | i, j, ℓ | (ij)ℓ=(0,k), i(jℓ)=(0,−k); (yx)x=y(xx)=(−j,0) | Keep |
| left Moufang | z=ℓ, x=i, y=j | ℓiℓ=i, left side k; ℓ(i(ℓj))=ℓ(0,k)=(k,0) | Keep |
| Albert determinant | diag(1,2,3); (3,1,1) with x₁=1; over 𝔽₃ | 6, spur 11, (216−252+72)/6=6; 2 (without the norm term: 3); 0=0 | Keep |
| Jordan derivations | A=E₀₀, B, C, D₁₂ | D(A)=−B/4; B∘C=(E₀₂+E₂₀)/2; [D,D₁₂](A)=−(E₀₂+E₂₀)/16; tr((iB)²)=−2 (computed) | Keep |
| complex cubic | i⊗diag(1,2,3); E₀₀; 1 | −6i; (1−3+2)/6=0; (27−27+6)/6=1 | Keep |
| `finrank_e6_e7`, `finrank_e8` | rank + roots | 6+72=78; 7+126=133; 8+240=248; 80+84+84; with Λ²: 152 | Keep |
| `exists_complexified_divisionOctonion_equiv` | 1⊗1+i⊗u | N=1+i²=0 for a nonzero vector; T(i⊗1)=2i | Keep |
| `compact_g2_derivation_divisionOctonion` | dimension | 14=2+12; a split coroot has positive Killing square over ℝ | Keep |
| LR headline | n=2, λ=μ=(1); n=1; n=0 | counts 1,1 and 2·2=3+1; (1,1) excluded, count 1; 1=1 | Keep |
| §9.1 reconstruction | abelian K; gl₂ | c≠c′ inequivalent; standard (V(1),1), determinant (V(0),2) | Keep |
| `productEnveloping` | Z=S=0; Z=K, S=0 | 1↦1⊗1; t↦t⊗1 | Keep |
| `exists_productCenterEquiv` | Z=K, S=sl₂, char 3 | [h,e³]=6e³=0, [f,e³]=−3e²(h+2)=0; 1⊗e³ central | Keep |
| gl_N worked example | staircase ν | C(ν−ε_t)−C(ν)=−3N+3+4t, so differences 4(t−s); gl₂ (3/2,1/2): 15/4−1/4=7/2 | Keep |
| CAR example | N=2 | 2^(N²)=16=2^3·2^1 | Keep |
| alcove headline | A₁; x=2/3, 1, 0 | orbit of 2/3 meets [0,1] once; 1 fixed by x↦2−x; with W_ext x↦1−x sends 2/3↦1/3; stabilizer of 0 has order 2 | Keep `f x = x` |
| Layer 10 Ω orders | A₁, A₂, D₄, E₆ | \|det Cartan\| = 2, 3, 4, 3 (pinned `relIndex_corootSpan_coweightLattice`) = \|Ω\| | Keep |
| R02 witness | A₁ affine Cartan matrix | `[[2,−2],[−2,2]]`, marks (1,1), swap a symmetry | R02 |

### Sources: the seeded sample

No locator in the README is marked unverified. For each target I opened the cached text at the locator, checking the number, the printed page and the hypotheses. The two Etingof texts and Stembridge print the PDF page numbers. Garnier does not: its page markers drift, so I used its footers.

| Target | Passage read | Outcome |
| --- | --- | --- |
| 0.1 | EtingofLieGroupsLieAlgebras line 2507: model `e=x∂_y`, `f=y∂_x` on p. 63; line 2516: Thm 11.16, pp. 63–64; line 2597: Thm 11.18, p. 65 | As cited. The normalizations are stated as derived, and I computed them above. |
| 3.1 | GuttDeformationQuantization lines 899–922 (Lecture 1, slide 14 of 28): `P_ξ(X,Y)=⟨ξ,[X,Y]⟩` and the symmetrization `σ` | As cited, only for the real convention. |
| 3.2 | same slide | Consistent: `X∗Y=XY+(ν/2)[X,Y]` matches B_sym = ½{,}. |
| 5.1 | EtingofLieGroupsLieAlgebras lines 6700, 6708, 6712 (Ex. 32.13, Prop. 32.14, pp. 165–166); EtingofRepresentationsLieGroups line 3469 (§17.2, p. 81) | As cited. The source treats complex simple algebras, and the README states its extension. |
| 6.1 | EtingofLieGroupsLieAlgebras lines 5955 (Prop. 30.4, p. 148), 5979–5981 (step (3)⇒(2), p. 149), 5989 (Cor. 30.5, p. 149), 6004 (Cor. 30.7, p. 149, proof p. 150) | As cited. |
| 6.2 | EtingofLieGroupsLieAlgebras lines 5185, 5190 (Prop. 26.3, Thm 26.4, p. 131) | As cited. The fixed-point form is stated as derived. |
| 7.1 | EtingofLieGroupsLieAlgebras lines 4818, 4827, 4839, 4884, 4895 (Thm 24.2, first line of the proof, Lemma 24.3, pp. 122–124); EtingofRepresentationsLieGroups lines 2153, 2207, 2987, 3041 (Thm 10.1, p. 51; Rem. 10.2, p. 52; Thm 13.5, p. 69; Thm 14.1, pp. 70–71) | As cited. |
| 7.2 | EtingofRepresentationsLieGroups line 3058 (Thm 14.1(iv), p. 71), lines 2153 and 2207 | As cited. |
| 9.1 | EtingofLieGroupsLieAlgebras line 3711 (Cor. 18.9, p. 93); Stembridge2002LR line 109 (second Corollary, p. 3) | As cited. The tableaux have a different shape convention, and the README routes through the native product rule. |
| 9.2 | EtingofRepresentationsLieGroups lines 2213 (Ex. 10.3, pp. 52–53), 2987, 3041 | As cited. Dixmier is under Not verifiable. |
| 9.3 | Dixmier §1.6 | Not verifiable. The centre argument rests on Mathlib `Subalgebra.centralizer_range_includeRight_eq_center_tensorProduct` (`Mathlib/Algebra/Algebra/Subalgebra/Centralizer.lean:170`). |
| 10.1 | GarnierAlcoves line 231 (Thm 1.3.2), line 276 (Thm 1.3.5; footer “5” at line 279), line 389 (Prop.-Def. 2.2.1, pp. 7–8), line 642 (Cor. 2.2.7, p. 10), line 1161 (Prop. 2.3.1, pp. 16–17) | As cited. Thm 1.3.5's fundamental domain is what the alcove headline states. |

### Pinned declarations opened

- **Layer 10 engine.** `TauCeti/LinearAlgebra/RootSystem/AffineCartanMatrix.lean:103, :150, :199, :329, :349` and `Weyl/ExtendedAffine/Wall.lean:201` (R02). Also `Weyl/ExtendedAffine/Alcove.lean:172, :218`, `CoweightLattice/Basis.lean:67, :113, :144` and `FundamentalDomain.lean`; the last is the finite chamber, not the alcove.
- **Lie weights and invariant form.** `TauCeti/Algebra/Lie/Weights/InvariantForm.lean:264, :293`.
- **Octonions.** `TauCeti/Algebra/Octonion/Serre.lean:267`: the source of `g₂ToDerivationLieAlgebra` is `LieAlgebra.g₂`.
- **Verma modules.** `TauCeti/Algebra/Lie/HighestWeight/Verma.lean` uses a quotient presentation. The induced-tensor presentation of §3.2 is not pinned, and `BalancedTensorProduct` exists at the pin.
- **PBW symmetrization.** `PBW/Symmetrization.lean:78, :182, :246, :255, :376` is degreewise only, and `PBW/Center.lean:290` is degreewise symbols. The global equivalence of `exists_pbwSymmetrization` is not pinned.
- **Highest-weight decomposition.** `HighestWeight/Decomposition.lean:168, :268` does not show that the character determines the module. `HighestWeight/Separation.lean` and `Dual.lean` match their contracts.
- **Mathlib.**
  - `LinearAlgebra/RootSystem/Finite/Nondegenerate.lean:199`;
  - `LinearAlgebra/RootSystem/RootPositive.lean:50–55`;
  - `Algebra/Lie/SerreConstruction.lean:158–164`;
  - `LinearAlgebra/Matrix/Cartan/Basic.lean:110, :118` (G₂ = `[[2,−3],[−1,2]]`);
  - `Algebra/Lie/Basis/Prod.lean:307` and `Basis/Base.lean:121`;
  - `RingTheory/TensorProduct/Basic.lean:124, :137`.
- **"The pin lacks" claims checked by grep at the pin.** Each holds except the diagram-automorphism one (R02). The pin has none of the following:
  - injectivity of `serreLift`, or a finrank of `Matrix.ToLieAlgebra`;
  - injectivity of `g₂ToDerivationLieAlgebra`;
  - simplicity of, or a Cartan subalgebra in, the Albert derivation algebra;
  - closed-alcove uniqueness, or injectivity of Ω;
  - Moufang identities or a norm structure on `CayleyDickson`;
  - central-character injectivity on dominant weights.

### Cross-roadmap citations and open work

All of the following resolve on main `c110735`:

| Citation | Location on main |
| --- | --- |
| RootSystems Layers 1–6 | `:428, :614, :685, :804, :905, :1035` |
| ClassicalGroups Layers 2–4 | `:216, :237, :272` |
| SchurWeyl Layer 7 | `:580` |
| LieGroups Layers 4, 6, 7 | `:463, :673, :787` |
| SpinRepresentations Layer 9 | `:1010` |
| ReflectionInvariantTheory §2 | `:19` |
| CharacteristicClasses C5 | `:1344` |
| LieGroupoidsPoisson §G4.6A/B | `:18`, `:71`, `:78` |
| PseudodifferentialOperators §3.1 | `:692`; periodic expansions at `:715` |
| TensorProductCombinatorics §§1.5, 1.6, 2.6 | `:599, :694, :1191` |
| GroebnerGeometry G4 | `:252` |
| ChevalleyGroups C2 | `:241, :243` |
| ReductiveGroups 10C | `:4223` |

TangentialBordism (#942, named in the merge-order block) is named as an owner, not as a supplier.

I checked the consumers at their open heads:

- ChevalleyGroups #697 uses Layer 7.
- AutomorphicFormsOnReductiveGroups #1037 declares `gap:reductive-enveloping-centers` on Layer 9. §9.2 states its content: the product algebra equivalence, the centre restriction, the reductive HC isomorphisms with ρ extended by zero, and both filtration directions.
- CompactGroupsPartII #1047 uses Layers 7 and 9.
- TangentialBordism #942 and StringOrientation #948 use the Layer 8 compact suppliers, whose title is kept.
- #871 and #873 cite former Layers 0, 4 and 5, which the former-numbering table covers.

Search of the open pull requests for duplicate owners of `serreLift_injective`, `closedFundamentalAlcove`, the LR multiplicity, `DivisionOctonionReal` and `e₈`: none found. The overlap list's only other open pull request on this folder is #1797, which conflicts with this one. The merge-order block orders it before this pull request.

## Not verifiable

- **Dixmier, *Enveloping Algebras*, §1.6** (`README.md:2769`). It is not in the sources cache and not in the manifest, and an earlier request reached only a paywalled page. Under this brief the review edits no manifest, so I did not request it.
- **HumphreysIntroLieAlgebras §20.3** (the Verma induced presentation, `README.md:1329`), **BourbakiLie78** and **GoodmanWallachSymmetry.** These are settled as uncertified, cited by locator only.
- **Background entries in References, not opened:** Serre 1987, Fulton–Harris 1991, Humphreys 2008, Jantzen and Molev 2007. No target's statement depends on them.

## Source issues

- **Misprint** in EtingofLieGroupsLieAlgebras at Theorem 11.16, proof of (iii), printed p. 64: the source sends the m-th lowered vector to a multiple of x^m y^(n−m); it should be x^(n−m) y^m, since the vector killed by x∂_y is xⁿ; affects the proof.
- **Misprint** in EtingofLieGroupsLieAlgebras at Theorem 24.2, proof of (iii), printed p. 123: the source names the easy case as a single index with nonnegative coefficient; it should be a single index with positive coefficient, all coefficients being nonnegative already; affects the proof.
- **Error** in GarnierAlcoves at §2.2, printed p. 7: the source calls a fundamental weight minuscule when its highest-root coefficient is 1, and says these represent all classes of P/Q; it should use the highest coroot for weights (B_n's ϖ₁ fails), and they represent only the nonzero classes; affects a stated result.
