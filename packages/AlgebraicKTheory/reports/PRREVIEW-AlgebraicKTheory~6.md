# Review of AlgebraicKTheory (pull request #1142 at 40dd76a)

**Verdict:** needs changes

This is a full review of head 40dd76a (173 changed lines since 98260b1). The two auxiliary Lean files are now folded into `Suggested.lean`, and nothing outside the roadmap folder changed. The gate passes at this head and the dependency check is clean. There are nine findings: one P2 (statable end theorems missing from the acceptance test) and eight P3.

Source ids used below: weibel-kbook-I, -II, -III (Weibel's chapter files on his author page); vaserstein (the Russian original on Mathnet); engelking-dimension; grebennikov (arXiv 2306.13180v1); stacks-0D2J and stacks-0DVN (the Stacks Project chapter PDFs at those tags).

## Previous findings

- **Previous R01 (the empty space in 4.4): not repaired.** `README.md:468` still says "its agreement with Vaserstein's d(X) for compact Hausdorff X (both ∞ when no finite d works)", and :465 still has no nonemptiness hypothesis. It is carried below as R04.
- **Previous R02 (form of the auxiliary files): partly repaired.** The files are gone. Their content now sits in `Suggested.lean:83–165`, under the roadmap namespace and behind the single `import Mathlib` (:1–3). The seven definitions there (`complexPoint`, `rawSection`, `firstSection`, `secondSection`, `frame`, `projection`, `phase`) still have no docstrings, and none of the twelve names in those sections occurs in the README. The deletion asked for in R02 below settles both points.
- **Previous R03 (Check-level admissions): not repaired.** `rawSection_laws`, `projection_periodic_idempotent` and `real_antiperiodic_has_zero` are now at `Suggested.lean:114, 146, 152`. Moving them added `frame_unitary` (:121) and `complex_antiperiodic_factor` (:158) to the acceptance test as well. This is carried as R02.

## R01 (P2) — The explicit K₀ calculations of Layer 7 can be stated at the pins but are missing, and the docstring gives a reason that does not apply to them

**Location:** `TauCetiRoadmap/AlgebraicKTheory/Suggested.lean:18–23`: "the gluing calculations of A7, and every statement about the K₀ map of a ring homomorphism: these need extension of scalars along an arbitrary ring homomorphism". `README.md:3` lists "the explicit K₀ and K₁ calculations of Layers 0, 2 and 7" among the end theorems, and `README.md:641` gives "K₀(ℤ×_𝔽₅ℤ)≅ℤ⊕ℤ/2".

**Claim:** The calculations of Layer 7 cannot be stated without scalar extension.

**Witness:** Neither value mentions a ring map. A scratch copy declaring `KZero ((Int.castRingHom (ZMod 5)).pullback (Int.castRingHom (ZMod 5))) ≃+ ℤ × ZMod 2` with `[D] ↦ (1,0)`, and the analogous cusp statement with `ℤ × ZMod 5`, elaborates under the default options.

**Repair:** After `kZero_int`, add the two statements below. They were tested in a scratch copy: both elaborate with only `sorry` warnings, using `open Polynomial` for `(ZMod 5)[X]`.

```lean
/-- The arithmetic Milnor square `ℤ ×_{𝔽₅} ℤ`, Mathlib's ring pullback of two reductions. -/
abbrev arithmeticSquare := (Int.castRingHom (ZMod 5)).pullback (Int.castRingHom (ZMod 5))

/-- `K₀(ℤ ×_{𝔽₅} ℤ) ≅ ℤ ⊕ ℤ/2`, the free module of rank one going to `(1, 0)`
(Weibel, *The K-book*, Chapter III, Theorem 2.6, chapter p. 15). -/
theorem kZero_arithmeticSquare :
    ∃ e : KZero arithmeticSquare ≃+ ℤ × ZMod 2,
      e (TauCeti.SplitK0.of
        (⟨ModuleCat.of arithmeticSquareᵐᵒᵖ arithmeticSquareᵐᵒᵖ, ⟨inferInstance, inferInstance⟩⟩ :
          FiniteProjectiveRight arithmeticSquare)) = (1, 0) := by
  sorry

/-- The cusp `𝔽₅[t², t³]` as the pullback of `𝔽₅[t] → 𝔽₅[t]/(t²) ← 𝔽₅`. -/
noncomputable abbrev cuspSquare :=
  (Ideal.Quotient.mk (Ideal.span {(X : (ZMod 5)[X]) ^ 2})).pullback
    ((Ideal.Quotient.mk (Ideal.span {(X : (ZMod 5)[X]) ^ 2})).comp
      (algebraMap (ZMod 5) (ZMod 5)[X]))

/-- `K₀` of the cusp over `𝔽₅` is `ℤ ⊕ 𝔽₅`, the free module of rank one going to `(1, 0)`
(Weibel, *The K-book*, Chapter II, Example 2.9.1, chapter p. 13). -/
theorem kZero_cuspSquare :
    ∃ e : KZero cuspSquare ≃+ ℤ × ZMod 5,
      e (TauCeti.SplitK0.of
        (⟨ModuleCat.of cuspSquareᵐᵒᵖ cuspSquareᵐᵒᵖ,
          ⟨Module.Finite.self _, @Module.Projective.of_free _ _ _ _ _ (Module.Free.self _)⟩⟩ :
          FiniteProjectiveRight cuspSquare)) = (1, 0) := by
  sorry
```

Use the explicit instance terms in the cusp statement: with `inferInstance`, typeclass search times out on this pullback. Then:

- name both theorems in the 7.2 bullets at `README.md:641–642`;
- narrow the docstring bullet at :18–23 to the patching theorem and Milnor sequence of A6, the gluing of 7.1, and the `ker f₀` form of 7.2, which is the part that needs the K₀ map of a ring homomorphism.

## R02 (P3) — The 0.6 and 0.7 helper sections are padding in the acceptance test

**Location:** `TauCetiRoadmap/AlgebraicKTheory/Suggested.lean:83–165`, and the parentheticals at :31–32 and :36–37 ("(stated in the `SphereComplexification` section below)", "(stated in the `Mobius` section below)").

**Claim:** `rawSection_laws`, `frame_unitary`, `projection_periodic_idempotent`, `real_antiperiodic_has_zero` and `complex_antiperiodic_factor` are headline theorems.

**Witness:** The module docstring itself says these identities "do not state these results" (:36–37) and are "not the module conclusion" (:31–32). They mirror the README Checks at :174–175 and :195–197 (the values x·w=0, conj(w)·w=1+x₂², the periodic idempotent uuᵀ, the zero given by the intermediate value theorem). None of the twelve names occurs in the README.

**Repair:** Delete lines 83–165 together with both parentheticals; the README keeps these statements as Checks. Do not prove them in place. This also settles the missing docstrings and README names of previous R02.

## R03 (P3) — The semilocal stable-range theorem of 4.2 is stated only in its commutative special case

**Location:** `Suggested.lean:245–250` (`hasStableRangeLE_one_of_finite_maximalSpectrum`, which assumes `[CommRing A] [Finite (MaximalSpectrum A)]`). `README.md:433` reads "Prove stable range one for semilocal rings … the commutative specialization is `hasStableRangeLE_one_of_finite_maximalSpectrum`".

**Claim:** The acceptance test checks the semilocal theorem.

**Witness:** The general statement `(R : Type u) [Ring R] [IsSemisimpleRing (R ⧸ Ring.jacobson R)] : HasStableRangeLE R 1` elaborates at the pin, with `Ring.instIsTwoSidedJacobson` supplying the quotient ring. It is Weibel's semilocal notion (weibel-kbook-II line 694), and the cited Exercises I.1.5(c) and I.1.12(v) (weibel-kbook-I lines 155, 257) hold for arbitrary rings.

**Repair:**

- State the general form in `Suggested.lean` as `hasStableRangeLE_one_of_isSemisimpleRing` with the signature above. It was tested: it elaborates with one `sorry` warning.
- Rename the 4.2 API bullet to match.
- Move the commutative case to a 4.2 Check: by the Chinese remainder theorem, R/J is a finite product of fields, for example 𝔽₅×𝔽₇.

## R04 (P3) — The agreement with Vaserstein's d(X) fails for the empty space

**Location:** `README.md:465` ("prove that this equals Vaserstein's stable-value dimension d(X)") and :468 ("for compact Hausdorff X (both ∞ when no finite d works)").

**Claim:** For every compact Hausdorff X, the covering dimension equals d(X).

**Witness:** vaserstein lines 138–141 define d(X) as the largest d admitting a map to ℝᵈ with 0 a stable value, and set d(X)=∞ when no such d exists. For X=∅, 0 is unstable for every d, so d(∅)=∞. Section 4.3 gives ∅ the covering value ⊥.

**Repair:**

- Add "nonempty" at :465 and :468.
- Add a 4.4 Check for X=∅: covering value ⊥, d(∅)=∞ by Vaserstein's convention, and C(∅,𝕜)=0 has every stable range. Section 4.5 already reads "nonempty".
- The Lean headlines are unaffected: both sides are true at X=∅ (table below).

## R05 (P3) — 4.1 restates unimodularity instead of using Mathlib's `Module.IsUnimodular`

**Location:** `README.md:417` ("Define right-unimodular rows (a₁,…,aₙ), with witnesses Σaᵢbᵢ=1"), and `Suggested.lean:216–217`.

**Claim:** Right-unimodularity of a row needs its own definition.

**Witness:** `Mathlib/LinearAlgebra/Unimodular.lean:46`, `Module.IsUnimodular R v := ∃ f : M →ₗ[R] R, f v = 1`, holds for any `[Semiring R]`. On `Fin n → R`, a left-linear functional is `v ↦ Σ vᵢ f(eᵢ)`, so `IsUnimodular R a` says exactly that Σaᵢbᵢ=1 for some b.

**Repair:**

- Cite `Module.IsUnimodular` (`Mathlib.LinearAlgebra.Unimodular`) in the Mathlib supplier contract.
- In 4.1, say that a row a is right-unimodular when `Module.IsUnimodular R a` holds.
- Phrase the definition through it. This was tested: it elaborates, and a scratch proof confirms the 4.1 Check that stable range at most 0 forces 1=0.

```lean
def HasStableRangeLE (R : Type u) [Ring R] (s : ℕ) : Prop :=
  ∀ a : Fin (s + 1) → R, Module.IsUnimodular R a →
    ∃ c : Fin s → R, Module.IsUnimodular R (fun i => a (Fin.castSucc i) + a (Fin.last s) * c i)
```

## R06 (P3) — The pinned Tau Ceti theorems on generation of SLₙ by transvections are used but not cited

**Location:** `README.md:223` ("Over a field k, Eₙ(k)=SLₙ(k) for every n"); :316 ("Compute K₁(F)=Fˣ for fields by Gaussian elimination … K₁(ℤ)={±1}"); :325 ("SK₁(ℤ)=0 because SLₙ(ℤ) is generated by elementary matrices (Euclidean algorithm)"). The "From Tau Ceti" contract at :43–47 does not list these theorems.

**Claim:** These steps are carried out here by Gaussian elimination and the Euclidean algorithm.

**Witness:** `TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Transvection.lean:584` proves `Matrix.SpecialLinearGroup.closure_range_toSpecialLinearGroup_eq_top` (SLₙ(ℤ) is generated by transvections), and :595 proves the `_of_field` version. KTheoryLowDegrees (README line 54, at its head) already consumes these from "the existing matrix-group library".

**Repair:**

- Add both declarations, with their file, to the "From Tau Ceti" contract.
- In 1.1 and 2.3, derive Eₙ(k)=SLₙ(k) and SK₁(ℤ)=0 by pushing them along `Matrix.SpecialLinearGroup.toGL`, instead of re-running the elimination.
- Add the declarations to the *Needs:* lines of 1.1 and 2.3.

## R07 (P3) — The Scope's citations of GeneralAlgebraicKTheory do not match its head

**Location:** `README.md:17`: "Its §3.14 (`ringKGroup.zeroEquiv`, `ringKGroup.oneEquiv`) … Its §§4.15–4.17 state, for a small additive functor T:C→D, the relative triple group …". `README.md:703` reads "its §3.14, §§4.15–4.17 and §8.7".

**Claim:** GeneralAlgebraicKTheory §§4.15–4.17 state the triple group, K₁ᴮ and the five-term sequence, and its §3.14 declares these two names.

**Witness:**

- At GeneralAlgebraicKTheory's head, Layer 4 goes from §4.14 straight to §4.16 (lines 890, 900): there is no §4.15.
- §4.16 identifies 2.2's K₁ᴮ(C) with split-exact K₁, and §4.17 consumes 2.2 and 3.2–3.3.
- `roadmaps grep` finds `ringKGroup` only in this README.

**Repair:**

- At :17, replace the §§4.15–4.17 sentence: "Its §4.16 identifies 2.2's K₁ᴮ(C) with split-exact K₁, and its §4.17 extends exactness at K₁ᴮ(D) to summand-dense functors that are not full; both consume 2.2, 3.2 and 3.3."
- Drop the two backticked names (§3.14 declares none).
- At :703, write §§4.16–4.17.

## R08 (P3) — Three results have no locator

**Location:**

- `README.md:342` (3.1): "Prove that K₁(R,I)→K₁(R)→K₁(R/I) is exact at K₁(R)".
- :522 (5.2): the relative K₂ sequence, positive-size Morita invariance of K₂, Matsumoto's presentation and K₂(𝔽_q)=0, all without a locator.
- :580 (6.3): "Normalize the boundary by δ([u])=[M(u)]−[Dⁿ]", also without one.

**Claim:** Every theorem carries a locator.

**Witness:** The statements are in the cached Weibel chapters:

- 3.1: weibel-kbook-III line 719 (Proposition 2.3, p. 13).
- 5.2: line 2096 (Theorem 5.7.1, p. 40), line 2044 (Corollary 5.6.1, p. 39), line 2454 (Matsumoto's Theorem 6.1, p. 48), line 2463 (Corollary 6.1.1, p. 48).
- 6.3: the patching boundary ∂ₙ(g)=[P]−[Rⁿ] is weibel-kbook-II line 584 (§2, p. 13, with Theorem 2.9).

**Repair:** Attach these locators at the three claims. In 6.3, note that the orientation uπ₁(a)=π₂(b) is fixed here, so the source is cited for the construction and not for the sign.

## R09 (P3) — The declaration-by-declaration map of the grothendieck-project file sits in Conventions

**Location:** `README.md:25`: "Its `Matrix.elementarySubgroup n A` is the closure of the units `Matrix.transvectionUnit h a` … (`Matrix.commutator_transvectionUnit`) … (`Matrix.isPerfect_elementarySubgroup`)".

**Claim:** The map belongs to the standing conventions.

**Witness:** The repository README ("Porting existing work") asks for any file-by-file map in "a clearly secondary provenance section". The seven `Matrix.*` names occur nowhere at the pins (the citation resolver flags all seven), so a reader takes them for Mathlib names.

**Repair:** Move this paragraph, from "A complete CC0 formalization" to the end of the paragraph, into a provenance bullet under References. Keep in Conventions only the sentence that `elementary` has the same generators.

## Verified sound

**Gate, build and signatures.**

- The gate, rerun at this head, reports every check at 0: `stray-files=0`, `outside-folder=0`, `depcheck=0`.
- `lake env lean` on a copy of `Suggested.lean` exits 0 with exactly 16 "declaration uses `sorry`" warnings and nothing else.
- In the same copy, `#check @` on all 28 declarations under their full names shows that every theorem carries its binders:
  - `HasStableRangeLE R s` in the stability theorems;
  - `[CompactSpace X] [T2Space X]` and `1 ≤ s` in the Vaserstein theorems;
  - `[IsNoetherianRing A]` with `ringKrullDim A ≤ ↑d`;
  - `2 ≤ Fintype.card n` and `3 ≤ Fintype.card n`.
- The "Unknown identifier" lines in the worker's signature file are an artefact of that file: it checks `Mobius.projection` and bare names such as `elementary` after the closing `end`. The full names elaborate.

**One-tactic probe.** On copies with every `sorry` replaced, `simp`, `rfl`, `infer_instance` and `exact?` close nothing: 16 failures each. The 0.6/0.7 helpers are padding because they mirror README Checks (R02), not because one tactic closes them.

**Dependency check.** The required command returned exactly:

```text
depcheck: 239 roadmaps, 2366 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. On ordering: OperatorKTheory (merge order line 9) cites this roadmap as a supplier at its head (README lines 204–206). That is an edge to repair in OperatorKTheory's own review, since this README names it only as a consumer.

**Adversarial table** (headlines, sampled targets, and every target a finding touches).

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| `kZero_divisionRing` | D=𝔽₂, D=ℍ | right modules classified by dimension; [D]↦1, [D²]↦2 | True; the normalization e[D]=1 fixes e |
| `kZero_int` | ℤ; ℤ[√−5] as negative control | PID ⇒ projective is free, [ℤⁿ]↦n; ℤ[√−5]: K₀=ℤ⊕ℤ/2 (class number 2) | True; the PID input is used |
| `whitehead_commutator_elementary` | R=ℍ, n=1, g=i, h=j; empty n | [i,j]=(ij)²=k²=−1, U=diag(−1,1), Dieudonné value of diag(−1,1) is \|−1\|=1, so U∈E₂(ℍ); empty n: U=1 | True; agrees with `dieudonne_determinant` |
| `elementary_le_commutator` | 𝔽₂ with 3 indices vs 2 | E₃(𝔽₂)=GL₃(𝔽₂) simple of order 168, equal to its commutator subgroup; E₂(𝔽₂)≅S₃ ⊄ A₃=[GL₂,GL₂] | The bound is needed and present |
| `dieudonne_determinant` | 𝔽₃ n=2; ℍ n=2; 𝔽₂ n=2; ℍ n=1 | GL₂(𝔽₃) order 48 onto 𝔽₃ˣ, kernel SL₂=E₂ of order 24; ℍ: diag(i,1)↦1, diag(2,1)↦2 in ℝ>0; 𝔽₂: kernel GL₂=E₂; ℍ n=1: kernel = unit quaternions ≠ E₁=1 | True for n≥2; the bound is needed |
| `HasStableRangeLE` | s=0; field s=1; ℤ s=1 | s=0: row (1), empty sum 0=1; field: c=0 or 1; ℤ: 2·3+5·(−1)=1, 2+5c≡2 mod 5, never ±1 | Matches Weibel's (Sₙ) and sr (weibel-kbook-I lines 144–148) |
| `surjective_stability` | field, s=1, n=k=1, g=[[0,1],[1,0]]; Cohn's g∈SL₂(F[x,y]) as control | h=det g=−1, e=diag(−1,1)⁻¹g=[[0,−1],[1,0]]∈SL₂=E₂; Cohn: diag(h,1)e forces h=1, g=e∈E₂, contradiction (weibel-kbook-III line 512); sr(F[x,y])≤3 > 1=card n | True; s≤card n is needed (Ex. 1.3(a), line 508) |
| `injective_stability` | field, s=1, n=2; Cohn's g, n=2 | diag(g,1)∈E₃=SL₃ ⇒ det g=1 ⇒ g∈E₂; Cohn: g∈E₃∩GL₂, g∉E₂, but 2<s+1=4 | True; the bound excludes the control (Remark 1.2.5, line 146) |
| `hasStableRangeLE_one_of_finite_maximalSpectrum` | 𝔽₅×𝔽₇; zero ring; ℤ as control | componentwise shortening; zero ring: maximal spectrum empty, 0=1; ℤ: (2,5) fails | True; generality narrowed (R03) |
| semilocal general form (R03) | M₂(𝔽₂) (J=0, simple Artinian); 𝔽₂[x]/(x²) | Artinian ⇒ sr 1 (Ex. 1.5(c)); (x,1+x): x+(1+x)·1=1 since 2x=0 | Statable and true; tested |
| `hasStableRangeLE_of_ringKrullDim_le` | ℤ d=1; field d=0; zero ring | ℤ: ≤2 (Bass, recalled at weibel-kbook-I line 151); field ≤1; ringKrullDim 0=⊥≤d, and the conclusion holds since 0=1 | True |
| `HasCoveringDimensionLE` | finite discrete d=0; [0,1] d=0; ∅ | singletons, multiplicity 1; an order-1 open refinement of [0,1] is {[0,1]}, refining no {[0,2/3),(1/3,1]}; ∅: empty refinement | Determines Lebesgue dimension on compact spaces |
| `hasStableRangeLE_continuousMap_complex_iff` | point; [0,1]; S²; T⁴; ∅ | sr=⌊d/2⌋+1 = 1,1,2,3; S²: s=1 false/false, s=2 true (2≤3)/true; T⁴: s=2 false (4≤3)/false (3≤2), s=3 true/true; ∅: zero ring and every bound | Both sides agree |
| `hasStableRangeLE_continuousMap_real_iff` | point; [0,1]; S² | sr=d+1 = 1,2,3; [0,1]: s=1 false/false, s=2 true/true; S²: s=2 dim≤1 false/false, s=3 true/true | Both sides agree |
| 4.4 agreement with d(X) (R04) | X=∅ | covering value ⊥; d(∅)=∞ (vaserstein lines 138–141) | False at ∅; hypothesis added |
| 4.1 unimodular rows (R05) | Fin 3 → R, left-linear f | f(v)=Σvᵢf(eᵢ); hence `IsUnimodular R a` ⇔ ∃b, Σaᵢbᵢ=1 | Same predicate; repaired definition tested |
| 7.2 arithmetic K₀ (R01) | ℤ×_𝔽₅ℤ | coker g₁=𝔽₅ˣ/{±1}=ℤ/2, ker g₀=diagonal ⇒ ℤ⊕ℤ/2, [D]↦(1,0) | True; statable, tested |
| 7.2 cusp K₀ (R01) | 𝔽₅[t²,t³] | coker g₁=(1+t𝔽₅)≅ℤ/5; Weibel II Ex. 2.9.1 gives ℤ⊕k | True; statable, tested |
| 0.6/0.7 helpers (R02) | x=(0,0,1), x=(1,0,0); t=0, 1/2 | conj(w)·w = 2 and 1 = 1+x₂²; u=(1,i,0)/√2, v=(i,1,0)/√2 orthonormal; p(0)=diag(1,0) periodic; cos πt vanishes at 1/2; χ(t+1)=−χ(t) | True but padding |
| 0.1 finite projectives | ℤ/5; zero ring | ℤ/5 torsion, hence not projective; Proj(0) has one object, n=0 | Sound |
| 0.2 balanced extension | M₂(𝔽₂): p=1, r=E₁₂, s=E₂₁; 𝔽₄; ℤ→ℚ | pr⊗s↦E₁₁ and p⊗rs↦E₁₁, while sr=E₂₂; 4 vs 16 elements; E_f(ℤ)=ℚ, ℚ⊗ℚ→ℚ an iso | Sound |
| 0.7 Möbius module | B(t+1)=diag(−1,1,…)B(t); KO(S¹) | det B antiperiodic and nowhere zero, contradicting the IVT; KO(S¹)=ℤ⊕ℤ/2 agrees with η of order 2 | Sound |
| 1.2 GL∞ | diag(−1), diag(−1,1), diag(−1,−1) | the first two are equal in GL∞, the third differs at every stage; column 2 of e₁₂(1) is (1,1)ᵀ | Sound |
| 1.3 factorization | T=−1 | [[1,−1],[0,1]][[1,0],[1,1]][[1,−1],[0,1]]=[[0,−1],[1,0]]; [[0,T],[−T⁻¹,0]]·[[0,−I],[I,0]]=diag(T,T⁻¹) | Sound |
| 2.2 split-exact relation | X⊕Y⊕Y | e₁₂(γ)=[e₁₃(γ),e₃₂(1)], so its class is 0; [[α,γ],[0,β]]=e₁₂(γβ⁻¹)·diag(α,β) | Sound |
| 3.1 relative K₁ | I=R; I=5ℤ, 2ℤ | GL(R,R)=GL(R), E(R,R)=E(R); −1↦4≠1 in 𝔽₅, so the image is 0; −1≡1 mod 2, so the image is {±1} | Sound; locator added (R08) |
| 3.3 boundary | ℤ→𝔽₅; ℤ→ℚ | δ(2)≠0, δ(4)=0, K₀(ℤ,5ℤ)=ℤ/4 / {±1}=ℤ/2; det mod ±1 is well defined and ker δ={±1} | Sound |
| 5.2 relative K₂ | (ℤ,5ℤ); M₀(ℤ) | 0→K₁(ℤ,5ℤ)→{±1}↪𝔽₅ˣ ⇒ K₁(ℤ,5ℤ)=0; K₂(M₀(ℤ))=0≠ℤ/2 | Sound; locators added (R08) |
| 6.2 M(2) not free | a,b∈{±1} | 2a∈{2,3} mod 5, b∈{1,4}: no solution | Sound |
| 6.3 sign | 𝔽₇ square | 2·{±1}={2,5}, 4·{±1}={3,4}; δ(4)=δ(2⁻¹)=−δ(2)≠δ(2) | Sound |
| 6.4 sequence | Q=ℤ/6; Q=0 | g₀(x,y)=(x−y,x−y), image the diagonal; Q=0 gives the product formulas | Sound |
| 8.1 comparison | ℝ, ℂ, C(S¹) | K₁(ℝ)→{±1} with kernel (0,∞); K₁(ℂ)→0; [z] has winding 1 ≠ 0 | Sound |

**Seeded source sample.**

| Target | Locator inspected | Outcome |
|---|---|---|
| 0.1 | `Mathlib/RingTheory/Finiteness/Projective.lean:28`; Tau Ceti `CartanMap/Basic.lean:124, 231` | Correct |
| 0.2 | weibel-kbook-II line 562 (Ex. 2.8.1, p. 13); ClassicalArithmeticCompletion §7.8 on main, line 14505 | Correct |
| 0.7 | weibel-kbook-I line 1476 ((4.9.1), p. 32: the Möbius bundle; complex bundles on S¹ are trivial) | Correct |
| 1.2 | weibel-kbook-III lines 17–28 (§1, p. 1) | Correct |
| 2.2 | weibel-kbook-III line 321 (Lemma 1.6, p. 7), line 366 (Cor. 1.6.3, p. 8) | Correct; the additive-category form is stated as the roadmap's own |
| 2.3 | weibel-kbook-III lines 109–115 (1.2.4, p. 3), 497 (Ex. 1.2), 127 (K₁(ℍ)) | Correct; source slip under Source issues |
| 3.1 | weibel-kbook-III lines 657, 706 (2.1, 2.2, p. 13) | Correct; Prop. 2.3 (line 719) to be added (R08) |
| 3.3 | weibel-kbook-II line 630 ((2.10.2)), lines 775–781 (Ex. 2.17(c)–(e)); cofinal = summand-dense | Correct |
| 4.2 | weibel-kbook-I lines 150–156, 257 (Ex. 1.5(b)–(c), 1.12(v), p. 5); weibel-kbook-II line 694 (semilocal) | Correct; generality (R03) |
| 5.2 | none in the README | Locators supplied (R08) |
| 6.2 | weibel-kbook-I line 536 (Thm 2.7, p. 12); stacks-0D2J line 578 (Lemma 15.6.9, A′→A onto); stacks-0DVN lines 103–116 (Lemma 93.4.2 recalls the inverse M₁×_φM₂) | Correct |
| 6.3 | none in the README | Locator supplied (R08) |
| 6.4 | weibel-kbook-III line 783 (Thm 2.6, p. 15); grebennikov lines 197–208 (§2.4, p. 5). Weibel's square with S=A₁, R/I=A₂, S/I=Q is the README's square with π₁ onto | Correct |
| 7.2 | weibel-kbook-II line 607 (Ex. 2.9.1, p. 13: K₀ of the cusp is ℤ⊕k) | Correct |
| 8.1 | weibel-kbook-III lines 279–284 (Cor. 1.5.1, Ex. 1.5.2, p. 6) | Correct |

The README flags no locator as unverified. I also opened:

- weibel-kbook-III lines 146–149 (Remark 1.2.5), 171–195 (Lemma 1.3.2, Whitehead 1.3.3, (1.3.4)), 503–511 (Ex. 1.3), 1984–1992 (Thm 5.5);
- weibel-kbook-II lines 204–207 (the K₀ examples before Lemma 2.1), 613–635 (Def. 2.10);
- engelking-dimension lines 7699 (3.1.4, p. 209), 7792 (3.1.8, p. 212), 8582 (3.2.10, p. 233);
- vaserstein lines 138–170 (d(X), d′(X), Theorem 5 "for every topological space") and 179–186 (Theorem 7).

**Pins and duplication by object.** Mathlib is at 6b7abb3c and Tau Ceti at a91d3aaf.

Mathlib declarations opened:

- `RingHom.pullback`, `pullbackFst`, `pullbackSnd` (`RingTheory/LocalRing/Pullback.lean:53, 57, 61`) and the lemmas at :64, 69, 83, 87;
- `RingEquiv.mopMatrix` (`Data/Matrix/Basic.lean:654`) and `ModuleCat.matrixEquivalence` (`RingTheory/Morita/Matrix.lean:187`);
- `Matrix.GeneralLinearGroup.transvection` (`LinearAlgebra/Matrix/ElementaryRowOperations.lean:97`, under `[CommRing R]` from :57), `Matrix.SpecialLinearGroup.toGL` (`GeneralLinearGroup/Defs.lean:273`);
- `Module.IsUnimodular` (`LinearAlgebra/Unimodular.lean:46`);
- `LinearAlgebra/Transvection/Generation.lean`, which is Dieudonné's dilatransvection generation and not the determinant, so it is not a duplicate.

Tau Ceti declarations opened:

- `SplitK0` and `of`, `of_biprod`, `exists_eq_sub`, `liftEquiv`, `map`, `mapEquiv` (`CategoryTheory/GrothendieckGroup/Split.lean:114, 124, 142, 172, 249, 289, 315`);
- `finiteProjectiveModules` and `finiteProjectiveModulesExactStructure_eq_split` (`CartanMap/Basic.lean:124, 231`);
- the Morita and RingEquiv K₀ equivalences (`CartanMap/Morita.lean`, `CartanMap/RingEquiv.lean:40`);
- the SL generation theorems of R06.

Searches of both pins for an elementary subgroup over an arbitrary ring, stable range, covering dimension, Milnor squares, Steinberg groups, the hairy ball theorem and a balanced tensor product found nothing, so the ownership claims at :13–15 hold.

The CC0 grothendieck-project file was read online on 2026-11-07 (main branch, not pinned). It declares the seven `Matrix.*` names under `[Ring A]` with no `sorry`, and its README declares CC0 for the code.

**Cross-roadmap citations resolved.**

On main:

- ClassicalArithmeticCompletion §7.8 (line 14505);
- DifferentialGeometry 11.1 (line 902);
- CharacteristicClasses C7 (lines 1817, 1855–1860: x^⊥, Euler number 1+(−1)ⁿ, e=c₁);
- TopologicalKTheory Conventions (lines 134–162: D₀ first, L with transition z, β=[L]−1, Koszul symbol −β), T1 (163), T4 (816, 872);
- BanachAlgebras A2 (labels at line 181, logarithms at 569).

At open heads:

- HilbertModules H2 (lines 226–246) and H5 (lines 421–423);
- GeneralAlgebraicKTheory §3.14 (646), §4.16 (900), §4.17 (916), §8.4 (1639), §8.7 (1697), except as in R07;
- GeometryOfNumbersAndQuadraticArithmetic §6.1.7 `ringKTheoryModels` (2254) and §6.10 `plusConstructionComparison` (3206).

**Ownership against open pull requests.** I checked by object with the roadmaps tool:

- StableHomotopyKTheory aliases A1's GL and E (its lines 75, 1650);
- KTheoryLowDegrees consumes A0–A6 (lines 72–82);
- K2SymbolsBrauer consumes A5 (lines 4, 16) and states only a finite-rank splitting;
- GeneralAlgebraicKTheory consumes 2.2/3.2/3.3 (§§4.16–4.17);
- OperatorKTheory consumes A1–A2, A6 and A8;
- SchemeKTheoryOperations §3.6 at its head concerns unit loops, not the determinant of 2.3.

No second owner was found. KTheoryLowDegrees links an anchor `#conventions-dependencies-and-ownership` that this head no longer has; that is for its own review, since the A-labels it cites all exist.

## Not verifiable

- **Milnor, Introduction to Algebraic K-Theory**, §§7 and 10: cited by locator only; the text is behind JSTOR.
- **Bass, Algebraic K-Theory**, Theorem V.3.5: not read; checked through Weibel's recall (weibel-kbook-I line 151).
- **Vaserstein, English translation**: not in the cache; the Russian original was read, and its printed pages 19–20 are the cited ones.

## Source issues

- **Misprint** in weibel-kbook-III at 1.2.4, p. 3: the source excludes n=2 for D=𝔽₂ from GLₙ(D)/Eₙ(D)=Dˣ/[Dˣ,Dˣ]; it should drop that exception, since E₂(𝔽₂)=GL₂(𝔽₂) and both sides are trivial; the exception belongs to Eₙ(D)=[GLₙ(D),GLₙ(D)]; affects nothing.
- **Gap** in vaserstein at the definition of d(X) and Theorem 5, printed pp. 19–20: the source sets d(X)=∞ when no d admits a stable value, so d(∅)=∞, while C(∅) is the zero ring of stable rank 1; it should exclude X=∅; affects nothing.
