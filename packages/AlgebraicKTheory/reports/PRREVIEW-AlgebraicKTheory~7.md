# Review of AlgebraicKTheory (pull request #1142 at b88e48f)

**Verdict:** needs changes

This is a full review of head b88e48f, which changes 226 lines since 40dd76a. This head repairs all nine findings of the previous review (see the next section). The gate and the dependency check pass, and `Suggested.lean` elaborates. There are eight findings:

- three P2 findings, all about ownership or supply: a supplier section dropped by an open revision, a second owner of covering dimension, and three Layer 0 targets that ClassicalArithmeticCompletion already owns on main;
- five P3 findings.

Source ids used below: weibel-kbook-I, weibel-kbook-II, weibel-kbook-III, vaserstein-1971 (Russian original), engelking-1978, grebennikov-2023, stacks-0D2J and stacks-0DVN.

## Previous findings

All nine are repaired.

- **R01 (Layer 7 K₀ values): repaired.**
  - `Suggested.lean:214` states `kZero_arithmeticSquare` and :231 states `kZero_cuspSquare`.
  - The docstring at :25–26 now says "The two values of `K₀` computed in 7.2 mention no ring map and are stated below".
  - `README.md:646–647` names both theorems.
- **R02 (the 0.6/0.7 helper sections): repaired.** The helpers are gone. The docstring at :27–36 names 0.5–0.7 as not statable and says which carrier each lacks.
- **R03 (generality of the semilocal theorem): repaired.**
  - `Suggested.lean:166` states `hasStableRangeLE_one_of_isSemisimpleRing (R) [Ring R] [IsSemisimpleRing (R ⧸ Ring.jacobson R)]`.
  - README :436–438 states the general theorem.
  - The commutative case is now a Check (:444).
- **R04 (the empty space in 4.4): repaired.** README :469 now reads "for nonempty X, this equals Vaserstein's stable-value dimension d(X)", :472 matches, and a new Check at :481 covers X=∅.
- **R05 (`Module.IsUnimodular`): repaired.** It is in the supplier contract (:37) and in 4.1 (:420), and `Suggested.lean:132–134` uses it.
- **R06 (Tau Ceti's SL generation theorems): repaired.** They are now cited at :48, :215, :228, :319, :328 and :331.
- **R07 (GeneralAlgebraicKTheory sections): repaired.**
  - :17 now reads "Its §4.16 identifies 2.2's K₁ᴮ(C) with split-exact K₁, and its §4.17 extends exactness at K₁ᴮ(D) …".
  - The two phantom names are gone.
  - Every section cited at :709 exists at that roadmap's head: §§3.1, 3.3–3.4, 3.13–3.14, 4.16–4.17, 8.4–8.7 and 12.2.
- **R08 (missing locators): repaired.**
  - 3.1 (:345) cites Proposition 2.3, p. 13.
  - 5.2 (:527) cites Corollary 5.6.1 (p. 39), Definition 5.2 (p. 35), Theorem 5.7.1 (p. 40), and Matsumoto's Theorem 6.1 with Corollary 6.1.1 (p. 48).
  - 6.3 (:585) cites the Mayer–Vietoris paragraph before Theorem 2.9 (p. 13), with the caveat about the sign.
- **R09 (the provenance map in Conventions): repaired.** Conventions (:25) keeps one sentence, and the map is now a References bullet (:720).

## R01 (P2) — The hairy ball theorem that 0.5 consumes is dropped by DifferentialGeometry's open revision, and no open head takes it over

**Location:** `TauCetiRoadmap/AlgebraicKTheory/README.md:57`: "11.1 `exists_eq_zero_of_inner_eq_zero`: for even n, a continuous field `w` on the unit sphere … has a zero". The same citation appears at :152, :163 (the *Needs:* line of 0.5) and :209.

**Claim:** DifferentialGeometry 11.1 supplies the hairy ball theorem.

**Witness:** DifferentialGeometry #886 (head a565de6) has no Layer 11; its README line 261 gives the theorem to DeRhamCohomologyAndDuality ("none of them is a target here"). DeRhamCohomologyAndDuality #1768 (lines 8, 49) consumes it as DifferentialGeometry's "layer 11".

When #886 merges, the citation breaks and the theorem has no owner.

**Repair:**

- The hairy ball theorem needs an owner that states it at an open head. Either DifferentialGeometry's revision keeps Layer 11, or DeRhamCohomologyAndDuality states the theorem as a numbered target.
- Point the four citations at :57, :152, :163 and :209 to that target.
- Until that is settled, the merge-order paragraph of this pull request should name the DifferentialGeometry revision as one that must not merge first. That paragraph is in the pull request description, never in the README.
- Nothing else in the README changes. The statement it needs is the one at `DifferentialGeometry/Suggested.lean:3097` on main: for even n, a continuous `w` on the unit sphere with ⟪w x, x⟫=0 at every point has a zero. This is exactly the form 0.5 uses.

## R02 (P2) — Covering dimension has a second owner among the open roadmaps

**Location:** `README.md:15`: "The covering-dimension predicate is this roadmap's: neither pinned library defines covering dimension, and no roadmap on main constructs it (4.3)". The predicate is `Suggested.lean:179`, `HasCoveringDimensionLE`.

**Claim:** This roadmap is the single owner of Lebesgue covering dimension.

**Witness:** HigherToposTheory #1901 defines the same predicate, `TopologicalSpace.HasCoveringDimLE` (README line 9973, `Suggested.lean` line 6053). Its README lines 10243, 10266 and 10281 own finite-cover, sphere-extension and countable-sum theorems overlapping 4.3–4.4.

**Repair:**

- Settle one owner, and keep it here: this roadmap is at merge-order line 16, HigherToposTheory is not ordered yet, and `HasCoveringDimensionLE` is stated for every topological space, so it serves paracompact spaces too.
- At :15, add: "HigherToposTheory L12.2 consumes `HasCoveringDimensionLE` (4.3) and the finite-cover and sphere-extension characterizations of 4.4. Its paracompact generalizations (Dowker's finite-cover theorem, the countable sum theorem and sphere extension for paracompact spaces) are HigherToposTheory's."
- Add HigherToposTheory to Downstream consumers (:709).
- HigherToposTheory's own review then repoints its predicate to 4.3.
- The two definitions agree, so nothing is lost. Deduplicating an indexed refinement gives a set refinement with no larger point multiplicity, and conversely a set refinement indexed by itself keeps its multiplicity. On the test cases they agree: on [0,1] with d=0 both fail, and on a finite discrete space with d=0 both hold.

## R03 (P2) — 0.1, 0.3 and 0.4 restate targets that ClassicalArithmeticCompletion owns on main

**Location:**

- `README.md:85` (0.1): "Every object P of Proj(R) has a complement Q in Proj(R) with an explicit isomorphism P⊕Q≅Rⁿ".
- :119 (0.3): "the functorial map K₀(f):K₀(R)→K₀(S) by `TauCeti.SplitK0.map`. Give identity, composition, naturality".
- :136 (0.4): "Equality [P]=[Q] means P⊕T≅Q⊕T … gives a free stabilizer".

**Claim:** These are this roadmap's targets.

**Witness:** ClassicalArithmeticCompletion on main (eaf17b1), for left modules over any unital ring: §7.7 (line 14487) states the complements; §7.23 (line 14930) that `SplitK0.of P = SplitK0.of Q` iff stably equivalent; §7.42 (line 15404) `ExtensionK0Map` with identity and composition.

**Repair:** Apply those sections at Rᵐᵒᵖ and fᵐᵒᵖ, as 0.2 already does for §7.8.

- In the ClassicalArithmeticCompletion supplier contract (:51–53) and in Scope (:15), add §§7.6–7.7, 7.23 and 7.42.
- In 0.1, replace the complement packaging by a citation of §7.7 at Rᵐᵒᵖ. Keep only the transport into objects of Proj(R).
- In 0.3, define K₀(f) as §7.42's extension map for fᵐᵒᵖ. Keep as targets only:
  - its identification with 0.2's right-module extension P⊗ᵣS;
  - the finite-product, Morita and size-zero statements, which §7.42 does not make.
- Add §7.42 to the *Needs:* line of 0.3.
- In 0.4, cite §7.23 for the stable-equality criterion.
- Tested: along the augmentation ℤ[C₂]→ℤ, the Check of §7.42 gives [ℤ[C₂]]↦[ℤ]. Since ℤ[C₂] is commutative, fᵐᵒᵖ=f and 0.3's map gives the same value.

## R04 (P3) — Five claims have no locator

**Location, claim and witness:**

1. **2.1 (:288–291) has no locator at all.** Weibel's Definition 1.1 (weibel-kbook-III line 33, p. 1) defines K₁ as the abelianization of GL(R), and lines 38–39 give its functoriality.
2. **4.1 (:420), "left/opposite-ring comparison".** This is Vaserstein's Theorem 2 (vaserstein-1971 line 66, printed p. 18), which says the stable rank of a ring equals that of its opposite ring. It is a theorem, not a convention.
3. **4.5, second bullet (:490): the Bass stable rank of C(X,ℂ) equals its topological stable rank.** It follows from Vaserstein's lemma-definition of unstable values, condition (a) (vaserstein-1971 lines 114–124, p. 19), together with Theorem 7 (lines 179–186, p. 20).
4. **8.2 (:685–688): the identity component is generated by exponentials and equals the path component.** There is no locator. Weibel's Exercise 1.12 (weibel-kbook-III line 593, p. 11) covers only commutative Banach algebras.
5. **The sphere orientation (:57, :180).** The README attaches "Its outward sphere orientation" to DifferentialGeometry 11.1, which states no orientation. The outward-first `boundaryOrientation` is DifferentialGeometry 5.1: line 507 on main and line 724 at the revision's head.

**Repair:**

1. At 2.1, cite Weibel, Chapter III, Definition 1.1 and the paragraph after it (p. 1). Say that the product and filtered-colimit formulas follow from 1.2's finite-stage description.
2. At 4.1, cite Vaserstein 1971, Theorem 2, p. 18.
3. At 4.5, cite Vaserstein 1971, the lemma-definition of unstable values (p. 19), with Theorem 7 (p. 20).
4. At 8.2, attach a theorem-level locator in a Banach-algebra text for the noncommutative statement: the identity component is open, generated by exponentials and by any ball ‖g−1‖<1.
5. Cite DifferentialGeometry 5.1, applied to the closed unit ball, at :57 and in 0.6's *Needs:*.

## R05 (P3) — 3.2 compares the two presentations of K₀(T) only for full T, but they agree for every additive T

**Location:** `README.md:360`: "Prove that the two presentations agree when T is full". The bullet at :364 repeats it.

**Claim:** Fullness is needed to compare this direct-sum presentation with Weibel's short-exact-sequence presentation (weibel-kbook-II lines 613–625).

**Witness:** For base change ℤ→ℚ (not full) and u=[[1,1/2],[0,1]], the sequence (ℤ,1,ℤ)→(ℤ²,u,ℤ²)→(ℤ,1,ℤ) is exact. On ℚ³, u⊕1=[e₁₃(1/2),e₃₂(1)], so (ℤ²,u,ℤ²) has class 0 by composition alone; 1/2 lifts to no integral map.

**Repair:**

- State the agreement for every additive T, with this proof:
  - after splitting, write α as u·(α′⊕α″) with u unipotent;
  - adding (Q″,id,Q″) makes u⊕id a commutator of automorphisms of T(Q′⊕Q″⊕Q″), by the three-summand argument already in 2.2;
  - the map β↦(Q,β,Q) is a homomorphism into an abelian group, so the commutator's class is zero.
- Keep "T_I is full" only where 3.3's equality criterion uses it.
- With this change, 3.3's citation of Weibel (2.10.2) and Exercise 2.17 also applies to non-full summand-dense T. Those statements concern Weibel's group, which this makes equal to the group defined here.

## R06 (P3) — 3.4 does not state its comparison for `Unitization ℂ A`

**Location:** `README.md:394`: "For nonunital complex algebras use `Unitization ℂ A` and prove the reduced-group comparison appropriate to ℂ-linear maps".

**Claim:** This is a target.

**Witness:** No map or property is named. The natural map is an isomorphism for i=0 (weibel-kbook-II lines 653–654, Ex. 2.3(a), p. 14) but for i=1 need not be injective (weibel-kbook-III lines 711–714, Remark 2.2.1, Swan).

**Repair:** Replace the clause with:

> The unital map `Unitization ℤ A → Unitization ℂ A`, (m,a)↦(m,a), induces ker(Kᵢ(Unitization ℤ A)→Kᵢ(ℤ))→ker(Kᵢ(Unitization ℂ A)→Kᵢ(ℂ)), natural in ℂ-linear nonunital homomorphisms. It is an isomorphism for i=0 (Weibel, Chapter II, Exercise 2.3(a), p. 14) and surjective for i=1, since both groups are quotients of GL(A) (Weibel, Chapter III, Remark 2.2.1, p. 13). No injectivity is asserted for i=1 or i=2.

Add a Check for A=ℂ. Through (m,a)↦(m,m+a), both unitizations split as a product with a factor ℂ. Both reduced K₁ groups are then ℂˣ, and the map is the identity.

## R07 (P3) — Two pinned results that the README uses are not cited

**Location:**

- `README.md:32` credits the commutative transvection formulas that 1.1 generalizes only to Mathlib.
- :473 (4.4): "Partitions of unity subordinate to finite open covers of compact Hausdorff spaces with the multiplicity bound". There is no library citation.

**Claim:** The pins have nothing more to cite here.

**Witness:** Tau Ceti `SpecialLinearGroup/Transvection.lean` states 1.1's commutative relations: `Matrix.SpecialLinearGroup.commutatorElement_transvection` (:739), `commute_transvection` (:718), `transvectionHom` (:629), `map_transvection` (:661). Mathlib has `PartitionOfUnity.exists_isSubordinate_of_locallyFinite` (`Topology/PartitionOfUnity.lean:617`, `[NormalSpace X]`).

**Repair:**

- Add the four Tau Ceti names to the Tau Ceti supplier contract (:48) and to 1.1's *Needs:*.
- Add a 1.1 Check: over ℤ, [e₁₂(2),e₂₃(3)]=e₁₃(6) is `commutatorElement_transvection` pushed along `Matrix.SpecialLinearGroup.toGL`.
- Cite the Mathlib partition-of-unity theorem in 4.4 and in the Mathlib supplier contract. Keep only the multiplicity bound as the target there; it follows because the refinement has order at most d+1.

## R08 (P3) — Downstream consumers understates what three consumers use

**Location:** `README.md:709`: "OperatorKTheory consumes Layers 0, 6 and 8 … GeometryOfNumbersAndQuadraticArithmetic consumes Layers 0, 5 and 6 … KTheoryLowDegrees and K2SymbolsBrauer consume … Layers 1–5".

**Claim:** These are the layers each consumer uses.

**Witness:**

- OperatorKTheory #866 README line 225 consumes "AlgebraicKTheory A1–A2, A6, A8".
- GeometryOfNumbersAndQuadraticArithmetic #851 line 159 also takes A1 and A2.
- KTheoryLowDegrees #1248 lines 215 and 965 also take A0 and A6.

**Repair:** In the Downstream consumers paragraph:

- OperatorKTheory consumes Layers 0–2, 6 and 8.
- GeometryOfNumbersAndQuadraticArithmetic consumes Layers 0–2, 5 and 6.
- KTheoryLowDegrees consumes Layers 0–6.
- K2SymbolsBrauer keeps Layers 1–5.
- Add HigherToposTheory (R02).

## Verified sound

**Gate, build and signatures.**

- The gate, rerun at this head, reports every check at 0, including `stray-files=0`, `outside-folder=0` and `depcheck=0`, then `OK`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `lake env lean` on `Suggested.lean` exits 0 after 38 s, with exactly 13 "declaration uses `sorry`" warnings, one per theorem, and nothing else.
- `#check @` on all 20 declarations, under their full names in one scratch file, shows every needed binder in the elaborated type:
  - `HasStableRangeLE R s` in both stability theorems;
  - `s ≤ Fintype.card n`, `s + 1 ≤ Fintype.card n`, `2 ≤ Fintype.card n` and `3 ≤ Fintype.card n`;
  - `[CompactSpace X] [T2Space X]` and `1 ≤ s` in both Vaserstein theorems;
  - `[IsNoetherianRing A]` with `ringKrullDim A ≤ ↑d`;
  - `[IsSemisimpleRing (R ⧸ Ring.jacobson R)]`.
- No binder was lost, and nothing changed. The "failed to synthesize" line in the worker's signature file is an artefact of that file, since the module itself elaborates.

**One-tactic probe.** I tried two scratch copies:

- every `sorry` replaced by `first | rfl | simp | infer_instance | decide | trivial | aesop`;
- every `sorry` replaced by `exact?` (3 min).

All 13 theorems fail in both copies. Reading the statements: `kZero_divisionRing` and `kZero_int` are the Layer 0 end calculations named in the Summary, and the other eleven are the README's named end theorems. None restates a definition or mirrors a Check.

**Headline theorems.**

- The README's headlines are:
  - patching and the six-term Milnor sequence (A6);
  - Vaserstein's two formulas (A4);
  - St→E as a universal central extension, with Matsumoto's theorem and K₂(𝔽_q)=0 (A5);
  - the K₀ and K₁ calculations of Layers 0, 2 and 7;
  - Whitehead's lemma, the Dieudonné determinant, Bass–Vaserstein stability and Bass's two stable-range bounds.
- The statable ones are stated.
- The docstring (:16–44) names each of the others with its missing carrier:
  - extension of scalars over noncommutative rings (checked: Mathlib's `TensorProduct` is over commutative semirings, and Tau Ceti has no balanced tensor product);
  - section modules;
  - the relative triple group;
  - the Steinberg group;
  - the stable component group.

**Dependency check.** The required command printed exactly:

```text
depcheck: 239 roadmaps, 2427 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. HilbertModules (merge-order line 9) is earlier, and the pull request description names it. The other suppliers are on main.

**Adversarial table.** It covers the headlines, the sampled targets and every target a finding touches.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| `kZero_divisionRing` | D=𝔽₂, D=ℍ; control M₂(k) | P(D)≅ℕ by dimension, [D]↦1, [D²]↦2; for M₂(k) the free module has class 2 | True; the normalization needs a division ring |
| `kZero_int` | ℤ; control ℤ[√−5] | PID: [ℤⁿ]↦n; ℤ[√−5]: K₀=ℤ⊕ℤ/2 | True |
| `whitehead_commutator_elementary` | R=ℍ, n=1, g=i, h=j; n empty | [i,j]=(ij)²=k²=−1; U=diag(−1,1) has Dieudonné value the class of −1, which is trivial, so U∈E₂(ℍ); n empty: U=1 | True; agrees with `dieudonne_determinant` |
| `elementary_le_commutator` | 𝔽₂, card 3 and 2 | E₃(𝔽₂)=GL₃(𝔽₂) is simple of order 168, so equals its commutator subgroup; E₂(𝔽₂)≅S₃ ⊄ A₃ | Bound needed and present |
| `dieudonne_determinant` | 𝔽₃ n=2; ℍ n=2; 𝔽₂ n=2; ℍ n=1 | 48/2: kernel SL₂ of order 24 = E₂; diag(i,1)↦1, diag(2,1)↦[2]≠1; GL₂(𝔽₂)=E₂, target trivial; n=1 kernel = unit quaternions ≠ E₁=1 | True for n≥2 |
| `HasStableRangeLE` | s=0; field s=1; ℤ s=1 | row (1) shortens to the empty row, so 1=0; field: c=0 or 1; (2,5): 2·3−5=1, but 2+5c≡2 mod 5, never ±1 | Matches Weibel's (Sₛ) (weibel-kbook-I lines 144–148) |
| `surjective_stability` | field, s=1, g=[[0,1],[1,0]]; control k[x,y] at s=1 | h=−1, e=[[0,−1],[1,0]]∈SL₂=E₂; Cohn's g (weibel-kbook-III lines 512–518) would be forced into E₂, so k[x,y] fails s=1 | True |
| `injective_stability` | field s=1, n=2; Cohn's g | diag(g,1)∈E₃=SL₃ gives det g=1, so g∈E₂; Cohn: g∈E₃∖E₂ but 2<s+1 for s=sr(k[x,y])≥2 | Bound excludes the control |
| `hasStableRangeLE_one_of_isSemisimpleRing` | 𝔽₂[x]/(x²); M₂(𝔽₂); zero ring; control ℤ | (x,1+x): x+(1+x)·1=1+2x=1; J=0, semisimple; R/J=0 semisimple and 0 has every bound; ℤ/J=ℤ not semisimple and (2,5) fails | True |
| `hasStableRangeLE_of_ringKrullDim_le` | ℤ d=1; field d=0; zero ring; ℤ[x] d=2 | ≤2, and ≤1 false; ≤1; ⊥≤d and the conclusion holds; ≤3 | True; sharp at ℤ |
| `HasCoveringDimensionLE` | finite discrete d=0; [0,1] d=0, 1; ∅ | singletons, multiplicity 1; an order-1 refinement of [0,1] is {[0,1]}, refining no {[0,2/3),(1/3,1]}; d=1 holds; ∅: empty refinement | Lebesgue dimension (R02: same predicate as HigherToposTheory's) |
| `hasStableRangeLE_continuousMap_complex_iff` | point; [0,1]; S²; T⁴; ∅; s=0 control | sr=⌊d/2⌋+1 = 1,1,2,3; S²: s=1 false/false (2≤1), s=2 true/true (2≤3); T⁴: s=2 false/false (4≤3), s=3 true/true; ∅: true/true; s=0, point: false vs true (2·0−1=0 in ℕ) | Agree; hs needed |
| `hasStableRangeLE_continuousMap_real_iff` | point; [0,1]; S²; s=0 control | sr=d+1 = 1,2,3; [0,1]: s=1 false/false (1≤0), s=2 true/true; S²: s=2 false/false, s=3 true/true; s=0: false vs true | Agree; hs needed |
| `kZero_arithmeticSquare` | ℤ×_𝔽₅ℤ; control 𝔽₂ | Dˣ={±(1,1)}; ℤˣ×ℤˣ↦{±1}⊂𝔽₅ˣ, cokernel ℤ/2; ker g₀ = diagonal; [D]↦(1,0) splits off the torsion; over 𝔽₂: ℤ | True |
| `kZero_cuspSquare` | 𝔽₅[t²,t³] | Qˣ=𝔽₅ˣ×(1+t𝔽₅), image of g₁ is 𝔽₅ˣ, cokernel ℤ/5; Weibel's ℤ⊕k (weibel-kbook-II lines 607–609) | True |
| 0.1 / R03 | ℤ/5; zero ring | torsion, so not projective; one object and complement n=0; the same as §7.7 of ClassicalArithmeticCompletion | Sound; duplicated |
| 0.3 / R03 | 0; M₂(k); ℤ[C₂]→ℤ | [0]=[0⊕0]=2[0]; [e₁₁M₂(k)]↦1, [M₂(k)]↦2; [ℤ[C₂]]↦[ℤ], equal to §7.42 at fᵐᵒᵖ=f | Sound; duplicated |
| 0.4 | M₂(k): e=E₁₁, f=E₂₂; M₁(k) e=f=0 | xy=E₁₁, yx=E₂₂, ex=E₁₂=xf, fy=E₂₁=ye; x=1, y=0 repaired to exf=0, fye=0, with x′y′=e(xy)²e=e | Sound |
| 0.5 | radius 1 and 2; x=(0,0,1) | p²=I−2xxᵀ+x(xᵀx)xᵀ=p; at radius 2, p²=I+2xxᵀ≠p; p=diag(1,1,0) has rank 2 | Sound; supplier at risk (R01) |
| 0.6 | x=(0,0,1), (1,0,0) | conj(w)·w=2−\|λ\|²=1+x₂²: 2 and 1; u=(1,i,0)/√2, v=(i,1,0)/√2, conj(u)·v=0; u=(0,i,0), v=(0,0,−i) | Sound |
| 0.7 | u(t)=(cos πt, sin πt); det B | u(t+1)=−u(t), trace p=1; det B(t+1)=−det B(t) has a zero by the IVT; χ(t+1)=−χ(t) | Sound |
| 1.1 / R07 | M₂(k) coefficients; ℤ | [e₁₂(E₁₂),e₂₃(E₂₁)]=e₁₃(E₁₁)≠e₁₃(E₂₂); [e₁₂(2),e₂₃(3)]=e₁₃(6), Tau Ceti `commutatorElement_transvection` | Sound |
| 1.2 | diag(−1), diag(−1,1), diag(−1,−1); e₁₂(1) | first two equal in GL∞; column 2 of e₁₂(1) is (1,1)ᵀ=e₁+e₂ | Sound |
| 1.3 | T=−1 | [[1,−1],[0,1]][[1,0],[1,1]][[1,−1],[0,1]]=[[0,−1],[1,0]], square −I | Sound |
| 1.4 | ℤ→𝔽₅, diag(2,3) | 2·3≡1 mod 5; entrywise lift has det 6∉ℤˣ | Sound |
| 2.1 / R04 | 𝔽₂; ℤ | K₁(𝔽₂)=0 vs GL₂(𝔽₂)ᵃᵇ=ℤ/2; [diag(−1,−1)]=0, [−1]≠0 | Sound; locator added (R04) |
| 2.2 | X⊕Y⊕Y | e₁₂(γ)⊕1=[e₁₃(γ),e₃₂(1)]; det[[α,γ],[0,β]]=det α·det β | Sound |
| 2.3 | ℍ; 𝔽₂ | ℍˣ/[ℍˣ,ℍˣ]≅ℝ_{>0}: [i]=1, [2]≠1; GL₂(𝔽₂)/E₂=1=𝔽₂ˣ | Sound |
| 3.1 | I=R, 0; 5ℤ, 2ℤ | GL(R,R)=GL(R); −1↦4≠1 in 𝔽₅, image 0; −1≡1 mod 2, image {±1} | Sound |
| 3.2 / R05 | T=id; D=0; ℤ→ℚ | (P,α,Q)≅(Q,id,Q); [P]↦[(P,0,0)] is inverse; (ℤ²,diag(2,1/2),ℤ²)=0 though not stably an identity triple; u=[[1,1/2],[0,1]]: class 0 by commutator | Sound; comparison holds for all T |
| 3.3 | ℤ→𝔽₅; ℤ→ℚ | δ(2)≠0, δ(4)=0, δ(3)=δ(2), K₀(ℤ,5ℤ)=ℤ/2; det mod ±1 gives ker δ={±1} | Sound |
| 3.4 / R06 | (2,5)(3,10); 5ℤ; A=ℂ | (6,20+15+50)=(6,85); J⁺≅ℤ×_𝔽₅ℤ via (m,x)↦(m,m+x), reduced K₀ ℤ/2; ℂ: both reduced K₁ equal ℂˣ | Sound; ℂ comparison unstated |
| 4.1 | as `HasStableRangeLE` | — | Sound; locator (R04) |
| 4.2 | 𝔽₅×𝔽₇; upper triangular T₂(k) | J=0, product of fields; J strictly upper, quotient k×k | Sound |
| 4.3 / R02 | Hilbert cube | contains [0,1]^(d+1) of dimension d+1, so value ⊤ | Sound; second owner |
| 4.4 | two copies of a point; [0,1] and S⁰; X=∅ | indexed multiplicity 2 vs range 1; {0,1}→S⁰ does not extend; a(t)=(cos πt, sin πt) is essential relative to the equator; d(∅)=∞ vs ⊥ | Sound |
| 4.5 / R04 | as the Lean pair | tsr≤n iff 0 is unstable for every X→ℝ²ⁿ iff d(X)<2n iff ⌊d/2⌋+1≤n | Sound; locator (R04) |
| 5.1 | St₂; ℤ | no third index, so a free product; K₂(ℤ)=ℤ/2 ≠ 0, so id is not universal | Sound |
| 5.2 | (ℤ,5ℤ); M₀ | 0→K₁(ℤ,5ℤ)→{±1}↪𝔽₅ˣ forces K₁(ℤ,5ℤ)=0; K₂(M₀(ℤ))=0≠ℤ/2 | Sound |
| 6.2 | M(2) over ℤ×_𝔽₅ℤ | 2a∈{2,3}, b∈{1,4} mod 5: no basis | Sound |
| 6.3 | image of E; 𝔽₇ square | X⁻¹x=(a,0), π₁(X)=diag(u,u⁻¹) gives uπ₁(a)=π₂(b); 2³≡1 mod 7, δ(4)=−δ(2)≠δ(2) in ℤ/3 | Sound |
| 6.4 | Q=ℤ/6; Q=0 | g₀(x,y)=(x−y,x−y), image the diagonal; product formulas | Sound |
| 7.1 | two points; circle; z^k | ℂ²; C(S¹)=C([0,1])×_{ℂ²}C([0,1]); [L^k]−1=(1+β)^k−1=kβ | Sound |
| 7.2 | arithmetic, cusp, 𝔽₂ | as the two K₀ rows; torsion vanishes for p=2 | Sound |
| 8.1 | ℂ; ℝ; C(S¹) | ℂˣ→0; ℝˣ→{±1} with kernel (0,∞) (weibel-kbook-III lines 282–284); winding of z is 1 | Sound |
| 8.2 / R04 | g=1/10; C(D²)→C(S¹) | ‖g−1‖=9/10, ‖g⁻¹−1‖=9; K₁ᵗᵒᵖ(C(D²))=0 misses [z] | Sound; locator (R04) |

**Seeded source sample.** All 15 targets were checked; the README flags no locator as unverified.

| Target | Locator inspected | Outcome |
|---|---|---|
| 0.1 | Mathlib `Module.Finite.exists_comp_eq_id_of_projective` (`RingTheory/Finiteness/Projective.lean:28`); Tau Ceti `CartanMap/Basic.lean:124, 174, 231` | Correct; duplicates ClassicalArithmeticCompletion §7.7 (R03) |
| 0.3 | weibel-kbook-II lines 204–207 (division rings, PIDs, K₀(ℤ)=ℤ, p. 5) | Correct |
| 0.5 | weibel-kbook-I lines 100–110 (Example 1.2.2, the polynomial tangent module) | Correct as motivation |
| 0.7 | weibel-kbook-I lines 1476–1479 ((4.9.1), p. 32) | Correct |
| 2.1 | none in the README; weibel-kbook-III line 33 (Def. 1.1, p. 1) | Locator missing (R04) |
| 2.2 | weibel-kbook-III lines 321–331 (Lemma 1.6, p. 7), 366 (Cor. 1.6.3, p. 8) | Correct |
| 2.3 | weibel-kbook-III lines 109–115 (1.2.4, p. 3), 497–502 (Ex. 1.2), 126–127 (ℍ) | Correct; source misprint below |
| 3.1 | weibel-kbook-III lines 657–658, 706–707, 719–722 (2.1, 2.2, 2.3, all p. 13) | Correct |
| 3.2 | weibel-kbook-II lines 613–635 (Def. 2.10, (2.10.2), p. 13–14), 688 (Ex. 2.4(e)), 775–781 (Ex. 2.17) | Correct; generality (R05) |
| 3.4 | weibel-kbook-II lines 669–675 (Ex. 2.4(a)–(b), p. 15) | Correct; ℂ case unstated (R06) |
| 4.3 | engelking-1978 lines 7644–7647 (§3.1, p. 208), 7699 (3.1.4, p. 209), 7792 (3.1.8, p. 212) | Correct |
| 4.4 | engelking-1978 line 8582 (3.2.10, p. 233); vaserstein-1971 lines 138–141 (d(X), p. 19), 154–166 (equator, d′(X), p. 20) | Correct |
| 6.2 | weibel-kbook-I lines 536–543 (Thm 2.7, p. 12); stacks-0D2J lines 389–397, 578–581; stacks-0DVN lines 103–116 | Correct |
| 7.2 | weibel-kbook-III lines 783–793 (Thm 2.6, p. 15); weibel-kbook-II lines 607–609 (Ex. 2.9.1, p. 13) | Correct |
| 8.1 | weibel-kbook-III lines 279–284 (Cor. 1.5.1, Ex. 1.5.2, p. 6) | Correct |

Also opened:

- weibel-kbook-I lines 144–158 (Ex. 1.5) and 243–258 (Ex. 1.12);
- weibel-kbook-II lines 562 (Ex. 2.8.1, p. 13), 584–606 (∂ₙ, Thm 2.9) and 694 (Ex. 2.6);
- weibel-kbook-III lines 146–149 (Rem. 1.2.5), 503–511 (Ex. 1.3), 711–714 (Rem. 2.2.1), 1857–1861 (Def. 5.2, p. 35), 1941 (Def. 5.3.1), 1984 (Thm 5.5, p. 38), 2044 (Cor. 5.6.1, p. 39), 2096–2098 (Thm 5.7.1, p. 40) and 2454–2463 (Matsumoto, Cor. 6.1.1, p. 48);
- vaserstein-1971 lines 51–77 (Theorems 1–3, Lemma 3 and the corollary that semisimple-modulo-radical rings have stable rank 1, p. 18) and 167–186 (Theorems 5 and 7);
- grebennikov-2023 lines 197–208 (§2.4, p. 5).

**Pinned declarations opened.**

Mathlib (6b7abb3c):

- `RingTheory/LocalRing/Pullback.lean:64, 69, 83, 87`;
- `Data/Matrix/Basic.lean:654` (`RingEquiv.mopMatrix`);
- `RingTheory/Morita/Matrix.lean:187`;
- `LinearAlgebra/Matrix/ElementaryRowOperations.lean:57, 97` (`[CommRing R]`). The resolver's "occurs nowhere" for this module is a false lead: the file exists.
- `LinearAlgebra/Unimodular.lean:46`;
- `Algebra/Category/ModuleCat/ChangeOfRings.lean:85, 880`;
- `GroupTheory/IsPerfect.lean:41`;
- `Algebra/Algebra/Unitization.lean:458, 567, 661, 767`;
- `Topology/Category/CompHaus/Basic.lean:133`;
- `LinearAlgebra/CrossProduct.lean:47`;
- `Algebra/Ring/Periodic.lean:238`;
- `Topology/PartitionOfUnity.lean:617`.

Tau Ceti (a91d3aaf):

- `CategoryTheory/GrothendieckGroup/Split.lean:114, 124, 142, 172, 249, 289, 315`;
- `CartanMap/Morita.lean:215`;
- `CartanMap/RingEquiv.lean:254`;
- `LinearAlgebra/Matrix/SpecialLinearGroup/Transvection.lean:584, 595, 629, 661, 686, 718, 739`.

Object searches of both pins for an elementary subgroup over arbitrary rings, stable range, covering dimension, a Steinberg group over rings, a hairy ball theorem and a balanced tensor product over noncommutative rings found none. Tau Ceti's `elementarySubgroup` hits are exceptional-type Chevalley groups, and its `QuaternionAlgebra.steinbergToMatrix` is a quaternion splitting.

The seven `Matrix.*` names of the provenance bullet at :720 are the grothendieck-project file's, as the bullet says. They are not pin names.

**Cross-roadmap citations resolved.**

On main (eaf17b1):

- ClassicalArithmeticCompletion §7.8 (line 14505), and §§7.7, 7.23, 7.42 for R03;
- DifferentialGeometry 11.1 (line 902; `Suggested.lean:3097` has the stated signature) and 5.1 (line 507);
- CharacteristicClasses C7 (line 1817: the identification with x^⊥, Euler number 1+(−1)ⁿ, e=c₁);
- TopologicalKTheory Conventions (lines 134–162: D₀ first, L with transition z, β=[L]−1, the Koszul symbol is −β), T1 (163) and T4 (816, 872). These agree with 7.1, since M(z) has b=z·a.
- BanachAlgebras A2 (Layer 2, line 440; logarithms at 569);
- NoncommutativeGeometry N2 (line 195).

At open heads:

- HilbertModules #861: H2 (lines 226–238, the projective-module, frame and polar statements) and H5 (lines 421–423);
- GeneralAlgebraicKTheory #1212: §§3.1, 3.3, 3.4, 3.13, 3.14, 4.16, 4.17, 8.4–8.7 and 12.2, which all consume this roadmap (8.4 uses the orientation uπ₁(a)=π₂(b));
- GeometryOfNumbersAndQuadraticArithmetic #851: §6.1.7 and §6.10;
- TopologicalKTheory's revision #1781 keeps T1, T4 and the Conventions.
- The revisions #1807, #1808 and #1854 keep CharacteristicClasses C7 and TopologicalKTheory T1/T4.
- ClassicalArithmeticCompletion #1409 keeps §§7.7, 7.8, 7.23 and 7.42.
- DifferentialGeometry #886 drops 11.1 (R01) but keeps 5.1 (line 724).

**Ownership against open pull requests.** I searched every open head and main with `roadmaps grep`, by object:

- covering dimension: HigherToposTheory, R02;
- stable range: KTheoryLowDegrees and SchemeKTheoryOperations consume A4;
- the Steinberg group: K2SymbolsBrauer, K3BlochGroups and KTheoryLowDegrees consume A5;
- the Dieudonné determinant: KTheoryLowDegrees §8.3 consumes 2.3;
- Milnor squares: GeneralAlgebraicKTheory, KTheoryLowDegrees and GeneralAlgebraicKTheoryPartII consume A6;
- the hairy ball theorem: R01.

No `Suggested.lean` declares a name in `TauCetiRoadmap.AlgebraicKTheory` other than this one. OperatorKTheory (merge-order line 10) consumes this roadmap (line 16), but this README cites it only as a consumer. That ordering is for OperatorKTheory's own review.

## Not verifiable

- **Milnor, *Introduction to Algebraic K-Theory*, §§7 and 10:** cited by locator only. The text is behind JSTOR and recorded as uncertified.
- **Bass, *Algebraic K-Theory*, Theorem V.3.5:** recorded as uncertified. Checked only through Weibel's recall (weibel-kbook-I lines 151–153).
- **Vaserstein's English translation:** not in the cache. I read the Russian original, whose printed pages 18–20 are the ones cited.
- **R04 item 4:** I could not open a Banach-algebra text with the noncommutative identity-component theorem, so the repair names what to cite, not a theorem number.

## Source issues

- **Misprint** in weibel-kbook-III at 1.2.4, p. 3: the source excludes n=2, D=𝔽₂ from GLₙ(D)/Eₙ(D)=Dˣ/[Dˣ,Dˣ]; it should drop that exception (E₂(𝔽₂)=GL₂(𝔽₂), both sides trivial), which belongs to the commutator statement; affects nothing.
- **Gap** in vaserstein-1971 at the definition of d(X) and Theorem 5, printed pp. 19–20: the source sets d(X)=∞ when no d qualifies, so d(∅)=∞ and Theorem 5 gives the zero ring infinite stable rank; it should exclude X=∅; affects nothing.
