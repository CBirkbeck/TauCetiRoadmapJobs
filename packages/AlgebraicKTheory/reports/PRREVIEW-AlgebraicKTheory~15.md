# Review of AlgebraicKTheory (pull request #1142 at 2dc9ef4)

**Verdict:** needs changes

This is an incremental re-review of the 140 lines of `TauCetiRoadmap/AlgebraicKTheory/` that changed since 0f463f1, the head the previous review (PRREVIEW-AlgebraicKTheory~14) read. The pins are Mathlib 1b1ccf4 and Tau Ceti 2fd255d.

- The gate passes, the dependency check reports 0 problems, and nothing outside the folder changes.
- `Suggested.lean` elaborates with exactly 21 `sorry` warnings and nothing else. Three of them are the new Layer A5 headlines.
- All four previous findings are repaired. The R02 repair added one new sentence that copies a known error of Vaserstein's Theorem 5 into 4.4. That is the only finding (R01, P3, not blocking).

## R01 (P3) — 4.4 restates Vaserstein's Theorem 5 "for every space", which is false for the empty space

**Location.** `TauCetiRoadmap/AlgebraicKTheory/README.md` :511 (4.4), in the sentence added by the R02 repair: "the equality d(X)=d′(X) for every space is part of Theorem 5, p. 20, where both are the stable rank of C(X,ℝ) minus one".

**Claim.** The sentence says that for every space, d(X)=d′(X)=sr(C(X,ℝ))−1. That fails at X=∅.
- With Vaserstein's definitions, d(∅)=d′(∅)=∞. No map out of ∅ has 0 as a stable value, and no map out of ∅ is essential.
- C(∅,ℝ) is the zero ring, which has finite stable rank.

The sentence also contradicts the roadmap's own 4.5 Check. The previous review already recorded this as an error in the source. The roadmap's targets avoid it because they read Theorem 5 only for nonempty X; this sentence brings the error back into the README.

**Witness.**
- vaserstein-1971 lines 138–141: d(X) is ∞ when no d admits a map with stable value 0. For X=∅, condition (a) holds with b=a, so 0 is never a stable value.
- README :538: "C(∅,𝕜) is the zero ring, which has every stable range".

**Repair.** Replace the quoted clause with:

> "the equality d(X)=d′(X) is part of Theorem 5, p. 20, where for nonempty X both are the stable rank of C(X,ℝ) minus one (for X=∅ both are ∞, while C(∅,ℝ) is the zero ring)"

Tested on the refuting instance:
- At X=∅ the repaired clause asserts only d(∅)=d′(∅)=∞, which is true.
- For nonempty X it says what it said before.

## Previous findings

- R01 — repaired: `Suggested.lean` :348–433 states `steinbergRels`, `SteinbergGroup`, `stableTransvection`, `steinberg_universalCentralExtension` (now with `E : Type v`, more general than the tested block), `kTwo_finiteField`, `MatsumotoGroup` and `matsumoto`. The A5 docstring bullet is deleted, and 5.1, 5.2 and the contracts name them.
- R02 — repaired: 4.4 (:511) now cites "Engelking, Dimension Theory, Problem 3.2.E, printed p. 238, due to Aleksandroff, with essential maps defined in Problem 1.9.A" and adds a stable-value/essential-map bridge. Both docstrings cite 3.2.E. The repair introduced R01 above.
- R03 — repaired: 7.1 (:681) adds "Weibel's clutching construction … read through Swan's equivalence … (Weibel, The K-book, Chapter I, Clutching Construction 4.7, chapter p. 31, and Exercise 4.9, chapter p. 37)". It treats separately the case where j is not an embedding.
- R04 — repaired: Conventions (:25) now reads "The closed, unmerged proposal [44734] is prior art for 4.2 only: it proves, for a commutative ring with finitely many maximal ideals, that a coprime pair a,b has a+tb a unit".

## Verified sound

### Gate, dependency check, elaboration, signatures, probe

- **Gate.** I reran it at this head with `--base origin/main`. It exits 0:

  ```text
  gate AlgebraicKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

  The worker's run also reports `build=0`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AlgebraicKTheory'` is empty.
- **Dependency check.** The required command printed exactly `depcheck: 235 roadmaps, 2265 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/AlgebraicKTheory/Suggested.lean` exits 0 with 21 "declaration uses `sorry`" warnings and nothing else. The new ones are at :388, :402 and :421.
- **`#check @` audit.** One scratch copy with `#check @` for all 41 declarations, under `pp.universes`, exits 0.
  - `steinberg_universalCentralExtension.{u_1,u_2}` quantifies `E : Type u_2`, matching the README's "in any universe".
  - `kTwo_finiteField` keeps `[Field F] [Finite F]`.
  - `matsumoto` has `diag` entries `![r, r⁻¹, 1]` and `![s, 1, s⁻¹]` at `of F 3`, and the commutator `a * b * a⁻¹ * b⁻¹`.
  - The untouched declarations have the types recorded in the previous report.
  - No binder is lost, and nothing changed.
- **One-tactic probe.** I replaced all 21 `sorry`s with `first | rfl | simp | infer_instance | decide | trivial | aesop`. The result is 21 errors out of 21, including the three new headlines, so nothing is padding.
- **Module-path leads** of `roadmaps resolve`: `Mathlib/LinearAlgebra/Matrix/ElementaryRowOperations.lean` and `TauCeti/Algebra/Module/Projective/FreeComplement.lean` exist at the pins, so both leads are false positives.

### Library declarations opened at the pins (new contracts)

- **Mathlib 1b1ccf4:**
  - `PresentedGroup.of` (`GroupTheory/PresentedGroup.lean` :68) and `PresentedGroup.ext` (:177, homomorphisms agreeing on `.of x` are equal);
  - `Matrix.diagonalRingHom` (`Data/Matrix/Basic.lean` :167, `(n → α) →+* Matrix n n α` under `[Fintype n] [DecidableEq n]`);
  - `MulEquiv.piUnits` (`Algebra/Group/Pi/Units.lean` :25).
- **Tau Ceti 2fd255d:** `stabilizeGL` (`GeneralLinearGroup/Stable.lean` :79) and `coe_stabilizeGL_apply` (:87). The entries of u sit in the first m rows and columns, which confirms 5.1's index-convention Check.
- **Mathlib PR 44734** (github, read 2026-11-09): it was closed and not merged. It adds `IsCoprime.exists_isUnit_add_mul` under `[CommRing R] [Finite (MaximalSpectrum R)]` with conclusion `∃ t, IsUnit (a + t * b)`, and defines no stable-range predicate. This matches the new Conventions sentence.

### Ownership and citations

- **New names.** `roadmaps grep` for `SteinbergGroup|steinbergRels|MatsumotoGroup|stableTransvection|universalCentralExtension` in Lean finds only this pull request. The one other hit is StableHomotopyKTheory's `IsPlusConstruction.fiber_universalCentralExtension`, a different object in another namespace. No fully qualified name clashes.
- **Consumers.** These cite A5 and are all later in the merge order (this roadmap is line 15):
  - KTheoryLowDegrees (README :1582, merge-order line 88);
  - K2SymbolsBrauer (line 89);
  - KTheoryFiniteLocalFields (README :77, line 90).
- **Matsumoto's theorem.** GeneralAlgebraicKTheory (README :15) excludes it.
- **Abstract universal central extensions.** RepresentationTheory/InductionRestriction on main owns these (README :741, `IsCentralExtension` and `universal` in its `Suggested.lean`). Scope :17 already says 5.1 states the three defining conditions directly. The route in 5.1 (Weibel Proposition 5.5.1 splitting, then Lemma 5.3.3) does not need the abstract cover, and `Suggested.lean` cannot import another roadmap. So this is not double ownership.
- **Overlaps.** `roadmaps overlaps` reports no open pull request that changes this roadmap or drops an id it cites.

### Sources: changed passages and seeded-sample targets in them

| Target | Locator | Cache lines | Result |
|---|---|---|---|
| 5.1 | Weibel III Definition 5.1, p. 35; third family xₖⱼ(−sr) for i=ℓ | weibel-kbook-III 1840–1856 | Correct; [xᵢⱼ(a),xₖᵢ(b)]=xₖⱼ(−ba) is the inverse of the second family at (k,i,j) |
| 5.1 | Theorem 5.2.1 p. 35; Definition 5.3.1, Lemma 5.3.3 p. 37; Theorem 5.5 p. 38 | 1865–1866, 1941–1959, 1984–1992 | Correct; Lemma 5.3.3 needs X perfect, as stated |
| 5.2 (sample) | Definition 5.10, p. 42; Example 5.10.1 | 2176–2180, 2188–2220, 2223–2227 | Correct: {r,s}=[h₁₂(r),h₁₃(s)], with images diag(r,r⁻¹,1) and diag(s,1,s⁻¹); independent of lifts by centrality |
| 5.2 (sample) | Matsumoto 6.1 and Corollary 6.1.1, p. 48 | 2454–2470 | Correct: (Fˣ⊗Fˣ)/⟨x⊗(1−x)⟩ |
| 4.4 (sample) | Engelking Problem 3.2.E, printed p. 238 | engelking-1978 8763–8765 (page marker 242, printed 238) | Correct: normal X, dim X≤n≥0 iff no essential map to Bⁿ⁺¹ |
| 4.4 (sample) | Engelking Problem 1.9.A, printed pp. 90–91 | 3606–3612 | Correct: inessential means agreeing on f⁻¹(Sⁿ) with a map missing a point of the ball, as paraphrased |
| 4.4 (sample) | Vaserstein lemma-definition (b) p. 19; remark pp. 19–20; Theorem 5 p. 20 | vaserstein-1971 114–124, 142–153, 163–170 | (b) supports both halves of the bridge; [5] is Hurewicz–Wallman; Theorem 5 states d+1=d′+1 for every space (R01) |
| 7.1 (sample) | Weibel I Clutching Construction 4.7, p. 31; Exercise 4.9, p. 37 | weibel-kbook-I 1437–1450, 1701–1708 | Correct: 4.7 needs X=X₁∪X₂ closed, so the README's case split is exactly right |

The `Suggested.lean` docstring glosses Vaserstein's remark as matching stable values with essential maps to a cube. The remark itself compares d(X) only with Hurewicz–Wallman's cube dimension. For every space, a stable value at 0 is equivalent to an essential truncation (computed below). The README's own bridge rests on condition (b), so this gloss needs no change.

No README locator is flagged as unverified (grep: 0).

### Adversarial table: changed statements (computed this round)

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| `steinbergRels` | indices {0,1}; (0,1),(2,3); (0,1,2); p=q | x₀₁ and x₁₀ get no commutation, since j=k=1, so St₂ is a free product; [x₀₁,x₂₃]=1 imposed; [e₀₁(a),e₁₂(b)]=e₀₂(ab) in GL₃; p=q imposes [x₀₁(a),x₀₁(b)]=1, which already follows from additivity | Correct object |
| perfectness (5.1) | x₀₁(a) | [x₀₂(a),x₂₁(1)]=x₀₁(a·1)=x₀₁(a) | Correct |
| `stableTransvection` | p=(0,1) at sizes 2 and 3; p=(3,1) | [[1,a],[0,1]] stabilizes to 1+aE₀₁ in GL₃, not 1+aE₁₂; formed at size 4 | Well defined; Check correct |
| `steinberg_universalCentralExtension` | R=0; ℤ with q=φ; ℤ with E(ℤ)×ℤ/2→E(ℤ); E in another universe | St(0)=1=GL(0), E abelian, ψ trivial and unique; ψ=id; ψ=(φ,0), and (φ,pr) does not exist because St(ℤ)ᵃᵇ=0; `Type u_2` is quantified | True |
| `kTwo_finiteField` | 𝔽₂; 𝔽₃; 𝔽₄; control ℚ | K₂=0 on both sides; ℚ is excluded by `[Finite F]`, and {−1,−1}≠1 there (it maps to K₂(ℝ)→π₁SO≠0) | True; hypothesis needed |
| `MatsumotoGroup` | 𝔽₂; 𝔽₃; 𝔽₅; ℝ | 0; (−1)+(−1)=1 kills ℤ/2, giving 0; in 𝔽₅, Fˣ=⟨2⟩≅ℤ/4 and 2+4=1 gives 2(2⊗2), 3+3=1 gives 9(2⊗2)=2⊗2, giving 0=K₂(𝔽₅); (−1)⊗(−1)≠0, Hilbert symbol −1 | Correct object |
| `matsumoto` | lifts; order swap; wrong model diag(r,1,1); 𝔽₃ with r=s=−1 | det=1, so in SL₃=E₃ and lifts exist (hypotheses satisfiable); [b,a]=[a,b]⁻¹ is absorbed by e↦−e; det r≠1 gives no lift, so vacuous; [a,b]∈K₂(𝔽₃)=1 and the group is 0 | True; not vacuous |
| 4.4 bridge, stable ⇒ essential | X=[0,1], a=x−½ | every b with b=a on {\|a\|≥ε} vanishes by the IVT, so 0 is stable; the truncation to [−ε,ε] has no extension of its boundary values ±ε to [0,1]→{±ε} (connectedness), so it is essential | True |
| 4.4 bridge, essential ⇒ stable | f essential to B, 0 unstable | b=f on {\|f\|≥ε} with 0∉b(X); r∘b, with r:ℝⁿ→B radial, misses 0 and agrees on f⁻¹(∂B), so f is inessential, a contradiction | True |
| compactness step (4.4) | g(X) misses p∈∂B; control X=[−1,1) | g(X) is compact, so a neighbourhood of p in B is missed and contains interior points; the control is not compact and misses only 1 | Hypothesis used |
| 3.2.E reading | n=0: [0,1], a point | x↦2x−1 to B¹ is essential, so dim>0; the point maps to B⁰ with ∂B⁰=∅, essential iff X≠∅ | Matches d(X)=dim X for X≠∅ |
| 4.4 "every space … sr−1" (R01) | X=∅ | d(∅)=d′(∅)=∞; sr(C(∅,ℝ)) is finite (the zero ring, README :538) | False at ∅ |
| 7.1 clutching | D²∪_{S¹}D²; D²→pt along S¹; [0,1] with {0,1}→pt, g₀=1, g₁=−1 | S², Weibel 4.7 applies; D²/S¹≅S² with D² not embedded, so 4.7 does not apply; the Möbius bundle on the circle, locally trivial | Case split correct |
| Conventions on PR 44734 | the pull-request page | closed, not merged; `[Finite (MaximalSpectrum R)]`, `∃ t, IsUnit (a + t * b)` | Correct |

### Adversarial table: untouched statements (rows carried from PRREVIEW-AlgebraicKTheory~14)

| Statement | Values (previous report) | Result |
|---|---|---|
| `kZero_divisionRing` | 𝔽₂ and ℍ: [D]↦1, [D²]↦2 | True |
| `kZero_int` | [ℤⁿ]↦n; control ℤ[√−5] has ℤ⊕ℤ/2 | True |
| `kZeroMap` | [ℤⁿ]↦[ℚⁿ]; [k]↦2[e₁₁M₂(k)]; K₀(0)=0 | Correct |
| `extendScalarsCompIso` | the twist by 2 fails the unit condition in 𝔽₅ | Determined |
| `tangentSections_stablyFree_not_free` | rank 2; R³≅R^(r+1) gives r=2; a nowhere-zero tangent field is impossible (n=2 even); free on S¹ | True |
| `mobiusSections` | ρ(0)=diag(1,−1), ρ(½)=diag(−1,1); the rotation has kernel 0 | Correct |
| `mobiusSections_order_two` | the doubled frame is periodic; det B antiperiodic has a zero (IVT) | True |
| `kOneMap` | [−1]↦[4]≠1 over 𝔽₅ | Correct |
| `kOne_divisionRing` | (2)↦2 in 𝔽₅ˣ; ℍ: (i)↦1 | True |
| `kOne_int` | −1; diag(−1,−1)↦1; e₁₂(5)↦1 | True |
| `dieudonne_determinant` | 𝔽₃, n=2: 48/24=2; control ℍ, n=1 | True for n≥2 |
| `HasStableRangeLE` | s=0 gives 1=0; (2,5) over ℤ, s=1, fails | Correct |
| `surjective_stability` / `injective_stability` | GL₃(ℤ)=GL₂(ℤ)SL₃(ℤ); diag(i,1)∈E₂(ℍ), i∉E₁(ℍ) | True; bound tight |
| `hasStableRangeLE_one_of_isSemisimpleRing` | 𝔽₂[x]/(x²): x+(1+x)=1; control ℤ | True |
| `hasStableRangeLE_of_ringKrullDim_le` | ℤ: sr≤2, not ≤1; ℤ[x]: sr≤3 | True |
| `HasCoveringDimensionLE` | [0,1], d=0, has no order-1 refinement; Hilbert cube | Correct |
| complex and real Vaserstein iff (statements unchanged; docstrings rechecked above) | S², s=1 and 2: false/false, true/true; [0,1] real: s=1 false/false, s=2 true/true; s=0 excluded | True; `1≤s` needed |
| `milnor_patching` | control ℤ→ℚ←ℤ: (ℤ,ℤ,2)≇(ℤ,ℤ,1) | True; hypothesis needed |
| `kZero_mayerVietoris_exact` / `kOne_mayerVietoris_exact` | ℤ→𝔽₅←ℤ: ker g₀ = diagonal; ker g₁={±(1,1)} | True |
| `kZero_arithmeticSquare` / `kZero_cuspSquare` | coker g₁≅ℤ/2; 𝔽₅ˣ×(1+t𝔽₅) modulo 𝔽₅ˣ ≅ ℤ/5 | True |
| 3.2/3.3, 6.3, 7.1 Checks | δ(2)↦2; δ(4)=−δ(2) in ℤ/3; (1+β)^k−1=kβ | Correct |

## Not verifiable

- **Milnor, *Introduction to Algebraic K-Theory*, and Bass, *Algebraic K-Theory*.** Both are settled as uncertified, so I did not read them. None of the changed passages rests on them alone: the K₂(ℤ) Check in 5.1 is untouched.
- **Hurewicz–Wallman, *Dimension Theory*** (Vaserstein's reference [5]). It is not in the manifest, and the README does not cite it directly. The bridge the README uses is checked above from Vaserstein's condition (b) and Engelking 1.9.A and 3.2.E, so it is not needed.

## Source issues

- **Error** in vaserstein-1971 at Theorem 5, printed p. 20: the source states sr(C(X,ℝ))=d(X)+1=d′(X)+1 for every space, but d(∅)=d′(∅)=∞ while C(∅,ℝ) is the zero ring; it should assume X nonempty; affects nothing.
