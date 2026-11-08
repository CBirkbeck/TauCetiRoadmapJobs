# Review of AlgebraicKTheory (pull request #1142 at fe5ca28)

**Verdict:** needs changes

This is an incremental re-review of the 83 lines that changed since b88e48f. Only `README.md` changed; `Suggested.lean` is byte-identical, and nothing outside the folder changed.

Of the eight findings of the previous report, seven are repaired. The previous R01 is not repaired and is carried below as this report's R01. The repairs introduced one new defect, R02. That makes two findings: one P2 and one P3. The gate, the dependency check and the elaboration all pass.

In the next section, "R0n" means the previous report's ids. Every other section uses this report's ids.

## R01 (P2) — DifferentialGeometry's open revisions still drop the hairy ball theorem that 0.5 consumes

**Location:** `TauCetiRoadmap/AlgebraicKTheory/README.md:62`: "11.1 `exists_eq_zero_of_inner_eq_zero`: for even n, a continuous field `w` on the unit sphere … has a zero (the hairy ball theorem)". The same citation appears at :159 (twice), :170 (the *Needs:* line of 0.5) and :216.

**Claim:** DifferentialGeometry 11.1 supplies the hairy ball theorem.

**Witness:**

- DifferentialGeometry #886 is still at head a565de6. It has no Layer 11, and its README line 261 gives the theorem to DeRhamCohomologyAndDuality.
- DeRhamCohomologyAndDuality #1768 (head 1b57dbe), at lines 8 and 49, still consumes the theorem as DifferentialGeometry's "layer 11".
- The draft revision #334 (a01a8ad) replaces the whole README and has neither 11.1 nor 5.1.
- The pull request's depends-on paragraph names only HilbertModules.

**Repair:** this is the same repair as last round. The citation is correct on main (DifferentialGeometry README line 902, `Suggested.lean:3097`), so nothing in the README changes yet.

- In the merge-order paragraph of the pull request description, name DifferentialGeometry #886, and the draft #334, as revisions that must not merge while 11.1 has no numbered owner.
- Once DeRhamCohomologyAndDuality, or DifferentialGeometry, states the theorem as a numbered target, repoint :62, :159, :170 and :216 to that target.

With the description naming #886, its merge can no longer break 0.5's *Needs:* line silently.

## R02 (P3) — 4.2 uses "radical ideal" without defining it, and under Mathlib's meaning the new target is false

**Location:** `README.md:447` (new): "Prove that stable range does not change modulo a radical ideal (Weibel, Chapter I, Exercise 1.12(v); Vaserstein 1971, Lemma 3, printed p. 18)". The term also appears earlier in :447 ("for some radical ideal J") and in the bullet at :451.

**Claim:** sr(R)=sr(R/I) for a radical ideal I.

**Witness:**

- Mathlib's `Ideal.IsRadical I` means that I contains its radical (`Mathlib/RingTheory/Ideal/Operations.lean:809`). In that sense 5ℤ⊂ℤ is radical, but sr(ℤ)=2 (4.1's row (2,5) cannot be shortened) while sr(𝔽₅)=1. The same reading would make ℤ semilocal, since ℤ/5ℤ is semisimple.
- Weibel means an ideal on which 1+x is always a unit, that is, one inside the Jacobson radical (weibel-kbook-I lines 243–244).

**Repair:**

- At the first use in :447, write "an ideal J contained in the Jacobson radical (1+x is a unit for every x∈J; Weibel's radical ideal, Chapter I, Exercise 1.12)".
- Use "an ideal contained in the Jacobson radical" in the new sentence and at :451.
- Add a Check to 4.2: 5ℤ⊂ℤ is radical in Mathlib's sense but not contained in Jac(ℤ)=0, and sr(ℤ)=2≠1=sr(𝔽₅). The ideal 5ℤ₍₅₎ lies in the Jacobson radical of ℤ₍₅₎, and sr(ℤ₍₅₎)=1=sr(𝔽₅).

Tested: the corrected sentence no longer applies to 5ℤ⊂ℤ and holds for ℤ₍₅₎.

## Previous findings

- R01 — not repaired: ":62 11.1 `exists_eq_zero_of_inner_eq_zero` … has a zero (the hairy ball theorem)" is unchanged, as are :159, :170 and :216. #886 still drops Layer 11, and the description names only #861. Carried as R01 above.
- R02 — repaired: ":15 HigherToposTheory's covering dimension (its L12.2) is the same predicate written with indexed covers … HigherToposTheory consumes 4.3 … the generalizations in its L12.4 … are HigherToposTheory's"; :720 lists HigherToposTheory as a consumer.
- R03 — repaired: ":125 Define K₀(f):K₀(R)→K₀(S) as ClassicalArithmeticCompletion §7.42's extension map for fᵐᵒᵖ". :89 cites §7.7 and :143 cites §7.23 with §7.6. The supplier contracts at :56–58 add §§7.6–7.7, 7.23–7.24 and 7.42.
- R04 — repaired:
  - :296 now cites "Weibel … Chapter III, Definition 1.1 … chapter p. 1".
  - :431 cites "Vaserstein 1971, Theorem 2, printed p. 18".
  - :501 cites condition (a) of the lemma-definition and Theorem 7.
  - :696 and :699 cite Horváth–Kania Lemmas 2.1 and 2.2(ii), and Shirbisheh Problem 2.8.
  - :63 and :176 cite DifferentialGeometry 5.1.
- R05 — repaired: ":368 Prove that the two presentations agree for every additive T … No lift of the corner to C is used". :380 adds the ℤ→ℚ, u=[[1,1/2],[0,1]] Check.
- R06 — repaired: ":403 For a nonunital complex algebra A, the unital ring map `Unitization ℤ A → Unitization ℂ A` … an isomorphism for i=0 … surjective for i=1 … No injectivity is asserted". :415 adds the A=ℂ Check.
- R07 — repaired:
  - :25, :50 and :236 cite Tau Ceti's `transvectionHom`, `commute_transvection`, `commutatorElement_transvection` and `map_transvection`, and :234 adds the [e₁₂(2),e₂₃(3)]=e₁₃(6) Check.
  - :40, :480 and :517 cite `PartitionOfUnity.exists_isSubordinate_of_locallyFinite`, and :484 keeps only the multiplicity bound.
- R08 — repaired: ":720 OperatorKTheory consumes Layers 0–2, 6 and 8 … GeometryOfNumbersAndQuadraticArithmetic consumes Layers 0–2, 5 and 6 … KTheoryLowDegrees consumes the conventions and Layers 0–6. K2SymbolsBrauer consumes … Layers 1–3 and 5."

## Verified sound

### Gate, build and signatures

- **Gate**, rerun at this head: `gate AlgebraicKTheory: set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's run also reports `build=0`.
- **Outside the folder**, `git diff --stat origin/main...HEAD` is empty.
- **Elaboration**: `lake env lean` on `Suggested.lean` exits 0 after 14 s. It prints exactly 13 "declaration uses `sorry`" warnings, at lines 66, 75, 94, 106, 117, 140, 153, 166, 173, 190, 199, 214 and 231, and nothing else.
- **`#check @`** on all 20 declarations, appended to a scratch copy, shows every needed binder in the elaborated type:
  - `HasStableRangeLE R s` in both stability theorems;
  - `s ≤ Fintype.card n`, `s + 1 ≤ Fintype.card n`, `2 ≤ Fintype.card n` and `3 ≤ Fintype.card n`;
  - `[CompactSpace X] [T2Space X]` and `1 ≤ s` in both Vaserstein theorems;
  - `[IsNoetherianRing A]` with `ringKrullDim A ≤ ↑d`;
  - `[IsSemisimpleRing (R ⧸ Ring.jacobson R)]`.

  No binder was lost, and nothing changed since the previous report.
- **One-tactic probe**: on a scratch copy, every `sorry` was replaced by `first | rfl | simp | infer_instance | decide | trivial | aesop`. All 13 theorems fail (13 errors, at the 13 former `sorry` lines). There is no padding.
- **Headline theorems**: they are unchanged. The docstring still names the unstatable ones, and its claim that neither pin has a balanced tensor product over noncommutative rings holds: a search of both pins finds none.

### Dependency check

The required command printed exactly:

```text
depcheck: 244 roadmaps, 2462 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. AlgebraicKTheory is at merge-order line 16 and HilbertModules at line 9. ClassicalArithmeticCompletion, DifferentialGeometry, CharacteristicClasses, TopologicalKTheory and BanachAlgebras are on main.

### Cross-roadmap citations resolved

On main (3b3f7ef):

- **ClassicalArithmeticCompletion** §7.6 (line 14458), §7.7 (14487), §7.8 (14505), §7.23 (14930), §7.24 (14948) and §7.42 (15404). Each is stated for an arbitrary unital ring or ring map, as :15 and :56–58 say. §7.6 says "R any unital ring". §7.24 says "Extension along every unital R→S preserves finite projective left modules". §7.42 has `ExtensionK0Map.of`, `.identity`, `.composition` and `.free`.
- **DifferentialGeometry** 5.1 (line 507: the outward-first `boundaryOrientation`) and 11.1 (line 902).
- **CharacteristicClasses** C7 (line 1817).

At open heads:

- ClassicalArithmeticCompletion #1409 (d8a53de) keeps §§7.6–7.8, 7.23, 7.24 and 7.42.
- DifferentialGeometry #886 keeps 5.1 (line 724), now explicitly for the closed unit ball and its boundary Sⁿ.
- HigherToposTheory #1901 (f522659):
  - its L12.2 defines `TopologicalSpace.HasCoveringDimLE` with indexed covers and distinct-index intersections (README line 9975);
  - its L12.4 states the paracompact finite-cover theorem (line 10243), sphere extension under `[ParacompactSpace X] [T2Space X]` (line 10268) and the countable-sum and closed-subspace theorems under `[NormalSpace X]` (line 10282).

  This matches :15. HigherToposTheory's head still defines the predicate itself (line 9701). Repointing it to 4.3 is for that roadmap's review: this roadmap is earlier in the merge order, and HigherToposTheory is not ordered.
- The consumer claims at :720 match the heads:
  - OperatorKTheory #866 (b328ec0) cites A0 (line 263) and A1–A2, A6, A8 (line 270);
  - GeometryOfNumbersAndQuadraticArithmetic #851 (da750f5) cites A0–A2, A5 and A6;
  - KTheoryLowDegrees #1248 (4d2f327) cites "conventions and A0–A6" (lines 11, 71);
  - K2SymbolsBrauer #1302 (6a7f84a) cites "A1–A3/A5" (lines 13, 139) and no A4.
- `roadmaps overlaps` lists no open pull request that changes this roadmap and no id that one drops. Its "None" misses #886, as last round.

### Library declarations opened (pins Mathlib 6b7abb3c, Tau Ceti a91d3aaf)

- Tau Ceti `LinearAlgebra/Matrix/SpecialLinearGroup/Transvection.lean`, all `[CommRing A]`:
  - `transvectionHom` (:629, `Multiplicative A →* SL n A`);
  - `map_transvection` (:661);
  - `commute_transvection` (:718, hypotheses i≠j, k≠l, j≠k, l≠i);
  - `commutatorElement_transvection` (:739, ⁅xᵢⱼ(c),xⱼₗ(d)⁆=xᵢₗ(cd) for distinct i, j, l).
- Mathlib `Topology/PartitionOfUnity.lean`:
  - :617 `PartitionOfUnity.exists_isSubordinate_of_locallyFinite`, with `[NormalSpace X]`, a closed s and a locally finite open cover;
  - :281 `IsSubordinate`, meaning `tsupport (f i) ⊆ U i`.
- Mathlib `RingTheory/Ideal/Operations.lean:809` `Ideal.IsRadical` (R02).

### Sources opened (new or changed locators)

- weibel-kbook-III:
  - lines 33 and 38–39 (Def. 1.1 and functoriality, p. 1);
  - lines 706–714 (Def. 2.2 and Remark 2.2.1, p. 13).
- weibel-kbook-II:
  - lines 204–207 (§2, p. 5);
  - lines 613–635 (Def. 2.10, pp. 13–14);
  - lines 651–655 (Ex. 2.3(a), p. 14);
  - lines 669–675 and 688 (Ex. 2.4 and 2.4(e), p. 15);
  - lines 775–781 (Ex. 2.17, p. 17).
- weibel-kbook-I:
  - lines 144–157 (Ex. 1.5(a), (d));
  - lines 243–258 (Ex. 1.12, (v)).
- vaserstein-1971, Russian original:
  - lines 51–54 (Theorem 1), 62–63 (Lemma 3, the Jacobson radical) and 66–67 (Theorem 2), all p. 18;
  - lines 114–124 (lemma-definition, condition (a): uniform ε-approximation by maps avoiding 0) and 138–145 (d(X) and the projection remark), p. 19;
  - lines 179–186 (Theorem 7), p. 20.
- horvath-kania-2026:
  - lines 128–134 (Lemma 2.1, p. 3: Inv₀(A) is the set of finite products of exponentials; its proof gives the path component);
  - lines 135–146 (Lemma 2.2(ii), pp. 3–4).
- shirbisheh-2021 lines 2007–2021 (Problem 2.8(iii)–(v), printed p. 51: generated by 1−x with ‖x‖<1, open, the identity component, normal, assuming ‖1‖=1).

### Seeded sample, where it falls in the changed passages

The sampled targets 0.2, 0.7, 1.2, 1.3, 1.4, 2.3, 3.3, 5.1, 6.1, 7.1 and 7.2 are unchanged since b88e48f.

| Target | Locator inspected | Outcome |
|---|---|---|
| 0.3 | weibel-kbook-II lines 204–207 (division rings and K₀(ℤ)=ℤ, p. 5); ClassicalArithmeticCompletion §§7.24, 7.42 | Correct |
| 0.6 | DifferentialGeometry 5.1 (main line 507; #886 line 724); CharacteristicClasses C7 (line 1817) | Correct |
| 3.2 | weibel-kbook-II lines 613–635 (Def. 2.10), 775–781 (Ex. 2.17(a)–(b), p. 17), 688 (Ex. 2.4(e)) | Correct. Weibel's relations are along exact sequences of triples in P(R), which split. |
| 3.4 | weibel-kbook-II lines 651–655 (Ex. 2.3(a)), 669–675 (Ex. 2.4); weibel-kbook-III lines 711–714 (Rem. 2.2.1) | Correct |

### Adversarial table

Changed statements, with values computed at this head:

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 0.1, complement via §7.7 over Rᵐᵒᵖ | R=ℤ×ℤ, P=ℤ×0; zero ring | Q=0×ℤ and P⊕Q≅R¹ with P not free; zero ring: P=Q=0, n=0 | Sound |
| 0.3, K₀(f) as §7.42 at fᵐᵒᵖ, and the new Check | k→M₂(k); ℤ[C₂]→ℤ; ℂ→M₂(ℝ), a+bi↦[[a,−b],[b,a]] | [k]↦[M₂(k)]=2[e₁₁M₂(k)]↦2, while the Morita map gives 1; [ℤ[C₂]]↦[ℤ], equal to §7.42's Check since fᵐᵒᵖ=f; [ℂ]↦[M₂(ℝ)]↦2 | Sound |
| 0.4, [P]=[Q] iff P⊕Rᵏ≅Q⊕Rᵏ | ℤ[√−5] with 𝔭=(2,1+√−5); zero ring | [𝔭⊕𝔭]=[A²] with k=0; [𝔭]≠[A], since Cl=ℤ/2 separates them; zero ring: every class is 0 | Sound |
| 1.1, new Check | ℤ: c=2, d=3; reversed order | (1+2E₁₂)(1+3E₂₃)(1−2E₁₂)(1−3E₂₃)=1+6E₁₃; reversed: 1−6E₁₃ | Sound; matches `commutatorElement_transvection` |
| 2.1, products and colimits | 𝔽₂×𝔽₃ | K₁=0⊕ℤ/2; Eₙ(R×S)=Eₙ(R)×Eₙ(S), since eᵢⱼ((a,b))=(eᵢⱼ(a),1)(1,eᵢⱼ(b)) | Sound |
| 3.2, factorization | block [[α′,γ],[0,α″]] | u∘(α′⊕α″)=[[α′,cα″],[0,α″]], equal to α iff c=γα″⁻¹; [e₁₃(c),e₃₂(1)]=e₁₂(c) under [x,y]=xyx⁻¹y⁻¹ | Sound |
| 3.2, presentations agree for all T | ℤ→ℚ with u=[[1,1/2],[0,1]]; T=id | Weibel's exact sequence gives 0; the direct-sum presentation gives u⊕1=e₁₂(1/2), a commutator, so 0; T=id: (P,α,Q)=(P,T(α),Q)=0 in both, so K₀(id)=0 | Sound |
| 3.4, ℂ comparison | A=ℂ; A=0 | (m,a)↦(m,m+a) and (z,a)↦(z,z+a) turn the map into ℤ×ℂ→ℂ×ℂ, (m,c)↦(m,c); reduced K₁: ℂˣ→ℂˣ is the identity; reduced K₀: ℤ→ℤ is the identity; A=0 gives 0→0 | Sound |
| 3.4, surjectivity for i=1 | any A | For x in the kernel with representative g, g·ε(g)⁻¹∈GL(A) has class x; GL(A) consists of the 1+a with a quasi-invertible in M(A), the same set in both unitizations | Sound; no injectivity is claimed |
| 4.1, opposite ring | ℍ; T₂(k) | sr(ℍ)=sr(ℍᵒᵖ)=1; T₂(k)ᵒᵖ≅T₂(k) by transpose and index reversal, both 1 | Sound |
| 4.2, modulo a radical ideal | 5ℤ⊂ℤ (Mathlib's sense); 5ℤ₍₅₎⊂ℤ₍₅₎; quotient ℤ→𝔽₅ | 2≠1, false under Mathlib's reading; 1=1; sr(ℤ)=2≥1=sr(𝔽₅) | R02 |
| 4.4, multiplicity bound | [0,1] with V₁=[0,2/3), V₂=(1/3,1], d=1 | at x=1/2, 2≤2 functions are nonzero; at x=0, tsupport f₂⊂V₂∌0, so 1 | Sound |
| 4.5, tsr=sr for C(X,ℂ) | point; [0,1]; S²; T⁴ | least n with 2n>d is 1, 1, 2, 3; ⌊d/2⌋+1 is 1, 1, 2, 3 | Sound |
| 8.2, exponentials and lifting | ℂ; C(S¹); C(D²)→C(S¹) | ℂˣ=exp(ℂ); z has winding 1, while every product of exponentials has winding 0; a winding-0 f equals eʰ and h lifts by Tietze; z does not lift to Inv₀ | Sound |
| Scope, HigherToposTheory's indexed predicate | a point indexed twice, n=0; [0,1], n=0 | v₁=v₂=X fails the distinct-index condition, but {X} refines and both predicates hold; [0,1] fails both, since it is connected | Same predicate |

Statements left untouched by the diff carry the rows of the previous report (PRREVIEW-AlgebraicKTheory~7) with their values:

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| `kZero_divisionRing` | D=𝔽₂, D=ℍ | [D]↦1, [D²]↦2 | True |
| `kZero_int` | ℤ; control ℤ[√−5] | [ℤⁿ]↦n; K₀(ℤ[√−5])=ℤ⊕ℤ/2 | True |
| `whitehead_commutator_elementary` | ℍ, n=1, g=i, h=j | [i,j]=−1, Dieudonné value trivial, so diag(−1,1)∈E₂(ℍ) | True |
| `elementary_le_commutator` | 𝔽₂, card 3 and 2 | E₃(𝔽₂) simple of order 168; E₂(𝔽₂)≅S₃⊄A₃ | Bound needed and present |
| `dieudonne_determinant` | 𝔽₃, n=2; ℍ, n=1 | kernel SL₂(𝔽₃)=E₂ of order 24; for n=1 the kernel is the unit quaternions ≠ E₁ | True for n≥2 |
| `HasStableRangeLE` | s=0; ℤ, s=1 | (1) shortens to the empty row only if 1=0; (2,5): 2+5c≠±1 | Matches Weibel's (Sₛ) |
| `surjective_stability` / `injective_stability` | field, s=1; Cohn's matrix over k[x,y] | [[0,1],[1,0]]=diag(−1,1)·e with e∈E₂; Cohn's matrix lies in E₃∖E₂, but 2<s+1 | True |
| `hasStableRangeLE_one_of_isSemisimpleRing` | 𝔽₂[x]/(x²); zero ring; control ℤ | x+(1+x)·1=1+2x=1; 0 has every bound; ℤ fails | True |
| `hasStableRangeLE_of_ringKrullDim_le` | ℤ, d=1; ℤ[x], d=2 | ≤2 (≤1 false); ≤3 | True |
| `HasCoveringDimensionLE` | [0,1], d=0 and 1; ∅ | d=0 fails, d=1 holds; ∅ uses the empty refinement | Lebesgue dimension |
| both Vaserstein `iff`s | S², T⁴, s=0 control | ℂ: S² s=1 false/false, s=2 true/true; T⁴ s=3 true/true; ℝ: S² s=2 false/false, s=3 true/true; s=0 on a point: false vs true | Agree; hs needed |
| `kZero_arithmeticSquare` / `kZero_cuspSquare` | ℤ×_𝔽₅ℤ; 𝔽₅[t²,t³] | cokernels ℤ/2 and ℤ/5, with [D]↦(1,0) | True |

## Not verifiable

- **Milnor, *Introduction to Algebraic K-Theory*, and Bass, *Algebraic K-Theory*, Theorem V.3.5:** both are uncertified in the manifest and cited by locator only. Nothing in the diff touches them.
- **Vaserstein's English translation:** it is not in the cache. I read the Russian original, whose printed pp. 18–20 carry every new Vaserstein locator.

## Source issues

- **Misprint** in shirbisheh-2021 at Problem 2.8(i), printed p. 51: the source assumes ‖a‖≤1 to join 1 to (1−a)⁻¹, but for a=1 the element 1−a=0 is not invertible; it should assume ‖a‖<1; affects nothing.
