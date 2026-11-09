# Review of FiniteEquivalenceRelations (pull request #1929 at 74076b8)

**Verdict:** needs changes

Six findings, none blocking (six P3). The three findings of the previous review are repaired (quoted under Verified sound). The new material (the ModularCurves adapter, the DirectSummandsAndBigCohenMacaulay citation, the "Smaller lengths" paragraph, Kollár's Question 8) was checked against its sources, and every value in Layer 3 was recomputed. The findings are:

- a Check in 4.3 built on an ideal that is not an equivalence relation;
- a "Downstream consumers" entry that reverses the supply direction with an earlier roadmap;
- an earlier owner of purity that the README does not cite;
- original results stated with neither a target nor a source, one of them widened in Research context;
- a Conventions witness that needs `k` to be a field;
- a historical attribution that the cited locators do not support.

## R01 (P3) — 4.3 Check 3 uses an ideal that is not an equivalence relation

**Location.** `TauCetiRoadmap/FiniteEquivalenceRelations/README.md` lines 697–702 (4.3, third Check): “the relation `x ~ -x` on `𝔸²_k`, `I = (x₁ - y₁, x₂ - y₂) ∩ (x₁ + y₁, x₂ + y₂)`, has `A^R = k[x₁², x₁x₂, x₂²]`”.

**Claim.** This scheme-theoretic union of the two graphs is "the relation `x ~ -x`", an example of purity without flatness "on a quotient".

**Witness.** Kollár's Example 3 shows that this exact ideal is not transitive, and that the equivalence relation `R*` differs from it by an embedded point (kollar2012 lines 76–88). You can check it directly. `x₁y₂ - x₂y₁` lies in `I`, but `incl₁₃` of it, `x₁z₂ - x₂z₁`, is not in `I₁₂ + I₂₃`. The degree-2 part of `I₁₂ + I₂₃` is spanned by quadrics in `(x, y)` and in `(y, z)`, and none of them has an `x·z` monomial. This is 0.1 Check 2's graph-union counterexample in two variables. The computed values (`A^R`, the Reynolds retraction, non-flatness by Tag 00OF) are right for the stated `I`, because `isEffective_invariants` needs no hypothesis on `I`.

**Repair.** Use Kollár's `R*`: `I* = (x₁² - y₁², x₂² - y₂², x₁x₂ - y₁y₂)` (Kollár 2012, Example 3), the kernel pair of `C = k[x₁², x₁x₂, x₂²] ⊆ k[x₁, x₂]`.

- `I* = J(C)` is an equivalence ideal.
- `I* ⊆ I` gives `A^{R*} ⊆ A^R = C ⊆ A^{R*}`, so `A^{R*} = C`. The Reynolds and Tag 00OF arguments are unchanged.
- The relation is then effective without being flat, which is a second witness that the flatness hypothesis of 2.1 is sufficient but not necessary.

Add one clause saying that the union of the two graphs is not transitive (Kollár 2012, Example 3), and add Example 3 to the Kollár entry of the References.

Tested on the refuting instance: `x₁y₂ - x₂y₁ ∉ I*₂ = span{x₁² - y₁², x₂² - y₂², x₁x₂ - y₁y₂}`, and each generator of `I*` is `c ⊗ 1 - 1 ⊗ c` for some `c ∈ C`.

## R02 (P3) — “Downstream consumers” reverses the supply direction with AlgebraicModuliForArithmeticGeometry

**Location.** README lines 43–45: “faithfully flat affine module descent is its case of a faithfully flat ring map, and the roadmaps stating that case are listed under Downstream consumers.” Lines 755–759: “AlgebraicModuliForArithmeticGeometry §3.1: faithfully flat affine module descent (`affineModuleDescentEquivalence`) is the case of 4.2”.

**Claim.** AlgebraicModuliForArithmeticGeometry §3.1 is a consumer of 4.2.

**Witness.**

- AlgebraicModuliForArithmeticGeometry is line 34 of the merge order; this roadmap is line 401. This roadmap consumes its §§3.2–3.3 (Conventions line 118; 4.2 line 627; 4.3 line 677).
- At that roadmap's head (pull request #853, d0a9af8), its README line 1209 proves `affineModuleDescentEquivalence` from Mathlib's `comonadicExtendScalars` and says the pure-map form is not its target.
- Its Downstream consumers paragraph (line 10381) lists FiniteEquivalenceRelations §4.2 as a consumer of its §§3.2–3.3.
- Nothing in that roadmap cites 4.2.

Each README now lists the other as its consumer.

**Repair.**

- Replace the Downstream consumers bullet with “No roadmap on main or in an open pull request consumes this one.”
- Replace the last sentence of Owned here (lines 43–45) with: “4.2 extends faithfully flat descent of modules (Mathlib's `comonadicExtendScalars`; AlgebraicModuliForArithmeticGeometry §3.1, `affineModuleDescentEquivalence`, under Owned elsewhere) to pure ring maps; neither consumes 4.2.”

After the repair, every mention of that roadmap here is as a supplier, which agrees with its line 10381.

## R03 (P3) — Purity of ring maps has an earlier owner that the README does not cite

**Location.**

- README lines 41–42: “this roadmap gives no name to purity itself and writes the condition out (`P → B ⊗[A] P` injective for every `A`-module `P`)”.
- 4.2 lines 623–625: purity defined from Stacks Tag 08WL.
- 4.3 line 681: “since faithfully flat maps are pure”.
- Scope lines 76–78 and the Layer 4 Examples, lines 743–745: “pure only if it is split … (DirectSummandsAndBigCohenMacaulay §0.1; Stacks, Lemma 10.82.4, Tag 058L)”.

**Claim.** Purity is stated here from Stacks, and the finitely presented "pure ⇔ split" fact belongs to DirectSummandsAndBigCohenMacaulay §0.1.

**Witness.**

- PerfectoidSpacesPartII is line 79 of the merge order (a board package, `packages/PerfectoidSpacesPartII/README.md`). Its §5.1, “pure (universally injective) module and ring maps” (README lines 1913–1929), defines `IsPureHom f` (its `Suggested.lean` line 333: `P → P ⊗_R S` is injective for every `R`-module `P` in the universe of `R`).
- That section owns the laws this roadmap uses: faithfully flat ⇒ pure; faithfully flat ⇔ pure and flat; split ⇒ pure; and, for `S` finitely presented as an `R`-module, pure ⇔ `R`-linear retraction.
- DirectSummandsAndBigCohenMacaulay §0.1 (at 17190d1, lines 147–184) itself attributes that last equivalence to PerfectoidSpacesPartII.
- No purity predicate exists at the pinned Mathlib or Tau Ceti.

**Repair.**

- Add to Owned elsewhere: “PerfectoidSpacesPartII §5.1 owns pure ring maps (`IsPureHom`) and their laws (faithfully flat ⇔ pure and flat; for an algebra finitely presented as a module, pure ⇔ split). Layer 4's Lean statements write the same condition as `∀ P, Function.Injective (TensorProduct.mk A B P 1)`, because `Suggested.lean` imports no roadmap.”
- Reword lines 41–42 to match.
- Cite PerfectoidSpacesPartII §5.1 next to Tag 08WL in 4.2 and for “faithfully flat maps are pure” in 4.3.
- Cite it first for the finitely presented equivalence in the Layer 4 Examples, keeping DirectSummandsAndBigCohenMacaulay §0.1 and Tag 058L.

The two conditions agree: `P ⊗ R → P ⊗ S` injective is `P → S ⊗ P` injective up to `TensorProduct.comm`, in the same universe.

## R04 (P3) — “Smaller lengths” states results with no target and no source; Research context widens one

**Location.** README lines 495–527 (3.2): “**Smaller lengths (not a target).** The following lower bounds … are this roadmap's own.” Lines 784–787 (Research context): “at least `5` over `𝔽₂` and `𝔽₃`, and algebras with `m² = 0` give no example in any length (3.2, Smaller lengths)”.

**Claim.** The bounds are established facts. Algebras with `m² = 0` never carry a non-effective relation.

**Witness.**

- The `m² = 0` argument assumes `A = k ⊕ V`, that is, residue field `k`. A local algebra with `m² = 0` and residue field `L ≠ k`, such as `L[ε₁, ε₂]/(ε₁, ε₂)²` with `L = 𝔽₉` over `𝔽₃` (length 6), is covered neither by the proof nor by the length-3/4 search. Line 786 drops that hypothesis.
- Neither the proof nor the exhaustive search is a target, and neither has a source. The bounds that Research context reports therefore rest on nothing the roadmap builds, and a “(not a target)” block of new results goes against the form rule that every item lives in some layer.
- The mathematics itself survives my checks:
  - the `m² = 0` proof, step by step, including the `V ⊗ k ⊗ V` component argument;
  - an independent enumeration of every equivalence ideal over `𝔽₂` and `𝔽₃` on `k[x]/(x³)`, `k[x, y]/m²`, `k[x]/(x⁴)`, `k[x, y]/(x², y²)`, `k[x, y]/(xy, y²)` and `k[x, y]/(x² - y², xy)`: all effective;
  - the counts on `k[x, y]/m²`: 5 over `𝔽₂` and 6 over `𝔽₃`, one per subspace of `m`.

**Repair.**

- State the `m² = 0` result as a target of 3.2, in prose, as this roadmap's own: for `k` a field and `A = k ⊕ V` finite-dimensional with `V² = 0`, every equivalence ideal satisfies `I = differenceIdeal I`, and `A^R = k ⊕ I₁` with `I₁ = (id ⊗ π)(I)`. Use the present argument as its route (*Needs:* 0.1, 1.1, 1.3).
- Make the length `≤ 2` classification a Check of that target.
- Move the `𝔽₂`/`𝔽₃` search to Research context, worded as an unpublished exhaustive search over the listed algebras.
- In line 786, write “local algebras with residue field `k` and `m² = 0`”.

Tested: on `𝔽₂[x, y]/m²` the target predicts 5 equivalence ideals, one per subspace of `m`, all effective, and the enumeration finds exactly those 5.

## R05 (P3) — The Conventions witness for `I = ⊥` needs `k` to be a field

**Location.** README lines 103–104 (Conventions, **Effective**): “and `I = ⊥` (all of `X ×_k X`) is effective with `Y = Spec k` when `A ≠ 0`.” Here `k` is any commutative ring (Summary, line 3).

**Witness.** Take `k = ℤ`, `A = 𝔽₂`. Then `𝔽₂ ⊗_ℤ 𝔽₂ = 𝔽₂`, so `R = X` and `I = ⊥` is the diagonal. It is effective with `Y = X`. The coequalizer of the identity pair is `Spec 𝔽₂`, so the square with `Y = Spec ℤ` is not a pushout.

**Repair.** Write “… effective with `Y = Spec k` when `k` is a field and `A ≠ 0` (then `k → A` is faithfully flat).” The `k = ℤ` instance is excluded. For a field, `X ×_k X` is the kernel pair of the fpqc map `X → Spec k`, and `k` is the equalizer of `A ⇉ A ⊗_k A`.

## R06 (P3) — The Joyal–Tierney attribution is not what the cited locators say

**Location.** README lines 633–635: “This is the theorem of Joyal and Tierney, unpublished, announced by Olivier; Mesablishvili 2000 gives the first published proof (Mesablishvili 2000, abstract; Stacks, Section 35.4, Tag 08WE)”. Lines 774–776 say the same in Research context.

**Witness.**

- stacks-descent lines 427–431: Olivier asserted the result without a clear proof; it can be extracted from Joyal–Tierney 1984, a published memoir (Mem. Amer. Math. Soc. 51, no. 309; bibliography lines 4462–4463); Mesablishvili's is “the first free-standing proof”.
- Mesablishvili's own title calls it “a new proof” (mesablishvili2000 line 10; stacks-descent lines 4466–4467).
- Neither source says “first published proof”.

**Repair.** In both places write: “asserted by Olivier, extractable from the work of Joyal and Tierney, with a first free-standing proof by Mesablishvili 2000 (Stacks, Section 35.4, Tag 08WE)”. Drop “unpublished” and “first published”.

## Verified sound

**Repairs of the previous review (c4b677b → 74076b8).**

- **R01 repaired.**
  - Mathlib contract, lines 153–157: “`Algebra.IsEffective R S` …, `Algebra.IsEffective.eqLocus_includeLeft_includeRight`, `Algebra.IsEffective.of_section` …, `Algebra.IsEffective.of_faithfullyFlat`, `Algebra.codRestrictEqLocusPushoutCocone.surjective_of_isEffective`”.
  - 4.1, lines 585–587: “`IsAmitsurEqualizer A B A` is Mathlib's `Algebra.IsEffective A B` together with the injectivity of `A → B`”.
  - 4.3, lines 663–664, and Lean line 407: `isEffective_invariants : Algebra.IsEffective (invariants k A I) A`.
  - `of_section` and `of_faithfullyFlat` cited in 4.2 Checks 1 and 3, 4.3 Check 1 and the 4.4 Examples; 4.4, lines 715–716, names `Algebra.IsEffective C (C ⊗[A] B)`.
  - The identification checks out: under `B ⊗[A] A ≅ B`, the equalizer clause is `ker(b ↦ b ⊗ 1 - 1 ⊗ b) ⊆ range(algebraMap)`.
- **R02 repaired.** Owned elsewhere, lines 69–75, names §§3.1–3.3 with `overlapCoalgebraEquivalence`, `moduleCanonicalComparison`, `descentEqualizerModuleCoordinates` and `affineModuleDescentEquivalence`, and they are cited in the Conventions (118), 4.2 (627–628) and 4.3 (677). The same edit introduced the reversed consumer entry of R02 above.
- **R03 repaired.** References line 831: “pp. 38–41”. `IsCompatible` cites “Stacks, Definition 35.3.1 (2), Tag 023G” (README 592–593, Lean 339). Tag 08WY is kept for descent morphisms (629), and Tag 023G is in the References (824).

**Gate, build, order, outside-folder.**

- The worker's gate passed every check. I reran it (`gate … --base origin/main`): every count 0, `OK`.
- Dependency check with the brief's command: `depcheck: 236 roadmaps, 2261 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. FiniteEquivalenceRelations is line 401 of the merge order.
- `lake env lean` on `Suggested.lean`: exit 0, exactly 21 warnings, all “declaration uses `sorry`”.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FiniteEquivalenceRelations'` is empty. The folder holds README.md, Suggested.lean and metadata.toml.
- Pins: Mathlib 1b1ccf4b, Tau Ceti 2fd255d9. Imports: `Mathlib` and `TauCeti.RingTheory.Invariant.EquivalenceRelation.Basic`, which exists.
- No `set_option`, sorried data, `lemma` or `#eval`.
- All 45 Lean declarations are named in the README.
- The 45 elaborated signatures of `signatures.md` were compared with the README. The changed declaration elaborates as `∀ k [CommRing k] A [CommRing A] [Algebra k A] (I), Algebra.IsEffective ↥(invariants k A I) A`, which is the README's generality (every commutative `k`, every `I`). No declaration lost a section binder.

**Padding probe.** On a scratch copy, every `sorry` was replaced by `first | rfl | infer_instance | trivial | decide | simp | (constructor <;> simp)` and elaborated. All 21 sorried theorems fail. None restates a definition, mirrors a Check or computes a small value.

**Headline theorems.** All are stated in `Suggested.lean` at the README's generality: 0.2; 0.3 (two); 1.2; 1.3 (two); 2.1; 3.1 (three); 3.2; 3.3; 3.4; 4.1 (two); 4.2 (three); 4.3 (two); 4.4. Nothing statable is missing and nothing goes through a stand-in.

**Sources (seeded sample 0.1–4.4, read at the locators).**

- **kollar2012** (arXiv 0812.3608v2):
  - lines 76–88: Example 3, the source of R01;
  - lines 89–113: Definition 4, finite, categorical quotient, geometric fibres;
  - lines 134–136: Theorem 6, set-theoretic, essentially finite type over a noetherian `𝔽_p`-scheme;
  - lines 127–130 and 141–143: §2's non-noetherian quotients, and Raicu's relation has a geometric quotient but is not effective (Research context);
  - lines 145–148: Question 8, characteristic zero;
  - lines 158–178: Example 9, `k + εk[x]`, non-noetherian;
  - lines 1108–1122: ¶50 (1)–(4), effective iff equality (0.1, 1.3);
  - lines 1149–1172: the example, its generators and universality (3.1);
  - lines 1176–1182: Theorem 51 (3.4).
- **raicu2010** (arXiv 0905.4805v2): lines 29–37 (effective; toric Definition; Theorem 4.1); 76–83 (§2.1 i)–iv), for 0.1 and 0.2); 91–93 (Example 2.1); 128–129 (affine monoid); 170–172 (Theorem 3.1); 237–238 and 248–251 (Theorem 4.1, `M`-homogeneity).
- **stacks-groupoids:** line 68 (Definition 39.3.1, Tag 022P); 2053–2057 (Section 39.23, Tag 03BE, equation 23.0.1); 2132–2134 (Lemma 39.23.4, Tag 03BJ); 2420–2428 (Proposition 39.23.9, Tag 03BM).
- **fga3:** PDF page `n` is p. 212-0(n−1). Lines 150–153 are on p. 212-04 (finite colimits are colimits in all preschemes, 1.2). Lines 156–164 are on p. 212-05 (the question, open even over a field: 3.2 and Summary). Lines 409–427 are on p. 212-12–13 (Théorème 5.1 (iv), 2.1).
- **sga3-exp5:** lines 509–528 (Théorème 4.1 a), b), (i), (iv), for 2.1).
- **fga1:** lines 222–236 (§A n° 2 b, the strict-epimorphism criterion: 1.3 Example, 4.3); 237–258 (n° 2 c, Research context); 536 (§B Théorème 1); 568 (Lemme 1.1).
- **mesablishvili2000:**
  - lines 5 and 10–13: TAC 7 no. 3, pp. 38–42; abstract;
  - lines 21–22: pure;
  - line 33: Lemma 1, p. 38;
  - lines 37–76: descent datum as a coaction; `f*` full and faithful vs. equivalence, pp. 38–39;
  - lines 104–111: Propositions 2 and 3, p. 40;
  - line 221: Theorem 4, p. 41.
- **stacks-descent** (cached 28e718ba): line 177 (Definition 3.1, Tag 023G); 399–431 (Section 4, Tag 08WE, history; R06); 486–495 (Tags 08WL, 08WM, 08WN, 08WP); 568–571 (Tag 08WY); 622 (Lemma 4.20, Tag 08X7); 674–690 (Theorem 4.22, Tag 08XA, with the proof of (a) ⇒ (c)); 703–711 (Theorem 4.25, Tag 08XD); 1815–1830 (Lemma 13.2, Tag 0EUA).
- **Stacks book** (cached 5b3a46c2): lines 29791–29795 (Lemma 10.82.4, Tag 058L); 33289–33290 (Lemma 10.110.9, Tag 00OF).
- **SGA 1** (arXiv math/0206203v2): lines 6194–6196 (Exp. VIII, Théorème 1.1).
- **mesablishvili2002:** lines 42–43 (Theorem 1.1, p. 181); 133–143 (Theorem 3.2 and Remark 3.3, p. 183); proof of (iv) at lines 203–222, p. 185 (Source issues).

**Mathlib at the pin.**

- `Mathlib/CategoryTheory/EquivalenceRelation.lean`: lines 40–92 (`JointlyMono₂`, reflexive, symmetric and transitive relations, the latter with a limiting `PullbackCone p₂ p₁`); 98 (`IsEquivalenceRelation`); 106 (`IsKernelPair.equivalenceRelation`); 258–270 (`EffectiveEquivalenceRelation`: kernel pair and pushout).
- `RingTheory/TensorProduct/IncludeLeftSubRight.lean`: lines 89, 96, 106 (`of_section (g : S →ₐ[R] R)`), 146, 176.
- `Algebra/Category/ModuleCat/Descent.lean:62` (`comonadicExtendScalars`); `ChangeOfRings.lean:878`; `RingTheory/RingHom/FaithfullyFlat.lean:29`.
- `RingTheory/Flat/EquationalCriterion.lean:287`; `LinearAlgebra/FiniteDimensional/Basic.lean:258`; `CategoryTheory/MorphismProperty/Limits.lean:841`; `CategoryTheory/EffectiveEpi/Basic.lean:72`; `AlgebraicGeometry/AffineScheme.lean:186`.
- No purity predicate in `RingTheory`, `LinearAlgebra` or `Algebra/Module`.

**Tau Ceti at the pin.**

- `RingTheory/Invariant/EquivalenceRelation/Basic.lean:180` (`isSpecEquivRel_tensorProduct`).
- `…/Quotient.lean`: lines 72 and 83 (`[Module.Finite A B] [Module.Projective A B]`); 148 (`flat`); 158 (`faithfullyFlat`); 166; 190; 201.
- `AlgebraicGeometry/Quotient/EquivalenceRelation.lean`: lines 87 (`isPullback_SpecMap`); 135 (`isColimitCofork`); 220 (`isSpecEquivRel_appTop`, with `[IsAffine R] [IsAffine X] [IsEquivalenceRelation p₁ p₂]`); 240–241 (section variables `[IsAffine X] [IsEquivalenceRelation p₁ p₂] [IsFinite p₁] [Flat p₁] [LocallyOfFinitePresentation p₁]`, as the supplier contract says); 279, 284, 289, 294 and 306 (`isKernelPair_`, `isFinite_`, `flat_`, `surjective_affineCoequalizerπ`, `isColimitAffineCoequalizerCofork`).
- `RingTheory/Flat/EffectiveDescent.lean:107`.
- `Algebra/AlgebraicGroup/FaithfullyFlatDescent.lean` is descent of points of Hopf algebras, not a duplicate.

**Cross-roadmap citations resolved.**

- **ModularCurves on main:** Layer 0C item 3 (README lines 779 and 799–811) is SGA 3 V 4.1 in the affine case, with exactly the conclusions the supplier contract states. The open revision of ModularCurves in pull request #1808 maps “Layer 0C, items 2–3 … → SchemeAndStackFoundations §1.17” (its README line 117). The citation therefore stays valid and needs no change.
- **SchemeAndStackFoundations on main:** §1.1 (line 2071), §1.5 (line 2167) and §1.17 (line 2624). §1.17 states that construction theorems are outside its scope.
- **AlgebraicModuliForArithmeticGeometry at d0a9af8:** §3.1 `affineModuleDescentEquivalence` (README 1207); §3.2 `overlapCoalgebraEquivalence` (1418); §3.3 `moduleCanonicalComparison` (1560) and `descentEqualizerModuleCoordinates` (1568).
- **DirectSummandsAndBigCohenMacaulay at 17190d1:** §0.1, split algebras, and pure ⇔ split for finitely presented algebras (lines 147–184).
- `roadmaps resolve` leads: `IsEquivIdeal.le_ker_mul`, `.map_incl₁₃_le` and `.map_quotient` are declared (Lean lines 83, 87, 109).
- **Ownership by object.** `roadmaps grep` over main and the open pull requests for Raicu, `IsEquivIdeal`, “finite equivalence relation”, Joyal, Amitsur, “universally injective”, “effective descent morphism for modules” and `IsPureHom`, plus the board's packages. No other roadmap owns finite equivalence relations or descent along pure maps. The only owners of neighbouring objects are AlgebraicModuliForArithmeticGeometry (faithfully flat case, already cited) and PerfectoidSpacesPartII (R03). `overlaps.md` lists nothing, and no other pull request changes this folder.

**Independent recomputations.**

- **Layer 3**, graded elimination in `k[x₁, x₂, y₁, y₂]` with my own script:
  - `(2, 2, 2)` over `𝔽₃`: Hilbert function `1, 2, 3, 4, 3, 2` (length 15); `dim (I + K)_d = 0, 2, 9, 25, 52` against `dim (J + K)_d = 0, 2, 9, 25, 51` for `d = 1..5`, with equality for `d = 6..10`. The cocycle lies in `(I + K)₅` and not in `(J + K)₅`. The invariants of `O(Z)_d` have dimensions `0, 2, 1, 1, 2` (that is, `0, 2, 1, 3, 6` before reduction modulo the ideal of `Z`).
  - The same gap `52 > 51` holds over `𝔽₂` (Hilbert function `1, 2, 3, 4, 3, 2, 1`, length 16), `𝔽₅`, `𝔽₇` and `𝔽₁₀₀₀₀₀₃`.
  - 3.2 Check 2 over `𝔽₃`: no gap in any degree up to twice the top degree for `(1,1,1)`, `(2,1,1)`, `(1,2,1)`, `(1,1,2)`, `(2,2,1)`, `(2,1,2)`, `(1,2,2)` (lengths 4, 6, 6, 4, 10, 8, 8). `(3,3,2)` has length 27 and gaps `44 > 43` in degree 5 and `77 > 75` in degree 6, as stated.
- **Small lengths**, enumerating every ideal inside `ker μ` and testing the three fields of 0.1 and `I = J(A^R)`:

| Algebra | Field | Equivalence ideals | Effective |
|---|---|---|---|
| `k[x]/(x³)` | `𝔽₂` | 3 | all |
| `k[x]/(x³)` | `𝔽₃` | 3 | all |
| `k[x, y]/m²` | `𝔽₂` | 5 | all |
| `k[x, y]/m²` | `𝔽₃` | 6 | all |
| `k[x]/(x⁴)` | `𝔽₂` | 6 | all |
| `k[x]/(x⁴)` | `𝔽₃` | 7 | all |
| `k[x, y]/(x², y²)` | `𝔽₂` | 12 | all |
| `k[x, y]/(x², y²)` | `𝔽₃` | 13 | all |
| `k[x, y]/(xy, y²)` | `𝔽₂` | 8 | all |
| `k[x, y]/(xy, y²)` | `𝔽₃` | 10 | all |
| `k[x, y]/(x² - y², xy)` | `𝔽₂` | 8 | all |
| `k[x, y]/(x² - y², xy)` | `𝔽₃` | 7 | all |

**Adversarial table.**

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `IsEquivIdeal` (0.1) | `ker μ`; `⊥`; `⊤` with `A ≠ 0` | `ker μ`: all three fields; `⊥`: `map ⊥ = ⊥ ≤ ker μ`; `⊤`: `1 ∉ ker μ` | Checks hold |
| 0.1 Check 2 | `k[t]/(t²)`, `I = (xy)`, char ≠ 2 | `(x - y) ∩ (x + y) = span{xy}`; `μ(xy) = t² = 0`; `xz ∉ span{xy, yz}` | holds |
| 0.1 Check 3 | `k × k`, `R = {(p,p), (q,q), (p,q)}` | composites stay in `R`; `(q, p) ∉ R` | holds |
| `map_quotient` (0.2) | `𝔞 = ⊤`; `𝔞 = (t)`, `I = ⊥`; `I = (x² - y²)`, `𝔞 = (t - 1)` | `π⊗π` surjective with `μ' ∘ (π⊗π) = π ∘ μ`; image `⊥`; `1 - 1 = 0` | true for every `k` |
| `isEquivalenceRelation_iff` (0.3) | joint monicity; each field | `R ↪ X ×_k X ↪ X ×_ℤ X` (a base change of the diagonal); `r` ↔ `I ≤ ker μ`; `s` ↔ `comm`; pullback ring `A⊗A⊗A/(I₁₂ + I₂₃)` | true |
| `isEquivIdeal_iff_isSpecEquivRel` (0.3) | `T = A`, `T = (A⊗A)/I`, `T` the ring of `R ×_X R` | each `T`-point condition gives one ideal field, and composition gives the converse | true |
| `invariants`, `differenceIdeal` (1.1) | `ker μ`; `⊥` over a field | `A^R = A`, `J = ker μ`; `A^R = k`, `J = ⊥` | Checks hold |
| `isColimit_cofork` (1.2) | `I = ⊤`; `k × k`, `⊥`; `k[t]/(t²)`, `ker μ` | `A^R = A`; `k`; `A` (not `k`) | true (FGA III p. 212-04) |
| `…_iff`, `…_iff_finrank` (1.3) | `I = ⊤`, `A ≠ 0`; `A = 0`; `k[t]/(t⁴)`, `(x² - y²)` | LHS false (no section `X → ∅`) and RHS false (`J(A) = ker μ ≠ ⊤`); both hold for `A = 0`; `A^R = span{1, t²}` exactly, since `x³ - y³ ∉ span{x³ - xy², x²y - y³}`, so `J = I` | true |
| 1.3 Example | `C = k[x³, x⁵] ⊆ k[x]` | the identity for `u⁷ - v⁷` expands correctly; `7 ∉ ⟨3, 5⟩`; `A^R = k[x³, x⁵, x⁷]` | holds |
| `…_of_flat` (2.1) | `k × k`, `⊥`; `ker μ`; the relation of 3.2 | rank 2, `A^R = k`; rank 1; a non-effective relation is not flat; `B` finite, f.p. and flat, hence projective, which meets Tau Ceti's hypotheses | true |
| `raicuIdeal_*` (3.1) | symmetry; finiteness; non-effectivity | `swap c ≡ -c` modulo `(x₁y₂ - x₂y₁)(x₂³ - y₂³)`; `y₁² ≡ x₁²`, `y₂³ ≡ x₂³`; `44 > 43` in degree 5 | true |
| `not_isEffective…raicuArtin` (3.2) | `𝔽₂`, `𝔽₃`, `𝔽₅`, `𝔽₇`, `𝔽₁₀₀₀₀₀₃` | `52 > 51` in degree 5 for every field; lengths 16 and 15 | true |
| 3.2 Check 1 | `det [[-2,1,0],[1,-2,1],[0,1,-2]]` | `-4`, zero exactly in characteristic 2 | holds |
| 3.2 Check 2 | eight exponent triples over `𝔽₃` | as listed above | holds |
| 3.2 Smaller lengths (R04) | the `m² = 0` proof; enumeration | `I ⊆ I₁⊗A + A⊗I₁`; `t_a ∈ I₁⊗V + V⊗I₁`; `A^R = k ⊕ I₁`; table above | true for residue field `k`; the Research context sentence is wider |
| `raicuCocycle_not_mem_…` (3.3) | `𝔽₃` | cocycle `∈ (I + K)₅`, `∉ (J + K)₅`; `Σ hᵢh₅₋ᵢ = 40` | true |
| `IsToric`, `eq_differenceIdeal_of_isToric` (3.4) | `σ = 0`; `σ = ℤ`, `(x² - y²)`; Raicu's `I`, `σ = ℕ²` | only `⊥`; homogeneous, equal to `J(k[t^{±2}])`; `x₁x₂ - x₂²` mixes degrees `(1,1)` and `(0,2)` | true; the hypotheses are Raicu's affine monoid |
| `bijOn_baseChange`, `…_iff_bijOn` (4.1) | `g(1⊗m) = Σ cᵢ ⊗ nᵢ` | `pullLeft g((1⊗1)⊗m) = coface₁ φ(m)` and `pullRight = coface₂ φ(m)`; `ℤ → ℚ` with `N = ℤ` and `N = ℤ/2`; `B = A × A` | true |
| `forall_isAmitsurEqualizer_iff` (4.2) | cokernel `Q` | `(b₁⊗b₂)⊗p ↦ b₂ ⊗ [b₁⊗p]` sends `coface₁ x - coface₂ x` to `1 ⊗ [x]` | true |
| `full_faithful_…`, `nonempty_comonadic…_iff` (4.2) | Stacks 08XA; `ℤ → ℚ`; `ℤ → ℤ × ℤ/2` | `0 = id` on `ℤ/2` after base change; split but not flat | true |
| `isEffective_invariants` (4.3) | every `I`; `ker μ`; `⊥` | `A⊗_{A^R}A = (A⊗A)/J`, `J ≤ I`, so `a⊗1 = 1⊗a` there gives `a ∈ A^R` | true |
| 4.3 Check 2 | `C = k[x, y]/(xy) → k[s] × k[t]` | `A⊗_C A = k[s] × k × k × k[t]`; equalizer `{f(0) = g(0)} = C`; `C/(x + y) = k[x]/(x²) → k × k`, `x ↦ 0` | holds |
| 4.3 Check 3 (R01) | stated `I`; `I*` | `A^R = k[x₁², x₁x₂, x₂²]`; `x₁z₂ - x₂z₁ ∉ (I₁₂ + I₂₃)₂`; `I* = J(C)`, `A^{R*} = C` | `I` is not an equivalence relation |
| `nonempty_comonadic…_invariants` (4.3) | 2.1's hypotheses; `A = 0` | Tau Ceti `faithfullyFlat` on the `eqLocus` with `faithfullyFlat_algebraMap_iff` gives `comonadicExtendScalars`; `A = 0` is trivial | true |
| `universally_effectiveEpi_iff` (4.4) | Tag 0EUA with one member; `ℤ → ℚ`; the node | `Γ = Eq` gives `IsAmitsurEqualizer` for every `M`; mono but not iso; the base change to `k[x]/(x²) → k × k` is not injective | true |
| Conventions **Effective** witness (R05) | `k = ℤ`, `A = 𝔽₂` | `𝔽₂ ⊗_ℤ 𝔽₂ = 𝔽₂`; effective with `Y = X`, not with `Y = Spec ℤ` | needs `k` a field |
| Research context, Question 8 | kollar2012 lines 89–178 | Definition 4 (1)–(3), Theorem 6 and Example 9 agree with the README's paraphrase | holds |

## Not verifiable

- Olivier 1970 (C. R. Acad. Sci. 271), Joyal–Tierney 1984 (Mem. AMS 309), Mesablishvili 2004a and 2004b, Venken 1971 and Philippe 1973 are paywalled or not online. Each is cited, or named through Stacks, in Research context or for history only; no statement or route rests on them.
- SGA 3 Exp. V was read in the Gille–Polo re-edition, and Kollár 2012 in its arXiv numbering, as the README states. The printed originals were not opened.
- Part of the lengths 3–4 search was not recomputed: the non-split algebras `𝔽_{p³}`, `𝔽_{p²}[ε]`, `𝔽_{p⁴}`, and the remaining planes `W`. `k[x, y, z]/m²` is covered by the `m² = 0` proof, which I checked; its brute-force enumeration (every subspace of `V ⊗ V` is an ideal) is too large to run here.

## Source issues

- **Misprint** in mesablishvili2002 at Theorem 3.2 (iv), p. 183: the source says that if `S ⊗ M` is finitely generated projective then `M` is finitely generated; it should conclude that `M` is finitely generated projective, as the proof on p. 185 and Remark 3.3 do; affects nothing.
- **Misprint** in kollar2012 at Theorem 51, p. 22: the source cites Raicu's toric theorem as Theorem 4.2; in Raicu 2010 (arXiv:0905.4805v2) it is Theorem 4.1; affects nothing.
