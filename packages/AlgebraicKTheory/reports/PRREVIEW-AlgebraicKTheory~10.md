# Review of AlgebraicKTheory (pull request #1142 at 7398d9c)

**Verdict:** accepted

This is an incremental re-review of the 2 lines that changed since 7c414ba: one Check bullet of 0.5 in `README.md`. `Suggested.lean` is byte-for-byte unchanged, and nothing outside the folder changed.

The one finding of the previous report is repaired, the repair introduces no new problem, and the gate, the dependency check, the elaboration and the one-tactic probe all pass. There is no finding at this head.

In the "Previous findings" section, "R01" means the previous report's id.

## Previous findings

- R01 — repaired: ":169 … a non-freeness argument for S² needs an input that separates S² from S¹, such as either of these two (… the homotopy x↦cos(πt)x+sin(πt)v(x)/|v(x)| from the identity to the antipodal map …), and an argument that goes through unchanged on S¹ is wrong." The false clause (every non-Euler proof applies to S¹) is gone; the degree route is now named as the other separating input, with its values on S¹ and S².

## Verified sound

### The changed passage (README :169)

- **Values.** 1+(−1)¹=0 and 1+(−1)²=2 are the Euler numbers CharacteristicClasses C7 item 3 states for oriented TSⁿ (main 5556a3f, line 1859: "Euler number 1+(-1)^n"). The antipodal map of Sⁿ⊂ℝⁿ⁺¹ is −I_{n+1}, a product of n+1 reflections of degree −1 each, so its degree is (−1)ⁿ⁺¹: +1 for n=1 and −1 for n=2, as written.
- **The homotopy.** For v nowhere zero with ⟨x,v(x)⟩=0 and v̂=v/|v|, H(x,t)=cos(πt)x+sin(πt)v̂(x) has |H|²=cos²(πt)+sin²(πt)+2cos(πt)sin(πt)⟨x,v̂(x)⟩=1, so H lands in the sphere; H(x,0)=x and H(x,1)=−x; H is continuous because v has no zero. On S² it forces deg(−id)=deg(id), i.e. −1=1, a contradiction that uses no Euler class; on S¹ it gives +1=+1, no contradiction, in line with the free basis v₀.
- **The logic.** The S¹ module is free (v₀ basis, verified in the previous report's table), so any argument that goes through unchanged on S¹ proves a false statement there; the sentence is correct. Both named inputs (Euler number, antipodal degree) are parity inputs that differ between n=1 and n=2.
- **Route and `*Needs:*`.** 0.5's prose route is still the Euler-class one through CharacteristicClasses C2 (item 2) and C7 (item 3), and the `*Needs:*` line at :171 is unchanged. The degree route appears only as an alternative inside a Check, so it makes no route mandatory and claims no supplier; the Check names no Lean counterpart.
- **Style.** The bullet is timeless prose in Unicode with ASCII in code spans; no LaTeX, no process words, no pull-request number.

### Text that cites or depends on 0.5

- :66–67 (contracts for C2 item 2 and C7 item 3, "2 for S², 0 for S¹") agree with the Check's values.
- :136 ("[P]=2[R] although P≄R²") and :217 (Layer 0 Dependencies: "C2 (item 2) and C7 (item 3) for the non-freeness in 0.5") are unaffected.
- 0.6 (:175, :188) uses only the projection p(x)=I₃−xxᵀ and the module P of 0.5, which the diff does not touch.

### Cross-roadmap citations resolved (current main 5556a3f)

- **CharacteristicClasses C2, item 2** (main lines 822–825): Euler naturality and "vanishing when a nowhere-zero section exists". Matches the contract at :66.
- **CharacteristicClasses C7, item 3** (main lines 1851–1860): the smooth isomorphism from the native tangent bundle of Sⁿ to the bundle with fibre x^⊥ (1854–1857), "oriented TS^n has Euler number 1+(-1)^n" (1859), and e=c₁ on an oriented real plane (1860). Matches the contract at :67 and the Check's values.
- CharacteristicClasses is on main and not on the never-cite list; its README does not mention AlgebraicKTheory (0 matches), so there is no cycle.
- `roadmaps overlaps`: no open pull request changes this roadmap, drops an id it cites, or is the only definer of an id it cites.

### Gate, build and signatures

- **Gate**, rerun at this head, exit 0:

  ```text
  gate AlgebraicKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

  The worker's run also reports `build=0`.
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AlgebraicKTheory'` is empty.
- **Elaboration:** `lake env lean` on `TauCetiRoadmap/AlgebraicKTheory/Suggested.lean` exits 0 in 12 s and prints exactly 13 "declaration uses `sorry`" warnings and nothing else.
- **`#check @`** on all 20 declarations, appended to a scratch copy: 0 errors. The elaborated types keep `[IsSemisimpleRing (R ⧸ Ring.jacobson R)]`, `[IsNoetherianRing A]` with `ringKrullDim A ≤ ↑d`, `s ≤ Fintype.card n` and `s + 1 ≤ Fintype.card n`, `3 ≤ Fintype.card n` and `2 ≤ Fintype.card n`, and `[CompactSpace X] [T2Space X]` with `1 ≤ s` in both Vaserstein theorems. Nothing changed since the previous report (the Lean file is identical).
- **One-tactic probe:** on a scratch copy every `sorry` was replaced by `first | rfl | simp | infer_instance | decide | trivial | aesop`. All 13 theorems fail (13 errors, 0 `sorry` warnings), so nothing is padding.

### Dependency check

The required command printed exactly:

```text
depcheck: 237 roadmaps, 2341 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

### Seeded sample

None of the sampled targets (0.3, 0.6, 0.7, 1.4, 2.3, 3.2, 3.4, 4.1, 4.3, 4.4, 6.3, 6.4, 7.1, 7.2, 8.1) falls in the changed line, and the change adds no locator. Their locators were verified in PRREVIEW-AlgebraicKTheory~7, ~8 and ~9; 0.5's locator (weibel-kbook-I lines 100–110, Example 1.2.2, p. 3) was verified in ~9 and is unchanged.

### Adversarial table

The changed statement, with values computed at this head:

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 0.5 Check, Euler numbers | n=1; n=2; n=3 (control) | 1+(−1)¹=0; 1+(−1)²=2; 1+(−1)³=0 (S³ is parallelizable, module free, consistent) | Values as written |
| 0.5 Check, antipodal degree | n=1; n=2; n=3 (control) | −I₂ = 2 reflections, (−1)²=+1; −I₃ = 3 reflections, (−1)³=−1; −I₄, (−1)⁴=+1 | Values as written |
| 0.5 Check, the homotopy stays on the sphere | x=(0,0,1), v̂=(1,0,0), t=1/2; general x,v̂ with ⟨x,v̂⟩=0 | H=(1,0,0), norm 1; |H|²=cos²+sin²+2cos·sin·0=1 | Sound |
| 0.5 Check, endpoints | t=0; t=1 | H=x (identity); H=−x (antipodal) | Sound |
| 0.5 Check, contradiction | S² with a nowhere-zero tangent field; S¹ with v₀ | deg(id)=1 vs deg(−id)=−1, contradiction; 1 vs +1, none, and v₀=(−x₁,x₀) exists | The degree route separates S² from S¹, as the Check says |
| 0.5 Check, closing clause | a hypothetical argument valid on S¹ | the S¹ module is free of rank 1 on v₀, so such an argument proves a falsehood | Sound |

Statements untouched by the diff carry the rows of the previous report (PRREVIEW-AlgebraicKTheory~9, whose last block carries ~8 and ~7), with their values:

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 0.5, rank of P | x=(0,0,1); x=(1,0,0); general x | p=diag(1,1,0), columns span x^⊥; p=diag(0,1,1); trace p(x)=3−‖x‖²=2 | rank 2 (~9) |
| 0.5, a basis gives a nowhere-zero field | basis (s₁,s₂) | span{s₁(x),s₂(x)}⊇x^⊥ of dim 2, so s₁(x)≠0 | Sound (~9) |
| 0.5, contradiction via C2 item 2 + C7 item 3 | S²; trivial R²; S⁴ | section ⇒ e=0 vs 2; section (1,0), e=0, no contradiction; 2 | Sound (~9) |
| 0.5, S¹ Check, module | S¹, v₀(x)=(−x₁,x₀); x=(1,0) | ⟨x,v₀⟩=0, ‖v₀‖²=1, v=⟨v,v₀⟩v₀; at (1,0) every v=(0,c)=c·v₀ | Sound (~9) |
| Contract :66 (C2 item 2) | TS²; S²×ℝ² | e[S²]=2, no section; e=0 with the constant section | Matches (~9) |
| Contract :67 (C7 item 3) | n=2; n=1; oriented plane | 2; 0; e=c₁ | Matches (~9) |
| 4.2, Weibel's semilocal = Mathlib's hypothesis | ℤ₍₅₎, J=5ℤ₍₅₎; T₂(k); ℤ with J=5ℤ | 𝔽₅=𝔽₅; k×k=k×k; ℤ/5 semisimple but ℤ/Jac(ℤ)=ℤ not | Sound (~9) |
| 4.2, sr(R)=sr(R/J) for J⊆Jac(R) | ℤ₍₅₎, J=25ℤ₍₅₎; 𝔽₂[x]/(x²); zero ring; control 5ℤ⊂ℤ | 1=1; 1=1; 0=0; 2≠1 but 5ℤ⊄Jac(ℤ)=0 | Sound (~9) |
| 4.2, sr(R)≥sr(R/I) | ℤ→𝔽₅; ℤ→ℤ/4 | 2≥1; 2≥1 | Sound (~9) |
| 4.2, Check 5ℤ⊂ℤ / ℤ₍₅₎ | (2,5) over ℤ | 2·3+5·(−1)=1 unimodular, 2+5c≠±1, sr(ℤ)=2; sr(𝔽₅)=1; sr(ℤ₍₅₎)=1 | Sound (~9) |
| `hasStableRangeLE_one_of_isSemisimpleRing` | 𝔽₂[x]/(x²); zero ring; control ℤ | (x,1+x): x+(1+x)=1; every bound; ℤ fails | True (~9) |
| 0.1, complement via §7.7 over Rᵐᵒᵖ | R=ℤ×ℤ, P=ℤ×0; zero ring | Q=0×ℤ, P⊕Q≅R¹; P=Q=0, n=0 | Sound (~8) |
| 0.3, K₀(f) as §7.42 at fᵐᵒᵖ | k→M₂(k); ℤ[C₂]→ℤ; ℂ→M₂(ℝ) | [k]↦2 (Morita gives 1); [ℤ[C₂]]↦[ℤ]; [ℂ]↦2 | Sound (~8) |
| 0.4, [P]=[Q] iff P⊕Rᵏ≅Q⊕Rᵏ | ℤ[√−5], 𝔭=(2,1+√−5); zero ring | [𝔭⊕𝔭]=[A²], [𝔭]≠[A] (Cl=ℤ/2); all classes 0 | Sound (~8) |
| 1.1, commutator Check | ℤ: c=2, d=3 | (1+2E₁₂)(1+3E₂₃)(1−2E₁₂)(1−3E₂₃)=1+6E₁₃; reversed 1−6E₁₃ | Sound (~8) |
| 2.1, products | 𝔽₂×𝔽₃ | K₁=0⊕ℤ/2 | Sound (~8) |
| 3.2, factorization and all-T presentations | block [[α′,γ],[0,α″]]; ℤ→ℚ, u=[[1,1/2],[0,1]]; T=id | c=γα″⁻¹; u⊕1=e₁₂(1/2) gives 0; K₀(id)=0 | Sound (~8) |
| 3.4, ℂ comparison and i=1 surjectivity | A=ℂ; A=0 | identities ℂˣ→ℂˣ, ℤ→ℤ; 0→0 | Sound (~8) |
| 4.1, opposite ring | ℍ; T₂(k) | 1=1; 1=1 | Sound (~8) |
| 4.4, multiplicity bound | [0,1], V₁=[0,2/3), V₂=(1/3,1], d=1 | 2≤2 at 1/2; 1 at 0 | Sound (~8) |
| 4.5, tsr=sr for C(X,ℂ) | point; [0,1]; S²; T⁴ | 1, 1, 2, 3 on both sides | Sound (~8) |
| 8.2, exponentials and lifting | ℂ; C(S¹); C(D²)→C(S¹) | ℂˣ=exp(ℂ); winding 1 vs 0; z does not lift | Sound (~8) |
| `kZero_divisionRing` | 𝔽₂, ℍ | [D]↦1, [D²]↦2 | True (~8) |
| `kZero_int` | ℤ; control ℤ[√−5] | [ℤⁿ]↦n; ℤ⊕ℤ/2 | True (~8) |
| `whitehead_commutator_elementary` | ℍ, n=1, g=i, h=j | [i,j]=−1, diag(−1,1)∈E₂(ℍ) | True (~8) |
| `elementary_le_commutator` | 𝔽₂, card 3 and 2 | E₃(𝔽₂) simple, order 168; E₂(𝔽₂)≅S₃⊄A₃ | Bound needed and present (~8) |
| `dieudonne_determinant` | 𝔽₃, n=2; ℍ, n=1 | kernel SL₂(𝔽₃)=E₂, order 24; unit quaternions ≠ E₁ | True for n≥2 (~8) |
| `HasStableRangeLE` | s=0; ℤ, s=1 | (1) shortens only if 1=0; 2+5c≠±1 | Matches (Sₛ) (~8) |
| `surjective_stability` / `injective_stability` | field, s=1; Cohn's matrix over k[x,y] | [[0,1],[1,0]]=diag(−1,1)·e; Cohn ∈E₃∖E₂ but 2<s+1 | True (~8) |
| `hasStableRangeLE_of_ringKrullDim_le` | ℤ, d=1; ℤ[x], d=2 | ≤2 (≤1 false); ≤3 | True (~8) |
| `HasCoveringDimensionLE` | [0,1], d=0 and 1; ∅ | fails; holds; empty refinement | Lebesgue dimension (~8) |
| both Vaserstein `iff`s | S², T⁴, s=0 control | ℂ: S² s=1 F/F, s=2 T/T; T⁴ s=3 T/T; ℝ: S² s=2 F/F, s=3 T/T; s=0 on a point F vs T | Agree; `1 ≤ s` needed (~8) |
| `kZero_arithmeticSquare` / `kZero_cuspSquare` | ℤ×_𝔽₅ℤ; 𝔽₅[t²,t³] | cokernels ℤ/2 and ℤ/5, [D]↦(1,0) | True (~8) |

### Remarks on untouched text (no change requested)

- The degree of a self-map of Sⁿ is standard vocabulary and is used here only inside a Check as an illustration of a second separating input; the roadmap does not state degree theory as a target or a supplier contract, and need not, since its route is the Euler-class one.

## Not verifiable

- **Milnor, *Introduction to Algebraic K-Theory*, and Bass, *Algebraic K-Theory*:** both are uncertified in the manifest and cited by locator only. The diff touches neither citation.
- **Ownership against open pull requests:** the diff adds no owned object (it rewrites one sentence of a Check about the existing module P over C(S²,ℝ)), so the check of the previous report (CharacteristicClasses at #1807, #1808 and #1854; DifferentialGeometry at #886 and #334) stands; no new ownership check was needed.

## Source issues

- none (the change adds no locator and no source was opened this round; the Weibel I, Exercise 1.5(c) misprint is recorded in PRREVIEW-AlgebraicKTheory~9).
