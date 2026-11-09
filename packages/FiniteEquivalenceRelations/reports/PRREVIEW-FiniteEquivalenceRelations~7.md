# Review of FiniteEquivalenceRelations (pull request #1929 at d6cebfb)

**Verdict:** needs changes

There are two findings, both P3 and neither blocking. Both come from fitting the new square-zero target of 3.2 into the rest of the README. All six findings of the previous review are repaired; the quoted passages are under Verified sound. The mathematics of the new target, the R* Check of 4.3 and every Layer 3 value were recomputed independently and are correct.

## R01 (P3) — One *Needs:* line serves both targets of 3.2

**Location.** `TauCetiRoadmap/FiniteEquivalenceRelations/README.md`:

- line 483: the paragraph of `not_isEffectiveEquivalenceRelation_raicuArtin` ends “ranks do not change under field extension from the prime field.” and has no *Needs:* line;
- lines 498–499: the paragraph of `eq_differenceIdeal_of_sq_eq_bot` ends “*Needs:* 0.1, 0.2, 1.1, 1.3, 3.1, Mathlib `Ideal.Quotient`, `MvPolynomial`, `Module.finrank`.”

**Claim.** One line now lists what both targets need. The non-effectivity target has lost its own *Needs:* line.

**Witness.** `eq_differenceIdeal_of_sq_eq_bot` (`Suggested.lean` line 267) mentions only `IsEquivIdeal` and `differenceIdeal`. Its route (README lines 489–498) uses the three fields of 0.1 and the invariants of 1.1. It never uses Raicu's ideal (3.1), restriction (0.2), `MvPolynomial` or `finrank`.

**Repair.**

- After line 483, restore the line the raicuArtin target had: “*Needs:* 0.2, 1.3, 3.1, Mathlib `Ideal.Quotient`, `MvPolynomial`, `Module.finrank`.”
- Replace lines 498–499 with “*Needs:* 0.1, 1.1; 1.3 to read the conclusion as effectivity.”

Tested on `𝔽₂[x, y]/m²`. Every step of the route (`I ⊆ I₁ ⊗ A + A ⊗ I₁`, `T ⊆ I`, `t_a ∈ T`, then `J ⊇ I`) uses only `le_ker_mul`, `map_comm`, `map_incl₁₃_le`, `invariants` and `differenceIdeal`. A brute-force enumeration with only those notions finds the 5 equivalence ideals the target predicts.

## R02 (P3) — The overview prose does not mention the square-zero target and calls 3.2 a finite computation

**Location.**

- README lines 205–212, How to read the build: “Layer 3 gives the examples: Raicu's non-effective relation on `𝔸²`, its restriction to a finite local scheme, … and Raicu's toric theorem. … 3.2 and 3.3 are finite computations.”
- The Summary (lines 3–26) and Owned here (lines 33–40) do not name the target.
- `Suggested.lean` lines 34–37 list it as a headline theorem of 3.2.

**Claim.** 3.2 consists of a finite computation, and Layer 3 consists of examples only.

**Witness.** `eq_differenceIdeal_of_sq_eq_bot` holds for every `A = k ⊕ V` with `V² = 0`, in any dimension: its Lean signature has no `FiniteDimensional`. It is proved by a structural argument (README lines 489–498), not by computation. It is also the input that the Research context sentence (lines 792–794) relies on.

**Repair.**

- In How to read the build, add “and every equivalence relation on a square-zero extension `k ⊕ V` is given by its invariants (3.2)” to the Layer 3 sentence.
- In the same paragraph, replace “3.2 and 3.3 are finite computations” with “the non-effectivity of 3.2 and the obstruction of 3.3 are finite computations”.
- Add the same clause after “the non-effective relation on a finite local scheme of Layer 3” in Owned here, and to the Summary's list of end theorems.

## Verified sound

**Repairs of the previous review (74076b8 → d6cebfb).**

- **R01 repaired.** 4.3, third Check, lines 697–711: “the relation `x ~ -x` on `𝔸²_k` is Kollár's `R*`, with ideal `I* = (x₁² - y₁², x₂² - y₂², x₁x₂ - y₁y₂)` (Kollár 2012, Example 3)”. The union of the graphs is now named as a non-example. The Check adds that `R*` is effective with non-flat projections (FGA I, §A, n° 2, b; Tag 08XD). Example 3 is in the Kollár reference (line 828).
- **R02 repaired.**
  - Line 766: “No roadmap on main or in an open pull request consumes this one.”
  - Lines 43–45: “4.2 extends faithfully flat descent of modules … to pure ring maps; neither consumes 4.2.”
  - This agrees with AlgebraicModuliForArithmeticGeometry at its open head e5f9c4c. Its line 10383 lists this roadmap as a consumer of its §§3.2–3.3 and calls §3.1 the faithfully flat case.
- **R03 repaired.**
  - Owned elsewhere, lines 76–80: “PerfectoidSpacesPartII §5.1 owns pure ring maps (`IsPureHom`) …”.
  - Lines 41–43 are reworded.
  - §5.1 is cited in 4.2 (line 625), 4.3 (line 681), 4.3 Check 3 (line 706) and the Layer 4 Examples (line 753).
- **R04 repaired.**
  - The target `eq_differenceIdeal_of_sq_eq_bot` is at README lines 485–499 and Lean lines 267–270.
  - The length ≤ 2 classification is a Check (lines 519–523).
  - The search is “An unpublished exhaustive search” in Research context (lines 794–799).
  - The residue-field hypothesis is at lines 792–793.
  - The merged *Needs:* line is the new R01.
- **R05 repaired.** Lines 108–110: “when `k` is a field and `A ≠ 0` (then `k → A` is faithfully flat); over `k = ℤ`, `A = 𝔽₂`, … `I = ⊥` is the diagonal.”
- **R06 repaired.** Lines 633–635 and 781–783: “asserted by Olivier, extractable from the work of Joyal and Tierney, with a first free-standing proof by Mesablishvili 2000 (Stacks, Section 35.4, Tag 08WE)”. This matches stacks-descent lines 427–431.

**Gate, build and order.**

- I reran `gate … --base origin/main`: every count is 0 and the result is `OK`.
- Dependency check with the brief's command: `depcheck: 236 roadmaps, 2262 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. This roadmap is line 401 of the merge order. Its roadmap suppliers sit earlier: AlgebraicModuliForArithmeticGeometry at 34, PerfectoidSpacesPartII at 79, DirectSummandsAndBigCohenMacaulay at 218. ModularCurves and SchemeAndStackFoundations are on main.
- `lake env lean` on `Suggested.lean`: exit 0, with exactly 22 warnings, all “declaration uses `sorry`”.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FiniteEquivalenceRelations'` is empty. The folder holds README.md, Suggested.lean and metadata.toml.
- Pins: Mathlib 1b1ccf4b, Tau Ceti 2fd255d9. Imports are `Mathlib` and `TauCeti.RingTheory.Invariant.EquivalenceRelation.Basic`.
- There is no `set_option`, sorried data, `lemma`, `#eval` or process word. The only “Current” is the book title at line 827.

**Signatures.**

- I elaborated `#check @…` for all 46 declarations in one scratch file and compared each with the README.
- `eq_differenceIdeal_of_sq_eq_bot` elaborates as `∀ k [Field k] A [CommRing A] [Algebra k A] (V : Ideal A), V ^ 2 = ⊥ → (∀ a, ∃ c, a - algebraMap k A c ∈ V) → ∀ {I}, IsEquivIdeal k A I → I = differenceIdeal k A I`. That is the README's generality: any field, any dimension, decomposition `A = k ⊕ V`.
- No declaration lost a section binder.

**Padding probe.** On a scratch copy I replaced every `sorry` by `first | rfl | infer_instance | trivial | decide | simp | (constructor <;> simp) | exact fun _ => rfl` and elaborated it. All 22 sorried theorems fail, with 22 errors, one at each former `sorry`. `specFst_comp_specQuotientMap` is proved in place; `isColimit_cofork` needs it to state its cofork.

**Headline theorems.** All of these are stated at the README's generality: 0.2; 0.3 (two); 1.2; 1.3 (two); 2.1; 3.1 (three); 3.2 (two); 3.3; 3.4; 4.1 (two); 4.2 (three); 4.3 (two); 4.4. Nothing statable is missing, and nothing is forced through a stand-in.

**Sources** (seeded sample 0.1–4.4, each read at its locator).

- **kollar2012:**
  - lines 76–88: Example 3. The union ideal is not transitive, `R*` is an equivalence relation, and the two differ by an embedded point;
  - lines 89–113: Definition 4;
  - lines 134–136: Theorem 6;
  - lines 127–131 and 141–148: §2 and Question 8;
  - lines 158–178: Example 9;
  - lines 1108–1122: ¶50 (1)–(4) and “effective iff equality”;
  - lines 1149–1172: the example and its universality over ℤ;
  - lines 1176–1183: Theorem 51.
- **raicu2010:**
  - lines 29–37: effective, the toric Definition, Theorem 4.1;
  - lines 76–83: §2.1 i)–iv);
  - lines 91–94: Example 2.1;
  - lines 128–129: affine monoid = finitely generated, cancellative, torsion-free, which is the Lean `[IsAddFG σ] [IsCancelAdd σ] [IsAddTorsionFree σ]`;
  - lines 170–172: Theorem 3.1;
  - lines 237–251: Theorem 4.1 and `M`-homogeneity.
- **stacks-groupoids:**
  - line 68: Definition 39.3.1, Tag 022P;
  - lines 2053–2057: Section 39.23, Tag 03BE, equation 23.0.1;
  - lines 2132–2134: Lemma 39.23.4, Tag 03BJ;
  - lines 2420–2429: Proposition 39.23.9, Tag 03BM.
- **fga3:**
  - lines 150–153, p. 212-04: finite colimits of finite preschemes are colimits in all preschemes;
  - lines 156–164, p. 212-05: the question, open even over a field;
  - lines 409–427, pp. 212-12–13: Théorème 5.1 (iv).
- **sga3-exp5:** lines 509–528, Théorème 4.1 (i)–(iv).
- **Outside the five-source sample, in the operator's cache:**
  - stacks-descent: lines 177 (023G); 420–431 (08WE, the history); 486–495 (08WL, 08WM, 08WN, 08WP); 568–571 (08WY); 622 (08X7); 674–689 (08XA); 703–711 (08XD, flatness descends along universally injective maps); 1815–1822 (0EUA);
  - Stacks book: lines 29791–29795 (058L) and 33289–33290 (00OF);
  - FGA I: lines 212–229 (§A n° 2 b, the finite strict-epimorphism criterion in all preschemes, used by 4.3 Check 3); 237–258 (n° 2 c); 536–539 (§B Théorème 1); 568 (Lemme 1.1);
  - mesablishvili2000: lines 5, 10–13, 33–39 (pp. 38–39), 104–111 (Propositions 2 and 3, p. 40) and 221–222 (Theorem 4, p. 41);
  - mesablishvili2002: lines 42–43 (Theorem 1.1) and 133–143 (Theorem 3.2);
  - SGA 1 (math/0206203v2): line 6194.

**Library at the pins.**

- Mathlib:
  - `CategoryTheory/EquivalenceRelation.lean`: line 106 (`IsKernelPair.equivalenceRelation`); lines 258–270 (`EffectiveEquivalenceRelation` with `isKernelPair` and `isPushout`);
  - `RingTheory/TensorProduct/IncludeLeftSubRight.lean`: lines 89, 96, 106, 146, 176;
  - `Algebra/Category/ModuleCat/Descent.lean:62`;
  - `ChangeOfRings.lean:878`;
  - `Monad/Adjunction.lean:283`;
  - `RingHom/FaithfullyFlat.lean:29`;
  - `Flat/EquationalCriterion.lean:287`;
  - `FiniteDimensional/Basic.lean:258`;
  - `MorphismProperty/Limits.lean:841`;
  - `EffectiveEpi/Basic.lean:72`;
  - `TensorProduct/Maps.lean:763` (`lmul'`);
  - `Bialgebra/Basic.lean:127`.
  - There is no module-purity predicate in `RingTheory`, `LinearAlgebra`, `Algebra/Module` or `Algebra/Category`.
- Tau Ceti:
  - `RingTheory/Invariant/EquivalenceRelation/Basic.lean:110, 180`;
  - `…/Quotient.lean`: lines 83 (`[Module.Finite A B] [Module.Projective A B]`), 148, 158, 166, 190, 201;
  - `AlgebraicGeometry/Quotient/EquivalenceRelation.lean`: lines 79–87 and 135 (same hypotheses), 220 (`isSpecEquivRel_appTop`), 240–241 (section hypotheses as the contract states), 279, 284, 289, 294, 306;
  - `RingTheory/Flat/EffectiveDescent.lean:107`.

**Cross-roadmap citations resolved.**

- ModularCurves on main: Layer 0C, item 3 (README lines 779 and 799–803) is SGA 3 V 4.1 in the affine case, with exactly the conclusions the contract states.
- SchemeAndStackFoundations on main: §1.1 (line 2071, `qcoh_fpqc_descent`), §1.5 (line 2167, `IsEquivRel`) and §1.17 (lines 2624–2632).
- AlgebraicModuliForArithmeticGeometry at its open head e5f9c4c: §3.1 `affineModuleDescentEquivalence` (line 1209), §3.2 `overlapCoalgebraEquivalence` (line 1420), §3.3 `moduleCanonicalComparison` (line 1562) and `descentEqualizerModuleCoordinates` (line 1570).
- PerfectoidSpacesPartII, the board package at merge-order line 79: §5.1 (README lines 1913–1965) states faithfully flat ⇔ pure and flat, and pure ⇔ `R`-linear retraction for `S` finitely presented as a module. `IsPureHom` is at its `Suggested.lean:333`.
  - The resolver's lead (“found nowhere”) is a false positive. The roadmap is not on main or in an open pull request, but it is a board package listed in the merge order.
- DirectSummandsAndBigCohenMacaulay at 17190d1: §0.1 (lines 147–170).
- The other resolver leads, `IsEquivIdeal.le_ker_mul`, `.map_incl₁₃_le` and `.map_quotient`, are declared at `Suggested.lean` lines 85, 89 and 111.

**Ownership by object.** I searched main, the 458 open heads (`roadmaps grep`) and the board's package READMEs for Raicu, `IsEquivIdeal`, `differenceIdeal`, “finite equivalence relation”, Joyal–Tierney, Mesablishvili, “effective descent morphism for modules” and Question 8. No other roadmap owns these objects. Only AlgebraicModuliForArithmeticGeometry mentions this roadmap, and it agrees with this README's Downstream consumers. `overlaps.md` lists nothing, and no other pull request changes this folder.

**Independent recomputations** (my own graded elimination, in pure Python over `𝔽_p`):

- **3.1, Raicu on `𝔸²`, over `𝔽₂`, `𝔽₃` and `𝔽₃₂₀₀₃`.**
  - `dim I_d = 0, 2, 9, 23, 44` and `dim J(B)_d = 0, 2, 9, 23, 43` for `d = 1..5`.
  - The invariant forms have dimensions `0, 2, 1, 3, 2`.
- **3.2, `Z = V(f₁², f₂², f₃²)`, over `𝔽₂, 𝔽₃, 𝔽₅, 𝔽₇, 𝔽₁₃, 𝔽₄₁, 𝔽₆₁, 𝔽₃₂₀₀₃`.**
  - Hilbert function: `1, 2, 3, 4, 3, 2` (length 15), and `1, 2, 3, 4, 3, 2, 1` (length 16) over `𝔽₂`.
  - `dim (I+K)_d = 0, 2, 9, 25, 52` against `dim (J+K)_d = 0, 2, 9, 25, 51` for `d = 1..5`. They are equal in degree 6.
  - The invariants of `O(Z)` have dimensions `0, 2, 1, 1, 2` (lifts `0, 2, 1, 3, 6`).
- **3.2 Check 2, over `𝔽₃`, comparing up to twice the top degree.**
  - Lengths are `4, 6, 6, 4, 10, 8, 8` for `(1,1,1), (2,1,1), (1,2,1), (1,1,2), (2,2,1), (2,1,2), (1,2,2)`, with no gap.
  - `(3,3,2)` has length 27 (Hilbert function `1, 2, 3, 4, 5, 6, 4, 2`) and gaps `44 > 43` (degree 5) and `77 > 75` (degree 6).
- **New 3.2 Check (square zero).** I enumerated every subspace of `ker μ` and tested the three fields of 0.1 and `I = J(A^R)`:

| Algebra | Field | Subspaces of `ker μ` | Equivalence ideals | Effective |
|---|---|---|---|---|
| `k[x, y]/m²` | `𝔽₂` | 2825 | 5 | 5 |
| `k[x, y]/m²` | `𝔽₃` | 56632 | 6 | 6 |
| `k[ε]` | `𝔽₂`, `𝔽₃` | 5, 6 | 2, 2 | all |
| `k[x]/(x³)` | `𝔽₂` | 2825 | 3 | 3 |

**Adversarial table.**

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `IsEquivIdeal` (0.1) | `ker μ`; `⊥`; `⊤`, `A ≠ 0` | `ker μ` and `⊥` satisfy all three fields; `⊤`: `1 ∉ ker μ`, so not reflexive | Checks hold |
| 0.1 Check 2 | `k[t]/(t²)`, char ≠ 2 | `(x−y) ∩ (x+y) = span{xy}` in the 4-dimensional `k[x,y]/(x²,y²)`; `μ(xy) = t² = 0`; `xz ∉ span{xy, yz}` | holds |
| 0.1 Check 3 | `k × k` | the composites of `(p,p), (q,q), (p,q)` stay in `R`; `(q,p) ∉ R` | holds |
| `map_quotient` (0.2) | `𝔞 = ⊤`; `𝔞 = (t)`, `I = ⊥`; `(x²−y²)`, `𝔞 = (t−1)` | `μ' ∘ (π⊗π) = π ∘ μ`; images `⊥` and `0` | true for every `k` |
| `isEquivalenceRelation_iff`, `isEquivIdeal_iff_isSpecEquivRel` (0.3) | `T = A`; `T = (A⊗A)/I`; the ring `A⊗A⊗A/(I₁₂+I₂₃)` of `R ×_X R`, for every `k` | `(A⊗A/I) ⊗_A (A⊗A/I) = A⊗A⊗A/(I₁₂+I₂₃)` by right exactness; `X ×_k X → X ×_ℤ X` is a base change of a diagonal, hence mono | true |
| `invariants`, `differenceIdeal` (1.1) | `ker μ`; `⊥` over a field | `A^R = A`, `J = ker μ`; `A^R = k`, `J = ⊥` | Checks hold |
| `isColimit_cofork` (1.2) | `I = ⊤`; `k × k`, `⊥`; `k[t]/(t²)`, `ker μ` | `A^R = A`; `k`; `A`. The fibres of `X → Spec A^R` are the classes generated by `R`, since the idempotents of `A^R` are the `R`-saturated clopens, so each class lies over an affine open of `T` | true |
| `…_iff`, `…_iff_finrank` (1.3) | `A = 0`; `I = ⊤`, `A ≠ 0`; `k[t]/(t⁴)`, `(x²−y²)` | both sides hold for `A = 0`; both fail for `I = ⊤` (`J(A) = ker μ ≠ ⊤`); `I = J(k[t²]) ⊆ J(A^R) ⊆ I` | true |
| 1.3 Example | `C = k[x³, x⁵]` | `(u⁴+u³v+uv³+v⁴)(u³−v³) − uv(u⁵−v⁵) = u⁷ − v⁷`; `7 ∉ ⟨3, 5⟩` | holds |
| `…_of_flat` (2.1) | `k × k`, `⊥`; `ker μ`; relation of 3.2 | rank 2, `A^R = k`; rank 1; 3.2 is not flat by contraposition; `B` finite + f.p. + flat ⇒ projective, which meets Tau Ceti's `[Module.Finite] [Module.Projective]` | true |
| `raicuIdeal_*` (3.1) | symmetry, finiteness, non-effectivity, over `𝔽₂, 𝔽₃, 𝔽₃₂₀₀₃` | swap of the cocycle ≡ −cocycle mod `(x₁y₂−x₂y₁)(x₂³−y₂³)`; `y₁² ≡ x₁²`, `y₂³ ≡ x₂³`; `44 > 43` in degree 5 | true |
| `not_isEffective…raicuArtin` (3.2) | 8 prime fields | `52 > 51` in degree 5 for each; lengths 16 / 15; `det [[-2,1,0],[1,-2,1],[0,1,-2]] = −4` | true |
| `eq_differenceIdeal_of_sq_eq_bot` (3.2, new) | `A = 0` (`V = ⊤`); `k[ε]`; `k[x,y]/m²` over `𝔽₂`, `𝔽₃`; infinite-dimensional `V` | trivial for `A = 0`; 2, 5, 6 ideals, all equal to `J(k ⊕ I₁)`; the route never uses finiteness: `z(1⊗b) = a⊗b`, `z(b⊗1) = −b⊗a`, and the `V⊗k⊗V` component of `incl₁₃ z_a − incl₁₂ z_a − incl₂₃ z_a` is `t_a` | true; *Needs:* in R01; prose in R02 |
| 3.2 Check, `I₁ := I ∩ (V⊗1)` | any `I` | `a⊗1 ∈ ker μ` forces `a = 0` | holds |
| 3.2 Check, length ≤ 2 | `k`, `k×k`, `k[ε]`, separable and inseparable `L` | symmetric ideals in `ker μ` of `k⁴`: `0`, `ker μ`; `ker μ ⊆ L⊗L` is 1-dimensional over `L` | holds |
| `raicuCocycle_not_mem_…` (3.3) | `𝔽₃` | `∑ hᵢh₅₋ᵢ = 2+6+12+12+6+2 = 40`; no gap below degree 5 | true |
| `IsToric`, `eq_differenceIdeal_of_isToric` (3.4) | `σ = ℕ`, `(x²−y²)`, `(x−y)`; Raicu's `I`, `σ = ℕ²` | homogeneous of degree 2, equal to `J(k[t²])`; `x−y ↦ (x−y)⊗χ¹`; `x₁x₂ − y₁y₂ ∉ span{g₁, g₂}`, so not toric | true |
| `bijOn_baseChange`, `…_iff_bijOn` (4.1) | `ℤ → ℚ`, `N = ℤ`, `ℤ/2`; `B = A × A` | equalizer `ℚ ≠ ℤ`; `ℚ⊗ℤ/2 = 0`; cofaces `(u,u,v,v)`, `(u,v,u,v)`; `pullRight g((1⊗1)⊗1) = coface₂ g(1⊗1)` | true |
| `forall_isAmitsurEqualizer_iff` (4.2) | cokernel `Q` of `P → B⊗P` | `(b₁⊗b₂)⊗p ↦ b₂⊗[b₁⊗p]` sends `coface₁ x − coface₂ x` to `1⊗[x]` | true |
| `full_faithful_…`, `nonempty_comonadic…_iff` (4.2) | Tag 08XA; `ℤ → ℚ`; `ℤ → ℤ × ℤ/2` | `0 = id` on `ℤ/2` after base change; split by a ring map, not flat | true |
| `isEffective_invariants` (4.3) | every `k`, every `I` | `A⊗_{A^R}A = A⊗A/J`, `J ≤ I`, so `a⊗1 = 1⊗a` there puts `a⊗1 − 1⊗a` in `I` | true |
| 4.3 Check 2 | `C = k[x,y]/(xy) → k[s] × k[t]` | `k[s]⊗_C k[t] = C/(x,y) = k`; equalizer `{f(0) = g(0)} = C`; `C/(x+y) = k[x]/(x²) → k × k`, `x ↦ 0` | holds |
| 4.3 Check 3 (`R*`) | char ≠ 2 | `x₁y₂ − x₂y₁ = −x₁(x₂−y₂) + x₂(x₁−y₁) = x₁(x₂+y₂) − x₂(x₁+y₁)`; `(I₁₂+I₂₃)₂` has no `x·z` monomial; `I* ⊆ (x+y)` gives `A^{R*} ⊆` even polynomials `= C`; Reynolds retraction; Tag 00OF on the localisation at 0; Tag 08XD for the projections | holds |
| `nonempty_comonadic…_invariants` (4.3) | 2.1's hypotheses | Tau Ceti `faithfullyFlat` on `eqLocus` + `faithfullyFlat_algebraMap_iff` + `comonadicExtendScalars` | true |
| `universally_effectiveEpi_iff` (4.4) | Tag 0EUA, one member; `ℤ → ℚ`; the node | a mono that is not an iso; base change `k[x]/(x²) → k × k` not injective | true |
| Conventions witnesses | `I = ⊥` with `k = ℤ`, `A = 𝔽₂`; `B = A × A`; `incl` witness for `k[t]` | `𝔽₂⊗_ℤ𝔽₂ = 𝔽₂`; `(u,u,v,v)`, `(u,v,u,v)`; `incl₁₂ + incl₂₃ = t⊗1⊗1 − 1⊗1⊗t` | hold |
| Research context, smallest length | lengths 3–4 over a finite field | the listed algebras are all local algebras of those lengths: Hilbert functions `(1,1,1)`, `(1,2)`, `(1,1,1,1)`, `(1,2,1)` with `m³ = 0` hence `W + m³`, `(1,3)`, and residue degrees 2, 3, 4 (with a coefficient field) | complete list |

## Not verifiable

- Olivier 1970, Joyal–Tierney 1984, Mesablishvili 2004a and 2004b, Venken 1971 and Philippe 1973 are paywalled or not online. They are cited only in Research context or for history, and no statement or route rests on them.
- Kollár's Theorem 51 (kollar2012 line 1180) cites Raicu's toric theorem as Theorem 4.2 of the 2009 preprint. The arXiv v2 I read (dated 2018) numbers it 4.1 (raicu2010 lines 36, 237). I did not read v1, so it is undetermined whether this is a misprint or a renumbering. The README cites the v2 numbering and says so.
- The unpublished lengths 3–4 search of Research context was recomputed only on `k[x]/(x³)`, `k[ε]` and `k[x, y]/m²`. The other algebras of the list were not recomputed. `k[x, y, z]/m²` is covered by the square-zero target, whose proof I checked.

## Source issues

- **Misprint** in mesablishvili2002 at Theorem 3.2 (iv), p. 183: the source says that if `S ⊗ M` is finitely generated projective then `M` is finitely generated; it should conclude finitely generated projective, as Remark 3.3 and the proof on p. 185 do; affects nothing.
