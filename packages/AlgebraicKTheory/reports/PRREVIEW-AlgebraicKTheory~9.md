# Review of AlgebraicKTheory (pull request #1142 at 7c414ba)

**Verdict:** needs changes

This is an incremental re-review of the 28 lines that changed since fe5ca28: 26 in `README.md` and one docstring line in `Suggested.lean`. Nothing outside the folder changed.

Both findings of the previous report are repaired. One of the repairs introduced a new problem, R01 (P3): one sentence of a new Check is false. The gate, the dependency check, the elaboration and the one-tactic probe all pass.

In the "Previous findings" section, "R0n" means the previous report's ids. Every other section uses this report's ids.

## R01 (P3) — the new S¹ Check says any non-freeness proof needs the Euler number, which is false

**Location:** `TauCetiRoadmap/AlgebraicKTheory/README.md:169` (new Check of 0.5): "This matches the Euler number 1+(−1)¹=0 of TS¹, so a non-freeness proof that never uses the Euler number would wrongly apply to S¹."

**Claim:** every proof that P is not free and does not use the Euler number would also apply to S¹.

**Witness:** take the degree proof. A nowhere-zero field v with ⟨x,v(x)⟩=0 gives the homotopy x↦cos(πt)x+sin(πt)v(x)/|v(x)| from id to −id on Sⁿ, and deg(−id)=(−1)ⁿ⁺¹. That is −1 on S², which gives the contradiction, and +1 on S¹, which does not. This proof uses no Euler class and does not apply to S¹.

**Repair:** at :169, replace the clause after "TS¹," with:

> so a non-freeness proof must use the even dimension of S², as the Euler number 1+(−1)ⁿ does (the degree (−1)ⁿ⁺¹ of the antipodal map is another such input); a proof that never uses it would wrongly apply to S¹.

This also keeps the Check from making 0.5's Euler-class route mandatory.

Tested: the degree proof uses the parity, so the corrected sentence holds for it, and on S¹ both parity inputs (Euler number 0, degree +1) give no contradiction, in line with the free basis v₀.

## Previous findings

- R01 — repaired: ":66 C2, item 2: the Euler class of a real vector bundle vanishes when the bundle has a nowhere-zero continuous section; used in the non-freeness argument of 0.5." No mention of DifferentialGeometry 11.1 or `exists_eq_zero_of_inner_eq_zero` is left in the README. :159, :171 and :217 cite CharacteristicClasses C2 (item 2) and C7 (item 3).
- R02 — repaired: ":448 Weibel's name for such a J is "radical ideal" (Chapter I, Exercise 1.12) … It is not Mathlib's `Ideal.IsRadical`". :452 reads "modulo a two-sided ideal contained in the Jacobson radical", and :460 adds the 5ℤ⊂ℤ / ℤ₍₅₎ Check.

## Verified sound

### Gate, build and signatures

- **Gate**, rerun at this head, exit 0:

  ```text
  gate AlgebraicKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

  The worker's run also reports `build=0`.
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AlgebraicKTheory'` is empty.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0 after 8 s. It prints exactly 13 "declaration uses `sorry`" warnings, at lines 66, 75, 94, 106, 117, 140, 153, 166, 173, 190, 199, 214 and 231, and nothing else.
- **Imports:** `import Mathlib`, `TauCeti.Algebra.Category.ModuleCat.CartanMap.Basic` and `TauCeti.CategoryTheory.GrothendieckGroup.Split`.
- **`#check @`** on all 20 declarations, appended to a scratch copy, elaborates without error. Every elaborated type keeps its binders:
  - `[IsSemisimpleRing (R ⧸ Ring.jacobson R)]`;
  - `[IsNoetherianRing A]` with `ringKrullDim A ≤ ↑d`;
  - `HasStableRangeLE R s` with `s ≤ Fintype.card n` and `s + 1 ≤ Fintype.card n`;
  - `3 ≤ Fintype.card n` and `2 ≤ Fintype.card n`;
  - `[CompactSpace X] [T2Space X]` and `1 ≤ s` in both Vaserstein theorems.

  Nothing changed since the previous report: the only Lean change is the docstring of `hasStableRangeLE_one_of_isSemisimpleRing`, now "does not change modulo the Jacobson radical". That matches Vaserstein 1971, Lemma 3.
- **One-tactic probe:** on a scratch copy, every `sorry` was replaced by `first | rfl | simp | infer_instance | decide | trivial | aesop`. All 13 theorems fail, with 13 errors, so nothing is padding.
- **The signatures tool:** its "line 217: failed to synthesize" lead does not reproduce. The file and the `#check` copy both elaborate cleanly.

### Dependency check

The required command printed exactly:

```text
depcheck: 236 roadmaps, 2419 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

- AlgebraicKTheory is at merge-order line 15 and HilbertModules at line 8.
- CharacteristicClasses, DifferentialGeometry, ClassicalArithmeticCompletion, TopologicalKTheory and BanachAlgebras are on main (7e2fae4).
- CharacteristicClasses is not on the never-cite list. It does not mention AlgebraicKTheory on main or at any of its three open heads (0 matches each), so there is no cycle.

### Cross-roadmap citations resolved (changed passages)

**CharacteristicClasses on main (7e2fae4):**

- **C2, item 2** (lines 822–824): "Euler naturality … and vanishing when a nowhere-zero section exists". C2 works with continuous real vector bundles (C2.0, lines 730–731), so this matches the contract at :66.
- **C7, item 3** (lines 1851–1860) has all three things the contract at :67 cites:
  - the smooth bundle isomorphism from the native tangent bundle of Sⁿ to the bundle with fibre x^⊥ (lines 1854–1858);
  - "oriented TS^n has Euler number 1+(-1)^n" (line 1859);
  - "On an oriented real plane prove e=c₁" (line 1860).

**CharacteristicClasses at the three open heads that revise it** (#1807 ac36c47, #1808 6931121, #1854 c07dda7):

- Each keeps C2 item 2: "vanishing when a nowhere-zero continuous section exists", at #1854 lines 1004–1009. It now names Tau Ceti's `TauCeti.eulerClass_eq_zero_of_forall_ne_zero`. That declaration is not at this roadmap's Tau Ceti pin: the only `eulerClass` there is the K-theoretic one in `CategoryTheory/GrothendieckGroup/Resolution.lean:90`. So C2 is the right owner at the pins.
- Each keeps C7 item 3 with the Euler number line (#1807:2189, #1808:2139, #1854:2199).
- No id the README cites is dropped. `roadmaps overlaps` agrees: no open pull request changes this roadmap or drops a cited id.

**DifferentialGeometry 5.1** (untouched contract at :62, still cited in the changed Layer 0 Dependencies at :217):

- On main it is at line 507.
- #886 has a new head, e8165fc, and keeps "5.1 The boundary interface … the outward-first boundary orientation" (line 866), with the unit closed ball and the diffeomorphism to `S^n`.

**0.5's non-freeness route:**

- It names its inputs: 0.1, 0.3, 0.4, CharacteristicClasses C2 (item 2) and C7 (item 3), and Mathlib `ContinuousMap`.
- It does not state the hairy ball theorem as its own target.
- It uses no section that the scope excludes.

### Library declarations opened (pins Mathlib 6b7abb3c, Tau Ceti a91d3aaf)

- `Mathlib/RingTheory/Jacobson/Radical.lean`:
  - :129 `Ring.jacobson` (an abbrev for `Module.jacobson R R`);
  - :134 the `IsTwoSided` instance;
  - :161 `Ring.jacobson_quotient_of_le {I} [I.IsTwoSided] (le : I ≤ jacobson R) : jacobson (R ⧸ I) = Submodule.map (Ideal.Quotient.mk I).toSemilinearMap (jacobson R)`.

  This matches the contract at :38 and the reduction in 4.2.
- `Mathlib/RingTheory/Ideal/Operations.lean`:
  - :809 `Ideal.IsRadical I := I.radical ≤ I`, as the new text at :448 describes it;
  - :855 `Ideal.IsPrime.isRadical`, used by the Check at :460.
- `Mathlib/LinearAlgebra/Matrix/ElementaryRowOperations.lean` exists at the pin. The resolver's lead on README :32 is a false positive. Its other six leads, at :735, name the external CC0 repository of the provenance note, not a library.

### Sources opened (new or changed locators)

- **weibel-kbook-I:**
  - lines 100–110 (Example 1.2.2, p. 3): the polynomial version over ℝ[x,y,z]/(x²+y²+z²−1), with the row (x,y,z), P=ker σ stably free and not free, by combing the sphere. The continuous version in 0.5 is fairly described as its analogue.
  - lines 144–157 (Ex. 1.5, (c): artinian rings have sr=1; (d): sr(R)≥sr(R/I)).
  - lines 243–258 (Ex. 1.12: a radical ideal is a two-sided I with 1+x a unit for all x∈I, Jac(R) is the largest one, and (v): sr(R)=sr(R/I)). For two-sided J, "1+x a unit for every x∈J" is equivalent to J⊆Jac(R): if x∈J, then rx∈J and 1+rx is a unit for every r, so x∈Jac(R). This agrees with :448.
- **weibel-kbook-II** lines 694–695 (Ex. 2.6, p. 15): semilocal means R/J is semisimple for some radical ideal J. This agrees with :448.
- **vaserstein-1971** (Russian original) lines 62–63 (Lemma 3, printed p. 18): the stable rank of J equals that of J modulo its Jacobson radical. This agrees with :448 and the reference at :732.

### Seeded sample, where it falls in the changed passages

| Target | Locator inspected | Outcome |
|---|---|---|
| 0.5 | weibel-kbook-I lines 100–110 (Example 1.2.2, p. 3); CharacteristicClasses C2 item 2 (main 822–824) and C7 item 3 (main 1851–1860) | Correct; R01 concerns only the closing clause of one Check |

The other sampled targets are untouched since fe5ca28: 0.1, 0.3, 0.7, 1.3, 1.4, 2.2, 3.1, 3.2, 3.4, 5.1, 5.2, 6.2, 6.3 and 8.2. Their locators were verified in PRREVIEW-AlgebraicKTheory~7 and ~8.

### Adversarial table

Changed statements, with values computed at this head:

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 0.5, rank of P | x=(0,0,1); x=(1,0,0); general x | p=diag(1,1,0), columns e₁,e₂,0 span {x₂=0}=x^⊥; p=diag(0,1,1), columns 0,e₂,e₃ span x^⊥; trace p(x)=3−‖x‖²=2 everywhere | rank 2, so a free basis has 2 elements |
| 0.5, a basis gives a nowhere-zero field | basis (s₁,s₂), columns pe_j=s₁a_j+s₂b_j | at x: span{s₁(x),s₂(x)}⊇span{p(x)e_j}=x^⊥ (dim 2), and s_i(x)∈x^⊥, so s₁(x)≠0 for all x | Sound |
| 0.5, contradiction via C2 item 2 + C7 item 3 | S²; trivial R² (wrong model); S⁴ | S²: section ⇒ e=0 ⇒ ⟨e,[S²]⟩=0, but C7 gives 1+(−1)²=2; R²: section (1,0), e=0, no contradiction, as expected; S⁴: 2, also non-free | Sound |
| 0.5, new S¹ Check, module | S¹, v₀(x)=(−x₁,x₀); x=(1,0) | ⟨x,v₀⟩=−x₀x₁+x₁x₀=0, ‖v₀‖²=1, v=⟨v,v₀⟩v₀; at (1,0): v₀=(0,1), every v=(0,c)=c·v₀; Euler number 1+(−1)¹=0 | Sound |
| 0.5, new S¹ Check, closing clause | degree proof on S² and S¹ | deg(−id_{S²})=−1≠1 (contradiction, no Euler class used); deg(−id_{S¹})=+1 (no contradiction) | False as stated: R01 |
| Contract :66 (C2 item 2) | TS²; S²×ℝ² | e[S²]=2, so no section; e=0 with the constant section (C2 Check at #1854) | Matches the source |
| Contract :67 (C7 item 3) | n=2; n=1; oriented plane | 2; 0 (oriented rank 1 has its unit section, e=0, C2 item 2); e=c₁ | Matches the source |
| 4.2, Weibel's semilocal = Mathlib's hypothesis | ℤ₍₅₎ with J=5ℤ₍₅₎; T₂(k) with J=strict upper; Mathlib-`IsRadical` reading on ℤ, J=5ℤ | R/J=𝔽₅ and R/Jac=𝔽₅, both semisimple; R/J=k×k=R/Jac; ℤ/5ℤ semisimple but ℤ/Jac(ℤ)=ℤ not, so the readings differ, and :448 excludes the wrong one | Sound |
| 4.2, sr(R)=sr(R/J) for J⊆Jac(R) | ℤ₍₅₎, J=25ℤ₍₅₎; 𝔽₂[x]/(x²), J=(x); zero ring, J=R; control 5ℤ⊂ℤ | 1=sr(ℤ/25)=1, and Jac(ℤ/25)=5ℤ/25ℤ is the image of 5ℤ₍₅₎ with (ℤ/25)/(5)≅𝔽₅≅ℤ₍₅₎/5ℤ₍₅₎; 1=1; 0=0; sr(ℤ)=2≠1=sr(𝔽₅), but 5ℤ⊄Jac(ℤ)=0 | Sound; the reduction via `Ring.jacobson_quotient_of_le` holds |
| 4.2, sr(R)≥sr(R/I) | ℤ→𝔽₅; ℤ→ℤ/4 | 2≥1; 2≥1 (ℤ/4 is local) | Sound |
| 4.2, new Check | 5ℤ⊂ℤ; ℤ₍₅₎ | 5ℤ prime ⇒ `IsRadical` (`Ideal.IsPrime.isRadical`); Jac(ℤ)=⋂pℤ=0; (2,5): 2·3+5·(−1)=1 is unimodular, 2+5c=±1 forces c∈{−1/5,−3/5}∉ℤ, so sr(ℤ)=2 (≤2 by Bass, d=1); sr(𝔽₅)=1 since 𝔽₅≠0; sr(ℤ₍₅₎)=1 (local) | Sound |
| `hasStableRangeLE_one_of_isSemisimpleRing` (docstring changed) | 𝔽₂[x]/(x²); zero ring; control ℤ | (x,1+x): x+(1+x)·1=1+2x=1; 0 has every bound; ℤ: R/Jac=ℤ is not semisimple and (2,5) fails | True; the docstring now says "Jacobson radical", as Vaserstein's Lemma 3 does |

Statements untouched by the diff carry the rows of the previous report (PRREVIEW-AlgebraicKTheory~8, whose last block carries ~7), with their values:

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 0.1, complement via §7.7 over Rᵐᵒᵖ | R=ℤ×ℤ, P=ℤ×0; zero ring | Q=0×ℤ and P⊕Q≅R¹ with P not free; zero ring: P=Q=0, n=0 | Sound |
| 0.3, K₀(f) as §7.42 at fᵐᵒᵖ | k→M₂(k); ℤ[C₂]→ℤ; ℂ→M₂(ℝ) | [k]↦[M₂(k)]=2[e₁₁M₂(k)]↦2, while the Morita map gives 1; [ℤ[C₂]]↦[ℤ]; [ℂ]↦[M₂(ℝ)]↦2 | Sound |
| 0.4, [P]=[Q] iff P⊕Rᵏ≅Q⊕Rᵏ | ℤ[√−5] with 𝔭=(2,1+√−5); zero ring | [𝔭⊕𝔭]=[A²]; [𝔭]≠[A], since Cl=ℤ/2 separates them; zero ring: every class is 0 | Sound |
| 1.1, commutator Check | ℤ: c=2, d=3 | (1+2E₁₂)(1+3E₂₃)(1−2E₁₂)(1−3E₂₃)=1+6E₁₃; reversed order: 1−6E₁₃ | Sound |
| 2.1, products | 𝔽₂×𝔽₃ | K₁=0⊕ℤ/2; eᵢⱼ((a,b))=(eᵢⱼ(a),1)(1,eᵢⱼ(b)) | Sound |
| 3.2, factorization and all-T presentations | block [[α′,γ],[0,α″]]; ℤ→ℚ with u=[[1,1/2],[0,1]]; T=id | c=γα″⁻¹; u⊕1=e₁₂(1/2) gives 0 in both presentations; K₀(id)=0 | Sound |
| 3.4, ℂ comparison and i=1 surjectivity | A=ℂ; A=0 | reduced K₁ ℂˣ→ℂˣ identity, reduced K₀ ℤ→ℤ identity; 0→0; g·ε(g)⁻¹∈GL(A) | Sound |
| 4.1, opposite ring | ℍ; T₂(k) | 1=1; 1=1 | Sound |
| 4.4, multiplicity bound | [0,1], V₁=[0,2/3), V₂=(1/3,1], d=1 | 2≤2 at 1/2; 1 at 0 | Sound |
| 4.5, tsr=sr for C(X,ℂ) | point; [0,1]; S²; T⁴ | 1, 1, 2, 3 on both sides | Sound |
| 8.2, exponentials and lifting | ℂ; C(S¹); C(D²)→C(S¹) | ℂˣ=exp(ℂ); winding 1 vs 0; z does not lift to Inv₀ | Sound |
| `kZero_divisionRing` | D=𝔽₂, D=ℍ | [D]↦1, [D²]↦2 | True |
| `kZero_int` | ℤ; control ℤ[√−5] | [ℤⁿ]↦n; K₀(ℤ[√−5])=ℤ⊕ℤ/2 | True |
| `whitehead_commutator_elementary` | ℍ, n=1, g=i, h=j | [i,j]=−1, diag(−1,1)∈E₂(ℍ) | True |
| `elementary_le_commutator` | 𝔽₂, card 3 and 2 | E₃(𝔽₂) simple of order 168; E₂(𝔽₂)≅S₃⊄A₃ | Bound needed and present |
| `dieudonne_determinant` | 𝔽₃, n=2; ℍ, n=1 | kernel SL₂(𝔽₃)=E₂ of order 24; n=1: the unit quaternions ≠ E₁ | True for n≥2 |
| `HasStableRangeLE` | s=0; ℤ, s=1 | (1) shortens only if 1=0; 2+5c≠±1 | Matches Weibel's (Sₛ) |
| `surjective_stability` / `injective_stability` | field, s=1; Cohn's matrix over k[x,y] | [[0,1],[1,0]]=diag(−1,1)·e; Cohn ∈E₃∖E₂ but 2<s+1 | True |
| `hasStableRangeLE_of_ringKrullDim_le` | ℤ, d=1; ℤ[x], d=2 | ≤2 (≤1 false); ≤3 | True |
| `HasCoveringDimensionLE` | [0,1], d=0 and 1; ∅ | fails; holds; the empty refinement | Lebesgue dimension |
| both Vaserstein `iff`s | S², T⁴, s=0 control | ℂ: S² s=1 F/F, s=2 T/T; T⁴ s=3 T/T; ℝ: S² s=2 F/F, s=3 T/T; s=0 on a point F vs T | Agree; `1 ≤ s` needed |
| `kZero_arithmeticSquare` / `kZero_cuspSquare` | ℤ×_𝔽₅ℤ; 𝔽₅[t²,t³] | cokernels ℤ/2 and ℤ/5, with [D]↦(1,0) | True |

### Remarks on untouched text (no change requested)

- The draft revision #334 (a01a8ad) of DifferentialGeometry replaces that README and has no numbered 5.1. It mentions the outward-first orientation only at its line 86. The 5.1 citation at :62 is unchanged and was passed by the previous review, and #886's head keeps 5.1.
- Layer 4's Dependencies line (Layer 4, `### Dependencies`) does not list `Ring.jacobson_quotient_of_le`, which 4.2's *Needs:* now lists. Layer Dependencies lines in this README are not exhaustive elsewhere either: Layer 0's omits `ContinuousMap` and `AddCircle`.

## Not verifiable

- **Milnor, *Introduction to Algebraic K-Theory*, and Bass, *Algebraic K-Theory*, Theorem V.3.5:** both are uncertified in the manifest and cited by locator only. The diff leaves the Bass citation in 4.2 unchanged.
- **Vaserstein's English translation:** it is not in the cache. Lemma 3 was read in the Russian original, printed p. 18.
- **Ownership against open pull requests:** checked only for the objects the diff touches: CharacteristicClasses at #1807, #1808 and #1854, and DifferentialGeometry at #886 and #334. The diff adds no owned object.

## Source issues

- **Misprint** in weibel-kbook-I at Chapter I, Exercise 1.5(c), p. 4: the source says every artinian ring has stable range exactly 1; it should say every nonzero artinian ring, since the zero ring satisfies (S₀) and has stable range 0; affects nothing.
